Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063950888B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36A210E929;
	Wed, 20 Apr 2022 12:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5864C10E6D5;
 Wed, 20 Apr 2022 12:54:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUqY0lXpauaA6tLflpkfHk/mYdD86uBp4kmI4+ATy9caqBcGtXKF+Jf+Wv0w9OoCTHn6C9BqRQB9Jj+D7VlzlaVPV5SBV4pg2Jgn5czaA8lY29oJq/BHnNvXniMOW496pITMNQOvUqAubblWceB2p+peI3k7tbJ1F2+X5MTnjtU7XQow8vAYy2LkzUAAtOQc7CD7Y9hQxfIRZv94kdcDELovL08NrEw6GSVPUqdgfzZdIGTB7xijCXqqH8N4d5az9lFo3XXBLLKsgZ2dZnaURNRM7YZG102o//vsH+MLD0ycRDIs+vQLiEHJldB3d6ZJgR95XOuotGSU+2NlbsJINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Akx4f8vF7Nv7s7dtHlRiI70EI/F6OFqzq2KhhAjNsQY=;
 b=NMlVMSL9jSHjfsqXaOhbKTtnw9A/1CvNhcSYlrt8t0VMOQj8m4LDTZGA/BeMPMRkjrSGBMOE7JtpDd75/cm1JXn4OcK3WMpPWxTOdiYIFC2D5NgHQpwZumhoGNVOAP5ovAzaAvira9dQxkiofuIy8r+DsNvwWSldLNui8cj0u6qwq0sNabBnaftIV9Z4YNWwvNGGApE6dPWNB9A5vpONJa7wA+2jHZcO0LFiOsbmjmJsDwzXabedlfRkb+w0TPV8zhxBIvzqXkcRY/LYzAs/Bj545frKftAVK2xzGmjw0aZQgL69MallpZQfUQdVjmfFXCqo6CxkHV+KJ90dtueP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Akx4f8vF7Nv7s7dtHlRiI70EI/F6OFqzq2KhhAjNsQY=;
 b=G9mpjAlqzf41Lvf4X3wlZqhHWh8Ipb3JPV3Wp5thq7GuhNFxCNsjc8pG2siuXteNfKXPqbLK2ofBXzXxuR1UF7LTuiH2NDygnOLT/T2nag4zRQggYIyxtt+iWYhapGMptWEbCfArIUEgueabED/sp69xqFfnQj0cSLAVVs70vk4=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by DM6PR12MB3209.namprd12.prod.outlook.com (2603:10b6:5:184::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 12:54:44 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 12:54:44 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Topic: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Index: AQHYVJSHP8/0hJsFF022HGuI3b/QKKz4gPOAgAAAasOAAB8mgIAAB9e4gAAJlwCAAAiMCIAABHyAgAABxZ8=
Date: Wed, 20 Apr 2022 12:54:44 +0000
Message-ID: <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
In-Reply-To: <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-20T12:54:45.173Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3434a443-2040-4871-5951-08da22ccf17a
x-ms-traffictypediagnostic: DM6PR12MB3209:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3209F4B159FB9EC8F5803F6582F59@DM6PR12MB3209.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UGeoZmvQRMXKFL6lS4Xo76KEW4EVIV7Pfzwqf5iWOdhqNOXifqhEXsOPQ7BarBW+IqT4/2EK5TN/gYlnv0wC5yePwuJzmLTednPVqcZodwQINfh7NEXTEcP+vMNkdbxf4+HjmkUtpHKOYmYdJZt/OF5OwOj5HzapPkCpOPCyAdX7NepQYyvcHVf8/a5ZXUYq5hIT5k8qmJfunmSTb5zkHmyAuLHuPdT3H5Y/Nf2xqqs9q5TnmTu9bWYQM6RvY4Uf680e3J4KyVLCLulLiLbVnseafhwtaSwVGt29p758amUM8dGzgLS4V+KLacI+0KnLEHlDgNPDxr6SuwbzQz/qnbRLQF1o8G/3eGRI4sY1A9tAcXJjV4uBfuKxMl911MJA82Pj0JAudKi5OBFRGDvcO2SGFKhBUQe0ANy3w61KQDkkQ9ENz5BPHwvCbVFfRVCKPe1LnTp7SZdCO3hHdHzUeQI1S8ZTU6+gPrFLgNJCUQGq9kHC1hhsMt3ccn5mRVZwta31oHQeAgqy8dUBM2sq75msr8QpgtgApvB9jLLOJN7aR/MiHPPEZdWugdSIAVC7dAlHUJVyVXCbaQuFCWq8gyJIAMKs4ztzjsfyHRFu0TGPhWX3yDyYrxL85mpEkq86fMRi7KGHFYxMfU6b1UFldDz5wht/nMGJ3lcsL3tm81Z4/YOyXSQmSQFATPRCV/28X1eJUU/b28ClFkp+5OGoJbc+xTlZ2v977d1BWgcSwp1yADZf0jmNf8iZewpdfRIJC39DMxPPLlb5zZ4tVmPuvq92A7ad3UJII78bnC19RIg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(52536014)(19627405001)(66946007)(76116006)(8676002)(64756008)(66446008)(66476007)(66556008)(110136005)(316002)(71200400001)(33656002)(86362001)(38100700002)(38070700005)(166002)(122000001)(83380400001)(186003)(6506007)(26005)(508600001)(9686003)(53546011)(7696005)(55016003)(8936002)(2906002)(66574015)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?63vMFdg/BQgVKtL1P5Rw3bEV9VZBFxxjJqiUxQEhVSzQJcRD2QOWPKx+QK?=
 =?iso-8859-1?Q?tciGGPlIu80Q2WPFL/SX6t4Fq3Gfz9e3XQ/+M3jf9zYqXTGHkBlTGnNw6U?=
 =?iso-8859-1?Q?+sYtAwo2K5KfJo5FZQUrLUUKQzKGzm7uJnISpBG/Pfo83B4EH2aVbpdHjm?=
 =?iso-8859-1?Q?fRM7wSXAe1pRRec/ZZxQLGIGoJhlWiJs+ZClGEfcP/Dgz5mPJZwpQVvnUy?=
 =?iso-8859-1?Q?ASyHWeqegWvIgSRnxpwcEj9jbrTRW6ZWmWAYafERzfmqszqWOjhZjkv/jC?=
 =?iso-8859-1?Q?jxFL4NWzAvc1w9syxGZ7cJI4r7c6vBkhdYl2L6sg2lByUQqUaeQ1r0j/4q?=
 =?iso-8859-1?Q?mT2xPA4LvBJsbN2eV4sRODBrY9dSuJ2ZrEGJX6od5mdg1ZtcNn71BC9YjR?=
 =?iso-8859-1?Q?ckyuHRatWJyg/jwEI7x7Ven7f3kBI2LDdgcCYBY4EYzz/f4HpA9mGoXUG6?=
 =?iso-8859-1?Q?NvqPTQbvzM9C4L2+Om28jtk3WWsvsCgscxW3n2kuy1HcY5viN9Besbbf/+?=
 =?iso-8859-1?Q?V7F5DyAnY/WE/bddAxuPsPfsY2W/BYuMuXtNQSqQYTCP2+cToXPy7HO5eB?=
 =?iso-8859-1?Q?83RLgStsh24hX1L66b1kgguWkoICaZC/RQ/eX9GXN9pxZ4w1Cvyl+022e5?=
 =?iso-8859-1?Q?k+kqqA7XTKqnvK28IFFov1OkM1bqfK1L1W9FkIMRP6AZvxtuNymbxBvRlt?=
 =?iso-8859-1?Q?+FR9pwPhT3XSM4uCOm/5XMY5eawoqDs51FGuAu38ThcPBsPzBPpjUMHEDI?=
 =?iso-8859-1?Q?2LtxOYUrZGazL3gV2sDncklXQhE5xqAXgzVSreCjqtNJrEXwctq4TZBvrM?=
 =?iso-8859-1?Q?UX2/gOG+dTC9+d/Fp5PgmRqd9b2Sat2rKI2jMK1QBEa7Cefa7/A3bcfsGn?=
 =?iso-8859-1?Q?MMVYdrukwUWfXdqTGOb6liyq8ftRfm09LnR6o2eOEYiAAjztCQT4qOmn1j?=
 =?iso-8859-1?Q?hHaDx2tT8kYTUch0qwJWI36wwnvpuKiFrht4YVGXjh5Q5wrsJ5SO+PRv8W?=
 =?iso-8859-1?Q?fxKMEGHy8KrEzGQ71Q3ZoTDQDm++w4SqctfWhbJOQRAs1368uWBMLryLVD?=
 =?iso-8859-1?Q?4k5j9+zwasB7I3g8METveOE/legz7DEjQ1t4LyZxsDILorOsy6PzBbfeur?=
 =?iso-8859-1?Q?lw8EU0zVr5ZQ6hzVACjIeatzgS7MqL45zZB/lJxu5tKH2Y8d8GBZxOAChW?=
 =?iso-8859-1?Q?lmWxqQ/J2CWfEWWCz17qS5kqViqZgCdxUiz19rTaDPIvDQIRr/n3ZOrnm9?=
 =?iso-8859-1?Q?ofXJLZ6N1FlEC8C8kKlGJzRvoTq8bhafy/17vtP+WzV2IiABId/40hGEm3?=
 =?iso-8859-1?Q?KYtNG3fSoRIX3aSBk02nZIVL6d0Eh0wkK35TSd6cJ24wPQOBuvd6pLbNA+?=
 =?iso-8859-1?Q?N+r9wcOFMNcTgBTDUKa+e3RQWzz0INHf1r37sWGOI8EtcbAOS9p3k4uin1?=
 =?iso-8859-1?Q?ENDNn/Wc8ma5QDDAyK5NYScEwK4TmnIEJjRVJr4sli+mEwVNzthxH4nHTO?=
 =?iso-8859-1?Q?TUMHDOhCT35/MpLsEx7F0WDQIYKj1rMMUEnuCmEvNDVhKdHDmJv7bTdVR3?=
 =?iso-8859-1?Q?zzuko05TkumiezU8KkBH5Ut8NpBv8gw5Z555S3FIcAVG+viyHH2zDamzBG?=
 =?iso-8859-1?Q?kYI/kGHL9tKzXpiP+PGNWoa3/L7imjFfBT8BiUcJy0mza9IknqhsFswYkg?=
 =?iso-8859-1?Q?WFse6tQ3mp/an22iuUVsKroCZbKKWQ6hom6nUA6gLRUggW6rPryYAtEkGX?=
 =?iso-8859-1?Q?WBU7p6f1n4z+eP9OKs5bZVwnVzGQSxb9rIrzGUM3RloHgB?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB547334A5A8E66A578D131C6D82F59CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3434a443-2040-4871-5951-08da22ccf17a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 12:54:44.5878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjMc7rlAwqNeywv+7c/xqmnB06Y5Qt4wuBJXu9667nt3yzJ6fkQQLAGz5nqdZQEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_CO6PR12MB547334A5A8E66A578D131C6D82F59CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Chris,

1) Change the test case to use something larger than 1TiB.
sure, we can increase the size of BO and make test pass,
but if user really want to allocate 1TB GTT BO, we have no reason to let it=
 fail? right?
the system availed memory about 2T, but it will still fail.

2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc fallba=
ck path.
    the 5.18 kernel will add this patch to fix this issue .

Best Regards,
Kevin
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, April 20, 2022 8:42 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian K=F6nig <ckoenig.=
leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org <dri-devel@lists=
.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop=
.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Hi Kevin,

yes and that is perfectly valid and expected behavior. There is absolutely =
no need to change anything in TTM here.

What we could do is:
1) Change the test case to use something larger than 1TiB.
2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc fallba=
ck path.

Regards,
Christian.

Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):

[AMD Official Use Only]

Hi Chirs,

yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size() function t=
o verify bo size,
but when driver try to allocate VRAM domain bo fail, the amdgpu driver will=
 fall back to allocate domain =3D (GTT | VRAM)  bo.
please check following code, it will cause the 2nd time to allocate bo fail=
 during allocate 256Mb buffer to store dma address (via kvmalloc()).

        initial_domain =3D (u32)(0xffffffff & args->in.domains);
retry:
        r =3D amdgpu_gem_object_create(adev, size, args->in.alignment,
                                     initial_domain,
                                     flags, ttm_bo_type_device, resv, &gobj=
);
        if (r && r !=3D -ERESTARTSYS) {
                if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
                        flags &=3D ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
                        goto retry;
                }

                if (initial_domain =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {
                        initial_domain |=3D AMDGPU_GEM_DOMAIN_GTT;
                        goto retry;
                }
                DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %=
d)\n",
                                size, initial_domain, args->in.alignment, r=
);
        }

Best Regards,
Kevin

________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com><mailto:ckoenig.l=
eichtzumerken@gmail.com>
Sent: Wednesday, April 20, 2022 7:55 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@amd.co=
m>; Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@am=
d.com>; dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.=
org> <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.o=
rg>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <a=
md-gfx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Hi Kevin,

no, the test case should already fail in amdgpu_bo_validate_size().

If we have a system with 2TiB of memory where the test case could succeed t=
hen we should increase the requested size to something larger.

And if the underlying core Linux kernel functions don't allow allocations a=
s large as the requested one we should *NEVER* ever add workarounds like th=
is.

It is perfectly expected that this test case is not able to fulfill the des=
ired allocation. That it fails during kvmalloc is unfortunate, but not a sh=
ow stopper.

Regards,
Christian.


Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):

[AMD Official Use Only]

Hi Chris,

you misunderstood background about this case.

although we expect this test case to fail, it should fail at the location w=
here the Bo actual memory is actually allocated. now the code logic will ca=
use the failure to allocate memory to store DMA address.

e.g: the case is failed in 2TB system ram machine, it should be allocated s=
uccessful, but it is failed.

allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store allocat=
e result (page address), this should not be failed usually.

There is a similar fix in upstream kernel 5.18, before this fix entered the=
 TTM code, this problem existed in TTM.

kernel/git/torvalds/linux.git - Linux kernel source tree<https://nam11.safe=
links.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.kernel.org%2Fpub%2Fsc=
m%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv5.18-rc3=
%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&data=3D05%7C01%7CKevinYang=
.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sda=
ta=3DCiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&reserved=3D0>
mm: allow !GFP_KERNEL allocations for kvmalloc

Best Regards,
Kevin

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, April 20, 2022 6:53 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@amd.co=
m>; dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>;=
 amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-g=
fx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):

[AMD Official Use Only]


________________________________
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, April 20, 2022 5:00 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@amd.co=
m>; dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>;=
 amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-g=
fx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Am 20.04.22 um 10:56 schrieb Yang Wang:
> if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc()

Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
when __GFP_ZERO is set?

And even that is really the case then that sounds like a bug in kvmalloc().

Regards,
Christian.

[kevin]:
it is really test case from libdrm amdgpu test, which try to allocate a big=
 BO which will cause ttm tt init fail.


LOL! Guys, this test case is intended to fail!

The test consists of allocating a buffer so ridiculous large that it should=
 never succeed and be rejected by the kernel driver.

This patch here is a really clear NAK.

Regards,
Christian.

it may be a kvmalloc() bug, and this patch can as a workaround in ttm befor=
e this issue fix.

void *kvmalloc_node(size_t size, gfp_t flags, int node)
{
...
        if ((flags & GFP_KERNEL) !=3D GFP_KERNEL)
                return kmalloc_node(size, flags, node);
...
}

Best Regards,
Kevin

> to allocate memory, when request size is exceeds kmalloc limit, it will
> cause allocate memory fail.
>
> e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>
> Signed-off-by: Yang Wang <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@a=
md.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 79c870a3bef8..9f2f3e576b8d 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool z=
ero_alloc)
>   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
>        ttm->pages =3D kvmalloc_array(ttm->num_pages, sizeof(void*),
> -                     GFP_KERNEL | __GFP_ZERO);
> +                                 GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
> +
> +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
> +
>        return 0;
>   }
>
> @@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struct t=
tm_tt *ttm)
>        ttm->pages =3D kvmalloc_array(ttm->num_pages,
>                                    sizeof(*ttm->pages) +
>                                    sizeof(*ttm->dma_address),
> -                                 GFP_KERNEL | __GFP_ZERO);
> +                                 GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
>
> +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) + sizeo=
f(*ttm->dma_address)));
> +
>        ttm->dma_address =3D (void *)(ttm->pages + ttm->num_pages);
>        return 0;
>   }
> @@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm=
_tt *ttm)
>   {
>        ttm->dma_address =3D kvmalloc_array(ttm->num_pages,
>                                          sizeof(*ttm->dma_address),
> -                                       GFP_KERNEL | __GFP_ZERO);
> +                                       GFP_KERNEL);
>        if (!ttm->dma_address)
>                return -ENOMEM;
> +
> +     memset(ttm->dma_address, 0, ttm->num_pages * sizeof(*ttm->dma_addre=
ss));
> +
>        return 0;
>   }
>





--_000_CO6PR12MB547334A5A8E66A578D131C6D82F59CO6PR12MB5473namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 10.5pt; backgroun=
d-color: rgb(255, 255, 255); display: inline !important; color: rgb(0, 0, 0=
);" class=3D"elementToProof">Hi
 Chris,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 10.5pt; backgroun=
d-color: rgb(255, 255, 255); display: inline !important; color: rgb(0, 0, 0=
);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 10.5pt; backgroun=
d-color: rgb(255, 255, 255); display: inline !important; color: rgb(0, 0, 0=
);">1)
 Change the test case to use something larger than 1TiB.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 10.5pt; color: rg=
b(0, 0, 0); background-color: rgb(255, 255, 255);">sure, we can increase th=
e
 size of BO and make test pass,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 10.5pt; color: rg=
b(0, 0, 0); background-color: rgb(255, 255, 255);">but if user really want
 to allocate 1TB GTT BO, we have no reason to let it fail? right?&nbsp;</sp=
an></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 10.5pt; color: rg=
b(0, 0, 0); background-color: rgb(255, 255, 255);">the system availed memor=
y
 about 2T, but it will still fail.</span></div>
<div style=3D"color: rgb(0, 0, 0);" class=3D"elementToProof"><font face=3D"=
Calibri, Arial, Helvetica, sans-serif"><br style=3D"background-color: rgb(2=
55, 255, 255);">
</font></div>
<div style=3D"color: rgb(0, 0, 0);" class=3D"elementToProof"><span style=3D=
"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot=
;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;H=
elvetica Neue&quot;, sans-serif; font-size: 14px; background-color: rgb(255=
, 255, 255); display: inline !important;">2)
 Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc fallback=
 path.</span></div>
<div style=3D"color: rgb(0, 0, 0);" class=3D"elementToProof"><span style=3D=
"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot=
;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;H=
elvetica Neue&quot;, sans-serif; font-size: 14px; background-color: rgb(255=
, 255, 255); display: inline !important;">&nbsp;
 &nbsp; the 5.18 kernel will add this patch to fix this issue .</span></div=
>
<div style=3D"color: rgb(0, 0, 0);" class=3D"elementToProof"><span style=3D=
"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot=
;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;H=
elvetica Neue&quot;, sans-serif; font-size: 14px; background-color: rgb(255=
, 255, 255); display: inline !important;"><br>
</span></div>
<div style=3D"color: rgb(0, 0, 0);" class=3D"elementToProof"><span style=3D=
"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot=
;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;H=
elvetica Neue&quot;, sans-serif; font-size: 14px; background-color: rgb(255=
, 255, 255); display: inline !important;">Best
 Regards,</span></div>
<div style=3D"color: rgb(0, 0, 0);" class=3D"elementToProof"><span style=3D=
"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot=
;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;H=
elvetica Neue&quot;, sans-serif; font-size: 14px; background-color: rgb(255=
, 255, 255); display: inline !important;">Kevin</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 20, 2022 8:42 PM<br>
<b>To:</b> Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;; Christian K=F6=
nig &lt;ckoenig.leichtzumerken@gmail.com&gt;; dri-devel@lists.freedesktop.o=
rg &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freedesktop.org &=
lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof">Hi Kevin,<br>
<br>
yes and that is perfectly valid and expected behavior. There is absolutely =
no need to change anything in TTM here.<br>
<br>
What we could do is:<br>
1) Change the test case to use something larger than 1TiB.<br>
2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc fallba=
ck path.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<div class=3D"x_moz-cite-prefix">Am 20.04.22 um 14:39 schrieb Wang, Yang(Ke=
vin):<br>
</div>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;font-family:=
Arial; font-size:10pt; color:#0000FF; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Hi Chirs,</span></div=
>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">yes, right, the amdgp=
u drive rwill use&nbsp;</span><span style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; background-color:rgba(0,0,0,0); color:rgb=
(0,0,0); display:inline!important">amdgpu_bo_validate_size()
 function to verify bo size,</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; background-color:rgba(0,0,0,0); display:inline!important; color:rgb(0,0=
,0)">but when driver try to allocate VRAM domain bo fail, the amdgpu driver=
 will fall back to allocate domain
 =3D (GTT | VRAM)&nbsp; bo.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; color:rgb(0,0,0)">
<span style=3D"font-size:12pt; font-family:Calibri,Arial,Helvetica,sans-ser=
if; background-color:rgba(0,0,0,0); display:inline!important; color:rgb(0,0=
,0)">please check following code, it will cause the 2</span><span style=3D"=
font-family:Calibri,Arial,Helvetica,sans-serif; background-color:rgba(0,0,0=
,0); color:rgb(0,0,0); display:inline!important"><span style=3D"font-size:1=
3.3333px">nd
 time</span><span style=3D"font-size:12pt">&nbsp;to allocate bo fail during=
 allocate 256Mb buffer to store dma address (via kvmalloc()).</span></span>=
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D""><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; background-color:rgba(0,0,0,0); display:inline!important; color:rgb(0,0=
,0)">&nbsp; &nbsp; &nbsp; &nbsp; initial_domain =3D (u32)(0xffffffff &amp; =
args-&gt;in.domains);</span><span style=3D"">
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">retry:</span></d=
iv>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; r =3D amdgpu_gem_object_create(adev, size, args-&gt;in.alignmen=
t,</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;initial_domain,</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;flags, ttm_bo_type_device, resv, &=
amp;gobj);</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; if (r &amp;&amp; r !=3D -ERESTARTSYS) {</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (flags &amp; AMDGPU_GEM_CREATE_C=
PU_ACCESS_REQUIRED) {</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; flags &=
amp;=3D ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto re=
try;</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
<div><br>
</div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (initial_domain =3D=3D AMDGPU_GE=
M_DOMAIN_VRAM) {</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; initial=
_domain |=3D AMDGPU_GEM_DOMAIN_GTT;</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto re=
try;</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DRM_DEBUG(&quot;Failed to allocate =
GEM object (%llu, %d, %llu, %d)\n&quot;,</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; size, initial_domain, args-&gt;in.alignment, r);</span=
></div>
</span><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-=
size:12pt; background-color:rgba(0,0,0,0); display:inline!important; color:=
rgb(0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; }</span><span style=3D""><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Best Regards,</span><=
/div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Kevin</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig
<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" data-auth=3D"NotApplica=
ble" class=3D"x_moz-txt-link-rfc2396E">
&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 7:55 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; Koenig, Christian <a href=3D"mailto:Chr=
istian.Koenig@amd.com" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-=
rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.fre=
edesktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-abbreviat=
ed">
dri-devel@lists.freedesktop.org</a> <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href=3D"mailto:amd-gfx@list=
s.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-abbr=
eviated">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_elementToProof">Hi Kevin,<br>
<br>
no, the test case should already fail in amdgpu_bo_validate_size().<br>
<br>
If we have a system with 2TiB of memory where the test case could succeed t=
hen we should increase the requested size to something larger.<br>
<br>
And if the underlying core Linux kernel functions don't allow allocations a=
s large as the requested one we should *NEVER* ever add workarounds like th=
is.<br>
<br>
It is perfectly expected that this test case is not able to fulfill the des=
ired allocation. That it fails during kvmalloc is unfortunate, but not a sh=
ow stopper.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<br>
<div class=3D"x_x_moz-cite-prefix">Am 20.04.22 um 13:32 schrieb Wang, Yang(=
Kevin):<br>
</div>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0=
px; margin-bottom:0px; font-family:Arial; font-size:10pt; color:#0000FF; ma=
rgin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Hi Chris,</span></div=
>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">you misunderstood bac=
kground about this case.</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)"><br>
</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">a</span><span style=
=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-serif; font-=
size:12pt; background-color:rgba(0,0,0,0)">lthough
 we expect this test case to fail, it should fail at the location where the=
 Bo actual memory is actually allocated. now the code logic will cause the =
failure to allocate memory to store DMA address.</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)"><br>
</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)"><span style=3D"backgr=
ound-color:rgb(255,255,255); display:inline!important">e.g:&nbsp;</span>the=
 case is failed in 2TB system ram machine,
 it should be allocated successful, but it is failed.</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt"><br>
</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)">allocate 1TB BO, the =
ttm should allocate 1TB/4k * 8 buffer to store allocate result (page addres=
s), this should not be failed usually.</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><br>
</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif">There is a similar fi=
x in upstream kernel 5.18, b</span><span style=3D"color:rgb(0,0,0); font-si=
ze:12pt; background-color:rgba(0,0,0,0); font-family:Calibri,Arial,Helvetic=
a,sans-serif">efore
 this fix entered the TTM code, this problem existed in TTM.</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><br>
</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><a href=3D"https://na=
m11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.kernel.org%2F=
pub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv=
5.18-rc3%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&amp;data=3D05%7C01=
%7CKevinYang.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DCiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&amp;r=
eserved=3D0" data-auth=3D"Verified" originalsrc=3D"https://git.kernel.org/p=
ub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=3Dv5.18-rc3&amp;id=3Da=
421ef303008b0ceee2cfc625c3246fa7654b0ca" shash=3D"KMFRekIa5um9dneRj4pqsGBn2=
wIcYBwLUel6we5AalD06U/g9WcKPxBwS4F9Mgfpnqpq0GbN+8AA16pzy6v+Ay23e5shnO53IP8e=
7UcwQUE0fw1Wd4T+gBBF8PJiMugXDZiWlVYrV3tySgoFbmz+CuFzrYJbobUVj6E5khawPfo=3D"=
 id=3D"LPlnk660272">kernel/git/torvalds/linux.git
 - Linux kernel source tree</a><br>
</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span class=3D"x_x_commit-subject" style=3D"font-size:12pt; margin:1.5em 0e=
m 0.5em; padding:0em; color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica=
,sans-serif; background-color:rgb(255,255,255)">mm: allow !GFP_KERNEL alloc=
ations for kvmalloc</span><br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<div><br>
</div>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Best Regards,</span><=
/div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Kevin</span><br>
<div><br>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 6:53 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-abbreviat=
ed x_moz-txt-link-freetext">
dri-devel@lists.freedesktop.org</a> <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E"=
>
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href=3D"mailto:amd-gfx@list=
s.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-ab=
breviated x_moz-txt-link-freetext">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div>Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0=
px; margin-bottom:0px; margin-top:0px; margin-bottom:0px; font-family:Arial=
; font-size:10pt; color:#0000FF; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri,=0A=
                        sans-serif" color=3D"#000000" style=3D"font-size:11=
pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_x_x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_x_x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_x_moz-txt-link-abbrevi=
ated x_x_moz-txt-link-freetext x_moz-txt-link-freetext">
dri-devel@lists.freedesktop.org</a> <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_x_moz-txt-link-rfc2396=
E">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href=3D"mailto:amd-gfx@list=
s.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_x_x_moz-txt-link-=
abbreviated x_x_moz-txt-link-freetext x_moz-txt-link-freetext">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org" data-auth=3D"NotApplicable" class=3D"x_x_x_moz-txt-link-rfc2396E">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size=
:11pt">
<div class=3D"x_x_x_PlainText x_x_x_elementToProof">Am 20.04.22 um 10:56 sc=
hrieb Yang Wang:<br>
&gt; if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc=
()<br>
<br>
Hui what? Why should kvmalloc() not be able to fallback to vmalloc() <br>
when __GFP_ZERO is set?<br>
<br>
And even that is really the case then that sounds like a bug in kvmalloc().=
</div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><br>
Regards,<br>
Christian.</div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><br>
<div class=3D"x_x_x_PlainText" style=3D"margin:0px; background-color:rgb(25=
5,255,255)">
[kevin]:</div>
</div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">it is real=
ly test case from libdrm amdgpu test, which try to allocate a big BO which =
will cause ttm tt init fail.</span><br>
</div>
</span></font></div>
</div>
</blockquote>
<br>
<br>
LOL! Guys, this test case is intended to fail!<br>
<b><br>
</b>The test consists of allocating a buffer so ridiculous large that it sh=
ould never succeed and be rejected by the kernel driver.<br>
<br>
This patch here is a really clear NAK.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<blockquote type=3D"cite">
<div>
<div class=3D"x_x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size=
:11pt">
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">it may be =
a kvmalloc() bug, and this patch can as a workaround in<span style=3D"backg=
round-color:rgb(255,255,255); display:inline!important">&nbsp;ttm</span>&nb=
sp;before
 this issue fix.</span></div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)"><br>
</span></div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">void *kvma=
lloc_node(size_t size, gfp_t flags, int node)&nbsp;<br>
</span></div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">{</span></=
div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">...</span>=
</div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">&nbsp; &nb=
sp; &nbsp; &nbsp; if ((flags &amp; GFP_KERNEL) !=3D GFP_KERNEL)<br>
</span></div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return kmalloc_node(size, fla=
gs, node);<br>
</span></div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">...</span>=
</div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><span class=3D"x_x_x_Pl=
ainText" style=3D"margin:0px; background-color:rgb(255,255,255)">}</span></=
div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof"><br>
</div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof">Best Regards,</div>
<div class=3D"x_x_x_PlainText x_x_x_elementToProof">Kevin<br>
<br>
&gt; to allocate memory, when request size is exceeds kmalloc limit, it wil=
l<br>
&gt; cause allocate memory fail.<br>
&gt;<br>
&gt; e.g: when ttm want to create a BO with 1TB size, it maybe fail.<br>
&gt;<br>
&gt; Signed-off-by: Yang Wang <a href=3D"mailto:KevinYang.Wang@amd.com" dat=
a-auth=3D"NotApplicable" class=3D"x_x_x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a><br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---<br>
&gt;&nbsp;&nbsp; 1 file changed, 11 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt=
.c<br>
&gt; index 79c870a3bef8..9f2f3e576b8d 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, boo=
l zero_alloc)<br>
&gt;&nbsp;&nbsp; static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)=
<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_a=
rray(ttm-&gt;num_pages, sizeof(void*),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *=
 sizeof(void *));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struc=
t ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_a=
rray(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*tt=
m-&gt;pages) +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*tt=
m-&gt;dma_address),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt;&nbsp;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *=
 (sizeof(*ttm-&gt;pages) + sizeof(*ttm-&gt;dma_address)));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D (voi=
d *)(ttm-&gt;pages + ttm-&gt;num_pages);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt; @@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct =
ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D kvma=
lloc_array(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;dma_address),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFP_KERNEL | __GFP_ZERO);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;dma_address)<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;dma_address, 0, ttm-&gt;num_p=
ages * sizeof(*ttm-&gt;dma_address));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
<br>
</div>
</span></font></div>
</div>
</blockquote>
<br>
</div>
</div>
</blockquote>
<br>
</div>
</div>
</blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_CO6PR12MB547334A5A8E66A578D131C6D82F59CO6PR12MB5473namp_--
