Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CACFA56F20
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40810EC0C;
	Fri,  7 Mar 2025 17:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLpmP2nL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB8D10E0AC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741368923; x=1772904923;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DeGt8P94wYx8Ot8N6hJ/qYIAOoTuUAI0BEg5W2BrAUg=;
 b=SLpmP2nLyrH733RCGI9sg9V5AR1RHWXWJX1oIL0gyIHMYm5q/rne3bT3
 OP22h8ez9ihCbiMecfykxImhv9dj0DvuN6fMlczQD7dNeYBhLL03Id00A
 F8tVrzpEZu9teTqfbceIJ4KzsyuqNUtIz4Afuka3IcGQgfxaTCNs1ognT
 5KH2dqs2qTDYLk/pqBoYSjWgNymwzzOwbV3dVvpQOtyCipy2ptmMselq3
 25G/QN4bNQGKKYYuT1bx2l4jH+EUCjdUIuu0TrZoICWnTKn2BQIi8Pz9o
 Cwb2R0Bf//olIjaFQ6ovF3ow/HjVdNHmp5+NhK6uqO60IM0YtihpkGqSW A==;
X-CSE-ConnectionGUID: jHwwg6hXS8yy2ZyZQrvXZg==
X-CSE-MsgGUID: EfE5DLCbR6CglkANywCqTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53062642"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53062642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:35:22 -0800
X-CSE-ConnectionGUID: kGHQ8JQDQby0fzCr7NJnqA==
X-CSE-MsgGUID: f7BWbLFWQTWYIg3EV7JEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="142620990"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 09:35:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 09:35:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 09:35:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 09:35:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCxGsTkKutkwM5DIudZZiZopdotCGR/N+PYOYQuqQ5Ag2MVkFyI0LYUHAysOR3ZxODyC7sdchmekBBoaCsNjjrumyfx1b8nem4xH4m4Jbp5kfJkuKMRwq5ZuFDPiomulcJx6WcTZuUl7Nqby7vncx2sZKD4qHGHjPKNIYG6PQKZiLjlraXxdGiGNaKdaUX3VJHoprQUPmFjPkiTuO/UJN4XH+wPV21ZqfGO9ZzCRqLJOcq1g13X26xXdSqSUwqMw1VHfSVfSVTeFIVZlRBWkj7Wq0ukuIVfJs7kHuH2E4qsDixGWzViHOJPNXuMMsforyOdFDrKkWCsOo09tvzgPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0PCTLQoo2kQIR/UQ3LvznHM3xyGhXnaZbOtp1ozpFM=;
 b=cgt13rxkxMP6XXoMb5M0igg8MAyDsdi8hi01ytT6+GXYiHvNKXZWU/ZCQrHss/ZSmENmD95cP3jxkK0XOFMgyHwMp0CXgh8+m4n8QPjZ2GdO2qNlQfU9Ow9NoDkk4RopLQSO2DMZKRMURuyLtU4gA9j+lRoJrrBmaAz7JhzY0nEcXh6opEhTNmx2Mdb2OVs9GJBykf5+F2N5H8/tCgxLG/9l1065NCy+Oc9Q1olGkJ5kdwU09Dv3CgVUDWiMiHcppCLgFkpb6uW8/+GI3fcwW+ecf7tKpiDdrDSRHZpuXSz8hme51yjZ13Oz+MG2jxkjFA2S7XPjroKr8TOB+ne6qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 17:34:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 17:34:32 +0000
Date: Fri, 7 Mar 2025 09:35:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 3/3] drm/sched: Update timedout_job()'s documentation
Message-ID: <Z8sua9ySbefnb/JD@lstrano-desk.jf.intel.com>
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-5-phasta@kernel.org>
 <Z8oMSWulN0mF43aB@lstrano-desk.jf.intel.com>
 <0ff8b5ddce856a7d9f5ffbabcb220e345b2dcfaa.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ff8b5ddce856a7d9f5ffbabcb220e345b2dcfaa.camel@mailbox.org>
X-ClientProxiedBy: MW4PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:303:83::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ff36bd-abcf-4467-0ceb-08dd5d9e523b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHQ1Tk50LzRJNTBzU1JOdmtibWJMZndKTDJPaVB5dDJ3Y3JDdVhzNmMzZnJs?=
 =?utf-8?B?R3E1eGNsa2craVlsd1J4eFZBaVJOa0QzQkplT2NIY1FIaDJvM2UzNWRuVUUw?=
 =?utf-8?B?TDBHbXBRLy8xeVVJVVI2dGJwbnBkdDlvNDdoVitUTmRXODY5WFphMGFha1g1?=
 =?utf-8?B?d2wwWm5LeTBFMG5zaTVDTEpTYlpwb1R5QlVwMXlJdkUzbVNKcmg5bFZOTEhB?=
 =?utf-8?B?MUpHS0pLQ2xKd1Nwd3lKK3ErRnhheDU4TDlYUjJEdldCa1J3aC9lOXByNmkx?=
 =?utf-8?B?R1hoL2VGakV5MERGamV1U2RtckxNS0FzYkhKaERQd2pVREgwajd6MnpHZFln?=
 =?utf-8?B?cDByMTU1aUY0S21pNjNKWVJaZ21CM0krTzArMktVY24waHN0UWE2S3VrQWdH?=
 =?utf-8?B?eFd2ckx5ZDdYNmc4bmZkVWlQNXJMYjZHTC84NFdtSFU0bUd6dTdjaTVWa0l4?=
 =?utf-8?B?VlJzckRxb3F5c0hEU21ObHRsWTFvallSVm4ycjVWR3puamJqZXdPZTlnbEVs?=
 =?utf-8?B?WUtXbVAxRGNvTXptSTZyRFErQkJqWTR3VkpyT0JLVE9vREhYZkIveGZ1WE1D?=
 =?utf-8?B?QUZvRXFBZ2ZKSjVYakV0dWhNWTh0dlZESnpKZXBYaVQ5NGRlKzJ6TGpZQTE2?=
 =?utf-8?B?WVVtc0RZc09reXY0alVXT0VDaVpwYS9oQ2lmK1kydnJqajh4QmtlV0JvL2Rh?=
 =?utf-8?B?ditSTU5zOWhiVnpOUUlGbFdQUVBjVW9wQW9DRHU3ZFBJMHpqb2Q4ZElKNlNk?=
 =?utf-8?B?RjBiYlVCR2JVWEpqYlhGU0hIN05FT1VmNHNuSkxrbThVcTZ5VTZMMkNPdDFE?=
 =?utf-8?B?NFdQZGFPc1hpc2hDS3RrU3VjTDE5dWNHOXJKK0FsTVl0VkYrYnlyUVAxREJS?=
 =?utf-8?B?cGE4U1dleTh6VXk0OGhHLzhITllJcnk4SWdNTUMwMU01RExoN3VtVDhuZVFp?=
 =?utf-8?B?MkkvWDgvU3hyK1FRa1NwTW1nVVEreW5JdENoQ2VNdytTbmxuYVJTaFNtMjdH?=
 =?utf-8?B?aUNINWpJcENKcDc1eXZ2c3ZTTUhDei9jRkFLNTN5U0FkLzdPL0ptY3RQakRW?=
 =?utf-8?B?Kzc3amp6ZUdpa2dYTDN3Q0RyNjE4ajUrS3o1eDVGbVQybmF5VDkvNVA5NmRE?=
 =?utf-8?B?SDc5d2N0RklGTnNkdmI3QThnOXZ2dkpaSmNpUzg1WWdySUNTRXZjSXZOcXVD?=
 =?utf-8?B?cmZ1YU05WXJ2OC9aZzBHM3NENHhKS25ob0Y1T2I3bk42dEQ0eCtZOTFJTEdN?=
 =?utf-8?B?czdUVGlIRTZkbmxJYkJrUHhaWEk1OGxaTUZ0SnRJOVFNQVZZc1IwMzB5cjlY?=
 =?utf-8?B?YWxwSUlGamRkOUNiSTVIU1JwdFVaOElXWU52dXdsYXpvdUgrMHpRWlRROVJ6?=
 =?utf-8?B?OG92bWVzbXlnZ1BLb0NVd2RaaC9jZnVVbG5LUW1SemNQcHd5bnR1anp6V2t0?=
 =?utf-8?B?NlZqa09XWVVUSTlYZGVXb29lU1ZQYWJKWjdjRVZkQkJOWm51NUltY1Bpdjh5?=
 =?utf-8?B?cE5nSTZkRldSR2s5SEpUd3k2VlRTd2dVSGEvTFJPMW9PK0c0WWpDNUtFMU1m?=
 =?utf-8?B?QlgwL0gzbmZaSzl0YVZhY3UvVUZiZzdObmpjTzI4KzdwcmFTUnIrUktpQ3dZ?=
 =?utf-8?B?ekoya0lWUzM4U1lDRDZBcEx4V0RWMlp3V3B3d3o5bFZ2SHdaRzdQMGFZeXpy?=
 =?utf-8?B?bDBRUklZUzdYazl5bXZUbFAyYnN0ZklSMzd3aklqMStMd0NMMVNoM05xZ0pC?=
 =?utf-8?B?dytkWXN5Mms4VVNCWDdkZUJiQ2pHUjF0Yzg4eHQyUDg3YnFXKzhPbUN2WWZt?=
 =?utf-8?B?ak15U0k5MGVBa1AyaVRBWWh0VjA3VTlENm9xZ1BHU0FCVms4MVBzM3ZTbEt5?=
 =?utf-8?Q?qWswehzJ84eSS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cllDTm5DM1RjUnIxTnBsY3VGZGtzU3RuVEVyS3Nzc2V6QW5LLzFFZnJyRVAw?=
 =?utf-8?B?SGltRXlNamZuQ3c5WUV4MnBjVzUyaTZScFFRbmtJRjR5ZjlXa1pJbDZheVU4?=
 =?utf-8?B?QlJtOFJNbFhLcWRtVG1NK3F0M2NDZjZzcWJ4Z1VLU1FKZHk2UlRJOEhiOEZV?=
 =?utf-8?B?REJjUWhzWEV2R2RrUkt0RTg1OXkyYUY5S09PNnZHbUxhMFh6UVY1RnhjNkwy?=
 =?utf-8?B?c1FPcXFBWC9XQW1PMW90WmV4bEk0WkM4YmZhUkhzeU5tT2hIQWtuVHNrWHZu?=
 =?utf-8?B?REZnTnh3bGJEUXVQUE5MTkhLVnJSWkVld2lzZGNxbExISUFpVkFsNTlHZXMz?=
 =?utf-8?B?NUpTOEZWMjNuMDlRYmdBYk92elh2SW1HU09iN2ZwWHRYL1NYYUlkdWlxOU93?=
 =?utf-8?B?OXNKbGU2M0VHVjM1TmZTdnNUNGxFWDhKRktSYkFKT0EvVGVSbFZoZ09Tem0v?=
 =?utf-8?B?SFNwL1JnN0JrUGxYSXJFZytpS094Qldsc2lmNFZ1bzNCVFFud2k4QzVmV1BW?=
 =?utf-8?B?OXhvMFN1UkpLTk1yb3VXOGhXRmMrKzdxMGsyeVd6QWxjQnRUaGpxM0Nmckp1?=
 =?utf-8?B?RTJadEJVTEdLNWxQQXhZV3YrS0k3OUdZZzlhUjVNV2hGMm5YeVVvdUxxTU1u?=
 =?utf-8?B?bEpsUGhTS1JCZDNIWS9RbHR3OXdBS043NSt4ODUxcFBlYU10RnE4QzJ5OXYv?=
 =?utf-8?B?VW9FaENvNVBodkJHbUp6WjF2VFZHZ1hpVTR0dFF0WDE4S0VhVnlnbTlOSko0?=
 =?utf-8?B?MzNMZzBRdzVNNy94L05yWkRvY0dYNWVZanNKaWljb1ZFNXFSaTdzVjJ0OS9C?=
 =?utf-8?B?MnNyaHRzM0tZeTN6c1BxeCtxL3FWT1p0QUo4WWx3WmhwOVQ5OFVsbVlFelBp?=
 =?utf-8?B?ZGxOQWM4amZKR3oxeFRCUzVFZVZoaWpFeUFhU05Nd0lHa1lrdXQ0V2FQNmJG?=
 =?utf-8?B?WFo0TVdSVjVPcURDemdQMkwzUEI0SUIvTWJCMFFCc241dEtLN1k4MW5zZ1gx?=
 =?utf-8?B?SWFwNis3QUMrSFNMWmljYU54WURYR1hqL1ZRV0pLYTBzVUcyZmpDTzFLdjBW?=
 =?utf-8?B?NWJiTFhNQzhZQUpsWG5PQ0V1K0xDYjVualh4dTN5WWkzNmV0L0U4c3dGK0My?=
 =?utf-8?B?NC81Y2ZXVC9WZnZNTlVrWHJ3ZEJnVXVLQWt4NTk5UjN4ajZFRExxOUl1RlAz?=
 =?utf-8?B?RmZzQVN1N0g3R2I0N21hMEQzSFpoWlFhOG1saHVNUWo5Mm9uMEdBVFpVRDNn?=
 =?utf-8?B?eW95VlFaL2MydXFDYU9DVFBhL29jYko4UlRJWFNGcjI3UERUeVJuUjArRFlo?=
 =?utf-8?B?TWJsMXFxa1piM0cxYXJBUi92M0JLcEpDL2s5RmQ2azVqL2RwYmpVcitZSTkw?=
 =?utf-8?B?bFIweEJHL0RJQVBJMmdMZE4rVzBlMXRYRVNEQ0F1VkpBSmF4c2dQS3YycC83?=
 =?utf-8?B?RE4rT3Q2azVCalBkMHlKM1RuS1NYZkt6eDFYaExLSXpISm9IV0xLM2VCUWd3?=
 =?utf-8?B?aDJOV2VwZzFFbm1iakVwUmhLclFtRWFxdWREN0RSUkFZKzVsNUVZc094Q3lu?=
 =?utf-8?B?SlFDZ0lEUWFrWUxTWFhsK29rZW1TZS9DR3cxNVcycFcvR2RWVUJUMWhZaTJU?=
 =?utf-8?B?TVRxVG5xR1ZFb1l1Q2NLOFFsQnNFcFY1VFNNbXJNcStzYnFDL2Vxa2tRVkcy?=
 =?utf-8?B?cUpzRExnSnhVbjdXVlJWM01UMjRrWjk2ZVB6RjRMaVpNcFROQm1Sc1VSaE05?=
 =?utf-8?B?c2U4a3VrRjFDZ1QwWmhFNUlTR3lvQWNXYTAzbGVCcWVuWERDQU9ubzRXTUFm?=
 =?utf-8?B?RktleXFQanFHaW84NVJRc2hnOUJzK2dxbTZmR05vZFJ6cHhoRWJuOEJrcmdB?=
 =?utf-8?B?UVplOXBZTlhlb1ZCOUw1WkR3VGJoQW9KZTFIeHFZa3Y3U3dUc1VXR1lCSXlP?=
 =?utf-8?B?SUJJWm5oRVdkc2R0M01Ib25aMzNZSFNUQ0xXN1paUkdMelE2ZGN1cDhXcTlM?=
 =?utf-8?B?TnhaaHBCNmZ0ZE4zYmFzSjZReStVUFRDeCtoZEkzRmhQUW1DUWpMak51TXJ6?=
 =?utf-8?B?L1ArdGtwU0JLV2NzbW1ucWtwMzRSMDZTd2FRYm92a1BXR1BoNVNQeGZlQUFX?=
 =?utf-8?B?UUpLNzdybVJieVJ0a09uaVlEU3kvdmp5Zm5nZ3lZc0JadkNRMnU5bWt1Ky8v?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ff36bd-abcf-4467-0ceb-08dd5d9e523b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 17:34:32.3952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awLWKOaOojWODyZ/Men+5gcHFuNyDX4by/Nynzww9DWrMG2xYqhb1YhgrfIKU5LqgE043biUZLMJIuVrhB0/bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
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

On Fri, Mar 07, 2025 at 10:37:04AM +0100, Philipp Stanner wrote:
> On Thu, 2025-03-06 at 12:57 -0800, Matthew Brost wrote:
> > On Wed, Mar 05, 2025 at 02:05:52PM +0100, Philipp Stanner wrote:
> > > drm_sched_backend_ops.timedout_job()'s documentation is outdated.
> > > It
> > > mentions the deprecated function drm_sched_resubmit_jobs().
> > > Furthermore,
> > > it does not point out the important distinction between hardware
> > > and
> > > firmware schedulers.
> > > 
> > > Since firmware schedulers typically only use one entity per
> > > scheduler,
> > > timeout handling is significantly more simple because the entity
> > > the
> > > faulted job came from can just be killed without affecting innocent
> > > processes.
> > > 
> > > Update the documentation with that distinction and other details.
> > > 
> > > Reformat the docstring to work to a unified style with the other
> > > handles.
> > > 
> > 
> > Looks really good, one suggestion.
> 
> Already merged. But I'm working already on the TODO and could address
> your feedback in that followup.
> 
> Of course, would also be great if you could provide a proposal in a
> patch? :)
> 
> > 
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >  include/drm/gpu_scheduler.h | 78 ++++++++++++++++++++++-----------
> > > ----
> > >  1 file changed, 47 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index 6381baae8024..1a7e377d4cbb 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -383,8 +383,15 @@ struct drm_sched_job {
> > >  	struct xarray			dependencies;
> > >  };
> > >  
> > > +/**
> > > + * enum drm_gpu_sched_stat - the scheduler's status
> > > + *
> > > + * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> > > + * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> > > + * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> > > anymore.
> > > + */
> > >  enum drm_gpu_sched_stat {
> > > -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> > > +	DRM_GPU_SCHED_STAT_NONE,
> > >  	DRM_GPU_SCHED_STAT_NOMINAL,
> > >  	DRM_GPU_SCHED_STAT_ENODEV,
> > >  };
> > > @@ -447,43 +454,52 @@ struct drm_sched_backend_ops {
> > >  	 * @timedout_job: Called when a job has taken too long to
> > > execute,
> > >  	 * to trigger GPU recovery.
> > >  	 *
> > > -	 * This method is called in a workqueue context.
> > > +	 * @sched_job: The job that has timed out
> > >  	 *
> > > -	 * Drivers typically issue a reset to recover from GPU
> > > hangs, and this
> > > -	 * procedure usually follows the following workflow:
> > > +	 * Drivers typically issue a reset to recover from GPU
> > > hangs.
> > > +	 * This procedure looks very different depending on
> > > whether a firmware
> > > +	 * or a hardware scheduler is being used.
> > >  	 *
> > > -	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > > park the
> > > -	 *    scheduler thread and cancel the timeout work,
> > > guaranteeing that
> > > -	 *    nothing is queued while we reset the hardware queue
> > > -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> > > -	 * 3. Issue a GPU reset (driver-specific)
> > > -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> > > -	 * 5. Restart the scheduler using drm_sched_start(). At
> > > that point, new
> > > -	 *    jobs can be queued, and the scheduler thread is
> > > unblocked
> > > +	 * For a FIRMWARE SCHEDULER, each ring has one scheduler,
> > > and each
> > > +	 * scheduler has one entity. Hence, the steps taken
> > > typically look as
> > > +	 * follows:
> > > +	 *
> > > +	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > > pause the
> > > +	 *    scheduler workqueues and cancel the timeout work,
> > > guaranteeing
> > > +	 *    that nothing is queued while the ring is being
> > > removed.
> > > +	 * 2. Remove the ring. The firmware will make sure that
> > > the
> > > +	 *    corresponding parts of the hardware are resetted,
> > > and that other
> > > +	 *    rings are not impacted.
> > > +	 * 3. Kill the entity and the associated scheduler.
> > 
> > Xe doesn't do step 3.
> > 
> > It does:
> > - Ban entity / scheduler so futures submissions are a NOP. This would
> > be
> >   submissions with unmet dependencies. Submission at the IOCTL are
> >   disallowed 
> > - Signal all job's fences on the pending list
> > - Restart scheduler so free_job() is naturally called
> > 
> > I'm unsure if this how other firmware schedulers do this, but it
> > seems
> > to work quite well in Xe.

Missed this part of the reply.

> 
> Alright, so if I interpret this correctly you do that to avoid our
> infamous memory leaks. That makes sense.
>

Yes.
 
> The memory leaks are documented in drm_sched_fini()'s docu, but it
> could make sense to mention them here, too.
> 

The jobs in Xe ref count the scheduler so we never call drm_sched_fini
until jobs in the pending list and dependency queues has made called
free_job().

> … thinking about it, we probably actually have to rephrase this line.
> Just tearing down entity & sched makes those leaks very likely. Argh.
> 
> Nouveau, also a firmware scheduler, has effectively a copy of the
> pending_list and also ensures that all fences get signalled. Only once
> that copy of the pending list is empty it calls into drm_sched_fini().
> Take a look at nouveau_sched.c if you want, the code is quite
> straightforward.
> 

Same idea in Xe I think we just directly access the pending access list.
Let me look at what Nouveau is doing before posting an updated doc here
patch.

Matt

> P.
> 
> > 
> > Matt
> > 
> > > +	 *
> > > +	 *
> > > +	 * For a HARDWARE SCHEDULER, a scheduler instance
> > > schedules jobs from
> > > +	 * one or more entities to one ring. This implies that all
> > > entities
> > > +	 * associated with the affected scheduler cannot be torn
> > > down, because
> > > +	 * this would effectively also affect innocent userspace
> > > processes which
> > > +	 * did not submit faulty jobs (for example).
> > > +	 *
> > > +	 * Consequently, the procedure to recover with a hardware
> > > scheduler
> > > +	 * should look like this:
> > > +	 *
> > > +	 * 1. Stop all schedulers impacted by the reset using
> > > drm_sched_stop().
> > > +	 * 2. Kill the entity the faulty job stems from.
> > > +	 * 3. Issue a GPU reset on all faulty rings (driver-
> > > specific).
> > > +	 * 4. Re-submit jobs on all schedulers impacted by re-
> > > submitting them to
> > > +	 *    the entities which are still alive.
> > > +	 * 5. Restart all schedulers that were stopped in step #1
> > > using
> > > +	 *    drm_sched_start().
> > >  	 *
> > >  	 * Note that some GPUs have distinct hardware queues but
> > > need to reset
> > >  	 * the GPU globally, which requires extra synchronization
> > > between the
> > > -	 * timeout handler of the different &drm_gpu_scheduler.
> > > One way to
> > > -	 * achieve this synchronization is to create an ordered
> > > workqueue
> > > -	 * (using alloc_ordered_workqueue()) at the driver level,
> > > and pass this
> > > -	 * queue to drm_sched_init(), to guarantee that timeout
> > > handlers are
> > > -	 * executed sequentially. The above workflow needs to be
> > > slightly
> > > -	 * adjusted in that case:
> > > +	 * timeout handlers of different schedulers. One way to
> > > achieve this
> > > +	 * synchronization is to create an ordered workqueue
> > > (using
> > > +	 * alloc_ordered_workqueue()) at the driver level, and
> > > pass this queue
> > > +	 * as drm_sched_init()'s @timeout_wq parameter. This will
> > > guarantee
> > > +	 * that timeout handlers are executed sequentially.
> > >  	 *
> > > -	 * 1. Stop all schedulers impacted by the reset using
> > > drm_sched_stop()
> > > -	 * 2. Try to gracefully stop non-faulty jobs on all queues
> > > impacted by
> > > -	 *    the reset (optional)
> > > -	 * 3. Issue a GPU reset on all faulty queues (driver-
> > > specific)
> > > -	 * 4. Re-submit jobs on all schedulers impacted by the
> > > reset using
> > > -	 *    drm_sched_resubmit_jobs()
> > > -	 * 5. Restart all schedulers that were stopped in step #1
> > > using
> > > -	 *    drm_sched_start()
> > > +	 * Return: The scheduler's status, defined by &enum
> > > drm_gpu_sched_stat
> > >  	 *
> > > -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> > > -	 * and the underlying driver has started or completed
> > > recovery.
> > > -	 *
> > > -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no
> > > longer
> > > -	 * available, i.e. has been unplugged.
> > >  	 */
> > >  	enum drm_gpu_sched_stat (*timedout_job)(struct
> > > drm_sched_job *sched_job);
> > >  
> > > -- 
> > > 2.48.1
> > > 
> 
