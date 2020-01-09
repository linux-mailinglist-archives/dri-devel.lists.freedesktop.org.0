Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007AF135C72
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 16:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9206C6E43A;
	Thu,  9 Jan 2020 15:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FC36E43A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 15:18:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 07:18:14 -0800
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="303895554"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 07:18:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] xf86drm: only include <sys/sysctl.h> for FreeBSD build
 case
In-Reply-To: <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae@epcas1p4.samsung.com>
 <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
Date: Thu, 09 Jan 2020 17:18:09 +0200
Message-ID: <871rs8psjy.fsf@intel.com>
MIME-Version: 1.0
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
Cc: eric.engestrom@intel.com, zeising@daemonic.se, sw0312.kim@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Jan 2020, Seung-Woo Kim <sw0312.kim@samsung.com> wrote:
> The <sys/sysctl.h> header is only required FreeBSD and GNU libc
> 2.30 starts to warn about Linux specific <sys/sysctl.h> header
> deprecation. Only include <sys/sysctl.h> for FreeBSD.
>
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
>  xf86drmMode.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/xf86drmMode.c b/xf86drmMode.c
> index 207d7be..ff1d31d 100644
> --- a/xf86drmMode.c
> +++ b/xf86drmMode.c
> @@ -42,9 +42,11 @@
>  #include <stdint.h>
>  #include <stdlib.h>
>  #include <sys/ioctl.h>
> +#if defined (__FreeBSD__) || defined (__FreeBSD_kernel__)
>  #ifdef HAVE_SYS_SYSCTL_H

Not that I know anything about this, but shouldn't you instead fix
HAVE_SYS_SYSCTL_H definition in configure stage to only be enabled on
FreeBSD?

BR,
Jani.

>  #include <sys/sysctl.h>
>  #endif
> +#endif /* defined (__FreeBSD__) || defined (__FreeBSD_kernel__) */
>  #include <stdio.h>
>  #include <stdbool.h>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
