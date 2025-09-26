Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E904BA22A9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 03:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648E610E2F2;
	Fri, 26 Sep 2025 01:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bqRZ+h3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE6210E2F2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRiLbkcHxYV3NpfxeOt1hfuDKSGeV3cgjTiJ1JkLOu0Kmx1c95QsD4A+vSGAD4MjNorHtR9CXUe2ZyNkm7omEU63ADfKAUgN+oX/GruPMrVUN1+0CbkwEcD4eUIQppNyciiOLYx78oqyOvxJFKkS0nw6Nele/xvoq1F/AlTUo67OpAreLfd9Nza0FnkXmdsYSilXHS1qO96PAqjj8n/pzAiJ9oTZ3spf++ljzvkcIl5KCmq/sQkCBDv8r9/SrbFm5rKP+O4Oh50zXBI0/gsytQlKR40JcuDfEiLskvKi1CmSEzt4dOaWmJFEHFMnDKZZBg21LrAospy6VfxibhBRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJI8InGamRasyPu6/MEW88mHlaHzy1r78GqyR4CYqVY=;
 b=wCRihLb8rKkLUamZ4dOjM68zEdUh+bo+VHQPk8KN2wUNZp4qUspX8KRWPZdIpq9zvWcEk4VkPapXycQDq/QRM/0uBHSZRvohxAAl4Y6uqGf6rtvH5Yo5MO8JJwxWcgnrxh0sUO/lSO1nBi4UTr6Muf2MENgp7NHcwgo7Gp8CkepnImoOFDTr2ULbrOcl22Iplt41Xx1EpZVGybW7uF4Y32fJzwr9GPBISJnlZphT9pY/xB/G3NRQEpy02LTpYoAHGgjGL906b5krQY6camx3EaVREdRDDzPYobwnTO4nw9HHOudZvAcy9VZxi/gmFE9i9g2k9OzPF1tn7Qta67B+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJI8InGamRasyPu6/MEW88mHlaHzy1r78GqyR4CYqVY=;
 b=bqRZ+h3PncHauMnyDY+THic9nQn27tevP9vfsCgXs41Wmlu39m0BxcVuKc0J9x1nrHHb+5CcnCpL+PeiZ3wZqtYnCkl1Pa/9CoZtdxS2TeTp7HdOV9bl7sv+6GvhPs6QUsdQvlSsaAg0tayW3EdjbTJyOgv8dn80br8MjCh2dToSXphnZf+c0lC9/J6SWeF6Z+6WAfiVZqFIzZKHgaU5eeFhQq71KZUDUimvAwrZ5TxtyhBrduq6V61vEdKEA5TkFfXBrrAWvBDQ1zCGjWT7uv/uyFwi+RZ2Up9pCMk8qs+f61RYpALb/zMI95tE8pkO8JBDSfLTv0mG7b1UnCLZLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH1PPFDA9B3771F.namprd12.prod.outlook.com (2603:10b6:61f:fc00::626)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 01:50:57 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 01:50:57 +0000
Date: Fri, 26 Sep 2025 11:50:52 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
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
Message-ID: <ccn2mkpnsa5bprdscskc4ejyy7fogexq5qqmc2httbxfmxeh5n@6qvrezcaxwn3>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <9c263334-c0f3-4af0-88a8-8ed19ef6b83d@redhat.com>
 <66A59A5C-B54E-484F-9EB8-E12F6BD1CD03@nvidia.com>
 <lcuuqa3e3txmhb55c5q3s6unugde4hp2wsmvkahgddeicyn2tp@xdx2zqjmd4ol>
 <1b6741fe-20ed-4a47-8e9b-24bd199f23f4@redhat.com>
 <ba054cb5-33f4-478d-8005-799e8dcd7b0c@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba054cb5-33f4-478d-8005-799e8dcd7b0c@nvidia.com>
X-ClientProxiedBy: SY5P282CA0072.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH1PPFDA9B3771F:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc5c3b7-c507-4fcf-efec-08ddfc9f22e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjZOaXhLQUs4QWtmN3luZEdqNmhrblJQUjBxSnRTU29hY2IreDNzYVVMYi9O?=
 =?utf-8?B?Y2oydHc2a1NINEs5U0J6THlja0M1LzNxOTNKSXU2cTZtQWhWU2ZESEZsSzl0?=
 =?utf-8?B?aW1FVElxTTlVQTNVSW1uNitTRnhTbXVXc09QRGZzTGdUZG9QTVN1NkNsTmxO?=
 =?utf-8?B?WXpLK3hLTkhwNEJ1TlFXZjlxbmlreGp5RUNIM1c1bzl1TkVhNjZ0eHBYcGlt?=
 =?utf-8?B?SDRLRXZ4ckNGcVByTkdESmV4R1JLdDhJL1dqMU92WnAwNUNKSVpTYWU0ektp?=
 =?utf-8?B?Q0hxd0dvQ3ZUM3pDRWpxQ0NaamxsaGJMV1hWMVNpWWRVZ3J1bkt5RVlGT3NL?=
 =?utf-8?B?c3d1WWprV3U0Z0JRMXUvQ21NZzBPbVA1ZDloRkF0ZktZc2plOXRkUlo3eEo2?=
 =?utf-8?B?ajNjWEJoV1JDMFpudm1lWXFlbE81VXlsUUpEV3pHajQxdmxHRGsyY0ttSGpl?=
 =?utf-8?B?dHZDcE9meXFrcGlUWENLMSszYnVWd3V1a25ha29pcXZEamVtVXpZSzBmTHpU?=
 =?utf-8?B?ak9MbTdSZVBrSDRHNTRrYjY5b0cxTkJXRkJBSWp1dzZHNWdNUFRpUnA0d3p2?=
 =?utf-8?B?SEE2a1JqcGFFUjFhN3J0RE5CdmhjR0JOaTFlNUNXN3pPTHlOSllZWTZQd01q?=
 =?utf-8?B?Q1VDNzRXWkNXZVhOTGtFM2RxQ3dLM0N1SUNDZ2c5ZDhxRXJTS01OejQ0NTR4?=
 =?utf-8?B?YW84UzVHU3hYL1JoREY2YmZwQnNONHZSRlRRaUdRWkM1Z0dQSmJlR0V0VGEz?=
 =?utf-8?B?VHZiL2MxY0VGRXY4VFNwTzZOTFZUMU1uRWxURFVMTUErMlBTZjFLQ2dKcFZM?=
 =?utf-8?B?ai9BT09NRlYrVmpXK2U3K2M5ZXljc254ZXhYeTlaUkxKNmFJdlpaV3FIaGpN?=
 =?utf-8?B?UklpU3BEQTR3NFNGQVVPSnlHT0tMRk5jcW5kUXVNSkVFTzRwcVFWMG4wNnpJ?=
 =?utf-8?B?SzdaTVhqSS9jcWh2WXNIS2JSSVkyc1NqYnlDa1FRQkc3cmtVL01iN1puTEtU?=
 =?utf-8?B?K1hRMjlpdXVzUHIxK2FMSXVuUHdqbklKdC9RakpaMHFkYlE4RVBHNkVweGdN?=
 =?utf-8?B?QmZlamxNb0tvd2xOM05sSmtHSStKOHE0MkgxRlhDTUgydVJzc1ZjQktkTmFt?=
 =?utf-8?B?dmZGaFNqekVNYWZOZGNvMmQwTWlxUU1BZkpWTm5PL2ZENnlDMXVSV3RmTzBm?=
 =?utf-8?B?cVFSZjdKRWtBdkY2NUJoMm91YUQ0dzZYdCtPc292ZC9SOENoWnNMVXhXRlhi?=
 =?utf-8?B?ZldvKzIwZ0ZMUzdtaDZIWHFOQXdhSk1Nczc5OFNuRitxTExJaHVHMm9ybDZC?=
 =?utf-8?B?OUFvblBlWCtNb0Y0OXVCeE5ZU1U0WmNtclZUcmdoY04xd2tLc251V2ZvRjJq?=
 =?utf-8?B?a3hpZnZvaXN4R3dMM1owNWkxdmt5QXVkUlpqUzl4QU1pZnlWWENCY0U4TEZ2?=
 =?utf-8?B?Y0RieFZuSVBHSFp3c0JpM3JrRFNwMlI5VmJoekJWMUE1Ymo0MjJLeWhmaWlC?=
 =?utf-8?B?b2hqdkpTMjNOTEVrdC9lTFdvSEhRNzFiT0hCMXV3YzJJV2RiOVJVYXhYTUVB?=
 =?utf-8?B?K0dVUmJiaEFXbU5sVG9xSU5LS05ncS9ydkhwOFArUSs5SHp0bk9mUWpUYlhv?=
 =?utf-8?B?Y0Z1L3N0TGJBRjdnWUVGMEp4bzRqYWlpLyszYy9nMnNlTE1YajJ2ZU04eTFk?=
 =?utf-8?B?RlpwNVJMTHZoWWRObnFSaktIdEpDUUsrQWdWZWxMRnBFSFZDK2NLYzFKUWJ3?=
 =?utf-8?B?Y2RiMUxZT2J2ZTQ4RElNZlFCWnNjZGJGWnBHbERneDBFZmNsVzFQYmZKRG9m?=
 =?utf-8?B?UWdvU09QMWgrRUhYc0hPaWpTMTUrMmR3TGgvem9NMGJ1cUh0L3lERjlyVlFh?=
 =?utf-8?B?L3dGd0hTVFdML0dZaXBtN1NOb2FJbEIrcklNZnFybjJJL2VxQjFEZ0oyb0Nv?=
 =?utf-8?Q?D/IVgL6Yd6qBIZ54rAMHlbIdqLgD1T0Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1dqVktuWmFpWDFYZFRXOENnWUorUm4vb1Yva0pNWG93QTBKK2Yzc25BOU81?=
 =?utf-8?B?cE5WTjd3V3ZvUUNYdVBnNHExb3VBSVJacWcxUEpDaGJUNVNxc2VsZWpORTJC?=
 =?utf-8?B?VHhPbUloaXpZZmw2SGFFTm1BR1Z3Nk1TWG9Kc0RhRWdKVXQ4eXNraGM4Vkcx?=
 =?utf-8?B?cTlCRDJYZnA5QzhVNGxjQkxqb2pYSmMrVW9vbmtoKzRjcENVOEQrSFNHemhz?=
 =?utf-8?B?ZDRhOVNub2JDTUF4ZXE1V3VyRW16VlNocENybE1TTURDTjBHK2VLaEU5eGdK?=
 =?utf-8?B?TjRBM2xYSFljWFhGcDBLbkNwQyt3YXp4VXNOVUg0TlA1YVBBdlJKK01acVNO?=
 =?utf-8?B?dFFvTU5wd2s5Ykc3ZVpMcHBZbGFINmtFakxtSmQycUFJaVhVaVJJVFBFY1Rk?=
 =?utf-8?B?RWFtZHU4ZXN2alNQQUxudE42MXBHVDhJYi94Szg0eFJRMi9tK3I3VHVKTVJn?=
 =?utf-8?B?a3FzT0tTZUVtdkZTemFaaXh6OWtlZkZKU3ZCZHBkb3YyZklEcXlSUktvc3Na?=
 =?utf-8?B?WGNNQXQxWVkyYkdtMUdlK256Zmg2bnZJbVBKTHNDSDY4aE16b09tY3huYklu?=
 =?utf-8?B?UGZUOURyTlJoZDNkOGJVczkxcjlVUW9mYzZPcDBVaVp2cWJiOG13dENtQkdZ?=
 =?utf-8?B?cUQ0THk1eUNERWR5eGtheEp3eHNMckpweEI4cE1BU2J5cFN2UklMdWNreFJv?=
 =?utf-8?B?QmsxSmJpTnFVRHVIdEZkekR6Q2FLK0xraGhtTTIvOEZsaUNXNEpZTEFtN1pQ?=
 =?utf-8?B?YXNOeFVYMWN4M2JvV1VPcHgvNzFQMzZLZyt1SE9iNnh6aTZhbWF1cGNMK3py?=
 =?utf-8?B?cjFJb1RiWUJGWGJRYnNkMkZvQTdsaHppdzM0MG1CU0FqejVET09zYmJrR0Ni?=
 =?utf-8?B?dko5a2RGNGJ4RDJsS2g1WkFkR3gza1JVWkZVOTQwZjRrN1hMOGNRNzAyWW9M?=
 =?utf-8?B?R0JJeUhBeG82VUgwWE5RbE9LQ2djakpOS3Bra2NLY3B2cU45SXd5VU00TWoz?=
 =?utf-8?B?UFpqY2lvRnRFYWtOZm50eHNteUpzL1VlWGlJMGxraGZCcXYvRGhxQzlSZGo3?=
 =?utf-8?B?cU4ycjJQSzhBTyszQldycXI1elZVV2tGeXREaU5pS2VHZW9vWkp6cFlQb0dT?=
 =?utf-8?B?VkRYSTV4bStkOUxFZ3lwdG1rMytIMFFLakVVOVByMGE5cjMxR2RJN3ZrVU9X?=
 =?utf-8?B?YWZyUXkrNWd3QW5LSkI3eEJuTDkwK2lJenZtclFwMkVCL09zNjM0Y3RaMWZY?=
 =?utf-8?B?Mk9JZHhDd2hrTS9xamgwRTVOWnFyWm1pdjhHZGtxNFZNWm41NjhzSUEvMWZ0?=
 =?utf-8?B?S1RDRmgzUWVPVjl5WjQ1cE5lQk12OFlXREs3T2V0dWxlSGRvNG9RN2VCVTZX?=
 =?utf-8?B?ZnBmZU9aVTdzUWI3eG1QbVhhYm15bGM3UWNOdDI1ajgzTW5rMzNhVGpFRE1I?=
 =?utf-8?B?K2JFR1FSNTVwVmV1blVuT2NlKzNoQ2srWnpvUzVja2tDQ0s0WmJhTU4xTHhx?=
 =?utf-8?B?NHNGak5FTUZ3cno5cXhxb2hUdmNZYnMveTBEZHliZ2lTZE1UMS9EVWl3czdX?=
 =?utf-8?B?bURUK3pmdEpQZzBPZnFNTXJmaU9BM3BJQThDNVVnNm5sRVF0cU41REw0bTJl?=
 =?utf-8?B?SlhQNWZBSk5ydjlOOFlJc2RzYUlpQ0ltNWRueVh4ZDFQb1RKeUFxVVlzQlRx?=
 =?utf-8?B?dUh3SlJicWxScjRwUjl2YkpmNUgvUXc5d1lGM0pVOEdkSXZmeVVQK2pmc0JQ?=
 =?utf-8?B?S2FnRitTNDkwZGJxZVlGZjFLRFdCV1pXSWQ3RHhWdU9PRVZCMmxIYkM5YlI4?=
 =?utf-8?B?QUpWSDF1cUtubXQ5NFZnNDNQeDBtRUY3OXh1ck42MGVWWlBUbVdRVDdLN3Rj?=
 =?utf-8?B?Q2wzMCt4eVF0c2tvLzJNajlLV0E3S2hCQitRMy9kajdiVWxOS1BGOHFTU3lC?=
 =?utf-8?B?U2t2Z3YyNUJtZjhKVldKcisvQmcrVGExUVgwcDVtZ3lvNU1TRTZrYnBkSEVs?=
 =?utf-8?B?djEyaTVMZjZqM1d4RldWV01iaEcwbG1OU0c1cU1DTXRPS0NvY2UyWWEyMnVV?=
 =?utf-8?B?Sko4emx0cjdOWUFKME1LSml5b2xZSXJoVUxvbEprRGxNVUpkUXR0Q0NaM1ho?=
 =?utf-8?Q?rX2sAmpLCrQ/LCFmsN60zT/AN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc5c3b7-c507-4fcf-efec-08ddfc9f22e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:50:57.3939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eB33/h98ZZzwSMfu3Fo+uQKd9ucyrukkfiStXWpNPXyeaOdzs6i76Yv1MoFCE0cKqqHJXHT6x1UH+dcgghULQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA9B3771F
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

On 2025-09-25 at 22:02 +1000, Balbir Singh <balbirs@nvidia.com> wrote...
> On 9/25/25 19:43, David Hildenbrand wrote:
> > On 25.09.25 01:58, Alistair Popple wrote:
> >> On 2025-09-25 at 03:36 +1000, Zi Yan <ziy@nvidia.com> wrote...
> >>> On 24 Sep 2025, at 6:55, David Hildenbrand wrote:
> >>>
> >>>> On 18.09.25 04:49, Zi Yan wrote:
> >>>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> >>>>>
> >>>>>> Add routines to support allocation of large order zone device folios
> >>>>>> and helper functions for zone device folios, to check if a folio is
> >>>>>> device private and helpers for setting zone device data.
> >>>>>>
> >>>>>> When large folios are used, the existing page_free() callback in
> >>>>>> pgmap is called when the folio is freed, this is true for both
> >>>>>> PAGE_SIZE and higher order pages.
> >>>>>>
> >>>>>> Zone device private large folios do not support deferred split and
> >>>>>> scan like normal THP folios.
> >>>>>>
> >>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> >>>>>> Cc: David Hildenbrand <david@redhat.com>
> >>>>>> Cc: Zi Yan <ziy@nvidia.com>
> >>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> >>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
> >>>>>> Cc: Byungchul Park <byungchul@sk.com>
> >>>>>> Cc: Gregory Price <gourry@gourry.net>
> >>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> >>>>>> Cc: Alistair Popple <apopple@nvidia.com>
> >>>>>> Cc: Oscar Salvador <osalvador@suse.de>
> >>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> >>>>>> Cc: Nico Pache <npache@redhat.com>
> >>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>>>>> Cc: Dev Jain <dev.jain@arm.com>
> >>>>>> Cc: Barry Song <baohua@kernel.org>
> >>>>>> Cc: Lyude Paul <lyude@redhat.com>
> >>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
> >>>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>>> Cc: Simona Vetter <simona@ffwll.ch>
> >>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
> >>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
> >>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
> >>>>>> ---
> >>>>>>    include/linux/memremap.h | 10 +++++++++-
> >>>>>>    mm/memremap.c            | 34 +++++++++++++++++++++-------------
> >>>>>>    mm/rmap.c                |  6 +++++-
> >>>>>>    3 files changed, 35 insertions(+), 15 deletions(-)
> >>>>>>
> >>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> >>>>>> index e5951ba12a28..9c20327c2be5 100644
> >>>>>> --- a/include/linux/memremap.h
> >>>>>> +++ b/include/linux/memremap.h
> >>>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
> >>>>>>    }
> >>>>>>
> >>>>>>    #ifdef CONFIG_ZONE_DEVICE
> >>>>>> -void zone_device_page_init(struct page *page);
> >>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
> >>>>>>    void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> >>>>>>    void memunmap_pages(struct dev_pagemap *pgmap);
> >>>>>>    void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> >>>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
> >>>>>>    bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> >>>>>>
> >>>>>>    unsigned long memremap_compat_align(void);
> >>>>>> +
> >>>>>> +static inline void zone_device_page_init(struct page *page)
> >>>>>> +{
> >>>>>> +    struct folio *folio = page_folio(page);
> >>>>>> +
> >>>>>> +    zone_device_folio_init(folio, 0);
> >>>>>
> >>>>> I assume it is for legacy code, where only non-compound page exists?
> >>>>>
> >>>>> It seems that you assume @page is always order-0, but there is no check
> >>>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
> >>>>> above it would be useful to detect misuse.
> >>>>>
> >>>>>> +}
> >>>>>> +
> >>>>>>    #else
> >>>>>>    static inline void *devm_memremap_pages(struct device *dev,
> >>>>>>            struct dev_pagemap *pgmap)
> >>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
> >>>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
> >>>>>> --- a/mm/memremap.c
> >>>>>> +++ b/mm/memremap.c
> >>>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
> >>>>>>    void free_zone_device_folio(struct folio *folio)
> >>>>>>    {
> >>>>>>        struct dev_pagemap *pgmap = folio->pgmap;
> >>>>>> +    unsigned long nr = folio_nr_pages(folio);
> >>>>>> +    int i;
> >>>>>>
> >>>>>>        if (WARN_ON_ONCE(!pgmap))
> >>>>>>            return;
> >>>>>>
> >>>>>>        mem_cgroup_uncharge(folio);
> >>>>>>
> >>>>>> -    /*
> >>>>>> -     * Note: we don't expect anonymous compound pages yet. Once supported
> >>>>>> -     * and we could PTE-map them similar to THP, we'd have to clear
> >>>>>> -     * PG_anon_exclusive on all tail pages.
> >>>>>> -     */
> >>>>>>        if (folio_test_anon(folio)) {
> >>>>>> -        VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> >>>>>> -        __ClearPageAnonExclusive(folio_page(folio, 0));
> >>>>>> +        for (i = 0; i < nr; i++)
> >>>>>> +            __ClearPageAnonExclusive(folio_page(folio, i));
> >>>>>> +    } else {
> >>>>>> +        VM_WARN_ON_ONCE(folio_test_large(folio));
> >>>>>>        }
> >>>>>>
> >>>>>>        /*
> >>>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
> >>>>>>        case MEMORY_DEVICE_COHERENT:
> >>>>>>            if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
> >>>>>>                break;
> >>>>>> -        pgmap->ops->page_free(folio_page(folio, 0));
> >>>>>> -        put_dev_pagemap(pgmap);
> >>>>>> +        pgmap->ops->page_free(&folio->page);
> >>>>>> +        percpu_ref_put_many(&folio->pgmap->ref, nr);
> >>>>>>            break;
> >>>>>>
> >>>>>>        case MEMORY_DEVICE_GENERIC:
> >>>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
> >>>>>>        }
> >>>>>>    }
> >>>>>>
> >>>>>> -void zone_device_page_init(struct page *page)
> >>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
> >>>>>>    {
> >>>>>> +    struct page *page = folio_page(folio, 0);
> >>>>>
> >>>>> It is strange to see a folio is converted back to page in
> >>>>> a function called zone_device_folio_init().
> >>>>>
> >>>>>> +
> >>>>>> +    VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>>>>> +
> >>>>>>        /*
> >>>>>>         * Drivers shouldn't be allocating pages after calling
> >>>>>>         * memunmap_pages().
> >>>>>>         */
> >>>>>> -    WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> >>>>>> -    set_page_count(page, 1);
> >>>>>> +    WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >>>>>> +    folio_set_count(folio, 1);
> >>>>>>        lock_page(page);
> >>>>>> +
> >>>>>> +    if (order > 1) {
> >>>>>> +        prep_compound_page(page, order);
> >>>>>> +        folio_set_large_rmappable(folio);
> >>>>>> +    }
> >>>>>
> >>>>> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
> >>>>> is called.
> >>>>>
> >>>>> I feel that your zone_device_page_init() and zone_device_folio_init()
> >>>>> implementations are inverse. They should follow the same pattern
> >>>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
> >>>>> zone_device_page_init() does the actual initialization and
> >>>>> zone_device_folio_init() just convert a page to folio.
> >>>>>
> >>>>> Something like:
> >>>>>
> >>>>> void zone_device_page_init(struct page *page, unsigned int order)
> >>>>> {
> >>>>>     VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>>>>
> >>>>>     /*
> >>>>>      * Drivers shouldn't be allocating pages after calling
> >>>>>      * memunmap_pages().
> >>>>>      */
> >>>>>
> >>>>>       WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >>>>>     
> >>>>>     /*
> >>>>>      * anonymous folio does not support order-1, high order file-backed folio
> >>>>>      * is not supported at all.
> >>>>>      */
> >>>>>     VM_WARN_ON_ONCE(order == 1);
> >>>>>
> >>>>>     if (order > 1)
> >>>>>         prep_compound_page(page, order);
> >>>>>
> >>>>>     /* page has to be compound head here */
> >>>>>     set_page_count(page, 1);
> >>>>>     lock_page(page);
> >>>>> }
> >>>>>
> >>>>> void zone_device_folio_init(struct folio *folio, unsigned int order)
> >>>>> {
> >>>>>     struct page *page = folio_page(folio, 0);
> >>>>>
> >>>>>     zone_device_page_init(page, order);
> >>>>>     page_rmappable_folio(page);
> >>>>> }
> >>>>>
> >>>>> Or
> >>>>>
> >>>>> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
> >>>>> {
> >>>>>     zone_device_page_init(page, order);
> >>>>>     return page_rmappable_folio(page);
> >>>>> }
> >>>>
> >>>> I think the problem is that it will all be weird once we dynamically allocate "struct folio".
> >>>>
> >>>> I have not yet a clear understanding on how that would really work.
> >>>>
> >>>> For example, should it be pgmap->ops->page_folio() ?
> >>>>
> >>>> Who allocates the folio? Do we allocate all order-0 folios initially, to then merge them when constructing large folios? How do we manage the "struct folio" during such merging splitting?
> >>>
> >>> Right. Either we would waste memory by simply concatenating all “struct folio”
> >>> and putting paddings at the end, or we would free tail “struct folio” first,
> >>> then allocate tail “struct page”. Both are painful and do not match core mm’s
> >>> memdesc pattern, where “struct folio” is allocated when caller is asking
> >>> for a folio. If “struct folio” is always allocated, there is no difference
> >>> between “struct folio” and “struct page”.
> >>
> >> As mentioned in my other reply I need to investigate this some more, but I
> >> don't think we _need_ to always allocate folios (or pages for that matter).
> >> The ZONE_DEVICE code just uses folios/pages for interacting with the core mm,
> >> not for managing the device memory itself, so we should be able to make it more
> >> closely match the memdesc pattern. It's just I'm still a bit unsure what that
> >> pattern will actually look like.
> > 
> > I think one reason might be that in contrast to ordinary pages, zone-device memory is only ever used to be used for folios, right?
> > 
> > Would there be a user that just allocates pages and not wants a folio associated with it?

I don't think so, other than of course zero order folios. There's probably just
some confusion due to a page and zero order folio are not being different at
the moment.

> > 
> 
> A non-THP aware driver use case would be a potential use case for zero order folios (also pages at the moment). 
>
> > It's a good question of that would look like when we have dynamically allocated struct folio ...
> 
> I think for dynamically allocated folios we could probably do away with pages, but not 100% sure at the moment.

Yeah, I'm not 100% sure either but that sounds about right.

> > 
> >>
> >>>>
> >>>> With that in mind, I don't really know what the proper interface should be today.
> >>>>
> >>>>
> >>>> zone_device_folio_init(struct page *page, unsigned int order)
> >>>>
> >>>> looks cleaner, agreed.
> >>
> >> Agreed.
> >>
> >>>>>
> >>>>>
> >>>>> Then, it comes to free_zone_device_folio() above,
> >>>>> I feel that pgmap->ops->page_free() should take an additional order
> >>>>> parameter to free a compound page like free_frozen_pages().
> >>
> >> Where would the order parameter come from? Presumably
> >> folio_order(compound_head(page)) in which case shouldn't the op actually just be
> >> pgmap->ops->folio_free()?
> > 
> > Yeah, that's also what I thought.
> > 
> 
> Balbir
