Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141258A0342
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 00:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DD510EA92;
	Wed, 10 Apr 2024 22:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkRgkayo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF8A10EA92;
 Wed, 10 Apr 2024 22:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712787935; x=1744323935;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hccd5WTMwBuErm1aOHsZIEbqH5C2ImD8aZgKm6M/MSY=;
 b=LkRgkayoEHs0aBp+UBhFkxKYerbC4R5+2K0EMT0Io8X3dzQ6sGiifdYZ
 H2H0z1GqYd6AxsJLMS5nhUv59a7bdlVtS+CQGqE7GkB3/rudhgIbKDGl4
 712iGLIjIBmwqk0og1ZEbeq3LDpd3FmJZuS1yAQXdJ5gTj0FVJhUuUTmK
 qCfYC4UBnuM+M7+Z/xoyxTywGUWAqYJJkig/bX4yYIle3iB0Sbaec39xe
 HLcqxN7eXMnco+aUIo0IVkK1DdHhkKvt/WC39+RzXOqn/yrvDVRsFDYM8
 xs9uHM2dQl8x/wf0FzwuStPqTEEGLvuY0hRXgM8zCQmeZTx28vXoBMlC6 g==;
X-CSE-ConnectionGUID: WsAIBIAqTZ6omqMvG0tltg==
X-CSE-MsgGUID: vgYGVQuITXWsUM9s3+vHvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25632820"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="25632820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 15:25:32 -0700
X-CSE-ConnectionGUID: M2X0ErFfRjW2+U4kk3nD0w==
X-CSE-MsgGUID: HZN1GMiDT0acWuIMN8x9Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="25176580"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 15:25:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 15:25:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 15:25:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 15:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzSAYBFNWZ6Gk2YRjveiffVbyztwop8snw1P5UNfoMyo7ZP2mQhmelUKSlrHn4hAlowG/YtCV0mExMuCSpv7TtVZQLiXstkJaHkz4Eh1RMv2Zpx3k5MuXEk9n4u/pesff+dqN7Z3KfPiS4jZIquNen/qxzs9HT/HUr6ImKzfM74fktUjaXVrrZeO+y7/9J4YT4ODHrNuTOGcQwqWV/lQa1JA8l3W/5e+JuSfJsh/pK/pu8t6M3eNCz2wQo68M7IbPXos63e4GsTYBFBTIYYEB+aKC9HQkdznANhUjfj+zEaAoryx8ON8RfcsJANB3KKiDrPU4SFaie4NOU6nTh1ecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hccd5WTMwBuErm1aOHsZIEbqH5C2ImD8aZgKm6M/MSY=;
 b=k+wOWKbIEeHSGRSKq6neOwTbGoeCcgtqnuoNnZxQvgq5k7Lfq7/N0YlqZI6AIZqXQWiDw7Rhk8ApY2qf41mSQvjVGwjlwEhX8QZfg0EL8dD7L2CJYI5HGTO3OjhLHtQ3ea0yQzncTIP19CYUayT2451pOZIuOCznqhlfsap+Hr5jYr9IqodMnH8sgeuPghtjNLPzqdPLL6ssv2m+BqjoqovZrHs8/qtucSPvCsyV/zXUsJz9U+77kKthNf8YnOngkDHL6cMAteJl4Oz4X9ReDykrffZRa/HXOhxtr/yaUiycYxA6sTi68uT25bnFi0V403hFIimAKQipJTBCm0KVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.9; Wed, 10 Apr
 2024 22:25:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 22:25:21 +0000
Date: Wed, 10 Apr 2024 17:25:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "Hans de
 Goede" <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Tomas Winkler <tomas.winkler@intel.com>
Subject: Re: [PATCH 00/10] drm: move Intel drm headers to a subdirectory
Message-ID: <lefjmw3mekbbfodna5cgbn2wb73x46xitxneks6oxoukwokeue@eramkoszthvq>
References: <cover.1712743191.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7001:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2n2aGolP6STs7mVP5AYg3C6BVzzD7eGBE1+KC1lA44ll0ZR+kDIrmR9uc1Z0ahjiH42d6j3Kqd2P3yPkCKAFkG/tm1QepzeS8igQBDvyjF2kCvzARnLjuZH2r+TsbpzXP2WxppI1q0qjCl8E5qx1Uwsa+P31bL0M+CaeVA6gWjYlcXirNqs+rkxJPsS5MpjHCDIHtvsJsFgy3Mwv7rrAJXyL+oSm6wQ5e+uVt7lS/bFwZKeD3/GgdV5kb7HYZG5B2zEvSFEjsw35rM5/020ES5pN47v2cBqofgi1Dg1faFmFDOHKN9r7GDRV7yuz+JSlSkxBmZBqhNoo7zcFwhm7L5xh9zKZPdPhj4lEBBw3UcFduP42einp2bTT8XkqUIW6VpaloOBR50C/kLtqGGvlgVVDqSj6hDHTlPyXyQFTGxicFEfxxtQ9E1OZX7KMynaeziemgIqnNU0lMdYh45GsFOjv38fJ2qSumer55SDXUWNjjPK7MgbUtKrsO+0je7I8+pfPlRtuH5CBO2xWls2adTHy9hk1kn60mM0arz7vCX1J/50+tJazZv2cigOnzP33xvsqjKIZLJ6I56+EZAMmn3nuusOGwbvIWc9rO4M4QL+2hAt97TFoOIrpSLbRfz5YjaWxOv/cSyBhVzBwjkH1zCtCqqsdl/Ulp8YSS7MZIIkEvGrad+yi73KYvF3XSv+ffnYnsIhh0GdZrS3CmZ3Fdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(7416005)(27256008); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a59G1cWz0mXNEOevcCmLzBKHJVKpdrTz+VkaGF0+DG3dInirJVD601XyNzgg?=
 =?us-ascii?Q?NOD+deB/N2F7YsNQKHEGS06xLkk3EpOOSi4G8c21qceTVO3yP/R92v2kZkZY?=
 =?us-ascii?Q?xCGZZIi0ZaWOJ1oejPKzOguHIWm0EAMLSdRGnkIftbSkhJIXpm4dNHVeLBPD?=
 =?us-ascii?Q?9vfAl333owJB2YqPKHI1yOaPjnNWjtMyjLdW/4GosiBpEdUFr2IpX2nocgqo?=
 =?us-ascii?Q?RohA+0Rfet5e8LFxTwOI+yuCNWTnL5kYBtPBkGAL3ZESu0/291BL2znclcU3?=
 =?us-ascii?Q?OyFLXj0VrMp0RQt3PYCDdIkfxqfAqfzVAsUK7HFUA3KdEv8MjgaMz3NFFPJX?=
 =?us-ascii?Q?k4fk9b2udKjPGssCpHu2mOpzakN+lTa92rr/Wu4F0o+lP+M+DxQyFxt7mdWs?=
 =?us-ascii?Q?h9XkavYtxM5IySBGlnU9l05zeRZUoNpi2bA1VWnEdmB8vpU9xxVfOSji9oUW?=
 =?us-ascii?Q?4geb29iaxuibtBi8h5LtHQksk3rSEC0Ne1KfjdjKiATVFlBYdrSgUf9xv+ju?=
 =?us-ascii?Q?KWrKIB+SeDmUpEW6Fl/H6AoYP4AKao+0Uc87wPBUNy+/Aigc99/stRO2mXSb?=
 =?us-ascii?Q?ugnEN7EJTMa+72KmxVo2wrvjg7atPs+xI4UV7Iu75t3WT7qRK1/XPkeCZUf1?=
 =?us-ascii?Q?/dDYLzTL5373/ggn3dRCZsXk0S1Yj3EdmfFB1KuwAo6QEoY4NnZRupPgY7df?=
 =?us-ascii?Q?pJ979qytmNl5NybUgux3CdV2CugZUwd2ElGSJept2rQlJU02FSfV3qGQcEbM?=
 =?us-ascii?Q?DEnoPhVwB/kHl4NjShn/RzTACiTphAP3UJFkkdG0U2HaFjWLWE/e5se/pJXa?=
 =?us-ascii?Q?YjrWyYqBm7EnIJc1Ea5bMCGpJ7+ubIwoNfkU5sibBqlREOPfSvXzbTwWdZ0+?=
 =?us-ascii?Q?xPMmu4Y5G4wfrSW3uG+M7YqHUeQqXRw728e7GnBnJXmpdfqHLaGFFOSLPkdj?=
 =?us-ascii?Q?AM7KwZYes9ftc/7VlURZRvtFAgit/79eakqU+b9EG7lkAHDYQebqWeOpKhyY?=
 =?us-ascii?Q?p+yedPsp9uCTQY4jfR+jQOeDboGrk8Xbh5QYbr4kTRId99+EuFzlyyeBOepo?=
 =?us-ascii?Q?B+4DElpV2IOEJuBrzzp/7iHffb7JuQZMmWi9ZP/OLvOztPWghBUQKIA3b/rn?=
 =?us-ascii?Q?Sf/rTXxcmKKn4+KtYQ1xnbsnvA8hgcVRyMw+PH6tH5Dhtd+L57AbhtJB4xP2?=
 =?us-ascii?Q?Th1pz3hY/K9b27Jyzdo8C/qjDAoY00RTPmd1bOfoGCa6D3lQys8EYYww/Q7M?=
 =?us-ascii?Q?BFiUKxxTk+gkxIjD7VD9Ot4F+TiGQE8v8G7ar+jKr99xvh19pr0EiVOzJadn?=
 =?us-ascii?Q?Ki+w2TbmFWD1bKMjBmtNKumND2GhFe9YQf2pehSFCkCJUm1UT1GVbmGqeSoq?=
 =?us-ascii?Q?/otVTgfc78jemD8UWGbWrEgvYhAlYNil6zp+E90tdKFHxWPyLgOHj4t3+RF0?=
 =?us-ascii?Q?C6iwjRP+VVHBscEz39cSLqYk750SwGmreCt9z6kNhOfZdfxZ7k8sF3iaXNYP?=
 =?us-ascii?Q?vccc9LjhMENtHrc7qYOaFxComMwsi2Y/gmn5x20ACqv6DjSEjdZoPnsn/PXv?=
 =?us-ascii?Q?5/RgB7ed4zdFN7hN2kHaOl6MlKhWdsj+tR9Gf8h3QCUCp6tsTPq2EFbBK8rP?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3586cd11-7f54-45b8-acb4-08dc59ad1bbb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 22:25:21.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR1WFnxz6gjkV7wzcYSFB6Qo/cP1H+I/GdAjHMXMHF7jfpXqdx1oFKD30uiqCB6p+zslnWmqxychCjbJvIOXpLSgd922WxFEheGIbfZ/zXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
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

On Wed, Apr 10, 2024 at 01:05:07PM +0300, Jani Nikula wrote:
>We've accumulated enough Intel specific header files under include/drm
>that they warrant a subdirectory of their own. Clean up the top drm
>header directory by moving the Intel files under include/drm/intel.
>
>Since i915 is most impacted, I suggest merging the lot via
>drm-intel-next. Please ack if this is fine for you.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
