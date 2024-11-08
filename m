Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4039C22AE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 18:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1675210EA1B;
	Fri,  8 Nov 2024 17:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWu07Yev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1545710EA1B;
 Fri,  8 Nov 2024 17:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXQaXW4k3lPpGtHl8QkybTSt94vDykgS4Wyp+xKXysXbGX6lmXBJqJE76FZWQtE21ng+LzNmLa25udl4PyYs77472qsUoVGJI/36Ma9is39K1DOiLpa52H8GbkGMNHNDBUL1zj7y5uFX/QIepo5r0eApTKqS/oxgzAL3Qp2tzXHZ/B2zOSKZkMAcTIVxJB4vwJjnmDh9vJCuLserOavq50wvOa6gOVdz4glhUH/Ou2BGWVM0WdpRekqRuv8o2sWYyxoKDdqK74xchhIysEJJYv6m2dFlDa706rqvR5AMP+OtAJsqqlqf/cF5bT4TR/txaGY2Y8plb0nWzrz8GOsD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//uN02JBa2w1Rs/po+9aXDE/9/kIOy+mFQ9ApdaZpso=;
 b=vA5nxlUDjsoHHjfujgS5SzqXcra0Yh1o+Wda2sMMVjcs/2uJ7tAVS9858ioQHN6i9mVdS0NpM1ILfVP65Qx7xrD91EDAOPUsmSdAyUFcYpA7FEUronG8vCpqv9mahwAK5sqaLuRxaXcLX6nEozY3tSg3SjSOT/JilSZP4xKQpCVXUKQ9z7K2R6xcMYj4YaoZ0+7ZRAfakNPDlPKugebzFM2KHgxr9gLnPNReoH9LDcHEQ7KZqVBFzuJt1wxOvMdhJil97Z7y25NnjQkqMaVTdlTRyT/uwNVhlbiydjNViKdt8vlE7Y91fI06fX+bAxe7rxYQ7t1KOx4DM2sYHF2Fnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//uN02JBa2w1Rs/po+9aXDE/9/kIOy+mFQ9ApdaZpso=;
 b=oWu07YevNfjUe+iQmEu/5qSBwgF2NLeFIHtjaC3M/1t7WSS8nTkBtaToVvHQ94IPVLBC22X9LOU9AAwyg0wvBoXgLjweaPYegbmhLcgkhcs7zEopLny8Gf8MiX4qV7Tsm+j/1TevT9y1AwaAkjMrMauY/LZbZWpAKgd1GToKOk5kh8DSIhINNserxKuuqFR7WQZJR1K2II9ffit7FocHyUssDwNxc3dOsrhHfVmjogZAA7yDhSOzra8v4+T/BW6YR9eV6ESXo8XFsM/p51ngl4q8kyn9e0+BLwdhD8x/SDZa6IQAz83RwEW5m4vx2zrwgSdraVxbwyyavHrbw46h6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 17:05:02 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8137.021; Fri, 8 Nov 2024
 17:05:02 +0000
Date: Fri, 8 Nov 2024 13:05:01 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Fuad Tabba <tabba@google.com>
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, rppt@kernel.org,
 jglisse@redhat.com, akpm@linux-foundation.org,
 muchun.song@linux.dev, simona@ffwll.ch, airlied@gmail.com,
 pbonzini@redhat.com, seanjc@google.com, willy@infradead.org,
 jhubbard@nvidia.com, ackerleytng@google.com, vannapurve@google.com,
 mail@maciej.szmigiero.name, kirill.shutemov@linux.intel.com,
 quic_eberman@quicinc.com, maz@kernel.org, will@kernel.org,
 qperret@google.com, keirf@google.com, roypat@amazon.co.uk
Subject: Re: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
Message-ID: <20241108170501.GI539304@nvidia.com>
References: <20241108162040.159038-1-tabba@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
X-ClientProxiedBy: MN2PR19CA0060.namprd19.prod.outlook.com
 (2603:10b6:208:19b::37) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8d0b6c-5c6a-4b68-0146-08dd00177c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2++y7XEbcBiMfgOEs2XAaQZ5LW3CIKcw9p6kwu9Bzz83g4et4/VKPGnA8fYf?=
 =?us-ascii?Q?tj24DWehjABfDqVzQkp0h4Jq9R4IqcNHZ15jPUQNJcYKJBhXrYnXWlDXHV5y?=
 =?us-ascii?Q?0P4qCxbY3sKNdBHNoS7QPRfYOSSSqqgVY9ZcTCWKn+QS6tE5jUHDuDbYaumC?=
 =?us-ascii?Q?K6H9nccUC4aMD1gdKPqhGggU5tEQhls2ddGIxE6mXWerazmKAfPWaRdiDycc?=
 =?us-ascii?Q?mzbA/UNyyd1BXHrWXm61YBJ6DIpVZU5Pv5rNbbA7LnnpF8QNRm75NqYtkR1p?=
 =?us-ascii?Q?Fy+nGFrmPc1n/Zttp+m5Q/YvHIMwTsSpyNoV4rW5i5iZsZ9+DxXlzH+ajRc3?=
 =?us-ascii?Q?v75MU5iV9NXvaEZd5RrmWoQysg5YDCA2SCutYeUqDPShXuSlGNbafTNN+UkJ?=
 =?us-ascii?Q?gaF4mlc6JAvMfmkLF9D2CWkes3I3K6Ii41ciZcaTItLzKSvmy0RkSYG8eRQw?=
 =?us-ascii?Q?c2WapThAGSDVKzvGohz6DnGhjvRtUChA3U3dxqwpAJJtejkW5FoYqNV4/bHK?=
 =?us-ascii?Q?tYV1XAw7Z1ywqEcEKUqE3bVazGRYVhx+b5hWDlWoPsXoFSFlpNdNZyTxi9cx?=
 =?us-ascii?Q?bahtsEwZ7DXCDMp97OTJ2coV3k2XUszJ3rmfxPNPBKj5+q6+5wtv6N1zoabQ?=
 =?us-ascii?Q?r9O+V0GofbzOuPzfnmS4aOVPNrS9DvBi7VEKByIvPZDtQBohfnQSDGyqM8oY?=
 =?us-ascii?Q?J4fw4pvR3kJHf+ynyvJLowx0hJsEmMbB/Jzdk+lCYI67RgBc08dYCTty2Van?=
 =?us-ascii?Q?Wj+z2yNznSnbYmTMXiHcg+Tccpz/bGejZPf52NYfcpycJ8G1N/yWGXucDHRF?=
 =?us-ascii?Q?YekTufgP9tyEnay7Vl4oGtpyg4/E+Egx0FvnYGftTUhmTionda/S2n96aHJs?=
 =?us-ascii?Q?3Erkea9i0DKO49YygeT2vQTeEjgzPUrqHUkt6diHAdx+vp6A78F7Co7wOc0+?=
 =?us-ascii?Q?Ik1YDN0qi7I8Xqtcrni0xG7wFw4mZvgjBZAmF0ZRsfA+hrpW5oqTHwDw8fnY?=
 =?us-ascii?Q?XXcnnD3eFV09fPLRKFHS0vrDblsQ972UY+cWIBERnBQWkqHAntX+NFZKRLD0?=
 =?us-ascii?Q?Rv3bJnfXI/RCUXNt/bzRnWQh+fMZoJVRwJImwJReh57GafK0zbedF8hy5Wiy?=
 =?us-ascii?Q?zXZGBlFZUrtixAVSv2FMKVEjnkWDxy0fG3CKCxt4GrIe9U6hQHyNlLzPkftv?=
 =?us-ascii?Q?vhUKU/gllFZjS4HRKv7WmrBgM92Q49ruWKIGJyrZs/sfnLqyn0mqRxpFwrSS?=
 =?us-ascii?Q?S5wkMaSUCctr0I21oBXSCZvpjR5wvN6Rz38stIU6GpAzUHPJVEa5GTRL+wF3?=
 =?us-ascii?Q?MO59Tpvri8OxEemThy8ioW1M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+C2GjXByB1c8oXSDkfF20PxgCkwnUUP9MzJma1eOBupn0MG7y3CIEFpt1vX?=
 =?us-ascii?Q?Q6F8vY11EhxpZ6///1Y1vPw82a3Bl98bw6dFklAvRopU98fRHa6GIswp+cnD?=
 =?us-ascii?Q?oh4LuBzoWGF8gKGup1wrCqOnsp4GnDFoxGQnIUMq3+zY1d+q9fSRk9sixr7/?=
 =?us-ascii?Q?77//xM4d8F7os3vn8F80S/6HAXojX24HVnU9UNjKLpNrBzrLfOb+pVRbgUj+?=
 =?us-ascii?Q?D7dL2NViffYyI6t3FE1/eeEdCddmABjXwKTdBrX1zxR3D/bl6kp4EIRrdQrJ?=
 =?us-ascii?Q?fTd/6yGQveBAAEDK+u7LUIXY1AcM9ao2AXYxWGE98BDvTFVPuII4EAMsev+b?=
 =?us-ascii?Q?cY4XJflf+mRDTI/9fEAJbutAzmVWIZNLV28DmgEKlsGshPGp3a9j5bk9h0ZS?=
 =?us-ascii?Q?ErBKmRxgyQMTTCjyMD8bIYBllA1hXiHWwSS4SwEQATdwan4xtSzLL+yA49kO?=
 =?us-ascii?Q?tofpLG/IJ6cRkKKqZF4NnOs6OoPhtkzrJKT0DKnoncM+bJ/FLDgRkwGJ7N+k?=
 =?us-ascii?Q?UL5SEXiLuLZl1VRpxjRsS0DMz30JaHyakkMbPLYBLj0wVwQl+CrKeknptS+j?=
 =?us-ascii?Q?ZUHa5iTujhqt8bGoujFamUmg52sjMx7KXjCx617ZLhZHzwcF1c4CMlJ4hl22?=
 =?us-ascii?Q?WJuCOlsjkxFAZje+1ZmE4S1nahTWkGPYjkG8NTq0q2tmOZjjR3bkSXeGo5jP?=
 =?us-ascii?Q?4ZGu+i9hLlOpgvDSOznvFdEqbLTcaJVTkhKBNMNNicsToWnX6tfQcJ0iTL83?=
 =?us-ascii?Q?Yazv11W2ZyPAW6EVM0l/1Hr5l8C2dB5nxuolr5oZuR7mKe4M7ZDlyYEpkcAR?=
 =?us-ascii?Q?iPIIIfUOgAeFIjvRez/gm9TPFrlUBag5awkz/+Ns3ijXGpKGubJjdExCOhtk?=
 =?us-ascii?Q?v+wX+ohQpn+KKoJBPO8gTi/9FcxvFDbbs2gPKYqbu790MVLz0ZLKWNd+6QdO?=
 =?us-ascii?Q?h42d1yL2sZ5Gl6HORqbix+EMxnQi3u0CK2AFUPE8OVWjdOsiLi5RL/rgVtyR?=
 =?us-ascii?Q?g44TeiQpZV08voaaHdcIT36Xu2TEQz0Onii60IZ5J5hiYneFL5JAEhAapJ2l?=
 =?us-ascii?Q?uGCU1fSFVNRr3Z43yxzuxzUaXer7dpepVHcSsbcwjB/gRk3iNt3U0oB8+aoQ?=
 =?us-ascii?Q?FLtH4WXSKa809/k1zeOZlrLsC2ByDr249K0O1jplrH3/5WUlfMb9pGxHN130?=
 =?us-ascii?Q?XixOgbDmC6E8I7ZILMFvOx3RachHlDtt4VfyjcZPFnPe4E/OtEUwFqBAdTTR?=
 =?us-ascii?Q?+1CUfdS8M3GQOJrBUNxCDEoHU64xCW/d2tdwd+xblGs8aVHUgHLx41M47u5F?=
 =?us-ascii?Q?XB1Wy5D5SjzV4xOKAoAIM4bicLUdKLDUPgkrSfjwjH0ibHONOoEyn+341Kp8?=
 =?us-ascii?Q?HzoCDvsXghMJ+TTD18o85nx1LVzyzMZQ39KZBWta9YrOHxZ7AUOaPNNtE3yB?=
 =?us-ascii?Q?PpkwHwRnrZiv9g+y7cN97e7KP68HIb5Yi74DQbdEGNyO3LTv+zs86mhUc6yO?=
 =?us-ascii?Q?V+YchhgQ3iIp3JbRwvjbIAp36xDxV9NoKePAPOgUGrpGOe/CsmWxJeBPnCZ+?=
 =?us-ascii?Q?X6+HytxXPsigUeHevdvYMIvOvzPJm2Aw5+eUesHE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8d0b6c-5c6a-4b68-0146-08dd00177c01
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 17:05:02.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI7yVwzkSnE2pVJPxwePzoViAy73wVhvzdYoTSaD/xDHbElb4TQ6XAvEe7bdPJoH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
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

On Fri, Nov 08, 2024 at 04:20:30PM +0000, Fuad Tabba wrote:
> Some folios, such as hugetlb folios and zone device folios,
> require special handling when the folio's reference count reaches
> 0, before being freed. Moreover, guest_memfd folios will likely
> require special handling to notify it once a folio's reference
> count reaches 0, to facilitate shared to private folio conversion
> [*]. Currently, each usecase has a dedicated callback when the
> folio refcount reaches 0 to that effect. Adding yet more
> callbacks is not ideal.

Honestly, I question this thesis. How complex would it be to have 'yet
more callbacks'? Is the challenge really that the mm can't detect when
guestmemfd is the owner of the page because the page will be
ZONE_NORMAL?

So the point of this is really to allow ZONE_NORMAL pages to have a
per-allocator callback?

But this is also why I suggested to shift them to ZONE_DEVICE for
guestmemfd, because then you get these things for free from the pgmap.

(this is not a disagreement this is a valid solution, but a request
you explain much more about what it is you actually need and compare
it with the other existing options)

Jason
