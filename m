Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF4C71B2D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 02:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AA510E288;
	Thu, 20 Nov 2025 01:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkSj1uDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708B710E288
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 01:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763602900; x=1795138900;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WpWzNBzaFYtg9Lxkh4irTfG4aaVP8AbY07rkY0i9GkE=;
 b=MkSj1uDIspxOQ5Rn9OaZh0Z4+KjDgHI6mDhPgi0qxwTkiPfkQyORQpmv
 HYlIN4ArZZ2XYP1fNc7EMcBnjftf+pgu32umYpkW5TM8XcPb/0n7CoLXq
 JoR4IVDIpHAr0zt1c/fGrm5Z/FSv8QVHcT8QD/3Ey/NBYn0tnkUM+FMB4
 tS2JeZmucdfYFazxSyOQ74IIoSHtjDF5a4d2wHeVmdnDZaRftACBDkUMN
 eefqZZtR2IMyJn+S9aVwkOY/19F76o9RxDIIP2UNzAHB2aPrHR3F0j63x
 bwiQw/ziFpBplDxkkxDz1yl8HT9yTtltHsB1IdPoZgFkmYARh8yuRYGmm g==;
X-CSE-ConnectionGUID: i7nIBdaVRT+eHcc/ViktVQ==
X-CSE-MsgGUID: 1rBxcjGRQ86ljRo/Y6Mb1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65600541"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="65600541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 17:41:40 -0800
X-CSE-ConnectionGUID: 47RKV+xuS9C+jU5/2N9RRw==
X-CSE-MsgGUID: lZksvLKISU+Eo51U2jyijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="228536912"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 17:41:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 17:41:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 17:41:39 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 17:41:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DePWvFxv3Z7tumBsQg5imXHjh8UdIAKg3O/B+pNK3iHNUeFSGM+bLoNVCvruBGNntysGXmr1JSwsCw+eK304yPyKGd1HwfdwiRCIRLdQ7L+bNlhJlvt2gAuhDylNRhlx/acMvVe+9Y2VO8qhImYq63yttr1zEbJqQLgdCltC8ng546JkoBYF1N+UwteNO4OtjqzoK719WgTiw+wZPfzzSN0uBzyLf1hv746JlexbtYHl82zrTyz5Nd0lRvJoIv8ulE/3yDYdzvOB8UeFrVLZtVnBwky6uDkO4VhpRIxtaWnbYkGqUkkAuZed0Qo7VWvg2nuUWNsv1K60irQ+qsB3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpWzNBzaFYtg9Lxkh4irTfG4aaVP8AbY07rkY0i9GkE=;
 b=qBg9fuaRJsxCLZA0VvT1ZOFeKMzMLPPeR7JVmpkcP8zoJZ0sva3fqOTbgGFxdR+b1T6Pa7fx1fvdsruY8f8ddHYlt4kjkKWaV9ArqNwez1YCKbaTSwX6HFR6H9afyXW7F56lCOltPzzQtB4+5aE6KyKez/GQFyiznzPehAqujP+yN/zMDuoq8BQsP93kMBucVCf5d6BiJZUK4EX6UCmfIDXMV+5CmWSuDF0D4vbimnsjS+knlgtvQwgjjHFoWw+H5zVqUp4ajYihEWj4z6r2xN5am8qyYVwURyaA19LazVv9Sx/DrygfGPyI6WT1YbuIAY0MQ0xy8y/KmzfM8wVOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 01:41:37 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 01:41:36 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
Thread-Topic: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
Thread-Index: AQHcU8OzUktLRH3oA0Sjzb9+ERz0crTu4sCAgAIvo2CAAReXAIAIqvZw
Date: Thu, 20 Nov 2025 01:41:36 +0000
Message-ID: <PH0PR11MB51122A5436CF812363F1C614FAD4A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-4-dongwon.kim@intel.com>
 <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
 <55556365-4c6e-450c-89aa-9c49ede53b00@collabora.com>
 <PH0PR11MB5112533F30F495410F5E71AEFACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
 <66183a1b-c724-41fe-ae90-4d73e5f2aa67@collabora.com>
In-Reply-To: <66183a1b-c724-41fe-ae90-4d73e5f2aa67@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|CH3PR11MB7723:EE_
x-ms-office365-filtering-correlation-id: 79a2e60c-9a95-4f43-e67f-08de27d5f1ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SjdLVkdJUkpoK1RPb1UvZ1d1dGVqZXcvMHpDU1dnZjhFRDRDQzZKRkx5R1FY?=
 =?utf-8?B?VS9helRuRFo0aVE3NDZud2d2alhvNFo1Nk1wVUZoSnlrSHRPRVpmeDlpL1BN?=
 =?utf-8?B?MHB6V3VlZk83cm1ndUdjNkRNOFlFQ2ZBZDJTd3ZROStSTWM5c3U3M0FLcDEz?=
 =?utf-8?B?L28vOTZvZDdaMUNvSGxOMkNUZ2xQWHRPL0VpdmNkTlBvSnVSeVVnTjlSd2Mw?=
 =?utf-8?B?UWVrODJoS0hMVTZHeGc0bkhyZmJYU3FNUmRVY3FNT3ZtdmFSajhtYXMrdk8y?=
 =?utf-8?B?bm5rdS9WVlh6UWRnZTFqWm45MVYrMEdOUVZnKzJyNlJNUG9PRG4zcThFMGdo?=
 =?utf-8?B?MklxWnFnSjI3NndlSEg3eWgrdHF5Tzk3QmdjVlUyYnFOSzhhWGpHdFd3Z0lB?=
 =?utf-8?B?UHhTNjNqQjgxNG9tUUQrK1lYUlV3eUlMQU5GYmozQ2ZOWER4UmtoT0RmS0R2?=
 =?utf-8?B?OG4wQWsxK0I0NkpuTnljMDhiWHBtSk55cmpzVXFIVms4WDhpZWt1cmIrRGc3?=
 =?utf-8?B?aVJZNmR0YU9MMHJZdzVwVjB1Njk2MjRQNUhXUm5TcWFKL3ZGSHFBM3o0UWp2?=
 =?utf-8?B?MUdJS1htVExoVldTRnlNQ09uM1NVZzNLUEhyVlJTTjdxdDR2dVB4K0VOcEdy?=
 =?utf-8?B?czQrczVObWRhemVQMkI0RzVEZnBOdXQ3amExb0ZpY3BKS2I4Wk1zT0dsQVAy?=
 =?utf-8?B?S3BVUCtPd3hMeCsrNkhLYkkyN1pvK2E3TmIyZStuOXVwY0pUYjR4d1Z6MzRY?=
 =?utf-8?B?R1RCK3BlTVVkbk5acDlkeVlDODZtQUNRL3NkVlVQZTcrVFp1c1EzUnZkZDB6?=
 =?utf-8?B?WDlETkhsNTd5QTJsMkRzdERIYVpRbDY4OHNVSktRTFZsQWFjNE5Gc29vWE9x?=
 =?utf-8?B?M0xBRlZIMTdKeGc0N0hnNXo3QWg3WU9SS0t1SUVBQ2UzNjBvWXR0U3RwM2Zj?=
 =?utf-8?B?REwyZTdsdW5WUkkrRDQ3dm96dzAzTmFYQzNoL1l0SW5NVGNLNGQyMVVyL1Jz?=
 =?utf-8?B?WEZyY3NKWkJFNm5HeWRhQktFSlZwNFZndnFJUDZJL3J5OFlyMXFWMzI2TjMy?=
 =?utf-8?B?aktESlBSS2FzekpWWlNWWG9WMFBpUE5qbDN0OW1BQnovb2xiOWxKSThFamN2?=
 =?utf-8?B?OFlGbWVSUUdwb2tXVHE2ZzQyc3UvaE5jZDQ1L3doOEZKVWFpeHNwSm9CNmRV?=
 =?utf-8?B?cUszMXpobEE0QTE2ZGJXYmpXUWVMQWE0UlFYbXJ5dVIvbU1LcmFlZks1bGFJ?=
 =?utf-8?B?SS9IdGhCZnZ1b3JxbE1xaVFrRjJaL0JzOGFWREcwQ0VBYnc1cFJjKzY4U09k?=
 =?utf-8?B?U1RvdVlRVnNBNy90WEo5dkE2ZnFqNnNmNXlLK2hLL3pQbjlWeEFBdHlHQXZM?=
 =?utf-8?B?dEw0WFNmTFZHakU1QnlzN0k2T2hmNGo1WVN2ZXhqVzBLdmxickkyMjlIZE5q?=
 =?utf-8?B?T0FTeEU4U1pnUERNTkFzL3gxeGFmQU51NVF2a0Z3dS8yUm9URDRHbVdFRGRx?=
 =?utf-8?B?dkZ5NFEya202OW1pWjlEbmU3QXJNWFJ3N1NOSXRRQUYyenRaemp5VGQ1Nkt4?=
 =?utf-8?B?cEVmdjRrTUdrbFdweVhLZzdoMklRREFpUEN2T1Q2cGIrSTF3ZXdESCs2YjRi?=
 =?utf-8?B?SjNYQWY1ZkNFTFNwd0ZhaElTdEM2UnhHbi9DQnRJUnNiWk1TNnE5OVBCZkxR?=
 =?utf-8?B?cVgwUFp2bzREV255aGVpcWdqVGVJT2ZweDRJcFp2ZWtaZGRzY2pXRWQrQ1ZK?=
 =?utf-8?B?SkQxbTA3blRtNWZQYVd5eFI5Y01DNy9Gemk3RU8wVlloVXNrOVNrUHRRRXhM?=
 =?utf-8?B?VTJ3MUxCWE9RU0JWcFB4UzlRNUc3NGg5RjkwTGJFRXFVN0hHYUE5eEZ0Nkt6?=
 =?utf-8?B?ZWJvUGxzRkxSK3VLZjVjUVo2QW1TbmE4OTlnNW5qaVFjL3hVT21OSk1keEVh?=
 =?utf-8?B?YVRqR1BLd096eHNiRUF6S0JpQkpIbVdoS25VRkZFSUg0TmVxbkJHbVlLSlNk?=
 =?utf-8?B?ekNqNFltbFJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bm1NL1ZoZE9CS203YXhQV0trdy9qNFc5dFNLWWNNZGVVUHZXN05kMjIxVVNB?=
 =?utf-8?B?Y2Zpa3dsekoxYTJhT3FjWU80NllPTEh3TXc2Y2NSN3pFZUJyNW5GdTZiVnI1?=
 =?utf-8?B?ZzNHWHFlU0J6c20xVEp4QW9GN2hHd2ZJNFJYdWtxU2VGRXZhU1REWnhOR2hz?=
 =?utf-8?B?MCtsSWw0VURWcDhNZFR1My8xOUttQnUrNklOSW1sWFVncWpKenpPQUMwbkhR?=
 =?utf-8?B?c045aGRhZDFFRHkzYzNrV2RRUnVPSXZwWURuekk5dFhlOWxyRmFlU0VRT0Nh?=
 =?utf-8?B?dXJsTXgwVU5zdEIvKzl6K1d2UCs5dEVZemg4MFg0ZG01cDVlWEVVNkNmSVZH?=
 =?utf-8?B?S2pZK1pvd3VoZkhGOE9aajNWWUFjMkthWHdRV3orQkRyK0ZvRzJvR1NNL0FR?=
 =?utf-8?B?Z2lQWVJWcVF3dHUrQVA3Q1FNTEQ1cllwUWxFaVFxK1FRM2VEYUlyNHE3Z0Ey?=
 =?utf-8?B?N2RidGRVdkt2SXBNM0cvd1NNMmQrdWJFRUpuK1BrVGRHRVpxWmd6T2FjOWlv?=
 =?utf-8?B?Qkg5by83ckdQUG4xN0tzclZUdjI5TU53RkFOZHVCSU1QSGxkMjhGelBMN0Zs?=
 =?utf-8?B?bUwrU2FwdDc4UDhPam11WGZpbTZOYVgvOWpqNEs0SlMxaUN2cXNnNHkrVmRm?=
 =?utf-8?B?K3N0K1lvUTV3QlRkYy9XWWVQUEhHanBQOS9tK09kcnhpY1Z5WEM0emNwSEZ3?=
 =?utf-8?B?S1Y2Skl1NU5EdEFzM2N3bHJpcEpaUUpYTHBsSVR6RVNKZC92OGJreTIwNDZs?=
 =?utf-8?B?YVRJSC96dXordSthNnBKa2NObW5GOWR1ZTdIV1RkV2kveDAzclZ5b0x1RDIy?=
 =?utf-8?B?N0NNNnlwZXJTL0pTdGxsNmtxTEJsZVNaVnVNRUgwY2VDSDREZXRFaHEvSmN1?=
 =?utf-8?B?OE1ZTFVSdXIwRk52bjY5UFBqY3B2KzY2TEQ4eHYydVhMTmZpbWIxa1d2VzNU?=
 =?utf-8?B?dUdUbjd1dXpaWFV3NHpBKzNhWlBlVG1weWFkeGdxK2JFYXVRK1FlSmtuSlEx?=
 =?utf-8?B?YlloWGlTTE9TVUpyeWVjRktReDExNTRjMFJ3c0pORUMwSDlDUGNmaEsvRm1p?=
 =?utf-8?B?eW1UWEVGa3RwMnlwL1F0Z2VHb2pjeUp3VjB0Y3drU3NKVkRwRGE5RUVmdUNW?=
 =?utf-8?B?a1NseTVEYkluU2hzTytMMUU2Syt6ZE9YRjliY1lXWlJpSitjQ0ZEejBEN0lT?=
 =?utf-8?B?Tk1kbWZ0SXM1ZG5BOHZueVE0NGJrNWhKMTZra2k5N1I4RDhNWmlmUVNNQmtn?=
 =?utf-8?B?bDZScmZEU0w1VU9JenRzR21sbHUxdmNVUDlZSWxLZjdHQkhaVmYvdFlSSTQ5?=
 =?utf-8?B?WnhEOENVeVQxZDl3czFtbENqeVZEZGJrcDc1WmFGWkUrMCttdWRHNFh2Q3NJ?=
 =?utf-8?B?OWNjdVA4TTdtRFJNbk9rS0o1Zm1KVG04WmVVZi9SbUR6V0xsQjJrdzd6TXIv?=
 =?utf-8?B?RUQxUkx5a2RSRVZjYWxoVHZTWG5GU0lZTU53OU1JbjVOV1V1OWVSanAyS3ZI?=
 =?utf-8?B?WUdQNjg3WkZBbTFkQ2hVM3JFam9VSks1SkU5QVVZSmNCWWc1eVJieU1YKzg0?=
 =?utf-8?B?QnFEVW0yVHRXVmM4RDhvTEozQUFnOXUwWGNWTGFlWGJ4SDFUK2VCV2RGQWly?=
 =?utf-8?B?aFllb3dXRDE0VVc0K3RCYmE1blVKeGZvZUFPM3dQSTU1b0FxM3VjR2l3dCtu?=
 =?utf-8?B?S05mRCs0N0dIb0tDbUhWN2NJWUl1OXpscWJNUFE2MVBvZDZ5L3g1dy9PbUFI?=
 =?utf-8?B?Z2ZZWENFRHpZc0c1ZXJ1TEN4YWlqTzJqY3JGVFlURENOT0l3cFhPVXlZeXRu?=
 =?utf-8?B?VHM3Y3VDcFlrd2drenloMzVDeHMzOGtNN2R5VS91a3lFcHJpOE05YWpKZG5P?=
 =?utf-8?B?TWVod0pPUlFKZ1ZIZml4bWgrZTEyZUt1dllsSUpaaTg0VUtSblNTMkVmckVR?=
 =?utf-8?B?bzl3TzA2YU5tL0RaNENHQ3JEWDErYk5oN3BQSzEzSkpwaVJYQnh0ZERiWjJW?=
 =?utf-8?B?VnpUU0c0b2h6MDU0MGQ0VURZQUZFRk9NWVVPdnp2VVN4YTF6UG9mVkZYalpa?=
 =?utf-8?B?WDZpVUEvdWZrOXJaUW9LS016d0dIWW9kbFpVclpvQzVjN1R0UnF6SVhHNVd4?=
 =?utf-8?Q?ee/e3Iykz0KBr6vciZfd7aw1t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a2e60c-9a95-4f43-e67f-08de27d5f1ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 01:41:36.9075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLj9pesqvV2kAopTia8V3xa2GYLUnMSOrmcTbkd5TXRqI/snueJ8c37lH5dSSzSKyB6asJ+ax7G0DnMInrmKig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
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

SGkgRG1pdHJ5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgTm92ZW1iZXIgMTQsIDIwMjUgNToxNiBBTQ0KPiBUbzogS2ltLCBEb25nd29uIDxkb25nd29u
LmtpbUBpbnRlbC5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBD
YzogYWlybGllZEByZWRoYXQuY29tOyBrcmF4ZWxAcmVkaGF0LmNvbTsgbmlybW95ZEBudmlkaWEu
Y29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMy8zXSBkcm0vdmlydGlvOiBBZGQgUE0gbm90
aWZpZXIgdG8gcmVzdG9yZSBvYmplY3RzDQo+IGFmdGVyIGhpYmVybmF0aW9uDQo+IA0KPiBPbiAx
MS8xMy8yNSAyMzo0NywgS2ltLCBEb25nd29uIHdyb3RlOg0KPiA+PiBPbmUgb3B0aW9uIGNvdWxk
IGJlIHRvIGV4cGxpY2l0bHkgZGVzdHJveSBhbGwgc3RvcmVkIG9ianMgdXBvbg0KPiA+PiBoaWJl
cm5hdGlvbiwgdGhhdCB3YXkgdGhlIHJlc3RvcmluZyB3aWxsIGFsd2F5cyB3b3JrLg0KPiA+IFll
cywgd2UgY2FuIGRvIGl0IHRvIGF2b2lkIHRoYXQgY29ybmVyIGNhc2UuIE9yIG1heWJlIHdlIGNh
biBqdXN0IGxldCBpdCBqdXN0DQo+IHJ1bi4NCj4gPiBJbiB0aGlzIGNhc2UsIHZpcnRpb19ncHVf
b2JqZWN0X3Jlc3RvcmVfYWxsIHdvbid0IGZhaWwgYXMgc2htZW0gaW5pdA0KPiA+IHdpbGwgc3Rp
bGwgd29yayBidXQgUUVNVSB3aWxsIGp1c3RzZW5kIGJhY2sgZXJyb3JlZCByZXBsaWVzIGFzIGFs
bCBvZg0KPiA+IHRob3NlIHJlc291cmNlcyBmb3IgQk9zIGFyZSBzdGlsbCB0aGVyZSBpbiBRRU1V
IHNpZGUgYnV0IEkgdGhpbmsgaXQNCj4gPiB3b24ndCBicmVhayBhbnl0aGluZy4gRG8geW91IHNl
ZSBhbnkgaXNzdWVzIGluIGRvaW5nIHRoaXMgdGhhdCBJIG1pZ2h0DQo+ID4gYmUgbWlzc2luZz8/
IE15IGFzc3VtcHRpb24gaGVyZSBpcyB0aGF0IHRoZSBRRU1VIGhhc24ndCBkb25lIGFueSBvZg0K
PiB2aXJ0aW8tZ3B1IHJlc2V0cyBoZXJlIGFzIGhpYmVybmF0aW9uIGZhaWxlZC4NCj4gDQo+IENv
cnJlY3QsIFFFTVUgd2lsbCBlbWl0IGEgdG9uIG9mICJyZXNvdXJjZSBhbHJlYWR5IGV4aXN0cyIg
ZXJyb3JzIG9uIGFib3J0ZWQNCj4gaGliZXJuYXRpb24uIFRoZXJlIHNob3VsZCBiZSBubyBlcnJv
cnMgbmVpdGhlciBmcm9tIGd1ZXN0LCBub3IgZnJvbSBob3N0Lg0KPiBOb3RlIHRoYXQgUUVNVSBp
cyBub3QgdGhlIG9ubHkgVk1NIHVzaW5nIFZpcnRJTy1HUFUuDQo+IA0KPiBUd28gb3B0aW9ucyBo
ZXJlOg0KPiANCj4gMS4gRGVzdHJveSBzdG9yZWQgaG9zdCByZXNvdXJjZXMgdXBvbiBoaWJlcm5h
dGlvbiAyLiBFeHRlbmQgaGliZXJuYXRpb24NCj4gY29yZSBbMV0gd2l0aCBhZGRpdGlvbiBvZiBQ
TV9ISUJFUk5BVElPTl9VTlBSRVBBUkUgZXZlbnQgdGhhdCB3aWxsIGJlDQo+IGludm9rZWQgd2hl
biBoaWJlcm5hdGlvbiBmYWlscywgd2hpbGUgUE1fUE9TVF9ISUJFUk5BVElPTiB3aWxsIGJlDQo+
IGludm9rZWQgb25seSBhZnRlciBhIHN1Y2Nlc3NmdWwgaGliZXJuYXRpb24NCj4gDQo+IFlvdSBt
YXkgc3RhcnQgd2l0aCBpbXBsZW1lbnRpbmcgdGhlIGZpcnN0IG9wdGlvbiByaWdodCBhd2F5IGFu
ZCBsYXRlcg0KPiBpbXBsZW1lbnQgdGhlIHNlY29uZC4NCg0KSSBhbSB0ZXN0aW5nIHRoZSBmaXJz
dCBtZXRob2QgLSBzZW5kIHVucmVmIG1lc3NhZ2UgdG8gUUVNVSBzbyB0aGF0IGNvbm5lY3RlZA0K
cmVzb3VyY2VzIGNhbiBiZSBhbGwgcmVtb3ZlZCBmcm9tIFFFTVUuIEJ1dCBJIGZvdW5kIG91dCB0
aGVyZSBpcyBjYiB0aGF0IGNsZWFuIHVwDQp0aGUgb2JqZWN0IG9uY2UgdGhpcyB1bnJlZiBpcyBw
cm9jZXNzZWQgYW5kIHJlc3BvbnNlIGlzIHJlY2VpdmVkLiBJdCBtZWFucyB0aGF0DQp3ZSBjYW4n
dCBqdXN0IHJlbW92ZSB0aGUgcmVzb3VyY2UvYm8gb25seSBpbiBRRU1VIHNpZGUuIFRoZXJlIGlz
IGEgd2F5IHRvIGRvIHRoaXMNCnRob3VnaC4gV2UgY2FuIHNpbXBseSBhZGQgb25lIG1vcmUgZnVj
dGlvbiBpbiB2aXJ0Z3B1X3ZxLmMgdGhhdCBoYW5kbGVzIHVucmVmDQpidXQgd2l0aCBjYiA9IE5V
TEwuIElzIHRoaXMgd2hhdCB5b3Ugd2FudCB0byB0cnkgb3IgZG8geW91IGhhdmUgYW55IGJldHRl
ciBpZGVhcz8NCg0KPiANCj4gWzFdDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y2LjE3Ljcvc291cmNlL2tlcm5lbC9wb3dlci9oaWJlcm5hdGUuYyNMDQo+IDgyNw0KPiANCj4g
LS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
