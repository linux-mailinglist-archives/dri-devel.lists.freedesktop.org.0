Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7592EE64
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 20:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E0810EB50;
	Thu, 11 Jul 2024 18:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGnHaKjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C425B10EB50;
 Thu, 11 Jul 2024 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720721370; x=1752257370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mF6IVmFmntlJIM8cr61HypkMQdd7oVUhDlW1nigk7OU=;
 b=IGnHaKjBS2HKchhzDP1dHYBI79ILzhKLIxHtEP/LBNsW/oNLIP8iM0HZ
 3R/o3wbd4nfN31euoMGm3cKiueLtAsX8SgZfHJgWEJYgG6TrbRK9LBrIH
 /Sqz3VoVeWwH9PLLZh4hI9wpurlrrVmZUV+X15Ao61VTr888un76Z7H6x
 ue0S8yZSK0s4PvalTBDMpnO6NtHygbfuo1jlcOayRmSQzrnjfJrpExx/v
 O6G90v4l/dqeLfPjI00i2rnk4N+lHBbxQYlk0UHVqf8D/D42y2UJcaQxL
 5ePpTvmd3cR60WJlEGni4AclUuCxjumTMoBMphF9xz2xSjYJQmvZHJJcS A==;
X-CSE-ConnectionGUID: yq3XTZGuQ6G9vLXbQeWORg==
X-CSE-MsgGUID: 9PVmEOIPRi6FHUuZWAwiAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18331613"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18331613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:09:29 -0700
X-CSE-ConnectionGUID: taBjW28tRjKrqpUkutdIcg==
X-CSE-MsgGUID: VlAKAUoKRXOuyB+kA43owg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48740855"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:09:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:09:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:09:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:09:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+wo4h0YaD9ZZVDl1CIwSEuSdW251q2qVCtUFEAdktaDQoW7h1JbnFGIzySXClqHBD8sKCFqcZtiuEGDjTdDxGSpzCayHaOAp0MSXlCmxVqEGZAx+oqXZ0LgUZD41Zbxscnn2jbMHS4usqTn/SRQFO5xMdippYU7AlkRwhsPANG3yup5Iw3hJcEdTXLSAkVtbmhtj1vwYIIJ7l97go9Ok7bpEHi0TcMxx1/JwSGGXszIoC3xORkxz6snS7RKowk2pyGJsAG4TGGnBkXyFCMDs9HDCbjdhrZh2FdK1NPA1onKZ6Ebl9y87OSIvdQkcM19jBr8PC/yJ5oQiJya38pUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpRC2D4MbiJpGVdtf6TMB6qImrDAYKGx51CAUVMzyGs=;
 b=OLi0KcPlP9TFxms3mKIZyICTgXdOftFQ+qwlm9yaX6RPkKnB9unAMsu+iA93Usr9774kvRuvbFe25eoL2PzGylINr5/43MSwK0SQGFv84px1ju4wODdbo+9paUFsVyVfewPVuZTOyS3S8kKhb1jUilwmVFk+SLmcOb3DjXWcnYmEEqe8D7hIfNY1eh10U84zp3+Uo4y6qNsthRFfXRaGjtg3bgd8/usdwn4i0z1rrvh0sgQCQ+iteLFEnU5H8Xg38taTjo0YxdWFVGAPrQspjcT2y+iWlkOpwfS3rir82XO23qkWx87S94e7VzIR/66ifwODOo95TRc6j4AYDlQB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 18:09:25 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 18:09:25 +0000
Date: Thu, 11 Jul 2024 14:09:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Wilson, Chris P"
 <chris.p.wilson@intel.com>, "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Shyti,
 Andi" <andi.shyti@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "janusz.krzysztofik@linux.intel.com" <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Message-ID: <ZpAfyzKlqlMrd4nj@intel.com>
References: <20240711163208.1355736-1-nitin.r.gote@intel.com>
 <CH0PR11MB54443CBE8B4A052419FFFD1BE5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54443CBE8B4A052419FFFD1BE5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: ac44acf4-ad8b-4d47-b866-08dca1d4987a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mdnAfp4gJuwh7s+A/h1NXCR87Rl3pqbAIkDS+G2KPdgiaU3UcMqCm27dCkXI?=
 =?us-ascii?Q?i5U/VGwg7hgpJxB1HnQxpw8tbUssFI0F09AA0rBsrCGAp2jIOCObCesoQrLR?=
 =?us-ascii?Q?Qe6nd2kfIirokGOAhoiu9bgkYSAPn2f0vvfMMyA1IQytKuMNYReMo+7Zieuz?=
 =?us-ascii?Q?9dazPOBveU/nswznk9kHh6GsU1gBcCrO3sjVNjHsvatgctnXNnNDZjXiadr9?=
 =?us-ascii?Q?Byn89QcEjQd+9WeJgIWo8YWOs7LW54uR8IRQvB9MpCJOh9ropgPN2nqX0csP?=
 =?us-ascii?Q?McQSoTquhtX6TPjosrsnvDiq84IA6gHNIyrU4yvchn3XZxFciSCX7FWul5zb?=
 =?us-ascii?Q?zkqXG456o0g3PI85j59kVSTHgX7DPhZdB4sa/KOgkwPY79Grp8mKICyjFKJO?=
 =?us-ascii?Q?ffcVt30KBelAQ45zwTjJydCkEe2XtjWiVAHaO1v9YDNMGGT4UHRMbMD6Piy9?=
 =?us-ascii?Q?e8OE+o0fsbmQGKyIaM5ww/nvxca+IshRrhWNbbCf5+VmmwAKNdUzNlkO1QaK?=
 =?us-ascii?Q?4Udie5xg/bezNsMjTTn0qOdmFITgbBPd+Rjes6UszXqoZjim2O0pIXkAj9s1?=
 =?us-ascii?Q?2CVbJYABGfwvKXvAXalU0AVSL050C8iCOzo1H1spVjoXqc2Tc1mvUT3jn1Ql?=
 =?us-ascii?Q?P62SsLyb8YYvi5nzrzqQKKNJT7wqbFyudC+k1htctqo8bVLRPtu2e1avakep?=
 =?us-ascii?Q?1t1Vdn9WxOp3lIEt3zbMQfNnl6t7avFpfjPvLNPA9nC3ThvExTnd6FnJ8Xxz?=
 =?us-ascii?Q?KXb+Zt1AxH377SAPH09pcw2iOh7c3JuCSG1b78aFPB5B18k+rz6LIMPaMsks?=
 =?us-ascii?Q?/WgQ2ovi0fjpLmxtXeo6f5C/nv/QY93a/vJy7j3PhwuO4BLw8JrChaF68Mt1?=
 =?us-ascii?Q?Sk1b24ROGo3sEAKy/qW9Fzb7D+FCiqQA4ZIoGJzlyQ/r/6RRaJNhFU4gyGfl?=
 =?us-ascii?Q?3Dv9HbBASBNmvIXC6T1YA/GA0rPmtJuQcR6/zK216PiEbNpZBDxJCZNCZkG0?=
 =?us-ascii?Q?MOle6vbqNzdZH/eCjtomw/YcxAAhjF2fP/yjsCTiqufVFyVTuaAWpPcCMbaN?=
 =?us-ascii?Q?hHPGt3/uqIGy3jTDPJB1r6J0jb0ffD+RRwhWVwJJ3Iie5h/YvNJL5N6n49UX?=
 =?us-ascii?Q?XC9IGXLeQ64RvtM7l+Twt1lfuF1OTv2hDDkTJLM1ePW3dz6hCKm6a8cSWnTy?=
 =?us-ascii?Q?0RLnvvzXGoew4/Y3261mq/H5yWs+rWtPEYUSuR4dx0aMS/pf4n+1aeYFUBXn?=
 =?us-ascii?Q?hIfQAhxPgXXgERTfs1mO3xQTRMHWY7jGS1XbK3BY0+fypvoJZoUkC+tWswGH?=
 =?us-ascii?Q?9fg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w6iDuislfNj4v4yx//ceulg6+sKhI1mp2bX8qV5a+ezHP3ynRSu9DXSqLqsf?=
 =?us-ascii?Q?btZiw/SUfmZ2+FRaRnRISrfHzb4M1bQ19OvxqhMSSaIwiWE/SdNB79TJ3FHY?=
 =?us-ascii?Q?dt+U21aHfmsTUOo+y6vOKm8PcFHWgOnDNXnArmSthQRBEc5brDAmFU9gQF5k?=
 =?us-ascii?Q?J9HSb61AyBxw81ZBgIJBwkd8B7ShF1Kf2P91VAMrkkm+iZuN7GitJ4CXPfCF?=
 =?us-ascii?Q?5x4wCDDwgwUaciINuF8ilEiJNYYDaKV0EVLoquzmFehcpA+dZVx2QA/nBIfh?=
 =?us-ascii?Q?ZBGj+Zj5xqANrRrPM+aEn2gmMBEufpXM8c+039ELy5reGGjCY8yn3+pJU/LX?=
 =?us-ascii?Q?nFe7qsY1sfr4EYwZ9pZg/yQSg2MzJ1FJxPwf4Yy6FnNLqrpH8mfg58BjfWwR?=
 =?us-ascii?Q?WkBUqai5KIduF6gmxVdLWE3r2n4sr6gfe33af76rqYxLHvmMFog+enr9So9I?=
 =?us-ascii?Q?47Hdzn9QoCc0cjQwwdtyYe4CwhtjbhU/0PfCD7X+505TWvj5r0kbXL7tFZzm?=
 =?us-ascii?Q?IUwefND2v9SA/3DhUhInxjtjHRzzeZ8OW8HdoozhUrC4JknTaIgLBYigi6qE?=
 =?us-ascii?Q?u6iCJfXsUolZS9X5qjP/AtjPpDuJ5cv7J1WDFL2OcyP/psvHYSv/4Sysrvez?=
 =?us-ascii?Q?Z6xiS5hcc+fEhituBB6nudAMWOT2iHKNn6u+I4BYUPecJJfd+0CK10PZfRkL?=
 =?us-ascii?Q?d571i4RY/fOY8gyMtOhQainrVBLvN2zo9Pk3aeTTvuWHqCChnKs45m/AWUDl?=
 =?us-ascii?Q?pBfKSaZelo1wg8YO98aahlYnwt5SVP/E8OGMXcO3hr+EOobx4uiYrTiFlQgI?=
 =?us-ascii?Q?+KhwfYWVMI8eUxpUiBMCo74/hFMfLnozyz8puuHQwWdIb9HH6CWHD8KyfW5t?=
 =?us-ascii?Q?lsi+8z0IwUaMW+dKxxpiySiPrXn33kL3dFDXeFq8mA2up7gpAhUyeC7FLEcg?=
 =?us-ascii?Q?p2hnPpSOpurzidwFjIc2elFd4/aLxMnHRleZoPMKHr7HH7yX0F7MIVwPmpCh?=
 =?us-ascii?Q?cFq5kVIiteD/jmLtUnRZsqRKv/885j6qflLV/4dh+LiR97HFPx1FEhb66i/z?=
 =?us-ascii?Q?anIpuykQxM31uOujxX70ZHt+LwB9it7zwKX/OD5P7d0VAMoNE6/p/AjPAse1?=
 =?us-ascii?Q?x620dvPFmtV5VM6NAhj2GU1iuF4mXzsL4vpjFtnLdT4S8DYGxnfKKmnsrpjM?=
 =?us-ascii?Q?QomC9uCBj8+QWabHOcS/2iFKSfSnj6MXBxBi+f8ZZMOf3UaF+iBoNf7bqrvv?=
 =?us-ascii?Q?YzG/oJRqHhgSfGdJ5rCpnDKeF9Y6ufAlcqMRzdKZ44BGt5j0areN/p1RX3Fi?=
 =?us-ascii?Q?UpmIpg3r0QgBcQRYGR0GQutffXUV5h9PN2wKAyMduuGAAxdU/INm/IfLQnqS?=
 =?us-ascii?Q?/tal15W19qxyNo2KJkWgCXrzh/thv4a0kivfSAXhsiChZKnb6NfJs1/wy8on?=
 =?us-ascii?Q?8jDA4dRBDar+pNnOnN5YBxMg36Xyjgu1s6V/ZX7gmVF+5gafPn5om3/sNcAa?=
 =?us-ascii?Q?Y8C1Opg9Y3bWeD8OWiXQdGIIiBq7rnq/lJVBQpWiMIw8JKRXb69G6JbRGlwj?=
 =?us-ascii?Q?uB6scEL5DjvXBTzne8TZvb/NeU0cVTTXQIkoi13zVLmML95C5cWzXypuPxIA?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac44acf4-ad8b-4d47-b866-08dca1d4987a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 18:09:24.9838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IFqnDxQtthwinLcoiM8PwbGPHR66yHiKUwGQIQzmvQ0G+8XXk8elJExseg23gD6DviGptSujITrqqrZ7QppeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

On Thu, Jul 11, 2024 at 04:28:53PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Nitin Gote
> Sent: Thursday, July 11, 2024 9:32 AM
> To: Wilson, Chris P <chris.p.wilson@intel.com>; tursulin@ursulin.net; intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shyti, Andi <andi.shyti@intel.com>; Das, Nirmoy <nirmoy.das@intel.com>; janusz.krzysztofik@linux.intel.com; Gote, Nitin R <nitin.r.gote@intel.com>; Chris Wilson <chris.p.wilson@linux.intel.com>; stable@vger.kernel.org
> Subject: [PATCH v3] drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8
> > 
> > We're seeing a GPU HANG issue on a CHV platform, which was caused by
> > bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8").
> > 
> > Gen8 platform has only timeslice and doesn't support a preemption mechanism
> > as engines do not have a preemption timer and doesn't send an irq if the
> > preemption timeout expires.
> 
> That seems to mean the original can_preempt function was inaccurately built,
> so fixing it here makes the most sense to me, especially if it's causing problems.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> > So, add a fix to not consider preemption
> > during dequeuing for gen8 platforms.
> > 
> > v2: Simplify can_preempt() function (Tvrtko Ursulin)
> > 
> > v3:
> >  - Inside need_preempt(), condition of can_preempt() is not required
> >    as simplified can_preempt() is enough. (Chris Wilson)
> > 
> > Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8")

Something strange in here...

This patch is not using directly or indirectly (I915_ENGINE_HAS_PREEMPTION) the
can_preempt()...

> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
> > Suggested-by: Andi Shyti <andi.shyti@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > CC: <stable@vger.kernel.org> # v5.2+
> > ---
> >  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index 21829439e686..72090f52fb85 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -3315,11 +3315,7 @@ static void remove_from_engine(struct i915_request *rq)
> >  
> >  static bool can_preempt(struct intel_engine_cs *engine)
> >  {
> > -	if (GRAPHICS_VER(engine->i915) > 8)
> > -		return true;
> > -
> > -	/* GPGPU on bdw requires extra w/a; not implemented */
> > -	return engine->class != RENDER_CLASS;
> > +	return GRAPHICS_VER(engine->i915) > 8;
> >  }
> >  
> >  static void kick_execlists(const struct i915_request *rq, int prio)
> > -- 
> > 2.25.1
> > 
> > 
