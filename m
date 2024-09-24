Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69416984F12
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD3A10E158;
	Tue, 24 Sep 2024 23:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="KpAHvQ49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB50A10E158
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:44:17 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3007188B14;
 Wed, 25 Sep 2024 01:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727221456;
 bh=JcziicMMJvzimVi9UgPNdctmny3nPPC0wqwUTrVG/Cw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KpAHvQ49SvyQev5x4UdCcIavnk/TP8DonOJcyWmsVSvF4wwviGK4aqu/hDVhU+RMJ
 Pfn9wR+holwkMRsKh/kYAAlJNlIcebgKrlLbx44mn2fKHSsYVcP5LpytSnQQwuDC02
 Oaj4Gyl4Krm3Sz1xJpuhSYY+1dy+G0ORJHw0vZJr0P1/IIPy9wx0tjmeO5nvxEY35Z
 grAno1wJGdCh860VysfvPPnI+hLXzzb8TPrKMBVVrIYAPxpk8b4EbH1Hq2s6pFkYBq
 nBBxXYjFu3qOtTVSeqNp8cv4UAfi3a7LAVr73/xM4F4bpBHGnd2x/deKQ3Vsvw1U8g
 LQhg28dvPT0Jg==
Message-ID: <16316a89-04f8-4a63-b453-45562e4294d7@denx.de>
Date: Wed, 25 Sep 2024 01:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: lcdif: Add support for specifying display
 with timings
To: Rob Herring <robh@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240923135744.2813712-1-lukma@denx.de>
 <0e72b574-14ec-4369-b899-30d5c615d238@denx.de>
 <20240924225714.GA441530-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240924225714.GA441530-robh@kernel.org>
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

On 9/25/24 12:57 AM, Rob Herring wrote:
> On Mon, Sep 23, 2024 at 07:53:57PM +0200, Marek Vasut wrote:
>> On 9/23/24 3:57 PM, Lukasz Majewski wrote:
>>> Up till now the fsl,lcdif.yaml was requiring the "port" property as a
>>> must have to specify the display interface on iMX devices.
>>>
>>> However, it shall also be possible to specify the display only with
>>> passing its timing parameters (h* and v* ones) via "display" property:
>>> (as in
>>> Documentation/devicetree/bindings/display/panel/display-timings.yaml).
>>
>> Timings should go into panel node, not into scanout engine node.
>>
>> See e.g. panel-timings in arch/arm64/boot/dts/freescale/imx8mm-phg.dts , in
>> your case the compatible might be "panel-dpi" .
> 
> I agree, but if this is already in use, we should allow it. We can mark
> it deprecated though.
I don't think it is in use yet, at least not in upstream, so let's not 
allow this.
