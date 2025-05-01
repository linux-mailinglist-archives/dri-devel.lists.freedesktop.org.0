Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E088DAA60A1
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 17:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB96F10E86B;
	Thu,  1 May 2025 15:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VHRStRkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE5910E867;
 Thu,  1 May 2025 15:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqWMXcI8uyyfNtczoUvQpQvfBxsdg4JkKoVYGVRZAAwqPJCVYu8OrbbjUnqhHud6trk6po5p0G5xh5E9jioZJkRqoor6aHgZbrc3XfAVP/HO89EPxCHHO+X0oqclT375GnxJ8MhLegzx8t1Y0h45BRqD/p0CDNFiXzVHyfVf0fUXdj7k2COKEYpoqXfOU9HHJ8b9STUh3WEss+iV7VsDS1fATWBXR+yYYBbmeKTCVXjuUHs02jun0eufZEEtOUeGh4y7gFNTa/GGrvFpCXWxwyr8uC8GnTEMlu0tB/GK0g9i2lgHr0PbIubKYPnCLyqvQE7e0fRSOEHZSs32iZ4ojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tw8xjCbT3smgEwlbFNPqPBC6GFzG1yGDhkIfhtMRcBc=;
 b=Si8LXqWJhzo8RYxYDtUJggFE8701yWn4M34reF8DqbhdIwD5IQDYzHjaYMu45sjioFw9VzuBwU8u4sE0s2xPrFlvksP0TJPQG/MVzGKjVL0Kc0iZu8FciO/VeyPdtMAKtS6/z1AYBRVzSUS7xG5DUAwps1QpJwecNsL/vFXAwYKBbd0ByifaOeAm38zpIeRPR37O2n4i/sqRE98/BWeHPCa5FkxoRhtE7hyySePybSpvdXMRNiDdQPUqjcThe/+f9j7dYrLJTHRoRNFFBkTKC2VwLSidw3zvPHqmH5HGcq5hZfrEhxGjqJxroTftbC71MQSHooQGtzmbI7JLBckgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tw8xjCbT3smgEwlbFNPqPBC6GFzG1yGDhkIfhtMRcBc=;
 b=VHRStRkl4VpYJfqE6FHMafa0AhuOT/HvQZysFW9vdhv6HvKOz+mkAihmh0Xcl+nWP9i6tUOTMnLn6iaYrFPI4WDT1GP6MWuNDviG4JBOcocZyh4HaYNBuZKZfEBdfoD6g8PLJOr8vgRguTaW8N+t7o24X+3N+dKRNyPCQsnT70KdF8VvHTsFaN5zDN3GQwMjzfMKW4mlDa2utkqh8vvWY39Wpz6S2Unxgotm6rC2qfpG+5R2IlyokGlLKkv55IgCvObXaX9QcV2WrfMv1Og/CQHS+4jfug3umZqQFE0MwxJYTxyK6jaeWhaWx5VUt3CizqQIuT8H/tb++qYw9cMmkg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 1 May
 2025 15:19:35 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:19:35 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
CC: Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
Thread-Topic: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
Thread-Index: AQHbupjrBqy/TF3WekeYRCorKuWUh7O947EA
Date: Thu, 1 May 2025 15:19:35 +0000
Message-ID: <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BL1PR12MB5972:EE_
x-ms-office365-filtering-correlation-id: d1017d69-11da-47d6-d61c-08dd88c394de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?U3NTQTFRMUk2Nlo4QjJOOXU2emltRytVb1JxU3NNRTJHeFNKOHhrTjhtdzNJ?=
 =?utf-8?B?eHV2cHhjaHNMU1RlclFCV3JXWjd3MXptK1BFQXZFWVR4VUVwcTJVNzM5Q3gw?=
 =?utf-8?B?YUkvNWpZb1FTMVpEb2RhMk12VDlhcHdXcTN3VHZUUitlTFdnZTFodHJFb2VG?=
 =?utf-8?B?SGc5eEplUTN2MTUzWUtFQVMvVnJmYnFjaU1QQ3BPcXdneTkwQWY4MG1Oek54?=
 =?utf-8?B?RFRpSFhHZENFUWltZHZUZGpUM1ZoNU14OTBGTUowS1F3S2NhenM3dzA4dkwr?=
 =?utf-8?B?NnFQanZJb3JFMU5UTm9ZK3c0c0tPYTZwdmVIdlRmbjM4UUdQTTdTSzNteG1l?=
 =?utf-8?B?YmRiR21pMkJyZVJHMUQrcjhSekFCK09VNUlRQ1pSNldNR1JPYTBzNmJHNXRK?=
 =?utf-8?B?bHYvV09xTVUxYlg3b0RTeVg3RDRiZDViZVZCV1Qza1ZzWTY4emJtcHFaQW5o?=
 =?utf-8?B?cXIyYnFlaDJyZUV6MkgrWVBLT01PU3RYSlpBa1NqWGR5ZHBRTjlMZWNESTF3?=
 =?utf-8?B?TWg4UkJIL1E2L0JsZFU0WGpac3pwcTYxZkJiTjh3U0pYcWlxdm45Z1F5L1R3?=
 =?utf-8?B?a0RwVjM4blBUUzIvQm1KUTg3TmZjYVJ2OWh5dEJOa21VeGJHcmRNS3FGSXAy?=
 =?utf-8?B?SkRmNm1RMllhVitKRlYrT2RSc2JEN0VZVVNpYmN2UFJpbFpVWTdRcEdheEdI?=
 =?utf-8?B?cDVHSVNvWXhhMktRZ3hUNFNwS0Nzbm1zazBWL20vQUhqUy9KN0NWSDF6bzdQ?=
 =?utf-8?B?V0hkQkZDQjEzTGkybmNUVlFZbXJtRHhzbzJBdWFwSU5Cb2JtWnBmQW5kMVlu?=
 =?utf-8?B?czIzK1Q3L1pVcWticE9RYjVqQTJiTWN4cDJka3phcW0zRXlWaUJzeDFiMlR0?=
 =?utf-8?B?YkF5aUNBaEg1a0NiOGNSL0J6QTRlT1FQRENITUJiWnI0d2ZkQXJtMnZTbmdw?=
 =?utf-8?B?LzlFa3orU0d6aDFKRFM3UEo2NnZNbFFlam9YTmUvdmVpYWlYR3hma2VrckZ2?=
 =?utf-8?B?SGxCUFBRZDFobnJrY1UwdXlMeWdZaVVnWi9UWEw5cTRaVE8yTXdsRkw5MnpO?=
 =?utf-8?B?ME1KNnQ1TE9UUFZHRHpOQ3lVQlZnZFNBMzlKdThVdHZ0a2x6aWhvRjZSQndW?=
 =?utf-8?B?Um9hcmp4ckpsNk41T0V3THZ4dGNmRXhubGxNYldFQlhIUlI0M0E4YW9XWGw5?=
 =?utf-8?B?VlhvRHZ0OUJWWno5TUF1MjVJOWJ1b045MndCMjlBK3RCLzM4Z1VabUNDSm1u?=
 =?utf-8?B?OGJWU05YQkNBUjByMWh1dmc3akxuY1FpTk1NOG5xZW0wbytic29NS29MelB4?=
 =?utf-8?B?bzA3QnRkMG5mOHhtNXNHOHlSYW9ZUThYRkUwOVp1K0NOWGRGM0RtZFY0TGl2?=
 =?utf-8?B?cHJsbG9CVVJNRDZ0Z2MvVEk4bXFpQ2pYMDFDdW9XOHJzZGlGUkdPV0Z6eGxV?=
 =?utf-8?B?SVU1YXBLeUMvM1Z4NW02ZDlGVjZYMzVMclpybnF5cStFdE12eXlnUXRXd1N1?=
 =?utf-8?B?eUVqQlU2UnlKVWZHbzRjWjlqVkozaFNDQjZ2UXZUemFNbnc5b2hiR1grM3d4?=
 =?utf-8?B?REhEWS91RGdXQnN6NnNvVkxSUm5Xay8yWE9WQkVlWVFxQVlzK0JxTDhNU1pH?=
 =?utf-8?B?STJyNTR4ZDhFM05zeUZpeDlUbXJEOUFPUlY4UUY0V2JaYkFXbDVGazNFTnIv?=
 =?utf-8?B?OHBzcTdnRVR2a3FFS1BYdHVGSWYvY1pWZ0hZTE0vbFJOTHRUZEVtUVFReS9h?=
 =?utf-8?B?cHF5M3pYR2ZCWUlJN25GQ0ZUemxQVzd5NldJanc5SlBmdHYwRGI2REwrT0Vv?=
 =?utf-8?B?d2llNE95UUoxVnJ3c1J2SzF5QVE3bkdvUlpZd2RqMXFMMEd3Zk5NeEk2Mjc0?=
 =?utf-8?B?eHFKNDY2Q0FTZ2Y2TkNOSWlXSnFQVFZJVkR2VTU4YktLb05lNjFGMmIxc3Vk?=
 =?utf-8?B?NHBHRUViWmJZdklrdEUrVEVwRU00VkF3alJjdHVWejVaZFkxYnBLSkFDOXFo?=
 =?utf-8?Q?QHDgqo1Yq/RPFOuQ43yQbY/K3XbweY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjdYbU9ESElTM3pCQUpQWlNGcVhaT0tRZUk4bFV6M1hMM0hzSFhEWFYxWWF2?=
 =?utf-8?B?OGJ3bnRqT0h2TUFOUmtDYlE2VmluMWVLQjBVK05KQUNSUklqOHVYRnYrQkhm?=
 =?utf-8?B?cEpCa3R0UkpTMFB2TVE5L3pZR3ZJekdxMDlEWXpKdXBaaEtjNENkS1NCYXZC?=
 =?utf-8?B?NFc5SUlNU1V4aFlQR0EyTDlpOE85c2Q4VUlFOGtLMWlyang3VVV3bC9pcDV1?=
 =?utf-8?B?Q25saEZvajdCK2JRODBXMndLdUNRcFNhajd2R3RBTXNHa3pYY0JOMHYxaDFj?=
 =?utf-8?B?NGFicjJveExSK3JEcDl4NXhlWW5IRWhyL2s0ZUlZcEtHLzh1R011ME1uMUxi?=
 =?utf-8?B?a2Q3WFMwVEhaVTlaRjNwTkF0TGR1dmJFaDdQbG9JazBsc1I1Z3VncHFkQjhx?=
 =?utf-8?B?WlJpN1BqOWQ2VWlJT082cG9GYVFlWGdjc1NSRlk1emFkMjRTSlRRdVVTYU5W?=
 =?utf-8?B?Q3B1NzhDMFRGc2JULzMvbUNIR1A4YVFwQXNtMUNhdHAzMkVvS2UwN1lxUFoz?=
 =?utf-8?B?ZHR4UjA1dWVyQk96Q0lvL1BFK3l2bVh2amoya1lLOHE5MWFmck93ejVyRm5r?=
 =?utf-8?B?RXl5cWVXaEZhUDlreEpGVm5ZMGN3QVpkUFpvcHN1Y3piVkwyTTc4SGZYRnBj?=
 =?utf-8?B?alFocXozaEZkNXlsaE5GNmJEY0ZDVVRjTTg0dURFM251QlY4bEtHemxURGpY?=
 =?utf-8?B?NGIwRnArRkZrazllTk5Sd1RBWlZCd0xQNzQ4Mjhuay9ZRFc4b3FqL3F4elRy?=
 =?utf-8?B?UWwvZTFRRTFlMmVqVGR5WkpLWlNzTkJsVllXY2pleXNYQTNhK0hkeG5WeVhB?=
 =?utf-8?B?YU9JbEZDZitHemQrNWhCVG9BRVBGd0tMOFFzV2RkaXBhd21zaldYUGRYYkdQ?=
 =?utf-8?B?aHJOZDhlZXBTK242Wlo2Sm5RL2JQQWtPK0hDUWlveXU3d3VwSk1ja2gxaVps?=
 =?utf-8?B?Z0RhN0xOMjFxNDlTNUlyVUhteC9wRFNneHJRNUY3VzYwL2E3N21tUnVXR0Rl?=
 =?utf-8?B?VTBMODdLbmRYcyt4QWx3Wll4d3RLblZrRmNkd09JZThwMmswTFlEWDM2NFBx?=
 =?utf-8?B?a080QklKSGtwbklmUCs0TENSMzc3OGMyRU1SckRyZTZKdGw4bkxNemV0Z3ZX?=
 =?utf-8?B?RzJGUzdrSis3OWNrc2FTaG1ETUUybDRUUm1VVG4xRHZOQ3VVRDVDQ1VtZE9Z?=
 =?utf-8?B?WFltK0hXSkVJTmgyak1SUXpKTjF1ZjMwV1E5eFhYYzEwTkUxWWZQTFBXRUZH?=
 =?utf-8?B?WXk2NEVKYVQwUyswRk9Dd0xZam5yUzF2am9oS3NsTHRqcUJ6RzZzWTBrN1l5?=
 =?utf-8?B?aEllUzdvU0tSejNLZHV0cEJMYjg3OW92dWlocEJkSHdDRThWcTQ1ZllBZTZ4?=
 =?utf-8?B?Tk50T0xCTFdKR3B6MG5HaEIwcnNYWjI3MnY0d3J3L0Y0SnNRaXpKa1RJZGlG?=
 =?utf-8?B?NFFvN09qWHpIV0xnSFRicVR6T205WnRhTHMzV1FYSDNPVjMrT2Q1WlJHOHRH?=
 =?utf-8?B?TUx3RjBBRk5IU0ZDZXZFUW1UdlErOUJENFlGdjFQVDZCMmN0ME9xWmh5eGk0?=
 =?utf-8?B?OHJ4dEpRM3Fpa1BXQUdsR29STWVNTlZjU3NzSmkwc056SFdoRGx0WE4rdzB4?=
 =?utf-8?B?bmY5alZiUHcvbzdsbzVROG5BQkNyUmlPN05GUVRYOVc2K2NXN0JMTk5DTTB1?=
 =?utf-8?B?YUszVllNQ1BUZm1RS0kvUFc0aStyeXJQT0xnWmVXMEkwazFsL2w4bnJSR1Yw?=
 =?utf-8?B?eDFQSFppaVVrNTZ4M2NKZ2lvY3c1NjlnOXd0YS9rSi9Ba3RBc1dQUWlObVRO?=
 =?utf-8?B?MVlVOFJxbTlraTBaV3NXbm9wSHRQNnpueWhIalFlc0FPenBxZ3pFWjM3bTRT?=
 =?utf-8?B?UVZnSFdKWGs1dGUyV21EcVd4TWhZYnl3enMwSEJDN2RVTVFXKzU3Wmt1WUlw?=
 =?utf-8?B?Um00Ykl5cXduK3I5WU9UTDQ5OWY3ZXlONUF5TmZDNnJYSFBzU3cyQWMxUGpp?=
 =?utf-8?B?NzAvRHN6emVFNDYvU3kwT0RrRXhDbWMvaUt3ZEFXSHFoVTNyZWE5ME1MVVJC?=
 =?utf-8?B?TkdGUzVQdC9NeWl6T3FvVFZMVzUvVFpPUWFncXc1Sk9tUW5HTDFnektwM21h?=
 =?utf-8?B?S0hqaGhEMWJZcitjVEtpb2hLQklIK3BVS1o0emwvUElUV3VRQWYyLzZpVGc3?=
 =?utf-8?Q?PJPEP5tRJe+zwK0YhZyBEwR4p20NF+NTkJbPho6vBl47?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <693577786837684782B70F4DD3491AD0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1017d69-11da-47d6-d61c-08dd88c394de
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 15:19:35.3567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObZIokgcEbX6Hwj+HRAA/UsfZoskXjGxVfiKvqWJ+8tQRDQlZwIsgEYTqD/42on7JX4O/n8DjQCebAorym+XXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
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

T24gVGh1LCAyMDI1LTA1LTAxIGF0IDIxOjU4ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCg0KDQo+ICtpbXBsIFVzaXplQWxpZ24gZm9yIHVzaXplIHsNCj4gK8KgwqDCoCBmbiBhbGln
bl91cChtdXQgc2VsZiwgYWxpZ246IHVzaXplKSAtPiB1c2l6ZSB7DQo+ICvCoMKgwqDCoMKgwqDC
oCBzZWxmID0gKHNlbGYgKyBhbGlnbiAtIDEpICYgIShhbGlnbiAtIDEpOw0KPiArwqDCoMKgwqDC
oMKgwqAgc2VsZg0KPiArwqDCoMKgIH0NCj4gK30NCj4gKw0KPiArLy8vIEFsaWducyBgdmFsYCB1
cHdhcmRzIHRvIHRoZSBuZWFyZXN0IG11bHRpcGxlIG9mIGBhbGlnbmAuDQo+ICtwdWIgY29uc3Qg
Zm4gdXNpemVfYWxpZ25fdXAodmFsOiB1c2l6ZSwgYWxpZ246IHVzaXplKSAtPiB1c2l6ZSB7DQo+
ICvCoMKgwqAgKHZhbCArIGFsaWduIC0gMSkgJiAhKGFsaWduIC0gMSkNCj4gK30NCg0KV2h5IG5v
dCBoYXZlIHVzaXplX2FsaWduX3VwKCkganVzdCByZXR1cm4gInZhbC5hbGlnbl91cChhbGlnbiki
Pw0KDQpCdXQgd2h5IHdoeSB0d28gdmVyc2lvbnMgYXQgYWxsPyAgSXMgdGhlcmUgYW55IGNvbnRl
eHQgd2hlcmUgeW91IGNvdWxkIHVzZSBvbmUNCmFuZCBub3QgdGhlIG90aGVyPw0KDQoNCg0K
