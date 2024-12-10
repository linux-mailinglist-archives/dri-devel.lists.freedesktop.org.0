Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61F9EB0DA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A19E10E2A0;
	Tue, 10 Dec 2024 12:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y97aGP9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8049010E2A0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 12:32:09 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso14145721fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733833927; x=1734438727; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xFyd1PgF3D2/xwv+F2WOR3tO3r6sjTbGoWT6Q3TM8dg=;
 b=Y97aGP9TovJQppt3JOQ1h6QC/4Bm5ZDFRYFE6knUq/qrSIvgdiAdt3NPS5Y/4gkDgp
 febcQzGipJ60gzFjV1G3BNV8bvHeWadkJDPbp7GsaJU1jgjNu3aj+xpjDh1l77E+MKJG
 FhHR/vo2n80j6JwqOegh95Fi/v19BPYrOB1MA6cX4BUdjiEFPPYxseZ3i+sSEEftdNMG
 LL+Rydvdu3Xf8ZA9n+vlEb+BG11oZIikJHe43mh69I+2wW4hOSpKjx6XRYMn8VwxZIN7
 QXNZfDMIbfPwMC7r4dGCtszIoA1lfjgmo2q0v+W4Nt/feSF0+0w/hEfFGjnzXoXYbXh9
 k+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733833927; x=1734438727;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xFyd1PgF3D2/xwv+F2WOR3tO3r6sjTbGoWT6Q3TM8dg=;
 b=rnkav78gBNBPo6KXTHXPq9MqMIlisDcqFDKDqHj2+TRfPBUS2a6ZWJKkaQejrX4iQK
 g8BwFsPglAHwyOalNPj1C1QL67LCE+ZgJX3pkdwDUZghG6Bc8hfgeAa/R7C1JsQssc5b
 zR+nYV2CfZSSfCz3BrVCmpSOVt20fb/XSOvhDVvvO3y++plwBB7Btuix2o4H27eOZTPq
 8CtffxvYLzuPtJhOhAIRzMZ29keoTD8hfzXFntaxVLbv9ZuRLm7n5A/d2XC/G+cTA9yc
 Gm+1x8ITwuO150YEMJXrK8UJZ581AQj0L3anXevUHcjbmqoP/txdC3agVuSCuZhc8e3S
 zxRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIKtfQl2wbFD5TZp99ZoNdbWDwovaiIVEcuO0oO0fpXHdAYX62VI1fOrC0z2dJb3lK6OaYtYKbM1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyln9Uf7Ir7r2E8UQ4wOHTkvohtbnxoLpoUDCzf9H4xjGP33OEs
 txWME01YNsSGu+8cl4sZkmRknqNlWnDsBnIn4oEjxQ6LrW+wcrM289ha8i0uF4k=
X-Gm-Gg: ASbGncsqRQJ6pkwQlkTAuU9CMBPe50p1YQQcQ91jk+704qgIGbRyTXC4RfPQaCVqC/D
 VNgRi6rzc/mE5ANB6VYae2xHxs6byBTQkkSTh7cptwrVThKkwDN2fPXSw1+kalP308yfACRo+dg
 vCDl0mYYRGBj5GEzTGUlPt1Inpr+EhF+5CL0CMH2UiPmkoUmXmoTUFYxy/pDP44rl6/Af1sf92I
 bmO2HhTzAr6upsYogJq6l9rcVNSBDRVErrMsOjIwGiAwgve6jXTrOID1lZMb5fNORJCzXFMIjX6
 cczzLWvSpEP/6sAtKd7GIt0Mt0U3++mRpw==
X-Google-Smtp-Source: AGHT+IFJ8BqRGzKbdRKo9sdokdyA13iJnEch3RCwabno4BEnD/wpduTivdAcQ64Maqs8TOr83ohZIw==
X-Received: by 2002:a05:651c:1582:b0:302:2620:ecc7 with SMTP id
 38308e7fff4ca-3022fd82956mr14279341fa.35.1733833927539; 
 Tue, 10 Dec 2024 04:32:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30216eb1013sm9110231fa.34.2024.12.10.04.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 04:32:06 -0800 (PST)
Date: Tue, 10 Dec 2024 14:32:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Daniel Semkowicz <dse@thaumatec.com>, Diederik de Haas <didi.debian@cknow.org>,
 andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, 
 quentin.schulz@cherry.de, rfoss@kernel.org, robh@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
Message-ID: <jl5obi7rd4h6ywozeqruxq2vx62sx5yf4wwpksrq3prdleps2k@d3zbr5ttquvn>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org> <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
 <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
 <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
 <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
 <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
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

On Tue, Dec 10, 2024 at 09:54:09AM +0800, Andy Yan wrote:
> 
> Hi Dmitry,
> 
> 在 2024-12-10 09:45:11，"Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> 写道：
> >On Tue, 10 Dec 2024 at 03:22, Andy Yan <andyshrk@163.com> wrote:
> >>
> >>
> >> Hi Dmitry,
> >>
> >> 在 2024-12-10 09:01:38，"Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> 写道：
> >> >On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> >> >>
> >> >>
> >> >> Hi,
> >> >>
> >> >> At 2024-12-10 07:12:26, "Heiko Stübner" <heiko@sntech.de> wrote:
> >> >> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> >> >> >> Hi,
> >> >> >>
> >> >> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> >> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> >> >> > > This series adds a bridge and glue driver for the DSI2 controller found
> >> >> >> > > in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> >> >> >> > >
> >> >> >> >
> >> >> >> > I did more tests with different LVDS displays. I tested following
> >> >> >> > configurations with DSI/LVDS bridge:
> >> >> >> > - 1024x600@60.01
> >> >> >> > - 1024x768@60.02
> >> >> >> > - 1280x800@60.07
> >> >> >> > - 1366x768@60.06
> >> >> >> >
> >> >> >> > All of them worked without issues, except 1366x768.
> >> >> >> > With this resolution, video is blurry, and offset incorrectly
> >> >> >> > to the left. There are also repeating errors on the console:
> >> >> >> >
> >> >> >> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp3
> >> >> >> >
> >> >> >> > In correct operation with other resolutions, there is no error.
> >> >> >> > I am not sure if this is a problem in your series or rather in VOP2
> >> >> >> > driver.
> >> >> >
> >> >> >This really sounds like something is wrong on the vop side.
> >> >> >The interrupt is part of the vop, the divisable by 4 things likely too.
> >> >>
> >> >> This is a hardware limitation on vop side:
> >> >> The horizontal resolution must be 4 pixel aligned.
> >> >
> >> >Then mode_valid() and atomic_check() must reject modes that don't fit.
> >>
> >> We round down to 4 pixel aligned in mode_fixup in our bsp kernel,
> >
> >What is meant by the "bsp kernel" here? I don't see it being present
> 
> bsp kernel means downstream vendor kernel.
> 
> >in the mainline kernel. So, if the mode is unsupported, it should be
> 
> Will it be acceptable to add this round down in the mainline mode_fixup?

I think so.

> 
> >rejected.
> >
> >> because sometimes, some boards do indeed choose a screen that is not 4 pixel aligned

-- 
With best wishes
Dmitry
