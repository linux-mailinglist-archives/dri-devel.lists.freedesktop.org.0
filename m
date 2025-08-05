Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC978B1ADDB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 08:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C36710E5DB;
	Tue,  5 Aug 2025 06:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PchIPZLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF3210E5DA;
 Tue,  5 Aug 2025 06:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754374147; x=1785910147;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=FySL8JIMZxDvF1khPTQpeXL8Qbm+IPgXxQwr0/84I/k=;
 b=PchIPZLo+IXajMAF2kQVd8hy2nfR2l5vgf5ywzKSBxFUVQq/SMUPc7uT
 oiPsuOA8jsHVEHQreK6NLQNE2lskJzxdk7nuzSZYd/2BDToZ4bgR6jV/R
 hnurQQ9CXzJR/4N5xNq2ViPLwnZYGAF88cZTBuH4coCURm5QBGp5q9HNl
 MITCCMr2Cchj73v+mQL6/Fybu0MXTqFGPSauE7wpiea9oc2de79VoY2BS
 ORLLirTaNz97A3ia4kmY510Ene70hTP++FooptwqJMu5ggvfy86G8xtMr
 xSqs3s/R17/SWqJkEQYkHxC9+GNPkOxiGKEYTuQBSgm6Zk9l/aMnft1Ks g==;
X-CSE-ConnectionGUID: lHkL94rSS6WIRgnP3FmN2A==
X-CSE-MsgGUID: A7qrDCIJT4OJTIiCSJPjZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56733470"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56733470"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 23:09:07 -0700
X-CSE-ConnectionGUID: 1HVpROoNT+WPtgVpW2r47A==
X-CSE-MsgGUID: GmVKN74SQu+6fK9017mAFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168817681"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 23:09:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 23:09:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 23:09:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 23:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmibNK9qJ+HUKzHwOWT5hrSc7Jf6BInBSgzhUIxnty89jdcBbzU0nZIK3FXJw2/iC4UGejl7pqhhu1Ww9tzwxhV8rd0cDZIXocBH5Zs0OJlzwWrOyEI0yZxrQFPomXCAUV4OR/WL1KQN/V9ZHyOEotRJ3s19kWVgyUCrglFHH0tR59nZufZxTFAz+q4i1zSAZk8Yle8efF/65HbQlkW3hGRey1A12ZXzOEmmHnxMWXL78gdYeC3nxkUNTrTohX8Kx6y1TQ5a/d29xottf38Mgn7cGaXRpLWzrqh/MsST7VcbXQ8NtV+hmu08e1/7tzSW5fLzRx6WgDeBlIjO2+tP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kl5F9msORpADB3nMLzv8qH4ga/9UjoXOz6A5EsWFuU=;
 b=kkuurK3XuesYanlIPQfYUSvJwgKDUVoziyrfv1kZEtSSfF896SI/FAZUBuaFz+/6j4z3xW7lQ+XhBeuoXCSl1lEz95jmAwtLSBwCcUug02cg4FnerOgthM65Kn+5dsbGbn5U7M3yesWuMw6sb8rbSW0kBXfN04XpY5FkH5GXjZU+UOD+T5SHFPSLy2VIxYmUv2T2LZD+X0rL43YPyy6/ldozOWQ1FrwZFdvnGSDQiKEvB7h/GIZq/b6KCefY98jIV2JhginRhNH0zVcydYKySwrISZHOW+sOG64xhpzwquLhr5pn6xfGKjlXnsT1EqP4DS1VcFaNlyWk1bLEtiE3qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM4PR11MB6167.namprd11.prod.outlook.com (2603:10b6:8:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 06:09:02 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 06:09:02 +0000
Date: Tue, 5 Aug 2025 09:08:51 +0300
From: Imre Deak <imre.deak@intel.com>
To: Nicusor Huhulea <nicusor.huhulea@siemens.com>
CC: <stable@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <cip-dev@lists.cip-project.org>,
 <shradhagupta@linux.microsoft.com>, <jouni.hogander@intel.com>,
 <neil.armstrong@linaro.org>, <jani.nikula@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <laurentiu.palcu@oss.nxp.com>, <cedric.hombourger@siemens.com>,
 <shrikant.bobade@siemens.com>
Subject: Re: [PATCH] drm/probe-helper: fix output polling not resuming after
 HPD IRQ storm
Message-ID: <aJGf87brlJfxA80e@ideak-desk>
References: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
X-ClientProxiedBy: DB8PR06CA0033.eurprd06.prod.outlook.com
 (2603:10a6:10:100::46) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM4PR11MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: cb911fd8-e6ea-49d6-0d98-08ddd3e69353
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CIcmv9mPTp7ENhwECAR4IDx/f/cc7MKylu4RSpWGQ/kF0uu2M3w5f5Gv0okd?=
 =?us-ascii?Q?qDLzg9d6A+v7U1FLwxVfKKfQmARIf4hA47xrGixNUHIMaWgZFx260GJocWod?=
 =?us-ascii?Q?+YHmrgSaeTp8yFwTsEUCdP8TY/fBcvTCZ5bIf7+tcxnwvbC2wVFtnspljkL7?=
 =?us-ascii?Q?9A2HbQATIdGVrseXIydKCo4Sl0zBz6DVKukJNszOp4YlI18kpRdunKeaU5nh?=
 =?us-ascii?Q?jEUHG0Kr9peYGa7rkI38w77MJ5LN4yv2ncHtUc0ZDmkeu4qJfpXn/TeGKtVv?=
 =?us-ascii?Q?v7WhXgbht/HW6PgM/Drfc+EyN53ZjiN8XyAm2iw7MjVrAdd/N4VPi1+2kKv1?=
 =?us-ascii?Q?CBPqGWZZ/wlX8wyzJrCwmlRLTEeJwL9IpHT928PR6dNoF/p0VBamoGyY10ut?=
 =?us-ascii?Q?E9E1hADHIWshOJIaskgIUMOIvbmsAsOjx8hBfP/AMkqMVsxoulTpebB1//6N?=
 =?us-ascii?Q?FPmqVJfaa8Z5HRPbpq5BmyGvKGH7T6FA/G09Urxjo586a7O3CwMa+wl62rVE?=
 =?us-ascii?Q?Hyfdqqk2jmi4d9JoKVkLhSWt46IS1c+DguP5bx4/E5lC331b01mQTLmPdVuQ?=
 =?us-ascii?Q?Iu36/5vkemuJVkH+ulxn1sDAk2coGpNOm24YS+ivx/QUFmaMnUCFQVKaVwgm?=
 =?us-ascii?Q?IoHgR89PV5Gv8CfRbI/HCzxt0ZN9FOgAmIcfSGq6eiWg+qsFJNn3wdT89hgp?=
 =?us-ascii?Q?6FJ7L5y9WGyZ1H6FQtLJgUFPZ7t1I+OxMREuRHVvcjAuGm96CQMHLvJfec67?=
 =?us-ascii?Q?8/KVdc5IyiHQlmn9tpNFR7CWXcsuPmC/fE0QPpu7C0Ke2LH1SoaGWVJhgIPG?=
 =?us-ascii?Q?TZ0iu4siu0PgRPxj4zGsfUXRPlYt3Tpj4mwWaw8JQSCWchHN4hAJFxc4ZrNk?=
 =?us-ascii?Q?80MsKqTpw877+Es7gjEAOLjjxe+QlqI41UD2j8VujQqcJjX5ulnFzrm3aJww?=
 =?us-ascii?Q?GEDf2E4UOOZ9TFJkMyC3eJL0ajPTE2uRukPah3BFhbPE7Z/ALKVuYGdP2/LI?=
 =?us-ascii?Q?p4bz+TcwxNo4eUdoyMlDuE/EVYFpXBFcW1uGzfaMAIuJ3fA/Nw+HiliMkYYp?=
 =?us-ascii?Q?FzhNhEa5/TDXfGEVjeeKN0ri3lX1sWxKHxIy7+p8lpau5CwWij7YfmLl68Nw?=
 =?us-ascii?Q?G7vhmgIj83RgabNM7oOj5zCHYavhyHR42h24mX5oT6SgIs9GJxLTWj1ibIS+?=
 =?us-ascii?Q?yoeVMftDswkCsHU+YbCyH68Zvw+uvWvLydn9UN46hJ2untKLeY0e6ZDPqUkQ?=
 =?us-ascii?Q?UBjOyoIIqmNYrFlbVRk9badv6yyGZ9iSNNZT4QOy8XGkF5QaWN3z/XyaQyNz?=
 =?us-ascii?Q?QJurQra93OnuaUiUBNUItmKCjeKIFx0gq6iI48GfMpcby4lnuqxGjg/P/3uG?=
 =?us-ascii?Q?paOjL/FytrdlDiRUvBSTYLplorsj7Vjni96T+M8fB6Gah/J73wNWtdNc1rE8?=
 =?us-ascii?Q?ATNkz/7/ltE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NwNJsaQ8+xN+OhTm8/R9ZcMz+VnQDy33NcJSWe0NtXDlt0spSUWs+UsxuwGL?=
 =?us-ascii?Q?gG+Rp6EBFcJAIf8VbQXVK1JKfIXonmqKXpLLAnpiWiWz6hoR2YOgEqlXhrsx?=
 =?us-ascii?Q?lu2BE6B2rScLFrOUaiBGZpLS5UT4q1hQkk54Xl3Sjf/tB9XAgIAkU24mp+Fk?=
 =?us-ascii?Q?cSvaEWG75q3SyvYleuQ/4xiS4F70x9/gJ6KX9xSRzcpNBnCP8/nwLiuQG8fY?=
 =?us-ascii?Q?RJxy87vdPH1CL321Ka7npZRC5udYGrKQleRO42CINz4AI8l90zBiEkShD3hr?=
 =?us-ascii?Q?8aeVSNhvhr3SDdbaCgAwtmcMyPCr6Q6OKLTUAatphgk8XAQXdD8qTvdt1Le6?=
 =?us-ascii?Q?cnpptS77l9b9IZJ9GJAOYGmQ+3AB2aXTS/WmjFcNqUH0KhuW1Y3MlBHj1+Lp?=
 =?us-ascii?Q?0cgaI0igLarW9niZ0/z5c6N3A/UKWyhvTiGYN3VKdqFVJ74OY8fqiURWaJDc?=
 =?us-ascii?Q?VM34YjqvD08BcFekhMZvParp30jjCh5v5nfWIQQeXS7Gckx67XvELS/KId0Y?=
 =?us-ascii?Q?B+a5g0wOHhp5lRBEJ2/6Tx6AbFCDJwto8jNkvPLvD19Q1IkVv3D97SkxSSVR?=
 =?us-ascii?Q?vCLQyb/V9qL/W9RG7dM3EUrTZORdVqoR8CFeCfp6WwcmiPbvZtXKINFygd2k?=
 =?us-ascii?Q?BFuVTigtFDtWQMf39NWswsYKugG4QegnxXT85x27+plVRgQxxAG2keDU5/ij?=
 =?us-ascii?Q?1lQ2eq/vHq47qI6pyWG/nf7NVLEYunkQb84FWFpFa3b0cFVFRcgET7zxSQSo?=
 =?us-ascii?Q?A02pKSmV+yAcK3Y0p3GDvyTeqZqPqJK1N7nU5sq6MDoe/cIyH1bp/nb56KvJ?=
 =?us-ascii?Q?zZRhwJRC0+bTnVNI33mtAsQI6qJ6oTz/6GoDDMQmISn/ciaFzhH1j4lVIEi1?=
 =?us-ascii?Q?ttsoCABSL1q7Mv/5WCLA9oRUrvb6CGe8CQUOQl9DBUctoeVVKGozkHkbvZ8k?=
 =?us-ascii?Q?CoZxcSTO1lmTZ9E+gjOw4UV4VfeTvd0OUihkV6PHUNOa3iicYEjFgjxi+kl7?=
 =?us-ascii?Q?SfzHP5FYZhF8pP1TXuoJEyIXh67ofPFiaqxhHG7ie2NZKPF18jiS+FL+9aan?=
 =?us-ascii?Q?c0SWHc0Dr5mcyw1aeKj+ANsoSSlebq25mazeqwIYlBXCfLpJ/6UEVlMTqrTQ?=
 =?us-ascii?Q?BovdHxEcDojRz0yHwnyPkmWU5Diz5pckbzdTLq3TGmWUQlSgUMAwQBJOopsU?=
 =?us-ascii?Q?aNhm6ZymqFpnPTBCqk2sU3iDGVcuwC8K5QjgzIxOLCgtQ+MHQnBGffiL/iec?=
 =?us-ascii?Q?gUK2Kp0UkuQsZfHIMwcl9UhhbjnA9ykVmBbGgYzT4xAjbA41D1oIOEbzmsO+?=
 =?us-ascii?Q?U7+v8pRwT2WwEng/z/PcWdnXQIBQZFZZNAXOVxX4RyiCzuPnCfEe6f3aNOAK?=
 =?us-ascii?Q?c0QtOSmO8wTPXZjYpCviXgTfdcD2XsaH97easDF26aBafW1qxbW/agXBIPI8?=
 =?us-ascii?Q?RZzuHO9b+QDbEeTUdFHZlk0S+s22zRUWl4pjWKUilUfVtte0+MDTMb1+bKNY?=
 =?us-ascii?Q?tSv5nqIuKhKxvD6vV2csNYhE5B/Q3BMOk3CY7es47IDz3CVQ+mMO+WJGwUWY?=
 =?us-ascii?Q?Zx8Sw99Gyd6jQEm61MHpGEyA/3CMtZtXe2qPKimd8/108FgSEK2xeKTlMQpp?=
 =?us-ascii?Q?DsbSe/Swmg6iOxIcWJb1bLu2JOQPaxFA5nGY6FOaupz5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb911fd8-e6ea-49d6-0d98-08ddd3e69353
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 06:09:02.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdHpgqEJGr0KutUc/Xoc8w+b4DyVvDqEYasuP+V0s/x7bLpBLd7D6UiS6OKaq+fkp2n1AtPZAfLcHItcDqfZ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6167
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

On Mon, Aug 04, 2025 at 11:13:59PM +0300, Nicusor Huhulea wrote:
> A regression in output polling was introduced by commit 4ad8d57d902fbc7c82507cfc1b031f3a07c3de6e
> ("drm: Check output polling initialized before disabling") in the 6.1.y stable tree.
> As a result, when the i915 driver detects an HPD IRQ storm and attempts to switch
> from IRQ-based hotplug detection to polling, output polling fails to resume.
> 
> The root cause is the use of dev->mode_config.poll_running. Once poll_running is set
> (during the first connector detection) the calls to drm_kms_helper_poll_enable(), such as
> intel_hpd_irq_storm_switch_to_polling() fails to schedule output_poll_work as expected.
> Therefore, after an IRQ storm disables HPD IRQs, polling does not start, breaking hotplug detection.
> 
> The fix is to remove the dev->mode_config.poll_running in the check condition, ensuring polling
> is always scheduled as requested.
> 
> Notes:
>  Initial analysis, assumptions, device testing details, the correct fix and detailed rationale
>  were discussed here https://lore.kernel.org/stable/aI32HUzrT95nS_H9@ideak-desk/
> 
> Cc: stable@vger.kernel.org # 6.1.y
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>
> Suggested-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>

Acked-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/drm_probe_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 0e5eadc6d44d..a515b78f839e 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -250,7 +250,7 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
>  	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
>  
>  	if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
> -	    !drm_kms_helper_poll || dev->mode_config.poll_running)
> +	    !drm_kms_helper_poll)
>  		return;
>  
>  	drm_connector_list_iter_begin(dev, &conn_iter);
> -- 
> 2.39.2
> 
