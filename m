Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00BAB411C8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0233210E853;
	Wed,  3 Sep 2025 01:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Baebn0zl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402FF10E851
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:19:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQWhEIShrcDG5yn7RNJW5TATp8w/l6LGJKO6F5VhcIvOo45gNNfW79AgmgLufsooUuTFVgNXHB/qAi6GhyHAFu8b3svN7KLcZR55XWu033d9ryNwnCtlNCYi7FQ5KOmMzkTrxtUnKyFLskqw+kLcjKh1aEY++jAlzYjC1C8s68ycLaNvnVgFVbK1jruzWDIU06npz4YzVVmY/MpB80dVAOHxEeFyL7uzf/mr58bwepxwJzYC9zH+VkkvhMetJ3hZ4yCjMFxOkZr4MNOYErzW3/56gh7Eep13kxKaBegYXMcNL4+XaYu8wAi+YNWRf4AYgG2gF1rCgYkQOI404CFwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZW7uX0/T0CdjXFUqj4WtphVa+PYavI68IpX084A4ik=;
 b=U/Bwys7KfmNhVi3BRBSIZ5yM1bJI3QtRmqT6ZmbKG6sm1PULfW63+XP5g2Bq4RjMZc5LQCTf+D7UG9pAzNzU79rD/jSnpufW8gjJWiqXiQMQoXc2AFk5Mk5wBnXs3E2Go2CUPGg9tFYa+1YE2Q62UE+DDJwwL7qGdaDJI8kPYK2nb85p9l8Aw9SYnkmTa3nKq6Y9KaLQgX8MSakurNj81xcA3uNar42egb2AtlDgUTISz90RsWSpykSfnjCyEO+oyY76He+Oi/nmVsRJy+khsMsNFwmf3nUywiGGe0SGlWhqRtr6SDkWyo1u0ArPraBrK7yoO80Omuwx7psQwV+VWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZW7uX0/T0CdjXFUqj4WtphVa+PYavI68IpX084A4ik=;
 b=Baebn0zlyx2eJJwaX7PKCJZKwYK6rl288etvgePpWMKJz9OYeNoeXqklAIr/vjJndbR1qSyj7TOKae21Y+npQK75cS6pgMUtbCTqI8bzInaIc6PLQd3jHXUUnLfuE/7xSWyyKTyvF3ibnfjEr0CoFkV9zL4SMDhRicuVJDiP4vPxUCyQJmyzirC9NsBS458ALcSWSUwMZe+0VJB7Ef27cRJtB4SF0tWfNNb1mnJT33w3WmzRCzdCwQKhXbBKIJ1WaeMeGXCaXd8Gms4EYsPvCuoZwGS/on4K1gDByt9RBB+f+gI1jEzl7TZKWeNbfuQdMNTOR7WJ7F6jndSYTHK8MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 01:19:50 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:19:50 +0000
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
Subject: [v4 05/15] mm/migrate_device: handle partially mapped folios during
 collection
Date: Wed,  3 Sep 2025 11:18:50 +1000
Message-ID: <20250903011900.3657435-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0122.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7a0389-40d9-47a0-58c4-08ddea87fa77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1V3bGpaTG9iYUJkakFoYVBxbEpDYkJYSDRCNjNIazNoVFZXR3c2cEpDOENj?=
 =?utf-8?B?NFhPcDlodzZ0dkJIelhVdDVYdlZDY29oU2t4RjhnZGxPM0M3YlJMTFB6OUxv?=
 =?utf-8?B?TmlWT1VIWVM2T3BEOTRKcUthc2RDaTRWclFZS1lleDdFZGJWMnBuS1pCeFVL?=
 =?utf-8?B?dnUwNTdhMjBBRzRuZFVTNG1IRlNqckxOc3RlMU0zbjJhdFEwT3VvNnlxbTBW?=
 =?utf-8?B?T01ScGR2bUgrODB1SEorQXlqNUlMajlTaE1mYllrWWRVSlVHSFhuZ0MvWWVl?=
 =?utf-8?B?aStpajlTNVh6VkR1cm5tZnpkVk1IOUZlT1l0RTFMeTA2aitqVWZYdW1FWUh2?=
 =?utf-8?B?MkZPK3N4aDczeEJGZFdIa3ZyUEZ2aUpoUWZicUN6L3NBdGVtcTdid2JPMkxI?=
 =?utf-8?B?ZEtRRW90bUV1YkJrdnNzVGpVaDdNZWk3elVVcVRQL0tJR1F5ZWhsQ2MxaklX?=
 =?utf-8?B?ZGVBNmYzMXhXV2FEVXVVQ1N2a1JIdmRmNVN0M1Y2N2s5YVZSaml2ZTBKUk1K?=
 =?utf-8?B?QlZYQi8rMXpZaHI3L1lJYWxmVzZOY3hobU5sZ3dUTW1qZFVQY1FKNmxnTDh6?=
 =?utf-8?B?bWVQbndQeERnYTdBY0NkSjIybG43MTdqTmZvcEFxdDFMWnpLVlRWUFdLRkZU?=
 =?utf-8?B?ZjhqQ3l4TmhUYU1rRHQzKzVzNmdWTWFxMk9CR3VuN0NDVXJDTTFEb1ArVXZM?=
 =?utf-8?B?RkRxVDZGa1luV3E1WitMbWNabnBUWTRvTEdvbTRxL2JybFIyOEZJaG1GT3JP?=
 =?utf-8?B?aXFpNFFOYzhVSFJzK2Jld2JROTZuUmhiL291K0I0WWNBZWFyUzAyblFRTTV0?=
 =?utf-8?B?UWczOTdiZGU0aE95LzMyT21rV2lOTk40R0JhZ1c5OEhCeGJjdUlTM3dROHN5?=
 =?utf-8?B?bFRDR2RMakZ0N2RiT3BBS1lNZnJGbjhVNWhBMnJnVzBZV0lnWTBmQURSQSsx?=
 =?utf-8?B?MjMwbmJ0TnlhajY1bzdxeTJhRUNaMUdFZXQ1b3RJSUdySnpJUDlsNTdBUjJI?=
 =?utf-8?B?M3FENmNZOU1QRkpKc3llUWU2bWtyaFFXT2NtUENOUUdJcTRVRThHd0lMdjBh?=
 =?utf-8?B?L1JJK1QxZE5PQVAvK244MHpYeGx5ZHl4SjVXMTRqMlFscDlzN0JVSGVUeFRr?=
 =?utf-8?B?aTZOcjNzNzN4Nzk4TVV4a3RJSXZob2kxaTFOTnRLSTNsTEFtYWtZNll5ZG8w?=
 =?utf-8?B?YUlydWcwcUhKek81VDZPY3JKb0czc0k0dDVDN3lzK1dROGN3MU5mMWhGalpI?=
 =?utf-8?B?UVNEUXI4ZEhBUXMzaVVQOFdFYjdYOTRjRVMrVURhM3VicnBZc3YzcG1WRVlJ?=
 =?utf-8?B?djZwWUtySk5wVVQxR0VyWFNJeHpXN292MnNMMzgrSU9NYWJYYXhrWGZXd0ZY?=
 =?utf-8?B?Q1graDFNMHZlSU5hMUVyWjlrZk9XaXlqWmpjSWU4ZzU2OHM3Mk8yS0RFb25F?=
 =?utf-8?B?elVEVjNZWkNlUDJ5ZDQ5Ynp2eG11NWppTkN4Ui9MbUU1L3lVUEJoV01uK1p5?=
 =?utf-8?B?aDYxc2M1LzFNaThRdWhhNE04NExENGFUbzc3QjNaZXFWaG56WUg5ME82LzJW?=
 =?utf-8?B?Q29pajFXOEVmUGJoc1AydHNTbkkwUW95MFpxa2ROUGJVa0RTeE1IQTZWaEtu?=
 =?utf-8?B?YkJrSXZJamtYQ0prUXczeVhPRHJNUUhKMDl0eEVDNzVSZGpYaExlRGlTMytP?=
 =?utf-8?B?V3pqSkcwb0lpY2FYR04vK1BnNjV1ODluMXdrOXd0ZisraWtuWDZkdi81ZTBm?=
 =?utf-8?B?UjdpUHI1WG1SWGJpT2VITzVObjBiVFVUcDlBVjFWS1F5L0QwSEtFSTQ1RFF2?=
 =?utf-8?B?WEtzd0FTZmprRE00TEJjbVI4VVNyK0kra0tLaDF5L0RpakJXdDNWME1TUGZ3?=
 =?utf-8?B?L3F2Q2E0WlB4K2JwTi9LRlpJSm5McThUWFl1L1JjQUxQVy9mTEc5NE05MWRz?=
 =?utf-8?Q?X/8R4M4/idU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNBSFZDQkRXNEd1UUt3UjhQWEdJN2x5Skc3WnRRTEFaWEhXWlFIdlpxaklE?=
 =?utf-8?B?dVU5UU9Qc0h1V0prU2pRaUNUR0N4SEpON3pHRGd5OFFEY2JQZnY0S2l6UXRu?=
 =?utf-8?B?b3MrOWVEZk9adFZKNStvY1R6dXo2SGwveThuQzRINm9EK1V3QTJ4aHJGanNn?=
 =?utf-8?B?eXdDaGVEYTVmZURWbkRtWkZUek1DVTJCZlNCVDRwamNMVy84Rkk4QlF6Y29P?=
 =?utf-8?B?YzFka3dLNzdkY3NJQ0MyTVpTNUR3dkZRVnE4UDNJTDk4NG5nRlk0YWNqdXFh?=
 =?utf-8?B?SjRFb1Uwa0lXVEVqNS9xa090Ri9IdGtYeTBFRld3WHZsK0Q1bDZMb25IMjVi?=
 =?utf-8?B?eU5UdGRHcjZlSU5ieTJaSTRIK3VQWHhQNWJjNTFEWW1rck5mUEI5TDVPemh0?=
 =?utf-8?B?Qm9POFZpejNQcElNa0NiK0pGK1ZOR21oTXcyOXE4czJ6WkpWTE9xbXFNZ1gv?=
 =?utf-8?B?ZkxiNXFyblA4MEM1eWpRbzBFWFlnMSttSGgvWWpSY0NKMENManZaOVRHQXZt?=
 =?utf-8?B?ekdXQ0VRc2U5b05xbDJ1eXN3RHh5anQwNkkyUXRITmJWV0FpK2FZWDZvbUd0?=
 =?utf-8?B?OEM4eW5nQ0w5bTV1VGlrdUs3b0QyQVRPaHFZZUc1c2RPY21TcTlRd0FGWWNG?=
 =?utf-8?B?b20vK0VFQktBN2RuK1AzUjR0MFNHNFhEMk9xZDNEU0FDcDR4cCs5cWczUTk2?=
 =?utf-8?B?dDZYUTluNUJDWVltQTNOTG9LRDRxMXZlQXdKVGE2ZzRsTUYwR0VyOHdoYmtj?=
 =?utf-8?B?SmY1c3V3ZzNqeHpSV0wwYnhmcDFjdXlrdFZKSHJ3UlFIZFRaVkRCWkluNmc1?=
 =?utf-8?B?Wm1zNDJaY21LdHRtVEF0SE1seTloUy9tdEdsNlNRSVduNnN6OU1LS0owWXIy?=
 =?utf-8?B?WjVNQ0FubUNCMVA5SENkM2ZDeE9KRkhUaG1hS0tGY3hMaEw2VkxEd1BXaVdD?=
 =?utf-8?B?OTI2UXZWT1RFWm1oVFQ2bXBrTXZoWTViTm9odzdKNlR4dlVYUFV6UVlZVXpL?=
 =?utf-8?B?Q2FqU2txbFgyT0lLQ1ZUVEwrSy9NUG9WdUdLK1I5dmwyQ3ZYSlNEMzREUmo3?=
 =?utf-8?B?bEo2ZFdzbGJXdXE4bWYreWE1QzNYdCtiOXBVbHM2Uyt2ekNyWThmQ2k3dEph?=
 =?utf-8?B?ekRIMzBwTkRsaE90ZGdVTFJWMU1sMmdPekljM016eVlzaWVPS29McUFXeTd0?=
 =?utf-8?B?Q2R0bGwxUitZWnk4QnhPa1RlLzEzVEM1ZDhVRXU4Q1JmVjZkc0xzeFlhWVRI?=
 =?utf-8?B?SStHOGxBR2M2ZERUZ3dTWjhNallmZ2U0TXFGSWxmTGxvNGpVdTVWNzV4bzRO?=
 =?utf-8?B?QWtYY0ZNcVpMeTdKYmk4WTVrVGd6Q2xEWU1lV01IRng3dFh2czAyeXpCZ1U4?=
 =?utf-8?B?andXanRFdk5qb0oyM1dEdnlhRy9WKzUxUHhCaGc3RFIrcXpLZ29uRGRkYVZ1?=
 =?utf-8?B?Rk9VQTBpQ2I4b3FhcXdPdjdmSzBlc0h6MDdkTi9ZYVhra05FQmlQUi96QXZX?=
 =?utf-8?B?eXBWa05DRldCSG4vNS9BQk13UGtYQjRSeWhzVzlJOXhESzJOSjF2emViSzVi?=
 =?utf-8?B?V1liUFFLdXN0NEIrNUlVQXR0TG9kYkFXbGpvdVp4RjdsRXBiR01aLzVtVGZP?=
 =?utf-8?B?aFhQV0poeEwyTVZXMWdNWHlXNCsrSGdCckdSZWttdzJsUUxRR2kveDVlYm4r?=
 =?utf-8?B?TlJFb3gvK1FOWW5pSGs5KzJvdnQ5VlVxYnZhQUN3eVp6MEMwelpXYzVOQS9y?=
 =?utf-8?B?R2cyMDlNeEZwdDJTdElHY3BnTlRwbDlDM1pwQkYxd1Z0Y0NuZkwwQVIzS3FN?=
 =?utf-8?B?clZuWmxVQzRFNDJ0cG43aWdnUnE4Z2V2VjNXWG9lQ2FsUC9zNjF1NHpxcDFa?=
 =?utf-8?B?dXRaaWk2M25uUk54SXhtRm9rWGhmbE1MYmlPZjFQWGlhZTFWMlM0WHkyZXRE?=
 =?utf-8?B?SFlHZk5tMFR3NU5JeTNZWW12OWllOHc3ejFkMFk3MEdpa1pxL2NscnIxenJw?=
 =?utf-8?B?eUc5b01tbnhBVUhpT2hCdGR3ejJ4WUFmWC9wUWQ4R3hXaXRsK09NZElhL2tz?=
 =?utf-8?B?YXdUREtlQjYwY0RMOGNTUWdGWDBUL3BMV3A4aVVBUFo5R0ZMeTZpSlVkU1Ur?=
 =?utf-8?Q?aL054/BNR0vCHLlL78hGnVN/d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7a0389-40d9-47a0-58c4-08ddea87fa77
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:19:50.3255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2vh6PKpdAPrhScBLts1ENEtKz7sZUbRroQ3tzjY6CzP0MlxFjoa9itJjqhSnBzrZkhLzaGPAyX2bYiTBWHh7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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
 mm/migrate_device.c | 95 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index e05e14d6eacd..e58c3f9d01c8 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -54,6 +54,54 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
+/**
+ * migrate_vma_split_folio - Helper function to split a(n) (m)THP folio
+ *
+ * @folio - the folio to split
+ * @fault_page - struct page associated with the fault if any
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
@@ -136,6 +184,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			 * page table entry. Other special swap entries are not
 			 * migratable, and we ignore regular swapped page.
 			 */
+			struct folio *folio;
+
 			entry = pte_to_swp_entry(pte);
 			if (!is_device_private_entry(entry))
 				goto next;
@@ -147,6 +197,29 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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
@@ -171,6 +244,28 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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

