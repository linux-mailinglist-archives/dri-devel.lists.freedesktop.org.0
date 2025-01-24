Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE94A1B42D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 11:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6F110E008;
	Fri, 24 Jan 2025 10:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wuLEiub8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B1810E008
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:55:49 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-540215984f0so2071970e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 02:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737716148; x=1738320948; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S1y2kMAHTS24gTACYcRUTYCl+HO5S40W6bTqtE2PJx8=;
 b=wuLEiub8w2UowVylIAW6/aUX61l+pVoCWAYOe8OOHJj1T53rJT/LDnePNi4u/w7Cbj
 8DgvcCluKvDImxZ2NVroR3Lg4p5/fz9jxhD7MycgOy+Qsc+w3Pt1Oa+yS+gnV6wl63yh
 voigFe6vuuUFS5uc3WkJTKb5lrm/jdmBYpCkXJ3XMS8fbydyhVUT09RXUBDHvy6A5els
 t3Wpjn27sWjVEFVZfXy4WKhtPUpEU8q2scpbFJfA+z+LszcpP8gGVYnv6pXZNBXFCQ+9
 F1VCOQQF7Lcej4rcR5BnKAbx+Xcr1oo6jnA0Rw3xxNNCWk9UNcmj3EdcEl01pLBfK9IW
 ZhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737716148; x=1738320948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1y2kMAHTS24gTACYcRUTYCl+HO5S40W6bTqtE2PJx8=;
 b=CV7DaG0fPtw0izpaQDZVS66uX46CqRoZZFxZD+0qG8MpGJR5AMOg/eGGxBd13cNoBI
 82X4T4P2GWcnQokMXpzzGjnAAlNmetI8RxeamdDyB0vUiZ9wGDeZQvdZlB4U7qF1fCte
 jYsavoeNzxPQZK4vcw1+4idZLKlTAMx5nnn7Mhu1pWfowsq+mZt5SO2neB5e7bKO8IVT
 XEQ3p06ilm9XbfjvBke3XZbNj0gBA3CBaIb4MjSbSjTjJRHBqgBVumeAdY6QFlNcpzM5
 1gf7UjfTu8NxOH757Rht2FC1DmIE+zqL61o/dlkuPZGSRsIomAF9ochDca8OeYA/ubbg
 8v3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK4MmlMfAB0jCHLhmhCrcPHCCM7sz0XcDmX87/b8p0lN5V8C8g5lwJFH7/H/rzYlLEFyWFG3+mHcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMeXPsgBjh2/mk3n08dLIMVEDA7IiDJc9ung+l5dE+iYwvgv2v
 8j+7fhRmyNshzp/y8BkmNOl0Q18rg0o0zAm44Xb4PU2eOz4k9gY6QMjaDnoOKLw=
X-Gm-Gg: ASbGnct9iWPzBmXBML9qRBZ3SbjA4QskXjobx0FxrM4wBMeMnJ/IRzLBTehm2rPcpKq
 IRkBbjbY8mhtnpv2naQqqRxv2TqY0f0yamL1xvgVdZVLH1PV9c6Bi6dhizeJJ8fhjryjf+7zk4i
 3bs7br24u+85CNvzamwnII4wxG9lA3LlSpEROWW/c9k3EOOwLhMoW646pJhkvWPAcABAPLDeQtk
 i9B+8zC1y/ANKS1m+Xyp7rtp0b5DgNwWpau3VZBwIUB555lMQ2C6YUydw9IojdpkVBPu8QEJo3G
 ld75M2fnkRBcdgCncDeYJHEh8B/Y2eNTmlhzdldmPpgRtCTfkk/bRhmRYZJN
X-Google-Smtp-Source: AGHT+IG1so1EJbtoaZLNEkBkwyrMeUwJf4GSPqV5pFUaUQ8TSEQNKfZY2ntLuIIOfXfOLnxy5gbRGw==
X-Received: by 2002:ac2:5e9d:0:b0:542:2166:44cb with SMTP id
 2adb3069b0e04-5439c282b25mr9456214e87.35.1737716147649; 
 Fri, 24 Jan 2025 02:55:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8228997sm256890e87.43.2025.01.24.02.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 02:55:46 -0800 (PST)
Date: Fri, 24 Jan 2025 12:55:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org,
 krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 05/20] drm/rockchip: analogix_dp: Replace DRM_...()
 functions with drm_...() or dev_...()
Message-ID: <rf6bdpi4wa2lbz23rvy7i5dl5nlidkky36gjjbagiqge3h7oi7@y5vp4u6o7hqd>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-6-damon.ding@rock-chips.com>
 <40b09942.533e.19449c023a1.Coremail.andyshrk@163.com>
 <a8bee693-cbde-469d-abcf-363311cfd904@rock-chips.com>
 <87ed0tn29l.fsf@intel.com>
 <6007b76a.6021.19497b090d4.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6007b76a.6021.19497b090d4.Coremail.andyshrk@163.com>
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

On Fri, Jan 24, 2025 at 05:41:58PM +0800, Andy Yan wrote:
> Hi,
> 
> At 2025-01-23 20:27:50, "Jani Nikula" <jani.nikula@linux.intel.com> wrote:
> >On Wed, 22 Jan 2025, Damon Ding <damon.ding@rock-chips.com> wrote:
> >> Hi Andy,
> >>
> >> On 2025/1/9 14:28, Andy Yan wrote:
> >>> 
> >>> Hi Damon,
> >>> 
> >>> At 2025-01-09 11:27:10, "Damon Ding" <damon.ding@rock-chips.com> wrote:
> >>>> According to the comments in include/drm/drm_print.h, the DRM_...()
> >>>> functions are deprecated in favor of drm_...() or dev_...() functions.
> >>>>
> >>>> Use drm_err()/drm_dbg_core()/drm_dbg_kms() instead of
> >>>> DRM_DEV_ERROR()/DRM_ERROR()/DRM_DEV_DEBUG()/DRM_DEBUG_KMS() after
> >>>> rockchip_dp_bind() is called, and replace DRM_DEV_ERROR() with dev_err()
> >>>> before calling it.
> >>>>
> >>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>>> ---
> >>>> .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 29 ++++++++++---------
> >>>> 1 file changed, 15 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> >>>> index 546d13f19f9b..8114c3238609 100644
> >>>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> >>>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> >>>> @@ -100,13 +100,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
> >>>>
> >>>> 	ret = clk_prepare_enable(dp->pclk);
> >>>> 	if (ret < 0) {
> >>>> -		DRM_DEV_ERROR(dp->dev, "failed to enable pclk %d\n", ret);
> >>>> +		drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
> >>> 
> >>>                 You just need to pass dp here:
> >>>                  drm_err(dp, "failed to enable pclk %d\n", ret);
> >>> 
> >>
> >> I see. It is really better to pass dp instead of dp->drm_dev. I will 
> >> update all relevant logs in the next version.
> >
> >No, this was bad review feedback. You're absolutely expected to pass
> >struct drm_device to drm_err() and friends.
> 
> No, I didn't see how the drm_err macro and friends restrict/expect the passing of only the drm_device pointer.
> As for the platform device driver itself,  we hope that when an error occurs, the log clearly indicates
> the specific device that the log corresponds to, rather than a generic drm_device.
> The original code of this driver used the macro related to DRM_DEV_ERROR to do just that.
> And similar patches have been merged before
> 
> Please also refer to the discussion here.[0]
> [0]https://lore.kernel.org/linux-rockchip/20250109032725.1102465-1-damon.ding@rock-chips.com/T/#m54bd842be660031773834cedea6c73a5033ca973

Reviewer's mistake (mine). I assumed that you wanted to pass drm device.

> 
> 

-- 
With best wishes
Dmitry
