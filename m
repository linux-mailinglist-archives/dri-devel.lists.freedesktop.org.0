Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104294E62E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 07:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8055A10E0C4;
	Mon, 12 Aug 2024 05:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHzpRjo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FA910E0C4;
 Mon, 12 Aug 2024 05:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723440942; x=1754976942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZYxcse81JILLxsl0u+HShzMM5IN31gHT1WgnzZmbDSM=;
 b=OHzpRjo9NjZjOF3TcyALAR14C2Z+ti5eUk7ccPwo6/37tqtBL3ubpr5b
 tve4ogW+Ii5L0fWUof7AnaBgOWiw0gJAJM6ESCmJ1/2qgZ6tGyLJRpHLn
 5Xc//A7PA9XdiLJ6/7uwl5Agdy7FM8cDEyST1lDeP+3k41tL9aKCw5JQJ
 CDJ1lv3hf+B4IHsOwyfiEbyXuzqM/WEDy1mK3GKhf3Vg20OMo/A7hyyEW
 wxN7wFScBI/fn5A0FCVeXgwq419Crl7bhO9MS+u9bZCxkgzjxdDgsL226
 /A3c7Kbh/Wy5Cr7DcUizSmoXNLwRBu6QVDP/ep1rLdqKBl1Ia8d5sPjbg w==;
X-CSE-ConnectionGUID: VV4w9UjJRJGjOsSdWBZ9sA==
X-CSE-MsgGUID: anYNEML/TbaaGKN7LHlscg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="25398296"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="25398296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 22:35:42 -0700
X-CSE-ConnectionGUID: iVCPoCPPT0SzKpfdMCyoug==
X-CSE-MsgGUID: OSUQJ9E3Qdq3H8GR+Q+faQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58050397"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 22:35:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 22:35:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 22:35:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 22:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDmq1lmHDY4CUsTzl2EqwJVRkfBd3KCeqpPhs1trdV8q+l+eScMnJrCnXA1MoDpeP3kxNwSTxnGjMTNiR9bP8rVH6uI/eJmllasVaHJ25YlfATRY602C+RreA9vQAzZOCjtPErPZprJDK5yDaQo1sJt23Lm5GH5xbFPHh/3qMOh+xGG1OexMDB+TksIdcQKiKxj8RAToKKuDcGnwF6rLnf7JgBKoYmp9iVQcCMnqHeMII/ksb65BI+R7y76N9LSxuMGU3g/ul3aQvOkAYJUTkk+8kRz2JV3El+h7OPqfTbx974BXXa6hYuVLYYsu8cq46VH898g28xqLjatLj0m+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELo/UqUFvJ8pTP4uPRV9yiNARqSBXvmrTCl7v8WNC3Y=;
 b=R3GDbGgEbUCa7pzk7CW2vN/KmvpTxfD8z0q+lcqv34PvyIM2kcByADrahAIEwf9eyn/3K1ykqJoY0oXMo+sHF9+jb6U+VdEiI8Hfcd27+LDHcVqedadsdK+3Gg59I1GZP3nA2oHFElaO+vUeSSw7GHu22GpX2ccwuyq5ztVyBP5bo+xwS8s4K5WY41jg4BBQ1UhkO8K+99BNvLLTPzvRdOQHVRUSasr2KzEGJPTQCHvOqex9MWWJJDwssOHAfedn/N/kt1VkaHXhW2CMM3nc4BJM9C4pV2VnSp8mFnkm/miCMPjbUcVdkG7SeKvz/Athi5EPPX7YvqAMlpZvxcW6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 05:35:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 05:35:38 +0000
Message-ID: <8b9928cc-dce9-4cfd-b1a9-0112266d60df@intel.com>
Date: Mon, 12 Aug 2024 11:05:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/sched: Use drm sched lockdep map for submit_wq
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <tj@kernel.org>, <jiangshanlai@gmail.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <daniel@ffwll.ch>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-5-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240809222827.3211998-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cc07b4-4a5f-4ec0-af6e-08dcba909915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajhwVVRPN293M3VnQ0o5Q2JOTlR3R0VzZkJBY1ovcDBBUzdkNTlzMGZBTmd3?=
 =?utf-8?B?Tm9zc3I4ZG9HYzUvSUg0a1pNbWNLQ2xmTnAyRGx2cllsY1VLSHlBTkd1SmYz?=
 =?utf-8?B?czhkTUxvc2FaM3VqSHc2eFdBYVkydzgreExFQjZKbXB1WWZsN2QvUUZWUGdq?=
 =?utf-8?B?TnNHelVLSGVGUFZSNy9YSHRZSnlBdE5qRzRsUDhHcXZza255QVFzOHdMdGZr?=
 =?utf-8?B?SmVaR1NYdmVERFRsY3B0RnlqaWJ3MjFKRms2Z240bmZCY3E1VHhiYnNrN0Zm?=
 =?utf-8?B?NzBPTWRSVHdhaFE4OWNGWDB2V0RDS3I0bjVNaEl5OHFQMERrNzBMM1JGQ1FC?=
 =?utf-8?B?ZEFManY1ZEtVM0ZCbHVKZmsxaDlOamtONlpaQVBUL3ozMXBzbjFpZkgzN0wy?=
 =?utf-8?B?emt3am9rajU5WlFyL3BFM0RYd2pWaGQwb1psQ2NjWWdFcUc3aFUrYmpiSHNz?=
 =?utf-8?B?ekVINjNXSmxzNEtKeWR5RnpSSm1tNFVSUC9ZU1BLdmZ6eGphRm1DcHNZOFVq?=
 =?utf-8?B?elcwWE1EckxJampJdUUyV0RDcE1tcXNDTURuWG1RTXprb1dZU3dqakcyaXR2?=
 =?utf-8?B?clpsbkJTM3NmUkdZY0hxRE1YcVRIa2NXbzhLN2hzUlVEaUlQeGg3eG9EWWlC?=
 =?utf-8?B?MUswVVZ4SEtsUVZqb09wNk1YTU85a3kzdWY1UWgvR0RCVFlnYXpiOXRGMzZW?=
 =?utf-8?B?OGdIYVR5VW9nVzNqZFVaVDJYUnZ3RGhXWDFMeUwxN3JhMXczM01teDQ2cTNY?=
 =?utf-8?B?UWtvdUJwMEZaQW8wZlBvdVRUcHVzQ05rd0pFSWl4QUtLTXNyZlhiZkFRcGRx?=
 =?utf-8?B?ajJnZ0ViUGV1cExyeVBKZlR4ZlJySVpkaGd4ekQrdG0xbzRDWThlVnMwbWhX?=
 =?utf-8?B?SzdUN1hJLzl1MTNEWjhJRGhRWE1acVc0NFpsV0lnMHJOOEdHRWRxdSthVGc5?=
 =?utf-8?B?ak8ramx2eG9hWjZxYUxObTB0ZXZrOE5XMXFIdXhYcWU0UDg4YnZMdjJRa0Zo?=
 =?utf-8?B?RWw4WEowdlc0TWlDMzVvMVdkSDQ3aThzOVF5T0dleERTMHV3eTJ5SldLbFpF?=
 =?utf-8?B?TDR1dVZ1SFdTWVhZeGM3MFNiaEloMm9uQk51VGN2c1pXWU5mVUVEeEQwS1Mz?=
 =?utf-8?B?bTdDT0tMK3pZZTlOT2JKTE4zdjN5K1N5cDBkamxqYWhTVDJFVHZTSjREN3hh?=
 =?utf-8?B?bFd2RmtGY3orc0ViSDBvd2xuelFtUFZrM2F2S2o5eGI4RGF0ZXV1ZlVUTjc2?=
 =?utf-8?B?UU5WQUZWSDV6eUN5N2ZsY3RXNDhuRWVkdkJ6bnd2M0JxUUdRaFp2dlJmNGdq?=
 =?utf-8?B?aW1hZ1lKUVJLWjN1K1BmL083Z0dZbTNNVnNvemwzS0xVRGc5MUV5SEdYMGZk?=
 =?utf-8?B?OEdNWFZJVjc0anozeUpsL3Y5NzJIaFluQmNackRwNnQxZ2ZQQ3c4dFF6NnND?=
 =?utf-8?B?eGRZWkorL3FyS3F3YmpkcHBpK2pWcDFZN0VjSlFTeHJ2MWVIYUp2L3oweEdu?=
 =?utf-8?B?dGM3aDAvd0NZMjV4eEl3UjhLc1FNRHhRVTZ5K0VCaUJCY1pTaDNneEdmZUlN?=
 =?utf-8?B?Qm1ZaEF0N3hNbFI4TDJ4UkxXdmNySmN3TzRjY0d1aVduVllHTmlrYy9PRDdI?=
 =?utf-8?B?aHU4ZjJsTWtJRUVOSmRRMVNzbVRTS0dQY3luWlBaaUZSdXRpWU0rcWRkektu?=
 =?utf-8?B?TUJmT1U5RGdOSk54VlBSbm5pQ1NRZ1NmWW4wcVBnajdkUmV5SG1IZ3NvcWZ0?=
 =?utf-8?B?V1MvWDdKZWhSbGpiRmlvL3M5NnZOUWdGcmxHN0FkUnVRQUVId1E5RGRvZ0RL?=
 =?utf-8?B?dGFvT1ZZdmM2ZGtJSXBvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3UyekpMa2o4THpaTVdjczNrcUp2NVBzR0p1OUtZNUVsRlppb29WRnphOTZ5?=
 =?utf-8?B?SXpORmo2cFYxRVYyQzZIajhVRVl1bWlsVEltNUxLYUtsTVcwdDBHaVV0ZWRk?=
 =?utf-8?B?VDNEK1M4VGxCcDQ3d1BKdjZVQ01ZVFNFdEZNSVlTZ3h1RzErUmtNTEl6ZUNK?=
 =?utf-8?B?c1RwSzZrb3l5UWRLbXNRano5UzhYbU1Yc2cvd2dCMmsrdk0xQk41b0tKTE1i?=
 =?utf-8?B?Y2FNbzVXZjRJbXZLN21TVGpZY25KNDlGanZ2NTcyMmZiRUgzbGpzdU5KMGpX?=
 =?utf-8?B?YTZKYVVBcWZnTG9XNGM1UWdCd2pFSTd1R2h0Qm9TME9NV2NFNHptODZlakRR?=
 =?utf-8?B?RDJSbXByWnkwNjFQbUdNUHd2MXBNWVVlMnZQOW5KUnlYUHJDbFdqL2w0ditt?=
 =?utf-8?B?Lzh0YzBaLzlvNERmNEJ0VDg2emlMYmw4WDFyaUdZUkM5VVJncWREZktsOU9C?=
 =?utf-8?B?dy8vQ3RsTUMvam5nTERtQjBydWM1U2RNQkl1UVVxSUFVNVROeWgrQ2tuRU9h?=
 =?utf-8?B?RFJXMmdVV3Bubmhqc2hIZUFUcDRMM0pnc0ROTElpaERmUmp0bHUrN2d6VGxR?=
 =?utf-8?B?MTNjNWhwSWs5aXBXeWd1cGYxRzNCb3R4UTZ4MTdkbVVYS1dIUWNleXZyS1Fj?=
 =?utf-8?B?SVZPdEZ4WDI3TXBld084M1dIdTV1ZXJGZjVnenB0UWxrUzN1blhmMTdkNHVy?=
 =?utf-8?B?U0VqV3QwNnN5U2MrTlFrVm5OeDVYNWpDTG5vTU1NSFpieFh4T3JjZzRKKzB3?=
 =?utf-8?B?cXZ3bFdyQm5EcEZHSXlKaCtvMHJzYm5VT1ZoN1RUTW5FWFN3Z08yUUd3eERI?=
 =?utf-8?B?Ly9xSkJpUWlYN2ZtVUhmSiswd0UxRHBrM29iZXdwcUNSWGVDZkVMNzE4QWl5?=
 =?utf-8?B?WXBzTW05RUd4SXhLM2t5YXZYZTg2clJ2RlRoNGY3eGM4c292ZmkvYzJpU1NJ?=
 =?utf-8?B?UFlEb29YZ3hIQ3VCeWx4Q1ZWVmMwYkcrR3Z5ZnhsMVRJanVSRGhBKzh3NEdR?=
 =?utf-8?B?N1lpd2tUZnI5dzkxajhoL000YndDalRuanVWUDlKd2lyVDFJSENNYVEzZkl4?=
 =?utf-8?B?NjNuSlRHQkQ0ZjBXOE5mMU81MnFoU2YydnRseDF2Y01WdThSWUxSUVdMUC8w?=
 =?utf-8?B?RUVsWnB1dUtWSCthVWxJdmdpM1QwTktqbmo3Z2VscVZzTFBZWkcxQmo1bzV4?=
 =?utf-8?B?MUtYblNlRUwzeE9WbEZpZFRVRXhPNEVDem9kQ0JRK2JzOVpXOEpyd21lbU1R?=
 =?utf-8?B?cVAzOHBvT241QmNDb2NxcTBBZWlXOGQvU2NGVURYQ2xCMDhUT2R5bFd6ZEx6?=
 =?utf-8?B?RkN6QlNKeWFEVHZCSm8yOG5NS05VcG5yOXNXNVYwVmQ5TGhWeEVWNUpVeU1z?=
 =?utf-8?B?QVYzb25tS3p1S3ppS2ZIbEZpUU5YNmNIWjVKblUzRkNLS1pyV1NlTE1VeC9s?=
 =?utf-8?B?STU2NTVqK1Y2ai80cXJMS1NsUTNoQ01kMVV4bTAvS2xTdC9WZDBRM3ZtZ1FD?=
 =?utf-8?B?TFMwU01NQ2dveFV2Sk1jeGQrTjMwRGlvQmVVa1hoVXJBRUppSkQvaXFwUk9V?=
 =?utf-8?B?TkZMbXBvZnZibU9hWUtHYis1Yy82WU1vYkpRM2U4bi83THo5L3JaWUxYQmxW?=
 =?utf-8?B?eFZmaTZzeDNocHRMSElWRmM2MkhTNnNwZk9na3ZSVkcvQTIzMkJXNVJ6RWFv?=
 =?utf-8?B?S0hJczN6RmRGUGZTc0pucnkxZDB3TXZMUlpuR0p4QXdTWDZIbzVueitDRmVy?=
 =?utf-8?B?ZzZKazc0dDBvbnkvek1xNGhaL051dUZMMk9FaytZQUFwdUFEeVE4a0pySUVj?=
 =?utf-8?B?TWVMQWdWOEFYN3pCSEtic09GcE9DYURGRlJ2OHRRc1hYU1dJRndJaW5TTVdB?=
 =?utf-8?B?NzZDNUhQaUxnMnN5RzZuMmZqL2FweUdoQTU0M2hlUWdvZlkxNndCeU1jWUk2?=
 =?utf-8?B?MG1LWFkxZ3pGS0J6WVdTWm1tR0FDSW9EaU95dWY4Q2RhWUZDVHBrMnlpbU12?=
 =?utf-8?B?cjBiSnd5ZERlMmZrcjEvZ0ZNUDlZajJybkpMbzVzZE9ieE0zd25DR2NncGM0?=
 =?utf-8?B?a0poVlBvU0JIYVkyRlprU3JSUXV4YmE5a2czcFNabW1mOEhiQjhzWkErMG9W?=
 =?utf-8?B?RVBLeDlkcDNvWmI5a1RnYjZFU21VcnJDYWlKY2QrVUw3YzM0U09kM1BsKzF6?=
 =?utf-8?Q?p1r2Hkv7tAb/h96RTsIqiLY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cc07b4-4a5f-4ec0-af6e-08dcba909915
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 05:35:38.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/5Mwck2fWby0yKvXSIVovIpe78lFbnGGjGHnuPtV6B8rgNLWizyb9GIFWPTFLT7gnRNFNiENfPNzsKFKc8Ezqm2tOpiC+7xQSyGdCkJ52U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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



On 10-08-2024 03:58, Matthew Brost wrote:
> Avoid leaking a lockdep map on each drm sched creation and destruction
> by using a single lockdep map for all drm sched allocated submit_wq.
> 
> v2:
>   - Use alloc_ordered_workqueue_lockdep_map (Tejun)
> 
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..cf79d348cb32 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,6 +87,12 @@
>   #define CREATE_TRACE_POINTS
>   #include "gpu_scheduler_trace.h"
>   
> +#ifdef CONFIG_LOCKDEP
> +static struct lockdep_map drm_sched_lockdep_map = {
> +	.name = "drm_sched_lockdep_map"
> +};


will it be better to use STATIC_LOCKDEP_MAP_INIT ? Initializing key here 
instead of while registering the class ?


> +#endif
> +
>   #define to_drm_sched_job(sched_job)		\
>   		container_of((sched_job), struct drm_sched_job, queue_node)
>   
> @@ -1272,7 +1278,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		sched->submit_wq = submit_wq;
>   		sched->own_submit_wq = false;
>   	} else {
> +#ifdef CONFIG_LOCKDEP
> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> +								       &drm_sched_lockdep_map);
> +#else
>   		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> +#endif
>   		if (!sched->submit_wq)
>   			return -ENOMEM;
>   
