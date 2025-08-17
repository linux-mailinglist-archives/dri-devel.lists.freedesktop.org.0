Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6823EB29422
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 18:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB1310E170;
	Sun, 17 Aug 2025 16:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emTld6ao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC7C10E170;
 Sun, 17 Aug 2025 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755447948; x=1786983948;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KS2jih6Xqyi+uldXaUkOv2yUSGv9Ql5Ky+PxjnSa9/4=;
 b=emTld6ao6LMLP4phS3GkuC3ZxCZ4SOzAJh1La7Z7EBp3RKXnWaYWGR4c
 kJF73a70VuvJ9Zw6pCRobVouEQZiAjkKzPIqtx4vde8slOeSZAvE96nkb
 hYxBCtcjMW9p0hrwzjyZWUlcqtssTtJiBYXkmE2GcoFrtrVJrL6zVVc8E
 pfXoAOKPR4FuglhBdv8n9+qE631htwCrgNFXnFfywEDMUjt2M46oFy/iU
 Q46dYb+GJBh9gD8b7HO2mDqfWg3XRPL0boWXmcutTcpXoN4/ErA2fLQce
 ZUUqNLbqGgDLRZJXQboAJvAFf9JIl+vKlihir/XbAX46kVAIClIJIpepF A==;
X-CSE-ConnectionGUID: 7z4w+FSATMOMI3qWckx+BQ==
X-CSE-MsgGUID: MVm8hCloTc+ytNB6cqVxWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57763909"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57763909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:25:47 -0700
X-CSE-ConnectionGUID: Jff/9mmfS3WOsz5nO0EqCg==
X-CSE-MsgGUID: IKxaByK6RFuCNIwrrvJMOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171832163"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:25:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:25:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 09:25:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:25:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Um9G8cu5RX7s9qtL/ZVpXXLGo7y4tPSrk8uXXaidAkmPoGAHoF76MmvJdu9hK1fUMKQ7h6npDah0xZhrjg2IBdrTLh3kEjc8uVU2S1EyglUuinDdWOLbRZqNXD5vAm1wg2S983kY0v0b9bT5gCnrbSXFxEVU/RR7XUmN3HoI28FNph3WjS/Xm1UUzFvVrndPrtXymDVO2czi4c5ONZyiVSxnYVDGdB16LYzK08Ikw4Fbm29EigYNPTxNdxewPzCyzqJ6y/GV8TlSE06TguQINQpu+SJhAmXFwHtWLsIPZGj+Lnwop8VpYnvJhUgsRNSZlGXFZWzGsCodbGEWd/IX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUrNrrqu2cXZyKUFKR2rdhW6Al1gNx1chDwDjHyNvUI=;
 b=n4Y5w8v3bHhSvtK3t0Wc6XC3w3vq0ovrPsPr38Jo0laKO7P/en1TodBbDLH6ehd+FtuM5vUZuJ+eUHBr/wG9pYzSuCpU5LTpI30coqSBCxopvdNmdyFCz7fzgceAeGEyXPj/f+EHLUlgin6JS6/jNLLEOrHR489GB4IdglWqwGc2Dp7rMRC7g+ayk4uM5l+Jz1LTCcN2zpAnRxxkqBcImFOPb5JqIwBy7uKiGVtEjfID1Bm4TzrUbtYpOoOsZp7t4eodUOMc4xmZM8YYDKAd3Q/vumxTFTw8JK3olMzEXTQCjldvd8YcHilkF/y5KafmpS5qaNPoU1PIkaQMPAamUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Sun, 17 Aug
 2025 16:25:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 16:25:40 +0000
Date: Sun, 17 Aug 2025 12:25:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Maxime Ripard <mripard@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v8 02/10] drm: Add a vendor-specific recovery method to
 drm device wedged uevent
Message-ID: <aKICgFd9IfSRGbYq@intel.com>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
 <20250814121448.3380784-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814121448.3380784-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: e46888f2-4a0a-441f-4d34-08ddddaab4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yq78nrh/QDUQwA1Iv6Njm+ggPMn84aPxOSZ/VSlYuoo0QaeagZnxVXykjP?=
 =?iso-8859-1?Q?yS6fVqil3mXuLj+BvBk3hLtm900AfUMSWzigOReFmhJx1vXhuMnu2CFcbR?=
 =?iso-8859-1?Q?NFuexth41j1eIyWsWAoD6YlCmns7NrMw+s3j09RsOVqR1Rc//RDOg1ch5f?=
 =?iso-8859-1?Q?t10hxYvQB9uqCg+mecid7ASm71G9iUla5eDcfVcWGtVR0dZ/PhyF2COoTM?=
 =?iso-8859-1?Q?CkVwVIIAYRjNNahdUnJBcsNQcYLHT0ws4UtKiu4gb/aT31sfufh69t1PGi?=
 =?iso-8859-1?Q?C2f9twmBF8V5ErZOVVcLI24A61F1cP2sxiWQUEHh9wZifqiek431KIrgo3?=
 =?iso-8859-1?Q?UeYBNWbvYJyg9FYZWIJzpnSDjuNs8AQNEupdq96z6fFvgfxdNZKNMPwQyR?=
 =?iso-8859-1?Q?4RW/4PF78IDSRGUGSnhVH5zsxq9qEPH9dkwoL+Bb/W/fpTR73mvDg/RGRp?=
 =?iso-8859-1?Q?VS0R1eUK5KtFmVD+UzxqlAXhe9PE4diR/K9GiH0nBu4fuidYnh+CCRh4J7?=
 =?iso-8859-1?Q?WTiq0dlI3Thu0qOx7XjuLWuOLgzCLGoJW5j0JdUxH9qYelGh8ZdAxxeTn0?=
 =?iso-8859-1?Q?ctwkZTCtGUa8X0Z6VGJ3y3x/3CT9qggyAwg9OY3oss7+pMC5nHfjgThiry?=
 =?iso-8859-1?Q?tqBTHzyWeNEG5ZJXgfo+n0EZtIpJdS5ZZks0z09d+x2eYuauLgYffRMViU?=
 =?iso-8859-1?Q?0rhxsqau5FIEfn+wdheQ8gVa9gsbEbI7Lp1xa8A5yQgeB7q/2hYhr0oC+t?=
 =?iso-8859-1?Q?UU5uGcBLHTzTzWeBJKAAghLOQ6pM44WMU1tzTufhupQIpbBem4SY3em0c2?=
 =?iso-8859-1?Q?gVR8P18GE2uQgOZJcpVdjsYlIoPO2V8lJig04M9FCu67/k3bSYUAfEwZAX?=
 =?iso-8859-1?Q?ctyAXa2iu+4lHgu03n1wLUylWFNjR0vAlwT0GkMuond1vLlPscoHAej0pK?=
 =?iso-8859-1?Q?RIhW4YWsywH8yLjAryb2CTjy4Jhh/bjyTqWezuGdpEfME6nZXoiKJdsgi1?=
 =?iso-8859-1?Q?LUo15ca8Z1r5xa3QfFV5Q81Rb6MPI2FL4MI8KCGZhmfsHUa/gtslwWDq6t?=
 =?iso-8859-1?Q?YpcZz0td3qBtGhyJv0zuYwP4tiZm6x04Z5bICaQOG3V9lWpJpc0b+PAMQW?=
 =?iso-8859-1?Q?aaq6Bibhte78wfk3efP+I6PAvvWSMjA848SIwBzTtIJ4F/6zJCPaEsWJnY?=
 =?iso-8859-1?Q?+Dspz/J06kxU3Nh3PKlrG0sKJdYbr3DsmtLVv98Sy65MR451UO+pgsLXsV?=
 =?iso-8859-1?Q?MRlk55rs4WoT/8WZkzZGBCX6hwOTKS8DorvR5MHM9zOoF5l81AmBOzM/Bz?=
 =?iso-8859-1?Q?WGSv0K5+NcTfm2secgszXAnJcTRmyIFSqZi0+MvLoANpXFeex71198vgyG?=
 =?iso-8859-1?Q?fw7w82yMcH9F45IXbZgkMee6ZcoU9rxyFd8/q8XikekAthxKWg04pAVMZs?=
 =?iso-8859-1?Q?VEPkNoAeN6z4eMETkVZz+VzeM1Bj1MyshV8X+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TKa3uNgMr56/Lf0h2nuOrmy8/PEP0hE1P4Aouv4c0Gqi6z3LCQTwYSbu9C?=
 =?iso-8859-1?Q?ftVgARwEHZ9MJ0PKNWUg4QrMyHyrbk7KG+QG7qKa6zacxfeIYfAoau3vam?=
 =?iso-8859-1?Q?DV7XDrshRjD1QbpoaCuLKrGypUnajopdUcnmnxZCs9OiRrf762QTsiNQ6x?=
 =?iso-8859-1?Q?x7YwkaAuiB1PoMUnXWpAi8awlHglYFtJAhiuoUWg6Z8NtXhFzepZG/aHmb?=
 =?iso-8859-1?Q?34PNPDD5cVCcPPBFH2YSydpRq5ksBytne7eZDEhsdQommSH4Lda6qUbnON?=
 =?iso-8859-1?Q?ZGnlOfMm0GDp3ZrHeLJFDyWqB4xNU7KVr1fGLnbIb+2hZf0ohICKkP6ffq?=
 =?iso-8859-1?Q?evTHRZpeNJDImsqtzz37VvEMFJXu8Hk4sictU3599jUurFZGEZFTwOjV3f?=
 =?iso-8859-1?Q?40ys4FsWuAqe3PKdS6PvPe5alwEy6ekKx3cm9mH2gUKlN3Qw+lnbuOaMR5?=
 =?iso-8859-1?Q?U6ykNV7ydmTn1DjxSW3VzY8taJdHXcHyK45dvKfHDDPlEPthkV4G6fB5a2?=
 =?iso-8859-1?Q?HG4iz1ot/PKzuiHN4NEsyOC7xk/ovVT+nGAZ52y6nmDlunvslSVitRoTwW?=
 =?iso-8859-1?Q?iJ9+bO6n/+aweW5B5AW+kSoNG8fUxd1McJdTCTHbP0FpK4WoFpD4gt4/SD?=
 =?iso-8859-1?Q?1aGP3qo5WInSm/KXbzNeVyWSKP0XDJDrccC2hpvIYz4eYMD3gj1cQmmmYj?=
 =?iso-8859-1?Q?8u4Uoy+aD0xqFgLgn+rfFKTImd4pZzWc/xOlCn62A1psqW6tVXo9I3DEBf?=
 =?iso-8859-1?Q?PtcFyIUip0qeYQBlk7xiD/7Mwdwow1gxUfOVu0n/1RzkGnH5iZvNenfikd?=
 =?iso-8859-1?Q?HOpcTALAIPc4pC1XLonrFCw5aD02ooDMofTxGyhFGvObizJRKCJ0h80Vdt?=
 =?iso-8859-1?Q?jvwRUnPpYO2ZqAdaIzU5OwSxOXFG+EcWVSM3Wlqr5z64KwnBqH0uQbKGoB?=
 =?iso-8859-1?Q?8eOUrCsKZADkHoXE6z42Es6VjG1IjWIzGLS6oDOp0pHAzJE0viFd9CMTga?=
 =?iso-8859-1?Q?1ouamQ/xtoha4utdmifC9W3shZOqclsysbfdNDNOMBqU8zvgru9RZuvGn4?=
 =?iso-8859-1?Q?+GQnXlNqxz/qXIipcbI8hdp9/gebdITVWGv57mMIGdrt01Z1XyEV9Q7MCi?=
 =?iso-8859-1?Q?7guVkQFpqNQCAWoRLBYKwR+X5PiKT8dpPM0hwmW0xanscv4I6tIeVNM4Na?=
 =?iso-8859-1?Q?0ayPgPObZnshwuwOTkTiUmiNzTxNptt66Cw0z8zqx3MU57d0Ub0WOe7Egb?=
 =?iso-8859-1?Q?7dHq2vNMZomP0rEVwQHmGLBdsfwAwtjzxWp9nv+GJz/fTd80hVe4EsWz8R?=
 =?iso-8859-1?Q?MxHiQrtKzqbwQ8aKqoIl8z2L3sb6shBdD7VJSOs2BRbFtHHDr3WZB6NMMM?=
 =?iso-8859-1?Q?w/W0+wGiz/bYRn8h7/G84Q2w64CCIcNz6iudbZ8ROIkVqXphO5Z0n2zgbc?=
 =?iso-8859-1?Q?Jtks04VLlOHcIiKQ1DmIN7+V+Y4XuK9eAmePj/I8LkzSDMDqkAxGbb6rwR?=
 =?iso-8859-1?Q?gaxKoGBjPabx8AdHQB7SA/tixQtb1ZtwXZugeg5FvI5pTMxCBQdoQu0x5x?=
 =?iso-8859-1?Q?X46WRfBZznVwle28rBWrzpw5L6hf1RMuFQvokn6gjUX7T+JKyxISEezYyt?=
 =?iso-8859-1?Q?qu7kqAhauQ1QdkE2BdHm/60QBDWsZ3VP+k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e46888f2-4a0a-441f-4d34-08ddddaab4d9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 16:25:40.6900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSd1ZekmbZO3aaX1mgD1EGSlbpQmRsXBPxzVO3quBV6cVsExrrrLqFV+JQZx/Dz12NBsAGjAKzI7DJuuhJqhTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
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

On Thu, Aug 14, 2025 at 05:44:32PM +0530, Riana Tauro wrote:
> Address the need for a recovery method (firmware flash on Firmware errors)
> introduced in the later patches of Xe KMD.
> Whenever XE KMD detects a firmware error, a firmware flash is required to
> recover the device to normal operation.
> 
> The initial proposal to use 'firmware-flash' as a recovery method was
> not applicable to other drivers and could cause multiple recovery
> methods specific to vendors to be added.
> To address this a more generic 'vendor-specific' method is introduced,
> guiding users to refer to vendor specific documentation and system logs
> for detailed vendor specific recovery procedure.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors.
> Vendors must provide additional recovery documentation if this method
> is used.
> 
> It is the responsibility of the consumer to refer to the correct vendor
> specific documentation and usecase before attempting a recovery.
> 
> For example: If driver is XE KMD, the consumer must refer
> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> 
> v2: fix documentation (Raag)
> v3: add more details to commit message (Sima, Rodrigo, Raag)
>     add an example script to the documentation (Raag)
> v4: use consistent naming (Raag)
> v5: fix commit message
> v6: add more documentation
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>

Cc: Maxime Ripard <mripard@kernel.org>

Folks, is it clear now? can we move ahead and get this through drm-xe-next?

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 47 +++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/drm_drv.c      |  2 ++
>  include/drm/drm_device.h       |  4 +++
>  3 files changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..669a6b9da0b2 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -418,13 +418,12 @@ needed.
>  Recovery
>  --------
>  
> -Current implementation defines three recovery methods, out of which, drivers
> +Current implementation defines four recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> -more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +more side-effects. See the section `Vendor Specific Recovery`_
> +for ``WEDGED=vendor-specific``. If driver is unsure about recovery or
> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +434,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>      unknown         consumer policy
>      =============== ========================================
>  
> @@ -446,6 +446,35 @@ telemetry information (devcoredump, syslog). This is useful because the first
>  hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
> +
> +Vendor Specific Recovery
> +------------------------
> +
> +When ``WEDGED=vendor-specific`` is sent, it indicates that the device requires
> +a recovery procedure specific to the hardware vendor and is not one of the
> +standardized approaches.
> +
> +``WEDGED=vendor-specific`` may be used to indicate different cases within a
> +single vendor driver, each requiring a distinct recovery procedure.
> +In such scenarios, the vendor driver must provide comprehensive documentation
> +that describes each case, includes additional hints to identify specific case and
> +outlines the corresponding recovery procedures. The documentation includes:
> +
> +Case - A list of all cases that sends the ``WEDGED=vendor-specific`` recovery method.
> +
> +Hints - Additional Information to assist the userspace consumer in identifying and
> +differentiating between different cases. This can be exposed through sysfs, debugfs,
> +traces, dmesg etc.
> +
> +Recovery Procedure - Clear instructions and guidance for recovering each case.
> +This may include userspace scripts, tools needed for the recovery procedure.
> +
> +It is the responsibility of the admin/userspace consumer to identify the case and
> +verify additional identification hints before attempting a recovery procedure.
> +
> +Example: If the device uses the Xe driver, then userspace consumer should refer to
> +:ref:`Xe Device Wedging <xe-device-wedging>` for the detailed documentation.
> +
>  Task information
>  ----------------
>  
> @@ -472,8 +501,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>  be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>  device of all user context beforehand and set the stage for a clean recovery.
>  
> -Example
> --------
> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> +consumer to check the driver documentation and the usecase before attempting
> +a recovery.
> +
> +Example - rebind
> +----------------
>  
>  Udev rule::
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..0ac723a46a91 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..59fd3f4d5995 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>   * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
>   */
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> -- 
> 2.47.1
> 
