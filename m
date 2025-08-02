Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB1B18E37
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 13:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF1C10E149;
	Sat,  2 Aug 2025 11:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRuGRQbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE78B10E133;
 Sat,  2 Aug 2025 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754134064; x=1785670064;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=V09noKUjZ4g8Ld0vuvr+fowBxs8yC2cep8s95fDIO+g=;
 b=MRuGRQbowW3upFTTcO5+P6v1x331Olr0IkM7+bZA6R5T3x7N2HVWAka5
 U1+diBIbA2NM+lYjeIZFiYVFYA4D612f9I6NRla/J0kxyhPCG0Htm1mRU
 BHmtSU35Qj7r7b9widiXDnmWleQ5BZBLADc/CKzPPTKUn8bNr22ecDx9+
 mTvLz3F4KvMz9cPK4DasfYy6FJDl0T9Yz6txkNJWYMBH2asw6WHXtBmZZ
 q5ss9WtoJI+XPBcngrmayJKlPCN5ZeqIV7TPpbOIhFsnMIDZTkqdIjsje
 z3qv2Ws+nJHUp06yV+TXN5BpCNZkoX7mira6eDjsjz2AZ49Y0zqGWHWgQ A==;
X-CSE-ConnectionGUID: pluPVJuUT2W0q/d78Sogkw==
X-CSE-MsgGUID: ExjAxGdqQCyIK3Ygu6FzCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60103209"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="60103209"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2025 04:27:44 -0700
X-CSE-ConnectionGUID: yeQ61NVYQ1eYsSWSC0qVFA==
X-CSE-MsgGUID: P87HgmWWTOyV3AE/Ljc+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163464785"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2025 04:27:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 2 Aug 2025 04:27:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 2 Aug 2025 04:27:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 2 Aug 2025 04:27:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YR10IGyVKOcuCJFim5mnhVV4M9FeycFcLvk9p6u6X2L5xYkCaPfHwrvYu3HhS8g+wCgh0F7bbEo/uxeIiQO/y155gORzg+J8a6rA+0vhKtkpxsZTAx22HB8gIVTf3KYnGK0IR7eMLi/cLIfBpEIuqUCKmvLB33up+ZoWIq151VudewwxpF00e3js2HygqRQiDcEJUB+awr+cd3yv7eH5CWo63/NieJZH83UNgwLLm2f8n9CJZzHuer4HLZMjJfW2g/l/RexITN2CLjdzYBbDQZMU7kHc7mepbfg99NeS2qzZTZ16xU99xycMm0U8nMsNEU1jejCjPqtXKwci+NJowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQbUTQ+8NZAxSF/oNG52eR7dwhTl9OVP2Rk+0h9m3vg=;
 b=ntQq/Tp4dYmKYxY2PVVmu5xZRWh0k6lH0BmfZAPcqgdfd8gZxSF7vnN2Te9IhnRtgG+n5nm/bKM8vrox1a2dDgGhfZnSD4+cXry7eJaisl3TDulSmOJ25dmllcGc7N59EGBKb9phcbTbDZBa8QEYewVJP05YW1K4lp89bikl8uxLh676Gi1yLEecd5OsbLnkPqyF+pJCOrRsNcHWxsbwFw0D5n/V0sZc+hIh8KKkSbRK5t6cX8RcG8fygkrPysYwt+fH3LjhkMVGy1p4hm/ki5p9fy2DDUaFVCx4fyIdfKbBhdqywe6fpAYHhdSNOCHffEnZ0zyq/R/Gvo3ImZHp1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Sat, 2 Aug
 2025 11:27:39 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8989.017; Sat, 2 Aug 2025
 11:27:38 +0000
Date: Sat, 2 Aug 2025 14:27:25 +0300
From: Imre Deak <imre.deak@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicusor Huhulea
 <nicusor.huhulea@siemens.com>
CC: Shradha Gupta <shradhagupta@linux.microsoft.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "cip-dev@lists.cip-project.org"
 <cip-dev@lists.cip-project.org>, "jouni.hogander@intel.com"
 <jouni.hogander@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "laurentiu.palcu@oss.nxp.com" <laurentiu.palcu@oss.nxp.com>,
 "cedric.hombourger@siemens.com" <cedric.hombourger@siemens.com>,
 "shrikant.bobade@siemens.com" <shrikant.bobade@siemens.com>
Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and
 build/runtime issues
Message-ID: <aI32HUzrT95nS_H9@ideak-desk>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
 <aIp6UgiwtDU1Ktmp@ideak-desk>
 <DB3SPRMB000631927D36A721EAE657F3E626A@DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM>
 <aIzcjMgUttb1UpVt@ideak-desk>
 <2025080225-attach-ravioli-3d3d@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2025080225-attach-ravioli-3d3d@gregkh>
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be16a81-d137-4569-8958-08ddd1b79613
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9989lhQ3ooY9hMdQnjRr6szBQAMwSgJRhC986ZjsFw2AOJULs7lRnIGjsYYJ?=
 =?us-ascii?Q?uv4YkH4apXq+d99udES6zb9MRrZ6+/RXeQVTFVYr6Qf8qqVjgUp52jjC+j8X?=
 =?us-ascii?Q?b/hO3yjpPrWaIhwFu0Fft0ASeQMsUoEAtIQdUA1mSpZnMQUS1Nlhz8Fknngw?=
 =?us-ascii?Q?wlVA+AgewYeobbSZm2NzQpwALtIDUy3M3AdDD+wkvoso8ZOk32LXs58ju8Vu?=
 =?us-ascii?Q?8Fz6cZbFAAXKAb2KL64JUwBhcu87HODyYbt8wqLKjhseyBCWRbcXZ/v8fWE0?=
 =?us-ascii?Q?yA2ubpdvf3rAVlDaUgf0lKDuJkucJhhWUpOWQi/mk7TXI34/NeQzPhAbkdgh?=
 =?us-ascii?Q?NeZysDtNCbYZsgUuuCdaqTJ9WYflqSQerAXggm5YqAY1W74PGPFApFREuQ40?=
 =?us-ascii?Q?kvgGmITBxJqryFQtKbLv5jP6bSPK0kngvbGzNHaoHRlgEIFigvSchQpZi7XX?=
 =?us-ascii?Q?XSsSoeJQI+vOjF5mcJQyoY64qN6e2oHYYQOImHogNwayI+Y6eWIlgV4Rcfvz?=
 =?us-ascii?Q?0hcepNk713zuC+S128ElL0GwqtS+DPx6yIRJKyr2ljMFej2PgJ0lyLCqJw5a?=
 =?us-ascii?Q?AzTpha4aWG70ZELPR0imkiJgexbr1SFoWOZkkD2ZPtzeHZdZBvQ10mA2RpEp?=
 =?us-ascii?Q?PMYiZx1GTVl4QLLXbcwR10qha6cT9w3hdjfyD/eLw6UmS7xCW9O/uzp+T0bJ?=
 =?us-ascii?Q?xntfbMEze6Z7A57Zlw748sSaheFcoJg70jOdhZyzpn/pTlgO1ebKxYjbGZJN?=
 =?us-ascii?Q?M/GWA6USt7lAEVEpBhD17/tyXHu+IR2jySOicplG96620t63AS/gQk/tVVor?=
 =?us-ascii?Q?KiWJWh97PqeW+0Hbq4GU94eyTBlfyArLCo3AS76U3ns785UI9UR0PoYp3bYO?=
 =?us-ascii?Q?ndzKy6TKZFVwk5bQ7sefRC1eWOfK4A1FVyM2UkQvWiO4RzJjw1Iq0yfQtCoR?=
 =?us-ascii?Q?6XPKb4f6yS9wyNy0tStFtd1FqGrikXIT6Qa5RKVFUe96J6FPyFoxArinOgm6?=
 =?us-ascii?Q?Fuh2VAH3pM4F2ReU0c0CmJmKtt5hITBs1eVeM2i75HumDwk0gwR1s9iMJ3s0?=
 =?us-ascii?Q?NeS+I5KFUMUwn7w6vfokDOY1WC37k5VHXqodOjGNuqa9kei2RXOg+x5RV7j0?=
 =?us-ascii?Q?Xpi+RqMr/x/TWtZ2gl7HjpMTDmphlHlrxGEOcXESYnjsPqHjXxzc5WYO3oqM?=
 =?us-ascii?Q?hWfT6N0DeWnKi8XwPXO3XLNigEByX+mslFnG7shRZ97O4w5GFuacMCYWnIxl?=
 =?us-ascii?Q?lNdiL/swdrPLqen2MlEinHqD06E480/vxOieqFJPJZtNF4C/9Lqow3yYXIgR?=
 =?us-ascii?Q?a+MjYd3BG8A9oJ1TZHAXmRPxl8kiSsjozNqK4WSgHviuqDt0GV7ZbewpPVDZ?=
 =?us-ascii?Q?zJmbG7Jzu2yQyNohYsm5vWjjuIjL5E+6F5rOosIBvw5GXJO9KlSQWvZoTQRd?=
 =?us-ascii?Q?QsmhFuGOBGk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oM+slfMLQggdl/nghFhiuK0342u1GVWDVXQNZRoYdaqzU5goSRDWStfp3diQ?=
 =?us-ascii?Q?ROkmoYAstBnwBM2hG/XPA++8RY3DrtquYlq6x70uB71VCasNXRMVGhhnHHOZ?=
 =?us-ascii?Q?XZ9RMczwxRDcu6Tm2xIIwhzkz2x97dTursk/5Bw68z+caab4600+T6A4oc66?=
 =?us-ascii?Q?sSw6oBSpQRLuuh/u0qNgHOXeUCiDvxzUZzHoCU7w0MOmEhskemm48wjNehR+?=
 =?us-ascii?Q?P+iWYukR8fKCA4VQH4vvZKnqe9svcEKG6y8VRZxYVheYE5UGugViK5V6ZhGn?=
 =?us-ascii?Q?e/vqds1OkMT9YdmC+P5COIb4PhfxSbmEqD9Uas+oee8kRSc4Bpuz73tQUWzc?=
 =?us-ascii?Q?xYNgcRS3H/cakEXVsCHWqm6hUER7qC7v/7uxYdSNOV75/R1RiYE/64BB+Lxq?=
 =?us-ascii?Q?KrQjPkXg5MJ7LHk3F/RfaIF7d0M3nht/V2UwZujgqLjm3jX5zFb3PFAGyzoe?=
 =?us-ascii?Q?ZYHffr17BNtEqOPKogYGtr/WvKAfg9SJ/+8er5zrUsR8whGjUXKpEoM/TKGS?=
 =?us-ascii?Q?6H4pxPO/2TpiqhS1+g2dSc4f84ouekFA7TKRXkx4Cc2FupQ5PGlSFB1Fz7De?=
 =?us-ascii?Q?lCGRdaS5hVrRsiGlaXytwkbTS2j4+hm9wLG2dXWG6QcXzkpH15ptcjnEZS1U?=
 =?us-ascii?Q?Yy3U3KXOwSfZs9NIS8pliE6qbs7BfW96Vk+pwTJMXh25/DOp8WElLlIFzTNZ?=
 =?us-ascii?Q?DGkOV/0Lnah724bg1QBUw4RTwQ0jC8Pk7BsrRhnOTLr2mr5IvbQQiLDvSXCe?=
 =?us-ascii?Q?sFnltwLl+k4vj/9p22wvsI2TEPCBKwYpwn/s67Ab6CEUIUr9l6rQ7Cpa1DEq?=
 =?us-ascii?Q?wYKepsww5sXXN/CNY3X9tHwWJWCdYDbzzZKYigzteQ6gqMri3ZMCB2OSgb/X?=
 =?us-ascii?Q?Mo9H9Dt9ZlufkJEf7Tw+qfd9o2Y8NJDvGaBGieC4zCR2lmoptGWvUcI9bFQg?=
 =?us-ascii?Q?t6Ly94DFzxKo++c8B+Gc7XOaZpWNPRJShooJwu8SW8w4rd9l9bdVyTJplxf6?=
 =?us-ascii?Q?ybtzyW4QYJVHXlHnV+ZP4c2kgUbnx/OyK3beD3ZrBzgw9vIP3rJ9vtroCeBW?=
 =?us-ascii?Q?+HsH7cjWx1YvXj/hG+9bwrh8MbhiY+0pLNKTAc3NWW838s/r2OKm9NwS8DAj?=
 =?us-ascii?Q?WTcS/KbhPviDblB4eUEXzy39QrqvQnsZGrMJ2WrY9BOWCir0h+e9Wf3HMF88?=
 =?us-ascii?Q?qQ2uAtnJyrL/QcE1eBdZcvOLoYjKEC/9q2/8XaLTtBUkY/AKbIzGETYFREx4?=
 =?us-ascii?Q?ctX2A348yikcR23H8VdJ/bQYrSZ0OA3/zuLmAOLi787rgD77ZNeFp50qwXwH?=
 =?us-ascii?Q?yxxXh/PG+AbGM0q5Im5qXG2+COiaue2yfVTgWFKJd/Lo6kkElwX8ZuJHGtmV?=
 =?us-ascii?Q?9tQR0KAw1iEK103Uk2PNMrCkTExaxKG4SMFXt96u3eg68KHK+dn/eTq/jafC?=
 =?us-ascii?Q?pgASawQVZ7WO9PFhA0eLXio/pgiFytUjWACq0+lntHnPaag5Djj28cI+9hUc?=
 =?us-ascii?Q?X08b2ZSlQUKwTs+eWGghHELjjmrlRQktHnT/cuW64fA9Fic7FzKgGUB/3e59?=
 =?us-ascii?Q?39wW8SidaxXVRngoPJ3Tt4d9z2MEd0b233iJPdnGb9P27VW4TcODkNMXHGG5?=
 =?us-ascii?Q?D6aLN5I9ySXXxyAD/ByHWWnt5ckLkHtp0dJgu85Qaf/c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be16a81-d137-4569-8958-08ddd1b79613
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2025 11:27:38.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwLYR1UUe+aG4TEL9Z7H3LyluqFCbGMBVWgwn+1D6FvnvrbQqwC8ONksMao+nkDC3GHwXMDZNL3tCe/v7zloXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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

On Sat, Aug 02, 2025 at 08:38:36AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Aug 01, 2025 at 06:26:04PM +0300, Imre Deak wrote:
> > Hi Greg and Shradha,
> > 
> > could you please check the comment below about the 4ad8d57d902f backport
> > commit in the v6.1.y stable tree and if you agree with the reasoning why
> > it has an issue, then suggest a way to resolve it?
> > 
> > Also, AFAICS, other stable trees are not affected, since the original
> > 5abffb66d12bcac commit got only backported to the above v6.1.y tree, but
> > please confirm this.
> > 
> > On Fri, Aug 01, 2025 at 02:37:04PM +0000, nicusor.huhulea@siemens.com wrote:
> > > > -----Original Message-----
> > > > From: Imre Deak <imre.deak@intel.com>
> > > > Sent: Wednesday, July 30, 2025 11:02 PM
> > > > To: Nicusor Liviu Huhulea (FT FDS CES LX PBU 1) <nicusor.huhulea@siemens.com>
> > > > Cc: stable@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > > > intel-gfx@lists.freedesktop.org; cip-dev@lists.cip-project.org;
> > > > jouni.hogander@intel.com; neil.armstrong@linaro.org; jani.nikula@linux.intel.com;
> > > > maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de;
> > > > airlied@gmail.com; daniel@ffwll.ch; joonas.lahtinen@linux.intel.com;
> > > > rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com;
> > > > laurentiu.palcu@oss.nxp.com;
> > > > Cedric Hombourger (FT FDS CES LX) <cedric.hombourger@siemens.com>;
> > > > Shrikant Krishnarao Bobade (FT FDS CES LX PBU 1) <shrikant.bobade@siemens.com>
> > > > Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and build/runtime issues
> > > > 
> > > > Hi Nicusor,
> > > > 
> > > > thanks for the report and the root causing effort. The patchset itself has a few
> > > > issues:
> > > > 
> > > > - commit cfd48ad8c4a9 ("drm/i915: Fix HPD polling, reenabling the output
> > > >   poll work as needed") you backport fixes d33a54e3991d
> > > >   ("drm/probe_helper: sort out poll_running vs poll_enabled"), but this
> > > >   fixed commit is not part of the 6.1.y stable tree which you are
> > > >   targeting.
> > > > 
> > > >   Similarly commit d33a54e3991d fixes c8268795c9a9 ("drm/probe-helper:
> > > >   enable and disable HPD on connectors"), which is not part of 6.1.y
> > > >   either.
> > > > 
> > > >   This means the issue commit cfd48ad8c4a9 is fixing is not present in
> > > >   the 6.1.y tree, as the changes introducing that issue are not present
> > > >   in that tree either.
> > > > 
> > > > - The compile errors the patches in your patchset introduce would
> > > >   prevent bisection, so fixing up these compile errors only at the end
> > > >   of the patchset is not ok; the tree should compile without errors at
> > > >   each patch/commit.
> > > > 
> > > > Looking at v6.1.y and the patchset I suspect the actual issue is the
> > > > 
> > > > commit 4ad8d57d902f ("drm: Check output polling initialized before
> > > > disabling") backport in v6.1.y, which had the
> > > > 
> > > > -       if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
> > > > +       if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
> > > > +           !drm_kms_helper_poll || dev->mode_config.poll_running)
> > > > 
> > > > change, not part of the original
> > > > 
> > > > commit 5abffb66d12b ("drm: Check output polling initialized before disabling"). i.e.
> > > > the original patch didn't add the check for
> > > > dev->mode_config.poll_running. So could you try on top of v6.1.147
> > > > (w/o the changes in the patchset you posted):
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > > > b/drivers/gpu/drm/drm_probe_helper.c
> > > > index 0e5eadc6d44d..a515b78f839e 100644
> > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > @@ -250,7 +250,7 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
> > > >         unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
> > > > 
> > > >         if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
> > > > -           !drm_kms_helper_poll || dev->mode_config.poll_running)
> > > > +           !drm_kms_helper_poll)
> > > >                 return;
> > > > 
> > > >         drm_connector_list_iter_begin(dev, &conn_iter);
> > > 
> > > Thank you for your thorough explanation, especially regarding the
> > > bisecting issue. I hadn't anticipated that by fixing compile errors
> > > only at the end of the series, I would make bisection unreliable.
> > > 
> > > I have tested your idea/fix and it works. HPD polling works reliably
> > > on both devices. I can see the polling in logs when display cable is
> > > not connected.
> > > 
> > > Since this fix is mostly your solution, would you prefer to submit
> > > yourself, or would you like me to resubmit it as a v2 and credit you
> > > appropriately ?
> > 
> > Thanks again Nicusor for the effort to root cause this and for all the
> > tests.
> > 
> > Greg, Shradha, as described above I think in the 4ad8d57d902f backport
> > commit in v6.1.y it was incorrect to add the
> > 
> > 	dev->mode_config.poll_running
> > 
> > condition, as the original 5abffb66d12b commit was not the one adding
> > this, in that commit that condition was only part of the diff context.
> > OTOH, adding the check for this condition causes an issue in the i915
> > driver's IRQ storm handling in the v6.1.y stable tree: after
> > dev->mode_config.poll_running gets set (during the first connector
> > detection in drm_helper_probe_single_connector_modes()), the
> > 
> > 	drm_kms_helper_poll_enable()
> > 
> > call in intel_hpd_irq_storm_switch_to_polling() will not any more
> > schedule the output_poll_work as expected. Thus after an IRQ storm, the
> > HPD IRQs get disabled, but the HPD polling will not run and so the HPD
> > detection will not work as Nicusor described above.
> > 
> > If you agree with the above and the above proposed solution to remove
> > the dev->mode_config.poll_running check from the v6.1.y tree, then what
> > would be Greg the correct way to do this?
> 
> Send whatever fix is needed please.

Ok. Nicusor could you please send a patch with the above diff removing
the dev->mode_config.poll_running check to stable@vger.kernel.org, also
CCing Shradha? You could also add a Link: line to this email thread. The
patch description should mention that it is a fix for the v6.1.y stable
tree for commit 4ad8d57d902f in that tree, give a concise explanation of
the issue with the commit itself based on the above and describe the
problem you observed it causes (vs. that the patch fixes this problem
based on your tests)?

Thanks,
Imre
