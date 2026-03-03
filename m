Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBE9CfVop2mghAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:04:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603681F83FF
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE3D10E8EE;
	Tue,  3 Mar 2026 23:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1B6Mgx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4EC10E08D;
 Tue,  3 Mar 2026 23:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772579055; x=1804115055;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AtPEvmDgSBRmdq+PFHBKWJ9nzLOy4xn7/MVfJMwVqgg=;
 b=F1B6Mgx2jY6ZLZGZd5XD67BEuaJAPBHfT1/3syYG03of3cnGWLYNu5DZ
 qvC72vAC7m6Tv7QcuX556GAaur5UVE2Mp5lK2aEA3GQc/Fspr9z9oBlQa
 aO64eAAMD+aXZxgXPJJBEiGfB906wW9LCnsXHuB7hPZYKMeBhFGmCKgms
 MFVkE/ZtOMLL+j9yiIRpBum4p4rzS0xsYZ5Ik3/OGYNb/S7HymHk7N6+W
 KR74sE0763TasUf04niNGhseXjXa+qYp9rOE97o27rtYbWfxyhdwYPAIR
 ivzSoCKQHPaEg4YGprpbO8YI9hIhws+qhUejexjNzQ4v5XX4w++Lk2uUg A==;
X-CSE-ConnectionGUID: 9CXI7yfcR2qhNB0hS0E5eg==
X-CSE-MsgGUID: 8RScHfrTQXaPs5MrsvBWJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73596405"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73596405"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:04:15 -0800
X-CSE-ConnectionGUID: SuV9v2EXSJ60RxQQCh9kLQ==
X-CSE-MsgGUID: RraTQ4lLTy+S8R2Wu2PNlQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:04:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:04:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 15:04:14 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:04:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmdBHvASAy5MFDhq6TYZYKZU8dQfoZX4QK6HEeQ4I8MhkDnQMq2jYNiw831+RclWkxcvYL6lujA0ayLc0CB/ypWA+sVMNRGqy0tM/I5l3Frgb9wNN9EwKkhkTXVMTM44VkU5yw/AktRnHvJ1GnzQDvFigIK0XIeyFETbuYey/cBxJbF41HG1nb7Waq1e5xXimLWMqf0EDI+Wl8JMR/xiMZk4TpPbH4uTBU/83tqnzefuBXIrvP7dXJ00gk9ajQw37FFtbrj3LEfmezTUJhwaGo58ZvN7XvedGPbgx8QU9lnC8p7kM7Kk/drIo6BjQF8KIK3mpAawxSFzlvACEbwXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBkdVvq8ctvWBfdLR8zh8bqxdhnR4f79oMd4lmorL88=;
 b=MPl2jKmduUY4XIm7npuWe6I+lY9rBONcl6ccbO6BRsGcNvg4vcUvCP/JSnArkab5j2snBm9BzEnbH+ACtSx5CCiykMn1M7m4bnyzAabO+V84JhPgAEQBfxGje6Wzb3N+yF0Ko9tuz9SScZdpnKQ/ZIYhqm6ezG1Sqcpf/OfDGaiJDxtDgkhosaeCQleLh+kZKiH0jSmkICtDSqkns+nOpWNXv4s4K9auTZPsa6ip7HQlYsD6RIjJVK+GKhTnAUle4Tly2rSXkq9lZ/YvNOF9z6m+2UW/qy4mRv92oaBqfPEoGzHZz3caBQsExxq/3nDQ5LEUCC5KxQqkUxGRQGXihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:04:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:04:09 +0000
Date: Tue, 3 Mar 2026 15:04:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] drm/xe/userptr: Defer Waiting for TLB
 invalidation to the second pass if possible
Message-ID: <aado50/FJE+D0H51@lstrano-desk.jf.intel.com>
References: <20260303133409.11609-1-thomas.hellstrom@linux.intel.com>
 <20260303133409.11609-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303133409.11609-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 105ba5b0-cfdc-44b3-b175-08de79792d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: NsHK8XQYzoY0P/XLZkXbBYxNSo0jLTL1nlGwpCsUHbeOeJrROITNs1/VnixnfF10od+NcbRt6hvZEZjrMf8WLWKzIvmaaf1oqaK/zNSywY5lN2mHSwwyrrdZenGSAKJo86RVt1CLw1YPmfUEbVtHCddo9QDSsefQmBsNL9UBC9u5yEYD4S5ngM8Opldt/e41OGmhroB6J9lukk2RAAwBGCa6Z39fJarvdLxlA5NW0NOA660THu9HyBq3DoiTL0t8LAIE3ylecFUPCXRfuRxnu9Q1sfNuUjSSzWZOglBCJulQSyACoGGGd9UVL7tpEK6+mdSQtpreJWnuOP5mszUlFNyddyc4fDNmvfC9ArZpgmaIKSYyysMjvkeTlkEsexyCYQhdJYnKkG7q4aXEz8W/y9kpigVlS1x6l6MXuthzrGk5QKW/knDvbV1/bbP9WPy6Xc2TQvXQhFUoaoD8RFVEt0kBAHmLMLN0o/gfAJ3/TMqDYaneV7/IaB5igyNFQSGzR/8XFO8VINSo9NaaXVsNpesL3Wzg5Gx4tDIlyWAwJJMhvegjRd9MaM064MI1mCwOwgVGCEswM6rOFWLkCZy+6vx4KIJVLxBa1L6sc3nWycQ/UfYnvDY58yYKx11OFKYnWjM0q9BR7DFgs1sBPfC2aDT+U46CpTsF0czW+87QhjpAS+qsVEcMzzuemwpgCfJLimphBVF3bHnNdHhFUtiUw0ORngseOHOP05PVQhZxizg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VItHHU2eKlgP9EYCr7MDb4vl9ZSKjHzGVWVvHAM2vHYTjLNTSSlCgtCBge?=
 =?iso-8859-1?Q?qOCXXC5qi9SwrtpdOhlLQfglD/PK/ZKZWSG0rV6s5bYbS+6tMyN5lfkpx2?=
 =?iso-8859-1?Q?RmoJ1N8UjEerpehYmxKylU3FpPUEpSlPzXR4PLMgS+PueApd6DdA8mzkR3?=
 =?iso-8859-1?Q?4/OBBiZ4F2fyzGYfJge8TYQhh1z1DGLFqw4rMKHAwelqbc5al6S85Ce/Gs?=
 =?iso-8859-1?Q?29yIeUovW+5/JDiYA+r2cRQ/R+J4fp2OgS1BO/17pzI3ChNSr9Hy3L6+Pc?=
 =?iso-8859-1?Q?9eLrwGBjhog9RqK5ExPbNdR9pSyjk9IlwEZWNZBwX7NvuoERto+6yCcR2Q?=
 =?iso-8859-1?Q?1VBpyZN5Vl6MPs+HYoPvrZ7S3cM/JxYKBKKBRTjVQbNr2f6ztRQ97aPynS?=
 =?iso-8859-1?Q?z4Q5Tyd6q+cLBaFyTjHuLscXauzFBaFL9P7YBlAY3VIzgSFcJ9+KJAClQZ?=
 =?iso-8859-1?Q?rfAm+WtypoNw+8NsKiKKFNJOuvlvQWIKOuR12NXJwEakIW1vByv60pWcHq?=
 =?iso-8859-1?Q?dN0c17Sz8PFaGpqQ8NHNMhRhkEvgGtGCF1sz2PAFKwx5GnPWtKa4d5dHa1?=
 =?iso-8859-1?Q?LHgmIkYIcrZo1DOT/I8XCf7qpd584QQl12sQi8ilTwpl9GjHV9VyHBFVFc?=
 =?iso-8859-1?Q?/SHcsJZEWfiMtK6nDiPIuCxfFgi5oSbCvTZuQXLGArILkz76dcJW9960kf?=
 =?iso-8859-1?Q?aVlLQf+bH10BwP2wAFf/SllSPG6kjD/jgNT0Unq0jSqSZioz4XkOOxPHvR?=
 =?iso-8859-1?Q?hFIvvhv6pnWuuJmlkKESeaOAV7qtYrFK106vWYVxb4X8dEN/5/boOGBQSg?=
 =?iso-8859-1?Q?jfa1GiJmUPzrZteg5XCSVP0CdbZvP+E0AFMhKnSgOI9yWoRPDCY0uAezFA?=
 =?iso-8859-1?Q?LzWxlgHfFv9N0uOAFnKbQz+064FUan/xLkBmlhnzZE0RdciC85bbQd4cm3?=
 =?iso-8859-1?Q?OtQXduJUoTyhXF0TfKnkQlmHVB5IxLHW6mWJXW/8v1jlpKm/Hye+L3iX28?=
 =?iso-8859-1?Q?zM/vZ4xjjN+uwNWpRHSW8X4QyQsHxvYpfYBzEZM0Iq4B5S1GLLroU5513N?=
 =?iso-8859-1?Q?ESfK39ZUMx8WEPW3OEm3qMHtJL2TBbjogOP+MAuV9NbiesL039bcbH1hXw?=
 =?iso-8859-1?Q?elHp3iKm8tW8xXNOkBxJvIqwp6kpe7GmlJCospp6mfKejG8jQvEjiX2Zy8?=
 =?iso-8859-1?Q?TUy3xmd09zqg2gwS2f+bwUSn7+CVEnDq5YSlHdCzljfOgT4Wci1jRqchXe?=
 =?iso-8859-1?Q?f889eIoKKJuK8+qo5KdvV+FY0q9eHgJSqXRMfOV0bKHYZO3ewO8IiM4nvL?=
 =?iso-8859-1?Q?dMAjSJfDIKt5lNdBT/fjwBajCeOlhDtq18L5Nd/xTMrL0ltT9bHLzwt6tx?=
 =?iso-8859-1?Q?nW/fAJkwX37y07VGbNPFxnNqWblCMviCpmIAnDxUXyMjVzcTLOx9QWTJPe?=
 =?iso-8859-1?Q?VYUSsI0nt0r7i5jm8Ad8pKyy75cXe66cmcjn/heRvQx3osztn7mPJy/nxn?=
 =?iso-8859-1?Q?F9Ltzv7iERcW9GI+G3tTmspyo2wPd8TZ5aL4o12IhE3/MTIafCL+cBZkA+?=
 =?iso-8859-1?Q?1ShI8PcCWzYvN7F2niZT+1rUdDxEXA22+H2MjHP/OiGIj471S2tbpgNp3p?=
 =?iso-8859-1?Q?yMqKsatnFBZNTk6IPaZyS0ysstHc2BLq02s13nlfzqWpMQYHb1FJqOr6Hr?=
 =?iso-8859-1?Q?e+FjjeSlXwVp4oL7k+5kIy2am9AQV8G9Tkz6RGIB4TeDYHFrFsIvL3nxUu?=
 =?iso-8859-1?Q?ggvb86+GCXtITpH63gjbE/pwmdioNZvI4urA7OJuJmpIo4pJm42zz5xDQN?=
 =?iso-8859-1?Q?cM+gbE1zmniGHPimbhwnn+zaH73OvTA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 105ba5b0-cfdc-44b3-b175-08de79792d82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:04:09.6097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCj6hH3Iqi+9nrBVkeoufYWULDyI/0Qh+ExiyR+gQ/+6eY2Sj5BQLf4I2yoxMkjGyY222auwAt6dDL50gAvfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-OriginatorOrg: intel.com
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
X-Rspamd-Queue-Id: 603681F83FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:34:09PM +0100, Thomas Hellström wrote:
> Now that the two-pass notifier flow uses xe_vma_userptr_do_inval() for
> the fence-wait + TLB-invalidate work, extend it to support a further
> deferred TLB wait:
> 
> - xe_vma_userptr_do_inval(): when the embedded finish handle is free,
>   submit the TLB invalidation asynchronously (xe_vm_invalidate_vma_submit)
>   and return &userptr->finish so the mmu_notifier core schedules a third
>   pass.  When the handle is occupied by a concurrent invalidation, fall
>   back to the synchronous xe_vm_invalidate_vma() path.
> 
> - xe_vma_userptr_complete_tlb_inval(): new helper called from
>   invalidate_finish when tlb_inval_submitted is set.  Waits for the
>   previously submitted batch and unmaps the gpusvm pages.
> 
> xe_vma_userptr_invalidate_finish() dispatches between the two helpers
> via tlb_inval_submitted, making the three possible flows explicit:
> 
>   pass1 (fences pending)  -> invalidate_finish -> do_inval (sync TLB)
>   pass1 (fences done)     -> do_inval -> invalidate_finish
>                           -> complete_tlb_inval (deferred TLB)
>   pass1 (finish occupied) -> do_inval (sync TLB, inline)
> 
> In multi-GPU scenarios this allows TLB flushes to be submitted on all
> GPUs in one pass before any of them are waited on.
> 
> Also adds xe_vm_invalidate_vma_submit() which submits the TLB range
> invalidation without blocking, populating a xe_tlb_inval_batch that
> the caller waits on separately.
> 
> v3:
> - Add locking asserts and notifier state asserts (Matt Brost)
> - Update the locking documentation of the notifier
>   state members (Matt Brost)
> - Remove unrelated code formatting changes (Matt Brost)
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_userptr.c | 63 ++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_userptr.h | 17 +++++++++
>  drivers/gpu/drm/xe/xe_vm.c      | 38 +++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.h      |  2 ++
>  4 files changed, 104 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 37032b8125a6..6761005c0b90 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/mm.h>
>  
> +#include "xe_tlb_inval.h"
>  #include "xe_trace_bo.h"
>  
>  static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
> @@ -81,8 +82,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  				    &ctx);
>  }
>  
> -static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma,
> -				    bool is_deferred)
> +static struct mmu_interval_notifier_finish *
> +xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_deferred)
>  {
>  	struct xe_userptr *userptr = &uvma->userptr;
>  	struct xe_vma *vma = &uvma->vma;
> @@ -93,6 +94,8 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
>  	long err;
>  
>  	xe_userptr_assert_in_notifier(vm);
> +	if (is_deferred)
> +		xe_assert(vm->xe, userptr->finish_inuse && !userptr->tlb_inval_submitted);
>  
>  	err = dma_resv_wait_timeout(xe_vm_resv(vm),
>  				    DMA_RESV_USAGE_BOOKKEEP,
> @@ -100,6 +103,19 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
>  	XE_WARN_ON(err <= 0);
>  
>  	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +		if (!userptr->finish_inuse) {
> +			/*
> +			 * Defer the TLB wait to an extra pass so the caller
> +			 * can pipeline TLB flushes across GPUs before waiting
> +			 * on any of them.
> +			 */
> +			xe_assert(vm->xe, !userptr->tlb_inval_submitted);
> +			userptr->finish_inuse = true;
> +			userptr->tlb_inval_submitted = true;
> +			err = xe_vm_invalidate_vma_submit(vma, &userptr->inval_batch);
> +			XE_WARN_ON(err);
> +			return &userptr->finish;
> +		}
>  		err = xe_vm_invalidate_vma(vma);
>  		XE_WARN_ON(err);
>  	}
> @@ -108,6 +124,28 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
>  		userptr->finish_inuse = false;
>  	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
>  			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
> +	return NULL;
> +}
> +
> +static void
> +xe_vma_userptr_complete_tlb_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	struct drm_gpusvm_ctx ctx = {
> +		.in_notifier = true,
> +		.read_only = xe_vma_read_only(vma),
> +	};
> +
> +	xe_userptr_assert_in_notifier(vm);
> +	xe_assert(vm->xe, userptr->finish_inuse);
> +	xe_assert(vm->xe, userptr->tlb_inval_submitted);
> +
> +	xe_tlb_inval_batch_wait(&userptr->inval_batch);
> +	userptr->tlb_inval_submitted = false;
> +	userptr->finish_inuse = false;
> +	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
>  }
>  
>  static struct mmu_interval_notifier_finish *
> @@ -153,11 +191,10 @@ xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct xe_userptr_vma *uvma)
>  	 * If it's already in use, or all fences are already signaled,
>  	 * proceed directly to invalidation without deferring.
>  	 */
> -	if (signaled || userptr->finish_inuse) {
> -		xe_vma_userptr_do_inval(vm, uvma, false);
> -		return NULL;
> -	}
> +	if (signaled || userptr->finish_inuse)
> +		return xe_vma_userptr_do_inval(vm, uvma, false);
>  
> +	/* Defer: the notifier core will call invalidate_finish once done. */
>  	userptr->finish_inuse = true;
>  
>  	return &userptr->finish;
> @@ -205,7 +242,15 @@ static void xe_vma_userptr_invalidate_finish(struct mmu_interval_notifier_finish
>  		xe_vma_start(vma), xe_vma_size(vma));
>  
>  	down_write(&vm->svm.gpusvm.notifier_lock);
> -	xe_vma_userptr_do_inval(vm, uvma, true);
> +	/*
> +	 * If a TLB invalidation was previously submitted (deferred from the
> +	 * synchronous pass1 fallback), wait for it and unmap pages.
> +	 * Otherwise, fences have now completed: invalidate the TLB and unmap.
> +	 */
> +	if (uvma->userptr.tlb_inval_submitted)
> +		xe_vma_userptr_complete_tlb_inval(vm, uvma);
> +	else
> +		xe_vma_userptr_do_inval(vm, uvma, true);
>  	up_write(&vm->svm.gpusvm.notifier_lock);
>  	trace_xe_vma_userptr_invalidate_complete(vma);
>  }
> @@ -243,7 +288,9 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>  
>  	finish = xe_vma_userptr_invalidate_pass1(vm, uvma);
>  	if (finish)
> -		xe_vma_userptr_do_inval(vm, uvma, true);
> +		finish = xe_vma_userptr_do_inval(vm, uvma, true);
> +	if (finish)
> +		xe_vma_userptr_complete_tlb_inval(vm, uvma);
>  }
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
> index e1830c2f5fd2..2a3cd1b5efbb 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -14,6 +14,8 @@
>  
>  #include <drm/drm_gpusvm.h>
>  
> +#include "xe_tlb_inval_types.h"
> +
>  struct xe_vm;
>  struct xe_vma;
>  struct xe_userptr_vma;
> @@ -63,12 +65,27 @@ struct xe_userptr {
>  	 * alternatively by the same lock in read mode *and* the vm resv held.
>  	 */
>  	struct mmu_interval_notifier_finish finish;
> +	/**
> +	 * @inval_batch: TLB invalidation batch for deferred completion.
> +	 * Stores an in-flight TLB invalidation submitted during a two-pass
> +	 * notifier so the wait can be deferred to a subsequent pass, allowing
> +	 * multiple GPUs to be signalled before any of them are waited on.
> +	 * Protected using the same locking as @finish.
> +	 */
> +	struct xe_tlb_inval_batch inval_batch;
>  	/**
>  	 * @finish_inuse: Whether @finish is currently in use by an in-progress
>  	 * two-pass invalidation.
>  	 * Protected using the same locking as @finish.
>  	 */
>  	bool finish_inuse;
> +	/**
> +	 * @tlb_inval_submitted: Whether a TLB invalidation has been submitted
> +	 * via @inval_batch and is pending completion.  When set, the next pass
> +	 * must call xe_tlb_inval_batch_wait() before reusing @inval_batch.
> +	 * Protected using the same locking as @finish.
> +	 */
> +	bool tlb_inval_submitted;
>  	/**
>  	 * @initial_bind: user pointer has been bound at least once.
>  	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a3c2e8cefec7..fdad9329dfb4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3967,20 +3967,23 @@ void xe_vm_unlock(struct xe_vm *vm)
>  }
>  
>  /**
> - * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
> + * xe_vm_invalidate_vma_submit - Submit a job to invalidate GPU mappings for
> + * VMA.
>   * @vma: VMA to invalidate
> + * @batch: TLB invalidation batch to populate; caller must later call
> + *         xe_tlb_inval_batch_wait() on it to wait for completion
>   *
>   * Walks a list of page tables leaves which it memset the entries owned by this
> - * VMA to zero, invalidates the TLBs, and block until TLBs invalidation is
> - * complete.
> + * VMA to zero, invalidates the TLBs, but doesn't block waiting for TLB flush
> + * to complete, but instead populates @batch which can be waited on using
> + * xe_tlb_inval_batch_wait().
>   *
>   * Returns 0 for success, negative error code otherwise.
>   */
> -int xe_vm_invalidate_vma(struct xe_vma *vma)
> +int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_tlb_inval_batch batch;
>  	struct xe_tile *tile;
>  	u8 tile_mask = 0;
>  	int ret = 0;
> @@ -4023,14 +4026,33 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  	ret = xe_tlb_inval_range_tilemask_submit(xe, xe_vma_vm(vma)->usm.asid,
>  						 xe_vma_start(vma), xe_vma_end(vma),
> -						 tile_mask, &batch);
> +						 tile_mask, batch);
>  
>  	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>  	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> +	return ret;
> +}
> +
> +/**
> + * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
> + * @vma: VMA to invalidate
> + *
> + * Walks a list of page tables leaves which it memset the entries owned by this
> + * VMA to zero, invalidates the TLBs, and block until TLBs invalidation is
> + * complete.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_vm_invalidate_vma(struct xe_vma *vma)
> +{
> +	struct xe_tlb_inval_batch batch;
> +	int ret;
>  
> -	if (!ret)
> -		xe_tlb_inval_batch_wait(&batch);
> +	ret = xe_vm_invalidate_vma_submit(vma, &batch);
> +	if (ret)
> +		return ret;
>  
> +	xe_tlb_inval_batch_wait(&batch);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 62f4b6fec0bc..0bc7ed23eeae 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -242,6 +242,8 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
> +int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch);
> +
>  int xe_vm_validate_protected(struct xe_vm *vm);
>  
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> -- 
> 2.53.0
> 
