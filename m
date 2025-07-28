Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03028B138EC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1BF10E4CD;
	Mon, 28 Jul 2025 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZcqJah7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1871C10E4C2;
 Mon, 28 Jul 2025 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753698347; x=1785234347;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=hJxIIenmwPUj71AqPHLongJpQMzWPRVd+oC52804WMc=;
 b=FZcqJah7mK220lAzBpBE+M+xiO3bFBlzUuyF3t3w16/NTBntFKozJD/Z
 o2B4jLk2nvP0A7NcBFSMF9TQplJVF7zokWB3fB93UIJryfitkOBNGb+As
 kYez2wQKmv2vBJjKzop6GZeYooqjduRCo7tk3yilFXxPgsVq6k7Lodck6
 nK0/6vtjQV7jbRWEtKyX9Xau4AQ5JwSRS2Rkipdbn0e+ZrqDx+q1FJBsU
 IU+3mugIK4HKsxZMuuYT/f2bN70eWxYiINSy1+ufYRjxRD6lJx7kHgXrH
 9cyZwjkRNEAFSpPMLucUm8G4spMVZDS1trdeY/KMGS6PbZbC6h3qOHV3x w==;
X-CSE-ConnectionGUID: TSEoMCKLQHmVQHVkpP2xPg==
X-CSE-MsgGUID: iKBUP++PS+uY0VjTgcrV0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56019136"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56019136"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:23:14 -0700
X-CSE-ConnectionGUID: BUgWqAUhQgmdXkOA5t1WhQ==
X-CSE-MsgGUID: Cz7xUG44RcSNBdsFHQGTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162249445"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:23:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:23:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 03:23:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQCWwIL/wQrr5yxmwJTXg+14myD0R1mwkQDhgKrHHsEhnBbkKU53LZq845UX0IU+3BZ0AlurYxsLFjDjt7VQvktBGKpvkqLOdZm2zpYRktaMH0e1VyWHK4CfJtWezPp8bTtmdXdt2/Gy6qcTBbEl4wb5sBlennrIfrvVER3l3SfMkYfhenIzj0KM2HTnYlt8o1AFPTVRqONJzz20Jo2YOStbAx2afnofRv/edCjuP/UaIQRgvgWzWeYxou+PNTQdpsmlcvV/KeZBUA3AH4FfnP9xZvB+ebSaPegYSKsyvOHHPvkffF7nkw9Uiar3ZqfKp6mDV0tXK9hN5LbLRdm/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0LRv+Efqc1a1X8F+Pfb3Fg21T0HLWWPOEbmz9Geky4=;
 b=KLH53067Lck86wj772PjGShv6WuE0gJkTslllYx5dB8NvILUlmwyzQaPyIDlET8fFRRr6jm/9nhmdoq1BqHfVLj7iYaWUKYXHPAv62JNO5xo4VmAU8lOuLOE4jB8pzvDG9PYJzRkdLmCgwjFd6PJr6Z0PH2qfvuNAiq56KK1p2tYVZ1fLSkMrEYDW5b+UeypZU8kNOnBmyn0LCuzWYRFet3Gb/8HfYir1jbOIHwhgtfEQ7I2M4LgZk3rGPHp0Ajxt9k75CuVJTQ+lxEmowNmKxzuXjIaXdnVi1cYy5QHQUOWbjrChfKEMEenGZ4rjDcnUdz2x/JBnHyHeMS0BbsDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:22:24 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%7]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 10:22:24 +0000
Date: Mon, 28 Jul 2025 13:22:19 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Message-ID: <aIdPW1a5OgTlHweN@ideak-desk>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
 <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
 <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk>
 <aIOTaOA6bUelUtBm@ideak-desk>
 <aIPES8pWAdCVB07L@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIPES8pWAdCVB07L@finisterre.sirena.org.uk>
X-ClientProxiedBy: DUZPR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::14) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: dd16359c-3b33-4b97-574d-08ddcdc0a513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nUhr33I2HYWZUkctADVVEBQgBxmEExTi67bT1L8w7fnZf9DYkJy2Oqc6GEXM?=
 =?us-ascii?Q?uLmajCn5TLrkhvpvi0tvUXHK1dYNalewwgEAqvHGVsTwWK2XSKNM/gLbpkyt?=
 =?us-ascii?Q?7SxHAznxExzr61p7FEds370dJNyNxnw8CYF6XzV/JUviMof2Mxyt05to/byY?=
 =?us-ascii?Q?HCr6or3q+MJ/9aHk+0pJZQaslQm7I/RTVrCxNq7AWTsHnKNoPobo5OH7EfBb?=
 =?us-ascii?Q?BG51dP/BtNhmX4F859THXqPGMpidM+y0OtaAK1EQ5wXS9/XaCeHMkTOCiXcC?=
 =?us-ascii?Q?GchnbnHq9kvh5dqGeWmlHXWJ4AjviN5k0gHXlXLtulpJPxC15fskpRfe0fwN?=
 =?us-ascii?Q?keOoSYQXOFxjKP/upPN2pKka+QXaLyYdamXwIu+cZWq0ZcdbEfn0uatt0Nwj?=
 =?us-ascii?Q?vzw+CCxXCUl0GQFLzVrfdFIAeY13DsHJ4jM2M/4pbS3M3qsExEjZ/6/toeJu?=
 =?us-ascii?Q?8z9M9gRX1G3FqNLb0pQMS4Hp9JV5LmtAI6lXejhvFdNRg0Gwi3AVAoqnLtip?=
 =?us-ascii?Q?XktsMb7WK4A7R7FPFxlFWek8DCMZ23sG+4XNKorvKu4kRHQ+ZB8HtOzqH3uX?=
 =?us-ascii?Q?j/0pxzzbCEnzPepOMag19fKIQyX+Shx7jHry/Bxn08yIaajlgC2sxPvBi7Vw?=
 =?us-ascii?Q?FVodp6O9OR1UXZiC2frWGeDyHAqRzCO8bNTs3wHpLDzRa0jgVtUFkXVqQCSv?=
 =?us-ascii?Q?I8ixYQ71C+zjYpUd/h5Y1lHnrEbi3tsPDj9t7ws2hZsoUz/GEKfcl9JYpxVy?=
 =?us-ascii?Q?XirokSu8WyRXUPTHeI9gmC6HnMIkrdHRhY05khNl/RNDxmsJ0ebDgilU+TaJ?=
 =?us-ascii?Q?w+KAg/0CbGcu8WBb3gjYk3liBP8I2LfvukzRT6Pt5TOhavbRrIorxNufgZAn?=
 =?us-ascii?Q?FnUFC3DT5XrTnMwcrlA0oJfHv26bqXCEwm1MAgtTxn5sHY+qbc8qdsFR/zDG?=
 =?us-ascii?Q?G/8D5xRuXR3VSf5PSxcLqou4cHT1ocRWfQNfouJ2sZIeGi4ZH/SCNuB5IC9v?=
 =?us-ascii?Q?lZ93nWRU6tKEzslouOXdsjVk0h20qmgIUuO173QZc8MtXhvuIpt1M/tAMay8?=
 =?us-ascii?Q?y4akNo8afi6xCBmrhIGNZvH4tqxQLs71AdcNS6uwKkjcMre0v+soJGc1l0Rk?=
 =?us-ascii?Q?m4+atr577YQSd3MCgTBVodHVZ8NDUC5IZV9I4LgQ68LJREo4Sf2ZoJdwBPEv?=
 =?us-ascii?Q?VULO325w1HIzJq2kuEV10/YRejv4OhhXOSoKpJcbMsrN+0SC3jxZYRl2drsu?=
 =?us-ascii?Q?WoJOOPuN7rG23LCVDIC8BgyQxpTE6ojl7V1IbScKxNj0XWtuJvT99+0maKfs?=
 =?us-ascii?Q?iIxJ2bd4LKdMNUfoUFMPqiuMftVf1igT6NGAR2eemtrZIr4XlhnemyPZMokj?=
 =?us-ascii?Q?5+Phft3N4h4H7XIO7z4O5CUGBE35rOP7OMJ7dVbCnrUKNcOUtuwzmDvrjSdo?=
 =?us-ascii?Q?7Hkln0RN+aw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rMKVWhyNsZKGiaYu4IBz+GbfbZCGpZAfq1vLnkwJ78UVyx7U++BmyuRipKsC?=
 =?us-ascii?Q?BDql2Exo+hV2p5YMNqXBjJLEq5JxR2gTIV8yUh4rIH9DHR/CqYcHa6Q+3dvy?=
 =?us-ascii?Q?Nq5mu26009aewbjsRyUKwi3+ZzIPijVTd8Z5HYAxfl2oWjKIFLmQuS29/rgY?=
 =?us-ascii?Q?ZyuWtb2j+kN4V8kkWiG8Q8V6GtAul5lpfXhCg1d967gGSyKBgYlV5ifVfmTd?=
 =?us-ascii?Q?V3jfD3qp1SVnStip5wtpAruOPpOWPabKhA7fhNEnEDAFTGgrakBMqSXaWUfT?=
 =?us-ascii?Q?rEomzAYfOhK5/cFJFWWuMwppx24ZNWY4uiwWNrK1fgO4jdwPqEt/LAviN7DZ?=
 =?us-ascii?Q?2EDYyBkLgLFz0h4EYeA73nXEVTRM6FtGKSEu+M7CZuxqLVGhkwCglktsy+eb?=
 =?us-ascii?Q?vvdtmLb/12wUY+9WVaIcQS6hkS/C8LalWG/iMkAyvzIiCOzCjYq3jco3/hxd?=
 =?us-ascii?Q?0BzpX0yhdVf1Ni2GvL5193RJlbiFBLu95ifJPQdoKUIi0/gR4CHDjcO8Uxsq?=
 =?us-ascii?Q?A3VjFsKCZpdmQMOyfmCmGju84gyQdmOXXikiOnJRM9+4CDzE2c6azLuI3pa1?=
 =?us-ascii?Q?DtHTcO8/ruabDvRi/4HH4sNdPqy1dE6fgTVWxtmg0tGo10SfVpzkmlUGH2V1?=
 =?us-ascii?Q?5/SyqF5Gs7ANUybrN9E8X+VSmVt1VSdn4zAvf0lbrZ5i4r95UpL62cl1V7rr?=
 =?us-ascii?Q?Ug3mGNC0c33AJeSABSoaP1tMOhU+fjzMXYwriS62AqvkB+MrgbAaLBG4ZEcp?=
 =?us-ascii?Q?MfkrLaWy1Kr7A5NjNJp9Sf9SZxUnB/flQhoODIiHGJkkVmek5ON0zdPSl3IO?=
 =?us-ascii?Q?PN3ktq29Bh9oYEdXoucfKNyUl2o/4+yIV1mSz+q52YgNrPaGxXD2TW4nHwxT?=
 =?us-ascii?Q?MpPy+/3+TJyK1DVPM4GmUNndIeURwQxASWHiS8H6gn5M9YT2gqYG3OwICrFp?=
 =?us-ascii?Q?3XT1qG35VLmhF3gHBBsu/LKdP7Max8T0ZA1G3AnMg49ViG8/bSg1+FqOOQea?=
 =?us-ascii?Q?YZA2On6ceBztAW5c5GTE66ddCU4H4USzNQxtjunvJRY69Ug+dag3fbkSJEE4?=
 =?us-ascii?Q?cXofWh0mIQk7QgNOfBkM78UP3bmZxKGIR6XlPWz0pqGvXv+s9EpTvdS9mVU8?=
 =?us-ascii?Q?6N9zJ3GyIi8SUntmD2zZVU7YTHdtGqAUhgH+e5fgmMwiyU/0L2g47Dptqdv4?=
 =?us-ascii?Q?cLu4ICBbRG18uDazl18X5p9vF+7YtvSlu9lAV0COd/bHIO1FmBB6j90yVyVc?=
 =?us-ascii?Q?abQWsX1Qyq2/Z2JpSY1aiKHFKjIPQjXmGModiewwsy+49pDnypS/hGnIjqgv?=
 =?us-ascii?Q?E+kValRoUOvGhE3e3rja/hkMv+DWXojJ3DWJ3Fl+D3QNkS5xB2TebFPj3i/B?=
 =?us-ascii?Q?FSIfyUBhW5atg5VsaliHqBkHknrJ36eLQAQpOkn+pRC5K5oLY+tExJGDBxQf?=
 =?us-ascii?Q?nspsIGOzkHXW769FzZhHL2z/+JL33H5v2zzvTQFIv4Ns1PXvSAmk8McGzMVI?=
 =?us-ascii?Q?isUJ8qUzuYuY0a8ZwK5YoBlwdJc8IonZVzRD/25Og3tNWDYocuOoO/iYpkOj?=
 =?us-ascii?Q?RlNOdTzj+SQ6KNMWxfq0FFJBCAXF0iYC/xDqz5CK8hhDwA1xKLP4sd8OFKVT?=
 =?us-ascii?Q?PYua8ltAnGDJiq4616jSj3ZKU5z4gm8VKV6tSFu6Me+i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd16359c-3b33-4b97-574d-08ddcdc0a513
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:22:24.5003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf7g4b6MDGbRE1tj0w8Rxip/ltj/FGvhLbFmvFT7a3xZ0Qa4+z1U3EfwSOijUN9gOC6Bc2fO8Dcx+GBnTWgPkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
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

On Fri, Jul 25, 2025 at 06:52:11PM +0100, Mark Brown wrote:
> On Fri, Jul 25, 2025 at 05:23:36PM +0300, Imre Deak wrote:
> > On Fri, Jul 25, 2025 at 02:36:31PM +0100, Mark Brown wrote:
> 
> > > This regression is still present in today's -next, I've not seen any
> > > response to my report?
> 
> > Looks like the following would fix it, could you give it a go?:
> 
> Yes, that seems to do the trick thanks!
> 
> Tested-by: Mark Brown <broonie@kernel.org>

Ok, thanks for testing it. I realized that it's better to fix this
aligning with the conversion for the rest of the drivers in the original
[1] patchset, could you still give a try if the corresponding patch [2]
also fixes the issue for you?

Thanks,
Imre

[1] https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
[2] https://lore.kernel.org/all/20250728101603.243788-2-imre.deak@intel.com
