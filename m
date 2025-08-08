Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BBFB1E17B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183B110E4A9;
	Fri,  8 Aug 2025 05:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Of4idN8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D464610E4A9;
 Fri,  8 Aug 2025 05:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629467; x=1786165467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JdtMzNl+SzTC6eRmthtFfdXrZRUQffrHXWJsPwgQjgA=;
 b=Of4idN8jyL2DnHQ/73KKODPRsjHvLe3aTbTeccfMHIL/PNMD/Plh6cmM
 DF+5WqfBSkqr+5rErCNkNh2j5Nr011Qqc68wPoWm9lBLH7FcRhYOjyF97
 a5DLYgvMtC2PaAw8Q0nJRDjHu2LQzkyr4nGJiR5vUKgQI/PT7bk/GPFiZ
 6qVaBcfe9GVTJY2SgJU9A8udt97fAQPwgD+8M0os+Ft9Ask5ZeOgSUVP+
 aeX27I0YpJTUtBImLQT6twc2BhfOLv5aE4NQIFI2ST0idbd/2VFy3gnwx
 D5zEnt1W0Pkq2DX9E0qBdyjuKecUobeBBp0kxqQYcPahGU7mG9N2ixcTs w==;
X-CSE-ConnectionGUID: ZTUXVHnBQvCncdGRvs88Fg==
X-CSE-MsgGUID: j5GcpXSUTS6qLNE8VTYrBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68344456"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68344456"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:04:27 -0700
X-CSE-ConnectionGUID: pjejlVwzTlS/KuvjHezm9A==
X-CSE-MsgGUID: WqUec2k+Sz60SstpJKmosQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165142729"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:04:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:04:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:04:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHY3INBiDqW9DlU3/jZH9lQis+ZeYg8C12MTaGqqjkFWAEQewmNGHpSMCpQJUGjDyQcnNHtXdVQKjnAcj+JmjEcc0ym6NkLaUw+nYL8Nm3NiI/w7Ik8bhipfQZh0PS5/cTdXez5k1BRwevmDoDSuTYXhtLbb6Is0r5dfqnzrsHSXMs/8f6HeNQwBI2MJ4kwd+Wyvk0Iii0w0uVvjGPqgKOYsMhNskyyJDOvXpZqK8PLWT/3UzIXhOjwrNgE2VDZEVRDQW6Hm5jns9bSGkPN25dKYxsHCH7mjUS1zOq/21ma3EztQOhodsHLAWjxD8dsIuGJ5QEXSPXXVLqsiE8X9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll7QE9jWxiRdgtm/DipzOTWR7bym2reZstDhvi2wa8c=;
 b=sav5SaQ4syYOEBeTs1lkddKDOLwYuCoxvVvlAaMaPiodEwCgSvNJaeBsRBskvYuwyd2jltirGpfQZvr+4dzBWwH2fgP8k2GMY8oCCyIg43PuWS9suypTRVsVuG6ZIdzhZAl+edI/hTgQe4NEq5mSrWD4BsmsvxlHweci6BZR3WNqn4el/ZTqkvTeY7KABhY3nGNRlravQNKdDboBmmj6WaLG+g2S7vph41CsPe1G8z3UhQKayNYgD8GiJ2ax5Q/F1/YL8RbkkLgJrGsLUQyKlu+Wzlb18cwlLJEXyGQy6AIwkGTcPuMizPdE3pKr3OQwRyemNzCGdtzHpxdn61LcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7840.namprd11.prod.outlook.com (2603:10b6:208:403::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 05:04:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 05:04:24 +0000
Date: Thu, 7 Aug 2025 22:04:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@kernel.org>,
 "Boris Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 03/26] drm/gpuvm: Support flags in drm_gpuvm_map_req
Message-ID: <aJWFVdDGkRyf3zU+@lstrano-desk.jf.intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807164338.1832254-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: dfac04d8-6979-4e51-e21b-08ddd6390abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cV3DNGollys3ngOvsZGsPU4rSUCTkxuSb6PthcLjmq5E7RJdeZzYsBRwkbhN?=
 =?us-ascii?Q?3O29leJkJgyLVuBfe5URor7Mi6shRyEIcS5KO6qnFuVCmHgWIeRwi80ywjgW?=
 =?us-ascii?Q?j8/O2eCyFUKEX811qCQiM9oOpitLUizUJESLD4IqBkhCnPmYcP2gd6DFL5zV?=
 =?us-ascii?Q?MtDZFaYHugQ97HW/Kly1jTk2pBv0ucqGzqDQOgHqoq13cH77utOaCOO8X2IB?=
 =?us-ascii?Q?O1skkspMl8Ok6NPxtnlKekj53WnpgHOSP8vXGEMklSU24k+6NNkLYeuVJHLg?=
 =?us-ascii?Q?Rs90GMDIAU0EvkJ/he/hDR+PXkMzs5Pnqk1PMWo+ylSoxoOd4GgVz2h3a1sF?=
 =?us-ascii?Q?4FRIkNqB88XTsMTZGzYXbe/bZNhnqA6X7gZxITzql6cyPbhE6rk8a/vKC+HQ?=
 =?us-ascii?Q?LYZ9S+PqiuoGR9T2KvndKDWoc1t25Dg4HXmN7+N5113LRzbovcMq7wT1YJOy?=
 =?us-ascii?Q?Od5ZGwV/74CfjfrwWhSgMeLjB7WE/hjtN/obSOHASeZnAFUd6xzJFLQxvK5g?=
 =?us-ascii?Q?tVLkYcQSSla2chZSnpVC5yyG9ajL40OqRBq9Rd04rAylXwnsMR2WMhgsVl+c?=
 =?us-ascii?Q?xQ8aYK5YmUAgJhmne4y6lYR9cxtP2uT86RyP9JwvrbRsPIerj/Dy/HjML/sF?=
 =?us-ascii?Q?9uBrORdJ2ICpxqr9SvS7+Tw98alsjrh7pa5C/NCsilRv8dm/kt98wOc0RRV4?=
 =?us-ascii?Q?BCYDFyf37Fl70fyrbH8sKY6TW+VPDMyMUAyXN0Ei7Wzg4OJA/SIJuQoCdybh?=
 =?us-ascii?Q?lvZyzTxC11Yq3up7WTQY5NU/a+SI6iNIh4KYaEYXjMrIF7BzvbXmx4XPOME7?=
 =?us-ascii?Q?2vodYdLMJAq5mEPlpHeOQVAmZQE7H6Xp2f4VGJpHkqJ6ASNunllHKxwIdYay?=
 =?us-ascii?Q?vBAO9vsX3A5C+/MQhoP3vFQdw7FJ95ZOx6mu5PTy+8snVJHbj88Rb+eEbfkZ?=
 =?us-ascii?Q?rZWAhVph1SgcB8t9OsiVXFojeGm+R/uxRTVQUq5VfF9y8rKdLPDi76niqLke?=
 =?us-ascii?Q?U+WJOD45YkJnNKQvuevfe7537PZJhLZ48OgMO1+DEjkuRaLY+qWvIJ8s66xc?=
 =?us-ascii?Q?5rlD/S2qI1RHy8XkNE/DlwfOSs32ht+yfa3hNrE3GW5gU8zgqzivwv3QCnQx?=
 =?us-ascii?Q?JLn5FwBECFqBQPZ0yriez8GwpiuDYa/tuZWlfLEMLsFdvzu8NP98k5VqDMdS?=
 =?us-ascii?Q?mmL9L9m2J9ZdzIJnbsueqhwkviDK/FJJFw6K6//RjqFA83pMqwfFFJdjivNy?=
 =?us-ascii?Q?lYUe9pY2m04/XdjKQ322BncXU1mfN+xFq9j4Gpj/pkJ6f0d+DF0DC4DXga4y?=
 =?us-ascii?Q?KqzjAw25r2ttVWYOKk4BaTazrngXWY+K9tPZD9oJcfGNxd5f67nfjcOtA28I?=
 =?us-ascii?Q?aIVr8JZy3F5rbUSS4Ctu1WuUZ06rM6g1Fy/LXxmnyOEQUhDDn7ZqF48dzYrJ?=
 =?us-ascii?Q?3+nHVzaBPmw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9WAaZyZ3Ih3LL/4mGn2UWOnRKFSQQMEYxV0uR4Pv+U1A640ry5+vmeF8j1wA?=
 =?us-ascii?Q?Kq6A1sIJn4ob4Ch83muVRMMRzrSM5iEJYpb08PpSxL5kO87oqMLEl71kHdO0?=
 =?us-ascii?Q?5yEPg6dB5PS2UyQGRSU6DbQfZrqixkc9nkEcy43fWk8k+3Q/M1rfRb45pf6Y?=
 =?us-ascii?Q?cTdZqQfurwj6b9Q9aCuioi9TRh09LQFgu1/5WuIuQOgja5raJpUiKiRsv+0D?=
 =?us-ascii?Q?nph9PSpg1bjQAh9pXxcwOizXrDOJJTeCm95gEh8CxBmRoGy/DLcthPoaN6Hi?=
 =?us-ascii?Q?bkhpk1AkJXkpoYam+XRR4MPS+yWIdfpJiil1BQbJfnd3vo+P06296QO1iskm?=
 =?us-ascii?Q?0ln3oSAmP+R7O36WELsOWyS9Jo+KRshPWBYDevfopMICP629x+fDcq6sjwz4?=
 =?us-ascii?Q?ruUEF7zoySANoFDL3JArWmT6P+5O/0yJs4GqODO8W3qboCQmaCEnrn+cglft?=
 =?us-ascii?Q?Ff0IjD66kf/SAG8jDo5rXmeguHG4ujaqQnvpT0U15xXLn3SycU9LYQLG+f1c?=
 =?us-ascii?Q?KFDPkakkP4XtwG/O/fVZ8DEjYsO4L/dNvBo3Rdjaa3n6Mx0A3pZjHY75NLva?=
 =?us-ascii?Q?PhHASl5QomqmQs4nkn14HLOU2GpdTng8xMyh+OivWgYUg4H5J0jZZts0a4lP?=
 =?us-ascii?Q?bAXMn0230V1MMNnDi7UDYbacoopngAiE/YHEFHOCxjm9V74yItM4IsLED3WS?=
 =?us-ascii?Q?ZZKHELgMwKFi5g8wJ5LdXgfIkJExdmrvtXYQ/iGHvZaeMow7ll4ZrjSfZuR/?=
 =?us-ascii?Q?raIGbMkq3k766+h16OZrjE4f+p8VsgOSwRxgE+1uC0nMz1QC9csGCm/NClsQ?=
 =?us-ascii?Q?09AKeiUooaokBkhEoA/h48unFV+3bjQ+fgLOfXlK9tIuTdUJ60xY06udJssB?=
 =?us-ascii?Q?XCQ66EKvmFxDuY+XhKqt8YY2j2c6fYriZdJ880rhjEmnptjipPH2lbBGJITa?=
 =?us-ascii?Q?vPp/ZpiZE7/BZ5nlfoe66IMwFO35QvLla0VI8xo8mB2yk4gj2X+f8qKpIzT+?=
 =?us-ascii?Q?A/SY8HOyVEltXNvOjFVLAcAAzsxbe6v7SC1Sn0mZsq1hlu+kGrBsnmyxVWxM?=
 =?us-ascii?Q?rrsQmxVBgf6MYFOl0YBZ1SX0j/k3ZGTVyPYaUOcTGp01Tuzq8iHcYqyVcbOl?=
 =?us-ascii?Q?jKYd0c2E5hKG+tCgkYlXJRrPSEvLieZ3O2yRjtgX0Rprc4af8nVw+sEr0mVQ?=
 =?us-ascii?Q?Ah4CLRha91HJK8MUdsd6lHX+2IivV5PEbP0mOnNdOCoNTxqFou3IgunaX6nE?=
 =?us-ascii?Q?r6LFPOBc54aZmm6sNOr7Rw7rD7dAG5oFvjE+U3ZkeuCESRjuLM2rqVKGJKz9?=
 =?us-ascii?Q?J3eBvc7WuVExlAO5mXQe9a4BcbKhktXBmfb9mZgbk+LwB+EuLyCS5QKYv2Sl?=
 =?us-ascii?Q?tS0Fs4Kh6+R1Zp6oGgjEkTGU93khaiZKuLNNlMb6yx7w5ldWXch2XFIctr/I?=
 =?us-ascii?Q?EwaWXt7if3LsOc8Pw0gB1txIF7Ejixgx36uIukrYJ5lwWvWuksky/Nk1GoPV?=
 =?us-ascii?Q?/wI46AxkF9F/Pfbw+m6IZRcX+ib2TEWcEUswEPEFO/vUqBEOEyVj4dkR+Iai?=
 =?us-ascii?Q?YldZ3Fl0pVvhVjCSUR99DQLzcY0OlZcv2HocNbv8pV/Ipi3b5xNQ86B6Ecuk?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfac04d8-6979-4e51-e21b-08ddd6390abc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 05:04:23.9556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcuE9vCxFD+5tYhOk7cHZVfkL2wCUtZI483YyVMObfUSQQAar3ufc0tkZX+TmLxEFtUvgB2n0I9oi0RSNyNNHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7840
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

On Thu, Aug 07, 2025 at 10:13:15PM +0530, Himal Prasad Ghimiray wrote:
> This change adds support for passing flags to drm_gpuvm_sm_map() and
> sm_map_ops_create(), enabling future extensions that affect split/merge
> logic in drm_gpuvm.
> 
> v2
> - Move flag to drm_gpuvm_map_req
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/drm/drm_gpuvm.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index cbb9b6519462..116f77abd570 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1049,6 +1049,13 @@ struct drm_gpuva_ops {
>   */
>  #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>  
> +enum drm_gpuvm_sm_map_ops_flags {
> +	 /**
> +	  * %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT sm_map ops
> +	  */
> +	DRM_GPUVM_SM_MAP_OPS_FLAG_NONE = 0,
> +};
> +
>  /**
>   * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
>   */
> @@ -1057,6 +1064,11 @@ struct drm_gpuvm_map_req {
>  	 * @op_map: struct drm_gpuva_op_map
>  	 */
>  	struct drm_gpuva_op_map op_map;
> +
> +	/**
> +	 * @flags: drm_gpuvm_sm_map_ops_flags for this mapping request
> +	 */
> +	enum drm_gpuvm_sm_map_ops_flags flags;
>  };
>  
>  struct drm_gpuva_ops *
> -- 
> 2.34.1
> 
