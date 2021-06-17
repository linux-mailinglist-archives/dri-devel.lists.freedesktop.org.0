Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CFD3AB2A2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306066E901;
	Thu, 17 Jun 2021 11:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4896E903
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:33:00 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HBWWU0001814; Thu, 17 Jun 2021 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=jok5vo8F5i8ypd4bZ2ZIzdLfnWdBWpjToc00qo4GD6o=;
 b=lPFm9R0HACdTLiu+uQZF4WN70xMq8BSEdVTIaCdts1kbhUs7ozhoL5MjQCbsOC8Cdahn
 0ownsx3Bb56+VNF8CnNyA1Oqwto6H7yFt+CTVAfle8+Zl52BnPK2pceiF2m/606knCQc
 KlXlVjFKaqMoWLD6r1N649jt6UufXGv7pYxaSPd7iF0G4gKc1rAY3TYhgpMHgQ7ii1x5
 /KNoC2XNO3ERvmiEfMClloEL0vyWyOujw1zPaXFv72n84k4yOzN/a7bJHdntScSzQCTN
 UvCz3lS0tpStU1cjDNKDVQe5gpnPLcrRZVXhdxUYjQpE8fIuWLFozgo/zAWPRzez3y7h dA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 397h4bj4j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 11:32:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HBVMSK025974;
 Thu, 17 Jun 2021 11:32:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 396wavgya1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 11:32:57 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HBWvRq028262;
 Thu, 17 Jun 2021 11:32:57 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 396wavgy9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 11:32:56 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HBWorC006135;
 Thu, 17 Jun 2021 11:32:50 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Jun 2021 11:32:50 +0000
Date: Thu, 17 Jun 2021 14:32:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH] drm/nouveau/core/object: fix double free on error in
 nvkm_ioctl_new()
Message-ID: <20210617113243.GH1901@kadam>
References: <YMcyzyVyI4N6anBo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMcyzyVyI4N6anBo@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: mIWuBrr_lNGlcK8N24JIecIo2SORFgx_
X-Proofpoint-GUID: mIWuBrr_lNGlcK8N24JIecIo2SORFgx_
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 01:43:27PM +0300, Dan Carpenter wrote:
> If nvkm_object_init() fails then we should not call nvkm_object_fini()
> because it results in calling object->func->fini(object, suspend) twice.
> Once inside the nvkm_object_init() function and once inside the
> nvkm_object_fini() function.
> 
> Fixes: fbd58ebda9c8 ("drm/nouveau/object: merge with handle")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is something that I spotted while looking for reference counting
> bugs.  I have tried running it, but it does not fix my crashes.  My
> system is basically unusable.  It's something to do with the new version
> of Firefox which triggers the refcount_t underflow, but switching to
> Epiphany doesn't solve the issue either.
> 
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index d777df5a64e6..87c761fb475a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -134,8 +134,8 @@ nvkm_ioctl_new(struct nvkm_client *client,
>  				return 0;
>  			}
>  			ret = -EEXIST;
> +			nvkm_object_fini(object, false);
>  		}
> -		nvkm_object_fini(object, false);

Actually calling nvkm_object_fini() is probably fine.  It just screws
around with the registers and it's probably fine if we do that twice.

Calling .dtor() when .ctor() fails is actually required because .ctor
doesn't clean up after itself.

So this patch is not required.  The other patch is required.
https://lore.kernel.org/nouveau/YMinJwpIei9n1Pn1@mwanda/T/

In the end, I had to give up on fixing the hang and downgrade to
debian's long term support version of firefox.

regards,
dan carpenter

