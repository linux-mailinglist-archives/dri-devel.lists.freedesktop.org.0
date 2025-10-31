Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C7C262B9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3147A10EBF2;
	Fri, 31 Oct 2025 16:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWWk5YgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513B10EBF1;
 Fri, 31 Oct 2025 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761928928; x=1793464928;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gSafGoFPEp7BpKihCdYky0NFDY3fNQZL5fMqD88H/Rw=;
 b=gWWk5YgMwXZI5m6Ge3RLaAI2NFakKUz8+XP8MlKlxZfewDDaLt8BBZ0H
 plBvoOc8cWDJjqOpa8lXsPkHGSErLfNSRqzRPwmq74v6KmyLt1/S6zwOd
 9RybMCduve/pwSP6TIU/rtsCUnlXaQ/H9kPXduLaF9OQJG9UsdIsk3SPk
 b3LXtO9KwrM6DjxZo5T1fQCPzSmOfskMGFHW/K8aWxsm3ft3qnevbfWgc
 0ZC7LJg0yu6KeKYQCnz2WXNdljr8z3TRWyOOQ2/kF/363CeS+nnMBDmB2
 Rhp25ml3yghDBgEiEL5b7LYbdopiUKJg3TlxF1YJp6SGlGYVH4pHYVHmz Q==;
X-CSE-ConnectionGUID: b0Imc7ZJTyKUQFkzwPsJRQ==
X-CSE-MsgGUID: 7Ws2mCm9TG+n6JVZXjLUuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="51665455"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="51665455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:42:08 -0700
X-CSE-ConnectionGUID: IVFqzwL2RraGEWiwR4IoFw==
X-CSE-MsgGUID: MgcyzYmjQjqy8obwzwxrJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186214041"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:42:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:42:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:42:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kv+DcEiRotcrSqk8Lr3STYwzcABeRMMgXFg3cvxJ1nRl0OMlQv4ktWaVEXTXLXw7AYKYJyIhrMadrDy+he5AnnBcFVQ1qOdeWPgUvgYNcEZWQnMuY+SoY64g7zdzy7GAKe9NrhSHe37bCFSryewjha2IE3HZsXVzxZ13xh258oKpPiMPSdngFE2oQJnfVrK3dtt98gcaXmjXpj6kn05hQbxBOZ7uPyhqLQA0uV0IGVzqcTKL0FL8dJk/EholMmd8ROi06AYcD274y41oMLxjrS7SZKpGRM1nR8QwcF5x8hK0etwOogOh3zuOmtG57uET2B5f2uQQBCkgQMaLJ7uKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=839dnX3WGJjujAdXvOPO/B9iKGp2/wejwoq5its3SJ0=;
 b=t7duHB4bxTWX7WT++GOyjJSfY3RxEIs+tl4yG7C51b2Kh22BMOEjx6RWemZWHdukDMTx1dH7myt31YtWkEbbsN6CNtvaCgs7i+6Exfc9KcX31Kjrr7XVW+9dvnvKoMBJLTMA5nGKugNSeNbfqoEcpx6oGQMuFjQYDmaCjMmVoE7faF5PytzA2VQCeTYVT1pLr4mF+qlhHArsZRpwjCAcEyY5xRjoTx6w6Znxz4Ep6UQPn5hu0d7seLDvYWKEn6CrdL/S6MYUhsi+s9hgzuZ9MG0F8fIQjs1ztgNECeiMGy9s3dryVpNPTWD5izful4hxHe67kZEYHOVfnx8iyOYS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL4PR11MB8823.namprd11.prod.outlook.com (2603:10b6:208:5a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:42:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:42:04 +0000
Message-ID: <fda784ef-0817-43f3-a058-15517f5c38eb@intel.com>
Date: Fri, 31 Oct 2025 17:41:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/28] drm/xe/pf: Add minimalistic migration descriptor
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
 <20251030203135.337696-9-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-9-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL4PR11MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 10864c94-11e4-4d59-8e82-08de189c6ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2pQT2N0Qlc0cWVsandQSWFYTnVCK25keDlLMG1SMy80dWltK21DeG01M0Vs?=
 =?utf-8?B?UXhZN05aR3VaUUlVdVdSMDgrdWo3NXR0S1RwS1UyT3YrTTZyUWVzWTVFYnF0?=
 =?utf-8?B?RVh5SWwzSWdSM2FXZTNjT2RaeXA5MW5PbHd4eitnV3JIN2JRUUVUSEs1TU96?=
 =?utf-8?B?S0dURkVCcVNXRW1nQzhRNXAza01pdGJOUjQwUXVvV09TY3RjUnFhMzhRcnJR?=
 =?utf-8?B?a2ptdnlwVkg3TUlpZmpVc0MwS3R5UHJCVnNpc3VGZEFhZGJhQ0RVMDRUM2Rw?=
 =?utf-8?B?Y29EUWdvSVkyVTlqTHIrTExIN2tjTUEvblErZ05UaFJqaGRoZmt0OXNRbm9T?=
 =?utf-8?B?MitKa2Nib2puRmJIcmg1b010bWhjVTVVdzA3d1l1R3A3NVFJbFBmRko2MnA0?=
 =?utf-8?B?WVZLN3Z1dlVQd3djaTQyamZreDVMdTEveVZNVmQ4Y21JbDM2aHNUZ3E2SkQ4?=
 =?utf-8?B?eGR1YzZESFR4Wk5GVWZCdGUreExNZzQzZmsxTW93WWwzY3lpZzkxWVBhOVNz?=
 =?utf-8?B?WmM1bVFqMGhUSy9saVJGemxUMGFYR2pVRjE1bmM1c2hiaDErOEdlTytpREFS?=
 =?utf-8?B?elVlbkJ2THdGMjRQMUI0eGQveFM2eTVNQWNEd1A1MXYwNFhmVmtST0ErTktJ?=
 =?utf-8?B?NmZRY21OTnY0QzZ6a3BBc05oTGx2S1BWYlJzanRTc2FBWTRmUnUvUkdUb045?=
 =?utf-8?B?V3d4TFJUaTQrWmdGYlRXREVMTWJOdFpwcEp6UXJUZmd6Y2R3UDZ5UnF3ZkRF?=
 =?utf-8?B?WjhFZ1NLbDJlVXc4dDArVmI5N2pMaXJVZ2tweXNEc0toUkEzaHJ3Y25tUFdw?=
 =?utf-8?B?YThtZFZSSUdsakFQK2lUQnVkRDhxYkd6Sk9GT0RqRWxlWmlvb1lOSlltdlhS?=
 =?utf-8?B?dE5IWDdtN2lqcFlDQ1hmQlhBaWd2bnYxWVg0K1VZdFZMdHpXM1MxL2tOM3N2?=
 =?utf-8?B?M0I3RU96cEJTejhPVEh4YXJBdnp6NnowUFc4RFMrdFlMTmhYLzErU3hWZDJy?=
 =?utf-8?B?ZzREZm9HcC93bldlYkhEY3o1YXYzV1JORTd0QTVtUGVTVGdZcThnckFqMVht?=
 =?utf-8?B?VHJMVEdMZzJvVTg1VTlpd0ZsZHNSSTRhWjQzWHJOK2hyYUVwK1FUanY3M083?=
 =?utf-8?B?SkpkUEwrdzVvbTBPcUdETU14c2hIZVBFVTFvVmd4YUR0ZHZGODluSURJVDZR?=
 =?utf-8?B?cHhKRXY4eno1UndFNkR6OElFUWROOEczQlYwbFJNUmE5cWhwMWJzN0xrbHlB?=
 =?utf-8?B?aHhIZHZJYWo5N2dtUVU3ZWg3bGxDTGpGeHJ6b3dOSXV2dG5tMVZ0aWpNS2w2?=
 =?utf-8?B?Q2d2ZkJnN3p0Q3RscUtTWDNWb3BvNFhLZXQxQ3JPRTVwR1ZrU2FIcUdHWEti?=
 =?utf-8?B?NDhaWGVpaXFINlN1dDZtb014a1Q0NjZONTVWdkVjS1d2MFdQMzRJNGVLWVZX?=
 =?utf-8?B?Nmo0TjRXaEhKVW90bklBS1Nra0dEd2lKUVdYYlQ2V21ZeHlBZEoyU3lXckFN?=
 =?utf-8?B?OVZqYUZLVXpIK0pDTkNWMmtpMkluUlc3Y016MVBudU1PUTFOR0ZsMUJ1b0JU?=
 =?utf-8?B?S2xKRSs5VE0raUdXcU8vOFdrUHpUNVdCYm5oK1U3U3FmNnhIVXh4SnAreG5Z?=
 =?utf-8?B?K1I1azB2RmE4Mk40MmFSdThmVjgva3BBcWRhcjhTa0FDTGxRNXdIblM0VVg5?=
 =?utf-8?B?SmR0b2oyS0pNZjFiT0JNTzRhYTJvV0tsSERkd3ZHQ1kwRTBBbWw4KzA5ZzYx?=
 =?utf-8?B?RDZKRlFQcUxwMmN0QWd2Z3BtMUVyRXVjajZoMVlTNGNWMElXZWM2WEo3ZzFy?=
 =?utf-8?B?Z0F2RkhDTU9nMTJ6Uk9Ic1Z6S05TVU5iRCswZGhIeU1mQ2FZZ0tETFRGK2kz?=
 =?utf-8?B?R3lMK2hMbmM1Qm5Hb3E0WGw0NjNhVDMwcTFhZk1HclpWU3RJeVVHamQ3TnBj?=
 =?utf-8?B?cW9HaW1ITnhRTkk2WG1sRTNKYWJtOThMVng5TTJ6YTBhYjNzOUR2REErYmNh?=
 =?utf-8?B?LzhiWFYrbmwzVW5GUXU3eFRlMGp1bTBESkQxVE5PUWt6VEp2dGR3bGg1bHNj?=
 =?utf-8?Q?Dzzx8t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVh2bGZFbEtqR0Qvck9ZZkNzRVhGTERKMWd2bWMxM2F4SG01M0UwUm8xRi9k?=
 =?utf-8?B?ZWx6ZVR4a0xTOUNPQ1d0a2NBMjJMUlVuRUtrcTVia3ZPdzdGSEoyVE1rQTI5?=
 =?utf-8?B?OThjeVNTYVgrNDc0RWRoK3pzV3pIcHd3cHl6STdZeVhGakx5bGtkV0NybHNz?=
 =?utf-8?B?L1c2eVdzQWhBRnQyVjlqbHBKTUhXWjJXOTJBWndhRVpLaGFhWVRLdGZQbVk1?=
 =?utf-8?B?T2VHY0hrSHppVmhKVVNUS3lnakJkdU1nYk5IZENOUkpiaUJLbHozLzlWc3Ax?=
 =?utf-8?B?N0xOUXVCTm1UUkI2RG52VERKSW1RcG04M09vdjZSZ1FrYmVnaHNTYzkxZFR1?=
 =?utf-8?B?TjJ0dUZCQXVCYTh4cVB6Wis1NkxGSU9rTVM5eGc2bUM3c1ZmRllxc0JtWm1Q?=
 =?utf-8?B?UG95MGhOay93QXgxeXJ6d0loVlJIRVlobDFlUWxKc2JLUnE1NWNYVjJCWGlN?=
 =?utf-8?B?WUNic1VqOG9ZTlRaZ0JWZm9MMFRNSStOU3dUNFVDRkRDaDBZbUZQWFdCMGY4?=
 =?utf-8?B?YVZWZlZCN3diSjN6TWRBd2dSRjl2ZnN6aDNsem5pc0lwQ3l4SlRPd1crMHkz?=
 =?utf-8?B?ZGoxclJUbjI2VEpWZW1pZi84cmN1MWxOdG8wSnRyQXM4V1A3TmxlU2ZOakxR?=
 =?utf-8?B?aTVmNUhVOVRaU2trbEFHeXZ4am9KRnM4UmJpQ21hZ0RRMmdOaWV5Y0Y0cGhh?=
 =?utf-8?B?bVE5MG5hMWVpN2E1YkwyaFh2ZW1CMEhMYUxDWmIwdmRDdU1yb2J1Y1hZNnZn?=
 =?utf-8?B?R0dwNzNsRWI5am1MdmVGQVJwL3E5Ukc0d2VFQTVNbVJiNEtxYUxoVjJuM3RX?=
 =?utf-8?B?WWJveVYycmFLZEsrazAvcERtcW1ydlVGa3E1Zm5YMXljMzVnL1BlRURNYmZn?=
 =?utf-8?B?d25hclVTeXJoZUlEK2hwY1FvNDJyTEQyQk1CR0U2TmdhVjhCS1d1c2RZQUg4?=
 =?utf-8?B?L1RHOTF6cEx3c1NLNkRGZXFzcU1sbUYrc0lBdGk3Rm5pUlFxUUQ4R01EdVlo?=
 =?utf-8?B?dy9KTjBldlc5REZFdjJ4dW9Kc2FyejdqS3hRNmFCTW1sMHMzbmRlNG5LNkgx?=
 =?utf-8?B?amxHNEhsVEtVQ1RNWGhBbXBlQjhlekdkK2lnaVkzcGxJVGkwM3hWclo5RWg3?=
 =?utf-8?B?cmplZm1CVDRtTUk4aDZCUHdzVlh5NzBtQlZwNXB4T2I3Sk5EU09WM1BWL2xa?=
 =?utf-8?B?ODlua28rVDMzdUpKMnhUcFVWNFZRSEd3cHBBOFVvc1k4MFRkUlg5MXlrblFW?=
 =?utf-8?B?MkdhRzk2WlVJYmJML0R4empHOVhBT3NBcVJ3STJ6UlBNRnVjVndQRXFBcDg2?=
 =?utf-8?B?TWwzSG0ycVVWWDNheTdKYWFTdUVGcVdJQ3A5SFlZQ2RYMzFGcXlJREM2aWdp?=
 =?utf-8?B?eG85M1dTclJBVHAydEhhSW5pelZLem5JTzlvTVB1OXVId1g2M0JzcFp0Y3lz?=
 =?utf-8?B?Z2E1dVM0ZnFMMDkvNy9uNEpKTTlUWlJKYzZMWUxrSDFyOVYwWjNMbklXeGt3?=
 =?utf-8?B?LzZqZUI4WW1OemdQeXVVV3pyUkFUNVRMUWN1Sy9MVTRzcjkvdVRyRzBHMkxO?=
 =?utf-8?B?V08rVXc0Rm8wRzNSTi9vVXJqMTV5eG51SXNkbzkydGNsM29nNERyMHk3UU1r?=
 =?utf-8?B?aTVaSjRBZ2YzdTQ4RkQvaVJPaFF6dVRLd2pYam9ZN215M2JsbisyYmlibXNw?=
 =?utf-8?B?VHBSNlZLc0tlZGg2bEhnd3VVWGtRVWNKZTZvb0JMWkFjazNOSnJ5V3BtNDdi?=
 =?utf-8?B?L3pYdFhvbG9FN1FSNXB1V0owOUMxYldLcHdjTG9wOWpyV2FZT3ZwL3VBY1E3?=
 =?utf-8?B?WnpyRVc5R1RldjRoeUpNeDc1cVR3UE90WHpkcTFjaFlRbm5QUTU5bUtrNlNr?=
 =?utf-8?B?TXRNTEd6OEJ5SVNTc2p2d094SHBxbEFtWnNTTE94UnlJazl3TEpPeXNIcmJM?=
 =?utf-8?B?enR6amk2enhHdndleDFpZGs0aFZkTkZZcEZ5cVplakVoL2V2d2daUUJmVW5N?=
 =?utf-8?B?emNtdmRkQzZHT2tqbTgzTUtqeEt4Mm5yZmdXUFhPclZVNkpyTWNCa0ZBcTBp?=
 =?utf-8?B?OW5LZkhPazVualQxMHduLzdER1NMWjF0eExYc0V2UE1TSDZZRXJvajVSMkxV?=
 =?utf-8?B?MGdJSGNBN24rZXljTzZJWk0wQTBFV2R6ajVLVzNXTDVhQytrZm4rVUlnVkY0?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10864c94-11e4-4d59-8e82-08de189c6ba0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:42:03.8891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOey5PsVvy11UfjMIfVIT0ThEryKS36RLUKKEZ/suZeS8f18ZJImzeo9Kqk7N7sG4ikQ/5leIIwVImvW17S1h8wsTMGnRwBhbvakXY0yoQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8823
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
> The descriptor reuses the KLV format used by GuC and contains metadata
> that can be used to quickly fail migration when source is incompatible
> with destination.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_migration_data.c | 89 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sriov_migration_data.h |  2 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c   |  6 ++
>  3 files changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> index a3f50836adc81..18e17706772fc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_guc_klv_helpers.h"
>  #include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> @@ -383,11 +384,19 @@ ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
>  	return produced;
>  }
>  
> -#define MIGRATION_DESCRIPTOR_DWORDS 0
> +#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
> +#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
> +#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
> +#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
> +
> +#define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
> +					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
>  static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
>  {
>  	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
>  	struct xe_sriov_migration_data *data;
> +	unsigned int len = 0;
> +	u32 *klvs;
>  	int ret;
>  
>  	data = xe_sriov_migration_data_alloc(xe);
> @@ -401,11 +410,89 @@ static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
>  		return ret;
>  	}
>  
> +	klvs = data->vaddr;
> +	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
> +					 MIGRATION_KLV_DEVICE_DEVID_LEN);
> +	klvs[len++] = xe->info.devid;
> +	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
> +					 MIGRATION_KLV_DEVICE_REVID_LEN);
> +	klvs[len++] = xe->info.revid;
> +
> +	xe_assert(xe, len == MIGRATION_DESCRIPTOR_DWORDS);
> +
>  	*desc = data;
>  
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_migration_data_process_descriptor() - Process migration data descriptor.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @data: the &struct xe_sriov_pf_migration_data containing the descriptor
> + *
> + * The descriptor uses the same KLV format as GuC, and contains metadata used for
> + * checking migration data compatibility.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
> +					       struct xe_sriov_migration_data *data)
> +{
> +	u32 num_dwords = data->size / sizeof(u32);
> +	u32 *klvs = data->vaddr;
> +
> +	xe_assert(xe, data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR);
> +
> +	if (data->size % sizeof(u32)) {
> +		xe_sriov_warn(xe, "Aborting migration, descriptor not in KLV format (size=%llu)\n",
> +			      data->size);
> +		return -EINVAL;
> +	}
> +
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		klvs += GUC_KLV_LEN_MIN;
> +		num_dwords -= GUC_KLV_LEN_MIN;
> +
> +		if (len > num_dwords)

nit:
			xe_sriov_warn(xe, "Aborting migration, truncated KLV %#x, len %u\n",


> +			return -EINVAL;
> +
> +		switch (key) {
> +		case MIGRATION_KLV_DEVICE_DEVID_KEY:
> +			if (*klvs != xe->info.devid) {
> +				xe_sriov_warn(xe,
> +					      "Aborting migration, devid mismatch %#06x!=%#06x\n",
> +					      *klvs, xe->info.devid);
> +				return -ENODEV;
> +			}
> +			break;
> +		case MIGRATION_KLV_DEVICE_REVID_KEY:
> +			if (*klvs != xe->info.revid) {
> +				xe_sriov_warn(xe,
> +					      "Aborting migration, revid mismatch %#06x!=%#06x\n",
> +					      *klvs, xe->info.revid);
> +				return -ENODEV;
> +			}
> +			break;
> +		default:
> +			xe_sriov_dbg(xe,
> +				     "Skipping unknown migration descriptor key %#06x (len=%#06x)\n",
> +				     key, len);
> +			print_hex_dump_bytes("desc: ", DUMP_PREFIX_OFFSET, klvs,
> +					     min(SZ_64, len * sizeof(u32)));
> +			break;
> +		}
> +
> +		klvs += len;
> +		num_dwords -= len;
> +	}
> +
> +	return 0;
> +}
> +
>  static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
>  {
>  	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> index 7ec489c3f28d2..bb4ea5850e5c0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> @@ -30,6 +30,8 @@ ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
>  				     char __user *buf, size_t len);
>  ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
>  				      const char __user *buf, size_t len);
> +int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
> +					       struct xe_sriov_migration_data *data);
>  int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 8ea531d36f53b..f0a0c2b027a20 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -175,9 +175,15 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
>  static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
>  				struct xe_sriov_migration_data *data)
>  {
> +	int ret;
> +
>  	if (data->tile != 0 || data->gt != 0)
>  		return -EINVAL;
>  
> +	ret = xe_sriov_migration_data_process_descriptor(xe, vfid, data);
> +	if (ret)
> +		return ret;
> +
>  	xe_sriov_migration_data_free(data);
>  
>  	return 0;

just nit, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


