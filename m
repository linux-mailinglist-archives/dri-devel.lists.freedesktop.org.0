Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D806B5088BA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D915610E5EE;
	Wed, 20 Apr 2022 13:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21F910E5EE;
 Wed, 20 Apr 2022 13:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0PN67aDSOYM2OkqaRprFZauOefhKC+hiDvBNIHZaNvYSDvFPDEwotnE4aNa4I+qUegY9BLCAPQp7p1SKpcIjUmjh02Jw0jUxLqVqNzvg68TeM1lxwGZivsWrPisbLjXPolyPR9TbrIbGpd67qJgMwm/APl98b5Zy4sG11JwoGwsrRTS2zaMrYhEMNUjKM5BmVfyzncvGFn4sWSRjj8bKTDlp2X1qlS7pt4c1XJHXLGKoNcEpwGkQpeP2Yrvdd9tK6VK7FnjkYIma2o60Tb3hqy5eD4Jb3z5yAuTbGE0sizZX8MD2MaOUQe5YzufTnHfTCSX4sPpICilVfVLnMCzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ntaa45fd8+StAuve+e0dpYs9/KAOwJWIXhlDorICK/s=;
 b=dYHvjOL/dV3u6a19E3lzx/hKgo0/wauBwKsc7cXSWEoky8LC/ZYUkk3Yu8OfqewodynfYnYvO9m4mcl67iX/evn1rWpM2rBB8qkkfajX1zuuVFaRp16SR5eBpsQ6lcUttFenYD1E9S0INOlW2rPWnCJg3KH5q3dPyv2yo9Yx1f3VuM8bZd0ktTklc6duhMNWWdiSTesVr44THfMZj4FHzM6q3P2JKukPPoJBENAWuSqYv7Xg4JvMcja/2xQrN76SdW9aWwldgDzb08hCEwIR0i90t26DGi8IOFuPy+pg5C4EblQe68jeGpiD8ZqvuI14sUl6euVgVRRcFD/VCOOc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntaa45fd8+StAuve+e0dpYs9/KAOwJWIXhlDorICK/s=;
 b=rZlS/bN7WwdZA+8USLq7+EVnhOHdkTAc2MD+NbD/ltVpOn/ftLrzd7F76oe4pfs2coMGWaXCj5QleF203wd2K6tP2bOUmDF61o3HEoyL+upAGBl7rD7FyIJ+tCdrSHmoM+69+qebTdWjFHvEyNbe3Im1394nuyJ9BPOLASu3CBw=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by MWHPR1201MB0128.namprd12.prod.outlook.com (2603:10b6:301:56::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 13:04:13 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 13:04:13 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Topic: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Index: AQHYVJSHP8/0hJsFF022HGuI3b/QKKz4gPOAgAAAasOAAB8mgIAAB9e4gAAJlwCAAAiMCIAABHyAgAABxZ+AAAJMAIAAAc75
Date: Wed, 20 Apr 2022 13:04:12 +0000
Message-ID: <CO6PR12MB54735455C5C4CE0E397A3EB982F59@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
 <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
In-Reply-To: <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-20T13:04:13.219Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fd94db7-4270-406a-6ee1-08da22ce4438
x-ms-traffictypediagnostic: MWHPR1201MB0128:EE_
x-microsoft-antispam-prvs: <MWHPR1201MB0128265D28055B4C3B75419182F59@MWHPR1201MB0128.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jPS8oCjv1OfUo5CssVngQY8JNMU9W5u27fHAdKTgZ6YF48Noxfd6fHZCmptTlL7EzVOg5nAeBKURlCx/U2vbtoTR5aKJSk441HKHdSe1ZAEu2aBWMTAe980sU+3Xl1Ggw20GU3E9YtWvpkxRF0e4shYXpVAhxo9NJilU+QZHxOiqeqjBfGUFMG43RHGXuSu2Z3eyWK2MmBA9UDkmCCQGeE0JrjgGc93n8iknYd5bLWRVdUCD0d5cLmlyRsqIe7UJdvFO2zV3Ngqmgxr7shynK37vvsJSmDXpaAaDV+7G9aHnhVfEVNyl1ovRyE2mk4LphgGYIHZnLcMumbCAhJsS/kFARWEkPAiCM8AuKR6nuJ+0OvQ51mXSf4egI3d92B+GELyc6QEvOCf7sUi7+YWNRuMD8mc/csrZvzF9dvOBPJXgLHXF+yoORufuS7xDT9DCDcDlJ/xboFEj0WVgD8ins84oysnj9MlfgsjnjaIw1vnIT3VlR5UJ71UKIszdoObrWH8I74gNu4TVnXR3ADvr0YoBsu1Oa4XOPShekWqumjplCYgvl8b089GOuNOvdcm5tdGabDog28oJTAcq/Z9Es0pmIDSmI/FzHKpMUGVr9m5csWvAKAD2Zd6cr1p7VxkAm5HwDPc6bzfqooDbCSQPLDHgWabelei1XuGGSeW937KfNuGv/VLKKgV3SSQPOrDm5Ik7pjBuSejHjCEYgYIavAg461KUcPecxipvfzMb++S45hphLVHrXad+PALBuF46bFLwDcTn/4YIfCS70aUivxIuDOJzEEkL3nx4/FsPLSU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(8936002)(66476007)(38070700005)(66556008)(166002)(76116006)(53546011)(110136005)(66946007)(33656002)(8676002)(64756008)(66446008)(5660300002)(316002)(38100700002)(71200400001)(86362001)(19627405001)(2906002)(52536014)(508600001)(55016003)(91956017)(66574015)(186003)(6506007)(7696005)(26005)(83380400001)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Gea7n/DtX2UzE5T7WyvnZZRukfZBos048GHxYhyRY9e0AB2VLaTNJQ3By9?=
 =?iso-8859-1?Q?2zCUH8bHxAY8MXo45A6iIpEo37FxOKkzgWymKq/38GzEk59jIkeeXIcUe2?=
 =?iso-8859-1?Q?pFIxJFbqfAh4JbhNwqhJJWwYL6IEpZsN5XgDLCnKMD67MD+3SAlV7MfPOE?=
 =?iso-8859-1?Q?jfyaDcQ+ArzGYvwLhkwG48u/m8CwpriVNucRNXZhHdd+ZqIc0x6y5Dw529?=
 =?iso-8859-1?Q?Q1VRVZTqrDfrihcASZzmZj80Rhr33tqJT+JcOaKWjL0gJfvA2Q2b8UTWMp?=
 =?iso-8859-1?Q?aPtXPDfb1FFBt99EQPo1rNVxXVLiAzW851TXtOCVn8GsXikkyGaT+bYu2s?=
 =?iso-8859-1?Q?+QKEeYuJiopBvtuBXHtdNyH2CX8gtnK59DOY9WkNqh3zPWWhLb3Grh8O1m?=
 =?iso-8859-1?Q?A1WQvqvKOuJ3BriR2P5zp4SeSybc+X1Vxi+C9ijReR4PDD0seB1u+dEu3g?=
 =?iso-8859-1?Q?qorbezuFAZCQDMVVdt84y6Gg2UE8r5M1TnSmFdB/Nwvh6kjgWk4+2B5/QU?=
 =?iso-8859-1?Q?LC94XN0SHbMc6lUMSms7A1zJXZaWRS1uE4kHPB0bVllqYOrQaTP/8uHArl?=
 =?iso-8859-1?Q?vEL9CCGKNJXUxIHrQU4RfmPNdMtuhKaJVA6ThhMRumPD871DbejGnn4aD0?=
 =?iso-8859-1?Q?Kgvm9Go2bjUz/7kJXw/omChHGoaE7IRhYXNI71KpyHZcUQZqo64unPTYDT?=
 =?iso-8859-1?Q?GxXv1dsZEgHBg02/ZZjHPz/Uejo/blWaNYR3wR047Tqcbn4MWcZEYLmDl2?=
 =?iso-8859-1?Q?phcvj5VtskH1HbIyH8u9f8jW/Vhw7kb9GEDAKHL28VK5usNehnMmdYamun?=
 =?iso-8859-1?Q?4wnugIaBmhROxzXghJ9adMWcybvF5SUDQlVbJg7EF6aHJ3Mscg2ofrUSKq?=
 =?iso-8859-1?Q?/qwE0I6dp03byU4JtTCx1KSjjgNCYcdGxVPVT5soE+s8eaamuPGcUzp4UF?=
 =?iso-8859-1?Q?N+iD8QRW9sxWNLOAIDxR+z7p4KEzgwIQ0+T5AxdTbMOqfWzjSRKFDyPQhn?=
 =?iso-8859-1?Q?gfGCU67uIVfNGvYo3szWO7LRviMf9ZQTp6v3iZvR1dMLXyfUErThcjA3Vd?=
 =?iso-8859-1?Q?q8aR9pHq3gFo11KHJtJeuMpDS+DRaeuBRNu73KHKp9XerGbmGci/qVywln?=
 =?iso-8859-1?Q?ywlMCCm3+QG6jpJ7GtwvP0/do2oM2WZlN9TraBIWQKc35vd5Dy72Yp6Hq4?=
 =?iso-8859-1?Q?JsSmtzXIDcA07Sr2yhVZaXGl328e2hXb2zenbh1ehY29VfWO6KnrCS3FVp?=
 =?iso-8859-1?Q?UDU9BNXcUQ9RIlVT4x4ehwg4hG9kzlB1gW2MbLVWRVYYpLg5zL16vOnCAL?=
 =?iso-8859-1?Q?/HD2X67gEampiSCf5EL0/7tjUlq2zERYnYbqeSwFQxoSDIwEKm3Cjv45s9?=
 =?iso-8859-1?Q?GiTRrwm0nMp89cqx70AZbzwQl6rZsJR5y1H0jtboz/BpjaczwftikYvyGi?=
 =?iso-8859-1?Q?64EC4YYQTvADlX+7CPrEK5FVYC+SGe0/de20QxlbT/kY2Ax7wC/svcJXNq?=
 =?iso-8859-1?Q?ydRyg4uHkWGERnJTaEUwq3ZyDTxTAmI9dhuDUj7SqzfRNYRbbp3+lbTqAu?=
 =?iso-8859-1?Q?8vY+BHBZKoBNiUQApK+hvUh721tFQgJEnXwRfBI/wQeGNOOJDNMVvQdpht?=
 =?iso-8859-1?Q?kRIUOHq0eXJ/J8M9N6ydlwZ30fK8s/zx8szvgHG67D1SLoU1KW71YeBgE1?=
 =?iso-8859-1?Q?xNEeElQ85AjR2xUu4s0f+3P5LXWxcjnmekI901vBixCf7LY5BP8x3XXjmX?=
 =?iso-8859-1?Q?MaswFA8t66tprOujh3w7mHhmtVl/2t2K3yQxUtjNwxXAO5?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB54735455C5C4CE0E397A3EB982F59CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd94db7-4270-406a-6ee1-08da22ce4438
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 13:04:12.9346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZTsqKqgfnHD5+sCKq1umPKMNSsQsfKuvKPWfAw2fgcG5jWWzrhNSL+cO7+wQEUy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0128
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

--_000_CO6PR12MB54735455C5C4CE0E397A3EB982F59CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]



________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, April 20, 2022 8:56 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian K=F6nig <ckoenig.=
leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org <dri-devel@lists=
.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop=
.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):

[AMD Official Use Only]

Hi Chris,

1) Change the test case to use something larger than 1TiB.
sure, we can increase the size of BO and make test pass,
but if user really want to allocate 1TB GTT BO, we have no reason to let it=
 fail? right?

No, the reason is the underlying core kernel doesn't allow kvmalloc allocat=
ions with GFP_ZERO which are large enough to hold the array of allocated pa=
ges for this.

We are working on top of the core Linux kernel and should *NEVER* ever add =
workarounds like what was suggested here.

Regards,
Christian.


Kevin:

it is ok to explain why we do not need fix this issue at this stage.

thanks.

Best Regards,
Kevin
the system availed memory about 2T, but it will still fail.

2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc fallba=
ck path.
    the 5.18 kernel will add this patch to fix this issue .

Best Regards,
Kevin
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, April 20, 2022 8:42 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@amd.co=
m>; Christian K=F6nig <ckoenig.leichtzumerken@gmail.com><mailto:ckoenig.lei=
chtzumerken@gmail.com>; dri-devel@lists.freedesktop.org<mailto:dri-devel@li=
sts.freedesktop.org> <dri-devel@lists.freedesktop.org><mailto:dri-devel@lis=
ts.freedesktop.org>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.fre=
edesktop.org> <amd-gfx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesk=
top.org>
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






--_000_CO6PR12MB54735455C5C4CE0E397A3EB982F59CO6PR12MB5473namp_
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
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 20, 2022 8:56 PM<br>
<b>To:</b> Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;; Christian K=F6=
nig &lt;ckoenig.leichtzumerken@gmail.com&gt;; dri-devel@lists.freedesktop.o=
rg &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freedesktop.org &=
lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof">Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin=
):<br>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;font-family:=
Arial; font-size:10pt; color:#0000FF; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span class=3D"x_elementToProof" style=3D"">Hi Chris,</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D""><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"">1) Change the test case to use something larger than 1TiB.=
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"">sure, we can increase the size of BO and make test pass,</=
span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"">but if user really want to allocate 1TB GTT BO, we have no=
 reason to let it fail? right?
<br>
</span></div>
</div>
</blockquote>
<br>
No, the reason is the underlying core kernel doesn't allow kvmalloc allocat=
ions with GFP_ZERO which are large enough to hold the array of allocated pa=
ges for this.<br>
<br>
We are working on top of the core Linux kernel and should *NEVER* ever add =
workarounds like what was suggested here.<br>
<br>
Regards,<br>
Christian.<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Kevin:</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
it is ok to explain why we do not need fix this issue at this stage.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
thanks.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div class=3D"elementToProof">
<blockquote type=3D"cite">
<div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"">the system availed memory about 2T, but it will still fail=
.</span></div>
<div class=3D"x_elementToProof" style=3D"color:rgb(0,0,0)"><font face=3D"Ca=
libri, Arial, Helvetica, sans-serif"><br style=3D"background-color:rgb(255,=
255,255)">
</font></div>
<div class=3D"x_elementToProof" style=3D"color:rgb(0,0,0)"><span style=3D""=
>2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc fallb=
ack path.</span></div>
<div class=3D"x_elementToProof" style=3D"color:rgb(0,0,0)"><span style=3D""=
>&nbsp; &nbsp; the 5.18 kernel will add this patch to fix this issue .</spa=
n></div>
<div class=3D"x_elementToProof" style=3D"color:rgb(0,0,0)"><span style=3D""=
><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"color:rgb(0,0,0)"><span style=3D""=
>Best Regards,</span></div>
<div class=3D"x_elementToProof" style=3D"color:rgb(0,0,0)"><span style=3D""=
>Kevin</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 8:42 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; Christian K=F6nig <a href=3D"mailto:cko=
enig.leichtzumerken@gmail.com" data-auth=3D"NotApplicable" class=3D"x_moz-t=
xt-link-rfc2396E">
&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>; <a href=3D"mailto:dri-devel@l=
ists.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-a=
bbreviated">
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
<div class=3D"x_x_moz-cite-prefix">Am 20.04.22 um 14:39 schrieb Wang, Yang(=
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
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Hi Chirs,</span></div=
>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">yes, right, the amdgp=
u drive rwill use&nbsp;</span><span style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; background-color:rgba(0,0,0,0); color:rgb=
(0,0,0); display:inline!important">amdgpu_bo_validate_size()
 function to verify bo size,</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; background-color:rgba(0,0,0,0); display:inline!important; color:rgb(0,0=
,0)">but when driver try to allocate VRAM domain bo fail, the amdgpu driver=
 will fall back to allocate domain
 =3D (GTT | VRAM)&nbsp; bo.</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; color:rgb(0,0,0)">
<span style=3D"font-size:12pt; font-family:Calibri,Arial,Helvetica,sans-ser=
if; background-color:rgba(0,0,0,0); display:inline!important; color:rgb(0,0=
,0)">please check following code, it will cause the 2</span><span style=3D"=
font-family:Calibri,Arial,Helvetica,sans-serif; background-color:rgba(0,0,0=
,0); color:rgb(0,0,0); display:inline!important"><span style=3D"font-size:1=
3.3333px">nd
 time</span><span style=3D"font-size:12pt">&nbsp;to allocate bo fail during=
 allocate 256Mb buffer to store dma address (via kvmalloc()).</span></span>=
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D""><br>
</span></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
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
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Best Regards,</span><=
/div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Kevin</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig
<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" data-auth=3D"NotApplica=
ble" class=3D"x_x_moz-txt-link-rfc2396E">
&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 7:55 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; Koenig, Christian <a href=3D"mailto:Chr=
istian.Koenig@amd.com" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-lin=
k-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.fre=
edesktop.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-abbrevi=
ated x_moz-txt-link-freetext">
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
<div class=3D"x_x_elementToProof">Hi Kevin,<br>
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
<div class=3D"x_x_x_moz-cite-prefix">Am 20.04.22 um 13:32 schrieb Wang, Yan=
g(Kevin):<br>
</div>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0=
px; margin-bottom:0px; margin-top:0px; margin-bottom:0px; font-family:Arial=
; font-size:10pt; color:#0000FF; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Hi Chris,</span></div=
>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">you misunderstood bac=
kground about this case.</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)"><br>
</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">a</span><span style=
=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-serif; font-=
size:12pt; background-color:rgba(0,0,0,0)">lthough
 we expect this test case to fail, it should fail at the location where the=
 Bo actual memory is actually allocated. now the code logic will cause the =
failure to allocate memory to store DMA address.</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)"><br>
</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)"><span style=3D"backgr=
ound-color:rgb(255,255,255); display:inline!important">e.g:&nbsp;</span>the=
 case is failed in 2TB system ram machine,
 it should be allocated successful, but it is failed.</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt"><br>
</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)">allocate 1TB BO, the =
ttm should allocate 1TB/4k * 8 buffer to store allocate result (page addres=
s), this should not be failed usually.</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><br>
</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif">There is a similar fi=
x in upstream kernel 5.18, b</span><span style=3D"color:rgb(0,0,0); font-si=
ze:12pt; background-color:rgba(0,0,0,0); font-family:Calibri,Arial,Helvetic=
a,sans-serif">efore
 this fix entered the TTM code, this problem existed in TTM.</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><br>
</span></div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
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
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span class=3D"x_x_x_commit-subject" style=3D"font-size:12pt; margin:1.5em =
0em 0.5em; padding:0em; color:rgb(0,0,0); font-family:Calibri,Arial,Helveti=
ca,sans-serif; background-color:rgb(255,255,255)">mm: allow !GFP_KERNEL all=
ocations for kvmalloc</span><br>
</div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<div><br>
</div>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Best Regards,</span><=
/div>
<div class=3D"x_x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Kevin</span><br>
<div><br>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri,=0A=
                        sans-serif" color=3D"#000000" style=3D"font-size:11=
pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_x_x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 6:53 PM<br>
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
<div>Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0=
px; margin-bottom:0px; margin-top:0px; margin-bottom:0px; margin-top:0px; m=
argin-bottom:0px; font-family:Arial; font-size:10pt; color:#0000FF; margin:=
5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri,=0A=
                              sans-serif" color=3D"#000000" style=3D"font-s=
ize:11pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_x_x_x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_x_x_x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_x_x_moz-txt-link-abbre=
viated x_x_x_moz-txt-link-freetext x_x_moz-txt-link-freetext x_moz-txt-link=
-freetext">
dri-devel@lists.freedesktop.org</a> <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_x_x_moz-txt-link-rfc23=
96E">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href=3D"mailto:amd-gfx@list=
s.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_x_x_x_moz-txt-lin=
k-abbreviated x_x_x_moz-txt-link-freetext x_x_moz-txt-link-freetext x_moz-t=
xt-link-freetext">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org" data-auth=3D"NotApplicable" class=3D"x_x_x_x_moz-txt-link-rfc2396E"=
>
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_x_x_BodyFragment"><font size=3D"2"><span style=3D"font-si=
ze:11pt">
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof">Am 20.04.22 um 10:5=
6 schrieb Yang Wang:<br>
&gt; if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc=
()<br>
<br>
Hui what? Why should kvmalloc() not be able to fallback to vmalloc() <br>
when __GFP_ZERO is set?<br>
<br>
And even that is really the case then that sounds like a bug in kvmalloc().=
</div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><br>
Regards,<br>
Christian.</div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><br>
<div class=3D"x_x_x_x_PlainText" style=3D"margin:0px; background-color:rgb(=
255,255,255)">
[kevin]:</div>
</div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">it i=
s really test case from libdrm amdgpu test, which try to allocate a big BO =
which will cause ttm tt init fail.</span><br>
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
<div class=3D"x_x_x_x_BodyFragment"><font size=3D"2"><span style=3D"font-si=
ze:11pt">
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">it m=
ay be a kvmalloc() bug, and this patch can as a workaround in<span style=3D=
"background-color:rgb(255,255,255); display:inline!important">&nbsp;ttm</sp=
an>&nbsp;before
 this issue fix.</span></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)"><br>
</span></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">void=
 *kvmalloc_node(size_t size, gfp_t flags, int node)&nbsp;<br>
</span></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">{</s=
pan></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">...<=
/span></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">&nbs=
p; &nbsp; &nbsp; &nbsp; if ((flags &amp; GFP_KERNEL) !=3D GFP_KERNEL)<br>
</span></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return kmalloc_node(siz=
e, flags, node);<br>
</span></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">...<=
/span></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><span class=3D"x_x_=
x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,255,255)">}</s=
pan></div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof"><br>
</div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof">Best Regards,</div>
<div class=3D"x_x_x_x_PlainText x_x_x_x_elementToProof">Kevin<br>
<br>
&gt; to allocate memory, when request size is exceeds kmalloc limit, it wil=
l<br>
&gt; cause allocate memory fail.<br>
&gt;<br>
&gt; e.g: when ttm want to create a BO with 1TB size, it maybe fail.<br>
&gt;<br>
&gt; Signed-off-by: Yang Wang <a href=3D"mailto:KevinYang.Wang@amd.com" dat=
a-auth=3D"NotApplicable" class=3D"x_x_x_x_moz-txt-link-rfc2396E">
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
</blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_CO6PR12MB54735455C5C4CE0E397A3EB982F59CO6PR12MB5473namp_--
