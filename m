Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D02610C1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4B6E1A5;
	Tue,  8 Sep 2020 11:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595A36E1A5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113637euoutp02c158275ad31ae594753bcbd800d78800~yy_Pvqw_J3236032360euoutp02k
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113637euoutp02c158275ad31ae594753bcbd800d78800~yy_Pvqw_J3236032360euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599564997;
 bh=g7yt/gh802lMK87kwMLA1aAaHIAce4gG+d16uN5HNa0=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=KK1ruFIVfQjqYyTM2BN4MLZIk8pEl7mXuTFz2K5SUzy4L/5BYbVxmQilmX3fr3Tpt
 ozqEzJqJp0KriYGeM72zpJmuybb55LEKXodc/ACxXry6bwYoSQcFNv8SQIkBn5NWTD
 kYAyv3uvatVwEVJEk0YhHxRimm8sCGQqwT2tJKq0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200908113637eucas1p2409b0443cef5905ef52bb6e4186bb2f2~yy_PohMiT1606616066eucas1p2z;
 Tue,  8 Sep 2020 11:36:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E3.85.06318.5CC675F5; Tue,  8
 Sep 2020 12:36:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113637eucas1p2ce7559669b4d12d014bd173c8bccfcfb~yy_PWCcqh1614316143eucas1p2u;
 Tue,  8 Sep 2020 11:36:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200908113637eusmtrp13317d04d2c619c9dd0f33c23066d4cfb~yy_PVXEXk2002320023eusmtrp1L;
 Tue,  8 Sep 2020 11:36:37 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-e8-5f576cc58e3c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 16.94.06017.4CC675F5; Tue,  8
 Sep 2020 12:36:36 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113636eusmtip1962799c1cd4830f96aa142e66cfada78~yy_O9_QHe3149531495eusmtip1U;
 Tue,  8 Sep 2020 11:36:36 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: sm712fb: handle ioremap() errors in probe
To: Evgeny Novikov <novikov@ispras.ru>
Message-ID: <1b60fc78-41bd-b967-bb9a-86f2812fc413@samsung.com>
Date: Tue, 8 Sep 2020 13:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200713080532.15504-1-novikov@ispras.ru>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djPc7pHc8LjDb7PErW48vU9m8Xy7i4W
 ixN9H1gtLu+aw2axeF8Du8WB01OYLdYs2cPowO6xc9Zddo8Z/6Yyetx5/ZfV4373cSaP5/ef
 snl83iQXwBbFZZOSmpNZllqkb5fAlTHxRj9LwUSuiqOvmlkaGKdydDFyckgImEjMnLeHqYuR
 i0NIYAWjxLfWnVDOF0aJxWf2MUI4nxkl9v//x97FyAHWsmaLMUR8OaPEy6UzoDreMkos2zqJ
 DWQum4CVxMT2VYwgtrCAq8TVf0dYQWwRATWJhtaTLCA2s8BtRom9T9VAbF4BO4k7W1pZQBaw
 CKhI/DqsChIWFYiQ+PTgMCtEiaDEyZlPwFo5Bcwlfm/cCzVGXOLWk/lMELa8xPa3c5hB7pEQ
 2McusenhBFaIP10k+nfsZYewhSVeHd8CZctInJ7cwwLRsI5R4m/HC6ju7YwSyyf/Y4Oospa4
 c+4XG8h1zAKaEut36UNCwlHi4Zp4CJNP4sZbQYgb+CQmbZvODBHmlehoE4KYoSaxYdkGNpit
 XTtXMk9gVJqF5LNZSL6ZheSbWQhrFzCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhM
 Raf/Hf+6g3Hfn6RDjAIcjEo8vB6+YfFCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8q
 zUktPsQozcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNTqoFxzl/OXpmY1LqWcxt0u9jOudzb
 W/6W47Ki2+UXYfK3f65Lf+/lENbyqenhXh7HkCmTyrY3z2Xb86DMPvSQ7pUWUeuVcz2ZX/+d
 uf0ES+n1a70nVjwKnLZg1x2+a3fvFrLd2zP574nprZe1Trd2LTDMNWIWW6TjyFmg49dfWPqW
 dYGNoMWh+luGSizFGYmGWsxFxYkAYGmsD0EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xu7pHcsLjDX7ttrG48vU9m8Xy7i4W
 ixN9H1gtLu+aw2axeF8Du8WB01OYLdYs2cPowO6xc9Zddo8Z/6Yyetx5/ZfV4373cSaP5/ef
 snl83iQXwBalZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqk
 b5eglzHxRj9LwUSuiqOvmlkaGKdydDFycEgImEis2WLcxcjFISSwlFFi+7kFLBBxGYnj68u6
 GDmBTGGJP9e62CBqXjNK3D+whgkkwSZgJTGxfRUjiC0s4Cpx9d8RVhBbREBNoqH1JAtIA7PA
 bUaJ1lWvGSG6uxglDr2fA9bNK2AncWdLK9g2FgEViV+HVUHCogIREod3zGKEKBGUODnzCQuI
 zSlgLvF7414wm1lAXeLPvEvMELa4xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiy
 ilEktbQ4Nz232EivODG3uDQvXS85P3cTIzD6th37uWUHY9e74EOMAhyMSjy8H7zC4oVYE8uK
 K3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnAxJBXEm9oamhuYWlo
 bmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGx3unaoismCw89aGv8INMSvMfWzDEz
 P5upKqfIajmXb8ynn6tTY1Z96c6qaDUKlTyub3nu8kU1k8k7H02r2nwkuGZ3kcjkygDH+fJ/
 4r7++M3DkDHp9MdjafqG+4++U2z9+GtTbJoDT8mriKjI5Seesyn9kOt6+XOmgZ5gyTzfyK3d
 fEGRSauVWIozEg21mIuKEwGmRP+r1AIAAA==
X-CMS-MailID: 20200908113637eucas1p2ce7559669b4d12d014bd173c8bccfcfb
X-Msg-Generator: CA
X-RootMTR: 20200713080538eucas1p15f1739af7b66fbb88987aeb6bdaca4f4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200713080538eucas1p15f1739af7b66fbb88987aeb6bdaca4f4
References: <CGME20200713080538eucas1p15f1739af7b66fbb88987aeb6bdaca4f4@eucas1p1.samsung.com>
 <20200713080532.15504-1-novikov@ispras.ru>
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
Cc: ldv-project@linuxtesting.org, linux-fbdev@vger.kernel.org,
 Teddy Wang <teddy.wang@siliconmotion.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/13/20 10:05 AM, Evgeny Novikov wrote:
> smtcfb_pci_probe() does not handle ioremap() errors for case 0x720. The
> patch fixes that exactly like for case 0x710/2.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Applied to drm-misc-next tree, thanks and sorry for the delay.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/sm712fb.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
> index 6a1b4a853d9e..0171b23fa211 100644
> --- a/drivers/video/fbdev/sm712fb.c
> +++ b/drivers/video/fbdev/sm712fb.c
> @@ -1602,6 +1602,14 @@ static int smtcfb_pci_probe(struct pci_dev *pdev,
>  		sfb->fb->fix.mmio_start = mmio_base;
>  		sfb->fb->fix.mmio_len = 0x00200000;
>  		sfb->dp_regs = ioremap(mmio_base, 0x00200000 + smem_size);
> +		if (!sfb->dp_regs) {
> +			dev_err(&pdev->dev,
> +				"%s: unable to map memory mapped IO!\n",
> +				sfb->fb->fix.id);
> +			err = -ENOMEM;
> +			goto failed_fb;
> +		}
> +
>  		sfb->lfb = sfb->dp_regs + 0x00200000;
>  		sfb->mmio = (smtc_regbaseaddress =
>  		    sfb->dp_regs + 0x000c0000);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
