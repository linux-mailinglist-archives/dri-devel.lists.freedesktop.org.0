Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B6BB48173
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BD510E249;
	Mon,  8 Sep 2025 00:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gQbmdZTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4A410E249
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTh01CTa+2slb53FveC15LRm23mBvLi+eI1tYnlnMOHocAGAk9shwPea9FjmOEd1jHGTJMQZh260oMPFMUJw5mvQlkpj4TrPKy/j2JmhBxMUT/6OwDnyA2hhUWJ/TbDyerUivwCLHJB+H/3230Gr3ll6W43epR9zB8xGSOa2+4bLy0jOWqOK7SQO8Y+OkXndheDkC/KOad8RYGh5Z+GQtrP8q/8aXgf4FjdZUVIsfYhNXWCZl5peq2zcRwZICSFyVo70AsGFfkB12JacFqwZQ85SRCdLIo4niPMsssdBebvQOdUOTrPIRSzER1yHbF6bhwDNvQKppjf8NW+viI/+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17VMiiTWH9iustx3+EsefuZ2YdQauUDEUX7tBWMJi0A=;
 b=s3FO4UvK8Km5TmLDrlR0GHcA8tEu3FhmLOd4FlHSvA8a9aT6CfO6dQkvg+2L7t+3CxKMA/q3yvHISniAKCRpbLc0/7/UnELVPRyTyukuboAKu5LSZLOo15REuMoc4TZLLQsIsSDFwXUQlfunjE4BcFHGtIDi1vW2pMQaTasLJwHtIbUQyIkvLwOyHjmHbTHVCsM052fVKsZ7ak6jiYqJnSgQRmSaYfLE42h1nmi9DogvLlIHJA04xnkEVXqOH8k4yltvErOcmhxn9b8+DxovpE62ugXKu/og+N3qR1SamF72YW2rJTL88FavdSI1a53Pd2qPQobJiyHvUsfSwq7QOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17VMiiTWH9iustx3+EsefuZ2YdQauUDEUX7tBWMJi0A=;
 b=gQbmdZTJ9VBUxYR6R/bGLtvR5eMbIxGIkfOcJDOQ155OlB/woSgdWP7DqMVfLz/aOBNPow54uHv7zlTE6oxDHjHHefNPYbMOmfT17rgpGhCrCVKUvxZyB2YxYOYUmxiLmMc5Za4a1p2TG/l5/BARuyrfjtEOsu3RAiM+6mA1oT4HDa7vG/8dacKyGOh5L5YgjPz3Rq7RKzP/Fet431KIK0hB1M3xXRpI+DXFhtO5v0L6KAu9fvSXiv8VcLoC/oZqlpvZmEBRMIfb6HDO/5eah0pj/+f3Sy2MSSA1P+0iRVyxZ1hiSs16eu+qf4hWyr4taUoxNGmn/5uC3hIBHXBbCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:17 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
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
Subject: [v5 05/15] mm/migrate_device: handle partially mapped folios during
 collection
Date: Mon,  8 Sep 2025 10:04:38 +1000
Message-ID: <20250908000448.180088-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f2dc7d-2424-4de1-bf96-08ddee6b6465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RURISHhMUkwvVmIrMzFkWGg1RVpDU0Qzbjh5blRkZGlxQlNSRG8xQjdUaDM3?=
 =?utf-8?B?RlpvQjk4SzRNeWh4YzQ5RmkvQjJYMHFtTlBHNldyZEtzbDdwbHpZOE12WDlm?=
 =?utf-8?B?VldRQUlTbGVtdW5mMGM0TUIyUys4OTFXQ1o3QUpHZytJQTIxN1lnK0JyTVYv?=
 =?utf-8?B?azByeHlsRlFhdXY5R3MwVWk5ZExnUmFkUUc0MlgzTHlpd3o1dXN2bW4vSXY0?=
 =?utf-8?B?dHpxKy95YXErOEYvb29xSGhOZzBiNVpHZE5vVmFnRGpEYkJnQzk0V3loRko0?=
 =?utf-8?B?QXp3STJ4REp5V1pSSmJmQUt3VXRBWFdxYVk4NkpDa2FIc0UwM2tWcXpwWUo5?=
 =?utf-8?B?YURLVUk4dmxteGw0b0JPWlBLdWwzNjVyRXlKYy9hbFI1SXArVW1JQ3lyR25l?=
 =?utf-8?B?eVZMY1hkMFZWM3VtQis1Q0lMN1pTckxHNjNqdi9BMjdEY3FTM3NZQzE1cEFP?=
 =?utf-8?B?ZlZaKy9CNWtIOFdVUW1ubS8yMXVtUVgzaHl5TzY2TG00b1c3QU1yVk1xeFhT?=
 =?utf-8?B?WUFFNURpd24yeU96UUVINms2aERuWUVSRnpJL1dmMDdybGcxaVNzQVFLN3RE?=
 =?utf-8?B?RTlwR2J3MGpHb3FXSnpQL3A3b0w0a2RFYkZmTlM4TjZwWEJIMUt6dTRqM2Zq?=
 =?utf-8?B?R0FoUG9EcDhWSEI5N3Nwdm0vMUJGNDd1VlRRT0xzaGZPRUlhM0VkZU5CNnA3?=
 =?utf-8?B?N09uQU9Ca1p0T2hEYk1xWE40djRvR2F3T3ljd2FBb0xGbXJmNVVOMFE1d2s5?=
 =?utf-8?B?VWxiQkgvUHYzeG1UWFZWSEFTRitmaDRWUE92eXZSQ21malZtbWx5YTFCNm0x?=
 =?utf-8?B?ZUwyZG5vTEFRN09PUDNtMUt1c0dIU2JrbjNZcjN1cWZQbXY0U09ZalR3cW12?=
 =?utf-8?B?ZllzRk9JbzhnVnRObElTL1RId3NYNDdoT3FxUUo1YW5sbU1yLzJGVHBPWTlP?=
 =?utf-8?B?NDBqZ1ZwOVQwRVlhZjN6THErNHNFclFPY29Wbzc3ZDJmWjNpZEpYQWpFWFRH?=
 =?utf-8?B?ZFRrRUxwS29heENPWTVreVptZzAvUUFqSE5rZlZGajREcXZKVGhMc3hnbUtZ?=
 =?utf-8?B?Rzc3K0JTdE5BZnlmZkw0Yng2RlVCc2w2Y0VUZ1kzbzhETHV3M3VCWnE4aHR4?=
 =?utf-8?B?SDk4cHNmNGhWOWRNQlU5aG5SUkpRT2MrQlAveXRBR3JaMi8xWkVQYTA1OElM?=
 =?utf-8?B?RkR6UmZqR00wMTRHNCtQaTBJTVI5Q0ZuTWFxVXNIYnp4Tko5YmxHNDRhRjFU?=
 =?utf-8?B?VGVVdElhV0w0SW81QThBT0t0V252aC9td2xBUC9meXdpQ0s4UU1TR3IwQ2s1?=
 =?utf-8?B?azZUbUhxN1g0RlE0eDNYTjVIOVNhZGRucWJLNkFuYUY4RTJySUp3NWJXYThi?=
 =?utf-8?B?S0F2eS9tYTYrUWpxaWdJZzdRZmZYWjJKN2FLU1RyNk5QMHU1QmRnYXhiMXA3?=
 =?utf-8?B?QllvT21sTERzS1NqdEQrQlBSd1RjSkYzV3UzRnB3bVRKYzNiTWRMUmloUFBW?=
 =?utf-8?B?a0czQjNCcEtQVURyeFIxN1hReWdQZUs4aDVZaVlGVWFSS29VZEo4VXV2aXJT?=
 =?utf-8?B?N1BTVWVSc3pSU1dRV0pwZmVmRnU1L3cyVEVvajFwcERFWkVsT095QUl0RFBO?=
 =?utf-8?B?cXpGUldhM3BGNFpxb1BSQmdieERvYUhmR1gyWk8reEs4VCs0UUMyTmtjVmNI?=
 =?utf-8?B?SjZqR2xDNnd6VllKRGpuZ1czMmlQWXNYTmw5MTk2cmdoZ0VUUDFXWWQwWFgv?=
 =?utf-8?B?YTBWK0N1NmFKaEdKckdOL3EweGxOalFSTVZEa0JMY29xdGVDZXN4bU1KaTZp?=
 =?utf-8?B?OGdUYXlxazA0VjhDb3BtdkJCNlIvK09HQ2VLdlVjcGlLUGpHTlFWR0thQjli?=
 =?utf-8?B?d1Y1TDBkU3p2MjJmU01YeVMycFRQZWdXcWpWcTQyQzBBSjF5TmM0UEZsZlk2?=
 =?utf-8?Q?EPkx+SoSK4s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RENvcFRhb1p1WkFJRDB5cks0c29Xamt1TlpZUVgyZTlETVFwQzJyU1c1eFIz?=
 =?utf-8?B?NHludjRUbkg4TWJmMjYyQ2Q1blcxaDNJU2pqbEYxN1A5MHR0eCtzZjM1TGdP?=
 =?utf-8?B?V1FFNXdFd291bWp1a05jcEhQZ0tJczhtRzFxUTBEVENLVzI5TU5kSkdHOCtI?=
 =?utf-8?B?Kyt5ZGZIMS8wYUExbE1BV1UzTDlPa0hFaFVuaU5yMnNxdC9SN3pYMDhmOENv?=
 =?utf-8?B?YllVVXFvaGNxeTRFMERBb2tkNmhrcnh3VHFYczFBaWRwMktra1RNMFZ3bk5P?=
 =?utf-8?B?ZjVCcGxYUUtxaXRXS2NHUEJob2xkQ2ZiQTZDU1gyZk13VVEwdkNKc2ZUdEwy?=
 =?utf-8?B?OTZJbTRYS0QvcERleGQ3VUNNdWx3aWNHMmlNRzUzNFpOa1dBOWptVFJWVWhE?=
 =?utf-8?B?dW43UHozZFFKVWFtN0JtT0R6ZlRxMHJjak1iS1lNcnpzNDhYUjJOcFBQOTJi?=
 =?utf-8?B?YnFaaVIraFV4TTBmRHB5WnlLaGRTL1RNUkwwNURoUUV5Tmw2TVZ3WUMvQXln?=
 =?utf-8?B?dDFMWFp1VE5SMFNNMjg2a2pzSno2aWM0SjBxTHJzM1ZaVWh6aXlCa3hJaTRY?=
 =?utf-8?B?ME5LYTN6NHdrNFArNHRQOFRWMk5BOXh0VjBESU1qaTJSSEFsc1BTbkFIRTh3?=
 =?utf-8?B?RmdPOUpLUFdnNGlIbDRCYnFFemE1MHJHektWWTJIMHZ0amwrL2pZZHExcXhy?=
 =?utf-8?B?cHU5aStWRU9KZWJydmNxM1RQRE55Q25EcW1UUFdJUkE5RnZ0VFRjcjgwbzlB?=
 =?utf-8?B?cmNZMzZkMzZjOGFEMmFoQ1o5ZUh2dzRUL244VzZ1NWRITjgyZm9kRkFhQ1lw?=
 =?utf-8?B?L2xvRm5UTFlDQnQvV1FWV1BIQXZKS2Y4N21QQWM4UXJkMUpCZTNiQS9zejdm?=
 =?utf-8?B?QXdBVGE0ZjJ5ZVRFNGV2UXZVSXh5K0M3Rnhwc0Vtb3pQM3doTnYzNnJvUnh3?=
 =?utf-8?B?ZXJ5SGlwdVhPT0piZWFBd2M4UVppM2NLdlZUaVNkOC9vOXNiRWFEa3c3RjZy?=
 =?utf-8?B?R0prV2o1UkZsVEZSR1FNTFJPM2w2MW1pbkhhL2NoT0NsUlE1WUFFd3dxYk0z?=
 =?utf-8?B?cThsWUhQWnRueWJqeFQ5TTZjMDR0d085aExjRXV3WXF5bHE0WExmakVZN0Qw?=
 =?utf-8?B?UlNDY0drM0l2RU1waU9aWTNrenNCUnlSKzJvc1EwaWN0WVlhTUgwbTNYemVP?=
 =?utf-8?B?dFBRdktsUHdUWlB3alRxaWk5cjdTSkhyTWtxUEgwMUFWbmJaWExqR2MvVUtu?=
 =?utf-8?B?TmRtVXZESUhJZytBYXFTeFEzL1M5UmU5V05adzExTWdKTERyWlMrTndYV2lQ?=
 =?utf-8?B?bS9meFhwa2ZnVHZBR0N5Z0o0Q2JUQTFKd2phbjRLbjV4VGh6MzJpT2YzMWVE?=
 =?utf-8?B?TEZPUXo5RFRSRDdubTJyRzc5ZWJZMjdNQVUranJzU3BHeXZPemtYLzhiNFZY?=
 =?utf-8?B?VU9BczVrYWl6bXR3RktiV2ZiQllTUGpOUUFhUnF0Ulk5all6RVpQbUhSN3NS?=
 =?utf-8?B?SktEY2dyS3hJcUt6RjVOUXVxaU5GZ0VyUEE0eVdzb09TN1p5VDFLWTlPZWhY?=
 =?utf-8?B?KzkrV0NnejI1VERVeXNydnpOaWxKTHo5cGdpd0NaVUJPOHhiemNOUzhucG1C?=
 =?utf-8?B?cG9ZYXlaVzhLWUpSVXBKT1dsMGNkZVRwNXdQSHc4cDVPclhtb1grb1hqUUZV?=
 =?utf-8?B?N1Nsdmo4emVBQlRIbzQzQzA2RVRWOUgzbDhVOS9ralE3bzRaRHJ1b1VjQUVH?=
 =?utf-8?B?cm9PWE45YktlTVpTNy8yb2pVQUhadG1wa255ZnE0eHMrVjkvZzNDTHZhTGJ3?=
 =?utf-8?B?Ry8vMUdldzRTbFFtQ0VBakpIMWVjb09tMzlGazNKOWY3US8wZUhoWHdVYmdG?=
 =?utf-8?B?TFFVYnZxcktwVkxESTZSSkRYdDlnMy9tUno3UllEeHpzNW5OU3lIZStRT0di?=
 =?utf-8?B?QTRQSXp5UHNmeDJIZUVJTkNCN2dpVTkxYkJIRXVLc3pGcDJSbWxCWTc1ZjJu?=
 =?utf-8?B?YWhMb21DcFZmc20zTjhqT0o4MStLWmNJaU1NVHlXUjQ4VHZraEtMSDFWTi9X?=
 =?utf-8?B?amR6Yk1YQ2MydzZFMGcxc0hGR0FFcTA2eXhiaCtJZXJHbDk3bE5aTGdxTUVn?=
 =?utf-8?Q?GhH80a5u7GikM6pwPRTiIBvbc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f2dc7d-2424-4de1-bf96-08ddee6b6465
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:17.2344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y96BweDBdNyFKd3WOGF4J7hLOumdmjNo+EraMTDbX1hqm7mmbIlK344M6B4JmqEc/ANZqhd3mIsYghMtotMl+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

Extend migrate_vma_collect_pmd() to handle partially mapped large
folios that require splitting before migration can proceed.

During PTE walk in the collection phase, if a large folio is only
partially mapped in the migration range, it must be split to ensure
the folio is correctly migrated.

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
 mm/migrate_device.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index abd9f6850db6..f45ef182287d 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
+/**
+ * migrate_vma_split_folio() - Helper function to split a THP folio
+ * @folio: the folio to split
+ * @fault_page: struct page associated with the fault if any
+ *
+ * Returns 0 on success
+ */
+static int migrate_vma_split_folio(struct folio *folio,
+				   struct page *fault_page)
+{
+	int ret;
+	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
+	struct folio *new_fault_folio = NULL;
+
+	if (folio != fault_folio) {
+		folio_get(folio);
+		folio_lock(folio);
+	}
+
+	ret = split_folio(folio);
+	if (ret) {
+		if (folio != fault_folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+		return ret;
+	}
+
+	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
+
+	/*
+	 * Ensure the lock is held on the correct
+	 * folio after the split
+	 */
+	if (!new_fault_folio) {
+		folio_unlock(folio);
+		folio_put(folio);
+	} else if (folio != new_fault_folio) {
+		folio_get(new_fault_folio);
+		folio_lock(new_fault_folio);
+		folio_unlock(folio);
+		folio_put(folio);
+	}
+
+	return 0;
+}
+
 static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   unsigned long start,
 				   unsigned long end,
@@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			 * page table entry. Other special swap entries are not
 			 * migratable, and we ignore regular swapped page.
 			 */
+			struct folio *folio;
+
 			entry = pte_to_swp_entry(pte);
 			if (!is_device_private_entry(entry))
 				goto next;
@@ -147,6 +196,29 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			    pgmap->owner != migrate->pgmap_owner)
 				goto next;
 
+			folio = page_folio(page);
+			if (folio_test_large(folio)) {
+				int ret;
+
+				/*
+				 * The reason for finding pmd present with a
+				 * large folio for the pte is partial unmaps.
+				 * Split the folio now for the migration to be
+				 * handled correctly
+				 */
+				pte_unmap_unlock(ptep, ptl);
+				ret = migrate_vma_split_folio(folio,
+							  migrate->fault_page);
+
+				if (ret) {
+					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+					goto next;
+				}
+
+				addr = start;
+				goto again;
+			}
+
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
 			if (is_writable_device_private_entry(entry))
@@ -171,6 +243,28 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 					pgmap->owner != migrate->pgmap_owner)
 					goto next;
 			}
+			folio = page_folio(page);
+			if (folio_test_large(folio)) {
+				int ret;
+
+				/*
+				 * The reason for finding pmd present with a
+				 * large folio for the pte is partial unmaps.
+				 * Split the folio now for the migration to be
+				 * handled correctly
+				 */
+				pte_unmap_unlock(ptep, ptl);
+				ret = migrate_vma_split_folio(folio,
+							  migrate->fault_page);
+
+				if (ret) {
+					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+					goto next;
+				}
+
+				addr = start;
+				goto again;
+			}
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.50.1

