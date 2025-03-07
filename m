Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E44A56AD9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E73710EBAC;
	Fri,  7 Mar 2025 14:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSdUE0ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1701710E315;
 Fri,  7 Mar 2025 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741359075; x=1772895075;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H+33HLlTNfHv0u32hY2Z7Q/Od42yX9G6Oo0JWmVxB1A=;
 b=CSdUE0evWCIbMUuyJVwGXGX8iqm5ZQFBPw7ZhFppy+b3gIIwi/Ss2onF
 cVr6/G5xtaKpVnB/1+mAhMiXGYzSXs++UHn7QnW119P0pDxPPlV+sYs7v
 U3wDHLWlRsKh+b2Tq/e9UDQA438LpSqcarqNueaqAqZuIWlkqv2T5OgWc
 aaFk3ARVHbZEjUtV15Es/q/YXxkUhJOMi3B5Ie5ovd67L+Eioijs/73PK
 LXGf1nnM8wGBYTni2LwgJ+WZUvFeVj+guY9zOGWO4ndZKo/yD6WHQ8Ww5
 D8ynEj3Ym89AplR5VU0Bh5+ArlHNHU+MGyeHDL03qD+LpZ0xEY5MOZFRx g==;
X-CSE-ConnectionGUID: gvSGLQauQE2qYPZjIHcshg==
X-CSE-MsgGUID: Aec0Rln7RtW9bznVRryhjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42286469"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42286469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:51:15 -0800
X-CSE-ConnectionGUID: kPn8S8PCQ96lkINrncCmyA==
X-CSE-MsgGUID: LTBSonsoRD6QAY9/r7nPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124367555"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 06:51:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 06:51:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 06:51:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 06:51:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSwdQevdSvqyrVP/KeadF9yDypFY0HCyEiaKo9+BKUYL0+u7va1YmKnk2FkQBJysogIbdwet+w7ZdQvwhvQzb8oMa3Z35oIjy0mpq8jpYDBTrV2EzU2PwMYcV95xgU0XGekGsz228i+UIsT7Y7tekZopyefInPUYd7Aqp2j1rDeqbhOCP9x8zwmlGuyBxCTvszWMsIbOBc9r7a1aKYTDXUTig4uun1VxuzPDnQ+F2ap7l0u4gmY6ujEqdjr7QVSAqJnpgPsYoRqyZQwKG1dFjh33JnERzN17P/MLqfotGqABoBFMDMaQqIjsgoeRGbkUAqdoVuS9WNFzXZk0CY/Gqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+33HLlTNfHv0u32hY2Z7Q/Od42yX9G6Oo0JWmVxB1A=;
 b=RfuOl0NNwlRPRVCFrcmFGz+YttkKbnQiE7eW8flNgD4r1XVSMumN5Hgopxdqtj5kchMiuvg2VhW0uPWsMAzXNzsxNC69ivdy/OOGCTS4k5MUL8wXHjoHuFMT3P96sJeJ9QZi0aouXwiKpxmyQ531duYTCRS4WucRlvTiilQwEXbFW/iBlfUhGywJdfol/4x6tecrBKhnMPwjg8AOGCUVbpNOIW5ufQppulfwdMtrwMrLpNiJ2tLHQWxpPnrz+CHUatv//NIQXPCqbsmsY0X84cgyvMYCRSu9Uikaaao4VgQc4t/g3hCMHZxK3LViNEdMjdJxlLfg50tnbOajU4EP0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 14:51:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 14:51:09 +0000
Date: Fri, 7 Mar 2025 08:51:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next
Message-ID: <dzpjpp4ctdgbar6t7rcnlm5id4prs77koktzhe2sr5iyjwwl2b@3w3fom73utv7>
References: <ilc5jvtyaoyi6woyhght5a6sw5jcluiojjueorcyxbynrcpcjp@mw2mi6rd6a7l>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ilc5jvtyaoyi6woyhght5a6sw5jcluiojjueorcyxbynrcpcjp@mw2mi6rd6a7l>
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: a33b6725-05ff-483d-8a65-08dd5d877f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a2pBIhShm4Z60Ig5ihGKB+y9V0CBARBeqYs3EtsBZCR1mzyY+KMiqACtNPvR?=
 =?us-ascii?Q?w+UnpqCsVFdwaSkU5Kpy0N+wgiilU6XPmnrJrCv2Dfc2LfOllsXWsI+M3adL?=
 =?us-ascii?Q?kmIpl04+UVo+F9dGN/dNQ6sdvUcgpv192O6O4lGtCVzfMWNsan3maAFFjeMl?=
 =?us-ascii?Q?yoM5CeX5bnXDCOspJmRj0ebU8x+aUcOfSkEmYTbwT6aAP9eU3IVRxk7HyXgH?=
 =?us-ascii?Q?d33oSEFc5BNpRIKvJ+OLGNlS74L+l7q3wA8yYJ04vhy49GOQ0i9FFsSFnj7k?=
 =?us-ascii?Q?ScDAkY8yBvTI+DmbSX/zeIwWWaZrEMsoSAZD8Fdr4SR9Ns948HlWEMRpvgh1?=
 =?us-ascii?Q?jXu3hSHyksWt+JKmihLb4pXWLo/n2mk0lfWWdGa5u4qu+e98HfUpdm/+lJz2?=
 =?us-ascii?Q?YQeI3AGduD3dE0M6goo0+ZJSdwmzkZrzFWeIDpQ8VyGSLqglZ+XykSqKM5Tg?=
 =?us-ascii?Q?Jm7fS+OP5LfB6XkpqSMZKV6LLkvkDWGb7aik6TTpWtGf9JLM9lViOCx0dC3+?=
 =?us-ascii?Q?6sNej9qRGzjXkceh+HXR76QebjCw9mO32jGQdBHcEVlk+51jEhpekPUrCnHF?=
 =?us-ascii?Q?ZgayVACnc5Ul0ecNyWT1e2VkTBNfhjRU6E+5sbNrF52RCjX6qO9UVTFxlIyP?=
 =?us-ascii?Q?1b+mhnkUtIEFLAFo5mVdGZXXSJma+S7oOfMlLaoTWWErLFE3ZUMY/BwIbL74?=
 =?us-ascii?Q?jvQNFkp7n0XspzvVCKErogOfGk09saWD/Qd2lGrFa6mfNdgeb0bP6KdsDAcy?=
 =?us-ascii?Q?oxJ6uujrxbvhOTzxKm2IjeYg/aitvPaGdJYNhspcBM1EQSiBziKmxNj2sZt3?=
 =?us-ascii?Q?pX26lKe0VKKipUxaOKrBW1m7Aj5u1gXV8H6OYwCKnB/jAeGyUfNqUhOrU9qC?=
 =?us-ascii?Q?ljhYqozHKmgOI2T4QK3wFO3+g8x7MU9eR/yHcSRzSgcp3JdKY8pVoZ6/43HB?=
 =?us-ascii?Q?FJ0Tewkjhyr3guicwN8bHt5UtkpnT7KiAz4Esp2Arm8cHpazZYK4ijeqwkKb?=
 =?us-ascii?Q?Nck6ExwnKr4nTYhbslDZK44JlUGkfxoo67t2jPZFEuC9hlVN+i99t5r6zw6u?=
 =?us-ascii?Q?jnEN7TGbl20HFRXx0qu0EJcXiK4/b+AC8mRzStZAnPugjEgvcs5yULUdHrb9?=
 =?us-ascii?Q?pKv5Ffg4u2COI4SeFcNvGtSTmXDOAo+jxx6NdCAK6ZekbezbBtELEIIVLJDc?=
 =?us-ascii?Q?aasZ/O091cDDqAqqePsGoERcIfa1GL/bNOdfDmalPMBlEhDI69nnjHIYIcK4?=
 =?us-ascii?Q?cVSpe1zS5wU0d7L11A8ySPUCSc7+W2M8C9JaLd2nyNAMQp/HaIFJILFzEo24?=
 =?us-ascii?Q?mQrVrMLcEtAeJ9sPqsjrqolqvWUYlPMIqfMyWDm59+Bab/sJ9wV1232GuvgJ?=
 =?us-ascii?Q?RdyprwJZhPBPgDH2vZJCNyJWR4lK/1bDTAv/0drxlKD+7laFuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5qJMqV0FrjCsmPIGrQPGHmBmQtWuR3NHw23Ddd5KkzWkCyoDzAiryZaHX2y?=
 =?us-ascii?Q?HQtPV0W/01IcM1u6S0JyInTWJXKo8Lmrd6irQWQMNUo+F5tTMglPfIPF8p0+?=
 =?us-ascii?Q?e7tOEb4DG0ika7hOxAClZls/xdWeD6Yxg4EdJLOQdBPw2pfT25IO38fDDZxc?=
 =?us-ascii?Q?eNFpoVz2W0/rGDpgE+osdQhTsOeH+EFM/njYjxzwxl4OewxehoeBzbxvPbUu?=
 =?us-ascii?Q?DFDvEW7dwqoZoUmdcGOeJe41ODa8AZnSpJfgR7kHRK07WLPYSPOEncWcpI2m?=
 =?us-ascii?Q?Z1QBKrQFjz38w/5u4NVM/nmLRf43kZXVbSt4L2Zb+s8dNr8loW08CnQuF5AT?=
 =?us-ascii?Q?92QKXZxMYqp9sCSN3pCFvqYupyJrRzWx+OnMivrLFykpuIGR4TN5cQyiNVmW?=
 =?us-ascii?Q?q2o/m+IDUQ7EAuDvLS0zBCUNHR2b5OlnbvBoAolOf/rtyk/aqZV5GJ9db2yL?=
 =?us-ascii?Q?iZBCZwmjyj8HyXHliIGdoR5EoGPGjMYNVIheXdKFnosiXW9YuzRN0l07aOj8?=
 =?us-ascii?Q?veB7fdoFVLZkGiEcWJiuXd8B6j7nNT89bk8MpF+NM4xZ3BeHUPF5L+WEWpXq?=
 =?us-ascii?Q?7p94P8ABkuFkDP6LZsNPWrjc/iz5Y4fJ90MG7h1Kq5Rw5HigxTZBwgyljZxc?=
 =?us-ascii?Q?Bf5xNS5U1Rn9kL8cS6FOqMjWNwRDALAs48hdZiuhcWVf/zW7hYLdkkJa7Lv7?=
 =?us-ascii?Q?zMAUXbOOOpkKr87oZ8uPANaPs72IYbZp0nrkJLnuRu2RXzIWGIGqmq3zfdX6?=
 =?us-ascii?Q?hFvfqHpRdFJnLzt7kQZVH2ytWicRt8JSVINjc8rg+p3uj28SMzRxms8+7e09?=
 =?us-ascii?Q?oXfRDoBL1Qt3Vli7ivZUQ1004h8gaspckwlIRFABnrF7eegiMRS2lvHFP48R?=
 =?us-ascii?Q?jJa5WhDdpa584zJmYeTJi6C0hhS+zHbfHYphhD7lFAO9i16CgawL2UD5Mvgb?=
 =?us-ascii?Q?PT+ikUdnBN8/r90XQ+gUKEadM8igUHPZR5r0JQveMoFnNMeQq6JESOcsPLD3?=
 =?us-ascii?Q?DPHWJYtmse2WZz07WRkwY/OTSO8mmOf2rkpI5YbUXnxA9S0D0fwQLUyEnLZ4?=
 =?us-ascii?Q?ZHV20wT4+tuwLfP/W0dkOMLC8TNOJmIidJCK54R+ACQdLUN89JEey9NfSJ/z?=
 =?us-ascii?Q?rCL1kKvsW/LGUlydOC42F51FyGVPTiTLLDmP0mKYAkY8sdct8O72Row5fLgt?=
 =?us-ascii?Q?8fDWHpgIXxu4pjE/dVseLfMq8OyYgYDudiyCWHy4pSSPAKLjOuMTUh5PUvIb?=
 =?us-ascii?Q?mSSKt6nw24j7she3e3Kmdt274VjGFg1HOrB0jvJrfAhhMFNFu4XAkYtKPc34?=
 =?us-ascii?Q?3DZG+InvgT7CcTcaBu4lYVm5YxYN04o4lH2MmvLayhIfJ82qyf6RCRLVA4mi?=
 =?us-ascii?Q?BrbQ0dFYLJ5J3DdSU9zzCTh3OThjC4z5rradYT0IoAkwQHbVCB89g6ZcSee2?=
 =?us-ascii?Q?+rfuju7iyoWHYHeluS5Qw494YebltWLkLdVUOknNOAB5+37IyD/fUnvrYvHZ?=
 =?us-ascii?Q?J5MAYH3Kq4Llai3mEs6nzSzqoFpKLkZko+r/pfVwZ7xKZS1MB3qnjgDLPAGN?=
 =?us-ascii?Q?z/YvzhPdzQmmNXvp6jPbc3f5HcZpGsIhtox5lXeQjpFUn10ZyM1iqLepkFKD?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a33b6725-05ff-483d-8a65-08dd5d877f23
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:51:09.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3QY0Cw09m6S5/i0Jy25Pi3dSJ0aASCWbcx19itC3hrqpr1y9qjETQyYeNqXKsX3g9BtYfla1cno7gvmTuEb8gEfVF/uBzvZnam2dk2pkEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
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

On Fri, Mar 07, 2025 at 02:02:15AM -0600, Lucas De Marchi wrote:
>Hi Dave and Sima,
>
>Last drm-xe-next pull request for 6.15. It comes with some big features
>that we have been working on for some time: EU stall sampling and SVM.
>The latter also touches other subsystems and provides the common parts
>in the drm layer. Low latency hints from userspace to improve some
>workloads and more events exposed via perf complete the UAPI changes
>for this cycle.
>
>Another cross-subsystem change is to drivers/base to improve devres
>handling. Fixes, workarounds and refactors also made their appearance as
>usual.
>
>Worth noting 2 conflicts reported by Stephen on linux-next. One is a git
>conflict and the other is on build:
>https://lore.kernel.org/intel-xe/20250307122954.1ab65809@canb.auug.org.au/
>and https://lore.kernel.org/intel-xe/20250307132112.18b6ce90@canb.auug.org.au/
>
>These will probably show up when Linus merges drm. I checked the fixes
>on linux-next by Stephen and they look good to me.
>
>thanks
>Lucas De Marchi

Please hold on applying this. There's one fix that I merged just after
submitting the pull yesterday and today we got reports of kernel docs
failing. I'm fixing it and will submit another pull request later today.
Sorry for the noise.

Lucas De Marchi
