Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C29613C7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3F510E35A;
	Tue, 27 Aug 2024 16:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhAe7YHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742EC10E35A;
 Tue, 27 Aug 2024 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724775276; x=1756311276;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SK0tl7O33iEoRpaKUvw6FBFGy9OwRFHi0iUBz9QLzno=;
 b=nhAe7YHzXeyZN3SNoLN6hwApTy7HCFvCcGmt5XF0r7cxPLd767+AmGOz
 ygTpjCcO3kQ9Pbzwz2/S2iA8QWPgjH32ENkdFkzntrlJdHIbaBj0ehNn/
 tzHM6BGrKFxoOa6Ks5awlS8RPSQ7RYLXO12zHOGYwyNG4gnv8ZQ9sdef6
 c3IhiLrIG2iZJsgt7h1JTRDIros1alXscHT5mSfKZTb63UzJDkrQ0QPo7
 ztsSETdrpkdfNYv5fdj3D5+uJlybCm6C/GSdnDpEcahcsBg41xGYM2s/D
 slJfllQzQ8UZXxgYlYR7RJ4yHc2oW9oIPd/ioZjvEj+KPXdG0zRCVbm2k Q==;
X-CSE-ConnectionGUID: dlAGEgmgSPamzwyNVbe5iQ==
X-CSE-MsgGUID: gPnL/YBDR8WIAolLwAeNcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33890379"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="33890379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:14:36 -0700
X-CSE-ConnectionGUID: d7iUd+ZZRj6DSi4TEthJtw==
X-CSE-MsgGUID: LShzNJG4SiuQ4Lb5bdRWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63627824"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 09:14:36 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 09:14:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 09:14:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 09:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzjyZC4qqA0AkPSJKl+EV4dxnvlljbGdybKafKl/FCZRDeSv9pLigZLbBbuvXDYTpw+XE5LEyahpl448Bb8xhas1MUaP2WEKep9YPSaKoK/PuvR8dOqAZoS6wyJhZ3xecjndMNYHvw5/dVFk2OlLYa7yM8OSkmBRDoPHVOxck+wCbi26XJOZvJO5LOqLyA8rOoq9zKpdZMk7l3+4GQA80QrjjuMdSPrnBzF6R81q8Ttcq8jFQ4uDxvSe7m1aCWnlxqi6J2NnVIpZ9uj8R+4wl3ItmmKuo02OiekPZ8Wx0s5BtkR+RXoz+mf/WUS9cuOZanj/tYy+dhlEhCKNus4uCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNME/mKWDakrj0NL/ya9+MAz9lyxod9ocH8LWBqu1yc=;
 b=YBMkkvY0I5or7yxUyMp/XI7Xfs573g2E/U4JaBSdh6GmXs9rA2CyJbZ3eg8qzSyeZQq2XiiFsmOTouz2r1jtiQRXVZg7dNhoBUmqCZhmLbFuz2pGE3Ubm4FiMjQ/pOIDJ7vh08tW0ejDFPS0IY3bpEOzdAXOA7eXYmvjaqcd7FvIeTXRHaXMYwetzJMydhXrd0hAVwqkhRGSsNm1h9Puj+Bf4KheYQ5668vBZ8sZCXX/CDseeiQeno+zayYOu9FO8epvFfwya8P6P/NVHEviYQFntXFdt3uukgLFU07a1ylERfGVzGFMcsGA2y9JzbCLRRQH6UlKL38kHErfTUFTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 16:14:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 16:14:32 +0000
Date: Tue, 27 Aug 2024 11:14:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] Revert "drm/ttm: Add a flag to allow drivers to skip
 clear-on-free"
Message-ID: <lkifmjwznygo346uj7qeiz26re3npuk2i7zwnqqsyas57oskug@ztlurybma6ea>
References: <20240821095035.29083-1-nirmoy.das@intel.com>
 <20240821095035.29083-2-nirmoy.das@intel.com>
 <447e4cbd75e14e80b7d29e0e3b1859239b9e6c9a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <447e4cbd75e14e80b7d29e0e3b1859239b9e6c9a.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:303:6a::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bd9bbf-ea00-4dcd-6770-08dcc6b355b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GH25d6icPBGR36jGx0gN+Xq7qgdBa3lhWo6dByHTUxCJbdQAt4bnhVlkyr?=
 =?iso-8859-1?Q?Sc7fnHKAUh7WjOr1k0XOVZxlN0yUWIu1mj08B2xA5t89wLQvPNXgiwj/Xt?=
 =?iso-8859-1?Q?l57NywF1idm+7ACoshsXfmqXTI/9B9LDtuN5lU9dAevMGP9Cax2UBOKURJ?=
 =?iso-8859-1?Q?wAlrKIrLL42CZEOXHoKK92Yp3QVdS2UCvFhW/HWP21RrkNhtyrQJaujipn?=
 =?iso-8859-1?Q?fSqXt/4VmNqVACK6yRs27SlHXlf89MlUX29fQA53uhxmoXh3PJEz1VxF5N?=
 =?iso-8859-1?Q?X428hv1thlmARUPthuu1TTQxPGHY/LVu9sVpDHGT2JY3G9fSRg9lA42NAA?=
 =?iso-8859-1?Q?1YKbIoEHD6eMOfFjezuPZIfBPZ7bqD73HOg4nqC3cvNa+KYYmUAQiO2Y9/?=
 =?iso-8859-1?Q?GZ7fbfA1WxxPtYBQn8bCU6EcVsADe4u3Anje2m9HCyHFATiUWwseQKFs7N?=
 =?iso-8859-1?Q?+dnRYmTsYpacJX6hZTL4L8Bi+nCUEK1DFZHaJSURbUiqs34Pj5tViy43cm?=
 =?iso-8859-1?Q?X4lbWEfvwJGFNTCImG2yXJOwErxLwOIX9UwxNJSvBXY9Bfn6ygYGYFmujz?=
 =?iso-8859-1?Q?3vwS2JwYZjmtm2xTgUmJzCYchpD5jlx4g1qGO8jASNnfODTCPt9/UEcnN8?=
 =?iso-8859-1?Q?HnKTLTKZv3+uNqLK/vJaForKvxAkpS2NYw/oXYdrr4t9B7i+P5tGTQqzu+?=
 =?iso-8859-1?Q?cFSd336yFqV7kkc3KwiUBjkciWZlnRRxgMl61oFgIbMmW0ky3HYgQOLu1F?=
 =?iso-8859-1?Q?LVEyEbRs24cBEhQox/LfzuJg0wZ3px9HQJN/gC18IQ0raEw3LeENEuJyGR?=
 =?iso-8859-1?Q?OjLK5FYnuG/lTL5l2qVllu78QhKjtXN9XJTsD5Mrlp1neYPY4/Pkzct7di?=
 =?iso-8859-1?Q?wVsnSTkxMpEdCWakUfEP18sym4hWtKX0a6Lh0UAHsRrCY3ljPc51qV7d1m?=
 =?iso-8859-1?Q?ut7MQhAGovehNVTu4axCeg+VU1SN4Ze7ySk6wNWWZkcrL+AiLr/yuw9BaY?=
 =?iso-8859-1?Q?IEb4EnztGbb5pXr20nvPmr+bsCyFnaOljBnAQ3xW1eL9NEUOAeGR6nHTBF?=
 =?iso-8859-1?Q?/LZ4APcx0cysg/xoQwPLAUlVzL+KR1yuLVOYzwtof54kcNa6c4lI5y+iur?=
 =?iso-8859-1?Q?j4XQaeX1P8xynSXmiNTejLH2VuLGuStKLhgrMvArEeosB/24EG671y7+al?=
 =?iso-8859-1?Q?mkYGK/ANm7cvwDnoAox22QSTTkwoqr9716VBRRiAGSbZAIuXpbACkLigQJ?=
 =?iso-8859-1?Q?Zv91RjZL2ikwJjj8ewaCd69d/LTLWkyuQDnpWYzb2hjwSChXaL1K+u2nJ0?=
 =?iso-8859-1?Q?MrHeXQA+XAAPOkoNmexOEzLKcmZQHhHfaVA7fqnmAFB0PC0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Wxv/9iz8se2uNQSoLRdhB39Z1CawSvIHo4Xn9B6NjpNlFbRdFVFgLJmW1B?=
 =?iso-8859-1?Q?D57i8ynxMkfAfbBGtsGScLUT1/oVIJBs7SrHYeZKiNVWb/aWjztfCRqYJo?=
 =?iso-8859-1?Q?GEcOPXemqTM7YYS7dWC4+R3M0iI1bn2lEJYbziZ6KP3tADPdFlcFSuBLoR?=
 =?iso-8859-1?Q?fUABMsvzBgPUEHnI84FcyAxKLsSM5bYM6DEf8jmkFXelSjtic/tV8La+RX?=
 =?iso-8859-1?Q?+Cca/xvySkKoj+brCFAUNIDlPLxKi3/1H0GfZznPYs+WFWmA3b0WjwgQOW?=
 =?iso-8859-1?Q?RFDfHo8Fiqp9zruje5WJ6LMWYRdumAhJKSLJ712JbzUrBb0bHzvlLkjgJG?=
 =?iso-8859-1?Q?pcYrScTpQ2PC+wpQ0XISkr1L9eP4xxOdTU9kH3o+JE/t1PIpbICH81nj2j?=
 =?iso-8859-1?Q?0AoZHS80DRLFLzGTYXXOHVaMz40EYW05EhwycWLjJ46qb4p9XUmxDLELZD?=
 =?iso-8859-1?Q?fRIN3wFhbdBKUrfGKOGhtZySW2yi0H/sfdp/rYU8n+mtlFfACcrwDwHt9J?=
 =?iso-8859-1?Q?BM8x2MLdaS5MaD7w30ZxwEyjnfy4PhRc+QoIvvmeiFsS5c4IRxWwxQCcg6?=
 =?iso-8859-1?Q?Q1VpOlZv5rxVWuzBAQmhBiqXZpzuWuw0vmbPpGuTdyEZg8yOq8G9EEnH9+?=
 =?iso-8859-1?Q?tHNGwDSHqHAQt/4hgj5XrjfxOW/e7j9IUY00GRc97G0HchkNw/qNrv8fGb?=
 =?iso-8859-1?Q?KxZ5JnAhzJ3Rw4iV6iSv8sP4StdTJhJs6s4luPBZBHEavojdu+VZ0pWWN8?=
 =?iso-8859-1?Q?rQxuI+VAA4FqXf57qm5ClQmW6KJl3i3sJT+5n0n6Ijy/SKFwiR2MK9F/Rv?=
 =?iso-8859-1?Q?6uAC2sIkY/tnpXVzh4Ms+O8TheNzbkOecQvI1VSRpaOtyV0zkJmTCtTJ22?=
 =?iso-8859-1?Q?J2adZXRLAg9F+GsWGOk7qXAaOKzBcoqBI/3XsPNGnCZJk6LsYHFJh72ZpK?=
 =?iso-8859-1?Q?kwekzBFW+SGvpYrPsE4qQEuwCRaZ9CpopjVr/6YX/THNw+chZjmAwu3s0i?=
 =?iso-8859-1?Q?i0bLctpDsSpjV1dGjEkKwMAkVLVRpFW/YKRBX2FQ6chd+gXHpEY4j1HLOx?=
 =?iso-8859-1?Q?x2xqcmWsdwS04zszdww9gagmWWbpPJm6th2k2bmqmI/v6WgpFN2oVSRcEN?=
 =?iso-8859-1?Q?8CXzpSVj+Q4qMSr3q328CDEcg2YZTno1nQyS/HzspzNLlR9Fn1cTlymhoR?=
 =?iso-8859-1?Q?S5J2JVetxiU1aoYHefRGnjOnehnTfMZSZZ1hzx0zXpc12GH4d/9cFOUfSx?=
 =?iso-8859-1?Q?wX1ztk7/I/4gg7/eESGO4d6IObJ9w6GK3sd7mQ1pwDPZcE0Esv0uLbONrQ?=
 =?iso-8859-1?Q?dnBA84DsnfiLsvlIopqSz+KVZ0sPpVWT0VuJiO/IELYOarBZ6YhW89agv7?=
 =?iso-8859-1?Q?j3xaBLW4MO/0e7+b308dYxjAOtnpIskkSMI6n0GzVedgHpLoxoocKAakrP?=
 =?iso-8859-1?Q?KZWNCydw+rOmJczexwnd7c21siwOK2467ussIXjcP/6clBEswCq0cGB4Uj?=
 =?iso-8859-1?Q?Vrh2Tc9PRHsbgiAOE12vQ4C3bYgOusm37tS+p/f8u1wkAMWKWv6joK4XIg?=
 =?iso-8859-1?Q?7ukMz9kcNNPCBzGe9GVKoWJo0z+2DQBSI1xq7hakn8xz/CNVFR6Nw9pUCh?=
 =?iso-8859-1?Q?L2qbfsUNof2U25Wwso1nvRuPFEyUnWupz7avjEC6+C+mXbTp731exQJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bd9bbf-ea00-4dcd-6770-08dcc6b355b3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 16:14:32.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8FEL5m9jYf1EApAoFuuFxrG89eBYOHAFSP4SzYNDl2vRZ26pYcAMvsJTl2LJGINDYO0PM0KFG8olB4Q484/7T/rfTiPc4jnPTLT9J7uJ1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
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

On Tue, Aug 27, 2024 at 11:42:59AM GMT, Thomas Hellström wrote:
>On Wed, 2024-08-21 at 11:50 +0200, Nirmoy Das wrote:
>> Remove TTM_TT_FLAG_CLEARED_ON_FREE now that XE stopped using this
>> flag.
>>
>> This reverts commit decbfaf06db05fa1f9b33149ebb3c145b44e878f.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
>Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Christian, since that commit being reverted was merged through drm-xe...
ack on reverting it in our branch? It's actually the only branch where
it can be reverted. AFAICS you agreed with the revert in
https://lore.kernel.org/intel-xe/02a383c5-db18-47ef-9118-72effd83a252@amd.com/


thanks
Lucas De Marchi
