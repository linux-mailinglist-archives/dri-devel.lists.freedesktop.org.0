Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114385B9B4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 11:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1454910E311;
	Tue, 20 Feb 2024 10:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="wC0uPW99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D3210E311;
 Tue, 20 Feb 2024 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1708426561; x=1709031361; i=markus.elfring@web.de;
 bh=MpJcVGRKO8AWBDMnssLpCilOGC18nfaO9n9RoVZq7VQ=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
 In-Reply-To;
 b=wC0uPW99wmHtcswlvxbPWW4Njo8pkzvI7Ov7Is/B95jRPoMy+GuKmIczMSgPsRhS
 027Qj46J9Up1e7X10Fm3s03xd4xeAC+YzP5GoQcLYCNxHY0YU3pejL7NxEdL0/FAk
 262n9loPfLR9hGFgrrPH8/wHs25gprGTJEHeKVVQ6/d8Ib7OBKRpliRYk4JJNz028
 bdQAGRwIkUEVWujAmoj05rOkG/0UYGTyPUbJXN2R98q3uMYUMOKnLgSLI6mwpn0Uy
 ys47+Pah0dxX36YEJcq8UYu7YyTmnwaRoY4hazeKndI836VUohji5zKlhh7+7cF9r
 2ejmaIXDvc4Ufg8q9g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7Nig-1rZ6Xk3SFY-007pjU; Tue, 20
 Feb 2024 11:56:00 +0100
Message-ID: <9ff4221a-7083-4cb1-abde-1690f655da8d@web.de>
Date: Tue, 20 Feb 2024 11:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>, stable@vger.kernel.org
References: <20240217150228.5788-4-johan+linaro@kernel.org>
Subject: Re: [PATCH 3/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240217150228.5788-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+nHgQKTeGuYog2KEpVvwroQxHKbVWgy4x84LyT/hTMOvc2YQpn3
 JDDJBBZ8e8iXt3Iuyj6UFT2vAkr8MqMibV6zXbFxjjJ4NonyB3VINxG4cgtMo5Xs7xuC6zv
 xHHA+wCH+zFVfPWvJKoIfdB4zOgAfy83sRz8V39oAy7aiZgIKyhsi1FhkeElCu/itLaX0BA
 SMxSEIL5gaOlUNFNP274g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t82oGWIlCJ4=;7+ho17LAUzbb+8jansfprRaT4K3
 tkXnZ69uYqQ9Yr40k/fxQ+39GLI67PzDy3fOhtM/dwhZhudfM1yJ0/5S/0chhwFJDnZDg/5tE
 WLLRz2kV+hzJGyd5QzcmOj8ppCN/PqNjdaaxl+adhWTYlFeVD2I0H1biUV+x6G8X/eAuv8FJE
 gtvkRo+LUdYlXJ7VXCC0TL7pWOUFbSSlwtgTGev7UuV/QpstPjHlkEbFmrjPtNV/5VAtXA8Uy
 5BeWc7XP34vuq1gxnS9HH4FAbxdrvKNpa8Z/RJBfwDkMxZs/5VJcFVa35xoGewZGULRXM1mls
 zylKnysUsrygin5x6Yf5ctYrUbSX5xXH/CSWGW+FCKqTHWLCWCMpJXZt8WhzTgXRjG4wE22lc
 2KiGFn13qGww9c4STZ4wdiEdzNsw9Lz6B7FV8CsOTYFIFPGZhAyGocdEQPaSreYPzWnjpLssE
 j/5AVYE/BucQ+TmeC3IhigE/ZENdm/RidjY3KP0PrA7KHUmbHAtwMvH0Mgor2AU27oQsgpyu4
 qQ2j2sJpeA+dlGJ6nl3nnYL+YqMt/kquiG8b84J3yWCf20cgvlJQGxTkr5Ng2rBkH8R4kiN6Z
 2LhBLA/PoMcUgapN+3qkrFzp/pA9v9gne94Zwk0eeBKmj6GU+rpp9bB0+1aytagEnWSmcoeTQ
 eUHAdUaujUH21M760THc9Iie0eSgXf1Wyqt1SKnjtA9WiabnkP3Ox67umd1gPHvj1c32E74EV
 EtKfp8P3OC9RQC9gsU50ImVehqLpOFlEq9Xck4pelKEH1vm8tT9Be+TFvlZptoNp20SmsIB1/
 aPcKF0oh2XFRsluKbBSulO5XmA0ZBHgzVFUXT7LAglKlM=
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

=E2=80=A6
> Specifically, the dp-hpd bridge is currently registered before all
> resources have been acquired which means that it can also be
> deregistered on probe deferrals.
>
> In the meantime there is a race window where the new aux bridge driver
> (or PHY driver previously) may have looked up the dp-hpd bridge and
> stored a (non-reference-counted) pointer to the bridge which is about to
> be deallocated.
=E2=80=A6
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
=E2=80=A6
> @@ -454,7 +454,7 @@ static int pmic_glink_altmode_probe(struct auxiliary=
_device *adev,
>  		alt_port->index =3D port;
>  		INIT_WORK(&alt_port->work, pmic_glink_altmode_worker);
>
> -		alt_port->bridge =3D drm_dp_hpd_bridge_register(dev, to_of_node(fwnod=
e));
> +		alt_port->bridge =3D devm_drm_dp_hpd_bridge_alloc(dev, to_of_node(fwn=
ode));
>  		if (IS_ERR(alt_port->bridge)) {
>  			fwnode_handle_put(fwnode);
>  			return PTR_ERR(alt_port->bridge);
=E2=80=A6

The function call =E2=80=9Cfwnode_handle_put(fwnode)=E2=80=9D is used in m=
ultiple if branches.
https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/soc/qcom/pmic_gli=
nk_altmode.c#L435

I suggest to add a jump target so that a bit of exception handling
can be better reused at the end of this function implementation.

Regards,
Markus
