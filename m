Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B43E1EA4E1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 15:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FE489FE8;
	Mon,  1 Jun 2020 13:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BAB89FE8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601132515euoutp01f96633f074e909395d7cdf7ad4f92567~Ubl1bHbim2284122841euoutp01h
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200601132515euoutp01f96633f074e909395d7cdf7ad4f92567~Ubl1bHbim2284122841euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591017915;
 bh=8vJu5WoSJc1bPlFRS2kAudUcVnFFPbiM6d2gECaeE2A=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=FewkuPVOViSeylJfXcwjWoiaBI70QjGFRR6dC8t2ljtmVvWd5v4VE/h+1GpEXYWHP
 KJf69YjByKG7A65Ef+aptQwsH6PYOVCTD891T2Hff5BBZ7FGJF0Hczp2S+xgdvcCfb
 JcAnE2oJMLk31SlEvNiiWSBg/S58JbO1A2bcmrzg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200601132515eucas1p227402478c49b1fea20831ef25e9d469e~Ubl1USyP92098120981eucas1p2n;
 Mon,  1 Jun 2020 13:25:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 35.33.60679.BB105DE5; Mon,  1
 Jun 2020 14:25:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200601132514eucas1p14257ed00a14e2c2b285e30099cc283ce~Ubl0jF8XG1280112801eucas1p1h;
 Mon,  1 Jun 2020 13:25:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200601132514eusmtrp11c2bb965cd5055cf7ae19bf083709249~Ubl0iVzos2270722707eusmtrp1V;
 Mon,  1 Jun 2020 13:25:14 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-35-5ed501bbe442
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1C.DB.08375.AB105DE5; Mon,  1
 Jun 2020 14:25:14 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200601132514eusmtip15d4f8e602708b33e993ba077aeb98600~Ubl0NBAbr0583405834eusmtip1i;
 Mon,  1 Jun 2020 13:25:14 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3] console: newport_con: fix an issue about leak
 related system resources
To: Dejin Zheng <zhengdejin5@gmail.com>
Message-ID: <f1533c61-d112-35a2-a5f3-d6fae596b335@samsung.com>
Date: Mon, 1 Jun 2020 15:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200423164251.3349-1-zhengdejin5@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zk7O5Nmx2n5YlI2u4OX1B+HLnbBH6NfEf3IwMt0h2m6TTZ1
 WURLS22aOUXEYRcM1KzUZug2iWKjVg2XppmZZohGTqfhNMrMch4l/z3v87zP9zwvfCQmbOcG
 kemKbEalkGSKCB+8/eUvZ1gnep8YWTMeRJsbS3n0RLkN0X3zMwRdcK+FoF+VfefSvZZagm4z
 VmG0ZfQjdpQUmw3DPPG008kTP7v1kCceKbFzxP1v55HYY9x6kjjrc0jKZKbnMqqI2GSfNFv+
 EJF1Lfh8v1aPa5F9sw7xSaBi4HdPHUeHfEgh1YhgqsOIs8McAoPxOcYOHgStFVp8zVJhHiBY
 oQHB4BU9Ygc3gs6paa53i6AOgL6oCXmxP5UMA839PC8OoHZDzdWbKxkY5UQwUagjvIKAioU2
 j3vZQJI4tQN+3E3x0puoMzD7xcZlV/zgdc3YSgv+8vuWkaUVK0YFwuDYHQ6Lt0GHu3alNlBW
 How9fcNja8dB6YgdY7E/uOxPVvlgcFSW4qyhGcGf4m+r7g4EDZVsBFAHYci5QHjbYdReaLFE
 sPQxqC93YV4aKF8YcPuxJXyhor16lRZAcaGQ3d4FrfWtxFqsznwfK0ciw7rTDOvOMaw7x/A/
 9y7Cm1Agk6OWyxh1lILRhKslcnWOQhaeqpQb0fJvcizZ50zIsphiRRSJRBsE5GhfopAryVXn
 ya0ISEwUIDje5UgUCqSSvAuMSpmkyslk1Fa0hcRFgYLouokEISWTZDMZDJPFqNZUDskP0qJz
 o8zsjfSa67pTohcli8JhJjUjtK/LEacpmjxBQINC2fN1p3N8pnj77Z8Xcz886i6kH/MLql0x
 mr/d8ap6W0iqUhofLeveWKbRR2r5HtNwqOIzJyZEGRa1p53rOjyzMNlfx3nnJ/10mTEE9eYf
 OZ0Uar0UbEpoHKwyPWirrhfh6jTJ/n2YSi35B6BxbF5JAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7q7GK/GGXR8U7PYuaKH3eLlhMOM
 Fle+vmezaF68ns3iRN8HVovLu+awWWzeNJXZYtejm8wOHB47Z91l93h37hy7x/65a9g97ncf
 Z/K4dv4ro8fnTXIBbFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2Nimp
 OZllqUX6dgl6GYeb7rAVtMpUXGuYyNLAeFysi5GTQ0LARGLSzhtsXYxcHEICSxkl9m24zNjF
 yAGUkJE4vr4MokZY4s+1Lqia14wSZ9YuZQRJsAlYSUxsXwVmCwskSDxZ8Y4ZxBYRUJeY2dLP
 AtLALHCOUeL2t0uMEN29jBK/9+4D6+AVsJPY/Pkt2DYWARWJbwuSQMKiAhESh3fMgioRlDg5
 8wkLiM0JtGzX/X9sIDYz0II/8y4xQ9jiEreezGeCsOUltr+dwzyBUWgWkvZZSFpmIWmZhaRl
 ASPLKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMBI3Hbs5+YdjJc2Bh9iFOBgVOLh3XD/SpwQ
 a2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGaAv02kVlKNDkfmCTySuINTQ3N
 LSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwVj2vaiu+dMJl9i7FTIUTf40/
 zz3AtSZ34ay/dUt/rw9mSb0/j5HT26Enip3jKlfqJY7HVTEbcz4v/lm06/4fC625Nle2nTbf
 cKAl6ur7IPngX/P/cfyw6bWxy3v9Nu3XDnGbVtHZOxarsId3fl9Ulut/jvX0m4qCh6fbDm7s
 VXP9Vuiv+kZLVImlOCPRUIu5qDgRAJeWBoLaAgAA
X-CMS-MailID: 20200601132514eucas1p14257ed00a14e2c2b285e30099cc283ce
X-Msg-Generator: CA
X-RootMTR: 20200423164300eucas1p286ebc9584639c8e8b6311dbf10355808
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200423164300eucas1p286ebc9584639c8e8b6311dbf10355808
References: <CGME20200423164300eucas1p286ebc9584639c8e8b6311dbf10355808@eucas1p2.samsung.com>
 <20200423164251.3349-1-zhengdejin5@gmail.com>
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
Cc: akpm@osdl.org, linux-fbdev@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/23/20 6:42 PM, Dejin Zheng wrote:
> A call of the function do_take_over_console() can fail here.
> The corresponding system resources were not released then.
> Thus add a call of iounmap() and release_mem_region()
> together with the check of a failure predicate. and also
> add release_mem_region() on device removal.
> 
> Fixes: e86bb8acc0fdc ("[PATCH] VT binding: Make newport_con support binding")
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> v2 -> v3:
> 	- modify commit tag CC to Cc by Andy's suggestion.
> 	- modify Subject 'console: console:' to 'console: newport_con:'
> 	  by Bartlomiej's suggestion.
> 	- add missing release_mem_region() on error and on device removal
> 	  by Bartlomiej's suggestion.
> 	- add correct fixes commit, before this patch, add a wrong 'Fixes:
> 	  e84de0c6190503 ("MIPS: GIO bus support for SGI IP22/28")'
> 	  thanks Bartlomiej again!
> 
> v1 -> v2:
> 	- modify the commit comments. The commit comments have some more
> 	  appropriate instructions by Markus'suggestion. here is my first
> 	  version commit comments:
> 
> 	  if do_take_over_console() return an error in the newport_probe(),
> 	  due to the io virtual address is not released, it will cause a
> 	  leak.
> 	 
>  drivers/video/console/newport_con.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
> index 00dddf6e08b0..2d2ee17052e8 100644
> --- a/drivers/video/console/newport_con.c
> +++ b/drivers/video/console/newport_con.c
> @@ -32,6 +32,8 @@
>  #include <linux/linux_logo.h>
>  #include <linux/font.h>
>  
> +#define NEWPORT_LEN	0x10000
> +
>  #define FONT_DATA ((unsigned char *)font_vga_8x16.data)
>  
>  /* borrowed from fbcon.c */
> @@ -43,6 +45,7 @@
>  static unsigned char *font_data[MAX_NR_CONSOLES];
>  
>  static struct newport_regs *npregs;
> +static unsigned long newport_addr;
>  
>  static int logo_active;
>  static int topscan;
> @@ -702,7 +705,6 @@ const struct consw newport_con = {
>  static int newport_probe(struct gio_device *dev,
>  			 const struct gio_device_id *id)
>  {
> -	unsigned long newport_addr;
>  	int err;
>  
>  	if (!dev->resource.start)
> @@ -712,7 +714,7 @@ static int newport_probe(struct gio_device *dev,
>  		return -EBUSY; /* we only support one Newport as console */
>  
>  	newport_addr = dev->resource.start + 0xF0000;
> -	if (!request_mem_region(newport_addr, 0x10000, "Newport"))
> +	if (!request_mem_region(newport_addr, NEWPORT_LEN, "Newport"))
>  		return -ENODEV;
>  
>  	npregs = (struct newport_regs *)/* ioremap cannot fail */
> @@ -720,6 +722,11 @@ static int newport_probe(struct gio_device *dev,
>  	console_lock();
>  	err = do_take_over_console(&newport_con, 0, MAX_NR_CONSOLES - 1, 1);
>  	console_unlock();
> +
> +	if (err) {
> +		iounmap((void *)npregs);
> +		release_mem_region(newport_addr, NEWPORT_LEN);
> +	}
>  	return err;
>  }
>  
> @@ -727,6 +734,7 @@ static void newport_remove(struct gio_device *dev)
>  {
>  	give_up_console(&newport_con);
>  	iounmap((void *)npregs);
> +	release_mem_region(newport_addr, NEWPORT_LEN);
>  }
>  
>  static struct gio_device_id newport_ids[] = {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
