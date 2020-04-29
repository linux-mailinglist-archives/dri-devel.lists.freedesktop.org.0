Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A71BDC10
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 14:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAABF8994D;
	Wed, 29 Apr 2020 12:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD006EAA3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:26:21 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TCJg04100013;
 Wed, 29 Apr 2020 12:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=G4T1e0Zu5w17lAkgEzo9mQq+TIDEuIlWIBxxTVixN+0=;
 b=mrEkFjIN2dsubqvlOyU9teA2iauOOA1kWYCl/UD12g5OblLFdVciyoDXOkGZN5ZaWQnV
 KC80T8wDmrH9jQNU3Lw9Il7BYApSGpdYYqNkO1llGWgAEszEtwNhky4hEZmBT7vKARi+
 uxpAwvmjwCJFTpoEnv+tcQuhIPCdlDsKxZ1adAs7ha1sgzn4Cn39OKxn5qIXOrpWoIDx
 HnwSU5WY4NrDVsGYep9Qnn5qFUWyXkYCYC+TgEw9zIB6nxRsJf5NbXqrraz6E/kK9LIO
 iYiQYyvpW+89DXkkH+6ipAbYG3pixgOMhSX97DaUbgQfAX3IcVlf0Ic2uutg8EI0L1XH Zg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 30p01nuwqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 12:25:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TCGj3w058297;
 Wed, 29 Apr 2020 12:25:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 30mxpjw1q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 12:25:54 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03TCPlRN013991;
 Wed, 29 Apr 2020 12:25:47 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 Apr 2020 05:25:47 -0700
Date: Wed, 29 Apr 2020 15:25:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] video: fbdev: pxa3xx_gcu: Fix some resource leak in an
 error handling path in 'pxa3xx_gcu_probe()'
Message-ID: <20200429122538.GO2014@kadam>
References: <20200429043438.96212-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429043438.96212-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=2
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=2 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004290105
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
Cc: linux-fbdev@vger.kernel.org, eric.y.miao@gmail.com, arnd@arndb.de,
 b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhenzhong.duan@gmail.com, daniel@caiaq.de,
 mpe@ellerman.id.au, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 06:34:38AM +0200, Christophe JAILLET wrote:
> If an error occurs in the loop where we call 'pxa3xx_gcu_add_buffer()',
> any resource already allocated should be freed.
> 
> In order to fix it, add a call to 'pxa3xx_gcu_free_buffers()' in the error
> handling path, as already done in the remove function.
> 
> Fixes: 364dbdf3b6c3 ("video: add driver for PXA3xx 2D graphics accelerator")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/video/fbdev/pxa3xx-gcu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3xx-gcu.c
> index 4279e13a3b58..68d9c7a681d4 100644
> --- a/drivers/video/fbdev/pxa3xx-gcu.c
> +++ b/drivers/video/fbdev/pxa3xx-gcu.c
> @@ -675,6 +675,7 @@ static int pxa3xx_gcu_probe(struct platform_device *pdev)
>  
>  err_disable_clk:
>  	clk_disable_unprepare(priv->clk);
> +	pxa3xx_gcu_free_buffers(dev, priv);

The error handling in this function makes no sense and is buggy.  It
should be that it unwinds in the reverse order from the allocation.  The
goto should be "goto free_most_recently_allocated_resource;".  Since the
unwind is done in the wrong order it causes a couple bugs.

These buffers are the last thing which we allocated so they should be
the first thing which we free.  In this case, calling
pxa3xx_gcu_free_buffers() before the buffers are allocated is confusing
but harmless.  The clk_disable_unprepare() is done on some paths where
the clock was not enabled and that will trigger a WARN() so that's a
bug.  Syzcaller will complain and if you have reboot on WARN then it's
annoying.

The second bug is that we don't deregister the misc device or release
the DMA memory on failure when we allocate the buffers in the loop.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
