Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E0C91659F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 12:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786E510E2DC;
	Tue, 25 Jun 2024 10:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kK84VvJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B621C10E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 10:59:10 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so6297266e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719313148; x=1719917948; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ap+EbCgWJ+AJvWKstiQPgmG/qtQmcsmJ/Rrhaee2O1k=;
 b=kK84VvJt8BkmYea7R2Va8f4uP0Z12JVt8Eg4bdneHqlxC7NY92sFryr9TsK+M1BrVs
 a0gqYE7ZAdlkFfInL7uvUSy8ZhxxMSHPpBzEGod6WRhcRofU1keOUlTvUsbgD28YuE7W
 jLTUmzlvVhD32yuhdxJow0fOOzxOUAcLzSUz6FkR5JZxu0sJoJhTJAw8GGrnJGsXVpme
 oBZDui+LbYYICjZ30lVPnnLoVAoK5mCTShCZV89NZJ3yCcHEMyJBW1/Z8qv49eNSHv3X
 teUGCGsIDbf/aoWJsAnknTDQnqTzJN4LjPn6GxLiJOtm9TohRdUr5v/NfvjmUGrnqcsW
 1BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719313148; x=1719917948;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ap+EbCgWJ+AJvWKstiQPgmG/qtQmcsmJ/Rrhaee2O1k=;
 b=Q0O3sFARRqEhJqOEL3YOBSrYEB6RHrQ1cHK9uhLc5DeWfLUasAHYVrJ3b94mn7sxkc
 uDNwI8o4h+Cb+e/nlHrI8XEWmvImp+zOQwLnau9p/6PkYmnqB/v35x44e/7P/pBciYSF
 3FO7T9gD7UK/6aLE3AB6SqMhsgiRdD4TYBEmdSM1jLJHdvIAQ6v/3vXoCBguN06oq51R
 v8o5GaD8LNiYnfaQeZZOKLDPBI8j0NemA+CkimSKFGVd/IbGmf11j12e+np09ywy4b3B
 54/4eDYtuLZV6Lh4niTLa7HoibcLQP6Hj1GCKLpe11/pVqAmZB8zRwwt2M77MRSwayvI
 4ZHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPALKq9/51JowcV4m2EYuv/7hn6mG2xORg/LBOADRencsAMznzR/xbtHUqnFn419tO6RdkJLbxFC9T0k8stJXgA1trj8hZMw42n7XjwZZ3
X-Gm-Message-State: AOJu0YxgDXZZH3tfSJcrQ0GgxNMV2MIvkj928lYmtOzLgEkSgmelAy4X
 13q00FMswYz1q3z83xPRSfK1PzK+8gq9Fa7LSUSs66AoV47mSkM3TouhYAGWFpY=
X-Google-Smtp-Source: AGHT+IELfo9Wd11H6BpCcjeN9tYgLU03zzvea5ZVbA5djNJEU8H0AMfA61zaxu1gPBk2a1ekKNglcQ==
X-Received: by 2002:ac2:4c39:0:b0:52c:8c85:cb46 with SMTP id
 2adb3069b0e04-52ce064697bmr5438180e87.64.1719313148440; 
 Tue, 25 Jun 2024 03:59:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cec5923a3sm211365e87.96.2024.06.25.03.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:59:07 -0700 (PDT)
Date: Tue, 25 Jun 2024 13:59:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 10/10] drm/vs: add simple dsi encoder
Message-ID: <u7zx25g7zwf56unal4qwgh65hmjydfa7d2vnbgwxnulygtcj3w@uicmayewp4r4>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-11-keith.zhao@starfivetech.com>
 <cej2d72e6bacbjabyjecoqhjlhz4sxx4bgn2w43rgl3cfyyuwt@jq5kq4egj2wo>
 <NTZPR01MB1050AA3ABA20F736B1756E04EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
 <b7cgvgh3uphpa3byf3bdl5i4fr64zzuagxg5txuwx7woy56dkt@uhclfjtzejfc>
 <NTZPR01MB1050B4B8FA6F36267A1DBB01EED52@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <NTZPR01MB1050B4B8FA6F36267A1DBB01EED52@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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

On Tue, Jun 25, 2024 at 08:33:48AM GMT, Keith Zhao wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2024年6月24日 5:11
> > To: Keith Zhao <keith.zhao@starfivetech.com>
> > Cc: andrzej.hajda@intel.com; neil.armstrong@linaro.org; rfoss@kernel.org;
> > Laurent.pinchart@ideasonboard.com; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; maarten.lankhorst@linux.intel.com;
> > mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com;
> > daniel@ffwll.ch; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > hjc@rock-chips.com; heiko@sntech.de; andy.yan@rock-chips.com; Xingyu Wu
> > <xingyu.wu@starfivetech.com>; p.zabel@pengutronix.de; Jack Zhu
> > <jack.zhu@starfivetech.com>; Shengyang Chen
> > <shengyang.chen@starfivetech.com>; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v4 10/10] drm/vs: add simple dsi encoder
> > 
> > On Sun, Jun 23, 2024 at 07:17:09AM GMT, Keith Zhao wrote:
> > > Hi Dmitry:
> > >
> > > > On Tue, May 21, 2024 at 06:58:17PM +0800, keith wrote:
> > 
> > > > > +								  "starfive,syscon",
> > > > > +								  2, args);
> > > > > +
> > > > > +	if (IS_ERR(simple->dss_regmap)) {
> > > > > +		return dev_err_probe(dev, PTR_ERR(simple->dss_regmap),
> > > > > +				     "getting the regmap failed\n");
> > > > > +	}
> > > > > +
> > > > > +	simple->offset = args[0];
> > > > > +	simple->mask = args[1];
> > > >
> > > > Is the value that you've read platform dependent or use case dependent?
> > > > What is the actual value being written? Why are you using syscon for it?
> > >
> > > The syscon is used to select crtcs binded with encoder, If this
> > > encoder binds to crtc0 , set the syscon reg bit0 = 1 If this encoder
> > > binds to crtc1 , set the syscon reg bit1 = 1 (0x2) Maybe I can do this
> > > by the possible_crtc instead of using args from dts
> > 
> > If this is a constant between your platforms, it should not be a part of DT.
> > 
> > >
> > >
> > > >
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static void vs_encoder_atomic_enable(struct drm_encoder *encoder,
> > > > > +struct drm_atomic_state *state) {
> > > > > +	struct vs_simple_encoder *simple = to_simple_encoder(encoder);
> > > > > +
> > > > > +	regmap_update_bits(simple->dss_regmap, simple->offset,
> > > > > +simple->mask,
> > > > > +simple->mask);
> > > >
> > > >
> > > > A purist in me would ask to have separate mask and value to write.
> > > Understand , will avoid this action
> > > >
> > > > > +}
> > > >
> > > > Is it necessary to clear those bits when stopping the stream?
> > > No need to do this , if clear those bits , the encoder will point to a
> > > unknown crtc
> > 
> > what are the consequences? Is it desirable or not?
> There are two crtcs.
> Each display terminal encoder can combine any crtc, depending on the value of possible crtc.
> When the bit is 0, it means that the encoder matches crtc0.
> When the bit is 1, it means that the encoder matches crtc1.
> The possible crtc of this encoder is 2 , the reg bit is 1.    
> When the video stream is stopped, if the bit is cleared, the result is that the encoder hardware points to crtc0, 
> and the encoder points to crtc1 based on the drm framework(because the possible crtc no change).

I'm not sure if I understood you correctly. If it doesn't disable or
disconnect the encoder, I'd skip that in the .disable path.

-- 
With best wishes
Dmitry
