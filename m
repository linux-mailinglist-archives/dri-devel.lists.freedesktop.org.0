Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A62C7F0D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 08:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CD26E43C;
	Mon, 30 Nov 2020 07:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E67A6E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:51 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AU7jG23089311;
 Mon, 30 Nov 2020 07:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=qMAbjsB9xIcc9FbOZJHAhVcjJXyVUwDPfnqItTa/5Ug=;
 b=Z6hWS9+sYq8zlMorm5jQmc4LzZT/EQFlBGnQTc5ruOTjHyT/5OKHmy2XvUR8Qf/CKGm5
 sSH9Om4ttPI4x1FFhmbKDSo4sX1Nirc0AYeb6iEalgDLEBzLMceMT+FHjcKV2o1BEdTo
 dx6zMs6TjhZHNp3veKLfnAgBSvnyCW8xMpp6pwDW6tqrWG0B3XXEl0R9p2PnGGErtm2s
 OyA3+QrRPvZch2O3Jw7OeEGc2tvbn1cD/XGVskQkcGOM3itwOO1ST5dtQVq9VNNPNbO9
 3DFeT3oH2ZCF6GEjGi/zCPxXtMY4JCIvb1WvwKMA9X4s4xOA+KBw+gktXW4Dfb29ye0O fA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 353c2aksm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 07:48:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AU7e08d044463;
 Mon, 30 Nov 2020 07:48:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 3540ew8kbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 07:48:46 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AU7megl006138;
 Mon, 30 Nov 2020 07:48:41 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 29 Nov 2020 23:48:39 -0800
Date: Mon, 30 Nov 2020 10:48:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Message-ID: <20201130074829.GA2767@kadam>
References: <20201117072103.GA1111239@mwanda> <20201120081113.GL18329@kadam>
 <BY5PR11MB41823E214598EC70A9EAEEA08CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB41823E214598EC70A9EAEEA08CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9820
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9820
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300050
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

On Fri, Nov 20, 2020 at 10:15:57PM +0000, Chrisanthus, Anitha wrote:
> Hi Dan,
> I see the problem now, thanks for the patch.
> 
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Friday, November 20, 2020 12:11 AM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> > Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> > devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
> > 
> > If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
> > The kernel will Oops when we pass it to kmb_dsi_host_unregister().
> > 
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: write a better commit message
> > 
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
> >  		drm_err(&kmb->drm, "failed to initialize DSI\n");
> >  		ret = PTR_ERR(kmb->kmb_dsi);
> > -		goto err_free1;
> > +		goto err_clear_drvdata;
> >  	}
> > 
> >  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> > @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
> >  	drm_crtc_cleanup(&kmb->crtc);
> >  	drm_mode_config_cleanup(&kmb->drm);
> >   err_free1:
> > -	dev_set_drvdata(dev, NULL);
> >  	kmb_dsi_host_unregister(kmb->kmb_dsi);
> > + err_clear_drvdata:
> We still need to unregister the dsi_host that was registered in this call kmb_dsi_host_bridge_init.
> This will require more changes in kmb_dsi_host_unregister and/or separate out mipi_dsi_host_unregister.
> FYI - I will be out all of next week, will be back the next Monday.

Hm...  Yes.  Now that you point it out, there are several bugs related
to kmb_dsi_host_bridge_init()...

   182  void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi)
   183  {
   184          kmb_dsi_clk_disable(kmb_dsi);
   185          mipi_dsi_host_unregister(kmb_dsi->host);
                                         ^^^^^^^^^^^^^
kmb_dsi->host is dsi_host.

Every user unregisters it, but only the first user registers it.  So
if there are multiple users it will be unregistered prematurely.  Should
there be a kfree to prevent a leak?

		kfree(kmb_dsi->host);
		dsi_host = NULL;

   186  }

[ snip ]

   216  int kmb_dsi_host_bridge_init(struct device *dev)
   217  {
   218          struct device_node *encoder_node, *dsi_out;
   219  
   220          /* Create and register MIPI DSI host */
   221          if (!dsi_host) {
                     ^^^^^^^^
This is only allocated for the first user.

   222                  dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
   223                  if (!dsi_host)
   224                          return -ENOMEM;
   225  
   226                  dsi_host->ops = &kmb_dsi_host_ops;
   227  
   228                  if (!dsi_device) {
   229                          dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
   230                          if (!dsi_device) {
   231                                  kfree(dsi_host);
                                        ^^^^^^^^^^^^^^^
But now it is non-NULL but it is a freed pointer.  dsi_host = NULL;

   232                                  return -ENOMEM;
   233                          }
   234                  }
   235  
   236                  dsi_host->dev = dev;
   237                  mipi_dsi_host_register(dsi_host);
   238          }
   239  

[ snip ]

   482  
   483          of_node_put(dsi_in);
   484          of_node_put(dsi_node);
   485          ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^
This get_device() needs a matching put_device().  I kind of like to put
the kref_get() calls on their own line so that they're more obvious to
the reader.

	get_device(&dsi_pdev->dev);
	kmb_dsi_host_bridge_init(&dsi_pdev->dev);

   486  
   487          if (ret == -EPROBE_DEFER) {
   488                  return -EPROBE_DEFER;
   489          } else if (ret) {
   490                  DRM_ERROR("probe failed to initialize DSI host bridge\n");
   491                  return ret;
   492          }
   493  
   494          /* Create DRM device */
   495          kmb = devm_drm_dev_alloc(dev, &kmb_driver,
   496                                   struct kmb_drm_private, drm);
   497          if (IS_ERR(kmb))
   498                  return PTR_ERR(kmb);

On these error paths we would want to unwind using a call to
kmb_dsi_host_unregister().

   499  
   500          dev_set_drvdata(dev, &kmb->drm);
   501  
   502          /* Initialize MIPI DSI */
   503          kmb->kmb_dsi = kmb_dsi_init(dsi_pdev);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is the call where the "kmb_dsi->host = dsi_host;" assignment
actually happens.

   504          if (IS_ERR(kmb->kmb_dsi)) {
   505                  drm_err(&kmb->drm, "failed to initialize DSI\n");
   506                  ret = PTR_ERR(kmb->kmb_dsi);
   507                  goto err_free1;
   508          }
   509  
   510          kmb->kmb_dsi->dev = &dsi_pdev->dev;
   511          kmb->kmb_dsi->pdev = dsi_pdev;
   512          ret = kmb_hw_init(&kmb->drm, 0);

It feels like it would be a lot easier if the kmb_dsi_init() and
kmb_dsi_host_bridge_init() functions were combined.  Probably the
dsi_host and dsi_device stuff needs to be refcounted?

Anyway, I can't test this stuff and I'm not really familiar with the
driver.  Could you fix it and CC me on the fix?

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
