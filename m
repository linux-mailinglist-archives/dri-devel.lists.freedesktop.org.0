Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8B4A7F967
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37410E633;
	Tue,  8 Apr 2025 09:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFYCll9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13C910E62D;
 Tue,  8 Apr 2025 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744104448; x=1775640448;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LjpTMeFoBMLmMdvLbpf2kDzrQv9qTLM8j4rABAWVem8=;
 b=JFYCll9NPTUL7YHs2qM60nst8vhM4hLuvol1+SWCCu+TNJj38+c5ovuN
 KO8U9GpULbpWNPArqi1W4rlVKaKTwbYuvB6UXBwVru2fulaFf9VP4DC0w
 QJeTu6JoLeDrTTsOOxDDyWMUeVyfJlhmD02yxaIagEXcsOcaeDwafN5L9
 nege0hmI6O5uuSKmidxuADlZD6iVWSWdbI0OcIi8QeFQ/9fyxNdxW9H8r
 aifeCRYHmAphch1tMfhfOejjPANEy3XGUNFFm/HSkfBdl5Zm1RfHzdw7z
 vKY7Oe5nVkcV50xNTOV6yfEc+5gav/AV9+duMma7M7EVG6ntx6WiOH1ky w==;
X-CSE-ConnectionGUID: pKOYIuKGSUe9L7riJDQMWg==
X-CSE-MsgGUID: PZ+rVnuUQDiZl93aXI7ihw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55710370"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="55710370"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:27:27 -0700
X-CSE-ConnectionGUID: oAMkMcOQTfmeojOxHrLXNg==
X-CSE-MsgGUID: J0oTkx2ZQbaDXmtnYqIfCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="151399850"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:27:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 02:27:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 02:27:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 02:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igHYam8klzz6aszqFuibD/sroDQoDDFUYINb4UhOGLcg2AB1MftSYWjWBhMgDPcdaIDSeYQCiDtbGVHVU+Fsw0Io54G24KVOJUpbinW2xZslAUJZMRdLx6SPUPwvcFPAEidtUk+KtbaiNYCNVQsD0Z42NJmEkDT9EjZhi9svzfsyZRfM+JUzEf9x/vtMqPuKPIRWCBJ6qKcJLti2TrfN6voh6Z9y0BtWbKfUP1rG3sDCftgoH54p5ewPBtU5N6K6/fZkmi+F78WrORJ3Mi9kF5d7Jk/kDYSFGTbPPt5wkVn/yy53vmFQ2IKHVyZzVimv3HH0BSmZKCKgmn3VGuhIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym4KNu/aMDbj9xoqRqO7j1P6QSWc72HxEFlYy2VtcC4=;
 b=R8D7qBFgVRnAsy0M8HpAQzVMNqzT3/X39Ea/z+FmtaCk0x7n53TWpDng2suIFbDRzmbnOEPpJlWeahL2CEobRZyp1UwaPEPmH/lenMVHv0ejV8mqClo8oEErg3oCRqXdwCPDYs2AzCsvejmroSyUMwFaQLA16IBlQfAiiF0a7dLL5U3prX7fr/SHfQndAZnzlZ+vu6+UD61d012pUsk8tpdGq7foChkkSyDBFmZgYNdEPl7/XVHqqF855kf68uG4LT1lAhzxA7RgoFXfHMBruZ/wckw5QSKAcv6p4+eziiMmejLWKsvPeaQS7etOaguyAw7ViOy7BdAcPUYOEtgWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 09:27:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 09:27:24 +0000
Message-ID: <ebd15231-7039-434d-b983-50de210a7320@intel.com>
Date: Tue, 8 Apr 2025 14:57:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/i915/display: Add strength and winsize register
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20250402125647.361295-1-nemesa.garg@intel.com>
 <20250402125647.361295-4-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250402125647.361295-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2f013b-7238-4a1a-ebc3-08dd767f9215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkdtTzlGV2w2STRVb0hVMVZUR2UxWUQ1R0U2ckFmRUw1Rnh3VWs2UytyUlF0?=
 =?utf-8?B?M1AyVW5RRXNvRXcrc0tpaCtUT0FQTWVRNCswanAvdUZHT1VpbEVPc0VZaTVZ?=
 =?utf-8?B?RnN4bGtHRER3UXZoRnFCcGlCbVV0aThHOGErL2xRcWlxcFUvVVByVHlTcnZx?=
 =?utf-8?B?aEIxYm1mZGdxdGtLWlo0cUg4N2d3YWVoOFFDYnJQNnRQT2FLaU94eWhaZVdP?=
 =?utf-8?B?blU5TWIrejAyMHBwMHFERWJOS2lZNnhTNElhUTN2czJaQ0I5ZkkrVDRxRlE3?=
 =?utf-8?B?Si9ldlNGc2FsRlF4MWVNWHJVL1pET2RCTWNHNllJVHVPLytDbFR2aUFzSDhC?=
 =?utf-8?B?NE11b1ozajVhZDExTzdRM1ZiMCtTS3E5czVWa1lIek8ySWhwQ2tIa0FmeVRr?=
 =?utf-8?B?L3htT0FpYWJ3NjZyV1FieEpwbXlMbFdIeFBZRjJUREU2YWR1OHJIY1RuUkxX?=
 =?utf-8?B?Yk9FcHRJVkJlL01CODFDTmlucjFxZTdsanh5VEhCdlFIOWZvNkUveGczM2JG?=
 =?utf-8?B?YTNRV1g1czRiRm9iUzZmM3N4MEc3a2tRVVprNEV6a0E0RVc2ZnFjcCs0c2Vh?=
 =?utf-8?B?RjBpNWNqeW1EWmF4V2tWRjN5QTJNSGNFb2QrOExSOG5PWGFFZ2ZYSFd6MCtN?=
 =?utf-8?B?RGNkQ1NLU09lSTV3MGNSWUdkbEhDbW5oSW1UbHp0b0RZMzErMkdtYzg5ZWxT?=
 =?utf-8?B?VFdKY1kvNkRzVk45S2wweDFqbUg0bnUxVGxmb1daNHZxcStZTFE2cmVXV2hM?=
 =?utf-8?B?WHRVbkFlZzhTR2hLNkdacnBlblcwRjZGQ2t3ZDZMTzhPTzRwVnRJUVh4cFRL?=
 =?utf-8?B?T3hmdklTMDVXZFlUb2Y3VDRDNXAxdFYrUGt3WDg5b09oWjgzaVhacUg1NmRH?=
 =?utf-8?B?QmRNT0hZd25TOFhBTU01QjJRUGp0WlI5bFpVRkFELzl1OHJuQ0dkR0ZxWjhs?=
 =?utf-8?B?VGtYTG00OXRZQ1dncW5kcEh1dWxnZ3kvOGZtbU9JS0RkVzk4cXRZM3dWYlBv?=
 =?utf-8?B?ZllsQ2h5bXVUNzJDQkpVS0J3WUY3N05DdGExUzVuWng0NGhYMldQMGV1WjZq?=
 =?utf-8?B?amc3dVdqdHNsUXFjdEN3K21tRERzcW93Nk9CTHk2Ny9RUmhXMnFCbmF4dXli?=
 =?utf-8?B?RVNmcys0Ykt3S25mTkdpMUUwU1lScWtkYzBJeFhFaUtGaURXSW9ZRmtmeEh0?=
 =?utf-8?B?a1dzMUZmNC8xNVJHRkREa09LdmNNdmZkM3R1ek0vY0NmM3puTVhXNjVjZ2hS?=
 =?utf-8?B?M0tDdnV2NWtGdmZxdmkzdjAvL2hOS2Jpd3EzVkJCWTNLanFLM3E0bVdJd2NK?=
 =?utf-8?B?RnlpTyswZ3cvVnJnQjEvZWhWQXluUTc5eEMzeGNqakd1akUrTWpnZHRKT2ht?=
 =?utf-8?B?Y2NSUjlMa3ByblArQ1d3K0tZZVJYUkFIVWZRQlFGU1RtYldBK0JuUENLSCtx?=
 =?utf-8?B?alBoQ0xYZjhWWHBKbUtjaFdPRmdCaUFNNkpUeDQ1K1VWMXhoNmFRcHFYQXNw?=
 =?utf-8?B?SW9YUTVidStGNzFCN0xBU2svU2RhQzFxNWw2VFQwQll1aDRGMVBLV013c21J?=
 =?utf-8?B?amZVd1NHeUZ1VmZwSkpUMkN1bWo4RlRwQkdISWlqNGt5eHNKdXNuMlhTd1Qy?=
 =?utf-8?B?bGtuZFpHcjNaM0dheHNlbjdXcDZZbjNIZ2s2K1BYWnVNNmtKaTJUK29SU21H?=
 =?utf-8?B?ekRmUGlVNW9rRkNEQ0tGcEx2aXJpTTZ4NmRCd1ZWZXJ3aENXRkROQUl5bTU0?=
 =?utf-8?B?UEpNMmNBTjNDSGxOazliZ0xHUS92QnRMeHlUMVJkSXJBNHFlbUNaUHR4Q3pJ?=
 =?utf-8?B?SDI2emJQZ0s2bm5mMG9USzRJeEhOejFXNG5WNU1ueDdkaWhxaG1XUEcycnZY?=
 =?utf-8?Q?PcAKIH2CHZxY2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDRNQWRLbnB4NWdjOXdDQzhsZ3laSXFHOWZGVnRRNjNPb3laOWpzVHFKWENh?=
 =?utf-8?B?K0xZeTVHTFllUlh2N3oraGRzVnpWeWZkeFUxWEUxbHl6dHJ1R1V3MWZBSzM1?=
 =?utf-8?B?NHhSUWNhdEVQVHp0V05ucHZ6L0Zqa0h3UjNaWlU3UUtQbllpMlJMNUtHak5D?=
 =?utf-8?B?RlFCaGpXam9oV3JxMUJsSmpMaFlpUDF1ZGUzTi9hTC9weHRmRE8vWU9ZdkEw?=
 =?utf-8?B?d0tueTBPN3dSWFA1RHB1cXg4QVNwU0pwQVE4T3hxSU5aOUs2N2tUbThlVlkv?=
 =?utf-8?B?SFI3cURBRWYzYWJJeFc5azJnZ3dCZnB1V3MxTk5ubGtTLy9VTFc0aXhoc1k1?=
 =?utf-8?B?SWtHWndUeitiV28renl4ejVBVERpRy9sOGlMcFNpSzcrUU1EcHJEWlZ0UWxi?=
 =?utf-8?B?WGR3bmxnOUlseUY2S2hId1pzZGFBNlQrVWJJd3NRdUdQMDNZb2NPVWQwOTFU?=
 =?utf-8?B?dU4rSkhnSmFNNXBhRjA5Z3VyWGk2OW9GdkVQbjVsUm00Z0pLMWhYa2UzTVU1?=
 =?utf-8?B?SnhtalZmck1pUXZWQldoOHp0U2JydnptcnpHa1BpdUFUaUNTQ3RvUWxXSkJz?=
 =?utf-8?B?TXFGdHhEdERrYUZOcHFuZkxnb1dieXVJS1FXckNja0x0U1VWRk1rKzBKaUFI?=
 =?utf-8?B?dEp0UHhCa2xEUXpoWTlKdkpXbEFQNGZFRGdCVE9sUEtTRjdJYTcvUnNsdldi?=
 =?utf-8?B?UTdQZUQ1Q3B0a0V0RExjVUR4ZzRpd1hFZ3NWYUR5bks2OFFhc083ZGRORGNI?=
 =?utf-8?B?Q2k4Wmdoblg3R2JtVWtsOC9acE5ub2VPS3RqUWJaM09idi9QcVVQdmhHZEgw?=
 =?utf-8?B?Z1dkUmZQOUJRZXd0ZHNVRTBwRWVZRnZVVnJpSUJCY1FodStWMm51TTJzRlZv?=
 =?utf-8?B?SmN2bXlTaVhiUzBUMlhLRnlkWHpuT2ZNUkR3ZEFNQzFLaUxRbmhobm5sOUtr?=
 =?utf-8?B?YmRLRk9QM3EvTldsWnAybzBBRGl0OWhwSmtDemxGWkVkT3EyUTRRdzNGWXox?=
 =?utf-8?B?MnJqeEVHaG5aK0k1dzFPSnJ1K0t3WUhDbUVYTGZ5V3JPNEx3U3VBT1JCZHdi?=
 =?utf-8?B?RWxoMHgySFRqbHZuM1p1em4wRWZLOWxnOWpCYXdVK3AzM0xzaUVWTGhKNUR2?=
 =?utf-8?B?VXRWaGxYMTJYc1ZDU1Z3WGNLS2s2bjVVTlV4YnBYYThjOFpzRkc3ZXYycG53?=
 =?utf-8?B?N1ZsUEVlRHJLWm8ycXZHMnNGWGVYR0FqSTRrRHdZa2dNcm1TYU53NjJId2t6?=
 =?utf-8?B?aUhxL2wrQ2NxTzV5ZUxNRGRvY0dLUmJnYUVZM0ZyRzg5TklDZmNiaWZuZU9z?=
 =?utf-8?B?SWF1RU5uM0Y1Y0loYjIreVdMdEV4dlRDeEZUZUU5ZjdUL1NyNUl4KzFqUHpv?=
 =?utf-8?B?d0Zjb0Q1RzE5UW42ZUx6cHg1S04rVmM1amdhaWppOVNUZVlOQkhIaHlyVCt3?=
 =?utf-8?B?Zlk2Vi9vQjVrN25CdG8rait0T1MvWEVLQ1B5S25QRHR1SVdNb3lnazBqdUVG?=
 =?utf-8?B?YVZZVnJqdHlOU2pSdDNEUys2aFBNZDhwNE1ybGZwUUVGbllZOGQ5MVRxSGFu?=
 =?utf-8?B?a091MkVFYm9MVG1XUi9uT2VtVFUxVGRSbzk3MFlycmJMWE1VT3Urc1BuUmM3?=
 =?utf-8?B?eUQzb0tYTkhDc1FYWFMzVFBpZ1lXMFBxdWV5eXVuZ3Zjcm1iRDFybnZReFpM?=
 =?utf-8?B?V2huWmc2SUVEWUZTNXEwbTEyQ1FtYjYvUmo0OWU2N0RQT1hNTXdwK2U0dlN4?=
 =?utf-8?B?TWlQNkVORlNUcU93L2JjN28xN0JEQlp4d0ZVc1d3eWRnZlhZOTNaNlltOUZ0?=
 =?utf-8?B?YmUybE9mdFlTNVltcFp2dXJvdFQ4T2pnSyt6ZkltVisrdEpCRURNck51aFJL?=
 =?utf-8?B?dlBqa3NJc0szNTBVdDdXRVJXcTdIMnQ5cUphTisyVlB5RXlvYW5uajErUVlz?=
 =?utf-8?B?VXlMTS9jYit4MHJUZjdxaWxVeTcvbXF0aXlGZDlVaU1sWGo1dmxZTWR4SUhH?=
 =?utf-8?B?NmRPcUpsWC82R0owRFEwamRsT3RPWEZEM01aL3h4Y0JicDFRYUJYVE5OVGpI?=
 =?utf-8?B?RWFTak5LenFBVHFncGlrQVFnQ0VYWEIybVZkL1NFZHlkVTJaSUMxQ0RuWndB?=
 =?utf-8?B?eERhS0E1azU0a0NHVyt0RWg5elFZb1Y5di9VMXFjZUI4TFVYV0FHc0IwQTBF?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2f013b-7238-4a1a-ebc3-08dd767f9215
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:27:24.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vevxe3CnfEePuf/W9m6BtagfFde3ACoyiqwzB9DAurD8dCidqDsqyYu3I9IgeVoIazYjG5EKy6qrb/lioax5xpqLNOgIm9zQKg0hoxRO4so=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
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


On 4/2/2025 6:26 PM, Nemesa Garg wrote:
> The sharpness strength value is determined by user input,
> while the winsize is based on the resolution.
> The casf_enable flag should be set if the platform supports
> sharpness adjustments and the user API strength is not zero.
> Once sharpness is enabled, update the strength bit of the
> register whenever the user changes the strength value,
> as the enable bit and winsize bit remain constant.
>
> v2: Introduce get_config for casf[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/display/intel_casf.c     | 102 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  17 +++
>   .../gpu/drm/i915/display/intel_casf_regs.h    |  22 ++++
>   .../drm/i915/display/intel_display_types.h    |   7 ++
>   drivers/gpu/drm/i915/display/skl_scaler.c     |   1 +
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   7 files changed, 151 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index c8fc271b33b7..a955960d09ec 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -230,6 +230,7 @@ i915-y += \
>   	display/intel_bios.o \
>   	display/intel_bo.o \
>   	display/intel_bw.o \
> +	display/intel_casf.o \
>   	display/intel_cdclk.o \
>   	display/intel_cmtg.o \
>   	display/intel_color.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> new file mode 100644
> index 000000000000..79a59e768c32
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "i915_reg.h"
> +#include "intel_casf.h"
> +#include "intel_casf_regs.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +
> +#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> +
> +/**
> + * DOC: Content Adaptive Sharpness Filter (CASF)
> + *
> + * Starting from LNL the display engine supports an
> + * adaptive sharpening filter, enhancing the image
> + * quality. The display hardware utilizes one of the
> + * pipe scaler for implementing CASF.
> + * This filter operates on a region of pixels based
> + * on the tap size. Coefficients are used to generate
> + * an alpha value which blends the sharpened image to
> + * original image.
> + */
> +
> +void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_rmw(display, SHARPNESS_CTL(crtc->pipe), 0,
> +		     FILTER_STRENGTH(crtc_state->hw.casf_params.strength));

Need to clear FILTER_SIZE_MASK instead of passing 0.

Regards,

Ankit

> +}
> +
> +static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	u16 total_pixels = mode->hdisplay * mode->vdisplay;
> +
> +	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_3X3;
> +	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_5X5;
> +	else
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_7X7;
> +}
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (!HAS_CASF(display))
> +		return 0;
> +
> +	if (crtc_state->uapi.sharpness_strength == 0) {
> +		crtc_state->hw.casf_params.casf_enable = false;
> +		crtc_state->hw.casf_params.strength = 0;
> +		return 0;
> +	}
> +
> +	crtc_state->hw.casf_params.casf_enable = true;
> +
> +	/*
> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> +	 * User can give value from 0-255 but is clamped to 239.
> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> +	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
> +	 * Also 85 + 16 = 101.
> +	 */
> +	crtc_state->hw.casf_params.strength =
> +		min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> +
> +	intel_casf_compute_win_size(crtc_state);
> +
> +	return 0;
> +}
> +
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharp;
> +
> +	sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
> +	if (sharp & FILTER_EN) {
> +		if (drm_WARN_ON(display->drm,
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
> +			crtc_state->hw.casf_params.strength = 0;
> +		else
> +			crtc_state->hw.casf_params.strength =
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp);
> +		crtc_state->hw.casf_params.casf_enable = true;
> +		crtc_state->hw.casf_params.win_size =
> +			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> new file mode 100644
> index 000000000000..83523fe66c48
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_H__
> +#define __INTEL_CASF_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_crtc_state;
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
> +void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
> +
> +#endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> new file mode 100644
> index 000000000000..c24ba281ae37
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_REGS_H__
> +#define __INTEL_CASF_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +#define _SHARPNESS_CTL_A               0x682B0
> +#define _SHARPNESS_CTL_B               0x68AB0
> +#define SHARPNESS_CTL(pipe)            _MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
> +#define   FILTER_EN                    REG_BIT(31)
> +#define   FILTER_STRENGTH_MASK         REG_GENMASK(15, 8)
> +#define   FILTER_STRENGTH(x)           REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define   FILTER_SIZE_MASK             REG_GENMASK(1, 0)
> +#define   SHARPNESS_FILTER_SIZE_3X3    REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
> +#define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
> +#define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
> +
> +#endif /* __INTEL_CASF_REGS__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 367b53a9eae2..f920143920cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -931,6 +931,12 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct intel_casf {
> +	u8 strength;
> +	u8 win_size;
> +	bool casf_enable;
> +};
> +
>   void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
>   
>   typedef void (*intel_io_reg_write)(void *ctx, i915_reg_t reg, u32 val);
> @@ -971,6 +977,7 @@ struct intel_crtc_state {
>   		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>   		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>   		enum drm_scaling_filter scaling_filter;
> +		struct intel_casf casf_params;
>   	} hw;
>   
>   	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index ee81220a7c88..f0cf966211c9 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_reg.h"
> +#include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_trace.h"
>   #include "intel_display_types.h"
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 72eaadc4cbee..fb6d8e4edd91 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -210,6 +210,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_backlight.o \
>   	i915-display/intel_bios.o \
>   	i915-display/intel_bw.o \
> +	i915-display/intel_casf.o \
>   	i915-display/intel_cdclk.o \
>   	i915-display/intel_cmtg.o \
>   	i915-display/intel_color.o \
