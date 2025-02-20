Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A75A3E55E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 20:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B9810E9D9;
	Thu, 20 Feb 2025 19:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSFa1rLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA2810E061;
 Thu, 20 Feb 2025 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740081296; x=1771617296;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=veexH2odReDCo3gRAdm06qJvv8zZA/KkJrpjE48rRuA=;
 b=nSFa1rLltRFXyUXFKBQ6ltQmT5SIe8oAtMtYy6O9HWwJADv71iMpyPC4
 eJikhSQ4VwpMdJfUZNsc89uZANOaQqg7q7Fcm+CiDYgL5mELzz+8TahaG
 UL5FqHOF/iHLLBDt4NEHHJeSvnz3FlieiuCdsozCK/RMqoF5Bp+JGHe2E
 NJzXxpLG3aebHoq9rdlQDNUpn+1DrA9B6DLRyAfN/FsFtIiGbrYRTG0EV
 DuVqwHFGCmtA2fiJpuVBQ/2+LbPAtOs6TJ7khcHjRij53MMZ0KR6uZbCU
 kIw8ze6r3UFnpYHrw4XGftJtOKNOeQee5/JaX8IsZminmMQwybhrrXwmw A==;
X-CSE-ConnectionGUID: oOT7tdQmQaWqcBRAeHREtg==
X-CSE-MsgGUID: 92xuJ8vTQ2m635U/7Rz69A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44528588"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="44528588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 11:54:55 -0800
X-CSE-ConnectionGUID: Hgi2xVuCR1a9+fb3p0v4vw==
X-CSE-MsgGUID: ayZXjSVERmi0un7ocMRWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119258463"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 11:54:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 11:54:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 11:54:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 11:54:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR/ekH/TEFnbcLQztp9j0I63OqMmIfSR4yU58sEoqr08fzvbUE3OeT58CdU6YTkSqciv9lT/CInJQQQpQMf2E65DPBL3cg/Wz+p5bgeju2uc6cwZvo78auNPHG/W0H8HSL3XU2SMnSa51F7b1iXOOB/zjxFjY6lf9dAY9xGi8mNlaef738tmsSwnNTp0rThmwE76HHQ5ZlqhO41xLkdb7CI6C/GuXiEjffArIyBwsUD2ZUQ0UO1wbMXQiXlat6/UKl2K0hFp46xyDnvU9/WgcMHJ+HzsjGgpQrhfGY8tNgP/uJFH8eQ5KL0xZL+faLHdJUaHWdJD5zJFj8qvX8QIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1L/I4M9WogZKw08CHgLNFEuNEdiH77xUw50DKQbes+k=;
 b=vopQpXVuSeuDF+iZEEDJfNyIZtgQUNcKEyGDFaP3yLYOvZovAeejJC8VNQCF7i4f3kJJpxre/xq0J7GQ+3KJXRbbPMQn1U6fsVWBcsktcMuaIyewj4WWYaERmDGr/KTaMpcX5ZyNLBWVhIeiU7aMSAi4oPnEjNb0b6uz4BRJzlxDqZJXs84Upnx69L2MlqN8G5Jer6keCHAsk3lGcv1I1AbpbOxavqa5RRw+OVm2Xc/o7V1x6ItFTg6rmGY7PYxf/EF9b9YKm1BXY+ILBhxVGoP6o3UBt7NwWKrWG3AnMmivC2s9nC+iyjgqukeLDAyrN+g5/iZ+1HTEh4IlfbLxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 19:54:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 19:54:50 +0000
Date: Thu, 20 Feb 2025 11:55:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
Message-ID: <Z7eIyFMKBeAHiPPE@lstrano-desk.jf.intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <3de5325a-147e-4126-970c-765884a1f6da@intel.com>
 <b04945011524a4ee614cd830928ceedf9f9b6293.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b04945011524a4ee614cd830928ceedf9f9b6293.camel@linux.intel.com>
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 81774c92-aabc-4027-860b-08dd51e86fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?X9tzZjpG5LV4IxAUhH+S2g1yZ5kuvt4uQ2/5XDMoat1vpEJOx8YzpZn8VL?=
 =?iso-8859-1?Q?h0iaSAC7CH+WcPIcprlt3SScMicLnFl2wTLAZD68jET3Evzy+ouJnAUMY2?=
 =?iso-8859-1?Q?utzNWudx7UNTACgb+74FoTBdKhAgLSfGwg6lkoauXcPYaoSA9ktUHRu/hN?=
 =?iso-8859-1?Q?yuYT1pbezhU83mS0yogQTQM0qca7xrXHjZB+mqaJVGXQulkAUGcION3hxJ?=
 =?iso-8859-1?Q?U/yAEOb8fGQ0gfDRDDbFOVVNyS/RVxSntktwuWBTYQW5UOmsn54GUN40f9?=
 =?iso-8859-1?Q?2HeFsLd1k90OyOMy1X6qJddEISUQv7ew3PiF1pziX4dOiDT8BieyyLPvRW?=
 =?iso-8859-1?Q?YTAsuoiy266aQQDlAwvflq7KcoAdOGI7BgVzOg9gFa8D6pVD7gqkmhkew1?=
 =?iso-8859-1?Q?xqBsX2bnJKe3C/p7uXSPTea+4DREMXsijbwXluFmA2GDxfVvcC8gr8A8qF?=
 =?iso-8859-1?Q?pyDk8bdPU/QL8vhZzHNw9dHyfys2KYpgtu5PYDYVK6d0dh+MyIBwzrOTa0?=
 =?iso-8859-1?Q?UScX0RevPGdBEoIYFVPXOo8O3PRtCeqPRnd7nPGIPttvcClXM3ddXf2h8F?=
 =?iso-8859-1?Q?IJLSGMsrW5udGNtlhRMc4s+ZtV3od7OX1ivdZtAwUcsmhpldlCuFP1i9Ys?=
 =?iso-8859-1?Q?24cYVdzhrkD9AG3lhfUCRGUxSB5oFb0x43Kk0nBeisF6zniYKeVOsWJVii?=
 =?iso-8859-1?Q?O9g8cF5UI3W5eJ4AIBFmBWgwGREBMiegCM/grI4lFfOgNYIyYLhMRN8O4n?=
 =?iso-8859-1?Q?2xkBW+TbtcckrgJJ5ZXdatEc8JkZYzHvHDgAIB44BZcRWA2MXD22uWajVg?=
 =?iso-8859-1?Q?hzFgFVszTo8UL8H5OhJj72g3ByjSjtC1oT1atCanp19EcHX4kvkolgKIhR?=
 =?iso-8859-1?Q?lCOMFrCyqhGY8jFsHfZXmEUpjiqTlqN2hsQEweP3Ok5dGLNXVrPLiy7vn9?=
 =?iso-8859-1?Q?2LmlP61WDOUy9bPOsCUZS3N5IR3azshvIlZWqRIc+mUtFamPD3ESJkC3DL?=
 =?iso-8859-1?Q?Sfq7nVu+vYxvzFTcroIH+RqkKWa/JT7zArJ6pM62KAakmaNwq4fm4DPpXr?=
 =?iso-8859-1?Q?M6w5IIKrraBhhM1ikXgQKesK5ZGj6VU5ug8Mq11h1OcunP6XD/OSofKK21?=
 =?iso-8859-1?Q?7nZFlm2hKVTQGdVE63mzURsx9yIxWbMbWI/mid/PLosZHiTiNwMHWFMILr?=
 =?iso-8859-1?Q?lZzn1ZovWRowTEAQhFgofR3E/7u7dHnwVLwrAm58luDo4CKaac/1rtU2u8?=
 =?iso-8859-1?Q?+DFHXGIgkS8quQYoyVnLQb3+WArE1dSPLU52Oktv3zvfHccIhyArmPgwHk?=
 =?iso-8859-1?Q?agRi6hXr1Vghm56A9tKqYQmNrN34vwvQx7gCx5hOnPatQQHz2lfqGyE+aS?=
 =?iso-8859-1?Q?jLHntHKVGWDqKfm0iN13jOzXN8/9AGpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YTJCPT+/SsIcgq9WlGRpsixtoc2hjzzxELVzRq1oK+96Un5WMDYr26mAH2?=
 =?iso-8859-1?Q?KvV/rQqDJQkHxYC78iQjivGp06ykFr5vQ9AQyIXXc6nLmsL5vDK5SxwIN4?=
 =?iso-8859-1?Q?tdC1aZIx2NHb8Cs9RtQU0yHuBztJoKovvkgdgQgHdmgrYFV0KYPrky5uM/?=
 =?iso-8859-1?Q?k1+7WQIKTSmAzBEz4dBYgaEYuFXcHwKsTwyXaGT9xC0/SBQr12cOM/nZeT?=
 =?iso-8859-1?Q?Qo7lGuof/CP1XM5QqSJR4VAVYaiQfwU6NPGe/hvzDviZAAd3Trlue6eTla?=
 =?iso-8859-1?Q?fmXQMn3UybHipE+XALtiTiZ/tl6CTAQJaheuEG3Jr4Jwali+yJSbyZ4Jha?=
 =?iso-8859-1?Q?ukrjgJhMDQ0xl2LkdGrq4c283xCNOR5mLzMa+AilZhGvG0Ir0q0cQ19MFB?=
 =?iso-8859-1?Q?TGYQDRayKsLRHkQPpeyqoQEWbTWmprv5HKEN1dYRVeIZM290piGr/5JNjm?=
 =?iso-8859-1?Q?2i2KdP0UFfCVY38ZDtBdqsttIqhpWRG7pXtlyHLClzgIaj/eS5tIja+IC8?=
 =?iso-8859-1?Q?sjqHMf4xP3yJechcGfft8vEDT1GVBwTI2DkxCbwDVXDLy4i9LMosj8qLCy?=
 =?iso-8859-1?Q?UX4sHA340sqCQKUuuYiXl5YZxaisMq/ujDGd7o5u7AFnnP7KlgKUSJyCLt?=
 =?iso-8859-1?Q?1ucxI1SbnVxZdoN9+xyGA5yw1n3AAAAQx1thClDqZmPG+5/BUMfdBM7tVO?=
 =?iso-8859-1?Q?bzXOa8v0H4fXp8taUx9mMMJDps7EfWN284ax+5q/PdTwxDiVqZxSmCkBzd?=
 =?iso-8859-1?Q?PIrrQDdHcTXMQqGqu2cn2AzqK6BiAr89MLQGMEDWTRk4gOgeLBH9a9O23Q?=
 =?iso-8859-1?Q?4/zDl5+FJ/LdJlSjzK1pBQjacEcqzYqZ+UXON4ueKfSmhU54SW1Yd8oRoT?=
 =?iso-8859-1?Q?GymLFyq1V872/7wZgWcelVyySlw86abV88tShhXFo3goXYjLQfrqGyXzZU?=
 =?iso-8859-1?Q?xcISlDc/yzn2T9asZ8itn0dXIOcqKx4Rt3NwjNnx43kMA3H34fQi9kNGSE?=
 =?iso-8859-1?Q?sa9+zIhJf+jgP3VrCTEvza6ZocabsoZ8S8sKad1Bt4lUrQ+KxC9KJo7jcI?=
 =?iso-8859-1?Q?SVBaWkb5p1rHx4hhVO+R9NI9rqoRdjlBdtpQzZLTqB1c7ZIwYuCezqo32E?=
 =?iso-8859-1?Q?KWL6a3+RjSyJ9NDh/vVfgbmhwW+v+984wUHpebNydj0IH5DFwWy84fnodA?=
 =?iso-8859-1?Q?P7GWcSaxFj9Zkvn5sjiE42XUzkYCZ6zQqtYBkx9BxEz0pqnXblS9P5v2Mz?=
 =?iso-8859-1?Q?JeTVFiGT521SI3ftcNWHrY/M3Lb7QI1VAgclCUrmVVdtq02dMP7Hf1SgGA?=
 =?iso-8859-1?Q?WAPCNyCx2BBravrtnqt/YYz75/P8X+mgomRKmoybz6EAZrCfqE3SSD0g1o?=
 =?iso-8859-1?Q?ef9HLmGIgNYQUVfg796sPWCgl2Zsb446zydjsAm5fBJrka7A7OaIhfrC1z?=
 =?iso-8859-1?Q?WTZLKOCB+SXV+0bvcNAijUiybxPk2nbU/E9uMUWtA+QGg0n9YvvWiff2AE?=
 =?iso-8859-1?Q?IrYqcGnNT42F0I0RATU4RylwNpb3h303anhHeHk3KoWJYgM4l+E2V+gsiP?=
 =?iso-8859-1?Q?SQBuH6LzJZwve3P+hFyGghhEeNk9oV/GTtWJ6/BTddq4cXQZK0r39F1rI+?=
 =?iso-8859-1?Q?Nflp79iCcH0FzMQDBFX9vP49VuQjbKnj5d1WKcQIXRQ/sFfVVxIkTU3g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81774c92-aabc-4027-860b-08dd51e86fba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 19:54:50.6911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4YsM5/c/FkM6MY8s5ndurWnDi4UNm4mWWiY1DhwJmIs6Z0ytzHrAO5vRhn/+5T3wvC3Ln8WSV0cD00YLgN5AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
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

On Thu, Feb 20, 2025 at 04:59:29PM +0100, Thomas Hellström wrote:
> On Thu, 2025-02-20 at 15:53 +0000, Matthew Auld wrote:
> > On 13/02/2025 02:11, Matthew Brost wrote:
> > > Migration is implemented with range granularity, with VRAM backing
> > > being
> > > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime
> > > of the
> > > TTM BO is limited to when the SVM range is in VRAM (i.e., when a
> > > VRAM
> > > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > > 
> > > The design choice for using TTM BO for VRAM backing store, as
> > > opposed to
> > > direct buddy allocation, is as follows:
> > > 
> > > - DRM buddy allocations are not at page granularity, offering no
> > >    advantage over a BO.
> > > - Unified eviction is required (SVM VRAM and TTM BOs need to be
> > > able to
> > >    evict each other).
> > > - For exhaustive eviction [1], SVM VRAM allocations will almost
> > > certainly
> > >    require a dma-resv.
> > > - Likely allocation size is 2M which makes of size of BO (872)
> > >    acceptable per allocation (872 / 2M == .0004158).
> > > 
> > > With this, using TTM BO for VRAM backing store seems to be an
> > > obvious
> > > choice as it allows leveraging of the TTM eviction code.
> > > 
> > > Current migration policy is migrate any SVM range greater than or
> > > equal
> > > to 64k once.
> > > 
> > > [1] https://patchwork.freedesktop.org/series/133643/
> > > 
> > > v2:
> > >   - Rebase on latest GPU SVM
> > >   - Retry page fault on get pages returning mixed allocation
> > >   - Use drm_gpusvm_devmem
> > > v3:
> > >   - Use new BO flags
> > >   - New range structure (Thomas)
> > >   - Hide migration behind Kconfig
> > >   - Kernel doc (Thomas)
> > >   - Use check_pages_threshold
> > > v4:
> > >   - Don't evict partial unmaps in garbage collector (Thomas)
> > >   - Use %pe to print errors (Thomas)
> > >   - Use %p to print pointers (Thomas)
> > > v5:
> > >   - Use range size helper (Thomas)
> > >   - Make BO external (Thomas)
> > >   - Set tile to NULL for BO creation (Thomas)
> > >   - Drop BO mirror flag (Thomas)
> > >   - Hold BO dma-resv lock across migration (Auld, Thomas)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_svm.c | 111
> > > ++++++++++++++++++++++++++++++++++--
> > >   drivers/gpu/drm/xe/xe_svm.h |   5 ++
> > >   2 files changed, 112 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 0a78a838508c..2e1e0f31c1a8 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct
> > > xe_svm_range *range)
> > >   	return drm_gpusvm_range_end(&range->base);
> > >   }
> > >   
> > > +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> > > +{
> > > +	return drm_gpusvm_range_size(&range->base);
> > > +}
> > > +
> > >   static void *xe_svm_devm_owner(struct xe_device *xe)
> > >   {
> > >   	return xe;
> > > @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct
> > > drm_gpusvm_devmem *devmem_allocatio
> > >   	return 0;
> > >   }
> > >   
> > > -__maybe_unused
> > >   static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> > >   	.devmem_release = xe_svm_devmem_release,
> > >   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > > @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct
> > > xe_svm_range *range,
> > >   	return (range->tile_present & ~range->tile_invalidated) &
> > > BIT(tile->id);
> > >   }
> > >   
> > > +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > > +{
> > > +	return &tile->mem.vram;
> > > +}
> > > +
> > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> > > xe_tile *tile,
> > > +				       struct xe_svm_range *range,
> > > +				       const struct drm_gpusvm_ctx
> > > *ctx)
> > > +{
> > > +	struct mm_struct *mm = vm->svm.gpusvm.mm;
> > > +	struct xe_vram_region *vr = tile_to_vr(tile);
> > > +	struct drm_buddy_block *block;
> > > +	struct list_head *blocks;
> > > +	struct xe_bo *bo;
> > > +	ktime_t end = 0;
> > > +	int err;
> > > +
> > > +	if (!mmget_not_zero(mm))
> > > +		return ERR_PTR(-EFAULT);
> > > +	mmap_read_lock(mm);
> > > +
> > > +retry:
> > > +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> > > +				 xe_svm_range_size(range),
> > > +				 ttm_bo_type_device,
> > > +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > 
> > Just to confirm, there is nothing scary with the vram still
> > potentially 
> > being used by the GPU at this point (like with an async eviction +
> > clear 
> > op), right? At some point we have some kind of synchronisation before
> > the user can touch this memory?
> 
> Good point. I don't think there is.
> 

Agree - there shouldn't be anything scary happening here. The new VRAM
is allocated from buddy which doesn't have dma-resv attached to it (and
thus no outstanding fences) and creating a new dma-resv object. A clear
is issued and then we do an immediate copy but those operations are
serialized on the same queue.

Matt

> > 
> > > +	if (IS_ERR(bo)) {
> > > +		err = PTR_ERR(bo);
> > > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > > +			goto retry;
> > > +		goto unlock;
> > > +	}
> > > +
> > > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > +			       vm->xe->drm.dev, mm,
> > > +			       &gpusvm_devmem_ops,
> > > +			       &tile->mem.vram.dpagemap,
> > > +			       xe_svm_range_size(range));
> > > +
> > > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > > >blocks;
> > > +	list_for_each_entry(block, blocks, link)
> > > +		block->private = vr;
> > > +
> > > +	/*
> > > +	 * Take ref because as soon as
> > > drm_gpusvm_migrate_to_devmem succeeds the
> > > +	 * creation ref can be dropped upon CPU fault or unmap.
> > > +	 */
> > > +	xe_bo_get(bo);
> > > +
> > > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > > &range->base,
> > > +					   &bo->devmem_allocation,
> > > ctx);
> > > +	xe_bo_unlock(bo);
> > > +	if (err) {
> > > +		xe_bo_put(bo);	/* Local ref */
> > > +		xe_bo_put(bo);	/* Creation ref */
> > > +		bo = ERR_PTR(err);
> > > +	}
> > > +
> > > +unlock:
> > > +	mmap_read_unlock(mm);
> > > +	mmput(mm);
> > > +
> > > +	return bo;
> > > +}
> > > +
> > >   /**
> > >    * xe_svm_handle_pagefault() - SVM handle page fault
> > >    * @vm: The VM.
> > > @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct
> > > xe_svm_range *range,
> > >    * @fault_addr: The GPU fault address.
> > >    * @atomic: The fault atomic access bit.
> > >    *
> > > - * Create GPU bindings for a SVM page fault.
> > > + * Create GPU bindings for a SVM page fault. Optionally migrate to
> > > device
> > > + * memory.
> > >    *
> > >    * Return: 0 on success, negative error code on error.
> > >    */
> > > @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >   			    struct xe_tile *tile, u64 fault_addr,
> > >   			    bool atomic)
> > >   {
> > > -	struct drm_gpusvm_ctx ctx = { .read_only =
> > > xe_vma_read_only(vma), };
> > > +	struct drm_gpusvm_ctx ctx = {
> > > +		.read_only = xe_vma_read_only(vma),
> > > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > > SZ_64K : 0,
> > > +	};
> > >   	struct xe_svm_range *range;
> > >   	struct drm_gpusvm_range *r;
> > >   	struct drm_exec exec;
> > >   	struct dma_fence *fence;
> > > +	struct xe_bo *bo = NULL;
> > >   	ktime_t end = 0;
> > >   	int err;
> > >   
> > > @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> > >   
> > >   retry:
> > > +	xe_bo_put(bo);
> > > +	bo = NULL;
> > > +
> > >   	/* Always process UNMAPs first so view SVM ranges is
> > > current */
> > >   	err = xe_svm_garbage_collector(vm);
> > >   	if (err)
> > > @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >   	if (xe_svm_range_is_valid(range, tile))
> > >   		return 0;
> > >   
> > > +	/* XXX: Add migration policy, for now migrate range once
> > > */
> > > +	if (!range->migrated && range->base.flags.migrate_devmem
> > > &&
> > > +	    xe_svm_range_size(range) >= SZ_64K) {
> > > +		range->migrated = true;
> > > +
> > > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > +		if (IS_ERR(bo)) {
> > > +			drm_info(&vm->xe->drm,
> > > +				 "VRAM allocation failed, falling
> > > back to retrying, asid=%u, errno %pe\n",
> > > +				 vm->usm.asid, bo);
> > > +			bo = NULL;
> > > +			goto retry;
> > > +		}
> > > +	}
> > > +
> > >   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > &ctx);
> > > -	if (err == -EFAULT || err == -EPERM)	/* Corner where
> > > CPU mappings have changed */
> > > +	/* Corner where CPU mappings have changed */
> > > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > > {
> > > +		if (err == -EOPNOTSUPP)
> > > +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > > &range->base);
> > > +		drm_info(&vm->xe->drm,
> > > +			 "Get pages failed, falling back to
> > > retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > > +			 vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > >   		goto retry;
> > > +	}
> > >   	if (err)
> > >   		goto err_out;
> > >   
> > > @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >   	dma_fence_put(fence);
> > >   
> > >   err_out:
> > > +	xe_bo_put(bo);
> > >   
> > >   	return err;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > index 0fa525d34987..984a61651d9e 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -35,6 +35,11 @@ struct xe_svm_range {
> > >   	 * range. Protected by GPU SVM notifier lock.
> > >   	 */
> > >   	u8 tile_invalidated;
> > > +	/**
> > > +	 * @migrated: Range has been migrated to device memory,
> > > protected by
> > > +	 * GPU fault handler locking.
> > > +	 */
> > > +	u8 migrated	:1;
> > >   };
> > >   
> > >   int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
> > 
> 
