Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872DB21AE0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2D910E57A;
	Tue, 12 Aug 2025 02:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Eitg4MIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060.outbound.protection.outlook.com [40.107.95.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944AA10E578
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvVVPFxR0pYwQgIRUQMh46L6Lxu3mFeJIGKvGAgtp4BV0gj8wonCNiT8EmavdtQHeLPzChjg7UUt1FidLM3U+4PWUOva46eIgiEzupbxUrB53zr8G5MbYD1LUv7h5APIonhMPTL9AirgLEwBQa1yfHxYAMi5L6iTxHhipXNGY1Tctlf4aMNNrYBYgdTvAaBDzUW1ZkZpmNCZ5/gYa7mAxu29hhvPgAA6hfFEcvGkJuVdIp4nC9rwPafknAa0ozZ8vRCZlBCoba81rekRQSSW5x0936Pm9IGTNSLLI3vWsU1uwmuWXm3QYoI+GDzaD6zr30HsQTWyUX+GEPhjEaRo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2VJ5kH+tLdZwlATFAo1+hNpAmKX0dnctUob4DpO984=;
 b=NoeMukxo3cBL2JdaKlorCmfiKpwiZ2DFm5V6hZO1ehndu+LTHsaZyng3rWozot+OoaKCBjXLS8mvkoqLKZlVGp8KPZTYBPAFWczSM1HZ6nBjJ+exR0uw82rDW73+kcO2rKZwFXWkyJG6yelSJzwnc+sSjxvbhAeRolzMxRGG8wDvOYgOE+mZ+aXAMeaWMs59ZMPu59FC22lcDxHJi56ilGFkBmYwydfAARgLsXmZCXV5rXnprTihzIE1S6l8+hky5BKxtL58EoyTubm8GWPlJH+KxWjR7PQEkcMpBcRPtFlCOzGloxo9xawsnVv2wEH4EvYaFsalj29l3WvYHudPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2VJ5kH+tLdZwlATFAo1+hNpAmKX0dnctUob4DpO984=;
 b=Eitg4MIl4tiXvYc2SI4ekNABh65JB1U8z1RYePuFj2QS6SiU0RHYELw/7ZAFXzslWvHeMTaH0ufJrh9IgMm8iZ6gXdFpV5VLfxCVcDCg4Qn+5AeD5wiG1ZyY/3rW8oO3BaAOJhDnachAhjbWUhXCDaaAFvms5tao/D22Yv2E7WzORQSHfbyACjve65zUwlbtVkuCOob6zVc/BRJ9gUjk6WFAlfrDi+hKSWqB5cZp7ICdl9hHexCnk6PTlZ6IikaHaEmNrarImTK5wY5IBn3YB/7qoKKV4F7McaQ9f7LS+FFyZfDI9tRri43RgHZn/ofc48VCG84rm58st7AxeBOUlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 12 Aug
 2025 02:41:21 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:41:21 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Balbir Singh <balbirs@nvidia.com>,
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
Subject: [v3 11/11] selftests/mm/hmm-tests: new throughput tests including THP
Date: Tue, 12 Aug 2025 12:40:36 +1000
Message-ID: <20250812024036.690064-12-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0024.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1ff::14) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 792e822d-75e2-4134-616d-08ddd949b893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHVjczFKTkFtbUNZUzVOUVJlZEZHUG9idDZSblNZU1RWNFlmTmF2T2FIaDJ4?=
 =?utf-8?B?ME5PeSsvSjVQTGUrWEJrNkJkMm4vOGsvNWFlQktTdlFYMXdob0ZkRXNiZnNX?=
 =?utf-8?B?bEpvT0dxZlFQUnQ1czdiZXFXUHlWSlRwdDg2NEI0eTZWbHZzWkd2cXVjY3dX?=
 =?utf-8?B?WjZjRnM1VXpIRjBOMGxMWXVUTmoyWWluRk91SkhVRXNqaVBVNnYrdTBuNlJh?=
 =?utf-8?B?b0Y4M0dTWkVYM1l3Rkhvc2IyVDE4cml0ak8yLzJIcThiaUc2N01zU0hwZnNE?=
 =?utf-8?B?eUtXQzdPaFNYTjZpa01QVzY2ZFlmdkJwNlh3S3lXYng2Sk1IVElNamlMTDVn?=
 =?utf-8?B?c0hETlk1aU56REUrOEY4N0dHMUQraEJHUnQwODg2MFY0ZjkzVytpSDhWU3FO?=
 =?utf-8?B?cjRXUWRpWVhhS3p1SVhOQkVuS3BTakZVaWZUWk9EZDQ0eEs1M1NsTXR6aHE3?=
 =?utf-8?B?Y2IzK250TnFuaDU2dFo5a0dhdk82cXNWcWYzdkZHdjdhbkJnbGMyemUwbmpK?=
 =?utf-8?B?Z3lzNGVQdHVEQk01Y2hUUzd0ZTFMZzBRamNwaDlydTdtdVFhQUVlbFlUcmdX?=
 =?utf-8?B?WUEyazRyUllhS3Q3elI1cDNkcmNjbTlSbXA5bCtBRW1tdnl5cXRrMWErNVRE?=
 =?utf-8?B?VHgrN1lIOXJxd1pJSElaRGF0Qyt4dXJrMU9XbWp2YmpyZm9DSlJFYWdLSS9L?=
 =?utf-8?B?NDJSTitjWUkya2hLMFdTRzEzdWllVGlZZ3FYeUUzeXdUa2RibFJCNGd0VDhR?=
 =?utf-8?B?ZTFFOW5OSmFieFBrbmRaV2pXTVpoR3hoNHhscUl4Y3ZUVy9hRklmN0xQRDVQ?=
 =?utf-8?B?TFhUZ04xWVRjUmc0VlZnN2RSNVpURElIdUxTTlhGVnA3Nm1jZUZrSmkvMlB2?=
 =?utf-8?B?dmhremZTa3VHemw5b1ZwemFtV2xKU0VUdWt6d09zSnRtRWFxcE5zai9rUGsr?=
 =?utf-8?B?SlZ1RXJ5T0d4WmI4TnIxU2xkM280TWdENVZueHFEb3JISGpGN3hTQmNSZm5l?=
 =?utf-8?B?Q1JiUDJMSkNMMDg0c1JmZVhzS1hKWkgwdE9DdDJZQnMwRW43d0tHVGQ3OGE5?=
 =?utf-8?B?TmRZYTNCa2pVSmRtOTBYeWEwSm9lVjdoTjR3ZjVNeHB6bE0zVjV4TDYzME1N?=
 =?utf-8?B?VkhESXJBZ1czUHYzRGZIaitNUTRzbVdTUVJIRXhNb3JWMm4xMW5nT3hqcWJJ?=
 =?utf-8?B?YUFiOWwxUURjdGNsZEhKZmpNdmhSUVBVRUVtUzRWUG1HNFJUeHJjZnlqYnI0?=
 =?utf-8?B?WlJlOG5MenVsRzl1S2xnMCtneEczcS9oaWUwQzJNSk4rWVFjRFcxaFA0a0xl?=
 =?utf-8?B?VldpeDRNdGlVWHNjN0RQUjZpYTdmRkZ5Mlptai9iMFBZdFZjZVd0QmsxelpB?=
 =?utf-8?B?NnN2MmhIaTI1Uk9VbUhHZDRSUHNJV29GeEFadkp6T2hMK2Rnd3ZHR3ZyN2Vk?=
 =?utf-8?B?ZEYyQ3IvNlBEY1ppUWxvQnN1NFRrNU1MMFFzZDR1Y0pZUldTYTVVbGlVZ09Q?=
 =?utf-8?B?VVJ6U3NKdTZmeDE2RDMvcnhkRTEwRVE1Y0dmYzNXWDh4ZlRYZmZJQUJTS0Jw?=
 =?utf-8?B?OU5PS21wR2gxdFFlOE5uWmVpbzQ0WW8vNUVVRzBUSUNPNUN5cG0vNHVwaEtZ?=
 =?utf-8?B?YzVPUHBnSzkxZFVUZ1ZQc3dxcTh1ajR6b0tuSnpJQnc0VkFBYStHajhkU0JM?=
 =?utf-8?B?dzRMeE01RCt3WldCTjJIWFVVNCtKL1lTYVV2ZFFFWW1mWFhtYjlJS0RDUVJT?=
 =?utf-8?B?U3JWT0JQMmxnemR6M3NBNHdCZFVJUEJNOEVyYjcvc25sN0FQb2o5NC9SM0w1?=
 =?utf-8?B?ejlBaVdBd1ZJL01qdVduZGlUbTg4RWtKQ3VIUDBjOUUxb0kwWDd5dHZNcm9X?=
 =?utf-8?B?NkVDS3ZLeDh1L3dBTUVpQnFOL284SFBlNWlEcWg5VXBwajZuLzVmSVA5SEEz?=
 =?utf-8?Q?x+cSTy1AtpE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTdMcll6L1l2cHBndlQzTGNjUDJST0tiVEVidmxlTjZaNFhYRUFWN3JOWlI0?=
 =?utf-8?B?SDFWT1hKOUxqYUhJVGEzbTRmTDgrZVdsdE9qdkVpUU1Oa2JFb0tmQ1duQjl4?=
 =?utf-8?B?aU85WXUxS0VVYVF1QzdpcFJ1TWQ4ck90LzcvM0xpdUpYNG1CRXlTeFRYSVhX?=
 =?utf-8?B?QzI3MUVTYVlVd1RTcmhWNHRzM0VxMjNTejNBL3JuMzZ4cVh4OE5CWXZzN0Jz?=
 =?utf-8?B?Y1R2QU5xQnBvSUJhNkszczg5YnN2ZTdvN2k3VnMvMkVtYkt4cjZNemIzU3Fh?=
 =?utf-8?B?MmdPM3U1Qm1wSzZZSm9HcWgzWEY5cEZobTRsTVpQSnR4VmNqZjkvbG5vOG0v?=
 =?utf-8?B?Z3RPNURvaDFFdUcyTmRCVHdLdnl3Z0hwZW9hN3pHNHdjcThhMzkxSytFRks4?=
 =?utf-8?B?K0RaeXBzaStGVjlTT2g4TjI5Z3g5WHl4dmFBeStoSzkrTjZnbnpWT1hQWENh?=
 =?utf-8?B?c1dSQ1N4dVROL0lEWWcvbWhkY3IzejRnemw2alYzakt2emc0ZWtvYlEwSUp5?=
 =?utf-8?B?TmZjQ0ptUWQ1UzNTWVJQR25xbFowQ2VIYThXV1BFQTVra0tHNy9JUkdPU3hQ?=
 =?utf-8?B?MlNYS082NC94Uk9qZUxnL2VwQmpmZXpTdWljMnpGZVZXdlRHTnRKRFZpV2hX?=
 =?utf-8?B?NldqcDBja3FsbDZHNGU1NE1xZVNPeGtKam43Sk0vOGo1WW4zc3pxd20wTnB3?=
 =?utf-8?B?MngreUFUWUwvTU00V01PbEZYb0dsUHN4U1lNT0xnOGJwRDhhblJWL2I1a3la?=
 =?utf-8?B?VHRrcXYwSkhFUll5TUFKSkcwUDV1MHJTYlI4Um1DL3MrZDg3K2NERWNTVmUr?=
 =?utf-8?B?eGxIcTc3RSs5b3U3U1VoRy81dzcxa21XZ0ZPSTZSMUtFZVM5THZRSXZOUWRk?=
 =?utf-8?B?aEw3d2Y5SG41amZwUGFDZ0hTU0EvVjR2NWdNYlNBa1U0ck1ZRWVHRW5PSGd3?=
 =?utf-8?B?VHJWVnlIc0w5WWdDcC9GNFJJWWF4b2ltOGttRXBvK0twVm1yMXAwb3FzcDdl?=
 =?utf-8?B?Z3AyR2JwSVRSd0hNeEN0em8va0FsbUJSWmRDdUhDSmR2TERjRWVEdlRyMHdF?=
 =?utf-8?B?QlIzbXlyMVJXUUdqOFo5YlZBVHdVUXdaUTRXbTZIY2dBTkRTU09Zbm5MNWpl?=
 =?utf-8?B?UG5zRlFnV1hsTUtmUlVXWGl2ZGNYa2twWEpBV3BpSWxjVzZYSUV1cFg0UXFN?=
 =?utf-8?B?Q3R6aStGNy9VdWJDMVN4N2F4V1lwbFhvZVZ1MzJQalF0RlQwTWdkcWF2QlFT?=
 =?utf-8?B?d0xYVS9pNVdQaWZ5L2ZOd0U0dXdabkZNbi9xTWtBbDdpNzExWUpMbWlEN1dz?=
 =?utf-8?B?eFl1MVQ0clJwRm1aMis4QUdPeE1hWFZQdTdnNzJ3ZXB0NmhBNzZybVRYTlAz?=
 =?utf-8?B?T0ZBNnNZbURscW8wMk5RN2ttdG1xczZhQ3RFOVJhSlhJajR5dU8ybkRBRXla?=
 =?utf-8?B?QWdjNWw1b3lmZmMzL0ZDMkswZGFDZWE3ZkhaQ1hlWnYybEZXREdLU2pNcUtN?=
 =?utf-8?B?KytPRDdZanFFTytDTkkyT3QrdmFzdFpOOEhLaVdFV1IwNGRhNnJvN0o4TkYv?=
 =?utf-8?B?dWdSdTdsb2M5OGtkMGZQQldoZlZSV2pOOXR3dDlqUTRUdlltdWwrVDBLb0NF?=
 =?utf-8?B?SEFjcUNSRGR2UC9IYjZmTnk0R2Y3a2NPQ3E3akZ5MGw5alk1M1JuVm1oYXhB?=
 =?utf-8?B?elUrMFcyK3drdklSMkpaZkwyOFk4WkVuTGhXK0ZjbkluNWg0OGNmY2JHM0Rs?=
 =?utf-8?B?YW9MVjlqWjdERkFtZE1vQjN0NVJYVVRTQWxDT3ZPOU5hNm5FbFNpTUtDRnd0?=
 =?utf-8?B?NnRJdVV6dUorNnorWEk3V3c1WHUwVzAxNml1aXgvT3BWaHYyU0lmelQyWFVG?=
 =?utf-8?B?MDNuUTJWOVJudUw2elVSajVCdnpDRGZ1b0tZRmpkQzRKRE95SERSd3VhM0NC?=
 =?utf-8?B?S0tKNHlJYXY3QTJOK2wzTEdLRVhoZGVMRGIwYldkcEx2eGVLTGtVM2UvemI2?=
 =?utf-8?B?QWgwU09TUkJad3YvRlFiMTZ2cy9rYVlsem1OWmt3MStFbzJjN2IyVWM5RjQ1?=
 =?utf-8?B?blBPdFNhZmVxOUQwOHZqVTc5NzdyUTZkd2V4Si9Nb1NrclIxSTh5R1ZBNUpI?=
 =?utf-8?Q?KyAYgdeJ055zO0HA5Z97e4o0L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792e822d-75e2-4134-616d-08ddd949b893
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:41:21.2144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MY57gPrWH4Gx+gD/bEZ5RNCrhxunz8VYU+sqlyfJTvtIsusvhIYMPGcMqHqgiAd54xTV6CMhzASTTHmhMvT7nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317
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

Add new benchmark style support to test transfer bandwidth for
zone device memory operations.

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
 tools/testing/selftests/mm/hmm-tests.c | 197 ++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index da3322a1282c..1325de70f44f 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 
 
 /*
@@ -207,8 +208,10 @@ static void hmm_buffer_free(struct hmm_buffer *buffer)
 	if (buffer == NULL)
 		return;
 
-	if (buffer->ptr)
+	if (buffer->ptr) {
 		munmap(buffer->ptr, buffer->size);
+		buffer->ptr = NULL;
+	}
 	free(buffer->mirror);
 	free(buffer);
 }
@@ -2466,4 +2469,196 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	buffer->ptr = old_ptr;
 	hmm_buffer_free(buffer);
 }
+
+struct benchmark_results {
+	double sys_to_dev_time;
+	double dev_to_sys_time;
+	double throughput_s2d;
+	double throughput_d2s;
+};
+
+static double get_time_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return (tv.tv_sec * 1000.0) + (tv.tv_usec / 1000.0);
+}
+
+static inline struct hmm_buffer *hmm_buffer_alloc(unsigned long size)
+{
+	struct hmm_buffer *buffer;
+
+	buffer = malloc(sizeof(*buffer));
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	memset(buffer->mirror, 0xFF, size);
+	return buffer;
+}
+
+static void print_benchmark_results(const char *test_name, size_t buffer_size,
+				     struct benchmark_results *thp,
+				     struct benchmark_results *regular)
+{
+	double s2d_improvement = ((regular->sys_to_dev_time - thp->sys_to_dev_time) /
+				 regular->sys_to_dev_time) * 100.0;
+	double d2s_improvement = ((regular->dev_to_sys_time - thp->dev_to_sys_time) /
+				 regular->dev_to_sys_time) * 100.0;
+	double throughput_s2d_improvement = ((thp->throughput_s2d - regular->throughput_s2d) /
+					    regular->throughput_s2d) * 100.0;
+	double throughput_d2s_improvement = ((thp->throughput_d2s - regular->throughput_d2s) /
+					    regular->throughput_d2s) * 100.0;
+
+	printf("\n=== %s (%.1f MB) ===\n", test_name, buffer_size / (1024.0 * 1024.0));
+	printf("                     | With THP        | Without THP     | Improvement\n");
+	printf("---------------------------------------------------------------------\n");
+	printf("Sys->Dev Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->sys_to_dev_time, regular->sys_to_dev_time, s2d_improvement);
+	printf("Dev->Sys Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->dev_to_sys_time, regular->dev_to_sys_time, d2s_improvement);
+	printf("S->D Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_s2d, regular->throughput_s2d, throughput_s2d_improvement);
+	printf("D->S Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_d2s, regular->throughput_d2s, throughput_d2s_improvement);
+}
+
+/*
+ * Run a single migration benchmark
+ * fd: file descriptor for hmm device
+ * use_thp: whether to use THP
+ * buffer_size: size of buffer to allocate
+ * iterations: number of iterations
+ * results: where to store results
+ */
+static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_size,
+					   int iterations, struct benchmark_results *results)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages = buffer_size / sysconf(_SC_PAGESIZE);
+	double start, end;
+	double s2d_total = 0, d2s_total = 0;
+	int ret, i;
+	int *ptr;
+
+	buffer = hmm_buffer_alloc(buffer_size);
+
+	/* Map memory */
+	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (!buffer->ptr)
+		return -1;
+
+	/* Apply THP hint if requested */
+	if (use_thp)
+		ret = madvise(buffer->ptr, buffer_size, MADV_HUGEPAGE);
+	else
+		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
+
+	if (ret)
+		return ret;
+
+	/* Initialize memory to make sure pages are allocated */
+	ptr = (int *)buffer->ptr;
+	for (i = 0; i < buffer_size / sizeof(int); i++)
+		ptr[i] = i & 0xFF;
+
+	/* Warmup iteration */
+	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	/* Benchmark iterations */
+	for (i = 0; i < iterations; i++) {
+		/* System to device migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		s2d_total += (end - start);
+
+		/* Device to system migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		d2s_total += (end - start);
+	}
+
+	/* Calculate average times and throughput */
+	results->sys_to_dev_time = s2d_total / iterations;
+	results->dev_to_sys_time = d2s_total / iterations;
+	results->throughput_s2d = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->sys_to_dev_time / 1000.0);
+	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->dev_to_sys_time / 1000.0);
+
+	/* Cleanup */
+	hmm_buffer_free(buffer);
+	return 0;
+}
+
+/*
+ * Benchmark THP migration with different buffer sizes
+ */
+TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
+{
+	struct benchmark_results thp_results, regular_results;
+	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	int iterations = 5;
+
+	printf("\nHMM THP Migration Benchmark\n");
+	printf("---------------------------\n");
+	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
+
+	/* Test different buffer sizes */
+	size_t test_sizes[] = {
+		thp_size / 4,      /* 512KB - smaller than THP */
+		thp_size / 2,      /* 1MB - half THP */
+		thp_size,          /* 2MB - single THP */
+		thp_size * 2,      /* 4MB - two THPs */
+		thp_size * 4,      /* 8MB - four THPs */
+		thp_size * 8,       /* 16MB - eight THPs */
+		thp_size * 128,       /* 256MB - one twenty eight THPs */
+	};
+
+	static const char *const test_names[] = {
+		"Small Buffer (512KB)",
+		"Half THP Size (1MB)",
+		"Single THP Size (2MB)",
+		"Two THP Size (4MB)",
+		"Four THP Size (8MB)",
+		"Eight THP Size (16MB)",
+		"One twenty eight THP Size (256MB)"
+	};
+
+	int num_tests = ARRAY_SIZE(test_sizes);
+
+	/* Run all tests */
+	for (int i = 0; i < num_tests; i++) {
+		/* Test with THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
+					iterations, &thp_results), 0);
+
+		/* Test without THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 0, test_sizes[i],
+					iterations, &regular_results), 0);
+
+		/* Print results */
+		print_benchmark_results(test_names[i], test_sizes[i],
+					&thp_results, &regular_results);
+	}
+}
 TEST_HARNESS_MAIN
-- 
2.50.1

