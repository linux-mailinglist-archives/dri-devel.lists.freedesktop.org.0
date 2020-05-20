Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430701DB068
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 12:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96C489CF2;
	Wed, 20 May 2020 10:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.blih.net (mx.blih.net [212.83.155.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DAE89CF2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bidouilliste.com;
 s=mx; t=1589971236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+IOjI/wMmRJBN+FVFdSw+vaC8WIT6zo36OAiA67Xq4=;
 b=MjNnpLmhaWz0C5rX2vuc0KKb6PpIPWan089qriAwrgel0nPnaV+56fg6oXG6HkPnfulq6l
 qFoIhBK7DGFIwSPOs1C8MBz8jeRSZRS+i5XQpH1fRqu+258+X1twK4X32LMpeAnMjopqrl
 wj2KJbyAPjeacDhGmrb6O46unYdb5F0=
Received: from skull.home.blih.net (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181]) by mx.blih.net (OpenSMTPD) with ESMTPSA id fa30da27
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 20 May 2020 10:40:36 +0000 (UTC)
Date: Wed, 20 May 2020 12:40:33 +0200
From: Emmanuel Vadot <manu@bidouilliste.com>
To: Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH libdrm] libdrm: enclose __FreeBSD__ behind a define
Message-Id: <20200520124033.540b0116be6d3b6d95cf4690@bidouilliste.com>
In-Reply-To: <20200519190458.15260-2-carlos.santa@intel.com>
References: <20200519190458.15260-1-carlos.santa@intel.com>
 <20200519190458.15260-2-carlos.santa@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 May 2020 12:04:58 -0700
Carlos Santa <carlos.santa@intel.com> wrote:

> Not doing the above can cause compilation errors on
> platforms that don't define it.
> 
> [1/25] Compiling C object 'drm@sha/xf86drm.c.o.
> FAILED: drm@sha/xf86drm.c.o
> ../xf86drm.c: In function 'drmGetMinorNameForFD':
> ../xf86drm.c:2938:7: error: "__FreeBSD__" is not defined [-Werror=undef]
>  #elif __FreeBSD__
>        ^
> ../xf86drm.c: In function 'drmParsePciBusInfo':
> ../xf86drm.c:3258:7 error: "__FreeBSD__" is not defined [-Werror=undef]
>  #elif __FreeBSD__
>        ^
> ../x86drm.c: In function 'drmParsePciDeviceInfo':
> ../x86drm.c:3427:7 error: "__FreeBSD__" is not defined [-Werror=undef]
>  #elif __FreeBSD__
> 
> ../x86drm.c: In function 'drmGetDeviceNameFromFd2':
> ../xf86drm.c:4305:7 error: "__FreeBSD__" is not defined [-Werror=undef]
>  #elif __FreeBSD__
>        ^
> cc1: some warnigns being treated as errors
> ninja: build stopped: subcommand failed.
> 
> Signed-off-by: Carlos Santa <carlos.santa@intel.com>
> ---
>  xf86drm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xf86drm.c b/xf86drm.c
> index b49d42f70dbe..3965b4be366d 100644
> --- a/xf86drm.c
> +++ b/xf86drm.c
> @@ -2822,7 +2822,7 @@ static bool drmNodeIsDRM(int maj, int min)
>      snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/drm",
>               maj, min);
>      return stat(path, &sbuf) == 0;
> -#elif __FreeBSD__
> +#elif defined(__FreeBSD__)
>      char name[SPECNAMELEN];
>  
>      if (!devname_r(makedev(maj, min), S_IFCHR, name, sizeof(name)))
> @@ -2935,7 +2935,7 @@ static char *drmGetMinorNameForFD(int fd, int type)
>  
>      closedir(sysdir);
>      return NULL;
> -#elif __FreeBSD__
> +#elif defined(__FreeBSD__)
>      struct stat sbuf;
>      char dname[SPECNAMELEN];
>      const char *mname;
> @@ -3255,7 +3255,7 @@ static int drmParsePciBusInfo(int maj, int min, drmPciBusInfoPtr info)
>      info->func = pinfo.func;
>  
>      return 0;
> -#elif __FreeBSD__
> +#elif defined(__FreeBSD__)
>      return get_sysctl_pci_bus_info(maj, min, info);
>  #else
>  #warning "Missing implementation of drmParsePciBusInfo"
> @@ -3424,7 +3424,7 @@ static int drmParsePciDeviceInfo(int maj, int min,
>      device->subdevice_id = pinfo.subdevice_id;
>  
>      return 0;
> -#elif __FreeBSD__
> +#elif defined(__FreeBSD__)
>      drmPciBusInfo info;
>      struct pci_conf_io pc;
>      struct pci_match_conf patterns[1];
> @@ -4302,7 +4302,7 @@ drm_public char *drmGetDeviceNameFromFd2(int fd)
>      free(value);
>  
>      return strdup(path);
> -#elif __FreeBSD__
> +#elif defined(__FreeBSD__)
>      return drmGetDeviceNameFromFd(fd);
>  #else
>      struct stat      sbuf;
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

 Ouch, sorry.

 Reviewed-by: Emmanuel Vadot <manu@FreeBSD.org>

-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
