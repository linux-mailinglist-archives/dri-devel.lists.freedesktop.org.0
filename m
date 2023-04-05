Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68876D7C9F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1445E10E919;
	Wed,  5 Apr 2023 12:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED6110E919
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:31:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8346685F7F;
 Wed,  5 Apr 2023 14:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680697892;
 bh=qNqzvu4NApAiCop59NMMwGn31purYKOu6gBuay5tl0o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EphCrJcFmFxaXYH8FXF1+7h4KVOMmZQHJDBAC5vusb+wp3J9LydhVYGKXYTPRbY00
 wJPRUyMP58xsR5gMby1mtCFLTWu2oe9L8JCh1cVszN/JQiFLGFE794ewSa/kvZD7hS
 OJc/uQvJwNFWwqt50UfV2pRVv920xno+ll9zMxLBqnT3K29M09JyUikhgOQop+lt9B
 8HIYVDiZ2/jyf8zovS979ibJAVdueDLoA/FYFuEQvzO3w1F0riBmZ/DcnnUgMZYiQI
 YR9lM2iCCLTcwGIQ3lwO4K6N0d7Nbfxocg4VFg1aNEsEYcJi8PaLLSaQXbJCGsnBGf
 u4jSuVjJd6ViA==
Message-ID: <4b15b282-7243-3f75-4a2e-ba86791f6431@denx.de>
Date: Wed, 5 Apr 2023 14:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm: bridge: ldb: add support for using channel 1 only
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20230404073720.1465552-1-luca.ceresoli@bootlin.com>
 <5b514970-cfc8-41de-7ae6-f608f5187860@denx.de>
 <20230405093017.62ccb4f6@booty>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230405093017.62ccb4f6@booty>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/23 09:30, Luca Ceresoli wrote:

[...]

>>> @@ -311,10 +314,23 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>>    	if (IS_ERR(fsl_ldb->regmap))
>>>    		return PTR_ERR(fsl_ldb->regmap);
>>>    
>>> -	/* Locate the panel DT node. */
>>> -	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
>>> -	if (!panel_node)
>>> -		return -ENXIO;
>>> +	/* Locate the remote ports and the panel node */
>>> +	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
>>> +	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>>> +	fsl_ldb->ch0_enabled = (remote1 != NULL);
>>> +	fsl_ldb->ch1_enabled = (remote2 != NULL);
>>> +	panel_node = of_node_get(remote1 ? remote1 : remote2);
>>
>> You can even do this without the middle 'remote1' I think:
>>
>> panel_node = of_node_get(remote1 ? : remote2);
> 
> Apparently, but honestly with such short expressions clearly having no
> side effects I think it's not helping readability.

I think even the ternary operator itself isn't helpful much, but that's 
a matter of taste, and I don't have a better suggestion which would 
improve the readability either (I tried to expand it into if()... but 
that looks bad too).

No need to change anything.

[...]

Thanks for the patch.
