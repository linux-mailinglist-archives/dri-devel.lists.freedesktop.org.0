Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B612190D7F9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A710E717;
	Tue, 18 Jun 2024 16:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvMfxMNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087A010E720
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718726490; x=1750262490;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j6/sGIWIxj9EoEpTyDcRjtu/OgPihgCxaQVt4hNXHV8=;
 b=bvMfxMNFqa/Of7MipMMj00vbhYU/cgXW7u8H1u5sUmZ87Yz0ww7JTX77
 1JZQAhGBmV843ORvZ4cvDW38uDZ1E2czOYogxZwxnMkY2gLtrE5S0Gggm
 s0es62PQUHQ9KtEyLH5AZ5pbI1qTUJeHum2SQglmGnhCoFLfotXDOk83L
 jE2BkvPu7sO5xGaRtCXhmRfPlA+TWbdhT5nazjgC69OV32yf3WDxonaDo
 sNM9C2mnME4ZJtp5NGOfhR0pKXG3HvMrJ0G3qtYvx7comia51k+Uem6rU
 NMmdjt16gZeS2ZF0tvf/ehzlvlvR+xkycWJFNnhCG0Z2XDEkyOgDxwggE w==;
X-CSE-ConnectionGUID: oFbNIz6cQYy672WY3luilg==
X-CSE-MsgGUID: XV/sRvA0R2SzV9oU06LsUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15586877"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15586877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 09:01:22 -0700
X-CSE-ConnectionGUID: q6bu/SvKRrm25bPVZ3jA5w==
X-CSE-MsgGUID: Upng9T6YRTudK9fyNcw7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="72350761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 09:01:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:01:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:01:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 09:01:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 09:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMduYHng00f5M5LxR9UeegQPgEwk9qLjp+RAfToMh6SbpsPKpwIr92TT+u7E5IPBnTVN2E271Q93267/h2puJVTt2mcTX2N6NgGZqe3rmJJuzi0EeVv4vBvIOk67OFg4ejL94Kyn8AK5r7pRtwMNiENRXi+PZOJkmShWXyA2S2iu2QkFNXq3bkGiI+2Wvzrhyw9Ilf0A0ZPwtKQXiRsAdVUekTGWqxzM1LPdxU2COHSsZvvQXVL8s3EydV4jyF2U3CWb9+CcoaNjAkTCdkDH1TbTu1oRl+cVLQCTwlEjPT7/LMxPAz2kDMW1TB6x1um6QsE5IEy8pEuGreorYtBNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4i0flyTcreghIoDCKMN/13ammvbx9QAL42ETZrjzbk=;
 b=WdTNEclcewDMebOTd7009qD3W9I4nNuOe4fEGQ1iTywjIGr2OAJePfPwIShjy463PCJzAg/p44wYuzsT4Mieo/kTbwQ8i3DV0ui0ai3k5SXtS7CgHqjAMDzhuUN3kDpsMJM/r3FKMK8OD0FKTpRbHdMemz9gfsqptUbQgdptP6zlfgL5mK2l4qxiGCOP8GGbaDTST8PFzN1V2zU/5MkBtDInfjRk3iaaoagv4X29fzSeR5IdgO+EpI/zrooGe/M58w0KItX4RwOOXkp4TGeJSt4yYBleDns4R2HkfH72wgPMuOaeaMSxdCjiI+PrgV8lLyChbW3JhSTQqgK0HJ0eTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.32; Tue, 18 Jun 2024 16:01:18 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 16:01:17 +0000
Message-ID: <c6df0934-df09-42e1-b6d7-74ea02428d3b@intel.com>
Date: Tue, 18 Jun 2024 18:01:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
To: Omer Shpigelman <oshpigelman@habana.ai>, Leon Romanovsky <leon@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, Zvika Yehudai <zyehudai@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::34) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|DS7PR11MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: f44642d4-d052-463b-c05f-08dc8fafe37c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlVJK0JVRG9qR0dTeUIramFITVRyRW1DWGVMTjN1dkV6VDd1dEJGTGJVaXlq?=
 =?utf-8?B?TzNwcVd5V0JoNmpUZW5LRnBuazN2a0xBbVdBK3NlQkxaZytubThKNTBOS1Jw?=
 =?utf-8?B?TjBQWm1mdGNHV2xNUWZMVFptaGlIVUlOOEdEdXpXZkNoSG1Wa0owM2ZlUmd4?=
 =?utf-8?B?Ykp4eXZlSGNFZWMyaVVsZWI5MVBVUGNyOWdSdW4wbnp6ZDRwdHRjaEtSSWt3?=
 =?utf-8?B?UFg5OWM0MWNQUXVZWGFVbUdzOW50Yi90VEZvTUpGcDNKMGNvUFJFdHlBVnF6?=
 =?utf-8?B?SmdlMDlpdXBiVlNHM0hjWmpmRDdqdUVRRENxZGcydnVYMTQ3TWJyNHk4aWxt?=
 =?utf-8?B?Yi8yUisybkhjMXVWakhFb0RMREdqdjByNFNOQXI3OURFdllCbUFsRkFWNm50?=
 =?utf-8?B?OU9iaTRZRlYzTm82Z1FiSHRMUE1EUFIrUytwcWVTQklUMmFINk9ta040bEJy?=
 =?utf-8?B?dXl3SVYxTDg1T29WVzRtZjM2aWxtYTd4UWthcW9vdGlJMWVIemQ4L0JHOW9z?=
 =?utf-8?B?ZVVMYW1RNEl5SmVTK0I2UlVzQUxiaUJNeWlMWEJacFpGSGk5OG53NVV3RGVv?=
 =?utf-8?B?eUNIT25LK0ZRSHNOQ09ydDhnZS96d1RCbnByNmtmYVFCeS9peEd6dFF5TFJt?=
 =?utf-8?B?N0xRYndxZFRpMG5NaGp3UXJQK1Qwb29zRjNMSkNicG9ESlRSWlU4dXRtTHBn?=
 =?utf-8?B?QUZ4TGhMdHVmS24xMmZSd0M2RFhVSjdOY1VzZVVsdVAvc20zaTdEdVFRVUxv?=
 =?utf-8?B?K3ZGckZXUmtwb0VjakRGa1JyUVNnRFVxeEVZbDJES1o1TEhpY05zb3ZOOHVE?=
 =?utf-8?B?bC9takdQZmkxRG03aUt3Q1VMTWVTZE4zQ3JoRFQ2ZWxMTGdMaHhTVFduNmc4?=
 =?utf-8?B?ekkwa0crSjlyNi9JOUxxSlVZUWNabGpaMG14UTV2WVlBeFJBdG9oSTBPTURK?=
 =?utf-8?B?b1lTMkp4RnphNGJxY0FQSjIweWtnWGp6NGk4ZWQreXVCc1UrQ2I5ZGROMU4r?=
 =?utf-8?B?UHhENWE2eTdxamN3dEhpaG5xSjdtSC9Xcklvd3cwS0ZYUlpYZWpKMytGdGEz?=
 =?utf-8?B?UjUyZmpNeGRWTDVFV2IyQTFyN0FON21KanhSTm52bWxMdEV3eE9rR241MHdG?=
 =?utf-8?B?YXAySytUUVhyUFR6RzZtV0JGeXNuVjZHWXg2RExvd09LUGpFRlVZUGJsQ1FY?=
 =?utf-8?B?YnBHcEkvbE0wZTJIN3pGeHpoblhvN3NHQ1E1QkRqZ3JFczlsVHNUZXhmS2cw?=
 =?utf-8?B?WGo3bkpMMHNpdVlNTkxxZENUOFRyU0IrZCt4NVBzRzNMbVA3aDlISHFDaTVT?=
 =?utf-8?B?eWRNN2VUUjZCYVNJejV1ODlvbUtRWDMyN290TzUvTXBoRHhnRnJWSFBSZ216?=
 =?utf-8?B?NmxKSkFGYUI1YWlHRWUvb0xyOEpRREpxMVlHREc5aG9UaEVOTm5YMzYwSzJU?=
 =?utf-8?B?dXFpcFZMLzRKM2pEQlVCTWovTGQxaDdHa0YvNzF5eVI3TzF4MzZNVW5QakhS?=
 =?utf-8?B?SitkdEljWFYwOExESVlPVU5jb1VYVCtlN1B1d0FEZGI0ak1rWFpnbjR0UGxP?=
 =?utf-8?B?WmIzQ2hiNTZtNVVYOHY0bW9zVDBpTVJvRlE3eTJTYkdDWVBoSlc4TjdRMVBn?=
 =?utf-8?B?aU0ydWlVRU0yK0pTWHI2aUxqK0VYYzlLNmV3MmdGZU10SWVRREUzajBRQ2h5?=
 =?utf-8?B?eWdjZFVHWDRYTkRMVkRwVWV2U0xpc1lucWgxcUVTOHU4RDl2THlWWU5HUkxo?=
 =?utf-8?Q?1hCgqrdXn6Csoopc1JrPvaEPSLQZISr3CQd5DEX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8102.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MURJb0dZWkNzNDNSb2YwZVVrMThvNEdEcTdUKzlpL2xnVTlWTDNGTVpia1hj?=
 =?utf-8?B?QlgzTTVZV09zaFBFcCt4QTRvdzZvOENWWjVuTkhMNzhzVW5vZlVPeUQ5WkNs?=
 =?utf-8?B?UFQ0QWYxMm1tZVRXR1g1RE4yQlNNYnVjc0daaTdqZU1maEtuQ016MVlXdmdK?=
 =?utf-8?B?a3VIZ05jS3ExK1BaTGhmUTBKLzUxV2tLQ3BndG8zNFh2LzgyNm81bnIwYXFS?=
 =?utf-8?B?WGI5Zm5VM0lrNWJ2Y1VvS1hiY085N1pkWnZ1Wkk2cExjakx0YWtRMldTaUtY?=
 =?utf-8?B?UXFXYlk3TWh1RHZMcjA4K056NUZtOEdFekc0WTJjcG1lUCs2UGRVakZuSWpm?=
 =?utf-8?B?Y25jUlVObVRKNjFWRWJFQkhacEg2M3ZlOU5WdGxDYUtEbUl0SWhEay9YMXVw?=
 =?utf-8?B?UEEwZG1OdG9YZWx0VmVyU3JzdTVSNXA3bmZ5TGEvcFpMangxM28rdERUbHZ6?=
 =?utf-8?B?dCswRktIREwvN3VDMzhYZU9FVk9JTlhSMzZPVU9vMFRsMkF6ME9mNG4xWDNS?=
 =?utf-8?B?c3BpT3JXbXplN1IvU2ZyQ3pxYzJtTVozQkNSbDN1ZFBtWHRsaTJBN0E3YUZE?=
 =?utf-8?B?TkRKVXFJNXFTUFFhNHFLUUIrbDQ1dWxKL3dYUXZWd3ZXNHdHMXBLbk5aNWwz?=
 =?utf-8?B?a09UU1p5NWRSY0VsUWJwUDhpMkJTeVJGcGh1RGJSclJSK2JtZytIOFovMGR6?=
 =?utf-8?B?MnoyMmw4eUNZV2NNU0htN3ByVkxzb0k1UGxrLzFWLyt1SHdxQzhrc1lTUHd5?=
 =?utf-8?B?UVlScUhVbUxvYlQ3cVVFV1B3Q2NEN0k4L3VMUm1PaWEzdkRtQWVOSlZjS0Vo?=
 =?utf-8?B?NjVSZkJsV3R4MWxWTllSS0NJUFIrVDBvZ21BaTRXLzZIRlhVdlMzNlA0bS9a?=
 =?utf-8?B?V2RBQ2UwR3hvTTFLTkNacmY4S0tTcFN2STRxUmJtN1VtT3M2bldiZ0dPUnZZ?=
 =?utf-8?B?TVN4bW1GcmY5ajMzRnJDMFpkbW9NSmR0b1VQNEdJY2thQVNDTGpIbjJ1MVZL?=
 =?utf-8?B?QzFVdGR5T2hhbVBJK1ZWQkZlVHVJZmNzMHlHcVVBM0tDT1YvSzkvMjZmWHV1?=
 =?utf-8?B?c1YrdWpVMDBEYTRPKzN4NWEzcEV4QUpmbjZnNnhjN3BVWjFjcndmYk5SWC9V?=
 =?utf-8?B?ai9yT0RTODJIdGRzLzJodGJVcXFaTlFuUHYvdTBUTDcxVEtnTDVib1hPcExL?=
 =?utf-8?B?T1kyM0U0a0RWejI2MFZ3ZFFRdWNCd2tLeGw0TkxXM1dHcXlPbW84dk44WURs?=
 =?utf-8?B?ekltdHRLZUFXVCtuLzlWMitMWXJSNXREUkM2TjNqOUNMclgweUVqRzdlbDJI?=
 =?utf-8?B?SndMSlk5OEp2WVh5Rldac1BsT3hjNUhDdXFtd1grL0M5dDhUZ1pyR3VJS1Yv?=
 =?utf-8?B?UlJaNGt1OXZQdm9oeUdDWFgzZUZOSkpta094WW9sQlNkOWUrY1BtWldyVHpG?=
 =?utf-8?B?SHJ4L0QzanR5cHA2NUVqZkpGSWhRMW1wdGhHNm92VXFlandabFYzVXlTcGZI?=
 =?utf-8?B?UHJqS0xidGtIRzBpWnArU0ZaNzBtQ0x6dERRYmxlNXRmYTVneTlMVHJRU1M3?=
 =?utf-8?B?TGFFaXNGK2QwWkZrQUFWT3d3WDdzV2pJUHprU2FFMDBIcnNPTDRPNVVkWm1F?=
 =?utf-8?B?MkNlSkFDNFRUbHEyVUF2SFExN0pwYzFjUkRqRDgvditRcVlYZjl0SHhRQkhE?=
 =?utf-8?B?cXhaZHVRNW41QWozdWZCWi9WZHdZbVlRNU9ZSFcxdHFRN2w1ajh5OEdOeHQ1?=
 =?utf-8?B?bzhJV1g3eTJPc2pJSE9WclRFdHhzWWpJV2ZQNS9nbzUweHNmNTJjd1dNazZV?=
 =?utf-8?B?c0sxY0JiZnB3cjU4YjAxWTMvOWFUZExtUmJwWmtUYXExK2VkNW9mVDQ1RjRj?=
 =?utf-8?B?L2R2RDhhaUhzZnh6dVBZdmNaYTV1NjNYZXo2RlNFa05zKzVNbDVXOUM4Mmov?=
 =?utf-8?B?QTFRVDRxTGhYblhVc1VvV0pScmpGTFJvOVA0VmhmZXVOcHVnQkROTy91ZEUv?=
 =?utf-8?B?Qjg0eG1uYnBITFlNY1U1cWpmZzdrY0M3L1ZoakpqUjNncFQzVmhIRkZSU1dW?=
 =?utf-8?B?Z3JFZzBjcFl0K09JbXNJdEVNdlRoSkZuMWdLelNPclJoMHM3cFlnT3ZOVW9p?=
 =?utf-8?B?a0g4MVM2QmdoUnlVWjBoMjlLcnZISFhaM1BaMEE0VUxIdDM4YVY3eElYaGN6?=
 =?utf-8?Q?nSXp5KVsCI9pnfq7fydC8Fo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f44642d4-d052-463b-c05f-08dc8fafe37c
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:01:17.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS06HjBe1GieqN/83UElAp5ZIc7yDKIIoYLVZecUOKc1bZe/cZJXO39kRC7Tf2t9mFruk2LAyCzm+p165TSDk7/Z8Skk2za8FjdKVH9KkUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
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

On 6/18/24 13:08, Omer Shpigelman wrote:
> On 6/17/24 22:04, Leon Romanovsky wrote:
>> [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On Mon, Jun 17, 2024 at 05:43:49PM +0000, Omer Shpigelman wrote:
>>> On 6/13/24 22:18, Leon Romanovsky wrote:
>>>> [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> On Thu, Jun 13, 2024 at 11:22:04AM +0300, Omer Shpigelman wrote:
>>>>> Add an RDMA driver of Gaudi ASICs family for AI scaling.
>>>>> The driver itself is agnostic to the ASIC in action, it operates according
>>>>> to the capabilities that were passed on device initialization.
>>>>> The device is initialized by the hbl_cn driver via auxiliary bus.
>>>>> The driver also supports QP resource tracking and port/device HW counters.
>>>>>
>>>>> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
>>>>> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
>>>>> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
>>>>> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
>>>>> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
>>>>> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
>>>>> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
>>>>> Co-developed-by: David Meriin <dmeriin@habana.ai>
>>>>> Signed-off-by: David Meriin <dmeriin@habana.ai>
>>>>> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
>>>>> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
>>>>> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
>>>>> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
>>>>
>>>> I afraid that you misinterpreted the "Co-developed-by" tag. All these
>>>> people are probably touch the code and not actually sit together at
>>>> the same room and write the code together. So, please remove the
>>>> extensive "Co-developed-by" tags.
>>>>
>>>> It is not full review yet, but simple pass-by-comments.
>>>>
>>>
>>> Actually except of two, all of the mentioned persons sat in the same room
>>> and developed the code together.
>>> The remaining two are located on a different site (but also together).
>>> Isn't that what "Co-developed-by" tag for?
>>> I wanted to give them credit for writing the code but I can remove if it's
>>> not common.
>>
>> Signed-off-by will be enough to give them credit.
>>
> 
> Ok, good enough.
> 

I would say that a lone sign-off give a little of credit compared to the
co-developed-by tag. OTOH the list here is unusually long. What makes it
even more tricky to evaluate is the fact that there is a lot of code ;)

So, I would suggest to re-evaluate this on your next (trimmed down)
revisions.
