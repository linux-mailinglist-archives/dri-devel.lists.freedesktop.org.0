Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1521B86A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970386EC65;
	Fri, 10 Jul 2020 14:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EEF6E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710142350euoutp01171e60901e4b2085d72c16faffbe1e38~gajHcFIMf3221032210euoutp01S
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710142350euoutp01171e60901e4b2085d72c16faffbe1e38~gajHcFIMf3221032210euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594391030;
 bh=wcpS6k1Ykt1y3vnMIGbauUhd3FyRkq8edvSKpMqac04=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=BCYLSUAKMBuCMWrwAMpQMyHDawNMKi2TMthPqhWzVQ1McvzHpMQjRPAMXiLEa8Wng
 EuiQ7y4kp/HHkNFBZ/NTeHhBDFo4sEVSCoGXBnyj7N/c+Xp/1tWrF8tJxcqc0lroox
 HdX4G+mESgJ5/MF0A9DffZHZ55cI6k5XD14uTtG0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710142350eucas1p22dd75b74c7b7bb7dd538746b11f5f728~gajHIPpTw0258502585eucas1p2y;
 Fri, 10 Jul 2020 14:23:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E7.DE.06318.5F9780F5; Fri, 10
 Jul 2020 15:23:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200710142349eucas1p2647e00300bd484a6a9ed420edd413cec~gajGvOVPI2124221242eucas1p2m;
 Fri, 10 Jul 2020 14:23:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710142349eusmtrp18952350534ee1fdde875ed88396fccf9~gajGunFG21135411354eusmtrp1R;
 Fri, 10 Jul 2020 14:23:49 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-34-5f0879f5cf4b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C9.D1.06314.5F9780F5; Fri, 10
 Jul 2020 15:23:49 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200710142349eusmtip2c3083710e4fe2af3f9ed9e208a861761~gajGNqE-z1081610816eusmtip2J;
 Fri, 10 Jul 2020 14:23:49 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: neofb: fix memory leak in neo_scan_monitor()
To: Evgeny Novikov <novikov@ispras.ru>
Message-ID: <c07a27c2-3171-3f3a-6029-ef523cf889c4@samsung.com>
Date: Fri, 10 Jul 2020 16:23:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200630195451.18675-1-novikov@ispras.ru>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUgUYRjG+XZmZ8elsc/V8M0sYSEhQU0MHFKkw2r/iqygEkrXHFbLqx2P
 NogWytTdCNPy2Cw3tSwLNS0vTPMoL1TUSo1NU0xSsSJTyGPJcZT87/me9/e8B3w0oWiWOtER
 0XGcNlodqaTkZOX7v93u8zo6eHdRrYTNLX1BsY9GvxDsh7mfFFtnmUZskdFAsm23f0nZ/tpc
 ii2o18vYwbt6ap+N6s28mVQV1E1KVNnWe0jVlr1IqtLy3yKVZXpZqhoxtkpUs+U7jtFBcr8w
 LjIigdN6+ofIw18PVKDYVvnlVGumTI/6aAOyoQHvgaUUK2VAclqBnyIY6CuVio8/CHIqCimB
 UuBZBMPXA9YTnekWiQgVIXjQnSQToRkEc1kaQVN4L9xJLkaCtseBUGh6uNrIAbuCPqmdFMIE
 Nksgo/HxKsRgf2iobFiFSLwTJgaMUkFvwafh99dmqcjYQXvO+EqYpm2wDww9txNsAjvC5/E8
 iahdoGomlxD6Ax6WQc90tlTcOgAm9GZK1PYw1fpKJmpn6My4RYqBEgTLKd/X0lUIijKsawlf
 sHQvUMJkAu+C0lpP0d4PN4xjMsEGbAuDM2sL2UJ6ZRYh2gyk3FSItCuUPSmj1scaap4RaUhp
 2nCZacM5pg3nmP7PNSOyGDly8XyUhuO9o7lED14dxcdHazzOx0SVo5Wv1WltnatG9UuhTQjT
 SLmJMavpYIVUncDropoQ0ITSgTnQ1XlOwYSpdVc4bUywNj6S45vQNppUOjLe+ZNnFVijjuMu
 clwsp12vSmgbJz1K3dpiVz7geyRzsWWwbsqbeXmNmp9PPGNf3TPqd7j+eFqw+7fGCz+4g85O
 y4E+HcmBhG+SrlgSmlMc4eE+cvSdf8l076c8VmYJKRgzgEui/ONmI0OMBnVphzoOufG6wK6l
 q5cYL/l215qJE3R/04zXfU3Lyd7eheEea/ijU2MKJcmHq73cCC2v/gezN+VwVgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7pfKzniDZ5NVrGYs34Nm8XCh3eZ
 La58fc9msefOa0aL5d1dLBYn+j6wWlzeNYfNYvG+BnaLG1Ma2Bw4PfZ+W8DisXjPSyaPGf+m
 MnqcmPGbxWPCogOMHnde/2X1uN99nMnj8ya5AI4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
 E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyt1zczFhznquj8N429gfESRxcjJ4eEgInE6Ul3
 mLoYuTiEBJYySqz/dp+9i5EDKCEjcXx9GUSNsMSfa11sEDWvGSWmvF7OCpJgE7CSmNi+ihHE
 FhYIlFgyax4biC0ioCbR0HqSBaSBWWABk8SBjyuhursYJfY92AVWxStgJ7F/234wm0VAVeLZ
 9W6wqaICERKHd8xihKgRlDg58wkLyEWcAuYSN1cLgoSZBdQl/sy7xAxhi0vcejKfCcKWl9j+
 dg7zBEahWUi6ZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzEC43TbsZ+b
 dzBe2hh8iFGAg1GJh3dBIke8EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8x
 mgL9NpFZSjQ5H5hC8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
 MHq9M726e2raUeHNeiKZmfb6n/W/cMbnMn591b3u/G2tt73bAn9e2tYotWDuo9c+Xod7soxl
 eTWXNbktyE+UZF14P2z+DLOHMX5f6hRPrt9412ka5zuv65xNzxwnc63foHVxe0Z9VUnFpXP/
 2RalawXHvdgQnfTtx+otYhtauHqZt92plP1+8L4SS3FGoqEWc1FxIgBb5kyh6QIAAA==
X-CMS-MailID: 20200710142349eucas1p2647e00300bd484a6a9ed420edd413cec
X-Msg-Generator: CA
X-RootMTR: 20200630195458eucas1p2fc508a96f648c8af44d5ed5ff906a103
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200630195458eucas1p2fc508a96f648c8af44d5ed5ff906a103
References: <CGME20200630195458eucas1p2fc508a96f648c8af44d5ed5ff906a103@eucas1p2.samsung.com>
 <20200630195451.18675-1-novikov@ispras.ru>
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
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mike Rapoport <rppt@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/30/20 9:54 PM, Evgeny Novikov wrote:
> neofb_probe() calls neo_scan_monitor() that can successfully allocate a
> memory for info->monspecs.modedb and proceed to case 0x03. There it does
> not free the memory and returns -1. neofb_probe() goes to label
> err_scan_monitor, thus, it does not free this memory through calling
> fb_destroy_modedb() as well. We can not go to label err_init_hw since
> neo_scan_monitor() can fail during memory allocation. So, the patch frees
> the memory directly for case 0x03.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/neofb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
> index f5a676bfd67a..09a20d4ab35f 100644
> --- a/drivers/video/fbdev/neofb.c
> +++ b/drivers/video/fbdev/neofb.c
> @@ -1819,6 +1819,7 @@ static int neo_scan_monitor(struct fb_info *info)
>  #else
>  		printk(KERN_ERR
>  		       "neofb: Only 640x480, 800x600/480 and 1024x768 panels are currently supported\n");
> +		kfree(info->monspecs.modedb);
>  		return -1;
>  #endif
>  	default:
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
