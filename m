Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597476AB2F2
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 23:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635310E013;
	Sun,  5 Mar 2023 22:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755BD10E049
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 19:45:59 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 9CDC4240048
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 20:45:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1678045557; bh=6wvdvy9lBzSaji2KOWj0+gILnZ9T9C2rkkTBHLZUtko=;
 h=Date:From:To:Cc:Subject:From;
 b=fsBXXbWsUdhbSQU4HbajpR7ziNLuTe2IbSNK6E0tgY5+7XUdDx2yZXAYtCXsTWrU+
 zy3YsEgXZXgJARdp3ag5iGvU+p4UmIfgyOHAoeoXgmhduK9TbMbmSjSC8r9ov7BBtJ
 VC54rbgq9U5FkHLgonKAb3DbJw6oznmOh+e7aYkj/jynahQhk3A72RATRjz8+9cLen
 NjY5HTQUErptYi0GsZcBPkTN8j817qK/mYnoCZ2pbWAPhJxe9rdVW5I6V3xVX/KlE0
 5vh6A7uNn5QjWYk0jKe0LiZhxcPnslOCaTBCyZ/ZSFJYfrb9GXGTrpFoLS2wTVwZzI
 /EcpRxVK4RKUA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4PVByr4rySz9rxK;
 Sun,  5 Mar 2023 20:45:56 +0100 (CET)
Date: Sun,  5 Mar 2023 19:45:55 +0000
From: Patrick Boettcher <patrick.boettcher@posteo.de>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: IMX8MM: assign panel to mipi_dsi in a device tree
Message-ID: <20230305204555.293cd5e9@yaise-pc1>
In-Reply-To: <CAMty3ZA0m-CVdFsk5D55jEAkTCRPMbKo4YwzfKyrymM-98PO5A@mail.gmail.com>
References: <20230305162248.06ba45ab@yaise-pc1>
 <CAMty3ZA0m-CVdFsk5D55jEAkTCRPMbKo4YwzfKyrymM-98PO5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 05 Mar 2023 22:21:56 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Mar 2023 00:05:03 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

>On Sun, Mar 5, 2023 at 11:39=E2=80=AFPM Patrick Boettcher
><patrick.boettcher@posteo.de> wrote:
>>
>> Hi list,
>>
>> After several days of trying I realize my too small/old brain is
>> unable to map around how to assign/connect a panel to the
>> mipi_dsi-node in a device.
>>
>> We are using a 'tdo,tl070wsh30' panel connected to the
>> mipi-dsi-interface of a imx8mm.
>>
>> Of all the references I found on the in public repositories none of
>> them is using this exact panel. Well.
>>
>> Looking at other device trees I came up with the following dts-node
>> add to the mipi_dsi-node:
>>
>> &mipi_dsi {
>>         #address-cells =3D <1>;
>>         #size-cells =3D <0>;
>>         status =3D "okay";
>>
>>         port@0 {
>>                 reg =3D <0>;
>>                 mipi_dsi_panel0_out: endpoint {
>>                         remote-endpoint =3D <&panel0_in>;
>>                         attach-bridge;
>>                 };
>>         };
>>
>>         panel@0 {
>>                 compatible =3D "tdo,tl070wsh30";
>>                 reg =3D <0>;
>>
>>                 pinctrl-0 =3D <&pinctrl_mipi_dsi>;
>>                 pinctrl-names =3D "default";
>>                 reset-gpios =3D <&gpio4 4 GPIO_ACTIVE_LOW>;
>>                 enable-gpios =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
>>
>>                 backlight =3D <&panel_gpio_backlight>;
>>                 power-supply =3D <&panel_gpio_regulator>;
>>
>>                 dsi-lanes =3D <4>;
>>
>>                 video-mode =3D <0>;
>>
>>                 panel-width-mm =3D <157>;
>>                 panel-height-mm =3D <86>;
>>
>>                 status =3D "okay";
>>
>>                 port {
>>                         panel0_in: endpoint {
>>                                 remote-endpoint
>> =3D<&mipi_dsi_panel0_out>; };
>>                 };
>>         };
>> };
>>
>>
>> You'll see that I used the attach-bridge-option, which is maybe not
>> necessary. I found this during a debug-print-session in the
>> drm-bridge-driver, it wasn't attaching a bridge. But maybe I don't
>> need a bridge as the panel-driver contains everything to control the
>> controllers of the panel. I don't really know.
>>
>> However, with this I have the following messages:
>>
>> [    0.393985] [drm:drm_bridge_attach] *ERROR* failed to attach
>> bridge /soc@0/bus@32c00000/mipi_dsi@32e10000 to encoder DSI-34: -19
>> [    0.405626] imx_sec_dsim_drv 32e10000.mipi_dsi: Failed to attach
>> bridge: 32e10000.mipi_dsi [    0.413974] imx_sec_dsim_drv
>> 32e10000.mipi_dsi: failed to bind sec dsim bridge: -517
>>
>> The panel driver is never instantiated.
>>
>> I'm using 5.15.51 (-imx). mipi_dsi and the panel-driver are built
>> into the kernel. =20
>
>Please share the source repo link?=20

I'm using this one (via yocto's recipe):

    github.com/nxp-imx/linux-imx.git, branch lf-5.15.y

> B/W if you may try the mainline
>code base of imx8mm dsi please check here.
>https://github.com/openedev/kernel/commits/imx8mm-dsi-v16

Do you really think this is a kernel version problem not only an
integration issue? I mean NXP's version is coming with device-tree's
using panels, and, although I can't test, I believe they are working,
aren't they?

--
Patrick.


