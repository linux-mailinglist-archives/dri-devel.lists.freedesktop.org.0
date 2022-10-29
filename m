Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A2612488
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 18:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DEB10E2B0;
	Sat, 29 Oct 2022 16:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943AC10E2B0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1667062743; bh=J1bgrue4FzQfvXCeRPMpULExPsewPw2mxW5WXhUrS34=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=mEK29Cne4DZw7q1UQeFkEj1ou/Q1BHFzHoawv+9CnBHjlk8uQTYSDtS5BcpI01XA0
 gquAfeKPjsKWu8IF4nNlFzl/dF+MdC6/IK4PfGf69Hkj/CmgdZWgmvDTYx7km0Hzkv
 w9RlhtdV1dC9l7/TRvAj1qvA3itRedDkfWBEatuc=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP via [213.182.55.206]
 Sat, 29 Oct 2022 18:59:03 +0200 (CEST)
X-EA-Auth: iFTHBoQ44VMyicC5CNr3MBWP3UYzhWBgSNV9J73WhoHOYL5cKCB3XHNxaIZPt8+kOIcfjo9YIv8qEtVLNWOQd0VDQHBHf4aP
Date: Sat, 29 Oct 2022 22:28:58 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y11b0oCmle2pbRel@ubunlion>
References: <Y1vZXUi0Bjiub8HZ@ubunlion>
 <Y1zXIjCe3LGwApWD@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HGDXYKSQfV5d1Pbx"
Content-Disposition: inline
In-Reply-To: <Y1zXIjCe3LGwApWD@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 outreachy@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HGDXYKSQfV5d1Pbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 29, 2022 at 09:32:50AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 28, 2022 at 07:00:05PM +0530, Deepak R Varma wrote:
> > The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
> > based computation such as sizeof(foo)/sizeof(foo[0]) for finding
> > number of elements in an array. Issue identified using coccicheck.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/fbtft/fbtft.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> > index 2c2b5f1c1df3..5506a473be91 100644
> > --- a/drivers/staging/fbtft/fbtft.h
> > +++ b/drivers/staging/fbtft/fbtft.h
> > @@ -231,7 +231,7 @@ struct fbtft_par {
> >  	bool polarity;
> >  };
> >
> > -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> > +#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))
>
> Please please please test-build your patches before sending them out.
> To not do so just wastes reviewer resources :(

Hello Greg,
I did build the .ko files by making the driver/staging/fbtft/ path. I verified
.o and .ko files were built.

I did a make clean just now and was again able to rebuild without any errors.
Please see the attached log file.

Is there something wrong with the way I am firing the build?

Thank you,
./drv

>
> thanks,
>
> greg k-h

--HGDXYKSQfV5d1Pbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="fbtft_build.log"

drv@ubunlion:~/git/kernels/staging$ git show HEAD
commit d7f07b9179428a4b84bcb7a90574edcea8c37fc4 (HEAD -> cocci-patches)
Author: Deepak R Varma <drv@mailo.com>
Date:   Fri Oct 28 18:40:54 2022 +0530

    staging: fbtft: Use ARRAY_SIZE() to get argument count

    The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
    based computation such as sizeof(foo)/sizeof(foo[0]) for finding
    number of elements in an array. Issue identified using coccicheck.

    Signed-off-by: Deepak R Varma <drv@mailo.com>

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 2c2b5f1c1df3..5506a473be91 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -231,7 +231,7 @@ struct fbtft_par {
        bool polarity;
 };

-#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
+#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))

 #define write_reg(par, ...)                                            \
        ((par)->fbtftops.write_register(par, NUMARGS(__VA_ARGS__), __VA_ARGS__))
drv@ubunlion:~/git/kernels/staging$ make M=drivers/staging/fbtft/
drv@ubunlion:~/git/kernels/staging$ make M=drivers/staging/fbtft/ clean
  CLEAN   drivers/staging/fbtft/Module.symvers
drv@ubunlion:~/git/kernels/staging$ make M=drivers/staging/fbtft/
  CC [M]  drivers/staging/fbtft/fbtft-core.o
  CC [M]  drivers/staging/fbtft/fbtft-sysfs.o
  CC [M]  drivers/staging/fbtft/fbtft-bus.o
  CC [M]  drivers/staging/fbtft/fbtft-io.o
  LD [M]  drivers/staging/fbtft/fbtft.o
  CC [M]  drivers/staging/fbtft/fb_agm1264k-fl.o
  CC [M]  drivers/staging/fbtft/fb_bd663474.o
  CC [M]  drivers/staging/fbtft/fb_hx8340bn.o
  CC [M]  drivers/staging/fbtft/fb_hx8347d.o
  CC [M]  drivers/staging/fbtft/fb_hx8353d.o
  CC [M]  drivers/staging/fbtft/fb_hx8357d.o
  CC [M]  drivers/staging/fbtft/fb_ili9163.o
  CC [M]  drivers/staging/fbtft/fb_ili9320.o
  CC [M]  drivers/staging/fbtft/fb_ili9325.o
  CC [M]  drivers/staging/fbtft/fb_ili9340.o
  CC [M]  drivers/staging/fbtft/fb_ili9341.o
  CC [M]  drivers/staging/fbtft/fb_ili9481.o
  CC [M]  drivers/staging/fbtft/fb_ili9486.o
  CC [M]  drivers/staging/fbtft/fb_pcd8544.o
  CC [M]  drivers/staging/fbtft/fb_ra8875.o
  CC [M]  drivers/staging/fbtft/fb_s6d02a1.o
  CC [M]  drivers/staging/fbtft/fb_s6d1121.o
  CC [M]  drivers/staging/fbtft/fb_seps525.o
  CC [M]  drivers/staging/fbtft/fb_sh1106.o
  CC [M]  drivers/staging/fbtft/fb_ssd1289.o
  CC [M]  drivers/staging/fbtft/fb_ssd1305.o
  CC [M]  drivers/staging/fbtft/fb_ssd1306.o
  CC [M]  drivers/staging/fbtft/fb_ssd1325.o
  CC [M]  drivers/staging/fbtft/fb_ssd1331.o
  CC [M]  drivers/staging/fbtft/fb_ssd1351.o
  CC [M]  drivers/staging/fbtft/fb_st7735r.o
  CC [M]  drivers/staging/fbtft/fb_st7789v.o
  CC [M]  drivers/staging/fbtft/fb_tinylcd.o
  CC [M]  drivers/staging/fbtft/fb_tls8204.o
  CC [M]  drivers/staging/fbtft/fb_uc1611.o
  CC [M]  drivers/staging/fbtft/fb_uc1701.o
  CC [M]  drivers/staging/fbtft/fb_upd161704.o
  MODPOST drivers/staging/fbtft/Module.symvers
  CC [M]  drivers/staging/fbtft/fb_agm1264k-fl.mod.o
  LD [M]  drivers/staging/fbtft/fb_agm1264k-fl.ko
  BTF [M] drivers/staging/fbtft/fb_agm1264k-fl.ko
Skipping BTF generation for drivers/staging/fbtft/fb_agm1264k-fl.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_bd663474.mod.o
  LD [M]  drivers/staging/fbtft/fb_bd663474.ko
  BTF [M] drivers/staging/fbtft/fb_bd663474.ko
Skipping BTF generation for drivers/staging/fbtft/fb_bd663474.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_hx8340bn.mod.o
  LD [M]  drivers/staging/fbtft/fb_hx8340bn.ko
  BTF [M] drivers/staging/fbtft/fb_hx8340bn.ko
Skipping BTF generation for drivers/staging/fbtft/fb_hx8340bn.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_hx8347d.mod.o
  LD [M]  drivers/staging/fbtft/fb_hx8347d.ko
  BTF [M] drivers/staging/fbtft/fb_hx8347d.ko
Skipping BTF generation for drivers/staging/fbtft/fb_hx8347d.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_hx8353d.mod.o
  LD [M]  drivers/staging/fbtft/fb_hx8353d.ko
  BTF [M] drivers/staging/fbtft/fb_hx8353d.ko
Skipping BTF generation for drivers/staging/fbtft/fb_hx8353d.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_hx8357d.mod.o
  LD [M]  drivers/staging/fbtft/fb_hx8357d.ko
  BTF [M] drivers/staging/fbtft/fb_hx8357d.ko
Skipping BTF generation for drivers/staging/fbtft/fb_hx8357d.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ili9163.mod.o
  LD [M]  drivers/staging/fbtft/fb_ili9163.ko
  BTF [M] drivers/staging/fbtft/fb_ili9163.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ili9163.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ili9320.mod.o
  LD [M]  drivers/staging/fbtft/fb_ili9320.ko
  BTF [M] drivers/staging/fbtft/fb_ili9320.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ili9320.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ili9325.mod.o
  LD [M]  drivers/staging/fbtft/fb_ili9325.ko
  BTF [M] drivers/staging/fbtft/fb_ili9325.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ili9325.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ili9340.mod.o
  LD [M]  drivers/staging/fbtft/fb_ili9340.ko
  BTF [M] drivers/staging/fbtft/fb_ili9340.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ili9340.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ili9341.mod.o
  LD [M]  drivers/staging/fbtft/fb_ili9341.ko
  BTF [M] drivers/staging/fbtft/fb_ili9341.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ili9341.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ili9481.mod.o
  LD [M]  drivers/staging/fbtft/fb_ili9481.ko
  BTF [M] drivers/staging/fbtft/fb_ili9481.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ili9481.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ili9486.mod.o
  LD [M]  drivers/staging/fbtft/fb_ili9486.ko
  BTF [M] drivers/staging/fbtft/fb_ili9486.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ili9486.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_pcd8544.mod.o
  LD [M]  drivers/staging/fbtft/fb_pcd8544.ko
  BTF [M] drivers/staging/fbtft/fb_pcd8544.ko
Skipping BTF generation for drivers/staging/fbtft/fb_pcd8544.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ra8875.mod.o
  LD [M]  drivers/staging/fbtft/fb_ra8875.ko
  BTF [M] drivers/staging/fbtft/fb_ra8875.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ra8875.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_s6d02a1.mod.o
  LD [M]  drivers/staging/fbtft/fb_s6d02a1.ko
  BTF [M] drivers/staging/fbtft/fb_s6d02a1.ko
Skipping BTF generation for drivers/staging/fbtft/fb_s6d02a1.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_s6d1121.mod.o
  LD [M]  drivers/staging/fbtft/fb_s6d1121.ko
  BTF [M] drivers/staging/fbtft/fb_s6d1121.ko
Skipping BTF generation for drivers/staging/fbtft/fb_s6d1121.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_seps525.mod.o
  LD [M]  drivers/staging/fbtft/fb_seps525.ko
  BTF [M] drivers/staging/fbtft/fb_seps525.ko
Skipping BTF generation for drivers/staging/fbtft/fb_seps525.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_sh1106.mod.o
  LD [M]  drivers/staging/fbtft/fb_sh1106.ko
  BTF [M] drivers/staging/fbtft/fb_sh1106.ko
Skipping BTF generation for drivers/staging/fbtft/fb_sh1106.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ssd1289.mod.o
  LD [M]  drivers/staging/fbtft/fb_ssd1289.ko
  BTF [M] drivers/staging/fbtft/fb_ssd1289.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ssd1289.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ssd1305.mod.o
  LD [M]  drivers/staging/fbtft/fb_ssd1305.ko
  BTF [M] drivers/staging/fbtft/fb_ssd1305.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ssd1305.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ssd1306.mod.o
  LD [M]  drivers/staging/fbtft/fb_ssd1306.ko
  BTF [M] drivers/staging/fbtft/fb_ssd1306.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ssd1306.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ssd1325.mod.o
  LD [M]  drivers/staging/fbtft/fb_ssd1325.ko
  BTF [M] drivers/staging/fbtft/fb_ssd1325.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ssd1325.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ssd1331.mod.o
  LD [M]  drivers/staging/fbtft/fb_ssd1331.ko
  BTF [M] drivers/staging/fbtft/fb_ssd1331.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ssd1331.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_ssd1351.mod.o
  LD [M]  drivers/staging/fbtft/fb_ssd1351.ko
  BTF [M] drivers/staging/fbtft/fb_ssd1351.ko
Skipping BTF generation for drivers/staging/fbtft/fb_ssd1351.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_st7735r.mod.o
  LD [M]  drivers/staging/fbtft/fb_st7735r.ko
  BTF [M] drivers/staging/fbtft/fb_st7735r.ko
Skipping BTF generation for drivers/staging/fbtft/fb_st7735r.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_st7789v.mod.o
  LD [M]  drivers/staging/fbtft/fb_st7789v.ko
  BTF [M] drivers/staging/fbtft/fb_st7789v.ko
Skipping BTF generation for drivers/staging/fbtft/fb_st7789v.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_tinylcd.mod.o
  LD [M]  drivers/staging/fbtft/fb_tinylcd.ko
  BTF [M] drivers/staging/fbtft/fb_tinylcd.ko
Skipping BTF generation for drivers/staging/fbtft/fb_tinylcd.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_tls8204.mod.o
  LD [M]  drivers/staging/fbtft/fb_tls8204.ko
  BTF [M] drivers/staging/fbtft/fb_tls8204.ko
Skipping BTF generation for drivers/staging/fbtft/fb_tls8204.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_uc1611.mod.o
  LD [M]  drivers/staging/fbtft/fb_uc1611.ko
  BTF [M] drivers/staging/fbtft/fb_uc1611.ko
Skipping BTF generation for drivers/staging/fbtft/fb_uc1611.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_uc1701.mod.o
  LD [M]  drivers/staging/fbtft/fb_uc1701.ko
  BTF [M] drivers/staging/fbtft/fb_uc1701.ko
Skipping BTF generation for drivers/staging/fbtft/fb_uc1701.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fb_upd161704.mod.o
  LD [M]  drivers/staging/fbtft/fb_upd161704.ko
  BTF [M] drivers/staging/fbtft/fb_upd161704.ko
Skipping BTF generation for drivers/staging/fbtft/fb_upd161704.ko due to unavailability of vmlinux
  CC [M]  drivers/staging/fbtft/fbtft.mod.o
  LD [M]  drivers/staging/fbtft/fbtft.ko
  BTF [M] drivers/staging/fbtft/fbtft.ko
Skipping BTF generation for drivers/staging/fbtft/fbtft.ko due to unavailability of vmlinux
drv@ubunlion:~/git/kernels/staging$


--HGDXYKSQfV5d1Pbx--


