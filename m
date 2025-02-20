Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4EEA3D818
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E9210E942;
	Thu, 20 Feb 2025 11:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EWpP3pVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807C410E942
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:16:38 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so114705766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740050197; x=1740654997; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u33bNsVrNxNtTUoEnhMd7zgtXI5olli4RASjpX/hNKk=;
 b=EWpP3pVByANqtb7cP7rhrenOgnYcylkLyK04+GmqRlX7aoJHnmN1/c1ke3FhKO9cWO
 SzFE40sMFpe3s3TKrKzKRT0d8GuiZwZ4uQO2lx2j6+pc6kMaFxEFjVUnov5NlyNcx2ri
 jxptKnX9Hc1SnBqeuacco9iFKfYOdTG2g9U5v2bA0Ox3grYxRCQLQK+ULKvA2/BYL2o8
 hmzD4G1DxTWW5Yh3mhZjGVZ5/L69Fhb+SZYwM08z+qqA9InkRzooseEHc4w6nsvokIT1
 +UMove4Rzxucxz4juSNl0YMKLGoeKmhOhK+NU5cpa4T/u13hBfxqzoT6n9jVifUmNEj5
 u8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050197; x=1740654997;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u33bNsVrNxNtTUoEnhMd7zgtXI5olli4RASjpX/hNKk=;
 b=aQ83rUN8dGEEkIVpvcKP1yBU3he+IQOpWWtCaaf7Q16M804Je7E8IZsgQimGo2o/Aw
 m2gfTYh8W6SGJ5oc74pG5rPNuYaGqdoPyRLljGRTeZXasaQGVykA8vTzzMSvRqAi0jhc
 MSv2o0Ytcoj7wKavWOSKLlBykeRht2hUSs9MBYLGZUKCc/uAHALmoMPimHzocYxd4a1R
 oqwR38tiGxNG4B1P+ykqAQ7VuRyK0c+mDDwPdV+9vX5ZBK2H1r1DGFWI1QKI5Vlb2MKS
 YMKZcOkRSnrHGpVnifYb7GGZB1zW9l8TTAD8wn1sNOMljy+1ijF50f3VntBh/btTtMJD
 N4ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1xceG+SKgSFlv2C9NNjXlwEghG1IrZyiwhIvbkN2FyONTEC8BPrKrNQ56AdI/FKUjtyF1RBwlOqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4IJMcAB5DZ21jg37eq1do/iJgCzI9ViK/Hk5jOzu8dsAfEVw3
 Kska2RSS2BoNvhZo9FEbCdH72gliyxdQZBC7FfKzlVZWC9wvWPlz
X-Gm-Gg: ASbGncuXLubvW4Niaw3kdl+W9DInlIGHxvBYN/9nM/xBr2uCVFRuFX2yTM05Zw4Xfdl
 1Ohe63QH/H8vmsgJ4KpSCM8VSU2H4E57wC3JEEWl+g/B7YZJU/GOTeLLKCyG6arWlJQ14b4ePIQ
 FgVHBt6EChIH7+H9r1ZkTlux+RHEwNebTWpDCQPrqmoKv/d48JkerEE6Mfj3sKPePvdBm+3SibL
 5PnOnkAhKXD3e1nGG/yeqZVQmAmOUY1JDWIBVZmXC4/spISz3OQO/VH0E9ZgXFlcKKLWVvmvJ3X
 iUJBXh5nLlCOx2X7mDqVYu1gaI8m5tgfGZYDu2mGq6Pylxv60SiwnyUJ82qC2vVJTgD7mqFX
X-Google-Smtp-Source: AGHT+IFmWBcDPInhp9w4btY1qA9eIzy3GXZXztUdnckb0Hqqtby2WfdghhMP/SBKRVAMezhhUK82sg==
X-Received: by 2002:a17:907:3da3:b0:ab7:9b86:598d with SMTP id
 a640c23a62f3a-abbcce1eeaemr613793166b.17.1740050196513; 
 Thu, 20 Feb 2025 03:16:36 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba9bd6e22sm630838366b.121.2025.02.20.03.16.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2025 03:16:36 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250217215641.372723-1-detlev.casanova@collabora.com>
Date: Thu, 20 Feb 2025 12:16:20 +0100
Cc: linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 17 lut 2025, o godz. 22:47:
>=20
> To support HDMI audio on the rk3588 based devices, the generic HDMI
> Codec framework is used in the dw-hdmi-qp DRM bridge driver.
>=20
> The implementation is mainly based on the downstream driver, ported to =
the
> generic HDMI Codec framework [1] recently merged in the master branch.
> The parameters computation has been kept as is and the data stored in =
the
> dw_hdmi_qp struct as been cleaned up.
>=20
> The table for the N values has been edited to reflect N recommended =
values
> as well as CTS recommended values.
>=20
> The downstream kernel also implements a machine driver for HDMI audio =
but
> it is doing exactly what the simple-audio-card driver does, so use =
that
> instead in the RK3588 SoC device tree.
>=20
> This adds HDMI audio support for both HDMI TX ports.
>=20
> *** Dependencies ***
>=20
> Based on Linus' master branch, but also needs Cristian's dts patches =
for HDMI1
> support [2], which depends on Heiko's patchset for
> phy-rockchip-samsung-hdptx [3]. Patches will apply without [3], but =
HDMI will
> not work (at all).
>=20
> [1]: =
https://lore.kernel.org/all/20241224-drm-bridge-hdmi-connector-v10-0-dc895=
77cd438@linaro.org
> [2]: =
https://lore.kernel.org/linux-rockchip/20241211-rk3588-hdmi1-v2-0-02cdca22=
ff68@collabora.com
> [3]: =
https://lore.kernel.org/lkml/20241206103401.1780416-3-heiko@sntech.de/
>=20
> Changes since v6:
> - Fix arguments alignement (checkpatch --strict warnings)
> - Add hdmi1 audio support too
> - Move hdmi0_sound node under hdmi0_out_con
>=20
> Changes since v5:
> - Simplify audio math computation for N
> - Move hdmi0-sound node up with other address-less nodes
>=20
> Changes since v4:
> - Moved hdmi0_audio node the rk3588-base.dtsi
> - Enable hdmi0_audio in rk3588-rock-5b.dts
>=20
> Changes since v3:
> - Renamed function to start with dw_hdmi_qp
>=20
> Changes since v2:
> - Also clear the audio infoframe
> - Write AUDI_CONTENTS0 to its default value in case it gets =
overwritten.
> - Store tmds_char_rate in the dw_hdmi_qp struct in atomic_enable
> - Clear tmds_char_rate in atomic_disable and only write registers when
>   tmds_char_rate is not 0.
> - Do not use connector_state duplicates
>=20
> Changes since v1:
> - Remove useless audio_mutex (was used downstream for multiple drivers =
access
>   to audio functions)
> - Let hdmi_codec build and setup audio infoframes
> - Only access audio registers when connector is connected
> - Rebased on master branch
>=20
> Detlev Casanova (2):
>  arm64: dts: rockchip: Add HDMI audio outputs for rk3588 SoC
>  arm64: dts: rockchip: Enable HDMI audio outputs for Rock 5B
>=20
> Sugar Zhang (1):
>  drm/bridge: synopsys: Add audio support for dw-hdmi-qp
>=20
> arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  17 +
> .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  17 +
> .../boot/dts/rockchip/rk3588-rock-5b.dts      |  16 +
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 489 ++++++++++++++++++
> 4 files changed, 539 insertions(+)
>=20
> --=20
> 2.48.1
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


Detelv,

Just curious of your opinion:

I=E2=80=99m on 6.14-rc3 and using =
https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-bri=
dge + this v7 series.

On mine rock5b all works nicely but - at boot time - i=E2=80=99m getting =
some oops in kernel like this: =
https://gist.github.com/warpme/e1668acbef7817e5d2a88a6840328722

I=E2=80=99m not sure where issue is but it looks to me like kind of =
interference between analog audio and hdmi audio as commenting analog =
audio in dts ( =
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch=
/arm64/boot/dts/rockchip/rk3588-rock-5b.dts?h=3Dv6.14-rc3#n24 ) stops =
kernel from oops=E2=80=99ing=E2=80=A6.

 rock5b dts i=E2=80=99m using is like this: =
https://gist.github.com/warpme/a8a32afd4a05d4b7f25d2808984b05ac


