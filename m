Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523DB2BA454
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 09:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899856E880;
	Fri, 20 Nov 2020 08:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACF26E880
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 08:09:32 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK80MX8189539;
 Fri, 20 Nov 2020 08:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=TLztPkMrSd9Fz6QUqVGl08bMpXDwUxd1h4LXdoVnEUA=;
 b=r5yUApJ0ApU01VxX6Z1L/SGH5VtQ3290Ju0IPTByNtCryGsMdnUl3cbnPIbepLJ5cEj2
 YrQLm59L2NEeflNFMdxPVvDzCu6Hf1DYPNwbX4oiuXcACTwsP1VlTDCtabLUJPltxb6Z
 9NE3SWQmqrMMBxa3tiYfUGnAED2yQO3cHgkvAJs+QfrJSy3Bzua5WmYWrYDvXYiHAHk4
 8gM7YZ6G8+RRvKfytJMBpRyB2FzUV3v6j+qo+hRkp6dWQ8WG1XzUKS5g1yIJikMdKfd7
 BpqB4nSXwTWPYuVPiZDMABxfY1qMRLsUn4C14yiD/7rzUrEEax4Fu29PWAKzoc5WU2Lf Qg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 34t4rb9g0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 08:09:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK85R8Z185065;
 Fri, 20 Nov 2020 08:09:29 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 34umd34nw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 08:09:28 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AK89Nr1011604;
 Fri, 20 Nov 2020 08:09:24 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 20 Nov 2020 00:09:22 -0800
Date: Fri, 20 Nov 2020 11:09:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH] drm/kmb: Fix possible oops in probe error handling
Message-ID: <20201120080914.GK18329@kadam>
References: <20201117072103.GA1111239@mwanda>
 <BY5PR11MB41823C768894561BEE8567888CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB41823C768894561BEE8567888CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200052
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
Cc: David Airlie <airlied@linux.ie>, "Dea, Edmund J" <edmund.j.dea@intel.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 01:29:45AM +0000, Chrisanthus, Anitha wrote:
> Hi Dan,
> 
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Monday, November 16, 2020 11:21 PM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> > Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> > devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH] drm/kmb: Fix possible oops in probe error handling
> > 
> > If kmb_dsi_init() fails the error handling will dereference an error
> > pointer which will cause an Oops.
> > 
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> > b/drivers/gpu/drm/kmb/kmb_drv.c
> > index a31a840ce634..8c43b136765c 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
> >  	if (IS_ERR(kmb->kmb_dsi)) {
                   ^^^^^^^^^^^^
We check that this is an error pointer.

> >  		drm_err(&kmb->drm, "failed to initialize DSI\n");
> >  		ret = PTR_ERR(kmb->kmb_dsi);
> > -		goto err_free1;
                ^^^^^^^^^^^^^^^
We go to err_free1.

> > +		goto err_clear_drvdata;
> >  	}
>  dsi host is registered earlier, it needs to be unregistered, original code is correct.
> 
> Anitha
> > 
> >  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> > @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
> >  	drm_crtc_cleanup(&kmb->crtc);
> >  	drm_mode_config_cleanup(&kmb->drm);
> >   err_free1:
      ^^^^^^^^^
Which is here.

> > -	dev_set_drvdata(dev, NULL);
> >  	kmb_dsi_host_unregister(kmb->kmb_dsi);
                                ^^^^^^^^^^^^
And then we crash.

Probably my commit message was not clear enough.  I will change the
commit message and resend.

regards,
dan carpenter

> > + err_clear_drvdata:
> > +	dev_set_drvdata(dev, NULL);
> > 
> >  	return ret;
> >  }
> > --
> > 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
