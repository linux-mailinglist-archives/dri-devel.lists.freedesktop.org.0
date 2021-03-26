Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072F34A174
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 07:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648F06E193;
	Fri, 26 Mar 2021 06:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40616E193;
 Fri, 26 Mar 2021 06:11:45 +0000 (UTC)
IronPort-SDR: B9UTBygS1ixUrb866y7l++C+RYmBXQFpScUagoabYPVYBHgUCHZNV0BqVpnyoC+pj/Xug7fp2g
 Kkede44cLLNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276219120"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="276219120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 23:11:44 -0700
IronPort-SDR: UM8Qkp997edCX2eXHnI4D3Arg7IrRseqTLAOVs/tsZWURxY3kWA2JxuFTCBtefAVRQbX+YOOd8
 QGRcZ5to6bJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="514946905"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2021 23:11:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Mar 2021 23:11:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Mar 2021 23:11:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Mar 2021 23:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSGy+Ua4SwuOkFW67wpRMV5pLKAAmMhUIJu7XYOcLFwe2AJf5WYTqrT6dnjZie8bI4UbFpBJwIf9CHiAvoMJ0Wq/gNkE6h+DGkRuxZHOyMF67/zgy+e09Ic3lL7rMQSd0XOpXHuggtVGs9Ky3VEPKMWKDM8xA3WWjFYeSDzBdceXzAeUu1Qv+TBYpeU+GbZmsgAqehMabO0VrCnVswmuQOQJFrKkfomcXsMu3txvzHq3Dyv6bn7AKmwfhVjUZMjN+d7qD6a5bv5Weep6v7k0yH3OO22qlk2xIlg8PWLNm+X500u+RJyXF5CV3Z4el7S6GPIlbzLqqcHHRaR8zhZHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZQsLLXNBI4ejDUYpyY3WgFZskp1br9swL6xFc5bUvs=;
 b=R6stM3MayRazrpy4s25eKQXkZBScXpNhbdujDl4e0Dul059LJdMwy43RgZHiskYL9esHV3+ZQ+Ms4zYfGFm8u0kdDrA3TeJsEtVTOV2WD9gZHdx1VUEkeEPDy3HBXmh5g/tMXb3fPnzf/brGCZzuMrYc0yqNP26+e6jN3ykuFOV9+CkGKPb4UHmcNGF62PYUuoFUUiH5+D+rgOe80o5roWXAB+f7ON/oGPKRKHL6MdBglHIteOa+PI2IzKbLxYKzwI36ZEnVi0E+MCECLboLka+0TTM21iTGwRo3OwcfYFuNiC+wIl/n+zj1v1CPU+pcRSrcAAo5Ity/DyhHLtURDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZQsLLXNBI4ejDUYpyY3WgFZskp1br9swL6xFc5bUvs=;
 b=r6PygiIk2PsMXcmpUGaRX/lKewr3dfk06ALeVnJbUiNsJyeViGQ19e7h4RSRqSJELIONhBV2gdXXvK5pZHbjt33GRwOwEFwCDUMsh+BkkKhkMz1MjOqFDfQfKiitveoEPzQLlLU5GoNZm/RuxHBfuDJbz8OzFBh6EpPi6qVkTTg=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (10.175.54.9) by
 CO1PR11MB4946.namprd11.prod.outlook.com (20.182.139.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Fri, 26 Mar 2021 06:11:41 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3977.026; Fri, 26 Mar 2021
 06:11:41 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Tony
 Krowiak" <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Zhenyu
 Wang" <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 17/18] vfio/mdev: Remove kobj from
 mdev_parent_ops->create()
Thread-Topic: [PATCH 17/18] vfio/mdev: Remove kobj from
 mdev_parent_ops->create()
Thread-Index: AQHXIA3IrnOdNEJtB0Oy0+p5dk4psKqVzYqA
Date: Fri, 26 Mar 2021 06:11:40 +0000
Message-ID: <MWHPR11MB1886D26B3170A5D39B150DD48C619@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <17-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <17-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfd51a72-b784-4ac8-74d1-08d8f01e05dd
x-ms-traffictypediagnostic: CO1PR11MB4946:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB494649EB49382D6B41D907B28C619@CO1PR11MB4946.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8AfbMJ59aHjs3bdyToU9X7rxtDUC8mCrqSyyR6Ujv7Y8Z+QjAfwU3W2oWuatjywo0pby0f73XmlU6M2EwnZMrlFz7AJzuLu8BYgJl/fS9aC1c50asqNMBsasB1ZkFznmkEXB1PXERV+/87cagEFFe/OuM1hPUMZ0n29vsx6/jahLDa2SvPDg26DKQHtGe9AiX/oFLB2R02Ei1BzuuLkMEVPuUjY8hPlG3SmYb5CkJODrqFRH5bwfIhZFYhx6ju/gVTt8CgJqXpe3lZHYWAduKnLJnNnysBxZWm5z7zxw3E9hO0U0LMsbc9PEKGrz8BFXGmfGnqNU5Oby4lYsrkfHxEXK+suVrdiCRsw7iVwkXyvfHnIapal6EkRPfOT+/U+CBnGcAzHi9VDrs2cu9b5myDNBsybdrLVvxMQAhObAoYWaTdjBVIathTWoxAB55FAqdTn9lzV4HRdnOpHuTa1ASlSf8U114nii9XrChl/el5YpQ1EvYAN1W/PpamUTSO64TFAPTOMs42BxFsgbLEo35+PKJh/tbaKVH0uj9jreIyq5qqaYVB2i5GgVD9R7PrtguOkmjyQD6AV8IAdiqflrBazHpfECgdIE4F0xd0hyN9QB8bZ1KZBqB2ImicgLz5GADZfbXqtBkwuuAmPus239Vcea/eZ+pH5+11FTh4ocnz6Qgl72jC2FdNxP+OeWDae8IAiB5tCFss6/9PaTa3QrLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(366004)(39860400002)(110136005)(316002)(54906003)(921005)(8676002)(8936002)(966005)(33656002)(7696005)(6506007)(86362001)(83380400001)(66946007)(66446008)(64756008)(66556008)(66476007)(71200400001)(9686003)(7416002)(76116006)(2906002)(52536014)(5660300002)(55016002)(186003)(26005)(478600001)(4326008)(6636002)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xDY+PAsPuvJKD6X4KHvaYSfPq8tfx6uZUxCAbLt8o2wsQh30eYcjuPaC32xf?=
 =?us-ascii?Q?upQg2rSaJzcjJb3uKRE9GtOMGb21b7yDEiu6TwPZVZFEKlGIqlkugjRp1zW9?=
 =?us-ascii?Q?xoCvHSWjZbWuiZmDTnKAIHaDROun0Fee9urr7nr3dtHUjBk9c9tS7k29FZEN?=
 =?us-ascii?Q?BAUVstkYdQw3rtGp6XiwCO2hVkECG5j7w4RR1sGovYH65gGE6dJ3WYuzRhyH?=
 =?us-ascii?Q?HCEx/46UuDbSX/hdv2u1I06yXkPjVOLhT7/gXlsAe/OA4IMFw6aSxL0cAxrl?=
 =?us-ascii?Q?xXQOBQcxNj4uf2zfvfgXPVRuc8eXjT+bS8iT3BcL+1UrH83Kr0jMGlaYf0ld?=
 =?us-ascii?Q?Q46QPtel0tn26MhPBIRJOUDpHPzryIi6qtSnkmY5UxiRkYnLM9elT9cCl7jw?=
 =?us-ascii?Q?jZQOWWrBonDbBOs5/Km+4hWo3SEQbbQlijq5EDw8qha+XL88LdSNa9xhs4NR?=
 =?us-ascii?Q?wbpmkJDFOvoS5vuXQtK7Myhy6kj/J87zqlkWzk0+e6Y58nf2h5BcTe5vbOyb?=
 =?us-ascii?Q?k63mB2Qd/9tkLp+w90TC4f2yacv2QQeOm5B9Kz8ijKdwutzX7SVFgzZExfMP?=
 =?us-ascii?Q?ke2zs4N2R/rG5aL6taYuyRyFuUOy8TmBNuCXCwJgecBs4V2icACCAEXn3xCo?=
 =?us-ascii?Q?YQhhhfxMQ01ams6EY7uNUBWv98cgNROXz1iPvTL9WWhJCIUCsdNxazvHoMYW?=
 =?us-ascii?Q?5LvbBE8D7n+VbZAzsi54CCK9HeKZTuKvwn2LQq/Xb0Y6AQnHKuvnfYmCK0Ij?=
 =?us-ascii?Q?4ENpPxDr3NV8WT3CjZnKS2PAZh4wbISUXA8pml0oZnC+RD/cUWVoinbBr9dr?=
 =?us-ascii?Q?JN8d3JpkFBndQ/G1npGVHW4S3YW2zJW4y47MS0/VmieDEHo094XZ4VfbnR3S?=
 =?us-ascii?Q?5k6VBmyiR4vDrDZYQlh9FJkWScLRPATjKKbDkJcJ2qFuKoBLynCTAHPhuFch?=
 =?us-ascii?Q?lcLCJnC2Ol/BehTjoRh+FtdJCgrYp4sxFIX96QLWLABrh4h53DKLJNlGP4UX?=
 =?us-ascii?Q?OfgZNMF7Lkt4UkOXxh3m085XK9ESjLvtRFpDomK69vI4f3UIaAnltOEmr1ed?=
 =?us-ascii?Q?9JzqkJJhtt0BGuoXezTNfhG1WxAlc18M7vEE9JfSPJ31ZIMZjRQlEewpbMlB?=
 =?us-ascii?Q?q5EeP4LKlbCtaPctqrIvY3JudOxoPU50wxNQrd8YJA2Cg9Dq7CKl06E47Ojc?=
 =?us-ascii?Q?SdUBR52AoY9qtMjmKJeB0Ip7GNapBueftBT2093W8G8g9OTTwkwvd7bqsq2f?=
 =?us-ascii?Q?6SFzoFzBIObC2LOLBh0SnXdj5sVFMZdx4Re+EMmNajPZHdCjCbYZcCREPjyk?=
 =?us-ascii?Q?Z7XH0VsgiZCh8zUCjdWrWftd?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd51a72-b784-4ac8-74d1-08d8f01e05dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 06:11:40.8980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24qTTmJARLp2vPkBrW3y3Vae+HlfWZhixNJOZHEQREX0BNr0WZ2r1HSOAYqSvp3i4k9oOS15SG6kMWGo+GqnVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
X-OriginatorOrg: intel.com
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe
> Sent: Wednesday, March 24, 2021 1:56 AM
> 
> The kobj here is a type-erased version of mdev_type, which is already
> stored in the struct mdev_device being passed in. It was only ever used to
> compute the type_group_id, which is now extracted directly from the mdev.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c  | 2 +-
>  drivers/s390/cio/vfio_ccw_ops.c   | 2 +-
>  drivers/s390/crypto/vfio_ap_ops.c | 2 +-
>  drivers/vfio/mdev/mdev_core.c     | 2 +-
>  include/linux/mdev.h              | 3 +--
>  samples/vfio-mdev/mbochs.c        | 2 +-
>  samples/vfio-mdev/mdpy.c          | 2 +-
>  samples/vfio-mdev/mtty.c          | 2 +-
>  8 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 16e1e4a38aa1f6..6bf176e8426e63 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -689,7 +689,7 @@ static void kvmgt_put_vfio_device(void *vgpu)
>  	vfio_device_put(vdev->vfio_device);
>  }
> 
> -static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
> +static int intel_vgpu_create(struct mdev_device *mdev)
>  {
>  	struct intel_vgpu *vgpu = NULL;
>  	struct intel_vgpu_type *type;
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> b/drivers/s390/cio/vfio_ccw_ops.c
> index 68106be4ba7a19..06a82ec136080c 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -110,7 +110,7 @@ static struct attribute_group *mdev_type_groups[] =
> {
>  	NULL,
>  };
> 
> -static int vfio_ccw_mdev_create(struct kobject *kobj, struct mdev_device
> *mdev)
> +static int vfio_ccw_mdev_create(struct mdev_device *mdev)
>  {
>  	struct vfio_ccw_private *private =
>  		dev_get_drvdata(mdev_parent_dev(mdev));
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index 41fc2e4135fe18..6d75ed07bcd49d 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -322,7 +322,7 @@ static void vfio_ap_matrix_init(struct ap_config_info
> *info,
>  	matrix->adm_max = info->apxa ? info->Nd : 15;
>  }
> 
> -static int vfio_ap_mdev_create(struct kobject *kobj, struct mdev_device
> *mdev)
> +static int vfio_ap_mdev_create(struct mdev_device *mdev)
>  {
>  	struct ap_matrix_mdev *matrix_mdev;
> 
> diff --git a/drivers/vfio/mdev/mdev_core.c
> b/drivers/vfio/mdev/mdev_core.c
> index 3ba5e9464b4d20..71455812cb84cf 100644
> --- a/drivers/vfio/mdev/mdev_core.c
> +++ b/drivers/vfio/mdev/mdev_core.c
> @@ -286,7 +286,7 @@ int mdev_device_create(struct mdev_type *type,
> const guid_t *uuid)
>  		goto mdev_fail;
>  	}
> 
> -	ret = parent->ops->create(&type->kobj, mdev);
> +	ret = parent->ops->create(mdev);
>  	if (ret)
>  		goto ops_create_fail;
> 
> diff --git a/include/linux/mdev.h b/include/linux/mdev.h
> index 41e91936522394..c3a800051d6146 100644
> --- a/include/linux/mdev.h
> +++ b/include/linux/mdev.h
> @@ -61,7 +61,6 @@ unsigned int mtype_get_type_group_id(struct kobject
> *mtype_kobj);
>   * @create:		Called to allocate basic resources in parent device's
>   *			driver for a particular mediated device. It is
>   *			mandatory to provide create ops.
> - *			@kobj: kobject of type for which 'create' is called.
>   *			@mdev: mdev_device structure on of mediated
> device
>   *			      that is being created
>   *			Returns integer: success (0) or error (< 0)
> @@ -107,7 +106,7 @@ struct mdev_parent_ops {
>  	const struct attribute_group **mdev_attr_groups;
>  	struct attribute_group **supported_type_groups;
> 
> -	int     (*create)(struct kobject *kobj, struct mdev_device *mdev);
> +	int     (*create)(struct mdev_device *mdev);
>  	int     (*remove)(struct mdev_device *mdev);
>  	int     (*open)(struct mdev_device *mdev);
>  	void    (*release)(struct mdev_device *mdev);
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index a1af30df10a2ee..ac4d0dc2490705 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -506,7 +506,7 @@ static int mbochs_reset(struct mdev_device *mdev)
>  	return 0;
>  }
> 
> -static int mbochs_create(struct kobject *kobj, struct mdev_device *mdev)
> +static int mbochs_create(struct mdev_device *mdev)
>  {
>  	const struct mbochs_type *type =
>  		&mbochs_types[mdev_get_type_group_id(mdev)];
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index 08c15f9f06a880..da88fd7dd42329 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -216,7 +216,7 @@ static int mdpy_reset(struct mdev_device *mdev)
>  	return 0;
>  }
> 
> -static int mdpy_create(struct kobject *kobj, struct mdev_device *mdev)
> +static int mdpy_create(struct mdev_device *mdev)
>  {
>  	const struct mdpy_type *type =
>  		&mdpy_types[mdev_get_type_group_id(mdev)];
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index 191a587a8d5ab1..f2e36c06ac6aa2 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -708,7 +708,7 @@ static ssize_t mdev_access(struct mdev_device
> *mdev, u8 *buf, size_t count,
>  	return ret;
>  }
> 
> -static int mtty_create(struct kobject *kobj, struct mdev_device *mdev)
> +static int mtty_create(struct mdev_device *mdev)
>  {
>  	struct mdev_state *mdev_state;
>  	int nr_ports = mdev_get_type_group_id(mdev) + 1;
> --
> 2.31.0
> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
