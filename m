Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGsAEH4beWmPvQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:09:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966AF9A3C1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AF410E5C2;
	Tue, 27 Jan 2026 20:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YliAEsvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5085610E5BE;
 Tue, 27 Jan 2026 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769544569; x=1801080569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZoJIUf8tDglB5Ot4+VSrUKg6dngWDSKWGHrDXXEH928=;
 b=YliAEsvFJfzP7bWZ54I3cYCAxzm5Q69kh/lu7ZaC0aEvCOJQxttubG9L
 7oKuJe6KEu2qUEqLLvoCgz1VJGEw7MV9KEJTNQxAd5k06CVUBX5+fJhp8
 UEe4oKJXcWvogBDAIdfHTFp8VgcGfeg/7etDvzksvkZT1woPq853BipMj
 eNQTnTPZtcXkI/AZs8wnRHTIKhT2JtU7ZZnV+S+UW4RcY8lZTpA+kid+1
 IeQ7Lzx9lSfFIJxBEKbQUOH/B+SyPycSCOm4WC/rDfhfetXO0X4Edbd0y
 PyqJY7zDQL/VwT40826gLjiNOkBA0xfxQKcuD/HhKPCYV/4GJP8c8qhw/ w==;
X-CSE-ConnectionGUID: uvqeCl+RRYmXvl+kSqEgfA==
X-CSE-MsgGUID: k622GShrS6SgQvjb04jr0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70653437"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70653437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:09:29 -0800
X-CSE-ConnectionGUID: RgNEIauUS1ePR/HB7zX9MQ==
X-CSE-MsgGUID: 8zdzHhVRTvyIqTKw/LvTYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207859584"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:09:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:09:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 12:09:28 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:09:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgG9inUC8Q1vB3Q0XM/BXUO5QzguGwrPcwQ1wdIT8Lwjzckd/WlNWCvsT4ZMFD1xV5+KRg5qahsM2VHCj2iAIVHRDT+Lahp4KQsB/YIy9o8PzNSwaT87lzXn0vf0fu37DmQuJhGIlDivjKTUrCflvlGDDqVLC/+iwkdjXBWiWuqt45dLWuDip9YARySjh8uxvfd/vfuqIDPTGBXjOR1yODjzebapCrNeFwMO1sFuAMx7UsmdbsQuUOGI0JywtJx1J75aKmrQcDJNfJ0akZ8JdIsZxopPsN7U/2IHuqwQyONztcORZD0N8iR1pL9OFZIgT5tNNsxoj5BI5EK26R3sVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft9NtF6Nw2rfHz5cgI4a5TkTw5Y+mlda9yz0az1o81M=;
 b=q4K6BOU4DDda7qv409jDjuFYgUjuz27CEAAvqAwQzX04NkVYjrNwqt0KNn/29aCxXdJvUD1IW6kjqQjK6uLqj9CjS1OzfewNIJkh94NXUnOBS7y4SBTQMUFTEL+1uzrOrNc4iuBIswWCyNtV/pm7xa43a1uTvg/Mk8oRBx8LtlPH2+RanA1PE3TKlWQnvDLJ0HJKkXywU0FQNpzQDl9xR2jdBAxJqmW0GLa13s9T/nk0fZZOATzf/labMQlJr0e0yON40MAJEg2JWSyUlHzxPwmRTLrBIwluKDHQLmUz01/H8Af/OERqs+pI8j+R97Q2AOW22cV60dXXrOkEN7hQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.16; Tue, 27 Jan 2026 20:09:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:09:20 +0000
Date: Tue, 27 Jan 2026 12:09:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, Stuart Summers <stuart.summers@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <patches@lists.linux.dev>
Subject: Re: [PATCH] drm/xe: Move _THIS_IP_ usage from xe_vm_create() to
 dedicated function
Message-ID: <aXkbbQID+1xJ0KwT@lstrano-desk.jf.intel.com>
References: <20260121-xe-vm-fix-clang-goto-error-v1-1-7e121d81512e@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260121-xe-vm-fix-clang-goto-error-v1-1-7e121d81512e@kernel.org>
X-ClientProxiedBy: MW4PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:303:8d::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 592daa59-baa1-44d7-d077-08de5ddff4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BaKXWK39ka0h6QhHWrna88VUcLKpu1fljX/DRzKaNIqcJfyiRdl26qRxlCIq?=
 =?us-ascii?Q?KKadZurY1U87yqYfcuCq+aSBPntkJMZAIAL2miAWLdqmJ97aEA0Z7PMZDI0g?=
 =?us-ascii?Q?rpPZyPsrJXkgR1g69xHbLkh7kdZhbe1Ve1e3Jn0XcvKssf0FwxTTJA+lvghM?=
 =?us-ascii?Q?rsWetmge1yKK/DPmSnaZr8FepeG5K3f7NdSJQejkuu6xRs6rxWnT/c4QV4WI?=
 =?us-ascii?Q?7YVyLooxVEtLHUoPeCU9e5rDBGRZRsdRYTA+8q0KSuEwep/iblsgO7nRd2tR?=
 =?us-ascii?Q?8NToDtb1Ww3xfyLUvAcON7UQx9gsop9BItMrMYne9MOjhzev3vfj2FF+j/sq?=
 =?us-ascii?Q?Ng1qoyaXg57DChIDTjxq137Fjy5rrXugjLIf1y/cxVQjd8SkKFk8xY3JmNg8?=
 =?us-ascii?Q?ppYK53C/c8ehM3r19NkPddhc+WHSf33FaBr4EihPLzBXGy/+QCLfxJYMA3Mb?=
 =?us-ascii?Q?1YqvobFcOXmMrBV35Qx1kKe9ZNF0Lj8vXgT8RUBFsCEK6nCNn6ynRrl+5pBW?=
 =?us-ascii?Q?oBC8s3jPxaQErhef68oRv6FXgHyQby5wibw+Gjb8inljPFxOQfAjP+o2ME4v?=
 =?us-ascii?Q?/mE/HbRSq322wetXxNm3/KOZJyS7LGf2Tf8QG1UPjjqasKXWBuToiNhul+u3?=
 =?us-ascii?Q?wDteCDDIa82gi77DyxVOxoOhZCMKJdg8E3fxaDYE4QMMS+ue/4mP9doMDkTk?=
 =?us-ascii?Q?BI0JCPXKO5RKEgOaPDctc3jEyExiyg1pCn7wk9sscQZDbVueNdIIZOqmCoia?=
 =?us-ascii?Q?ptvkVaSBfzoA4Lv2E2mDFzSqRCtOJmvoOTcXWJQzi/ubfhDBlaWDDFFfrzd+?=
 =?us-ascii?Q?znDnH0FC3aeAeOySADeVTGzQELCSVfoFamIz1VU5yNaEnMAOwmQHEjvJyeRN?=
 =?us-ascii?Q?CW21vHQDLDnRcf54VSh3sNgF045Yt4EbOtcVCwBSp0ZXjADftHASP2HWm/iW?=
 =?us-ascii?Q?0LXMt5ov2Wp3l+5YazrKvEgTwh5F2RGkzyQVq+o51BCoBdkzATHUvfagmr7O?=
 =?us-ascii?Q?QXWb+3V0292SBwhgYxU4u/U+yNiKrQHgxCySptGjp7vyS/Q2Lptw6/AGlGc6?=
 =?us-ascii?Q?q63YH4xQArJucFoJticEAuU7MOGotc8IBWNU67LfztPOP5aUDTQ/MzDfsjE3?=
 =?us-ascii?Q?/LqGGlY+dfhPm/Z2wL7pT1bVCpOCdO5WvWL3c/syR/reFMUVKfwOk2zk4dII?=
 =?us-ascii?Q?tT7t5cadXcLGwTAWE0oA+QwG/F0dKp3+o4xV7/y5obiE7ZQry4GG/dlAFmfg?=
 =?us-ascii?Q?VC44e1cipQcBrqsq8rTQMyHEBCEilajg3RueNUGnmuez5KYyGYJQ47Q72EcM?=
 =?us-ascii?Q?oV7I/3bH6u82XOLqNykjmlQGiqT/kCe8vt8FL09vsCDe82tJE3CKfCwKKdyw?=
 =?us-ascii?Q?qS06G/LgTnmraSVanGbRaWSedp5I5KT/6F9fsKEsj0NQTsE/lTM/vAfEuyD1?=
 =?us-ascii?Q?3yHf+NjJyXgNyF7JyfC5xJUeGd5onIeI5xq+C7Qua/8J/u021ihoES6vf9aC?=
 =?us-ascii?Q?PfJ4wir0ZKX99cNTTX42MJv0DaRh2MbWrVkUSCbcBFQz1KK67TQtKR0OO50i?=
 =?us-ascii?Q?qUXHIBgU/uSIdaEcVtEQ78o+B9jw8ruxv2kxvJS7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JgltB7M6MxW0M/xghPcCs4Ru7f+LdfW8BmU6malSQVI5vxoTbMniHLK73wDy?=
 =?us-ascii?Q?rx4fETIOzNh31uAVPrx6dK05Sa1yEJ5rVrhlLineOiBZjRTJQ60M7W3khSwL?=
 =?us-ascii?Q?ZpoelRrMEENa4QoEMqUgohZTDgnOx8f5Az6JB1czLDPVSRpUBE3QmWjYjMZ0?=
 =?us-ascii?Q?bk4+Fjk9JBzj/PSAz0GbQMpU5EPJpTgppPJmFYm70Nn/pe72jt4UOlX9cSCc?=
 =?us-ascii?Q?MYQn14dp/g1dQwJxHyRtqMSdSuW6ziOSMxWS9PP26xTpMhWhF6fh4V0sZiVn?=
 =?us-ascii?Q?AMWtucOE0/rYe4dGPbCLuZq0mCfz6yWlvrMiAgkKIWkQ7l8ALYgZt/7uaocH?=
 =?us-ascii?Q?Eqzg2MdgA9nHU171NZ9bL229xsLZxQfp39ZIFEp4s+2MyJEbkzZkBePZ/k52?=
 =?us-ascii?Q?O/alDoABlT7BPte/PfGd42y8o4g9bw6bheQa2aEhqJVYrU9C6xGVbqO6OYU8?=
 =?us-ascii?Q?MsGX9Gqy2NQ9dF7OhVWJJ2Dv5u0EjJJ7lRYpit4goayC6WjDEzRzzVdRkZDz?=
 =?us-ascii?Q?+I1KrU98QRRr0t0pDwR5tu39iY1YUvtRuIIy5FHQOy1Ks1kygCJOiiHI/+vB?=
 =?us-ascii?Q?ClTFJ41YLgx8euuDP2PXcoDCGclGGbLFVTTX9tqA/FHW3PfrE2AMG/BW7+jp?=
 =?us-ascii?Q?1V7phWyfYgcZTvJp4hBEsduVvl3HmGfuEilVz2bNn/rSkA2ObUUzDnktkE9S?=
 =?us-ascii?Q?p1QugUU0svAfB+Xm94YMYx3QEpwdb2LgkiNi1OCbmlVM0/pvac/hsn4I0aMD?=
 =?us-ascii?Q?046Nyi2UBzjBAlsY9FpKAAsY451LKvfHoXDznI1sgcEs1xYA1/9JypOEUGG8?=
 =?us-ascii?Q?mOcQFU6qnRa/Npv/+LRQvwP2pUurBO6zcRZajL7ZOOhY679qnazLF2wvj/YJ?=
 =?us-ascii?Q?lb+0JbvP6HY4F4JQSMk99KuL6RX7dww9P4tq5thwCbjC3BhQLtoPGbDXtxRr?=
 =?us-ascii?Q?Jb7lXP8nyd8uKKI+2YlXumH+9nEWiJkwmW0twOFxANbMzJ+PQ1Q6zuCswTAj?=
 =?us-ascii?Q?Xe2+GeF7Z6B6/WhWiOqHBY/vA2GoJhQJPbIprcC7u/n7sKO/7Sv2avkBSuzf?=
 =?us-ascii?Q?7amaOAu4N2Od+uMUaf3fFChRtb6W1Z8BkdZeGlrWPf/vPTBPFxnCbXb1zaSe?=
 =?us-ascii?Q?I3+wz26Tuh65nLAUUyRszHngyvouGKj49D8g9cw0nIFX7x6AiIAZNw6QsQDN?=
 =?us-ascii?Q?94BBLChzcJlaqwh05ZQgS2Q/i1gxdSsNEWG1slSf4UVbqxzqVaeA6WkDgYEk?=
 =?us-ascii?Q?eCyb9QkIJ1T74if+8upCgnrQZQj+YdRjT2jAdLVb5jMj3bVOIDG0kGiOv4hx?=
 =?us-ascii?Q?4/W9M4BVeQI9loSTwg2khVvGd7kwSoxp0F6GMt86E1OavjYDKBT/EGqMydG/?=
 =?us-ascii?Q?DUN7xreP9/p0ND7jFHGEOITrzjU4Cxx54q9jj7hA/V9xqrbaPHabBCrv5Feg?=
 =?us-ascii?Q?Yf7TMMh9zRUuqH9VJi1SicvDxOZ/d+8XSyR1lFGmcLUZTytIkGEPqRfFwUMZ?=
 =?us-ascii?Q?VTBGecquRz+scLgN1qItkwqpCjKU7V3GnoOQ2GiG2ahJSg9kaaGMrTuVKpGA?=
 =?us-ascii?Q?CXn7ftDrb7YscBhqRWhnmkULsKVLqxwZvNEjjHclcbT2PiX0/apOtsvaC3/M?=
 =?us-ascii?Q?uNATDQFBBLThEfKN55ii/qIt3RN0rNGueK5stkZtqDlUtJaxnMwRpM/a0gxK?=
 =?us-ascii?Q?H4ffG+wo1juxJKL+yneUqQtfh5vyGyWK5JsAdQ4Vj/nOtGAJ7VenIkqUs1Fd?=
 =?us-ascii?Q?I7XvC07njIGSednVtziOukAdyuVTcg8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592daa59-baa1-44d7-d077-08de5ddff4fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:09:20.4138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bn8hPY2aiyjoZ1KTtgenvQ5WLQqu4ETPrmJqKZA9YB0/YUZk1X3PwLBEgM6v34pg9+0l6xn7520IiKcotMN5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,google.com,lists.freedesktop.org,lists.linux.dev];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,lkml];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 966AF9A3C1
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 03:57:35PM -0700, Nathan Chancellor wrote:
> After commit a3866ce7b122 ("drm/xe: Add vm to exec queues association"),
> building for an architecture other than x86 (which defines its own
> _THIS_IP_) with clang fails with:
> 
>   drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect goto statement to one of its possible targets
>    1586 |                 drm_exec_retry_on_contention(&exec);
>         |                 ^
>   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
>     123 |                         goto *__drm_exec_retry_ptr;             \
>         |                         ^
>   drivers/gpu/drm/xe/xe_vm.c:1542:3: note: possible target of indirect goto statement
>    1542 |                 might_lock(&vm->exec_queues.lock);
>         |                 ^
>   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
>     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
>         |                                        ^
>   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
>      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
>         |                                         ^
>   drivers/gpu/drm/xe/xe_vm.c:1583:2: note: jump exits scope of variable with __attribute__((cleanup))
>    1583 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
>         |         ^
>   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
>     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
>         |         ^
>   include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
>     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>         |         ^
>   include/linux/cleanup.h:433:20: note: expanded from macro '__scoped_guard'
>     433 |         for (CLASS(_name, scope)(args);                                 \
>         |                           ^
>   drivers/gpu/drm/xe/xe_vm.c:1542:3: note: jump enters a statement expression
>    1542 |                 might_lock(&vm->exec_queues.lock);
>         |                 ^
>   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
>     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
>         |                                        ^
>   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
>      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
>         |                    ^
> 
> While this is a false positive error because __drm_exec_retry_ptr is
> only ever assigned the label in drm_exec_until_all_locked() (thus it can
> never jump over the cleanup variable), this error is not unreasonable in
> general because the only supported use case for taking the address of a
> label is computed gotos [1]. The kernel's use of the address of a label
> in _THIS_IP_ is considered problematic by both GCC [2][3] and clang [4]
> but they need to provide something equivalent before they can break this
> use case.
> 
> Hide the usage of _THIS_IP_ by moving the CONFIG_PROVE_LOCKING if
> statement to its own function, avoiding the error. This is similar to
> commit 187e16f69de2 ("drm/xe: Work around clang multiple goto-label
> error") but with the sources of _THIS_IP_.
> 
> Fixes: a3866ce7b122 ("drm/xe: Add vm to exec queues association")
> Link: https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html [1]
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44298 [2]
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [3]
> Link: https://github.com/llvm/llvm-project/issues/138272 [4]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f7bb21ac1987..293b92ed2fdd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1474,6 +1474,20 @@ static void xe_vm_pt_destroy(struct xe_vm *vm)
>  	}
>  }
>  
> +static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
> +{
> +	if (!IS_ENABLED(CONFIG_PROVE_LOCKING))
> +		return;
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&vm->exec_queues.lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +
> +	down_read(&vm->exec_queues.lock);
> +	might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
> +	up_read(&vm->exec_queues.lock);
> +}
> +
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  {
>  	struct drm_gem_object *vm_resv_obj;
> @@ -1537,15 +1551,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  		vm->preempt.min_run_period_ms = xe->min_run_period_lr_ms;
>  
>  	init_rwsem(&vm->exec_queues.lock);
> -	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> -		fs_reclaim_acquire(GFP_KERNEL);
> -		might_lock(&vm->exec_queues.lock);
> -		fs_reclaim_release(GFP_KERNEL);
> -
> -		down_read(&vm->exec_queues.lock);
> -		might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
> -		up_read(&vm->exec_queues.lock);
> -	}
> +	xe_vm_init_prove_locking(xe, vm);
>  
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_init(&vm->rftree[id]);
> 
> ---
> base-commit: 9dd1048bca4fe2aa67c7a286bafb3947537adedb
> change-id: 20260121-xe-vm-fix-clang-goto-error-b23c9d6bbf68
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
