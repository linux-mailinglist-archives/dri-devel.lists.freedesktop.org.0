Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0DB5516B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B314610EC76;
	Fri, 12 Sep 2025 14:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HIIlRfqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539E910EC76
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:28:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45df09c7128so16421855e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757687288; x=1758292088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jnkM+AnZyhps3qygpz2dIT80TKNeLfoU88kbfoaXJwA=;
 b=HIIlRfqobD+dVOLi9+cW8Tnb75AKVQL6eyPt3VLQHTxqx86WzofwAzH1bJ7+xQ+bHe
 F0OxYqiw0WbyRQto/iXVD2F1jEBUE8ekGGeJwOrZOJiXhAc6eyVIJ41kSWcexvr3goSW
 gUt7QyjVItwrtDkArcgwafMZDs11THaiSq7oq2HmnK40YpEdsdclfzRwmcRdqlPsrwu4
 5LfujLQEZZqqT5mubNDjQyV/jaAa7F3FeBop2OeJXPw54Smey+Cv3i17uOHVq4bKtxXd
 pRxGehgEECS5uRItVjtfIEddcTO7HbtftgI5iVfaqhDwQQFaKxT4WkJMdGkv/20Hpivf
 eoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757687288; x=1758292088;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnkM+AnZyhps3qygpz2dIT80TKNeLfoU88kbfoaXJwA=;
 b=owRwlGv2QwbBQ26brIxGNmQ0pdRu6zzBoJfr1S8BqZQIIs1aLunBcasdf5xJWhA0Lu
 9TQJnqB8M2iNLgEIXpKl2DXc41eUop2nCM1D8+h1B+kO68S+lvuwIPhtOAyB8f5c/O5i
 WSWhVIp+zKNyBQUcyHDroyabUSSjqlZIzj9G+J71xCCE4dKwpVCH6uCvZBzrjNKP4q+0
 xSpYvdQMgpUfd7xBE54f31E1L387sTxfsoUaNARES6auufPtmUtd2ar/45gNzq5r/ASc
 Psw0K4NO9gYS1zi2I4LaMZg4r/CdhbL2ePFEfwvEuzlfyJT1pfakILa3FcmD74ylKJ9A
 j3Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe89Zmb1z85sEDXz8OP1eBgQ5AraAcr50OwTMHT6MXmT2sHaOLLVja7QQgOgei2HF17gUkwzPAZc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn928TQy6LyOVEjV11JvnAy4cvGpl5V+rtsM3iggTo47FeEzvF
 VRkcgySyCFaqrmnw+o9yNkF186hqGxMkgr4l1RjxXztrZJOSoaaeJ9K5
X-Gm-Gg: ASbGncutwo0TzPCrOe6xMVs/Yw29/gzc1EfkAvSwqm+oxZMbtJtAW2P6QDxXipdGSzb
 F2ctzZXhsJsqZxebnx69GTW/6Xvn0Xg1iXr91AQnSWjW1YOetkA1vs5V5Oz1ZEgZwTABroYpo6c
 Qhl5PqRvIJTtvtsFNF2pUxxiwHPUqsUaNoNWv2qXOVyO1yAS0xKnA5YbbzeQGo3Kq++zac1XlrQ
 eKxTxiKf/sXyMYA5fHjO96Q7TBv+7hfsMoPxjAYGA4DcG+vLnhmwVSGUw8Dr1HdYQrMmEvwKGyM
 9ytH0Yf15IxciVMeJ1ITALLFEGdWR2IscOLArWigB0vgntzRqd19z9Mc1ZTap79/H05ULmrhP3b
 UWsHGQebETxqwfXhVIm8d3AMqxEfoNbJzieqliOJTVw==
X-Google-Smtp-Source: AGHT+IGDvV53/LNE/OpdCCjsAZPEbICrc+wJ2bgnqrFTzigP/wpDBOWh7QRU2BBuWo1pqbgZm/YfGQ==
X-Received: by 2002:a05:600c:1c19:b0:45d:d259:9a48 with SMTP id
 5b1f17b1804b1-45f2128cba7mr31759255e9.9.1757687287618; 
 Fri, 12 Sep 2025 07:28:07 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e017b27b6sm67769045e9.16.2025.09.12.07.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 07:28:06 -0700 (PDT)
Message-ID: <3de4b03d-4940-4d96-bf20-5bb45f1cc5a5@gmail.com>
Date: Fri, 12 Sep 2025 16:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
> 
> Remove those to suppress an avoid_unnecessary_addr_size warning.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>   	flash@0 {
>   		compatible = "spi-nand";
>   		reg = <0>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
>   		spi-max-frequency = <52000000>;
>   		spi-rx-bus-width = <4>;
>   		spi-tx-bus-width = <4>;

