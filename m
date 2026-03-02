Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGH6Ds/+pWlQIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:19:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF151E260C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81F310E5D1;
	Mon,  2 Mar 2026 21:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sEp0/zPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8E210E5D1;
 Mon,  2 Mar 2026 21:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDQv/LPFzERYG155gJ1z4aVPhmuy3Mk9OlwPX+PvzexLAq7WiWkxLYo8+P+pB93bYSyH/OCiVd/M+mLAGYYerWQOtflvTnuOgeXN30a87ra4Q/dfKSE57Tf/Zn40bVnTNtHySQtAan3YamhWd1KCYkYIiX3UzwbrYZRDyFRYx7fE3nwIzA8568cX6nTBsIXgW2Th41ommg8wForR9CoMz1ukhkiiLCdrElAaFtWdJ7HwJdVwyXFWF3z/o515JB8dMkGTczA6/1A2o/Tn+h2sglbe++Y7bZB2IfjOXrII58Uv7k6nqemB1ZDcMPL+kBfQttmjxNXzeF3xtPiZTRXNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOQmMXo5C3WJmUBAdjBvhCpEzy4haUJs6C4FtTWL4DI=;
 b=YlR3+FjSPrk5vuYhthsoRbiKxXHGkZmTVS1advtpZ44XLS8RAUx6nsDczwZ7x2tmT0L8UqkmaEgg9aRS6z5AoD1h55tk/+S5rV/Qa5igRswgDer3Wkn9Qwm7p+cYb4J2NV9EqTtqUWBf++JgMswmoWlekYFHRaETGO6oUV2WJc0XWFzzBHl1EGCqpFjIpPa7brty/0CG9PolLSm+ep279MAr40rxgKgSakU07B5sr1aaS3EeSTPQMH8PKfukI3YFR+F9USTyKn2H6ckJYbv0VKr2XYnconCKUrwvH2S5htc5sHjkS9YCAHiGpCYJTNBJc+5ETGei2gGlg4kgcsBEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOQmMXo5C3WJmUBAdjBvhCpEzy4haUJs6C4FtTWL4DI=;
 b=sEp0/zPPfK9X15JRlAXtN9JOEOAw+jYFDOikwch3F1fvzk02LXkPHvOPRDRbtwu8Hpu9rbrNpJeGsdUYJ5EEMoBnB29KR4qbQETds03ikN5241g2lZNR3/iLyMldwB5OrsBOs9lUbmZqYiGQEtQnHaP+82XWWfWtrBR5cNfr58EUsrKOhM+3d4SyRmcodHf/zNcyIXNiyY8sN7abmHbeqesL5j7brgNZQR7e8hOBH1PoztZiY3iH6Ko3vaksPs4EdYa3EqWxXW7dphrbuzO2MXHAPGzKeL2ag5P6Sxm2eBHzXOi970Wr54MTPKdYXn6z0oaVaQlREsAqmDLh/mK0gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Mon, 2 Mar 2026 21:18:58 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 21:18:58 +0000
Message-ID: <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
Date: Mon, 2 Mar 2026 16:18:56 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>, arunpravin.paneerselvam@amd.com,
 joel@joelfernandes.org
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
Content-Language: en-US
In-Reply-To: <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:208:32f::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 307943e5-22c3-4ddf-0eaf-08de78a15122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: cFB/r/fATCI+FAkCJOhmsCL6NbJulqyIk4Gj0ydq82rY6fGQ0kGcVicTUOSlEOSJomsndWn0zDWAwO0+j0H+qt+tIzctd+eRPqjkp+2XWlAwpgGHVXFyDnde/KeK73ov1xcTlJVJ1qKG+fYNjkP8NTYKjmQAE6QEuGISBldO80lwia31+7E4ziIunUSggpw8jTPpvTcbOdicVN4grNGhvzuzjrnLuCH2p6DWLTXc+f+WR2yMotZzGQH2u047KF72E1RPDjrz/IHSP5lEQEyzczIcP92cVlm5uFNzrPwyE+gBjY0L/GWfr7x7xNlXSN/MzhPIyS1HsiJ2buApezYm8qz1+2FvIaImNV1/LWE1b1a5AXD8K1V2dSV3Zd0nnhuuzRyIyLc2FulwdHTqWvBB3R+X04pid34L1qjJmHm7Uubbl4MbYHcR7qrKEnh9/BsP3rlfYl1m8rXLbWJCCKyRQbtP2ERJdoCzRO+FYfrxJl1HBpYvw5MKv1yXN8GhIDKZh3DrOGn1oeDxWH9O/n9BPHWP5M7pRUXH5FgkZiYflFP9i+jDe8ZvaNvRS4AHIUS9cuTVwXl2S9hfa1SgW14U6XZed+Y3b4c3bOSVwr85nNqjS+HRRnUgWqzbmOUCFhYcQWBPhQz4JGdW8wZOTiXkaKo7ch4Y/j26p0PLDyxG2GHPxvZFOUFVqfemk2bFSd3woC0+8CTGFDudpQBgruh9dXNshBXTfojIrcBcUjMjZEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUtZSnJEWkJlS0U0UHZSQ3ZXYldXQVBTVndlNnd6Y3BiNmRmOTFPbVJoeTdS?=
 =?utf-8?B?Ry9HWHdNWDBQeFltU0htdXliT2tOVkVwQ2VzdSsyRHZ5L1owK01OTENQZ2Rm?=
 =?utf-8?B?WFNHQ0duNFFTcm5pRWpRYjdYMllMMGpCZkNaOUtIQXU4NUlwd09hRW1ia2gx?=
 =?utf-8?B?WWdPZDd1NXBzYW9JWTRtQkUrOE42cTh3NERERnZWZlJzbTZyOHJCejVFMTVL?=
 =?utf-8?B?N05ZNkdWZERUS1p0Qm9iOHU5aE5qZCtyaTYyeHlMTC9QRkhBTmpDeFV1SkN3?=
 =?utf-8?B?N1RxRzFQYTZOekhjVjUrM1duSGJ5eThzMWxWc2duMEluUjVLVGFLUWhsODN5?=
 =?utf-8?B?STR1ZERoNVU3bUNCVkRxdGV5WTE5aU5jTTZDbGtOSmlKT0FLY1lWQTdpdGF3?=
 =?utf-8?B?RVV4RGJQRW1vbTNzQytRbkNNT1gwSjhkTmZuMXBMUTZaT1V6YzVwU05aa25E?=
 =?utf-8?B?OTFqTGxkQjNVZHpsNFNMRGtiaXd0YnZzNW94WUhIWUZZekg5a0lTWW5HWmRl?=
 =?utf-8?B?ZzU1ZkRVZmw5UnZJRkY3UVNZME5ydy9SdXNtN0x5L1FzUmRFSlAzcGJ5TnJl?=
 =?utf-8?B?U2grWjZEUVpaK296dytmYzJubzN2NnROc1RkbmZYL3NuQ0tubmpmcThmSnhO?=
 =?utf-8?B?enVLcU4zUWRTNVBkV2IvUkRpWENaT0ZQaXE4eU81YUNBTldHdi93QUR4MEYr?=
 =?utf-8?B?TGN0R1FqOXd0UjFzRlN2V0tjUEJzQlRjMnJ2bldya1Zsa2RMemE5RzhoY2JU?=
 =?utf-8?B?anpRajFidk9vUEpWckpoTjFqNFR5NVNqdHhIbUx1ZGgvRk9DZmJYbG9qUUh6?=
 =?utf-8?B?Y2huRUhnZzQ2bDJyWDA4Z1JvV1VtYjdVUEg0QVIrZ2hVTmhHaW0vSGhubWdN?=
 =?utf-8?B?eEVHUnZBalJuM0gxeHd3Q0tMSmtSL0YzZUo4RERac203bk1KUGZZQ21RdVNY?=
 =?utf-8?B?MzVsRXhrQnBvbFloWTlaQ2RHaldBUDFsNS9MRjVuYUxHdHlGZzJ6Qy9SbDJt?=
 =?utf-8?B?UmJPQXhXa1hiNWJaT3M2MHlHcW4vdzRmN0JtVlBPUnhzK2tyQnQ3a2hHUHY2?=
 =?utf-8?B?b2RjdE1CQUR6cXFPMFpnWEk4d1pJL2tkU3dkMjJEeWNMT2lTNzB2VHZPSHNt?=
 =?utf-8?B?eUw0TFJBc1Y3SW1SK0pxMTRCaks3WHAvek5LVEY0Zm9nMVdrNnhNcDVCeGpR?=
 =?utf-8?B?azRQY1QzVnFYREQzcG1NWUdIM25vQ2t3aHhZMDhET0VVMnFlNDNuZ1JPa0I5?=
 =?utf-8?B?ejVHNHNJZVFRZk1KQjU5WUMvSXEvMlkvUzJsSFd5MXZhNk5nYXl6em90V0FM?=
 =?utf-8?B?YkZuVyt2RTE1bUNWT21kNmY2Ui94MG5MaGN5ODhBMXpmeWo0WHZqZk02SFpm?=
 =?utf-8?B?RGpaKzE4M2JQZU5lNm5CemFKeXRrcU5iNjVqclpvbXhwWmV5cU5iTUtuTzAr?=
 =?utf-8?B?YnR0WXRHRnNUN3QvbTNhV1YzeVpnMGo1dHVsM0NvUG1PYkgyYTNkU3FRdllD?=
 =?utf-8?B?YUpScVZoWjBHR0QraysySGdtb1hlOGpoZTVZUnpkZjFiaGhVMnkwdkxJOUY0?=
 =?utf-8?B?WnRweHhYeWxzWVYyQ2cvTXB1WDdYSlBRMEQyS01FazRNMFdlNFA4cUtnOUpk?=
 =?utf-8?B?aFcyR3hHdWlQbE5OYWlDSHpRcFRhYzBVUHJMcGw2SXo5RU9CN3JJaytLWmFk?=
 =?utf-8?B?WW1aaVlxSFJWeEhqSjlQS0tMSFNST1Z1VTh4TzFrSElRZUZ0TlVsZ3dubEor?=
 =?utf-8?B?elloU1JBWjNGN0Zabm9SdWZoS1AxMHUrNXRVaURWQzlWOHNPSDhoUE5Va2x0?=
 =?utf-8?B?blowRFQrUERZWGxOU2VabStkcDNGM2ZOZUVTL2g5aTMvK1FIL1o2N0prMCtT?=
 =?utf-8?B?Uzl6ZzByOEpYT1dPT1VnZlpEVlNlR3hxWVlkOHJ3YjZwclBXcFRPWlB0OXRR?=
 =?utf-8?B?UzVtK3RGN2hCSGx3b3RPWWI4WW1PalRhWnJVamc4MG83WE1RZThoaVQ3OWtS?=
 =?utf-8?B?S3YwcG9HLzRWY2RNcnZSanpEdmVhb2hUMFl2Z20vRXg0OHRldi9zaGp3M1lo?=
 =?utf-8?B?VGgxVkRhbFp5b2l5L092UHJwY1N1andiZXJ4SEZEdnVueGxCTEVZVTdqYVNP?=
 =?utf-8?B?WnZ0Sks4NElsVXdoSWFkSTZTOHJTN0xUWkVwelhNVGtmRUVmZncwWHk2Ujkx?=
 =?utf-8?B?eXFTSzFZUW1sdHhqZ1FCa0E3UXJicGl1TTFGVmMzb3VzeWNsOGRCZi9UT1Zz?=
 =?utf-8?B?SmtFck9yRFcyV3MwK1Q3bC91VWVFTmVlQXFWc0NUR0liSXpBQldOZHN2UFNo?=
 =?utf-8?B?Q3Q3QnNFNHdBcG1QN0pFbmZmaHJVWk1qUlFWa292U0s3ZGF2b2prUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307943e5-22c3-4ddf-0eaf-08de78a15122
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:18:58.2593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6Mf2HgQ8w8dibest2PI9Zd+Tjya8ookiVAncbvBftJGJOekJ3oc/+tzznblIpaeKKWRw7PANatWsfh9gPMhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
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
X-Rspamd-Queue-Id: 9FF151E260C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

Hi Danilo,

On Fri, Feb 27, 2026 at 12:30:20PM +0100, Danilo Krummrich wrote:
> >
> > +RUST [GPU BUDDY]
> > +M:	Joel Fernandes <joelagnelf@nvidia.com>
> > +L:	dri-devel@lists.freedesktop.org
> > +L:	rust-for-linux@vger.kernel.org
> > +S:	Maintained
> > +F:	rust/helpers/gpu.c
> > +F:	rust/kernel/gpu/
>
> What about adding this to the existing GPU BUDDY ALLOCATOR entry? Maybe you can
> offer Matthew and Arun your help.
>
> Also, this wouldn't be a subentry of "RUST", but the rust version of GPU BUDDY,
> so it would be "GPU BUDDY [RUST]".
>
> Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRASTRUCTURE
> [RUST]" entry.

Both these additions sound good to me. Just to list all the options below
so we save time on what we all agree on:

1. New GPU BUDDY [RUST] entry.

2. Add it under the existing "DRM DRIVERS AND COMMON INFRASTRUCTURE
   [RUST]"

3. Add the rust files under the existing "GPU BUDDY ALLOCATOR" and add
   myself and Alex as R:/M:

Which of these options make sense? Personally, I think #2 makes sense
since we are already suggesting to add it to the existing DRM RUST entry
anyway - we can just drop the new record and add rust/helpers/gpu.c
there as well. That's what I've done for now. Does that work for you/others?

> > +/// # Invariants
> > +///
> > +/// The inner [`Opaque`] contains a valid, initialized buddy allocator.
>
> The invariant should be justified in the constructor. Also, where is it used?

Done. Added `// INVARIANT:` justification in `GpuBuddyInner::new()` and
cited at all usage sites (ex, alloc_blocks).

> > +// SAFETY: GpuBuddyInner is `Sync` because the internal GpuBuddyGuard
> > +// serializes all access to the C allocator, preventing data races.
>
> I think it's more precise to refer to GpuBuddyInner::lock.

Agreed. Fixed to reference `GpuBuddyInner::lock`.

> > +/// # Invariants
> > +///
> > +/// The inner [`Arc`] points to a valid, initialized GPU buddy allocator.
>
> Do we need this invariant? Isn't this implied by the GpuBuddyInner type?

Right, removed.

> > +        // SAFETY: list contains gpu_buddy_block items linked via __bindgen_anon_1.link.
> > +        let clist = clist_create!(unsafe {
>
> This macro has three separate safety requirements, please justify all of them.
> Also, please also use markdown in safety comments.

Done. Expanded to justify all three safety requirements.

> > +pub struct Block(Opaque<bindings::gpu_buddy_block>);
>
> Does this need to be public? I don't see it being exposed by any API.

You're right. Made it private.

> > +/// An allocated block with access to the GPU buddy allocator.
>
> This needs a better description, i.e. what makes an `AllocatedBlock different
> compared to a "normal" Block.

Updated to the following:

/// A [`Block`] paired with its owning [`AllocatedBlocks`] context.
///
/// Unlike a raw [`Block`], which only knows its offset within the buddy address
/// space, an [`AllocatedBlock`] also has access to the allocator's
/// `base_offset` and `chunk_size`, enabling it to compute absolute offsets and
/// byte sizes.
///
/// Returned by [`AllocatedBlocks::iter()`].
pub struct AllocatedBlock<'a> {
    this: &'a Block,
    blocks: &'a AllocatedBlocks,
}


> > +/// - `block` is a valid reference to an allocated [`Block`].
> > +/// - `alloc` is a valid reference to the [`AllocatedBlocks`] that owns this block.
>
> References should always be valid, no need to mention that.

Removed.

> > +    block: &'a Block,
>
> NIT: What about just naming it "this" and
>
> > +    alloc: &'a AllocatedBlocks,
>
> "blocks"?

Done, that's better.

thanks,

--
Joel Fernandes
