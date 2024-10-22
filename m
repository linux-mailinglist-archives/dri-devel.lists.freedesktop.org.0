Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04659A9804
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 06:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E3410E2EC;
	Tue, 22 Oct 2024 04:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEY8m1i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1E10E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 04:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729572272; x=1761108272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D7bHheF2blo4aCX54SOc/u54lnxOHltaufc6LjIQjos=;
 b=QEY8m1i45B8uUr/ZjnjcQUjwmNJYqQng8Mdm2a/5usq29ExbhpW9zmqG
 2W81IAXjykU6pxGi62riZzw8hUu/j4j7PGGtXKeXivFhRi6zkyf0s8FzW
 AERuk+gFxS+AjOLoFl8Q0zkMHbZHtepn9WfOXZV3MIfOEHa14Z+KwHf1X
 WXLPwjdnEV1X3Yjcofd/hxE1kbCGNRbgM4F/O4rMGyQJzn7mHaBhQ0wnk
 wgoMXfPHJFiomppRhBukRXrP3y0TnVL+LLqSVFUoPvWNFBBx7uOQXbK3K
 VnhJHD5nUJNx9nnZ88t5W2kSxDdwmSX/3AXDJu5MA5erPJjrsB67/1vbX Q==;
X-CSE-ConnectionGUID: hfTJ79/lQjWT25or2Q3FKA==
X-CSE-MsgGUID: 8XHKLZ/iRbOIasiP80/g/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28537823"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="28537823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 21:44:31 -0700
X-CSE-ConnectionGUID: xe6pbC5XTQyD3NdhWAuBjw==
X-CSE-MsgGUID: WjUdPPHNTKmL0Xzb0JHh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="80147246"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 21:44:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 21:44:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 21:44:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 21:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZnMwpP/prSIB60ERe/1yz7oJUqiM/bmnjbSbfQ1UJeXg2gwk/DlPJy9BVEqSsa7JmLzDrFvJjFikH8ECZIjOeq6EixLULsdn3fL4I853gIaYnhjzTWPNw1lD8K4aEY03OzoNNnVzR/wtoJdmDwzyuX2IQMHMkyfPzx3f7eTuzEyXnJRQ3NnL71HarW98znJyPaI3QpwN7Mr8uVmZDnw7I8g+sKSpYqQpYLwURFmcCf4QMMKPBmc7KVpCWb5FXb+7O6b4kT1zo5AxnkYIshvoPqBxWn+Dp9mylWzTTfbjWgHy2jrwZqRb+yf/r//Ee3s6xGO+rvgSzqWlune1ngycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwceOMEYZCM1kbBjEZ8mALloClGb7RqOiNR3s0bDWR8=;
 b=boAQWQHDx7U8PbzHLreiwZI1h8GDm8oLDu3ZClGFCpy+xncL61wN5sZ7WQM18nBJ14pV6w0Gzu4xXE7mkLSli6WVYQe5SmyhW2K/zQBdIf51D1VftpiilZjGGjDO+m/t7D7NdTmHS9N8fcCEPl6Mr9frIyrXpsqviCDsnjsRey5OJdwKlQLAde/5DVJ3SzJlN/Xvw3krTb2jhhLfjRrfBTlcEaXn8QcKblFo9rcPqG+tkarUWAia1W+KtWLw3V5rQDZdk1vupETrLINi5S1B5Gxr2sRbjge2DIYQz3phsww+MKEUdi5xTY6RS+z8RqtK1KTG2zR58xHNGyS0DnSGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 04:44:19 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 04:44:19 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, "Kim, Dongwon" <dongwon.kim@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [PATCH v3 2/2] drm/virtio: New fence for every plane update
Thread-Topic: [PATCH v3 2/2] drm/virtio: New fence for every plane update
Thread-Index: AQHbI0UC0p0UX+vPmEiinRDwuLiwnrKSEXtQ
Date: Tue, 22 Oct 2024 04:44:19 +0000
Message-ID: <IA0PR11MB7185FA36BD2988FD75239C5EF84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
 <20241020230803.247419-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20241020230803.247419-2-dmitry.osipenko@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA1PR11MB6685:EE_
x-ms-office365-filtering-correlation-id: 8762cc82-3a80-4739-6f05-08dcf2543150
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+bW7Etp+vbSpX/TRVmGKhV9BYTNlZ9pldmr/4/xNsAnddG1Mnf8h6wXhaGZf?=
 =?us-ascii?Q?9vuyC+6Tn8BBqhGWnSIjLKKLOyDr9q6Zfqg0+8skPk2sGr6/GT5UkH0BM+l2?=
 =?us-ascii?Q?s2PgHcUH4pXuoC0htZyO1jl+XX8uO6XY4iVowLG8Q9sIU549oZUWCettLb0w?=
 =?us-ascii?Q?V3G34HuBq4yrrVoi5XwmFgsPXRZ92xph7qqnidzbgPnPTegbKECOeS6Ttf4t?=
 =?us-ascii?Q?jlE6ZsHydyyhYH9V0RbC3sCTQrNdur57wpVzrAGv6mcWjzrGMNLp1DcAixbf?=
 =?us-ascii?Q?iq/BMk9Fr1MjEI6vnUBMmFDFavv5yBn1o+3Sp+Iw5EIPMijE9OlNYsFVaD9T?=
 =?us-ascii?Q?sjdyaAbOZhQcxeW5vpwKo/2+M5cySM8ODcUdBYVMz5X5x7YJcpwGiHPoas9E?=
 =?us-ascii?Q?1E+LPfMNz4U68u1SD9riv4lo2GSTAl/i5IqRz1W2rLAqjqoCfyrEdwGgPI4C?=
 =?us-ascii?Q?sA5JxQdSM1nhEKSVI6+gDEbKUff1ES6DdwOWzBHnu2pqyMKIA1EpU20uJcE/?=
 =?us-ascii?Q?plrdddD6/Qv1ilW1qhnmeeGW37AkFbVXkvqW2JQTX0Q3k6gMhaQQSHrSA1jr?=
 =?us-ascii?Q?GHYcJ69rIcAAdSQYNA+ygPGir06lVDwXAAm2nATB+1sciD746SyR1vXINCcV?=
 =?us-ascii?Q?bUdvyrCsXVOU8moIBXtNOxKNZlRghRuckMecZggJzG7tw2hfl5/ylZ/abEiP?=
 =?us-ascii?Q?MGqZWpaiHGDWboVx+FdOjz+sp8sXw44enZMKf9gbPCPNQnZmg0IjM6xPjZli?=
 =?us-ascii?Q?M+0Bg0YKRt55rZa2vh9Q8smUeGz4RwccAR4WShw7+2Z/1w16vbppPnEYSjWR?=
 =?us-ascii?Q?HubKxVd5Khov0UwN4DaSVyiO0FQTJY6v7gAwkp9/t9eauU8/gUStSdPtQMk/?=
 =?us-ascii?Q?C/xVbMQwo2RuvVAKSGvglGW80dMdw328BOM4tJzuCJ9NKkgrNV8rwkc2hWb3?=
 =?us-ascii?Q?1CXvtjaxjO48GxoZ3Aeb3DXIjXv1PLkktIl1NxgmRX3s/pi91iM1SKqR0UMe?=
 =?us-ascii?Q?sL6Kz7mVZxPmJVUn2mQy8AHLGsNhybUM29/ORPq3LBian5z9B7d8xsjGMNB1?=
 =?us-ascii?Q?6RQiZhi2Z/hMoth0YvxBM0IpAFqxIynq1qTlnMNznql9OBIzXpNIk9Srr9GH?=
 =?us-ascii?Q?vNlaeo7gahiBZSJo0asxARgLO0lAfoUVwTMPMBGf5QOImi4bHPx7d78tJqDU?=
 =?us-ascii?Q?kelm8fGhGDhVt/nu3xWIxmB8KaxUdUtt3spYWrAV/vj2c1N0r5tIoxMOquW7?=
 =?us-ascii?Q?imtmAeGBJoSi3YjY9Whs8O+bL2MjWqK2EL2rpOKKgajLtaGopodVXvXOjlB5?=
 =?us-ascii?Q?McFu14f4PSCSd0Nnc0lrBXw4tpLQsCDbQvbTD979O9IUEicOfNjOWuS7PzwT?=
 =?us-ascii?Q?Y/feK/A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G55EgWZ73aW9cIXgtUUuAempfCYgQAw40WfsjNoJEpr2ovl/D3+mM4Cexbb0?=
 =?us-ascii?Q?Dl5OTwmTOmOuhaPvJbGnyR6I0tY2+JVRGg7PsqiZOBJxPz5YQwx7B7T+MfKj?=
 =?us-ascii?Q?l/ke+UPHBD4FnOmVyjeiu+QeZBYAwJfCL9AUg9jksE3qyHtM3YqowWqccIXw?=
 =?us-ascii?Q?5ehwmc1awmItT0F3LyFDWOONd85fzSyk9Z2hEcR9uLCU0bly4XfZtHsrfiYv?=
 =?us-ascii?Q?X7mQZGf1QmQ+i8Pvvx0ircsORTbUjGASV7IGhlWtKfEFNLsDQAoVqAwxicuM?=
 =?us-ascii?Q?kyvR54MR7rYcg6O6soW2Fzh87UGZXnzqTbF2JIUngmy6twKvTiiGimOdQtz/?=
 =?us-ascii?Q?lGxV3nID0mNwOsO1yq1Rdd1g6HrV9iTdDhAjNy12+mr8taaV8Ggnn4X86V2D?=
 =?us-ascii?Q?qxwuEJu0rHBTyCWM53vY1zVQ+k5ioMl1k0XWHhDMtzaSiESs+fZH+azfQA0w?=
 =?us-ascii?Q?ZmQogyuF/V+pq/Ur1cps5E0ZWbx0DkFNwvMxvcVBAv11/PKlPUG/YHJzqFfr?=
 =?us-ascii?Q?CFoQMY9zn3c0Quz1meit6QzxoDthjVX9mpGy6WQtR95+kh6dCduPfhjPwz/6?=
 =?us-ascii?Q?B90IcwUFiTLEsbPrTB3otrN5AKhNoPvQnuSAGLA4fl3zCKb0zRqKj8RnnCUt?=
 =?us-ascii?Q?w5o6S+gCSfit2IJ8YmUjvxfifg82hAdhwH31Px4yQGghA6gvmMnonXtuLWqE?=
 =?us-ascii?Q?0/4Q/7HJ73K9+b34IMap14ylNl134sW5lK4vTODxqvf6pW2OGeeolG5FcTv+?=
 =?us-ascii?Q?ypz7YcF0szaaajtmFV5BsGUlOqeFv0ArDawegmCkvemXmQUJaknBFLUtlDz2?=
 =?us-ascii?Q?DcAZSii3O8ZHlMVrj+rdM6LVNzn18jvgFz1fK+Sn5f2YFvFoixuQLw9Psr3X?=
 =?us-ascii?Q?ofWcn8IWWhmUiPEkE0iXVpMV4CCWGWR2m94R12tJq3x8biXHWHUuVpJq7x6v?=
 =?us-ascii?Q?/cBsCJHnkR75OINiPjCBzVENDSWgC1JYWKJJ+hJ00tyyJu/0En3V0u8J9paP?=
 =?us-ascii?Q?Y5LmzXqp8B4ED8BwQAX8QV5HXfQg/PSABExMBGA0GrsAgAIgJvmBgOKaSRR9?=
 =?us-ascii?Q?nvOD/GOs0DCRoqoLvtXRS293GQroPms2C33Wm/NInxLCnl0ciFybkUc9a6GN?=
 =?us-ascii?Q?93CsETTmPZC63D5da/i4G0ih8hqTU2qXN4Q/9y/ZJaVWqHl3Br7yQuZyUgwh?=
 =?us-ascii?Q?S5akCMZwCbjbZKCEJc37d3pNykV6Orgxj95Cvtu544r51FgnojZClFeUCMJN?=
 =?us-ascii?Q?uSdmFGo4tO0Ss8DIb/QuQoELdHy1b5ogdh3clFNWL9asrT/nxFE/IoAVHiLb?=
 =?us-ascii?Q?6CVWfQ6UFCDo6RO0wF1z3vE8rZM5ufyKGsMAwmuyFLZC5eXo32jXmiRqgU7U?=
 =?us-ascii?Q?ciRxjZtxccwRBJqKbEyq9OveBKuT+YzXZ50vxD7DMaIyvmr2qjj+JJaTPtMM?=
 =?us-ascii?Q?RcOUAkXhPcicijakOQ8rO6fTgNX7MIn79Chup8Vz/AbOVtU7LBP4tCUfSZet?=
 =?us-ascii?Q?d02gY3eYioWCMd6mI9wl22P9IK/Mi23TXnvwA8imAZda6tdxrRQjx5T9jj07?=
 =?us-ascii?Q?pi5LcJtbQAYvjRX1IRT3zqcRhfC+KlzBFK8FIykN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8762cc82-3a80-4739-6f05-08dcf2543150
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 04:44:19.8180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWCmBzh1DCk61QDxkUUYzP8vMDS/8tdi/yOBWQ3slFxc4SWH1MET/V1crbQAodLvIdx3+y++noGZo635PJRoCVY1QmXXyCIPGmlr2yDalKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

> Subject: [PATCH v3 2/2] drm/virtio: New fence for every plane update
>=20
> From: Dongwon Kim <dongwon.kim@intel.com>
>=20
> Having a fence linked to a virtio_gpu_framebuffer in the plane update
> sequence would cause conflict when several planes referencing the same
> framebuffer (e.g. Xorg screen covering multi-displays configured for an
> extended mode) and those planes are updated concurrently. So it is needed
> to allocate a fence for every plane state instead of the framebuffer.
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> [dmitry.osipenko@collabora.com: rebase, fix up, edit commit message]
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 ++++
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 58 +++++++++++++++++---------
>  2 files changed, 46 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 64c236169db8..5dc8eeaf7123 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -194,6 +194,13 @@ struct virtio_gpu_framebuffer {
>  #define to_virtio_gpu_framebuffer(x) \
>  	container_of(x, struct virtio_gpu_framebuffer, base)
>=20
> +struct virtio_gpu_plane_state {
> +	struct drm_plane_state base;
> +	struct virtio_gpu_fence *fence;
> +};
> +#define to_virtio_gpu_plane_state(x) \
> +	container_of(x, struct virtio_gpu_plane_state, base)
> +
>  struct virtio_gpu_queue {
>  	struct virtqueue *vq;
>  	spinlock_t qlock;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
> b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index ab7232921cb7..2add67c6b66d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -67,11 +67,28 @@ uint32_t virtio_gpu_translate_format(uint32_t
> drm_fourcc)
>  	return format;
>  }
>=20
> +static struct
> +drm_plane_state *virtio_gpu_plane_duplicate_state(struct drm_plane
> *plane)
> +{
> +	struct virtio_gpu_plane_state *new;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;
> +
> +	new =3D kzalloc(sizeof(*new), GFP_KERNEL);
> +	if (!new)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &new->base);
> +
> +	return &new->base;
> +}
> +
>  static const struct drm_plane_funcs virtio_gpu_plane_funcs =3D {
>  	.update_plane		=3D drm_atomic_helper_update_plane,
>  	.disable_plane		=3D drm_atomic_helper_disable_plane,
>  	.reset			=3D drm_atomic_helper_plane_reset,
> -	.atomic_duplicate_state =3D
> drm_atomic_helper_plane_duplicate_state,
> +	.atomic_duplicate_state =3D virtio_gpu_plane_duplicate_state,
>  	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
>  };
>=20
> @@ -139,11 +156,13 @@ static void virtio_gpu_resource_flush(struct
> drm_plane *plane,
>  	struct drm_device *dev =3D plane->dev;
>  	struct virtio_gpu_device *vgdev =3D dev->dev_private;
>  	struct virtio_gpu_framebuffer *vgfb;
> +	struct virtio_gpu_plane_state *vgplane_st;
>  	struct virtio_gpu_object *bo;
>=20
>  	vgfb =3D to_virtio_gpu_framebuffer(plane->state->fb);
> +	vgplane_st =3D to_virtio_gpu_plane_state(plane->state);
>  	bo =3D gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> -	if (vgfb->fence) {
> +	if (vgplane_st->fence) {
>  		struct virtio_gpu_object_array *objs;
>=20
>  		objs =3D virtio_gpu_array_alloc(1);
> @@ -152,13 +171,11 @@ static void virtio_gpu_resource_flush(struct
> drm_plane *plane,
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
>  		virtio_gpu_array_lock_resv(objs);
>  		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
> x, y,
> -					      width, height, objs, vgfb->fence);
> +					      width, height, objs,
> +					      vgplane_st->fence);
>  		virtio_gpu_notify(vgdev);
> -
> -		dma_fence_wait_timeout(&vgfb->fence->f, true,
> +		dma_fence_wait_timeout(&vgplane_st->fence->f, true,
>  				       msecs_to_jiffies(50));
> -		dma_fence_put(&vgfb->fence->f);
> -		vgfb->fence =3D NULL;
Not sure if it makes any difference but would there be a problem if you unr=
ef
the fence here (existing behavior) instead of deferring it until cleanup?

>  	} else {
>  		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
> x, y,
>  					      width, height, NULL, NULL);
> @@ -248,12 +265,14 @@ static int virtio_gpu_plane_prepare_fb(struct
> drm_plane *plane,
>  	struct drm_device *dev =3D plane->dev;
>  	struct virtio_gpu_device *vgdev =3D dev->dev_private;
>  	struct virtio_gpu_framebuffer *vgfb;
> +	struct virtio_gpu_plane_state *vgplane_st;
>  	struct virtio_gpu_object *bo;
>=20
>  	if (!new_state->fb)
>  		return 0;
>=20
>  	vgfb =3D to_virtio_gpu_framebuffer(new_state->fb);
> +	vgplane_st =3D to_virtio_gpu_plane_state(new_state);
>  	bo =3D gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>=20
>  	drm_gem_plane_helper_prepare_fb(plane, new_state);
> @@ -261,10 +280,11 @@ static int virtio_gpu_plane_prepare_fb(struct
> drm_plane *plane,
>  	if (!bo || (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY && !bo-
> >guest_blob))
>  		return 0;
>=20
> -	if (bo->dumb && (plane->state->fb !=3D new_state->fb)) {
> -		vgfb->fence =3D virtio_gpu_fence_alloc(vgdev, vgdev-
> >fence_drv.context,
> +	if (bo->dumb) {
> +		vgplane_st->fence =3D virtio_gpu_fence_alloc(vgdev,
> +						     vgdev->fence_drv.context,
>  						     0);
> -		if (!vgfb->fence)
> +		if (!vgplane_st->fence)
>  			return -ENOMEM;
>  	}
>=20
> @@ -274,15 +294,15 @@ static int virtio_gpu_plane_prepare_fb(struct
> drm_plane *plane,
>  static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
>  					struct drm_plane_state *state)
>  {
> -	struct virtio_gpu_framebuffer *vgfb;
> +	struct virtio_gpu_plane_state *vgplane_st;
>=20
>  	if (!state->fb)
>  		return;
>=20
> -	vgfb =3D to_virtio_gpu_framebuffer(state->fb);
> -	if (vgfb->fence) {
> -		dma_fence_put(&vgfb->fence->f);
> -		vgfb->fence =3D NULL;
> +	vgplane_st =3D to_virtio_gpu_plane_state(state);
> +	if (vgplane_st->fence) {
> +		dma_fence_put(&vgplane_st->fence->f);
> +		vgplane_st->fence =3D NULL;
>  	}
>  }
>=20
> @@ -295,6 +315,7 @@ static void virtio_gpu_cursor_plane_update(struct
> drm_plane *plane,
>  	struct virtio_gpu_device *vgdev =3D dev->dev_private;
>  	struct virtio_gpu_output *output =3D NULL;
>  	struct virtio_gpu_framebuffer *vgfb;
> +	struct virtio_gpu_plane_state *vgplane_st;
>  	struct virtio_gpu_object *bo =3D NULL;
>  	uint32_t handle;
>=20
> @@ -307,6 +328,7 @@ static void virtio_gpu_cursor_plane_update(struct
> drm_plane *plane,
>=20
>  	if (plane->state->fb) {
>  		vgfb =3D to_virtio_gpu_framebuffer(plane->state->fb);
> +		vgplane_st =3D to_virtio_gpu_plane_state(plane->state);
>  		bo =3D gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>  		handle =3D bo->hw_res_handle;
>  	} else {
> @@ -326,11 +348,9 @@ static void virtio_gpu_cursor_plane_update(struct
> drm_plane *plane,
>  			(vgdev, 0,
>  			 plane->state->crtc_w,
>  			 plane->state->crtc_h,
> -			 0, 0, objs, vgfb->fence);
> +			 0, 0, objs, vgplane_st->fence);
>  		virtio_gpu_notify(vgdev);
> -		dma_fence_wait(&vgfb->fence->f, true);
> -		dma_fence_put(&vgfb->fence->f);
> -		vgfb->fence =3D NULL;
Same comment as above.
Regardless, the patch LGTM.

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

> +		dma_fence_wait(&vgplane_st->fence->f, true);
>  	}
>=20
>  	if (plane->state->fb !=3D old_state->fb) {
> --
> 2.47.0

