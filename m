Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B487E2ADD16
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 18:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEA789B65;
	Tue, 10 Nov 2020 17:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D7E89B65
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:37:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p22so3950531wmg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=51b6+UxPYFa0A/YUV9c2HQO4IBez7DRJJ+TISf8XtCY=;
 b=dOw2kGjbVUiJ5OH1F3rH9MNE2duptSoLDc06fn6tULjHKNi1vJdWp6lHRdvCleZJ7N
 I4PID+18b2VyOhbyysiyOlsaYNlt9+Kzml9v+s5p/Tt0JfbxORFQhSLaQRg8wEn7tUmR
 0q7uBefhjpSgHceyM4+7eSTkotS3tWWHl760F+WvZeV2uLkD5rhRH8B+aL8/lWzuzLlo
 d2MEysUQMGcKgGwwJ9ObeFZXPC2oep5mlm/Dp82ImwZ/EJ2Nbr5UUg7Jrxd+Jyk2sdz0
 DWrdw2bvY/LGZweq041p3f+lLFNVf542AMYgatmSmKnH/ouSnFEXJ9NW4ZYtKqMXM4g2
 xIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=51b6+UxPYFa0A/YUV9c2HQO4IBez7DRJJ+TISf8XtCY=;
 b=YRtLfsubwms6cVCn0WtNPhmE72mSFPoLgo87WYJiQAqL2AM8TMcRVdTh3V+Gr8Yewe
 ifL/ruzDEviM5x+84Y/tdKVyFs3smbqfkJJzKRHc5fzF9JLlV+g0G4+pEYmilfZKe3Vc
 OY7cxYnfr3iWzIQ/5stNQux828h3VhgzuHBAtWgbbXcRYScMHLwFRMOtMM+2fRXIpITb
 cRC+PPGEj0o8H2kGI6nq0lg7El+TJZjWyjK/ko3Zd+Zbx5lCF0PMjNDqOUFV6wt6wNss
 h4JUU+6H0+zB57Tu1iHfQV5HKyPl2gqn8B5iVh7Ap7mH788KSbNsXzO2iJnmpjbduuJf
 Rc1A==
X-Gm-Message-State: AOAM533JfKRRAM6XfogkybLLAv2pI9ya4LEptmf/Tx9epo4ZTkwe9Ikg
 4Mp4aio/Hr8u0BBsyQr5sZY=
X-Google-Smtp-Source: ABdhPJyNdN+Oi1VEBqPTXL4GsHEkvOP26KVI9wGAt2jLUwGncIhxnsb6Of6JRzaqvMJ9yrk6E8DYzg==
X-Received: by 2002:a1c:61c2:: with SMTP id v185mr203855wmb.152.1605029865402; 
 Tue, 10 Nov 2020 09:37:45 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id r10sm3604464wmg.16.2020.11.10.09.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:37:44 -0800 (PST)
Date: Tue, 10 Nov 2020 18:37:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] drm/tegra: sor: Ensure regulators are disabled on teardown
Message-ID: <20201110173742.GB2297135@ulmo>
References: <20201013095158.311137-1-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201013095158.311137-1-maz@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0977966075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0977966075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 10:51:58AM +0100, Marc Zyngier wrote:
> The Tegra SOR driver uses the devm infrastructure to request regulators,
> but enables them without registering them with the infrastructure.
>=20
> This results in the following splat if probing fails for any odd resaon
> (such as dependencies not being available):
>=20
> [    8.974187] tegra-sor 15580000.sor: cannot get HDMI supply: -517
> [    9.414403] tegra-sor 15580000.sor: failed to probe HDMI: -517
> [    9.421240] ------------[ cut here ]------------
> [    9.425879] WARNING: CPU: 1 PID: 164 at drivers/regulator/core.c:2089 =
_regulator_put.part.0+0x16c/0x174
> [    9.435259] Modules linked in: tegra_drm(E+) cec(E) ahci_tegra(E) drm_=
kms_helper(E) drm(E) libahci_platform(E) libahci(E) max77620_regulator(E) x=
hci_tegra(E+) sdhci_tegra(E) xhci_hcd(E) libata(E) sdhci_pltfm(E) cqhci(E) =
fixed(E) usbcore(E) scsi_mod(E) sdhci(E) host1x(E)
> [    9.459211] CPU: 1 PID: 164 Comm: systemd-udevd Tainted: G S    D W   =
E     5.9.0-rc7-00298-gf6337624c4fe #1980
> [    9.469285] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
> [    9.475202] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=3D--)
> [    9.480784] pc : _regulator_put.part.0+0x16c/0x174
> [    9.485581] lr : regulator_put+0x44/0x60
> [    9.489501] sp : ffffffc011d837b0
> [    9.492814] x29: ffffffc011d837b0 x28: ffffff81dd085900
> [    9.498141] x27: ffffff81de1c8ec0 x26: ffffff81de1c8c10
> [    9.503464] x25: ffffff81dd085800 x24: ffffffc008f2c6b0
> [    9.508790] x23: ffffffc0117373f0 x22: 0000000000000005
> [    9.514101] x21: ffffff81dd085900 x20: ffffffc01172b098
> [    9.515822] ata1: SATA link down (SStatus 0 SControl 300)
> [    9.519426] x19: ffffff81dd085100 x18: 0000000000000030
> [    9.530122] x17: 0000000000000000 x16: 0000000000000000
> [    9.535453] x15: 0000000000000000 x14: 000000000000038f
> [    9.540777] x13: 0000000000000003 x12: 0000000000000040
> [    9.546105] x11: ffffff81eb800000 x10: 0000000000000ae0
> [    9.551417] x9 : ffffffc0106fea24 x8 : ffffff81de83e6c0
> [    9.556728] x7 : 0000000000000018 x6 : 00000000000003c3
> [    9.562064] x5 : 0000000000005660 x4 : 0000000000000000
> [    9.567392] x3 : ffffffc01172b388 x2 : ffffff81de83db80
> [    9.572702] x1 : 0000000000000000 x0 : 0000000000000001
> [    9.578034] Call trace:
> [    9.580494]  _regulator_put.part.0+0x16c/0x174
> [    9.584940]  regulator_put+0x44/0x60
> [    9.588522]  devm_regulator_release+0x20/0x2c
> [    9.592885]  release_nodes+0x1c8/0x2c0
> [    9.596636]  devres_release_all+0x44/0x6c
> [    9.600649]  really_probe+0x1ec/0x504
> [    9.604316]  driver_probe_device+0x100/0x170
> [    9.608589]  device_driver_attach+0xcc/0xd4
> [    9.612774]  __driver_attach+0xb0/0x17c
> [    9.616614]  bus_for_each_dev+0x7c/0xd4
> [    9.620450]  driver_attach+0x30/0x3c
> [    9.624027]  bus_add_driver+0x154/0x250
> [    9.627867]  driver_register+0x84/0x140
> [    9.631719]  __platform_register_drivers+0xa0/0x180
> [    9.636660]  host1x_drm_init+0x60/0x1000 [tegra_drm]
> [    9.641629]  do_one_initcall+0x54/0x2d0
> [    9.645490]  do_init_module+0x68/0x29c
> [    9.649244]  load_module+0x2178/0x26c0
> [    9.652997]  __do_sys_finit_module+0xb0/0x120
> [    9.657356]  __arm64_sys_finit_module+0x2c/0x40
> [    9.661902]  el0_svc_common.constprop.0+0x80/0x240
> [    9.666701]  do_el0_svc+0x30/0xa0
> [    9.670022]  el0_svc+0x18/0x50
> [    9.673081]  el0_sync_handler+0x90/0x318
> [    9.677006]  el0_sync+0x158/0x180
> [    9.680324] ---[ end trace 90f6c89d62d85ff6 ]---
>=20
> Instead, let's register a callback that will disable the regulators
> on teardown. This allows for the removal of the .remove callbacks,
> which are not needed anymore.
>=20
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/gpu/drm/tegra/sor.c | 59 +++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 35 deletions(-)

Applied, thanks.

Thierry

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+qz+YACgkQ3SOs138+
s6F9Xg//TRAcs2XU/XUt/lYP/+oaVvwF70C4gRU8yuTStqLEnjpsyYRweKfWVOD0
nPhTD0LPF/XWGJt3n9DacUrUnqsNrbaYp09LNK3GFeP53IuMXbIziuWrfZ6Df/ev
/XrFOrt3kRWdvGE/XK6FJ3b7w0GsLIwiVHuSNUk7XNICWKGhwNsBM6p1SvDZ0gLW
NwPosCu8Orr+Yrl+nb/9h4P2B4h+2P0BIMJ9yfeYOdHD6785/u9nKmq6oVpp5ThV
9FAvHy02RqymT+9mZmzu3t/z4pdexqfEWRTgQshhr/drDfLU8YOEmkOXf6UITDHX
gFrYJvjjWFYN/zlhulJEhS6MuWdrX2yEsbW6y4SHzyX0mh4BjOyL7XqdYKitD7YH
EeqgUxN6fN9wd7+ft2eKSHQbK91YgBhkSivCq3MjyMqn29pyLdRLCuRWFvUks6bk
0At/tr996PSytUs14VZlB8XPI3UiDsymE8mwfwILIYNXNSQ4nZG/ASXXgzyh5FAN
LYVEfoNo0vuEitJc7sRgdT10pJl/P/ztoMNjx4ACIQmezcy6r4sf89dvFqBEl4RJ
3l5y1g8tA5RYC14daHnJRG1WhrKKhdtdCSlpbg0wjEuV5LZXItcBaO0PCQZruzPH
QxRSxQabcI7mbYZfawE3DtUcJjxDQadqbJj9tEQ4eIwsjr8OqxQ=
=JeKr
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--

--===============0977966075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0977966075==--
