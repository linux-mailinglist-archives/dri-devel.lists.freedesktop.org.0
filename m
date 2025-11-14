Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C5C5E08D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 16:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8AA10E036;
	Fri, 14 Nov 2025 15:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfawCWVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B16210E036;
 Fri, 14 Nov 2025 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763135905; x=1794671905;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=npTsVOPnQx4Fh0E8finrh/cXHHH/BXaiUALJ77P8uiY=;
 b=hfawCWVpOlL+rEgV7CR+KAB+1K1d9jSBrlbe2kIfNt6X2ryzl9Srozjt
 57Fhi9uQyX1/U1cKcRpI9p/weBgc9RA9PVxUb+7aF0gy5oUqTPx3y0ZBo
 SuVw0KwWK9+1Zm7tdky9xTkRqFuitUBEJncAmFsXzdX09YzXJKahxpa+J
 8As/s0OeR0igwXOorChggRriVL/JZt4ehRkpN+n8hsD8PwJPseSCNPXfT
 +Etsc0rGom4Wzq8nAR2Fwo3SxMMMBdwpo2xbVoWfoHxwSPlCzq2gWLWXv
 PU3uNILHkWmNMlfRXLU7bIVgk3dFzzdbCFaHc2h7tmpvhnNiGq35ZL72X w==;
X-CSE-ConnectionGUID: Vcx/6CiOQMqfuOpjSvxBQA==
X-CSE-MsgGUID: ehsganUTQmW22o/VXjCpDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76694130"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76694130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:58:24 -0800
X-CSE-ConnectionGUID: uhnniGJ4SpmX8GCOo9PEAQ==
X-CSE-MsgGUID: xJSkh4ZaSDGgQDSRpPb8YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="220448986"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:58:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 07:58:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 07:58:22 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 07:58:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkqjr6BQjEDJs2alVkajwVD13X3CXpOuHH5bF3l0Uf2fiizJ4PRGo+LYVR0qCGOzKGE4lD8R/qfjeG+TKcQ4rJlQkabEJf8jDkboQYM5a1hAiugzUNyDxRDHO8MVOX6myBi/CMrumv+V40AkjDVRDbVKJQ5ieocmmUqpLLgFmAZ6P3OM22Rj0pzvfRrhZeZRECNxhfaxCDgvhuH/GYOtADNbadrmZi1g8HrnrxkOcnc/cL2jQK/3jpupZeXPXdtmrALXcYrIa5CPJ/zGhocHc4+QeXlawA6vbA7IcLZ66wXcCVEtb+dJ//RLpztFLWox8WXoEIYvDOFR5eFvvJV/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgqEJ3XgrD9Zs4UYKjhwPLYOWT0GMWTseFHc6GyvsKA=;
 b=KCOF6SRPKMYqzwUGa2L7uzrZUN2m/fS+tccpbM+lcWwOL8Z3MWCT7ay1DFDIoMvDB5MDuWatI7gE+aTex2WRTBN37Jk+nAVT2HH1XeyyyLpc30LD7kpij2KNWECHLv+W3hg7W3IKmXxm5gwT/mCAevUyOZBgM2Oq6vSrC+R9n8Bq7n5+4gIIr0bQCkoQjzEzYD+os/6kL7ZIlQTLuX7dtjdvvz/lS5fcd0oHEDQcRGFwY/T3KG2ZunJu13SWJzsGfTiVVkt4nQVWk5CZ9qjM48bhPmLvFBM60c0CScPn7xv3b1DCkJXEOcMB7mvkgG1rtXVIgwbRmInmMXektuOEjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:58:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:58:18 +0000
Date: Fri, 14 Nov 2025 09:58:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Simon Richter
 <Simon.Richter@hogyros.de>, Alex Deucher <alexander.deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "David
 Airlie" <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <linux-pci@vger.kernel.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/11] drm/xe: Remove driver side BAR release before
 resize
Message-ID: <gh6cx232xc6ms2d3er4724jvk2m6mjpnwd3s6ufupqrfc4iie2@h7qtm4tw3uet>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-9-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113162628.5946-9-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c3fdd0-aab8-4134-e497-08de2396a099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0HnOg7KuJneG5UBEBlXhf/z4bJYI57rRk5xENbJdqJwM2rscBNsToyhBc7?=
 =?iso-8859-1?Q?gSHIEYYTHeE4nih2g1bL+c/mFYTKnNyLBXBptS4iKDmjUgeEjhVyPE8vP8?=
 =?iso-8859-1?Q?Wcw0lcRpNdkd3IAEbyme3afKZ5vdgCBhvIYqf87sepfZHE+e/C9ZyHP3If?=
 =?iso-8859-1?Q?LOp2M3HJ+75UkTJ7jNPr0MHBR0WN5wVsnCX3W7aPItkkaRRQ8ZHPAUO3Ih?=
 =?iso-8859-1?Q?UjCVbpBIpM0GW1y2WZ02++GfamcIgkyvzRAayOwkfHCF0l9eLymL4r8vCV?=
 =?iso-8859-1?Q?S7k8JLEAE77QdHwNyUQzOYxYt1HspZGhHOpcOEdK/XAgGv0rfrf0PvdoHn?=
 =?iso-8859-1?Q?3RlsR8RXE4fRoa1qFnMloKShH/v7mp9QKHj24Bt8+1LRJjAu8q3lIV2gFG?=
 =?iso-8859-1?Q?VtTnPYlghSzHthhQhI/6AmdmpER2bhHzxGj2njNozOvXs81McMpwsoyUWx?=
 =?iso-8859-1?Q?wOSXET826hCyBZpEM40Y3FZVD5bW0y29UggT4HYN7Q/vILAaQXoB1UEmpZ?=
 =?iso-8859-1?Q?JU641KemNMK9Cg2eHpZpe6OOUfGIag66ZSFh4pFYuGDWLqNsi/mw0MbdF3?=
 =?iso-8859-1?Q?bcXcE1wEc41UMksAmxdEohlgwNOpDgiYGZWIEJSDzXfrxI61qu9zVyAmkR?=
 =?iso-8859-1?Q?Y+82CH09wgO3/0buQmQL7xzg3lM0haPXjExE1MhFe3cNdC7ZObl6IO5vfU?=
 =?iso-8859-1?Q?0XirS7nUyCck91so/ESeG7cslbXODt2eeJ/CbWLlR3B+o0sn0sI9TZXhrn?=
 =?iso-8859-1?Q?QTeTyquxqxSqrZVeLQqMcHUIsr5QiJC6thAoiM1fXNa8YZDbOHO/edTHM4?=
 =?iso-8859-1?Q?fp2jrXU5clh8bPej96N4fUoMZJY1jHiFhLQmmy0/T8+VWBBEG4xYOeRK7B?=
 =?iso-8859-1?Q?vmBWSKnWgyyMKuy4qMpXBibLTQ9TxP8WPOuv7KohPHP14revyO5Rd8b/Ik?=
 =?iso-8859-1?Q?H1/H4W4/UH9r3C9sgy0CE2dYJSKoAS0k8ymRxgkZZimbIG6o4e1+X0Dll+?=
 =?iso-8859-1?Q?fJRyeB/PQKMqKaHzzjaQbkmhta37YLJEdTYfKMX/Q3cAg66F4thEMad1W1?=
 =?iso-8859-1?Q?yIzlpnp/bMV6j51NH7WVNlZRca+rr4YpIiT0IAOP/rYzDQZo/R/KNmXcWb?=
 =?iso-8859-1?Q?Xhn0wTiX4dCs7D+Bb6YeuVzTh9p7m6sguIPnd0LOdA4RGwxjue5nKfRN16?=
 =?iso-8859-1?Q?GOza3wVr4Cmfuiy3F7WzdFRszbVA1T1b65j2zjwn5owKkmbQZaPTtD4Gdq?=
 =?iso-8859-1?Q?2Fvt9tNI59l3VvAV+Qz4GyEtDKofsVIxNyY8hUTxsMjlx1JYQaNFvYr2ID?=
 =?iso-8859-1?Q?oarJkF6mpgYpxoj/4EMGqfbOif5GNwajnAEVPIDNCyJD+2UTF8e/9kRXYJ?=
 =?iso-8859-1?Q?kX0B1rsDuhEBov+u4c6lPMZlWAp5o2hU0Awzv726mecOZj2Gg0U6xOMSE+?=
 =?iso-8859-1?Q?B3rBdlLrhBhcaD0c1HxoFp3AFVQ4eDvIXRc3Qy2/lXchAQyURIWrSpzR0G?=
 =?iso-8859-1?Q?h4DzDYVKoLkKYJ4gVFUXPZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5zJQO7pATHasJ6Br7gwrDhZjB4pbF1qfOfzz6Nn+GxhvRbvvsKAYOJrE0M?=
 =?iso-8859-1?Q?P5sj9dhfqKUIi7WNkwt9Ucm5kcLZ63r6KnGxDYYjsqRbJlkX+TI+WD+4gP?=
 =?iso-8859-1?Q?99EW71MrfEwCjwabPpKamkk06IC/icqmbYno0LW/eDveOF9M7/TRLYPH5/?=
 =?iso-8859-1?Q?fBoGM3/qx1YtGz9cOwTBdziOfS7GIXVa0IyNg8sNcML4QveYOQ7zmzUFHo?=
 =?iso-8859-1?Q?IbRUn94qKRjL1rk2gDsrCQ+YAIg5qZj0UVv6s89VkMxofM3bxmfXn83Yvn?=
 =?iso-8859-1?Q?TDeHf4k0GP4BhpReem2UMorvjf/DhA1QJGEk2bSNygOydURK5/UvA21GYs?=
 =?iso-8859-1?Q?w8UISFehnNvVVAfyCFpuSfrPpBj7UMvlxJeUQ5OjN/iWF0zYKBxhXkKeL6?=
 =?iso-8859-1?Q?5W5LHmtwmQ5kK3BSl73mgXqXiWW0JBPk8twsCCouLC8fsbaQtAPBuOfKI4?=
 =?iso-8859-1?Q?Zvad+psxM1K2k21RMMwg3NX+TlY2X+vZVC75SkxgnlVbeHDFaU8iks9War?=
 =?iso-8859-1?Q?EYb8CXPHAi2U2oGVvbMXRUbh1k8/t/ueyooQrAYmisoXS6S1pup/qq/Odl?=
 =?iso-8859-1?Q?KGEGxbx93TwIndNupKst14G9eI7CS8chUmDFKNl+utKjB9hid307g6HfBz?=
 =?iso-8859-1?Q?TfwbtIwi5JadKqX62gNnthXdDN/BlH0s62zuuSuD9o+Zcdis+oFVMj/xW+?=
 =?iso-8859-1?Q?K/P7chz+ievexcGbpol+iFKS/PZUbjBLCZA3ELS2zbOFqNJNAvmUBV6r4M?=
 =?iso-8859-1?Q?CNEJHIjVOSa9rUovcXe/xs6AAvZbbMlVnVT6gklp7Dl29iuNTU7jIHguUs?=
 =?iso-8859-1?Q?nH4EThRFdYcARVNMZLYmrRKG18dUMx3p82l8u2cDaH2AO0a7x92+tu1PkB?=
 =?iso-8859-1?Q?5PQx/qQo8rFhQMTyqMFwydpy0GhyJZ0pULpcK8lgvS2JevC9xe/qgJTfj5?=
 =?iso-8859-1?Q?gcstK9oPonYEsGsdUS8juj61hVgac0binvbDAmMIRY0zBykvS5s9Y/oPbA?=
 =?iso-8859-1?Q?alNkzaR8V3B7xIOmhQtYCEeyZV5aG/+ZUs1d5tjri1yQ8Vf/wiV4gylMTw?=
 =?iso-8859-1?Q?EJU6p2jmQGx8Ale0zdnybYTIKbt57u64bzAK2LHz14LRcBDDG6DWsuem0b?=
 =?iso-8859-1?Q?LOJEWYVSL+52UonMnKJaF7VpqTTr9ysRSsE3HQQPst5SIOXGur3/T4/EgC?=
 =?iso-8859-1?Q?gh/OFxSpAYYyi2/LIx3oGj/IxSJKgybIbdqNhffOFFQslFoxbN00QLCsR6?=
 =?iso-8859-1?Q?I4apZPwgHt+u86YtNPE1blAver5+n5tEDMuFxRRb7N/UvTMBlfjTxdmVxB?=
 =?iso-8859-1?Q?f7MMHZIB2wiR6oF4oEU7tDBsI+/qJuSXe1SBCzhh5AkvXntwe00rpc2H2Y?=
 =?iso-8859-1?Q?HVZBPE8XB9O82zimke48lDmCkY6Dh2+DVoItSbsTB58jd9FLmdKT2VZWkh?=
 =?iso-8859-1?Q?A5/8sQOgmDNw4RItQJWyYw2wtN4fMNo2x0Islw2e5lyyMAXFwpDb0iYTW7?=
 =?iso-8859-1?Q?8M0Fx4oDK0ubk764cHmppNRFsJuHFBCpGZRmHlemRr0cVBrx2zXEfQzkdt?=
 =?iso-8859-1?Q?cpnZpBj3tlusoZeJxhA2MsaIw9TCD2cqFs8Y/t8hMK3KZ0qrcnqZ4wwM3d?=
 =?iso-8859-1?Q?JCxLKM/WGUd0ikbxwPFJzbXZ6y4H7dIBTfff4mU5qoqo0KL/8YW3FgLA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c3fdd0-aab8-4134-e497-08de2396a099
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:58:18.1869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97XlcyUDv2kJ3kVJb1Tqqsaq+puFIkAKzwp1eaD3oRPn4pPHzy189uo95tWrSa43bOogm/CxQSHCViI7lV6duUfIjwkPZ4s+1e2FTqswXIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
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

On Thu, Nov 13, 2025 at 06:26:25PM +0200, Ilpo Järvinen wrote:
>PCI core handles releasing device's resources and their rollback in
>case of failure of a BAR resizing operation. Releasing resource prior
>to calling pci_resize_resource() prevents PCI core from restoring the
>BARs as they were.
>
>Remove driver-side release of BARs from the xe driver.
>
>Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

as noted in the previous version, the conflict with drm-xe-next is
trivial: just drop the release_bars() function.

Lucas De Marchi
