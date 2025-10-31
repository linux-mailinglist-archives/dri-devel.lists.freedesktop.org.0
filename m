Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DDC268E2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 19:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1498410EC02;
	Fri, 31 Oct 2025 18:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxcnH5TU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9558210E0C7;
 Fri, 31 Oct 2025 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935200; x=1793471200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HRqF0uirB7CPZQlpRsqLK3lMQGO5xwc6YZuQy4jOQoM=;
 b=BxcnH5TUM/lcwlHECE8X9aYRAiW95Xu/nM4adERjLKafRaQUWD5IrVzC
 +D8ic6jNyegyLHsrfq8yw/5PK9ddVP45uFskOipnDJuNK7ZX0yQSwdMQg
 o5Pu9iTgs8P51Pm9r3z84BFaRs4qZtb+Se8MNIdMKvCHcAi/qPUay1n+3
 kXdKb8kCkX+W8Pr+A8d2BjaaTKsYuSpMj+qUeDO3eYbzHEgFIudHOA+jz
 eQRHSSJgOpitj3GrWSSyjHdU0u8n7GvWY+rQD5AcVyHAaywdQWRislrZs
 ohJ5QPHDLTQunnjOyuzc7UNAxavvaCqWYRGZmkV/JWuAzSBE4rYGSw/Ct g==;
X-CSE-ConnectionGUID: eKqVCEbGSg6/0ZqJVonsTg==
X-CSE-MsgGUID: dPYSD0hxRSuA/o+iEZu90A==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63799506"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63799506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:26:39 -0700
X-CSE-ConnectionGUID: ovpNt5yMQI6uEaSVMP28DQ==
X-CSE-MsgGUID: OpVoDbqcQpSBKCQhbR9NdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190648205"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:26:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:26:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 11:26:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KynONatI5UZAlQulLGOw4qGP7WohkrpTy2mT3I5gsra/rdtS0Z892r3Nz4ypxQx539g700SX7b6Jz1LMdsGggwrFCnugoxtl4+kXEJT7XuhTreepQHEg4JKOOJA7X1eM/S10RsAEM8++ys2denteO2vMfW2ST2YbD3f4UboHiM8aEJQJiqVrmqn/bGdSqx63eujo6KJ/vqU9Ks3rFT92JOa5cXX5vVZ6H4nssX0NLBdsp9WREMZQQM+3CxUBMjgGjRKvH5U3uxswAmfdkUGpPDUJJTTIbaJIyV6c5rKhVCpma+kxp4t9eNl0S+b6VT8yTGUVhk0x6uJyL86d0vIPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyRpzOdsHkawx7Rlvask2VZ8sm/N/fr+P4BH159cbDU=;
 b=m378dajE9Z5tYrYP/XRTzzKnwUCF96OrUXBm+9bIEW+sElU1kE+HQ19HWdLjSGaoADKwBQ4GVQyvrb7I93egO1YsDQgy+hhy4oWbPTMHb7wRgsgQCxd9LHadp3gKIyTNFAdxfRCoYuMJl5e1PwzkRQsQSy3hd9kvjAo7muVILkPFjPsIlTEXEAVqwgVlKXWFQczaifIotOudD3k1BeUr5dlH3ASNzcsN2BC0zRGrGzQ5SUkkfsSaorIiQecjSvwKG6qbSPOA0sYP0oHq3Y1GEjiQLByaaRuhOGMnF7KzliCSAyLxaKqfY9uSVrkVsToAsgdB5UlyrIkRvoV8dSp48g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:26:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:26:36 +0000
Message-ID: <e7b4a23f-3fc9-4eea-95f0-03c1d7acab28@intel.com>
Date: Fri, 31 Oct 2025 19:26:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/28] drm/xe/pf: Handle GGTT migration data as part of
 PF control
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-19-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-19-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: df6340ac-d825-4229-0483-08de18ab064a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cERsWGV1eVlsK081MDdSQTIwMFhWdW9TaTJGWTRkVEtZdFpDaHFGK2pLNTJG?=
 =?utf-8?B?UStpTy9XNlVXZi9ZK0F1NTU3elM1ZG5wYzJKNVAxaW1nNDhZajgvQnlIOXdX?=
 =?utf-8?B?cWJNR2l2OU1PaG51ZzIvNEJIalR6WmxmWTVmUGJtay9nZDY4WTZQL3h0eFd0?=
 =?utf-8?B?L3dad3laa0dKUi9rQ0IzRENKZUVrNnFvRG5jcGxYSUhhK2lLWDRteE00M2la?=
 =?utf-8?B?MGZzR1JJQ0tvU0RRaUFNTVRoa25sMnF1NU9EVWZqRENnd0l0RWdDa25hN2Y4?=
 =?utf-8?B?bS9EeDVzL3ljNjdZaGh2MG1keTkvcGhsa1pyd3ZVWFpRWC9xVGdTUWZxVGY0?=
 =?utf-8?B?Q3haNktEOFFKbzVicmJMV1lNdjRYbktpQ1luazBsazI4NXlvdWJZSlRsN3dk?=
 =?utf-8?B?ZWNDaHJMS0JqelNJeDZSVkc2OTdHNGdFSC83M3Z3R0UxTy9xYUFaYTF2bVBR?=
 =?utf-8?B?SjRhR3pVM283RHZKeHhFT1FPUkxJS0lubUpmM21uNDg2LzRoNExONU9HMUNG?=
 =?utf-8?B?VGRla200Rzkva2VFd1lDWlVjWHl4T3IrTXRQdFgzVHpvS2czd2hPN2MyZ0Ri?=
 =?utf-8?B?N2hzNjZEdHByWDNBeHhQWkh5R1NwY3ZsaCt2REt3WGtBYk1lVWtXZGpiR2kv?=
 =?utf-8?B?UzdSTzZPQnpObUM2Mm5yUklHdmVlNVFnbE9KVlhTRTRRcTVZbStkdTgrNWQv?=
 =?utf-8?B?NmIvYmlLYlVHZVRSVGd2c3F2Q0RpbytqZmNMZFFyZWZmdVV2S0tFdjFGZlVh?=
 =?utf-8?B?em9WZ0pxTUJyVUNUMi9UK0RaOFlJR3VIWlNYczM5ZTJ1KzhkcDl1eUQxNElX?=
 =?utf-8?B?Y2J0WnB1VjR4cHMwaWdhZllkZ29zd0h0Z2dGQW1BNmIwVys3ZVdCUG9yN2cr?=
 =?utf-8?B?OTVDVjhOZDFxeDVzejl4amd2SGNac1VhNFd2NXRvOEMxRmwrc3lWU0pMd1hF?=
 =?utf-8?B?Mm9FdDBlY0RsNndwY0lDaER2YkNIdWNsZDBhSHNEbHRTakRmZjNCTFE5bjJi?=
 =?utf-8?B?M2E3SWhmTi9RQm9vU0JsbDBnN2Z0MHBTREppcnZyN1ZvWkd4dHIzbVJNTnRh?=
 =?utf-8?B?L2hDOVBJV2Q3RUdPMjhhcTFDQzZlalNtZytkTENaamZWZG5PN3VkYVhpeHVF?=
 =?utf-8?B?V0cwajdTN0hnOXBtZmxoM1JjWi9lM2d4dyt5UVZ2M0NBYVI4LzhEa0F6Zkcr?=
 =?utf-8?B?cHRLcmRoUkttZEwzVFEzZzlRZ3Ztck55YXlydVdXdG1rNncwMFRpUmxFVXNs?=
 =?utf-8?B?Wjg0UGZpZG9ONXdhRmtyOGpmSFkxY0RuRUtoem1jUDBWL2FXVXRkVTdGbGs4?=
 =?utf-8?B?TlRxMXZoNnRzQ05DK2FCdmNuQjFkQUJCOGplbmU0SURJYkNKcFFDNm16K3NH?=
 =?utf-8?B?dTFrUzVid1dkWnBranJ4SC9SZ3R3Z21mRUhEaVhnOWdIcTdNSzBJbWFMemQ2?=
 =?utf-8?B?VEdJSHQ2SjBxZ1RDa3MxelJWTlpNTGVJWXZ3ci9nM2JMNHhaZjVYYlNJanVS?=
 =?utf-8?B?VUpLa0ppS0UrYzR3NEd6MzBab2ZwSFp4YS9mZjJVT2pnWEVCRVRUU2xTYXl2?=
 =?utf-8?B?R0IrdGk1dVcrcFpKMnRqUnlMSEJOMHkrcGZMMllBWmJ5WTFMbUNwTTJxbkVm?=
 =?utf-8?B?MzByRUFqMUpOTngzWnBESG9XWlBkVk1hYXRsaU9yM0ZaR2tmaEtwUjFzNXdI?=
 =?utf-8?B?RFc2aXVpQlFUUlZnSXN0UWRNMkVlcU0xSjJVcHE5NGwzUysyNVBsUmF2M0hL?=
 =?utf-8?B?NzcveUJMU2xBaGRESEtPbERtUTdnaUNOcHg1eTY2Q1hja3ZPQ1ZvTERtak9L?=
 =?utf-8?B?Z1BxSVhXL01qeHBjeERZMlNIM0VwaGlCcFZ2WEVHZzJQNkJ2bFhKUWdjdWs2?=
 =?utf-8?B?Q0lZOEN5V0h0WXhadERxZVZvQklWR0JUNVdILzdKZFI2a1BEWCtXSG9pYnE2?=
 =?utf-8?B?ZnVjRzdvUkNqMUw4RzUvZlVuSkVOSjlpTFErWjdvbzYwalpkdmpmVFdyMGVp?=
 =?utf-8?B?U1IrWG54QzZrMUtUM0g5QUQvWGVNeTNBckdPQ05xWndsd2F6N3prK05yNFQ0?=
 =?utf-8?Q?TNBohx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1OcVpQZnR1ckU4Y2dXZXNtTmtFKzY4eC94UVZzWUlQZGtKQ1daclV5dGVx?=
 =?utf-8?B?ZDVaK29tS2RGTCtpc0Y3UEIzYStsKytnNXNsZEl0SmVCNGNBUlVva0FqVTRB?=
 =?utf-8?B?bVh5K09UajJ0NFFQNVlQTVo1MnVKWVVuNzNrOUxaaTdsbWtGVDdvemo4MWll?=
 =?utf-8?B?TW13Z1VEdHYzVm5FU3U4OGJMNU9yU05NVUhkQ3VTR0ZMNFJwZ3BtZ1dlVkYz?=
 =?utf-8?B?ZFVaYUNHMUVBODhBaFhsK1hQeFFsdy9SRDBGeVZaUDhzV0NrTzNGc1prSHI0?=
 =?utf-8?B?eE4wN3RxaG1QV3loMkhTUjZWS1lDUGQ5dU9BMTUrSFpmREZKaklsMVpFOHd3?=
 =?utf-8?B?UEYvRjlhZldKS3VSV2ZrM2VCTmFybitlUWE4OFdrS2t5TktkcUxncXljZ3pH?=
 =?utf-8?B?Y0pPRUk2elo0NTJmWFM4azVwYWNOanI0MmFBLzN6U0xZdDZ4YkZBa1Y5YlRw?=
 =?utf-8?B?Tlc1dnRVNDh0c01TUWNBY3gwUjBuZTFKRnl1YlBWY2ZGSG5JMlJ2L015NnJ5?=
 =?utf-8?B?QkxBbFRPanhhZy90dVR6SWFCd1RSNXpHS3FMMUtJbC9jcVVLY0pRZEQ5STR5?=
 =?utf-8?B?bGUvQ1pzdFRGL1gzOWxmQ2w5Sjc4cFZtcnFBS1VNdU50OUFnZnZZRnpKcmhM?=
 =?utf-8?B?YW5icFlhdEVCNVFPRDNaYTVFaVZGc21LZjBVUWVxMExiYzVBQXZma1VPTjZs?=
 =?utf-8?B?d282ZnBzOVdkVHhiUkpkRzd0a0l4eUpMbk5JUksrSHE4ZUhHVkdxWnBUVG05?=
 =?utf-8?B?Mmprckl2YndFdUlTYVEwRkVEZk1FSFdZV05LZnU0Qzcxc1h5aEZUOFZPQVBM?=
 =?utf-8?B?dmFsVFkvWXhQNENDTDRaZnJqQ01lVW51NjM3alN2UisrOEFZeXJnclFpb0Fi?=
 =?utf-8?B?UzYzVmU1SExRbkwreGtLa3RGQWRKMEN6V213NUdXbkZVNkpZbDRnTm01R3pR?=
 =?utf-8?B?K0JTZ3dPQjQ3RzZTZ3dXa0VUeStrRXRVZkplQjMyREdkM1lYYVR2aHIwMFBO?=
 =?utf-8?B?eGZYVDhUTW1xNGFucTlxdUJNUjZkbGhTeHBla2NiY0h0b3Q1SW10TnJ4Q0M3?=
 =?utf-8?B?TGtoOTBBa0FsZ2pxcThIcC95bkJHRE1EY000U1hqcSswVG1WdVZtbkpRY013?=
 =?utf-8?B?bzRoWjFiaTlNekxEczRDWnJlVzQ5TDNLVXdHWGNTZUp6VDhUWFFpNlhrMUJQ?=
 =?utf-8?B?UzFMVWROS1NJemtGS3FDS09seG1la0w1K1RlME1FL20yZ2pxa2E1anlnb3c2?=
 =?utf-8?B?ZUJQU2ZIeE8vbGJEUG9UbkRtZlNlMmZmWVZWYktSUTR1YTRXdUd0MFFMQmlI?=
 =?utf-8?B?OE1mcUs0QzB2cDFOTzBtUTBzWTNOQjJJM2JrTWpxeDBJUDRuVGZoNjBMZEhX?=
 =?utf-8?B?cTdRdmMrelp3MUw3bzBSaGZrN0tndjJmaW1YbGRza1ZxZzNnNEczdVlsNFZR?=
 =?utf-8?B?RVREeDh1OW5yUU9CblVWU214aTM5ZFBjN1VoNzd5dDU2eTVtOGVvdjBRMytn?=
 =?utf-8?B?dXFURGIzMUlTUVR4WDU1K2g0TGZ1MWQyMXk1UkNwRUdRWUpTQjM5Vk1oOFlN?=
 =?utf-8?B?Vm50djN5SUtDUVNORnZ0RVRqS2d6UUpIczVmWldCSEdUcnFZekdpcEhtTUlL?=
 =?utf-8?B?L1lIS3ROQ2FSd1dHSERNWmxXVVNmcmpRNTRkdnhGTTBvKzJXWFI5d1R6NXZz?=
 =?utf-8?B?aG9FamJCNHlzbE9ROERndkhyRGFLRitDUGp1UEN3VUhXZzkzbEtGRDEzYU4x?=
 =?utf-8?B?TVEzenF0VmhMRU9BS3c1bGUyRUNLK0MvQmFXSU51Wm1LREpXOENya3Exb1RL?=
 =?utf-8?B?YzFTL05PeERTSmVhOU1LenRFMmVrVmhtUTFVWkdvTXF3K1BEWlFrbnRJTk9T?=
 =?utf-8?B?OHVQY2w4c0Q5NHUyTUY4QWZhVE9FTnFlYkZqTkZPSXkzODdzc0NmRzZKaTQw?=
 =?utf-8?B?RGVQN25Nd2hKblpEMXdHMFBhbEVDSzIzRjJ3Wlk5WWcwaGFTUmtDNm1pbCtG?=
 =?utf-8?B?Q2tYQ0pudExPbmxlL2crQ25KeG13NkNVZTh3N1c2eXVudjBFQ1REY1VLaURs?=
 =?utf-8?B?QWU2WmNHZEw4MEVUL2VVUENSdlhxU1A0VnFzNjJWaHgvY2NmbDlEUnRNcGlQ?=
 =?utf-8?B?TnhPc05EYjRkMFNiZU5Wc2J1ZEhvQytIWmxMNTR4RThKaVBZeFVRYkhqUFlB?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df6340ac-d825-4229-0483-08de18ab064a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:26:36.0736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DVOUftkZ/HBtIleVIzGX4Z90FDWMQD6C17YA3NFhyjIq3ghEJvujz7m7WB4Is7PUDKKp4S07zZt5vSl5LJ1O29/DCod/pPed7BpVsrbs1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> Connect the helpers to allow save and restore of GGTT migration data in
> stop_copy / resume device state.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 113 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
>  3 files changed, 129 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index cb45e97f4c4d9..e7ea9b88fd246 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -860,6 +860,16 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
>  		return -EAGAIN;
>  	}
>  
> +	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GGTT)) {
> +		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
> +		if (ret)
> +			return ret;
> +
> +		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GGTT);
> +
> +		return -EAGAIN;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1066,6 +1076,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  	xe_gt_assert(gt, data);
>  
>  	switch (data->type) {
> +	case XE_SRIOV_MIGRATION_DATA_TYPE_GGTT:
> +		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
> +		break;
>  	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
>  		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index fbb451767712a..6f2ee5820bdd4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -7,6 +7,9 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
> +#include "xe_ggtt.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
> @@ -39,6 +42,106 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
>  	}
>  }
>  
> +static ssize_t pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!xe_gt_is_main_type(gt))
> +		return 0;
> +
> +	return xe_gt_sriov_pf_config_ggtt_save(gt, vfid, NULL, 0);
> +}
> +
> +static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data *data;
> +	size_t size;
> +	int ret;
> +
> +	size = pf_migration_ggtt_size(gt, vfid);
> +	xe_gt_assert(gt, size);
> +
> +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> +					   XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, 0, size);
> +	if (ret)
> +		goto fail;
> +
> +	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
> +	if (ret)
> +		goto fail;
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u GGTT data save (%zu bytes)\n", vfid, size);
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	xe_sriov_migration_data_free(data);
> +	xe_gt_sriov_err(gt, "Failed to save VF%u GGTT data (%pe)\n", vfid, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
> +				       struct xe_sriov_migration_data *data)
> +{
> +	int ret;
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u GGTT data restore (%llu bytes)\n", vfid, data->size);
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, data->size);
> +	if (ret) {
> +		xe_gt_sriov_err(gt, "Failed to restore VF%u GGTT data (%pe)\n",
> +				vfid, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_save_vf_ggtt_mig_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -279,6 +382,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  		size += sizeof(struct xe_sriov_pf_migration_hdr);
>  	total += size;
>  
> +	size = pf_migration_ggtt_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	if (size > 0)
> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  
> @@ -340,6 +450,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
>  
>  	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
>  	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
> +
> +	if (pf_migration_ggtt_size(gt, vfid) > 0)
> +		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, &migration->save.data_remaining);

btw, does it make sense to save GuC data if there is no GGTT data on the main GT?

>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 66a45d6234245..bc201d8f3147a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -19,6 +19,9 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  					 struct xe_sriov_migration_data *data);
> +int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
>  
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
>  

only one nit question about corner case, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

