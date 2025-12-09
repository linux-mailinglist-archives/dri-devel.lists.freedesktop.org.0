Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB0CB070A
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 16:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1526E10E1FF;
	Tue,  9 Dec 2025 15:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3aGXOqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EF010E1FF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765295167; x=1796831167;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=z9eX3eS+xxNklkoAzx3NQ5eeuasOPbESQo0lnxBdteA=;
 b=A3aGXOqdPF4S/hCioYIVMEOBvOR4V9P8/UeOkT5jOVGA14Aca1ylqnGw
 ZEAgzjU2y8wfI7W+5Qv7POHzaGoh8n7jHufubnDgPp3pWCzXqBMzXPz6T
 1tBjr9WBIdXSUL+JP3+KjbfpwKvWAQY5dTtRwSJ7+J7bvhNTD0yK/qCWv
 BVz8FxjMrsxU45MpkxMNzx6cXowQISTV9YZqErZwedThEP/4A5IcfXQER
 AZJmPXM7ziu9tEPaUcb3PITzCQvyi03fa4Z9W6rt7vf+3dFDIL104xCq/
 3fv0sCwVoTzvJQiFpQjAzkmxP6dPV68GuzbezuyEi3jyBUVxQKfmzZLa5 Q==;
X-CSE-ConnectionGUID: t/30NygGR8m48crZUIgHkg==
X-CSE-MsgGUID: Yg52VjlPQHaUNtJwf8yq/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66976502"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="66976502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:46:06 -0800
X-CSE-ConnectionGUID: 4czGdzVIQJqB9bp8hhRAaQ==
X-CSE-MsgGUID: xVvZryQWQ4+9GtvKr9LtrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="233660213"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:46:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:46:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 07:46:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:46:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJsfsY4SMMSfqsnRZBZSjlbKu/NAhSHOwiZHMwLLKulglr2vGN8mQlhMOD09u43OCYsfzVwbDa65WnrXwf7V7GlqNB+l04DzHGf6Uwh5IdocnfOt4AhG7XsmprjH7GAZ/ucC/6vw8nbWjb0MkzdG6/J1+v2YruoLkvGPAOiTZY/O3ph9yGZ1tiKEDbJjRujxGBfIP6lOxGDEY1Lw6XIGTHcHHdZJOzPT0+hUBIp6EnNVp71+S3TkvrYf31yBU1LZKZreXyQ1Xdc9r2W8aqZtQCLfKJLUn9e4HV7eDt6W7PdoSDA4s9PTOFcu6QlEaFUiL4QTJ7zGZUYKqxDSTkGdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZisnF9nRxWnrmQa6pUtk/j+tDZMDvBDDsC/pIsDPRc=;
 b=BFPIttfcBTswqAxyrRtyUNhaoEnL08CKtx9BPq1zQrFesEhVdbqgSQn8aPWRQi0ulI765LkTQ0+en7+FDTXBrp9If/T9oKCPXdwZb7AkUJldFQ8JHoG20QS+M8CInHqfz+yN8empPgIuGI2CRXkQfFLMCBvVGoXmGV+orzugamfc1YPHVcSkp1Vpfkv9AM7z4svZDavs50sPHBr83tpLWoqN0Gw2+QQcnAR7FT89p7+5Yk6gFUIm4oDFbXbtUHEhTpxNuMX0BpJapQhgJHc+VFgt3DXgVup5/KA2pSL3iZdnTNU+REbthFe6jPiQhVHZHNUQPFEEerhwMmcaTk3E5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 15:46:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 15:46:02 +0000
Date: Tue, 9 Dec 2025 23:45:51 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, <linux-kernel@vger.kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
Message-ID: <202512092317.8cf778a-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251125104443.82974-2-phasta@kernel.org>
X-ClientProxiedBy: KL1PR01CA0074.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8e1cec-5d24-4aee-b275-08de373a0ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KG/zLaQSOh4SsHRz7ZqEyLqjNIn0PQmiZCenxphip61vpWKry1UaZZueGn0n?=
 =?us-ascii?Q?nr0dkdHcJ1rrRuBRSFKp95ex0dXqe8jaj4OShmEzXJe4DBGab/7Pwfy32Gab?=
 =?us-ascii?Q?si+lR7RBMZ+XDWFmoXSvio7pULfoJeP8So41ExF3WpEURpBZZOapDt8XbIzl?=
 =?us-ascii?Q?S68qmcenN3JjDG750JbRsX9a58y9xbvGgmcJPwq+BATGq+K7Sd4qhKo3RWDw?=
 =?us-ascii?Q?pGXwziCy5tak/pwR3cQVvwwdQljBSjozpPNj6MyoO2Papuq9YavbZE1XkrUa?=
 =?us-ascii?Q?a8l9XYwddHvmOmZWjYt6gZ11Dg050qZVVQrlwQw426eq28fB19VOdNgk+1TB?=
 =?us-ascii?Q?TAzAMpBc+m5zMj8WqGPBoiS6caA5cE+SEhxarKLdfuvVK/9c2OSPWDEuzYSP?=
 =?us-ascii?Q?G1Mu1a54nFh9rPkC1O2VvjWhe+QutwCQFvVHL7CxN7tQtIhXozOXd8vs6Q/M?=
 =?us-ascii?Q?JeREmBlt4M/4WWyoY88kBkLVEksw2+rNbwqFYOVoaZ0cONPL/JM8W2csI2Vi?=
 =?us-ascii?Q?jBr6cFeLiimqX+fOtdH/xAn92AIaz5zwcHMdOHP2JqiVjgIJEO2KLJM4SyOR?=
 =?us-ascii?Q?9Ge9+sruYG5fabD+vcY8NQGYQJordxBKD3CDHd3454TguQ7dDX6H5+xEE3iq?=
 =?us-ascii?Q?6TQzOaalGaMT9dQp5cKH+BdzrBnkLkKT+E7OZo8oljmhuI2zKp6hivrGoHVo?=
 =?us-ascii?Q?vYo+cyER8qPNyJRJAldvk1hmekcbiNiTcEWwzoqsIZ8/O8sQ2UQ7+J3bibgl?=
 =?us-ascii?Q?7B9E5XGxyFqZCiTvZNhlNSd4YNax0J567nZgGbHchaNO3p1LMeeqTVZwT/r8?=
 =?us-ascii?Q?OJLCbkRpkJpzHybpMlQhdBVSmJSwWdB8PlkUphfz7GWlF+HEPM5ir+M2S/jC?=
 =?us-ascii?Q?9GcnhdJjQYM4DU3CwfKhX7pnaUoU5/xDgkbsGIRLfW+Y6pqkfbK8QZrRuB94?=
 =?us-ascii?Q?QymS5lsX4D39cPUCo71bXtw3cdZrii2qidtUzkIQ8K4+tyRqZCDxi214tlgx?=
 =?us-ascii?Q?yyrQnzxRYiJfYOW/xcCNVco+eyhSmH5Zu4M1naO8jw8hprz/qckUo5Ww71ym?=
 =?us-ascii?Q?M5yNB+3PCnsdE5nG6t5w/1LkPgEguUNJ6yz6rWO4qqeXMpFKoXxyb0Vh/S84?=
 =?us-ascii?Q?f5yuMlXwRDk1s/auWegL/P319fWayU1UlLojP4JxoYwEzrdENvVsyfiBTRDU?=
 =?us-ascii?Q?DhXuR6Ntbm59H3sGSvSeQXj00l/nFhH5oT4JaBsvPDNa81e7CttjFBzErMmF?=
 =?us-ascii?Q?0gh7X1Ebf3ZYO5DrPSxzyOAdaptqjcBzEpK6JFrMXFJsPy04cx/6Qm4cglaX?=
 =?us-ascii?Q?cmMRL7jgQwszkVvGOF4DeDngOMEruaOz7pGb1yY6Cf1x6VzLF83RR769/xVJ?=
 =?us-ascii?Q?yXY2ANCUSLuDVNKE08K/Q0utVUkc5J5OtUtsANvpsQyn5Cnl9Ktz9EE6s3RQ?=
 =?us-ascii?Q?PNpk6nGIvAU7mT61Evr8tWToDY9PcdfA58oZsJvg36Y727FK47zpdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cp+H1y5Ldil8Cp5bH95SUyajWGqKcZuC8F//yDNgbZCohH3nDMXNbikaghSx?=
 =?us-ascii?Q?OHmVKTyyXXPr/16iiYmcoCWbsxxIrrMemE/uVhIAwp/o6ETELjVlc/5AUxx8?=
 =?us-ascii?Q?2JTR9P6hA5Eu91DsAO3Vwi1uS5l18qHDReyzo5+jD5Q9mB+cVCuvK5fKgSRr?=
 =?us-ascii?Q?yKwygpDN8aNshVR4opLU65cv53+R4aiUy30+f6VjZUf6lxExbqNTqNf7wL9y?=
 =?us-ascii?Q?PNyGvUuGBj+qGC561ykeE0rpaGdvBtIKiRPIgfdrvvJyC+/L1iLdunATHjbX?=
 =?us-ascii?Q?pL0ZFbPXuPXDG8NRafeEncEMdibg0Bh4aRJdo9SdfaH37kCv9t+I1dSWUuqh?=
 =?us-ascii?Q?CIitEuAlNQ2lJ4ci+GYdJ7h9CEjki1jYSjj96izTEGuVEPgVtg2/9Q2+Ppiq?=
 =?us-ascii?Q?4ptg48FhwUlVJCgPSvlctJGQA7EQyH+UeDnvUu6BRkzZUyn3UyYTFVEQMXk9?=
 =?us-ascii?Q?Ez9Syfn18GISAPZF12vQtRdqg+t79xaTI5tf42fB0Ml6kXEzm1UWWM719Uwf?=
 =?us-ascii?Q?6YUtxrxdbfk8J4ZVCZSBIxGNas1HokdSBLuHDEbSSSSXzJKhZecnUT3jse6q?=
 =?us-ascii?Q?WsX8W6q/P4wnJJJBXRXiob8bueFp4xhmz4VqxTTU18NlzCTtvY8kB3YORoxu?=
 =?us-ascii?Q?63hon5MbMf5ebU3LkCXu3Jvb8o5HExYUS1sA4w1CjKbiLSiVYyUM7zShv0uW?=
 =?us-ascii?Q?sbiMzqshDac+6Tehbiipv6kMzjqp0Dh0burff2h+P3mfnGE12aulloesNOv9?=
 =?us-ascii?Q?QOwAenkAwkkfyk2eoL+o8BndHli2YbGGSCt1oPvtzanhdBnXSOqlVlcVmofr?=
 =?us-ascii?Q?if6ofb4LrnjSqYpGKfYI09vzK/JziXHNz1I8UTaGgvNr6VquckK7j/i9xOjY?=
 =?us-ascii?Q?GEuL4j41+B5SjEDDO48O2dSpx/gQJbK/RM8jUNzVhV4r4j+2EloieswJEbJg?=
 =?us-ascii?Q?EZjye8buoKn7DHFUqwYagCuRF/X4y9mQJ/ILf080IS4ahjYGm5xcGLLz3M21?=
 =?us-ascii?Q?ThyZWl8ps4G03zlEEvwgMgncyS2l5GoJVB4zD2YXCTARUXPFRzSXpf5XosqU?=
 =?us-ascii?Q?7WWjqwcmDD5HXLjCIzH33IWENhYVBXrPgXAc1UQZRMx99IambCpc3rgYej2v?=
 =?us-ascii?Q?Kajxb0XxD070bQTAwQHIQyL5KrB81mCrcpq4UhwMGnIie/0v343b/86zAuxG?=
 =?us-ascii?Q?QpJB9PjeEeXU4lpxVuBrZhk0D8S3mKx/xzSZrpolC+XOTxWDKYOJkElqVBVb?=
 =?us-ascii?Q?Y2u8DAKc5C+kYNn8f2A7i/RnhD7C5Gj4ijCzLrrm4DfNYBCNeXz8XI+XKe24?=
 =?us-ascii?Q?v6eleXuza1E4QSS5o1vizdvh3KbbkgVw/WTnjN2CVglIPtRKHhd0PvENDC2p?=
 =?us-ascii?Q?cLgM1ppFIrongr+WfcFAEkK2qsBpfQ0AXKLUWixSiZ5exCdK5vZzhT1edA+o?=
 =?us-ascii?Q?whVCHMsYTUw7S3OjOZSEZIjfTCJqud/o88WcNpg3FuhakOYXDko5lM82bWls?=
 =?us-ascii?Q?rTRV0yGgVxrMPb7kts22AfqQSKudn8o/GRlnIf4HdtI8BqVBH86VbI6prd/6?=
 =?us-ascii?Q?14578dZAoZersWa/tncET9rpG1l+efgKcS4JgJ3MUni+Ltx5OaGTnCkdNFLi?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8e1cec-5d24-4aee-b275-08de373a0ebe
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:46:02.9437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qhTQGtzAskQNtJV//nQ/B7GaR6BLiz/eQo1w95SEeUXNzHNQEzjEDZl5q7gvuLQAT2DQwQrRLk5uruq9tv7Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
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



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN_PTI" on:

commit: 142f20971642be40507d3a0bc94e905e251db81a ("[PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()")
url: https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/dma-buf-dma-fence-Unify-return-codes-for-signalled-fences/20251125-184735
base: git://linuxtv.org/sailus/media_tree.git master
patch link: https://lore.kernel.org/all/20251125104443.82974-2-phasta@kernel.org/
patch subject: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()

in testcase: lkvs
version: lkvs-x86_64-6505b18-1_20251124
with following parameters:

	test: rapl-client



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512092317.8cf778a-lkp@intel.com


[   46.662293][  T179] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[   46.680656][   T40] sd 1:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
[   46.682302][   T59] i915 0000:00:02.0: Direct firmware load for i915/skl_dmc_ver1_27.bin failed with error -2
[   46.698362][   T59] i915 0000:00:02.0: [drm] Failed to load DMC firmware i915/skl_dmc_ver1_27.bin (-ENOENT). Disabling runtime power management.
[   46.711256][   T59] i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
[   46.725941][   T12] Oops: general protection fault, probably for non-canonical address 0xdffffc01544551ba: 0000 [#1] SMP KASAN PTI
[   46.725953][  T179] ------------[ cut here ]------------
[   46.737600][   T12] KASAN: probably user-memory-access in range [0x0000000aa22a8dd0-0x0000000aa22a8dd7]
[   46.737612][   T12] CPU: 3 UID: 0 PID: 12 Comm: kworker/u16:0 Tainted: G S        I         6.18.0-rc5-00236-g142f20971642 #1 PREEMPT(voluntary)
[   46.742889][  T179] Fence 0000:00:02.0:[i915]:9:2 released with pending signals!
[   46.752212][   T12] Tainted: [S]=CPU_OUT_OF_SPEC, [I]=FIRMWARE_WORKAROUND
[   46.752217][   T12] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.1.1 10/07/2015
[   46.752220][   T12] Workqueue: i915 __i915_gem_free_work [i915]
[   46.765216][  T179] WARNING: CPU: 0 PID: 179 at drivers/dma-buf/dma-fence.c:555 dma_fence_release (kbuild/src/consumer/drivers/dma-buf/dma-fence.c:555 (discriminator 1))
[   46.772517][   T12]
[   46.772521][   T12] RIP: 0010:__list_add_valid_or_report (kbuild/src/consumer/lib/list_debug.c:29)
[   46.772528][   T12] Code: 8b 98 fe 48 89 d3 48 85 d2 0f 84 af 8b 98 fe 4c 8d 62 08 48 89 fd 49 89 f5 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 b7 00 00 00 4c 39 6b 08 75 43 48 b8 00 00 00 00
All code
========
   0:	8b 98 fe 48 89 d3    	mov    -0x2c76b702(%rax),%ebx
   6:	48 85 d2             	test   %rdx,%rdx
   9:	0f 84 af 8b 98 fe    	je     0xfffffffffe988bbe
   f:	4c 8d 62 08          	lea    0x8(%rdx),%r12
  13:	48 89 fd             	mov    %rdi,%rbp
  16:	49 89 f5             	mov    %rsi,%r13
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df 
  23:	4c 89 e2             	mov    %r12,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	0f 85 b7 00 00 00    	jne    0xeb
  34:	4c 39 6b 08          	cmp    %r13,0x8(%rbx)
  38:	75 43                	jne    0x7d
  3a:	48                   	rex.W
  3b:	b8 00 00 00 00       	mov    $0x0,%eax

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 85 b7 00 00 00    	jne    0xc1
   a:	4c 39 6b 08          	cmp    %r13,0x8(%rbx)
   e:	75 43                	jne    0x53
  10:	48                   	rex.W
  11:	b8 00 00 00 00       	mov    $0x0,%eax
[   46.779267][  T179] Modules linked in:
[   46.787293][   T12] RSP: 0018:ffffc9000010fac8 EFLAGS: 00010003
[   46.787300][   T12] RAX: dffffc0000000000 RBX: 0000000aa22a8dcf RCX: ffffffff82f5859d
[   46.793179][  T179]  platform_profile
[   46.803018][   T12] RDX: 00000001544551ba RSI: ffff88884fde5c90 RDI: ffffc9000010fb50
[   46.803023][   T12] RBP: ffffc9000010fb50 R08: 0000000000000000 R09: ffffed1109fbcb96
[   46.803025][   T12] R10: ffff88884fde5cb7 R11: fefefefefefefeff R12: 0000000aa22a8dd7
[   46.805219][  T179]  sd_mod
[   46.811413][   T12] R13: ffff88884fde5c90 R14: ffff88884fde5c90 R15: 0000000aa22a8dcf
[   46.811417][   T12] FS:  0000000000000000(0000) GS:ffff888848e3e000(0000) knlGS:0000000000000000
[   46.811419][   T12] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   46.830755][  T179]  intel_rapl_common
[   46.834463][   T12] CR2: 00007f3bc83ae000 CR3: 0000000868388002 CR4: 00000000003726f0
[   46.834467][   T12] Call Trace:
[   46.834469][   T12]  <TASK>
[   46.840348][  T179]  snd_hda_core
[   46.848115][   T12]  dma_fence_default_wait (kbuild/src/consumer/include/linux/list.h:158 (discriminator 1) kbuild/src/consumer/include/linux/list.h:177 (discriminator 1) kbuild/src/consumer/drivers/dma-buf/dma-fence.c:800 (discriminator 1))
[   46.851758][  T179]  x86_pkg_temp_thermal
[   46.859527][   T12]  ? __pfx_dma_fence_default_wait (kbuild/src/consumer/drivers/dma-buf/dma-fence.c:778)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251209/202512092317.8cf778a-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

