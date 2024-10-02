Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46BE98E05D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 18:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697A910E20A;
	Wed,  2 Oct 2024 16:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClUs8S3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201C10E20A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727885713; x=1759421713;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ecxeh+Wd0Ion4mKLM3GsnK8CSW+1BQFlQ3f9qV3/XnY=;
 b=ClUs8S3zuOwfnUQPYJ3j+HLl76RfLTD0UPRtnO2LLIfGcMed3NftmO/a
 1agv0c67gkkafX99I0mxF2Md7eQ8G2vzPybOhxKwbaqpHun2wrEeYl812
 EzJoENFcPWqaDvxVJWE5vTvoJWq4IwKbTiwU4anoRjYaOQ0yfW6eSJNIC
 7Ol/HH+uNXK43dqcRLsGGNGCYWUUEwNvw1q3CFNzKhwQ44I9hPDZrTZdy
 bDQKZyzZ1VSgTgvQ6mTeVv7F1WAo/wpx/FVoPJqVGnGuDqlS3tRzFaZgv
 V3JI6yHNtICIsmH4h6KlpIIw4ugMkSSG3VwDsQsO5aeI/u6p+ssLZ+oUe Q==;
X-CSE-ConnectionGUID: aMt9Oq82RaeZHzOsr/vZlw==
X-CSE-MsgGUID: dl9V65NpRlGXpaTWvEeTlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27186532"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="27186532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 09:15:12 -0700
X-CSE-ConnectionGUID: aIWdiN6hQ7ySIq9Y2Mi6pA==
X-CSE-MsgGUID: iI1og6Q+RROO/KbtNO2zlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74857085"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 09:15:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 09:15:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 09:15:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 09:15:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 09:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n12gk6zhBfVjYQ5v4P5pTWMNOdyreY2qT6VNNG8CiLz/KXnkqwDhAnoOG1ttwfKaxL41jsO62Jc7NRB+dYpqpPxX93fgDQoxiJtigRAG2+aFQCbheoeHE+ATmh1B+xNMKmA1pEaSywmvGqYqw6Xb6bGjgavcL/bNYefivOdWPiRnkV5SK/dakJwZp/qSlC/ktBDCL6KKCEsVnB8eZa5OJXpgiJTFe/A3b3JhaeLMMJO0Z4Cx3N4YkNVo/u2Kq/s8kq2HWXaBDrKeDssnVPc3Cb+SezaW9nBefx217Dt/vB+/MXjIF60hVj5w85gSFvRK8W5HA6T/n/miCq90juwU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ecxeh+Wd0Ion4mKLM3GsnK8CSW+1BQFlQ3f9qV3/XnY=;
 b=xK8nehDX2JtQxxo/1UB+pvzsJjDJrQY6cqr4Xzbx58wsh4dU3naH525VFIBzwL0mBCGsusHSW9MqrDx1F3lm8vPzy61jMjhWvlH7ma7ZbeB4EVKrN6apWkyBiQ1lQ85i8+Ye5hIGLii2R5qG/NZT2E1hziPN18aFW7xfkSv5lquAeUkgpCez8IA16T0DTccPH5gY+W1/MQ1Dw/Ft5Ui1WLoUgXplc5zbeF1Ei3fyWwuBsHFScQEhT1oVu1FOQGIHBOTajF1SMEJrRy/KU4+yMRzobj4AjjxZkdWySiXrCul72aFIdPQeb1Xz/Tj5aQCKKu8KHkE7ThNiIvMgdqwZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH0PR11MB4966.namprd11.prod.outlook.com (2603:10b6:510:42::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 16:15:08 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 16:15:08 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "jfalempe@redhat.com" <jfalempe@redhat.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Topic: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Index: AQHbFJmT04jrr3jRak+Ttm6l1x35MrJzoo8A
Date: Wed, 2 Oct 2024 16:15:08 +0000
Message-ID: <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
In-Reply-To: <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH0PR11MB4966:EE_
x-ms-office365-filtering-correlation-id: 67627058-d9d7-405d-7459-08dce2fd62a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eE9tK25EdUtpZTFiU05PWUJTVTBjSTJwckY3eTVJVFVjMkN3K3g1YXo3dTlC?=
 =?utf-8?B?SFlvSXhSdHFMK3hsLzBHYi9ZRVg2anR5dHBwUTJtMXQwd0NaQjhxMGY2MGty?=
 =?utf-8?B?UmZIL0VJZGs4THFUcUpPUGRhMFZxaElmbHk0ZWVTcEZzK1lIRWxBUW1xYTVO?=
 =?utf-8?B?OEV3blpXYzk0YzJUTExMVStyaDBwT04rRno3N2M0RURZZzh3Z3JtcW1BS1Bm?=
 =?utf-8?B?andvOWFFRmlrbFFvZ0V0ZHdrU0R6V3l4K1FDK21nNXFPRnptMEhHcWZ6a2p1?=
 =?utf-8?B?UVIxMlNVT0tWVFRlb2NiMHRPNWllRmxQeFVFUDE1bkpqN1pyM05CSy9NRXVC?=
 =?utf-8?B?QmJrSjI2bk56S0Y1MU5UU3ZweG1VeXFKM3lhVnR5ZU5Xd0NNUUdPdGMvY2Vt?=
 =?utf-8?B?UXg5bnFWVE9wOFBUYlNuWGR6VDcxZ1R4ZmovUGJFbXF4SkZIZktrK1dtWUh2?=
 =?utf-8?B?TGhYaEpMQWEwWGQwaVBSQlYydGlwUnRIV3M0TEZBdlRDWFcyR3VBTlVJZ3pw?=
 =?utf-8?B?ZWdQUjI3WGkxeHd2bW5ZMXE5bVZxY0VOVm9keGZrZWJjakRqMHFVb2N5S1FY?=
 =?utf-8?B?WUphdnp2d1dPV0NrM25aVEpwdm5PU0xVdmRVSXZBbERzVGFiUUhsK3BlZUdh?=
 =?utf-8?B?L0FDanVJREVmNDE2WExHK1o4SUlSdzRGdGhUcW82UTJrRlVlckVGMGVaNTVM?=
 =?utf-8?B?Q1pZZm1OYmRHTmkyLytRL2ZhWVdOc2NIM3NyQkFLOTJGbjZvWXJERG9zR0Fv?=
 =?utf-8?B?WHNsYkVjNldYK2FObGxjeXhFbHU1NHZXNUdHeGR4Ry9CM01SUWtBN3piOStp?=
 =?utf-8?B?WXFHdldYZVBFMFc0VExJbE9BTWdCbkIrbHRaUWJ2aE13ZlgveWQ2Q0N1Q1Fw?=
 =?utf-8?B?ajFqSThtUXlPMTU1V1o2Ym1xZUJnNHIwMzhuV0JkSHY3cHZvcUJxT3FZeDFK?=
 =?utf-8?B?RlduT3pNeVkvdzRGWGIwUTNxUHNzR3EwT1pqeldDa1ZXUmxma0FnRDFJZ0Vu?=
 =?utf-8?B?VGxncEd3RFNzMytPcWsraHlHdkVUZjN6NWxhVDYyYlV6WUt4SENwNmdKU2dS?=
 =?utf-8?B?TlVXRVRZeGJkaHplWW1JWHc3NEhicGplZUV5WFExeVZEODdndkxJYlZUN1Zi?=
 =?utf-8?B?cVhkUkhCMVFUcHo0Rm9iZGpFSGdYTngxdG8yYTJPZWk0cjYxWFgzRDU0a3RL?=
 =?utf-8?B?bmpWczE1YW1RRHVnYlpFc0U3SEczTWtQbFQvZC9pR3hYb1czekFlRWlNZGZq?=
 =?utf-8?B?c21qNkE4bDhQSFpCY09DbVkwaGw0a1QySnZURlIxRllkTzZTSHJFcXkzUzNH?=
 =?utf-8?B?TE4xRllmSHo5RlZxT3hRelFLUUt4cmRGNmdzQUUvQThvTHRqRENaMTZLdERa?=
 =?utf-8?B?MzJOcG1WVDkzdDVZZzhJOVBGRUxzTDIzNkdOaERxMk5ZWW9qN1BFckcwRlVs?=
 =?utf-8?B?bFdzZWVaWTQyd0JJOFZVRDBjV3NtdGVXVklPRmpWeldrV1cxbDFJd085Z2h6?=
 =?utf-8?B?Vk14VTNQbGVRWTUzRlFnNmdiemM0am5NdjZpZ2hJU1lrQTA0anZNUHdicFo2?=
 =?utf-8?B?UTloR2Rtc2FDR2RKQVk2aVNTc050L3F2RXMzcllMNVpUWEo5RzREVmozQVdO?=
 =?utf-8?B?eTBwdWczdFBrSGVKL2pzdHFCQTBNZ2tIc1RrTkxvT2xzUXpjbUhXUXdKbVhJ?=
 =?utf-8?B?THpBZ2dnYWxxYWZKRmJ2MUZ2cDkwWTFBMUlZN2luRTNITm16WkI1eUtoaUxa?=
 =?utf-8?B?MFhzUUhjL3Zhb0d3cU1hZE9vN3JudkN5UE5mZEZObGJid3lOaUt0VmY3T05w?=
 =?utf-8?B?ZXp2eEw5bEJXUkVtckU5QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6083.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0U1RTZSVjEzRDliMG9WUjV1ZnZ3Rzh5T2YwMmN0T2kxVHRJVjlWWjVBZTY4?=
 =?utf-8?B?R3huU3dDZmM1NG9qQy9uOURGWlE5Qmxyek5TRHJYbmp0QTVBZUtpcnB3Q0tW?=
 =?utf-8?B?K1FlVHlybkRvNU1XQjlzc0dPZ2JsUjBCKzUwY1pVYWxaOXNFS0NLRFk4b3R6?=
 =?utf-8?B?aVlHQ1U1NUVmVjdvSU1vbDZvdkFGRS9FelpIWCt5SGZzKzJ5eDVNa05jdm5B?=
 =?utf-8?B?VWdnRmJyWEg1RGdkb2V3NVRvL21NVEN2OW1Scjk3T08rQ0Z6SXh0YlE0NXpU?=
 =?utf-8?B?S1BEZjdPK3dITVkxOXpPNXhqS0tJNkpXZ1BuNmdLcTlwb0Y3T1FaUG1iTmZS?=
 =?utf-8?B?c0JjaWpiWmZwWEJJQUxsbXUvOHlUTFZqWi83WTV2ek45eGdaSWFEUjRSaEJz?=
 =?utf-8?B?NUFqNWFySHpEcGxDMzdoZTlhMmw0L001U2JTZ1Z6RVJjOUQwRitZVFNOTDh2?=
 =?utf-8?B?UHVrMkVrbWs3M0hSWFkvbzhTY2pkVFZVbDc1a0FDQjVkV2VOQk9JZjdWQ2Rq?=
 =?utf-8?B?ODY0ZG4zMEwwdHJxZGJ2ZkhmZ3Bac29TKzB3STVMQXN3VEZTVm42d2ZtQ0cz?=
 =?utf-8?B?OEpZTzhVeDhvRW94Yi9RaHpHMHYwOVFxMmVlelEzaFlVNUhaQkRvbERzRTdN?=
 =?utf-8?B?aTNjRXJ3UGxZN3AzU1gxOGFZVDBSZUN6Z0VxVGtuUW9KMmVrd1JCN0VqTHpD?=
 =?utf-8?B?V2Z5UDZkYXFkc0M1bmNzNXJrN0FITVA0T3RDQ1kyVVJSaFVQd21tZjY3MG9n?=
 =?utf-8?B?c2IwT3BTN2hIY1hkczd4VVZmWXcvOGpnekxROXJqdGpaYTFLcjluRy9VRFNK?=
 =?utf-8?B?L2hXYUVYV2srenpUdHFHSVVGTmdza0c0c3ZSdTNjeVBqR2w5U0pwVjY4Z3c0?=
 =?utf-8?B?Y3lqbDFZUm1KM0l1bERPS0VDVjBYVFNCWE9vdFJOYXlDNUhhWXJxb1NLcjNZ?=
 =?utf-8?B?UkJYOXR5Zm8yYk5BRXJZemZCeXZBREl3a0RnYS8wQVZ1LzdiVzdIRk5OWWRi?=
 =?utf-8?B?c0FyVzdjNm9rT3BkamxFbG4rQXJpbllqTy9Gbk4walpTZmx1QTkzNHNDZlp6?=
 =?utf-8?B?dGh5cEJ6N0N2QWxvYmNZczhhbnEvckc5M2FEallkNGlYMS94YlZVM21uMUpj?=
 =?utf-8?B?WEtKQWJBdnd1VGFyQkNYTUF5clpsbkVmQ1dPMmFYeVl3L1htZVNEWk9YdFdq?=
 =?utf-8?B?UG53ZFRzRTZ2VU1TeE9pMXhKQjROelF4U1k2WFNXenRteTVmQ3VScU9GVm5k?=
 =?utf-8?B?MVlNY1RuYkg0V3pzN1hZdDNHOTdtMi9zU29BdTVxNmhWdndWZVJybXB4aWxu?=
 =?utf-8?B?cGhUY08wWVZsOHNJb0JYNkZUZTVaaTFBV2FJR1JobjJkMkVxMXI2OHJpbVlR?=
 =?utf-8?B?YTMzM1dRejRiYUQxcjZIWmtWVU8vc2ViQkgxV2VicjR0OUNsL3JuN1VSTlRF?=
 =?utf-8?B?S3RpeHkvQlczSnRNMkZyQ3EyNDZUVExDdmJSWTczenNJOUxlWGtxQm5oRUww?=
 =?utf-8?B?VjNYSTg0M2lyNFk5Sm5oY1d2TzZVSnYrbEhjbnhUbzFiK0dhckdiOFZTSjUy?=
 =?utf-8?B?dVNtTVpGWjJDQ3ZudTFaZVBoQXU3Q0oyQ0lMYUVmWi9tcmR2VnB6SWkyZnBn?=
 =?utf-8?B?czQ4eFhVNC9KMkJUK3pTTHJrOStiSnNrNzh6VFpZMWd5VkhIQzY0VCsrMGJq?=
 =?utf-8?B?UEx5bVBEU2FTa1ZXNzRrN0JoNmFDeTRVRFJleU9GdjJiZDhGYmJXdjN3am9q?=
 =?utf-8?B?cC9WellKejdrYzJYTTIxR09SMFpPWVFGeklCSGNiNVZPWmlzNWhQYUo0NzRi?=
 =?utf-8?B?RXlWOUdocXczT29uaFVKNVplY2h6NWtMOVJWcGhKRHBOb2FjQTYwdFo2Z3FK?=
 =?utf-8?B?dzVzcmVha21iNVc0UFY2K0w4ZGJCRU1kQU5RWGMwVDdaTU5kRjBBdC9vV1JY?=
 =?utf-8?B?aG5DdDBQWW9Xc1B4M3dpL0pkbXZoMkRCRmlEempsTk1RdlN2NU5aTHpaWWFR?=
 =?utf-8?B?UlFEb3dSRXNmUjY5N3BhUFVKMjEycEVMSFlWdnhaNCtmVjNYKzZ4LzdCODlD?=
 =?utf-8?B?L3g3Ym1NNHU1c2NMdkU0K1N2YTB2V1JFQVRYL20zbHFVWllKQW5FbGJLSCtw?=
 =?utf-8?Q?9ZZhvRmQemk02rZmoR6rP5r1a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67627058-d9d7-405d-7459-08dce2fd62a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 16:15:08.8918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zeTV+JJdEiezvyZxF7TDDU9UeSRe2/qVWwOc+vzfP4T46MUrNNuxK7ak689Vqh1kcyHntRvu5IOvY9c/EGLzew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4966
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

PiBUaGFua3MgZm9yIHRoZSBidWcgcmVwb3J0LiBDYW4geW91IHByb3ZpZGUgdGhlIG91dHB1dCBv
ZiAnc3VkbyBsc3BjaSANCj4gLXZ2dicgZm9yIHRoZSBncmFwaGljcyBkZXZpY2U/DQoNClRob21h
cywNCg0KU3VyZS4gSGVyZSdzIHRoZSBvdXRwdXQgKHJ1biBvbiB0aGUgdjYuMTEuMCBrZXJuZWwp
DQoNCiQgc3VkbyBsc3BjaSAtdnZ2IC1zIDAwMDA6MDg6MDAuMA0KMDg6MDAuMCBWR0EgY29tcGF0
aWJsZSBjb250cm9sbGVyOiBNYXRyb3ggRWxlY3Ryb25pY3MgU3lzdGVtcyBMdGQuIE1HQSBHMjAw
ZSBbUGlsb3RdIFNlcnZlckVuZ2luZXMgKFNFUDEpIChyZXYgMDUpIChwcm9nLWlmIDAwIFtWR0Eg
Y29udHJvbGxlcl0pDQogICAgICAgIFN1YnN5c3RlbTogSW50ZWwgQ29ycG9yYXRpb24gRGV2aWNl
IDAxMDMNCiAgICAgICAgQ29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBN
ZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5U
eC0NCiAgICAgICAgU3RhdHVzOiBDYXArIDY2TUh6LSBVREYtIEZhc3RCMkItIFBhckVyci0gREVW
U0VMPWZhc3QgPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQ0K
ICAgICAgICBJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEgMTYNCiAgICAgICAgUmVnaW9u
IDA6IE1lbW9yeSBhdCA5MDAwMDAwMCAoMzItYml0LCBwcmVmZXRjaGFibGUpIFtzaXplPTE2TV0N
CiAgICAgICAgUmVnaW9uIDE6IE1lbW9yeSBhdCA5MTgwMDAwMCAoMzItYml0LCBub24tcHJlZmV0
Y2hhYmxlKSBbc2l6ZT0xNktdDQogICAgICAgIFJlZ2lvbiAyOiBNZW1vcnkgYXQgOTEwMDAwMDAg
KDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9OE1dDQogICAgICAgIEV4cGFuc2lvbiBS
T00gYXQgOTE4MTAwMDAgW2Rpc2FibGVkXSBbc2l6ZT02NEtdDQogICAgICAgIENhcGFiaWxpdGll
czogW2RjXSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMg0KICAgICAgICAgICAgICAgIEZsYWdz
OiBQTUVDbGstIERTSSsgRDEtIEQyLSBBdXhDdXJyZW50PTBtQSBQTUUoRDAtLEQxLSxEMi0sRDNo
b3QtLEQzY29sZC0pDQogICAgICAgICAgICAgICAgU3RhdHVzOiBEMCBOb1NvZnRSc3QtIFBNRS1F
bmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUtDQogICAgICAgIENhcGFiaWxpdGllczogW2U0XSBF
eHByZXNzICh2MSkgTGVnYWN5IEVuZHBvaW50LCBNU0kgMDANCiAgICAgICAgICAgICAgICBEZXZD
YXA6IE1heFBheWxvYWQgMjU2IGJ5dGVzLCBQaGFudEZ1bmMgMCwgTGF0ZW5jeSBMMHMgPDY0bnMs
IEwxIDwxdXMNCiAgICAgICAgICAgICAgICAgICAgICAgIEV4dFRhZy0gQXR0bkJ0bi0gQXR0bklu
ZC0gUHdySW5kLSBSQkUtIEZMUmVzZXQtDQogICAgICAgICAgICAgICAgRGV2Q3RsOiBDb3JyRXJy
LSBOb25GYXRhbEVyci0gRmF0YWxFcnItIFVuc3VwUmVxLQ0KICAgICAgICAgICAgICAgICAgICAg
ICAgUmx4ZE9yZCsgRXh0VGFnLSBQaGFudEZ1bmMtIEF1eFB3ci0gTm9Tbm9vcC0NCiAgICAgICAg
ICAgICAgICAgICAgICAgIE1heFBheWxvYWQgMTI4IGJ5dGVzLCBNYXhSZWFkUmVxIDEyOCBieXRl
cw0KICAgICAgICAgICAgICAgIERldlN0YTogQ29yckVycisgTm9uRmF0YWxFcnItIEZhdGFsRXJy
LSBVbnN1cFJlcSsgQXV4UHdyLSBUcmFuc1BlbmQtDQogICAgICAgICAgICAgICAgTG5rQ2FwOiBQ
b3J0ICMwLCBTcGVlZCAyLjVHVC9zLCBXaWR0aCB4MSwgQVNQTSBMMHMsIEV4aXQgTGF0ZW5jeSBM
MHMgPDY0bnMNCiAgICAgICAgICAgICAgICAgICAgICAgIENsb2NrUE0tIFN1cnByaXNlLSBMTEFj
dFJlcC0gQndOb3QtIEFTUE1PcHRDb21wLQ0KICAgICAgICAgICAgICAgIExua0N0bDogQVNQTSBE
aXNhYmxlZDsgUkNCIDY0IGJ5dGVzLCBEaXNhYmxlZC0gQ29tbUNsaysNCiAgICAgICAgICAgICAg
ICAgICAgICAgIEV4dFN5bmNoLSBDbG9ja1BNLSBBdXRXaWREaXMtIEJXSW50LSBBdXRCV0ludC0N
CiAgICAgICAgICAgICAgICBMbmtTdGE6IFNwZWVkIDIuNUdUL3MgKG9rKSwgV2lkdGggeDEgKG9r
KQ0KICAgICAgICAgICAgICAgICAgICAgICAgVHJFcnItIFRyYWluLSBTbG90Q2xrKyBETEFjdGl2
ZS0gQldNZ210LSBBQldNZ210LQ0KICAgICAgICBDYXBhYmlsaXRpZXM6IFs1NF0gTVNJOiBFbmFi
bGUtIENvdW50PTEvMSBNYXNrYWJsZS0gNjRiaXQtDQogICAgICAgICAgICAgICAgQWRkcmVzczog
MDAwMDAwMDAgIERhdGE6IDAwMDANCiAgICAgICAgS2VybmVsIGRyaXZlciBpbiB1c2U6IG1nYWcy
MDANCiAgICAgICAgS2VybmVsIG1vZHVsZXM6IG1nYWcyMDANCg0KLVRvbnkNCg==
