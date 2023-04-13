Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6366E075A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E378B10EA3A;
	Thu, 13 Apr 2023 07:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3E10EA3A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681369710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JboGrBX3f0DwI3qI1gXPHFBUEEqE8FooJIY+dnV8VBU=;
 b=C1DD8qh3exSh5dMWXLo6DLjxSU1jXLyi0812BGQDb66DiLvZbY9uEejoCbIw7HK8ciySBW
 jAru4sVurq7UT2Hc8+2qmnXAxvfhFyDsX2wwfT6RK3hV0WZy1octCFFhwpNC0rZKJUJzhD
 dJyG0EGxwAhUX+nVaVf6mfkU14ACGi0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-kfykESW2O6uprws2aDo0Ow-1; Thu, 13 Apr 2023 03:08:28 -0400
X-MC-Unique: kfykESW2O6uprws2aDo0Ow-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a05600c19ce00b003f0331154b1so16623450wmq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681369707; x=1683961707;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JboGrBX3f0DwI3qI1gXPHFBUEEqE8FooJIY+dnV8VBU=;
 b=chAGGSNJA/QrcFmTlJdCfhRi7BDHUSvNRL+LKrF/DMPrW0E9CVx5E0HnRmXdzx6wRd
 IPVnCN8uarE6/maZSz3fn0R757MRloPALHYCxHdX653aHjVedsvu9TPa7PhFdZB/s1N5
 BXckv4YjNBt0Cga+laE2a8YEljgFbL+QZobRCF6/EUm/6Yy98AhP85Gbxo/d8f8y8Cji
 Vzk/VSe7Fhcwu/5rcR9UnKCBSlZtm6m9+U5TgGD+88HukQhvh8c7zQIglomWRCcQV+vc
 sJf5ZRzkLLYS5ysTcbvk7HdH6C/wttwl18VZrgfMApWUB05Hq8aTtHKu0h6/1oTBHRvw
 fK9A==
X-Gm-Message-State: AAQBX9dgOxhjiQG2HrB0/BIh2hFcVmY4y+wLH5B/4aix3NVlulUpRF0h
 z4sUK32Kf1AZ/Ppf4EEuFXjumDt+Fy/vf9vBG0UfaGpz07c2xN833l+GXykCim2mcQfaHMyRkS9
 3Eb6m7mykGbVHdFzZ0vZLbY7aNEWM
X-Received: by 2002:a05:600c:22c7:b0:3f0:3ab2:a7e5 with SMTP id
 7-20020a05600c22c700b003f03ab2a7e5mr578685wmg.34.1681369707408; 
 Thu, 13 Apr 2023 00:08:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350b24F3nDTc3CpXlWOjLktSqOUfgzmTlSCyQm9BbUFxjNlRlmGoV/Mzmvs8W2U5fj6y8Fpvrnw==
X-Received: by 2002:a05:600c:22c7:b0:3f0:3ab2:a7e5 with SMTP id
 7-20020a05600c22c700b003f03ab2a7e5mr578661wmg.34.1681369707094; 
 Thu, 13 Apr 2023 00:08:27 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z13-20020a5d44cd000000b002e61e002943sm581838wrr.116.2023.04.13.00.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:08:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>, pa@panix.com
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <4PxhQn3zK1zcbc@panix1.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
Date: Thu, 13 Apr 2023 09:08:26 +0200
Message-ID: <87o7nsuumt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: jfalempe@redhat.com, pa@panix.com, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pa@panix.com (Pierre Asselin) writes:

> After careful reading of the comments in f35cd3fa7729, would this
> be an appropriate fix ?  Does it still address all the issues raised
> by Thomas ?
>
> (not tested)
>
> diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
> index 82c64cb9f531..9f5299d54732 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
> @@ -56,10 +56,11 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
>  	 * don't specify alpha channels.
>  	 */
>  	if (si->lfb_depth > 8) {
> -		bits_per_pixel = max(max3(si->red_size + si->red_pos,
> +		bits_per_pixel = max3(max3(si->red_size + si->red_pos,
>  					  si->green_size + si->green_pos,
>  					  si->blue_size + si->blue_pos),
> -				     si->rsvd_size + si->rsvd_pos);
> +				     si->rsvd_size + si->rsvd_pos,
> +				     si->lfb_depth);

I would defer to Thomas but personally I don't like it. Seems to me that
this is getting too complicated just to workaround buggy BIOS that are not
reporting consistent information about their firmware-provided framebuffer.

I would either trust the pixel channel information (what Thomas patch did)
+ my patch to calculate the stride (since we can't trust the line lenght
which is based on the reported depth) + a DMI table for broken machines.

But that will only work if your systems are the exception and not a common
issue, otherwise then Thomas' approach won't work if there are too many
buggy BIOS out there.

Another option is to do the opposite, not calculate a BPP using the pixel
and then use that value to calculate a new stride, but instead assume that
the lfb_linelength is correct and use that to calculate the BPP.

Something like the following patch, which should also fix your regression
and may be enough to address Thomas' concerns of inconsistent depths too?


From e70d4df257f8a84deea82f75270b14e069729679 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 13 Apr 2023 09:00:09 +0200
Subject: [PATCH v2] firmware/sysfb: Use reported line length to calculate the
 bits-per-pixel

The commit f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
fixed format selection, by calculating the bits-per-pixel instead of just
using the reported color depth.

But unfortunately it broke some systems due the calculated bits-per-pixel
not taking into account the filler bits, for pixel formats that contained
padding bits.

For example some firmware-provided framebuffers with pixel format xRGB24
where wrongly reported as RGB24, causing the VT output to have glitches.

This seems to be caused by the rsvd_size and rsvd_pos fields not being
set correctly in some cases. So a different calculation has to be made.

Since the lfb_depth field can't be trusted, use the lfb_linelength field
to calculate the bits-per-pixel. This is already set to the stride so it
is already deemed to be correctly set by the firmware.

Fixes: f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
Reported-by: Pierre Asselin <pa@panix.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Instead of calculating the stride from the bits-per-pixel, assume that
  it is correct and use it to calculate the bits-per-pixel.

 drivers/firmware/sysfb_simplefb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 82c64cb9f531..0ab8c542b1f5 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -55,14 +55,10 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 	 * ignore simplefb formats with alpha bits, as EFI and VESA
 	 * don't specify alpha channels.
 	 */
-	if (si->lfb_depth > 8) {
-		bits_per_pixel = max(max3(si->red_size + si->red_pos,
-					  si->green_size + si->green_pos,
-					  si->blue_size + si->blue_pos),
-				     si->rsvd_size + si->rsvd_pos);
-	} else {
+	if (si->lfb_depth > 8)
+		bits_per_pixel = si->lfb_linelength * 8 / si->lfb_width;
+	else
 		bits_per_pixel = si->lfb_depth;
-	}
 
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
 		const struct simplefb_format *f = &formats[i];

base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
-- 
2.40.0

