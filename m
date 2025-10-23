Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9BBFFE9E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D5610E8DE;
	Thu, 23 Oct 2025 08:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCF6IPKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8630310E8DB;
 Thu, 23 Oct 2025 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761208055; x=1792744055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CpVCcmGVfUCJojwmHWmyik5UYkMBjPM9j/nwxJF71fc=;
 b=nCF6IPKgGqn6dAySA/sJNcrFmbdSK5f0DnWci+pQSKJUC7SQbH6wDX0D
 zpJ1KI+N3QiV9miFkMWeETF2104oK4fce+5SqY796YN2oSBJ4y52teXb2
 PRZY+7oKdKvCLKInhjkL4JrZVhGD2cZxqA1DXzmVEpG0hNKvu4qGrIgXq
 ZqlHTIBMkgDxcVYxuzIRaKTW7amjFZ5ZpfyTJnocOrov4a6C+KVubXy1V
 v55Spts1WpfdobT63HRefM3msllr1izkIU9RMOKJV8KFyqyvPNU47/RUn
 /2Xs2Yvj6DRZYa9Io4rmrhbdaaHFKMAUv+5Ro8dEoqplp2zAkH+mrdqh0 w==;
X-CSE-ConnectionGUID: gYwC0lBqR5CgAhfwUPR3/w==
X-CSE-MsgGUID: 8rp2Rl8qS+6FDG8GQnar3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80997759"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="80997759"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:27:35 -0700
X-CSE-ConnectionGUID: SkLKYqAbRsGzT6pXU2pWTg==
X-CSE-MsgGUID: 9oXZIkPeTJSqZrMlrlzDqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="189364262"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:27:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 01:27:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 01:27:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 01:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wtif2yHfkcIvsqrYNHfhcnFquGsm3tDvf/Pdbt0uGRu0O3qz/jw6Go2BGbFvXGKngOFJIrl+/sy/QYYxY2IJylkwwICLbojKAX+HdBQXCN7dXGz60JAtsaEag+fseG5mHz+CFWkm0rMNPaFHyK/Y1R1SoSkar7yVOXsnEPE6DxW7LihLbPOfG7Fur8tV7oDbRMMj+7uVfI0BtEqlNu8gwyQC2yrWXvX256lRe945qWhZ3Oz7cpSeJv9o5IEAN1WczEx7KVkk9ydIKFtZ9SL4EIoZ8jApKBON7/AF/VkEqvW1U8ZjCUWDvrhWFnlq3AKDDSi37OxNbGjrQcj5s+lS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2KrUn/ctXLBKf/H8Rm+jmtzMR+Ewo/6K94PgMtb2sI=;
 b=P++3U9Xwi7iei9ZS8KmSWhY7/ZTEJXtUTGHYxGh9Rs5cUy+rZWqY43xXuxQNXc3UV+exUYXHF7ldaaDpaz+7/HT0dotl4weWYZQ4cpcY/GHAVhdXkHDKlgMo4AhYBgcZ662bn+ij1uZVd3HXkE8s04RW51cr46Ic20t6uFBdqQxnvwJHd2b8BEBY2MUH+wrqkD8mJR2nkIvXXu3DgCr6chsorNHn5EENsnBvTkFEr6tdifb8rOGc359rOCzEC7ONiMN9FvQPUmzGvun+HkI262T/2CatuQc2jiswvdZW3W/jYDz1QUYw1B73qJNZ/RhxsnD/w8XBdir3E9e1nB8zvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB5000.namprd11.prod.outlook.com
 (2603:10b6:510:41::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 08:27:27 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 08:27:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 05/24] drm: Define helper to initialize segmented 1D LUT
Thread-Topic: [v5 05/24] drm: Define helper to initialize segmented 1D LUT
Thread-Index: AQHb6zDd6i6xfOcQIkOklwKqHxzMV7TQE/EQ
Date: Thu, 23 Oct 2025 08:27:27 +0000
Message-ID: <DM3PPF208195D8D43C67791A979B02517FFE3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-6-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-6-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB5000:EE_
x-ms-office365-filtering-correlation-id: b22de371-ddf2-4619-5943-08de120dfffe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?y2BgKOGKR1DV0TZ0LPUGGqjglM4KjT8ErJcDI9EtRmcaMntAPjIeu6E2exEB?=
 =?us-ascii?Q?4SYuEU6T5jkrxBeIRHsLqLbpbBU/RxLB5TyrFUkoxk8GYQ95NWdCfh/28eyl?=
 =?us-ascii?Q?UmMfn3hvyecC3M5uA3J3KPpZ1lShNJEQowj0BrPP1OXjaXDa2WMNTxwrBlwP?=
 =?us-ascii?Q?tIvbh3ZAnbkfXgHTLHDUG2jetaMw4/JolGln+gm1U4mZF7HNHsQ4yMAShUFx?=
 =?us-ascii?Q?8ZniM3+gfel28v71YABhXY75qIaRU2n1poc8b/RH0OIUIuYbV1nlj0Nt/ewQ?=
 =?us-ascii?Q?M8eKUf7ArC/BwEUTCdlhTe1ExTgXDOFqfbtDOAsmaSvqiVBMADSAkOCOu5FX?=
 =?us-ascii?Q?ytSSXKrDMJgXRb8L+nHPVeOUff2zz/7KdMM6uFl+mSRpm1EDD0Uj/UCS9AZh?=
 =?us-ascii?Q?ke01NGD7Wt/b/vXnYWsLWrzLdIhhV2L8WaLtoCHtD7b3O+zaEkK+9tH2wAS8?=
 =?us-ascii?Q?/v5KkCAV2A2M9VzWBUAFaF8Pm2ngblAVIXD7y6s8z4l6NjrBISeNKLX6JdO4?=
 =?us-ascii?Q?grXGeL56if4K4Pq7piEZkW3uIlxUB5nK0cZ9JGUJCka85e2MOY2eLISEImCg?=
 =?us-ascii?Q?wN8woghKi2VKzyhcSZng6GHzkcHdsLF2vB4PJNezW2CIPMrJo51f2fFGL2Hy?=
 =?us-ascii?Q?koJT6G9hvqsc9BMpz/3NNHjNkxefgmm9+ibdv8TSMh4uIMoK04nhkwgldqiL?=
 =?us-ascii?Q?ZoNAD+kc5CDOwoat/2z2NGCqkhkiCh1gJaI9gKFf3M//FjKIC1DbSCuzN12A?=
 =?us-ascii?Q?jIQN1gOTfGG7WKeKQl0WNEijDpIP/uw1jqXKIAn3O4ZiNGOTLt2S7unxJ0PU?=
 =?us-ascii?Q?Fa4Y/nr7ZrJ4xNeYyT63cdgvN9Josa8Q4VmbwdpjGePS4k5u8rW73oWWvpdw?=
 =?us-ascii?Q?LTq4W4IZ0hZpehHCytxOB+GwoMj/9eK/M7i3wwnbUwxhPzRwJpFsj+Bf1KnW?=
 =?us-ascii?Q?KdMxEwDjwDNSzLWk9OepnEnf9EWoOaM0I4Y/YjTN7XTXuhjbn3zqJYNyYduI?=
 =?us-ascii?Q?tOB81TrUHgtnyWF0bvDy9thf52UEm/v6Eb4iQB/hQb0smyo5B3A94GAUW65R?=
 =?us-ascii?Q?k5Mofx7YnUsnc0CBq1x/pohGp/JU9FhE4dc7Anm/tKVZnPXZrVv1tVf6ah0X?=
 =?us-ascii?Q?QDexzhrG4FJjfFd2Kzit2abXE2irtYrDtgSpeXJTuckH015iEFpN0xPCKLIC?=
 =?us-ascii?Q?2R9YP0xZqNQlRfNTx/hKaqyOhJJ9AjYH2PkAJj6brYA8xqO9uzwfKLJ4XxiV?=
 =?us-ascii?Q?fvj/g+H+mMCYEUHLZOYPoWvTcfOLQaua3sTvXD72P+HucHNmaNu16jNOwpDN?=
 =?us-ascii?Q?BAwUYGNUty2GZDNzR8tu+zL42gRUjtsQsWXdq4FLI3NndkHFYqFzMLuTvyf9?=
 =?us-ascii?Q?YLmHbHDxaSTjnC2n/+l8rLcKot1CRfT0QnQb/VDMq/DEiGG0qfSVahfMRvxX?=
 =?us-ascii?Q?Wuj1OlhH8EW/Mu9Ku+gVu/wJxkkxWgr59+3oTRWiF+5xQHY9etpcR1e51nRj?=
 =?us-ascii?Q?4oWJh27g3LXdt+4cxbehHQjZgDKmvKLbulc1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3bUanb3UrX/FxMJ8ALADAorJVLiMQWQne/04/0Bsd0VzTjCUck7czIzKJI7k?=
 =?us-ascii?Q?rXUUHCVRbcRM5SjBR/RYKhI+tolpytgXhjZrVfmnhJRXJxWNtkbbGNXC2Zdw?=
 =?us-ascii?Q?NR4DXbX1LKolmwoh/0+PppVTGBqgIsezWE2vJBGOX+9ktqPaNLDL8zjNUEG3?=
 =?us-ascii?Q?lMHo8az3xRlNscgOFj2dWZcNMSSFxYC4VtJtKvea6gIRepMenZNTDQQzArys?=
 =?us-ascii?Q?ba5nbGYGFPTVxaaCCVLL6N7y/qB2s8hm9KA66D66lZ2HBXgKMInVcu2Y040u?=
 =?us-ascii?Q?FIyCeYyUWdYxCm2riT3HA4ZCZCsfbKWPESUCwW5/2YK2lWaDwh8cB7m682Yx?=
 =?us-ascii?Q?If++A7T4sHDFCDqUU4xrUn7QyG5GvG6AWbWHAV3QR+nSCoHvOfegby+kyGxH?=
 =?us-ascii?Q?2t1Twih9eTTFtCG606OleC3rbIlwNxYFj5IoSD3HzAmFQvlgaLssTfSz3aGL?=
 =?us-ascii?Q?2nFPgN0gVC6V1AXyLnkhUvKRKo2CcqruemSwL3LZoG67XgMbwPq8X2+/GRZ5?=
 =?us-ascii?Q?+3SCPn5p7ByZx+No3ycROP4EcIS88+3Q1nh2wIC0h5tnPKpOvCSvSJccTNq6?=
 =?us-ascii?Q?K7/3sbcwCxpBfNNszuOogYOjEIdYDAP5RxUdGDmP5ALb78qRt1CIaYTjj/a7?=
 =?us-ascii?Q?bLW/welPgXOvyxQfhmNsncoHpwC7EtCu3SxzWjAg1Gf2+xXQYZnLf2UHt7IO?=
 =?us-ascii?Q?j0bw3VADzc6xjDcHY4dquu3iT4nGVLZKvq+syjpAmBf11BoSG76GSaNlF4b/?=
 =?us-ascii?Q?zx6fX7oUx+1ZcYvBNBr/BmUHh4OyQF9K0oydFdiYA/9nmBnvXFMO91nfKd13?=
 =?us-ascii?Q?MRb6AWvioUzdwGkqE8psSgw3vqJ6UOzvZil4AoiGbs9BtYOGFFvuIApWciWa?=
 =?us-ascii?Q?gepk5V887okbh/ZJsHzZGLgYGl9kw01c6C8TJYszcvfUj5YBHZOq3XcPBnnc?=
 =?us-ascii?Q?O3BIjfwa3aGBcRtOKVdX3g2Ay5oJ0iUmf88R+dYHdxU9BeOxDUrgGywWPsEK?=
 =?us-ascii?Q?DGo3a75QUeDD062svT13PA9TUbTRshzZ7btu+W9FWMfII09ldHGO2uKgNjJz?=
 =?us-ascii?Q?3BydLvMN192z++oqOZLmpEmKSdhAKj0gIXox4WtLNa9HwfryXeEvjPeUyi99?=
 =?us-ascii?Q?Bkj5yCpWrt9FzA/Vp+aOsOdhSa4hO9jaodn6+wVyAI0VVdE0pi1B/bugLAvL?=
 =?us-ascii?Q?lENVpunGYRcn0T0yQdR2l0PwF4gpuJlx2c9p8W4Afa1wJYe6EHCmOCjzdQL5?=
 =?us-ascii?Q?Ldy8MPCFhj6bPe9a8B3JRAWPOHRp9rEzU7flSHJbH8AQ816NUQ+/+ci+Qgh1?=
 =?us-ascii?Q?GOb0bi7t2pSHT6kqSSpiEtnK9wy5/51uxk0WeNdSQRBUoyDmlGB7DkV4ZDDD?=
 =?us-ascii?Q?QhvmphPIDGFHTsu9bIA44mTnMF6Hgb1iD972XzzlFKJg3U2mcCH7FVk/hgnK?=
 =?us-ascii?Q?8PdcuE+5C10+8tTEaRHnM7YaldL6coFtGeRRnn0SWzVjxE2tN550pQp/215I?=
 =?us-ascii?Q?+2AY0RwflKgkJzrSVR4/c6A7k8/+L7zbq+TQImzoBCN71rslAhKI6ZXKeXnp?=
 =?us-ascii?Q?7aUEEiWV4nC+RVwaig84Rvp+LLQAM0/EhV3xMY/2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22de371-ddf2-4619-5943-08de120dfffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 08:27:27.1418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sniw009H9ATK5EOWgyZgRmcNaWrC1VNqBwtWFgYEXH36Si24hRWuE8vWLWd0uRSKPZ6PtfjiX6d+J+vzbZ1Abg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5000
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

> Subject: [v5 05/24] drm: Define helper to initialize segmented 1D LUT
>=20
> This adds helper functions to create 1D multi-segmented Lut color block

Use imperative style of commit messages

> capabilities. It exposes the hardware block as segments which are convert=
ed
> to blob and passed in the property.
> This also adds helper to initialize 1D segmented LUT.
>=20
> v2: Squashed the 1d lut helpers (Dmitry)
> v3: Change name space to drm_plane_*
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 68
> +++++++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h     |  4 +++
>  2 files changed, 72 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 97e9acbb0f2c..6e17f51c24be 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -90,6 +90,48 @@ static const struct drm_prop_enum_list
> drm_colorop_lut3d_interpolation_list[] =3D  };
>=20
>  /* Init Helpers */
> +static int drm_create_colorop_capability_prop(struct drm_device *dev,
> +					      struct drm_colorop *colorop,
> +					      struct drm_property_blob *blob) {

I don't really see the benefit of having this as a separate function as of =
now.

> +	struct drm_property *prop =3D NULL;
> +
> +	prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB |
> +				   DRM_MODE_PROP_ATOMIC |
> +				   DRM_MODE_PROP_IMMUTABLE,
> +				   "HW_CAPS", 1);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->hw_caps_property =3D prop;
> +	drm_object_attach_property(&colorop->base,
> +				   colorop->hw_caps_property,
> +				   blob->base.id);
> +
> +	return 0;
> +}
> +
> +static int drm_plane_colorop_lutcaps_init(struct drm_colorop *colorop,
> +					  struct drm_plane *plane,
> +					  const struct drm_color_lut_range
> *ranges,
> +					  size_t length)

So you call it lutcaps here in the name and hw_caps is the property which I=
 think is confusing.
First we need to make the naming for the field and function name consistent=
.
Personally I would like the property to be renamed to LUT_CAP since that is=
 what it is to represent
According to the documentation provided in the previous patches.

Regards,
Suraj Kandpal

> +{
> +	struct drm_device *dev =3D plane->dev;
> +	struct drm_property_blob *blob;
> +
> +	/* Create Color Caps property for multi-segmented 1D LUT */
> +	if (colorop->type !=3D DRM_COLOROP_1D_LUT_MULTSEG)
> +		return -EINVAL;
> +
> +	if (WARN_ON(length =3D=3D 0 || length % sizeof(ranges[0]) !=3D 0))
> +		return -EINVAL;
> +
> +	blob =3D drm_property_create_blob(plane->dev, length, ranges);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	return drm_create_colorop_capability_prop(dev, colorop, blob); }
>=20
>  static int drm_plane_colorop_init(struct drm_device *dev, struct drm_col=
orop
> *colorop,
>  			    struct drm_plane *plane, enum drm_colorop_type
> type, uint32_t flags) @@ -337,6 +379,32 @@ int
> drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> drm_color  }  EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>=20
> +int drm_plane_colorop_curve_1d_lut_multseg_init(struct drm_device *dev,
> struct drm_colorop *colorop,
> +						struct drm_plane *plane,
> +						const struct
> drm_color_lut_range *ranges,
> +						size_t length, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_LUT_MULTSEG, flags);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D drm_plane_colorop_lutcaps_init(colorop, plane, ranges, length);
> +	if (ret)
> +		return ret;
> +
> +	/* data */
> +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_multseg_init);
> +
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
>  				   struct drm_plane *plane, uint32_t flags)  {
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> 46099e81bbfa..44b4dfd69db7 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -393,6 +393,10 @@ int drm_plane_colorop_curve_1d_lut_init(struct
> drm_device *dev, struct drm_color
>  					struct drm_plane *plane, uint32_t
> lut_size,
>  					enum
> drm_colorop_lut1d_interpolation_type lut1d_interpolation,
>  					uint32_t flags);
> +int drm_plane_colorop_curve_1d_lut_multseg_init(struct drm_device *dev,
> struct drm_colorop *colorop,
> +						struct drm_plane *plane,
> +						const struct
> drm_color_lut_range *ranges,
> +						size_t length, uint32_t flags);
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
>  				   struct drm_plane *plane, uint32_t flags);
> int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_coloro=
p
> *colorop,
> --
> 2.42.0

