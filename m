Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3597DA7B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 00:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544910E159;
	Fri, 20 Sep 2024 22:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpBT+4uU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A1B10E002;
 Fri, 20 Sep 2024 22:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726869701; x=1758405701;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ta3txD0Ci9o0QL/kR2msQcxhTx621cFA355t4jsUaNM=;
 b=fpBT+4uUl2sefBWitBtLS40FOqyV809UswRexAgZpZG31ozIA4E5wsCR
 e2ZRD8u0/y12rAPnNs+xClU/Qk5v8qb4k6QjKMFEfql2XJY0pPhsDE19e
 0H7Yxa6ktShRRDR9e2CV8c4Yy3X5EAPhoDxgQ5uomCuM8M0j6tmO4y687
 Lv+QhsoopT/KzXy4a2DgWqfFiIVDmKTXEvHf0jmgMUSQnXawK+snoEvP2
 xy/YZnOjyMc6B2sYpCrQXjnbfbT35ZO2n6oHELVs8fP1qjPnwKTIHG2PP
 rW3Kk6d99RukeZAYYOSXwnP16rOXw72jr8qUad+lbrhsl8tFLJpAFEThj A==;
X-CSE-ConnectionGUID: c3q/KFsNQt2LIbCxe1u5qQ==
X-CSE-MsgGUID: F9iYAGuJTOCN1Q1C9h4pUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25411298"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="25411298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 15:01:41 -0700
X-CSE-ConnectionGUID: GLOsUSaPQtKKsjnlR5gBrw==
X-CSE-MsgGUID: ywWYJVcnQ8S/woHx1UFazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70582943"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 15:01:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 15:01:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 15:01:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 15:01:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 15:01:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcWsKT7VQP6gRvEEW0xcBm+FuoIYMzvzwW5xscQRhpoOE86I5LSDLeaJysDrM35OGqnrElAN9YBs4Y1AQCbZtuFg89yTBMKMeJiF4OCvf/DULyYym71lXGUHj0G950dQ/y3946HW7UuhkA0oK6eIZ/fSv1XCkgrkHEMzgdX+FEG2FYXgMLwlCbh93AE2MB/LxCTsn3s43AFD5Yzhy746fJSfTQcxuYMzu6GsUYyZVQPaUD4gnW1FLdNbf4LgWFk+Nua1g0qjLJoXPSzho0eyVyPsNYluiGJj13KqzpYjTHbMA5E4teYqEtV+uUTJts4gslQ8wbvTsOeYX9P8NTDHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdLcyBTohePaB9wMC753cNtqf0fbV+SBLvseu9nHec4=;
 b=RI23aFu5UkLeSHjB0afuNo6rNrJlsRAaYDuuqLS33wusnHSX8NGC6HcvwjmBl1dDRPB76RumLSr763/9TmZYqSU5iBKsbBj82lyd9N1MC4w7xWNLEPOA390TTeIBHBSpMdhsKsN32tliVkdxqWb7GUlFkaHW9TUJDhasdIXScNY2BE+U0fE9y4phm3CzySKw6NnREn7UKskr9Gyx9wdHBAm7mwV+gZ+H4rlVuOtPjMmd1MIbM956icEKak9jUdu+K84F0l3rFZmxQZUWVOwQMs3XsCdd5PWRdFmL7/0AKSN21TBzivY170eOT2sDbAGgjetzWveb/i9egUwhxCVHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 22:01:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 22:01:36 +0000
Date: Fri, 20 Sep 2024 21:59:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Felix Kuehling <felix.kuehling@amd.com>
CC: Alistair Popple <apopple@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <simona.vetter@ffwll.ch>,
 <Philip.Yang@amd.com>, <akpm@linux-foundation.org>,
 <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Zu3wV9FJSTs1E5Vx@DUT025-TGLU.fm.intel.com>
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
 <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
 <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
X-ClientProxiedBy: BYAPR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cccf9a6-5fc4-4eb4-f2fb-08dcd9bfcc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?i8TMROLmIeW9mhext8s5jaETuXK5VYjqzF/ZoAIlzHLsgEO42vewSwruos?=
 =?iso-8859-1?Q?FhwkYkq6djMre2+I1x+KM4h9RlP7EMXSSBG5iPxZ4TeNucXIBKHzKjV967?=
 =?iso-8859-1?Q?NAVS+eHKSqn8Y5IGP1jIQMdKZX88lOqQJv6hG+4dTYC4+mi/6cuPFD209t?=
 =?iso-8859-1?Q?u9PfVhwCTHttn/ai3wuWGCdMq2bu7nmzWVUodypnDa/svqQwcIfazoFebZ?=
 =?iso-8859-1?Q?5G9CIw3b1pn5z2Tlgsy/MdJ7i00BSsEb6N4crL7K0bXmyjDZaKHqQmzrh2?=
 =?iso-8859-1?Q?/cvnG/kEUcUNLJWICqvXur2o5KlAODQz5S6iwdD0/It3e0BkGJ4Y2x/8Cx?=
 =?iso-8859-1?Q?zrt9M4KS95YPYV9NKxe7NTxM0X+nzuC49r/X+kA2QohbPLaEFqYfC/ky59?=
 =?iso-8859-1?Q?lYCpmzlBDGDcnNFqpwYJLALjPJjk+YLOcE1HSZNYDnnEjsQb7OhYPq5BSV?=
 =?iso-8859-1?Q?mhjJQLQLibnfSEbeowSuutiZLdzoTUT1LbCkMild7EukGBoDhVhFkNxJ94?=
 =?iso-8859-1?Q?I1OB7uAvDu7qHTHxsPWbiOkIIHBpM3kt/ga5GXPtCXiR5EGPw0PFF4gkyq?=
 =?iso-8859-1?Q?F8iDH/WTTvU7swOuNjiV/+PCZ40jVOCE6PPR59oAVfZT5uSA1m2lenQD0j?=
 =?iso-8859-1?Q?FUlyuMHHHah4S0+ugrjFxn+ELD192jWoNTeSyovQElvwVsxp64SqU6ho/z?=
 =?iso-8859-1?Q?qmQe/i3m4fNLVxkSuMoo53pwSO/bIK+/IL45S4d4hdOVW7iVR6D3gW3KyJ?=
 =?iso-8859-1?Q?IcY1zlTnMX6Yjrbo0bHfrLWroAROk11/dQdfDGbAKcQ/ZjJA8B4FVpSrv8?=
 =?iso-8859-1?Q?lKYmC+9WCOXDfBIS48JYbrXGFccCeqX2x7yZjA26wimkmSFyv9Jyq+2sB+?=
 =?iso-8859-1?Q?O6LQEbt3T5V3Rv77alhWVRLL1NHvpmf0J5Hys2K3dZ068hQXYXVx7B0APp?=
 =?iso-8859-1?Q?tuqmwNq2xpHK6wVIgmUW5WQJ1igmRAXf7ISofeuPr0WfEqiOAfieTdiAQr?=
 =?iso-8859-1?Q?y/TJ+yde5B7CpZIt8jH0zSIPurUUElG/AazKPufdRFs+/Kp/yqwb1M8XTl?=
 =?iso-8859-1?Q?WFwOVZKJlhOJYLA9lpt+qVejraOwU3VGEeT2huAFYj03dIP/dfKlfIWvcg?=
 =?iso-8859-1?Q?ATf/mHs/9zF/fr37TVbicgPYcyUIHrgniW6seTzQuNRXW6S9v66yTs3WuX?=
 =?iso-8859-1?Q?cZ6fECys0kgAiC/cg1UEYPTkntsEeknMpt0YfiiigThzgIKP5sxQB33Mdm?=
 =?iso-8859-1?Q?yWZo54JDIwzqKMBdwCbogmzVYuL6+OWgKFBvQCeXdRE6n+4S8s4ipyTySO?=
 =?iso-8859-1?Q?0tZemKJgbQyBLJRtsIn/4e7ixw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?M/fUaOEWBUQnyuWW82HIufrk2WMvqmeD9X8Qhrm6CUQDWKEBBzDU2zHukB?=
 =?iso-8859-1?Q?YGuVL2Fm4caUyFzoO1zzlKvP6hnZuklwbRXXsPEcb5GUtWAnPi5DQN4+qS?=
 =?iso-8859-1?Q?hmzIKGYrAUhXO0Sq4cjPUCXXa/hOZ1p+wmg0Ms/lIocDvtSB7SY+umMnhv?=
 =?iso-8859-1?Q?L6dxQWHCC4tUBU/Kxk7veSyhGMIRfxfN6tp0X5H4mbvpek04YzDWDaoxgy?=
 =?iso-8859-1?Q?7PZ6JNW1ndlbsHnxK3YPTwQ2mADCxedAPj9t7mxJJRTblnUm8I4WjrIKSc?=
 =?iso-8859-1?Q?JYqsqxPrZS6kueAKKa4M74OYYJz2NcWZTMlMhdd2DO5TGi12FZQUQSL+SG?=
 =?iso-8859-1?Q?sqvX673Vgod23GlT+bv97M3GFyp4UiY+YszaJRoyKztsZ7+kQ+ARH1O3iy?=
 =?iso-8859-1?Q?a4FlHEm2kCDmP2Zknkoyk0tuAc5LJu0DSS7iLhPimK7u53WKcxHSxriKYP?=
 =?iso-8859-1?Q?RiuZAlyjiNzcka6Eezux3/5fGk1mbsJJxXBIJ8PV4Dgad9o8LIsQg9xJTv?=
 =?iso-8859-1?Q?9CM7NdS0yHTVA4JLxcYHRgNictkMwT9bTagS7wrgdEyRp+xuC+nd3CK94t?=
 =?iso-8859-1?Q?5A/uw85o4v12rAnyGuCGL8PneW25fmYGPG1fsFeIixHoGmUEPe/vJ+qkGC?=
 =?iso-8859-1?Q?Gm3vetiD9Qk9jbbwEopTOfR+9e7mvHXFAEK9DfOO3bB72/mXu0CRexWrfo?=
 =?iso-8859-1?Q?pec52qLTOax3zsNyO8qPezlVITx9lwz/8awZent9SzoE8yxkAcM4zN1nLK?=
 =?iso-8859-1?Q?EizudYv0U85E9VCf5oL45ghBk1ySCrHDk2QCcCEkOu1DWhzqKClhqX55aG?=
 =?iso-8859-1?Q?/zdqE8ty6HxbysVbDjgbv00ybaCozLVxT1XHNQRHzfqG+l9bdeiWYe5zsD?=
 =?iso-8859-1?Q?LhXidKjOrIJ1Q+e8ZOU0BpDOI1WxStBmSbNAcgg5BbzZP6qmJOtZtDsZqw?=
 =?iso-8859-1?Q?Epx7AuleWLcjW6hjGMdK62i8p/UeaarWX/ggUOPVxYkcVUFF5gYDK0A02E?=
 =?iso-8859-1?Q?wCo55v5hN78calEOwLbSooRDsj/hap67S3I3XxO1mHbPPDz+nLqd8Y6xl8?=
 =?iso-8859-1?Q?zfzBaG2FXJ+fiHXgZZd46nQRMSIvKHybzdrYLIYSb3ji2XOgdNxOrMmKnZ?=
 =?iso-8859-1?Q?Tk0PtkJPAXuPx0IhBa0N/hqI51sN+l8lKqC5n7hwucTzZx0BnQXqHlJ0Rq?=
 =?iso-8859-1?Q?bXN4MlWLiNsIWEgoekLgO3r0u0W+U9iWHjMyfuyH0ndoDa24tEZ21bDs0p?=
 =?iso-8859-1?Q?jDt37sLWDDIxwmW3yVhAanZYxDy3IUwFNoKDr0yvPvUG0w3j7ofXvQ8hBb?=
 =?iso-8859-1?Q?VtwPWC9hseFLDcrAIZchY7or9JxBdtQgUobJPbJXbSeSVQdtHJyREUxhPj?=
 =?iso-8859-1?Q?HPdN/v9Gp6r6ciHjWyDlq3zNSdJOVVpaD7SdR6eIkujMOnEZ/bwnjF/pjB?=
 =?iso-8859-1?Q?6b/uPL+Yw049M550i1WTfKdvK3LzHoU1WOLV3U5COLWMb+iURUWcRSmPBI?=
 =?iso-8859-1?Q?ZF84Uce2/6c4gw+YDmPv8HrRoohH8wJHDXhn70b5MuII9H8qPK/BFlmztO?=
 =?iso-8859-1?Q?yiC7nut4Aqh6q48RUavmM+EODRlfM7WbfBbh8wuQatkajdn0kBeKez69ao?=
 =?iso-8859-1?Q?cj3ranEvHKG69Ho2+uHxECxyCROFtEA2wkiDpfvZb8Gc2GQpCNmyJvfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cccf9a6-5fc4-4eb4-f2fb-08dcd9bfcc0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 22:01:36.7097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CM38GWJ3xMaejoRtFd1TB7t+w5VbibrTLC1q0ay1dG+77gPtQrejT5eqGpV17g6BUkT5Hz4dKdN/+L5vWYjUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
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

On Fri, Sep 20, 2024 at 05:50:10PM -0400, Felix Kuehling wrote:
> 
> On 2024-09-20 17:23, Matthew Brost wrote:
> > On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote:
> > > On 2024-09-18 11:10, Alistair Popple wrote:
> > > > Matthew Brost <matthew.brost@intel.com> writes:
> > > > 
> > > > > On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
> > > > > > Matthew Brost <matthew.brost@intel.com> writes:
> > > > > > 
> > > > > > I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
> > > > > Still a driver.
> > > > Indeed, and I'm happy to answer any questions about our implementation.
> > > > 
> > > > > > but theoretically it seems like it should be possible. However we
> > > > > > serialize migrations of the same virtual address range to avoid these
> > > > > > kind of issues as they can happen the other way too (ie. multiple
> > > > > > threads trying to migrate to GPU).
> > > > > > 
> > > > > > So I suspect what happens in UVM is that one thread wins and installs
> > > > > > the migration entry while the others fail to get the driver migration
> > > > > > lock and bail out sufficiently early in the fault path to avoid the
> > > > > > live-lock.
> > > > > > 
> > > > > I had to try hard to show this, doubt an actual user could trigger this.
> > > > > 
> > > > > I wrote a test which kicked 8 threads, each thread did a pthread join,
> > > > > and then tried to read the same page. This repeats in loop for like 512
> > > > > pages or something. I needed an exclusive lock in migrate_to_ram vfunc
> > > > > for it to livelock. Without an exclusive lock I think on average I saw
> > > > > about 32k retries (i.e. migrate_to_ram calls on the same page) before a
> > > > > thread won this race.
> > > > > 
> > > > >   From reading UVM, pretty sure if you tried hard enough you could trigger
> > > > > a livelock given it appears you take excluvise locks in migrate_to_ram.
> > > > Yes, I suspect you're correct here and that we just haven't tried hard
> > > > enough to trigger it.
> > > > 
> > > > > > > Cc: Philip Yang <Philip.Yang@amd.com>
> > > > > > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > > > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >    mm/memory.c         | 13 +++++++---
> > > > > > >    mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
> > > > > > >    2 files changed, 50 insertions(+), 23 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > > index 3c01d68065be..bbd97d16a96a 100644
> > > > > > > --- a/mm/memory.c
> > > > > > > +++ b/mm/memory.c
> > > > > > > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > > > > > >    			 * Get a page reference while we know the page can't be
> > > > > > >    			 * freed.
> > > > > > >    			 */
> > > > > > > -			get_page(vmf->page);
> > > > > > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > > > -			put_page(vmf->page);
> > > > > > > +			if (trylock_page(vmf->page)) {
> > > > > > > +				get_page(vmf->page);
> > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > This is all beginning to look a lot like migrate_vma_collect_pmd(). So
> > > > > > rather than do this and then have to pass all this context
> > > > > > (ie. fault_page) down to the migrate_vma_* functions could we instead
> > > > > > just do what migrate_vma_collect_pmd() does here? Ie. we already have
> > > > > > the PTL and the page lock so there's no reason we couldn't just setup
> > > > > > the migration entry prior to calling migrate_to_ram().
> > > > > > 
> > > > > > Obviously calling migrate_vma_setup() would show the page as not
> > > > > > migrating, but drivers could easily just fill in the src_pfn info after
> > > > > > calling migrate_vma_setup().
> > > > > > 
> > > > > > This would eliminate the whole fault_page ugliness.
> > > > > > 
> > > > > This seems like it would work and agree it likely be cleaner. Let me
> > > > > play around with this and see what I come up with. Multi-tasking a bit
> > > > > so expect a bit of delay here.
> > > > > 
> > > > > Thanks for the input,
> > > > > Matt
> > > Thanks! Sorry, I'm late catching up after a vacation. Please keep Philip,
> > > Christian and myself in the loop with future patches in this area.
> > > 
> > Will do. Already have another local patch set which helps drivers dma
> > map 2M pages for migrations if SRAM is physically contiguous. Seems
> > helpful for performance on Intel hardware. Probably post that soon for
> > early feedack.
> 
> OK.
> 
> 
> > 
> > Longer term I thinking 2M migration entries, 2M device pages, and being
> > able to install 2M THP on VRAM -> SRAM could be really helpful. I'm
> > finding migrate_vma_* functions take up like 80-90% of the time in the
> > CPU / GPU fault handlers on a fault (or prefetch) which doesn't seem
> > ideal. Seems like 2M entries for everything would really help here. No
> > idea how feasible this is as the core MM stuff gets confusing fast. Any
> > input on this idea?
> 
> I agree with your observations. We found that the migrate_vma_* code was the
> bottle neck for migration performance as well, and not breaking 2M pages
> could reduce that overhead a lot. I don't have any specific ideas. I'm not
> familiar with the details of that code myself. Philip has looked at this
> (and some old NVidia patches from a few years ago) in the past but never had
> enough uninterrupted time to make it past prototyping.
> 

Cool good to know this isn't some crazy idea. Doubt it happen anytime
soon as I need to get a working baseline in before anything then start
applying optimizations and help in get other features to get the design
complete. But eventually will probably try to look at this. May ping
Philip and Nvidia when I have time to dig in here.

Matt

> Regards,
>   Felix
> 
> 
> > 
> > Matt
> > 
> > > Regards,
> > >    Felix
> > > 
> > > 
> > > > > > > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > > > +				put_page(vmf->page);
> > > > > > > +				unlock_page(vmf->page);
> > > > > > > +			} else {
> > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > +			}
> > > > > > >    		} else if (is_hwpoison_entry(entry)) {
> > > > > > >    			ret = VM_FAULT_HWPOISON;
> > > > > > >    		} else if (is_pte_marker_entry(entry)) {
> > > > > > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > > > > > index 6d66dc1c6ffa..049893a5a179 100644
> > > > > > > --- a/mm/migrate_device.c
> > > > > > > +++ b/mm/migrate_device.c
> > > > > > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > >    				   struct mm_walk *walk)
> > > > > > >    {
> > > > > > >    	struct migrate_vma *migrate = walk->private;
> > > > > > > +	struct folio *fault_folio = migrate->fault_page ?
> > > > > > > +		page_folio(migrate->fault_page) : NULL;
> > > > > > >    	struct vm_area_struct *vma = walk->vma;
> > > > > > >    	struct mm_struct *mm = vma->vm_mm;
> > > > > > >    	unsigned long addr = start, unmapped = 0;
> > > > > > > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > >    			folio_get(folio);
> > > > > > >    			spin_unlock(ptl);
> > > > > > > -			if (unlikely(!folio_trylock(folio)))
> > > > > > > +			if (unlikely(fault_folio != folio &&
> > > > > > > +				     !folio_trylock(folio)))
> > > > > > >    				return migrate_vma_collect_skip(start, end,
> > > > > > >    								walk);
> > > > > > >    			ret = split_folio(folio);
> > > > > > > -			folio_unlock(folio);
> > > > > > > +			if (fault_folio != folio)
> > > > > > > +				folio_unlock(folio);
> > > > > > >    			folio_put(folio);
> > > > > > >    			if (ret)
> > > > > > >    				return migrate_vma_collect_skip(start, end,
> > > > > > > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > >    		 * optimisation to avoid walking the rmap later with
> > > > > > >    		 * try_to_migrate().
> > > > > > >    		 */
> > > > > > > -		if (folio_trylock(folio)) {
> > > > > > > +		if (fault_folio == folio || folio_trylock(folio)) {
> > > > > > >    			bool anon_exclusive;
> > > > > > >    			pte_t swp_pte;
> > > > > > > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > >    				if (folio_try_share_anon_rmap_pte(folio, page)) {
> > > > > > >    					set_pte_at(mm, addr, ptep, pte);
> > > > > > > -					folio_unlock(folio);
> > > > > > > +					if (fault_folio != folio)
> > > > > > > +						folio_unlock(folio);
> > > > > > >    					folio_put(folio);
> > > > > > >    					mpfn = 0;
> > > > > > >    					goto next;
> > > > > > > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > > > >    					  unsigned long npages,
> > > > > > >    					  struct page *fault_page)
> > > > > > >    {
> > > > > > > +	struct folio *fault_folio = fault_page ?
> > > > > > > +		page_folio(fault_page) : NULL;
> > > > > > >    	unsigned long i, restore = 0;
> > > > > > >    	bool allow_drain = true;
> > > > > > >    	unsigned long unmapped = 0;
> > > > > > > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > > > >    		remove_migration_ptes(folio, folio, false);
> > > > > > >    		src_pfns[i] = 0;
> > > > > > > -		folio_unlock(folio);
> > > > > > > +		if (fault_folio != folio)
> > > > > > > +			folio_unlock(folio);
> > > > > > >    		folio_put(folio);
> > > > > > >    		restore--;
> > > > > > >    	}
> > > > > > > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> > > > > > >    		return -EINVAL;
> > > > > > >    	if (args->fault_page && !is_device_private_page(args->fault_page))
> > > > > > >    		return -EINVAL;
> > > > > > > +	if (args->fault_page && !PageLocked(args->fault_page))
> > > > > > > +		return -EINVAL;
> > > > > > >    	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> > > > > > >    	args->cpages = 0;
> > > > > > > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> > > > > > >    }
> > > > > > >    EXPORT_SYMBOL(migrate_vma_pages);
> > > > > > > -/*
> > > > > > > - * migrate_device_finalize() - complete page migration
> > > > > > > - * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > > > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > > > - * @npages: number of pages in the range
> > > > > > > - *
> > > > > > > - * Completes migration of the page by removing special migration entries.
> > > > > > > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > > > - * before calling this.
> > > > > > > - */
> > > > > > > -void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > -			unsigned long *dst_pfns, unsigned long npages)
> > > > > > > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > +				      unsigned long *dst_pfns,
> > > > > > > +				      unsigned long npages,
> > > > > > > +				      struct page *fault_page)
> > > > > > >    {
> > > > > > > +	struct folio *fault_folio = fault_page ?
> > > > > > > +		page_folio(fault_page) : NULL;
> > > > > > >    	unsigned long i;
> > > > > > >    	for (i = 0; i < npages; i++) {
> > > > > > > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > >    		src = page_folio(page);
> > > > > > >    		dst = page_folio(newpage);
> > > > > > >    		remove_migration_ptes(src, dst, false);
> > > > > > > -		folio_unlock(src);
> > > > > > > +		if (fault_folio != src)
> > > > > > > +			folio_unlock(src);
> > > > > > >    		if (is_zone_device_page(page))
> > > > > > >    			put_page(page);
> > > > > > > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > >    		}
> > > > > > >    	}
> > > > > > >    }
> > > > > > > +
> > > > > > > +/*
> > > > > > > + * migrate_device_finalize() - complete page migration
> > > > > > > + * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > > > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > > > + * @npages: number of pages in the range
> > > > > > > + *
> > > > > > > + * Completes migration of the page by removing special migration entries.
> > > > > > > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > > > + * before calling this.
> > > > > > > + */
> > > > > > > +void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > +			unsigned long *dst_pfns, unsigned long npages)
> > > > > > > +{
> > > > > > > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > > > > > > +}
> > > > > > >    EXPORT_SYMBOL(migrate_device_finalize);
> > > > > > >    /**
> > > > > > > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> > > > > > >     */
> > > > > > >    void migrate_vma_finalize(struct migrate_vma *migrate)
> > > > > > >    {
> > > > > > > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > > > > > > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > > > > > > +				  migrate->fault_page);
> > > > > > >    }
> > > > > > >    EXPORT_SYMBOL(migrate_vma_finalize);
