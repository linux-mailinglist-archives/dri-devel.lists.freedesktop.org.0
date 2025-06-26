Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A97AEA1C6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 17:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641E610E8D1;
	Thu, 26 Jun 2025 15:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ltGfW6AV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB5C10E8D1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f5DlpX2huMTLf4bsOPml/8rj3dKo7+jspuRt9BtAGXg=; b=ltGfW6AV9dczegMNqj5U4DixS/
 s/6eN/vh/A38dEvSYJ4tcZS+aXcbzTWdsxkz9jL5N9G5akCrOVn7aqIJVF5QgSruAnI32KrnD8wZk
 580DShYV0S/dbwNIild2rS7Q6HFp8YvthqfKeybOAQR+BMF4M8WeUv4ofL10jVk6c2+gmI1AYV8RC
 Kn92AiR2qxwEEvti3DJ6ZQUYlZYvJ21W9IReIXIl9e4G+hNT8Hz048xZDtaDQ330CpzzQeGQNMCvD
 eakZr/mNWtOAfjJjpI/lX9t6R72uIMh0ISRfj4egQEfFpyPiu/STYKRA14aAHIICUDRBXm47rfUfQ
 tTazxPcQ==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uUo7R-0091W2-U4; Thu, 26 Jun 2025 17:02:30 +0200
Message-ID: <5baab2ed-c48d-41ae-819a-71ca195c4407@igalia.com>
Date: Thu, 26 Jun 2025 12:02:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
To: Pranav Tyagi <pranav.tyagi03@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 arthurgrillo@riseup.net, mairacanal@riseup.net, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org,
 gregkh@linuxfoundation.org, sashal@kernel.org
References: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pranav,

On 26/06/25 11:22, Pranav Tyagi wrote:
> From: Maíra Canal <mcanal@igalia.com>
> 
> [ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]
> 
> Currently, it is possible for the composer to be set as enabled and then
> as disabled without a proper call for the vkms_vblank_simulate(). This
> is problematic, because the driver would skip one CRC output, causing CRC
> tests to fail. Therefore, we need to make sure that, for each time the
> composer is set as enabled, a composer job is added to the queue.
> 
> In order to provide this guarantee, add a mutex that will lock before
> the composer is set as enabled and will unlock only after the composer
> job is added to the queue. This way, we can have a guarantee that the
> driver won't skip a CRC entry.
> 
> This race-condition is affecting the IGT test "writeback-check-output",
> making the test fail and also, leaking writeback framebuffers, as the
> writeback job is queued, but it is not signaled. This patch avoids both
> problems.
> 
> [v2]:
>      * Create a new mutex and keep the spinlock across the atomic commit in
>        order to avoid interrupts that could result in deadlocks.
> 
> [ Backport to 5.15: context cleanly applied with no semantic changes.
> Build-tested. ]
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230523123207.173976-1-mcanal@igalia.com
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>

This patch violates locking rules and it was reversed a while ago.
Please, check commit 7908632f2927 ("Revert "drm/vkms: Fix race-condition
between the hrtimer and the atomic commit"").

Best Regards,
- Maíra
