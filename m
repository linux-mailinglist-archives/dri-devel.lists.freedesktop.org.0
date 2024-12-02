Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0859E0A2A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5C110E805;
	Mon,  2 Dec 2024 17:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIpwLaoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF1A10E805
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733161046; x=1764697046;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=egN3/LpAlWvK0zEKfoc4OVB1uAnSVFRAxR0YBYygdyc=;
 b=YIpwLaoZYgAV86k5odCrFljcF9mWQHx3dyOtOUixLuFtJxp6GboBYAaC
 MGQSb5QWwDAvlad/mWr75LFwAjYAsx3233DbnJEHykZ6Nr+L0MtZ+LM7U
 TMDvymFydOSjmHkodg58nIR62ogHqTRNhpZbOiwNBLrU0AuC7aoZUD4KT
 maIt9NmoWTrG443Rt+L5/Ktc3Zz2RN105zDjMxNRY7Isy/BLS9r+sodHd
 oQ2Xzm3PUMA9Y1b8ME3cinTHe7KnNcas+7jx5EksTCl9gn+qTWjCLkmSi
 yuFU9IFk4DISLCUUnerpXAebBYVEmiZVaLmY8pKwLQSfOPcMMGv393AX5 A==;
X-CSE-ConnectionGUID: Q/wy0HkrTUiKmfGsra7/Iw==
X-CSE-MsgGUID: vdGjQgugT2C4T1JElPAWKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37008954"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="37008954"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 09:37:26 -0800
X-CSE-ConnectionGUID: HLqb/BK+T2uvyooFHFsfYQ==
X-CSE-MsgGUID: CM+I3PvbSFmCVl6afo1lfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="94006735"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 09:37:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 09:37:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 09:37:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 09:37:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V70R2o4T3q7VDroKTpLMWgwanVPLMtmx4i8jcZt63XsjZOcj6cMnB9WuOO90z5mUfzRt8Dav6yzHl79+gZ2l4Y1Hqk06dF81cRZd4TWPa5o99hEbGEL/KKWKEPRXxmptWi/6KH8QWi50S1fLidRrRLx7bgVgmB1+83j3jzl2ls2KOB9YM7qT42w+orkCZ5uuz66LIx64lmzdE/HQRzuR0WSen9xSg7LMtBrGFoR0UTXgzIz97JCfoKmYfnk2UpTyHnzqOKM6MPpHaQbS7w0wyfLynx/6IBW2uxsFz9oNzdLgPeZPllffJA3tvLhIE2l96a7wEN02DWPofrnXbGBTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBd+xRd5uLkPanW38EC7g2fu56knm1pLdgTP8msL5/U=;
 b=cSxb+LyoOSw+MLyeN2b0VqstehMwV6vHryDep9QB7Q1xTV8H6QQCROJH911WGmgw8ti4s67Vg6YnAhiyS67RwYQR3C/hfNynZveKX9Wwvrgfqgvg7ML2lG+FUxcDJTH8/a9W+LnD0V2GDApGj9MDGsN8uIgRk67VhrrBfTKFodKMbHOCsoCsTTdgYb/kYit+sUfEyCPUHitTrV+FVwXzcqK8mvWLWdwI74238HqY34d9ZL5j1pAfzkjCIEkw4aMghWnfJDS5QeTOqHHhrT3t7Knx3tVEc6yarCyt/q2HTMhOELhTkvara96p+qCTZv9hE1FDWE04aLrhDa0if6my+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by CH0PR11MB5251.namprd11.prod.outlook.com (2603:10b6:610:e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 17:37:21 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 17:37:21 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>
CC: Rob Clark <robdclark@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [PATCH v1] drm/virtio: Factor out common dmabuf unmapping code
Thread-Topic: [PATCH v1] drm/virtio: Factor out common dmabuf unmapping code
Thread-Index: AQHbRHzH4op+ihpkKUSHHKJiGBpUJLLTOGsg
Date: Mon, 2 Dec 2024 17:37:21 +0000
Message-ID: <CH3PR11MB7177E2E8406A00BAF210130EF8352@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20241202053955.2451321-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20241202053955.2451321-1-dmitry.osipenko@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|CH0PR11MB5251:EE_
x-ms-office365-filtering-correlation-id: 9be7ba97-8d14-4966-2ba8-08dd12f7fa05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?t+QghhAW1EStGm1I40dh3LpNNx1gxtcJ8wLrS26RA76UxTJP13gEoT/k/eS2?=
 =?us-ascii?Q?nz4DkKGJ6lynO6A9FLeT+7+b9wFFgmCS+bdiwoO9GsoWfNPRc3q4bUKU7exb?=
 =?us-ascii?Q?XP+kuuxbE73BEt4PM4n22t9K6t+Toii/lImgF4cnNdHcLJJV8I/5Pwj2b6OO?=
 =?us-ascii?Q?sfRBfgBCGwCEzfoJY+Tu7PwQ/c4qtbeHp7XNmJ9JZNEAHc6O/ZesAs9rBZ4T?=
 =?us-ascii?Q?APh2xpFHJwSO1uXRHkf7g+k8GjmRJOK/1HGzR+5NAJB6ggaq8GeQ7hJ0uCL1?=
 =?us-ascii?Q?ZtBdYhrGDcRaolGch6Kzxvkmd6ud960fPsIS+feFWXRjYtnKG+r8usdV71i0?=
 =?us-ascii?Q?PBHnWn5e4L6+3K2PNTKphVEVqsYvVFSbmbrIiZGAyqn3yLjgHZu46LzLZmYY?=
 =?us-ascii?Q?py1ICDOxVK7PT1Xz3kH9E/wU82U35QKeKelIFC3H/5GO9qwLhuoMNwr1/74e?=
 =?us-ascii?Q?l+5n/hW7xrQwae6SsV4ZnTV+zlEo3/l0afd6/1fMMJqFDXdQZdEEUwl5x9cM?=
 =?us-ascii?Q?7sf6I4vRN3lUOJuZXJWpzdl5nNFa9xVwbxXHVnSZ1S5M2Im0o/Jl0LgytfBR?=
 =?us-ascii?Q?gVtYjsCz35Pj28z9QFFzHz1xERZDxUM3E6nZGCkycg5IbcGyS5eQW7lOelFb?=
 =?us-ascii?Q?QSkU6zaFFqBJ5/qvO0P+U1tBd7DMdObT8vlstwbYf78mORhIGpRUeY3/HWWh?=
 =?us-ascii?Q?41iwrGynGopugHfuYhae5GBmiBHjLgrvWOsyrN9GakdHvE27aFPznQ/K5Fi2?=
 =?us-ascii?Q?LnUkF1j2Hg4uupU8sfaPlLQ2BxYoieRLj0Mecy5wI68O4qrkH8SESfB7rLp9?=
 =?us-ascii?Q?aBj0LoFrveE/GHcMysO5SIoELxRx8QP/NGQMQFlrLtiDiXoA3G+vcV7JHjNn?=
 =?us-ascii?Q?YqltegjMBqSZj+fb20IOW5QxJY1AFEGuaVv7zIeZyoKTkJi+8usgSST++U86?=
 =?us-ascii?Q?6dRFuO39vUVJu0C9iqUDfe/rD/B1YMAW36NlFd5ZoKfWaUF4DQV94OPHwzT3?=
 =?us-ascii?Q?4vSeNxs6M80m+lTybc0QDwU21L0VD19R2nAVcs/TlO+WwkEtizn1Vd/284uC?=
 =?us-ascii?Q?KoyyrIZDUk8251o1KSoaUMNk1asW7upV1TGCO01McbPQza4ZuX+j0iZl7v6+?=
 =?us-ascii?Q?z6IC9hnordeHlaJsHxwDsUDEOlEneo4jF7mRvW5v27l35BXVIofSW9SH3jxO?=
 =?us-ascii?Q?OV3VZ/WQXFSHLnf8IzEureO9+gz5e+pr/X0RsiPPI4fwyXrqFDFsh2A+heYE?=
 =?us-ascii?Q?5HfBBWOE86iopgqw9cP/1YBtWxoGQthnLXAfxr7yvzoZj7BOp89KDcgRQfqC?=
 =?us-ascii?Q?iwal7P6f3EVHVhoBwjz8FIO+bdLhY4ZLfGrdD/rS8ynudUz1daqmAVKzi1Qf?=
 =?us-ascii?Q?ZWecoDO7i/X4bhl4mhaY2PbvPLwlxLte9JKRO8gkLyCRGTX/nQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dvS/VvDuXgP7TzdjA8cR2vnkv4e9TAvpvgudhDWiCiVRjl8tGw/YhExJTSRB?=
 =?us-ascii?Q?B5VA1WxX7Ga2F74UHJiGBo/W7zcZWvxby8WuQdRcn0y99qayx2Z53+NOftKb?=
 =?us-ascii?Q?LIl6pidOuRnMJ9o1CQNHQotLg/o/ZDPUhHqM9vkSWz5H8htiS8b0gUSIEKe8?=
 =?us-ascii?Q?c1STxcsk5OaKIbHpJ32zVnK9sCoH8kWp/kkQLJEZSGKKleyo7RIzNnGKXSRY?=
 =?us-ascii?Q?h7M5U8AgEXjfgT6SxLN4MKekUYg2IiaUdnv/+g4Ba1sZxwsIAIdKtO5MfUgV?=
 =?us-ascii?Q?MBJVda5Oyrc+T3DhNjE8APv5d+3cdcFWIvRdEmfqzQMdQYf9KpXwLSDHOVgj?=
 =?us-ascii?Q?EwDIaAOQrvxBI5JJn8omrAnCNw4JRmv7Ezc36lR9J4YEaNVjQ4h8sFdZvGtm?=
 =?us-ascii?Q?kbbuRsGdR7UcEyTe9C0EVgSnC93Y6BbnC9YFkjjU8w6/ZhOX1AZdDM0pAC70?=
 =?us-ascii?Q?UkwDBMVh7muJHAsT0xFoTTQD438Dbq8QvCyDe5m5qm00J2BYTFgMME2jEzYg?=
 =?us-ascii?Q?FLMXmQkmtMwlTaAuvx2YjUpnAQJHhM0Xhf1DclHhm1ZnWQQIEHXYN1A80YAL?=
 =?us-ascii?Q?2/gFByMHM6tyABJ+O0EznD3Wf9yDU+pwAN4fQvELm9q4Y5vGxfFfpQXn1l8s?=
 =?us-ascii?Q?YK9Q5iCypg2Y+1RavwAnNf1WdUt/fHLG/9uHP4LAozPcSFBPD8TahJ0FGXHP?=
 =?us-ascii?Q?ElN3FwdBaUCEnHFb+Z774fWa0WP/DnONG3tTz8AoNt1MJxx2BoDTVxJVFrHl?=
 =?us-ascii?Q?LNhLSIoD+4e4JmuS5xXNTWRnKCzwEy+gqgo/Em0Dk09BXm9EYzqQ4dmNwPTd?=
 =?us-ascii?Q?TXWkaAMurZ83L7HuF0a1GB6v0SQO8Kpq3meAtMvya6jS2BCsN6ea7oS84qph?=
 =?us-ascii?Q?kEkzRbpWh0ZoiG+nFTOmQsOqS70zuUUtBA15CFrS2ndAvyGJgzfv1fIbBBOQ?=
 =?us-ascii?Q?+MqnpW550oldBLxmlausYar0QMWdxbqSyB+RpDXGzdbVahhoOqR2pjsAfHGO?=
 =?us-ascii?Q?cG97iH8M4/9d/QgsEhCGa0zLg1NxYC/clTRW+/IDHbOW4heTe+iG6Fmd2pld?=
 =?us-ascii?Q?l4fZGYtqevlO+VkqGMsdxqnLZwM7hSDsEBNJRJHFQ2xJjcuJJ4Y0bwagap55?=
 =?us-ascii?Q?sEWlioIvNB74NSkeOnh5MqvjCplb0KHpYjcbhdZOhOUzBPhsnCVhgaKw5VCL?=
 =?us-ascii?Q?ayBX1CCMy4s9G74hC9GUI8qPtab3Ox/YiuH20n3aY20zVsmVkloRa6kxBjly?=
 =?us-ascii?Q?C2jXTFsPPYY5sdqnxeamKyvfqlrY3N56F0nFUYTBm0BbmCbwIZEM7xt8Jh92?=
 =?us-ascii?Q?JvUiGOnyVrTxaM+GvRJqW2C84vZGx3DT7y+8reLCT7aShUF/tS65MC9lS5Ih?=
 =?us-ascii?Q?3uU/t9gi0FIbpOEcMwhog1/V2Lv0aptK3K6BOw9qst67Miuvp3hqNd63FfmM?=
 =?us-ascii?Q?+EqtH0nGNbvLr7weAHA6aJem2b/JyvOspFQK4Af6m69k7RLd3RLpCjaJv77s?=
 =?us-ascii?Q?1i8Y96T9fXMfqLgLGZHbD3L8uEIybaBi6eTQGukVa0Xyy48bqgwrbYZxrRWx?=
 =?us-ascii?Q?dzBt9FuGBwR0BAWhyYPHMr3XUOamCiML7vv2VJzc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be7ba97-8d14-4966-2ba8-08dd12f7fa05
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 17:37:21.7140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJfniyhdhK6vaKv8PvWuYJKdd8lEEVZHx7iDnakfO3GEUDJYr14X+21pLRJFHaoNcsUFGi1FFezWb3EEks6W3D2kgrWb4LvGmGfpey6yJjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5251
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

> Subject: [PATCH v1] drm/virtio: Factor out common dmabuf unmapping code
>=20
> Move out dmabuf detachment and unmapping into separate function. This
> removes duplicated code and there is no need to check the GEM's kref now,
> since both bo->attached and bo->sgt are unset under held reservation lock=
.
>=20
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 35 ++++++++++++++------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c
> b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 33084ce1d01d..101d1a6517ae 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -184,22 +184,33 @@ int virtgpu_dma_buf_import_sgt(struct
> virtio_gpu_mem_entry **ents,
>  	return 0;
>  }
>=20
> -static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
> +static void virtgpu_dma_buf_unmap(struct virtio_gpu_object *bo)
>  {
> -	struct virtio_gpu_object *bo =3D gem_to_virtio_gpu_obj(obj);
> -	struct virtio_gpu_device *vgdev =3D obj->dev->dev_private;
> -	struct dma_buf_attachment *attach =3D obj->import_attach;
> -	struct dma_resv *resv =3D attach->dmabuf->resv;
> +	struct dma_buf_attachment *attach =3D bo->base.base.import_attach;
>=20
> -	if (attach) {
> -		dma_resv_lock(resv, NULL);
> +	dma_resv_assert_held(attach->dmabuf->resv);
>=20
> +	if (bo->created) {
>  		virtio_gpu_detach_object_fenced(bo);
>=20
>  		if (bo->sgt)
>  			dma_buf_unmap_attachment(attach, bo->sgt,
>  						 DMA_BIDIRECTIONAL);
>=20
> +		bo->sgt =3D NULL;
> +	}
> +}
> +
> +static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
> +{
> +	struct virtio_gpu_object *bo =3D gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_device *vgdev =3D obj->dev->dev_private;
> +	struct dma_buf_attachment *attach =3D obj->import_attach;
> +	struct dma_resv *resv =3D attach->dmabuf->resv;
> +
> +	if (attach) {
> +		dma_resv_lock(resv, NULL);
> +		virtgpu_dma_buf_unmap(bo);
>  		dma_resv_unlock(resv);
>=20
>  		dma_buf_detach(attach->dmabuf, attach);
> @@ -272,15 +283,7 @@ static void virtgpu_dma_buf_move_notify(struct
> dma_buf_attachment *attach)
>  	struct drm_gem_object *obj =3D attach->importer_priv;
>  	struct virtio_gpu_object *bo =3D gem_to_virtio_gpu_obj(obj);
>=20
> -	if (bo->created && kref_read(&obj->refcount)) {
> -		virtio_gpu_detach_object_fenced(bo);
> -
> -		if (bo->sgt)
> -			dma_buf_unmap_attachment(attach, bo->sgt,
> -						 DMA_BIDIRECTIONAL);
> -
> -		bo->sgt =3D NULL;
> -	}
> +	virtgpu_dma_buf_unmap(bo);
LGTM.
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  }
>=20
>  static const struct dma_buf_attach_ops virtgpu_dma_buf_attach_ops =3D {
> --
> 2.47.0
>=20

