Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D713B9EDF7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2048E10E8CA;
	Thu, 25 Sep 2025 11:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BEcSi1/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012006.outbound.protection.outlook.com
 [40.107.200.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D34910E8CA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg6fo/muHttbNo4KAp94YjIV2o8/EYJYncaPWLjXGEuDsUFDL8HfKm9ynAtRdKlO7rQMTl4r8CSVM1c+NXK7Lt1qtrb31gyl7pN0+LiOADtPq/1Mr+zk82roKx/Gqs1mntO9uk9jfDOQG3EAP87AO6UwXNHBajmA4aKcXUzTXaFxFFLUSWxRFXK5/Syjb38mP24EfLpXY/INTv1DztUS2MZfXYl9yVK30Di8YvCoh3zB5D20RKBLPQLUnQupf3YY1XfnEaVdo0O+u8RGoz3CisWcnrggiLrLUfbI8AxUKYcJtZsQsZCCath2muMDw7819Fney+9Gvuu/UAVvyGP8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj2QhACbEZ8TEywBQYNcdKIsqqG5e3RlpIq4UkeXraM=;
 b=R+h7gFHOHBsIuWI9gVohQIoVL55K9QhYaISxFa1Zw3PSU5RYfJIqHSkAaOggAz5o03NYKKH8XH1eGRqQvPOD9V+GleN1ykxY/ew1fz26nOvwaARP87yVqf6Ua5UUvaQdFJZfMnMSws4RdMv9XWOuI6dbMyM7VDYDp1Oe9Nk2czbh7EJwsbybpzGdk/3TydBplHkSvEkn4vP5bZkQPJVRdxHNePsluCEMijR+6iTatSZMWjK0CDIRJrSlj2No2LfLaf11/k3JMGROpOlEG6GLtsBO43anFCTtUUoow/gf0d/qxYfKGtc+7cTcjXQuKScVkfcO5L3/H/KO0MT4UkicfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bj2QhACbEZ8TEywBQYNcdKIsqqG5e3RlpIq4UkeXraM=;
 b=BEcSi1/eUKvgNR7q9vsEvdlB4IYFSOZ+irjSP31cMNU9Av5y4+xi6DRq/bxWtPyIHyYxgHEfjs2GwBfGlaFq5+BbebYfWZ04s/7azcPS72VW8Pa+uXVs1nEca82jG8z0+yRVHNo52Og/goA3vruO9jMlqk1DCdiCul3S4MXyZ77nWKxCEcOfz7DO1hO4Cwn/PiO+ndhkIgDKWdQnwbEu8eVB3rsjDdlzg4WGEUn4ocek8pjpmYYxR/61M4YWCxvDoSu/bY4Xti9EgENS3I0nhVL0o3xsb39gpDmYxLoSiOtkNJZ/s5rZBcmF4HPquEVajMBwyhT6DIWEYVVGlTa8Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 11:14:00 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 11:14:00 +0000
Message-ID: <1f0037b3-5ee1-427e-9d0c-5f429d841916@nvidia.com>
Date: Thu, 25 Sep 2025 21:13:53 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 04/15] mm/huge_memory: implement device-private THP splitting
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-5-balbirs@nvidia.com>
 <b0bd326a-0ef6-4c72-ae25-3faff1fd6eb7@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <b0bd326a-0ef6-4c72-ae25-3faff1fd6eb7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5065309e-1683-4044-e7dd-08ddfc24a0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3NUTnlLTWRzaXZUSjBmbUF4YTBMQUVPOXpSKzA0dUQzL05Wa1NOUTE2WFRu?=
 =?utf-8?B?emF1SFlwK2daZzNZRDJMZTZZcy9KMFQwQkVoT0w2ZElGMGxvRHdXWDdCSm5l?=
 =?utf-8?B?YW5BM1JXTXUxK3pTa0dJUmdycjd5b0R2NndBdUQzK1czZVhZK2FPNU04U21o?=
 =?utf-8?B?NS9JdXhWdlNTZkNlelN1d0NtSUhjYUxPNklnbVJSczF3cUtFUlVKZGUrd3A3?=
 =?utf-8?B?R3A1ejNsY2Vxc0xjb016b0tKVWN6dFhtdmdOM0diRGxuSHhZVG4wTDhPS25w?=
 =?utf-8?B?RGI3ZTRhZkJOa2xhUWJaaDBtcWNHakNyZDRSSVBOeEpxZ2QvT2UwNHlveW9o?=
 =?utf-8?B?V0RoTEZHa0kwYWtpTVlhTFE0RWFrNWdiS3dpaU52ckZvcVZhczVGa1lwa0xH?=
 =?utf-8?B?N0F2d1pvb2dSVm8wN3BGS1Q0c29FbzlCekJib1dCbjV0dTNmMDZ3Zk53YkN0?=
 =?utf-8?B?b2tGU3ZteFBnWnFYK0dDb3ZJS0N0NmZWcnliSmlBSlNqd2tPRFVwc3VOdlFE?=
 =?utf-8?B?aWZVa0EvMHM4b1doL0JTbzZaeWhucHhyZTFTRnBKVjJaSE1JOHVmWDlhRlRF?=
 =?utf-8?B?dkJSSCtGOUhNdXEzdlUzM3FZczFTRlRDbndheCt6YjJxWHNPalRyd3VHSWtP?=
 =?utf-8?B?U0NPckZoSEk1NWxNTEYrbDZVSVBtQnY0bUpyZWhNdWlVWUF4OWh3NlA2Rjlh?=
 =?utf-8?B?VTQ3NzBZaFVwT0tmZ3QyWVBta3hwb0FwODdPSUp6NURYbVpWcGZncVllQ0s5?=
 =?utf-8?B?SE9VRzRTcW55aS93dFpaYVhGYVhKTjZremtNeG1Oem5KUlNCcGtoWllSVDBx?=
 =?utf-8?B?YUx2aU1vbVBLQmZNS2Z4RmlmejlkWjgyd09JNXJwbDI2Z0k5OTkxNmhOaGNm?=
 =?utf-8?B?c0VzcGlIRjUvempZVjZWWTBpMDNLOHN4Q25QWk1BeUJDV3FZTUkwNlFHMXRK?=
 =?utf-8?B?OFp3bWtvZDhSR0RlbUorZUxEZ2JaK2kyQlJVYk1Ha21HbzdYdCt5anVGRC8x?=
 =?utf-8?B?ZXgzS0lsTFBHMWp1a3AxN0VOUHhSYmdCNDZxRHZjeUE4c00yOWh6Zzk5YldN?=
 =?utf-8?B?eWtFRWV0a3N6d3F1V2VONE82ek5LbW1CaVh3eXp3ZXZQaTZKRnBnb0JwZ0Nr?=
 =?utf-8?B?Ny9VUXA2Vzd4L20wb0VwSjFZeld2QTgvc08vSUNhVytpNWFOMlVHMkJPUVB6?=
 =?utf-8?B?N0xYa0ZDT2NtcmJhZHNzMkdtQVp5TXM5cjlaKzBvc3h5cFZrS3hIZ0UxT2ll?=
 =?utf-8?B?Sld2MDNSZFB0ekhGbzNWci9za3k4RnZpMXVqcTVlREFrQUd2ZW9UNjV3MjlZ?=
 =?utf-8?B?WUh0U3g1UlUwZXcxeEVIUnJHbExwRXNLQ1JnbEpKbFE2ZHFDaVFJa25SVUZh?=
 =?utf-8?B?SWpadmROZkMzMEd2cktCVVRmdlU1aStoQVJ3ZDR1dnpPYkRPSzdWRkFzYm1h?=
 =?utf-8?B?SC9HeXVkeEh5Y1p6aG45MkZtOEt2RHhNT2hzWDExNzVFbllOYW9KTmpDOGlG?=
 =?utf-8?B?dGlTRGxJalM1YlZBc1lSYWVKTVNvSFZ6WGhxL01qNHd2eHJncm92dGtFdkM4?=
 =?utf-8?B?cytMQXNRNkRxZVBOWUxkblVEb0x1NHNDNVhIWXNYSHo3V3lHYStNSmpmVGRh?=
 =?utf-8?B?V3EyTVgrY3g0VWRCWWtycklQSlYzUTVsdUZoSnE2YVcwOGVWTE5ybmlrNXF0?=
 =?utf-8?B?RC96KzIrOHZjUmYyWEw1eGF2NlpiQjNQRGVPeXA1QVZoZTFCNU5tN093U3Vl?=
 =?utf-8?B?NVVmdkhPbUxrbnZMSWpzL2hrTGJDc0gwR3hlN1BOdjJ3NHEzSE5rOXRXdGxO?=
 =?utf-8?B?bU1nQ0pzSXkwelF1VlJmS0lyRWRaSHk1TnpJYkxpS3NhL1ZBTHNoS0RSQTRi?=
 =?utf-8?B?Yi9qVzJpUHlnOXVFaW9EU1NqUEpldFN6Qk5JcG91MmJBbTFscGZhMVBYY3N3?=
 =?utf-8?Q?RUfB4K1c7cY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWttcHNnNW51TXdjb2JNQkpqdGhXNU52V1BkeFRkVVRJYk5PdzlSTTRtbXdH?=
 =?utf-8?B?b3FIcG1TbUVYcDZrdXZZZEd3L1dLV2RTb0s4TmtNKzJkR3hPVXhBWld3amYx?=
 =?utf-8?B?SDU4Y1k4dHVmUVJBYU1QN1lPSm4yeXdUMWlMczJvTzJSMG8vckRmWHlQUjc2?=
 =?utf-8?B?azRIQ29NYmpxeWR3elVMVFdVaUVEWFNaRzFWbDhGUDNxWHNZWE1oeGFlajJH?=
 =?utf-8?B?c3lhdGFObks3aG9aRnJsL2RmNVZiUDNrNUloZ2o3enNraUdmdTg1bjJWSFcy?=
 =?utf-8?B?OThhQStTZGJrUlNibUV1TlZSdDlNbnRPb1F6UE9rd1duNUV5TEEzM0pqYytD?=
 =?utf-8?B?OTZuclJGTlJEUzJNZUJwRVp6czg3QXVGOWJBb2ZRMXVmYVlWQTE5ZjI2Mm1q?=
 =?utf-8?B?YTcydGtDVUtLd0pWaGErNHA0QWtUbUt5S0JYZ3pKK3V5V3V5YWFSbkhocE1i?=
 =?utf-8?B?SUt4dEtzT1VWcEhpOWJvbGVxYTdjeTFWWkN6WlVUS2NjODU5T1JrWDEyS3pF?=
 =?utf-8?B?cDR2N1hEcytJU2NNNExuL09BR3djcENoNWpTQ0JFUzZITTc1S0FHdTZyL0Fl?=
 =?utf-8?B?WnVFSmtzNDVUWm02V2V5ODVOb1Y2NEt1TmJFUndTRk1yZEpYRlM2a1VlNGdj?=
 =?utf-8?B?enB5U0J5OUR5RmZ6Z1lZUmQvUFVBd2ZwYWE0MUlCWDZmRzk2Sys3ODV5eWhy?=
 =?utf-8?B?N2JXbC8vdXMzMlNXYzlMTTV4U3UxTG93amJuWXV3ajlraGV6YkFQTGxJaFQ5?=
 =?utf-8?B?UjkrNjNENnFOc3FHL0FtUHlTV2toM0IrY1dMelhXZXFDcGpKQ1JuWVAvU0V0?=
 =?utf-8?B?dlpkUG1RT0tvUVhtdVl3cGxUR3hUVnFCcTVobERkeTVKMU5nRmtWSkduRjd3?=
 =?utf-8?B?R1R5M3NqVk81dTVqQXZPOGlBNWRUbUhSbE9HV2p3NmZKc043M3NtaVp2S3lT?=
 =?utf-8?B?QVoxaDNZSnZwUHRsVzAwMEhPTzZaN1hKRUZTNGtaMmJoMHNnelhCaDNEd2Za?=
 =?utf-8?B?eU9LOGkyTmx0b0p3SnNyR0JZTE40WXZDeS9DM0d4WWZFdzBWZDBHV1F4ckJk?=
 =?utf-8?B?UXRZVmlKODFsM0xnazRwMjMxdmVlWEdRamE3OWsybWg3UitHRnNHdjJKajJu?=
 =?utf-8?B?eGZKZTVPdnByTGx6RlVEa3NsRENZYS92OVVLVG9sU1dMb01rTEJXMi92Ui9J?=
 =?utf-8?B?dGlmeHluUDlFdTBWVFczY0MyYW9aamdGK3hHK1J4R3lETmJWUEpCdERuZENy?=
 =?utf-8?B?SHB6YmJNSmU1TThiTlpmUmprc2RmQ2VoZ1ZJSTVObmt4S3YxTWtudklQOGdw?=
 =?utf-8?B?K2ZoQTdtcVZNRHN2aW1wU05lNEVNTkd3SE9WWC9TeWlxY3BsMVhyUXdYQWpj?=
 =?utf-8?B?ZDdiNlNzVzRJQUpmYSt0Y1RManNPbk83M1pkRmVlR2tZNjBBNjhjTnBQVkEz?=
 =?utf-8?B?cG8wdjZ0TCtoRFltTFZlYzgxbnZ3U0I1NTd1d0ZralNocnBKZitRZGYyV2tG?=
 =?utf-8?B?YmNqTlBBNEtsV2JBS1VKUkVJTndIU0FuOG9LQ3dSR0p4UW4vRjZaZVdpUjB0?=
 =?utf-8?B?SUlHemhqT29ESlJpSkc3WUFrRnVwbFdKQVE2bFNYbE44VEhOdWxwRyttT1RQ?=
 =?utf-8?B?RllobzA2UDYyWXhGOEN3aUs1UXJHeUk4TUpOakkySDRHR3VCbjI0dURWZm5v?=
 =?utf-8?B?Vnh4MU5ya0U1RXpGUU1KQWFUZ1hyTEpPOHBvbEFTdW1vZG1qNkU3azBsRXJj?=
 =?utf-8?B?emlMVUNVL0FlZis3UDBIUjRpNHhHMEREWHI0TDhvWWNPU0owd3NpWWJhWENU?=
 =?utf-8?B?TDBGRUhQYjQ0dGpQQjZrT3lLUDVweHZKMXVRcG9BSGtBNmFubnYwa3BpU0tG?=
 =?utf-8?B?VUl6cm55aVl6WEh0R045SlNqUi90djNlWXoyL3hIenlNZTRUcGZ2bm9BZ3FF?=
 =?utf-8?B?eUpmck1ZZm9jdXBvRllTN0lJVTBNOCtRYS9JandmTnhrSkRWbFRQc3lRaldy?=
 =?utf-8?B?WTFNZGRESmpIU01hMTZuUHlLcWdmN0VURE9OVENMVVVtemE2WGQ0blVXeVFV?=
 =?utf-8?B?VWFYdGFPYnY0czhDd25pS29GN1ZqUytwcFkzTzZDZlU3MWU4UWVNQXMrZVlm?=
 =?utf-8?B?VnBnblhRL0FRcjM2VFltSkVGN0xldXF3NnIrbkxXWHpuU0Z0ak5ncVJRK2M1?=
 =?utf-8?Q?51W0zbDRpbuROly3YkEDgw0oNwUauJfOtPIaeW/PiSsu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5065309e-1683-4044-e7dd-08ddfc24a0e7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 11:14:00.6807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7wN7W4DmT0UCv8KzvB2Yv1Q6zVMLAxuTkq1IsxjzlOJLryNuX4nsD1JAF3UCdXkk6cczj7kwlnrafYEe5H8mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
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

On 9/25/25 20:01, David Hildenbrand wrote:
> On 16.09.25 14:21, Balbir Singh wrote:
>> Add support for splitting device-private THP folios, enabling fallback
>> to smaller page sizes when large page allocation or migration fails.
>>
>> Key changes:
>> - split_huge_pmd(): Handle device-private PMD entries during splitting
>> - Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
>> - Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
>>    don't support shared zero page semantics
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   mm/huge_memory.c | 138 +++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 98 insertions(+), 40 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 78166db72f4d..5291ee155a02 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2872,16 +2872,18 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>       struct page *page;
>>       pgtable_t pgtable;
>>       pmd_t old_pmd, _pmd;
>> -    bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
>> -    bool anon_exclusive = false, dirty = false;
>> +    bool soft_dirty, uffd_wp = false, young = false, write = false;
>> +    bool anon_exclusive = false, dirty = false, present = false;
>>       unsigned long addr;
>>       pte_t *pte;
>>       int i;
>> +    swp_entry_t swp_entry;
> 
> Not renaming this variable avoids a lot of churn below. So please keep it called "entry" in this patch.
> 

Ack, will fix

Thanks,
Balbir
