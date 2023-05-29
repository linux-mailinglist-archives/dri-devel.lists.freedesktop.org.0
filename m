Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356F714919
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 14:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670BF10E27C;
	Mon, 29 May 2023 12:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D249F10E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 12:09:37 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 56C1F200BB;
 Mon, 29 May 2023 14:09:35 +0200 (CEST)
Date: Mon, 29 May 2023 14:09:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Visionox r66451 panel
Message-ID: <6enrlcmw6a2vxwzocsdbcx7yaltzh3kv4w3yiydzx7ylrtdozn@xzwdj35uj7na>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-2-4210bcbb1649@quicinc.com>
 <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
 <kc65fjf5xibvszx4afomzbmfrlld4vcnwfxqxefrupkaxw74fa@j2op4bj2recm>
 <2d9d7454-0e7d-b6f2-93ff-9eca69380e47@quicinc.com>
 <9d50bc4e-e747-47fa-03cf-4dbd33f778dd@quicinc.com>
 <5becf303-8a23-6ace-2379-0a002e9b48f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5becf303-8a23-6ace-2379-0a002e9b48f7@linaro.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-26 09:32:45, Neil Armstrong wrote:
<snip>
> >>>>> +static int visionox_r66451_bl_update_status(struct backlight_device *bl)
> >>>>> +{
> >>>>> +    struct mipi_dsi_device *dsi = bl_get_data(bl);
> >>>>> +    u16 brightness = backlight_get_brightness(bl);
> >>>>> +
> >>>>> +    return mipi_dsi_dcs_set_display_brightness(dsi, cpu_to_le16(brightness));
> >>>>
> >>>> mipi_dsi_dcs_set_display_brightness() already converts the brightness,
> >>>> so you don't need cpu_to_le16 here.
> >>>
> >>> Tread carefully here: we've had the same issue and conversation on our
> >>> Sony panels where this extra inversion is required.
> >>> set_display_brightness() sends the bytes as little-endian to the panel
> >>> (and it even assumes little-endian in get_display_brightness()) but the
> >>> spec for 16-bit brightness values states that they have to be sent in
> >>> big-endian.  This is why c9d27c6be518b ("drm/mipi-dsi: Fix byte order of
> >>> 16-bit DCS set/get brightness") added
> >>> mipi_dsi_dcs_set_display_brightness_large().
> >>>
> >>> Jessica, if you need to have the endian swap here (should be very easy
> >>> to test with a real panel, but it should be given the max_brightness
> >>> value being over 8 bits) please switch to the _large() variant.
> >>
> >> Got it, thanks for the heads up!
> > 
> > Hi Marijn,
> > 
> > Just wanted to update this thread -- I've checked the backlight brightness values in the sysfs and it matches the value being given in the panel driver (255), so I think it should be fine to use *_set_display_brightness() without the _large() variant.
> 
> Sure, I was also misleaded by you using cpu_to_le16() but as Dmitry said it's already
> done in mipi_dsi_dcs_set_display_brightness() and a no-op on LE arm64 platforms anyway.

Yuck, right, it's cpu_to_le16 here and not cpu_to_be16.  @Jessica, can
you please remove this misleading conversion?
mipi_dsi_dcs_set_display_brightness() takes a native u16, not a specific
__le16.

- Marijn
