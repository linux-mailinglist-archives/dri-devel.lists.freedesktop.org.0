Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4128C2C1D6
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 14:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1E210E3F4;
	Mon,  3 Nov 2025 13:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kiB5ft9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B79510E3F2;
 Mon,  3 Nov 2025 13:35:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOkHKtyumCk66S6I9Q34ztSLaeF/WpWM1GZch1uNdYgxF91MD+tP/k9zmsxgHZIvXHf5GJajyKP1PkcG7ODR39BPUVvkyXImK3DRNRbgUbVQRcJG8qjnvgV9FBVYYbxBQz06jEZG2Ac8/4DUwVjEM3rh//ckVOXSxg7J4tGKH90u/1TVDNNvWOuP2fhKZz6AgYHyAB2tOfOp9U247STEUeoygZIphnkofWMcV0KwFdb6Q5pvoS/ktSOx1mNA/05oHfJQpFt8Xc15jwemeJeH3KWjCEO1AYIrPixDTO1g8CFaAAgILtDrJoiFFuU5iauNjyAmKMArd6qzba9KQhYtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMiWSIGZwu7oi14uBmiIJh1lB4pt+AOtSZ/5zE3HTtU=;
 b=EA7jWbFaLOqK8nDkxBnHyaQb1UnkZXSzJ9USDSWtGcGuPUW3Rg19+Z3tAgOIpLiBYmAK+yIawwzYvifklW3FZMxDtlPnf3+KkYRoUsJ49kbdp3kV62EZUHdNy6yR47Gg+b8JiMBPBdS527obaikKio0G5nIC88OYgToHkT7Z+mLG20zVxAoL01yxyPEwWOixTRtq8aiV3p+CarlMYWlXWvJ6+qCV10XWwBNskf3LuEN/W4KmUs5Glovihf3FWRlEZfXhwqWy8BdyXLoP93pfCmSRXqnmF7pZOQRxokfbSshabR5wrjhG3i+WAcnW5TNkMDkDdW+RufDfptuoHp5pVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMiWSIGZwu7oi14uBmiIJh1lB4pt+AOtSZ/5zE3HTtU=;
 b=kiB5ft9iGGo5/hUHV02pgf9+/malN92XJnuak2b10AMisX2kYmloxq2+iyuiJmVHCUdILpELjKFcMIRqMN19rScm/DzkG7pDR3YitrgshTXFKS/U7MOl8rG9YPoxy1vO0HWBFXaOjZwJBHpYAGHaHVqR3Lj6TQ90zS74Sv+GAvWhChfdhNfPafjbmjSA/2MPX0uPBbfWKRcQmxvjn6UpuKtEJ9J1zMBlsKlppTRlOY4vJpqytDgFqEA4AaJLZnNWcgIvm1DnzWB1qKliPcdjXqmEHyP94pzoXSh4l7WZR4zRyIlF5Swq9zvcQWsTGPOOo7gZHBozbmtJtj/mTF0GlQ==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 13:35:38 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2%7]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 13:35:38 +0000
From: Ankit Agrawal <ankita@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie
 <airlied@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Brett Creeley
 <brett.creeley@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, Eric
 Farman <farman@linux.ibm.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Kirti Wankhede
 <kwankhede@nvidia.com>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Longfang Liu <liulongfang@huawei.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 "qat-linux@intel.com" <qat-linux@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Shameer Kolothum
 <skolothumtho@nvidia.com>, Mostafa Saleh <smostafa@google.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, Vineeth
 Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>, Zhenyu
 Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH 04/22] vfio/nvgrace: Convert to the get_region_info op
Thread-Topic: [PATCH 04/22] vfio/nvgrace: Convert to the get_region_info op
Thread-Index: AQHcRHIlF/rfkbKQs0yfm6gkKn/dfLTgkO6AgABzS70=
Date: Mon, 3 Nov 2025 13:35:38 +0000
Message-ID: <SA1PR12MB71995F75BF5229D56C732F43B0C7A@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <4-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <aQhOpec7prJD3zKm@google.com>
In-Reply-To: <aQhOpec7prJD3zKm@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|MN0PR12MB5977:EE_
x-ms-office365-filtering-correlation-id: 3215d734-4c2a-4eab-968f-08de1adde029
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?UxPelPCQkvbTTysBN2ORUUH9qBeRqsejMxWMrV3kcSyWEJ0TJd7kYvIw2i?=
 =?iso-8859-1?Q?bPliDHyj9FBJZf6V1jpXa9Tx0fMAc11pySpNjNtO5MKFbc4RIJh66m97TK?=
 =?iso-8859-1?Q?GM7P1ig5dJ+p60KG3gHA78jRDdgZ2+0sAEhGkMpiZstDHnbEbzHEVYqy+P?=
 =?iso-8859-1?Q?phyAJKh7ybp1n7Q2NOwTing64Rl0Mro/+ogawycS7jjKhTA1FmZZNIMFJh?=
 =?iso-8859-1?Q?jZwFdI97AQNzXfsvGmRgGeeTxe8HgJwPCxt+MBPfG27Wxgdkfrvm9GoGwR?=
 =?iso-8859-1?Q?uoh6zRaBZREVHRIbTiXl5+D5mW6AzsUCM00hMqwKBoc7d0IofpeZsg8N5W?=
 =?iso-8859-1?Q?TzNRxzv6djmVjm9VYkXfU8n+LdNWYVuxMc4KH1HqYw7s1yo9TZVH4RcYCQ?=
 =?iso-8859-1?Q?DQlwNpDsPjC/sgC7jUHqhHNKGj8JMpLx4PKV+1/+5He+EV5xFNlkHI2rgo?=
 =?iso-8859-1?Q?Hw4pXaiunPMnA13Beko5Hamx17AzaWfTk+ebVieHvuA8VMHjQJTzDkX1rb?=
 =?iso-8859-1?Q?vNar+i3la5TkCg2lI2skItfrxMhsx2S/ZSTDAzvzNruCs7ywM0vihvaw+F?=
 =?iso-8859-1?Q?gi/ffn0P/x0C3iPx16kEGjMrKDXVph0Ev9We/b18vsJgBUsO5K40+lLPp9?=
 =?iso-8859-1?Q?AqisYv3Yd6kFcdMpRurSx5h/l5JyrugCrNr4gNAK8yfbl2oXqIuw0dF3m9?=
 =?iso-8859-1?Q?1mzkYophzHUic/kfGyQEOgdqYYj4SeSDcV0km1FXUYFqj+lesNvTJMBwRk?=
 =?iso-8859-1?Q?+nhji0kM22cG2+Fl6ztaCnY7XJJoKTZZiwOBJbzarMO9mb1I5kSbnuOdPb?=
 =?iso-8859-1?Q?EX3dC5+rpXQGpkccd9Gjjm7Bf6sy/OqHxC0TkOza61VFLcvIKvxCABdk8b?=
 =?iso-8859-1?Q?DTD6/NehIJe38lD9ZvxU9xqr/eCZ+yCgkc+iTXHbMJWmSUbdgUe7Lh/S2r?=
 =?iso-8859-1?Q?ZQiNwkfl+6smVkv8KnCf2Rl2/hvmZcSdhOxa+17HBnfFZGp4qvs8eNiuTv?=
 =?iso-8859-1?Q?ZzUHbzj/6HsR6ocQYu1EOD5vIVaC46Lv/5EyjTCgfUT84P6Arv+ZIsVtPK?=
 =?iso-8859-1?Q?l1qIEAUV49GCdmfBUwUHgHSMZ8Kdd8GVdemI+SuiAOpebPQExLg5qsVu9q?=
 =?iso-8859-1?Q?ir9w/e/j8cvu2b8XWBM0uRIpqjjA7FcSKPnTBc+2sBLbUyBWE/wzkj90oK?=
 =?iso-8859-1?Q?kAv0OBYgslcJ+HhFkRlJCrjfjh+MEs2IUaaiH8xdnCXwQ2Z8Wbm7pOUb2Z?=
 =?iso-8859-1?Q?m7VeFhPwV2Hz1OTHhzVRNC7pM2va2YVAGKOFw15v6U+BWzsd6xml89iF6/?=
 =?iso-8859-1?Q?lrtehIzEJG/ntzIS3dlHI/Kw9n1rOdma1kQzn3vnOCLkl0PgikL5HaNm+h?=
 =?iso-8859-1?Q?meQO/xjHknJe9ITuSRloidCxsY7W6YIXyJQdPRmtllyC2fKqq3VTl2uCHU?=
 =?iso-8859-1?Q?AhCfAu+9UfEpuI17fwTIfRUeGqlhSb5lhnaV3/0ijSV9XkGBrpKrELX7Y7?=
 =?iso-8859-1?Q?S/jkA3lxAYOz3UUgw5txIp3foQLbUJ3u9gD1daGGa9Gmx8CVF+9b91Zf4e?=
 =?iso-8859-1?Q?tFPl6KPH5twgqrIH7c+Z7JkKWQ18?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7199.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Yn684iMqIbeUKLn5ZcHUI7MS2L3UMYAdqAX+QJ5Gaz8eTaUAstWnmin2W/?=
 =?iso-8859-1?Q?qV9481Lka2PHAWE9fJpIJPK0gtIIBAlqCdUYaLO8FCuVSlpKGRwUT55iPt?=
 =?iso-8859-1?Q?w2RCi7LB0IkR6/HNHYpuS4m2Onc0GUtuwhwd89AABXCjWZb7yACvwhSL67?=
 =?iso-8859-1?Q?T+Cf59ZvkxqVXY+LaiKK98mNt15tw7LBT9xMO1F0sfLmJ0mRfxCDa2iNhY?=
 =?iso-8859-1?Q?+dvtYVNjgLo6IKlMUuI3uhNTsG9RQZdY5hd1YXl7nKIRvX5Lts3m1o9TP2?=
 =?iso-8859-1?Q?MxFtik6o1mvvj7s710Ogcx6AGaRMb9aaajwkMaCGUti6Y4z5ehNUKFWjVP?=
 =?iso-8859-1?Q?6Rr2f0wDcpflrTNO+BhD/3+Ydcbw3xmij56EYovbbrhaUMaC/BVPA9AL/j?=
 =?iso-8859-1?Q?pNQIj4AGRsx8bnSpFP9I+ITyYYSgXterj6jPIxmMmwK3K4sTJJiZB57W52?=
 =?iso-8859-1?Q?CWZ9P0u0tAhszqQOXVDB8Y5UuXp7sV3JnyxqTZheQx8OX9kttKK2uWdIrP?=
 =?iso-8859-1?Q?JqdjnrzOQY4oJsZ6pipvijg2EbO3kbn9WLE2Jc1i8VW9bfQOjtnsdsGEqU?=
 =?iso-8859-1?Q?CU7DACbRF96zP7fLdqC1+1sOT8APHKp67P4GbXfGrxkCQkRroWygv2oXMZ?=
 =?iso-8859-1?Q?c11ndLwiSCTKmBRpQdasH4b+zyCAGO/Nev57d1jlyf+xTLO44irODFz9tQ?=
 =?iso-8859-1?Q?VdgCR4FNW459gD26yBx/XsYK7erZPvR13TY/ZD+eeO77m6ak2XUdTdDd5l?=
 =?iso-8859-1?Q?afPMY/IxEnNBTlZME3g7Vt1P0by4t90ReN1dIxasOJ6oCwRUZrBLfrlQ5V?=
 =?iso-8859-1?Q?jO6oyLc43nU3i2XZP+f38KQ4SU/cScPvp/qZcR+ml0am7/w1Y2q4lv7ABF?=
 =?iso-8859-1?Q?26j2gzMdeEcr3MeOUCLGA5NZs/QQxuFRCX0RYy5muZ9WxzVZbJov/DOvOV?=
 =?iso-8859-1?Q?sTnovHRMV6uUs2YiMDCkT5I2kq3Y9F1rQdDnR7kGP2LNYN8yNOBjzQ/UXE?=
 =?iso-8859-1?Q?KDvYSZm2ODM3b+xRKlkSNoLwNrretab+I1FZGT4SLbAIR+rphsYe92Fsjz?=
 =?iso-8859-1?Q?RHPBr2827zzc25N00kAF5hnEPTS+iXYNDZdyZLVDvQXBujyfISB5YZAiaa?=
 =?iso-8859-1?Q?n5e9FY4LYd/PWJVIzki9UNH9qfA8FImIkJCb/R2BErQUhOsbPCKn/xW/jI?=
 =?iso-8859-1?Q?cPTdRNg/XpOjMFh4ElFf0cyxfV6WwelqY3vnl+cNw0CB/ERxNMp+LKbNaI?=
 =?iso-8859-1?Q?Lqmlkh53CNkbv+jbhi1ADPb5CSpvvoL9T5Hwg1YujOq8xzYXx9PyblSpdP?=
 =?iso-8859-1?Q?kQpH0h39T/xZM5Bd1EkFuLVFgXnhs7VRurAUnYb8RZcpxfax1nqOxWIjrI?=
 =?iso-8859-1?Q?DyOw0Y7lx+2K208cnEGrFyIg8Qk52k0Ks0cigYhBAqr4O0Rss47Kk6jeHU?=
 =?iso-8859-1?Q?YtzMKDYvz4DEi8JxmSDH8opGwR2qZYDE1KrknakzukPGWchz6WEKVEGVmR?=
 =?iso-8859-1?Q?k7qNVz3MhfYh9iRpAY8pk2viKFgVUcOmqhJL8CED/WlKKopurq50bZWkXU?=
 =?iso-8859-1?Q?JKd7Wc1m9i37OhPwLJBX92zV/5PDs0OOjWTjTqmWTO6HUEc2I43hDY2FHs?=
 =?iso-8859-1?Q?WPF0KAekX9vq0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3215d734-4c2a-4eab-968f-08de1adde029
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 13:35:38.3869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2Su17dQsCBY9wbHFnR0jKpiJWkLpw75c+ljdlJCp3tkdnJoyXwtmHB+u02duA57+Z7SYNOkH2WMIAsO7hyMMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5977
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

>> Change the signature of nvgrace_gpu_ioctl_get_region_info()=0A=
>>=0A=
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>=0A=
>> ---=0A=
>>=A0 drivers/vfio/pci/nvgrace-gpu/main.c | 15 ++++++---------=0A=
>>=A0 1 file changed, 6 insertions(+), 9 deletions(-)=0A=
>=0A=
>=0A=
> Reviewed-by: Pranjal Shrivastava <praan@google.com>=0A=
=0A=
Reviewed-by: Ankit Agrawal <ankita@nvidia.com>=0A=
