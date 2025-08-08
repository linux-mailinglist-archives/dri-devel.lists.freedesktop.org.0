Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DEB1EA77
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1554A10E949;
	Fri,  8 Aug 2025 14:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMAsyfhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFB010E949;
 Fri,  8 Aug 2025 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754663935; x=1786199935;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4f4+41BxvkrMm+xVf9UlIXyYe2588zESkADu0Va+dKc=;
 b=HMAsyfhcD01uckcy+6WmebBpsjJSMIWMvsmUACrsT5JjFS2nwM7Mnr3f
 HXxj8XftB/FhurtN0etEjle1TvALKa0YqKmNzsNsdFc24XuAVti/m57/M
 XZ327L14wrmxsfO+GLIIlSFQOTx//RA2GXEmkZyG/L0MTZyJ8LVbOrEoO
 XOjC20BAjm4b7BvVdo5vdZlTQ4E6C4yH7HlnTzl5Z6D8SYLVKxH7VbAY8
 37tZldcJpYZUUVDdGw3SAXGM57ut1y47qwCK4kOvKnSzwpv1M2rB2UIPO
 WXo4SCQxa0L90TYOKtqo+DE1a9uS/qcTRbbSsOyVxcAAFVx8rtae3kO50 A==;
X-CSE-ConnectionGUID: Pnlq1UedTSqUKUnYEo0Vig==
X-CSE-MsgGUID: eR2xlskvR+Wp6Rr3AJRoVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57078490"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57078490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:38:33 -0700
X-CSE-ConnectionGUID: +5iJonUVRwmYwG6SnpKiVQ==
X-CSE-MsgGUID: xYcDP8WoR323OaujMlJPcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169797816"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:38:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:38:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:38:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEOsnOMcpNIF2mgZ4FrMfJgNX9S5hgD70QxUltehEuWkVs6pruMpiKNFnZYSl66ljJVGpH3cjJn01DngonpboFs/nE+RzsDopWbDPz/RyNaUfooxx0XT9Vm1cV8bzHzaB81oJ5Xs85nzXeZa/czM/bBE2GS2WZ2daPXzFR7thlDWAg5vhnZhfdRIX2gjaAaCFVIB6APeLBQNRqhbDcp0s+3MclFIWaKMUbYL4rE5RfBbf+hUW+jFCOui2GJ2onlAP5nicxKv+b2jHVXv8DKdmBpfn/Iamx9BPdyxaGMOy+w3EWzE1WIaNfGsAaEQ3TpiK3ybQ/MbYYl4Gb347rVk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qj2Dj81fgR6+eEjXLna4TGYSiCU3fRMm0pQxntKZDFs=;
 b=vxbdhuN1dlj+dLxRGz2V2d/Z+1+dmUN2yw8Z96UgSMbyo/0cuJ0NAhqMbfXVx6R2yFvvUUi4w8RkYF5c/9CsNN+M3pp4jQCEaXE4sgvqRD7j6xJNuHZAS/sjnjURa9OinzB7zGSF6Onj06npuz0tXtHx+JQ+anTjTmL6X4+9IXmNwo8pxAepl9BCKZZmNsbXdmneIeI1UYdnxluKP4dZDChKxTtAZrzqMMTvEg64w2guX4YxdA92oMSvF1Kai0btxWFUo+oT3EDlIII7Zqpb7mvHqy1yQLuEqR10a+hCXn3xHI568a1Ma5ZTxp7SJXuLTo/hu+qwwWBwbGOz2buKNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 14:38:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:38:27 +0000
Date: Fri, 8 Aug 2025 10:38:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 4/9 v2] drm/i915: Replace struct_mutex in intel_guc_log.c
Message-ID: <aJYL38Ar8EKTdieb@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-5-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807170212.285385-5-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: BYAPR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:74::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: a81ae79e-8370-4be6-1b4c-08ddd6893c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QETX68qFEPaa82KbZeOV9LQD3y5xO9J4XIX9nx9JnjVyU8v13j/eg/+9QL?=
 =?iso-8859-1?Q?HYtCUiL6SK7m7CcQuCyHRQcBaaRcLmeGtf5qJ8zsYt4sbr3Zs75Ey6TFUx?=
 =?iso-8859-1?Q?4wF/8bNtOq4g/QOZMrgt/fWA8NOPpyXNyjJI2N8gTH6pmiLezAaARK/dQ4?=
 =?iso-8859-1?Q?qnUJkK6jdcCCGT/mPOfWcnJfCB/E3NYjRf4XiNIFoQxwb4wVz/0CKkg202?=
 =?iso-8859-1?Q?6m65LdSlqYCYnVkQtvUYvAdpcREsTsdvYprQiMHCjXqKGMqO1fLJHQGLDn?=
 =?iso-8859-1?Q?Rp1MRJZGcyZ08mKJMXKcYwRbqQ/yERkg4VO7ILXxRn3NIxVXg4+ADXVaVl?=
 =?iso-8859-1?Q?rPL3e4+u6vW8XFoVQmU/0u3HNre1iIwPkjcdCLkFYvMPFgrktG6DwQQpMT?=
 =?iso-8859-1?Q?RZNiLTDFNquvOnxjxQhCCG2bPMV5xFJwSr0oqwr1COv5LnuOf+l3pDvCSM?=
 =?iso-8859-1?Q?Q6xfdN+/E339rRUGFF451MpcKe36D5NtIdIv0gwulfZFZIZkD5sm0ZGndQ?=
 =?iso-8859-1?Q?suC+URWKA/X4FOfrbL8SHq9MA2yfuTN4szvJVZWylTg26QqwFMh5oGLtSW?=
 =?iso-8859-1?Q?LszoJUtKcOH1YEzr8r//4TBlnDLb9J9qGMApxtcLjHKpAEYqvekjMIBIeR?=
 =?iso-8859-1?Q?xp5Jcx+X70D4vL/LE4i/GKXCvKYsgxKivpb97QN1jj0EAsR1sit/C0yowu?=
 =?iso-8859-1?Q?MCm187mgV5XMEWLRjf7R8PEj1IBo4ZEjcbHDqT25/PQI17KXDUhCW8npW6?=
 =?iso-8859-1?Q?+XZheiwtfW1vM4lJzd377RNvRPOktvmrgsSR0E2VElp+Ne4xmkPbFarSL6?=
 =?iso-8859-1?Q?65tTlR/LYv3VFqbeyNdjgRCyiuwMseAUQ1saTesy0nSEfkVzC63DjPIk8g?=
 =?iso-8859-1?Q?m1pPysc8k3PRExHheGTB3sPuax4BXvFhrtpVjcLG034h5F5oTvB51KNknt?=
 =?iso-8859-1?Q?faUNk4x6HlskXXEqWsIr1GtrgqRyS4iJUki72LYqdQGBHqRWET3XgvNrvH?=
 =?iso-8859-1?Q?L4FtJXg4G+HlIAgl6e4N3LQhgv8hgphLxrLrxX74IR97ilkxIUNbt40/gG?=
 =?iso-8859-1?Q?7szvpB5qc9uT7TLd4wVmmWI7RL8maUXTr03pjB3FNkHfBRSpOdaOUGpIyP?=
 =?iso-8859-1?Q?TvoHpsJkCF2gBwPTm4R/pT3I/kUt0ExpdKAFlRndyvk9JLqytFW04JoM5D?=
 =?iso-8859-1?Q?vRtSs8nya933CMd/E4WC9TA46PCS4VKlVA/XOZW837IQDZkoKw2VRNEp3B?=
 =?iso-8859-1?Q?fvSQngoPZ7xvlIoBeG3ZJ+ypFup382xhP5mcK7bi3rXiaof1omx5IV+Gg7?=
 =?iso-8859-1?Q?fzDU+X+rsji7RaaAdg11God9XEMMsAwvYC9jkO9wkJnktKEIQWHw/3JRTu?=
 =?iso-8859-1?Q?g6Wuw45RHXs0gN447WzEBRPZ7L/BBIvBr2GTUKIixgoAF/PxHe5DlfBNG+?=
 =?iso-8859-1?Q?JCw1Zai5MoGjOe4h40fjCjpDdQfGzD2Mt5PYE7N+MINDU7uXkuDZ/iPBbB?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Xuyj7BolGCDpjrN7xw6tfCsMKP5v9olISf+zueAZY71tR8kPbxGrI34kMc?=
 =?iso-8859-1?Q?JIQLZKmHacA1HhynReZeKpvKZ2D9VIXZgbvF6AHmY6+B7oo7tsZ7Pezt0H?=
 =?iso-8859-1?Q?tKyOiFZ8owOklQEpWkihL09UG9hHqW77Iad97GcrPn72qtnVeCr2Zi7Kfd?=
 =?iso-8859-1?Q?NG7e3+CBD9yeZa+AaQVe8vp9Nz4kx9fV5sIjufGoiRftubal1hfgdQFinM?=
 =?iso-8859-1?Q?jgybJTqHx/6g50clWNVF4TZwDJACZyhBn0ulhWjNSDXnCKloSaiB7TCuiB?=
 =?iso-8859-1?Q?oXM8Ipa60ifvJqSTpruwwxocsvgf/uWg0ppfYSoFceTj1uRHiYpSvUoAs8?=
 =?iso-8859-1?Q?4Xub23mmgDLaaUM6qQsmSQnG0h28cC4C1AuEaxxWS1oBezlZ1DnOTVDlH/?=
 =?iso-8859-1?Q?rzJdP0nY3xiPrtDzHDCBwdxCc7hwq97q+YRs/WJxjdoUaM8ibMxEakdxee?=
 =?iso-8859-1?Q?UTP8KDDboVIXFMDjEtVB7Ds6NTi89AxdRwSt3R9mlh5r2aoKMQyDd+l2PY?=
 =?iso-8859-1?Q?W5HEhmx4o0nGjS8RVcdjd5nQuopZA2UQnnDm1RAheV73f+zgeOjndJ79Gi?=
 =?iso-8859-1?Q?0XeApe+vghTs0qj/RIFftUcYvtdkMMBFiwqfNiKBoKzWxy8zRgFvYSML8P?=
 =?iso-8859-1?Q?UBtsYEL2Fw5qyrfm0G85pZkjZcDdOI+MrnDTXIft6boCNibcUC9NggaelT?=
 =?iso-8859-1?Q?PtJb2Mx7LO5wf5lCGuVV7AomZrRsqAKZY3E2G4UT0AWaJSQq5vVvqXnx62?=
 =?iso-8859-1?Q?k6WVdTGkY1fxfNFbiRkDfPNJtqre/jf378ESN02qC2EGX5kxWHSG+bHFRd?=
 =?iso-8859-1?Q?+lBQbg0fEc6Inv+g6ufVH9jxj6Ij5eNr0Kv/vC/8sZVmV+cHfjyFW5xRWR?=
 =?iso-8859-1?Q?6NNUjuszlEI0P69TixiMOqAIVTA5GuIW7RNLfRQnTJ4V99aHRgE+MUhTO6?=
 =?iso-8859-1?Q?BHvTuQ0D02b85DoyLyS4W9mLb5t5t/Vr+zorCzrHegoFsJrXPlGvwF/o4e?=
 =?iso-8859-1?Q?uilUoIksAuW8TXnYWyAxOtp3MXMGEJjQU0NuU2gkei6oF1sgHcQzJaD098?=
 =?iso-8859-1?Q?DMlggbmht8F6kUWkjUkUEdNRRikrtq7HHXGameuCpg5ZQ5+3AjXOZgHlzK?=
 =?iso-8859-1?Q?BzZVCNpmOCmImn4CCLF8JhFrsPwXNC9IOQvsf+Jzm/pIGLrLDtAaTuaqA4?=
 =?iso-8859-1?Q?HcEZD2CroxbJvcL/ffL7ztnGlzOoQfFzxvhy773jx0KxOpeZEumyf/uKLs?=
 =?iso-8859-1?Q?I8HMY9BD2m/wMtCr3+zhX1AFPpSbhrNeBXZ1C07bwoWXzeTIYZnkgNdiD7?=
 =?iso-8859-1?Q?vWFdYY7MgWnaUKhJ53reCKU+M4PrPa03Lg/7nZTIaC7e7kVrppsqXzA/QW?=
 =?iso-8859-1?Q?UjX6eZla64n9oMjx08Wfaj0DdkEOKp4AShfb7K+XXKrdzBg9XF7tAuYlmJ?=
 =?iso-8859-1?Q?5HndUUqJtJY5SAftV+ESLtoUcy70+CrQHF+ij2KaOFekA58jDZQE2+NXWA?=
 =?iso-8859-1?Q?0UcCozLZ0jReIiZo9TJf/p5cFkirPMuikeA1Cp2GRSoooeS5rL1bA6ZLAY?=
 =?iso-8859-1?Q?UeeRvRJnkUo2mU5Z/gDjHItmj5HhQ6K4xqouBdpB1UZF4MvjhRgqrlTV4f?=
 =?iso-8859-1?Q?Z+OSCj6YQYoIQCEDsSxFCgjk9LVfrOOpCx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a81ae79e-8370-4be6-1b4c-08ddd6893c97
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:38:27.3865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uzpQjAIN430dxHszYHhJG0YWvY95gmXaOIRrq/VD3yQrOexjpNGpFkEnvCObrMFXD0J7G2ykHarQAp0+11daA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

On Thu, Aug 07, 2025 at 02:02:03PM -0300, Luiz Otavio Mello wrote:
> Remove the use of struct_mutex from intel_guc_log.c and replace it with
> a dedicated lock, guc_lock, defined within the intel_guc_log struct.
>     
> The struct_mutex was previously used to protect concurrent access and
> modification of intel_guc_log->level in intel_guc_log_set_level().
> However, it was suggested that the lock should reside within the
> intel_guc_log struct itself.
>     
> Initialize the new guc_lock in intel_guc_log_init_early(), alongside the
> existing relay.lock. The lock is initialized using drmm_mutex_init(),
> which also ensures it is properly destroyed when the driver is unloaded.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 5 +++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.h | 8 ++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 469173791394..0104fffd5852 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -518,6 +518,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
>  	struct drm_i915_private *i915 = guc_to_i915(guc);
>  
>  	drmm_mutex_init(&i915->drm, &log->relay.lock);
> +	drmm_mutex_init(&i915->drm, &log->guc_lock);
>  	INIT_WORK(&log->relay.flush_work, copy_debug_logs_work);
>  	log->relay.started = false;
>  }
> @@ -683,7 +684,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&i915->struct_mutex);
> +	mutex_lock(&log->guc_lock);
>  
>  	if (log->level == level)
>  		goto out_unlock;
> @@ -701,7 +702,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	log->level = level;
>  
>  out_unlock:
> -	mutex_unlock(&i915->struct_mutex);
> +	mutex_unlock(&log->guc_lock);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
> index 02127703be80..13cb93ad0710 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
> @@ -42,6 +42,14 @@ enum {
>  struct intel_guc_log {
>  	u32 level;
>  
> +	/*
> +	 * Protects concurrent access and modification of intel_guc_log->level.
> +	 *
> +	 * This lock replaces the legacy struct_mutex usage in
> +	 * intel_guc_log system.
> +	 */
> +	struct mutex guc_lock;
> +
>  	/* Allocation settings */
>  	struct {
>  		s32 bytes;	/* Size in bytes */
> -- 
> 2.50.1
> 
