Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372CA72A74
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 08:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5503210E0AE;
	Thu, 27 Mar 2025 07:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msIZhgkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E5610E0AE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 07:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743059700; x=1774595700;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y2SXRItw/yl39Pe798jZryECpgfWUds7xoYjeO3Ziz8=;
 b=msIZhgkthcM5Fm6X2cVQucADOJtDjVuPS/o5RVQ4JwJ0Ilq75Yhb3+kw
 CislECzMLXGk0uS96RopI3sFat2VjNoBDd2crbTVetrPlBcqlIGbonFMb
 xWi5IeM6yvSnb6vExzhVhcsGTt3aKtOmNyWtn0xzh0tpokXVFyNDXmGxP
 b/oGeAbQ536NtyGPWGpjiZwBUqPt6AVOrkmyDW4GDNy9r6Gk/rPHP924y
 +44wE4FuuQOidA59Z+FiTv6anu57bjNSysT0RJT9WUqeDGr6Z70H0pGHj
 l+daCHr6KA1l8eEj9hX3WLwL5j/yze8r2jNaF9ywb2LGwXpNqpjx0xp+a Q==;
X-CSE-ConnectionGUID: LNjjewg3QQSRk6m/jrVbwA==
X-CSE-MsgGUID: cuFCT2KBT76RFlUVBirR9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48253698"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="48253698"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:15:00 -0700
X-CSE-ConnectionGUID: iOExeJBvQF+Xy7Bl403LKA==
X-CSE-MsgGUID: XvRsulJqTrGW/DqaURD4aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="129898277"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:15:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 00:14:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 00:14:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 00:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Df3+SQf3DLpbBBiyjkSsJYdmojYdxiaNBYt2UGEXeeaLFHQEoLM07Upl6VM9BccrYauDe1J8LyCQbQCDPOn8O30zbzG1u0SaP7PkjVPTizPA5QRLM7h6ia72ZFIg0b6jLrSECky6lx0pkN/Mev7vr7oTqDRWV3PxQMHWZ7nurZp+7nr5kryw1mJwpREf/k5DovMwLtR4rsjNVO5EToRez8CRnO0Ra3Sf1/owJjIyllGb7KbeW5OQ504sH0CmzVNLX4Z1Q6fCSPhhkPixP4AVZmdW+qhoI7cZIZPGQy6Tozectwxdb/Qi2tojoPcOwt8JNWR3XR7F2nV32VTQerzGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2SXRItw/yl39Pe798jZryECpgfWUds7xoYjeO3Ziz8=;
 b=Z9XjwSbEk4GwEF7A1D3Yg6k07h0FyyufxKY5SRSPvEgTHfRUXGgHwbcoaY5z/FL3RDXr3p3eBDz5CYXKrSQ+mDHgvWWbBtJkD5YpvKPRa/bSHtZKHWwNDfAdQKDKl5s9OJjVobzAZQc829ea8drRebdi6UTovN2Fb/0JFcZyo/i36XNfePuklAIhOsaVaiWFQvKnXkuMNSUp31iT18Sx2Rp+Y7w4pa46Ghrr8mOxGbYc2TJgFvHOQVD3kZXlVJ8i2WNjrhk0xqic/KcKQLSY5ovS1KaW/WK7FQ/VZgwo1csBJ5EUq7Ja4vN0a1biZzaPRDuoPyDcxZwyAti8B1+qdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 07:14:57 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 07:14:56 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [PATCH v1 2/2] drm/virtio: Fix missed dmabuf unpinning in error
 path of prepare_fb()
Thread-Topic: [PATCH v1 2/2] drm/virtio: Fix missed dmabuf unpinning in error
 path of prepare_fb()
Thread-Index: AQHbnfGBeSAw8gFsy0Sck8QBafnwF7OE3R3AgAByhgCAASzF4A==
Date: Thu, 27 Mar 2025 07:14:56 +0000
Message-ID: <IA0PR11MB71851C0607629875CC458A90F8A12@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250326014902.379339-1-dmitry.osipenko@collabora.com>
 <20250326014902.379339-2-dmitry.osipenko@collabora.com>
 <IA0PR11MB7185345D3DFA8C7900059144F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
 <16a30d03-9c98-47a4-959f-8671f7cb7fab@collabora.com>
In-Reply-To: <16a30d03-9c98-47a4-959f-8671f7cb7fab@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CO1PR11MB4994:EE_
x-ms-office365-filtering-correlation-id: 997d151d-033b-4b8d-0e8b-08dd6cff1447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NXFxa2RhRlg1OWk1V3dlVGQyL1RBL2FHUXRCZThyUW9UQUhpOGNiMERvemVu?=
 =?utf-8?B?dGdabFdLTDUxLzlvMDVOUUdRK3RFY2lzSGVFdmc4U1ZmdG8vWWNYa015VjN0?=
 =?utf-8?B?bWJuVE9JcmZ2WnF3THBFaG51MEVNWGpwWTVlekZCcHdpOHR3VExORzZRWGZB?=
 =?utf-8?B?VkdxYjdtcjRMdnVwVm1BVWNoRG5xdWt4cklyaUxmV3pISHN0S2cveG84QVF1?=
 =?utf-8?B?bTByWXNMS3lhNW41SVlRNnEzZGxrMmtXMEloYXl4bGtML2VuM3AzSWZWQnM2?=
 =?utf-8?B?VDE1ckNvZGR1RmVyK3NDR1pKK2JhY1JtSTNNVHE4TmtLZ1JFb0tZNVhRK2xt?=
 =?utf-8?B?VHpPMCtMSlNqbXU5MnBFSW4zM2RyYXB2cVhKWjZ5Q3ptS1hSa29IZTBTU3hn?=
 =?utf-8?B?VWdpL0c1MC9aMTBpZ0RuNWEvTUcwM2R2NDNBMStGQmFScHFqalRab3VrL2N4?=
 =?utf-8?B?bEhURGR5MHhhVHJjNThSNTdUWGhrdE1YYjN0cjg0WGZKVGo0ejVic3MxZGEr?=
 =?utf-8?B?ZWtRZ2hHZzlGUWg1aXg1UGZLTWdub1RScHNhQk9OV2lkZUZtT1ZxVSt6TW1w?=
 =?utf-8?B?V0ZUY2VvL1NWZkZkUURtdmRFak9iOVN5VFhRSENEUTFNSy91c0ZLMERFSno4?=
 =?utf-8?B?aVFBbVhyQkswRnVhM2JMWU44TVQxOGdQTVZMcXFMZ3FEVTNmRGxsRHZtSGNT?=
 =?utf-8?B?YkNhamxjSmZraDVaOEF3STZUZXp2VmRkcVU3cFJaR29WNWdQN3U1TCtNSFdI?=
 =?utf-8?B?QnNPRGFuV0lVSjQ4cURVK1NHN1ltdElBTXMyNXd0d0FDZkJNd0hmcVg1WVdq?=
 =?utf-8?B?Mlo5L3JmcU9DWVBxNVhCZmJTWW9KcG1mNGRVMVJ0cUZTeWFkS3VrV01nOGNY?=
 =?utf-8?B?T25hOUVVMXAwYkJ1dld0Z1E5eFErVFNKWDRndlNMTG9sa09uWFZ1R3UraXk5?=
 =?utf-8?B?b0NQY2MzRkRxTHRmN0xtVjJpd2tzT1NtOS9jd2J6UC9IbUI1YmNZWHBmdTNS?=
 =?utf-8?B?c1RJTXIvTytLOGx0NjJPNHJOS3c2R3pXdGd5NHZYTGNzbS9jU210bkZ0OEhs?=
 =?utf-8?B?UmQ2RlA3YTZtTkxqZGtySHY3c0tqaTJ6SGFhMFpJSEdCU09xYklYQnZjU3g2?=
 =?utf-8?B?SGRGVjNjakRxK1ZKOGhzSHFlSkMzaEtmRTRxMktUaVl5eXB1bXN2a0FHdDdn?=
 =?utf-8?B?dUxueFZOMDg3aXppTFVETnNXK3k0NTNDV0ttV0diMGR1SHB6NThMVHdmd0pD?=
 =?utf-8?B?eE1zeElSY1R2NmlJdU9LQlRtK0VyakEyM09kcVcvdkVFNzNaZ3VhVnhmcjBt?=
 =?utf-8?B?YytGVHRXeHBHWFlhNFJFbktTSEErbVB5dTVIOHF6Z1ZnZm0vc2M5ZzJmWk0w?=
 =?utf-8?B?blJjeDZqcXA2OWY2ZGVZSEwrSDJraEJoWXFnV21pTzBBNm1jWHFqZzVYSjFT?=
 =?utf-8?B?ZVJYcWJWL2xTZFhkdSt5MEUrWVk2d2xXTjVBaUJpUTBGUGtOa1hrNVJsa3Jy?=
 =?utf-8?B?UkRNR2UzL2x2WExVeCtyNHVBYTlDMU9zT3Vjeml3RElyVmt5bEVheXgxellW?=
 =?utf-8?B?Tm1xRnZ6TnhLN2RSazcxckFXNGNTSzRXZHhqSDRmcFo3VDhqbHl4UmFaRkJQ?=
 =?utf-8?B?dWQvb0w0L01CbUtpdlJhekd1bG5wZGJZYzNWeWdXdDlCeFBDS1lpU2hLa3F3?=
 =?utf-8?B?ZXRiSmdRMTIrZGU4cXR4M1Z6aGw4T0lCY3k2MGwvMVN1VHpvRFgzSHNyTksx?=
 =?utf-8?B?c1NtQ2syMEl6OEJtb0phQmp1ZmtPaklFRXQ2Unk0eHNVSXYvZ3J3M1RiUmRy?=
 =?utf-8?B?OWZCSU8xSVpyNXF3RHNWWDZRU1J6ZlFCbjd1OE9WTmRvcVF2czZNWmF0WUVV?=
 =?utf-8?B?ekcrSHNYQVVGczBzSEt5RGRWZXZzckFXOFlacVo4djMzSWxhdGg5WWZZSXhM?=
 =?utf-8?Q?FYzjpMdhkvrnrwbH/i567tYTyZdHhnyI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmFPdFkybDNnNjR4OGxyOTREMUpiT0xoZmFKbm13WE1JcFdGWjYrc25oUktN?=
 =?utf-8?B?Wk9pZUdzTXlFY25iVWl0QjYyOUQ2bEgrbmNmT1gxaUZMYXpTcFVFcHV3YS95?=
 =?utf-8?B?QThDc0JVdEdLckF2ajhaR3F1bG9jNmF2QUd0TEduZnhGd0ptbTJXVzhGVXZN?=
 =?utf-8?B?UUV0dVNETzFyQlpXaXVLOW9qMW95SzhUOHZzQ1hycExYdndyeGZQeUQzbE92?=
 =?utf-8?B?TmVSL29DOEJuN3krRWdtWTdYd2xDLzJCUE90WFlEdmpOM2N1a1daUk0wd1NR?=
 =?utf-8?B?UnlBZUVKaVB0Sms5NDBLeEdrUEgxcGdCcEpUNFdlSWJkT2o3ajNmSUdNNGFx?=
 =?utf-8?B?VFlWaVNMa3lFY2pyZlBndzg1YldZVGFkUE1JcjhHaWEwNjJiRWk0ZkdtYkxH?=
 =?utf-8?B?YnZmUnpjWTlGRWx2SUlzY3dWMWxpcVlvcjczTm5Oay94ZXgxSHZjV09FQUx2?=
 =?utf-8?B?ZjJ2VVlJZ3ZJaVAxZjZzZCs2emJnSWdEYVVLcHAvTjlFNS9FYmZrT1EyTEhC?=
 =?utf-8?B?MzhBd0ZXRWhNalhUTm83UnM1b1Ivd1pIRU95MzVjUDVwUjVYb1dLUmtLVkty?=
 =?utf-8?B?SjZjSm92L2twaFMySVErNklUejVJaDRPK3hqSytTSm5odUpIK1JjWEhNRGdi?=
 =?utf-8?B?cnhXdlVKTm53ZzhpTmtkekRhR09aVXZsSDhhMWpNMzg4YktDcE84WDNpbXZ5?=
 =?utf-8?B?L2NFYXcyU0lKMUxsTmZkNzQwZmlMMWhKUndCMVF4b3hGcWxBb09ZcTF1UTlp?=
 =?utf-8?B?VUxwUzJGQzY3OVpqRTZ6NUtQbmZNN29TWFowRzZ0dlJpaFZBK0V0dERqY3Ar?=
 =?utf-8?B?aXdvVG54c1V4QVd6VURXWnA2MkJ4V05pWlhSU05HMGFCLzVFREM1UXlCNnJJ?=
 =?utf-8?B?bjFUQ2ZOVUhXY2VQRmNhUW1hUmdWV3JIS3RmQ2tMMGlyMExkeVVZSTZibHBM?=
 =?utf-8?B?RmM5SHJFK29YTXRVY0J6WE0xZDRhUHE4SHJKWjdtM3lFdjNwY05CbXZmWEtQ?=
 =?utf-8?B?cTNoWEVBV1Fmd2ZvR0RMVHhwelEzeWFTc2hHTmhjNVBRSjlTMFVBS2tSdHJn?=
 =?utf-8?B?TTd2RVBXR2ZHY3lLUmdXVGhjak55dk54eTQ2Q0F6MGUrRFQ4T3JUL0xFR0Ns?=
 =?utf-8?B?dXpteG1sM084K1krVDg3SUlnTjl5TXZnVzdkQThubmp5QUUzSjcyTTFTeG9D?=
 =?utf-8?B?ZEZqMFd5aFRsTGZnVTRFc2J4UTJTVmY4R2IyOGszNUhaT0ZTNzdIM1BpZURJ?=
 =?utf-8?B?NGdjNWdCWFBFSzBtOW5GWDR0S1NWM0FlcGNqNU5KT3BrTmx1aVRHSWh2aDFN?=
 =?utf-8?B?RmRFMDlqNC9QVUpOY0ovQUtNRHVBc0JUcWVBZzhybmp1S0N6enZjc0IwWEcz?=
 =?utf-8?B?bnJCVmtuUEZuQk9MTjMzUE42QUF1dTlzRWlCWHVPczNZMDcwcWNkdTBhL25I?=
 =?utf-8?B?NlQraVU5MzZlMWtDOVN0Y0UvOVoveFdrS1Fyb0FGMHN0OHNJYkcxSjZWUjNr?=
 =?utf-8?B?RXJ6YSs0MGZrbkRVMjZQazBNaHk3M0svMmdqSjNwUG5ldWpkY2pDSU43WnJF?=
 =?utf-8?B?WDZnUStBSTZwM3dHQWtESUtGalZpZGYwQ25zTlN6MlgzdUs2YWx2MjJxcU1W?=
 =?utf-8?B?eHBWSFk5dW5kUXFVbDJORjZCVWF1TkFPNXY5QXBvemptR2FNSnVGcXlqdXJy?=
 =?utf-8?B?bjJFY3ZLaDFreVNYSHpDOFJMVGJzcGZFdU1lSEE3NTlEMWFXdVA4K2xLWHZX?=
 =?utf-8?B?K2tCSjhVWm1hMkpHcmNaQnpjSmozM21BdGV6RGRtZ0h5Nzl4Ym9saytZYldW?=
 =?utf-8?B?bjhlR2g4bk9sMnlFaUJTMWRjK3pTdUYvUlluTDVjRVV6NXJLTlNjWndaczZp?=
 =?utf-8?B?NmJlOFBWY0NydjExSjBETU13N2NCbHpFbkFSYzVKUlkvUjB6bU5kS3Qxbmpq?=
 =?utf-8?B?cnhKRGd1Q3VPVmdKcy9wM0Nrd3Z3KzFhMFdiZ2tMNmVYdUVicklaWjdUbDlx?=
 =?utf-8?B?SzlSb2Joc2wzbWVidEVvNWNLcStlZGh0Vk5LbmRIR0hWNDZ1QWdoVGFzakVN?=
 =?utf-8?B?eVJIZG5tbE9meDJjWGRpL1FRUUdUN201UFpZQnRjVjBHYVRYeGpnSVFISjJ5?=
 =?utf-8?Q?qCMYrvFfd4mUEPY21Jq3B3/Tm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997d151d-033b-4b8d-0e8b-08dd6cff1447
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 07:14:56.8632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcwSUqWsvk78J3xa0DRhvX21D4uXmMvMDa3IOC8UVP6fA0Ics/CQ0m0RtN34WhK9oKoDurW4LtvUhhvd2sfoygUM0HYpTY3ljUq91HF7wzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMi8yXSBkcm0vdmlydGlvOiBG
aXggbWlzc2VkIGRtYWJ1ZiB1bnBpbm5pbmcgaW4gZXJyb3INCj4gcGF0aCBvZiBwcmVwYXJlX2Zi
KCkNCj4gDQo+IE9uIDMvMjYvMjUgMDg6MTQsIEthc2lyZWRkeSwgVml2ZWsgd3JvdGU6DQo+IC4u
Lg0KPiA+PiAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3BsYW5lX3ByZXBhcmVfZmIoc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmUsDQo+ID4+ICAJCQkJICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
Km5ld19zdGF0ZSkNCj4gPj4gIHsNCj4gPj4gQEAgLTM3NiwyMyArMzg2LDE2IEBAIHN0YXRpYyBp
bnQgdmlydGlvX2dwdV9wbGFuZV9wcmVwYXJlX2ZiKHN0cnVjdA0KPiA+PiBkcm1fcGxhbmUgKnBs
YW5lLA0KPiA+PiAgCQl2Z3BsYW5lX3N0LT5mZW5jZSA9IHZpcnRpb19ncHVfZmVuY2VfYWxsb2Mo
dmdkZXYsDQo+ID4+ICAJCQkJCQkgICAgIHZnZGV2LT5mZW5jZV9kcnYuY29udGV4dCwNCj4gPj4g
IAkJCQkJCSAgICAgMCk7DQo+ID4+IC0JCWlmICghdmdwbGFuZV9zdC0+ZmVuY2UpDQo+ID4+ICsJ
CWlmICghdmdwbGFuZV9zdC0+ZmVuY2UpIHsNCj4gPj4gKwkJCWlmIChvYmotPmltcG9ydF9hdHRh
Y2gpDQo+ID4+ICsJCQkJdmlydGlvX2dwdV9jbGVhbnVwX2ltcG9ydGVkX29iaihvYmopOw0KPiA+
IEkgdGhpbmsgY2hlY2tpbmcgZm9yIGZlbmNlIGFsbG9jYXRpb24gZmFpbHVyZSBiZWZvcmUgaW1w
b3J0IHdvdWxkIGJlIG11Y2gNCj4gYmV0dGVyLg0KPiA+IEluIG90aGVyIHdvcmRzLCBjbGVhbmlu
ZyB1cCB0aGUgZmVuY2UgaW4gY2FzZSBvZiBhbnkgaW1wb3J0IGVycm9ycyB3b3VsZCBiZQ0KPiA+
IG11Y2ggc2ltcGxlciBJTU8uDQo+ID4NCj4gPiBSZWdhcmRsZXNzLA0KPiA+IEFja2VkLWJ5OiBW
aXZlayBLYXNpcmVkZHkgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+DQo+IA0KPiBBbm90aGVy
IHF1ZXN0aW9uLCB3aHkgZG8gd2UgbmVlZCB0aGlzIGZlbmNpbmcgZm9yIGltcG9ydGVkIGRtYWJ1
Zj8NCj4gRmVuY2luZyBpc24ndCBkb25lIGhvc3QvZ3Vlc3QgYmxvYnMgaW4gdGhpcyBjb2RlLCB3
aGlsZSBkbWFidWYgaXMNCj4gZXNzZW50aWFsbHkgYSBndWVzdCBibG9iLiBDb3VsZCB5b3UgcGxl
YXNlIGNsYXJpZnkgd2h5IHRoaXMgZmVuY2UgaXMNCj4gbmVlZGVkPyBNYXliZSB3ZSBzaG91bGRu
J3QgYWxsb2NhdGUgZmVuY2UgaW4gdGhlIGZpcnN0IHBsYWNlIGZvciB0aGUgZG1hYnVmLg0KQXQt
bGVhc3QgZm9yIHRoZSBub24tdmlyZ2wgdXNlLWNhc2VzICh3aGVyZSB0aGUgcmVuZGVyaW5nIGlz
IGRvbmUgaW4gdGhlIEd1ZXN0IHN1Y2gNCmFzIGluIHBhc3N0aHJvdWdoKSwgdGhpcyBHdWVzdC9I
b3N0IHN5bmNocm9uaXphdGlvbiBmZW5jZSBzZXJ2ZXMgdHdvIHB1cnBvc2VzOg0KLSBJdCBwcmV2
ZW50cyB0aGUgR3Vlc3QgZnJvbSByZXVzaW5nL2Rlc3Ryb3lpbmcgdGhlIHN1Ym1pdHRlZCBidWZm
ZXIgKEd1ZXN0IGNvbXBvc2l0b3INCiAgRkIpIHVudGlsIHRoZSBIb3N0IGlzIGRvbmUgdXNpbmcg
aXQuIE90aGVyd2lzZSwgdGhlIEd1ZXN0IGNvbXBvc2l0b3IgbWlnaHQgcmVuZGVyDQogIGludG8g
dGhpcyBidWZmZXIgYXQgdGhlIHNhbWUgdGltZSB3aGlsZSB0aGUgSG9zdCBpcyBjb25zdW1pbmcg
aXQsIGxlYWRpbmcgdG8gaXNzdWVzDQogIHN1Y2ggYXMgdGVhcmluZy9mbGlja2VyaW5nLiBUaGlz
IHByb2JsZW0gaXMgbW9yZSBub3RpY2VhYmxlIGluIGNhc2VzIHdoZXJlIHRoZQ0KICBHdWVzdCBj
b21wb3NpdG9yIGhhcyBvbmx5IG9uZSBiYWNrYnVmZmVyIHN1Y2ggYXMgWG9yZyArIGRpcnRmeUZi
Lg0KDQotIEl0IGFsc28gcHJldmVudHMgdGhlIEd1ZXN0IGNvbXBvc2l0b3IgZnJvbSByZW5kZXJp
bmcgZmFzdGVyIHRoYW4gdGhlIEhvc3QgcmVmcmVzaA0KICByYXRlLiBJbiBvdGhlciB3b3Jkcywg
aXQganVzdCBzZXRzIHRoZSB1cHBlciBib3VuZCBpbiB0ZXJtcyBvZiB0aGUgYnVmZmVyIHN1Ym1p
c3Npb24NCiAgcmF0ZSBhcyB0aGVyZSBpcyBubyBwb2ludCBpbiBnb2luZyBvdmVyIHRoZSBIb3N0
IHJlZnJlc2ggcmF0ZSwgd2hpY2ggd291bGQgbGlrZWx5DQogIGxlYWQgdG8gd2FzdGFnZSBvZiBH
UFUgY3ljbGVzIGFuZCBkcm9wcGVkIGZyYW1lcy4NCg0KVGhlcmVmb3JlLCB0aGlzIGZlbmNlIGlz
IHJlYWxseSBuZWVkZWQgZm9yIEd1ZXN0IGJsb2JzIGluY2x1ZGluZyBpbXBvcnRlZCBkbWFidWZz
Lg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IERtaXRy
eQ0K
