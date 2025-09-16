Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72ACB595F0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5F110E772;
	Tue, 16 Sep 2025 12:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gusJhDR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013020.outbound.protection.outlook.com
 [40.107.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0389C10E0C7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F80E/r4+lxwTMNtORvLIDH8VSSXlmbCozFbGI5otJF60K4xkMJyO9I2NpR/0dPuSn5Ht8T8Mlu4jf0wbNb56u3w4bmoXh5PIhoOMC9PrON1HxXnGG56USrQF/ic06rZV3L2INORylKBd7EYML/QWCI62izL3qfO3iEIUdXFymezlBMRCY0exR/eyFqYKbphwPPPFTKf++uTVfQxVj96uM5tQf8WLzo0fOKvSH/al3I/bkbPiTb6zrbvdSZQ2C3sX9c0PSdOohkLSXD0Wg67sXiq2+Swgy7b0F7kUcs9N0LQ//eBuzhipxry1vbs/Jegf6PHGqQ9rq+3vC1zm+ADe2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4Z1JGU4KgRYcKflrtXzYaSY6matRUuT2y6jsKDdqeM=;
 b=HKdebTQvEqYkRqQvBqKv57BietSelqBg+IYapZxPXXzkY+MlCFItCElzQjPmtlb0PnPxIMDAi/DpHyApvvuovVQaz8GNrL99m/SByqj1s02FTDRVfwwSmmwR9t8bMOu4Ran4xx+fIzI96W4ta6DlSB2+zd7HmSGCxQLJol1Agb3yCnoqcck63HwD7lAZ4PC3heT0ZqEXUcQn+xc7E1ecXUgcqoguP47rasTLCv9fJEWSAiY/oiIyRiFWjiRfN/uOAsj9uCEEvhJm1o/uSTqTWGPpX1O21moRHMKnFbwxW3szcj21G+KIf1IWli355C8UJi4MmUbbkLY5nKrZZJkVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4Z1JGU4KgRYcKflrtXzYaSY6matRUuT2y6jsKDdqeM=;
 b=gusJhDR4gn/1ba3Cmuwd2lSv4jlZQmECULUkDpXy5EkRpCsJFkOSEJjOhZHjn0JgXtUOuSJGMnhluB4i5iA7YBQ5QkZjh24iE9gPSmpw9FOvVnceVu1LFMTT4CkkzyGySdtziYjRFF5q12dE+Kjj6H7PBnxY2YRKHrV5qL8kSiiySOVrj/VsBv+Ria3twcUPhBRPKeafZ1cq0ZWv0oAVmDc5Z0a7zPcWeNOrwk3DDWIbry/ObWd30xojjaoWakPLZCG2U1aUtEpJZXhAg0GX1qX+e3g7eQwp71fW49/42Gx1NL9v9Jjw3XDu4b+p4akU/OHcYzt12xcpucYMLRXggw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 12:21:39 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:21:39 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
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
Subject: [v6 01/15] mm/zone_device: support large zone device private folios
Date: Tue, 16 Sep 2025 22:21:14 +1000
Message-ID: <20250916122128.2098535-2-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0051.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20a::14) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: bde819f5-9727-423c-4b03-08ddf51b9654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzRzbXJmZHhJUHRCK2RZSFF2bzJsNGRzREpuTUVBVnlvSGtyS09nY1lqN01r?=
 =?utf-8?B?VGg5SW54YzR4VWdxNzE1NUozTVoydzREN080WFB2WHI0L3puTGR4WUpKc21J?=
 =?utf-8?B?Q2d2aXduK1hsUi8xNDJScUNya3hybisxVTlKQzllYWJtdWc3cENVemR2dXdK?=
 =?utf-8?B?ZHRjc2ZGOHNYTFVWSTlQdWhVa2lJT2lKMU9VWXZmL3hKZDQ0SS9LdW9DTUVG?=
 =?utf-8?B?TXVFenh4UEs5anQ5UldHWW41WjVWdXhJdE9wZHIzejNoeXpCTlN0SytoQzl1?=
 =?utf-8?B?ZlBOamtQTHpjaHZxZjlDcWQzS0FYYnM2UUh2YTVjS0xYM3VOZG1qRlN4ZlZ1?=
 =?utf-8?B?U2V1cUhoTE56Y2lmTXorRVYxT0w4dzE5NUdQeWNVOVBDSzdLMTdMYWFkM0ds?=
 =?utf-8?B?SlF6b2R2QWtSay9wRk9PdUpWdHZwQmxtNnRPRXJwTkdYc2pzR2V5V3pGZTVt?=
 =?utf-8?B?QnJTSzFTYi9BSUI5WTBsNFhiWlljWDJhUjV0cGNwdkVQWEZ0cEFUc2Y4MWlj?=
 =?utf-8?B?Y3RIWS9HOHBwWldGZzFsOVFnbzV2NTArUzNBVDdBWWJZRFVqdElBeExDTWxs?=
 =?utf-8?B?UGJvMXdyVjFaQklQTytEamJMNzBIU0w1MUVtOXpGYnNwdzRQaC9zR2dFb2pt?=
 =?utf-8?B?d1ZLL3Q1U2IzMVFtWjhPYUFKNjI1ekx0RnRuZXAzeTNEME1YelVnK25WamxI?=
 =?utf-8?B?enZEdzQrZmpmWDRKRzJmUUsvOHhqNU1oVU9jNnpQL3lkczEzQ1N6ZWtQQnNL?=
 =?utf-8?B?VG0wYnZQNnd3d3ZjeGZJWEJNL2pFS3lHNEdSUzgwU3JRckY0NGFBbjBJeVFq?=
 =?utf-8?B?WDM3bUJiSmhjSnhMUThLN3Vmdk9qL1g0aEh4WEN6SkN6UTdvWllhN01SZERF?=
 =?utf-8?B?bmg2SE94L0sxS0Z1VWc3YkVhRk5ka1U1c2ZDRjhBc2JjZFpUdzNHVXNPRFB6?=
 =?utf-8?B?QnNCMzRRT2xGaXZiODVvaFBCOTZTSkljTVJFaG40aWxyeUVkY2hGYWU5cEJC?=
 =?utf-8?B?akU4bDN0cGRCWENjeVZCV0hUZHJUazRYRnVJZXBIRjM2TVUvS0VBYlBkcDlU?=
 =?utf-8?B?NWhCakZyaVRBRTFrZS9tY2lya1NTRk13eDR5Z01tc1RmK2xkcDdXWDZneFpk?=
 =?utf-8?B?ZS92OWpqRStkc2lMQWRBcUZ0VmNHL1JFaGwwSmthTmNjZDI5STArOTQxK2Zw?=
 =?utf-8?B?NVVYMkZSYmFzZ0xVeDM5TXMzbkhXb1JRam5VMWQxaEVSZFZsSWpHTk11Szhp?=
 =?utf-8?B?Zzk4V0djc2F0ODVzc01HSnJjOHF5N2hkNnRFSnFkcGRwb1EwaXQvM1JvYTRu?=
 =?utf-8?B?VzZHMFV1cUdFRWU4UFJzSkRJdE1pMGpxclZPdnFWZFVTbGtiSkRmcGUzdS9W?=
 =?utf-8?B?NWZBTHBpTXZxYjVidHFGQ3c1RlN5MFRQd0ZWREFRZVc5ZUhxUjl2dm5kcWxO?=
 =?utf-8?B?V3YyUU9JVXRzMktWU3Uyd0x4b1lKc0RFa09BNlp1TFFidW5FL0dqYkNTMWFv?=
 =?utf-8?B?Y0dIQVRXZ0FUeGMrQmVhRG5wZ0JLSDhqY0pZNEgvQUI3bndKMmQvRDlNcFVi?=
 =?utf-8?B?bE5rRzNtbEJWdVA0TEVWSDNOUmdpMDlDL1JEUHdFUGpqR25wQXFnSXY0Wk4y?=
 =?utf-8?B?UEFTSE5Wei9pbHZJYVNWRVRyWnp1NUZiU0NqY0pBS0hyMFNTNDg3RXh2VXE3?=
 =?utf-8?B?UU9saEFHSTUxTkxxcnFyZ1FoWXRaMVJ1T1VOVnArYTBnMFZWUzFVVmlrdThn?=
 =?utf-8?B?U3ppSFRTSlZqY0NSQjhFWlY5S2c3QWpPVzN4YXFqKzdGUmxnUlEvNlE0Vk9q?=
 =?utf-8?B?WTh6MUNxOE9tTktpOTdXZWZvYUJZT2NhODdJN2F4c2o2NUZVMndnT0IwSnZL?=
 =?utf-8?B?cFNVSkdhSkNycXlGckdrU1k1MURuMThaMTY4SDlobTZkdWZ4cUdhVkJhS2xl?=
 =?utf-8?Q?5lCjl8v9r/U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFPWUw0RDAxK0VQTS81RWNCUXk3aDY4dTcvemltWldUUjhFY256TTRFUlFs?=
 =?utf-8?B?NWZ6Sm1aMHh2UndWbGZsNkpLMUVCdlQxOVBXd0VwdTFkVGVvVWk5SzZxLzVW?=
 =?utf-8?B?dnFsWUYwUXNMb2VDSUt6ZmtmQXU0aEQ4Nm5ZQ0JaN01xTy82dU0yT0VsVEN1?=
 =?utf-8?B?N25TN1lyWGV2OG1oOTVMQ0o2ck0xVEhXMUJaVmFHTk4yVzljazJzVnNWYTA5?=
 =?utf-8?B?RjA2amYrbVFKK2tuZXFQaGpqSGozRVh0VVZXMkdTc0xvUFk2Q3l4OUtkcjI2?=
 =?utf-8?B?Tkk0MnBRVXpsM3Zvak9VOGNDbHdIbTdkaTJCZm9ic1ZMUkdXTGN6N0M1RTJv?=
 =?utf-8?B?Z24xOVYzRkNkeHUxVytsbXY4anBINDBzU3ZDSmt5eWVQNGtZcmQvSlB6bVpK?=
 =?utf-8?B?bUhYVytTVnNiZTBpZkIzVTI3R2d3QzAvTlpnN3Q4UmJJdjVRS2tnUHlMbzhE?=
 =?utf-8?B?cEZJYXhMZnVVd2RGQnNVT3NnZWtUYTNYTVlVZnpWZ0VLUkZvZWFzYTF4dHVq?=
 =?utf-8?B?TmF2WXpVcU1iQWlBQUtmdjg2QTlSM0laaVM2SXNWN1lmQy9pSjVHbHRZRXhS?=
 =?utf-8?B?aVVWY3RoaTU1RjdnV29EWStuenlrMGM2R0QwUEJ5TWxHeEVkQnllWXRJZ1B3?=
 =?utf-8?B?eVExTDVTSlBLSTZIYXFtWDFGWjNlVE1ZcVNaSHV5UndscVp0ZzJBWU1JVG9h?=
 =?utf-8?B?OExySXpXN1FYWURqRjE0OE8zNmZHUllrSUVkcG9SN0t6Qk8wb2JxaStCVElN?=
 =?utf-8?B?ZlgxeUV0aThnTkxyQ1Azc3lONEtJZVNVZUdFcEo2Ujk4dFF0ekZrZm5PcUQ3?=
 =?utf-8?B?Y1hnMVpWeTRQNkdiaHpLMHppK2JsREFia1NUR3lISzZ6dUtaeTRnZUdTNWd1?=
 =?utf-8?B?ZFowZ29YOFl1b2d4aWF2MWE4cWczai9BS2M5SDN1dkJaaTVjbzJaSkJ4ekp3?=
 =?utf-8?B?SGU3VzU5WjNGUjcwNE02SHlmTDBWRW9PdVh0MHgyRXBOTU5rWnVIZzQvdnBl?=
 =?utf-8?B?RktqcTNGUW92b2xjNkVFMGN0c0dCbUdqc3REQjh4SzdRb2V6TnRYMTJSZmFr?=
 =?utf-8?B?bmdISHJsbzdtMXlDakRDVVV5NEFaZkhlRjh2Q09Bdm0raW9NUnphNElwdkNO?=
 =?utf-8?B?TXo2Tzg2bnlsTUhFSnJLMElGdFVCd0ZmU3ZOM3lzMWFidktyMVU0MGtaN1lX?=
 =?utf-8?B?NVJCZk8xb255WWJLWjZ3cTlkR0dSR0lPekZhLzUxd0xHdkl1UHF6WGVCb2lX?=
 =?utf-8?B?alhnUElVeEhTekRUUmcrVGYrZjhZVTVOWUpMc1VaUVNDbm9kaDJHVmJFYXdS?=
 =?utf-8?B?cldXa21IOG9TTWJFQWpOYmI3Wk5BU3ZHMjA5SlBQVy8vdGxENHd5cEE3MnJV?=
 =?utf-8?B?WUo4Q3IrcTcvNS9Rb2xUOHBHKzZhOXZGOEZiemtVemdwcW53S3FQYXdDdFI2?=
 =?utf-8?B?TzU0ZEQwWTZRaTVrTEhCd0FsMElpOWtqWUNYQ3RBYzBSWHozSFluaENiWmRr?=
 =?utf-8?B?NjY4L3hrUGlTYlBTSk1qYndzcG1Obkk3N3FZVC8zdUtYbjNvUkh6S1NJOUVC?=
 =?utf-8?B?d2Njb2t1OXErSTRIZ2ZqSHpxLzVHQTJYdm5OUjhsZjhaTmVYc1djRHRweXhl?=
 =?utf-8?B?Tk1uM25vR2xVaWFnNUNSTXBHa2xaRkhxdVF3S0pJV2ZnVFdWRlltbzRwNjlo?=
 =?utf-8?B?ODlVUjY1a3NwWWF6bWJXenZVcC9MUGxHM3ZPSmNDaURBTlpEVzBkUWVMNTJv?=
 =?utf-8?B?emtPOWwrNzBoNHRVaU1iU0VlSi8yZTdhdkNCRWx1YzB6VWczQXdpQTEwSGxO?=
 =?utf-8?B?YWtBVkRCcFh5OGlhMzA4WUhkdXBUMHY1TG9rMnJuS3J2SzFBRnJCSm5LYWJw?=
 =?utf-8?B?dWZiZi9RRlVrR0lhbGlsTDRidnc5UGpiR0NxUTdZcGdLMDNuM0pXSXdQdXEw?=
 =?utf-8?B?YjNXYTFjS2krRnUvNjg5WlUyazMwMCtodVMrSHBuMXBPQ1lMZjNxNVFYa3Fv?=
 =?utf-8?B?bDhtSkdoc25ZNllkTEY1aXU2WDJmZEU2WmtjcDllMGJmaFlGZGYyVGlHOVJP?=
 =?utf-8?B?MDZpbVBWWm4yWGQwdFBSQ0NIeis2ZHlpNFNvVTJaNnY4UCtJWVJnbi8wNU1z?=
 =?utf-8?B?NUhCKzFlU2h0ZFNGbDhpaFViRDNtamhZcXpObnRBQmEzSnJEd1pYZy9CV0d1?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde819f5-9727-423c-4b03-08ddf51b9654
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:21:39.4264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hu9gFVXPgo9+JADEyQst+GIPExf1yKmwIreeCfNmHwzNcViagZw9K1POVXsFQyVU25F5epuSIzexCQ/qs+BUWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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

Add routines to support allocation of large order zone device folios
and helper functions for zone device folios, to check if a folio is
device private and helpers for setting zone device data.

When large folios are used, the existing page_free() callback in
pgmap is called when the folio is freed, this is true for both
PAGE_SIZE and higher order pages.

Zone device private large folios do not support deferred split and
scan like normal THP folios.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
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
---
 include/linux/memremap.h | 10 +++++++++-
 mm/memremap.c            | 34 +++++++++++++++++++++-------------
 mm/rmap.c                |  6 +++++-
 3 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index e5951ba12a28..9c20327c2be5 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-void zone_device_page_init(struct page *page);
+void zone_device_folio_init(struct folio *folio, unsigned int order);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
 bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
+
+static inline void zone_device_page_init(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	zone_device_folio_init(folio, 0);
+}
+
 #else
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
diff --git a/mm/memremap.c b/mm/memremap.c
index 46cb1b0b6f72..a8481ebf94cc 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_zone_device_folio(struct folio *folio)
 {
 	struct dev_pagemap *pgmap = folio->pgmap;
+	unsigned long nr = folio_nr_pages(folio);
+	int i;
 
 	if (WARN_ON_ONCE(!pgmap))
 		return;
 
 	mem_cgroup_uncharge(folio);
 
-	/*
-	 * Note: we don't expect anonymous compound pages yet. Once supported
-	 * and we could PTE-map them similar to THP, we'd have to clear
-	 * PG_anon_exclusive on all tail pages.
-	 */
 	if (folio_test_anon(folio)) {
-		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
-		__ClearPageAnonExclusive(folio_page(folio, 0));
+		for (i = 0; i < nr; i++)
+			__ClearPageAnonExclusive(folio_page(folio, i));
+	} else {
+		VM_WARN_ON_ONCE(folio_test_large(folio));
 	}
 
 	/*
@@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
 	case MEMORY_DEVICE_COHERENT:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
 			break;
-		pgmap->ops->page_free(folio_page(folio, 0));
-		put_dev_pagemap(pgmap);
+		pgmap->ops->page_free(&folio->page);
+		percpu_ref_put_many(&folio->pgmap->ref, nr);
 		break;
 
 	case MEMORY_DEVICE_GENERIC:
@@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
 	}
 }
 
-void zone_device_page_init(struct page *page)
+void zone_device_folio_init(struct folio *folio, unsigned int order)
 {
+	struct page *page = folio_page(folio, 0);
+
+	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
+
 	/*
 	 * Drivers shouldn't be allocating pages after calling
 	 * memunmap_pages().
 	 */
-	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
-	set_page_count(page, 1);
+	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
+	folio_set_count(folio, 1);
 	lock_page(page);
+
+	if (order > 1) {
+		prep_compound_page(page, order);
+		folio_set_large_rmappable(folio);
+	}
 }
-EXPORT_SYMBOL_GPL(zone_device_page_init);
+EXPORT_SYMBOL_GPL(zone_device_folio_init);
diff --git a/mm/rmap.c b/mm/rmap.c
index 34333ae3bd80..9a2aabfaea6f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1769,9 +1769,13 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 	 * the folio is unmapped and at least one page is still mapped.
 	 *
 	 * Check partially_mapped first to ensure it is a large folio.
+	 *
+	 * Device private folios do not support deferred splitting and
+	 * shrinker based scanning of the folios to free.
 	 */
 	if (partially_mapped && folio_test_anon(folio) &&
-	    !folio_test_partially_mapped(folio))
+	    !folio_test_partially_mapped(folio) &&
+	    !folio_is_device_private(folio))
 		deferred_split_folio(folio, true);
 
 	__folio_mod_stat(folio, -nr, -nr_pmdmapped);
-- 
2.50.1

