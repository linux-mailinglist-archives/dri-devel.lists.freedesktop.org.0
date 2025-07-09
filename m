Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFAAFE7DE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C229A10E79C;
	Wed,  9 Jul 2025 11:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGm8EsSN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4519688284;
 Wed,  9 Jul 2025 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752060808; x=1783596808;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2lbTclG4ir5xBxjDjZB9rDdmZhjP/Slpf9XHqXpxZrk=;
 b=IGm8EsSND7W4ZowlDx8GvLPqzucH+SuKrlDAA22x1drP779+GRrRj50q
 LzGig/X4eqIzwq8n3hlBEYygO10J6JOu11guLYxRsJhEaUOpIk8iLoRev
 y/y5HldT+6ufiYplrNYJ4LqfICE3iQX3VVwireNZDfNTy3AapLEuNSWyb
 N6Br4MwH4FVJsFE5i/pDfIUYIDmorIGGxi4AklpJ7mLK7/5Hmqn8JdegN
 9wtm5a6dYSUcd78Y1SIhj94oc8K2kxxLA8LlDgB9MS2ojb4LMCctevVQb
 TJLtqViTFjpKprbSppPVy0+c4cImrCL9FH6TfzAFBMlnl4s/vFhS73QGi Q==;
X-CSE-ConnectionGUID: Mt9D6A+GQpiZTHvi9KB8Dg==
X-CSE-MsgGUID: LE9RqoiGRFeUu93WGxQRNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71764666"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="71764666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 04:33:27 -0700
X-CSE-ConnectionGUID: G3AwMN0KQuOPcEnGOoKXjw==
X-CSE-MsgGUID: L7WoU74YR++9MBxMY/wJFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156489059"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 04:33:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 04:33:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 04:33:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 04:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkXTYfke2g9ynCtyCuC5LQhSz2ULKKlfhjGz20ctMKjVBkJRWacDQ8c58fvWyb9AWhEu/TMaNiGXW3vvFIKNaY9uYfOJ5libc8b2g1/91VI5WW0YAcMHOqxWbViiZ9t2tsZ6TcNgkLP6d7WbS0v1OhcxGHGvAruPN+hDuocIUk2+5pbR8HtfUEoHfm2oftMo2uPQvqwaGsYuHjcUzrS6gTswmiUCumALQxQa9nDrOPZhgQY59MEp60oRnTK5BHboK6Ke3bMoyhxkybIIXdTySui7xCmEACDkq2Y8NFCNeaE5rLA1bKx1T7QTaCANPUi/WMXRaNtuk9bTVWoPXTBooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H98ZXXzhWTgsTHTTFHpXxV8v3WFT471DkdJMBFDDkZQ=;
 b=B7WlA7MDlRm4YaK5Zaumn5Suw1RbNjbHVDne9FnQAgp1tdnSzMrpzGXJeoGlG9TCKivlANbq2lY5NqC3lgzx+RVJ2iG/Cv86vvVXpwFKrEsWP1sq79pxDV0widb2M+NWcSi+DVzbyG47O1iutSGL0YYb4ALbXGPrSRzXtqRAWHw8NXMy/7R4q8Os7YcG3NOlhDnXNxbyqGKNU72Kkh5gLq7lfFXyjSJiNQuMdNR3WAuhfww0kbcvDOxG/JPRfx+339Ut+bB0/IDLeHH0doC10BLqtmoKagOPkpkE83wn2ZYgzZOXS0befsgfgezz0phYBX32C3yejhR/DoAF6RlG1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 11:32:41 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 11:32:41 +0000
Date: Wed, 9 Jul 2025 14:32:35 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from
 LANE0_1_STATUS to TRAINING_PATTERN_SET
Message-ID: <aG5TU7NiBWZ9-pil@ideak-desk>
References: <20250708212331.112898-1-imre.deak@intel.com>
 <CH0PR11MB544452BD227559C5C0C21E82E54EA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB544452BD227559C5C0C21E82E54EA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: DU7P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::21) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 592d0ffb-6780-4ccc-cc65-08ddbedc5073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SNIQIYHiyNtjxxyHJERhZlyiYFskY32oI6nR772UkgPmWg79WQuLHEoKXB?=
 =?iso-8859-1?Q?bug5hMlD6xvGL/vmb45yKtD7B65/MMGZVqtnDlpLuGg1GEJzD2EWNZ49bf?=
 =?iso-8859-1?Q?Fm6/JWkLztXluJ/ogaw3QuHBuqL65oXOk3HKv1zv3LxIPBi6o+1HZY05BZ?=
 =?iso-8859-1?Q?2kjUF92IOX6EUPztUtLBX91SDUhCrMP0KlkFV9CDs48CwNkNR9N9g5o9tQ?=
 =?iso-8859-1?Q?vKAmSUP37V9MOJGItCgHUCrBwZL+gScTGg0gDjaq9+b7y/Q6sgz+WriaYn?=
 =?iso-8859-1?Q?fXNUsYCx5cfQtmeMv8AgM7Kjp40CC3lMXvRplbpnDGZkKDLlDfiT7iEGxl?=
 =?iso-8859-1?Q?T5mGGbG2ELQF+6lGrPfCK/aLVksPzJHoPUtRc/bHhp4aLoKEjOvt8sovcV?=
 =?iso-8859-1?Q?nt3+ZCTUmsaNgYI25n9SC1rCJ3Sz3mgpo/RIZDBry04NUcZhMt6RpM/Vhb?=
 =?iso-8859-1?Q?eZ1yFeQNAXltDcXXYTpf8kBDboq0MHiN6iFv71I6gYT4DSDzF+QEowzKHP?=
 =?iso-8859-1?Q?P5T//eB2r9K6iK1AM96kK0hFq1rCVJzdTWjSZg/MMVh0MsfQm4DbX0SXE4?=
 =?iso-8859-1?Q?Va+8VB4O0R21k51WwTnRCMMl8G3IOSMG98X9yslobeARAOxhXGmeoL9wAr?=
 =?iso-8859-1?Q?VZCS/0EnnHG59fFULTrREZG7OLktBVR3t8/Mb4WIrmdFXaFc5o0lH6ya3k?=
 =?iso-8859-1?Q?oP2AbXo1dLiXXIhp0OKykwN63sD8RpK7m9FABTOwbUPsvSZb9Y8gFMecw7?=
 =?iso-8859-1?Q?/XPhUiSt56JbYjX4SoZT7Rr02soQIZ9R+nrVwEbnVbpLLea2Z81VPu2TXm?=
 =?iso-8859-1?Q?EOBaMv0B9loEmglkN4xzDqjkXoX7KytVmolYqInlE+zc8K3jU9jiZn420r?=
 =?iso-8859-1?Q?JT6jWS73QY1jkzEhkUQCLpwGurR+XT+4mplakguddP4ukRupZS4xYJYYwD?=
 =?iso-8859-1?Q?ysSn6F0Qcvyd6RBm8vsnq/+rVoaAUgYyRlF/VdoZ45CfT8T5LF2pAer2ow?=
 =?iso-8859-1?Q?Wq/UnsRU2O8vFfpkD4HEbluqzuEziVGMd1KNM5CdObBRxL5Wo+VKRKFMug?=
 =?iso-8859-1?Q?ItBII3mhObeUIu6FMs0k95yLi+EZjPWA5nqTjy/SVtC7FImuJYXi2rX75h?=
 =?iso-8859-1?Q?y0l01PbwuDuK18h0kY3YVPLd02hVyqAhqGbapYEqLXqqCOl7rXPaRwnshp?=
 =?iso-8859-1?Q?GDHfIi4rM/JoNO6vE1TIy1xTPSQ0JFtJSaFPzBvLYTJUFYLM1O403CnQB0?=
 =?iso-8859-1?Q?N20blNbrccDe0PNd+4hKi3SQbohDzRN6Xc/eKiLVZJfY5IozHKcX/0Uycx?=
 =?iso-8859-1?Q?TU4A3MwmT2IY73mTmkusyAbsrX3/8tUMlCQpW8Uo2OGhp3cFoUb8m78gnQ?=
 =?iso-8859-1?Q?kDjO2rHKW8krmv+VNfeMPsRR3EVDUphFsXampuVHm9CU/a/SOIGVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rouVv/cyJCfjhm7nfzpLWmmamYVDlWIWRBlY/HdutK2ceNxxuJ/nCXGDAa?=
 =?iso-8859-1?Q?rahmaV/3yEcdWYrNIIYaSQhWrUOMP68VSEO4iAsPAB2ACr6t49HQVvfO6F?=
 =?iso-8859-1?Q?1nuz4FY3av0p0NsYEN6LcKPNp3ijMKSI32FymbogSN9nyiADVHjD+tF7Hb?=
 =?iso-8859-1?Q?pAppcAG9rgqy34doeDDfPAEHJ7XdVo4P3YDe7ZhNlTprXsbINWsBOSY+tv?=
 =?iso-8859-1?Q?czHgJz3C3CEpp8onmRCGviow6NuAAREKQl6n97gbdRPuI9P4rFu80OA0CJ?=
 =?iso-8859-1?Q?E1Y9V3H+qjPC8cJIQdo0wFQ63w7f/xzxBMF3Me/FdBRhqgXxY5TCF/dZeX?=
 =?iso-8859-1?Q?XWc9o61iRKyqjM4xmkt3FpzlLr77lk/vtruryL7sj3LdJ9e7mPv1JblG4Q?=
 =?iso-8859-1?Q?ORlsDQxfUDiRfEDqY2jsKXlvcpNp+Tk5wsp4iBxeZXtxS2ojkQX9GQOcm+?=
 =?iso-8859-1?Q?VVnsPj3htGn9avrdzuJDRalMHutvN6/GH0wglccUVn/lMer9hcI6YuVw/U?=
 =?iso-8859-1?Q?DU83Vkxmo+EK4mI7n1IWtr7LdOaSTtN6kUWODnpWp5ATc0XyDCxBTi0FO/?=
 =?iso-8859-1?Q?UCiTEThajY1Ue83mJDNE1I1GCINsSaPAMzC9KUHLGduRDZmYPW+DM6dhKI?=
 =?iso-8859-1?Q?bwmyTYshYz7fBY4ABdgt2Lb0Xa6eO/G1T8g8vlnUciW3K5IUusNVbnGcHB?=
 =?iso-8859-1?Q?QgeHueR5mvDcjOxcN0arwe1zfKUbHZSOA95ILOK91b6U+i6JB5gip4vuug?=
 =?iso-8859-1?Q?POemCSAJcAm5RQ+6VIA723rwZc2q+iAD78qXL3Wl802QyFkQ9hFqlc/hyB?=
 =?iso-8859-1?Q?udHFCFXlYzyfNpmPD1WXpzmwIEj9qxjCYu6bK57M+xP9Cdx3cdHQfS+g+E?=
 =?iso-8859-1?Q?QxyMwioPi/eo5CHHZ3SXc8DhpS0d4wTpZa30SjbkmpA2ru+cZjr8xQADjY?=
 =?iso-8859-1?Q?smjPCmchkQ25//1CUCOVGqAP+bNKP5ouutGdzrIB4AOFOdKq368dwvGte+?=
 =?iso-8859-1?Q?oPos8P0BJ8CP3e2HJGuslImxWKcYSeQjxlVZ9ST1uiOvrW0ZXL0FMALNUy?=
 =?iso-8859-1?Q?FYN2BM2mCe/a9xRmJZqiqxWjUfx7Zru9aH1gEWAGJ34eb/C9RBFqY6dMTO?=
 =?iso-8859-1?Q?VB+y6OmUYA0Fofoplg1jq0n32J5z2PvA8dAWoRzm3zV8eHm1exrRhkRMYM?=
 =?iso-8859-1?Q?++2n8BWiHxVulTKPoT8a346HW2mRnvTy3bfWvnvjSyzHoLmUddRBOZuQB8?=
 =?iso-8859-1?Q?5EUzsO31V0HPUtZiEoZQ0Fv1KHp3VcNy9EpIGeHI/lhCX3xsWOIWTsCPDD?=
 =?iso-8859-1?Q?JYZFZ/NHAf/oZhlSeWV/LThJBIRPQYauxv+Rx678/6co3duRoySwrPJ7hg?=
 =?iso-8859-1?Q?2pKLiHZqQ8vejPyhmUS5mVO/iIN1KOg6AcTF3oBfIOJY9Aof31JDGk+ZJG?=
 =?iso-8859-1?Q?OulovzsDoH+snbXHLnGZab2/jym9wBLubNGSC+Wivl1BbwjPy01Uk+k5h2?=
 =?iso-8859-1?Q?NFT9XSjzUFcBaJQU4YEBX7EVi+XJfxkFnf4+AZVNp7v/gsUK9fBOh1+dsW?=
 =?iso-8859-1?Q?vP2glpffL5yhNLyROekdjPq8V0/OZJLWxubAPVy6DblKOAPxV92sKJhk5U?=
 =?iso-8859-1?Q?RD11FjxpnIgVEOWZjXSiE+NA2h2Wbm3867?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592d0ffb-6780-4ccc-cc65-08ddbedc5073
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:32:41.0328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWmmujnBqcL6O4bjIeiIQLg9Vkt9A6CbO0maoL7+OIuvIVooRNBGZXzV9zyv8m41pNTi5PthNcTT++6NqKcGKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 09, 2025 at 12:55:16AM +0300, Jonathan Cavitt wrote:
> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Imre Deak
> Sent: Tuesday, July 8, 2025 2:24 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>; Jani Nikula <jani.nikula@linux.intel.com>; Paul Menzel <pmenzel@molgen.mpg.de>
> Subject: [PATCH] drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET
> > 
> > Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> > DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> > DPCD probing, since this results in link training failures at least when
> > using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> > DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> > link training). Since accessing DPCD_REV during link training is
> > prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> > as it falls within the Standard's valid register address range
> > (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> > training on the above TBT hub.
> > 
> > However, reading the LANE0_1_STATUS register also has a side-effect at
> > least on a Novatek eDP panel, as reported on the Closes: link below,
> > resulting in screen flickering on that panel. One clear side-effect when
> > doing the 1-byte probe reads from LANE0_1_STATUS during link training
> > before reading out the full 6 byte link status starting at the same
> > address is that the panel will report the link training as completed
> > with voltage swing 0. This is different from the normal, flicker-free
> > scenario when no DPCD probing is done, the panel reporting the link
> > training complete with voltage swing 2.
> > 
> > Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> > the above side-effect, the panel will link train with voltage swing 2 as
> > expected and it will stay flicker-free. This register is also in the
> > above valid register range and is unlikely to have a side-effect as that
> > of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> > CR/EQ sequences and so it may cause a state change in the sink - even if
> > inadvertently as I suspect in the case of the above Novatek panel. As
> > opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> > training sequence (it must be only written once at the beginning of the
> > CR/EQ sequences), so it's unlikely to cause any state change in the
> > sink.
> > 
> > As a side-note, this Novatek panel also lacks support for TPS3, while
> > claiming support for HBR2, which violates the DP Standard (the Standard
> > mandating TPS3 for HBR2).
> > 
> > Besides the Novatek panel (PSR 1), which this change fixes, I also
> > verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> > panel as well as on the Intel Barlow Ridge TBT hub.
> > 
> > Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> > i915 and xe drivers keep DPCD probing enabled only for the panel known
> > to require this (HP ZR24w), hence those drivers in drm-tip are not
> > affected by the above problem.
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> > Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> 
> Some uses of the first person in the commit message could maybe
> be revised to speak more generally,

Since here the panel's firmware is involved, only the debugging details
provide some insight into the possible root causes and choices made for
the solution, not sure how else that process could have been described.

> but I'm not going to make that a requirement.
>
> As is, this patch is:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thanks for the review!

> -Jonathan Cavitt
> 
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 1c3920297906b..1ecc3df7e3167 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >  	int ret;
> >  
> >  	if (dpcd_access_needs_probe(aux)) {
> > -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> > +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
> >  		if (ret < 0)
> >  			return ret;
> >  	}
> > -- 
> > 2.44.2
> > 
> > 
