Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29AB644874
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 16:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB89110E0F1;
	Tue,  6 Dec 2022 15:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00B710E0F1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=9g/vMicaWjtp7Gg/l1CD9g7BZ2YX3Dt2YkIwYev2GiU=; b=QxwMO9v89QMsBJ6oEXYsvGKDsE
 KCbr2HPb0TQ6bSJBTdLEwRgNr/iPkxMGZ/6VWVky9+mlbQfR7at+Vd5IAHTlS9ME2xu36X4Rlo/dC
 gMTZS6MNRjQRmMCFglGexfNQjfJQsH7PbpdMpls2t5cArWBMTuQhFpzoczLWmj4olYlpMdHke3e3x
 zR1y0809pJ1Y1IfKuDW46HTyVSzm7Y2ry46IV2ca8SUUn7MwmqAZ+q4UB2HNmxFf1b0ghB4wWDsUt
 mA/IhbPn+PHb85vxejUxETj18eV/OvsK1YWmRlC9xYKqA4aEy47LpiZXObbAM2izwlvCXokgpWp5v
 VTrKV+nw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=58854)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p2aK6-0000wB-2p; Tue, 06 Dec 2022 16:57:34 +0100
Message-ID: <92cce695-13bb-5ddc-dc85-3e3c86bb4278@tronnes.org>
Date: Tue, 6 Dec 2022 16:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 30.11.2022 20.26, skrev Noralf Trønnes via B4 Submission Endpoint:
> Hi,
> 
> I have started to look at igt for testing and want to use CRC tests. To
> implement support for this I need to move away from the simple kms
> helper.
> 
> When looking around for examples I came across Thomas' nice shadow
> helper and thought, yes this is perfect for drm/gud. So I'll switch to
> that before I move away from the simple kms helper.
> 
> The async framebuffer flushing code path now uses a shadow buffer and
> doesn't touch the framebuffer when it shouldn't. I have also taken the
> opportunity to inline the synchronous flush code path and make this the
> default flushing stategy.
> 
> Noralf.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> 
> ---
> Changes in v2:
> - Drop patch (Thomas):
>   drm/gem: shadow_fb_access: Prepare imported buffers for CPU access
> - Use src as variable name for iosys_map (Thomas)
> - Prepare imported buffer for CPU access in the driver (Thomas)
> - New patch: make sync flushing the default (Thomas)
> - Link to v1: https://lore.kernel.org/r/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org
> 
> ---
> Noralf Trønnes (6):
>       drm/gud: Fix UBSAN warning
>       drm/gud: Don't retry a failed framebuffer flush
>       drm/gud: Split up gud_flush_work()
>       drm/gud: Prepare buffer for CPU access in gud_flush_work()
>       drm/gud: Use the shadow plane helper
>       drm/gud: Enable synchronous flushing by default
> 

Applied to drm-misc-next, thanks for reviewing!

Noralf.
