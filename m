Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C7F95CE12
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AAC10E85A;
	Fri, 23 Aug 2024 13:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlyIIkJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010FF10E83F;
 Fri, 23 Aug 2024 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724420236; x=1755956236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s3sBrHHUbiqSIYeLJyNNkRXvRt0q4UhAQK/r+4tqShI=;
 b=dlyIIkJJVZ4qh28DO2BHVkSD1v7Q9MFG2l6kGImy5l0IxoeeqD8Ie83R
 +oy3mTiDL9dexGSGMfSsDPfC0zql4XAW/n/FkHXsxLDvx5UgZ9c1YAl8h
 oWPwEWTFYmYH64u8/FDlrQWhpbw/bXsJAZu6LdT2aC63cTg1KKMlQAhU5
 cspyGXoMijABubOiE0CdEK/Kr20ajh+ulmXPPYFvKBnnC0zQMyXJYoFbL
 1ZaiIsNQU7KhDahxO0+ZR4/6bWyymBWpdiKUWlva1xYFkmncRMQzVPFGh
 b7z32YO9SWM9TIsgGBxTOPYJl8/R6ceP84+++/s4fcbFJcnWSB5oxpWIB w==;
X-CSE-ConnectionGUID: DpyYvxGrScKsWDuL1uxlNA==
X-CSE-MsgGUID: rD9K0sRPR6SMZiUMil3l5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33511841"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="33511841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:37:15 -0700
X-CSE-ConnectionGUID: /ct0gWeLRDWV32ghFtFShw==
X-CSE-MsgGUID: 8gJCx+tIQYa6D0p+cnGtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62100883"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 06:37:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:37:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:37:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 06:37:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 06:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMmA0jPsyFbLBQhDN2A2qOAulsqwCzUjGT7g4DIfZIxpD9nvx9RvxkcD+BtaBpsFD1RWWdoZQ8PLdBYCQ5L2kNsBjtXcwI9z7FhhR6sQExaAR6vx0ctjQbBaSGNupTSWK6puAzwOXQlMlvqPrQyyoBSqyg0xWGdR+9rsu/EF8gcXFErLmig0JZYSGLzT5zjLWGnW/Zs85XCfGQZwrszIw1hu2c7hDcS49s4F948IPfEpDrvDVHzCQp8SFxUbNZegQ6cs8XISx+1edxO5Ayxwd4FjCGTRGhLnPMiFMWXMphD9Ko/H2mvMwqdHYfaI/ns7wsZJT3d4Cry1r0b/pBw04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0xKh6fP+4WIDoTlC/eGffawZWAhX1lO+CN8pYaPEY8=;
 b=V1aHn6hohyMrrFdwrJsNEJAJDpO4DCTr9iGDl5C+pPYkKjuRKJ9vF1yz0D1wNjQCnhMuo2/t6WjKbYOe0B0uSn/oKaNanYFyrUoHetgKECG+OIc8Ji5eGHCLJJsvVNQy9ssi/tVNoonWZHAneZtV+VupdbweWwtjwTAOj4F/ENev/zA7Bzjkb4Q8R9TdkP6+B9k5Y/+MehpnGR8VakGU1/J1ma1YbMkBGqtdxX/JkyZ+Iuf4q31D27uQwxQ8Hb5DQth+ZG5qKi2iBZXWibT0boLS77liWfkhCJVD1aoEKvWhVBpiZuWGn/BfNWl/Q4X6YtGP881luSDdWFoJ6Ui/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 13:37:12 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 13:37:12 +0000
Date: Fri, 23 Aug 2024 09:37:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Remove unnecessary cast
Message-ID: <ZsiQgw34xhkgXSP1@intel.com>
References: <20240814175947.169590-1-andi.shyti@linux.intel.com>
 <Zr5P0XW6sPGwKCrG@intel.com> <Zr8L4BqjFn67UoLl@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zr8L4BqjFn67UoLl@ashyti-mobl2.lan>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 40aa07ce-083c-46e4-ff31-08dcc378b11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kOSVWB8y8B7YpUkvFFoPM+e+v/YYicEeA4MvP6ez0/HeBxZXEnA7NDZXkTUu?=
 =?us-ascii?Q?RgzUflI/Y3YJVjT5nglxI0hNdrCVhALj2BrcTtSyMLGaGXPyGfzbzJSsowuw?=
 =?us-ascii?Q?Luk5938VnEfGeWMAKZuJtjbjd48yc+fX+PYP+cxLsNHqihTHLjf4Ntaa+Jq8?=
 =?us-ascii?Q?koUFADnLgLYYB2GZ90RgbP6ekXq0wteAKsPJghALli+bv6dSi6OkU85lpcJb?=
 =?us-ascii?Q?EgOR8xVhhuOMITkcOa8YQH9DOkr5yCBxhKCAhBFHgcUFPznGQHsN9a9JvRAI?=
 =?us-ascii?Q?GCvtYu3BzjiKoUbpEtB+8NaZG9cZDc7QJZOzMqLSF8XSKq29eq7FKINw4/6U?=
 =?us-ascii?Q?6jHjX/zjuTwMug2WvqlKXpTH/gQtZTehkYI11pOAJK9jfdA1zLliLqK18i2M?=
 =?us-ascii?Q?WyY6/qFrVgw3nX9+dipw9pNe1SJdoKtMOojO9npRGcu5JTG79XFe/mxn+JkR?=
 =?us-ascii?Q?LogGAyLie+4UW0kkb4/D++Dwx16MNmYJKSOGTR3DJfW4M4hAuxcMXoM0JD5n?=
 =?us-ascii?Q?oqSeRefViatkpXIrAcH81VRBORXMUQuPzOrkj1xRYHNHutCIWDS3IFC6CaYT?=
 =?us-ascii?Q?YWy3z4TSUqJmMFqge0czbi+3zB59MBBiqQpL8YRWTwh/OjG4Kkujekq+7v5X?=
 =?us-ascii?Q?/0+/N0Bky0i2XcyYC9Qr/5KXytKespcC3jO+FZ93NrXJCnP17saKTTAySkvr?=
 =?us-ascii?Q?Of9y9jdpF+mDqu+ZU4xsAEI67Pu83YGw5RDnvFSHilO7CEx4kXpdZBfMkbCS?=
 =?us-ascii?Q?nyyDZCu5fLb72FYp0fFQ9jElMAmm9LFxx/WBt5KiQQIgPE51HFPahQ8KoAA8?=
 =?us-ascii?Q?H5uAdBYSAIcSvLpPec4f0ZXcPUNR7GKPkUlM/hBqPmKdCeyQStZK+cYs2YeN?=
 =?us-ascii?Q?smNfsezN3X1dXF9Dd6JfOI0xrqvd1YHhEzfFbFBa/6saxutkwpqgmA4U+gMR?=
 =?us-ascii?Q?5MSkrqs9aKDOn+E4XKtKqTXpn4l3shch2zFbV0jlSrDDhxjh8ltZ6SqDiSkx?=
 =?us-ascii?Q?p/UYrLIZTZjLxQibOiEvZeOYljTDhpcv9u8Yw0Pt9a8tGEMO38IUyhw97XCj?=
 =?us-ascii?Q?uIbfkFmW/O/DCfRJNll+N0j4Bx1bSejySA3g0U3zaiKYzG6nmbc+Lfdm28I9?=
 =?us-ascii?Q?+G4puRGRWpxgMw9P6SyrvuA5DN2InduBgnYsNf33XGYU912wm6qFWA3Keukc?=
 =?us-ascii?Q?VoPeWRlW7hER3TlIIwQRJST4ku56YtCZeDQwogVoB8VDGKS82GTXzzKbQjxv?=
 =?us-ascii?Q?KfWGZcTdd7w6VC2zlQ+Ka549ErC9elKDR5ciSt3m02+VGn5FGAOsxRT7qL2q?=
 =?us-ascii?Q?LKZD06h7gtClOJysITYIjgNmXzy/91X6MmcOV23qMCcg7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xWO5wJ68XN1Gra9gWEYEXtXBuM/U37I2KdfxREdTjvclvk/A8twOfkeOC74/?=
 =?us-ascii?Q?ej5wELiAZ+kOcZFiwT5X/XVchyWw7K12tfzKdJJN4N/yQ9J9MeA6wvGnHhkR?=
 =?us-ascii?Q?5+JKW2BGzRJFubYir2N4h4G0YRv8aPh0Fzbp9Nu7YU/di+khFTRUTzePn8Cp?=
 =?us-ascii?Q?/VQKXP5klbGE2QweNh4/xEKsoizqnvX3nnHGhMHEywOdaZ4NeYu/pXz2Zzob?=
 =?us-ascii?Q?kMfYj0aTtrGbB84fWnvpvDXFvFZLC79q8g82BL/x0bh29z2sZeF6nufPXUwJ?=
 =?us-ascii?Q?H3uOweWtCBAA4rahqafd8/BzBhq4OEQ0I7xwkyKJlHX5ar+96HiqmDIJ9mLq?=
 =?us-ascii?Q?IbrJ9fBGUJxS+yu+REDCzxyqZcHpWGrU/7SQm4rp7HZT+mJ+a9QMKbFgK9Mr?=
 =?us-ascii?Q?KiUN+yROrw4KfEUE1BawuD/EP0BWfjOFdBavfQrlFLSihp+61y5AkHxmoPPl?=
 =?us-ascii?Q?dXcRHrbHgpUEL5e0fjUW/tDo4BjVviU7gR7vt/OHQC1ur1JfEGjJAK/T9Uyw?=
 =?us-ascii?Q?QSfn+etJDZpVXdCCYLVriXZR4bOiOAzuf/fxxWTqNXKeD/LnXp5VGJInHzQq?=
 =?us-ascii?Q?xTduMyXF7QJq9lwfxplBYEKNKBOY5ro8CJ9GdIGMjV7KdE9UduwoVMu0vu/e?=
 =?us-ascii?Q?PBSaplXn8R/3BfBSGQOr8DYM5SSgyM165pSrNIOsh8J42UNjtxv9DTS6Aq0V?=
 =?us-ascii?Q?KlzfbfGcq2HoQHxb/dvEdO2Fi1rb0XfBYNjdc59UI6MdP0cPpdPIhsmS0g2d?=
 =?us-ascii?Q?TcdD9QBbQQfLlg3XW1mTyp8yJ4ABZS9OezmK7H0Xr1T1AxOttOaZYqpO+ktW?=
 =?us-ascii?Q?snvFPQ3eSraDA60Fcw3KR0SU8Mc2I9iEmBNMrI+pbhvRheqQXN5SabGMCrQh?=
 =?us-ascii?Q?frevorNo6WyVsvPqtyTxxgGwc6wNQZyEDsp5lv8f2Ra3TngdS4BNPOB3/7uQ?=
 =?us-ascii?Q?LNAWtVuDLhVEhTI95e8Uadi0Hw7kyNxQUulW8oep9fAVj8lNMwQv0ArWfYXq?=
 =?us-ascii?Q?yJpQIJMyB2NaRt9n/Uvb/NENaOHW6ORg46ov/S3aoIBmqyPEh7Iozc0pweqi?=
 =?us-ascii?Q?wA4La3gYQycSZEUhOybxC9L+KX8B6TvVSfGoa3IYUufksvC2RHS2U+2sDiw0?=
 =?us-ascii?Q?PEnxHwvOyhG31O8J7ifdIPB7KluPsrlY/+eQxix95E5YGfvo+sbbE0SMEfga?=
 =?us-ascii?Q?3TkLytkxbgpvlrPr8tZNrNza6glHV6xbtPuqaZ8gmphLqStonYVd/Aj8GBh+?=
 =?us-ascii?Q?RbujCf/D31yTiOAn5sBj9ZZXavwgtIKas5gZonH3js1Swn2rXQT8Hjbu5cdz?=
 =?us-ascii?Q?RuFpXtC6BRIYeXcQTEDMUCt1a8HV8hZty/PeYxi5yMCOpUV3IquQLDPJeiQ8?=
 =?us-ascii?Q?vAlwJ5CSVPzxqc6BU/bgeZAfA7DY0bIXSNN7Snw0Eiao07/yz8PJff1QAyd1?=
 =?us-ascii?Q?2YDJvmxjFxnCYtVt0bRik7lTJEyNQrYMmdro64p5ImgpP3BLuZZzepZXJJFe?=
 =?us-ascii?Q?GjwI4B/fEbmqdR683eYlocKZ/u8TG1GrchMTSsitU1e9H6VvUw4YhDOHBLwD?=
 =?us-ascii?Q?3eAlB4PXKVon583gDNTL9IRkW+y2m214Q3EJyGsRcSuYC+GS6PT2kRVhd2yp?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40aa07ce-083c-46e4-ff31-08dcc378b11e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 13:37:11.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckmdYoK3a4+4tbr7MuEQ8eKG9i3emHdVbFEj81ta8i6GofdTjFyexqnXOR6lj91KOXYfWQrNlPy1lSE/nMSJVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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

On Fri, Aug 16, 2024 at 10:20:48AM +0200, Andi Shyti wrote:
> Hi Rodrigo,
> 
> On Thu, Aug 15, 2024 at 02:58:25PM -0400, Rodrigo Vivi wrote:
> > On Wed, Aug 14, 2024 at 07:59:47PM +0200, Andi Shyti wrote:
> > > The cast from "long" to "unsigned long" is unnecessary. Remove
> > > it.
> > 
> > I don't believe we can be that bold in this statement.
> > Some static analyzer tools might not agree and tell that
> > if the start or end are negative values we could have
> > undefined behavior.
> 
> Right, but we do check for negative values before. If we reach
> this point I'm sure this is positive and I'm also sure that a
> positive long fits into an unsigned long.
> 
> Maybe I should have been clearer in the commit log.
> 
> > > In this case, the variables "start" and "end" are of type long
> > > because they need to account for the possibility of negative
> > > values. However, they are subsequently moved to "unsigned long"
> > > since addresses are typically handled as unsigned values.
> > 
> > right, but the static analyzer tools won't agree and complain
> > and people will start try to add this back.
> > 
> > Do we really need this patch?
> 
> It's a cleanup, like removing trailing spaces, none of them is
> really needed :-)
> 
> Trivial removals of unnecessary casts are normally done around
> the kernel, but, of course we can drop this patch.

My only concern was to remove and then we start having people
trying to add it back again because some static analyzer tool
complained about the undefined behavior.

But if you are sure that this won't happen let's go with it.
Please just rephrase the commit message.

> 
> Thanks,
> Andi
