Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAGQLF/pk2kt9wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 05:06:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D333148AA9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 05:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2810E430;
	Tue, 17 Feb 2026 04:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gl8ZtiEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086610E430;
 Tue, 17 Feb 2026 04:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771301213; x=1802837213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SdrWDSibQH/eNEtOauaL2K24lshVBmC49PjwZZPJhUQ=;
 b=Gl8ZtiELaHFStxU8Ec7w8eXLzllvZxPRRC3HwgvqbnIat6V68VqPrYwA
 QNrKKFcf8OIXlaC2NSbD7KIL2z1jf3nVSg5NyXh+RUOapttha8PhRXrTY
 NiM9RqhRSoFQejIEwuxsaVEecbkNf8u9TrJWh/KdwlJ1uargFdSzXzgH4
 Qs9iiolZPVWZ3J2RLFPyGJEC4nxc7w+FVbE54brn2PibjeGrMvPYwhxZS
 L4kizLr8p7XK7wJp4bqKDsKLBrdWnHfjJ1OmiJmM7GggHzLUx/91Jn5nA
 0nhjhTfuv1k52FZSgh8uEFqQNz9YqhagCZkA7nPl86OUx0P62QUnsxmNP g==;
X-CSE-ConnectionGUID: o5JdoL4bTDSe3H1+JyVXOw==
X-CSE-MsgGUID: f7hlSHTgSM2k3s9EptDkbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83469162"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="83469162"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 20:06:53 -0800
X-CSE-ConnectionGUID: T1ZVHd0MQQqWUOuneSrGBQ==
X-CSE-MsgGUID: /ZTzryy/Sq224KQaoch8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="244355886"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 20:06:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 20:06:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 20:06:51 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 20:06:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZWEhcaVCp5ILGoo3oEPFiX3DmDGk2ciBCkJ3XNYDeroF8vo1urOsDfb/TR5E/8rAtsgHwLViSJlPxcM5ZgbGmlX0zhguUNEWhQkLsHtBgxN7Uc98gEhGscF/19KnCEzvnI5k0YqrggfWkqF7EASkJqwfYFbqAUm6u3vxfAbZJpVjp2Df0G993kH60Eoa+uOhpfz5N55UXrwugtw1oAJA9G3+LQ+YRq0m+FMBV6bF1aTgHomCtA4CIzlJR7KoZ3EKeG7JDMWGB9LjH4uzvaQloXAw7004CovLv114EIUERKrJKScPM0xiIEcIbI+fdpXlDy7S2xI//08aYhrzd4aug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdrWDSibQH/eNEtOauaL2K24lshVBmC49PjwZZPJhUQ=;
 b=ViPY39oszaHE2byGLQBowwTSJouEeVbstZICVoBfNbzJn3Db5mRjnGCSusuqiJGyuwexjcLwpi3yY0XMEH/ONnIwIQe1eWQ7QAV8JiWJUTxzghShLehW0uY8oBjGhga955P6sgPunF+c5BEdrp6bvU7pU33h7iPnofNumR/gw8j8u7E4Yfxtua2sMZYnHArzxiCGyEWk+2qdPWegdg4k/s9+hdKdTGM23/2mOOvkxsQwMxpm0/9SdXW/tPIpCCkyhXqa3ehdyIvsNoRj2FEiYtxO/qA+eFD+MdMJqYajEL2xaLOVZmGos8m8+qVwVakI0V3oVBnFB1nfAIV7nt8vtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN0PR11MB6159.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 04:06:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035%5]) with mapi id 15.20.9611.012; Tue, 17 Feb 2026
 04:06:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Yella, Ramya Krishna"
 <ramya.krishna.yella@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v9 5/7] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Topic: [PATCH v9 5/7] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Index: AQHcmmyF/wh7TPXY4k+bl1HdMVXKKrWAX11AgAXxN7A=
Date: Tue, 17 Feb 2026 04:06:48 +0000
Message-ID: <DM3PPF208195D8D5EE466FCF01A94F1F899E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
 <20260210-atomic-v9-5-525c88fd2402@intel.com>
 <DM3PPF208195D8DA23C85CF5B0645AABDD4E361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DA23C85CF5B0645AABDD4E361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN0PR11MB6159:EE_
x-ms-office365-filtering-correlation-id: b836c65f-a59f-40af-b6a0-08de6dd9f8e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NzdWMkZwaTF6alNiSFNRR3RrcEJCKzNHK0NZOTIxL0o1QnM0YkNtV1ZmZWkv?=
 =?utf-8?B?RjVIS2lMWDZoaUM4bFJaRUxQVHQvNXdITTBLRGFybVhzb3FOMSttSEVzSi92?=
 =?utf-8?B?YTNXUlBsYkNnU2dET1Z1UU5Sa2NZaGk2MXF3NnRJSCtYckxDZ0cwSDBXamQ1?=
 =?utf-8?B?WWwrQWNrOGZjMncyQ2VMU096TWRLM0o4Qkx3YkQvbzBtUDJJYUJ4M2tNb0wv?=
 =?utf-8?B?eUtUcmVkNTJ4S1RnN0dQeWZBR0pXWXFUcCtoUTdqRi9KRDVpVjBBT28wOGdv?=
 =?utf-8?B?bXZuYUM3dmVKVDN4Qk40Q1VVck11bndnWjMrU21MTkRxVTFJMStpSEtHVkZO?=
 =?utf-8?B?WHVlTFptSjFnRDZ0YlBZZnV4ZWFiT0RnYXNhVlgzbFRuMC9GY3YxRWFHbUJD?=
 =?utf-8?B?NEZlRWNwKzV3R05sR1lKNzEyZ1ZVZ2JTUDFIbWlPQjMzQ29aL295WE1iMGNV?=
 =?utf-8?B?WWI0a0xsT3c4MjZlcnNxSXppN1h0Z2ptdkpZNHlFWFFPWjdoZTZ5YnRLVExF?=
 =?utf-8?B?SXJjRlM3UWhRTHF3aEFKYkdUc3FNZDh3K3BCRDJzVzVramZudWdrbGtINVZE?=
 =?utf-8?B?Y1BkQVorL0J1enNRWEpWb0F1RldoYVNSdHBpNzk5cjFjYjExejVKVEhFRTFu?=
 =?utf-8?B?R2Z3a1kwQTlxVGd2R24xeGtzQzlib1pKMTNHVXRhRS9rUUp2bysvR0ZWbU9I?=
 =?utf-8?B?NGxqem9KQktXbDRsYlFhWXZiUDNxR2dWRW5NbDNESkkwWVRoL3FVVEFrK1lQ?=
 =?utf-8?B?VFVkOXNuSi96UFg1eUR0U29yV3QxY1VTSmRScW1xL0gwVU1KemEvWHh0TXI2?=
 =?utf-8?B?ZzdtamFxeDM1R3ZoUjhtM2hGQ0gxK0E3Vk9kSFhGVFBPT25tendIeFdHTVFW?=
 =?utf-8?B?T0pBNXlxeHZGbExhQ1pjajE0TXl1VVdGMVNtUCtnR1VEZmNnNHF1c3F5RSt1?=
 =?utf-8?B?WkFENElVRkk5WlB3NlZtZHBZY2JoVjc0L1ZyQ1k0ZFdHN3BHcDFXR0QwdlNq?=
 =?utf-8?B?NkNxTHFhcEdHUURyT0VzWUpYWU9qUzhoVmxQY2VkMW9kRzZURHlSZzExNktw?=
 =?utf-8?B?bkRsUUlxYlVpYWI5R3VIcDNSZExrUXdLdXJMeTFuOFp0SUVGY3dDYkM2QytQ?=
 =?utf-8?B?dzZ5MnpWRjVYNFc1THJmL3l2b3NXWUdIR0dWajN6M3FqbURzTWtyNVljYy8r?=
 =?utf-8?B?WlJ6WDZZKzl6eUJsVFBSS2pYUHlFbkw2SnhpblBrUlBINWk3bzl3M0JCRHhv?=
 =?utf-8?B?VHRlTHJHQTc1L0t6SFBLeEg0SGd1dnVRdkJyeUExSC9sMlhneG0weE5QeHJR?=
 =?utf-8?B?MGljYXhZZ3RTTFE0OTNndjdmWnpaTzkyTWJ3eTFYYWp3aTgwcTZpeWxEd2Z6?=
 =?utf-8?B?SFFtcVd6VG5wMTJTYmp4eFoxbjJiUXBlWnlIbXRNMW15bVIwZklrRUtRbWlP?=
 =?utf-8?B?YTNvV203VDZzVE1Ya0swR2UwVG54R2VpaUFDRk81ekRabGx2NFVkU0xDT1J2?=
 =?utf-8?B?YnFwemMvd1JEZ0ExVm9lS2tXTVBoRXhkTXlyaEVwQmhMZXl5azg5ZkltWURS?=
 =?utf-8?B?eGxpV3VzK2JlQ1dOMnJTYnZ0ZTF5bEN0aXVjTU4xMjJoOFdaNE9sRDJ5VTRi?=
 =?utf-8?B?WWtyZHVSQnNvYWFNUkduMDEwdWtyOC9pRnVEUUR3MXNNaWxiUUZHdm1oYXpo?=
 =?utf-8?B?NHhrL3NDTmNYclJqdlJMZ0htUXJqYng1U3pRcjk5c0NKZ2JlZ29aTHZUWFRY?=
 =?utf-8?B?cGpOOTR5ZHVBUmRDdXJZeU80Z3dTekl6YUlpSEc3ODVXYWpPbnhzWVdKS1Ru?=
 =?utf-8?B?ckxnbVZ0aGVScHV2WkdPNVJDTTQrZzZrUUV1UWNWWmdaT294Z3ZmbXRmcXdk?=
 =?utf-8?B?bG41MnR1bXgyNGIzQWpiV2Y5M2t3Y2lBVDZLdThJZVhoQzZmT1FxczBmWktO?=
 =?utf-8?B?Mm5hZTZ6RmRZODRkUTdjT29NYSsxZXg0aDdjN2tSSGJOTFN0bGd2Ym1aNlNl?=
 =?utf-8?B?WUhYVjRCaW55Zk5BZ0h1alRveEw5eGhacStzTTJJUUt1TGNFWVRmUDFKRUNQ?=
 =?utf-8?B?VzV2RklJWUZpS1d2Y3Vxd05lRzNWU2N3V2t2QWFZVTRGVXlIUTJhWk5RN0I2?=
 =?utf-8?B?a1NRUXV2dWtsZ1gvaCsyZG9YSFZlM3BvRzBVeFZSSXlpenRlMXo2Y2RKZmdN?=
 =?utf-8?Q?J6ZtfbJUHp1Qck2iWlg7X61GZJZj36zkzpmClqauCoEM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVFJRnovR0ZmK3E0RHdNbXdSeGN4bFdrWm1sQXJoZDV0MUdhOS9OY2NxVG9B?=
 =?utf-8?B?YklwZVVqdTF4MldSMUJHWmRrTkVuZ2pwR001dEtidlV2TXN6N1F1QmV3d2NW?=
 =?utf-8?B?YXU5Z0g1TjRNNWYvY2tQNlUyUGg2WTRCRk9xTkh3dk5SSVZ3b29nTmNzMmNZ?=
 =?utf-8?B?NlNkcEhGYnR6cFYzYkVMY2NQdG5vaHlMbDdSYXJHOGdiQ0xKODdXeitGY284?=
 =?utf-8?B?ZEQ0TE9SMjUxY0RqOExPbWNGeXNYMWxNclJHUWwwR3d5WVRkd05TdkxkSEc4?=
 =?utf-8?B?T1B1WXBJMk9ZcDFYZDd4cEkvY1EvdVZUVU1KcjlRSGFFY05KbS9NUEdoS0ow?=
 =?utf-8?B?TGQyVXlYT25HdUxMSlR2YzQzT1dob0hVR2pHY3ZZQWQ5RlNWR2pqMXNTTk9K?=
 =?utf-8?B?dVpNaHFTOUgvUzFLUkhwTlMvRHh3UWNBVG44b1BXeHpIWnBvQjFWeHVBa0lh?=
 =?utf-8?B?WmdFUlN4Q25nNGFDditLQWkrMVNjYlZlbFVNTUJiVnh6KzRmS3dLUUkrcTRB?=
 =?utf-8?B?Y0JOYXp1N1BkcUxjRzlMUEZMbkxIU0dFNWUxRHhBdzVyTXI4RVRPNEhLbFJ2?=
 =?utf-8?B?SkRZMS91a0lkdVF6UFkvY25CLzhsTTV5MUlGNzJ2UUtXUnlhbWxKR0pTUUY2?=
 =?utf-8?B?ZkE4S3NiWCs3T0RVbzhsTWVRcUZyeGhkdHFNWHg0MFdnZ0hoRFhmYmJQN2RG?=
 =?utf-8?B?RnNMTUJhT29vb2xHemtBcFdVdnMvT3hMUE42SWw3T09TOW1SVmViTytJL0dM?=
 =?utf-8?B?ZmNnbUR6R2x1WU0zNXdxb3I2OWFUQ0sxRitkeDJUTjhvZUhmN1FVa2VBbUsx?=
 =?utf-8?B?Z2daTVhvZVdmNzBGSnprNXJ0d0U5bUFpbkRVVVExTUprREJCekZ0Nk5ESWhQ?=
 =?utf-8?B?cWR3bHpyL0xKNHdOWXByZWZUanVTbzAyYVlMd2htdy8xNk8zM0dQOVlOcVZE?=
 =?utf-8?B?cER5MDM0UENIWFlPR1VoU1FneC81Y04vLzkvbVdYWjUyRDcwYlNyMkhBREg3?=
 =?utf-8?B?MnpiM0hYSWNSWVQwVlFiN2NMTzhYUncxa3NzclI5K1UwQjk1U0x2WURzTG5T?=
 =?utf-8?B?TEMyUDVzNDIyaXRFWGtvNDBmVldpNnJKSzlNY0wxdXQ0SEVnLzNIYlhnaDZ2?=
 =?utf-8?B?a3B4YWdVejZHYzVnMWo4aXFmbUprcVFsbzVYMksyV3ZHMUh0Vk5ZTjZvYUV6?=
 =?utf-8?B?WUREbUxkMDRDQ09ZUkxmaFd6UlEzdjk0T2cwZ09sZkdQM3k5b0NzOThIWlIr?=
 =?utf-8?B?bWxYVjVMVVBWdGJqN0NacjNwT2ZLQ1hoTEpqaGFwVmFNSnN0cHRoZ3Vwc3Y0?=
 =?utf-8?B?NFFtSldoSzkxZnluNTR1Umg5K1VoRVcveVJRN09FN2dwMFR1WUNvS3J1Z3lF?=
 =?utf-8?B?U05nWTlBLzFaaVI2ZWhSN1ZMV1NHNE00MDhmNnpVN3o3VGR4c25mOU9OWHQx?=
 =?utf-8?B?dmZMVkN0R1dnWmQwV1ZYbmliZThZaDRaZlFpbzVGVDBwbkZpQkNOZ21hbFVB?=
 =?utf-8?B?Zi9JT3JvYm1PUE52UW5kRXBQMmFlNG0xak1LRythbzhXQnZtaEQreklwMk96?=
 =?utf-8?B?cmNoOW5nOHJNc3o5ZjhrNHE3ZkgvMi94VzdEVUt1NHRPWEg2RzVnSlRzVVAx?=
 =?utf-8?B?RUl6M1pYSGwxTDRxS1FvQys5Uks2eXYzL1pNNlRYb1Y5OU1kNGcwMEFoT1F6?=
 =?utf-8?B?SHZDUzFLdWdoQmVqem1jbFN6TUx0cWlaZ3F4TGhsUXBJYTJaL1ZZVzRBcUxz?=
 =?utf-8?B?RUUzWHVJNVRXS2xVMnJSV0FyNTB0aDRqTzhCaTM0OExBVWMwY3BDLzZwQ3JX?=
 =?utf-8?B?QzhJWWZWOGJEakd3bExzc3pyaEcyQXM1RkYvaDhabW5yeEFZd0hjaC9hcUNB?=
 =?utf-8?B?bGtlUGJmR0E1ZlJubDAvaWFzZmp5Vi8yNFZjNWk5VktPTC9EcGZjRGFpUk5D?=
 =?utf-8?B?ZE40NUwvU3hRbzFrSGRncllGZmhGUEJBSGE3L2NPdUJZcDMyc21MZG9Ia0hG?=
 =?utf-8?B?Mno5NmdYTzFaSVFsNGptSFlvQ3ZXdktmajM0NWIwOVlHbnB4U1VSNmo3TWhL?=
 =?utf-8?B?U2c4bTV4RThuTEx5YWFDdlVaU0hBSWIwN29WbzlyTWdaK2RxZkJhaW9MRDhY?=
 =?utf-8?B?SERvSFNYRjNmNmE1ZzVPZGJrbFRWZGw2WXFlWTl4d1V2KzNKVXFVUzgwR0pV?=
 =?utf-8?B?cXFsblhvY3RqZk9GOU9tTFdZbDdCRkJzTVFzb3lQT0FiK3h2dEV1bnJOYkh1?=
 =?utf-8?B?cjZrSFFyb2grTndVMDRaNXVyRkZpeUV5bkJiZVVsa1Q1S0pGT1dUYlpiZmcr?=
 =?utf-8?B?eVlvNGpiVnN6TlZCbzFBaDlTM2VFdFBDNGFRWmNGUFp3d21wWDF3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b836c65f-a59f-40af-b6a0-08de6dd9f8e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 04:06:48.4024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPqEqtj2swT0rUoK4eY81DGi1qGyAAC8+2f1NiGVI9XIJw7Y/9CENxe/g1n4K6Ilp7xyPFdMjnO/CFf749yXhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,DM3PPF208195D8D.namprd11.prod.outlook.com:mid];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3D333148AA9
X-Rspamd-Action: no action

PiBTdWJqZWN0OiBSRTogW1BBVENIIHY5IDUvN10gZHJtL2F0b21pYzogUmV0dXJuIHVzZXIgcmVh
ZGFibGUgZXJyb3IgaW4NCj4gYXRvbWljX2lvY3RsDQo+IA0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2
OSA1LzddIGRybS9hdG9taWM6IFJldHVybiB1c2VyIHJlYWRhYmxlIGVycm9yIGluDQo+ID4gYXRv
bWljX2lvY3RsDQo+ID4NCj4gPiBBZGQgdXNlciByZWFkYWJsZSBlcnJvciBjb2RlcyBmb3IgZmFp
bHVyZSBjYXNlcyBpbiBkcm1fYXRvbWljX2lvY3RsKCkNCj4gPiBzbyB0aGF0IHVzZXIgY2FuIGRl
Y29kZSB0aGUgZXJyb3IgY29kZSBhbmQgdGFrZSBjb3JyZWN0aXZlIG1lYXN1cmVtZW50cy4NCj4g
Pg0KPiA+IHY4OiBSZXBsYWNlZCBEUk1fTU9ERV9BVE9NSUNfQVNZTkNfTk9UX1NVUFBfUExBTkUs
DQo+ID4gICAgIERSTV9NT0RFX0FUT01JQ19BU1lOQ19NT0RJRklFUl9OT1RfU1VQUCB3aXRoDQo+
IElOVkFMSURfQVBJX1VTQUdFDQo+ID4gICAgIChYYXZlcikNCj4gPiB2OTogTW92ZSBmcmVlIGF0
b21pY19zdGF0ZSBvbiBlcnJvciB0byBwYXRjaCAzIChTdXJhaikNCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgfCA1OA0KPiA+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAtLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY191YXBpLmMNCj4gPiBpbmRleA0KPiA+DQo+IGJjZDEyYjZlYWM0ZjQ5N2Qy
ZWRiODU4MWQ5ZmIwZmQ1NGNiZWY4MjcuLmYwYzNmMDgwZjVkNjZjNzMzZGZiZmEyM2YzDQo+IDhh
DQo+ID4gMjIxMzIxOTNhZGVjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
YXRvbWljX3VhcGkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGku
Yw0KPiA+IEBAIC0xMTk2LDYgKzExOTYsMTEgQEAgaW50IGRybV9hdG9taWNfc2V0X3Byb3BlcnR5
KHN0cnVjdA0KPiA+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+ICAJCQlyZXQgPSBkcm1f
YXRvbWljX2Nvbm5lY3Rvcl9nZXRfcHJvcGVydHkoY29ubmVjdG9yLA0KPiA+IGNvbm5lY3Rvcl9z
dGF0ZSwNCj4gPiAgCQkJCQkJCQlwcm9wLA0KPiA+ICZvbGRfdmFsKTsNCj4gPiAgCQkJcmV0ID0g
ZHJtX2F0b21pY19jaGVja19wcm9wX2NoYW5nZXMocmV0LCBvbGRfdmFsLA0KPiBwcm9wX3ZhbHVl
LA0KPiA+IHByb3ApOw0KPiA+ICsJCQlpZiAocmV0KSB7DQo+ID4gKwkJCQlkcm1fbW9kZV9hdG9t
aWNfYWRkX2Vycm9yX21zZygmc3RhdGUtDQo+ID4gPmVycm9yX2NvZGUsDQo+ID4gKw0KPiA+IERS
TV9NT0RFX0FUT01JQ19BU1lOQ19QUk9QX0NIQU5HRUQsDQo+ID4gKwkJCQkJCQkgICAgICAicHJv
cGVydHkgY2hhbmdlDQo+ID4gbm90IGFsbG93ZWQgaW4gYXN5bmMgZmxpcCIpOw0KPiA+ICsJCQl9
DQo+ID4gIAkJCWJyZWFrOw0KPiA+ICAJCX0NCj4gPg0KPiA+IEBAIC0xMjE4LDYgKzEyMjMsMTEg
QEAgaW50IGRybV9hdG9taWNfc2V0X3Byb3BlcnR5KHN0cnVjdA0KPiA+IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlLA0KPiA+ICAJCQlyZXQgPSBkcm1fYXRvbWljX2NydGNfZ2V0X3Byb3BlcnR5KGNy
dGMsIGNydGNfc3RhdGUsDQo+ID4gIAkJCQkJCQkgICBwcm9wLCAmb2xkX3ZhbCk7DQo+ID4gIAkJ
CXJldCA9IGRybV9hdG9taWNfY2hlY2tfcHJvcF9jaGFuZ2VzKHJldCwgb2xkX3ZhbCwNCj4gcHJv
cF92YWx1ZSwNCj4gPiBwcm9wKTsNCj4gPiArCQkJaWYgKHJldCkgew0KPiA+ICsJCQkJZHJtX21v
ZGVfYXRvbWljX2FkZF9lcnJvcl9tc2coJnN0YXRlLQ0KPiA+ID5lcnJvcl9jb2RlLA0KPiA+ICsN
Cj4gPiBEUk1fTU9ERV9BVE9NSUNfQVNZTkNfUFJPUF9DSEFOR0VELA0KPiA+ICsJCQkJCQkJICAg
ICAgInByb3BlcnR5IGNoYW5nZQ0KPiA+IG5vdCBhbGxvd2VkIGluIGFzeW5jIGZsaXAiKTsNCj4g
PiArCQkJfQ0KPiA+ICAJCQlicmVhazsNCj4gPiAgCQl9DQo+ID4NCj4gPiBAQCAtMTI1Niw5ICsx
MjY2LDEwIEBAIGludCBkcm1fYXRvbWljX3NldF9wcm9wZXJ0eShzdHJ1Y3QNCj4gPiBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSwNCj4gPiAgCQkJCQlyZXQgPSBwbGFuZV9mdW5jcy0NCj4gPiA+YXRv
bWljX2FzeW5jX2NoZWNrKHBsYW5lLCBzdGF0ZSwgdHJ1ZSk7DQo+ID4NCj4gPiAgCQkJCWlmIChy
ZXQpIHsNCj4gPiAtCQkJCQlkcm1fZGJnX2F0b21pYyhwcm9wLT5kZXYsDQo+ID4gLQkJCQkJCSAg
ICAgICAiW1BMQU5FOiVkOiVzXSBkb2VzIG5vdA0KPiA+IHN1cHBvcnQgYXN5bmMgZmxpcHNcbiIs
DQo+ID4gLQkJCQkJCSAgICAgICBvYmotPmlkLCBwbGFuZS0+bmFtZSk7DQo+ID4gKw0KPiA+IAlk
cm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ID4gKw0K
PiA+IERSTV9NT0RFX0FUT01JQ19JTlZBTElEX0FQSV9VU0FHRSwNCj4gPiArDQo+ID4gIltQTEFO
RTolZDolc10gZG9lcyBub3Qgc3VwcG9ydCBhc3luYyBmbGlwIiwNCj4gPiArCQkJCQkJCQkgICAg
ICBvYmotPmlkLA0KPiA+IHBsYW5lLT5uYW1lKTsNCj4gPiAgCQkJCQlicmVhazsNCj4gPiAgCQkJ
CX0NCj4gPiAgCQkJfQ0KPiA+IEBAIC0xNTY4LDYgKzE1NzksNyBAQCBpbnQgZHJtX21vZGVfYXRv
bWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ID4gIAlzdHJ1Y3QgZHJtX2F0
b21pY19zdGF0ZSAqc3RhdGU7DQo+ID4gIAlzdHJ1Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9jdHgg
Y3R4Ow0KPiA+ICAJc3RydWN0IGRybV9vdXRfZmVuY2Vfc3RhdGUgKmZlbmNlX3N0YXRlOw0KPiA+
ICsJc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZSBfX3VzZXIgKmVycm9yX2NvZGVfcHRy
Ow0KPiA+ICAJaW50IHJldCA9IDA7DQo+ID4gIAl1bnNpZ25lZCBpbnQgaSwgaiwgbnVtX2ZlbmNl
cyA9IDA7DQo+ID4gIAlib29sIGFzeW5jX2ZsaXAgPSBmYWxzZTsNCj4gPiBAQCAtMTU3Niw2ICsx
NTg4LDE0IEBAIGludCBkcm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UNCj4g
PiAqZGV2LA0KPiA+ICAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0FU
T01JQykpDQo+ID4gIAkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+DQo+ID4gKwlpZiAoIWFyZy0+
cmVzZXJ2ZWQpDQo+ID4gKwkJZHJtX2RiZ19hdG9taWMoZGV2LA0KPiA+ICsJCQkgICAgICAgIm1l
bW9yeSBub3QgYWxsb2NhdGVkIGZvciBkcm1fYXRvbWljIGVycm9yDQo+ID4gcmVwb3J0aW5nXG4i
KTsNCj4gPiArCWVsc2UNCj4gPiArCQkvKiBVcGRhdGUgdGhlIGVycm9yIGNvZGUgaWYgYW55IGVy
cm9yIHRvIGFsbG93IHVzZXIgaGFuZGxpbmcgaXQNCj4gPiAqLw0KPiA+ICsJCWVycm9yX2NvZGVf
cHRyID0gKHN0cnVjdCBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgX191c2VyDQo+ID4gKikNCj4g
PiArCQkJCSAodW5zaWduZWQgbG9uZylhcmctPnJlc2VydmVkOw0KPiA+ICsNCj4gPiAgCXN0YXRl
ID0gZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhkZXYpOw0KPiA+ICAJaWYgKCFzdGF0ZSkNCj4gPiAg
CQlyZXR1cm4gLUVOT01FTTsNCj4gPiBAQCAtMTU4NCwxMSArMTYwNCwxNiBAQCBpbnQgZHJtX21v
ZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ID4gKmRldiwNCj4gPiAgCXN0YXRl
LT5hY3F1aXJlX2N0eCA9ICZjdHg7DQo+ID4gIAlzdGF0ZS0+YWxsb3dfbW9kZXNldCA9ICEhKGFy
Zy0+ZmxhZ3MgJg0KPiA+IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VUKTsNCj4gPg0KPiA+
ICsJbWVtc2V0KCZzdGF0ZS0+ZXJyb3JfY29kZSwgMCwgc2l6ZW9mKCplcnJvcl9jb2RlX3B0cikp
Ow0KPiA+ICsNCj4gPiAgCS8qIGRpc2FsbG93IGZvciB1c2Vyc3BhY2UgdGhhdCBoYXMgbm90IGVu
YWJsZWQgYXRvbWljIGNhcCAoZXZlbg0KPiA+ICAJICogdGhvdWdoIHRoaXMgbWF5IGJlIGEgYml0
IG92ZXJraWxsLCBzaW5jZSBsZWdhY3kgdXNlcnNwYWNlDQo+ID4gIAkgKiB3b3VsZG4ndCBrbm93
IGhvdyB0byBjYWxsIHRoaXMgaW9jdGwpDQo+ID4gIAkgKi8NCj4gPiAgCWlmICghZmlsZV9wcml2
LT5hdG9taWMpIHsNCj4gPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUt
PmVycm9yX2NvZGUsDQo+ID4gKw0KPiA+IERSTV9NT0RFX0FUT01JQ19JTlZBTElEX0FQSV9VU0FH
RSwNCj4gPiArCQkJCQkgICAgICAiZHJtIGF0b21pYyBjYXBhYmlsaXR5IG5vdA0KPiA+IGVuYWJs
ZWQiKTsNCj4gPiAgCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+ID4gIAkJCSAgICAgICAiY29tbWl0
IGZhaWxlZDogYXRvbWljIGNhcCBub3QgZW5hYmxlZFxuIik7DQo+ID4gIAkJcmV0ID0gLUVJTlZB
TDsNCj4gPiBAQCAtMTU5NiwyMSArMTYyMSwxOCBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ID4gKmRldiwNCj4gPiAgCX0NCj4gPg0KPiA+ICAJaWYgKGFy
Zy0+ZmxhZ3MgJiB+RFJNX01PREVfQVRPTUlDX0ZMQUdTKSB7DQo+ID4gLQkJZHJtX2RiZ19hdG9t
aWMoZGV2LCAiY29tbWl0IGZhaWxlZDogaW52YWxpZCBmbGFnXG4iKTsNCj4gPiAtCQlyZXQgPSAt
RUlOVkFMOw0KPiA+IC0JCWdvdG8gb3V0Ow0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAtCWlmIChhcmct
PnJlc2VydmVkKSB7DQo+ID4gLQkJZHJtX2RiZ19hdG9taWMoZGV2LCAiY29tbWl0IGZhaWxlZDog
cmVzZXJ2ZWQgZmllbGQgc2V0XG4iKTsNCj4gPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9y
X21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ID4gKw0KPiA+IERSTV9NT0RFX0FUT01JQ19JTlZB
TElEX0FQSV9VU0FHRSwNCj4gPiArCQkJCQkgICAgICAiaW52YWxpZCBmbGFnIik7DQo+ID4gIAkJ
cmV0ID0gLUVJTlZBTDsNCj4gPiAgCQlnb3RvIG91dDsNCj4gPiAgCX0NCj4gPg0KPiA+ICAJaWYg
KGFyZy0+ZmxhZ3MgJiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMpIHsNCj4gPiAgCQlpZiAoIWRl
di0+bW9kZV9jb25maWcuYXN5bmNfcGFnZV9mbGlwKSB7DQo+ID4gLQkJCWRybV9kYmdfYXRvbWlj
KGRldiwNCj4gPiAtCQkJCSAgICAgICAiY29tbWl0IGZhaWxlZDoNCj4gPiBEUk1fTU9ERV9QQUdF
X0ZMSVBfQVNZTkMgbm90IHN1cHBvcnRlZFxuIik7DQo+ID4gKwkJCWRybV9tb2RlX2F0b21pY19h
ZGRfZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPiA+ZXJyb3JfY29kZSwNCj4gPiArDQo+ID4gRFJNX01P
REVfQVRPTUlDX0lOVkFMSURfQVBJX1VTQUdFLA0KPiA+ICsNCj4gPiAiRFJNX01PREVfUEFHRV9G
TElQX0FTWU5DIG5vdCBzdXBwb3J0ZWQgd2l0aCBBVE9NSUMNCj4gPiAraW9jdGwiKTsNCj4gPiAg
CQkJcmV0ID0gLUVJTlZBTDsNCj4gPiAgCQkJZ290byBvdXQ7DQo+ID4gIAkJfQ0KPiA+IEBAIC0x
NjIxLDggKzE2NDMsOSBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlDQo+ICpkZXYsDQo+ID4gIAkvKiBjYW4ndCB0ZXN0IGFuZCBleHBlY3QgYW4gZXZlbnQgYXQg
dGhlIHNhbWUgdGltZS4gKi8NCj4gPiAgCWlmICgoYXJnLT5mbGFncyAmIERSTV9NT0RFX0FUT01J
Q19URVNUX09OTFkpICYmDQo+ID4gIAkJCShhcmctPmZsYWdzICYgRFJNX01PREVfUEFHRV9GTElQ
X0VWRU5UKSkgew0KPiA+IC0JCWRybV9kYmdfYXRvbWljKGRldiwNCj4gPiAtCQkJICAgICAgICJj
b21taXQgZmFpbGVkOiBwYWdlLWZsaXAgZXZlbnQgcmVxdWVzdGVkIHdpdGgNCj4gPiB0ZXN0LW9u
bHkgY29tbWl0XG4iKTsNCj4gPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3Rh
dGUtPmVycm9yX2NvZGUsDQo+ID4gKw0KPiA+IERSTV9NT0RFX0FUT01JQ19JTlZBTElEX0FQSV9V
U0FHRSwNCj4gPiArCQkJCQkgICAgICAicGFnZS1mbGlwIGV2ZW50IHJlcXVlc3RlZCB3aXRoDQo+
ID4gdGVzdC1vbmx5IGNvbW1pdCIpOw0KPiA+ICAJCXJldCA9IC1FSU5WQUw7DQo+ID4gIAkJZ290
byBvdXQ7DQo+ID4gIAl9DQo+ID4gQEAgLTE3MjUsNiArMTc0OCwxMyBAQCBpbnQgZHJtX21vZGVf
YXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ID4gKmRldiwNCj4gPiAgCX0NCj4gPg0K
PiA+ICBvdXQ6DQo+ID4gKwkvKiBVcGRhdGUgdGhlIGVycm9yIGNvZGUgaWYgYW55IGVycm9yIHRv
IGFsbG93IHVzZXIgaGFuZGxpbmcgaXQgKi8NCj4gPiArCWlmIChyZXQgPCAwICYmIGFyZy0+cmVz
ZXJ2ZWQpIHsNCj4gPiArCQlpZiAoY29weV90b191c2VyKGVycm9yX2NvZGVfcHRyLCAmc3RhdGUt
PmVycm9yX2NvZGUsDQo+ID4gKwkJCQkgc2l6ZW9mKHN0YXRlLT5lcnJvcl9jb2RlKSkpDQo+IA0K
PiBDb3JuZXIgY2FzZSB3aGF0IGlmIHlvdSBlbmQgdXAgaGVyZSByaWdodCBhZnRlciBhbGxvY2F0
aW5nIGEgc3RhdGUgYW5kIGNvbWUNCj4gaGVyZSBiZWNhdXNlIG9mIG9uZSBvZiB0aGUgY29uZGl0
aW9ucyBXaGljaCB3ZXJlIHByZXZpb3VzbHkgY2hlY2tlZCBiZWZvcmUNCj4gc3RhdGUgYWxsb2Nh
dGlvbi4gQW5kIHRoZW4gdGhpcyBjb3B5IHRvIHVzZXIgZmFpbHMuDQo+IFRoZW4gd2UgcmV0dXJu
IHdpdGhvdXQgZnJlZWluZyB0aGUgc3RhdGUsIGZlbmNlcyBldGMuIFNob3VsZCB0aGlzIGJlIGRv
bmUgaW4gYQ0KPiBjbGVhbmVyIHdheS4NCj4gDQo+IFJlZ2FyZHMsDQo+IFN1cmFqIEthbmRwYWwN
Cj4gDQo+ID4gKwkJCXJldHVybiAtRUZBVUxUOw0KDQpNYXliZSBqdXN0IHJldCA9IC1FRkFVTFQg
d291bGQgYmUgYmV0dGVyLg0KDQpXaXRoIHRoYXQgZml4ZWQgTEdUTSwNClJldmlld2VkLWJ5OiBT
dXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiA+ICsJfQ0KPiA+ICsN
Cj4gPiAgCWlmIChudW1fZmVuY2VzKQ0KPiA+ICAJCWNvbXBsZXRlX3NpZ25hbGluZyhkZXYsIHN0
YXRlLCBmZW5jZV9zdGF0ZSwgbnVtX2ZlbmNlcywgIXJldCk7DQo+ID4NCj4gPg0KPiA+IC0tDQo+
ID4gMi4yNS4xDQoNCg==
