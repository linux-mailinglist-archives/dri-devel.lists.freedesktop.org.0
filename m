Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0189F4B03
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131C810E211;
	Tue, 17 Dec 2024 12:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XzkztSV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CE410E2F4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:34:17 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so5797830e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734438856; x=1735043656; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=;
 b=XzkztSV2trnVw33/O/trHjxdneQuLFKQ/OOXUO6mOleMwC0Edsszjl/NDIpjeoj5Ol
 KNvbu9AuNdxY5sNl79wHe4mjTcA0aG8jplvUhNor90Pzcd1CuuGS1Vy6/G3Z7UnGTkBn
 54eLrqw8bG8j3UAZTCPlDQZ1deQk6tCvjYkU7JpBIxG6HBXO+3h4Hdo5EsWG+E/sGA22
 1RaaYuZmuaxvJX2sqC+iSHg6PdxIfe7MlMkBL3sWvJEt9Lv+93/hf4J9/tZFs2GURG04
 fH/VUshNYnAudH1ki4zn5IP8TftqFnXqvBWA9TpDFBlUEYtBxs8ZCKBJSTE0Krr5+B9N
 ez2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734438856; x=1735043656;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=;
 b=BCG1W/Ju8aBQBWx1fJ7nCpJ+dhzkHjPQuzFF5j6gjRbwn7Rc42O4kr85pWCj3PCR5e
 ioQEqiWgjEfcAr5DsDnaa9DvA+r49kHq8VPcjsa/nQgOFETM79yg6f37msk59+VwDaaz
 VOUZZ9yO42ZeBYjKgvztVVEHzzFtDytDLcvMHTq08qcdSwlpxd9tl5l+Md7Cp9BT4rRA
 kcgRAF8s//0c52QAjDmpLIvpdprU3PuVvxv6I0QfYvAM3uHOoIyX8MTzv+a5mPfQWQsY
 UEXqf8DScTVRiov00kYdrhEiXAfe5XkZluvGVgh35GC1oVkiyRNGq7ZyWQyHPGHdTjYg
 /F0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMKItvBtDFb/8PQnkEw8LY0ANbImTNioA3jvHfuwh39QLGWCJt2TF61cjaxwjgQeivFhFTrxow7Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvYFovYCBAr/dwnXg/PH0sDuZu+t6Pd6XL/ts0A8l6NX6gO8vr
 a9501VLSe5jEuWXw6DRKI3PrCCsfbBpBvJBRNPTxW6fHpFEzV6TNn/Gc7Xv8YTI=
X-Gm-Gg: ASbGncupNDOi1f7uR/0i+a6LRkjRdYg9KAlCxb03vSGdIQdZ/MYMnIiDwaVC23M3Y+A
 T61wNc4aNEyRBO2RdC286GNt1/2rlyz5qXT2zQbFfV4XzUfVjIAT7aPvH10BGm/e3E+HFL5Azkp
 mJZVPv/fpUX4PY6iGMi9KFzZzp3fsaojl34JzuVLiD6scaEw/IETM97UhEx0WCtBCm6BJG4ts4I
 oKP3zVowq6nMdc9bwEVswnYKOVUwy0Qc+TwalT84yBgnYG+VVkGb8v9yYfHCaqYeKc2hXvUY+UH
 rh/bFO8+fum4MK+nthRvoFLPcbsJg4xBsGHh
X-Google-Smtp-Source: AGHT+IG64fF0VZRsJVb2QKgF7su3lKSHe/E+XJ0mDICTjJVwLxaJk7I7Yc82GJIWZQCARYb0bWVA7w==
X-Received: by 2002:a05:6512:3c8f:b0:540:1a33:ded8 with SMTP id
 2adb3069b0e04-54090555550mr4911457e87.17.1734438855594; 
 Tue, 17 Dec 2024 04:34:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c20e64sm1119838e87.277.2024.12.17.04.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 04:34:14 -0800 (PST)
Date: Tue, 17 Dec 2024 14:34:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, 
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 Jitao Shi =?utf-8?B?KOefs+iusOa2myk=?= <jitao.shi@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <fm5rbujzu5og25x3nnxnhabrf4mppyy4nakxrskqtug774llnm@j47ce2zz6xsx>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
 <803bc2bd802506635dfa9ea9b26a6ca40a7f4912.camel@mediatek.com>
 <e5788187-e894-4aab-a41e-a3d7a64762c6@collabora.com>
 <d64ff9f1525fe3563502e470b2a31303de08a7c6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d64ff9f1525fe3563502e470b2a31303de08a7c6.camel@mediatek.com>
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

On Tue, Dec 17, 2024 at 06:40:11AM +0000, CK Hu (胡俊光) wrote:
> On Mon, 2024-12-16 at 12:04 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > 
> > 
> > Il 16/12/24 09:57, CK Hu (胡俊光) ha scritto:
> > > Hi, Angelo:
> > > 
> > > On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
> > > > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > > > 
> > > > 
> > > > Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> > > > found in MediaTek's MT8195, MT8188 SoC and their variants, and
> > > > including support for display modes up to 4k60 and for HDMI
> > > > Audio, as per the HDMI 2.0 spec.
> > > > 
> > > > HDCP and CEC functionalities are also supported by this hardware,
> > > > but are not included in this commit and that also poses a slight
> > > > difference between the V2 and V1 controllers in how they handle
> > > > Hotplug Detection (HPD).
> > > > 
> > > > While the v1 controller was using the CEC controller to check
> > > > HDMI cable connection and disconnection, in this driver the v2
> > > > one does not.
> > > > 
> > > > This is due to the fact that on parts with v2 designs, like the
> > > > MT8195 SoC, there is one CEC controller shared between the HDMI
> > > > Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
> > > > adding support to use the CEC HW to wake up the HDMI controllers
> > > > it is necessary to have support for one TX, one RX *and* for both
> > > > at the same time.
> > > > 
> > > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +static int mtk_hdmi_v2_bridge_atomic_check(struct drm_bridge *bridge,
> > > > +                                          struct drm_bridge_state *bridge_state,
> > > > +                                          struct drm_crtc_state *crtc_state,
> > > > +                                          struct drm_connector_state *conn_state)
> > > > +{
> > > 
> > > I would like v1 and v2 has the same behavior.
> > > Why v2 has atomic check but v1 has no?
> > > If this is better to have, add atomic check to v1, and this function would be common function.
> > > 
> > 
> > That's because v2 uses the new helpers, while v1 does not.
> > The v1 must be converted to the new helpers in order to use atomic_check() like v2.
> 
> I just find the description here, and I don't know why new helper need atomic_check().
> Would you provide more information how new helper need atomic_check()?

The HDMI helpers requires the driver to use
drm_atomic_helper_connector_hdmi_check() in order to maintain
HDMI-specific connector and CRTC state. Thus drivers using HDMI
Connector framework have to provide .atomic_check() callback which calls
the mentioned function.

> For example, the call stack to atomic_check(). (You could use dump_stack() to show it)

-- 
With best wishes
Dmitry
