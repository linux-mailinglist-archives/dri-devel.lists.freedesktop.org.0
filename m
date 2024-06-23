Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4126913E32
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B7A10E130;
	Sun, 23 Jun 2024 20:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sXHTXt4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C63D10E130
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:51:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52ce655ff5bso304120e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719175880; x=1719780680; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zrQbfjK1hK2vAutZ4L9NKgXJBoJGQBefjmL3XamYmsQ=;
 b=sXHTXt4wvPQL0XCUZyT1eFlA7eGZRzqWxpJFQi772HV+AAeJxwAmqHqO0rcURtXMs+
 7ary2oCpE8AHlPuVg4xQqgf/RlQRlNqTmbmOGkXbx8SiNh1jmPkAJ1pzd9Z8vLoAMZJd
 0xWWPK61SaZ14DVpEgmfdiJE1MM1u6yQvZRuj8GoQ4WIqweNDFLK2q/ERo9paLBMk7uO
 7R6XX9vAZxsuKNz5MrTyIm157EO7b5SBYBok+4kSQs83g0gKmKdU4kXTrih5xPhvHJ6P
 PhKlFtx/8m6B3i8YZ9IrjgSNKJaGpZPu6oGvwfTMOb6IlAptkTYJLMBKIQoMY2F9AjG6
 M7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719175880; x=1719780680;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zrQbfjK1hK2vAutZ4L9NKgXJBoJGQBefjmL3XamYmsQ=;
 b=J17UZRCbMmJ/vTU81eJvhNwi3UgCkPPwffjlfKQt6rR/qPbhzS+xmqLeLRKXkZXxO/
 TBXTgSVkgU83D1mGC5KDGI2haSIbPjltULdAduFZuz+C6a+9PRyIwvJKf91KfcB5rqxh
 glVDUZAAeOGwaFF2OrA/GcSCC9iOjkg7WTHWGxybLtvZzH/cuNt6ujvBl967NQKQYfpJ
 ujkXeKsbFbUjHOLM01RTRC6D9Y+9XbufRMq9oJ2P1cnt0ai9FRfEQHHVwH/0E57ynKlz
 6JTE6pObjM8ld+ND7f3XHP8bCcgCosFJbyLKDhwMhevH9HhPSeMUqhp7pLW3WQ5gk7e8
 k/vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxqw8ZsP/gUZQu1kGN9pzzReWfVNVQzvuRbWW+LyjguorliEwIS6svKA/PVPI2HpgzGDI2oUIWMNp5lWAB6jZtn6FH7DYLd1TFTAOiZ5Pg
X-Gm-Message-State: AOJu0YyBp+NEocqIjBVgX7+Db2yPwI7bZlxElhFMAuoGO34EqxG8xtzA
 w5p4OAzFFAoXATMFda70JCgLND31AcVUF07vaECniRjlyUOpDp5pCNLlor1nzNo=
X-Google-Smtp-Source: AGHT+IH7PuCWS7ZghapNrL+2urV935YiXDzkaG1/DNXXG1GrFFJu2t7xV4PtFx7LqoOLdngwLxAa3g==
X-Received: by 2002:a19:2d18:0:b0:52c:dbc6:8eb0 with SMTP id
 2adb3069b0e04-52ce061a287mr2139587e87.21.1719175880336; 
 Sun, 23 Jun 2024 13:51:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b47bfsm831004e87.35.2024.06.23.13.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:51:19 -0700 (PDT)
Date: Sun, 23 Jun 2024 23:51:18 +0300
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
Subject: Re: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
Message-ID: <ogrcyxroz77zu6raq3lzmjt2k72uxxeayseyhvkivtsxn2kfix@ioupv56oa6lc>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-5-keith.zhao@starfivetech.com>
 <24bxty2zmlmrjmfi2qtfolkea3acghbhmkxnkxmcroovsz57jq@q5ynybr65z7f>
 <NTZPR01MB105049A5A7FD4ECAAECFC403EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <NTZPR01MB105049A5A7FD4ECAAECFC403EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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

Hi Keith,

On Sun, Jun 23, 2024 at 07:16:47AM GMT, Keith Zhao wrote:
> > On Tue, May 21, 2024 at 06:58:11PM +0800, keith wrote:
> > > +}
> > > +
> > > +static inline void dc_set_clear(struct dc_hw *hw, u32 reg, u32 set, u32 clear)
> > > +{
> > > +	u32 value = dc_read(hw, reg);
> > > +
> > > +	value &= ~clear;
> > > +	value |= set;
> > > +	dc_write(hw, reg, value);
> > 
> > regmap_update_bits?
> 
> regmap_update_bits follows 4 steps:
> 
> 1、ret = _regmap_read(map, reg, &orig);
> .........
> 
> 2、tmp = orig & ~mask;
> 3、tmp |= val & mask;
> ......
> 4、ret = _regmap_write(map, reg, tmp);
> If the value out of mask range
> It will just clear the mask bir
> 
> dc_set_clear will do clear and set without limit.
> 
> Maybe the name should be dc_clear_set

This is not really better. regmap_update_bits() has clear semantics of
updating a value in the field that is defined by a mask. You function is
just clearing some bits and setting other bits. It's not obvious whether
it is a mask and value, several concurrent flags or something else.

Even if you are not going to switch to regmaps (you don't have to),
please use mask & value instead.

> 		}
> > > +static void load_rgb_to_yuv(struct dc_hw *hw, u32 offset, s16 *table)
> > 
> > Is there any reason why load_rgb_to_yuv differs from two other
> > functions?
> > 
> load_rgb_to_yuv matches crtcs
> 
> load_yuv_to_rgb matches planes
> load_rgb_to_rgb matches planes

Then these functins should have that reflected in their names (and also
documented, why). If the CSC programming interface is similar, please
split the implementation to have common code and different data to be
used for programming.

> the coefficient(table) is diff between load_rgb_to_yuv and load_yuv_to_rgb

> > > +void plane_hw_update_scale(struct vs_dc *dc, struct drm_rect *src, struct
> > drm_rect *dst,
> > > +			   u8 id, u8 display_id, unsigned int rotation);
> > > +void plane_hw_update_blend(struct vs_dc *dc, u16 alpha, u16
> > pixel_blend_mode,
> > > +			   u8 id, u8 display_id);
> > 
> > Could you please settle on a single prefix for all your function names?
> > Ideally it should be close to the driver name. It's hard to understand
> > that the function comes from the verisilicon driver if its name starts
> > from dc_ or especially with plane_.
> Yes  starting with plane_ is not a good idea ,i will add vs_
> _ , thanks  
> > 
> > I'd strongly suggest to stop defining anything outside of the selected
> I don't quite understand what "the selected" means, 
> I hope you can fill in some specific details about it
> Thanks

"the selected vs_ namespace". So prefix all function names and all
structures with vs_


-- 
With best wishes
Dmitry
