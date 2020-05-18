Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95AC1D9085
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020106E512;
	Tue, 19 May 2020 07:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2D66E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589801230; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tvn5nLaWGrzfShxUOvOGAY+B3v9oKV0REWchgAjg+ps=;
 b=qIFV6CKF52U3yd4k3ke3sIOnyAJmRhauaGV3FzX3WGiZNmRDhflWKDE0YQRdC5VuFgGyyE
 31fwL2ACyG91ZYgJ+yMID+k6fILOmdHEnYO+ZsoSFU9aI1lwZyt6tpLWMuEwvj6yTy5NUt
 aFjUKd/YRQCXMKn4IrMIFDDnuBl89vE=
Date: Mon, 18 May 2020 13:26:58 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 11/12] gpu/drm: Ingenic: Add support for the IPU
To: Emil Velikov <emil.l.velikov@gmail.com>
Message-Id: <YGYIAQ.7N9YGTBML0143@crapouillou.net>
In-Reply-To: <CACvgo50q=qJXk3nFSCm+S6JHBMxpY0C_HwH8KGB2EAcKwgL0oQ@mail.gmail.com>
References: <20200516215057.392609-1-paul@crapouillou.net>
 <20200516215057.392609-11-paul@crapouillou.net>
 <CACvgo50q=qJXk3nFSCm+S6JHBMxpY0C_HwH8KGB2EAcKwgL0oQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: devicetree <devicetree@vger.kernel.org>, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

Le lun. 18 mai 2020 =E0 11:48, Emil Velikov <emil.l.velikov@gmail.com> a =

=E9crit :
> Hi Paul,
> =

> Disclaimer: I don't know much about the hardware :-P
> =

> On Sun, 17 May 2020 at 00:31, Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  Add support for the Image Processing Unit (IPU) found in all Ingenic
>>  SoCs.
>> =

> Since the IPU is present on all devices supported, does it make sense
> to have it as separate module?
> Didn't check closely although I suspect doing that will remove the
> need for the component patch.

It makes sense to me; you may not want to enable the IPU on platforms =

where it doesn't add much, e.g. on the JZ4725B where it only handles =

YUV and not RGB.

Besides, while the older JZ4740 SoC has a IPU, it's mem-to-mem and =

cannot output directly to the CRTC, so it cannot be represented as a =

plane. On this SoC the current IPU code cannot be used. So the Ingenic =

DRM driver must still be able to probe with zero components.

>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  @@ -50,7 +50,7 @@ struct jz_soc_info {
>> =

>>   struct ingenic_drm {
>>          struct drm_device drm;
>>  -       struct drm_plane f0, f1;
>>  +       struct drm_plane f0, f1, *ipu_plane;
>>          struct drm_crtc crtc;
>>          struct drm_encoder encoder;
>> =

>>  @@ -186,13 +186,16 @@ static void =

>> ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
>>          regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>>                             JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16,
>>                             JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16);
>>  +
>>  +       regmap_write(priv->map, JZ_REG_LCD_IPUR, JZ_LCD_IPUR_IPUREN =

>> |
>>  +                    (ht * vpe / 3) << JZ_LCD_IPUR_IPUR_LSB);
> =

> This hunk also indicates that it may be better to merge the IPU within
> the existing driver.

This writes the IPUR register of the CRTC, nothing wrong here.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
