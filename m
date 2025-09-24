Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D0B9CC0C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 01:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8B710E814;
	Wed, 24 Sep 2025 23:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lA47BRtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B719D10E814
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:58:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utYF3A0nWxTlRQ2KTGFYlPecHHKsuHDjQjVlzIDhodi9IsKLkT9Siffe7jJYl0hZycFus54Vf3hbncbQGuT+YBSqpYQGKy7STk7NHvE+WTP5zOQSyKyHNjtsXDiLIi/yCvW/tXk4zBIzmmwUAT2xJyLmVf40CSEKr9iuoJvxcqah4lQ4hjOqHAAlimpcFoxIjktVgfe8WBOayc6XdfsVQeIyWRd9CkbjYZDQ9PDiRMmJmV56Q4zjZJUzFKulqJ0hxj5XcgDkl/agcLsQHf954WaN7CTOSoakW6shG8Vwo2USfUqT2/w9uCH1ofYTCvz2Y0Ut7ussr45sPBOqlHNOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsIIUb806c+T5cntPv6rxoLfn1dZz4Vn6ejtwuI4bQI=;
 b=bqS1q7lB8Jjw+aRJWoyfvfZ8JFBH7KP+X+f0hlXraJwjkUm7aurTNQ4pUNwnW5qCoWsr8OjU5xtwyBeBiLEofbnIZ4qobPyEjHLUKr9NCMfGJlXaZbtpvfonVUXdmcFngNI/CacAqhsTnXa1cePptgun+PL0MtA1uMxiGWv//pdL4DGLxcBqH5BU/u32gZ6KMAxRTTcHxwmFBoe1wWG4rQbd3zvdnFmKQbdTYprL+ZJvrJlqzsh8GHk8BTgTZWYm64Op9G9BCx+6Pb8WWox0iZwQu1svPxoN1py8MiDd8m71nRhuDBLaw8OXPFre52ch/0GMS1ACW7EzvE9yXldlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsIIUb806c+T5cntPv6rxoLfn1dZz4Vn6ejtwuI4bQI=;
 b=lA47BRtbWN6S6FWO1CPH94yi5L2oqJJRi4HyARIUtKKQsAsbIVyA6pgRJln4Op6qr4wk5hFzwY4/EEoR9VO4GILgjpyZlOU1uAt9LZ+Ldba1FrqtghBULJgIG4mQUfPLJcEhcnHZvZnyN/uMq80iNwFC8gi6bN+zv5oJ3wRapZX0kraAB9H9LygenM2vdHo1h6sCs0bV6KBMc5zVRLDTsOhCXZx7I/eJ29zu+iZzYVvA7ltD5ULx/slfjPolpVAxP3KoPOXLQVt1MeEFTUw9Kjr83kW85XKIDWmp+B/r1Huj5BC4UPcrMSjOFe3fz79ABZBiIWdjsr4i7gq/RT7U3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.10; Wed, 24 Sep 2025 23:58:42 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 23:58:42 +0000
Date: Thu, 25 Sep 2025 09:58:37 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, 
 Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, 
 damon@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, 
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
Message-ID: <lcuuqa3e3txmhb55c5q3s6unugde4hp2wsmvkahgddeicyn2tp@xdx2zqjmd4ol>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <9c263334-c0f3-4af0-88a8-8ed19ef6b83d@redhat.com>
 <66A59A5C-B54E-484F-9EB8-E12F6BD1CD03@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66A59A5C-B54E-484F-9EB8-E12F6BD1CD03@nvidia.com>
X-ClientProxiedBy: SYBPR01CA0037.ausprd01.prod.outlook.com
 (2603:10c6:10:4::25) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b807ab5-7595-4dad-6756-08ddfbc64a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE9DWlFuWUExeFkvYmlxL3BZOXhDRm5YbCtYeTF2ZWFNUEZRcVNpQ3JSYjkz?=
 =?utf-8?B?cHpyem5CRDJScUFjbHhvWm11b0tFSnVjeHVsVk42aDFlZzNNcHRqbnMrVEhC?=
 =?utf-8?B?YXBtUHlnOEtJTmcxbW5IdE5QSGZ3dlhNbEJpZHgvQ2FSMDAxa096U0FraGhM?=
 =?utf-8?B?OUZ4WFB5NWlWY2crZlFnTGJ4VnFOb0wxTGVaMVZRa2lpSVA5RmN1aDdiNmFQ?=
 =?utf-8?B?RTVuMThLYWQ5SWpwdmhDeFBTM1dZTEZJemF5ci9HbDJaZVhQaHlXN05NcmZV?=
 =?utf-8?B?d0RUa2RNeGtSd1VrYTNna2ZyNkQ0Y2ZVYlpCUkY5SWp6WGZSYWhkcU1KczFo?=
 =?utf-8?B?RTQ1bG5ZZnpOazBZSmxMeUhyQjZTTS8yeXgvWXdMMzMzWWpLTUxzaHRLcVVJ?=
 =?utf-8?B?K1NFajVuRmhNMmh2VXBjYzhFU2NYYzhqUWRCU2FRUnVnRy83OUFGeVpmUTd3?=
 =?utf-8?B?ZWdicFc3VFlUalYwOG5LMVYxcllIMVRVSktyMmhLUk9JSUZMWjRYSHBNeWZi?=
 =?utf-8?B?Vi85Zkt2dnZDM21aYnRMb2lxTG5qSE8vVEJ1Y1FZeTJvVC9TNnV1RHNzeXZI?=
 =?utf-8?B?cTBBMUdQOCtpQTNMRkxmZkxoVUhnM2tRenZIUlNYVGVxQlBFc3FjMS9hSVM4?=
 =?utf-8?B?TGVvNUFDTmE2cGZRSUxHL3RoOWY1NEVzVnZ2cS8zMkUyMmZhYzBoSDdxOVhW?=
 =?utf-8?B?Wm1vK2h2bzE2ZTBnaytLYWkxd1VBZTY0VmZoMmNrUGtpTXYyK1ludXlYUzRq?=
 =?utf-8?B?MVMxdWpOc0trSlF6VHAyNk5VVUJXUFV1S0tIUTloc25OZkF5STVvNktlWEYy?=
 =?utf-8?B?eHhvQTJqMGVWbWF2bTlMa2J3Q1RucTF1ajU3WU1YK203THlORyt6K2RzUUpF?=
 =?utf-8?B?Y0tqaTM2cFA0Wi9WclBTbXpqdk1qaFlONzNpUks5ZGNTdzYrNkcrblNaNk5O?=
 =?utf-8?B?RVA3US9hSllpNTVrVkVRZ2JWZG83WGNsZ1NGYlJCZEtDdHZVdFN5YmJmRGY0?=
 =?utf-8?B?Tk90Y0ZlOEtYSTlLbkIwSE5iOTFMbnBZYVF6ZDFiVHkzbk9IenFnYlU0UE80?=
 =?utf-8?B?THRPQ211NFpWa21aUWRHU3M3b0QwM1BXYnFzaTQ4c2FSUUY5S1Y1NXF0QUEx?=
 =?utf-8?B?TjdxNmJoeHEwczg3UkNvcGZ5b20xOTRzQXMwMC9qdUxRa0MyaXQ0cnhjNk81?=
 =?utf-8?B?UXlUUzdxUklDZVBsLzFkWG04V2k4d0w3RzJVeWF3NUpGaDNDMnc1ME43M3Uy?=
 =?utf-8?B?SzJpTVhKSGV2QllMeURjdXZTTUR2QVZveW8vdnRteVhZMThNK2FaTUk3WVRF?=
 =?utf-8?B?S2QvQkdrNHFaNmM1Y0pSN1QrTm9JZ2p4NStuZHRETmlnN2M3MFR4ZjZyRVB5?=
 =?utf-8?B?WlI3MjBTWDVqQWFxWmFveXZPTlNVYkh6bCs0a1FlMjNyTUJ2M1BoUnZ5MThX?=
 =?utf-8?B?SEVzL3c0U0gzVFYrZWFrelJKSEhpU0FMQVAxcVU1N3JkQTBueG83ajRPYkVV?=
 =?utf-8?B?R0RQTGNDaFUvRWtXYnVsRDBHVkFkVTNlNEo1aTBpZkROeVIzNnZsWDh5OFhZ?=
 =?utf-8?B?Z3ZrYUJ0N0xBVGdjT0hlbWY0bWhWdDBTNURjeU9DU2hLMk5KYVp4Qk5VQVNp?=
 =?utf-8?B?RzZpTnNLRzRlaGV0bThVKzBuZCtqbG5HbTM3cU1LUUw2b2JHaVdsa08yRDFX?=
 =?utf-8?B?eXZzRFV0Z0xXWTRhKy9ac0c1RHlxdlh4K1ZOUEY3c2RyM29Fam5RQ3ZUbEx5?=
 =?utf-8?B?NWgvWDBaaDZkbC9KTm9zUGVDVWQ5ZzROTCtGMDFBRC9KN09ta1IyZkZ4Mm92?=
 =?utf-8?B?RjUvWmxrVGZNcUt3amVEb2M0MXhSekhmSXNjQmR6V0J2TGtnOXRmNGMxb1kz?=
 =?utf-8?B?UndCUk1FTExOeUdMUGtmblp0aWpwTzBUWjQrb3ppQ0kyb0dtVk01ZkM0TjA1?=
 =?utf-8?Q?cCq7de9XCyg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNkbEVSTml2RzBlcHg3MEJRSkszeXJLM1BwTkhmRUVoYVFqUGl6RmhFQXNC?=
 =?utf-8?B?Q2hjSWdmNTVkOXgyblBUbzhhc2RVdG1JTmhaalk4eVI4aVAwOVhxclJvbTFX?=
 =?utf-8?B?RFhBaGZuWURrZnhvUG5WdmQyKzNrQ0Jsc09heGpBT2piK2s4N0hnZmt0VnJv?=
 =?utf-8?B?bFB3NkphTERUVC9paXBTdCtlNkJSSm5nYUNnL2NYYUhIV0QxUndFVDE1QVd2?=
 =?utf-8?B?bGxrd3RvSlNMbmN0bE5COUNPYjkxY3dvcnFqSkRyZVNkZEt5SDlLb3psUmtx?=
 =?utf-8?B?b1ZjbzltZ2RHK3NPZGdieGtQQzdUSkIzcmRndzdpVXJPZmJ2cFJhbFNDOUJl?=
 =?utf-8?B?NWcxaWwvUWNYdEhkdCtRNGZDdURHbmttbklBeEdRZU5QZjRCRWtRVDN5QnFC?=
 =?utf-8?B?bFcxQk9naXRwdzhmMjh2dEJZVEpDZzYraFhoYi9Bd25xM0NIMXJmVW5INzBr?=
 =?utf-8?B?ZU1tU2dEZnFVdzhMVUVuVlplVDQ2N1JlZ21IV1dydkt4dmFlTlpqUXljU25K?=
 =?utf-8?B?V1ZjUVp0NDBzeHZHZ0p6NGF6ZEZ2YUpaT0dYa3A3N2JWMXZlWXdCOEZQWEFF?=
 =?utf-8?B?ekc3R2tiaVBta3ZXSDRkM3E4T05oU3MwOGlhVG8yTWVob00xNzQ3dkk1c3Bx?=
 =?utf-8?B?MXowQ2ZlNmtPL21DcDNXMGVlVkdaQmQvREh4K00xVUR4Qkc1ODNsWHU5US85?=
 =?utf-8?B?RHNZVEltRnI1YzNOUUxBVzROdXpJeHRqOVVxVHBvOWxKSitmWUMreE9rUy93?=
 =?utf-8?B?SittNXlMdmR2ZEpGYTJ3eTE0RGxKcVlHMTMyckl4NlpWeEZDRVpWSHFvTlNW?=
 =?utf-8?B?LzlRK2FuTG1wa2FhbGpNejdaY2dBY0VKT1RPOVJFK3VSSmRqeml0MWhTdi9J?=
 =?utf-8?B?Y3Y4bC9tbVFndURaSHhSd054MmtpOVhRUGlYZEFPSVAyOXNWclpqMFNIaVhU?=
 =?utf-8?B?ZFo4QzNUL05HRk9JbmRKL0NvVVZkUGt2S29EUzF6dXExTWhWNUg3TWw0ZFkz?=
 =?utf-8?B?Y1YwNlJIcXBmMVlBOS9LVDVDZUMzQ0ZrN2lYT1J2Q2R6SVdiNi9YRWtTdkJo?=
 =?utf-8?B?VEpHV0orVWhFLzhlanVWRHMrbklkd0dpRlNPM1hPVWNONGh1Q21Qb2o5VnJY?=
 =?utf-8?B?ang3YVYrMDA5dmFWZm5YM0c5WW9mZ2xXTkx6dFNaNlljejdtVkRlUkQ2VlBn?=
 =?utf-8?B?WVlOVG9iOXRyb1lzMjQwTGNGSlpiYi9pTFM5YmtwV3VLNE5iamNJTUdGdDJy?=
 =?utf-8?B?SWx6OVVHWXdLS05wR3dXUTloelU5ZG04cVAvWEllQU9QVU9jdEk5MVBqZGJL?=
 =?utf-8?B?QkJXVU9JY3pOTjNFM0xYdTRvamRHQ0k2ZElRa3VObmFObWtad2FPaEJxeXBn?=
 =?utf-8?B?RTRxaytNckIvaFMzd1dtVWpSYllCVG5GWHpuZVdNNkxleWZZQ0Q0am14Unlk?=
 =?utf-8?B?cUd3MUEzV3p5N3FrN2J2L1R2dEJIQkh0ckNlek9OZ1YxOXFLV1dTd3ZXWnp0?=
 =?utf-8?B?ejl4TlRMUnVrSldZSHhLZlNxOUxBZk1tdHVjSDU2N2wwRzRQeWhqSFNGRTVo?=
 =?utf-8?B?dXYvV3UyUFdDYkl0N2tUSU5ocThWYUtxRkVNSFVrenE0WHZTLytPRlVHelRP?=
 =?utf-8?B?allmS3MyQWpDa21vZVV4RWZTNUJFT3g0Y28zTE5XL3RyTXZHQUpiaTlITlQz?=
 =?utf-8?B?TEJpSmN2VUduK2RLTnFiNi9UbDN5NWtJN2tvajQ1OW5zSFEzVUpUdlBOQUtj?=
 =?utf-8?B?TW9nSFp3djNaaEZ3cE5BQjY0clQrRlFraExrdHJ5MlliTDJuL0QzTlExYjky?=
 =?utf-8?B?S1V6aEltYnR5U2EyWER4bXFBUUdtVWhTRE8xZ09yMFkwa3IvKzJEUk85VUpQ?=
 =?utf-8?B?UFZLK0N1UTM2cVlkYjVTbkhBZ0hsZ0QvTHBTMWttNlVaSmhFL2N2TDJOdHcv?=
 =?utf-8?B?V0NXZWVLa0tJay80bTdMT1VGa2FHc2RaWHF1UGIzTklta0JMbk9oc1lJRzlM?=
 =?utf-8?B?UzNXb3BBcGxKU1ZOcnY5ODFXY3E3Y2R0Ky9HL3lCUFhrQWh2RTU2MG5paCtj?=
 =?utf-8?B?RlkvcEs4RmdkNkthaGlJRVp2WGM5MWdBeGcxZnhPaWQ4ZFRLNHc3VFZyTm1n?=
 =?utf-8?Q?7a8UN9ki4YxJmUL55eKwMOTLs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b807ab5-7595-4dad-6756-08ddfbc64a12
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 23:58:42.3147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvNNXOOY5iVo7HadBdQa8+nzkXPuj0Lld6FQpZoYmklfY4jvCVlYoLxY+Eglz5OCfE8w6X69C/rGAgTkn4ljuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
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

On 2025-09-25 at 03:36 +1000, Zi Yan <ziy@nvidia.com> wrote...
> On 24 Sep 2025, at 6:55, David Hildenbrand wrote:
> 
> > On 18.09.25 04:49, Zi Yan wrote:
> >> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> >>
> >>> Add routines to support allocation of large order zone device folios
> >>> and helper functions for zone device folios, to check if a folio is
> >>> device private and helpers for setting zone device data.
> >>>
> >>> When large folios are used, the existing page_free() callback in
> >>> pgmap is called when the folio is freed, this is true for both
> >>> PAGE_SIZE and higher order pages.
> >>>
> >>> Zone device private large folios do not support deferred split and
> >>> scan like normal THP folios.
> >>>
> >>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> >>> Cc: David Hildenbrand <david@redhat.com>
> >>> Cc: Zi Yan <ziy@nvidia.com>
> >>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> >>> Cc: Rakie Kim <rakie.kim@sk.com>
> >>> Cc: Byungchul Park <byungchul@sk.com>
> >>> Cc: Gregory Price <gourry@gourry.net>
> >>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> >>> Cc: Alistair Popple <apopple@nvidia.com>
> >>> Cc: Oscar Salvador <osalvador@suse.de>
> >>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> >>> Cc: Nico Pache <npache@redhat.com>
> >>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>> Cc: Dev Jain <dev.jain@arm.com>
> >>> Cc: Barry Song <baohua@kernel.org>
> >>> Cc: Lyude Paul <lyude@redhat.com>
> >>> Cc: Danilo Krummrich <dakr@kernel.org>
> >>> Cc: David Airlie <airlied@gmail.com>
> >>> Cc: Simona Vetter <simona@ffwll.ch>
> >>> Cc: Ralph Campbell <rcampbell@nvidia.com>
> >>> Cc: Mika Penttilä <mpenttil@redhat.com>
> >>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>> Cc: Francois Dugast <francois.dugast@intel.com>
> >>> ---
> >>>   include/linux/memremap.h | 10 +++++++++-
> >>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
> >>>   mm/rmap.c                |  6 +++++-
> >>>   3 files changed, 35 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> >>> index e5951ba12a28..9c20327c2be5 100644
> >>> --- a/include/linux/memremap.h
> >>> +++ b/include/linux/memremap.h
> >>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
> >>>   }
> >>>
> >>>   #ifdef CONFIG_ZONE_DEVICE
> >>> -void zone_device_page_init(struct page *page);
> >>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
> >>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> >>>   void memunmap_pages(struct dev_pagemap *pgmap);
> >>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> >>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
> >>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> >>>
> >>>   unsigned long memremap_compat_align(void);
> >>> +
> >>> +static inline void zone_device_page_init(struct page *page)
> >>> +{
> >>> +	struct folio *folio = page_folio(page);
> >>> +
> >>> +	zone_device_folio_init(folio, 0);
> >>
> >> I assume it is for legacy code, where only non-compound page exists?
> >>
> >> It seems that you assume @page is always order-0, but there is no check
> >> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
> >> above it would be useful to detect misuse.
> >>
> >>> +}
> >>> +
> >>>   #else
> >>>   static inline void *devm_memremap_pages(struct device *dev,
> >>>   		struct dev_pagemap *pgmap)
> >>> diff --git a/mm/memremap.c b/mm/memremap.c
> >>> index 46cb1b0b6f72..a8481ebf94cc 100644
> >>> --- a/mm/memremap.c
> >>> +++ b/mm/memremap.c
> >>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
> >>>   void free_zone_device_folio(struct folio *folio)
> >>>   {
> >>>   	struct dev_pagemap *pgmap = folio->pgmap;
> >>> +	unsigned long nr = folio_nr_pages(folio);
> >>> +	int i;
> >>>
> >>>   	if (WARN_ON_ONCE(!pgmap))
> >>>   		return;
> >>>
> >>>   	mem_cgroup_uncharge(folio);
> >>>
> >>> -	/*
> >>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
> >>> -	 * and we could PTE-map them similar to THP, we'd have to clear
> >>> -	 * PG_anon_exclusive on all tail pages.
> >>> -	 */
> >>>   	if (folio_test_anon(folio)) {
> >>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> >>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
> >>> +		for (i = 0; i < nr; i++)
> >>> +			__ClearPageAnonExclusive(folio_page(folio, i));
> >>> +	} else {
> >>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
> >>>   	}
> >>>
> >>>   	/*
> >>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
> >>>   	case MEMORY_DEVICE_COHERENT:
> >>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
> >>>   			break;
> >>> -		pgmap->ops->page_free(folio_page(folio, 0));
> >>> -		put_dev_pagemap(pgmap);
> >>> +		pgmap->ops->page_free(&folio->page);
> >>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
> >>>   		break;
> >>>
> >>>   	case MEMORY_DEVICE_GENERIC:
> >>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
> >>>   	}
> >>>   }
> >>>
> >>> -void zone_device_page_init(struct page *page)
> >>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
> >>>   {
> >>> +	struct page *page = folio_page(folio, 0);
> >>
> >> It is strange to see a folio is converted back to page in
> >> a function called zone_device_folio_init().
> >>
> >>> +
> >>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>> +
> >>>   	/*
> >>>   	 * Drivers shouldn't be allocating pages after calling
> >>>   	 * memunmap_pages().
> >>>   	 */
> >>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> >>> -	set_page_count(page, 1);
> >>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >>> +	folio_set_count(folio, 1);
> >>>   	lock_page(page);
> >>> +
> >>> +	if (order > 1) {
> >>> +		prep_compound_page(page, order);
> >>> +		folio_set_large_rmappable(folio);
> >>> +	}
> >>
> >> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
> >> is called.
> >>
> >> I feel that your zone_device_page_init() and zone_device_folio_init()
> >> implementations are inverse. They should follow the same pattern
> >> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
> >> zone_device_page_init() does the actual initialization and
> >> zone_device_folio_init() just convert a page to folio.
> >>
> >> Something like:
> >>
> >> void zone_device_page_init(struct page *page, unsigned int order)
> >> {
> >> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>
> >> 	/*
> >> 	 * Drivers shouldn't be allocating pages after calling
> >> 	 * memunmap_pages().
> >> 	 */
> >>
> >>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >> 	
> >> 	/*
> >> 	 * anonymous folio does not support order-1, high order file-backed folio
> >> 	 * is not supported at all.
> >> 	 */
> >> 	VM_WARN_ON_ONCE(order == 1);
> >>
> >> 	if (order > 1)
> >> 		prep_compound_page(page, order);
> >>
> >> 	/* page has to be compound head here */
> >> 	set_page_count(page, 1);
> >> 	lock_page(page);
> >> }
> >>
> >> void zone_device_folio_init(struct folio *folio, unsigned int order)
> >> {
> >> 	struct page *page = folio_page(folio, 0);
> >>
> >> 	zone_device_page_init(page, order);
> >> 	page_rmappable_folio(page);
> >> }
> >>
> >> Or
> >>
> >> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
> >> {
> >> 	zone_device_page_init(page, order);
> >> 	return page_rmappable_folio(page);
> >> }
> >
> > I think the problem is that it will all be weird once we dynamically allocate "struct folio".
> >
> > I have not yet a clear understanding on how that would really work.
> >
> > For example, should it be pgmap->ops->page_folio() ?
> >
> > Who allocates the folio? Do we allocate all order-0 folios initially, to then merge them when constructing large folios? How do we manage the "struct folio" during such merging splitting?
> 
> Right. Either we would waste memory by simply concatenating all “struct folio”
> and putting paddings at the end, or we would free tail “struct folio” first,
> then allocate tail “struct page”. Both are painful and do not match core mm’s
> memdesc pattern, where “struct folio” is allocated when caller is asking
> for a folio. If “struct folio” is always allocated, there is no difference
> between “struct folio” and “struct page”.

As mentioned in my other reply I need to investigate this some more, but I
don't think we _need_ to always allocate folios (or pages for that matter).
The ZONE_DEVICE code just uses folios/pages for interacting with the core mm,
not for managing the device memory itself, so we should be able to make it more
closely match the memdesc pattern. It's just I'm still a bit unsure what that
pattern will actually look like.

> >
> > With that in mind, I don't really know what the proper interface should be today.
> >
> >
> > zone_device_folio_init(struct page *page, unsigned int order)
> >
> > looks cleaner, agreed.

Agreed.

> >>
> >>
> >> Then, it comes to free_zone_device_folio() above,
> >> I feel that pgmap->ops->page_free() should take an additional order
> >> parameter to free a compound page like free_frozen_pages().

Where would the order parameter come from? Presumably
folio_order(compound_head(page)) in which case shouldn't the op actually just be
pgmap->ops->folio_free()?

 - Alistair

> >>
> >
> > IIRC free_frozen_pages() does not operate on compound pages. If we know that we are operating on a compound page (or single page) then passing in the page (or better the folio) should work.
> 
> free_pages_prepare() in __free_frozen_pages(), called by free_frozen_pages(),
> checks if compound_order(page) matches the given order, in case folio field
> corrupts. I suppose it is useful. But I do not have a strong opinion about
> this one.
> 
> 
> 
> Best Regards,
> Yan, Zi
