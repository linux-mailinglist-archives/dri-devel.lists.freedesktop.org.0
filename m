Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D663479D6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 14:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53266E0D6;
	Wed, 24 Mar 2021 13:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760104.outbound.protection.outlook.com [40.107.76.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AD76E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 13:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMffZ0hw9oclSLgbKTdoFNL38KeWydRlfMUyaQiOjG9AhUd2SyyNzT50/zweB0nty+IsfowrplgkGqMeEpKO+HYSM7LTdHVmF5OzhywDLJmpEdxlE5LxuNXwzbNy+ALhYWzEUOEfFZ08G+FvpQO1Qevi85efQEqrCmtKw1jU7Y5dPzgz7NNUN+8IH7i/Qgi3YiRHYkuEaRipE24wUYfgUPb7P4dRg+wSxicv7RrX2LGWLMVxkfho8Pq8BTYrMtiH0OzEm2BKVFh9HeYa/xzNBKwtt0HMbjXB6qTOIVKC9MnLLCWi/rtOW3cp6yg+Ed52XRzbw9dq62CX+GyF7gAotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHwH2GEkoMTaDilc/BaJPAd8yOHoPKRPbOBwu+uTZBw=;
 b=ZqHthbz0mg0OPPHizS1varTdO5e4ImluAtCz0+8SPso7vcoIoFFq0TGvsBIYIllLd3DTmyoRaUajpZK3VuIXGfIYAzcOcTe3GFz8VuOU9EGolq4Il3DeqddzZjA3v2PAJaGa2ZqJYc10RV9LYAbL7MVYVC+gEFlSF/+jCcrvbB9b/fuV5GhoqMWPxS1DZAgCsUQQZSBMUkPZXgyOEPDyfpLdiPLKy3rIvbpYSAp8+CLfdN9uf3gcz7SIcKKgxX8wujgpFyWBEDHbhD5hLNI+7ldBQOuUlYiva+7kSlK2GgzvqCzz83443OhQoiRBVq0QYwqmjfLwvTQrkW3eVPIp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHwH2GEkoMTaDilc/BaJPAd8yOHoPKRPbOBwu+uTZBw=;
 b=DdapA82ULIZ57CouVR/spotbTPi1/4HpGacwCZm/+/MrFaMfDhp5+zqxhByyUotDTfjI5eteicHkBiiXOe7lZBO6rmVkKHpD2qvxvT5zwXUDmjz3TGA+0cH/Cku+8ZMZ3TsTbFe+eJSNpNK8o/uWpDQsQqbRyy503U42iUH4s+w=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by MW2PR2101MB1068.namprd21.prod.outlook.com (2603:10b6:302:a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.2; Wed, 24 Mar
 2021 13:46:39 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::cbc:735e:a6a5:8b9c]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::cbc:735e:a6a5:8b9c%8]) with mapi id 15.20.3999.004; Wed, 24 Mar 2021
 13:46:39 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>, KY Srinivasan <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>
Subject: RE: [PATCH v2] video: hyperv_fb: Fix a double free in hvfb_probe
Thread-Topic: [PATCH v2] video: hyperv_fb: Fix a double free in hvfb_probe
Thread-Index: AQHXIJnVU648MgoDp0CNqdRDsPJfgqqTIvoQ
Date: Wed, 24 Mar 2021 13:46:39 +0000
Message-ID: <MWHPR21MB1593F19EE7AD10698582FA78D7639@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20210324103724.4189-1-lyl2019@mail.ustc.edu.cn>
In-Reply-To: <20210324103724.4189-1-lyl2019@mail.ustc.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-03-24T13:46:37Z; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=38b55c63-9cff-4cbd-92cb-434479b39c9a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: mail.ustc.edu.cn; dkim=none (message not signed)
 header.d=none;mail.ustc.edu.cn; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dfb4f7e5-1435-4226-2464-08d8eecb4018
x-ms-traffictypediagnostic: MW2PR2101MB1068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB10689892C80CC40616863DD1D7639@MW2PR2101MB1068.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zUCvLwmuQeCNSwYDy2eVRyDVDvBUF2M5I1dTKIe67aoc+NCB7c0rtub1ygxI65etxlqKdwSEih2QMNe0yskg5MBp2ncmbT1ZtKLshl1xOcmSoG5dBC0HBVPWE6BnOZI21YiYFXDUV5uGbz0bRn1JZxHJk5YZ14j9Bk5TLkrz0rep1qEf8Z7c75UWTQLsYoBMmeGMvGR0oOmA3UA3QaDW++F2hU8tZEzZpr6G6qcg2HkVoQAF4zujEfMd2BZgzoRXF9uRl0bN1WgLuJIhmYExEpidLwx60c4LDHOYJV6ZOZtUrPreI+Y2XechrwpdxzwzyAXaPQKNhqoXWA3pBn8WrJ12HJDRHElV5r/g1G9ZsnWRjTjVBj2ZksyJNoQuJzq+1CbwnDwMCsVKua6fn3Fe+BtjKh5rYr8MGh16nT2sqFHdqO0Np5MEiKt8eOpuJpyTj/o1a5X4DNJK/Szz4ZQccohgAIVPCpld0FJznkL5guYl+ShqFQ87xdTy1o9Db/vKcOhSmK/5KKtra56HHMdK32UfrhCMTdMbRktJmE685HkhvHRx41DZfMihNVw/kuYSh7qNUM9NCa/bRb/7U90LNx0E3nxBtD8rYoanwmczpQwdOoUxvu0Duv6m9ga10YSKF++87WJH/UvSEXnSF6S5E3ilwGa5BZ5pdjjUCLCaR34=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(186003)(9686003)(55016002)(66446008)(66476007)(83380400001)(86362001)(76116006)(66556008)(64756008)(66946007)(2906002)(26005)(6506007)(52536014)(38100700001)(5660300002)(8936002)(8676002)(7696005)(82950400001)(71200400001)(33656002)(110136005)(4326008)(82960400001)(478600001)(10290500003)(316002)(8990500004)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?q6ZKrI0KLZMkAKPFg0h1YV9YcSLPn7Lh2WMRrYWHykkmTnVZGcNChbVuMyXI?=
 =?us-ascii?Q?RJ6pE2mKQ+8NXCrC4un2vg5YdqFpMu0vPEN2tDz+JIlDciVLD7V2hbduV/fw?=
 =?us-ascii?Q?FRu+EfZzPbYgrPvBPMsmTZ86zzFZbrGyaYZisn5OMm459bW0ZvJSrX1RKp6e?=
 =?us-ascii?Q?Rx3Sph0datgIXfNUdWauo2U9e3N7/oF20hGz2zsja55JU5anodxlTmxbNGKi?=
 =?us-ascii?Q?VKcxRRbPz9EbnPL9XZzjJTxKd8qtOqbSfA7VhoFiDV7P+GJz8Ma/QsRU3VUU?=
 =?us-ascii?Q?HTtCqyWGOTTf6iXo5r/anXh3VpyMazAhBg/XDh4WiCjEluZEq3R8P+LcDA0k?=
 =?us-ascii?Q?svFl3NR6WDDOr81o0rZ6p+9aTgfLhQgE2W8gZMz3esRg/Af6HEmMgSmAzWWM?=
 =?us-ascii?Q?1LU0D98cXX20EaTsnf5HvrqfmQ+9R048jSjp3a1CssSkLheccnEsecZ6ABEx?=
 =?us-ascii?Q?AMSzOZr+dmwObiupZV480e1wUEIxaMgSbypfDg3QN5GqxjlOs0e1svCWlgCw?=
 =?us-ascii?Q?M4za2VhUlLlhobZh8O0+hMaNbsRcnE1MQakvdnKUFoqGA+y365rNdsMsOgyu?=
 =?us-ascii?Q?2j9hx70ZAclyu4B60ZnBLuRwC7jNKPN0aZfapDbXKS9VVSRsp5fozcVwK8aY?=
 =?us-ascii?Q?KSkReZ3zHuxnxAmiReAJ9YH4FkPNqiR/uuxQWNBUcj2r+ef8VxfKsImxU/R4?=
 =?us-ascii?Q?vlBovqGbjJa25a1MbvZ0EFjbTklVp4EfKMMVDEjcmLcJxxwZzGKMRMzZZyAF?=
 =?us-ascii?Q?ez89eR0L4psNT5FFmCOl5nHj+9+0WAZ4qKCJH8lK5wM3e9GWJcwKSD1a4ctD?=
 =?us-ascii?Q?Z8NH4sVgC8lfIJH6rVL0Ei8NiqJW0T/NLrihA1+7nNiDs4vGifxEV65GB8uj?=
 =?us-ascii?Q?hO0LjIsLPWen5htOManfMNXcwchpar1Lw4+PBCJsccdv4RXKNdA8WQLhgxAM?=
 =?us-ascii?Q?tcmGPKQvHPppRkD0byFCiYVz4vbp+KG2XUGOzdNbDK+dRh7jHns7Xx2eBM3k?=
 =?us-ascii?Q?sPw5kOmoeUhInMzUmvJrCqJBKlodMkv8prKrV+gpfz2ZbLc/jghvHakcxvD5?=
 =?us-ascii?Q?978l6oZg2XiWChqoz9zbkAF9fmBmRcGY4B0culQPz2sRs60urQZwFn0o2nS6?=
 =?us-ascii?Q?90XURDOUXO1puL+ndclQQjyF0RBX31iFGj8OW0m9Df18p1asHfs8U59unCkK?=
 =?us-ascii?Q?x1qLVALDcm3zJczG2y30tYdo05O44RR3jE5fcR18w/7WLGqSaftUZv10falM?=
 =?us-ascii?Q?gsPwMum+9B5HASqX/26kSr8HAradGP/2p0cWWGqrAs2UtIfPN8S/V5jAJBD/?=
 =?us-ascii?Q?16ArrKQyEdImgV0/ZYp0DmNf?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb4f7e5-1435-4226-2464-08d8eecb4018
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 13:46:39.2921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TRT9AzSHtOmVvJIFqetzGnhV52tmNAcldQ+r7sXQa7Th5Chfa0jxDJQ42/BeW68AFMXDoV2vNaSSAlJ6xgGZeXQSBJzp9vrd/WoXDRFNIvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1068
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Yunlong <lyl2019@mail.ustc.edu.cn> Sent: Wednesday, March 24, 2021 3:37 AM
> 
> In function hvfb_probe in hyperv_fb.c, it calls hvfb_getmem(hdev, info)
> and return err when info->apertures is freed.
> 
> In the error1 label of hvfb_probe, info->apertures will be freed for the
> second time in framebuffer_release(info).
> 
> My patch removes all kfree(info->apertures) instead of set info->apertures
> to NULL. It is because that let framebuffer_release() handle freeing the
> memory flows the fbdev pattern, and less code overall.

Let me suggest some clarifications in the commit message.  It's probably
better not to reference the initial approach of setting info->apertures to
NULL, since there won't be any record of that approach in the commit
history.  Here's what I would suggest:

Function hvfb_probe() calls hvfb_getmem(), expecting upon return that
info->apertures is either NULL or points to memory that should be freed
by framebuffer_release().  But hvfb_getmem() is freeing the memory and
leaving the pointer non-NULL, resulting in a double free if an error
occurs or later if hvfb_remove() is called.

Fix this by removing all kfree(info->apertures) calls in hvfb_getmem().
This will allow framebuffer_release() to free the memory, which follows
the pattern of other fbdev drivers.

Modulo this revision to the commit message, which Wei Liu can
probably incorporate,

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

> 
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index c8b0ae676809..4dc9077dd2ac 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1031,7 +1031,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info
> *info)
>  			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
>  		if (!pdev) {
>  			pr_err("Unable to find PCI Hyper-V video\n");
> -			kfree(info->apertures);
>  			return -ENODEV;
>  		}
> 
> @@ -1129,7 +1128,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info
> *info)
>  	} else {
>  		pci_dev_put(pdev);
>  	}
> -	kfree(info->apertures);
> 
>  	return 0;
> 
> @@ -1141,7 +1139,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info
> *info)
>  err1:
>  	if (!gen2vm)
>  		pci_dev_put(pdev);
> -	kfree(info->apertures);
> 
>  	return -ENOMEM;
>  }
> --
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
