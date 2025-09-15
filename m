Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E343B56F08
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 05:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2942310E0A1;
	Mon, 15 Sep 2025 03:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WGVKqotF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790B710E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 03:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+NdNkiWY6WVynb55/4CZq9Z4wDHnvFkKhYJG/t2x/JxDLSTNZMgSOzVxxxnHCNKl0KHmumhg5tAPoF/xCi390fiqOzAgA+R9JgkrlbHiLDxceGVfQiSFBu1h7TUZLEaQvkOwtBEt8/156qWcQqee7KfWVf6aNT6wOfwIZMCPnXEQr0BAuVnpeUECKsxKtT8Si0E+4eKExxwwSXr64CCQDXgg/5ZMF4u2BlbWHSsddOjuKtybCNsFEse0k6fH2YMn4qO2T+nU5b6nTKIdT/96gEnTb2ok204UTXqQuCrq6MIn8SLjUwZAyww/47/ZenvbB2c7tOUHGWnADQ9ykq4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+SK7A/S70rWgmPihLFGkzc4R5Xirr1BBGMdpiFzhHk=;
 b=UnWWxkrhdfA0DKw/JP6VmooNN/PqW3Y8HXhKtrggvJIiJ4ZzDNajYWymEeMw0DwdVoeCCyLiflkMk5ux9VkjhkCJN5eUbkyR7GHnAFR5ncrGGRvHFh3ZTZJ/C0rHi0k5q0E22k7Bh5IU6csTMTTIFW41JhDAtq8lU0WnKmAUvw2/MDj9Xrx4kBCyssWO5ARM9pDRL/b6EOcl3M87Kp7em1ll71j6S7/PlDj5nVbaaducptqnPOIhPMIVnCdY6BBvS684+G3BKEpKdsN6PyZMNBAr2pYQSAfXXZhI5wxC4SJKDF72xdotjDMxTnmUORuEqLAVul8A9R/UQ1auBk1+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+SK7A/S70rWgmPihLFGkzc4R5Xirr1BBGMdpiFzhHk=;
 b=WGVKqotFtMr9iQMz+3Gap/uZbo+eWZfWFLwBlJl9OPoBqBJMoF3A6Zg8TFbCWSUlrlVMZkjawQ27eYpY7WuHPoLH9It4l72QDTeh71GaOO24pbrzyHtfD98vNq4IxkXgwDpKsBiO0QniuktCCz1BsfIqlDhYpkRdbgZBV0Ht4oYsDFS/Rc0OsTesW3d2VnJP3uJ7ccYrKtKlvlKp0W9nPloaIB6LHXqDFp5HJq8G+lu/IfoK2koRVjU4CUmbRYp8tYD5nMEesGLe6skCg85C+GLJAjfv1pfmuZCsxBgLwSVBmVPgY8TkT6lJCfTQ/ZeSkxDFgF0ne2Tg9i1fAEuvRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 03:54:09 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 03:54:09 +0000
Message-ID: <dbb631dc-32d3-4b2d-a23c-968c7a61001c@nvidia.com>
Date: Mon, 15 Sep 2025 13:54:01 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 04/15] mm/huge_memory: implement device-private THP splitting
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
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
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-5-balbirs@nvidia.com>
 <ca592d4a-3e91-48ea-970e-a5ff12f215be@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <ca592d4a-3e91-48ea-970e-a5ff12f215be@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: e576227f-657a-4823-d049-08ddf40b8624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHNVU0Z4MDJnU0hnTDkrTUtGUDlRL21abzVzRFpWOWlFbkZXN3RtUk5RcVBO?=
 =?utf-8?B?cE92TmlMOU9rMmdZYnU5TlMrRnpJdllMdURUazlIUmFtQTVpcXhnaVk3Y3cy?=
 =?utf-8?B?ckF1SHJ1dWtUL3N4M3JpSnhIaUJSN25BcmRJSUpKakMxZ3BwSm9yV2dxZmN0?=
 =?utf-8?B?dUkvVGZQWHJYdFc5WlZ5ZEZ2NE5ob0V5N3lyR3lmZWtDcDJXZ1JUL1JRcHFF?=
 =?utf-8?B?WHMrbzJocC9tOWRrNHhWSXkraUdUSTIzQ0NEQ2Q3dVlqT0VrNXQxaElhQzZ2?=
 =?utf-8?B?ZUtKcjJUQ3QvNmtnazFEdTZSOXJ6YkZnbkJaYnFydVkvK1R5bFg0TlBYSzFF?=
 =?utf-8?B?QmNUbEo3T2hIcDZTTE9GQ1NkRngxMlBVTXJLTlk0ZGtzcnpBYTk4UkVSa1F0?=
 =?utf-8?B?SHBkNjhsM2N2U3dxY1l4N3hGdU9hZjBYZktXRm5MTWpuMjZPUHlZdjZFVnhV?=
 =?utf-8?B?UTRWQ0c5eVBlOFBhYlpvVUJtUUZrNHJXdHozRFNaSXFZVWRPelIzTGRtTEFU?=
 =?utf-8?B?V0pleUZwVVhzNTN5WUQ1b25QalZIU3VLTWJwNGN0bnNIRGd4dEJCa0RSMzhK?=
 =?utf-8?B?Y1pTNHVPd0t1VGZyMnlxYXdMTXNpZTkzM2tKREx5M0lEenE5Z3ZSMktpblJR?=
 =?utf-8?B?ajQ5c01JNENld1dYRXVTUWdDRFpaNWNEeVVkS3NLTFdDdlVTYWdSOXIyK3lF?=
 =?utf-8?B?Z1Z5R2JZWHI4Q0Fka2x4RUk0NlpiMWsvTnlKNDFTR1Yza2dwZHpidzgvQ2ZW?=
 =?utf-8?B?TWZlbG81MmxvTDFVc2hVSUk0TU1ZNldUQmw1Q3V0NjBlVmUzSHJTU0dmOCtV?=
 =?utf-8?B?emRNc2IyaEJyY01jNWhueEFDZkJ1NlFMUlY4STNkVjRXMU5sRUY4T0M5RnFh?=
 =?utf-8?B?VDlBUFNmMkRubk9MUlo3ZXZTcDZCcWRJRGZZYVFBMlBxSWZRNE5DSittQVpV?=
 =?utf-8?B?aG53RGFqOGg1Rmd3NkU2MHVvOU1sOE5CSm9DV3duQk9zZW9hQXB2bjA4VFF3?=
 =?utf-8?B?VUtFa2ZkQ2ZnU1JtYnBvRkJqd0VlY0FOczVVSElFWGxXaUtQQ3N4bk5CZ2FZ?=
 =?utf-8?B?anRjQ2tUdUVuRVdPSWxQbWcvdDg4ZERJdXJiYnlRTEIvdGd1YVJaNktqNEFS?=
 =?utf-8?B?WlczNEI0b0FlSWNzbGJtMjQ1bWRzMFJnb3ZjWGVteDZldDUzdU8xUC9oT0NP?=
 =?utf-8?B?eXBFSDBBVWlKaE8waENVWUxPbWFQMWZ6YUlIdXU1anYvbkZuaVVTTXBFNWYw?=
 =?utf-8?B?YnVEUWFrNThmdWtYaS94ZW9sZ0NkbGs4bFlWcXF6em1QQTZzK0dYYlFlRk9X?=
 =?utf-8?B?bkMwbWxwbXZEN3NNRklWZEZPTnVKYTA3YnE4QUlqQlRNRW5RRFpJaEZHV1RG?=
 =?utf-8?B?bmhIS20zeTV2bW4zS2VWcS9kZVl5dHA3WG4zTDB6eUdzcGJMckJCZFNoRWQv?=
 =?utf-8?B?V0VzRkxvVnJ3UDRnNEJmcUZKNXdnVW9raWovT09IczNaRlJaancwSkgzT25i?=
 =?utf-8?B?TWN3VG5LcVlGdmJ2QlpmOGcrZFFhb09BRmlMcmxDRVl3VGkrVUNWQWRxUWVB?=
 =?utf-8?B?SXBBUUNWSVFWdU1qcWFLcTlrV21ORWlTTnlFQjNLanp4TGczdHVId2YzbXhr?=
 =?utf-8?B?Wmt2NHhBaGt6L1BkSGx0UkZ3aTM0bHpKS3BVOHpDbzZ4Q0JEcjhRRmZFVzI4?=
 =?utf-8?B?MzZNSG0xKzE4MW85QVNQVld0VHl4aTk4bkFJQzdMS21rSmg1T0tXZGVIcUIx?=
 =?utf-8?B?c3NZRk01RThwRUUvbjZUNWx5VEFjN0NuaDFCc1VOTHRHbG9FUXFSdzdjS1k1?=
 =?utf-8?B?NldwUFdaVWpyNW5ublJtUnM3Y0d4SnIxanBPYUlSOE5CUjYrNStOd3pxWlZa?=
 =?utf-8?B?bzAxbzU3THZNTGJJOERiUVhWZVM2bmxuejk3bGhva0xKWU1acmN2TitEMjRi?=
 =?utf-8?Q?v4ZAfI6nGhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXMzTGVPajV5K0laOUNIN1U5TjNTSTBtc01QbHg0K0t5Qk9qYmhCakIyWTJC?=
 =?utf-8?B?cUtxYjdOU1dhbndaRWJGZnl1Q1ZSczc0WWduMjJLL0wvOWx0N1dwdDlLbmFQ?=
 =?utf-8?B?MGdZMDNkRDUrOUNIYVVDcHZQMGtvam9jd1VZdURwMm1Welh4K2lrRjdJWEZ3?=
 =?utf-8?B?V2dGcGhxYTRDWWRhbGJEU0NDTkhmb0ZCakErSC9HS2JwUXEwa3IzVHBaQmRW?=
 =?utf-8?B?a3F4WFNDWVNsQWFHT01IVmU1bjNZS2hKQjhneXZ4eTc3RTFSM2crT0VqRnpT?=
 =?utf-8?B?UTkyTVhlQ0tXbnFWOXpydThYMTZSakZ5UU1KYjNiY09pRGRXOUpWV3U2NGVC?=
 =?utf-8?B?dVNhaU02NDJHdllKczJlNmJkaTdueS94ck5hVU5PZ2dtQnZld1pYNTZVSDA2?=
 =?utf-8?B?aVpQbzZDUHUyMHhodWFXdlN4dTkzbFR1Q0pwZmhzREtqd0pESHppMDhGMVlN?=
 =?utf-8?B?RU96R1dJa2NTWjdGQ2F3dGNiMndRdFlaclRIMGJoekZVY1M0NXM4ei9DeWtQ?=
 =?utf-8?B?TVhpOGpBeVZ3MjY4dHl0c3JtZk9Yd0lyWjdmeTc5YWVOZWFiSGQxMEpXdXRE?=
 =?utf-8?B?cHdxWDZ0dDFOOStmSUMyaFdhaGoxOXE2Mk1PV2FUeG5wMGt4TWxoOGxhdjlw?=
 =?utf-8?B?V0xJdUJSN1JFdFBuNU9tYjlwYk1qMTlMSEt5UmdGcjh5WmJqWkNpbENuYkd2?=
 =?utf-8?B?Tm5ISDlRZEdWa2U2Qm5MTHhTSk01bTBDV0dwU082VDN1S1FkanZSaVVvbWdL?=
 =?utf-8?B?cjFmcUtLZDlWZmpRQkxiM1NWTTN5ajBMNjMwKy9HMi95dFFmWGY4RU04UjJ5?=
 =?utf-8?B?VXpWeDNZY0Fac0R0MzZzR1ZxQUMvbXdLczhmRmkzNXM5OGRvYVFUZzRXcXpx?=
 =?utf-8?B?cWR1RXFuVXlwalVYVkdkR25PelZIUW13Q3lNd0x6dWl1VWJScEd3R1hZdExE?=
 =?utf-8?B?eGdLai85RVRGRHBtdXNxZjMrcmNkTS8yQUM3OThaYlhIZGozMnhWMWlnZkxW?=
 =?utf-8?B?S3ljcy80dm9rbTFMQ1RjUkR5bXdYNjRBOGNMeHo4RlBSMS9DRVFSbWZDa3RT?=
 =?utf-8?B?Yk5MWW8vcWRVdHRiZVRsVSsxYS8wUXpHZXcyRHRSYzFWZXB5NmUxLzRoNUhN?=
 =?utf-8?B?MzlLYzh5UVluY21hWmhJVUM4V1IrdGlXdTdDaDJGZThjYk5PZ3FLN1Z6Yksr?=
 =?utf-8?B?MGhBekNrSlVzcUplSklZZ1o3cyswRC9Ba0pYS1Q1dXM5UU5LOGtWV1JFK3Uy?=
 =?utf-8?B?ZHk0Qk9PR1N4Y252VkI5NHVMMGVMWVJmQngvUmNjei9GUTAzd2h1L25FQTNW?=
 =?utf-8?B?QngxUkl1TXNvSTI3ZTJEZG80RC8zWjlIcXpPSmlJSnQ2emUyTThwaUkrQVJq?=
 =?utf-8?B?clkzYUZyRWF0MGRmeG9HM3RSMDdJWHNBMVZMUTYyWGp5MjlPMkI1RXNKOCtJ?=
 =?utf-8?B?d2N5Ky84U2FpR09JQTNRMFpyNEx6M005S0ZhaTZTdDc5VVU5dVBKSmJtbUJR?=
 =?utf-8?B?K0d4eitsUTBZSjRQdVlWKzdaUE1lRS9NNUdiMlJIMWh0R1ZnVGxmSlVoZXpn?=
 =?utf-8?B?K3o0VmxGVStGZ0pCWWF2WXZqMllMNUZIZVJJN1QwMDFOOTViK0h3U0ZzQXZM?=
 =?utf-8?B?T2g0SG9CQ2ViWkxtbmVWRUNjSERXQ2VXaXdqWWtuelhjZ003SndueXVvTlU2?=
 =?utf-8?B?dmYrQkxxN2dPTUFsemFQbkY4amNVM2ZmWWVFcUdrY1JGRVRpQmFZenpFRlla?=
 =?utf-8?B?ZTVFZFdFWFB4WHhORlpESmlYV3ZyMkE4STRDZ1ZtaXB5a3ZuSnhzdHFGWENK?=
 =?utf-8?B?MDVQck10RVFLV1E2S2V2eTJjSTRtUGJ6VENnaXpiZnJMS0RqUWpwUHhMQm9z?=
 =?utf-8?B?ZWo4aHBXM2RJdFM0cWpkaTB6dEd6ZjNlWldIcFN3Sk9EaUlaTWFMbUZKN25S?=
 =?utf-8?B?UUNja3h5VWVIZUJGWnNSRW84Y2szZ3RTQ2xrekhsRkRlc2ZURzZZOUdPNk9M?=
 =?utf-8?B?dlp0MzBDSXRNcTFmWU4rNWQwbDYreVlkdVdxMlZtVzYwSFc5MWhDTVNlMkw5?=
 =?utf-8?B?RHNNMFdWVkVjR1dZK0NKSnhZOGx4Y09UTXcwanZXL3puQm51Y3ZNTjZjWkJ1?=
 =?utf-8?B?NkF2Q3YwVXRvSVYzMTUyL295OWUvQkVFUTlwL25xYTRSSFdJb3RCaHluL1Rl?=
 =?utf-8?Q?g35v79lG2TR8W23PnNvl7hgZf8gTkftA98KuAURG0vIg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e576227f-657a-4823-d049-08ddf40b8624
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 03:54:09.2151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMf8vdGhLW9v647SmEW7CVd5GJJGLwYU8vXJFTMa5M0f39inW9gKOpePV2gIymJ1SU/4iCAzhAYv7tZOEBcqXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919
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

On 9/11/25 22:31, David Hildenbrand wrote:
> On 08.09.25 02:04, Balbir Singh wrote:
>> Add support for splitting device-private THP folios, enabling fallback
>> to smaller page sizes when large page allocation or migration fails.
>>
>> Key changes:
>> - split_huge_pmd(): Handle device-private PMD entries during splitting
>> - Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
>> - Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
>>    don't support shared zero page semantics
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
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
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   mm/huge_memory.c | 129 +++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 91 insertions(+), 38 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 337d8e3dd837..b720870c04b2 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2880,16 +2880,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>       struct page *page;
>>       pgtable_t pgtable;
>>       pmd_t old_pmd, _pmd;
>> -    bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
>> -    bool anon_exclusive = false, dirty = false;
>> +    bool young, write, soft_dirty, uffd_wp = false;
>> +    bool anon_exclusive = false, dirty = false, present = false;
>>       unsigned long addr;
>>       pte_t *pte;
>>       int i;
>> +    swp_entry_t swp_entry;
>>         VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>>       VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>>       VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
>> -    VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
>> +
>> +    VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
>> +            !is_pmd_device_private_entry(*pmd));
>>   
> 
> Indentation. But I do wonder if we want a helper to do a more
> efficient
> 

The indentation at my end is fine, do you mean you want to see the conditions aligned?

> is_pmd_migration_entry() || is_pmd_device_private_entry()
> 
> If only I could come up with a good name ... any ideas?
> 
> is_non_present_folio_entry()
> 
> maybe?
> 

There is is_pfn_swap_entry(), but that includes hwpoison entries as well.


> Well, there is device-exclusive .... but that would not be reachable on these paths yet, ever.
> 
> 
>>       count_vm_event(THP_SPLIT_PMD);
>>   @@ -2937,18 +2940,43 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>           return __split_huge_zero_page_pmd(vma, haddr, pmd);
>>       }
>>   -    pmd_migration = is_pmd_migration_entry(*pmd);
>> -    if (unlikely(pmd_migration)) {
>> -        swp_entry_t entry;
>>   +    present = pmd_present(*pmd);
>> +    if (unlikely(!present)) {
> 
> I hate this whole function. But maybe in this case it's better
> to just have here
> 
> if (is_pmd_migration_entry(old_pmd)) {
> 
> } else if (is_pmd_device_private_entry(old_pmd)) {
> 
> There is not much shared code and the helps reduce the indentation level.
> 

We can definitely try this

>> +        swp_entry = pmd_to_swp_entry(*pmd);
>>           old_pmd = *pmd;
>> -        entry = pmd_to_swp_entry(old_pmd);
>> -        page = pfn_swap_entry_to_page(entry);
>> -        write = is_writable_migration_entry(entry);
>> -        if (PageAnon(page))
>> -            anon_exclusive = is_readable_exclusive_migration_entry(entry);
>> -        young = is_migration_entry_young(entry);
>> -        dirty = is_migration_entry_dirty(entry);
>> +
>> +        folio = pfn_swap_entry_folio(swp_entry);
>> +        VM_WARN_ON(!is_migration_entry(swp_entry) &&
>> +                !is_device_private_entry(swp_entry));
> 
> Indentation.

Same as above, checkpatch.pl does not seem to complain

> 
>> +        page = pfn_swap_entry_to_page(swp_entry);
>> +
>> +        if (is_pmd_migration_entry(old_pmd)) {
>> +            write = is_writable_migration_entry(swp_entry);
>> +            if (PageAnon(page))
>> +                anon_exclusive =
>> +                    is_readable_exclusive_migration_entry(
>> +                                swp_entry);
> 
> Single line please, this is unreadable.
> 

Sure, will do, I double checked and it seems like 100 columns is fine as per checkpatch.pl

>> +            young = is_migration_entry_young(swp_entry);
>> +            dirty = is_migration_entry_dirty(swp_entry);
>> +        } else if (is_pmd_device_private_entry(old_pmd)) {
>> +            write = is_writable_device_private_entry(swp_entry);
>> +            anon_exclusive = PageAnonExclusive(page);
>> +            if (freeze && anon_exclusive &&
>> +                folio_try_share_anon_rmap_pmd(folio, page))
>> +                freeze = false;
>> +            if (!freeze) {
>> +                rmap_t rmap_flags = RMAP_NONE;
>> +
>> +                folio_ref_add(folio, HPAGE_PMD_NR - 1);
>> +                if (anon_exclusive)
>> +                    rmap_flags |= RMAP_EXCLUSIVE;
>> +
>> +                folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>> +                         vma, haddr, rmap_flags);
>> +            }
>> +        }
>> +
>>           soft_dirty = pmd_swp_soft_dirty(old_pmd);
>>           uffd_wp = pmd_swp_uffd_wp(old_pmd);
>>       } else {
>> @@ -3034,30 +3062,49 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>        * Note that NUMA hinting access restrictions are not transferred to
>>        * avoid any possibility of altering permissions across VMAs.
>>        */
>> -    if (freeze || pmd_migration) {
>> +    if (freeze || !present) {
> 
> Here too, I wonder if we should just handle device-private completely separately for now.
> 

For all practical purposes they are inside the if statement. freeze and is_migration need to go together.


>>           for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>>               pte_t entry;
>> -            swp_entry_t swp_entry;
>> -
>> -            if (write)
>> -                swp_entry = make_writable_migration_entry(
>> -                            page_to_pfn(page + i));
>> -            else if (anon_exclusive)
>> -                swp_entry = make_readable_exclusive_migration_entry(
>> -                            page_to_pfn(page + i));
>> -            else
>> -                swp_entry = make_readable_migration_entry(
>> -                            page_to_pfn(page + i));
>> -            if (young)
>> -                swp_entry = make_migration_entry_young(swp_entry);
>> -            if (dirty)
>> -                swp_entry = make_migration_entry_dirty(swp_entry);
>> -            entry = swp_entry_to_pte(swp_entry);
>> -            if (soft_dirty)
>> -                entry = pte_swp_mksoft_dirty(entry);
>> -            if (uffd_wp)
>> -                entry = pte_swp_mkuffd_wp(entry);
>> -
>> +            if (freeze || is_migration_entry(swp_entry)) {
>> +                if (write)
>> +                    swp_entry = make_writable_migration_entry(
>> +                                page_to_pfn(page + i));
>> +                else if (anon_exclusive)
>> +                    swp_entry = make_readable_exclusive_migration_entry(
>> +                                page_to_pfn(page + i));
>> +                else
>> +                    swp_entry = make_readable_migration_entry(
>> +                                page_to_pfn(page + i));
>> +                if (young)
>> +                    swp_entry = make_migration_entry_young(swp_entry);
>> +                if (dirty)
>> +                    swp_entry = make_migration_entry_dirty(swp_entry);
>> +                entry = swp_entry_to_pte(swp_entry);
>> +                if (soft_dirty)
>> +                    entry = pte_swp_mksoft_dirty(entry);
>> +                if (uffd_wp)
>> +                    entry = pte_swp_mkuffd_wp(entry);
>> +            } else {
>> +                /*
>> +                 * anon_exclusive was already propagated to the relevant
>> +                 * pages corresponding to the pte entries when freeze
>> +                 * is false.
>> +                 */
>> +                if (write)
>> +                    swp_entry = make_writable_device_private_entry(
>> +                                page_to_pfn(page + i));
>> +                else
>> +                    swp_entry = make_readable_device_private_entry(
>> +                                page_to_pfn(page + i));
>> +                /*
>> +                 * Young and dirty bits are not progated via swp_entry
>> +                 */
>> +                entry = swp_entry_to_pte(swp_entry);
>> +                if (soft_dirty)
>> +                    entry = pte_swp_mksoft_dirty(entry);
>> +                if (uffd_wp)
>> +                    entry = pte_swp_mkuffd_wp(entry);
>> +            }
>>               VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>>               set_pte_at(mm, addr, pte + i, entry);
>>           }
>> @@ -3084,7 +3131,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>       }
>>       pte_unmap(pte);
>>   -    if (!pmd_migration)
>> +    if (!is_pmd_migration_entry(*pmd))
>>           folio_remove_rmap_pmd(folio, page, vma);
>>       if (freeze)
>>           put_page(page);
>> @@ -3096,8 +3143,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>>                  pmd_t *pmd, bool freeze)
>>   {
>> +
> 
> Unrelated change.
> 

Will do

Thanks!
Balbir
