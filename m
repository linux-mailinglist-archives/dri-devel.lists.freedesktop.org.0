Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF071B85EE6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 18:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28D610E21E;
	Thu, 18 Sep 2025 16:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJv8wyfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DD510E078;
 Thu, 18 Sep 2025 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758212135; x=1789748135;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ku52CgZIcbxCltSjgQhFiVH/OIEXrv2x2eGXOZdCRd8=;
 b=LJv8wyfBiMIaYcxM4xWuyZwGOj3aGL1VMwC2ydmRqsWW4Zc1XHv2BrfG
 341vW+IF0Q8RrKfe/0uyAamLv/PHwLE/FxdON+x4ouCsGEw6FUjJbFt9j
 nav3+rAYzR1RMROYnC1vFQRNb/3JTLy30DY6GlNZHH+D72TXQh37KFzHe
 WjvkPvLzW6QEneeUWDXD6RGSb0aV8FH/GEA58Fm8jivoNXwx6tLty7hjU
 NUFQ02NIvbk9VnVvlnOQD3WFhCaWUUWxO4HSLLeklMDUQb2RQuzY1nWUB
 LacwnFMiwaXbJL+A5Lha8HJ1d1x72oEzl9d4RZsSXRWMq9GO1cz4x9xmd Q==;
X-CSE-ConnectionGUID: osQVfLLtTsG3I/K6euFQgg==
X-CSE-MsgGUID: rzjN1sxkRN2rYTdWRPCp0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71660153"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="71660153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 09:15:35 -0700
X-CSE-ConnectionGUID: 3SxKVXrbTKeeJM2Ob+XfOw==
X-CSE-MsgGUID: t0s9IOXWTwGT2q50vj+9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="180004298"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 09:15:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 09:15:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 09:15:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 09:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngMET3fdaFUZV/HY4HHl9vxoWYLSJ+tyaaZqWzON2yPOT5NbPpPbsN8G8FhkRW8zkWPRxw4fMT18z9Mf/UOlFURPYVLRQKqhGu7i82qIAiCpjlLELAljr5rJLJGG2Ms2rbZqpGeNC5lR9vv2iTMLl/vUpLfQgp2W2x4jbTDuhpYNkit/FBPAOOcpbkko0mhdR/oYJNRtDSIrok+RGfeXP9y5pQsDy4pTeYgxIXeVmw2TGys0VOJWhYz9Ym4m5uCNlBpKBnUQ02Kvri4+MjnpzbwyvD3arvj+0yTtH2dRWciZlfPwVSqraqqyjfRDXu8aM/wtfQsNAWl+r4Dahp4e0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc91MoOldeiG61Xxy0klUrY9r++/ciQun6BlkNmnV34=;
 b=kRf9dJI4d3OtcfRevEXFuWejPJ8SoFO9Of6WqzKp2QJ93nWwoH0H/8Cx0+mu80OQf/0EufkoFeaxYYyA/i9CDs22GgCLg9hZWxP9DLKZ+kOKmuIyMrRORP10wXSvI7AqrtTxd8RelsW1RhhghsdJxSV+Zg6odwL4ohpcZanqVvY6CJVOZn/15c1kooYHdWznI86vgOlHcvKiXTOtqSzSP9ZRg/mWIIdaqbsWL0aqZzyw5/cqUGlawfIU4aAXA78GLTmiHDtkQIj3BtHEGPj2hvGG5iNJCI7Q4d148dbUD42DVx8Har2pbpVC4L8LpxFzWLx1OvMScONLt28+o7xKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 16:15:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 16:15:27 +0000
Date: Thu, 18 Sep 2025 11:15:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Move rebar to its own file
Message-ID: <usudqsi5sfqyfklxpwu7penb6vvfg5prmtpazoixrbl34dck5g@poqf4wnnqd5v>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
 <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
 <715252a7-3c33-4131-9619-c5e9b259d35f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <715252a7-3c33-4131-9619-c5e9b259d35f@intel.com>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f5fccb-9a48-4135-4235-08ddf6ce946f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?v8Z2+meCmtB4G9ULGLoDlBkf+7mSyF3+lhuo/lhutXHWHlnOxcHPpcrjiW?=
 =?iso-8859-1?Q?/AgiEPDn33Q7mAxZ1Ie2FBC3VGJ2epl4EHxU+LCmVlDBixhgoT/NxI2U0k?=
 =?iso-8859-1?Q?a7zduih4AlgotMmDnVnv+hMkn26VLHI3xtOJ1bA36OCLz4P7BJokf/rULF?=
 =?iso-8859-1?Q?lV4vsAO9BvonZeXg9fJvy8FSzxoYGeH1w1k/+Yin61YVSR0NxZUXKJUj5t?=
 =?iso-8859-1?Q?GIx9WV+XMYm+ZrOrsY4nWouxSD6NUH/Id1GTYH84k9XocHjq9oaQ3e+S/N?=
 =?iso-8859-1?Q?YZITezxj7R+R9hAcSIyK1C5hUzCDQlVAa7AzCUgjJx4yvvUxRvjoppi86w?=
 =?iso-8859-1?Q?/y4rY34kjqud+ACMJknm5IQYY1ddntzsf/ja0dK+zsxoDdFoBIIbfn23Iq?=
 =?iso-8859-1?Q?dHXhUm6h9iEOslOuthMENAlfW7kJYpmm3uFkhMCujbMCH8wFkIvQdfYTL9?=
 =?iso-8859-1?Q?eGp8s5GpEna9hLHRR6hW1fm5KZOP35ug4s5buWw/xJmBB5fRxWOISU5KeF?=
 =?iso-8859-1?Q?N39ij/tgoXcf/giYJP/Go+rTNvtklItVUSPe5To6h+AxrmaPLycIsB6YUY?=
 =?iso-8859-1?Q?oOr9hpuEc8KlO3N6WUhaSl7XSl97lXRV2csnIXAjjAbCRK+8jf7tn340iJ?=
 =?iso-8859-1?Q?shepJnCs03l/GB475eee9caoieK51GovYbeTKryBunTpdTbjWNwsTEoC31?=
 =?iso-8859-1?Q?L7/mYy0qpzUYCqbAXTbCQ9qmxpLxa/s/U7rV8z0PrXj0g3UQKt65kEFMys?=
 =?iso-8859-1?Q?8QpLEZi53T+m13AooIGZ0JBJWQU2bUIEBkvY6Ms2rrQia/FlUPAKI7u9Ue?=
 =?iso-8859-1?Q?ETBQbZsjBsgnEvqqoT8z+iuBPZh6FED8LDnkxHpgcYXYBMPgJZAk56b/Yh?=
 =?iso-8859-1?Q?fwL99eiY9ALlRjH9IP5ZP7sHn/NLtqZMtIlSpqtxNpj84Nu2illjffRfT1?=
 =?iso-8859-1?Q?A5TwzgtW0DWIseYtDsw71vSAo7BS5t810pj25dxctKCrAszM+JmWsVWXq0?=
 =?iso-8859-1?Q?feEtj+WBvmQ3uj77U5Nv9zL/EV1dPhtxHAMU7PiWQKZViFIfV3Z4UOJHhv?=
 =?iso-8859-1?Q?PVFVCPmfvACTnlGbG/qg5EhyBTgwQgmzI7S+9bNyM1sBU1e8shnYMSn6CU?=
 =?iso-8859-1?Q?FYSDMEIM7NEOJ6AXVyiBOLqCtwGBlv0z867zaQ9ZxwAI13nG7CYKR/U0pU?=
 =?iso-8859-1?Q?ntLYbOZr+RysiLHwtlkemlOCN1thpcJT+HGAtlcNomc04DNAdsh9v3mADD?=
 =?iso-8859-1?Q?n5xH0IjDHTAA6PPvvVpHLSdBos0YqMZdnXy98Lk1RwzlEYa+sTvkhsYoh/?=
 =?iso-8859-1?Q?4osUQI3Am1d1hs3oFjqUVdZh/4IJI0E5FuY0R2ZrUb9pgleCoj5vJa5wCh?=
 =?iso-8859-1?Q?pPX5e9eaNJvyDUI86dZhDJ06V8LADBVlQBYLlhaDdsaqhT03wMdpd6T6AS?=
 =?iso-8859-1?Q?TJkw/MalPi51W+LYwGfQSFhB37/DHe3bG4fZI4QoV7/koBCW5CCOVZXI78?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D9U3PEA8HqussaB7XboAq6sdsbjT6ZcsYXYU9zGzZt1sAjTCSwyTHGHNai?=
 =?iso-8859-1?Q?1DKFJu6Me0fr3GEcC130/vPB+AOtEdxVbnut9HvIG3SwZy0x3xEj+f+2St?=
 =?iso-8859-1?Q?eCcNc/2YuXnrqrVqS0ihLZJtbfQm8TakpzgRjr3QJJDbKZm77R/04bmEfG?=
 =?iso-8859-1?Q?nBF7gfU4u0WsA6B96nJsAupbRURBUhf+h15p2qoCv1vxmGYHGrtcorBLGV?=
 =?iso-8859-1?Q?v/ETuRQWyvCyG3JkhEKr6xOZ/SxRrCo7QjrU6AnpQCoH1SC+u43qHf09EQ?=
 =?iso-8859-1?Q?dwg1WIVnsTJqALDBD9hNhpVpmktSNZ7xAzbqznt7VJGfhYxYp13zv4tD7D?=
 =?iso-8859-1?Q?xNYI10XjS0jh6+N35i7UDnt4Cwdk7493bhzSTEwKUn0jInr7JdEoRn0sc4?=
 =?iso-8859-1?Q?6TlL2ndxPsSAyH9hupImdzzELu2VaF7fet1yIdyDjefPe2BXGlKdBbj2u8?=
 =?iso-8859-1?Q?xuDmZFRrGn8gDSH6peRm0SuV4/Wziw8NRwO/b4BbOi1jJXRoWn2qfqeDnO?=
 =?iso-8859-1?Q?dC5G17RdfxUt8htS7W03ucCtNV471ui6YcR+q8Ogq8mct9vch65Xx1jupv?=
 =?iso-8859-1?Q?BqhojG4dz6QBHPVSfFJwBbMfspRCpmsUQ6Pla8AIhy+btW7PcyBELcfkVq?=
 =?iso-8859-1?Q?q/6lnMMc8B5RP/z1TE/cHP9lEkUjx4BoJ/PXHocJHeAED4imsPV6Uf9W3D?=
 =?iso-8859-1?Q?AJH3K5WvLs+S5HlS1FTDkMSp/VAj935NozwDOP2oSh8BEyQmXjgfIU6ZAU?=
 =?iso-8859-1?Q?msQ1j9aswScjBYZdbVZVUYDwq4mGMYCtqggKA6nrvu03S6vEZfqR8nCu2C?=
 =?iso-8859-1?Q?403oWaAN9+ljEw6bTOZWqP8A9T2OpOkhzKRnx2TgFV4VQCJMmbf3T2cO7i?=
 =?iso-8859-1?Q?sou3o7aifpXcOaz3ZWGrlpR4SJo9PtzOWqHGyarAY/J3oKf90hPABOu9BA?=
 =?iso-8859-1?Q?9YUxLM8gBFNA5Bo9TMdK3cwqXTqdjOGkkv74urUZO5kXKy1/35d0t+88aM?=
 =?iso-8859-1?Q?G1NjsT3HdLUhDnOZTA4FNVmhNmhz1R20C5jfEaU9UxW2zGzYkCOZukpYAq?=
 =?iso-8859-1?Q?xKSF7ukI4My24ZVN24l/iTTXga9cgTzA3dkzl9UubnP8M2p0XyomjfOhy8?=
 =?iso-8859-1?Q?uDlM2UWmqW2RLB9u39EwNUWzSyMAiYl0dnJdXtwbb+ovlvAzhlCNBvU6zr?=
 =?iso-8859-1?Q?fmYIxN9AWvwq3I+Zfm0qhJG4EIpXZZ4ZuhW8blvx3hbBWGWqB8dWNIpjXB?=
 =?iso-8859-1?Q?BX0PdD9FHgmXoywVfg+TUsMkfKSB1cEAqRQVQ2F9p+2rmG+q53nTSWhBPg?=
 =?iso-8859-1?Q?xRkFPm6wwgzjROKrc4S02y85w6J6ec8fIZjrEzSiZFazA8O3PiAPquHU/7?=
 =?iso-8859-1?Q?juiN0WpeDxovu4H+pgm004G/LkumcLuhFEAOaUPwLd5Ve4rqvaRUjGJ9Jk?=
 =?iso-8859-1?Q?n9qgmlwviw6Cp6SZZvHB46FH9IOSrHt8Py6IULBsgROc+s3ez+q9vyXkRk?=
 =?iso-8859-1?Q?vKWPMZ/QoW/WBalOVHkQm8+n7GPwoMFb9UDQLEiVXugr69g+b8c9Nz5fyd?=
 =?iso-8859-1?Q?3BFMnbOUnhDGiUZJmLCPxzEhRL0Hn16P54YItFpPNxpR6kH+N/cdOZgAbv?=
 =?iso-8859-1?Q?Wd7tjlnedrcDyDjVySs6Y6j/VWGfSJjJ0KHCTQrbDxWf28D5IrMeQEIg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f5fccb-9a48-4135-4235-08ddf6ce946f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 16:15:27.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSDLALeD6ny3B2E0QmJ27ctYmo7tuUEU1gghYhw3TOcLve4oaxPfx74HrXNfis7Yz+a9fhCIvR8jhdgSEHnbDOsr4I5iivXAekjj/QP/mJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

On Thu, Sep 18, 2025 at 12:22:22AM +0200, Michal Wajdeczko wrote:
>
>
>On 9/17/2025 11:37 PM, Lucas De Marchi wrote:
>> Now that xe_pci.c calls the rebar directly, it doens't make sense to
>
>typo: doesn't
>
>> keep it in xe_vram.c since it's closer to the PCI initialization than to
>> the vram. Move it to its own file.
>
>s/vram/VRAM
>
>>
>> While at it, add a better comment to document the possible values for
>> the vram_bar_size module parameter.
>
>if better comment is needed, shouldn't it be done in MODULE_PARM_DESC ?

yes, that's a good idea

>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile       |   1 +
>>  drivers/gpu/drm/xe/xe_pci.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
>>  drivers/gpu/drm/xe/xe_vram.c      | 109 ---------------------------------
>>  drivers/gpu/drm/xe/xe_vram.h      |   1 -
>>  6 files changed, 141 insertions(+), 111 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 7a065c98a3b85..5a66d7a53d0db 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>>  	xe_observation.o \
>>  	xe_pat.o \
>>  	xe_pci.o \
>> +	xe_pci_rebar.o \
>>  	xe_pcode.o \
>>  	xe_pm.o \
>>  	xe_preempt_fence.o \
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1f4120b535137..6cc5e7b6901a8 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -27,6 +27,7 @@
>>  #include "xe_macros.h"
>>  #include "xe_mmio.h"
>>  #include "xe_module.h"
>> +#include "xe_pci_rebar.h"
>>  #include "xe_pci_sriov.h"
>>  #include "xe_pci_types.h"
>>  #include "xe_pm.h"
>> @@ -866,7 +867,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	if (err)
>>  		return err;
>>
>> -	xe_vram_resize_bar(xe);
>> +	xe_pci_rebar(xe);
>>
>>  	err = xe_device_probe_early(xe);
>>  	/*
>> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
>> new file mode 100644
>> index 0000000000000..e04416630b573
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
>> @@ -0,0 +1,125 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_pci_rebar.h"
>
>as we have HDRTEST enabled, does it still make sense to have
>this header outside of normal xe headers listed below ?

just got used to and actually copied from another file, xe_pci.c.
I can move it

>
>> +
>> +#include <linux/pci.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "regs/xe_bars.h"
>> +#include "xe_device_types.h"
>> +#include "xe_module.h"
>> +
>> +#define BAR_SIZE_SHIFT 20
>> +
>> +static void release_bars(struct pci_dev *pdev)
>> +{
>> +	int resno;
>> +
>> +	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
>> +		if (pci_resource_len(pdev, resno))
>> +			pci_release_resource(pdev, resno);
>> +	}
>> +}
>> +
>> +static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int bar_size = pci_rebar_bytes_to_size(size);
>> +	int ret;
>> +
>> +	release_bars(pdev);
>> +
>> +	ret = pci_resize_resource(pdev, resno, bar_size);
>> +	if (ret) {
>> +		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
>
>maybe "%dMiB" as used below?

probably better as a separate patch and leave this for the code move
only. Also because there are incoming changes that will land via PCI
tree. I will be easier to manage the conflict if it happens.

>
>> +			 resno, 1 << bar_size, ERR_PTR(ret));
>> +		return;
>> +	}
>> +
>> +	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
>
>we can use
>
>	xe_info(xe, ...

adding this as a separate patch as mentioned above.

>
>> +}
>> +
>
>please add kernel-doc

yep, will do

>
>> +void xe_pci_rebar(struct xe_device *xe)
>> +{
>> +	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	struct pci_bus *root = pdev->bus;
>> +	resource_size_t current_size;
>> +	resource_size_t rebar_size;
>> +	struct resource *root_res;
>> +	u32 bar_size_mask;
>> +	u32 pci_cmd;
>> +	int i;
>> +
>> +	/* gather some relevant info */
>> +	current_size = pci_resource_len(pdev, LMEM_BAR);
>> +	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
>> +
>> +	if (!bar_size_mask)
>> +		return;
>> +
>> +	/*
>> +	 * Handle force_vram_bar_size:
>> +	 * - negative: resize is disabled
>> +	 * - 0: try to resize to maximum possible
>> +	 * - positive: resize to specific value
>> +	 */
>
>do we really need to duplicate modparam description from xe_module.c ?

I was looking at and old xe.ko and reading this:

parm:           vram_bar_size:Set the vram bar size(in MiB) (uint)

The current doc is much better. I can drop this change.

Thanks
Lucas De Marchi

>
>> +	if (force_vram_bar_size < 0)
>> +		return;
>> +
>> +	if (force_vram_bar_size) {
>> +		u32 bar_size_bit;
>> +
>> +		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>> +
>> +		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
>> +
>> +		if (!bar_size_bit) {
>> +			drm_info(&xe->drm,
>> +				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
>> +				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
>> +			return;
>> +		}
>> +
>> +		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
>> +
>> +		if (rebar_size == current_size)
>> +			return;
>> +	} else {
>> +		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
>> +
>> +		/* only resize if larger than current */
>> +		if (rebar_size <= current_size)
>> +			return;
>> +	}
>> +
>> +	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
>> +		 (u64)current_size >> 20, (u64)rebar_size >> 20);
>> +
>> +	while (root->parent)
>> +		root = root->parent;
>> +
>> +	pci_bus_for_each_resource(root, root_res, i) {
>> +		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
>> +		    (u64)root_res->start > 0x100000000ul)
>> +			break;
>> +	}
>> +
>> +	if (!root_res) {
>> +		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
>> +		return;
>> +	}
>> +
>> +	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
>> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
>> +
>> +	resize_bar(xe, LMEM_BAR, rebar_size);
>> +
>> +	pci_assign_unassigned_bus_resources(pdev->bus);
>> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.h b/drivers/gpu/drm/xe/xe_pci_rebar.h
>> new file mode 100644
>> index 0000000000000..c87aa58aee718
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PCI_REBAR_H_
>> +#define _XE_PCI_REBAR_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_pci_rebar(struct xe_device *xe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 4fb5a8426531a..caab5c1ff7ba9 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -24,115 +24,6 @@
>>  #include "xe_vram.h"
>>  #include "xe_vram_types.h"
>>
>> -#define BAR_SIZE_SHIFT 20
>> -
>> -static void release_bars(struct pci_dev *pdev)
>> -{
>> -	int resno;
>> -
>> -	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
>> -		if (pci_resource_len(pdev, resno))
>> -			pci_release_resource(pdev, resno);
>> -	}
>> -}
>> -
>> -static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>> -{
>> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -	int bar_size = pci_rebar_bytes_to_size(size);
>> -	int ret;
>> -
>> -	release_bars(pdev);
>> -
>> -	ret = pci_resize_resource(pdev, resno, bar_size);
>> -	if (ret) {
>> -		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
>> -			 resno, 1 << bar_size, ERR_PTR(ret));
>> -		return;
>> -	}
>> -
>> -	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
>> -}
>> -
>> -/*
>> - * if force_vram_bar_size is set, attempt to set to the requested size
>> - * else set to maximum possible size
>> - */
>> -void xe_vram_resize_bar(struct xe_device *xe)
>> -{
>> -	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
>> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -	struct pci_bus *root = pdev->bus;
>> -	resource_size_t current_size;
>> -	resource_size_t rebar_size;
>> -	struct resource *root_res;
>> -	u32 bar_size_mask;
>> -	u32 pci_cmd;
>> -	int i;
>> -
>> -	/* gather some relevant info */
>> -	current_size = pci_resource_len(pdev, LMEM_BAR);
>> -	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
>> -
>> -	if (!bar_size_mask)
>> -		return;
>> -
>> -	if (force_vram_bar_size < 0)
>> -		return;
>> -
>> -	/* set to a specific size? */
>> -	if (force_vram_bar_size) {
>> -		u32 bar_size_bit;
>> -
>> -		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>> -
>> -		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
>> -
>> -		if (!bar_size_bit) {
>> -			drm_info(&xe->drm,
>> -				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
>> -				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
>> -			return;
>> -		}
>> -
>> -		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
>> -
>> -		if (rebar_size == current_size)
>> -			return;
>> -	} else {
>> -		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
>> -
>> -		/* only resize if larger than current */
>> -		if (rebar_size <= current_size)
>> -			return;
>> -	}
>> -
>> -	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
>> -		 (u64)current_size >> 20, (u64)rebar_size >> 20);
>> -
>> -	while (root->parent)
>> -		root = root->parent;
>> -
>> -	pci_bus_for_each_resource(root, root_res, i) {
>> -		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
>> -		    (u64)root_res->start > 0x100000000ul)
>> -			break;
>> -	}
>> -
>> -	if (!root_res) {
>> -		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
>> -		return;
>> -	}
>> -
>> -	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
>> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
>> -
>> -	resize_bar(xe, LMEM_BAR, rebar_size);
>> -
>> -	pci_assign_unassigned_bus_resources(pdev->bus);
>> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
>> -}
>> -
>>  static bool resource_is_valid(struct pci_dev *pdev, int bar)
>>  {
>>  	if (!pci_resource_flags(pdev, bar))
>> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
>> index 13505cfb184dc..72860f714fc66 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.h
>> +++ b/drivers/gpu/drm/xe/xe_vram.h
>> @@ -11,7 +11,6 @@
>>  struct xe_device;
>>  struct xe_vram_region;
>>
>> -void xe_vram_resize_bar(struct xe_device *xe);
>>  int xe_vram_probe(struct xe_device *xe);
>>
>>  struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
>>
>
