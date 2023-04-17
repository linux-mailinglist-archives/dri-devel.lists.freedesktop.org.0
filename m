Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091DD6E42FF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 10:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5382310E2B9;
	Mon, 17 Apr 2023 08:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9683A10E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681721900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OQahvJkJyfsl2iBHDg48gWYNrk5bRLMj3uUnlrcI4PM=;
 b=XSMnaIB11Kl804rWsOqpFpTW/Gy0cYcxpN/8Sygc7JXNu21bJMhu0xX897nUzlcXofsbMJ
 VfE5FDn0FejXQia1qKJi7BPaDpvC6CZylNN8vAZDUbP8jdQbURTIa++5+RnG2lqehNzrm1
 p/H7ddpYGTAS7NH1ZG9Q6iKDtxpM9HE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-s4i0l6a1OAaECbOu0Qngig-1; Mon, 17 Apr 2023 04:58:19 -0400
X-MC-Unique: s4i0l6a1OAaECbOu0Qngig-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2efbab2cbe8so337146f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 01:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681721898; x=1684313898;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OQahvJkJyfsl2iBHDg48gWYNrk5bRLMj3uUnlrcI4PM=;
 b=c0n5t+g0a56Nu76ZwXfNtmgUwVZPh5zKgmn4kkOVXKWOM8KMOJMYCCrclDIdUfl6a6
 lI6avXQO/60EHt+Ga1YvMuH6Cy7twWoj7V189R32wSVpHQPptGdV3snhUFLHLj+yVEQf
 2CtvcTYAI3+JBzjnrKFhc6s2kGxD6GdLNNjVvLPBAJBCwVtS9dyEZtmTIG4BSoBKh5Rk
 VX9jt6L1oqVRE3Viv5tNeQT2k5c1lbexcNTlAIEbVxn8g8ddFNEWV9i114KJFv007Isf
 3xRGnO7811zPW3A7OcIG/ut2ddrB3ytOpTz48vzhcliuGFQa0kQcnY3TqFOkQVgnqmJu
 ALBQ==
X-Gm-Message-State: AAQBX9dFN/jLpTdfCllyYKVkei809qlmSaI+jZCIPNotoHESe2d1b8u/
 qjaSjnigGsqyqZ58idbQAOm2jYcTVbb2DLL3VzDxMGj/E4cjwzdbXxqVd0kOCuAibYg4I88kbIB
 WdiGtlSHlj4IJ00pMAP9TLUEgrsL6
X-Received: by 2002:adf:f285:0:b0:2d8:4e4:8cf1 with SMTP id
 k5-20020adff285000000b002d804e48cf1mr3888919wro.21.1681721898023; 
 Mon, 17 Apr 2023 01:58:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yes3M1Odd4PdfUkZGoppbAMuZJHcQ1huVKlfUi03Wa/UcFApHhOHBNB3F7463IlokZBR/obw==
X-Received: by 2002:adf:f285:0:b0:2d8:4e4:8cf1 with SMTP id
 k5-20020adff285000000b002d804e48cf1mr3888905wro.21.1681721897701; 
 Mon, 17 Apr 2023 01:58:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v14-20020a5d678e000000b002f2b8cb5d9csm10006760wru.28.2023.04.17.01.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 01:58:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <23d45518-3565-e915-c6d4-45dabe82ea4c@suse.de>
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
 <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
 <23d45518-3565-e915-c6d4-45dabe82ea4c@suse.de>
Date: Mon, 17 Apr 2023 10:58:16 +0200
Message-ID: <87zg76evh3.fsf@minerva.mail-host-address-is-not-set>
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
Cc: jfalempe@redhat.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi,
>
> thanks a lot to both of you for this bug fix.
>
> Am 13.04.23 um 03:34 schrieb Pierre Asselin:
>>> (not tested)
>> 
>> Tested.  It fixes the regression on my laptop.
>> 
>>> diff --git a/drivers/firmware/sysfb_simplefb.c
>>> b/drivers/firmware/sysfb_simplefb.c
>>> index 82c64cb9f531..9f5299d54732 100644
>>> --- a/drivers/firmware/sysfb_simplefb.c
>>> +++ b/drivers/firmware/sysfb_simplefb.c
>>> @@ -56,10 +56,11 @@ __init bool sysfb_parse_mode(const struct screen_info
>>> *si,
>>>   	 * don't specify alpha channels.
>>>   	 */
>>>   	if (si->lfb_depth > 8) {
>>> -		bits_per_pixel = max(max3(si->red_size + si->red_pos,
>>> +		bits_per_pixel = max3(max3(si->red_size + si->red_pos,
>>>   					  si->green_size + si->green_pos,
>>>   					  si->blue_size + si->blue_pos),
>>> -				     si->rsvd_size + si->rsvd_pos);
>>> +				     si->rsvd_size + si->rsvd_pos,
>>> +				     si->lfb_depth);
>
> I'm OK with this change. There's a comment
>
>   "The best solution is to compute bits_per_pixel here and ignore 
> lfb_depth."
>
> I'd change this to
>
>   "The best solution is to compute bits_per_pixel here from the color 
> bits, the reserved bits and the reported color depth; whatever is highest."
>
> That will hopefully clarify the meaning of these max3() statements. They 
> are not obvious at first.
>

I'm OK with this as well but then should probably also apply my patch [1]
that computed the stride too. Since if we don't trust the lfb_depth and
calculate the BPP, then we shouldn't trust the reported line length too.

As Pierre reported in the thread [2], when the wrong BPP was calculated (and
wrong pixel format chosen), the line lenght didn't match the BPP * lfb_width.

He mentioned that it was like this:

 format=r8g8b8, mode=1024x768x24, linelength=4096

Instead of the expected:

 format=r8g8b8, mode=1024x768x24, linelength=3072

My patch in [1], fixed the linelength calculation so it was internally
consistent (but still wrong since the pixel format was really xr8g8b8).

In other words, I think that we should either:

a) Trust the lfb_linelength and lfb_width (we are already doing that since
   mode->stride and mode->width are set to those once the format matches).
   
   If we decided to trust those, then the bits-per-pixel could just be
   calculated as: bits_per_pixel = si->lfb_linelength * 8 / si->lfb_width

   which is what I do on my v2 patch [3].

b) Not trust lfb_linelength, since that would need to be recalculated after
   the BPP was calcualted. That's why I mentioned that we need Pierre's fix +
   my patch [1] that did:

   stride = DIV_ROUND_UP(si->lfb_width * bits_per_pixel, 8)

But calculating a BPP yet blindly using linelength doens't make sense to me.

[1]: https://lists.freedesktop.org/archives/dri-devel/2023-April/399963.html
[2]: https://lore.kernel.org/dri-devel/dfb4f25ca8dfb0d81d778d6315f104ad.squirrel@mail.panix.com/
[3]: https://lists.freedesktop.org/archives/dri-devel/2023-April/400088.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

