Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7259D30FA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 00:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EB310E0C8;
	Tue, 19 Nov 2024 23:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UufX6hsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BFF10E06C;
 Tue, 19 Nov 2024 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732059412; x=1763595412;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=siK/eaFsGQWJsba0Dndm46lItYEYj9RLBjkSuH2iFoo=;
 b=UufX6hsPW7N47NtVQNMTlcTbnenwZY03rPVkyRP4C+/q8zpiQ4KuEHND
 6um7xGwKKgTB2ACIMp+AXSBb3SIyWljUspY6+hwKxyGwXNiQTkwVCl1+L
 OtuOTjWXCcKZPItnTF1+Pg18vqH5lPoP51TjbjwYP9VYNgDc3DUvKwHf0
 ZSXGV5MWTLOtnj4/SasFD47fQrIcn3HnDORRSd/eWg8+KeHHi9zI7xs5A
 ceKZTQdxSvo8zLp3F6dc3Z8nBfvvBmnLHM+MkSqFE2pFpd3i7+ifrVuVH
 ayDpKLnCfHKYIgllUeDnXXC53wET3i/sbh0d1tpok1hamt+ek0ACD68gx Q==;
X-CSE-ConnectionGUID: qoU//I5hQEeNQ6Jqr3W/Kg==
X-CSE-MsgGUID: gCIfNB0CS8m1f49lFsXEBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43478429"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="43478429"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 15:36:51 -0800
X-CSE-ConnectionGUID: zXbdCdTzTsubLMtscxcqBg==
X-CSE-MsgGUID: YbZSI4/VSbeHiAtvGl6n6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="94538830"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 15:36:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 15:36:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 15:36:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 15:36:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4we0cLyS901LaOV5NNgzHFgETlWAud/+FASPiZ/XMElJUCI2zGV9Ael9bxjQS7e1qyFIZWQ9d4ud3ceBGX3aDXrAc6ugRRwn8rUN3nP6Szf3fUi6GC+5k5tjl8xhL8qDwX6blRI7J1c1MAFAMKAWnkV+JBhkMPJadts+JeNc3IKiMY03Xnf+Qqw2KOr+w5dFRx0w8l+GebKYSQErWjffbI/+8Vdzg+jd2yjKDGY8jd5v3SM6jKg+MwhvACnm9RLY1+Os3xLwzyP3yuOxuv+kgu7ZsG025bLv41/AGzN92LZxRJ8agharRbQahxRJUBk/MZ9iXBm11UlQJzmFt9yBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJDJ9sJ4K6f6ZY2eidfdrjiHRJGf0h9IFwg0ueImTWI=;
 b=Ve69M8u93moO3Lyk7GOl97KaznJ7JYnKaoirrCDKp6rj3brZVnAdGOBBqHwiGRQfFDrrkVj9NBFRl6Rau0QvmLZWBxgtclpo8a0sSDL5qI2b7abYil+nqSHJJHSkS9mctlHwxoHtgB+amf4I09L8oUX9S1vtip9I07g95+SBZ3wT+ebUDopLDlibahsmSY2Y8SrKOcaI7ip8dW2ym2UXgjtITVN+Ygx/snTLrJqkx+DQEvAD0LhHdGeGjnx8s6LqpOXQFBIWdYyOtGe13scW2RKafjsFv/CPjQMtmy5PMrgsRAzJ89MDoCPyMPONCzRKfDLNkps9y2LkurnHh/ZoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 23:36:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 23:36:47 +0000
Date: Tue, 19 Nov 2024 15:37:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 14/29] drm/xe: Do not allow system allocator VMA
 unbind if the GPU has bindings
Message-ID: <Zz0hMYUa/AUAoWd8@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-15-matthew.brost@intel.com>
 <8531991acc4c92a6417bd83fd4007bc495ea347d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8531991acc4c92a6417bd83fd4007bc495ea347d.camel@linux.intel.com>
X-ClientProxiedBy: MW2PR16CA0026.namprd16.prod.outlook.com (2603:10b6:907::39)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a3cf31-034f-4a79-8a0f-08dd08f30820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?I1PNAZz3C/nvDSFrQTBJWFVCTcY7oyNQZu/RTmgoXeV9tCSydpFX5wzvQI?=
 =?iso-8859-1?Q?x8PU7jtSLdbY+C35Kxfh5OQ3rlU3cxteydpjkuSAo3xtZ093B8QIIy3mLv?=
 =?iso-8859-1?Q?uEVxsh7oQm2vmjI5HQR0n/TnjZDUXZA+9FYYhMxH7V/nZ1cc/JUATJNlJt?=
 =?iso-8859-1?Q?ZEsmW80WMk81tG8JUcnFuRO2o3+aJCuOWrho2EzcyFv3Y4OcN337Ds+TGy?=
 =?iso-8859-1?Q?PkcYrZjxrrSjrwYoNWRN9+VUznF9fakd0pUp8uHmgrw6Y6pG9iU81+Nec7?=
 =?iso-8859-1?Q?GwhpkG/A/km1HniPPkQFdzXcC7PmhSxKTCYuCKWC7lVYlMRhIe1rLX2J9E?=
 =?iso-8859-1?Q?v/htW10qXuVlEzH8tWmN19/3gXYBI28kA6c4Q/yDyvHlO7dzfmXpHT5TbO?=
 =?iso-8859-1?Q?RanFeeI0psBa2Fo/d1VUhaRHNOqH7m4J3ABA2KZQ2xpOHqctD/S16yjKRJ?=
 =?iso-8859-1?Q?PUIzV8PRJYicZ+lS1oWHEGXlY8yloF+RAesfwDwwGxXMTJ+RvIrrcDbI+m?=
 =?iso-8859-1?Q?b89c+KjRPEKKtzVS1nQJCzkKaLQKa10s82eE6Wn0Q8eFlxo+pdoUZ7O/FZ?=
 =?iso-8859-1?Q?A3e7dKn8IPkSaHHGdQBOhdZcH36e51l5hISkf4Cw8tTOpO0zhywTKM78gN?=
 =?iso-8859-1?Q?DJ3w8F/C42B/a+RozWQSYDzqyZ/IVGo8Bh94klK6J9pB9mb5mjcazEnc2S?=
 =?iso-8859-1?Q?tUUCZrJq34crxGLvn90UnJ2ZEDjP1EMdfgiIZQl9dIASaLwagGEhK+Jz/u?=
 =?iso-8859-1?Q?Caayo78gLbk1KD2LqtvohWKO+giiHG818BM4YauFIrd2Zr8SyEBU98IqaJ?=
 =?iso-8859-1?Q?1CGTRBtqk0Z9eUp58vLt9HJ9esjFKU8FrMeRQcAfC7igGBis/pBi59d5lP?=
 =?iso-8859-1?Q?v83C9pUY3pJzDUBglJxmogDdGFQhv4ShoDJ0wm6aIEohd/M2xXpWBz63oD?=
 =?iso-8859-1?Q?Ezwfwm3qNqVY1Bs4k29E1rfmcf5XVP58mrSlJ8z9uFfKqrl72JUfYcLKss?=
 =?iso-8859-1?Q?pzzFEyWgtSgwOXJX/32UAZBGHH+hlDPHPBsy9ZxPY5ufH0M6PTJXx9WV/C?=
 =?iso-8859-1?Q?UxKHHwcHnChZnaVSJKxxKiM3gM2FA6ZYtBCxR9bDJQATDZ3xdutJj3jGlf?=
 =?iso-8859-1?Q?AEN8MVf2//c1QpCnbykRoxwHhod/+Ai++amG+gTM5C0PyF2P0UhdStIPRq?=
 =?iso-8859-1?Q?XdcgXb/7UMMLnoNbxTnaMOSR/0+r+OFs9oOQ5f6Xi/w/0wvuVByOCGjNQP?=
 =?iso-8859-1?Q?gO3+S8ABir+Dtvqu1479capYNdBIEaYX3JoqOMfVMzIuirlDmyih4BVSfN?=
 =?iso-8859-1?Q?VfbkQvc625f/1PEA3lv2S4wRb0U+30OHyd9sAqTacNISwK3g42Cw1BINMw?=
 =?iso-8859-1?Q?xfW2SpOXNO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a8DxsyVDYgrPTmOxwpt8qsLZzH15heNnUiin0n97KsmXi5kERl/Xk+LLTh?=
 =?iso-8859-1?Q?9c9XU2Zqe83ClQQIjbcTBfQCAk+NgkmqhpRCqsXibsWJKMM4GNVpnBnjWQ?=
 =?iso-8859-1?Q?BIqGkVEJxYLGVwBsDk4oORSAWAlRyDUtLO1JUjl49pqD3JMdl04VEE0MK9?=
 =?iso-8859-1?Q?EqkrfENFiNhfJVLjDf6DvXnF35+R9jkVik/p151DfsyzbEvgBCrLqzycRy?=
 =?iso-8859-1?Q?xR3NidIrSxQ85LCJxU/HjvmrMiJdSQIep/C/3+y3+9cGMVS88vKKv9js9w?=
 =?iso-8859-1?Q?ldKUYz0oaSp1G3wcgmX6RB9n3OLVdzlH+avj7MetSmbtUq9bZHJkN9avG4?=
 =?iso-8859-1?Q?KuA7f1HZNCA38CSdH+pQTRmmo9YHjH+zjaopLiqcUHdFU9TMy9bfkwQ8vU?=
 =?iso-8859-1?Q?SILi2zBFyF9fBQFbBGFVruZHEhEaZKU3LtiH8pS1v3qMuYe7VJwdyrenEa?=
 =?iso-8859-1?Q?7dTxOAI4efmZ4p3kbAGDG0SUDc88VlXZ4cMkH/P71yinQm4OjYffN8pa99?=
 =?iso-8859-1?Q?FGJuejdnZhpSE9hR7TQ56+u18bTKbDDD+Hl1fetUnIrAwOPdJ/ZoJqcTbh?=
 =?iso-8859-1?Q?h8dqwKTqBxQrlPAO4I9F7lNZt7EJ1WsMSk8R2s9mCTNK9rEAilm1w7J24J?=
 =?iso-8859-1?Q?fHvd5eRccQmFwcRuWbfUpAmLrTmlYzulPfNbh92XJ693++9R9KsnnUvmtz?=
 =?iso-8859-1?Q?dM2ynll8Vfi04jW8FM1oFLVof7yF7g+sAph4TKEMvTD5TV/i77QZ2Xogsw?=
 =?iso-8859-1?Q?EVJhFktWME4ajqX6MZk57TNLuj617VbQ3GrhJRsjjsQ5o7rZ3+0MN2BGtD?=
 =?iso-8859-1?Q?8y4Has/zC1VSOMjMM6FWvjpTpsR6AOlNQf1q9u0vWk5F4IjJQjbCh9Ek03?=
 =?iso-8859-1?Q?DTet9axHeNjsjR3oLm3LnkSTtWYVL0EkoDxhVdazraF7LM6lLbOUxG+zyq?=
 =?iso-8859-1?Q?Pyn8JZULAJoGnyhtZepMvVcYxcTUCx+djc/7dFYf6hlqyHtM/rZXhAo977?=
 =?iso-8859-1?Q?NXHa/LeIZ6mCm1O/LzIn1Liqzz2qG2rMmM5i9NmCWtBVIZ73/9boMQA1f3?=
 =?iso-8859-1?Q?8uDh0q+HyGavPFkzT/+YS45fw6hixs+FqxKxyXbJESWZRG5lHn3itP5t4w?=
 =?iso-8859-1?Q?ehcvtdEQ2Vlq/pNdcU6sFKGJYgB2Z69+fwY0L/aoQfq3AvPdeUklITRY2T?=
 =?iso-8859-1?Q?68ZsCIwzwSUg/S2jWYoPLrhI3sl6DDEqWWf9N9lCiSDvKwgvotlwwYf4DB?=
 =?iso-8859-1?Q?PY35j9/d5YeGCNe4AZlnviHl15h6ifGnvllLT/e1b90bOIev7+svAn0r/y?=
 =?iso-8859-1?Q?00nsXt+ZO8nOL524Isb1R1uswwAdHFAmwhj5hARq5LzjLjukpi4n6nOmf8?=
 =?iso-8859-1?Q?S0r+2QRgZHL+0DDJXOyebdwbto16yH3uJnOUXz73p8TkMfPFG/ibALniBV?=
 =?iso-8859-1?Q?ZWr3/enZGK1+NmKoma7Y7iqMTut9DpWGE0cq4GkWv3Q0mKdfaKr/TFm0bH?=
 =?iso-8859-1?Q?z2DNV3vmDR7MchSsLRzsliaALcChTOb6LpEk83QpdqpViDqUIC+pPp+UUY?=
 =?iso-8859-1?Q?03FL30AUzx7QJWqsyvFus/JDAAE9N6DWFQURm/9FHVOn44BFBQ29SGp4m5?=
 =?iso-8859-1?Q?dwaHf2jBgsJCFxjIZtX07p7ReB3b8Pi5gXPrGZ4xoHYr5kSKxSk2XqXA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a3cf31-034f-4a79-8a0f-08dd08f30820
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 23:36:47.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhPyVtLXYQHASDbwsHVE8UVROHjIW7Z3NtGw/q5Zec3OsMUqsR7Ynube9PCPcZHVjQp2Ryy/46NQXvUqxi2iUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
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

On Tue, Nov 19, 2024 at 05:33:11PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > uAPI is designed with the the use case that only mapping a BO to a
> > malloc'd address will unbind a system allocator VMA. Thus it doesn't
> > make tons of sense to allow a system allocator VMA unbind if the GPU
> > has
> > bindings in the range being unbound. Do not support this as it
> > simplifies the code. Can always be revisited if a use case for this
> > arrises.
> 
> s/arrises/arises
> 
> I think a uAPI without special cases like this would be ideal, what is
> the code simplification, given that we already support this implicitly?

Yes, simplicity. SVM allocations are only unbound via the garbage
collector not in the IOCTL - that would be new code.

I also cannot think of a use case where this would need to be supported.

If we are binding a BO (which causes system allocator VMA UNMAP) the UMD
should have allocated the BO's address via malloc or mmap, thus we
shouldn't have GPU mappings for the new address.

We can add support for this but without a use case, it seems rather
pointless.

Matt

> 
> Thanks,
> /Thomas
> 
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c |  5 +++++
> >  drivers/gpu/drm/xe/xe_svm.h |  1 +
> >  drivers/gpu/drm/xe/xe_vm.c  | 16 ++++++++++++++++
> >  3 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 0762126f65e0..1d8021b4e2f0 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -378,3 +378,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  err_out:
> >  	return err;
> >  }
> > +
> > +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> > +{
> > +	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 06d90d0f71a6..472fbc51f30e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -29,6 +29,7 @@ void xe_svm_close(struct xe_vm *vm);
> >  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  			    struct xe_tile *tile, u64 fault_addr,
> >  			    bool atomic);
> > +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> >  
> >  static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> > *range)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 76a20e96084e..158fbb1c3f28 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2348,6 +2348,17 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> >  			struct xe_vma *old =
> >  				gpuva_to_vma(op->base.remap.unmap-
> > >va);
> >  			bool skip = xe_vma_is_system_allocator(old);
> > +			u64 start = xe_vma_start(old), end =
> > xe_vma_end(old);
> > +
> > +			if (op->base.remap.prev)
> > +				start = op->base.remap.prev->va.addr
> > +
> > +					op->base.remap.prev-
> > >va.range;
> > +			if (op->base.remap.next)
> > +				end = op->base.remap.next->va.addr;
> > +
> > +			if (xe_vma_is_system_allocator(old) &&
> > +			    xe_svm_has_mapping(vm, start, end))
> > +				return -EBUSY;
> >  
> >  			op->remap.start = xe_vma_start(old);
> >  			op->remap.range = xe_vma_size(old);
> > @@ -2430,6 +2441,11 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> >  		{
> >  			struct xe_vma *vma = gpuva_to_vma(op-
> > >base.unmap.va);
> >  
> > +			if (xe_vma_is_system_allocator(vma) &&
> > +			    xe_svm_has_mapping(vm,
> > xe_vma_start(vma),
> > +					       xe_vma_end(vma)))
> > +				return -EBUSY;
> > +
> >  			if (!xe_vma_is_system_allocator(vma))
> >  				xe_vma_ops_incr_pt_update_ops(vops,
> > op->tile_mask);
> >  			break;
> 
