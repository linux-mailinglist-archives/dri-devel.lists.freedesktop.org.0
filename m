Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A8A6ED03
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651310E1B2;
	Tue, 25 Mar 2025 09:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8Xc1Rdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAED410E1B2;
 Tue, 25 Mar 2025 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742896220; x=1774432220;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U2pgU7alss/c3Txdftn7gjn8kZs+XqQQGjwsbK4+AT4=;
 b=L8Xc1RdhrLlmGGRA9g2mpjTHeYBB5u5PZZiCwVnSFRzU/ylFboe5Kiwe
 8mDOupYJSC4e+vSXgPUpfhN2WeTmQwC++I+0xMZFdxPXivC9xPp8hCaAt
 zCCHhS+rAjEQohf45zHFXRJqFJukpiPQQ+IvRQzJXFVWZCvGonTfACxbs
 un9i+uT4kg6IApE8qKvAWnseaJ081yfNRHc/KMUwR6MuUwE7yxDGN0LAV
 JrvJwSbxDULWyui2bKtjm5/ncAk2rFj3VsZd+iac8Y1x4AG02Xd7RBioH
 aar6iIMLw135mAOhcYsSgRO0HjDS/wmMV39E9dYhm1tvWSY9eaRklGn1A w==;
X-CSE-ConnectionGUID: vTeAv25tQliveisy8qcMMA==
X-CSE-MsgGUID: 3aoFL3UbRiWbzhcNM62Vdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55129707"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="55129707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:50:20 -0700
X-CSE-ConnectionGUID: WMlD1wxqQpeob8vBW6aI8A==
X-CSE-MsgGUID: 6E1WKEOISiKveyStFTblIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124497328"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:50:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 02:50:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 02:50:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:50:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATpm8T+AiazRfZMV3EZaCrGjPTXciDEpcuirlbc4fLtLnc7PmZnyBgePnUqW4MHUxaS3tq5KpktpzaUVlpT+8WfFf/tSZAql8O+67klKNWjcx4fkXIJkPMkw2xX4olNgyxrpB9vFRdJ9oNn9irdVehUBS3a3eBjwQfUzsLhdOdYAy0l5/Cb/3eCntIeBvbvKa5Qk3kGBf3qi1J8b3G/Y7ZsoxZvH679ZmXyzZyHUzDorYxlf0bRf8Fi/G8gE9CnaCXZf2LScgoR4Y6XRE7YQUBrnTTIf0ciuD9Y7ZuUt0jZ8PpxwXKZC3HgncH7HoBJdxG1kDZKonXf2TBb/kgX1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3DiBcse/BIbP8GA04moej6D2Q8LibhpPl5RfmN+AW4=;
 b=uY0dsAtbofzXg+e/pgUh5VX8+/h6fQE9Tp9xvIt/xwG+wGvHOu8F4Wqv5R9K62jU7r8IIsulVecSVWxoEEWUrYQN66F5bMoGfkX1HpheLfLEoNBB3c8uGMTAe0VT8n/WdihfhyyUEWWnBMivxvxBjMFYlvUSl+W7BHAbWLsuyWgoLiAjffz2whxdeaAg7+tMjLCxkaErLqr4OPgKuyGys+qYzqh60MaLhWJjWS2imSmkgwAykomqkp3mWFG2TMilX39ZqO7bJAPm3spym/9lcoK+KUK9RkRYm7SgHBrv6c1iVL+bWd8AulsV0Ae2ZONw90iWCiSA7iG45uG9hqLNyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 25 Mar
 2025 09:50:14 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:50:14 +0000
Message-ID: <f379de5a-653d-4bbc-a611-6b189919a207@intel.com>
Date: Tue, 25 Mar 2025 15:20:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/xe/userptr: replace xe_hmm with gpusvm
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-16-matthew.auld@intel.com>
 <Z9yAJ0PmaR9vnIUN@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z9yAJ0PmaR9vnIUN@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA0PR11MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e0c05b-0678-4075-4d39-08dd6b827107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjdSOGpadGZuV24yeUtibHBHVnE5YkhkUU5rdTVES1JFSUtqallkdmZVM1FS?=
 =?utf-8?B?UFNUbU94ZkNSakt6WHBiVHE4UFF3Yyt3RDJIVG9hSzBIUW82UUowMzhWTFBO?=
 =?utf-8?B?S0NhUWVUYzlkYmtzS1NKMExRbkJMRWFpOXl0RW9acE1FTVNHR3lUSnFLcVpq?=
 =?utf-8?B?c3lKOUtDdWFZemVRcDdhVWxQcHlOMTBCMlRxTDhzdGZpWFdSR3J6S0ZNK1Nz?=
 =?utf-8?B?WndSZGNWT214TWlFem9TQlZYNk5UZWovVU5XNWNyQkxCMEVYVTZIeE5xV016?=
 =?utf-8?B?aWwrRXZSYmlZZVBrbVFwT2JpLzFCeGN2eEVhWTRRWlVEU281TW4wOU14VENn?=
 =?utf-8?B?MjB4SUdzeVJGMnJnaHppUW9TM0Z3NVYyQTNOVXRrOEhMQ0VyN3F1cXVrTFRz?=
 =?utf-8?B?RlU4OE1QZFd3YmRZTERZd0lyS3ZSM2NhZFlwVDg2STRyOXBDaVlYTTB1TEZX?=
 =?utf-8?B?dDVBN2VqUEJmdGhYeW02L09VSEN1YUtibDJscTZhK285NnA0cStxL1BmeDIy?=
 =?utf-8?B?ZFF3U3VRd3hLVHpRUW1YRzQyTDBDeTZvZVNDWVI5YTdFRmgxZUQycFJ5SDQ0?=
 =?utf-8?B?SDUveHdSSzhyWGVvK2FsUS9MVEpQTFJRT2JSWlN1aFdxS3h4ZnhCK0QvNVpI?=
 =?utf-8?B?YnhBdGliOFQxWEppb2lBYWprSzYySHpnR3RyNzVNRWNSUmpYNnBEbmVCUXBD?=
 =?utf-8?B?ZmJOVUpOZ1p2THBLS3pzSkNwLzNlVFd1Ky9pVFRTa0Q1cDZFWWRxb1NTNDlo?=
 =?utf-8?B?cEt3OVFmd2Q4eDRWTnhJdGx5RWRnRnNmQTJGRVJwWUVSZDR2Vk1BRlBFVVQx?=
 =?utf-8?B?aEJEK3F0UDVTTFBYWHlCejNGWFd0bFR1TEFDYUhST1VjSlRnSTdKbEtqaWtC?=
 =?utf-8?B?UmNQQ05qWkpYa0xzc1RLQXlFMERrK2FYNFM4Q3gxNlk3d3p5dDdxaTBsTzhY?=
 =?utf-8?B?c0liR1p4cGxEemhuTytJZFRIMnBNTkwvWkR0RUh0L3RXS1VVeFdndTBDV2Ju?=
 =?utf-8?B?SnA5blpKb1lNTHV1cDBIMkQxVWdYL05TTFdDaXRORkxkblJHWTNhSWF1Qi8z?=
 =?utf-8?B?UFZBNGFSYmpIc0VFSEpacDU5Q2tHaHphMUVzbTBUTVdWQVkycTZzbVhZN0Fz?=
 =?utf-8?B?T2ttcmJPNFoxWXJOcStUTmhETndQK3paODNFaEVTR3pBVW8wZXFWVGZuNU5j?=
 =?utf-8?B?WCtUNG1CR3oxNkFGUUJuaVE4K24wSmFTZXRLdXdGSkFhSm9SUlN4cnFnVW51?=
 =?utf-8?B?K25nV0ZUK0hVd1FkN2ZvcUdoUm16U1ZEalNVeTY5U0diWFJrTzNUVGU0Ritr?=
 =?utf-8?B?QWNuSFdoa2lHRkxOQVVldkdHcEhydXQwclZKb3Z2N1p6Sit3MUU3LzF5WERj?=
 =?utf-8?B?RWJzWW1rOHVwd1dZNmVnYUwzRDZLTkhtelBYM3FDZ25nRkhUSGF6VE95U09a?=
 =?utf-8?B?OW1DdEtibGh0Ymd5S2t5WnhqRWUxT0daZ1gwRUVwR21hV3ZRRkNsdy9SelJs?=
 =?utf-8?B?ZGZXaUdkM1dleENOdDdQNU03NmtYdTZYV1FlYU9aNlJRUDZBeGxaTkhLWjBu?=
 =?utf-8?B?QWp1RVk0U3BtUDlmWHJCd3Jsekc2SnJWZnRFeWFLZXpSNTVRYTM2K3A1MVpn?=
 =?utf-8?B?NHpzYUtXMlZrMk5uZENVVXQxbE5pamtZR0pIYjRpYmY4UVlkTFU2ZEJGMlRu?=
 =?utf-8?B?Vzk2QlVoN2Z0LzBLQTh3bzBHaHZJQ2RvQnhvVTBQbGd1VTI1SHdpNlpiZ1lN?=
 =?utf-8?B?bGZzZVh6ZG11MG1qalFMc2J1dGxPeWlCcFlGT1dCYis0Y3pzOS80ekd5TDBT?=
 =?utf-8?B?VFREbjNCT1FzMHAzTUk3YUdHaWFFbnNLMkJCY1grMDZGUWRCVXBZYko2dU0z?=
 =?utf-8?Q?khHdm7EEpga+i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXZxd3pUdlVhb3M3ZEovY2JtTk5aUlk0ZHFuTWhEQmtlcDNCam1jSWs4NkY4?=
 =?utf-8?B?T1BVaWwySi9aejFRSm1GSk52bHpwYXdScEVERmhvbE12MkprR2wzNFFiZ29y?=
 =?utf-8?B?ZlZYZFpZeXYvQkhGTG9FMG1YVExDNVBNZkpHTlBrOFJqblRaZlFNS3NMZlRC?=
 =?utf-8?B?S2xMdkNzQWdjMmFOdHFHcGZmTEVBTytpQ0Y2Y3ZMR2RZNDVNQUxYZ2t0WTRY?=
 =?utf-8?B?eHhKSjNMUUZDbVVtc3ZYbDJjWVZSS2VQWnQ3dExqQ0RKMG1YWFhDNmhwM3M0?=
 =?utf-8?B?TkpTMkVOdGhTU2orYllwYTB1UTZkeksycTU3V1lnd1pkR21zSS9HOGVhVCt5?=
 =?utf-8?B?eHZMMUtybmREby82bUtmeXpFczFVWXpzTTVpWUV3WXRNL05FZTUwNVU1ZzBo?=
 =?utf-8?B?dlk4Um5YSS8rL0tPdFNxRXZoNmFkWjNBNGZRT2pXREt3bVlEdytXeGtpU3ZO?=
 =?utf-8?B?WDFXSTVqWGg2RkUvRkdZWFVITlpzQSs3L2cwNGpsK1l3RVZHNnE1VEZ0T0tk?=
 =?utf-8?B?ZEE3YTRpSjdna2doTlNpWnJOdzJlZmdxMndIaTVBOHE5VTdtU0c5cHJUMlpS?=
 =?utf-8?B?dHIzUzhFbVgxd2xxbkszSmRiWE1CckVpdWlrMDFHRVZqU0pmVlV2R3o0ZlEx?=
 =?utf-8?B?ZHR1REJtMzlkUkpoYWdMSnlJRWMwRHpLdmg3QXY0SWZVOWpFZUVPaVFVM3Av?=
 =?utf-8?B?Zi9lQjdDQ0ZzS3NVd25NdUZWREViRUZDaTVnemdmVXd2cTJxY2kvNDBCZG03?=
 =?utf-8?B?a1JpQmJZZDFWWkJhVmR6SEVza3pyb1lTL2t6OW5zRiszVUNscXFOZEkxcnM0?=
 =?utf-8?B?aVYyRThyUXovNzc2OU9UZWdiSzU2UkNYRFFScGZXcVdPUHZUWnJCZ1hXK3NN?=
 =?utf-8?B?dTdSTnh4Z1NxNlQ1WXpkVDVRTzgvVVB1akwyZThlZk9nMUNORGZpSUEvNTlQ?=
 =?utf-8?B?U25UWStpSEdUUEZlRTBGYTF1NUFlcGgzTDJSKzNBQmJsbG42YldSRFdMVmdD?=
 =?utf-8?B?NVpkdzV6R0hsS2hLOXZJWUFlQi9qeVI2KzF1MlhKVzE3MXNUZXlaWDMyazZp?=
 =?utf-8?B?ODIyR0xqTFJVN3Y5SmduVldyZjJ1NHNueUo1MTRweEVDNjBEc0xLRE53NVlv?=
 =?utf-8?B?N2RWRVdRejFkQ1J4UEgyeUpUaFFsSklYRkZhRHFRZkxNeGtxRkJTRGtEVUdy?=
 =?utf-8?B?WWdWNVlGOUpSUzdOTUsraWZ4eHJPOHdTY0JVK0h3a3ZEempGR0daN2t0cldD?=
 =?utf-8?B?S2hHbStIWlFKUWlzYXl0ejRYa21XRDk3UW5IL1MvTjZCbUNBdmJ0MzFxb2FT?=
 =?utf-8?B?eE8wSkVoeXZpZ0wrM2RkUVBqbFlRbW5sZXpIRFFSWDdKYU8vSjFLeGNGTlpi?=
 =?utf-8?B?NUppVkZjclpqRHQrNnp6TWxEdFU3WHZWMG56cVZzeit2bTNjMm5iVWlCelhB?=
 =?utf-8?B?cWU4ZXhyQzlHUzBVR0hEMEMvNTNHK3p1QWhZaXdPMXhFL1htZFgrb1BGMGRn?=
 =?utf-8?B?M3JINFRmWmNvdGlITTBMYzQxMy9xZTBpNUdId0Vxdy9PajFMTmtwUmdNTGF6?=
 =?utf-8?B?MW1mT29BL0ZjNXdTbVpYK0ZyNWFzNVRuMHUzclVlam81SEdLUHVsOVkrZ0NQ?=
 =?utf-8?B?TUR4MXZmeERiNktBU1VmUlpHTWtzU0ZQZ3dLaHgzNEd1M09ialY0d2JlNzJD?=
 =?utf-8?B?MzdURUUrRGN3dE5lM1FBMVV6Q05yU0V4ZTlsRjMyTTk2bUpYSGo1aXR2SzBJ?=
 =?utf-8?B?L2VqeWFWZWdSaHEvTGNYM1F0cFRjT2J2TU1RS2pVb29nZFAzVG13MlpsYnVP?=
 =?utf-8?B?UzRDQzNBUUVqUHVyS09udHA5KzdFSkhvdDRIZStYR1Iycm9hVUZldjVqNndr?=
 =?utf-8?B?S1g1bGRNR1U2a1ZMdWRFcWxoRzRNeFVmM3FyWVY2U0UwT3EwNVcydCtxZGth?=
 =?utf-8?B?T3Nud1F4dVRINnp2aFlTVkRLWGVDRCtxRy9aOWFWamRNdHJSaGVBNVdyWUxM?=
 =?utf-8?B?eFQ0d1dRVkRuZXcrT1RqWFZxT2t2bWtsK08wRUpFeEdnYUFIQ0RWSUdwT0Jq?=
 =?utf-8?B?NGw3M2JhK1hSSHBHMXV2bWFmVWtYcGRWeGJzcW1icVdYS052RThPZVNoS21H?=
 =?utf-8?B?b2NleGNIMncxRW5UUU1FQ3hzc2NkT2JEUHNhcURLL0ZocDFIMU93YkRudGNR?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e0c05b-0678-4075-4d39-08dd6b827107
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 09:50:14.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Wf+Ujd8FCyd6SdpulVsmsQoddFabB28Z/keL/4u36zz1Ui7IQ13/uJGr2OZg98RMVkFkkFtLyuyFOmlZ9Bfx/Ud3yRI7T1f5z0DLYJt0G0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7864
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



On 21-03-2025 02:22, Matthew Brost wrote:
> On Thu, Mar 20, 2025 at 05:30:04PM +0000, Matthew Auld wrote:
>> Goal here is cut over to gpusvm and remove xe_hmm, relying instead on
>> common code. The core facilities we need are get_pages(), unmap_pages()
>> and free_pages() for a given useptr range, plus a vm level notifier
>> lock, which is now provided by gpusvm.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile      |   1 -
>>   drivers/gpu/drm/xe/xe_exec.c     |   4 +-
>>   drivers/gpu/drm/xe/xe_hmm.c      | 349 -------------------------------
>>   drivers/gpu/drm/xe/xe_hmm.h      |  18 --
>>   drivers/gpu/drm/xe/xe_pt.c       |  20 +-
>>   drivers/gpu/drm/xe/xe_vm.c       |  74 ++++---
>>   drivers/gpu/drm/xe/xe_vm_types.h |  30 ++-
>>   7 files changed, 70 insertions(+), 426 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>>   delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 9699b08585f7..ada1f0fad629 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -124,7 +124,6 @@ xe-y += xe_bb.o \
>>   	xe_wait_user_fence.o \
>>   	xe_wopcm.o
>>   
>> -xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>>   xe-$(CONFIG_DRM_GPUSVM) += xe_svm.o
>>   
>>   # graphics hardware monitoring (HWMON) support
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index b75adfc99fb7..84daeedd65d4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -294,7 +294,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		if (err)
>>   			goto err_put_job;
>>   
>> -		err = down_read_interruptible(&vm->userptr.notifier_lock);
>> +		err = down_read_interruptible(&vm->userptr.gpusvm.notifier_lock);
>>   		if (err)
>>   			goto err_put_job;
>>   
>> @@ -336,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   
>>   err_repin:
>>   	if (!xe_vm_in_lr_mode(vm))
>> -		up_read(&vm->userptr.notifier_lock);
>> +		up_read(&vm->userptr.gpusvm.notifier_lock);
>>   err_put_job:
>>   	if (err)
>>   		xe_sched_job_put(job);
>> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
>> deleted file mode 100644
>> index c3cc0fa105e8..000000000000
>> --- a/drivers/gpu/drm/xe/xe_hmm.c
>> +++ /dev/null
>> @@ -1,349 +0,0 @@
>> -// SPDX-License-Identifier: MIT
>> -/*
>> - * Copyright © 2024 Intel Corporation
>> - */
>> -
>> -#include <linux/scatterlist.h>
>> -#include <linux/mmu_notifier.h>
>> -#include <linux/dma-mapping.h>
>> -#include <linux/memremap.h>
>> -#include <linux/swap.h>
>> -#include <linux/hmm.h>
>> -#include <linux/mm.h>
>> -#include "xe_hmm.h"
>> -#include "xe_vm.h"
>> -#include "xe_bo.h"
>> -
>> -static u64 xe_npages_in_range(unsigned long start, unsigned long end)
>> -{
>> -	return (end - start) >> PAGE_SHIFT;
>> -}
>> -
>> -/**
>> - * xe_mark_range_accessed() - mark a range is accessed, so core mm
>> - * have such information for memory eviction or write back to
>> - * hard disk
>> - * @range: the range to mark
>> - * @write: if write to this range, we mark pages in this range
>> - * as dirty
>> - */
>> -static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>> -{
>> -	struct page *page;
>> -	u64 i, npages;
>> -
>> -	npages = xe_npages_in_range(range->start, range->end);
>> -	for (i = 0; i < npages; i++) {
>> -		page = hmm_pfn_to_page(range->hmm_pfns[i]);
>> -		if (write)
>> -			set_page_dirty_lock(page);
>> -
>> -		mark_page_accessed(page);
>> -	}
>> -}
>> -
>> -static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
>> -		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
>> -{
>> -	unsigned long i, npages, hmm_pfn;
>> -	unsigned long num_chunks = 0;
>> -	int ret;
>> -
>> -	/* HMM docs says this is needed. */
>> -	ret = down_read_interruptible(notifier_sem);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
>> -		up_read(notifier_sem);
>> -		return -EAGAIN;
>> -	}
>> -
>> -	npages = xe_npages_in_range(range->start, range->end);
>> -	for (i = 0; i < npages;) {
>> -		unsigned long len;
>> -
>> -		hmm_pfn = range->hmm_pfns[i];
>> -		xe_assert(xe, hmm_pfn & HMM_PFN_VALID);
>> -
>> -		len = 1UL << hmm_pfn_to_map_order(hmm_pfn);
>> -
>> -		/* If order > 0 the page may extend beyond range->start */
>> -		len -= (hmm_pfn & ~HMM_PFN_FLAGS) & (len - 1);
>> -		i += len;
>> -		num_chunks++;
>> -	}
>> -	up_read(notifier_sem);
>> -
>> -	return sg_alloc_table(st, num_chunks, GFP_KERNEL);
>> -}
>> -
>> -/**
>> - * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
>> - * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
>> - * and will be used to program GPU page table later.
>> - * @xe: the xe device who will access the dma-address in sg table
>> - * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
>> - * has the pfn numbers of pages that back up this hmm address range.
>> - * @st: pointer to the sg table.
>> - * @notifier_sem: The xe notifier lock.
>> - * @write: whether we write to this range. This decides dma map direction
>> - * for system pages. If write we map it bi-diretional; otherwise
>> - * DMA_TO_DEVICE
>> - *
>> - * All the contiguous pfns will be collapsed into one entry in
>> - * the scatter gather table. This is for the purpose of efficiently
>> - * programming GPU page table.
>> - *
>> - * The dma_address in the sg table will later be used by GPU to
>> - * access memory. So if the memory is system memory, we need to
>> - * do a dma-mapping so it can be accessed by GPU/DMA.
>> - *
>> - * FIXME: This function currently only support pages in system
>> - * memory. If the memory is GPU local memory (of the GPU who
>> - * is going to access memory), we need gpu dpa (device physical
>> - * address), and there is no need of dma-mapping. This is TBD.
>> - *
>> - * FIXME: dma-mapping for peer gpu device to access remote gpu's
>> - * memory. Add this when you support p2p
>> - *
>> - * This function allocates the storage of the sg table. It is
>> - * caller's responsibility to free it calling sg_free_table.
>> - *
>> - * Returns 0 if successful; -ENOMEM if fails to allocate memory
>> - */
>> -static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
>> -		       struct sg_table *st,
>> -		       struct rw_semaphore *notifier_sem,
>> -		       bool write)
>> -{
>> -	unsigned long npages = xe_npages_in_range(range->start, range->end);
>> -	struct device *dev = xe->drm.dev;
>> -	struct scatterlist *sgl;
>> -	struct page *page;
>> -	unsigned long i, j;
>> -
>> -	lockdep_assert_held(notifier_sem);
>> -
>> -	i = 0;
>> -	for_each_sg(st->sgl, sgl, st->nents, j) {
>> -		unsigned long hmm_pfn, size;
>> -
>> -		hmm_pfn = range->hmm_pfns[i];
>> -		page = hmm_pfn_to_page(hmm_pfn);
>> -		xe_assert(xe, !is_device_private_page(page));
>> -
>> -		size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
>> -		size -= page_to_pfn(page) & (size - 1);
>> -		i += size;
>> -
>> -		if (unlikely(j == st->nents - 1)) {
>> -			xe_assert(xe, i >= npages);
>> -			if (i > npages)
>> -				size -= (i - npages);
>> -
>> -			sg_mark_end(sgl);
>> -		} else {
>> -			xe_assert(xe, i < npages);
>> -		}
>> -
>> -		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
>> -	}
>> -
>> -	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
>> -			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
>> -}
>> -
>> -static void xe_hmm_userptr_set_mapped(struct xe_userptr_vma *uvma)
>> -{
>> -	struct xe_userptr *userptr = &uvma->userptr;
>> -	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>> -
>> -	lockdep_assert_held_write(&vm->lock);
>> -	lockdep_assert_held(&vm->userptr.notifier_lock);
>> -
>> -	mutex_lock(&userptr->unmap_mutex);
>> -	xe_assert(vm->xe, !userptr->mapped);
>> -	userptr->mapped = true;
>> -	mutex_unlock(&userptr->unmap_mutex);
>> -}
>> -
>> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma)
>> -{
>> -	struct xe_userptr *userptr = &uvma->userptr;
>> -	struct xe_vma *vma = &uvma->vma;
>> -	bool write = !xe_vma_read_only(vma);
>> -	struct xe_vm *vm = xe_vma_vm(vma);
>> -	struct xe_device *xe = vm->xe;
>> -
>> -	if (!lockdep_is_held_type(&vm->userptr.notifier_lock, 0) &&
>> -	    !lockdep_is_held_type(&vm->lock, 0) &&
>> -	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
>> -		/* Don't unmap in exec critical section. */
>> -		xe_vm_assert_held(vm);
>> -		/* Don't unmap while mapping the sg. */
>> -		lockdep_assert_held(&vm->lock);
>> -	}
>> -
>> -	mutex_lock(&userptr->unmap_mutex);
>> -	if (userptr->sg && userptr->mapped)
>> -		dma_unmap_sgtable(xe->drm.dev, userptr->sg,
>> -				  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
>> -	userptr->mapped = false;
>> -	mutex_unlock(&userptr->unmap_mutex);
>> -}
>> -
>> -/**
>> - * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
>> - * @uvma: the userptr vma which hold the scatter gather table
>> - *
>> - * With function xe_userptr_populate_range, we allocate storage of
>> - * the userptr sg table. This is a helper function to free this
>> - * sg table, and dma unmap the address in the table.
>> - */
>> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
>> -{
>> -	struct xe_userptr *userptr = &uvma->userptr;
>> -
>> -	xe_assert(xe_vma_vm(&uvma->vma)->xe, userptr->sg);
>> -	xe_hmm_userptr_unmap(uvma);
>> -	sg_free_table(userptr->sg);
>> -	userptr->sg = NULL;
>> -}
>> -
>> -/**
>> - * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
>> - * address range
>> - *
>> - * @uvma: userptr vma which has information of the range to populate.
>> - * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
>> - *
>> - * This function populate the physical pages of a virtual
>> - * address range. The populated physical pages is saved in
>> - * userptr's sg table. It is similar to get_user_pages but call
>> - * hmm_range_fault.
>> - *
>> - * This function also read mmu notifier sequence # (
>> - * mmu_interval_read_begin), for the purpose of later
>> - * comparison (through mmu_interval_read_retry).
>> - *
>> - * This must be called with mmap read or write lock held.
>> - *
>> - * This function allocates the storage of the userptr sg table.
>> - * It is caller's responsibility to free it calling sg_free_table.
>> - *
>> - * returns: 0 for success; negative error no on failure
>> - */
>> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
>> -				  bool is_mm_mmap_locked)
>> -{
>> -	unsigned long timeout =
>> -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>> -	unsigned long *pfns;
>> -	struct xe_userptr *userptr;
>> -	struct xe_vma *vma = &uvma->vma;
>> -	u64 userptr_start = xe_vma_userptr(vma);
>> -	u64 userptr_end = userptr_start + xe_vma_size(vma);
>> -	struct xe_vm *vm = xe_vma_vm(vma);
>> -	struct hmm_range hmm_range = {
>> -		.pfn_flags_mask = 0, /* ignore pfns */
>> -		.default_flags = HMM_PFN_REQ_FAULT,
>> -		.start = userptr_start,
>> -		.end = userptr_end,
>> -		.notifier = &uvma->userptr.notifier,
>> -		.dev_private_owner = vm->xe,
>> -	};
>> -	bool write = !xe_vma_read_only(vma);
>> -	unsigned long notifier_seq;
>> -	u64 npages;
>> -	int ret;
>> -
>> -	userptr = &uvma->userptr;
>> -
>> -	if (is_mm_mmap_locked)
>> -		mmap_assert_locked(userptr->notifier.mm);
>> -
>> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>> -		return 0;
>> -
>> -	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> -	if (notifier_seq == userptr->notifier_seq)
>> -		return 0;
>> -
>> -	if (userptr->sg)
>> -		xe_hmm_userptr_free_sg(uvma);
>> -
>> -	npages = xe_npages_in_range(userptr_start, userptr_end);
>> -	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>> -	if (unlikely(!pfns))
>> -		return -ENOMEM;
>> -
>> -	if (write)
>> -		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
>> -
>> -	if (!mmget_not_zero(userptr->notifier.mm)) {
>> -		ret = -EFAULT;
>> -		goto free_pfns;
>> -	}
>> -
>> -	hmm_range.hmm_pfns = pfns;
>> -
>> -	while (true) {
>> -		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> -
>> -		if (!is_mm_mmap_locked)
>> -			mmap_read_lock(userptr->notifier.mm);
>> -
>> -		ret = hmm_range_fault(&hmm_range);
>> -
>> -		if (!is_mm_mmap_locked)
>> -			mmap_read_unlock(userptr->notifier.mm);
>> -
>> -		if (ret == -EBUSY) {
>> -			if (time_after(jiffies, timeout))
>> -				break;
>> -
>> -			continue;
>> -		}
>> -		break;
>> -	}
>> -
>> -	mmput(userptr->notifier.mm);
>> -
>> -	if (ret)
>> -		goto free_pfns;
>> -
>> -	ret = xe_alloc_sg(vm->xe, &userptr->sgt, &hmm_range, &vm->userptr.notifier_lock);
>> -	if (ret)
>> -		goto free_pfns;
>> -
>> -	ret = down_read_interruptible(&vm->userptr.notifier_lock);
>> -	if (ret)
>> -		goto free_st;
>> -
>> -	if (mmu_interval_read_retry(hmm_range.notifier, hmm_range.notifier_seq)) {
>> -		ret = -EAGAIN;
>> -		goto out_unlock;
>> -	}
>> -
>> -	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt,
>> -			  &vm->userptr.notifier_lock, write);
>> -	if (ret)
>> -		goto out_unlock;
>> -
>> -	xe_mark_range_accessed(&hmm_range, write);
>> -	userptr->sg = &userptr->sgt;
>> -	xe_hmm_userptr_set_mapped(uvma);
>> -	userptr->notifier_seq = hmm_range.notifier_seq;
>> -	up_read(&vm->userptr.notifier_lock);
>> -	kvfree(pfns);
>> -	return 0;
>> -
>> -out_unlock:
>> -	up_read(&vm->userptr.notifier_lock);
>> -free_st:
>> -	sg_free_table(&userptr->sgt);
>> -free_pfns:
>> -	kvfree(pfns);
>> -	return ret;
>> -}
>> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
>> deleted file mode 100644
>> index 0ea98d8e7bbc..000000000000
>> --- a/drivers/gpu/drm/xe/xe_hmm.h
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -/* SPDX-License-Identifier: MIT
>> - *
>> - * Copyright © 2024 Intel Corporation
>> - */
>> -
>> -#ifndef _XE_HMM_H_
>> -#define _XE_HMM_H_
>> -
>> -#include <linux/types.h>
>> -
>> -struct xe_userptr_vma;
>> -
>> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
>> -
>> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
>> -
>> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma);
>> -#endif
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index c43e7619cb80..824bf99e5f71 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -727,8 +727,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   
>>   	if (!xe_vma_is_null(vma) && !range) {
>>   		if (xe_vma_is_userptr(vma))
>> -			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
>> -					xe_vma_size(vma), &curs);
>> +			xe_res_first_dma(to_userptr_vma(vma)->userptr.range.pages.dma_addr, 0,
>> +					 xe_vma_size(vma), &curs);
>>   		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>>   			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
>>   				     xe_vma_size(vma), &curs);
>> @@ -998,7 +998,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>>   	xe_pt_commit_prepare_locks_assert(vma);
>>   
>>   	if (xe_vma_is_userptr(vma))
>> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>> +		lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>>   }
>>   
>>   static void xe_pt_commit(struct xe_vma *vma,
>> @@ -1336,7 +1336,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>>   	struct xe_userptr_vma *uvma;
>>   	unsigned long notifier_seq;
>>   
>> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
>> +	lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   	if (!xe_vma_is_userptr(vma))
>>   		return 0;
>> @@ -1366,7 +1366,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>>   {
>>   	int err = 0;
>>   
>> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
>> +	lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   	switch (op->base.op) {
>>   	case DRM_GPUVA_OP_MAP:
>> @@ -1407,12 +1407,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	if (err)
>>   		return err;
>>   
>> -	down_read(&vm->userptr.notifier_lock);
>> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   	list_for_each_entry(op, &vops->list, link) {
>>   		err = op_check_userptr(vm, op, pt_update_ops);
>>   		if (err) {
>> -			up_read(&vm->userptr.notifier_lock);
>> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>>   			break;
>>   		}
>>   	}
>> @@ -2133,7 +2133,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>>   	vma->tile_present |= BIT(tile->id);
>>   	vma->tile_staged &= ~BIT(tile->id);
>>   	if (xe_vma_is_userptr(vma)) {
>> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>> +		lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>>   		to_userptr_vma(vma)->userptr.initial_bind = true;
>>   	}
>>   
>> @@ -2169,7 +2169,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>>   	if (!vma->tile_present) {
>>   		list_del_init(&vma->combined_links.rebind);
>>   		if (xe_vma_is_userptr(vma)) {
>> -			lockdep_assert_held_read(&vm->userptr.notifier_lock);
>> +			lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   			spin_lock(&vm->userptr.invalidated_lock);
>>   			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
>> @@ -2414,7 +2414,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>   	if (pt_update_ops->needs_svm_lock)
>>   		xe_svm_notifier_unlock(vm);
>>   	if (pt_update_ops->needs_userptr_lock)
>> -		up_read(&vm->userptr.notifier_lock);
>> +		up_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   	return fence;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 60303998bd61..fdc24718b9ad 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include "xe_vm.h"
>>   
>> +#include "drm/drm_gpusvm.h"
>>   #include <linux/dma-fence-array.h>
>>   #include <linux/nospec.h>
>>   
>> @@ -40,7 +41,6 @@
>>   #include "xe_sync.h"
>>   #include "xe_trace_bo.h"
>>   #include "xe_wa.h"
>> -#include "xe_hmm.h"
>>   
>>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>   {
>> @@ -53,7 +53,7 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>    *
>>    * Check if the userptr vma has been invalidated since last successful
>>    * repin. The check is advisory only and can the function can be called
>> - * without the vm->userptr.notifier_lock held. There is no guarantee that the
>> + * without the vm->userptr.gpusvm.notifier_lock held. There is no guarantee that the
>>    * vma userptr will remain valid after a lockless check, so typically
>>    * the call needs to be followed by a proper check under the notifier_lock.
>>    *
>> @@ -71,11 +71,17 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>>   	struct xe_vma *vma = &uvma->vma;
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>>   	struct xe_device *xe = vm->xe;
>> +	struct drm_gpusvm_ctx ctx = {
>> +		.read_only = xe_vma_read_only(vma),
>> +	};
>>   
>>   	lockdep_assert_held(&vm->lock);
>>   	xe_assert(xe, xe_vma_is_userptr(vma));
>>   
>> -	return xe_hmm_userptr_populate_range(uvma, false);
>> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>> +		return 0;
>> +
>> +	return drm_gpusvm_basic_range_get_pages(&uvma->userptr.range, &ctx);
>>   }
>>   
>>   static bool preempt_fences_waiting(struct xe_vm *vm)
>> @@ -249,7 +255,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>>   	++vm->preempt.num_exec_queues;
>>   	q->lr.pfence = pfence;
>>   
>> -	down_read(&vm->userptr.notifier_lock);
>> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
>>   				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
>> @@ -263,7 +269,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>>   	if (wait)
>>   		dma_fence_enable_sw_signaling(pfence);
>>   
>> -	up_read(&vm->userptr.notifier_lock);
>> +	up_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   out_fini:
>>   	drm_exec_fini(exec);
>> @@ -305,14 +311,14 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>>    * @vm: The VM.
>>    *
>>    * This function checks for whether the VM has userptrs that need repinning,
>> - * and provides a release-type barrier on the userptr.notifier_lock after
>> + * and provides a release-type barrier on the userptr.gpusvm.notifier_lock after
>>    * checking.
>>    *
>>    * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
>>    */
>>   int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>>   {
>> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
>> +	lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   	return (list_empty(&vm->userptr.repin_list) &&
>>   		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>> @@ -546,9 +552,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>   	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
>>   	__xe_vm_userptr_needs_repin(__vm))
>>   
>> -	down_read(&vm->userptr.notifier_lock);
>> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>>   	if (retry_required(tries, vm)) {
>> -		up_read(&vm->userptr.notifier_lock);
>> +		up_read(&vm->userptr.gpusvm.notifier_lock);
>>   		err = -EAGAIN;
>>   		goto out_unlock;
>>   	}
>> @@ -562,7 +568,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>   	/* Point of no return. */
>>   	arm_preempt_fences(vm, &preempt_fences);
>>   	resume_and_reinstall_preempt_fences(vm, &exec);
>> -	up_read(&vm->userptr.notifier_lock);
>> +	up_read(&vm->userptr.gpusvm.notifier_lock);
>>   
>>   out_unlock:
>>   	drm_exec_fini(&exec);
>> @@ -589,6 +595,9 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>>   	struct xe_vma *vma = &uvma->vma;
>>   	struct dma_resv_iter cursor;
>>   	struct dma_fence *fence;
>> +	struct drm_gpusvm_ctx ctx = {
>> +		.in_notifier = true,
>> +	};
>>   	long err;
>>   
>>   	/*
>> @@ -625,7 +634,7 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>>   		XE_WARN_ON(err);
>>   	}
>>   
>> -	xe_hmm_userptr_unmap(uvma);
>> +	drm_gpusvm_basic_range_unmap_pages(&uvma->userptr.range, &ctx);
>>   }
>>   
>>   static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>> @@ -646,11 +655,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>>   	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
>>   		xe_vma_start(vma), xe_vma_size(vma));
>>   
>> -	down_write(&vm->userptr.notifier_lock);
>> +	down_write(&vm->userptr.gpusvm.notifier_lock);
>>   	mmu_interval_set_seq(mni, cur_seq);
>>   
>>   	__vma_userptr_invalidate(vm, uvma);
>> -	up_write(&vm->userptr.notifier_lock);
>> +	up_write(&vm->userptr.gpusvm.notifier_lock);
>>   	trace_xe_vma_userptr_invalidate_complete(vma);
>>   
>>   	return true;
>> @@ -674,7 +683,7 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>>   	/* Protect against concurrent userptr pinning */
>>   	lockdep_assert_held(&vm->lock);
>>   	/* Protect against concurrent notifiers */
>> -	lockdep_assert_held(&vm->userptr.notifier_lock);
>> +	lockdep_assert_held(&vm->userptr.gpusvm.notifier_lock);
>>   	/*
>>   	 * Protect against concurrent instances of this function and
>>   	 * the critical exec sections
>> @@ -747,7 +756,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>>   	}
>>   
>>   	if (err) {
>> -		down_write(&vm->userptr.notifier_lock);
>> +		down_write(&vm->userptr.gpusvm.notifier_lock);
>>   		spin_lock(&vm->userptr.invalidated_lock);
>>   		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>>   					 userptr.repin_link) {
>> @@ -756,7 +765,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>>   				       &vm->userptr.invalidated);
>>   		}
>>   		spin_unlock(&vm->userptr.invalidated_lock);
>> -		up_write(&vm->userptr.notifier_lock);
>> +		up_write(&vm->userptr.gpusvm.notifier_lock);
>>   	}
>>   	return err;
>>   }
>> @@ -1222,7 +1231,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   			INIT_LIST_HEAD(&userptr->invalidate_link);
>>   			INIT_LIST_HEAD(&userptr->repin_link);
>>   			vma->gpuva.gem.offset = bo_offset_or_userptr;
>> -			mutex_init(&userptr->unmap_mutex);
>>   
>>   			err = mmu_interval_notifier_insert(&userptr->notifier,
>>   							   current->mm,
>> @@ -1233,7 +1241,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   				return ERR_PTR(err);
>>   			}
>>   
>> -			userptr->notifier_seq = LONG_MAX;
>> +			drm_gpusvm_basic_range_init(&vm->userptr.gpusvm,
>> +						    &userptr->range,
>> +						    &userptr->notifier,
>> +						    &userptr->notifier_seq);
>>   		}
>>   
>>   		xe_vm_get(vm);
>> @@ -1255,8 +1266,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>   		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>>   		struct xe_userptr *userptr = &uvma->userptr;
>>   
>> -		if (userptr->sg)
>> -			xe_hmm_userptr_free_sg(uvma);
>> +		drm_gpusvm_basic_range_free_pages(&uvma->userptr.range);
>>   
>>   		/*
>>   		 * Since userptr pages are not pinned, we can't remove
>> @@ -1264,7 +1274,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>   		 * them anymore
>>   		 */
>>   		mmu_interval_notifier_remove(&userptr->notifier);
>> -		mutex_destroy(&userptr->unmap_mutex);
>> +		drm_gpusvm_basic_range_fini(&uvma->userptr.range);
>>   		xe_vm_put(vm);
>>   	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
>>   		xe_vm_put(vm);
>> @@ -1657,7 +1667,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>   
>>   	INIT_LIST_HEAD(&vm->userptr.repin_list);
>>   	INIT_LIST_HEAD(&vm->userptr.invalidated);
>> -	init_rwsem(&vm->userptr.notifier_lock);
>>   	spin_lock_init(&vm->userptr.invalidated_lock);
>>   
>>   	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>> @@ -1763,6 +1772,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>   			goto err_close;
>>   	}
>>   
>> +	drm_gpusvm_basic_init(&vm->userptr.gpusvm, "xe-vm-userptr", &xe->drm);
>> +	drm_gpusvm_driver_set_lock(&vm->userptr.gpusvm, &vm->lock);
>> +
>>   	if (number_tiles > 1)
>>   		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>>   
>> @@ -1867,9 +1879,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>   		vma = gpuva_to_vma(gpuva);
>>   
>>   		if (xe_vma_has_no_bo(vma)) {
>> -			down_read(&vm->userptr.notifier_lock);
>> +			down_read(&vm->userptr.gpusvm.notifier_lock);
>>   			vma->gpuva.flags |= XE_VMA_DESTROYED;
>> -			up_read(&vm->userptr.notifier_lock);
>> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>>   		}
>>   
>>   		xe_vm_remove_vma(vm, vma);
>> @@ -1916,6 +1928,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>   	if (xe_vm_in_fault_mode(vm))
>>   		xe_svm_fini(vm);
>>   
>> +	drm_gpusvm_basic_fini(&vm->userptr.gpusvm);
>> +
>>   	up_write(&vm->lock);
>>   
>>   	down_write(&xe->usm.lock);
>> @@ -2144,9 +2158,9 @@ static const u32 region_to_mem_type[] = {
>>   static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
>>   			     bool post_commit)
>>   {
>> -	down_read(&vm->userptr.notifier_lock);
>> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>>   	vma->gpuva.flags |= XE_VMA_DESTROYED;
>> -	up_read(&vm->userptr.notifier_lock);
>> +	up_read(&vm->userptr.gpusvm.notifier_lock);
>>   	if (post_commit)
>>   		xe_vm_remove_vma(vm, vma);
>>   }
>> @@ -2625,9 +2639,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>>   
>>   		if (vma) {
>> -			down_read(&vm->userptr.notifier_lock);
>> +			down_read(&vm->userptr.gpusvm.notifier_lock);
>>   			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
>> -			up_read(&vm->userptr.notifier_lock);
>> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>>   			if (post_commit)
>>   				xe_vm_insert_vma(vm, vma);
>>   		}
>> @@ -2646,9 +2660,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>>   			xe_vma_destroy_unlocked(op->remap.next);
>>   		}
>>   		if (vma) {
>> -			down_read(&vm->userptr.notifier_lock);
>> +			down_read(&vm->userptr.gpusvm.notifier_lock);
>>   			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
>> -			up_read(&vm->userptr.notifier_lock);
>> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>>   			if (post_commit)
>>   				xe_vm_insert_vma(vm, vma);
>>   		}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 84fa41b9fa20..08f295873a2b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -52,26 +52,23 @@ struct xe_userptr {
>>   	struct list_head invalidate_link;
>>   	/** @userptr: link into VM repin list if userptr. */
>>   	struct list_head repin_link;
>> +	/**
>> +	 * @range: gpusvm range for this user pointer.
>> +	 */
>> +	struct drm_gpusvm_basic_range range;
>>   	/**
>>   	 * @notifier: MMU notifier for user pointer (invalidation call back)
>>   	 */
>>   	struct mmu_interval_notifier notifier;
>> -	/** @sgt: storage for a scatter gather table */
>> -	struct sg_table sgt;
>> -	/** @sg: allocated scatter gather table */
>> -	struct sg_table *sg;
>> +
>>   	/** @notifier_seq: notifier sequence number */
>>   	unsigned long notifier_seq;
>> -	/** @unmap_mutex: Mutex protecting dma-unmapping */
>> -	struct mutex unmap_mutex;
>>   	/**
>>   	 * @initial_bind: user pointer has been bound at least once.
>> -	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
>> -	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
>> +	 * write: vm->userptr.gpusvm.notifier_lock in read mode and vm->resv held.
>> +	 * read: vm->userptr.gpusvm.notifier_lock in write mode or vm->resv held.
>>   	 */
>>   	bool initial_bind;
>> -	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
>> -	bool mapped;
>>   #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>>   	u32 divisor;
>>   #endif
>> @@ -109,7 +106,7 @@ struct xe_vma {
>>   	/**
>>   	 * @tile_present: GT mask of binding are present for this VMA.
>>   	 * protected by vm->lock, vm->resv and for userptrs,
>> -	 * vm->userptr.notifier_lock for writing. Needs either for reading,
>> +	 * vm->userptr.gpusvm.notifier_lock for writing. Needs either for reading,
>>   	 * but if reading is done under the vm->lock only, it needs to be held
>>   	 * in write mode.
>>   	 */
>> @@ -238,16 +235,17 @@ struct xe_vm {
>>   
>>   	/** @userptr: user pointer state */
>>   	struct {
>> +		/*
>> +		 * @gpusvm: The gpusvm userptr for this vm. The
>> +		 * gpusvm.notifier_lock protects notifier in write mode and
>> +		 * submission in read mode.
>> +		 */
>> +		struct drm_gpusvm gpusvm;
> 
> This is not a full review, but I believe the notifier lock should be
> shared between SVM and userptr (i.e., we should have a single drm_gpusvm
> structure for both). The reasoning is that if we prefetch both SVM
> ranges and userptr within the same list of VM bind operations, we take a
> single lock at the final step for both. Following this approach,
> xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit would be merged into a
> single function.
> 
> +Himal, Thomas to see if they agree with me here.

+1 from my end.

> 
> Matt
> 
>>   		/**
>>   		 * @userptr.repin_list: list of VMAs which are user pointers,
>>   		 * and needs repinning. Protected by @lock.
>>   		 */
>>   		struct list_head repin_list;
>> -		/**
>> -		 * @notifier_lock: protects notifier in write mode and
>> -		 * submission in read mode.
>> -		 */
>> -		struct rw_semaphore notifier_lock;
>>   		/**
>>   		 * @userptr.invalidated_lock: Protects the
>>   		 * @userptr.invalidated list.
>> -- 
>> 2.48.1
>>

