Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83CE9453CF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 22:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10DE10E935;
	Thu,  1 Aug 2024 20:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tf3rDo1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3110E8E2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 20:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1722545284; x=1723150084; i=deller@gmx.de;
 bh=YZVqWUYXH3wbZaiEOSoyE18e7Vcku7lYY1epSrmPrRA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tf3rDo1ACPZo/o6IB4YoxfbuMIOAE7ZkspMmZWrpkJZ4n7QIH9GR8EGwghe0HHhP
 LLTNCjRjG1jpujRUeNPI/0G0bcRr2MSaQDFhkUQn59oEZtFk7A/93sFRKGC7lEeD0
 +2UJzvnVQtZcgz0CGYxi9oeo3fjOov6258wt6IclVGJe7fRO6cTgJVfBCvxCW1K85
 i62Hsnia84Lx/A1zkkejVoEADQbI+NFrEOzHhGhOF89JkPZJlX416HfZAqF+i8M9D
 yya369DxCboswrgvfkPfiJTHizm/crLQelYGw/atJTm+RLDgR+C7ggJYU86gSiKtv
 u9IGH7SpxAYnz0h/RQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1s9o2b1IF3-016vdN; Thu, 01
 Aug 2024 22:48:04 +0200
Message-ID: <69fb1b80-cddf-49d6-952d-1fb33dbdb2c0@gmx.de>
Date: Thu, 1 Aug 2024 22:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev/hpfb: Fix an error handling path in
 hpfb_dio_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <ec4a9fbbff184e40d50e1f12e6df161ff5119f21.1722544445.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ec4a9fbbff184e40d50e1f12e6df161ff5119f21.1722544445.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VA6OnsDRKY9qJpzhMkXV6vBMLgiJ004ZpnVDG4RMkxHYAD9EQJl
 DEeICFsCUG/cbusSty4Mev/hvmo484q0NLYo3k1BVkm1HfkjTNuI6oI2A+4oiQpn/ln935r
 znhBofFo8Rsfs+bymSi75r4NYMTNRLE9qEbJ5KJgwbhoTODA6JElpc1sTTmECuLGyJR33aG
 GA4czI6ll4AtAQE2hDzqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ke1ygABLCfE=;lODdFpLywd9tjlzaufmyEdFtL8d
 ogVcPB9VJM8K+D25GeJtPkk+QRHwNNb+NPMnS3eq+WSjoM9a5Bc/pndHyBDuwkZEKmxsM2R0I
 6G1t9+640HSRvgZRHfg9gHHG1CS7agLhDXBJW9w8x0exlldvq2DSTXFMWBEBfSjGohBURwBOj
 KbD2S7a2toGGWRDArh5DQz3sGP6Hao9nRxD2Aj+yvqKp3V7JzTKXpqcIalkjlrtAC5mvwHUGT
 0TPEZl/mXMksu74N9Sa4W+Uy1yZ8cEueUqHhhcPWHOtvRB0U2OX8if2quy9SZXA9NOY1XCmbv
 2rHw7sH85k9qZBWLUhlFaC7WsuntW5tthm2tatB4Cmxy4Y76I6KCKV6jKt0w0UxB+jIhWTHVE
 HsaETklA4cm0pV9MXnv0JWIFxF32qtTxOsQOUHfwwQ2orVfim5039cWT8Ht9vSMZIEe4eZCAe
 0cgJS9puH3IBI847GsMA9ezpcinjBWcc0W2zftyK/7ZheTc/BgDsrbcfCuwTBRSxm2GijwLfJ
 XW0FpqFR39e10RKieyC53ef+ZmKXqcQjxhtZSxRgmpmtq8uV92gmEd8fU3nAXgI/usmfsnZbh
 sbFPixKu6eivTjLbM38uU1Rs6R/WyFVtiPPcd7HCpumIYRwAvt2DO546/harWcxLCXNHnubWu
 QQRFb5Frg6GJEe/AtF/kTq4d9FZKryVh6P4Y1bhYUUwMw+3yFdK0mL9kQLRLLdHiR9oTIcC3R
 itHnN7cm6+Yaa3pzwfqarz+9Qn0RUWggx6Z/fbDi9gsWEyTyt8xFF3r4tV/hZYZ7X+l5vqyRu
 /eg/kuN7/twAWxK7a+C+Iwfg==
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

On 8/1/24 22:34, Christophe JAILLET wrote:
> If an error occurs after request_mem_region(), a corresponding
> release_mem_region() should be called, as already done in the remove
> function.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I've applied it as-is (with the Fixes tag) to the fbdev git tree.
Thank you, Christophe!

Helge

> ---
> *Not* even compile tested only.
> It is provided as-is
>
> Changes in v2:
>    - Apply a minimal change   [Helge Deller]
>
> v1: https://lore.kernel.org/all/dc4fe3d857849ac63131c5620f1bacf1a3d7172e=
.1722191367.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/video/fbdev/hpfb.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
> index 66fac8e5393e..a1144b150982 100644
> --- a/drivers/video/fbdev/hpfb.c
> +++ b/drivers/video/fbdev/hpfb.c
> @@ -345,6 +345,7 @@ static int hpfb_dio_probe(struct dio_dev *d, const s=
truct dio_device_id *ent)
>   	if (hpfb_init_one(paddr, vaddr)) {
>   		if (d->scode >=3D DIOII_SCBASE)
>   			iounmap((void *)vaddr);
> +		release_mem_region(d->resource.start, resource_size(&d->resource));
>   		return -ENOMEM;
>   	}
>   	return 0;

