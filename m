Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8797F005
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 19:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304010E440;
	Mon, 23 Sep 2024 17:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="aL3yMX/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B845C10E440
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 17:54:26 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AAC0C88599;
 Mon, 23 Sep 2024 19:54:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727114064;
 bh=MAhD+Q+O0foYr+lOstFd3yYl5SeKIjk7ofBPTCMpGHo=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=aL3yMX/J5J+OkKscfj+8rYMxymaiuSxBr7W5deusVTgK9u6ZX5ygbD1q6FPnGdvO5
 Z76ZEEloYjNrZuyGsxzGpE57+8gn20BB9ImLHxEGjUl/Qpz7sHU38i170HM42QNht1
 gYljmbSksXzuOa9qcMaefsvOEnE2jq4L5+McN7odUypVBl4Ot11oyoK5O13+AUGyRF
 5pK8bmP8C1cJhRPknIys/zsepyp/qPZa/BQTuoeIwa+tW7LsDjExfpma08i5Jxe9Vm
 22Dt+jtsMi4BNb97hnhngGvTTvifj9sr4A0gX72FRvgiiTHDxhhQ4N4Vm10tcBUsqW
 sLYDGJxnFmIQQ==
Message-ID: <0e72b574-14ec-4369-b899-30d5c615d238@denx.de>
Date: Mon, 23 Sep 2024 19:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: lcdif: Add support for specifying display
 with timings
To: Lukasz Majewski <lukma@denx.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240923135744.2813712-1-lukma@denx.de>
Content-Language: en-US
In-Reply-To: <20240923135744.2813712-1-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 9/23/24 3:57 PM, Lukasz Majewski wrote:
> Up till now the fsl,lcdif.yaml was requiring the "port" property as a
> must have to specify the display interface on iMX devices.
> 
> However, it shall also be possible to specify the display only with
> passing its timing parameters (h* and v* ones) via "display" property:
> (as in
> Documentation/devicetree/bindings/display/panel/display-timings.yaml).

Timings should go into panel node, not into scanout engine node.

See e.g. panel-timings in arch/arm64/boot/dts/freescale/imx8mm-phg.dts , 
in your case the compatible might be "panel-dpi" .
