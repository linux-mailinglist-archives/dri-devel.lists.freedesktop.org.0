Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D7C5AE4F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 02:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E86D10E978;
	Fri, 14 Nov 2025 01:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h/pEpWg7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B009E10E978
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 01:22:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKzaoSO7ByY+oVNKItoIjB/vSOZzcsR4zt7fsB1xS7sd8T1pwjdoCMyA0JU+m/SiWRRAYnZk0EhDmQ6AWX69jSsBv0ncLL6ND/WZ/XwHAWnyO7HYxZJkOO+povenzKUxb3tbnFkcLmm1c3rnlPtswfRCt9nOgMn+zrhJZc783ENJvqpNuEyPKHLV4XvgWObol49cH5Jdx2S75WksG1yiH8Z5VlwFU1Q7CenP7C6WwEr6MklTRHuZvnGNN8JOG/RfezvmShABCHwvzdmmBq63dK4vAloBh64Nt8o+8SfwagElBI0FcIet2FNLjP3pZZhlaD0HIrfELwKzdhbsk9DXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OThvmawgphxly6SPv5o3jeaEqyzdRNg6g76Fjp1KIAE=;
 b=j6rU7BZ2X2yxgqONwNLpwJ9QjsglIj3r0zVsvv5OtSVgQ3xRyj6c1bW3tw2D6gDUbJKjosjoAQD5jD+7yFVjR47YmpNew5XQG5Ow4z22sJu6UYdvs/xa5AM68Aes8T/gyBo+zr/8knZTBaDZWUWoXxXJzrFl6cExcfjW9esGmIBpXzie5TVcoRsHvpO/5boBH+lwGjnt6rQWfkNM1mNeCr1Pi5TFMNZf8SeZv44+wPBHq7yNNoU763o+GdoLsd8xmnJDKSoFEhzmuXCw3Atu2XKAmRGaKjVDhWvmKiz0m6Iazelbleyp+/NyAC+A7+QzgdLFdKALNZIcsPuiAYlFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OThvmawgphxly6SPv5o3jeaEqyzdRNg6g76Fjp1KIAE=;
 b=h/pEpWg7OywAhPV/+eYT4S/cCnDg0fyRbbXIvoFbkd4cmvXym2Htx99CZ2JgFlwQbPu+SUGuo0oQBcxhSCifFkw1ceefXlSQzvG7Yy2P+AEy6BsgIYSvnT6OI+in2J0SJwkkmI6BFyV6sR31e+WxBVh0qWhsQ2D2QT56kAPxh5qPBzRmRwcS6LRyZhUTsb7Cc065a4kjvEkq321teU5iMyEpFO+ZNoai2UrM05ObGEo40WMCvt4cmXKfnqy+bMLfZhqUqw+ZBoiWltVP2esug6BZSu3TJrB5c0xdeX8JXpbvyAn3vIc6Yr+Dw1e4cZxIvf5gaOozsuslXcMhazLQpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB6769.namprd12.prod.outlook.com (2603:10b6:510:1c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 01:22:26 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:22:26 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Balbir Singh <balbirs@nvidia.com>, kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] gpu/drm/nouveau: fix return type in
 nouveau_dmem_migrate_to_ram()
Date: Fri, 14 Nov 2025 12:22:21 +1100
Message-ID: <20251114012221.2634832-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0092.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:248::18) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fdc4166-957c-48c2-059d-08de231c4530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnMyQXRScWNLVUYwcnR4V29qRGFWUktqcmg5T0dLZU5sYzBpOEFsMXFjU3d1?=
 =?utf-8?B?V2tOVWEzVzhTcE1kOVM0SjNpZkVRTkxTQVFNN1ppQ3U4M3dBV1BDakVCY1JJ?=
 =?utf-8?B?dFNHcVJtcitBZlJwc3ZYazlPZ1I2a2IzSy9NVW1LZzdEZGRYNk01S21KWXFR?=
 =?utf-8?B?dENkNmxwR3I3NGtGQzlJVHcrR1hLSERLYVFoRnBHWnFpMm9BemR2ampTb0M0?=
 =?utf-8?B?Wm5pSkYvb1JxTGRPdzRycnNSR0NOUWQzMTRVbmpTc2VjcmhHbStpZzh3SXJI?=
 =?utf-8?B?NnB5aFMvUHczV01Hak1Oa2ZXelJBM0NlZVBJazBoSHM3bU1YdGx3VWhGSWlh?=
 =?utf-8?B?dHZ4ZDhvQ1NobkJyeEtOS0lTVlQ4ZEN0RzF0QXE0MGhXQ281NGZMUkthWW5x?=
 =?utf-8?B?QmEvMmliaEpoSWJ0MGd5MUIwUTlmQWttZnpmY3g3ZnBTb2JselJTUDdwWjVw?=
 =?utf-8?B?SzhHdERKWXMxc0tXSXN5TVZBVnhBSFpEQ3FPY3ZqOVU4dHl2SjFmRlFpVWF3?=
 =?utf-8?B?enp1RWtxSmR2RnU4MWJFN2ZUd2txN2kvMzlIQVBZU3Zmd0RUdkxlbUhpSDlo?=
 =?utf-8?B?VkxmQjZHOC82ZXNCdUNaS0lQdVVjUXRtQjRYV0ZSb0dHVSsrQTZNbVRZTTl4?=
 =?utf-8?B?NUh3OWZXUWpucFBnTkFvNFhqSWVyeGtOV01WQTh0SFlZTnp6ZU9mZ2NRZG45?=
 =?utf-8?B?U0xSMWFkeVBtYU5SdVY2cnNUYnQxdmN0TThhaEh2NVAzNlNWWC9CNWxXcHJV?=
 =?utf-8?B?dDRrUzdTaFBTWEVVR2hjeEREZVhDakxzNXJEeVIwTUlSeCt5dDVJSk1kcXYx?=
 =?utf-8?B?NzlWTUoyNjlKdFh5b0FYaitzelZpby9TUFdxYzZEMnY4b1NuWEUxYi85d2c3?=
 =?utf-8?B?M0FJdk5JUm93VEVRRmw5VE5kSlVTTWJnTWVVd2MyT0twaU1pSXJPNUVQSHBF?=
 =?utf-8?B?K1loazFvdUYwa1lHblVsTk1NMk5jeXk1SnI4UnpsWC95aktNYkY0dldXbnNi?=
 =?utf-8?B?YThqRkdUNUsvOE5nTGo4dW9OdDZYQXJBRS95OFRqVENEZnZkZjNhUU95NHpW?=
 =?utf-8?B?c3NzSytsWEh3OHlWQ3REYWNSdjhmQlpkc2hUbXpycG1XUldHMGZpNVNBNnU4?=
 =?utf-8?B?aGJMSHJvYk1UN1ZuUHgvc1NaaUk0NzZNdzVNVTg1WVBLWU1Ed2lEK3QrL0VE?=
 =?utf-8?B?dGJBWWQ3UTlUUlRxNXBTVnlvZi9iWXZkVElQdEpGN1JNK0NjK1NNVTJ1VTc4?=
 =?utf-8?B?ZGFrSnAyUitWazVSOFhLT1AxZ3lrN3JXRCtIaEJDMkF5aVlYdFlUWml2UW5s?=
 =?utf-8?B?N25PYU9OOUwrSXgyc0svZStyVFNoRUFiRFMrOGtJU2xwdHBDd1lnWmlXRC9H?=
 =?utf-8?B?Rm1COElWLzdZL3RUUDRKbTc4NURYSlY4SGFWSEhZQUU5aEY4cDQrS1NJMUZW?=
 =?utf-8?B?R0tJRkZZejkvcTdCMTJnZVZLT3VuWGFIRVNERW1NRmxhQjRCb2YzNlpTSjBo?=
 =?utf-8?B?ZHJ4N1dYeHVQV2RvQjZEazJHUks1K3lnZ1hyK1FzUVFpZzFrOUdZNU1IeTUw?=
 =?utf-8?B?MndQazZPMHpQakp1SmpJWUpWWWtQVEhNSzVabWxNYlJSbGtOQ20zcHBmSXBZ?=
 =?utf-8?B?VzhpTFpmamhrd3Z5QWh6d2VxYU9zUjN6aXFUUlhVdEtLamdNNzlNeEpoc0R3?=
 =?utf-8?B?S3R1R2hxQXRqc2hCT0xVODduNGU0ZmZybGZ0WDFxaDB2MldMMm5oaGp6c3dr?=
 =?utf-8?B?aTRnOTVXa1ZyNnZNNU90d0p4dHM3QTBZeHo0SktaUmRjWFdkalo0MU5Zb2NB?=
 =?utf-8?B?dXExQW0ycnNyV1AwZ2xsVVpHWDhjWHA4c1dscnNDOXZxbkhwRFRORUNnMFZs?=
 =?utf-8?B?blNYNm9DMFhkQ3NhZzhkSTg3djg1OTdKenk2T2R3UVhKY2lGZ1dVanRjY0JT?=
 =?utf-8?B?eXY3ZFlwN2ovV3h1RnJ2Z0E0K3ZEYll0a2tEZktxbG9pWDkyTmY2WDMrSXda?=
 =?utf-8?B?NlFSZHFjQTdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME13RE4xcEgxZHB6a05KelJweVJQdjI2STIzYjRINSs2eVV3REJna0VZRW4r?=
 =?utf-8?B?Y29Qd0VBQ2RWMDVVYVZ1dzZiYk40NzgzTlRzRjlaYTRJS3U1RlI2b2NYSVYy?=
 =?utf-8?B?NnIrWFg3ejdSUHBhNHJWOTQ3SFVtR1p0QmJSd1VrK25Oam9nd2xxTkdUZGlp?=
 =?utf-8?B?Y1dMSXQ4NGgvT2ZDUzh5TWxVZExodjZXOFQ2ajFyL1Z0QVNDTWZMalM3WXhM?=
 =?utf-8?B?WWNJMVJqS3RWaStLQ2x0bVBMT1dOaWZDUGluTk1nWEFidzVKbFZETnFBOGEy?=
 =?utf-8?B?aVNFbi9TaEQ5MWdycXd6cVE1UGhwSEpCK0YzOG12bDlNaEpvVEJtMlNuZmZ6?=
 =?utf-8?B?Z29BTmVmY3Jad3hROU1LZm1RUkYyVzE3bjVsazJUcllKd2Z6NWdzR3lELy9a?=
 =?utf-8?B?Wmg1c1M0cU1LNGkxd01SQXp5Mm5rT0xSbzk2ZUxmbUlvN2x2ZlpIaTdkQmgz?=
 =?utf-8?B?K1dqSXltMldZY2d2NUtPbnpBdEluTWNKQlpDZFp4WTJ5Tm4yTWVjSHVGZEdP?=
 =?utf-8?B?SWo1VWEzc3p4WXRrRXRZeGFCeWZXR2o2bmNubW1HSG95Uzh2YzZWbnpJNzZn?=
 =?utf-8?B?K2h2azlMV0YrbGVFTjQ4a2lzV2tZRUpxb1VHT3BnV0FGMDNnbGVPOTUwV3Aw?=
 =?utf-8?B?aDY1SWxmOHU4YjBvWGdBTUhJQlFiOFhqYnFGaWNxM1U5eFBFK0ZxWjlJQWI1?=
 =?utf-8?B?UGdrT1dZb3IwdWxMOU9USDFtbE1xT2tEcERMVzdDTDZlYlJlTGU0UVpyQ1hP?=
 =?utf-8?B?bldoTEZXTExiWGFod2FUMkRULzFqeDRhVzBUTzhhQlRWYVQyWjBiMFAyQjE1?=
 =?utf-8?B?V2VIQnFpVCtPMDdHYXoxbGVSaXVyY2N2dldPejNCbnlnbGJNUFl1L3cvRllv?=
 =?utf-8?B?VUY4c21KdFFCRDc2cDJQYmRWdkh2d0dIUGlYVWRUWXBwRFlOS01maXZSUHpk?=
 =?utf-8?B?b2lNbEpuOWRUb3JWY1NUcjR6YlpKSDRJYlU4alNJLzFvemFvTDlFbE9vc290?=
 =?utf-8?B?UjFCR0N2QW12RGx5bnVxZnJhbkl1Zld0UDU1M1oyYWRBUHpyVzNxTXlvTUxM?=
 =?utf-8?B?U0o2TEVZQlBrZVhPeks0MW5BNVNBa3JHVHhxR2s4ZFV6L3JkWlVUaHd3ZHAv?=
 =?utf-8?B?M1dNeU02QVFFZFBYVFFzMVBFR3dON2tONHRxZkxkR3VRdmx2TXMwZ255azlB?=
 =?utf-8?B?WGg5TW9QRCtUQUFSTjlqK2RzWTZoR1RWOUV1SlNoUXZUUHFpeU95U24rQmE1?=
 =?utf-8?B?eXp3cnZtVVBLTWt1YUZoeFdDdFludzZnYlB1Rmo4UTRuQTQxNDcydWdyMEEy?=
 =?utf-8?B?Z0lSN0FuT2JpQ1dEQlJEWEVvbTY3R1VTTGtnVzZOd1d4UkJSNU1TeW5XY0Zy?=
 =?utf-8?B?Y3VLaHVueGovUm5kNEpubm9CaFZhejdTYmZEQUd3T09rQVR2aHNwMllvZzIy?=
 =?utf-8?B?Tng1ditIL2pIK2NzSlV6cjRuclJ1djRxWHo3MzYrZm9HdTBkTktqcWlwbDA5?=
 =?utf-8?B?NkxIa3FrSldYSVNaVDc3Z1RmT29UemFyMW5qK2U1MWs2Y3hkc2Rsc09MVEw2?=
 =?utf-8?B?WElEK0pNSWhlaXZ6QUd1a2pOYkhFMUdNUnJSU215QnlCL1RYRmxqUExDQXk0?=
 =?utf-8?B?c2lhOFRQOGJzS21oT0I5WEpWanNRcElZRmpVNnRXcFNFTjVDSUlwUGt6NE5q?=
 =?utf-8?B?RllVK0JQLzBzbElNOG44MkQwc0NSdXA0TUhqZGh4eHhFemRrVDVkM2R5NnFr?=
 =?utf-8?B?emtwMGRMd3BqL2NCNzllbUhFb1UwenZqYVBnZTQ5VHI2ejc4TndETDhMbi9q?=
 =?utf-8?B?RlpHdlFUUHllWHd2QU9mRUhlRnNjWVhSZXFQcVBoSkNvS0NESVJtemhlYStn?=
 =?utf-8?B?TjNtaGQrMVVJTCtWMFJCNmVvL052RHRFeGtLOVZla013ZnpGNnlSNmhiSkdj?=
 =?utf-8?B?QU05QTB4MVUrQjBnZXRqSURkVkZVYTBVRHRuUVREWWtHTHJXQVMwVmFLdFJh?=
 =?utf-8?B?WmxsdTl5NFZ5OSs5UzAzK2I0dkY1R25kYS9DMkZHQ3BUN2tlZ3ZxVTh2dDJ6?=
 =?utf-8?B?OTRZcS9Jc3JEQ2crSnNSMEwrclVJZlM3YUM2aE95bVZwZDk2MmlsRThnNnVv?=
 =?utf-8?B?QW5CdlRjQnUya0xPbGd4c3BxaFFqYjlZaE9QT1REMm9Xbm55ZFZxa2dRWm5V?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdc4166-957c-48c2-059d-08de231c4530
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:22:26.4143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8R3vYf/BGi7HOL8Id9mKSFWOsbcbsal5m525ZuY4ZKOaLYsfDi1l2BOzWyph1C5E+9A4dL8mEHZiyKHx67SCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6769
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

ret of type vm_fault_t is reused to capture the return value of
nouveau_dmem_copy_folio(), which returns an int. Use a new variable
err to fix the issue. The issue is not new, prior to this the function
called was called nouveau_dmem_copy_one() and ret was used to capture
it's value.

The bug does not cause a real issue at runtime, the value is used
as a boolean to check if nouveau_dmem_copy_folio() succeeded or failed.
The different types should not impact the execution of the code at
runtime.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511121922.oP20Lzb8-lkp@intel.com/

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 244812e7dd69..58071652679d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -188,6 +188,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_svmm *svmm;
 	struct page *dpage;
 	vm_fault_t ret = 0;
+	int err;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
 		.pgmap_owner	= drm->dev,
@@ -256,9 +257,9 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
+	err = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
-	if (ret) {
+	if (err) {
 		ret = VM_FAULT_SIGBUS;
 		goto done;
 	}
-- 
2.51.1

