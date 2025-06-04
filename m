Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED80ACE240
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2BA10E768;
	Wed,  4 Jun 2025 16:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnCiDsER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546F610E768;
 Wed,  4 Jun 2025 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749054890; x=1780590890;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HGnuXc6xF0csZy3Gy+id5fcz+UsGP/KIIOY2gbHzgdw=;
 b=dnCiDsERavCiqzMOj3f7PEAVDMK+7PXkvTl0+49x6MS7+4hMjzaQnH/+
 LfFQYDVM9kbUIN7HayfB4EIBRdl7kmxVINvrGV+PKtIPd7mqcalx+P1j+
 zspl4vFpC8f1slGiyj7eKVXKQJauYYJYyPeiwJHm0xoDlXgANtUrPTLYa
 05GCnITvP4qcZUTcJYyezTJr1o3tnA7dS4aPArzfN7ZRVHFF5OSsERbMq
 JLDA+3H4N4owKljEonvY2ZDBlzxyQNVBCNFNn9M0EXXXdcePCZw5Xc4Pd
 5Z0AITmMJQrP7PjQSaIRPNdIgDsH5zeECx/MHrqGRijY5DplyCqulZQ9N w==;
X-CSE-ConnectionGUID: gyjp8f2+TDGdi0cJ+OlIXw==
X-CSE-MsgGUID: NeUIU5Q+SJaK7uZJNx0NuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="38781233"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="38781233"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:34:43 -0700
X-CSE-ConnectionGUID: aA4/PrdDSgyLUFZZGJF+Cw==
X-CSE-MsgGUID: MH+bC/1LSlac4CCxk66DPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="146218637"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:34:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 09:34:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 09:34:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.62) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 09:34:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNcaR4XBcAwJf9gLOY0H+wfP4I2wOep8PoTTvtejD28eFviXuuVzn3tq0ptip+JbABH8RRoJbNUn4BTQ/MufFeALNo5eAhn1F5oytnqgHDpz6WbO1aEBZo2UFkVzCxkMvB+sH1xnMpg+3eas0JnoqN4vUZmuscDGxOs0IdjH2M9lJwf8ieOkkyJCRjpecPWePn/sSIXTYTjIa4SToQYVsHcTe7p5Fsv4KhABkapULfMt+uxtWLkxsYnX05XO132dhZ9Std/lx06BEuoUf5db0sCsmAY+HR8zHzaWRsJv66wh2EVx91t/83i8EVDcOAMnBfPP9pEJ8GPWUb+sS6Rjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx/7Srr7XgNv/vdU/bNMqFI2db0hXqGJ4li0EvnJFH8=;
 b=b38gPiJsYdZyEiAHnz/3g6fVZAmAI8JSRrRQdzEIZAgJYth+fAYcXT+WAMn+Ec3INsYqpfSiFrRhzwHRXyWh7o7/0u+/HFVImwmH6+1QV3hLNlvYjjtHoDDO3iAbVKbnX8JP8Cte2d1hZMKzsh76ozw+s+kR39oLlxPu2KdlpmXM4eeGkyp40JhuTxHdyQMlhxcQ2i6YS+N1RDbWb4aAJQqg5MD1php5raI/XMA/hC8oVhcErYhl1H/D2QB+vDAZ5LBW7fk+Y+QzZ5BiNYrAM/KjSG0B9OeXlMS1a4qqaO24SJa4O8Agv2SJVxURMAyziVAaIwEw5t3MR7hl8ULzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB8830.namprd11.prod.outlook.com (2603:10b6:208:599::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 16:34:39 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 16:34:39 +0000
Date: Wed, 4 Jun 2025 19:34:32 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 3/4] drm/dp: Add an EDID quirk for the DPCD register
 access probe
Message-ID: <aEB1mEt9vnbS1bO3@ideak-desk>
References: <20250603121543.17842-4-imre.deak@intel.com>
 <20250603153627.33645-1-imre.deak@intel.com>
 <8e9b69d29d95d6d228fe04e40cdef9e30e5410f1@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e9b69d29d95d6d228fe04e40cdef9e30e5410f1@intel.com>
X-ClientProxiedBy: VI1P190CA0044.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7a9eb7-1b3c-4d68-256d-08dda385b349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OZBFdgSjqf4uxim8yOdKg03ZkX5DI2MvxadAF3epAW7hWJDM7bfNpkRg6x?=
 =?iso-8859-1?Q?ppPXAIUdXikJetTeVQ4DmrKN056hK5nVi17TH+bIa9SR/1BWlpGC3woZXT?=
 =?iso-8859-1?Q?Cz6MqEseDTFU+2VzH5A6+GYZW232Ln6k67AtylE9Q2Ryke2f91sHYs0cmX?=
 =?iso-8859-1?Q?39c4QCoXDX8iSFdV/wgOYfUkbdu0pr//0InmIQEFq6aAk0Bv3GUiWA2CoI?=
 =?iso-8859-1?Q?LxWmzk5YbESsOOqFZ/qhV0jaHo9SQyv1ikq27LAMhpIMYrx+jpO8qTUF0s?=
 =?iso-8859-1?Q?WZJlH9rxk2qltuGeq9jcW6VrTeBKY+05PfbQrH9mpy1oJFcXmxCVUwX9jb?=
 =?iso-8859-1?Q?OT4ngyt8w230L8lWrIgjlp2OTds1iXkv5KVBYPIJp3/1gfhBcWZNQpkqG9?=
 =?iso-8859-1?Q?EZMVuIGl+h7jzeo5xd8EKu7gK2LE3iKO94dxSzCH54EKVjtnEtXSgnqDCK?=
 =?iso-8859-1?Q?6K2s2co3Lc0WKzCkaubCLsG1jq45EA+0LbNvf4A/yrTojhUvE7Kj211cxC?=
 =?iso-8859-1?Q?jmTwri4WJ4UY6QJpCi9f1JZCQMeSsWhwsW/N4Cs+JnHdnIGa56Ww9KFcoe?=
 =?iso-8859-1?Q?8LTPuJVFA5JZrGJe+5m0mtwlwK/96GZBxttfCaBmWlFCZjf/EX6Lh9MBiA?=
 =?iso-8859-1?Q?t98btUF16MbH6R3EMONVOMcl8iEu+vBGYzMOZ1aybfUtvLGMjMKtpLPCZ8?=
 =?iso-8859-1?Q?CPUYqk8LgfRlj5onb3fppFNPiYMzQ2zLQbzbb7N6GeXQQFOKCYV7iCWUHM?=
 =?iso-8859-1?Q?Ni6H4opfSbrTqdwTPVqIVHwBei23deLKZV5EWR+vA88FksBhmHof+nOirx?=
 =?iso-8859-1?Q?vAbNAhwvHsNge71rOwjhtdBJmst/4eIo+/lIOzrzw1suWlNNeDarn5KW3g?=
 =?iso-8859-1?Q?ZWo7wZFRAN4yFvoOUFavt9XFi27S13nt9L6tqsSwv6CVIVGsTlKjcgQsry?=
 =?iso-8859-1?Q?gcY3qxHdyQHWBx+JQDc36SVUu+gMRFMmmiEe++hCDcIVUhnB//agTf9qPQ?=
 =?iso-8859-1?Q?KVj9w5ou7nol66/y+jZKs7UIuG19q6/E0YLTBK/VcC0qcItmxwNa+TDVDe?=
 =?iso-8859-1?Q?PTQxJDuBBHRbUSakbyX5wN5+5zgqXzNgtDRNdKADL/RLE3JJ+ZCIWh6xUB?=
 =?iso-8859-1?Q?hqOyHfBcoT0f9pcjRW8AGd6yn/uTXV6mi7sAkcdf0fvzVkfpQmSJkAW4fz?=
 =?iso-8859-1?Q?abazyMbC34acysG4Z0lems2GV02t3qAEzKTk3xCdlGtJY8rEHpdXZTWo1G?=
 =?iso-8859-1?Q?6iwMdFcV6xVCZP/HiBs2BPCHnU6j9cDdlSzPfopmR4qAaDV9BJb7kSFzRt?=
 =?iso-8859-1?Q?L4KWkDca8ksVyr+5r7oPbNX6IHcGVUdzIvJlh9y8nndaLMJ4f9wbkAuyzE?=
 =?iso-8859-1?Q?kRhesvlmTJf2fa9GZaTxlHXJQ+MyVCUTgO9+TXywGSP4kH2OuXIoX3RgLm?=
 =?iso-8859-1?Q?zON28Mc3OMuEpvOGMdn37WWP8JnM10dot8y2P92TT9RhmWuNPj7zlrans7?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?q71EW8V9yk4ViI/Zg92vG9qpt0SqUFsyZjxZkN3u0doGqdcHHAdDaEmBb5?=
 =?iso-8859-1?Q?5jC+nUu3rrO6qQp7BIwj5abMsAzZqPJbY6bmGM5kORXoSl936X23sKuUtP?=
 =?iso-8859-1?Q?eJsWT6gCLtALcLdUyH2T6vvDXm4Zh0GnjuqY3oMgk7UQCP7Uc5Gs6WlxQ3?=
 =?iso-8859-1?Q?n2b8Yl7uRhV/dCVWq75u/OKJnRsqrRB+bsNSKX5t7Qd0V6FvhwDyplKaQm?=
 =?iso-8859-1?Q?46l1WcsVJZ0Ta9Igh1Hog03xJKobmADH6efFpWFF1ThNxo21Ul4+U7AVGf?=
 =?iso-8859-1?Q?r/LymfcKP9sN1/h9/mLerbP/fWxFaTIIj3RF7yd69XKx3VbK3uIVAKRwVb?=
 =?iso-8859-1?Q?dQtDYZ5emRfubwI5HLoqo7rF4M59s8T5kVWYmLjtjF+Pu02dnFxo9ZPmnw?=
 =?iso-8859-1?Q?3jXMeze4wMrRosQ2PqSCubMsx3mx9EPrRHGFz5OGvfYvl6uLmZ2mH3hKQL?=
 =?iso-8859-1?Q?LX4dBMKHmzKa3/wDg6uuLNk0bFa//NF2RcSANzUQBjIC07CdTRyVn2DCrJ?=
 =?iso-8859-1?Q?Qyp5kLqq/np8BdQdI/vzbVcV3EeIRsk4NaJEZTO3IdXvyhSnj5LQs2JhlH?=
 =?iso-8859-1?Q?tRODQtkpU0NHcs8GmeZJtr+AGzwxlSTen/CSfVnuG89/J7i4Op1k9hgF5Y?=
 =?iso-8859-1?Q?CaStUseEjYFZdn27VnFX6g4vtB7Xv2eiv1ZEdirCqqpJibe+a0LhG6ukw0?=
 =?iso-8859-1?Q?Gwe2tWhvaJGtWthE770NcsdvfBSUEAjswWYcrmS4AwXvNo676s1N1tyhZR?=
 =?iso-8859-1?Q?kTxOiqeZ7qj3pv/M7UwlCaRIjx5Yc8CPKedv/FRNDTQRxkIKV0/WWxd0LX?=
 =?iso-8859-1?Q?REfKxdfws9PZoSjLK8kwb6snf79cezX/5JuLWZxAV+mVgQnQ7To4AD56cA?=
 =?iso-8859-1?Q?nLRaI0BDDdFp86wqN4xuxYbSLars2aDxACEVZUMWom8b3MAIdVN6KlX3c0?=
 =?iso-8859-1?Q?JchTpQpQS+Gg/1yHxhKm3iCcAOE8R8cFB/c61HgRuTvm1Jilr7H4cWgDVK?=
 =?iso-8859-1?Q?z+a4F3sGSwTDBs1d4bzvuKBoMs7bhNIoqa+UDE1VmkrR+4KhSu6Kj87Xc6?=
 =?iso-8859-1?Q?bDGmwRH1Jd4hMj2f82xHt1HYeS9sMejiQR9UF0QnXKYoP2ResaHRuRpsVV?=
 =?iso-8859-1?Q?XinnF5R/kT+T3iw0734/5CQRT59AGsfASPbgLLO8ypKCoC0dmJU2lJWfFc?=
 =?iso-8859-1?Q?ntlTs2GFO4L58Bb20/2EszA95me9OpV7TgYuX14Mrq0JiGJaRemNbCAFna?=
 =?iso-8859-1?Q?3mQ8BM+RjeUp37oC6TVSe6Pwps/OsFozMgxWfOnCIsvhxTpN7hDdqdaYDA?=
 =?iso-8859-1?Q?hVOaSdO5i8rwxA/usTqa4Nh8tXY4m4A336ItTXdbDOOundVXRpUePvY75A?=
 =?iso-8859-1?Q?GFR1vuzJZf+U2w/OeJQjF7p5w9EXpU0uGnelHBmCKDJSReZ5dPZfQ7sLmx?=
 =?iso-8859-1?Q?C8yNCRfbVjlGbdY//PkWf0nei7Oo7NhwrtOUvEl3vionB6erAMLkB6QcR7?=
 =?iso-8859-1?Q?zcSWXwW1+yO6F/X1+f1HzGXRP2CnLeFt0vKcDlo04LS5HdtU8UazF3yhV8?=
 =?iso-8859-1?Q?gSkeJ9HwmUuTnSj/KpXctdcWukUVvxT2l7CG4t+H0u+WINu6qqhYIB2glS?=
 =?iso-8859-1?Q?F0nBo7WMkqjsT5XLvjBZmMDeIpGU+saMvT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7a9eb7-1b3c-4d68-256d-08dda385b349
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 16:34:39.1706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNgJBB4Zbc/P5nLqddyqzTXSo8+ETQM+oYuza+Y0nIYF2X7JSYdZAz8EbB4ET7BywRRIReSixYkEYdxKYDFEoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8830
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

On Wed, Jun 04, 2025 at 01:11:08PM +0300, Jani Nikula wrote:
> On Tue, 03 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> > Reading DPCD registers has side-effects and some of these can cause a
> > problem for instance during link training. Based on this it's better to
> > avoid the probing quirk done before each DPCD register read, limiting
> > this to the monitor which requires it. Add an EDID quirk for this. Leave
> > the quirk enabled by default, allowing it to be disabled after the
> > monitor is detected.
> >
> > v2: Fix lockdep wrt. drm_dp_aux::hw_mutex when calling
> >     drm_dp_dpcd_set_probe_quirk() with a dependent lock already held.
> >
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 13 ++++++++++++-
> >  drivers/gpu/drm/drm_edid.c              |  3 +++
> >  include/drm/display/drm_dp_helper.h     |  6 ++++++
> >  include/drm/drm_edid.h                  |  3 ++-
> >  4 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index dc622c78db9d4..4dad677ac6ebe 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -691,6 +691,17 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
> >  }
> >  EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
> >  
> > +/**
> > + * drm_dp_dpcd_set_dpcd_probe_quirk() - Set whether a probing before DPCD access is done
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable the probing if required
> > + */
> > +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	WRITE_ONCE(aux->dpcd_probe_disabled, !enable);
> > +}
> > +EXPORT_SYMBOL(drm_dp_dpcd_set_probe_quirk);
> 
> We don't use this yet, which feels a bit odd.

It's used in the next driver patch and I wanted to keep the DRM core and
driver changes separate.

> > +
> >  /**
> >   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
> >   * @aux: DisplayPort AUX channel (SST or MST)
> > @@ -724,7 +735,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >  	 * We just have to do it before any DPCD access and hope that the
> >  	 * monitor doesn't power down exactly after the throw away read.
> >  	 */
> > -	if (!aux->is_remote) {
> > +	if (!aux->is_remote && !READ_ONCE(aux->dpcd_probe_disabled)) {
> 
> I think it would be worth it to add a small helper to decide whether to
> do a dpcd probe. It would include the ->is_remote check as well, and the
> big comment could be moved there, simplifying drm_dp_dpcd_read().

Ok, can do this.

> 
> >  		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> >  		if (ret < 0)
> >  			return ret;
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index e867315253493..9250b425ae230 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -255,6 +255,9 @@ static const struct edid_quirk {
> >  };
> >  
> >  static const struct edid_quirk global_edid_quirk_list[] = {
> > +	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. */
> > +	DRM_EDID_QUIRK(drm_edid_encode_panel_id('H', 'W', 'P', 0x2869), PANEL_NAME_ANY,
> > +		       BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),
> 
> So I think we should keep using EDID_QUIRK(), and maybe add
> EDID_QUIRK_NAME() companion to also assign a name != NULL, so we don't
> have to pass PANEL_NAME_ANY to all uses. Less verbose that way I think.

Imo one macro should accept a quirk matching any panel ID or any panel
name; but for now I can drop the change adding a way for that and use
EDID_QUIRK() here.

> 
> >  };
> >  
> >  /*
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index e4ca35143ff96..75fa9548aefa0 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -523,10 +523,16 @@ struct drm_dp_aux {
> >  	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
> >  	 */
> >  	bool no_zero_sized;
> > +
> > +	/**
> > +	 * @dpcd_probe_disabled: If probing before a DPCD access is disabled.
> > +	 */
> > +	bool dpcd_probe_disabled;
> 
> Is this a negative just so it's false by default?

Yes.

> 
> >  };
> >  
> >  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
> >  void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
> > +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable);
> >  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >  			 void *buffer, size_t size);
> >  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 3d8e168521c82..a878805c81d97 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -110,7 +110,8 @@ struct detailed_data_string {
> >  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
> >  
> >  enum drm_edid_quirk {
> > -	DRM_EDID_QUIRK_NONE,
> > +	/* Do a dummy read before DPCD accesses, to prevent corruption. */
> > +	DRM_EDID_QUIRK_DP_DPCD_PROBE,
> >  };
> >  
> >  struct detailed_data_monitor_range {
> 
> -- 
> Jani Nikula, Intel
