Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E7A549E5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 12:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C511910E17C;
	Thu,  6 Mar 2025 11:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wksise9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EE910E19A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 11:47:47 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso514886a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 03:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741261666; x=1741866466; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FeRfzX4J4SSpOIDf0qW1PY6Ceutjf1oaVySsSvMl5vc=;
 b=Wksise9BT8Ygt9uGqDfIG5aUTHd2+f5cDZ2S2MPoW1l3E1MXbVLI/5LIM69x0ASVfO
 Jd1YG94HJwpdRMkbzgIWAyDKP3n1CCNaO5GyOWjQsZFP/n5gN9Sed4quFNF/L9Ut5rv6
 Fr7wq/gL5tLIspVchQCzdzZgqDshE7+Rptq2m4TKfT3fJkr2HDh8k6brNIyZPHQI45tC
 E1oVDhnixG8w9xbE61p9fZyHwqYk1Kn/FN3z8L+m1XBOFqo4sCA6v5YsxNe1dNxENgW3
 XK1zQJv4UJDNkTeyGVlf6Bb2o/p6LPgHe7i8Y2cCOXNYaXg50tgBsTp08vIB6PsdiSYQ
 IbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741261666; x=1741866466;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FeRfzX4J4SSpOIDf0qW1PY6Ceutjf1oaVySsSvMl5vc=;
 b=eXVhwLB/FyX6dgkG7OAqdv1ffLk6o5BjthKbg/NnmFvhTGfl9+FNAdPAwjjIX1S2qX
 3jk7zkPAw3XTbxWOKrltV5jpyCu2spr2UvQn8Jo5Z+c97VzRm8chz2TCVqhUMTqqqGVg
 9D6pGE7Z9iqsiDTvyWXHHKKOjkFYP+Qx6s9nN2UyhaANv5buel8Wt/BX7bnvHOUBKvtJ
 pRkKEjhGgtpEndz6Rqjsse2aE7DroIC4aCIApddqcox5YngI0fEF5PyO6BJK3FkdToaT
 BH+IYvSxCTGQUQgPdF2BRQDyzGOrKglgxhM+BNVs3aAP+Eq5at6uzjV/vBBv6PwwSiq6
 rpOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLYS4QBqzMeQeQncxiZ9LNXWjitxH2eb1jjv2eN71mQ99Yctmv8SUUOuatVncMeTR1f4WqA3w2pSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvDDHehGg/0p8EEfXr6y/QvLdVO9f2hUmL9ESOd4Wzf9nlUUs5
 llyk6DZoT+MBDBHnUVX9oY3v/PptFtej14xMAsFWKQgowHCuxDTL
X-Gm-Gg: ASbGncvpQZduNreXQsL1U0vNpUvcJqQFGH/Sawf36qlAhghxyLFKgF0hFH8okTSPGmm
 Mxg9i4nGjYiatLtw2OjY9RjV0Vt9UoKNJgWOFEcwEFS7EeEJxOt/dyooWpLd9ga5Te4P2DxYKO3
 LFzo+h5KI15QskKoejLI+ubWQvtpKcKZox2aiylDPnpf+w2zdmX1w8grt3qKE+6+a2lZ2HISdFq
 xUW2jcof/Yr6TCL57zVKa5AiN4steTAqXykQs5vDFxKP5G0QxmZwIMh+yWLIyzjACro18qiNAaL
 tWXha5whmVgs+O/QgnFqXkMLYch1hBoTysM28FvMb/SRE+ZU8nihRwMNQzYEjZuqHOcsSOleTMk
 rs8WKCWmS9DVfDqW/kBicckhRWw==
X-Google-Smtp-Source: AGHT+IGmWH/iGLqzVwuFP7RJWXn1M1/VMzVhYdWXO/tkwNgc0iTeL4UpWXsQLzyXQnZ0n4LlZ1JcXg==
X-Received: by 2002:a17:906:730d:b0:ac2:63b:6a45 with SMTP id
 a640c23a62f3a-ac20db4ccd0mr725046966b.30.1741261665523; 
 Thu, 06 Mar 2025 03:47:45 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23973a8d0sm82006266b.87.2025.03.06.03.47.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Mar 2025 03:47:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
Date: Thu, 6 Mar 2025 12:47:31 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
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


> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
6 mar 2025, o godz. 09:53:
>=20
>=20
> Hi,
>=20
> =E5=9C=A8 2025-03-06 16:42:00=EF=BC=8C"Piotr Oniszczuk" =
<piotr.oniszczuk@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>>=20
>>> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w =
dniu 6 mar 2025, o godz. 01:59:
>>>=20
>>>=20
>>>=20
>>>=20
>>> Both of the two config options should be enabled.
>>> andy@Pro480:~/WorkSpace/linux-next$ rg DW_DP .config
>>> 4044:CONFIG_ROCKCHIP_DW_DP=3Dy
>>=20
>> here i=E2=80=99m a bit lost=E2=80=A6.
>> greping on full kernel sources (with applied =
https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D936784)=
 gives me no single appearance of ROCKCHIP_DW_DP=E2=80=A6
>> Do i miss something?
>=20
> see PATCH 3/6:  =20
>=20
>=20
> diff --git a/drivers/gpu/drm/rockchip/Kconfig =
b/drivers/gpu/drm/rockchip/Kconfig
> index 26c4410b2407..c8638baf9641 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
> select DRM_PANEL
> select VIDEOMODE_HELPERS
> select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> + select DRM_DW_DP if ROCKCHIP_DW_DP
> select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
> select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
> select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> @@ -58,6 +59,12 @@ config ROCKCHIP_CDN_DP
>  RK3399 based SoC, you should select this
>  option.
>=20
> +config ROCKCHIP_DW_DP
> + bool "Rockchip specific extensions for Synopsys DW DP"
> + help
> +  Choose this option for Synopsys DesignWare Cores DisplayPort
> +  transmit controller support on Rockchip SoC.
>=20
> =
https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4=
D@gmail.com/T/#m178a325ea0ebc64187aae474d77c3f7a9e0bc93d
>>=20


Ah my bad!
One patch patch was commented - so not all dp code was applied.

Now it is much better:

root@myth-frontend-56b0f018b5e0:~ # dmesg | grep drm
[    9.795380] panthor fb000000.gpu: [drm] clock rate =3D 198000000
[    9.796257] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 =
minor 0x0 status 0x5
[    9.796262] panthor fb000000.gpu: [drm] Features: L2:0x7120306 =
Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[    9.796265] panthor fb000000.gpu: [drm] shader_present=3D0x50005 =
l2_present=3D0x1 tiler_present=3D0x1
[    9.851869] panthor fb000000.gpu: [drm] Firmware protected mode entry =
not be supported, ignoring
[    9.851921] panthor fb000000.gpu: [drm] Firmware git sha: =
814b47b551159067b67a37c4e9adda458ad9d852
[    9.852127] panthor fb000000.gpu: [drm] CSF FW using interface =
v1.1.0, Features 0x0 Instrumentation features 0x71
[    9.852436] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor =
0
[   10.003108] rockchip-drm display-subsystem: bound fdd90000.vop (ops =
vop2_component_ops)
[   10.004705] rockchip-drm display-subsystem: bound fde60000.dp (ops =
dw_dp_rockchip_component_ops)
[   10.006085] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops =
dw_hdmi_qp_rockchip_ops)
[   10.006679] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 1
[   10.006737] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[   10.007663] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes

Unfortunately still nothing on screen

dri state: =
https://gist.github.com/warpme/5e971dfd2e9fd52fae76641831cebe46

and kernel dmesg https://termbin.com/r0m3

i=E2=80=99m not sure what is missing (some dts enablement or=E2=80=A6.)
 =20






