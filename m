Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC0930B4F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 21:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0453510E088;
	Sun, 14 Jul 2024 19:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="CYtrLdtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4436D10E088
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 19:21:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E01F5880F9;
 Sun, 14 Jul 2024 21:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720984887;
 bh=H+SsodIl5jXfJCziWhu868fAmzv0AAiz9dw7MXlL24w=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=CYtrLdtEC2q+TeiC/ki7M5f502x1keYS7w7GX4Yrcaf6VCesYzNzMwZbtRsluhSfd
 w1s96HavcolVAGkm53wSMjMmXRVg/+iT7UVGZjii19msHcn4c5BEk8yZ12VRDtclvj
 3lgoXWLy7ZBiXaJ3rHVo0Lr2+cUvb5dVOM+WA8cZ8sWN0gdQmywCwdTEGQqrQBsV6D
 wU2A9fqysgJF8bfZ/ZtqYmJMzKkzDT9JxFLFKDtzfeDiGVW4K6dnJm7kauUWt6Xo2y
 LfO+B7qysrw/DTmAUQTkRw62Xzh6F0MhiEYgsvobfqP6k/8cLWFK+pK08OiCipQgpl
 wxJknvwAhy7dg==
Message-ID: <47e80ac7-7d5d-40c0-ae0d-f1102c935b7d@denx.de>
Date: Sun, 14 Jul 2024 18:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] media: imx: vdic: Introduce mem2mem VDI deinterlacer
 driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240713154934.109318-1-marex@denx.de>
 <20240713154934.109318-2-marex@denx.de>
 <9f4cd132-6a4d-413a-badb-19e9f988c9a1@suswa.mountain>
Content-Language: en-US
In-Reply-To: <9f4cd132-6a4d-413a-badb-19e9f988c9a1@suswa.mountain>
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

On 7/14/24 3:37 AM, Dan Carpenter wrote:

[...]

>> +err_irq_nfb4eof:
>> +	ipu_idmac_put(priv->vdi_out_ch);
>> +err_out:
>> +	ipu_idmac_put(priv->vdi_in_ch_n);
>> +err_next:
>> +	ipu_idmac_put(priv->vdi_in_ch);
>> +err_curr:
>> +	ipu_idmac_put(priv->vdi_in_ch_p);
>> +err_prev:
>> +	ipu_ic_put(priv->ic);
>> +err_ic:
>> +	ipu_vdi_put(priv->vdi);
>> +err_vdi:
>> +	devm_kfree(priv->dev, eofname);
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>> +err_eof:
>> +	devm_kfree(priv->dev, nfbname);
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Any time we call devm_kfree() it's a red flag.  Sometimes it makes sense
> but I haven't looked at it closely enough to see how it makes sense
> here.  Is it an ordering issue where we had to do devm_free_irq() and
> then we just freed oefname and nfbname for consistency and because why
> not?

I think in this case, the devm_*free() can be dropped, yes.

The rest is addressed in V2. I'll wait a bit for more feedback before 
sending it.

Thanks !
