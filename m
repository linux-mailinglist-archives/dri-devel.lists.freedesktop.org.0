Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D74757D75
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C1310E1AC;
	Tue, 18 Jul 2023 13:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A243210E1AC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 13:27:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso5948596f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689686851; x=1692278851;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y5ykKVFj8XRj1akWlI9kL56icXreWp0y3Oh8lxwnYUo=;
 b=HAvzA8Kh6KU7bl55fFVekoyCC5Ill+dInNj/fArVx9xD4Ijq8+dSv/fFyv3qLaHu3Q
 p5kPMVljBJX/PQIix7A1DIp+pOMP6Ch1/UbNPNFUnIKrPNUQHXsFIw2LnoKy9MkvG+vi
 BALADdhrffpdXro+li7hwMSjKCafCHUVS3lGvaFpXd9Gn27UCS8yFLeV3ZFiXCHzWZVW
 xj+/oXfTQGLbOijuIprw+avrNlY3u3Ma5gGvlNve54UvKBjcgUvxQb/MSpNywohDUmP5
 u0EQwA7NJsy0/bgD4Jx7CvsJ5A5iKi5zlNKIUsqmGcQkNkl5dKifKXxl4oggrGaAhpPh
 aWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689686851; x=1692278851;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5ykKVFj8XRj1akWlI9kL56icXreWp0y3Oh8lxwnYUo=;
 b=aP3NmCuALK29ZPpiI0R8ryJt96xnzL4B4NKcgaK28QkC41nHVc6i7WGOac5EbStenC
 R+QKfjKGfS/M18DQ71aoBXy6fND6hILxgZrXr/w86uTR5T5Yo43ck6uYI3oF/lKlb1+3
 UJ0SsrOtGX6WCAX+PJiiFdQVkgWUQNn2I/MmKErzG0A8fy1FGQ1hf6/HNauLXB2N9yjg
 ARG0+L1LBHqqAvu9sjuS8Edqv4uHtwky9JJ0ytwdM8qJsUWARU5l6kigN4+Rql1z/nrO
 SPaLi897cxBGzzZ/u3JNt/iQSFoPnmmmPnVVoi4doAmF2GbMFBxfs8QZilE7zrFYvqUt
 BlLg==
X-Gm-Message-State: ABy/qLa2u7ewvfwCHTeuUQCSbxT5/C+m0w4lvp1EK3DZtbULu3kETgBK
 l9YnMJkrgSEOYRCMeqqzGJwuyw==
X-Google-Smtp-Source: APBJJlEix09qvK9nzkt0uYSg486fNum9sk0vRVjigln/Sfac5scnIuLZd4IB/OLlDHbgZqF8k333Rw==
X-Received: by 2002:adf:ff84:0:b0:314:dc0:2fca with SMTP id
 j4-20020adfff84000000b003140dc02fcamr14060054wrr.29.1689686851489; 
 Tue, 18 Jul 2023 06:27:31 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b003fbe791a0e8sm2180772wmf.0.2023.07.18.06.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 06:27:29 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:27:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: suijingfeng <suijingfeng@loongson.cn>, conduct@kernel.org
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Basically everything in this email was wrong to a kind of shocking
degree.  For example, ignoring kmalloc() failure is a bug so the fixes
tag is definitely warranted.  But then you called me "bare brained"
which seems like a personal attack so I'm going to report this as a code
of conduct violation.

regards,
dan carpenter

On Tue, Jul 18, 2023 at 08:32:02PM +0800, suijingfeng wrote:
> Hi,
> 
> 
> Thanks for the patch.
> 
> 
> The commit title generally should be 'drm/looongson: Add a check for
> lsdc_bo_create() errors'
> 
> not 'drm: loongson: xxxx'
> 
> 
> On 2023/7/18 15:01, Dan Carpenter wrote:
> > The lsdc_bo_create() function can fail so add a check for that.
> > 
> > Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
> 
> Please drop this Fixes tag,  because you patch just add a error handling.
> 
> Yes,  the lsdc_bo_create() function can fail, but this is generally not
> happen.
> 
> Even if the fail happened,  your patch is not fixing the root problem.
> 
> 
> I know that you create this patch with the bare brain,
> 
> I would like hear more practical usage or bugs of this driver.
> 
> And mention more in the commit message is preferred.
> 
> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
> > index bb0c8fd43a75..bf79dc55afa4 100644
> > --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> > +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> > @@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
> >   	int ret;
> >   	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
> > +	if (IS_ERR(lbo))
> > +		return ERR_CAST(lbo);
> >   	ret = lsdc_bo_reserve(lbo);
> >   	if (unlikely(ret)) {
