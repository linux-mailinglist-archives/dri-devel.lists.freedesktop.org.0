Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F10D85BC60
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 13:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A0110E3D4;
	Tue, 20 Feb 2024 12:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="JOd+OAw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1A910E3E3;
 Tue, 20 Feb 2024 12:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1708432825; x=1709037625; i=markus.elfring@web.de;
 bh=ackbCV81XyEbD7DZSK1QNJr1u7ZHUTQZH151yHDIdOU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=JOd+OAw0np9qZK8WoR7hHNlYpGDTcxGvCWObU9SA4t2cVmL7AI2TrdyjeBf6lDzR
 WJN1gDbnHjaKOZu6G21ZbmSAan/w8kUcPkx/eC5Si65Q/RH06xYJLdrKVh3/3Ddr1
 BL2SyMc3/Qsnm6PZz0mInnCFyavQgiUmeuvmbi11Dm+WJVt42OxOXrc2aG7v56lUn
 bkvBlexEk7gYMuiirEpHIfemcqLFLLs7GES60iTe/HDkxO5L4A+TxXJZXLfJb/kds
 AiWpCb15g+6yIGc1gRJKVbRmXqmUIafWYiQgBNH8I9N9Mr6o4/GT3mX4lxJ7RS/A6
 Q4ZGYuz57TBtyxdZcQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHmm4-1rgH1i3TOA-00EwPI; Tue, 20
 Feb 2024 13:40:24 +0100
Message-ID: <1bb22d53-2bfb-4fa7-9c4a-f49d979207ab@web.de>
Date: Tue, 20 Feb 2024 13:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
Content-Language: en-GB
To: Johan Hovold <johan@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Johan Hovold <johan+linaro@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>, stable@vger.kernel.org
References: <20240217150228.5788-4-johan+linaro@kernel.org>
 <9ff4221a-7083-4cb1-abde-1690f655da8d@web.de>
 <ZdSMg63b4ZGYhUXO@hovoldconsulting.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZdSMg63b4ZGYhUXO@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r+CHavyKhh73xuHY9wsEjvvyvp2FPjpfnjTyBrrjxbHa+zRr3E/
 RiJIddQORueuMddXYwNvCYF5KhgIjz1im8dJ4PZG7yiEWHxHhVtMSsEPFLOnMsRTEeoGsKi
 jCIVsHUoJPtUqrgmgi5k4whlTBRlG5mnoagRQKtuA6NqjfX8pOXeBLTy6jSgfZogRNfRX/k
 cg/xF0tVkCFkH1W1ooyhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KtuAdgiy1ik=;y4ys3n9cM6RoSSuIK93yPw73zol
 pSyhNa3wJKuiPsj75tLL00VnROfe+KzG2al6/Rhvs4lZPTcXW6jz+ErDf4UVuWVC0sA5Y6nz+
 pzN07m7oQsgW+/FxGSD6px1OGNBQKMfFxFdq8z+/Eol/LzEDM3VHAqr0j6ViiL2IQpcODdflP
 On0tDmCes0Ju0RLWrvsKwaNXmbiZgnFu6N3LuqAXxbd6JGOzYuv/HJxLN97eiGUxcHXqaTpOb
 VulkDO0u7Vh9Z2ShIImU02TNC/nIhZOJaNGjQtTCB74eH+JVb13UPhGePUZnLUWKv7UWySMIK
 7mwMSVZDpl2cR4mKbcZ0Njhe8hk+fxsArS2guI5gL2aYT6bvY1fLdX62jl16+aXiJyzNphrh3
 zkRkPuTCfDcG0ZBAyL/MWkB08q0TijBJK/zmjUd0der0ZEO0thUrakZYQHeWbKnePiHqlyTEy
 tDDw9+w26IDa1M7uR8NVNK6BmjcMX5bMs0GEhvAcwQTQY8d5q/ieLyS6PjBDl4R8vX1opftl9
 8RoBXj5YonoO7WuTe6XP+j1EIkEec4VoFDGcCNtaAofjPIF563IIp6irkdWRRhU5LVNcacEdc
 yDt+lLKGdozKR5BG1JOdo32sSwYgPkSCvzvaYw2TiOP/NhID60aI10TcHXqGSw+XgAs9WLXlR
 t/NwYz6uDXRjrVQFBecPp0omdQzV+gtMSJv64VIWfqp+5tIkMv/5ipi90aOSyF9jlQDpZiH1U
 Emzes10uty02+3WM4bTqj5Hr9rJ/pskEz6Nb2j+B3uazjL7FdD9BIt+eD4HBJLOz9n+NStUvs
 sSiU89ntkAXEjBi6FraSIxizVT96J8+lcnHZdWbg+W4fM=
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

>> The function call =E2=80=9Cfwnode_handle_put(fwnode)=E2=80=9D is used i=
n multiple if branches.
>> https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/soc/qcom/pmic_=
glink_altmode.c#L435
>>
>> I suggest to add a jump target so that a bit of exception handling
>> can be better reused at the end of this function implementation.
>
> Markus, as people have told you repeatedly, just stop with these comment=
s.

How does such a response fit to advices from another known information sou=
rces?

Section =E2=80=9C7) Centralized exiting of functions=E2=80=9D
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.8-rc5#n526


> You're not helping, in fact, you are actively harmful to the
> kernel community as you are wasting people's time.

The proposed source code transformation can eventually be (automatically) =
achieved
also with help of improved development tools.

Regards,
Markus
