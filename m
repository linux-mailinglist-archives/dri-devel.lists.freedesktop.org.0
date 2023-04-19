Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A576E729F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 07:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A2210E07B;
	Wed, 19 Apr 2023 05:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F51810E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 05:28:11 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id p0MRpZaTeV6zQp0MSpuMmN; Wed, 19 Apr 2023 07:28:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
 s=t20230301; t=1681882089;
 bh=jC61ievN8K0lZul4ppyD2rNmFatQL2HAWgkWwqbudT8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=TNshuw7F7d0G7Paxh6aHXOd6LSAqwbWrBaZePemtxzGdjyuWE40w23q+dyxZWNAFT
 IMgiYRkp30RpW2ME6YXV9mno+wtjdYC/TD0vOZgAv/x5PsvWYvguzVWccLP+EJL4V+
 wfS5fnGA1rwmLzmpR77uJU4JzByxFGmRZKNG5P0Z2rtigu+iZv7U9onUWUTVzTXgZY
 /ab7ij2IhImZVKq1p5pRPHkIGZUUOTsqWvKng8djZrWwO8NUVmdrMFZRL6uMwRvpP9
 XOn/IaJYqsc4FITkpSAPFThgEpUzdaRfy+KQh/kBWefttthUH+mTYXZTh3XyFynBoW
 EYDLKZjulzleA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 19 Apr 2023 07:28:09 +0200
X-ME-IP: 86.243.2.178
Message-ID: <5f749397-d701-a83c-757b-cad38f74735f@wanadoo.fr>
Date: Wed, 19 Apr 2023 07:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] video: fbdev: mmp: Fix deferred clk handling in
 mmphw_probe()
To: Dan Carpenter <error27@gmail.com>
References: <685f452cacc74f4983aaff2bc28a02a95e8aa8b7.1681414375.git.christophe.jaillet@wanadoo.fr>
 <67353089-4966-424c-99c2-8524818f0e37@kili.mountain>
 <a7c75eb0-857c-4755-aa23-0a4a96a6d2ca@kili.mountain>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <a7c75eb0-857c-4755-aa23-0a4a96a6d2ca@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 19/04/2023 à 06:59, Dan Carpenter a écrit :
> On Sat, Apr 15, 2023 at 04:09:03PM +0300, Dan Carpenter wrote:
>> On Thu, Apr 13, 2023 at 09:33:17PM +0200, Christophe JAILLET wrote:
>>> When dev_err_probe() is called, 'ret' holds the value of the previous
>>> successful devm_request_irq() call.
>>> 'ret' should be assigned with a meaningful value before being used in
>>> dev_err_probe().
>>>
>>> While at it, use and return "PTR_ERR(ctrl->clk)" instead of a hard-coded
>>> "-ENOENT" so that -EPROBE_DEFER is handled and propagated correctly.
>>>
>>> Fixes: 81b63420564d ("video: fbdev: mmp: Make use of the helper function dev_err_probe()")
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>
>> Presumably you already wrote a Coccinelle script for this but I've added
>> it to Smatch as well.

No I haven't.
I've spotted it while looking at some devm_clk_get_optional() candidate 
with grep.

	git grep -A5 devm_clk_get | grep -B5 ENOENT

Not perfect, but sometimes this kind of approach can find interesting 
things coccinelle would miss.

As an example, the bitmap_alloc patch on sh4 was found this way, with grep.



So nice to have it in smatch, ;-)

CJ

> 
> Here is this warning:
> drivers/video/fbdev/mmp/hw/mmp_ctrl.c:518 mmphw_probe() warn: passing zero to 'dev_err_probe'
> 
> Other warnings.  All five are interesting.
> drivers/power/supply/rt9467-charger.c:1026 rt9467_request_interrupt() warn: passing zero to 'dev_err_probe'
> drivers/pci/controller/dwc/pcie-bt1.c:601 bt1_pcie_add_port() warn: passing zero to 'dev_err_probe'
> drivers/spi/spi-sprd-adi.c:570 sprd_adi_probe() warn: passing zero to 'dev_err_probe'
> drivers/soc/qcom/icc-bwmon.c:776 bwmon_probe() warn: passing zero to 'dev_err_probe'
> drivers/soc/qcom/icc-bwmon.c:781 bwmon_probe() warn: passing zero to 'dev_err_probe'
> 
> regards,
> dan carpenter
> 
> 

