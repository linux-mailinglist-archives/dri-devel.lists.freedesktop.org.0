Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B04FB9F5A3C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C012810E304;
	Tue, 17 Dec 2024 23:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWbP71eT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0F10E0E2;
 Tue, 17 Dec 2024 23:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734477249; x=1766013249;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1wKli30jhfmwC2W3zv+J4LHLaYWi4XkNgEa2t65nq9I=;
 b=AWbP71eTkG7dCw1MlgJxBkDNmp1eWxFNCwqRpq0DJic/h8NFLWmxLZep
 Ous7LYXmPC6FAgSAfUZ9HAdop5Ywu40iiBn/oUQmrsi5LxGCLXtPfhNsY
 55A2Mi8neLUeXxXTOrhh2pgR/HLoWlvR1vRxc96UwBiARH8NYVg2WsgkJ
 jGHXr3zwUqnHsffRPYxRJM5jCPgcHl3PuyhG9cz0grRDJ0UCJxw8Sr5m8
 hznkITIsGit3uhqlbkC1nETbx5PRnFuIsxq/yuVqzPqNgYcMqEKzXx8L1
 rMLcN6XHlsOU/6WYMmUDrOYdmhfkD1MyhotN1Fl6PkOGb0cjGEAs/RXGy g==;
X-CSE-ConnectionGUID: VV2NQSiYRHKZQXVYTN1vNQ==
X-CSE-MsgGUID: 89tzCK8JSfSoMjK5/IR+SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35142288"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35142288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:14:09 -0800
X-CSE-ConnectionGUID: bGGrhXVnT7SXxEYIsrusCA==
X-CSE-MsgGUID: P+eHQ7c3TDqhpX47U47FDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120921857"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 15:14:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 15:14:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 15:14:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 15:14:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9zvt/lnUcfnAp2VQAnH8cZCkoPdZjX3otlFVSB/TUIOOS+wT/OczHa1lHzH6VCVdDWBR4YA1+8RazRtmc0kBgs5a4i/aLxAyIEXIVbjIRBn+ygaqKjd9OKDF4NvN+8Sor4nFoNHhf988+5qabQQYp5L7Xe6ybpg6f3cykYDDW/SWBQhejhdV7yEstS0XMWgcm7MqAJCrk9UTbWZwWnZpx7iNZvZXe0pGmgfUN62O+ekr+dbeQQ8C2KGHK7xo6bp+uVBP5hsyQBxwyw2jo3I9jKuccXx93KUt529UJ5LVi+resJBAUmJffIof1tvPBRbtCjbzY4ONW5JDW19P+cBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIgUcxT4/nL/dvC8pYKK1QPHH5vzn5HisQZIXS8iKw8=;
 b=OtLgRYsYb6vHlUZGrJnqww+SFGps4ijW/hWFL6aV9mH2nmxH9XviHL8A10LZu/FRRCPBR21tsWuPDDpOVpX25sR70v8C/1vGP2FFymcz4BZLPNFIsPO8y8nOUqS6XnBYswRkbZHDg752WOgTUHDYDOnv0zsBBhhLeWBsTna0Tickz/km7jMWcJpvKV6fGrntgPJuoMf4L1glmZBeVsrP6uuthVGzalzHVB2lkRnNRX2fd97IM7EMM1C/bUdksDZuQOwmNBMnjq2liLZsqX4tiMq71Z/FjDvLaNNMiuStlBH6t1L9TuwW5mEXdwT5+czjylC1GdoNJqymSy3z1iDISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 23:14:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 23:14:04 +0000
Date: Tue, 17 Dec 2024 15:14:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 29/29] drm/doc: gpusvm: Add GPU SVM documentation
Message-ID: <Z2IF57M6k1H1PifT@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-30-matthew.brost@intel.com>
 <bb203f1695b12ade536dde449023a894f3b22193.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb203f1695b12ade536dde449023a894f3b22193.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0370.namprd04.prod.outlook.com
 (2603:10b6:303:81::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a4f02f-4902-42ef-fe61-08dd1ef07fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?D0An2S2QjX/Pbzt2mgM/yQh+4Njh3DcBX0DrNerQVd2wO06Wnb7CF1zqPO?=
 =?iso-8859-1?Q?AnUAARgoh1TnIe1mePiVxONO72brm2NRUtcVhNaJHBj0kE/WRxTtAzVN7f?=
 =?iso-8859-1?Q?APi1th2TKpKsHmxBlgfpZguezGVq9qvOr1cOhpMmDaS8qsDR3JSuR6vOEb?=
 =?iso-8859-1?Q?FPrpIYWicQqLRr2msjL77DvCL0UkjNKvgJJDCEQ/MGGfhfMIXy86R8CGLL?=
 =?iso-8859-1?Q?dIQ/Rx/CFVe+Jo2QsDxSaFx8EHaWb/VtcTXZOXHKLdIvseHhQfxOM8GSQB?=
 =?iso-8859-1?Q?8HvpjrQpGXIARmf1NP52VHGIseBXujliiISYH2CocvnPfEOkQjg1TEFHDQ?=
 =?iso-8859-1?Q?SKf2jD/Xc9pIN9bPJJtcpNFZcuUILSy7VwfKesZgU9YgNpaUmkjJbno21I?=
 =?iso-8859-1?Q?tYMHBzisOh/kbh1wn6wBJqE8SWKqb2M7OPdsfmUUM+ZgIrOe34rG4mxtzl?=
 =?iso-8859-1?Q?Uc/vy6jwWHoYofSPNVv8+4L9VX8V0vCEe4bM3KaJC5SxTOrUDTMPueZ5DJ?=
 =?iso-8859-1?Q?IV6NChbN2p1Z/NlhjCMZM2X8Ou5EGX8/elvQMdYqPBcXdvXiJyKhfFVbnO?=
 =?iso-8859-1?Q?Rfet0hTx7933ZSzNFooSCE1F2WsbbuAO9ckX09qfO80uYX0Lh3vJnsZlH9?=
 =?iso-8859-1?Q?g6jE6WsSbe89J/noYKvUzvO1hzVQVX6A/Uhz81D2sAjMqKDraRWiaaWzco?=
 =?iso-8859-1?Q?4+7nKsAXbAkutCcUYOjN0PCJJMyMLAHscT3LoChR6/97BODdlA74Z33KZW?=
 =?iso-8859-1?Q?TEltsMV0Z3PQlY8pZD+95zEX2d9VQxbpyy60t8iOxDvgQO8Nbb4byLWg2j?=
 =?iso-8859-1?Q?LpJbJYP3h88bbo0ee9klsCARZN4l2AFSaIk6Rea8C13RJOV0Hgqmw9Ok/M?=
 =?iso-8859-1?Q?bKGIOW28dmleJ1XZZxYhevMZwdLwCeAJU4XRyTbYxRgs5yssSl/w5ziVZV?=
 =?iso-8859-1?Q?BqUASVd9YBZgPKyhk5+Sbu01olQAIVOlFHFH6Rac3BibfubHCa4fLdZuEf?=
 =?iso-8859-1?Q?MOfsWhT86J5wEgODyt7uBxSJp7y15f1FU07c6ayXHXf9kgqwL8/ZQyYrf0?=
 =?iso-8859-1?Q?KIA+RnoUb2G4CpPUb6VRz53bpcCEFageTeAGfV93cp5XeRJNILLSClA3aQ?=
 =?iso-8859-1?Q?+CR1jB5j52uxacOoWgTZhsqwuFJUCiD+UgNmipUVGaAZVOBBeVsbPw+U1/?=
 =?iso-8859-1?Q?WyiakKqG7BuvSsCVGTArd6VKpiDqyGtY6RIxi+xcKEKrX4qfeLqN1dVatS?=
 =?iso-8859-1?Q?c+yiC7kEFyhxQCTcLGXX9LcRUDKgu3OtNe1aD7s31HkVR4kScEsvZyoGCu?=
 =?iso-8859-1?Q?RWgPffRL6PYV3JkQKEQl6yvANpFiO7Vj3sP12uBZVUG2rTXuxT54CTn2H3?=
 =?iso-8859-1?Q?ey/FFGdz9FFgWkuLMbFzGAISvGEZ8/diRSQ351fj+VDaAEKUs4lCEdUXwi?=
 =?iso-8859-1?Q?7pLsPyhuSJLu4XJD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jY5rP3iTCoW1oUOVd7jV8KFZmVqf1+KGcc6WOjhEpLjPxOkpF934q3qdvJ?=
 =?iso-8859-1?Q?EZoZVLbASibSaDUjglbu8rZ5KzERxq8ALUfZHXB/szI0jELVFEqYJPrNYc?=
 =?iso-8859-1?Q?vDb0topktvF1b+NWaytQzTzK0tOADcn00djYIStuh5kXcRoYwzU8/B0yq5?=
 =?iso-8859-1?Q?SYdEehvIkkrVYDrmtJoeF8/dYMt1JpN3STrJ7bdwEjiS3Hbld5LeSpEav/?=
 =?iso-8859-1?Q?PcEAt5kzyP4icrn/ZTkZ9Ocr/TDs/hPCIEGfD9UmQShJzqsNDuS4ErBIZ4?=
 =?iso-8859-1?Q?LpZVlOO41MTOmq6YaseTYDPHoFEtYrgYo5bV/VI+yGWli3pmJ1X1liUB47?=
 =?iso-8859-1?Q?Myx03jNboxC4ViRoTq2GE5OEBelrkzWst8t+7QzxvEdCDvNBqWyJuWB5ZQ?=
 =?iso-8859-1?Q?bY8bB1CivFWHol4xIjPkQEWtx+OqUGFPWPZhdBrhoTb9H8IjT1Cdhe+Z7e?=
 =?iso-8859-1?Q?+AHenwycpi2wKxcS0fK+r6TBGVEi4sWbIc8RRxA2vRUa0dUUlBxZeXVup8?=
 =?iso-8859-1?Q?jKJIG7PQcK9ZTEo9W6CnwAVqlOG3buAB6LAIRv2PJR/2uO5LSmW6GS3JJG?=
 =?iso-8859-1?Q?DVFwQ7dyH9J4n7bz8C7EB2jao+1Ol8a0ZPm75XyuGftuX8Fqth1ATvaUMh?=
 =?iso-8859-1?Q?sg/vLI3HzyNKXuTCTmjAiD9KCgPxiy8e9+p8s62bf+KA7pdTbfHGjAjXvb?=
 =?iso-8859-1?Q?jrQyU2NDM+f/B3PDeoEW2OkvlZigjtgpv/LguxSZgrtUIuJUTy6c7yEn59?=
 =?iso-8859-1?Q?oIj+c1ll+mj3oLIaj9VqKUmaRlkI80HdJPtSLXqEyJl/5/CcVyXo5oGl76?=
 =?iso-8859-1?Q?UmKBoXbHxtUG2gxlhn2vMSCQlouIbLiyQqn7gAlxMT9/YpigYZG8f4MtBv?=
 =?iso-8859-1?Q?r4QKTXA5OcahwcQgKngQtdnFe5vocHqOxHJHl/38c0CWcJNBF4SpOFBcSd?=
 =?iso-8859-1?Q?zastqJasEMEyihGsd4Xiy1oGdc4/51R429AxaxKpSv42xmR0C52aHoOFco?=
 =?iso-8859-1?Q?SXmuxtGIFn9+ITJ46Z9+sSeXG1J8p4FuXycBqzDWtya5zbzz/GY2r+mnX6?=
 =?iso-8859-1?Q?KC2sY0S/0o5wsL9gzIjFsEa0UM21BfEhvggiTL0/g/7A8IfS+AS9mSx043?=
 =?iso-8859-1?Q?ywOkd5N11hvenVNgKM9xpO387gV5bAYXhIkWn0zv02SebUMFkdraN1DJ4J?=
 =?iso-8859-1?Q?e5w/uoeBlr+hqg1PkpjwnReyaUhqnQntJpoDAmA+Fe8cTnrrEXOLAXHR3C?=
 =?iso-8859-1?Q?yEQsEECWsmyzS0DsgCyo8FIGYUjfC4bcDiIW6ZScDZfTLKtogzVQZg6iQ4?=
 =?iso-8859-1?Q?QC8IFIATau0BaMQgQg2PUYvUGc3KoFjBmqnRe1FuXMnfonTSY6Eei9juQd?=
 =?iso-8859-1?Q?r+s3YgOnF9TdBwzI6aszKJfP62hMx2Ex4cwHP/3IC2iHMAAoq2YNVXmOAA?=
 =?iso-8859-1?Q?fIqgiiI8THLxYbFifPdlHH4E7kLgivCvpcihaKQEISp955Tmh7WMJxZ/QM?=
 =?iso-8859-1?Q?Md/c+m0Nx87tDdaK2mmNGUjTHBnwIPhWGPT16SqJZjOO0F2G1aW1hi4BwS?=
 =?iso-8859-1?Q?W3BUxCIOScRuWg6W3OYl7F73pAFCoP7fZ1l6YfK9q4i6s40BjgkJGFJqvk?=
 =?iso-8859-1?Q?wM814QXIhMWAPzKK46Xy8299CwUbWALPtAfvlaEt2OWhnmxzWMF7JRHQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a4f02f-4902-42ef-fe61-08dd1ef07fc4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 23:14:04.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdjsU1kr+rO6i+ySkqsDEfEFyFQDlgOSLopmjJK1S7MoEtI5sRDjyIaM74G/k/BlWIipTx7NR866q55L2FnviQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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

On Mon, Dec 02, 2024 at 02:00:44PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add documentation for agree upon GPU SVM design principles, current
> > status, and future plans.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  Documentation/gpu/rfc/gpusvm.rst | 70
> > ++++++++++++++++++++++++++++++++
> >  Documentation/gpu/rfc/index.rst  |  4 ++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
> > 
> > diff --git a/Documentation/gpu/rfc/gpusvm.rst
> > b/Documentation/gpu/rfc/gpusvm.rst
> > new file mode 100644
> > index 000000000000..2d3f79a6c30a
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > @@ -0,0 +1,70 @@
> > +===============
> > +GPU SVM Section
> > +===============
> > +
> > +Agreed upon design principles
> > +=============================
> > +
> > +* migrate_to_ram path
> > +	* Rely on core MM concepts (migration ptes, page refs, and
> > page locking)
> > +	  only
> > +	* No driver specific locks other than locks for hardware
> > interaction in
> > +	  this path
> 
> We have previously been discussing the bo lock to protect the bo from
> eviction during migrate, if the vram allocation is bo-based. This is a
> cross-driver lock with a well-established locking order and I suggest
> we allow this. Apart from that I think the above statement needs some

Not allowing additional locks was suggested by Sima and I think it makes
sense but I do agree taking a dma-resv in migrate_to_ram would be safe.
However, the way GPU SVM is structured there is not any hooks to enable
this.

> elaboration: What is the problem we are trying to avoid with driver-
> specific locks, written so that it's easy to understand it's a bad
> idea.
> 

Sure, will try to elaborate.

> > +	* Partial migration is supported
> 
> Exactly what do we mean by partial migration.
> 

Will

> > +	* Driver handles mixed migrations via retry loops rather
> > than locking
> > +* Eviction
> > +	* Only looking at physical memory datastructures and locks
> as opposed to...
> 

As opposed looking at virtual memory data structures. Can elaborate why
this is a bad idea too - basically mremap + fork fall apart when you
start looking at virtual things.

> > +	* No looking at mm/vma structs or relying on those being
> > locked
> We're violating this with the current implementation, aren't we?
> 

Aside from when calling migrate_vma_* or creating initial range. Can
elaborate on this and certainly say drivers should not look at CPU VMA.

> 
> > +* GPU fault side
> > +	* mmap_read only used around core MM functions which require
> > this lock
> > +	* Big retry loop to handle all races with the mmu notifier
> > under the gpu
> > +	  pagetable locks/mmu notifier range lock/whatever we end up
> > calling
> > +          those
> > +	* Races (especially against concurrent
> > eviction/migrate_to_ram) should
> > +	  not be handled on the fault side by trying to hold locks
> 
> This actually contradicts my comment written above about using the bo
> lock to block eviction here. The alternative would be to pin vram
> allocations during migration until the mm_truct has references on the
> allocation, but it'd be good to clarify exactly why locking here is a
> bad idea, and why we can't rely on lockdep?
> 

I'll try to clarify.

> > +* Physical memory to virtual backpointer
> > +	* Does not work, no pointers from physical memory to virtual
> > should
> > +	  exist
> 
> We actually still have the private zdd structure, but it's strictly not
> to virtual but to the allocation metadata. Is it verified that the
> zone_device_data field is allowed to be modified by the pagemap between
> allocation and migration?
> 

We don't modify zdd between allocation and migration aside from the ref
count of the zdd.

> 
> > +* GPU pagetable locking
> > +	* Notifier lock only protects range tree, pages, pagetable
> > entries, and
> > +	  mmu notifier seqno tracking, it is not a global lock to
> > protect
> > +          against races
> > +	* All races handled with big retry as mentioned above
> 
> Adding a note here about "pages valid" for subranges rather than
> relying on the wider notifer seqno. I.E. a subrange can be valid even
> if the notifier seqno says otherwise.
> 

Sure.

> Performance considerations:
> Perhaps mention that notifier (core mm) performance is more important
> than gpu fault (driver) performance when considering optimizations that
> improves one at the cost of the other?
> 

Hmm, that is kinda speculation IMO. I have heard that feedback but
unsure if I agree with it nor do we have any data to backup that claim.
I'd rather not write something down like this that is based on
speculation. I do agree we should profile the code to really understand
the hot spots and write down our findings once we have done that.

> > +
> > +Overview of current design
> > +==========================
> > +
> > +Current design is simple as possible to get a working basline in
> > which can built
> 
> can be built
> 

+1 

Matt

> > +upon.
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> > +   :doc: Overview
> > +   :doc: Locking
> > +   :doc: Migrataion
> > +   :doc: Partial Unmapping of Ranges
> > +   :doc: Examples
> > +
> > +Possible future design features
> > +===============================
> > +
> > +* Concurrent GPU faults
> > +	* CPU faults are concurrent so makes sense to have
> > concurrent GPU faults
> > +	* Should be possible with fined grained locking in the
> > driver GPU
> > +	  fault handler
> > +	* No expected GPU SVM changes required
> > +* Ranges with mixed system and device pages
> > +	* Can be added if required to drm_gpusvm_get_pages fairly
> > easily
> > +* Multi-GPU support
> > +	* Work in progress and patches expected after initially
> > landing on GPU
> > +	  SVM
> > +	* Ideally can be done with little to no changes to GPU SVM
> > +* Drop ranges in favor of radix tree
> > +	* May be desirable for faster notifiers
> > +* Compound device pages
> > +	* Nvidia, AMD, and Intel all have agreed expensive core MM
> > functions in
> > +	  migrate device layer are a performance bottleneck, having
> > compound
> > +	  device pages should help increase performance by reducing
> > the number
> > +	  of these expensive calls
> > +* Higher order dma mapping for migration
> > +	* 4k dma mapping adversely affects migration performance on
> > Intel
> > +	  hardware, higher order (2M) dma mapping should help here
> > diff --git a/Documentation/gpu/rfc/index.rst
> > b/Documentation/gpu/rfc/index.rst
> > index 476719771eef..396e535377fb 100644
> > --- a/Documentation/gpu/rfc/index.rst
> > +++ b/Documentation/gpu/rfc/index.rst
> > @@ -16,6 +16,10 @@ host such documentation:
> >  * Once the code has landed move all the documentation to the right
> > places in
> >    the main core, helper or driver sections.
> >  
> > +.. toctree::
> > +
> > +    gpusvm.rst
> > +
> >  .. toctree::
> >  
> >      i915_gem_lmem.rst
> 
> Thanks,
> Thomas
> 
