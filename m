Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9E9ED5F7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D20A10EC0C;
	Wed, 11 Dec 2024 19:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYlfB6rW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1310EC02;
 Wed, 11 Dec 2024 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733944256; x=1765480256;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cJHpljWJWSgWhQzAAtKB+g3dwB+UamAj1H1Dtbo1p78=;
 b=cYlfB6rWAixt7vZQyhNwXkY1o5ei6gvCtmNiixjHBTWP/dpozYFDv0ZB
 c/IgnOkI1MYUB9++puN5RYgS6YKzeUJuEkOXbZwJBHzJ9XYD7AvrH69iz
 61/dFnhhXDA4V16Wq5moyQcNgg3nXa1ZEK9MFv23BcRrhGvEVKl2eEhs3
 FJwAWN2hyCDR2ZmIBKYS8FREPgx4+KKSUoQOwbaT4s9auiUmSodAM6+K8
 BI+nsTs/45LM10lQ/3rjcQW4b2knzvZjouIFTH/kY18XLmnd9VX7RZ6kD
 RoTjkMJCfTvFBdhUBuZ5Cg8pL7RDAxlM4L2hS/x4HNUM6CNGvoI6e0V76 A==;
X-CSE-ConnectionGUID: G6V3/p1RRcyUQ7Cst1ZeTg==
X-CSE-MsgGUID: I/WZNXXqQzKn7cVmhvktXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44814746"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44814746"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:10:56 -0800
X-CSE-ConnectionGUID: S3eQXqSqTzi7Sq0p9hXELg==
X-CSE-MsgGUID: iZUbd5sLRcmVE16ErLfGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133309498"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:10:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:10:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:10:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:10:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzcbZYizUx40k2KbwDON/GcC5y6VV3FRF9/8JzIzj/BYm3PhEls/j6+q00tkeMlMRY+33n7Y1L5BsvYhYeqRWmYuuCmHQ8LGZ7Lr5RRcFC4imDumJKwdN5JcxuynDYWnshV/ml/ICi4F3dgZsw7jK1BglxMJsMbQAzr5JEq3QvljQQFz5SSx30VF/bpilOs2bMt/dJ4C25Lp5vSKFOk1POCtj5apBG1C7fKRXqBbvx5kzUJzkOefCBruZyT9xOFZ6efeOpDqHfxrZvsZo5alH9FGZpT7oYdU+VlWOl+LUMupXg9vwDo6SD6Bf6p7arM7fvXoaUTKZZCOfF5KD8K3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3BecIxvgNjJCkgZTSnDuHJMw2jcZHKHjAsXmfr1I3Q=;
 b=fANHkpMU2eVxBw/XFztS3+hpv7Zdq+oDqVBx6usRQQ/TUiffe/Q9N6vPh8RIMJ9cDnzPDb/4TdQGVi/bOx5sQKzNp5Rr7fZXPsE4DJV2w34iCajCRgzLesJMnBnG9qnWpqw/FCxm5oJZQRDiWTBtZuKH+5frbdjGqVa8GAY9Ok2kLweMhq+jSHVuYh3rdVMibzAkANZjAibOuuVdzbUjfF5ShYwjp11MnlJLe3Ozc9DrdWEw6kkyWo7asH4LQKme6bcwyqMQA3v1b8hU80ptcYIZ7oIB8Fh78QFAb50t79NU4+tLGa2DUeitu3Y28Pf4KPsdlFOqic+mag2sAyoW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 19:10:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:10:52 +0000
Date: Wed, 11 Dec 2024 11:11:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 16/29] drm/xe: Add migrate layer functions for SVM
 support
Message-ID: <Z1nj5lI33ihdlv6L@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-17-matthew.brost@intel.com>
 <ffaf905b4c8b6c408e036ea69dd7cbb51735619b.camel@linux.intel.com>
 <Zz0ab2pm5epu++Z3@lstrano-desk.jf.intel.com>
 <240db5a176901eaa08a869c20415476c21c95ae7.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <240db5a176901eaa08a869c20415476c21c95ae7.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: d53a59a2-2bb4-4f15-f248-08dd1a1787b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?56KrUKOMTBBe7dlLz4FsaiQpPlk0FVNWX3h5dojMQPbuF13bDGKvlswWiT?=
 =?iso-8859-1?Q?akk8UDC/dk5mtF/fBq55cgu2/HDnZSVlCe9Ipk+kjmBwbBB8I81bFD//ny?=
 =?iso-8859-1?Q?yf+XS2UpAXKMfjw8hTLBWS2I+FcpPLbQLN3OnRhmumCADC5/Z/TCoCUW1I?=
 =?iso-8859-1?Q?q9MB+4WrahyBN0fzvzlNet1zAJoz6I/CEQEWOZ86FWv1+N88j/H9+wQ0xa?=
 =?iso-8859-1?Q?S7hVUajgxyqaZXHRUdYczeDrLgfxgy/IH24FQaYUJQWZmZkJxV7Mij1qN8?=
 =?iso-8859-1?Q?dkHktxKuHtxTEs9MNHq0R/8oANp1yHC6EbFbDZICP+J58Rf26Oj7UyYq3c?=
 =?iso-8859-1?Q?u7yJSoJqiDLqbGoEJDHCxgDA2CtYdR71zjCfVdpTalB9TMT6vsvXrKG7zg?=
 =?iso-8859-1?Q?FBI3AUuMilBGPODKqXvFfxe5pKAQXzXq1oc8ukIdyp/tkZtDWrTlAq/Z7P?=
 =?iso-8859-1?Q?6jA6zfNqARY3sj2WvquwwDoZ3L/zm4w7SrXas9PSOdbW4M3qWdfOkEXhwo?=
 =?iso-8859-1?Q?b/nQDzEnkyGxP0S4tj5QwTak23PcGFDSLV0b/qmJmYVN2lSF4f8odN3Fu6?=
 =?iso-8859-1?Q?loJjjYZAnzAN0LRVIpHpba6FTGXopKyfMjG2vsyMRaqudNdRt/I5beDzdn?=
 =?iso-8859-1?Q?q60tCiRcfVFFKdRYdbAvg89uNjK7Vnmpg1jrUjFPCKgLB4zQL81F1fdOGq?=
 =?iso-8859-1?Q?3fAYSVQamN1b7Dh6mZ9Ruif1z37vweA1xp+q4w2nvU/dApE9tyVSLRZIXI?=
 =?iso-8859-1?Q?34/2edbzWVYRraY09ICg1RRpbtfWCrJN+7g/jypuo2U6TTh+nPFp0Qff6M?=
 =?iso-8859-1?Q?0nOjkqIA+uRLg5vJ/gneraHbcsreK74OPVTPLn6s0Y2OynRO2fAl9EM98/?=
 =?iso-8859-1?Q?k3zkgivDXOlpC5mO4MPkasthgfszOY02LX9w0cDedHZJDyr6pn2fFER7fB?=
 =?iso-8859-1?Q?Cvr4Ww/Smt57Il90+0p3yd4oIXIumHkFxR5vOj+boTuZbv5Jk005+8geqe?=
 =?iso-8859-1?Q?0eVtn6p6ntrJex+za6n6BKFKeG+RYmIsieMpS8Mi0VeWxkHqRnhN51PlL0?=
 =?iso-8859-1?Q?wPXU75zTHv1a/Iq6Om8AtSoe0c+ZbERRpM9ZeUikeCiKYMLZHtSsFJDx4U?=
 =?iso-8859-1?Q?zM+lNf8ynVbILESoFNCTJU2jAq1pf5NOjn02hdBW711az9cgja2UQFtr/k?=
 =?iso-8859-1?Q?8cNG1sYWlM/iAnVm4vOb9VeDzDOvCizfIM4IVoROCsBs2prgPKffc6LW/a?=
 =?iso-8859-1?Q?Cut9jTsr6n7pwhgSqlfJewSpanYmf3ORTZ6OIeLRAZZymTWOx+jsKm0pwz?=
 =?iso-8859-1?Q?vsyebPDTKbsqzAo0De8cMUpu3TjPbhJAjQbyKLgVe/CcePvsfRZ5nvLc7I?=
 =?iso-8859-1?Q?tDp9WhtwDU5PLbzeX3Qw5QCv4rP5Tgmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NEafLeMCKTv0SSN4X8Jhz4aFAbrkRlNGAOXum6LbSShLeBTHEPOqZPAs+7?=
 =?iso-8859-1?Q?XEvxCqZQq+bfQrBvt8dMrTCqPcYOvbS0DnAR4+HWA4kRvD0bBUoranA4+S?=
 =?iso-8859-1?Q?sOz6EeiWCOnchEtxp39cmL+tZejAX6ruvFFqJkYl/K9YazAj/uMVKqX37z?=
 =?iso-8859-1?Q?J2lyFDFyAX8ZvmETcRub5es7CImViUlZZlINmZZdCNUgRAZnlPwdvKBCrq?=
 =?iso-8859-1?Q?RSMjf/tffotODqaPLjOkmegH8RXVX/grTJ98i7CoEt7YF1ErNADPXrejZo?=
 =?iso-8859-1?Q?wbDjjCD1Ig2liT0H3jfcA2f6ECGYPW0RhUe2gXH42pkNxlgv5/rC/UNMN9?=
 =?iso-8859-1?Q?wqUti+nz/77YqcdrmMZBQbkR7BR4KUkj+eRdaUtw1pwKSf+mXJZr9B2Nac?=
 =?iso-8859-1?Q?bZmKcOiS54wu6vH+vwraiuPiqQ9nCRuT/Htl8ojQyEm4t5k8kJjkcQscyb?=
 =?iso-8859-1?Q?9qBwTqOlL+ucL1upKsfTj9QOXg+zuRMJ6akoKO1h1RqqP84aw18CvfUGjs?=
 =?iso-8859-1?Q?53QOHhdEhwWDkHt+VMO9zwLbEv34nzZV+wO5cWIeu5SAKHfAT8Bo2kP4Nj?=
 =?iso-8859-1?Q?LZaERjvwK7si5sVV2ep0EnmjkJV5/g1Mu8wPD3hzxdYg1oUrmZPS+xVrEj?=
 =?iso-8859-1?Q?sATCP13SCRql2UKvI8HqKruMvXb1crLC2nvB5zaF/w/FNXoFYSdq9FCPWR?=
 =?iso-8859-1?Q?cuuNVWR7zWFpM9vJmmctx2Q5yUojrkjpDOu7CRYF634a66TYj3b7lA6VRB?=
 =?iso-8859-1?Q?sk4HjCwHC/pzREnxsxK2YsC4wUg7z2/3EstU1iI8gV9l0K1U1F5m93tIQA?=
 =?iso-8859-1?Q?/gBHRFijkd+9FcKim9A1YytVizM2AZBk1VYt+iLgqwtHWHuwqIQZmQ+NoI?=
 =?iso-8859-1?Q?ifRpHRnp9CB+kbpqHCo+Hge3jHQMrkaJOdDWUIS5adQEEwZ/8HR/39a7P0?=
 =?iso-8859-1?Q?tDR+NL0CbUrfPFoKMI5Nj39U2m++H+IP/ZpMREogqDicF7Umw1R1z3xip6?=
 =?iso-8859-1?Q?xB46oLaIHmSyxC7OFmBhUwgdCXOGD2p0hKGy0QXaGS42B3FYtfX76JHW1q?=
 =?iso-8859-1?Q?XkkycgeuJ2LwmoW6Lr0XIzGDukEgpad2QwKNnrYtjzn9ApxAQ0x/pMOnFL?=
 =?iso-8859-1?Q?p/oBnmQ13lma4HvgO9DTzqi1s3iTdMZKGR/j9gX2nHo0clh4jnFYOWw6in?=
 =?iso-8859-1?Q?KPGcqnQlW7+/mZN3t6EwXAG1KVQX3icLzgjaewpZwtz+Hn2vejXsiBvHYa?=
 =?iso-8859-1?Q?Ep13q+sNZezjvxEGI92xMdO/G0TpA7tpnnAodG2NwZjjKeOVlFJIacGjXX?=
 =?iso-8859-1?Q?eDsppYUlwuxWvxKosyFsmFYMifkUP55HjsxYRvlbjJcv5SISxp+br7xlio?=
 =?iso-8859-1?Q?nzbSRrJkmzMpICPUdMOtkTYaPQAdhyj9d1RvfGZBN3WP6UMAV1eroMc2PS?=
 =?iso-8859-1?Q?zjIQHIle2vE34HV+ggUk58bJYUvng5kxXIev9G+EJx0CeuBL+tQ+h6Oupj?=
 =?iso-8859-1?Q?wUjHXrVSNmNp7bVhYOHhTYe4mVEunO/j1IzVIyY5sOwgEuJwuT6lJpZ7Ro?=
 =?iso-8859-1?Q?e/XrSvDCB+4eBTFIMvKaA/bdp372urKON/lsXzhOZlhXJAuxRCPIEdkMnA?=
 =?iso-8859-1?Q?/Y02rTE5TeORqu5EHm8MwWFhVDA+n7V27YCWeiRB21kjJhW8eFb1GZ4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d53a59a2-2bb4-4f15-f248-08dd1a1787b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:10:52.2425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pckF0LQhpRsD+eact2DT7GKOVsGQl+Xfljd/qwYhpwqDW5KmegsV4QDhYQndkQFPfvEn9uw1XhQuEowsk31lMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
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

On Wed, Nov 20, 2024 at 09:04:20AM +0100, Thomas Hellström wrote:
> On Tue, 2024-11-19 at 15:08 -0800, Matthew Brost wrote:
> > On Tue, Nov 19, 2024 at 05:45:27PM +0100, Thomas Hellström wrote:
> > > On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > > > Add functions which migrate to / from VRAM accepting a single DPA
> > > > argument (VRAM) and array of dma addresses (SRAM).
> > > > 
> > > > v2:
> > > >  - Don't unlock job_mutex in error path of xe_migrate_vram
> > > > 
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_migrate.c | 149
> > > > ++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_migrate.h |  10 +++
> > > >  2 files changed, 159 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index cfd31ae49cc1..d7b6636286ae 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -1542,6 +1542,155 @@ void xe_migrate_wait(struct xe_migrate
> > > > *m)
> > > >  		dma_fence_wait(m->fence, false);
> > > >  }
> > > >  
> > > > +static u32 pte_update_cmd_size(u64 size)
> > > > +{
> > > > +	u32 dword;
> > > 
> > > dwords or num_dword?
> > > 
> > 
> > num_dword
> > 
> > > > +	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > +
> > > > +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> > > > +	/*
> > > > +	 * MI_STORE_DATA_IMM command is used to update page
> > > > table.
> > > > Each
> > > > +	 * instruction can update maximumly 0x1ff pte entries.
> > > > To
> > > > update
> > > > +	 * n (n <= 0x1ff) pte entries, we need:
> > > > +	 * 1 dword for the MI_STORE_DATA_IMM command header
> > > > (opcode
> > > > etc)
> > > > +	 * 2 dword for the page table's physical location
> > > > +	 * 2*n dword for value of pte to fill (each pte entry is
> > > > 2
> > > > dwords)
> > > > +	 */
> > > > +	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> > > > +	dword += entries * 2;
> > > > +
> > > > +	return dword;
> > > > +}
> > > > +
> > > > +static void build_pt_update_batch_sram(struct xe_migrate *m,
> > > > +				       struct xe_bb *bb, u32
> > > > pt_offset,
> > > > +				       dma_addr_t *sram_addr,
> > > > u32
> > > > size)
> > > > +{
> > > > +	u16 pat_index = tile_to_xe(m->tile)-
> > > > >pat.idx[XE_CACHE_WB];
> > > > +	u32 ptes;
> > > > +	int i = 0;
> > > > +
> > > > +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > +	while (ptes) {
> > > > +		u32 chunk = min(0x1ffU, ptes);
> > > > +
> > > > +		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > > > MI_SDI_NUM_QW(chunk);
> > > > +		bb->cs[bb->len++] = pt_offset;
> > > > +		bb->cs[bb->len++] = 0;
> > > > +
> > > > +		pt_offset += chunk * 8;
> > > > +		ptes -= chunk;
> > > > +
> > > > +		while (chunk--) {
> > > > +			u64 addr = sram_addr[i++] & PAGE_MASK;
> > > > +
> > > > +			xe_tile_assert(m->tile, addr);
> > > > +			addr = m->q->vm->pt_ops-
> > > > >pte_encode_addr(m-
> > > > > tile->xe,
> > > > +								
> > > > addr, pat_index,
> > > > +								
> > > > 0,
> > > > false, 0);
> > > > +			bb->cs[bb->len++] = lower_32_bits(addr);
> > > > +			bb->cs[bb->len++] = upper_32_bits(addr);
> > > > +		}
> > > > +	}
> > > > +}
> > > > +
> > > > +enum xe_migrate_copy_dir {
> > > > +	XE_MIGRATE_COPY_TO_VRAM,
> > > > +	XE_MIGRATE_COPY_TO_SRAM,
> > > > +};
> > > > +
> > > > +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > > > +					 unsigned long npages,
> > > > +					 dma_addr_t *sram_addr,
> > > > u64
> > > > vram_addr,
> > > > +					 const enum
> > > > xe_migrate_copy_dir dir)
> > > > +{
> > > > +	struct xe_gt *gt = m->tile->primary_gt;
> > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > +	struct dma_fence *fence = NULL;
> > > > +	u32 batch_size = 2;
> > > > +	u64 src_L0_ofs, dst_L0_ofs;
> > > > +	u64 round_update_size;
> > > > +	struct xe_sched_job *job;
> > > > +	struct xe_bb *bb;
> > > > +	u32 update_idx, pt_slot = 0;
> > > > +	int err;
> > > > +
> > > > +	round_update_size = min_t(u64, npages * PAGE_SIZE,
> > > > +				  MAX_PREEMPTDISABLE_TRANSFER);
> > > 
> > > Hm. How does the caller know how many pages were actually migrated?
> > > 
> > 
> > This is an intermediate between migrate_vma_setup and
> > migrate_vma_pages/finalize. The number of pages here is based on mpfn
> > returned from migrate_vma_setup. The migration for individual pages
> > may
> > still be aborted in migrate_vma_pages/finalize. In this case both the
> > old and new page have the same data, dso migrate_vma_pages/finalize
> > can
> > pick either page.
> 
> I might be misunderstanding, but I meant if npages is, for example,
> which is 16MiB of data, but the above min_t reduces that to 8MiB of
> data. How would the caller know?
> 

Oh, yea - that is broken - it kinda assumes a chunk is 8M or less. I had
some local patches which fixed this function to do a loop, will pull
those into the next rev to future proof this.

Matt

> 
> /Thomas
> 
