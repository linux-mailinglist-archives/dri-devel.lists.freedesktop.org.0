Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB5942322
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B776710E12A;
	Tue, 30 Jul 2024 22:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAhj+sm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB3488668;
 Tue, 30 Jul 2024 22:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722380074; x=1753916074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hb13xG4QlCyashQZqM6yQvWilUn96XSY6DGtUKq5exc=;
 b=hAhj+sm/bfjJY1zoKJBq8cV/m36MwuF1d2EBAYWyxTHSvBgU6ziqDDMX
 Xq2Jb61+31MGjid2aiyPh0NtCsRwaUmpXYxvI7Lk5Gzxb+VhGRolENatI
 B1D0WY7DT8KDQBo+C2JoSKvJqHsVXaD72LBuMki7AJchm9O4+yTU8BsKS
 KIUX56loNAF0doztx3vauCc/HHhk7UiWAo1o5hMLBGkshih6jkXGhKXRN
 DoSHk3ZZtDcyNPodyW6pcv33GqdSdU3WmcEk1QJm01OSo3+5goI2oWN+b
 0EqJQWljIKZjdp058QZoKXNWNOAm8S3kJOI5AQ4TFb3ZIKyi49A89d9W9 Q==;
X-CSE-ConnectionGUID: g3YMBqS4QBump1QXUTp/pw==
X-CSE-MsgGUID: zL6AeByORM6joOHGb333vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20037678"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20037678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:54:33 -0700
X-CSE-ConnectionGUID: e3Y3Hq0JSFy4jqluJrn73g==
X-CSE-MsgGUID: hJd22y0hS7W4yN/ANi3kSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59339482"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 15:54:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 15:54:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 15:54:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 15:54:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 15:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzNlP3z01HfQqyPLg/nfoW0yXxRD6jCpMu/lMfaAFOsIppTEtSRFurybhPXGbx0kOPOXOlypdC5v9JHrZmi/ezHTQP2+2QRwmODhdGaODZhqPKY6KtywmPe2z9VWNUgIU8WxYliDmv14jIAV8QTbgrHI2NLaoh3PLSxSo0JlZlB+6IZ/0gJUhHRd+loJG5p98RNEoIACPW2vZB3iTkmC12jXVJVyEAZb/JZnxhUDuzf2EzqoYea5vFQ9ItIEDN/mzwfCnOyupuuNKNJsNNgTXd5fF+FgnUgGEu8T0DYtI4PcxqtaOoRtFi3B/Zzf17hzvf6hk/WhaEB588GsZ4RQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLgXO2ysHzYzT4/+z5R8fIQJD6HH80sd9AJnsPFUcpk=;
 b=wg2BfSGxTMj3NeX5iri9CpAsMOYqkoED8rCWy83W4Df/x3zR+RTal7JQbc0Lmp3ntXVa1oItUiphvu1t0eLhsisg/SSg8YoKA3xyN2OP1pMJphNPpGJPeJydi9QEooDdz0D/c4jRJIkRS867/fUc3TStjZVy/LXr0NYvQ2Vhvja8TL3B/d8uKTopnjp7IVOcsJmUkXGYPphvBdQtcFPVxxlxH1h6RZ5NMwMPJkGy1xDyLZrl1qVqzIQPpGKcNkD1C5tVquHW5eNLnB4zD+JB67Ibphnsz8kb6CtYv8/xTGE9rOCHRGGf3ZkQCXMkU1aU8woavRUs4V7U2n+jvr6JXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Tue, 30 Jul
 2024 22:54:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 22:54:30 +0000
Date: Tue, 30 Jul 2024 22:53:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <christian.koenig@amd.com>, <ltuikov89@gmail.com>, <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 1/3] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <Zqlu8gq2d8mtn7rC@DUT025-TGLU.fm.intel.com>
References: <20240730221742.2248527-1-matthew.brost@intel.com>
 <20240730221742.2248527-2-matthew.brost@intel.com>
 <ZqlqYLZWCiLKhVJf@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqlqYLZWCiLKhVJf@slm.duckdns.org>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 678fd1be-3168-4685-5a3a-08dcb0ea9269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NoEevO1kJl5LDgD4VZUt2As8dAEuwqccOPPj1wCTM0XMhyUiYehV0IJcSQY1?=
 =?us-ascii?Q?3q3d18bVoZdZKjQeO/CgYmkRPhYc1OKr6kCPLyMhqsDfZbaGkX1CZ77tE0TB?=
 =?us-ascii?Q?1JJ3nLb3Rx29aaHLtUgpMixkgt/Kwjdo0+/Uc9sOIDOgfMjH0nmuISRejscY?=
 =?us-ascii?Q?Kh2KY9IyIy+i9RGYide4DEVKzyJT6+Maa9VI9/eudAKb17bLZWr0bB6qoYrE?=
 =?us-ascii?Q?98tBJVS0Du5Rqh2B9r7yHvh/z5aPkxZB0ZEe1AL3Sgk9vCvWFQe/4Xnn7S0l?=
 =?us-ascii?Q?cYfydEjRuFMTOtW9GXfuR6FcM5nOgmNICVI8LPhOm+rayliUSYGO9SdfhpsD?=
 =?us-ascii?Q?yx7b+qdV5DoLvIdQ6y7txKp5lXDM+g5gTGj9lQr7TqmO08GLTIMclU04+K5N?=
 =?us-ascii?Q?GwEB0q74weMG50K2fhoetR1ksJtSY+HktTUy9mTSvK8bMv2DFHdzgCiLlChv?=
 =?us-ascii?Q?xO131WWJ37j7lgv0UtiLsVvPUVeCJr7QNHbZZbDH7NROEI2/Z+98WPkelDfC?=
 =?us-ascii?Q?KmheCSct7keBU9O5KY56lCIO48r5joqRp8BC3ShB/QU+1NurAwvMkz3kMa8c?=
 =?us-ascii?Q?TEKG8CcBXQhi5d6nWUCacnkFY05RYPvYDXKe/GnU+931LbkcAMadQeiIznz3?=
 =?us-ascii?Q?UMdgUzsoyZFnx3/8psHJ6/ON88QxS6pvi+YSd0egQICW1THgMEiyUiQUinaQ?=
 =?us-ascii?Q?2mQ8r0PUtExGVDphwE3sLQJr/n4zLHvR/iIeGR3ADmZqOFPJ7c12LLgqczgd?=
 =?us-ascii?Q?/kXhfrKjwLOtaPpzRD8YuqCzOpHXxfXORUjPbqc6WMHaOb7UFqFls8k177h0?=
 =?us-ascii?Q?5VH3ASImyJTRFI+xbTG6/enWpp4VTq7dJdKN32y9OrvO22PsWkFx+HMC/uX3?=
 =?us-ascii?Q?ktiB+q96E1gvIQq7FCIVfOnnHgVoKqaW3pqDByOPTwfSktq0jaAzQuVvpYyU?=
 =?us-ascii?Q?whzmOE7MN3oSM+iP5cWAglsBIfjydsM7wBpm3qoNAILZvLPB9DJcsZc27yTs?=
 =?us-ascii?Q?D8nnHnlJGKMhKJwk6MhnWDm27WykhMl2lCvFyKBfFxk4cdCEdrsIDYKj4bzO?=
 =?us-ascii?Q?jdwbnBnX5wmWfSDQzd/j67n8BCqRBYCtFHfBvyKhHLo3Pha+sxFIJgJFm5jp?=
 =?us-ascii?Q?4bX0/nTe/jB0+/9LKg1VepLkn8EXxosSAA7s9W7z6WSaMkVgjTUAFguWin/C?=
 =?us-ascii?Q?H/vg436N0VcMXMBnmqIg9I9wAygeC6g6KfE2CGBPKhB3Difsdx2mN3atfXkT?=
 =?us-ascii?Q?TNZpRzgnzlUEC2RTUKamYFr6lImnOY2s6DqMlCqpcU7hvPHaRF1GY8k8Qb5e?=
 =?us-ascii?Q?wcKfcAkNGpC5qHWJdu8B2c4dT4M50zMSsRpaUi2A9B5kOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PjJG4mCHfz8l9ilpS3h0yNAMZLX86dRvH2obKEgv254UHGXkVuO71ByaBwaO?=
 =?us-ascii?Q?uE9vGZ45DvwxJOPgnLQbkErUDKNcYyKedvLLz7y1d4J2IOj/SQqMUCOP8noC?=
 =?us-ascii?Q?V6HtuPSoS8IDU9k6MjfPgyejACcPjJ+/SFaH/Kai+SdYRsbJvWQGpmrHmof7?=
 =?us-ascii?Q?EqlhsW1a40Q7Xx7G6nA4lLAF1JjAinvCn9pCnWJqsgj19yfbiCiYFI/pZjjJ?=
 =?us-ascii?Q?wKvfYx27u8onM8EcBRVzujlSOyiEdWCxDU0E9jMjyQvVAF8/djRLcfOx6hFK?=
 =?us-ascii?Q?NOApyTmG0UuFQkF0pGm1US1N2GKLTX+r29gQE9i9+jcn0YQRZIPvBDvWauBy?=
 =?us-ascii?Q?m7ZlxniOr44+dBYsW0cjnu6q92c3VBXe8d+GPJ/CoDr436UpXIlwdWMBdnET?=
 =?us-ascii?Q?S3tv9uQQ4UNOtIqM71H55l43xOMAiG/xWz4fNGyzuwLu8t8ON2pRifL394Km?=
 =?us-ascii?Q?ZYVI6F5daWHcDNNrW+QxTfxVXj/2ILp8wzPilnjJqdvXInzDiDe4SlEvDI2h?=
 =?us-ascii?Q?tQjdktG3f3V7whKS/KTwVGC8tpMYfPsRUENHr6oDzDWbnyyWnogmTLFHLCAW?=
 =?us-ascii?Q?+ia8+FsAgEDHog90+UjqbXdg8SyKHiWUi+DBMNtFYb4wKDm8+E6wHjfe6X2l?=
 =?us-ascii?Q?fvIbbvSM45zzrKGOG+/CnWuub9mxBt/xB/thyY2ebUhXI2gmxlk9zmCiIrsT?=
 =?us-ascii?Q?yTVy4fhoqbIrnr4v0BXwJaOI041VvQMSLUgelyWjHDKhwhwRmHBF4Rqr2sJi?=
 =?us-ascii?Q?QZXiuaoFhZ4kzZ/40d6fjRYnhevpDJp5sOIQf8md9fp0mn2C4HyzdY1SHGNA?=
 =?us-ascii?Q?LWTLRLdjOFkOGrZhDojpX0Kfk3B11KRb/I1XvWROejMwLAVdBXpQGhTr49G2?=
 =?us-ascii?Q?gza631wPgoh9NWj0ITf078Ti0Kxk9XsIvfCYkSSplh7mG8EffiQxOnuBYmtw?=
 =?us-ascii?Q?sw673DYrWWE/2vq9u3P3ODnOe8vUYHOSDtVbWPaN1+NkNBHsbFUmbmMOHOFc?=
 =?us-ascii?Q?4n7RGkpxNJC/+JFSDPf7eQ3oyONyQS+tv8eT1uBKuWh1mA1d/1QeoR9pWvDG?=
 =?us-ascii?Q?q/Majcqxzzzl1RnSG5Qhxsi+KKgmANScp8PKTev1/xSpGt+tRuNImBVYzBuY?=
 =?us-ascii?Q?2/75nrCv7SvjgjXQ11zBuhQMe5K9JyziY71OsMt82aE8JEekkUHd5mR1R96i?=
 =?us-ascii?Q?B4M0skq9mKW1HNtawWXvPpNRud3CCjEjFunSOtfhy8QrCBO4q8QQ9eDHS1QC?=
 =?us-ascii?Q?SaJTPd/EoAlCutfyNkVqCXj9x6ZhODd/gKqTT2oyMuVuVFXmwf+q+9jsPY8Q?=
 =?us-ascii?Q?NzziTIqe4y81dnGXUS7NPTfuC6J4vvcFl8GYdS1EQgqaplxo9lRowk+PtHG+?=
 =?us-ascii?Q?ptPm8iv9Hjzly81U6MDsy+ebPPzFU2Zvk9l7Tnt3XzBqzcXYajyjO0h8kRFS?=
 =?us-ascii?Q?i3zM7CcXM6j3Ha90tHK63IFaXiygcE8zx9Xcgm/LCCm7cLwqyd1i2VU1Mwcw?=
 =?us-ascii?Q?v9xM16O3I6Lw7WbjrO6Swvoiv2EcAJjvCI6+ZfYf93gGs5FN6VMCk1xp9MW4?=
 =?us-ascii?Q?srAj7HKjsOqgZE/MUD19aSjOQKBQWt4nRUFvG2Z+zZ2lj9SQT47JSzDvrAin?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 678fd1be-3168-4685-5a3a-08dcb0ea9269
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 22:54:30.6196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyM1X8OpCVDywmlXqIjXqpw9qXzaCdZeAyOP+BR3d7ysAcSqL/Zvevl9A0+nmmbM/o4WZUD1YHZ91ux0njlDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
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

On Tue, Jul 30, 2024 at 12:34:08PM -1000, Tejun Heo wrote:
> Hello, Matthew.
> 
> On Tue, Jul 30, 2024 at 03:17:40PM -0700, Matthew Brost wrote:
> > +/**
> > + * wq_init_user_lockdep_map - init user lockdep map for workqueue
> > + * @wq: workqueue to init lockdep map for
> > + * @lockdep_map: lockdep map to use for workqueue
> > + *
> > + * Initialize workqueue with a user defined lockdep map. WQ_USER_OWNED_LOCKDEP
> > + * must be set for workqueue.
> > + */
> > +void wq_init_user_lockdep_map(struct workqueue_struct *wq,
> > +			      struct lockdep_map *lockdep_map)
> > +{
> > +	if (WARN_ON_ONCE(!(wq->flags & WQ_USER_OWNED_LOCKDEP)))
> > +		return;
> > +
> > +	wq->lockdep_map = lockdep_map;
> > +}
> > +EXPORT_SYMBOL_GPL(wq_init_user_lockdep_map);
> 
> Would it be possible to make it a one-piece interface - ie. add
> alloc_workqueue_lockdep_map() which takes an external lockdep map rather
> than splitting it over two calls?
> 

I didn't want to change the export alloc_workqueue() arguments so I went
with this approach. Are you suggesting export a new function
alloc_workqueue_lockdep_map() which will share an internal
implementation with the existing alloc_workqueue() but passes in a
lockdep map? That could work.

Matt

> Thanks.
> 
> -- 
> tejun
