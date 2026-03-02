Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIKdNcHhpWkvHgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:15:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352971DEB77
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1367310E58F;
	Mon,  2 Mar 2026 19:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vo0dFG09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9865410E58F;
 Mon,  2 Mar 2026 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772478895; x=1804014895;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dX64xCDni9BxIuiXHi9D5m4zlQ25Dy0MGQn9DG/gUvE=;
 b=Vo0dFG09LaElreMI3MoOkeK8vCdI7CeIz5zPP1ScGnFSfaasvdmUWId7
 MmmbZcyW3/n/BSjHPaZLN6NCFLx/HJ/BjvIP9T7FEw5J1tBouP4lHF4FX
 Y1P52VSSSNl4YLjbj67akeEJpZnMRuIPrsJo0067kVqL5JAFvQh9jWoRh
 2pE/dJDCAXn6YM+ruFq+X2FcC6/x52OJflyVRRStEXIYTbolQEMQnYsIQ
 CugQRoSMMuDBnz4/N6gvmCZIzabNwtiQmk2ICizk3AvJy04niTqUJn7kQ
 NgZInkaQaP6+uUsFAMF92uOuWC/Yedk0maH76QNcmtn/Jl5qoCjf07fTk w==;
X-CSE-ConnectionGUID: v9wm9N19TceTe6X/rjtcUA==
X-CSE-MsgGUID: h5FOm2u+SHCus428nICOIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84590975"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84590975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:14:55 -0800
X-CSE-ConnectionGUID: DROpARuARaiZvfDgtC0Ylg==
X-CSE-MsgGUID: v+5fkkbLTnqb3xNCZW4qfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="220792858"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:14:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:14:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 11:14:54 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZ1o/hFwKHytvQxKNCVvltL+SeKzQbb2Tz/WTqny9j8/U5uVD2H+TJVMcFjo0vUk7tTqs3cnuWoM1iposr2nEVqZLJ4uHOfxy/tJI/1TQj4NgP4zVl8G54qq4Ygj+DxI+QugNmQDpUD7v7TQG+QnTVERIV94zYBtcgrCmKvwTO1aq4/vnifJvfo/oFDJTF8SmSEoMUQwXGTfXICX6EBM8WuRrxT1eH/cp5Ru7udx4zgcIWifI7mO6968Wb4IXZ4oCkyXxv1b6ilDfqqhVRNLnxj7Eu1B2Qned5GxJwVngixJYrcajCSu2HFYnKodQfcPZQEcM4OzeurYh9MFM64g7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKMknhum+LPGTk39kFm1AZUFOoeOjm/mfEVR65E8Tb0=;
 b=XcVnWOvCEPsm6VMG7ltE8JkhZVIcEBVbKbc6cq77Uo3Eoda+LpIJ5OG5EBsKgYWITJT6axKIze/BCWI8QeHwrBsMpGEUNEwsqj+/TTQsRE2EcWVR6I/i31iM8eE2zztB9bKZJXx13xJEB3gab6YMn/CTxMtiZuZ96MZSVyAMSkcYZ2E9AffIud7KT6H0dMqBS6vyrROuhIIkf9hmP2OMNGYrz/BnhF8ixBcIbDXxwNjFfHIpIdwhW7JHjQau8yRBWZRXsnPFkiGSp6tymyM4DU6ZGXwYdv9Sw89T54HiVflBQFRaDIwVUpexjgt4W8P+AHxndStiWFwKalKNnbuIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 19:14:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:14:51 +0000
Date: Mon, 2 Mar 2026 11:14:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] drm/xe/userptr: Defer Waiting for TLB
 invalidation to the second pass if possible
Message-ID: <aaXhp1EhwE275kla@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302163248.105454-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ede159-a526-4060-1675-08de788ffa1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: 8o+UlHIyFJaAu7fe/itxUzg3HYFZPfk62rQZQDxkESJLiL7gMEdjEl7AdeSiQiiVQY9oUBVWpI57cJkkTDM/Q/VtpTL1JMeOKuLDP9Ar5nqyzmxvg9nQv4qXVwcnTQbtohGuJ04wSWfzxcztBZUU3aylzNLQMch7nq6AZl9DVnAhgsgmqLTdRvC06RPPv9WrEAuAffhfLU8U5L13DZFWYSUZ1wsAXJPJDdEPPA/E0KrhFwoOenJi1eX6nemZTdVMKU8KUgli/g00Aiz+o+MZhBlNvbuZ8tJJswkqCWJh1TBz69HVC20cvC8Y+2/qf4IlpUoWBm2yJayB6e3lsNKBp149c1Vi5zQ77a9zuVo35ZreTWXWaQU39GrMG6oU9YFg6D4jPoeCii8dfORVyedy/CE5nyAu7YHJfhliRDAgbZhFO2SwBiJvSjZhqZrK5j3pOaoxOrMw4ZfhyVk0expwCqUnqXjR827fNSussZXRWhEs/4TH5ZhDqn+sPjhf9VeJKx1904clpUs+yztL34eZLpcYzUIE9AoRotJpu0bGH9KxfN513ZzrU8C5e6zC/70SveaiRjQ2z//Gh6DLBr7RQ3afa4l/S/tHl3jHwjhJ8bYmi9NtM3LiLLviZQb16bFgpYNpvGcY9N+elft5NDtjaufrDTR52VwH57O/REAeUfncrojjAdqr66E+gofl5ZuHSo4phPqBiqjEGin7IWc5C22Hgrt6cnA0bascJySw1Ts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G8fReJ5n3sW6xgluoqBD+B57xBnTxtyGkSDAycz0+eB4zbXdGq6VLrsav3?=
 =?iso-8859-1?Q?XRGWe55Fc8ZWCk7t8/Hxz0/mLZPQInpbVDhSD34Y5JtoM4gfmIb7PACKrq?=
 =?iso-8859-1?Q?sCtbqijvshGgKEaUR/ovw5rNgnW/LBBWVEeJSpbLnoSJoVjY4aJerwpmmk?=
 =?iso-8859-1?Q?1vhPeV5QN6fuHqU4qJXWIAZe341SjjRLmx2DqmMULAiv55I/jo4MXXEIup?=
 =?iso-8859-1?Q?UcLJtXkngufsymPUXhuoyAgehr5Z40f3Kt1vii9uhKmifqnbyfrR2Re+9W?=
 =?iso-8859-1?Q?uU6h94nPcQr5dIqnnKEqqJ6vw4OWeX/QjcvcpvbJmgdzMZOsx4z7g0d48T?=
 =?iso-8859-1?Q?o5LNdpTIqVudOGh2nA0HhbyQRxvOmvYvyKc3k6vRlLFXbc9WhlELUTLm11?=
 =?iso-8859-1?Q?kj3RAfz8s7IcEoKhwHwtGt3Gni5O2TLjTRz5KQSr5BdI7et965SIKadSIK?=
 =?iso-8859-1?Q?NqywbuhU2Vs/2+A3I5YMGlvContIrhRJMC3bYfA3VbgaLjbH9Ry5g0o0ui?=
 =?iso-8859-1?Q?R0DdA+Ar4fno5EdI9Yi29Z+6/oYXRB9onjfPicHKd6nOQNwGUFWJkz/8Su?=
 =?iso-8859-1?Q?QC0VEOUZG5a2TkR0WsAjgVWugpBgGVNwD2i/Tfct+0fpIr9ARPJwd8gZSK?=
 =?iso-8859-1?Q?NcykUHgd8MefcLSFgTGOHyge6nnRk4In2gC7ha11s5FHKeSohXrldSDAUf?=
 =?iso-8859-1?Q?35omzYs/Y8iiEuFrnoftW1VnBtc80vB6ztvMeRh5FKHlL0abq/SK6E9J1D?=
 =?iso-8859-1?Q?02jARXwCfg06oNbonHJ0DngQkyI10Wa23nHaYl1uUxRI6e1i/O2V+8VDAD?=
 =?iso-8859-1?Q?Q/NJ4rX3a+U84XybSU8NSqUyhQjx874z2Md5B2gHCBvL+fgaWxk+E44/Ju?=
 =?iso-8859-1?Q?NxZOSX0qMPPbhvyiGtIVmiN3RCGAbMg/hW9ojFQqDwdikSKeVVEa5db3vc?=
 =?iso-8859-1?Q?MdwZXuGC3F3i7PGGSnCCaVURDFT/0GU9VvKvgvAkHD6VTyN2kULAx2rdmi?=
 =?iso-8859-1?Q?31yCN+O2K8B1DfeOzjKqwV2iIR0THHgBxyEJNBGdwJjlvXmZN87NmAfdEi?=
 =?iso-8859-1?Q?F/1OgTZBkn56mHqNJOvyK9Z/X3X9LQqNgACf+SMsSfkfeV5ebjS9a1oG51?=
 =?iso-8859-1?Q?UykKnZXQ/R0Zz5wxOKC665ZlisPTH5OK8KoZ7BcYk2JHnf3VoxQUOG9HQF?=
 =?iso-8859-1?Q?d3JZT8SPIPzg8rgw+jgWOMZCYaYg8Q2dKeR6j0pxP3bwIRgZvRHgHb+gFE?=
 =?iso-8859-1?Q?x5emoysUzStpO9PUnQEFH9TlGbhZm6bajCsvOQkzdsNEYaJfQN86cf8ob9?=
 =?iso-8859-1?Q?BG3VLcTgnFSMuSTMibufFtKExISAIlkzwnlafnjdU5I6R9ml7dCCmmbzsU?=
 =?iso-8859-1?Q?Zb7jzi3IBjW6QuRtMGAl9WWhBO8YP0TKwh+yT2wScLAaCEC683ibiUIrHk?=
 =?iso-8859-1?Q?9L0XOUN51CfSurIlsoK/fVzhZQ7QrK6LP9NdIymh4sTxKUDKFGv2t5IEJW?=
 =?iso-8859-1?Q?j1hHn9jUyvAVHxNQtG+Vz19mH/qtkFeFT70/QStED7UFCBl5ZdNaui15mq?=
 =?iso-8859-1?Q?ALwQZBEGriwfZfJTx7aS6VXzl6dKbWVePsB7rryo8blR8P9mqGkoEHRcQ7?=
 =?iso-8859-1?Q?8oIn78tT1xKAhLiQMGTPEWVe+Uy+Vm0eCfnFuomssjgW4iBT3IgU4uH2sZ?=
 =?iso-8859-1?Q?dKEglVtUZFcWxqeLK/jrGbXISM+/fLYgkLEMeXIb8c2F9Le2V+w7SeYz00?=
 =?iso-8859-1?Q?EFSoi/u9zHDQz/D6dK2Y6OjPBnR8WWo0DF7KyZl4KEsbgTZjq9X/kiSx8a?=
 =?iso-8859-1?Q?/tyIaCfTP2w7ZpTj3tfVXBthiFt62MY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ede159-a526-4060-1675-08de788ffa1f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:14:50.8978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0l9zHHvUz4NBz8nrd7br34JCNhYOCA3cVR/kC5WODTgk8+Zs8dY+zmWTAhR42FDI+wkE0WIqJogctvXhJyDKvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
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
X-Rspamd-Queue-Id: 352971DEB77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:32:48PM +0100, Thomas Hellström wrote:
> Now that the two-pass notifier flow uses xe_vma_userptr_do_inval() for
> the fence-wait + TLB-invalidate work, extend it to support a further
> deferred TLB wait:
> 
> - xe_vma_userptr_do_inval(): when the embedded finish handle is free,
>   submit the TLB invalidation asynchronously (xe_vm_invalidate_vma_submit)
>   and return &userptr->finish so the mmu_notifier core schedules a third
>   pass.  When the handle is occupied by a concurrent invalidation, fall
>   back to the synchronous xe_vm_invalidate_vma() path.
> 
> - xe_vma_userptr_complete_tlb_inval(): new helper called from
>   invalidate_finish when tlb_inval_submitted is set.  Waits for the
>   previously submitted batch and unmaps the gpusvm pages.
> 
> xe_vma_userptr_invalidate_finish() dispatches between the two helpers
> via tlb_inval_submitted, making the three possible flows explicit:
> 
>   pass1 (fences pending)  -> invalidate_finish -> do_inval (sync TLB)
>   pass1 (fences done)     -> do_inval -> invalidate_finish
>                           -> complete_tlb_inval (deferred TLB)
>   pass1 (finish occupied) -> do_inval (sync TLB, inline)
> 
> In multi-GPU scenarios this allows TLB flushes to be submitted on all
> GPUs in one pass before any of them are waited on.
> 
> Also adds xe_vm_invalidate_vma_submit() which submits the TLB range
> invalidation without blocking, populating a xe_tlb_inval_batch that
> the caller waits on separately.
> 

As suggested in patch #2, maybe squash this into patch #2 as some of
patch #2 is immediately tweaked / rewritten here. 

A couple nits.

> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_userptr.c | 60 +++++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_userptr.h | 18 ++++++++++
>  drivers/gpu/drm/xe/xe_vm.c      | 38 ++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.h      |  2 ++
>  4 files changed, 99 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 440b0a79d16f..a62b796afb93 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/mm.h>
>  
> +#include "xe_tlb_inval.h"
>  #include "xe_trace_bo.h"
>  
>  /**
> @@ -73,8 +74,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  				    &ctx);
>  }
>  
> -static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma,
> -				    bool is_deferred)
> +static struct mmu_interval_notifier_finish *
> +xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_deferred)
>  {
>  	struct xe_userptr *userptr = &uvma->userptr;
>  	struct xe_vma *vma = &uvma->vma;
> @@ -84,12 +85,23 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
>  	};
>  	long err;
>  
> -	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> -				    DMA_RESV_USAGE_BOOKKEEP,
> +	err = dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
>  				    false, MAX_SCHEDULE_TIMEOUT);

Unrelated.

>  	XE_WARN_ON(err <= 0);
>  
>  	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +		if (!userptr->finish_inuse) {

Since this is state machiney - should we have asserts on state? That
typically the approach I take when I write stae machiney code. Self
documenting plus immediatelt catches misuse.

So here an example would be:

xe_assert(.., !userptr->tlb_inval_submitted);
 
> +			/*
> +			 * Defer the TLB wait to an extra pass so the caller
> +			 * can pipeline TLB flushes across GPUs before waiting
> +			 * on any of them.
> +			 */
> +			userptr->finish_inuse = true;
> +			userptr->tlb_inval_submitted = true;
> +			err = xe_vm_invalidate_vma_submit(vma, &userptr->inval_batch);
> +			XE_WARN_ON(err);
> +			return &userptr->finish;
> +		}
>  		err = xe_vm_invalidate_vma(vma);
>  		XE_WARN_ON(err);
>  	}
> @@ -98,6 +110,24 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
>  		userptr->finish_inuse = false;
>  	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
>  			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
> +	return NULL;
> +}
> +
> +static void
> +xe_vma_userptr_complete_tlb_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	struct drm_gpusvm_ctx ctx = {
> +		.in_notifier = true,
> +		.read_only = xe_vma_read_only(vma),
> +	};
> +

xe_svm_assert_in_notifier();

State machine asserts could be:

xe_assert(..., userptr->tlb_inval_submitted);
xe_assert(..., userptr->finish_inuse);

> +	xe_tlb_inval_batch_wait(&userptr->inval_batch);
> +	userptr->tlb_inval_submitted = false;
> +	userptr->finish_inuse = false;
> +	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
>  }
>  
>  static struct mmu_interval_notifier_finish *
> @@ -141,13 +171,11 @@ xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct xe_userptr_vma *uvma)
>  	 * If it's already in use, or all fences are already signaled,
>  	 * proceed directly to invalidation without deferring.
>  	 */
> -	if (signaled || userptr->finish_inuse) {
> -		xe_vma_userptr_do_inval(vm, uvma, false);
> -		return NULL;
> -	}
> +	if (signaled || userptr->finish_inuse)
> +		return xe_vma_userptr_do_inval(vm, uvma, false);
>  
> +	/* Defer: the notifier core will call invalidate_finish once done. */
>  	userptr->finish_inuse = true;
> -

Unrelated.

>  	return &userptr->finish;
>  }
>  
> @@ -193,7 +221,15 @@ static void xe_vma_userptr_invalidate_finish(struct mmu_interval_notifier_finish
>  		xe_vma_start(vma), xe_vma_size(vma));
>  
>  	down_write(&vm->svm.gpusvm.notifier_lock);
> -	xe_vma_userptr_do_inval(vm, uvma, true);
> +	/*
> +	 * If a TLB invalidation was previously submitted (deferred from the
> +	 * synchronous pass1 fallback), wait for it and unmap pages.
> +	 * Otherwise, fences have now completed: invalidate the TLB and unmap.
> +	 */
> +	if (uvma->userptr.tlb_inval_submitted)
> +		xe_vma_userptr_complete_tlb_inval(vm, uvma);
> +	else
> +		xe_vma_userptr_do_inval(vm, uvma, true);
>  	up_write(&vm->svm.gpusvm.notifier_lock);
>  	trace_xe_vma_userptr_invalidate_complete(vma);
>  }
> @@ -231,7 +267,9 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>  
>  	finish = xe_vma_userptr_invalidate_pass1(vm, uvma);
>  	if (finish)
> -		xe_vma_userptr_do_inval(vm, uvma, true);
> +		finish = xe_vma_userptr_do_inval(vm, uvma, true);
> +	if (finish)
> +		xe_vma_userptr_complete_tlb_inval(vm, uvma);
>  }
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
> index 4f42db61fd62..7477009651c2 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -14,6 +14,8 @@
>  
>  #include <drm/drm_gpusvm.h>
>  
> +#include "xe_tlb_inval_types.h"
> +
>  struct xe_vm;
>  struct xe_vma;
>  struct xe_userptr_vma;
> @@ -63,6 +65,15 @@ struct xe_userptr {
>  	 * Protected by @vm::svm.gpusvm.notifier_lock.
>  	 */
>  	struct mmu_interval_notifier_finish finish;
> +
> +	/**
> +	 * @inval_batch: TLB invalidation batch for deferred completion.
> +	 * Stores an in-flight TLB invalidation submitted during a two-pass
> +	 * notifier so the wait can be deferred to a subsequent pass, allowing
> +	 * multiple GPUs to be signalled before any of them are waited on.
> +	 * Protected by @vm::svm.gpusvm.notifier_lock.

In write mode?

> +	 */
> +	struct xe_tlb_inval_batch inval_batch;
>  	/**
>  	 * @finish_inuse: Whether @finish is currently in use by an in-progress
>  	 * two-pass invalidation.
> @@ -70,6 +81,13 @@ struct xe_userptr {
>  	 */
>  	bool finish_inuse;
>  
> +	/**
> +	 * @tlb_inval_submitted: Whether a TLB invalidation has been submitted
> +	 * via @inval_batch and is pending completion.  When set, the next pass
> +	 * must call xe_tlb_inval_batch_wait() before reusing @inval_batch.
> +	 * Protected by @vm::svm.gpusvm.notifier_lock.

In write mode?

Matt

> +	 */
> +	bool tlb_inval_submitted;
>  	/**
>  	 * @initial_bind: user pointer has been bound at least once.
>  	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7f29d2b2972d..fdad9329dfb4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3967,20 +3967,23 @@ void xe_vm_unlock(struct xe_vm *vm)
>  }
>  
>  /**
> - * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
> + * xe_vm_invalidate_vma_submit - Submit a job to invalidate GPU mappings for
> + * VMA.
>   * @vma: VMA to invalidate
> + * @batch: TLB invalidation batch to populate; caller must later call
> + *         xe_tlb_inval_batch_wait() on it to wait for completion
>   *
>   * Walks a list of page tables leaves which it memset the entries owned by this
> - * VMA to zero, invalidates the TLBs, and block until TLBs invalidation is
> - * complete.
> + * VMA to zero, invalidates the TLBs, but doesn't block waiting for TLB flush
> + * to complete, but instead populates @batch which can be waited on using
> + * xe_tlb_inval_batch_wait().
>   *
>   * Returns 0 for success, negative error code otherwise.
>   */
> -int xe_vm_invalidate_vma(struct xe_vma *vma)
> +int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_tlb_inval_batch _batch;
>  	struct xe_tile *tile;
>  	u8 tile_mask = 0;
>  	int ret = 0;
> @@ -4023,14 +4026,33 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  	ret = xe_tlb_inval_range_tilemask_submit(xe, xe_vma_vm(vma)->usm.asid,
>  						 xe_vma_start(vma), xe_vma_end(vma),
> -						 tile_mask, &_batch);
> +						 tile_mask, batch);
>  
>  	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>  	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> +	return ret;
> +}
> +
> +/**
> + * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
> + * @vma: VMA to invalidate
> + *
> + * Walks a list of page tables leaves which it memset the entries owned by this
> + * VMA to zero, invalidates the TLBs, and block until TLBs invalidation is
> + * complete.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_vm_invalidate_vma(struct xe_vma *vma)
> +{
> +	struct xe_tlb_inval_batch batch;
> +	int ret;
>  
> -	if (!ret)
> -		xe_tlb_inval_batch_wait(&_batch);
> +	ret = xe_vm_invalidate_vma_submit(vma, &batch);
> +	if (ret)
> +		return ret;
>  
> +	xe_tlb_inval_batch_wait(&batch);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 62f4b6fec0bc..0bc7ed23eeae 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -242,6 +242,8 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
> +int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch);
> +
>  int xe_vm_validate_protected(struct xe_vm *vm);
>  
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> -- 
> 2.53.0
> 
