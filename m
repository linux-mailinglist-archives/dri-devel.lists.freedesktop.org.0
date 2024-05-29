Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC568D421F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EA110E119;
	Wed, 29 May 2024 23:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5XiwSdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E9B10E119
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717026548; x=1748562548;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tHWN4R+aHk5VftIPhL67FIr9t8IB1mmNcA4v38DL4d4=;
 b=m5XiwSdtq5prfXBOVVgnmTSjBBaVfAz0gAOb5eZ1y29wgC9CVJPp3/rf
 ITlsgGhGc7DWAfAhweS6Sb+qZDyDNI8IJzbUssmM85CL69ZvEaXQruroj
 8f749E2UyyZgpfVldMr+qiz8KpTEgyJIT4nzHtcMO8aNkNhgCIwZEeHv1
 9jA8p9QqMYSnz3qH7b9iyuqsq69itFB3FPWj3poCn3PDdkvnyk08i1Lcd
 6hUICpPsYaM2wio0kjjzzOtAsIjWkwnNiVIWuUQy3LFZGzs/7WL4+m0+F
 EnHfm4icena/Y6lEwsMu0KbU2rWKSrZAt2LAoqLULA3foGNlEqbAOo0Bw g==;
X-CSE-ConnectionGUID: jl8dWwvLQ0KpxD2r5Z6NEw==
X-CSE-MsgGUID: VZUntZ4XTmGgQTs3rd8k+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24597475"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24597475"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 16:49:07 -0700
X-CSE-ConnectionGUID: 80LIM82cTuOHGSfAQUt43A==
X-CSE-MsgGUID: hFIzOV10TCmrHCmntGY49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40618470"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 16:49:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 16:49:06 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 16:49:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 16:49:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 16:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CF/5bjBiJsq3hmH0Bvct3Rf6KAcP5fMKhmVDZyS/9e48BraYQ5PeD5c0GBs3KlFcXHhJgCCI2ChhJE/BDkaENUyz8r/e1ESmCzbszdmmD2xDJdKwdUYgokcDtNw8GAHdow9AwMOVKowhVmdT87v2v9AGtBIF+lOrnvneCVgo9L6biSuuiN/cuvEUOpUYipeUkZBQhH2+6jju9WHjjhwrTQKWZVImuZNIl8tUeURmZSyzx8IuLMW2/+tiX1tsnZOBthw4h0gysoTSaL0RfQDJ+DQ3slNpHP686V3ne7j+qVPxM1yfG8qNdQLig2qoLVmqhWYHFliZLWzEbSdCXah36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br9R/eecSZy59DDdhLQSWXFnnX/nbLUXZa7KD0TfjQA=;
 b=jc+ZPMdBfUX5bvZGcOslhQG2YUCMAYSdR5OSVh0au1SZodGfoyEJPhpgZAqLjcNmRy0/spw7d9F+GFTO71gQ1m3u00LenDBTzqaf5S2YEzfn9R/0UC7Am2DiHkiP8aHK/A+PPGbCcl3oxw81cPSs7lgPa2d2Eu1F9oy9MSknzrxMIrIX7Aq/x87GlGX1kv/X7bKg7pmyFzEzfREsRNrPlNATAvMz2ZTpDdlgLtIJ9ebFKvR8RR3qjLCz3K3esQQYqnVyk44+qO49bpdnUMNmB4/Uq1SamXvPPFyVGfRlVHtjg6wkmMUUbMRlRdY7Exw5Lf3HLIdB8w6OzB0HoxLdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 23:48:56 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 23:48:56 +0000
Message-ID: <1bf31a4b-fede-4044-8390-abb2b833608d@intel.com>
Date: Wed, 29 May 2024 16:48:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/print: Introduce drm_line_printer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@intel.com>
References: <20240528130622.1152-1-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240528130622.1152-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CO1PR11MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: 1613f045-a6c4-4729-319a-08dc8039e74e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHI0YzBVUmNrcTEvU0M1bEljak5DcUQwaVVYTkJ0TWhaZGwydHdIT21UYklp?=
 =?utf-8?B?Q1FZdE1pR29NZkdYeGx3WDUwbENtTHJEaHdrc3NRa0Q2T2FMc205TEFkSFYx?=
 =?utf-8?B?QXloUmFHTVUyMXdTWWVmQk5Eb3dwQUZLZWdPbjlhU1NIU0RWeXY1VEp3VWhG?=
 =?utf-8?B?WjFUMlQ3UHNTOXFHbjRaODNkR09kNFduRmcxNmxuZ0o0akhxVHozalpQSy9q?=
 =?utf-8?B?RW9CNUFkYWtsbENMQ0pQcmg3OXpucFV6WERnZFFBQ2p1ZXhxckNjcFJjcDUr?=
 =?utf-8?B?aEd2bVFIcWl0MHRvUGJHUGg2L2o0NEpxaDFaZVlPTDhBQ2dxa1Y3Um9DTWxV?=
 =?utf-8?B?SXhDbGFpL0g4aUpyemdWcGNSWk9yZUhMWm9lSjhXSFFVUzM3Nmd2ZE13RjA1?=
 =?utf-8?B?UGFRRnBZRnlvTXlOcm1rMVUveUpqcXF2b3Q3d21NQlFkVWIzazhLc3dqYWlG?=
 =?utf-8?B?SFRLdFVYU2N2K2cyNVphRVNQUDd2UEdrendFTVBCK0NFbW9EOFlDTU5Cd3J2?=
 =?utf-8?B?Q0JyUUpTR1BIWm9jdUlPQ09Ud0pFaWw3eEZRbDlnSlpPa2pNejM0WmRDWmI5?=
 =?utf-8?B?Z2psV0tPSWc3RzJhSXIvSXd3MDhOZ2pXRUpkMXhuelNZVGxWU0p4MDBuMFhz?=
 =?utf-8?B?ZWx2WWg3US9IekdacEhLb25RdVNpOHY0Y1ZLSTRzVHE3UDFKUmI0eGw0ckNv?=
 =?utf-8?B?MzlNMGtPRlNZWFp5UDU2LzZDajBFYmpVSlkxUzR0bStXNEI3V0lEc0YrYS9v?=
 =?utf-8?B?NkdIS0FpT3pmbzBZMHVobC9GVjN5cHJLUFREKytjL2RzRjU4dWNCUnA2S01S?=
 =?utf-8?B?VFhTK0JadFNIVWhHbDRITFJFL0J5dk9qK0oxRkxTQWNsaVg3NDBrSUZkZmtZ?=
 =?utf-8?B?bUZIOWU4ZUhwUWMwb2FoT3MrMW1GNXpvSTZxRUwzYlZ3SmE0Q2RzTnJGdEhk?=
 =?utf-8?B?a1RNWUtabm1HOVpBSTFUTjZhTmtRaU0wZHpHVjZNNWY4dTh3aTNaQ0lqRXVD?=
 =?utf-8?B?bXdmYjF3U280azlzOHVvV2lVd1F4R2hGZHZySml0WXR3Q0pRbFBVNXd1WFFp?=
 =?utf-8?B?b3JoSlFOK2JVeWgrTXVPczFqN0wrWEEyMUprZTRjYUxiYlpQbnVuOWNHZ1dJ?=
 =?utf-8?B?N2M0TTc3K25McXBMQk5NcE1nZEpNQ1N4SVZOQkpSVXlybU45N3dDYmhwTGdW?=
 =?utf-8?B?dkxLanAyeGc1dVU1U2xlQVdKKzRvQkZyZlpWZGluU21NZDhVWkhPTFJDMVFa?=
 =?utf-8?B?SGt5N1crTnpnWVJiOUQrbHJML0FHK0NacTRRYnpoNE5BNE9YTWFwVE10cUlZ?=
 =?utf-8?B?UXl3REVEZDNsT3JCQVNPcTNTWndSaHFjOUo2d3hEa29VRnovQXVwZ0JXa1o0?=
 =?utf-8?B?aWo3czE0ZTJTWUh3d1NVVmFONGtLTTBPUjdrRXVwcm12ZUdrUitheWhEVmwv?=
 =?utf-8?B?VXoxV2w0ZjdTOFBkN1JPek8wanpjNHU5bUlHT0lnSXpCR2pFVi8rRjU3dWI4?=
 =?utf-8?B?aW5tZVRvZEJCdXpFRU9mR09GekE2dm13bTlvbkNrVExzOEFtZDNkdE1kTjRi?=
 =?utf-8?B?azVZNW10aWtsR3MxR2pOWWxlWnlZditCL3lrdWVxbDdQZWEzZmNYbVlvTnRs?=
 =?utf-8?B?K05jZVY3U09oQUJuUG5adUpBa041TndvQ0E1MUVTd1htNnlBd21tUmo0bTBj?=
 =?utf-8?B?SUU4TUhuTSt5QTZYaXp2VXV1cUFGNHVPa09DNzhWVFAyNmxnUXRkUnVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFpwTVBsc3pTY0FOV01ubi9Uams2WHdpMFd2MmJ5MEE3eW14OXFZbkZidDk4?=
 =?utf-8?B?RXZBanorS3JvMDRsQzdYWGVLQlN4VlU5bU5aMWRpenJCVHBqTHBTN1I1NFEy?=
 =?utf-8?B?OWxieGpCcW5pSGM1dTdQQW0zaC9iRUtpenpCOVk2eGxqUnZ4OXN3ZUNLVEc5?=
 =?utf-8?B?enhnc2hrTlh5STRxblJPMnlHWGJadWlYS3BuMXhSNVdWWVFQVDRLa0VmSEYw?=
 =?utf-8?B?ZGpqVWpOclM2MCtLaThhQlNSdjFOTkhmNTN0cUpkbEsxR0VGSS9FWmhuL0Jn?=
 =?utf-8?B?ZnJpU2hsZ1lMYjRBb1JLNlhCMkhaYm1UNFR6dVMwWTIwM2NyRXFUSGhaMWpt?=
 =?utf-8?B?UFcyTWZUTmMwcExuU0Y4MkwrWVUydzB6OXY5cjB6S2ViM3hHem0vS2hGSkhU?=
 =?utf-8?B?UnVRczRNSmdLV1R0K2xnZFU3Rm14L2V2RVhRWHk3SkRWUUxaZWwrdk9iMVFn?=
 =?utf-8?B?c01XZHN0OXdlRVZ0VVlWTkdJdWw0akxxSTZ3aVZwZlZETXAxYllsQVZ1ZDI0?=
 =?utf-8?B?YktKNWJhUWxIeHlTRDBjMncybkdnRnBRcjRZTWNPODZYWTllakl4YzJUclJD?=
 =?utf-8?B?OVprbElrUVRkYkFhYk5SVWdiUXU1aVdUTTE1VURNRWJWYzh6NTZnMVZBcy9O?=
 =?utf-8?B?RHFmbWJoTWN2MDQwVUs4aFpGVTl0RjkxNHNjY3BBR016V29naU1vcXFIc0hX?=
 =?utf-8?B?WG9CV0U2WU0xZkdkOTk5Rkd0Q1VNT1Z1ZG1kRW51OFBPY01YN3QzN2JUNUF5?=
 =?utf-8?B?UENrdG4rcjNvOXhYcWZGZllNT2t6dnJxZlpCM3JhOUZxU0dsOVk5QzZIVVk0?=
 =?utf-8?B?QnFMMmFoakE3YU10NkhoQ3ZUeFFnM3lxaW5IOFM4RitLbG5lbnpVRGNBMGhO?=
 =?utf-8?B?VkVaMzh0anJXWHFvRFkwZG1wRFFKdmxvbHlVMFY4NHczSTMrbDZ5ZTNEc3RT?=
 =?utf-8?B?b2lFRDVEcFZhYVNQa3dtbzVxbWpVaFdvdUM5V2YxNkNoWHB3V1hKQlhWZmM4?=
 =?utf-8?B?a0s1NkVqRFc0U0ZvQlZSUWJiQXFRcU5kb0VTRHUvMllscEcrenNrRkhjejdu?=
 =?utf-8?B?dkNjbVl4Wnh5NVBOY2JIcDBzUWJqd3U4d1M5K21seENmbnpNb2N4enpqU2NW?=
 =?utf-8?B?c1J2Vm1KTU5FYXg0amFjREx3NnNyMy96TDJJTFRKek96MWZRZUNFaHJ5Y1Vj?=
 =?utf-8?B?dE9kZlJiRXRhK1I3OS91eENDRnhDWWNNZ25JclNET0FYMityaCtqWmljVjlL?=
 =?utf-8?B?TmZKeWptM0FpSG90WVlidVRKdEQycU9sdFZkazE1cm9yaXJpbWI4eFhzZmFR?=
 =?utf-8?B?SDFSV3lkbkIyN1pxSVo1QTJSTU1Mb201c3JzcHY2UWxZUVlvWWQyY2lsblRB?=
 =?utf-8?B?YjRuc1ZKVWR1NmUrWnNUVnVidHBqSEFZQzF2c1VWNjNUZHFMbnFqK0tTVlBt?=
 =?utf-8?B?QkZyZTR4S0FWMlVEZkNQVXAzais1SWVxYktTczJZTjJ2bGRzcUxFUm1rYjRU?=
 =?utf-8?B?OS9IUVpXTFB0NmpFeSs3ZWdIbGxnNTMwQ1N4dW1VSnNZQ1BIZ2UxU201SVRO?=
 =?utf-8?B?ZGd5djFRdDljY2dMOXpNbmt0ZURJczhBYXBRNjVwVXNaVWZJUWx3T1NDRm5M?=
 =?utf-8?B?VzZRMGltTmtVeEVUMGFVcDZwZFJZQVJFdCtvQllEMzhDZS9pQmdKN0ppZ0VR?=
 =?utf-8?B?RGgvb2xHZzlUOGU2Y0FLa0IwTXRNeHluOEg2NGd0bWIwdXZKM21Wd3V2TTY3?=
 =?utf-8?B?VmhEZGR1RzRHUXlreDhMTHMwckFNZ1Q4cTNKUVlDMzYzQTdIVlhINGFYcERi?=
 =?utf-8?B?cUdtblhXckpGdDgrY1VEK3ZwOHVUQmxpcm9sRGlKVXdYU3R3R05iM3J4bFNj?=
 =?utf-8?B?TFF4QmZOSXdCKzJKQm93eXY2K1phZDViNmpsNk00N3llNHNnZ2ZTZ20vc1hF?=
 =?utf-8?B?ejJsYmNMNzJFNjRhS2tpRTM4YTRlRVNKS3VUVGQzb29CM1RoTmU3MmlGZ1JS?=
 =?utf-8?B?RktCemQxOGM3Z2lHeEVuelBCbFpONUZrTWtQRzdVNG8zTEU3ODRiQXZxMkdp?=
 =?utf-8?B?Y3pCUSt0aXZNQTEzNkx2VU9rNGlwcGhzVVdnbFUrSFlwRkw2S1RMWEJUTk0x?=
 =?utf-8?B?REdFL3cyVTlRc0FwZTlLRnY1OWFCeUVnU1cxblYzTWNKa3NmVUtOSUdLOWNi?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1613f045-a6c4-4729-319a-08dc8039e74e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 23:48:56.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2AhSB2ty5ppa8ETqBEY7FUJy7UtrIVkBvYHtx8FrS3iydsJZePG6hywPcA7d98s4CojgbOAYRpBuwOUIHnsCVLgGxKyr6kSGMw4QOwlY8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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

On 5/28/2024 06:06, Michal Wajdeczko wrote:
> This drm printer wrapper can be used to increase the robustness of
> the captured output generated by any other drm_printer to make sure
> we didn't lost any intermediate lines of the output by adding line
> numbers to each output line. Helpful for capturing some crash data.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
> v2: don't abuse prefix, use union instead (Jani)
>      don't use 'dp' as name, prefer 'p' (Jani)
>      add support for unique series identifier (John)
> ---
>   drivers/gpu/drm/drm_print.c | 14 ++++++++
>   include/drm/drm_print.h     | 68 ++++++++++++++++++++++++++++++++++++-
>   2 files changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index cf2efb44722c..be9cbebff5b3 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -214,6 +214,20 @@ void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>   }
>   EXPORT_SYMBOL(__drm_printfn_err);
>   
> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf)
> +{
> +	unsigned int counter = ++p->line.counter;
Wrong units, but see below anyway...

> +	const char *prefix = p->prefix ?: "";
> +	const char *pad = p->prefix ? " " : "";
> +
> +	if (p->line.series)
> +		drm_printf(p->arg, "%s%s%u.%u: %pV",
> +			   prefix, pad, p->line.series, counter, vaf);
> +	else
> +		drm_printf(p->arg, "%s%s%u: %pV", prefix, pad, counter, vaf);
> +}
> +EXPORT_SYMBOL(__drm_printfn_line);
> +
>   /**
>    * drm_puts - print a const string to a &drm_printer stream
>    * @p: the &drm printer
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 089950ad8681..f4d9b98d7909 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -176,7 +176,13 @@ struct drm_printer {
>   	void (*puts)(struct drm_printer *p, const char *str);
>   	void *arg;
>   	const char *prefix;
> -	enum drm_debug_category category;
> +	union {
> +		enum drm_debug_category category;
> +		struct {
> +			unsigned short series;
> +			unsigned short counter;
Any particular reason for using 'short' rather than 'int'? Short is only 
16bits right? That might seem huge but a GuC log buffer with 16MB debug 
log (and minimum sizes for the other sections) when dumped via the 
original debugfs hexdump mechanism is 1,245,444 lines. That line count 
goes down a lot when you start using longer lines for the dump, but it 
is still in the tens of thousands of lines.  So limiting to 16 bits is 
an overflow just waiting to happen.

> +		} line;
> +	};
>   };
>   
>   void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf);
> @@ -186,6 +192,7 @@ void __drm_puts_seq_file(struct drm_printer *p, const char *str);
>   void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
>   void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf);
>   void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf);
>   
>   __printf(2, 3)
>   void drm_printf(struct drm_printer *p, const char *f, ...);
> @@ -357,6 +364,65 @@ static inline struct drm_printer drm_err_printer(struct drm_device *drm,
>   	return p;
>   }
>   
> +/**
> + * drm_line_printer - construct a &drm_printer that prefixes outputs with line numbers
> + * @p: the &struct drm_printer which actually generates the output
> + * @prefix: optional output prefix, or NULL for no prefix
> + * @series: optional unique series identifier, or 0 to omit identifier in the output
> + *
> + * This printer can be used to increase the robustness of the captured output
> + * to make sure we didn't lost any intermediate lines of the output. Helpful
> + * while capturing some crash data.
> + *
> + * Example 1::
> + *
> + *	void crash_dump(struct drm_device *drm)
> + *	{
> + *		static unsigned short id;
> + *		struct drm_printer p = drm_err_printer(drm, "crash");
> + *		struct drm_printer lp = drm_line_printer(&p, "dump", ++id);
Is there any benefit or other reason to split the prefix across two 
separate printers? It seems like a source of confusion. As in, the code 
will allow a double prefix, there is not much you can do about that 
because losing the prefix from drm_line_printer would mean no prefix at 
all when not using drm_err_printer underneath. But why explicitly split 
the message across both printers in the usage example? This is saying 
that this is the recommended way to use the interface, but with no 
explanation of why the split is required or how the split should be done.

Also, there is really no specific connection to crashes. The purpose of 
this is for allowing the dumping of multi-line blocks of data. One use 
is for debugging crashes. But there are many debug operations that 
require the same dump and do not involve a crash. And this support is 
certainly not intended to be used on general end-user GPU hangs. For 
those, everything should be part of the devcoredump core file that is 
produced and accessible via sysfs. We absolutely should not be dumping 
huge data blocks in customer release drivers except in very extreme 
circumstances.

> + *
> + *		drm_printf(&lp, "foo");
> + *		drm_printf(&lp, "bar");
> + *	}
> + *
> + * Above code will print into the dmesg something like::
> + *
> + *	[ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.1: foo
> + *	[ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.2: bar
> + *
> + * Example 2::
> + *
> + *	void line_dump(struct device *dev)
> + *	{
> + *		struct drm_printer p = drm_info_printer(dev);
> + *		struct drm_printer lp = drm_line_printer(&p, NULL, 0);
> + *
> + *		drm_printf(&lp, "foo");
> + *		drm_printf(&lp, "bar");
> + *	}
> + *
> + * Above code will print::
> + *
> + *	[ ] 0000:00:00.0: [drm] 1: foo
> + *	[ ] 0000:00:00.0: [drm] 2: bar
Not really seeing the point of having two examples listed. The first 
includes all the optional extras, the second is just repeating with no 
new information.

John.

> + *
> + * RETURNS:
> + * The &drm_printer object
> + */
> +static inline struct drm_printer drm_line_printer(struct drm_printer *p,
> +						  const char *prefix,
> +						  unsigned short series)
> +{
> +	struct drm_printer lp = {
> +		.printfn = __drm_printfn_line,
> +		.arg = p,
> +		.prefix = prefix,
> +		.line = { .series = series, },
> +	};
> +	return lp;
> +}
> +
>   /*
>    * struct device based logging
>    *

