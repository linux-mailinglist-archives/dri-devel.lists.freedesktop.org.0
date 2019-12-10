Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BDF1187E8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1254D6E8C5;
	Tue, 10 Dec 2019 12:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F0D6E8C5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9gnYLpgQ4J+wiZQ9Gs9udk/PjpwGXQ/7MmBOGsBIX26AC7fJ0rRg/8jkFa0OKc7XIJZF1nVZVDl59gKmbJ+ZoHAW435QIjwLEZlyzqbnkzhfp9AaW00hyvQGeKXZfdmiIZNgoN/SE15UsW37Jctgylkc3cJid/hej+skvgM3K6DbcgQllJQj+CNbvOEjEnIlPkNvtv8STQqubRHvs+fQJTZCXJizARpnSORoDSwOgmLltc7UfF19hluLUGRdogRp3Keg4dC4B6mRvxluTO/e9pBNzyOdFwZ2O+LU+bPxbl++V68SjzhxLG0EqT93MxrwmBbMrj4G1EeFV++x0nOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEqWUlTclevglpUTQKsDQups9jFeR90Wu4ZaJyVINc0=;
 b=FdYlbycTqkKnTlW+MuzvxpWBO4TiRzwRUdLEawckoBTSwbb9TMm4ZS2JT4NRBrNOaTbPQ7+Smz/mtHzk/mZrKizylbgoXGP/QoC14EACsBou1GI5xpCUWkNh7/mxSijvKFDe0oSmVwpDvMNgAdWDi0uIXyRP7lxnj2nKpERlgRKi4OFqoT++rtVxsVek2GdC0Yro9ELNeMw4IQjTd5mBTipuXE48L9rxu+2TE/1olBlJ87R+Y22zLQ3s3iuGpMHoa3nW6bvvvYdtx0Say+h5HxDiupn7s/OaRYqvnRfXKl1Gi+CO18dXYnJWys/5jS8/a0khDr7J8hvHaDWEML03og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEqWUlTclevglpUTQKsDQups9jFeR90Wu4ZaJyVINc0=;
 b=Eudex3g1jBrtzxgzMYT5DMmwy/VuoaAVLhfe8KxiIqJk9YNUrZYASIyen6hZhT/t024St4TSyXVM7PhmSqq1NvgtqFW+zvOj/qE9s7RNI1YfqG7sGFjSm6Spg0Q9PcxNJvIKpq8+HliIPxRRx2kLen9EJ9rFKaWYyeVwDUa2eLI=
Received: from BN8PR05MB6132.namprd05.prod.outlook.com (20.178.210.84) by
 BN8PR05MB6067.namprd05.prod.outlook.com (20.178.212.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.8; Tue, 10 Dec 2019 12:18:13 +0000
Received: from BN8PR05MB6132.namprd05.prod.outlook.com
 ([fe80::6978:c068:f6e2:f9e8]) by BN8PR05MB6132.namprd05.prod.outlook.com
 ([fe80::6978:c068:f6e2:f9e8%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 12:18:13 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
Thread-Topic: [PATCH] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
Thread-Index: AQHVroDEdm1GoL3zJ0K38sqhIMCcLA==
Date: Tue, 10 Dec 2019 12:18:13 +0000
Message-ID: <BN8PR05MB61326FF3F6AA62FD0ED6DBEEA15B0@BN8PR05MB6132.namprd05.prod.outlook.com>
References: <20191209110641.16134-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29ce8760-4235-4327-ca58-08d77d6b07a2
x-ms-traffictypediagnostic: BN8PR05MB6067:|BN8PR05MB6067:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR05MB6067B703D049DD46B55A5953A15B0@BN8PR05MB6067.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(26005)(186003)(86362001)(478600001)(52536014)(76116006)(91956017)(4326008)(2906002)(33656002)(8936002)(316002)(71200400001)(66946007)(53546011)(64756008)(8676002)(6506007)(81156014)(55016002)(9686003)(7696005)(66556008)(81166006)(110136005)(66446008)(5660300002)(66476007)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR05MB6067;
 H:BN8PR05MB6132.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p1B7XhOimPXKqfLV4p5/qbO2fmNPRD/KJcK52nNn9FSM08euaESkQ1YhIQmzwVXtlz4Ty/UH9X0T6IHqt0TsUtdMHoN43sLmbqI9BtmV7M+cxb6oH0w7ut+zAlzvfbqFsqTwLM05VBC4SrZCy1K5RPI7Bm0g8KEaYFUvlMXTb90CNRjTZBBlJWbgX9K7TMaGkObHCawAB1QXKA6lNwrjT2dyjXB6Mzaq4iMp4bjnH1frsKimdDlCCH1NxzaWTuHOZ9UeRbfAzfVcwLtB3c71V35m7hmQfkxF+j1ipEs5D95u1bl+olchiJL19yPPE28jwykolCEyKgtl90iWQzIv2MBe3cgmtbdyHvvZANrQNhhyCFJysfTEAFxp/VYDEvjBiN38r+3DU5K/T1fxJEzgF5fKBdOfZi7JJqHOZWbR2KeupFkDzEFdTYtt+UNYlmGbUD7+Zq57U5wEVXou2RCVvae48MJGNeApRVndXVXiS35rk7TKyWNaWnoGbQwgdtCM
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ce8760-4235-4327-ca58-08d77d6b07a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 12:18:13.5808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /f9lhOqvZ+e3IHl+3pI7m4i+TkIYRaUsrH0bBy/IHQDblVBBP237EzMoyjTZbsVHFGHy9X4WeMH4ByroK41rQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR05MB6067
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/19 12:06 PM, Thomas Zimmermann wrote:
> The load/unload callbacks in struct drm_driver are deprecated. Remove
> them and call functions explicitly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 44 +++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index e962048f65d2..f34f1eb57cfa 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -28,10 +28,10 @@
>  #include <linux/console.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
> -#include <drm/drm_pci.h>
>  #include <drm/drm_sysfs.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_module.h>
> @@ -1211,8 +1211,10 @@ static void vmw_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>
> +	drm_dev_unregister(dev);
> +	vmw_driver_unload(dev);
> +	drm_dev_put(dev);
>  	pci_disable_device(pdev);
> -	drm_put_dev(dev);
>  }
>
>  static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
> @@ -1329,7 +1331,7 @@ static int vmw_pm_freeze(struct device *kdev)
>
>  	vmw_fence_fifo_down(dev_priv->fman);
>  	__vmw_svga_disable(dev_priv);
> -
> +

Unrelated whitespace-fixup.

Otherwise looks good, but still conflicts in the above hunk when I try
to apply it. Could be some TAB-mangling on the way perhaps.

Could you remove that hunk and resend?

Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
