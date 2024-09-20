Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83597D022
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E03A10E2C8;
	Fri, 20 Sep 2024 03:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zq2IuPwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C012110E2C8;
 Fri, 20 Sep 2024 03:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802088; x=1758338088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3ENNzDOFZxSXoKFDDXDNxp33wUt7HRPzHE9VkhLH2tk=;
 b=Zq2IuPwZFEQZVcyl7PNya+jWctaZN5yS3xDO3pykheZG9pJXND+rwfJB
 cc+LM3FUfriq/U9tJOB4V/wt8mGWecytQgwmfwcZ+z0HKj6I0X/31MLAz
 IJhwvbA1X9FC8q1qe38U7UUN2wv1Fwzf6UVvZmBHCKQlC8AWwNP+XYen0
 PJwrPv7N9yjQp+YYIXeG2rgwyDmgyNxNXNNNkCwDHaQYs0bMEupK/cHZq
 Ago2Y3Aks11d0mdQ+NFJ9LXbl1RkZxTTaTQzibpzBX3eDe7MFAOuQCKhF
 jFWOS6iUQS0kCx6BTNgc0Y4qTkCdqyx4PxodDqmJ+P86aZpEurcnpngp3 g==;
X-CSE-ConnectionGUID: wwy9kx6ZR/mKu7EBzWt/8Q==
X-CSE-MsgGUID: V+3cgh+iQVe+A6KcdkNUTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36929391"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="36929391"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:14:47 -0700
X-CSE-ConnectionGUID: 80qLwQSOS+G1xKSaSp2+PA==
X-CSE-MsgGUID: V2ovHlHcQ4mokukEaHx13A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70166901"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 20:14:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 20:14:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 20:14:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 20:14:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 20:14:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/HOx8qF+nH031oUClV0gW0M99FUvjdiqIQ8vd67lcbZxidRI3zaeVUFG42sJNwuYhDNDf7D2z+QF1kBQdYU0sjUpcKwDAOUJoFMTmTfpC3+ylDxmj1M2LrgbPyeOdjdthV8oEsrtdrlNtdInKfbzwSLwYvysq30drNwjO2vbwD4iB/owwNpGZM4mL2rErpsQkP9ThxxAfSRflgrjvNy+8ydYab02N8wOSf9pNv13r18ufZdCdzQSsbKtzLAcWfDieJ7SJs4sx+VGj0qT5eRNxpA0C5euRAFbEJiBEOYSMxYOlM1en9Kz44tVlm7KuuIeatmetUJjvdN/znf7FLrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ENNzDOFZxSXoKFDDXDNxp33wUt7HRPzHE9VkhLH2tk=;
 b=wH0zVukE/x+RF0/BiV/JHLezya4r8Yw1zeA/1KFwoO8NPq9xjy9Sa+Zgex0B/ztrcJ8A2yP4swkKFs97oyos63hcPdvQJ4iWYzgD1oGIwCl+YyTTskF68sp+k6f6srazZtaUG03jo5sQ1P2mcBF5J/YYT9CIUxKDfSYB5lrzy6cYOm0rTSrvcOfTwb+9cxWb18ydHDRCXSRIjA/VmcsRvVOzdHK9nn0DLQrlbnSM28RBzZJvjbqw6wbR1HGGfjWKQ3wXN8fBW1vqgKZr2RHks1eb1JHqDy427AuA3jKBVB6Jwtfwv8cscES8Ti0rrz71ZHpxNboxHHkVjKktBmnvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7934.namprd11.prod.outlook.com (2603:10b6:208:40d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 03:14:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 03:14:38 +0000
Date: Thu, 19 Sep 2024 22:14:33 -0500
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
Subject: Re: [PULL] drm-xe-next-fixes
Message-ID: <vlifgx557dmq22gbqw4ldjm4pjedxaqrk3ecngrzbzae6742xk@aunex327ue4x>
References: <lr6vhd7x5eb7gubd7utfmnwzvfqfslji4kssxyqisynzlvqjni@svgm6jot7r66>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <lr6vhd7x5eb7gubd7utfmnwzvfqfslji4kssxyqisynzlvqjni@svgm6jot7r66>
X-ClientProxiedBy: MW4PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:303:dd::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f194bf-bcec-422e-2de4-08dcd9225c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IS6S7lrr3wfNVjAtIUE5zMNzHiA8OAZlrfw+uefi20oH9EAVybutMW75Eopy?=
 =?us-ascii?Q?ILyxFFfYLUMXQ8RpV2bqgfkN0sAsLEltGulpDiIHCRElQsDxoTiAWQqvFyIg?=
 =?us-ascii?Q?Ny9Uv/QDnLgRkH+dAU6nd+6Cs7uo11pWlI7tjQKlFe1sm9mauJBtcY82GwNo?=
 =?us-ascii?Q?KbJXLYhvSdYfyrhuy8aPh/xUNVDSFNbvcctM1ZNTpY22gUF6GGVRxWsu0Bp3?=
 =?us-ascii?Q?MMFqUeVnSuFbvNnZm28ZQqlAnpe2dhCaGvofF/24lCaqUHQCIHBnWwRK/1ib?=
 =?us-ascii?Q?05kZAVq6eHVNXdq9f7Q9a6U48tSOqMhjpPTWYfgNySOZYCC25+vnQaLJwKfq?=
 =?us-ascii?Q?XLpN0PWmDom27Sd/3CXqPHYH+yxqyeOP0wCV7HhLZPgI3Nhj8o4bQReYhgFq?=
 =?us-ascii?Q?mhHq3oAZyitjMZf3UD6SlyitPOKBAIxzBcWDm8GLbfT4DTYlFdKKCkWXlW59?=
 =?us-ascii?Q?TW28sMuHx4DfBuKBcHQyl5bLmPyH3qN1LggnAw8CheQEPr1O9zZu8kSc4q6Y?=
 =?us-ascii?Q?eoPddN10VGExnSzvJnsQoSUPRfHel1eUPwGmdivz5GW+LwbE6CNM0LJ6BCGR?=
 =?us-ascii?Q?r+15UIuAOAbF/qBPJnnkp7ZGmO773Dg6ay6STq7xfiuvoiuVnDwAX/7XRlJc?=
 =?us-ascii?Q?Z0J549oBM62mKlL0w8nZrfewC+qaGZPl+Zsw9IPGWON1PIStw/4rOPkR8CSe?=
 =?us-ascii?Q?rE0FyU3uQvcpscxQkWg0EBbCO9oicy7GeQdcT4vf2Go/XcYocLVxUKqtv51N?=
 =?us-ascii?Q?pQfApRjElxLHxgLh4C9pOCyuNb70Bc6SCVqpyNSWLVR3vW38lHrUbHESJMV1?=
 =?us-ascii?Q?pcwI4CneDGSg00AvpsQNymT66b1r/2eQTKgZd5HDzd7OQqz69yzb7a8NHPKJ?=
 =?us-ascii?Q?pg00+PL1p3M1c7/HsFw8lMSWJQuLC0vm2YkR1ei2YiwzBtFkkI2oX6G3U1Zi?=
 =?us-ascii?Q?9fbu48bAY5A1lJNupN6/YeEM7caG9tlRh5J7y4fC6FHVDsCpHpX2jrlFUDEk?=
 =?us-ascii?Q?vrKA4VfH7LV+x3DfrIWJx8GDWEkpESKIHUbe+JyTZOWjbi6dLfP2XDHpbWgw?=
 =?us-ascii?Q?y2Wt8REZGO/nVJTPPhxRA0gatHGMRxP6KjuNQIhN0ZCt5QHW8ItCpzqB1W11?=
 =?us-ascii?Q?mo3Att4AwIWDYpI/RMCTHp8Gckpj1LmsikwcJaoJZxR/cYYVQiY3Ca3Cjj4V?=
 =?us-ascii?Q?CXuxlfeV8bNRIcYR2m8jHlsnuc1VswwN49jPJUPCbOZ6CbVppcA/EZ9T3KVO?=
 =?us-ascii?Q?ximZvbf9m75c/dnwu7WfYvauLegbRdGDFr1KHfnmE94x/R1tbFugkGv0kpXE?=
 =?us-ascii?Q?Gs4FRyPR9qZyr3E+WD2E26+SM5NIihddGIlTAT9GIU6YXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLpUAWc/EdFAhTBz1LFFATOL651ix5jvEnsW+6+e+dgcuuotsPt4G7UFWb4z?=
 =?us-ascii?Q?DxrQ+AtelaMBtA3CtsTdePmMUXj2dDmtoMFpSbHrU1mPguKyNfRh5jDmAbUm?=
 =?us-ascii?Q?2tqh2B6J0og6zkSk90fCKvmIseXXrU3wpGNEHwi+Qz6enNKdXcreT8gBXqi1?=
 =?us-ascii?Q?b48UuKSAL2ndZjZE6sLzbMz1qupqFafYB+EUx5Z0jIbG65kK8xeX87MmdTio?=
 =?us-ascii?Q?9fWToVFTlqtwi/oHP3YJTSRo1IO+eo4vcfhxD8kQz5t3Xkji8XMEvsxyPHlE?=
 =?us-ascii?Q?N+GnCDgIQEd+LlSZMS5/8/oHsplgf9u6jppcCZfDuHPJu7ZpgfGh7Kw+p4PF?=
 =?us-ascii?Q?D+6Wr5tGzGEiBewHa8A3OLdeSu0fXTRX9EqRC0Gb6Q4emfmIyU+sYlvSgdqi?=
 =?us-ascii?Q?eLtmEpYK7282grvRvkbpucEV+jf7FTVKsdlerLmHJojno4gHryg8zFFiKxbM?=
 =?us-ascii?Q?xYRbz4un+y/JVRn7jD3pttnoS0eoW5l0Z9cNRYuKKU9dVOS0BydG6NYZv2wv?=
 =?us-ascii?Q?L0+qwuHNCQQDNfTTYCnC6foY3qbZN0S9IvpV8JEq+i4YohCH9nyzuvY+k99z?=
 =?us-ascii?Q?j+3ZXuMRSLFiZGwb7WQczf4F2rN9WX426xtOz7cyCPXQyXVZGK9B2qVDMkqm?=
 =?us-ascii?Q?gKKBAIsMstqsneP/eVuOqJh0GoeLE6WoV5bJ78PPn0SGwfIptPV8z2Bvv4AT?=
 =?us-ascii?Q?3CeOVJ7kmISYenNJ1+QUND3R4S91v1yK04x/anXCEZs/Vzs8E69ixeELZU42?=
 =?us-ascii?Q?mivI7Ly0Sz2mQWtEv7w7VfA7ggHO0M6KCRSzurRF4FUHqI4/OKnSNjjTcmZ9?=
 =?us-ascii?Q?dwJx1wl3VuhvEHLBVtKNkZ5wdR++7nhxJfCKRS5NUbyrA/9aPKW1nkWoRkue?=
 =?us-ascii?Q?b92/TazDOwcKZdjBplwNoCihfu0XWlQHMwnZyWZnKljJSKXl8654med9b2ZJ?=
 =?us-ascii?Q?lL3UXtgZkT7FXXwc/eqM7RZiE2xWvX0V4GtXLaEYVzgSttmHOaSmoBD8CXjj?=
 =?us-ascii?Q?/puD1jsFL7I5CQnt971LRo6K1jD5fWAjYbl1M6Lll0FMDG97maYLiHLabMmR?=
 =?us-ascii?Q?54QeIq+UneirRKmVa4bwAOc5WFVr4GvgvabymPC9F+u98fCrrwD/almnqnwK?=
 =?us-ascii?Q?9PZ4rjdNu6zz3ypSy+bjmG7AcKkY/yavzffcv9Szd3wwRH3wgqugZ+k993Yy?=
 =?us-ascii?Q?VsljbEP9IZIMun2Gdfhxk3IRR1TeLCpGhiplJnydQpKIUp6ONB18nlsnH7RL?=
 =?us-ascii?Q?kQk6fck9nYJC8GhmnWGiIadVaELH3It5FwZkpZlAwlD5muLbNNpQzCj6ns8V?=
 =?us-ascii?Q?B5ll1cRwUMuu8x+tbX1hcA6nzFfigoe3YpOM8HmXOYP5Oe1YIct2UTJzuZEw?=
 =?us-ascii?Q?MbUSnuvB/D+5Uo8ERUMIBhIeOAXAQVlnn9J3VkHfjOdLKDrwBRA482wvaEmJ?=
 =?us-ascii?Q?WXAo33oURKyF2OOG7DBKPZKN+FVSJocJJZMcN23/JqsbJwOzcN11RoIQMsRo?=
 =?us-ascii?Q?fhaw3gjA8z+iLo1dQZMUfjguhFi5nC+PiUG0ZtYnv1D/TAugZ1MgwbJFLTsI?=
 =?us-ascii?Q?KuKEQlSLgEeadLU+yJA+BX0g5ZVo+cUPrWFiG2KTA+nJnC1y5+iKJcGFManV?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f194bf-bcec-422e-2de4-08dcd9225c93
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 03:14:38.6021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rv7Gz6fvttVbELMLkMtBijm03W8UQhj+mNQBCTix1Vd1hbAHVeeE7YCkXh9PdY+Z325JzPDU5vxy7hGFmwxpCtIKZYNRpdocHEoEjjp53c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7934
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

On Thu, Sep 19, 2024 at 09:56:47PM GMT, Lucas De Marchi wrote:
>Hi Dave and Simona,
>
>A few fixes for 6.11-rc1.

oops, I meant 6.12-rc1, of course :)

Lucas De Marchi
