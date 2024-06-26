Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6179185F6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C75910E91A;
	Wed, 26 Jun 2024 15:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPWJUrn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3F610E91A;
 Wed, 26 Jun 2024 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719416213; x=1750952213;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=9A/wX7OtisTR3J3HvLRA5/EQ9/5R4HDHSgI1dW+hOWw=;
 b=PPWJUrn9OpoisIIHG5/h3BPHqi2M4jIndwItQnnaxyXIDl2Dt69dR31m
 wu+bit/q30kjHluEIO1iaC1PZGo60opIgNpeLbIIooGSZxksYz0ivTSSJ
 QyN3Su08sObuR7qGp3FpitfGOdFZoLdziNpeajfo4golOONduoLCfDFww
 /7WIe8vSRtAkTMkr4XlOeTWtrmo3nJKM6d1QDV/xhqDtJjkxv6U/yG8f1
 aqIoPRiy7FibdCF2BolW963x2crbXsTLISsrN/+BTJ57fhW4YqwXlt0Na
 fDtDmVFvN5ouUctu6+5dr2CGIB6ur7JnKuQcFgX9hozJuCb8PdqVp3EBM g==;
X-CSE-ConnectionGUID: dMIlQYn/Tamk7qRxqQNu5w==
X-CSE-MsgGUID: RgmbwwkIQ3iw5waX7+07QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16626810"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208,217";a="16626810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:36:53 -0700
X-CSE-ConnectionGUID: xQIwVMGGRzaFKnn3964R5g==
X-CSE-MsgGUID: pKnNMSavRBSOQyPU3FNReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208,217";a="43852179"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 08:36:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 08:36:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 08:36:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 08:36:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 08:36:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofEbkgVVQosmlgbVE8TFsKFTHU7bwEYR9lQNS9ZmPGt68lQsvtkwC/ohe/DpKMWaEjbomgtvUgKe5wpsya/MIHZ7jSGQUgU9PkD0yNuAnc7SUPNs4w3D03ADjyBSWtiFXFqF39BLzZB/IxzXkxRJTtQzPBm8yZyKhgeu1e7WlIW1v4ChwPRmdttDnXm34YLzoXD7QOt67W6G/6JycERIYochTy25ky4KroDRNVtQn7Ha3SN7CWJHUXkeNARZGYZhmL0NrnpQ6jS0K6TOscQrXJZ04KkK2t/eg8wQIn0U6uuZKMlXqTXVi8WsjK5Btod7tlTQDOf/Q0H137B0sPRSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCRmcDAqDi/yuUeFk7nQj3+pEgRcehVRwbgeY7AVIDo=;
 b=jAaQq8kEuemrS5Zo5sbc5UVFdzFjX0rewb6evcSAFVY3DQl1aAh6Nvh1H/HmJniSPnuirq1nZAVPummzdHomYyDO3SZBEw0uQMLMa6omw+LQKGmdfR3672x/FvYkXLhDjNBYVlzZSw/zhtOv82Lo08Z+Bb3K9IRh+Lt3aE4lmgLNqYfkCsrkXxA+Po8EBIVmdPoqbwv7D2Meft0EoTEwLpfAEJc6rxQ/5EMZrmwxMXeUbXDzaMYS0WtqnJXSHbtQRdOLo0eEt2iGYu2DEwAeve0gnpKhUA/rtNpP8ImlwxM43JoolbC1XALjFkWxahKRJYRcIJCs2Ty1y4erD0vxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Wed, 26 Jun 2024 15:36:48 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.033; Wed, 26 Jun 2024
 15:36:48 +0000
Content-Type: multipart/alternative;
 boundary="------------mTm6EaJ22q7JacKzrsMrydd2"
Message-ID: <5871ef5e-50f2-4623-b3c2-8275d65aab17@intel.com>
Date: Wed, 26 Jun 2024 17:36:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM to
 userspace
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Andi
 Shyti <andi.shyti@linux.intel.com>
References: <20240626143318.11600-1-nirmoy.das@intel.com>
 <ZnwylM64-5HqQr4R@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZnwylM64-5HqQr4R@intel.com>
X-ClientProxiedBy: DB8PR09CA0007.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 437a5c16-9690-4ff9-4f45-08dc95f5cabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2gvQ2phb0hjWGp1VnBDOVVNeVUvMHRNdXRQaVdzeFBYQXlVb1pPdCtqdGpT?=
 =?utf-8?B?Ymk0Mm0wSG5KR1VaN0JDUzBCekdGRHVYLzhncnJISldhZUpMTnp5UEUwOG8w?=
 =?utf-8?B?cjN5YzJSdGlobko5SVhrY1BCVzcvZkZYaHZaMlNVS2VwRFU5S1M5R0U3eFda?=
 =?utf-8?B?eGl0S1Z4S3BCRG0zelVzakd0NmxzOEZWNVhLZ1FGTVhuUlRuaUIySnQ5M09R?=
 =?utf-8?B?ZDFSNG5VVElrY1VjY0lMNFVCQWNaRWhkbkFEYWY3TmhhM2hjZkxUOEF6QWxY?=
 =?utf-8?B?TjRqYXc2YUo0YmN2SlJQWUEwVE1USkxwbDFDbjJ0b096QmhsTjVrTE9lb1RG?=
 =?utf-8?B?YVREVWlZK21ERlpXQVJMRFU2cXZ1SEgrdTM1QUZkSTZIMEd3YzRFSEZXL040?=
 =?utf-8?B?VjNWUjE4aDVsekxSNVI4TVNXK0pZV1huNEZVRnBRQUxBQTZJbDFUM0Vlc2dk?=
 =?utf-8?B?bnZBTFRFUFZGWS9nVDdBTmViT2cyekhnUlRiWkhDN05sK1gwZ2kvNHZxY1lL?=
 =?utf-8?B?S3YrMEp3NU5FaTdlQkRJTnZicFNhQnAvdCsweHZCL1c3RDh6MEhsMTBPNHJG?=
 =?utf-8?B?V0l0QllwQU1mRG5VOFR0Y2tUZk5MN2tYaXZlYU9rWkFKNjJseWl2Vk5VdEFz?=
 =?utf-8?B?WWI3eDZJelVVaTliZVJXcGo4S0dzNnZPMmtGMENDbXUxK2ovWitCUGhBankz?=
 =?utf-8?B?Q3g2dXFBOFBINlorQ0x3MDVlZHp0cHlSUDFEcFpRTUJxVGI5UzNGb0d4dkxP?=
 =?utf-8?B?dDJSK0UyVkx4NExUZXg2c2ttL29sMWlwdk9kS3l1SDRkU1ZnUys0dXAycnRU?=
 =?utf-8?B?cm1xN1M4bkI0VTBqTk1FYWZoajcvS2hXanBNRXhqbzNZb2pyVG5UNVBrUlRr?=
 =?utf-8?B?UCt1ajhVVGxJNHdSMWlySTBWYmdrRjNyNUVKTFhOVms5bXVKeDFXeXpmREdV?=
 =?utf-8?B?dW44aXRZZERiZVpmbjNRNEIzOHh0cnROU09qSTNWUFJEREQyUWtMay9iTW4z?=
 =?utf-8?B?cTJ0bkI3Y3dud2d5N1pGN3dzTnhRR05SbndpTGlUb01wMjFKdnNVQ0R3MTZy?=
 =?utf-8?B?RjNSMlRvekRQbk5VY3prbkUvbkkvTHl1QloyQnlGVWtoTThlNFpvbkZ3aGZL?=
 =?utf-8?B?bUJ1QWc2MGtJcVpJbFBLWndGaWlhTERUdDM2aG1QZVVzUVUvNUFiS1JmNko4?=
 =?utf-8?B?Nm8rcVM1YVlvQ0svbXBpSXBuUGFDV010K3M2L09OdWMyQWxpUkplcjJ0cmg4?=
 =?utf-8?B?K2NrUU04eUdzdWxoN1hrYjJBVHptUFdCWUpVUURWNExKTlo3VWt0Z2xUbEY2?=
 =?utf-8?B?Q2UzSWNPbFV5WGpseHF1YVVmalAvVHZmVXpnNi9ReGpEd1oxQUlCbWVmWGwr?=
 =?utf-8?B?U3R6Y2RmbUtWSWFDM2EvOGFYTHNKUDhOaTVmT29uN0xEcGkrQ09wTHd5bjJq?=
 =?utf-8?B?Mjl6eFRidk0yRXlXWG1mSUxvOE1VdUtGU3JLaW40OUtibnZXOUg3bFhZN2xq?=
 =?utf-8?B?TkM1TmNwcDJVa25kUDhJcUlsbk11byttTXU4a2YwLzJBTXZlM3paNGs1L3Nq?=
 =?utf-8?B?K0YzTWczWWUxRWFsMjlFUDZuQWhYa2IxSTVYdzI1U2xzQ1BJSGVtaUlSS05s?=
 =?utf-8?B?ck56NXk0NnFtcFFZNWVKTXpaVG9YNGNKL2ZEVFQzdHNDL1JqTFZiTHVNRTF0?=
 =?utf-8?Q?2pBFNOZNIbPoPlRZ5NUl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1IU2xkamwyczJFaFhOOG8wSHFKcUwxWmU2RWlxbGpaNVBmRCtwZVc0OVNp?=
 =?utf-8?B?dTVJN1lVTFprV2lXN2g0TzY2M3psclI2Zm1lK0JkUEIvcGN2SFBtM00rMXky?=
 =?utf-8?B?Uy9CWlBTRVJRN3RRZm1FdHJYS2h1eG1zaUlSZjIzUjJacjFERStXaUUyZWtV?=
 =?utf-8?B?NDc3MTFxcFpqTmtQUFhQUmxJaXQ5by91M2ZtbUhzZkV4SHhvKzJ1d3U2eVYx?=
 =?utf-8?B?Y3NFbGhDZWl6OHRNNXVja0VzcUVHN1k4R3NYYWJua1kxSFNSdTY3eVpTZk11?=
 =?utf-8?B?UWVkUStaRWN6akRtaU5wbEVXS2ptTnF6ZWRPamZuaGNFcVZ4WDV2aDBZMnZF?=
 =?utf-8?B?SXMxVlpGbXNmM0JHUGFBL0puMVc1b2dDK3VsWlhmRHlyTUFWK3pxN3c3U0FY?=
 =?utf-8?B?TkNjcHdzMnNjWUtGbjZMMmNMUG85SU5MUm44bml6eUw2MDdaSTZjSElnM092?=
 =?utf-8?B?S1V5ZGtZRHVqcGFPUkFSZHp5NytGUEhuem5Zc3ZIbkxWaFhQVzI3cGo1TjFl?=
 =?utf-8?B?VlVCYmxwb0RTeThXaVJVY2JPRDNRczFUbUFnYy9XT3RvbHA0dGt4Smp4cFd0?=
 =?utf-8?B?dlVZRGhJbGl5WWpXOGNQd0p0SWV4WXh2MkhaRFZoaTVXSVVpYjgrY2pJa1pQ?=
 =?utf-8?B?N0FwYzJxd1NVaFFZUHVPRHQrVExrdFkrNkJBbzJoeDI5SHd5eE1rWGlWUjI5?=
 =?utf-8?B?Vy80TnRKTzFpcWdpTU5iaUZvcldQOHhRSEg3MXZ2QW95MXpVbEZOWHVpbU9t?=
 =?utf-8?B?ZS9OZ1NrQzZobEw0S2M3dEhuZjVOSGpuOUZsR2VMYm1iTE1aeUpjWXBYeUVx?=
 =?utf-8?B?U0ZuOWU1VUZLMVFsNUNhTFNvY1U5Ui9LWkZSMWUzR2RxRy9DQXM0TENPV3cz?=
 =?utf-8?B?cWpxQ21zYm5CaGdFazBTaU1GSHdqQzdkVDJWbktPVFBJRGk5L2ZtQVZDUFJp?=
 =?utf-8?B?S1pVcGpTdDlhUjBsWFVsOGRzNkN1UXpCR1RFcDBNaDNCQzh3QS9pNWtob2dZ?=
 =?utf-8?B?NFpsSUFEWVh1STlPeDM1clVKL1pzbHBBRFgyZ083ZjhkV2pNalVSaHFyZlNm?=
 =?utf-8?B?K2VBYnBySzVjZXdYVGRDMkVXZWd2dzZWdjNaV0hkTVJQOU5ZSzBMQUppdi9Y?=
 =?utf-8?B?VTE3LzIzOGo1ZWcvdlpHVVFCaFJUaHRoSklkd3l6M2FVby9iS1BPM0RZZXhS?=
 =?utf-8?B?SEdHcnZMSG5qdFpkV1VVM2tNeXhGVWd4ZEIzOG5ZRkt5aWhYWTFrbU1tWGpa?=
 =?utf-8?B?Qnd5QXZUSldYRHgzZElRM3k0VkNaUHBYaEw4d0l2QlExaGR5eTZya2JPOEps?=
 =?utf-8?B?dUt4OGVJSExBdjM0bmlqNVJYTnBOZUsvNU0yMWM2SHV3cmVsUG45WElUblgz?=
 =?utf-8?B?c2d3V29vZzRLVitYY1NwdXhIRUxMeTgwRVRxekNLWng0cGhwdGtrOWhET3JE?=
 =?utf-8?B?NysydngraUE2Y0sxRHczYjBXWDBXRW9zZURYYWlHZWh0Qk1DckJTaVJkdXBS?=
 =?utf-8?B?Z1JRSXZPanNUWEloYk1nNHJLZHptMzYzK0c1VE1DU0doM0xibHlFbitTMUwv?=
 =?utf-8?B?aVhWMDMvK0Q1RTZVK0dzMzYwMDZGVk5VNDMrei9oalFJWHI2RmZOajF3K1pn?=
 =?utf-8?B?di9FeVlYZzlTYmc4V3oweDI4SHpxWjltOEZ5T1lMeGV6RTFCa0JtNWRqZEVj?=
 =?utf-8?B?UDdCbUwvc2hYYWtuMXJJYkczS3k1bVd0WFpBb2tWczZaREdCWjFrZ0VleGg4?=
 =?utf-8?B?QmNlMTduWTNIci8ySnpYYkRhTjJoTmhWUlo2bkNoMDlqVDlDWVhyVVdidDVZ?=
 =?utf-8?B?bnJhQWNkYnY0WFdSUG9TaWVjUjVNelpKOFN3ZG51b0pKbWxTOU9JZDBPUFp5?=
 =?utf-8?B?OFNqelF4Si9SSWNpckFEeXlkbm5iRWh0azkxL1lJb0haanZVWFhjZDVBZFdF?=
 =?utf-8?B?VVI0dTZrazlwQVYwT3NPejJId2JjTDNSUU1JVE54TGhlV1dOY0UvOEpnM01V?=
 =?utf-8?B?b0N6NVpUS21LQk1JSFgydXJjdnJDS2JnaXA0akNka3JoSXpaSUxHZEZDN2Ro?=
 =?utf-8?B?bWE1b1JXZVJvays3ek1veGVkZlM4R2lpelA0VTE0anRHRUxIOE5tQkZEQ29O?=
 =?utf-8?Q?6XrKw3rgS6fBajlFqINgWAthu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 437a5c16-9690-4ff9-4f45-08dc95f5cabd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 15:36:48.2670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9Ng4xouyGtVS/yCcHxnXnc5atEXe6aDq5sw/Ll0/EqZMytN+RWNQkfM3jbroUBCQ/Tc0zW/1/Gaw52Y3VeQsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

--------------mTm6EaJ22q7JacKzrsMrydd2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rodrigo,

On 6/26/2024 5:24 PM, Rodrigo Vivi wrote:
> On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:
>> We report object allocation failures to userspace with ENOMEM
>> so add __GFP_NOWARN to remove superfluous oom warnings.
>>
>> Closes:https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
>> Cc: Andi Shyti<andi.shyti@linux.intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_scatterlist.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
>> index e93d2538f298..4d830740946d 100644
>> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
>> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
>> @@ -90,7 +90,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>>   
>>   	GEM_BUG_ON(!max_segment);
>>   
>> -	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
>> +	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
>>   	if (!rsgt)
>>   		return ERR_PTR(-ENOMEM);
> is it really safe?
> I don't believe we can guarantee a good fallback plan here if allocation fails.
> __i915_refct_sgt_init
> might end up in a null dereference, no?!

Kernel is now returning ENOMEM and also throwing a oom warning stack. 
With __GFP_NOWARN

the oom warning stack won't be there in the dmesg but userspace will 
still get ENOMEM as expected.

Let me know if got your question correctly.

Regards,

Nirmoy

>
>>   
>> @@ -104,7 +104,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>>   	}
>>   
>>   	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
>> -			   GFP_KERNEL)) {
>> +			   GFP_KERNEL | __GFP_NOWARN)) {
>>   		i915_refct_sgt_put(rsgt);
>>   		return ERR_PTR(-ENOMEM);
>>   	}
>> @@ -178,7 +178,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>>   	GEM_BUG_ON(list_empty(blocks));
>>   	GEM_BUG_ON(!max_segment);
>>   
>> -	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
>> +	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
>>   	if (!rsgt)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> @@ -190,7 +190,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>>   		return ERR_PTR(-E2BIG);
>>   	}
>>   
>> -	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {
>> +	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL | __GFP_NOWARN)) {
>>   		i915_refct_sgt_put(rsgt);
>>   		return ERR_PTR(-ENOMEM);
>>   	}
>> -- 
>> 2.42.0
>>
--------------mTm6EaJ22q7JacKzrsMrydd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Rodrigo,<br>
    </p>
    <div class="moz-cite-prefix">On 6/26/2024 5:24 PM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZnwylM64-5HqQr4R@intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We report object allocation failures to userspace with ENOMEM
so add __GFP_NOWARN to remove superfluous oom warnings.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936</a>
Cc: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/i915_scatterlist.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index e93d2538f298..4d830740946d 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -90,7 +90,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 
 	GEM_BUG_ON(!max_segment);
 
-	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
+	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
is it really safe?
I don't believe we can guarantee a good fallback plan here if allocation fails.
__i915_refct_sgt_init
might end up in a null dereference, no?!</pre>
    </blockquote>
    <p>Kernel is now returning&nbsp; <span style="white-space: pre-wrap">ENOMEM and also throwing a oom warning stack. With </span><span style="white-space: pre-wrap">__GFP_NOWARN</span></p>
    <p><span style="white-space: pre-wrap">the oom warning stack won't be  there in the dmesg but userspace will still get </span><span style="white-space: pre-wrap">ENOMEM as expected.</span></p>
    <p><span style="white-space: pre-wrap">Let me know if got your question correctly.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <p><span style="white-space: pre-wrap"> 
</span></p>
    <blockquote type="cite" cite="mid:ZnwylM64-5HqQr4R@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
@@ -104,7 +104,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	}
 
 	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node-&gt;size, segment_pages),
-			   GFP_KERNEL)) {
+			   GFP_KERNEL | __GFP_NOWARN)) {
 		i915_refct_sgt_put(rsgt);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -178,7 +178,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 	GEM_BUG_ON(list_empty(blocks));
 	GEM_BUG_ON(!max_segment);
 
-	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
+	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
 
@@ -190,7 +190,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 		return ERR_PTR(-E2BIG);
 	}
 
-	if (sg_alloc_table(st, PFN_UP(res-&gt;size), GFP_KERNEL)) {
+	if (sg_alloc_table(st, PFN_UP(res-&gt;size), GFP_KERNEL | __GFP_NOWARN)) {
 		i915_refct_sgt_put(rsgt);
 		return ERR_PTR(-ENOMEM);
 	}
-- 
2.42.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------mTm6EaJ22q7JacKzrsMrydd2--
