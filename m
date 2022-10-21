Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C27606F8D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 07:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB26A10E1B0;
	Fri, 21 Oct 2022 05:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E00A10E5C7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 05:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666330964;
 bh=HqtILfRl3OtBhy475GM5r0NjKFQPRHcClOGgl4juyvM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Shziw3rqc889iruEsHA1ZsPKmtgDwSEXXHwipyJRGwOa4ftwxToHAsovRUe+fVZRF
 35SwXnjim/scTmkZalPzm+upjOeXn/Aqx1XxH+Vv+IdugyjLKRbu4OYfwhD11byinN
 gQjQnvLgy5TMHVhwhPK9KtadL90Z4N8QV3V6THPM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.94]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42nS-1olkip2K7E-00040o; Fri, 21
 Oct 2022 07:37:31 +0200
Message-ID: <b01674d2-07f6-f94e-9a7f-b8d43055728b@gmx.de>
Date: Fri, 21 Oct 2022 07:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] video: fbdev: smscufx: Fixed several use-after-free
 bugs
Content-Language: en-US
To: Hyunwoo Kim <imv4bel@gmail.com>, steve.glendinning@shawell.net
References: <20221021011544.GA339803@ubuntu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221021011544.GA339803@ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NbDtIc/xvHxHrlPsWYs2BR0Q/BmvG+wbS9TUv89KJRmAH07cYz6
 9110l0go/QCMjkSB6dNu2NkOxzrsku3tWL7myRgUdIMiZwOARQ69EEJFlnsLK8AgM0RA7kl
 P9sJQVxcxsBibzPqNNg7rANJpL868ViwXSfpi8zSJh/izUldM4z/9JX4/Dqh6qRmP6F3VMj
 WByL8WH8SscXxW3NFxyZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VFu14rTWrkM=:/6pb0ESLZdkIpSdfSzgaoP
 0c001rjSpGcPBZCRetVg6aEp0jHMc7iMa3Zyj9tM/ar+OsTRW0nwkr+IHXICRvkkCdSJKVVBX
 YKEdVTeELCLf7mqcTvY+aw8LY9WynOyVN2Z3x3+c68ImWUg5bWj+9ELSWBkRxdYFisVOtx7RD
 KH2u3S9vYDr/9xsRYJx80XulYIhoz/2mDf8tDtObm+G3xf0nIFNKa4YdnCAAt0V3wbRbdAKVH
 sYxF3bg+hRqOpuTXhsklUERWR4cFYJYtbRFBccsIEmaU55GDEwME47S/gwFOLeZkNozWPwr8e
 peq/3Mk7yqsbDHiUXanNT0MuUJpu0JpGqDOB7ad7byNMIsT7k2kGwRqObxYs5SUNVgp5fDD6H
 muCU3FFiNWUKFAKCqpiQ0OCgoO6mkouci9OPXQHkfMo3rsazP+Xmom8jwzSNySiZsUIZj6/HA
 A4kA3vHDVaoae4SrmnTs74XPDe1v5ooKM/bpuuILHBL6pTf88vLKTEabUKIiGx2lPuOkxbGU8
 RTc/k7WXs0LFOMexjn46d1Me1MiPrjuejjtV/wZ5TvZyoC6PJB0NMG/oSbVjB6V+iYDr4jpf4
 T39f9zhvBmP4xLh9KflqFYKDdWpRjDaul4F4aV0KzrTOQJQAGRIaPheL/Iy1Z7d0ORenNmOLQ
 S99ZEvSvUEN53ClMh7Cl71r+AaIIDONe9deA50QeR+NzJg2fUZqIgkfwHklJWNG2G+B7skAqZ
 ipnCEaWEpUFFlu/8Fnte8bKppIpFVVhv4PbYcE/4hPN7GLoWS7EJC9RUOBzn/w4zyrdOhYuF0
 s2iAlYuuxvsSxItbj6uXO72pISw2+ERbcW+/J4KRVqZO5y8DcG0/W3/uugEswU+jblPFfgLbn
 cDA3OkBEIFnjsl5vpdbc6Cuod2QntM0ietKXt3Bx0atHtipwuZklC4X4Pmd0FQ6oC0yYvwm07
 CbfTReOdWM+ZLBJxXUOJWi0gXuuwtlodFNAQwFvblDSieE291jPrLG3ivQVesN2KjzNlQRCV1
 1BCIh2j9WyV9BDWuLJo1i46ATGVD8jS8rbxnbJr2gErXEcMHuXkDGMYM2rT2JY1NOHpCMdpra
 tj0zIYALqjSD68Wl3hVYET20wiKVSgsbYnaZBsaSd6Id9LEQjukbRekaHdfzfiVnFATlTvJU8
 nkU5VBSspvfv2pqo26/i9kyCTPkIW1yB52Ef5Vow/Kcaz7fW+jOGDGqMLwQSIwFDB4o6xaPs6
 UfIiEFrrKMtR8axXLlaNsl+2gcqyXUAfim2EvvPb5tMGpc95f+3TnwLy0lNfSCkDM3fe835mi
 q37zJ/rS7cPCXv6Qf+gj0++XnEtw8NZfPJLbyq0+NIP8caAbgKMdbgMm6ipOUAoiuRuZZC0IF
 Qjr9fpPgDKsnsxnesELY2MnRUOuqCokhi9fnYrA6kSC6ZPi+GxYp49MMLvS6ED/VR4ahDrJE2
 JbEABUNNp9qEk/KyWi6u3lMAMIRaZHqlAQzFjftPc3T5qJZTr+LL2XXMvuWgFPvTKCj6S9xTi
 KsVebtvLavVRXLGyxndO+fNQChxQ27nCx+O75Mw9rAPUY
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/22 03:15, Hyunwoo Kim wrote:
> Several types of UAFs can occur when physically removing a USB device.
>
> Adds ufx_ops_destroy() function to .fb_destroy of fb_ops, and
> in this function, there is kref_put() that finally calls ufx_free().
>
> This fix prevents multiple UAFs.
>
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> Link: https://lore.kernel.org/linux-fbdev/20221011153436.GA4446@ubuntu/

applied.
Thanks!
Helge

> ---
> v2:
> The v1 patch fixed several UAFs, but "info" was not kfree()d after the d=
evice
> was removed by calling the framebuffer_release() function from
> ufx_free_framebuffer().
> This is because fb_info->count was not 0 at the time the
> framebuffer_release() function was called.
>
> Moved the framebuffer_release() function to the ufx_ops_destory() functi=
on.
> The ufx_ops_destory() function is a .fb_destory ops that is called
> after fb_info->count goes to zero.
> ---
>   drivers/video/fbdev/smscufx.c | 55 +++++++++++++++++++----------------
>   1 file changed, 30 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx=
.c
> index e65bdc499c23..9343b7a4ac89 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -97,7 +97,6 @@ struct ufx_data {
>   	struct kref kref;
>   	int fb_count;
>   	bool virtualized; /* true when physical usb device not present */
> -	struct delayed_work free_framebuffer_work;
>   	atomic_t usb_active; /* 0 =3D update virtual buffer, but no usb traff=
ic */
>   	atomic_t lost_pixels; /* 1 =3D a render op failed. Need screen refres=
h */
>   	u8 *edid; /* null until we read edid from hw or get from sysfs */
> @@ -1117,15 +1116,24 @@ static void ufx_free(struct kref *kref)
>   {
>   	struct ufx_data *dev =3D container_of(kref, struct ufx_data, kref);
>
> -	/* this function will wait for all in-flight urbs to complete */
> -	if (dev->urbs.count > 0)
> -		ufx_free_urb_list(dev);
> +	kfree(dev);
> +}
>
> -	pr_debug("freeing ufx_data %p", dev);
> +static void ufx_ops_destory(struct fb_info *info)
> +{
> +	struct ufx_data *dev =3D info->par;
> +	int node =3D info->node;
>
> -	kfree(dev);
> +	/* Assume info structure is freed after this point */
> +	framebuffer_release(info);
> +
> +	pr_debug("fb_info for /dev/fb%d has been freed", node);
> +
> +	/* release reference taken by kref_init in probe() */
> +	kref_put(&dev->kref, ufx_free);
>   }
>
> +
>   static void ufx_release_urb_work(struct work_struct *work)
>   {
>   	struct urb_node *unode =3D container_of(work, struct urb_node,
> @@ -1134,14 +1142,9 @@ static void ufx_release_urb_work(struct work_stru=
ct *work)
>   	up(&unode->dev->urbs.limit_sem);
>   }
>
> -static void ufx_free_framebuffer_work(struct work_struct *work)
> +static void ufx_free_framebuffer(struct ufx_data *dev)
>   {
> -	struct ufx_data *dev =3D container_of(work, struct ufx_data,
> -					    free_framebuffer_work.work);
>   	struct fb_info *info =3D dev->info;
> -	int node =3D info->node;
> -
> -	unregister_framebuffer(info);
>
>   	if (info->cmap.len !=3D 0)
>   		fb_dealloc_cmap(&info->cmap);
> @@ -1153,11 +1156,6 @@ static void ufx_free_framebuffer_work(struct work=
_struct *work)
>
>   	dev->info =3D NULL;
>
> -	/* Assume info structure is freed after this point */
> -	framebuffer_release(info);
> -
> -	pr_debug("fb_info for /dev/fb%d has been freed", node);
> -
>   	/* ref taken in probe() as part of registering framebfufer */
>   	kref_put(&dev->kref, ufx_free);
>   }
> @@ -1169,11 +1167,13 @@ static int ufx_ops_release(struct fb_info *info,=
 int user)
>   {
>   	struct ufx_data *dev =3D info->par;
>
> +	mutex_lock(&disconnect_mutex);
> +
>   	dev->fb_count--;
>
>   	/* We can't free fb_info here - fbmem will touch it when we return */
>   	if (dev->virtualized && (dev->fb_count =3D=3D 0))
> -		schedule_delayed_work(&dev->free_framebuffer_work, HZ);
> +		ufx_free_framebuffer(dev);
>
>   	if ((dev->fb_count =3D=3D 0) && (info->fbdefio)) {
>   		fb_deferred_io_cleanup(info);
> @@ -1186,6 +1186,8 @@ static int ufx_ops_release(struct fb_info *info, i=
nt user)
>
>   	kref_put(&dev->kref, ufx_free);
>
> +	mutex_unlock(&disconnect_mutex);
> +
>   	return 0;
>   }
>
> @@ -1292,6 +1294,7 @@ static const struct fb_ops ufx_ops =3D {
>   	.fb_blank =3D ufx_ops_blank,
>   	.fb_check_var =3D ufx_ops_check_var,
>   	.fb_set_par =3D ufx_ops_set_par,
> +	.fb_destroy =3D ufx_ops_destory,
>   };
>
>   /* Assumes &info->lock held by caller
> @@ -1673,9 +1676,6 @@ static int ufx_usb_probe(struct usb_interface *int=
erface,
>   		goto destroy_modedb;
>   	}
>
> -	INIT_DELAYED_WORK(&dev->free_framebuffer_work,
> -			  ufx_free_framebuffer_work);
> -
>   	retval =3D ufx_reg_read(dev, 0x3000, &id_rev);
>   	check_warn_goto_error(retval, "error %d reading 0x3000 register from =
device", retval);
>   	dev_dbg(dev->gdev, "ID_REV register value 0x%08x", id_rev);
> @@ -1748,10 +1748,12 @@ static int ufx_usb_probe(struct usb_interface *i=
nterface,
>   static void ufx_usb_disconnect(struct usb_interface *interface)
>   {
>   	struct ufx_data *dev;
> +	struct fb_info *info;
>
>   	mutex_lock(&disconnect_mutex);
>
>   	dev =3D usb_get_intfdata(interface);
> +	info =3D dev->info;
>
>   	pr_debug("USB disconnect starting\n");
>
> @@ -1765,12 +1767,15 @@ static void ufx_usb_disconnect(struct usb_interf=
ace *interface)
>
>   	/* if clients still have us open, will be freed on last close */
>   	if (dev->fb_count =3D=3D 0)
> -		schedule_delayed_work(&dev->free_framebuffer_work, 0);
> +		ufx_free_framebuffer(dev);
>
> -	/* release reference taken by kref_init in probe() */
> -	kref_put(&dev->kref, ufx_free);
> +	/* this function will wait for all in-flight urbs to complete */
> +	if (dev->urbs.count > 0)
> +		ufx_free_urb_list(dev);
>
> -	/* consider ufx_data freed */
> +	pr_debug("freeing ufx_data %p", dev);
> +
> +	unregister_framebuffer(info);
>
>   	mutex_unlock(&disconnect_mutex);
>   }

