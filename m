Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1992AAEC72
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EB310E88A;
	Wed,  7 May 2025 19:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPe+dduw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1A310E88A;
 Wed,  7 May 2025 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746647384; x=1778183384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B/wzpubQSeyDZDCpVeg94LCFkVAglzB1WL7OLM7f7kk=;
 b=kPe+dduwwX4CjsXa4vqR17oc62v3uUdZAq4VFnixWeKGzpHLGBFu88iJ
 8JveU2e8MNXjP+GXlKG1Wlqs3fBeCfhYWRMkCq4ziug9YUyhzkIl9eacZ
 X40956yHi7CE+fLLSKLnxPBIToHGzndzHgUVdXUlxrnFmcfVvvH7sVRBd
 vJJp9dO02CHP2XpBKXvPV+y1S4M+r9IMSOEZ9ynUGaINvQew5JTuy9UI4
 rMYPGvb09EZU0TiS5sv6dmSse3i7SM1KEQzbB1kGyEW7aPy8y03T6B5T/
 x7iHU/DwPh7LNi4VGMg9443j0wxrXKTTWT2osIE0uFW5Ru5H+/FoB3mnE w==;
X-CSE-ConnectionGUID: EHsdHSQ0TNmvPb1v+cIXag==
X-CSE-MsgGUID: b6mVgZsZSMOjJGZTwg3kUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48109454"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48109454"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:49:44 -0700
X-CSE-ConnectionGUID: HN++3xMDTSOfDT8doSfn/w==
X-CSE-MsgGUID: 6X8KLfKkQyqJHFUxsfJJig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="140931025"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:49:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:49:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:49:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJCPqVR/cTBBQb7VuGXgrh3vHR6G2k3d+TYOj7WJQlJWTe4fvEQtAWlvu5KnGLxDrZlojoitSoXBzg/PiWo6irQzRS5b2jAwLqWDrpf+3Aoau1bosGY4i8P+8MsY5MYhJkucXKVhAXm1wc8vqqfIJL/0Dz6cJUCvdLkdmJpYLBtqXw/8/r0t26eajcEp9JUshXrMHzHItaFkm4K6disZC34KPbulwJIx69J708/IG/pCyPjPkPSkURjkz7HNITv28k5vr7xrsC5qjEtxnEVyw0f4zsfUAMFYsvzxLRlNhWvAo27wp5JaDHn4eA+/QYlr25RBhgdvsTHUT3Q7BBmuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4TRhnnlT4WrdQj47N8p9YzZ7EReOP9zhGw4vDwocmQ=;
 b=iCfZHxizHUvwvuWtKZQ/9jmAzUUZPGs0Dy+geHXyhf6alW9YDEI/M/oFcSgXqtqAOkXW5Xg+C6icyoby9Qj5gy+H629PlEySRXbM2KqNEzG85LKmwUHzQkI3rnJ56zdY1CiWOhy4RLgKr0pX8sKz3LeDKKgc2tjFRJXuEiFsDfUqswxVPRwfv15KZVX7hF40qRNpU6Pz7QXcBo0DUZQspH9eHCTmOGv/0LAiDA69Np/w6CNJ5Hq98QZ7s55b5NOMccYe23n/mgb8J+FaJrbzSdq0qV5a+ibtM+6j1SNi9TEO8nccEjVRQZgBWv7qymUSHQ7HlgdkKf9n+26NXOS8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL4PR11MB8846.namprd11.prod.outlook.com (2603:10b6:208:5aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 19:49:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 19:49:20 +0000
Date: Wed, 7 May 2025 15:49:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <aBu5O5odAKaxhhym@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250506181353.GA89958@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:303:8f::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL4PR11MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c82895-27fa-44b0-5dbb-08dd8da0423e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8R35U4GCsJCAfToVaU36HiCiaZXHMDUdYdTT0S5utT4h2K4O+raeasc9GYUS?=
 =?us-ascii?Q?hThrJqBo7M41t9mZu1prgK5JZMp3vmDUq0BdPjA4J357nK+vGH/8dcEN/z8U?=
 =?us-ascii?Q?ZlL7FPD1upEfCw4uxXt/3dL9SkliWTETzkmVKClwpMoEDpglbbABTEihAJqc?=
 =?us-ascii?Q?ZWjt7WozH39PAzTW66v6fm9cnPkW1CnrbCEBE/RuT9uXSLYqBZ/f0mwdTxVl?=
 =?us-ascii?Q?0hKZMaubj6zvxqx+xXQNxTVb8M87g8a6iJ3AeQzYd1aqQVme2aLInApIgUbT?=
 =?us-ascii?Q?ONOoetFbJimAQgAMGqISVoUv1yXxrCLiTLO4GRCzOs5RtCBlMqt5rI0i+Vgo?=
 =?us-ascii?Q?12/DWktgMsTZIueqEgE7jr97tg1fxPZgC30lOu95ykb4+bVfM5wKxQNA2SHW?=
 =?us-ascii?Q?KESaQLM5qR4n2EamcRgYEqwx699Ev+85/oFzWJF3VU1K9hnNgbElJ7luiNxp?=
 =?us-ascii?Q?76+ybwMUvLr0ybvgx2+F9KGrGEMAll5qCO0M5g3kQSDuPj+4lPfWqDDPZu0z?=
 =?us-ascii?Q?Alw4RyOjHF8xQnm/6dtFDwHgYpSt6n5s+RxrKnK7MlqTQKKFe6v+uqc2YyXo?=
 =?us-ascii?Q?rUWYooObP0SeEV5g1EaRDN+9fP9VtnkwlPafPabDW/bjgaS8aw4cNjg5DOdM?=
 =?us-ascii?Q?mrWLewu3ZmIhLNL0A1H7s9y94ZVC13gbuaELtSgmWw5Ia9zWWBXEcD2Y1LaJ?=
 =?us-ascii?Q?rcXUeg7YO0eLLXP/LO06IJ3qkpCYC0ZFvzh6wgXERUgH1mnDsDZilHlWy/ju?=
 =?us-ascii?Q?lVMAdmUhjq+XLzEEql8KL3aGgWAKUETMuNdUvohq0xOSlsRrqcFcFY7PZafb?=
 =?us-ascii?Q?7MZikKsrIcQZ2r0EWpxQOJshCdYnoo/qOKTQM3KdDdUEue291NHrkFNRHaN9?=
 =?us-ascii?Q?98iwy9ocSvHNlPgbzZOYC7LVCQWbTDY4DJv0jPccreblFxtlXerNT63FLV2X?=
 =?us-ascii?Q?DWR+pnPF38MNFI8Bvm7e/CGXeO6TWXPPpIL5+kGPFGiNzUSgSpZIQ0yAbBDf?=
 =?us-ascii?Q?uLjBDdmwYs9uUgM6uuVvSaV0ZRT7W/c2lK8NAV3j5IG6NeMNni65BP9FXUUS?=
 =?us-ascii?Q?ovZdMPvSX7JeTKcdLdm6wXwVwZmaVpe0ghjy8KABHcaeJtHBPDGAwbFbUmTC?=
 =?us-ascii?Q?6lcg23xSsABKYsQ87pzkolu1FTzWb0O04jelSH7xgkAfaFdgGpY4aWqm+4u8?=
 =?us-ascii?Q?nKfD0L22cYGmXAHjANXzxsNmNU7RIO+khLiLRC9wWYh5yP5CAk0SNETqxwMA?=
 =?us-ascii?Q?fhhSqlTmTbnCsBp6vn+PnP6KN5CMUXFrtZp8QGWGqDYg4VfqVciLVUZwuOuZ?=
 =?us-ascii?Q?/6NwMCUL8G6PGOYgzZltAsFdHRvjqJKfiz+u0tFAvluf3MG6HA8tXQpmJkfP?=
 =?us-ascii?Q?mu70lcGx8YXy6P0v7xS2a67QKIQ8d6DPWEiNELEiPpaKwRCv+iSdOS4SYawi?=
 =?us-ascii?Q?I/dThPaUGMA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sli0y78aateTReZl/vsZ+82b9fgvcrcvqlbolWOMVc3WxUkapausgB3jDIuZ?=
 =?us-ascii?Q?R9xJjqLmOTnZlSlFhACT8sHebUusMRhbp12CQjJf/aHw+QlE5xNZ9oNoY6Ae?=
 =?us-ascii?Q?asUdzZOMt08rQC7W3cudCyMagYC4ECAa1iuuJJdWeED3kZcxWwIiOQPONOnp?=
 =?us-ascii?Q?L65o1369hcH/XTn8sgSyfPz/Xg0TsxVeVVfh6OEOahm4Wp3PrMyqFGP9/o1o?=
 =?us-ascii?Q?nS4QtRdmrV78WaGXhVjOiyzbNSgXinJIsBfLBNkUf9kIPBthA6vqynwnf48n?=
 =?us-ascii?Q?LDnIFAF5pufjyfVDJ9YnfNUXwxs2gbK79iGKrFVN0Q/X4LH1oaIew4YFXcKl?=
 =?us-ascii?Q?wdhWcDR5K+kOgJfEGLyvDgWHHGNI1IJaZiQhXQQ64LbZdj9DzGGeHQ5JRC5f?=
 =?us-ascii?Q?NwPlT8LJ0IkXKhJ83JghOIxECvhz9x6H/Wk4/1TX87nePUAGghw3wk0A3V4O?=
 =?us-ascii?Q?nCCsYDdxkKxDAFqw5AciYEYDQymW6BMhCsw2wG604OEWMZulZa9gSIZ3jxRq?=
 =?us-ascii?Q?2MV0huYINpkxzIVTo2ZLNcMRn0QGwlL2qclCJCwaLMcyUEqr2uJfJ0QVT7Rn?=
 =?us-ascii?Q?wSbTdhcObsqqdn4dY0OpPjljCuNSAVIy1FMHxofzIuwTy0dKvsmO3LbeEoAX?=
 =?us-ascii?Q?9QjugABwBPfgkXrTV9JvKRjJ98+q+ZYabfI5xVk8AcnxNC3dFhoYrzdItT6i?=
 =?us-ascii?Q?uWv6GWvs0gqNGjLqTCKfasynKzk1W/y89RfK0ohpMHzjHkFY8a6/Y13NUm5F?=
 =?us-ascii?Q?sZYs9BGOJo/UQg+gHrn+WyX2FZYHbmmDaYBvFxyioiLxauwGYAN+6qLCDdVu?=
 =?us-ascii?Q?kSvsADT6nVHXxojJLWZo5jid7kuuaIZStTBJF9hhzkvYsw9tALpZI8awJdbZ?=
 =?us-ascii?Q?kT9KDijKMZyeeDKtvFJcACKi3gfiMtEikLwHPwvtVr0hzYPF8Y21tAlym+AF?=
 =?us-ascii?Q?xmadT+g5ZeuV4qmgaiNoS84JG2pTEY94WFYhRzBLmfrLhs15EOFkqkdTbShj?=
 =?us-ascii?Q?R06xHe5oMf+DztXuw6BJ89BmGXHLAhSDIz1Os3cuiTiz7mUrvG9BUOA4ZuO8?=
 =?us-ascii?Q?nLPd5MVS4Ne2MXt4u5IrmGfeRfZT9ve3phmoIDzfsf120rVM/V81CrQlLPM0?=
 =?us-ascii?Q?EgPpIo8RiJoyiGOb6oXoSji7Oq0MdD/zsxMsTI/0Xpvb3JdlS+By2tIBXgha?=
 =?us-ascii?Q?Jnii4vOK7WqOGm7DwYxR8GEh2zyGxqPvd70/muIzNINM0SSw431Ct2SEZho6?=
 =?us-ascii?Q?oaU0DvGhcs3fSInz8B6ECTEEv0UHFGjr8zDrJ/66C0YsX4cCf9nokRtQqNmw?=
 =?us-ascii?Q?VuHqCNok9XrAUrHmAFqjlReTbrHdij4OmtCC2QwX+RYiPtPTmlkO8wp0OG0e?=
 =?us-ascii?Q?Hje7ce8RH+VGA0Wqnp4ff5xC9i+4LGmbXgACOYcOnKoMKE+JW9hQODbKcxA5?=
 =?us-ascii?Q?XrQkmwCpifYzwPpw4wmZ+kTFsjESOcimitGiT9PXnuOEgoQmvSIfX1vssE7F?=
 =?us-ascii?Q?qt66lRexyuceikmcqjYidCgPu7p0+NFxgA/mY1tZznMvyrOumN0CD5YISidT?=
 =?us-ascii?Q?hjQWkzbFNa15hDVcJoVlAPyLr+r6BvkuDinBZrCHs9stRjOrtpdemtwu/30u?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c82895-27fa-44b0-5dbb-08dd8da0423e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:49:20.5810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KLJZHmut/Pe0n6iYr4i3ZcSpjpLrKvnxrgf5oQ80db5qb9LLjqlWFve/YiPoMCHbwpYOvE8n2yheVrCmG+CNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8846
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

On Tue, May 06, 2025 at 03:13:53PM -0300, Jason Gunthorpe wrote:

Hi Jason,

first of all, thank you so much for creating this and for the review here.

> On Tue, Apr 29, 2025 at 09:39:56PM +0530, Badal Nilawar wrote:
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> > new file mode 100644
> 
> I really do prefer it if you can find a way to put the code in
> drivers/fwctl instead of in DRM subsystem.

I was really in doubt about this and decided to go more towards the CXL way,
but if there's a stronger preference it would be okay by me if it is okay by
Sima and Dave as well.

> > +static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
> > +{
> > +	struct xe_pcode_fwctl_dev *fwctl_dev =
> > +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> > +	struct xe_device *xe = fwctl_dev->xe;
> > +
> > +	xe_pm_runtime_get(xe);
> 
> Shouldn't this be in the RPC function? Why keep the device awake as
> long as a the FD is open?

In general I prefer the runtime on the outer bounds to avoid funny deadlock
cases. But right, in this case here it could be inside the xe_pcode calls
itself, that is when the mmio/mailboxes accesses will really happen.

> 
> > +static void *xe_pcode_fwctl_rpc(struct fwctl_uctx *uctx,
> > +				enum fwctl_rpc_scope scope,
> > +				void *in, size_t in_len, size_t *out_len)
> > +{
> > +	struct xe_pcode_fwctl_dev *fwctl_dev =
> > +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(fwctl_dev->xe);
> > +	struct fwctl_rpc_xe_pcode *rpc = in;
> > +	int err;
> > +
> > +	if (in_len != sizeof(struct fwctl_rpc_xe_pcode) ||
> > +	    *out_len != sizeof(struct fwctl_rpc_xe_pcode))
> > +		return ERR_PTR(-EMSGSIZE);
> > +
> > +	if (!xe_pcode_fwctl_rpc_validate(rpc, scope))
> > +		return ERR_PTR(-EBADMSG);
> 
> There should be an EPERM here if the scope is not good enough..

EPERM seems better indeed

> > +/**
> > + * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
> > + */
> > +struct fwctl_rpc_xe_pcode {
> > +	/** @command: The main Mailbox command */
> > +	__u8 command;
> > +	/** @param1: A subcommand or a parameter of the main command */
> > +	__u16 param1;
> > +	/** @param2: A parameter of a subcommand or a subsubcommand */
> > +	__u16 param2;
> > +	/** @data0: The first 32 bits of data. In general data-in as param */
> > +	__u32 data0;
> > +	/** @data1: The other 32 bits of data. In general data-out */
> > +	__u32 data1;
> > +	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
> > +	__u8 pad[3];
> > +};
> 
> This has implicit padding? Make the padding explicit or use packed..
> > +/**
> > + * DOC: Late Binding Commands
> > + *
> > + * FWCTL info.uctx_caps: FWCTL_XE_PCODE_LATEBINDING
> > + * FWCTL rpc.scope: FWCTL_RPC_CONFIGURATION
> > + *
> > + * Command	0x5C - LATE_BINDING
> > + * Param1	0x0 - GET_CAPABILITY_STATUS
> > + * Param2	0
> > + * Data in	None
> > + * Data out:
> > + *
> > + *  - Bit0: ate binding for V1 Fan Tables is supported.
> 
> "ate" is a typo?

yes, for 'Late'

> 
> This seems fine, though very simple in what it can do. Do you imagine
> more commands down the road?

Indeed, and this first RFC was to test the waters and the overall acceptance,
reception. PCODE has more mailboxes that we might start using FWCTL more
instead of growing per platform spread sysfs files.

One last thing since I have your attention here. Was any time in the previous
fwctl discussions talked about the possibility of some extra usages for like
FW flashing or in-field-repair/tests where big data needs to filled bypassing
lockdown mode?

> 
> Jason
