Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D0D0BDE7
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B9210E926;
	Fri,  9 Jan 2026 18:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIlrQMmf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996B810E927;
 Fri,  9 Jan 2026 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767983936; x=1799519936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zPmX6c0J/cz8TQKoQNIIpvhwx4cCkDt72qssvUUUChk=;
 b=nIlrQMmfvczAG2bLLryg3uwnKM4TItO1bKTCNldp4+JB9bgRkNHiJlJC
 VlnmWygxvFah3M1W9KHAVbjqsqXFuODZjyZH3ZoI/DLI8U498OMsmpzgf
 Bi6vIMtZ7PcCHZS2HcPpIBVNV3DtiGUn1I6qiad5Jx3K3p3tixOLcQJyn
 Yq0otpx1V4CDD2VPRxEFEg7jR43gj7RI4853Y5Lz00CwLJKmdTPsnmej3
 00EvMRqSAsaGsloTzTqXeUh/0g4u85FMGyK9ZyFB8W7iQnc50Wi5N36ED
 ZGPYFAyMTHl2qTwdRdXZ9Q9mIms/i31+ZBBO9EWHZqo3F3fI91rzp8JmS g==;
X-CSE-ConnectionGUID: B1DlRm8sS4yqNhqb5GCfQg==
X-CSE-MsgGUID: JP9mhIxRRVCJuk8tnEeXWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80475309"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="80475309"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:38:55 -0800
X-CSE-ConnectionGUID: CR+cU3l7QHGZNunw0xKyhQ==
X-CSE-MsgGUID: JBFuC8caTYy8B91TI4tdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="204324256"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:38:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:38:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 10:38:53 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:38:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs+zYY50t5beBokFTWPedBXLIM/gOg/eQiH1+4llvxARahJBR7uZGCE0Ze3+RiEclJ7GiJocbeWKpx/v+mSVtgKCB1M7vuQl0SkN9O1PWwL3L8L1urNQYvW5chWJAATMqt9HnFVSSo/b295agPF2XPvyfl1pgN1GYGqxZCjyu66Bhi9p/7kSHxuKVhyHl16M90C2z2ju1pha0M+s1BA6zOGHUhdcHv0tVuY8ik0N+nVAhPorCYLkz/Y0e9PyQFD/gRYb8vSNOVIccrCpikXDlDoatowN5AYOaEmVzctLpO688rujic/nI+HD6jmINVy/UpGSR0zwFGDpJSblfjh3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBco+iQ1f64WE48BIvAzmZkXC5ARrO/1sD67hHZzu7c=;
 b=MXowtL26Hj+wGcJ7EUE8Vgrq76+WHbFtKs05gkuS/vmLBcA/8ZjZMSa0VYumJRIUexmsQJWdB7qm33jmpFscnVwvxix3LlZ05w6jilN8ZHJfBvEoRZvJfOxN58T8lwMCrJeBoDdHnzyPNvsFRm4M7PK5BICQ6sUO9i0bQOymE4FdlnBZe9ATR9F/QdrCq0MBE2QPwjKaBCluit5Q5F7PQdI9FijzDGGkp+AFjmCjz439tOUlSPpu4FmcK7WY2hgcPZeLBclK10IKNMh5v4JKqPHloGb4VJa1okr9oJLyko17pf0M+NDMv8LVkwUkVDGiWMignTi1voG3lGgFerWvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7559.namprd11.prod.outlook.com (2603:10b6:8:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 18:38:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 18:38:46 +0000
Date: Fri, 9 Jan 2026 10:38:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
CC: Zi Yan <ziy@nvidia.com>, Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Balbir
 Singh" <balbirs@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
 Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/7] mm: Add folio_split_unref helper
Message-ID: <aWFLM291+6N8n3n4@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-2-francois.dugast@intel.com>
 <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
 <1319a24a-bcfc-47e5-a022-f5d00994acc9@kernel.org>
 <A5512463-283A-4137-B4A8-780783C5DF0E@nvidia.com>
 <85033126-c60a-4cac-8f6f-5bd2f6102fec@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85033126-c60a-4cac-8f6f-5bd2f6102fec@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 805fe162-bf6b-4cd9-eefd-08de4fae5285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8bZcg2u2KNxyOnD7oANEXd64k0l+S88e8fWyK9SS4Y7PYTFmywmitrYEtzJ5?=
 =?us-ascii?Q?mHVXYGuIcFBF+QIQdVVpuqIbkXvuvHQCODTz+9J+EABqm31U4mBoaAIxT6kX?=
 =?us-ascii?Q?I0MnFuaYi4aJg9RedUOnXj83kmnn69dfTn2WgmP6YtRB3f1vPT52WeJVVbGi?=
 =?us-ascii?Q?XQi1fmsl16s+9ogVWChLK+WKgcFpN06C5ZsdwUpV1IMThqvxK5vKnG0238fe?=
 =?us-ascii?Q?Cn1G1L6f4QC8axpWN4R/MjQJwwBd3/ryqcOqU6mxZ+uKDG5DeLVsIU7QU+we?=
 =?us-ascii?Q?anav3CvAfgGYGH+525OYNT0HRC22P1kwvkY3WHakkZfHDOlVH231J6k71cJS?=
 =?us-ascii?Q?ro/i/8Gyb49vTjBn4skcVnM1hgHq65fyiXU9C7zNDUlFabkG8f8j5OhlamOt?=
 =?us-ascii?Q?oDSRBgn8B8cU9j8/0JFKdcNOOC3hRcWslubATGw0USOYloRub+VTZ7WSQAMp?=
 =?us-ascii?Q?WknxVyYDjgvbtHyuZA5TEa7vTL+IE4VpltZED2XmxvCmuSY29A7Akaqt/X2r?=
 =?us-ascii?Q?JE9DOfunDwvbOZJscdSEdL3TP5JhR5AVHKevylhclslQ/OpPSD9zuLkEFYgr?=
 =?us-ascii?Q?1aKeh/T7j1u42cBZgWe0F/34VKH217hc7wTPStkSSd5sDWXmAEjYiVeYXjfG?=
 =?us-ascii?Q?ekICkFb6PUge6SQQ61W6sy9cICLXQE+agoXJ58GnXlG9GNKQ8gpg0jVhVM3z?=
 =?us-ascii?Q?JDQez9v06Fi/2SbEW44lSJV4FHL4EKHPv5tvy4fs6goI2y4CiWvl6MqDNqUM?=
 =?us-ascii?Q?XO4Ej27fRm9kg0cMCRVMw7K2btx64LMn6AeZMYBXGpN8rDzMVOffuC0DAo6Q?=
 =?us-ascii?Q?Dm/2C0Iiyp/cmOxrnSO/nzdRsjrTPpNqnWqkYII6oSomu+6V6T6kh6Gnv8wn?=
 =?us-ascii?Q?ilYyAwtnl25bCmxkUVczIoCQWqVIQ3nhIAODbHGdvtE2G5hrI1FHgA/G9EgS?=
 =?us-ascii?Q?xn+G0TN8T+JEg3GGlZIM6xtw5toqXlnBk8TYa4bXYgN14M5AGZ5uOL3SHnSk?=
 =?us-ascii?Q?gIfjTgLbTYHcn1jDSMFDtRBumU/fmsxTgtJNog/dN2v5Twt0Bnn/jR7zBxzu?=
 =?us-ascii?Q?m8jMr5lT2KOZQg+tPnYSlgzboVIln7ZAEItz7lu9Czp3jZ5KkF2g7OVWZ7wU?=
 =?us-ascii?Q?iQjv0hRn7HXsJgGRLHjO7En/kcXqqGe0gxBblyLlVh8pBLkplYfE2Z71/g7n?=
 =?us-ascii?Q?uLmav9oLqZZnY1ed22Bwxo2OLc7LA8Bnd8nLbhFxej1yzq8RBCn5t9ulasoc?=
 =?us-ascii?Q?F5NlZklHd4x803ZzY//ZRpDxLaFxXDuwvl1nV2kxveXRVw28rNrjgd2XKM5o?=
 =?us-ascii?Q?Ox/AcOH+70rjwJMkVaWCSl1N5xdI52KI3WiKG5xN221AMsRGK7x3jXd+BIMh?=
 =?us-ascii?Q?UxEDc10v7RQSMjBAGTidYNvJJt2CVU1NEoCffU5TUwGFTObxJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vSagL6H9CTMUmmcBi4Nn33uqmS5mPOBMnDnjV5s9YRdRDqQZrIM0boztcTyD?=
 =?us-ascii?Q?TQ57tNb8/dXDsKMLg/lXTtxz+f6qyfXkId5Bvnr+yJ8bGckagXRmVkv7Y6tP?=
 =?us-ascii?Q?yPorg9WxRiPyUMceazwxmNRDzXbwrqiFo0Cjb3sjrbqPLAAl1LIB6d+Ehbui?=
 =?us-ascii?Q?GopL12DOl4RkVu/0KyJODqfPMM52qAGs8pofsIfwdmDVsXyXFQVj1HHR/g30?=
 =?us-ascii?Q?FDk294sb9voc182BlioMkV0nJsFxELec2nmppxwC7VYeNcghUAVk+csOKOsY?=
 =?us-ascii?Q?9en4GXrJWnwUPqDFvQMhdX3GDZPx2nrOa3xS9lRlAs0PG3OZxtZ+TOCnsU+A?=
 =?us-ascii?Q?7GRdbdZ+ybuxiQP/dBDbMWVnZwigh58weGo2h2T++6ZYEPf4AqrOxNZ13N5f?=
 =?us-ascii?Q?xZ+UWbeRvCktzaIMUkR4HINdZK/7u64sfgX2r7t2pb+qE2jl7kemqlsOwtCs?=
 =?us-ascii?Q?/F1Tp4wHFlLN6ch7CtcILAmxzddL7E1Lv4oK9KnrrW56khNhy/cC+tZb9ROP?=
 =?us-ascii?Q?BJ1/dpRr4uY68kGnHZChKdtpvLPNrKdPwvvd7RR4BjGAVjwuV+c7APHmbvt5?=
 =?us-ascii?Q?G65WhvhD+d+KGq/G/rUb4dLPlOEOYC93dgnORUcu/DxdDHdf63i4cDl1g7nv?=
 =?us-ascii?Q?21Z/GkN2PuklQxSxBQ/FeFIYVmEpJf+MZlvro8z5pp1Z/XAxNp60LdC8CdbE?=
 =?us-ascii?Q?x6qU9DqRfpNeLT569hg1NpKBom4fYcgDIxtfySkGdpsdY6aSe/N4il52j1tp?=
 =?us-ascii?Q?pcTVCKKdq5WEXJnAwWX2w31XaCCb+sOOqq2AQz+2UsPCnAXF60tCLettnUwh?=
 =?us-ascii?Q?/p1SVFreHlhh7BaFJs8ynLp0lEwsO0qzNykCOTk0eAUaLPJn4bw8KjBw3HR7?=
 =?us-ascii?Q?+VAcrzjnNRpgMaEeX5jbXko/KQu2HwkKFsfJVoZfB2rhM8+2eRvHJ96k1r9s?=
 =?us-ascii?Q?hN93POZxF8kJwJVuuGFv3r2ao4rT+/GPffnlNsjrd5c+n3nS6KAgS9E+ZFi4?=
 =?us-ascii?Q?+K+BYVBiGu6U5MLbB1prYrEoB/5rBa7WX9hkYnD5VCLmcjIO4w1uKjykDKYI?=
 =?us-ascii?Q?aLpo+p1YlsJ+eGnoLTQBeIBrarBukKdF9zM5B/oTWb5IT0IwZULyEfyfmduT?=
 =?us-ascii?Q?vK56oH7GY8bqppBO/viMsSeXipoUmAGixAVrmAuQgFsboDRnd0kMtMOeYE9E?=
 =?us-ascii?Q?NlLNQ7oitUJ75G8sLHggy3W910G4TGyZXwN/pk9FhBFq0zMv054LlyvPcVc/?=
 =?us-ascii?Q?11hBl9QLtm8QV8hy212UvcCYbyAOjJ5JW/vzupAUOmFKMsmhdOtOMUlzh7iy?=
 =?us-ascii?Q?Tli4ID8m9MKd8wpEktaFJ7tuuzyYYBU8sBuV8A3FmFNYMBlfWzeL+Vlu9VPu?=
 =?us-ascii?Q?9FJqwo82IU+pH7Dn9sQfhv+tdIQo/cb+kP6wp+aTdthFz0UDoAXx5rPWZyXW?=
 =?us-ascii?Q?QREmPLrkIAgOJejkmf/2YFLaRv5wmKsjVdjqBwxamKWenuBEV+F08DTec3a1?=
 =?us-ascii?Q?Ds5XjluYqPPaiYZLBtZik8KW1A00b4E5obk3fUXn52fs4FuZ24mmS3TJ7hxM?=
 =?us-ascii?Q?T/H8Y9watvP4zG6lx3NIlyXtVVCoBYL2ggcaDxJ79KDYtRpChiMQj9XbzdXW?=
 =?us-ascii?Q?cu9U4H4jXmF8emuQnv+BkRcg/1m7mkX5N0okruKqAYvZzhYHnzPW/fhR0hf4?=
 =?us-ascii?Q?x6EyDIiGP9CUkajmqHS+XYWEjsR+NDnHL30v2TAGRc7JDCYdIT0g8xdwfHL+?=
 =?us-ascii?Q?NpsLz6Xmz60eNMdVCoWJIBX3ZfdkfZU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 805fe162-bf6b-4cd9-eefd-08de4fae5285
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:38:46.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vOqZC++lDLqlm1KH5e2vVz3Vav7bFMVfwg+Tmox/o517Q4TalM8ex4isNIU7Et0EBQKdMIPmYYAqLnj4/awIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7559
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

On Fri, Jan 09, 2026 at 04:11:23PM +0100, David Hildenbrand (Red Hat) wrote:
> On 1/9/26 15:30, Zi Yan wrote:
> > On 9 Jan 2026, at 8:26, David Hildenbrand (Red Hat) wrote:
> > 
> > > On 1/9/26 14:19, David Hildenbrand (Red Hat) wrote:
> > > > On 1/9/26 09:54, Francois Dugast wrote:
> > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > 
> > > > > Add folio_split_unref helper which splits an unreferenced folio
> > > > 
> > > > split_unref reads like "split and unref".
> > > > 
> > > > You probably want to call this something like "folio_split_frozen" ?
> > > > 
> > > > The very definition of "frozen" is "refcount = 0 ", so you can simplify
> > > > the documentation.
> > > > 
> > > > Are the folios you want to pass in there completely unused (-> free) or
> > > > might they still be in use (e.g., migration entries point at them during
> > > > folio split)
> > > > 
> > > > So I am not sure yet if this should be "folio_split_frozen()" or
> > > > "folio_split_freed()" or sth like that.
> > > > 
> > > > I'm not CCed on the other patches in the series or the cover letter, so
> > > > I don't see the context.

Here is a patchwork link to the entire series:
https://patchwork.freedesktop.org/series/159119/

> > > > 
> > > 
> > > Ah, I was CCed on #3 where we call this function on folios that are getting freed.
> > > 
> > > In that case it would be acceptable to initialize folio->mapping (and folio->index?) of the split folios. Do we also have to initialize folio->flags, folio->private etc?
> > >

I lifted this code from FSDAX here:
https://elixir.bootlin.com/linux/v6.18.4/source/fs/dax.c#L394

It seemly does everything we need for a zone_device split.

> > > See __split_huge_page_tail().
> > > 

I'm not seeing this function defined anywhere.

> > > folio_split_freed() would likely be best, because then it is clearer that there is absolutely no state to copy from the large folio.
> > 
> > Yes, basically, we do not have a reverse function of prep_compound_page() and
> > open codes the reverse process in free_pages_prepare(). For zone devices,
> > zone_device_page_init() calls prep_compound_page() to form a folio but
> > free_zone_device_folio() never does the reverse. FS DAX has its own
> > dax_folio_put() to do it. Alistair suggested to come up with a helper
> > function for both FS DAX and free_zone_device_folio().
> > 
> > Maybe free_zone_device_folio_prepare() is better. And put it in mm/memremap.c.

+1 can rename and move.

> 
> That would be even better, if we can limit this completely to zone_device.

Yes, I believe this function should only used by device private, device
coherent, and fsdax folios which are all zone_device. I can add warning
in this function too if it is called on non-zone_device folio too.

Matt 

> -- 
> Cheers
> 
> David
