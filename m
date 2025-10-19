Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E43BEEE55
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 00:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFCB10E0B8;
	Sun, 19 Oct 2025 22:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qP8awFCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013027.outbound.protection.outlook.com
 [40.107.201.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4107310E0B8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 22:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fofno0nx3CUKzho7C01ZnWAdlqfE5g0nSPEmXhFosk+5jv/s9i64TbP/DLUTVOTE0vUMwL4mSH3IxcEV8+eAkqXVN0iw6r3QB1hQI8wL97+4SkrsuC+IQ803Qiibd/6I7ng4+xtjP2WTwWfEn/YKmg6cZIBmAY5qd13gGpC2mKKj4ZQQVpB4oGt9q3nySJwVs0PFNuBvCQO/djddLcpktSS8pYeBdpPBSOsXojkYSuljfm0QeSM3nt4DyAwLfvSOIQasm8P4YYUnBdR0TAHt7uW5VA/QsUSZQ+DFjO1QwT61zxTulLFr9tciug9d5DzZoMwF8yEZNqAH/2P6W9rfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ank0RdBFpqeJSI0YOogLksEIflrsGoZfihZYziWT7kA=;
 b=KbvUjgRqArJXGMvcPaE43f6dGBv40z9i35+anv/8aJEhPSjg1EIO+CTW2eIJ/OZsAfjLhCZWjWrgeZhycMHYOykhI6n8GA8fmcb0bSx7pF67eQwQMXAackdILAI9XCEfxAe/vw5W4nJzxrz1eFTb2FIhMk+aWv6+JT1gjuaDs/urbG0gTcow9NeuYtKbOCSkx5QQybkFmNtHCVCzC4ICTUFh7+xdvlxKE7+Ek+1vqv2p2tUW9IdN3stmw4Kj8yfaphqbz1LDdZDzc+Q6UIZ/YTmhAsCsE3UCt4DHL64GbBZDfMYgcqLv5yNHcKqQ6ikv7oRMQcn3WzLQZidnRArX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ank0RdBFpqeJSI0YOogLksEIflrsGoZfihZYziWT7kA=;
 b=qP8awFCMX7VGgduU7d8tfBLO7E5y+tlMiY92J27n/fMQN+sowOGNJY9deP5T6Q+a3a8xYzydK69T4BXNy808uYnX79yJMpMfjs61LM88iOOvKzqnyOlrKaabKPisopRbFdUUasVRoWQ8V9piFHi/eCn3y1ubgapudAYGe5+oCsh2AaI6lK1vCyrhoO8DJ7dzHKHn+0lQr6+N4vgrPPAou8BUwYkz/uQhMP8sCN02oCxQfw9ht0djXcpItiNZhhIWUF9FV8YDffDAMTUzGd9kKggnXbuOLP7mZS9rwvw+V9y1S1lc6A4TXpY4sfvC0/zlCzbfitakXT0uDsuxkxwqWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PPFB6B4D32F9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Sun, 19 Oct
 2025 22:59:49 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9228.015; Sun, 19 Oct 2025
 22:59:49 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, David Hildenbrand <david@redhat.com>,
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
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
Date: Sun, 19 Oct 2025 18:59:44 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <97796DEE-E828-4B12-B919-FCA2C86756DE@nvidia.com>
In-Reply-To: <62073ca1-5bb6-49e8-b8d4-447c5e0e582e@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <20251019081954.luz3mp5ghdhii3vr@master>
 <62073ca1-5bb6-49e8-b8d4-447c5e0e582e@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN0PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:408:ee::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PPFB6B4D32F9:EE_
X-MS-Office365-Filtering-Correlation-Id: 516abfcb-1bc0-4911-a902-08de0f63349b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e3z48js1scc+aHmpzvstPpLZa9hZeMgm+1pQiLgsxw0qaJIWHPDtIVYoKMRZ?=
 =?us-ascii?Q?FZI1eXceTYUDHnrCF3e1VX6HBZzPOlNEN+rzWYOy1toEgK5endkKWJCa5r/y?=
 =?us-ascii?Q?+JwQIrYRHMfDvgnG6auo92BTfuN4ROnM/bTwGt8qVIVDSJKvKE9KTNHVAsej?=
 =?us-ascii?Q?tdwtbeiFw7ISi+Qy8NJE6E5a4xusSo6n/vbxbapRz3I/1PmqJU1OjwdcjKHP?=
 =?us-ascii?Q?zw7mOXha3GpGhcZQpCoo+NVkF3D4OGlReh/cKyzjCTZQ9DYsbYCrfFMScptS?=
 =?us-ascii?Q?3a6RCcYGNoWPF9jIpxsyOQ4WuUkeCXDJw2HgNCBcoGcFd6svB+aEZ2/17/rb?=
 =?us-ascii?Q?VMhIBSHEWzcIwaKtXFGLmsBoXVoTS+9jfZitUKdFv8ixwlinFQwc7SDeryri?=
 =?us-ascii?Q?NcT6LOq/Jhojqh80iQBBea6GqnI0SSgXvDUure1UVKnqGpUkqx0UKQ7zEiKo?=
 =?us-ascii?Q?Em5M4fuGOKW0bHevN+KK8oyGv4KXkrltA64U7Ncov2CyZwOtlUmxPhjZh7eB?=
 =?us-ascii?Q?rRVjdffC5Ow7icKk+X94pwOIyscgxutUfHCvCvT5DQFF1FQtdzSQubV5bIZK?=
 =?us-ascii?Q?4Kuw/EPbFrFXP979X8UIPsqzqnhJMsSUVMcJJda5x9AFObt/H8xkCoqXK99D?=
 =?us-ascii?Q?+sGjzM0XQGkc4g7u7NO3maylbqOgEOzSX4/o7X96fD/gr49SpqU7iDZ+H+0R?=
 =?us-ascii?Q?VhrL5W3g/sul7RoYugR4Jml6xQIEa8T9KMZHaitjVY5CIOB3+ohdvOLrhzTe?=
 =?us-ascii?Q?6qFF6wAzMnH+Hm9dKNzGjERs0TcFlnOzVQHvZLG37p7DUqF2RUQWC/nlQUuo?=
 =?us-ascii?Q?ZTOEC6qZq0RZ5ANkSMhJtl5iHmcxRoa8FD6lnKf7pT6W1O3ck+qBPejNq+ko?=
 =?us-ascii?Q?dHY3AKI+9e85Nx7SJaPJsspbrD2++vymxY1SdbmZW9Pu4fuvBjwUsDnz3S8L?=
 =?us-ascii?Q?GUxx3P7IQZIXce3oMCy24hPuIQI/pgDiMM8xXAQ6zWOcMbzhDPkoS370smh7?=
 =?us-ascii?Q?5O9gYNIXMnqY6Wz0EFUG1slNbWLmTe+8/coXTktHwvvsL81YTd9UeQEpIlQt?=
 =?us-ascii?Q?571fyjZhKaQHc83nU9+UbZzLYAoIR7VQccm2SeBigMvUf0TjV9Rb/QKN+Rfs?=
 =?us-ascii?Q?74TVcvAkZu7JGLJxnFxxj3I4FM0pGoY6+H27N1Uy9ID2x/Zg5UFezCH/L+EU?=
 =?us-ascii?Q?z00E9+wPxNM67pBBylkoZtpaVVbMtzPEUPZTVPoqb+ZNp14pvxsNquuIAvan?=
 =?us-ascii?Q?2+Cdi4XVH/YAzDUinAdK5mKore6N2mgIodEp+/Qoq6keCDt6GUuCOZ0Snt2F?=
 =?us-ascii?Q?A6MsbkBfZPOeJxAG3S/Fcb1AyCQ2fvqr2Tzjm7VNf1iUsBHxTC/KPn0ZjZBD?=
 =?us-ascii?Q?it7XVmCvPl5CsXN61ewurncn4RTuw25ZLcyKDtwt0g3IYOG2up7obQknLD8D?=
 =?us-ascii?Q?uI/lc1jjfuieLyWesO4DHvrZN6EppWWy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m6sT4twF46rNw5ZPCi+ZcIrRzIRrGo61JXruGuiIgexv6yMXoDN3izrU6ZFH?=
 =?us-ascii?Q?Cv5GXLDp0hifV1eX4BmMqzdEiW7X8lTp6ESGSmUuw+xZx88KvNq0inNoDTfv?=
 =?us-ascii?Q?WutMFaidGB0rIlMgeI5GYosJhlxrxGXo5LxXCD83qC91NrYHvwiRJUpHrFv0?=
 =?us-ascii?Q?cD8DfZrJbnuTtIobDQ5GLq1QdXqwxOCzf9RmDagnzvFB31aWaRp9QM/uJoDp?=
 =?us-ascii?Q?h5tyBXLdOgD202Uk97Hs3TLxGiqSo+zrK+irk5j4dxh7BeimjxNQf52RUml6?=
 =?us-ascii?Q?KT5agJ5Dk2Hxf51YOLy7UdAi9fsg6npYEsdT1igIJ2O4CXUhrs72dLSarDa1?=
 =?us-ascii?Q?j0Lh/msk39SL4VL//e3632sHmLqUhpWN8kWwF/rc8rQYyNP1cEg3X4hvwl00?=
 =?us-ascii?Q?na2tJpS6Y1RFVu6wmr9yM31HZK5ooKGSg2emkv87PS82ThSOQjQjZFybKsYE?=
 =?us-ascii?Q?O25K7bZqI+fF+ocXHQsS0EfaAiuuVArykF9PZNHaY7Jn+qsTJG450OudQpyU?=
 =?us-ascii?Q?nZ68rRzMlr3i+sMhjqQdQWqseVbLO7ARN61lTYA3ljMxoZsEwoBE2nj/uSDs?=
 =?us-ascii?Q?U69JhYJWUDLTqDroknuBHWl8MUP937NWknlKC8muEIhmsgUWMzxVCWw16Q4T?=
 =?us-ascii?Q?VrGWNo0I440wzm0oNh0caO8b/7FaFJ40wJCsv/XMvENjp6NBz271nsGP2/5R?=
 =?us-ascii?Q?OcDcCUERBamyRfKtWafcFnOzxce6W6pcpBoNX0+iCf+v8KIyK393Vy2sm0yR?=
 =?us-ascii?Q?I8hbXOi+Lo3xLW6Mr2txMi1OMRmlDT6Vn0wtM+YzljS2GIsGoDVPkU65GzSs?=
 =?us-ascii?Q?VSfMFPZP14wkKSFlQQh6eRBM2a3xHhwvp91payu/DxzChXVW9fKP/5eH1k2w?=
 =?us-ascii?Q?ljynJNPmX2GziLOQLTGJ6CEv9fN+GkhaDynUiOgskBKQkyHXbevJpN4WMYE/?=
 =?us-ascii?Q?YSMv9jHao8HKBBQzZlNRcdTHUqomF4NkeOy6lFSvWmKQcTUEpMElEO6DFkdS?=
 =?us-ascii?Q?romRn02NXrJbdVzmp1aJwQdAaw5754v8Iv3Jh8WNjDRyE0mR6IH2dUe7yWHq?=
 =?us-ascii?Q?+Omqj3NVev0OoVgxg2t5Q/DI3EvxAu7Pnv0ACGefplFCAaRkyEtHjVuRWgRn?=
 =?us-ascii?Q?mpPo+DLe+nMKzH0FuXA1m1QMPdICp1SSZOXgKIIh1DlUuuGmPBUfrWFtDPaH?=
 =?us-ascii?Q?rhOGpZLwJsDlviBEKOkgVaZFiWA0++9B0Jjd8LFm29h6h98P7wXHl1x2WJwJ?=
 =?us-ascii?Q?CedHGYD/ziEhIJysdQIdj2jNuUQG+21NHfISq8kpZ0qQETgESI3qhL8O9dzj?=
 =?us-ascii?Q?KXrJRd6hQvX+MnOqBzLzJSix4qeNRdpLwD3jfbBVKVKhxbNcLEjhSFACunr4?=
 =?us-ascii?Q?kCpZjNLXZ5dPh5FOrFW5aqYuJDDhtLLsQc+UgCVjXZnrCRdLSn8Fn8QssGCE?=
 =?us-ascii?Q?/jan+gY8rzopWRtvE8SUVoHnnRSEtJPkJkQTBwcR+gAyIQz1CBPjmZMdxgty?=
 =?us-ascii?Q?UPs6t7PO/vIhNXPFWYg+n+68ynJh1nOBn6ZufjGt70HBKanLV1Q28bQOHi8m?=
 =?us-ascii?Q?8Tw/lFZIgCLJeLkcOAYHTDE2MpyI/Svwhm8zklBX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516abfcb-1bc0-4911-a902-08de0f63349b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2025 22:59:49.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +M+dLy9EaZ1mFCc/LKddm+HRM4ezaogcsSu0oSlWDToNxNRX5ifFzxIckMSLgFKm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB6B4D32F9
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

On 19 Oct 2025, at 18:49, Balbir Singh wrote:

> On 10/19/25 19:19, Wei Yang wrote:
>> On Wed, Oct 01, 2025 at 04:57:02PM +1000, Balbir Singh wrote:
>> [...]
>>> static int __folio_split(struct folio *folio, unsigned int new_order,=

>>> 		struct page *split_at, struct page *lock_at,
>>> -		struct list_head *list, bool uniform_split)
>>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>> {
>>> 	struct deferred_split *ds_queue =3D get_deferred_split_queue(folio);=

>>> 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio,=
 unsigned int new_order,
>>> 		 * is taken to serialise against parallel split or collapse
>>> 		 * operations.
>>> 		 */
>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>> -		if (!anon_vma) {
>>> -			ret =3D -EBUSY;
>>> -			goto out;
>>> +		if (!unmapped) {
>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>> +			if (!anon_vma) {
>>> +				ret =3D -EBUSY;
>>> +				goto out;
>>> +			}
>>> +			anon_vma_lock_write(anon_vma);
>>> 		}
>>> 		mapping =3D NULL;
>>> -		anon_vma_lock_write(anon_vma);
>>> 	} else {
>>> 		unsigned int min_order;
>>> 		gfp_t gfp;
>>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>> 		goto out_unlock;
>>> 	}
>>>
>>> -	unmap_folio(folio);
>>> +	if (!unmapped)
>>> +		unmap_folio(folio);
>>>
>>> 	/* block interrupt reentry in xa_lock and spinlock */
>>> 	local_irq_disable();
>>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio,=
 unsigned int new_order,
>>>
>>> 			next =3D folio_next(new_folio);
>>>
>>> +			zone_device_private_split_cb(folio, new_folio);
>>> +
>>> 			expected_refs =3D folio_expected_ref_count(new_folio) + 1;
>>> 			folio_ref_unfreeze(new_folio, expected_refs);
>>>
>>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>>> +			if (!unmapped)
>>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>
>>> 			/*
>>> 			 * Anonymous folio with swap cache.
>>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>> 			__filemap_remove_folio(new_folio, NULL);
>>> 			folio_put_refs(new_folio, nr_pages);
>>> 		}
>>> +
>>> +		zone_device_private_split_cb(folio, NULL);
>>> 		/*
>>> 		 * Unfreeze @folio only after all page cache entries, which
>>> 		 * used to point to it, have been updated with new folios.
>>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>
>>> 	local_irq_enable();
>>>
>>> +	if (unmapped)
>>> +		return ret;
>>
>> As the comment of __folio_split() and __split_huge_page_to_list_to_ord=
er()
>> mentioned:
>>
>>   * The large folio must be locked
>>   * After splitting, the after-split folio containing @lock_at remains=
 locked
>>
>> But here we seems to change the prerequisites.
>>
>> Hmm.. I am not sure this is correct.
>>
>
> The code is correct, but you are right in that the documentation needs =
to be updated.
> When "unmapped", we do want to leave the folios locked after the split.=


Sigh, this "unmapped" code needs so many special branches and a different=
 locking
requirement. It should be a separate function to avoid confusions.

--
Best Regards,
Yan, Zi
