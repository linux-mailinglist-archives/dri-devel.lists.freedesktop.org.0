Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD1fEBDKm2kJ7AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FEF1718CE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88F010E206;
	Mon, 23 Feb 2026 03:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bIYlq1RP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD7D10E202
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:31:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHUxe2OnrRrDRxeOaguSy38tImmEUfdwbWT+yiGevNKe50Uyj1PXACXV1Md2eBEGomnH9YuyI80P5xlzWZ0fVhpgQQpqUa0zGqKEJVr5NGLH3r8TEhx/Ja/Qfxnu6cMQ+apjTQ9Tiosd6Ac/ensx/2ZNTb4jkA2yq0ssFwfHED9+Pv7zZKxrkDM4tvcGGe0ckH0LutKaPqXyBj+GyQa/lMNK6lakHY2yNWt1eeBBka0rVADKsCwPXx0rz1jA395GXhwIQSYfGbRggKYR1n6gjm46W8JV551auc64j83kmaM1GKnwyJYWM0da6xNbBV6KXTQ+PRl9fz6z7WcEj7DesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RvWrNj8yyyCnI+YE4gYtOHsLGeplzrWUSVKHJsWcEs=;
 b=yfjZnU7HEl9Kku5RyXc5te8Mdbop5doh4VqiKt5LJsc01cV/DWSVjRFIixBtIbXH7R9VlubuRSeWSMq0Why87345HpkUlaI6DmJbu6HSWNH/oa1BB6iCeE/OWu8YofrXKzjOLDcikWmvEhxRGfI48xAMMnjgTibH4xCVmxPfX3Q+qqB3ROMjYFhbjPkIpvM2ZG100zrKgcIDhgvQdboPtsjDGbWqPP+PAbrGQ2OW5sNdo8OetW3oWmuog502O+n5A1w4yq9K7lejCIRgOYS38v3hzd7zpojuVF2JFSgsa9FfzcaBIge4wegLV/JCSTcZpBIADb1/vvwOHdxyMzO11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RvWrNj8yyyCnI+YE4gYtOHsLGeplzrWUSVKHJsWcEs=;
 b=bIYlq1RPptjlY6V3O83SE32WcohYphMvUvmpa2yB9hNLwwASxB1Zy3GcExfjwjhaa2pLSHBFdYYtCAQccmWJKDk8bUsgBovTSZhyR4ytws4AWRXEtkCHh9tpL3YY4C6/32EHxMZjb7sWQSw2xeMvDL3EKxX5DjyqsnnwvaWa7jXvDss8mXBU4TI4o2lTJOH0y8BSN3Ty+SHmhaaGXODcVJjsijEDOJdBvQ6KssisZ6sJ6JZCnzY8GCzprf8pXu90NjyzJGZerJx1zWq9i7GaxURlmx6GP1the5tkXkzVsJ938ZkxVH718gYwGcAkHVXaF9djUWgJ5aZvXGzYX82H5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 03:31:11 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:31:11 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH v1 11/11] mm/page_alloc: check page->private upon page free
Date: Sun, 22 Feb 2026 22:26:41 -0500
Message-ID: <20260223032641.1859381-12-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
References: <20260223032641.1859381-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0020.namprd18.prod.outlook.com
 (2603:10b6:208:23c::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: ca48d91e-86a9-430e-e528-08de728bfda6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RUOgXsqZ+hSsFdlCik23tv0VgAcIfSIwtkdzq6DG2VjhdlfSdC2tw2cR+dC4?=
 =?us-ascii?Q?xpKiwQrytV3xkRRAcj2H7Y/X7bW9k0ZdvA+DGmHj5tHskEcWdZ6zu3iu/ywa?=
 =?us-ascii?Q?cv48Ye3PrERI5oTN++ZVTuIa61vmxFW6ceA+NUNQVUQHYSz7Jw9zrfM1U+jq?=
 =?us-ascii?Q?U1r+sIIKV8jQYAw+Sa+DulNaoqTEpruhCU8OLlG3YowWjkMXLhnOOwxbFi1e?=
 =?us-ascii?Q?BJL0M1Y/E+yEQdEDxeI81vvXw3o9caH7ZQAE/zexXhke8PhpG4tH/gu128Pt?=
 =?us-ascii?Q?9mcIddxVB3XN9H+j1GXHmz/Av9EbNRZxD04PWL0g0I9vtz3468uvpjF+kT0K?=
 =?us-ascii?Q?RUHBXpMG9cRF8tPA5EqDEqbnEbfCM7ylzrqQcKqjBfxgYABk6Ous6X6wKIDV?=
 =?us-ascii?Q?rFQT3s5r6kMbfCY4sfDtPpe4kefFjKpdgG33jXRF2jIksuZNp3nWNtFD6RiR?=
 =?us-ascii?Q?vYMyZnv7wTC4oBclNjIKZnef3WOv+o2uNLqbcdjGd7e/4x8awMrYaysGW5lJ?=
 =?us-ascii?Q?8fi66gVQ7KCISTEjyKcfC98FJloY597LS27e/7s2VjGHvpblWP9ugbu2e/Lb?=
 =?us-ascii?Q?RaK8L4Peqt3tJfMrwG4Ylx1HiZ6g32QzrxXJ3MRT5mR20F118LrKkqxH+MFw?=
 =?us-ascii?Q?fYwyXJaSDUWM1DMeSDl7/gE8HrqeIAASn/3dOaJ+qUz/bnFcJRG+b5jXtHuc?=
 =?us-ascii?Q?pM3M8Fph58rhS04v1ZGnlsJkD3yb5cWqk1Jr5fpDRcrGpsmgtshi/2/MmkN/?=
 =?us-ascii?Q?t9ep8Vp8vWwhYow9mSwHWrVx43Zch94tQ3V37Uvg5geIv8wsX6AHAhizfEF7?=
 =?us-ascii?Q?x3Guj/zYUTdiBteFkxLTxauhLZzQ0uLUheRHxAXAMV6hBBS0447oMeZl6CeS?=
 =?us-ascii?Q?uD/WOL4mkuvC/WFdQFRvNqvMfPjH73CTMOovSoaHjz0wb3ITgIMwYeOcUU1D?=
 =?us-ascii?Q?CUDm4rXDjJ3nViWKVJQz0ckDeYm6wibG/MuAIcBPy3jDj+pv3jNRwe5TgTpL?=
 =?us-ascii?Q?RnjR4Jg2vNp3glfQE/BYgFd5OXdYzXnK2t9vuveepM3elLgXBpo81yMaihxC?=
 =?us-ascii?Q?OcQiXyucnPUIZM/d/TOQ8pGcVEb+NdaAGBAbc/3yu6ZDVJfYds5O2iO0rWMI?=
 =?us-ascii?Q?VpJtyD7VDDux2YdVtDa0vc4AbiVTkd6qZjD/gVtcRJSuWuAbzg1C1//Wy/HH?=
 =?us-ascii?Q?d4GYI+j7tLEXvgP7usH9v8DsOjQSRsZU7HDU3cwd2XR0BkraxUYeiuhAJ9Lb?=
 =?us-ascii?Q?ngwSLn7vpjQYlbBekrQNvwSYsJfVQcID9SULlRb2eVFSNyBOXmp/ibGmXhuM?=
 =?us-ascii?Q?DYV4p3YCLy1u9Iy9b4iySTuKLcLL3+SozxvXji/txpUUDCXgWe29+MiTtbYR?=
 =?us-ascii?Q?1C/uLYKQzqlmm33gAoTXB7BTykbn08EWEIIS5eZp8g5+EDJL6fl22zh8WE4Z?=
 =?us-ascii?Q?v5lz0Xc5xWjKTFnOp66jLRWfO4kZBXVBSK69B91KcnoOYnD40tNkNC6SuX+w?=
 =?us-ascii?Q?wuVKPNVgapecCLftcpF7tQ6VhqmPMogjG03h0n43DF0fxe9HlEOPhNCXOJ+w?=
 =?us-ascii?Q?MClxIM3WdknFyzABbOQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cDV3Mpg8/8V1FFJhWvEhrJp6oluAse/pxHy6+RZbQKeW8GPwoiPlfVLaQXTH?=
 =?us-ascii?Q?cBySKnKjCu3N1pXBT8JSkKvmCnzzb7ZQUwouQxP7Nd+xchtJqYvkUWN4R2io?=
 =?us-ascii?Q?ttofp7e/fKG1S916pvPsqxMzk218wvzUlk0zwKGNJ2poGQltVyY1iANANU11?=
 =?us-ascii?Q?mgGZzjpeZm2x3D1kfR4/hHoX9RT9sQRT2G9PlqF/yrNqqGox32UPjM4yIgx1?=
 =?us-ascii?Q?vkYnFbejRH3my3ceIrM9RuO929LtBL8W83czBZCYE/Y6RUsC/pNLAhpO7nye?=
 =?us-ascii?Q?3Nm4rA6xUb1wSVt0J/BDURsXsxZVc6km8kAWfvqcPzdGm0z4nQhv/zmTuxe9?=
 =?us-ascii?Q?4q1o4IdY4tZeifUlV6VhYAcaa2MW8R26foSYwoIuMf0PSvllCr3ArPmKMnkK?=
 =?us-ascii?Q?L9YUCbr0UOnLG729XTvxTB8ybLsxvLTTKoLLJ43O/QrssLAPCIyKxXV/mSg0?=
 =?us-ascii?Q?kD1m7z5evLN/x+NK9uG2xJP4ejf79GaN7Q1LFpVlNW8mZptseMa27R43jYxq?=
 =?us-ascii?Q?iG9XDM/9K0ZuB2gAr6RWG0WXwmCx1wKW+DnjQJ8cQVhbiLmamTvoaYba+KZD?=
 =?us-ascii?Q?JDb6U5gXxh5G9zavFj7eQW/TT58Qu6Myh78t3/lUvqyZahDPCRtGLrmyugcb?=
 =?us-ascii?Q?WdY+xPcG7bLqTFMrIXYr8PGz9I3OYx0cH8mOp4Z/u3egH0WFaiMeT2eu7Usz?=
 =?us-ascii?Q?7IZX+BeoOxdtjI4cn6y3wPYBlAtjFxF7Ea7l171rd0uLmbqPhhHdgTugYkvv?=
 =?us-ascii?Q?ScyoQDzrxdl1f5gfmEvF3vxuLefIXJ27l0PWLq9gdst7iadw9dLHyL2t37hG?=
 =?us-ascii?Q?aZr9CnyQk+/4wdsylGjyCSjOKudZQJbJIbqhOvxfW+h6BVJ3wV2GCFJVOsBh?=
 =?us-ascii?Q?K3FssS2bx/v97W9VeJqcrrRpDDNQNnyNhOM3coEdneMskJdEzosPA/nKZj3L?=
 =?us-ascii?Q?xJV4gdm7u9gWqnjCsajAW5Zk9Wj7iRGIAhv7vMVYZur1BQ5T8vbqZjy5RGXp?=
 =?us-ascii?Q?4nyiNBQNTWAZQo55JHo3OYaGCA933+DopC1VZez1kJl95F18/jbSQNyJHuq+?=
 =?us-ascii?Q?38bCkycaUr2yrN4nOPB3SvU32muGZaEVjHqRNtYGDya0nhRg5g4ovshNhBG+?=
 =?us-ascii?Q?tV88kQhq40DlWCgU47cM6T4jKd2A4mXp1ktYS2659gRsDOTGWoP0PDgVxcNV?=
 =?us-ascii?Q?5IKqNvdOeRP5dQJHLhQ3f+BaySW6M3pUP7//et84ikldhDS6Rj5tMQOvYSWb?=
 =?us-ascii?Q?mf5IN9W66IhP45C+MvHZ/cJ/NC2HHr3bkOQCQkxcG7MZfiGF8lHZButCbtUN?=
 =?us-ascii?Q?yFYm/xWT0B1Ny0P/GEEVD+UF9is32thURr9ANYJiAm2jxN1V9Uyu7MkZJw3h?=
 =?us-ascii?Q?y5LYHfhrtrnUqSxm/DkggAPF3yt6cniJ4HTCiCSSV5N8u5g6tcdsVyOBxdZ6?=
 =?us-ascii?Q?uhvGgt5hNaJW1Kfx4Cb+Pe89wkLM2vsLyu2LAzE2bLHvv0puiQTWYKA6S9rB?=
 =?us-ascii?Q?4F6ssPuYpcq+G82Hnaq2evLiN51y4Gq2yOtPDbwkjglpNY7nFRv8exFfJNvU?=
 =?us-ascii?Q?xmi5fZHo7a2tG2eClMP8LXgf0lvTisE5KXnK74RYvvx/nmLPxoL5d8tdb6Aw?=
 =?us-ascii?Q?UDzHFqTf2KxnMo7TYJj7+s8XhDTF4mT+xVaNU8b3XfWyHqjiQB+5xwfWjHuj?=
 =?us-ascii?Q?Ij9b63F0uhC+OMpUy+77DJsCZkbkh+RyIXk4FUqdY4dLTq7F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca48d91e-86a9-430e-e528-08de728bfda6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:31:11.6078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPJS1DQy6vRAKM0okqiH/y1Uq0qtCBpgp4cBuubnwiPabWv5fK4KQ1I+dbdGNseP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: C6FEF1718CE
X-Rspamd-Action: no action

Any user is supposed to zero their allocated page->private at free time,
including both head and tail pages if the freed page is compound. Add
VM_WARN_ON_ONCE to check page->private.

Whoever encountering warnings from this commit needs to fix code that
does not zero ->private when freeing a page/folio.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-mm@kvack.org
---
 mm/page_alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d88c8c67ac0b..d8b7f36e9364 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1410,6 +1410,7 @@ __always_inline bool __free_pages_prepare(struct page *page,
 				}
 			}
 			(page + i)->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
+			VM_WARN_ON_ONCE((page + i)->private);
 		}
 	}
 	if (folio_test_anon(folio)) {
@@ -1429,7 +1430,7 @@ __always_inline bool __free_pages_prepare(struct page *page,
 
 	page_cpupid_reset_last(page);
 	page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
-	page->private = 0;
+	VM_WARN_ON_ONCE(page->private);
 	reset_page_owner(page, order);
 	page_table_check_free(page, order);
 	pgalloc_tag_sub(page, 1 << order);
-- 
2.51.0

