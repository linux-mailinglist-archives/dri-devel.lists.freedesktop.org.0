Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314256368EE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 19:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FCB10E22D;
	Wed, 23 Nov 2022 18:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46C10E214;
 Wed, 23 Nov 2022 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669228369; x=1700764369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EapOIXXIgSYocRgrdXRdS6r8y6Det2PVsgrQDeo+LjE=;
 b=gZUSL/NbVg7aR8D0gRtLDAjYQrTkLsxZ1gxveOt5Uz6IhAwU0j6vrScx
 Wzxf8vY6SSofaTX8eiJrHfWAybND40rd7nNR5XL2W+068ozSF4pIUKvKW
 KG7pNHv0cErRrPPdabjyrVysn5/G3x2fBd6D/jYRfgluehoCO4PbhUIYX
 fedjn3sM8QJazLF6vSCamJNW/UgiRECspO6irQTJ3fRK8/X60rcmwIneW
 RixZ65e8dFtZisRYf4Yxwk+pfhCrQwazoPoPTodMbw+ADCvxufyiMap8J
 mPHmp0awEsO/ihGnjebIZNCYHcWJv2NKmHuVjKd+VKeEfKlvH3Cmr83PO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="301695480"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="301695480"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 10:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="970962637"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="970962637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2022 10:32:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 10:32:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 23 Nov 2022 10:32:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 23 Nov 2022 10:32:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHwS+xqMa5S1VS+Mfzu9t8ZcVkNh7fuJdSu1XTOkswPKbCaDszm7hYa+2tOaGwpSv5v/kWMcLLU99NjC8ljQd7/fu9LDQEiCbbbeer97SNAETIfuhcM5y7pL+BVHOE3mb9Q1CZiEkI2tc2v8V2BiLX9usGH6J3vPTVhKPoPOZvq8qAya98WnYTEc4v4mgRq3t756PZhEsjD9jeExw2j1RNkKnpAVeig/h2nXB6OzVQfwzAZyBpo9d0ABS2dv20oXzqNjw2ZGLmnwqDKbFbH92Kmchrhljp2ANUZ5fNUGhgw/KyEAmcmDdzeUlWVWtOLCsEsONJu7/+nhJB2dS0aoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xS+U/F9cVFdUxcw07KuxWQ0r9lvl6jRmsRCADIyW8SM=;
 b=kT0iGLTRrzrFesFgxfHV79tgftA0W+grALCb+zhxMCg9nSaPYb4hlx1Z4z1o27b2YycVRXkLhOSpDb6tdJE2XK7ZCY0RLStIy/QxUra9fwzReniJbpkUc4tx4c4ReZWze7nHSrCxZ6FlIqDU8pvZOVryq2OMH5TB6R3S/8g5W0RDEpRxg5sbV38d+6iDf6pXIii6o/+QO43bHtSgzjcfKTfBIzyl9vth4y8poGVcj6rlebrK7OPHEx3amE9hVQovCwl0YkyZpWtd2LgYMVEp+u6Zx/B6MNduYR7iPmCIe9MYAMjucHoBf9zFJql6SY0W9OxKsWXA2fRN3gv1vSB1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 18:32:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Wed, 23 Nov 2022
 18:32:45 +0000
Date: Wed, 23 Nov 2022 13:32:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload
 if GSC was loaded
Message-ID: <Y35nSurVkiyuH3hv@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
 <Y301LJvlfcUh7ADn@intel.com>
 <243c6524-c6d4-40c1-4363-0d2db45cf066@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <243c6524-c6d4-40c1-4363-0d2db45cf066@intel.com>
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f377bb-1dad-4478-f124-08dacd811d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtcscaaEvt8mRHm2zvuPalnTv5cSvr5fdNcCIH/w8VEBjHf9M6PMF4dEXIjeN9S9hQpR0C3NCEnJiNiGlDClkxEYpwEhf5fqniJOiymfmU6f47zXYIb09j4YH4XmY0pVZgPge0XteNTvC8f1CAyWad23wil9bDnD9Mf09aQTRytUCBe1TKZVm75IoHEyTvihzLiRs2qU1sXokAH5dMR1kJS6CXzYFox0eJpdnuynETv41Zu4r0cMEjoRNVC+wYxQMUpGvNZTEOIxfFqDh6iRk9pVwLPiuNhDS8mEdqYP7auAAyqauK2EJVlKsq9d7BWhCKVaChIcHO9vtjGHLb7vl+igqbq+sns274RPiyplI28h3aZrePFY9UUyCqBpCsw/7lss9rCwU2C9O7QNE7skL5WRtiiSDFCqZ9PkZPBAW0glIt+oDplc90KM8eyHeyhI/NxrO+YACjNK4NWELGd4wOMq2qGzTlGWXhL4+OZOX0WhE5E54QGndbR8NxPUNdwby6gEoRu05RoDOZJ6quc95zcy/BSID38eRs0ZEBGWD8aC5W9MbhlflvJCGeAZQomq5exUehtkNH8YdsabacmEQ2btqYBVbbqopNnKPJAEq4drx6ILeYDvAdKRtr58mbN7pp73IG0rdHSbHRDzi0XrvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199015)(66476007)(66946007)(6636002)(38100700002)(450100002)(36756003)(8676002)(66556008)(6512007)(26005)(186003)(83380400001)(4326008)(53546011)(82960400001)(478600001)(5660300002)(316002)(44832011)(41300700001)(37006003)(2906002)(6506007)(86362001)(2616005)(6862004)(8936002)(6666004)(107886003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FzbI+6sfz67D/Qb4I7WihhN0fIV2LR2pQdNM4si1MEmGbzByZXSnXUnef1s?=
 =?us-ascii?Q?QNeTO4kPxLOAcEF3XH7m2RD7tdTLuNd477/+S3ZHTv8LKf4oV/9hn1+npn7t?=
 =?us-ascii?Q?IRb/Ju3aA4/l1ylmRb4yb5idbKRaiPpUgah5fPdBk33y1mX+cKT3zS4M0mhb?=
 =?us-ascii?Q?bczx7AG/Zpda6iL8DWokjtW5m0/xtbQkeMLl8QcuoC8X3x8H5Kw9wbS2lVD5?=
 =?us-ascii?Q?XBDrDpqhbGjcKyyaD8vHjMCquBW7M2Spmovay9qmRsNHSoORHPLBMbrOhLum?=
 =?us-ascii?Q?JixH5O9BzlAvNYxeHbCsCHQd44ImoapzVg5adhwXfUHMljh0bf4stQzn8van?=
 =?us-ascii?Q?RzQ3puigwnBa3nkuqEStLb8RElcMgg2s5Kfey9v7HMkRiao08kP1otEKNvkR?=
 =?us-ascii?Q?lY5FtYoyIaJ9NKXwiWmLeiw4Yu8C8LH5Qi7esXBXz7c/EwNu4nGHupy8Vth0?=
 =?us-ascii?Q?3Ms3TuGic8//Z3KHmWkknJTlXagCaHjF9WFngU7oRxwFKbwgFTmUWfvsN9kv?=
 =?us-ascii?Q?/4cqbUMx8OSU2w3CyJjZ0PzJSyvIZGOLOuA3ehSBm2i28ihRzkLvUDZG+x3c?=
 =?us-ascii?Q?HDPf3XbUHdElo3FBKiOMxyTJEBhmTwS7vR6qwHNOaDiXznKkoReSAB8r+BTn?=
 =?us-ascii?Q?gPzhHOQqxsxjgcIIiXc9sDl7em1rVWFDwgfCUzz9g/kvLALw/PqoEBYjPal5?=
 =?us-ascii?Q?1kDl29Pd4PNdPQqLsRPclUIPKvCbEePA7cziguOrZXcrnl2ylADcsvz1gGPR?=
 =?us-ascii?Q?2qyLfpk9mMB07MZd2NpVE6ejvFscmdpBsdXEcK0PVKVAR5ecCms4QihfKLwr?=
 =?us-ascii?Q?sREWhYEJ22vEF+cUrggPlIf5rxnG4W2kr1v1pu1uB3TYCz30LrHREXFQfXcF?=
 =?us-ascii?Q?f0KL1OKjeaWto97TxbWWTf7ZCOxRBfngxbHwcU8mrdXsHcMcvfTFtegvmQQE?=
 =?us-ascii?Q?cfvtdaUg0Q2RXwu4KhiBlz7R2bea54cVt0RN9gD8hsfUr6F/hU2A1Nyiimq2?=
 =?us-ascii?Q?MFHj4CQzXc8d/wMAzrUHjewa2URN1hrMF+zShkBbNBp3N9RGCBQYiA3RV/tV?=
 =?us-ascii?Q?uOku8vED7j6+PIRys0ixhJIUiDUhh8yUykT685dYDJz/AiKBykRfhnctU2Ph?=
 =?us-ascii?Q?uP+fyryLS1bftuGTqLY84RvPLFGcVbXWQabg1jTnNsc+l359kkLntGJRIE1f?=
 =?us-ascii?Q?tBrPsn4bjVJ3hcsqSpfFVKSTrQYdxTbrfrGR3W3c3lbeiPlP7Xpnbal/O6lQ?=
 =?us-ascii?Q?/ak+BrrjNp70+ow8bFHHlkjc60UFLE1CTJMAQcwC+SJaVKcXTN3RXAq57CE2?=
 =?us-ascii?Q?XaPzE7w2xelb0etqIyFSlnpsJSPe3dLlvxNPGuXKMCZNIp/8mp9H8FRlQy4N?=
 =?us-ascii?Q?3Rp4AtsBQLDkX77DZk1NVVlS/a6tOHyzzjpE1IQoC2Pc5gOCihfjGfNplB2m?=
 =?us-ascii?Q?p8ufcRi3Zv/WQQWk9muhyv2HXfPRmm8Nw3Ux5BELZgKZC0xxyHGdrl7R0Xtb?=
 =?us-ascii?Q?0HGRre5wyv+7JaRWIDxCQ/mhlyDotJ4El88oTCY9gai61sfdidxA9infTl/O?=
 =?us-ascii?Q?0rYMeUybe7MWILu2OL4cCMrqqDQtwyHA674gLHVpdhTz/RUnbHFf4bympLvO?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f377bb-1dad-4478-f124-08dacd811d71
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 18:32:45.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rFhl9VN1JmOh7RARmSV0IQq1L8K7RB/SfMWQHllLVrBDLNNaAkTL3xH2omA21HwTeb31NgH8qLKaqYOvAPz7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5633
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
Cc: intel-gfx@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 02:50:17PM -0800, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 11/22/2022 12:46 PM, Rodrigo Vivi wrote:
> > On Mon, Nov 21, 2022 at 03:16:15PM -0800, Daniele Ceraolo Spurio wrote:
> > > If the GSC was loaded, the only way to stop it during the driver unload
> > > flow is to do a driver-FLR.
> > > The driver-FLR is not the same as PCI config space FLR in that
> > > it doesn't reset the SGUnit and doesn't modify the PCI config
> > > space. Thus, it doesn't require a re-enumeration of the PCI BARs.
> > > However, the driver-FLR does cause a memory wipe of graphics memory
> > > on all discrete GPU platforms or a wipe limited to stolen memory
> > > on the integrated GPU platforms.
> > Nothing major or blocking, but a few thoughts:
> > 
> > 1. Should we document this in the code, at least in a comment in the
> > flr function?
> 
> Sure, I'll add it in
> 
> > 2. Should we call this driver_initiated_flr, aiming to reduce even more
> > the ambiguity of it?
> 
> ok
> 
> > 
> > > We perform the FLR as the last action before releasing the MMIO bar, so
> > > that we don't have to care about the consequences of the reset on the
> > > unload flow.
> > 3. should we try to implement this already in the gt_reset case as the
> > last resrouce before wedging the gt? So we can already test this flow
> > in the current platforms?
> 
> This would be nice to have, but very complicated to implement. The fact that
> FLR kills everything on the system, including resetting display and wiping
> LMEM, means that we would need a new recovery path to re-initialize all
> components. There are also potential questions on how to handle LMEM: do we
> try to migrate it to SMEM before triggering the FLR (potentially via CPU
> memcpy if the GT is dead), or do we just let it get wiped?
> 
> The reason why I wanted the FLR to be the very last thing before releasing
> MMIO access was exactly to not have to care about the recovery path ;)

it makes sense indeed.

> 
> Daniele
> 
> > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c |  9 +++++
> > >   drivers/gpu/drm/i915/i915_reg.h           |  3 ++
> > >   drivers/gpu/drm/i915/intel_uncore.c       | 45 +++++++++++++++++++++++
> > >   drivers/gpu/drm/i915/intel_uncore.h       | 13 +++++++
> > >   4 files changed, 70 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> > > index 510fb47193ec..5dad3c19c445 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> > > @@ -173,6 +173,15 @@ int intel_gsc_fw_upload(struct intel_gsc_uc *gsc)
> > >   	if (err)
> > >   		goto fail;
> > > +	/*
> > > +	 * Once the GSC FW is loaded, the only way to kill it on driver unload
> > > +	 * is to do a driver FLR. Given this is a very disruptive action, we
> > > +	 * want to do it as the last action before releasing the access to the
> > > +	 * MMIO bar, which means we need to do it as part of the primary uncore
> > > +	 * cleanup.
> > > +	 */
> > > +	intel_uncore_set_flr_on_fini(&gt->i915->uncore);
> > > +
> > >   	/* FW is not fully operational until we enable SW proxy */
> > >   	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
> > > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > > index 8e1892d14774..60e55245200b 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > > @@ -118,6 +118,9 @@
> > >   #define GU_CNTL				_MMIO(0x101010)
> > >   #define   LMEM_INIT			REG_BIT(7)
> > > +#define   DRIVERFLR			REG_BIT(31)
> > > +#define GU_DEBUG			_MMIO(0x101018)
> > > +#define   DRIVERFLR_STATUS		REG_BIT(31)
> > >   #define GEN6_STOLEN_RESERVED		_MMIO(0x1082C0)
> > >   #define GEN6_STOLEN_RESERVED_ADDR_MASK	(0xFFF << 20)
> > > diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> > > index 8006a6c61466..c1befa33ff59 100644
> > > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > > @@ -2703,6 +2703,48 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
> > >   	}
> > >   }
> > > +static void driver_flr(struct intel_uncore *uncore)
> > > +{
> > > +	struct drm_i915_private *i915 = uncore->i915;
> > > +	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> > > +	int ret;
> > > +
> > > +	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
> > > +
> > > +	/*
> > > +	 * Make sure any pending FLR requests have cleared by waiting for the
> > > +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> > > +	 * to make sure it's not still set from a prior attempt (it's a write to
> > > +	 * clear bit).
> > > +	 * Note that we should never be in a situation where a previous attempt
> > > +	 * is still pending (unless the HW is totally dead), but better to be
> > > +	 * safe in case something unexpected happens
> > > +	 */
> > > +	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
> > > +	if (ret) {
> > > +		drm_err(&i915->drm,
> > > +			"Failed to wait for Driver-FLR bit to clear! %d\n",
> > > +			ret);
> > > +		return;
> > > +	}
> > > +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> > > +
> > > +	/* Trigger the actual Driver-FLR */
> > > +	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
> > > +
> > > +	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
> > > +					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> > > +					 flr_timeout_ms);
> > > +	if (ret) {
> > > +		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> > > +
> > > +	return;
> > > +}
> > > +
> > >   /* Called via drm-managed action */
> > >   void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
> > >   {
> > > @@ -2716,6 +2758,9 @@ void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
> > >   		intel_uncore_fw_domains_fini(uncore);
> > >   		iosf_mbi_punit_release();
> > >   	}
> > > +
> > > +	if (intel_uncore_needs_flr_on_fini(uncore))
> > > +		driver_flr(uncore);
> > >   }
> > >   /**
> > > diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> > > index 5449146a0624..a9fa0b11e7e4 100644
> > > --- a/drivers/gpu/drm/i915/intel_uncore.h
> > > +++ b/drivers/gpu/drm/i915/intel_uncore.h
> > > @@ -153,6 +153,7 @@ struct intel_uncore {
> > >   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> > >   #define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
> > >   #define UNCORE_HAS_FIFO			BIT(3)
> > > +#define UNCORE_NEEDS_FLR_ON_FINI	BIT(3)
> > >   	const struct intel_forcewake_range *fw_domains_table;
> > >   	unsigned int fw_domains_table_entries;
> > > @@ -223,6 +224,18 @@ intel_uncore_has_fifo(const struct intel_uncore *uncore)
> > >   	return uncore->flags & UNCORE_HAS_FIFO;
> > >   }
> > > +static inline bool
> > > +intel_uncore_needs_flr_on_fini(const struct intel_uncore *uncore)
> > > +{
> > > +	return uncore->flags & UNCORE_NEEDS_FLR_ON_FINI;
> > > +}
> > > +
> > > +static inline bool
> > > +intel_uncore_set_flr_on_fini(struct intel_uncore *uncore)
> > > +{
> > > +	return uncore->flags |= UNCORE_NEEDS_FLR_ON_FINI;
> > > +}
> > > +
> > >   void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
> > >   void intel_uncore_init_early(struct intel_uncore *uncore,
> > >   			     struct intel_gt *gt);
> > > -- 
> > > 2.37.3
> > > 
> 
