Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FB9BBF0D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 21:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AC610E0EC;
	Mon,  4 Nov 2024 20:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Cex94fSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3158A10E0E3;
 Mon,  4 Nov 2024 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lKRMqSRXhZhQYwWjC1ENLPJFMwrROYi/BPiNAXWtjBg=; b=Cex94fSHmswdP5+z/xU0dsFgb1
 NB4yHtqdKIXC9Rz6SCbdUDkCp8tezJMrDoZhb1MJfyp1ZLFNXSatLUYACSDfdJO1yZY/zIuwUfYUc
 XzZfY03sus86hu+INRn07YuoBr1HYtpmo026qfq8LHTdJKyXMhKQHTja84IzRrKchCeaoSYwqjx1S
 xhEDDrkt/ewa5hN/5eG+xJqsynrs3Kj4HvdF09NQ9qJiTOXRfI2A1oZM85zFYLTRQWIcbcpA35BtS
 8L2xvnF1gp31cZ1nrT6LIf1g4mxj88COZlHmdhlFYCPY4Igve6eB9aA4bT7AiJ2iEasxB+n5xGqwH
 s8Tt+ikg==;
Received: from [177.172.124.78] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t844C-001pbo-TO; Mon, 04 Nov 2024 21:52:53 +0100
Message-ID: <00a99b3e-3fad-42fb-8dc8-4f45d158c4c1@igalia.com>
Date: Mon, 4 Nov 2024 17:52:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 1/2] drm/atomic: Let drivers decide which planes
 to async flip
To: Christopher Snowhill <chris@kode54.net>
Cc: kernel-dev@igalia.com, Simon Ser <contact@emersion.fr>,
 Thomas Zimmermann <tzimmermann@suse.de>, joshua@froggi.es,
 ville.syrjala@linux.intel.com, Daniel Stone <daniel@fooishbar.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, Harry Wentland <harry.wentland@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org
References: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
 <20241101-tonyk-async_flip-v9-1-681814efbfbe@igalia.com>
 <D5CC3U00B7CG.IGKCIES8PC2J@kode54.net>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <D5CC3U00B7CG.IGKCIES8PC2J@kode54.net>
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

Hi Christopher,

Em 03/11/2024 03:36, Christopher Snowhill escreveu:
> On Fri Nov 1, 2024 at 11:23 AM PDT, André Almeida wrote:
>> Currently, DRM atomic uAPI allows only primary planes to be flipped
>> asynchronously. However, each driver might be able to perform async
>> flips in other different plane types. To enable drivers to set their own
>> restrictions on which type of plane they can or cannot flip, use the
>> existing atomic_async_check() from struct drm_plane_helper_funcs to
>> enhance this flexibility, thus allowing different plane types to be able
>> to do async flips as well.
>>
>> In order to prevent regressions and such, we keep the current policy: we
>> skip the driver check for the primary plane, because it is always
>> allowed to do async flips on it.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Should I do a R-b too? 

If you can review the code, it's always really appreciated.

> The changes looked sound enough for me to feel
> like testing it as well. Tested Borderlands Game of the Year Enhanced on
> my RX 7700 XT at maximum settings at 1080p165, and the tearing support in
> labwc allowed it to reach over 700fps. No problems from the hardware
> cursor.

Thanks for testing and reporting!

> 
> Tested-by: Christopher Snowhill <chris@kode54.net>
> 
