Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C95EB93564
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 23:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3688EF0;
	Mon, 22 Sep 2025 21:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ULSPgov6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011007.outbound.protection.outlook.com
 [40.93.194.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F6610E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 21:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ3lLSju8rUFAUGNwXPYoJJxAltFtpwOjXwfWVz6KeSgxWQ0EyEGu84qUtVmhGSzQGHf9j71Wre9XZKXf/kJ6FmT1RhTbJOr+6Af7fCICPxN7b76evRlv1FG/Z8LQeIqtQO1SPprsJrsA74npNWihxvJ9ZTm/4B6suk/Kp4UDBbiYt2dBzLMy3M2Fj8ZLrYMVdMT6DC8ExJkw6lGzPmOBcS88XXL1cUbqg30o9+Pa/NrE1GYCSu0gVIU54KpORRVCIBbl9Yt891BmrnGbQqYafr8raGMf77usxsu5hkzG3mh82l5bOOP0nxZwmAYHc8S2rwJduatVuujWzeMCg9mDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOYI/Rvzn8fR8Matriw2LJ29fYnGVh40OhxDajvoGQM=;
 b=FQMJa2jeAYo8W3gRTqYb67n/z9a8gx7Ghm6voX36fhVHm/+cQA3ZeLVY5gVXZyut2OA4VaCw/CtwGFt5PDrl6Lz9f9dbduwymrZFjmW/WNuWXnGTu4afOF1ioeV7+d7XWTSjLyLQykdbhRuYfi1ahbUtxSIDWTAD/wGsb7jZiqGY/DNVDxMeuPSSToZVDnmI4Xfs9INky4IUxjL81kqknkiTVDGI3I6iCX88oLgUwK/yX2JpXH7Ie2sveRssEosyHc54HVtz9R1iceQCE8d9ARX15881Lna7WUDMw62KZwvwLu7k723wrszMIlQYrtlob2fb+unCo/CiQrsFBna5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOYI/Rvzn8fR8Matriw2LJ29fYnGVh40OhxDajvoGQM=;
 b=ULSPgov65U8x71CMXCLe2bX0aXnaAzcktagXbed7INpy/Xebm6AMaSeNnDSdlbnlN/7SEOeX/1Wzzo/Sb46UQosuzgh1d74bmogwfWGOAAdZUG3AtpyKVQeeZLfdjPsLtYyrhzT/z1zcO1trtyA/TvjUgsZam8xz3ViGDAXI8IT/v3mhnYDd32IcKirZiDOqMQe/t2ycG07qQL3TMBClWbq8kCjuZ1KKOkssoeTSPAvp7RbFGBUmmlhTjxIIupcehyqC4ZIYwLfoNuNMeOqEs7c6LHTaR5LI5V5CDDtt0u+E01m0fAoeGCLo/obPv8/psetDxzttM0DdEa8KQjGRvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB7751.namprd12.prod.outlook.com (2603:10b6:208:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 21:09:21 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 21:09:21 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
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
Subject: Re: [v6 04/15] mm/huge_memory: implement device-private THP splitting
Date: Mon, 22 Sep 2025 17:09:16 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <7987AB89-4E80-4A0D-8736-E95F998698DA@nvidia.com>
In-Reply-To: <20250916122128.2098535-5-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-5-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:208:329::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 08816688-9791-4d9b-18d3-08ddfa1c4ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGZiVFZuNisxMjJzNnQzbExtNGRRT2JQYXpZTUhtSFEyM0ExRU5TRFpvbGNj?=
 =?utf-8?B?MGF5cW45MXI3TUJMcFZRUkpCaDN3VWhoT2NsV3dKRHZWdDh4TWM3dGYvU0lh?=
 =?utf-8?B?M1pLR3FWTU16RG1KZG5BNmNBVFNiNk9FdndVSkIxY001Mk4rYk52MEVEZEtH?=
 =?utf-8?B?TElTNE13WWhsdGxGU2VpZlU4UkwycVJPbFdzS1FhdmtVclZHVzEzSmJlSUJF?=
 =?utf-8?B?SWVqalppdzE1VGxlemdpNE9VTkNQRnNOVmZGYlZHTU9jUmJqMFNhU0NrYnlP?=
 =?utf-8?B?b3IrcU9KdUxPaVFRVEJ5UHpVUFhxNmxIVVNMakI1UDdTazdKODdBZm5QMnJR?=
 =?utf-8?B?dW1XUVNDU05wRFA5NVJ1ckphSjJMR0ZDU3ZEdzdWR3hJWHlydG95VnFOTEh3?=
 =?utf-8?B?U1dnL2NON2V6Si9Ib3I3YU5zSitlTTJnVmpRZStHMW51N2Z0MXJJTTBmTEE0?=
 =?utf-8?B?Z0h4bjZReVdXZVVKbHVaM3M5WWNaaDBuS0pyN0pnbmJWZW9wRlNpYUJTU2xx?=
 =?utf-8?B?VDJtK052SnNCeDNaU0Znd3JZc2RXUnNTbFlEQUMzenhsQUtYWG9QSUw3MHps?=
 =?utf-8?B?Z1dxOWdQa0Z6eURqSjBEdFJIS0VEcmVJYTZOdHh6Sm5jV21DQW5sVmFoUEFy?=
 =?utf-8?B?SHllNjhsak44TDdYRUw2VkhWeTd5bGI2a1dPUEZKd2x4bXBXZHVCRWgzNWdF?=
 =?utf-8?B?OHJBRnVFcTVqUUw2Ym16NG9OQTZGMG50VFBwK2J3a2dLQzVQeFZ1ZzNMZnQ1?=
 =?utf-8?B?M1FQeHArT1FKZXJHbGlkOGRrTEpOTHMvZDNNa3ZUem81K3NEQXpwK2RGTHVT?=
 =?utf-8?B?Y3JZSXIxcHlRY3JZY2tTYmFwVmdlVitEMkI1TGNHdGo0dVB4UHdaSUJJVXVD?=
 =?utf-8?B?NE5aV1FGU3BZNnNFcVA0TXJZLzU2NXAxVWYzNDZycm9MdkoydXk2bWJFTURO?=
 =?utf-8?B?dWRyV0ZiVjlZZjcxY29nVU5kVHFlVWlGR0sxcTFEMkk4bDdTUDExWWhyV0RG?=
 =?utf-8?B?QnhLMlQwNzVzNXdJaThiWGg3cUs4WGh0ejNsQlFYWFI2MDdScDF4YUJJeFZ5?=
 =?utf-8?B?Z0ZlWE55dGFMbWo4ZWk2ZTFKZEZ1OGFZZjRzRE5pK3pPTEJtTjNic1F4RU9i?=
 =?utf-8?B?Y1dxMk5URmcyQyt6Tk1MQkxXVTd2SUNLV1pvQzM4U0ZDZVRoS09tYkFWSlJL?=
 =?utf-8?B?aUxSdnZENmRoM2wyRVJhcUQ3YXhqZ1lRMERBUGRNRmkrR01WdmpWWS8wNys2?=
 =?utf-8?B?VzNueTg4QU8vdE9LUHZYZ254YjBIdmVmSEtqQ24wSW1FYWoxR2hYUmVqc2FX?=
 =?utf-8?B?Yi9rMjVvRW1iSWRxK0txY3dKREVPclhXRlZkUzVHL3F0a3FqTUIzclVTZm8v?=
 =?utf-8?B?MHJkZm1uaG8rMzJLZ0VNMVAxZXU0VWxSZEdEV3k1WCtVMnU3VXdBc1JaRmJM?=
 =?utf-8?B?SUJpTFNTOTNrbkMwakkvRW0rWVlqY2lwVC9HZzh4ZWlSS21UWDU0clhmVURJ?=
 =?utf-8?B?OGwzS09SUlVUVzFlOERkOHZFV3lKUXdBMGdYTDNJVVh0aHZRVEVRMjkxeXdY?=
 =?utf-8?B?RXJRZGZjcVU5Ylp5bFJuOGtySFo5Vmprb2RBSnB1bUFPem1WUGdrbW9nVVdB?=
 =?utf-8?B?cUIySGFXSG5mdnU4bytxVFNMWWpvRGorNWg4ZXNDSmJxOHhRaEdDSUFXY211?=
 =?utf-8?B?QjU5U1BVemFpRXY2M2lqR0t1eEtlR3BOS1VmVStIS2hrR0lpTHJGdHkyank2?=
 =?utf-8?B?eDZyLzhtdDNyNGxRZzFKUEZGMUh1NkdtdkU1RHo4N3V1Y0ZteXVjYXBJMzl4?=
 =?utf-8?B?WDZLbXU1ZkRYWDhwdGtMdGkyVHZBSmtCOUhUa2UxOFNBR0NEdmdQYUpjblFT?=
 =?utf-8?B?cDY4SjRmM2NQWDFIbzFFeVJ1TnJWNnFOZ29hQTg1UmZiUUhHYWhzRW5WQUN1?=
 =?utf-8?Q?xN33JqcHu94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2dkdlVaS2c1Mk9tRGNmMEZtbVgvYVNiT2x4dW1GN21lekQ3b3lJLzZrL2tr?=
 =?utf-8?B?UzZaWUhzekRiY3NMbE1mdnk5YUVlODBUd0N1MHRIRUZJdlRjeXpVNkZ4eXpW?=
 =?utf-8?B?ZDhtRVJ6UThtblg5cmJhS0k1V1k2QkJUaCtiN3RlRWwxSmNXeElwbWtVV2pS?=
 =?utf-8?B?VmgyOGYzam5EUXJ4V20xbmw4TmM1aHJFUGRjcjI1dHhIVnBjd0RZWFpVU1oy?=
 =?utf-8?B?YmFMOGFZN2c2Z3A2c0lmbUFObHVYRWlzeHFoOVBndVhvSWlMcW80MHFFYUIv?=
 =?utf-8?B?V1pQYU5aWE9VeHpyR0RSVG9aeUpnSlBhdUVFTXFIVmZDelh5enM2Y1FiMU5J?=
 =?utf-8?B?bWRGVTlaTDlXZm84TjMzY2pacTVvWU9ibmRsdzR3cTYrbnFReWp2Ym1MVDlS?=
 =?utf-8?B?Ty91eXNJbGI3TTNoeHgwT0pUWmlmSzc4NTVOeFlES29DR3JBWGVNZm5kcEZK?=
 =?utf-8?B?V2pFNlpsaDhtRlNRWWRtU2xGSHQ0MUpxSWlzblV4T0RjU1Y0a2VFRHpOR3Jo?=
 =?utf-8?B?aHltMXdoZm4zZ1JMdGxTd0IvSFRJU3NER0Z1ZzU0dTc3VGVIU285ZU9CTFcv?=
 =?utf-8?B?TkhWZVhTSTZNa3BDQStURXVWOStnc3lxdTRMNVJtOTFkTGF1ZzRuRldXOE5L?=
 =?utf-8?B?Vno2djJuR1RnelEwRzMrUjBTNVlBRGpGWG10TFExNXJSVG1od29sWms3WEtF?=
 =?utf-8?B?MFYvb0FxNFpGdEFmY3AyQnFRemtEQ2M0clBPU3VsQnNCNHFIbnRtRjB6bFNK?=
 =?utf-8?B?dG5kUWpDdk54OWZUeVo5V1BUSkwzaThJNHh0Nk9INWNqZ1laS2lyKzN5Z3pm?=
 =?utf-8?B?T3hCSjQ1VUlCYkd3bG1QMENYOTJ2R2tnd2RhcGJ1ZVpiMFlDWWhmVWNDMkxX?=
 =?utf-8?B?ZnRpd3MzWS9Dejk4UGpzamJRSGhuL1hnOVVtYWs0NkY2TmlheVhRWWdyOFZU?=
 =?utf-8?B?c3F1bDlDdTdpZVVrdDBiMGtaWTVKMkF6SFptQnlOL0JUeG0xMHo4RVlkb3VJ?=
 =?utf-8?B?ek9LcjFYVW45ZEtHQTVXalpRYjZqNFZWbXZHTDZBQjhrRWdoNWx4U2hmZjVu?=
 =?utf-8?B?VUtMckhDcjd3cEI5eEs5Z3IrTC9wSkdMMzhOcXVwTHZ0ZHR2SFh3SzJFbnRr?=
 =?utf-8?B?dDFRU2NsR2ZrcDM1WW9vck95YXF0a3RMZGRhSVo3WGVZdnlDVW9sNlA5Z1BI?=
 =?utf-8?B?RTBoWUZ3amN1WitqVFAvZldacTV1Z1pZb3RPUjJ0L1ArQUZoa3lsa3RreSsx?=
 =?utf-8?B?c04reTBQMWhZRk5jWXFXbkNSUGN2QXNPWEtmVlpRcTQwdXRmdG11Z0JkNmto?=
 =?utf-8?B?Z1dIdVZ1VDAvd3ZNeVIrRkZ2THRialJVMFR4andEWEtKem9CK2FiRWFxQTBS?=
 =?utf-8?B?WWdGMXRVS1JzeFZiZXlVTE5JTjhDRDBFTnMveENJcm1GNk5hcGJza3NQTVRu?=
 =?utf-8?B?UVFEYkRNZ0hlNCtRQmVYVXRsNXFKSk44dU9jdXdNakVUYTV2VFdjT01rRzBu?=
 =?utf-8?B?aEdXZDNucUVIUUIwdHlNQmhiVzFOMlJMREgwU3VjYjQwL2F6ZzdJVzl4cnpx?=
 =?utf-8?B?Z0VpT2FrbUdTWXo0Y0NXYTNqMVAvMG0vOTVBVjR2RHM2U3FnaEVlR0dpOUVw?=
 =?utf-8?B?TU9OODVvWm1Bak5IeEplZGJGaVpCSklSTVZPWmlVTXZnTEJ4Y2JuaVFDckZu?=
 =?utf-8?B?M0tKM2kvbjNUSUFubWd0NFo1QXFOTlNLall2QUZaa25MVnZrTmxjV0JKTW14?=
 =?utf-8?B?RkR6UFZ4MnJrUDJuYWI4TGgrVyt4N0NRYzlJSVkvNkZSWE1PMWg1WXVOQ0FJ?=
 =?utf-8?B?RXlqSFZJQnB4YWozVDlOS1Erc0dQZ3pTdTJLSEV1NHIxcWdSOFA1M1BVenRa?=
 =?utf-8?B?MGFGYjBaRUo2UnVwblFaRDZZaitmRGJQVlplaHZlMFRaNkNlNytFWGtoYjJw?=
 =?utf-8?B?QXZWZGRrYmMrRncydjU0WU03aVBoT1R5RWtUaURwZW5WL3lMNVB0RU53ZmVq?=
 =?utf-8?B?WGdVakJqc0Flelp6ZlJteUZiSzIvSUVVRkczWEs5STYrN3FGZTNlN3M4NjA3?=
 =?utf-8?B?dHVncThaQ3oxeFdHZW9VOG9CZnZRbWRZUU00UmFBTUZzSGk4Rktmc2RwaS9s?=
 =?utf-8?Q?9DwijuvKCNE1gDz+WAtkw7Nvd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08816688-9791-4d9b-18d3-08ddfa1c4ca5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 21:09:21.0011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtgnwquBAIO3Yo/oizgm0UMWwfZOwkAB1fHm6lRjPynart6jdFjHLs7iQst3de5F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7751
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

On 16 Sep 2025, at 8:21, Balbir Singh wrote:

> Add support for splitting device-private THP folios, enabling fallback
> to smaller page sizes when large page allocation or migration fails.
>
> Key changes:
> - split_huge_pmd(): Handle device-private PMD entries during splitting
> - Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
> - Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
>   don't support shared zero page semantics
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  mm/huge_memory.c | 138 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 98 insertions(+), 40 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 78166db72f4d..5291ee155a02 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2872,16 +2872,18 @@ static void __split_huge_pmd_locked(struct vm_are=
a_struct *vma, pmd_t *pmd,
>  	struct page *page;
>  	pgtable_t pgtable;
>  	pmd_t old_pmd, _pmd;
> -	bool young, write, soft_dirty, pmd_migration =3D false, uffd_wp =3D fal=
se;
> -	bool anon_exclusive =3D false, dirty =3D false;
> +	bool soft_dirty, uffd_wp =3D false, young =3D false, write =3D false;
> +	bool anon_exclusive =3D false, dirty =3D false, present =3D false;
>  	unsigned long addr;
>  	pte_t *pte;
>  	int i;
> +	swp_entry_t swp_entry;
>
>  	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
> -	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
> +
> +	VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd) && !pmd_trans_huge(*pm=
d));
>
>  	count_vm_event(THP_SPLIT_PMD);
>
> @@ -2929,20 +2931,47 @@ static void __split_huge_pmd_locked(struct vm_are=
a_struct *vma, pmd_t *pmd,
>  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>  	}
>
> -	pmd_migration =3D is_pmd_migration_entry(*pmd);
> -	if (unlikely(pmd_migration)) {
> -		swp_entry_t entry;
>
> +	present =3D pmd_present(*pmd);
> +	if (is_pmd_migration_entry(*pmd)) {
>  		old_pmd =3D *pmd;
> -		entry =3D pmd_to_swp_entry(old_pmd);
> -		page =3D pfn_swap_entry_to_page(entry);
> -		write =3D is_writable_migration_entry(entry);
> +		swp_entry =3D pmd_to_swp_entry(old_pmd);
> +		page =3D pfn_swap_entry_to_page(swp_entry);
> +		folio =3D page_folio(page);
> +
> +		soft_dirty =3D pmd_swp_soft_dirty(old_pmd);
> +		uffd_wp =3D pmd_swp_uffd_wp(old_pmd);
> +
> +		write =3D is_writable_migration_entry(swp_entry);
>  		if (PageAnon(page))
> -			anon_exclusive =3D is_readable_exclusive_migration_entry(entry);
> -		young =3D is_migration_entry_young(entry);
> -		dirty =3D is_migration_entry_dirty(entry);
> +			anon_exclusive =3D is_readable_exclusive_migration_entry(swp_entry);
> +		young =3D is_migration_entry_young(swp_entry);
> +		dirty =3D is_migration_entry_dirty(swp_entry);
> +	} else if (is_pmd_device_private_entry(*pmd)) {
> +		old_pmd =3D *pmd;
> +		swp_entry =3D pmd_to_swp_entry(old_pmd);
> +		page =3D pfn_swap_entry_to_page(swp_entry);
> +		folio =3D page_folio(page);
> +
>  		soft_dirty =3D pmd_swp_soft_dirty(old_pmd);
>  		uffd_wp =3D pmd_swp_uffd_wp(old_pmd);
> +
> +		write =3D is_writable_device_private_entry(swp_entry);
> +		anon_exclusive =3D PageAnonExclusive(page);
> +
> +		if (freeze && anon_exclusive &&
> +		    folio_try_share_anon_rmap_pmd(folio, page))
> +			freeze =3D false;

Why is it OK to change the freeze request? OK, it is replicating
the code for present PMD folios. Either add a comment to point
to the explanation in the comment below, or move
=E2=80=9Cif (is_pmd_device_private_entry(*pmd))=E2=80=9C branch in the else=
 below
to deduplicate this code.

> +		if (!freeze) {
> +			rmap_t rmap_flags =3D RMAP_NONE;
> +
> +			folio_ref_add(folio, HPAGE_PMD_NR - 1);
> +			if (anon_exclusive)
> +				rmap_flags |=3D RMAP_EXCLUSIVE;
> +
> +			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
> +						 vma, haddr, rmap_flags);
> +		}
>  	} else {
>  		/*
>  		 * Up to this point the pmd is present and huge and userland has
> @@ -3026,32 +3055,57 @@ static void __split_huge_pmd_locked(struct vm_are=
a_struct *vma, pmd_t *pmd,
>  	 * Note that NUMA hinting access restrictions are not transferred to
>  	 * avoid any possibility of altering permissions across VMAs.
>  	 */
> -	if (freeze || pmd_migration) {
> -		for (i =3D 0, addr =3D haddr; i < HPAGE_PMD_NR; i++, addr +=3D PAGE_SI=
ZE) {
> -			pte_t entry;
> -			swp_entry_t swp_entry;
> -
> -			if (write)
> -				swp_entry =3D make_writable_migration_entry(
> -							page_to_pfn(page + i));
> -			else if (anon_exclusive)
> -				swp_entry =3D make_readable_exclusive_migration_entry(
> -							page_to_pfn(page + i));
> -			else
> -				swp_entry =3D make_readable_migration_entry(
> -							page_to_pfn(page + i));
> -			if (young)
> -				swp_entry =3D make_migration_entry_young(swp_entry);
> -			if (dirty)
> -				swp_entry =3D make_migration_entry_dirty(swp_entry);
> -			entry =3D swp_entry_to_pte(swp_entry);
> -			if (soft_dirty)
> -				entry =3D pte_swp_mksoft_dirty(entry);
> -			if (uffd_wp)
> -				entry =3D pte_swp_mkuffd_wp(entry);
> +	if (freeze || !present) {
> +		pte_t entry;
>
> -			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
> -			set_pte_at(mm, addr, pte + i, entry);
> +		if (freeze || is_migration_entry(swp_entry)) {
>
<snip>
> +		} else {
<snip>
>  		}
>  	} else {
>  		pte_t entry;

David already pointed this out in v5. It can be done such as:

if (freeze || pmd_migration) {
...
} else if (is_pmd_device_private_entry(old_pmd)) {
...
} else {
/* for present, non freeze case */
}

> @@ -3076,7 +3130,7 @@ static void __split_huge_pmd_locked(struct vm_area_=
struct *vma, pmd_t *pmd,
>  	}
>  	pte_unmap(pte);
>
> -	if (!pmd_migration)
> +	if (!is_pmd_migration_entry(*pmd))
>  		folio_remove_rmap_pmd(folio, page, vma);
>  	if (freeze)
>  		put_page(page);
> @@ -3089,7 +3143,7 @@ void split_huge_pmd_locked(struct vm_area_struct *v=
ma, unsigned long address,
>  			   pmd_t *pmd, bool freeze)
>  {
>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
> +	if (pmd_trans_huge(*pmd) || is_pmd_non_present_folio_entry(*pmd))
>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
>  }
>
> @@ -3268,6 +3322,9 @@ static void lru_add_split_folio(struct folio *folio=
, struct folio *new_folio,
>  	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>  	lockdep_assert_held(&lruvec->lru_lock);
>
> +	if (folio_is_device_private(folio))
> +		return;
> +
>  	if (list) {
>  		/* page reclaim is reclaiming a huge page */
>  		VM_WARN_ON(folio_test_lru(folio));
> @@ -3885,8 +3942,9 @@ static int __folio_split(struct folio *folio, unsig=
ned int new_order,
>  	if (nr_shmem_dropped)
>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>
> -	if (!ret && is_anon)
> +	if (!ret && is_anon && !folio_is_device_private(folio))
>  		remap_flags =3D RMP_USE_SHARED_ZEROPAGE;
> +

You should remove this and add

if (folio_is_device_private(folio))
	return false;

in try_to_map_unused_to_zeropage(). Otherwise, no one would know
device private folios need to be excluded from mapping unused to
zero page.

>  	remap_page(folio, 1 << order, remap_flags);
>
>  	/*
> --=20
> 2.50.1


Best Regards,
Yan, Zi
