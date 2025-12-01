Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14F1C958B1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 02:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915C710E29B;
	Mon,  1 Dec 2025 01:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ai4w8g44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2E310E29B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 01:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764553915; x=1796089915;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iQ6uLc/dxNOaqzY1wtr0w9YCByX5vBINmf+4Lh8OJcc=;
 b=ai4w8g44s9RzsKK9+G3QCMDE8/RNmRycBdhmliSfCaUDjfoz5WKeZD0+
 5LbbHAqmjYM8qrdGsrBVZQLpGCM7QZkIjlqVvv1Pi8Jp+sY9oKxboreru
 lTiRti7y+t9k9U8VBsUMCv2guclTWGx1HOQN0YycxNCvSsvoiLZBf6Wy4
 ySHlYdPlOTEwenRmsDNnARUiMUik4RDxDhk8y75yjyABlMNXGqBj/27jz
 cUiV+wBxBVtH4OopSPyIXoKW1Ta2fsnbz88NXnnQdlS67kew1eafum9R5
 tjtptrLYBSOMAk2PZwq7c9cZT6VAEwk8lLkVuOUACiuAB3ydRHbqUMX6M Q==;
X-CSE-ConnectionGUID: RINtgIegREe0DgOTlTnCkg==
X-CSE-MsgGUID: tc0TrdUjQqSejDOFHNYhag==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70337246"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="70337246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 17:51:54 -0800
X-CSE-ConnectionGUID: f7io4DyCRouHeAGKO+W3cw==
X-CSE-MsgGUID: 7TCTkpU2QOuKh2yVvPvFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="193735071"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 17:51:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 17:51:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 17:51:52 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 17:51:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoup/ojdzJaMv/xAMpcxxl4nrxshEg/KVKYUxFgiaHJvDZsGD2HoFoeo63MOrqremDgTSd6bN4cgOTuIMlzIWHX1zYmQXEOyj/S8RSn+EMHKbxfRlDhGeKvTnqmMnB8bvQfHPqonOxJlLax3tJOhfbW45HXRsO/EVRNQrnwtveemGuUuhqnZEfqU+KiYBG0dBjeo424guB6D6VxbNgQkzZzJPTV7p161ZkppPPyjnwv5bKAm5vCy50qk/hpFifUit/aTuILqAZSF36JiTaysoQjM4tXEvbcEUTWYzjOKUCh6658PvE6+UTLag2WS/RR42JNECkPliAlBrq6C1/zePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFzV89GXjwc6nS1oDvaKFRjd64D/yQpqQ+35/rv7vfA=;
 b=IO0xoj1TCt2ETpJAZOFUfKRyqtcFanXJs64mwyo2Ivkds46fOMmyU4WuUGgZvFAEhCi8DrTb5dNinFuO35EPggfK8d9LEHCeJRJgo1K343KvZ2D2ixS5pwduAsgG/XwfJGGFfi+XKjFT2GJWLyK4w5Tope05nqDl6mZUyhrR4t5OuJSOm98E3jK09HSE5xYq7Zcc05knlu/4SqomigMs/5JwyRIon9eKSYO7TMMJOH6Enxw1VY1xD0177HOFS50hzaGjJfCblAf3g60TRsGRpdd2mkCrwIhNExfpt+wPbI9nVzgMWtQq39x6ZtycSUa2HyO3Fq0qc8i8x2E4jANerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 01:51:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 01:51:50 +0000
Date: Sun, 30 Nov 2025 17:51:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Jordan Niethe <jniethe@nvidia.com>, <linux-mm@kvack.org>,
 <balbirs@nvidia.com>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <david@redhat.com>, <ziy@nvidia.com>, <lorenzo.stoakes@oracle.com>,
 <lyude@redhat.com>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <rcampbell@nvidia.com>, <mpenttil@redhat.com>,
 <jgg@nvidia.com>, <willy@infradead.org>
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical
 address space
Message-ID: <aSz0s8plXN/6t7fD@lstrano-desk.jf.intel.com>
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <aSn2kXNG7X0UZJFW@lstrano-desk.jf.intel.com>
 <anu425gyhd5w3boribueuyckjlg73r356kkoy6iv6dcsy6b5ar@5qnbvtymgmje>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anu425gyhd5w3boribueuyckjlg73r356kkoy6iv6dcsy6b5ar@5qnbvtymgmje>
X-ClientProxiedBy: MW4PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:303:b8::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: eecc0927-0b69-4f56-cf3e-08de307c31de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3NGNDk5NlJheDNjdVNLZ2NKYnVXcVNRSkh0aUsreVpISVJxeGdqeDdjbTFq?=
 =?utf-8?B?T2lBYkpzMkoxZmg2SERoMmdFVzk0cjVpenBvM0cyT3RNbFlOd1hZb0NpbHp4?=
 =?utf-8?B?dW9KdU92RzZudjNINDlnZXBVT3gvOUNxS1cvbUVEWUQ5dkR0SGVLRFZqSEJW?=
 =?utf-8?B?U2FCSWNHNHhQZXJFdzhIZ09EMlE0UEZuQmh5anVnSjdQU0hNb2V0TWlhT2lY?=
 =?utf-8?B?b2kyaUlZMTBqOXFYdlpQbHdBVnhGamxVSk5GckUrOGhhdXNQalE1elVXOUFD?=
 =?utf-8?B?T25TdjdvblhNV2t3WVEvV0ZLaW9NYnhwRm1jVkgxaHVyWENXb1Z0ZkZNdS9Q?=
 =?utf-8?B?Wm1JS2lPUWtoOGhyancrRVE5NlJZOVNoaUVqQVJxMDR2YVdRdXhvem1Gc0VY?=
 =?utf-8?B?Z3p2UUdEMnBIUjdzeUYzQzl3ZFJheWdxeHJlQjZRUkN0UHJZUmZ3SXIzNlhP?=
 =?utf-8?B?dDE4SllnbDBuYXZmblBVZ2N3WE54YkN2dVVMQ0hQN2hmaWdJLzl0RHpQN1Zw?=
 =?utf-8?B?ejRTdVhtWGQxczZSRWtaTTk3YU13dHkrNE5kZDg1aFVUMXVCQ1NvakY2dzFY?=
 =?utf-8?B?MzZFRDc0QlY0TDlYN2hTbW1Ca20wYkxTbkJYWUYvd1JuTXZtOEdsejN2dHQ1?=
 =?utf-8?B?VWEwOGlrS0hQUUo4OFA0L1NxUnRIaDN0UFdyOTI1TElkdElwVjlnVVU2d3lV?=
 =?utf-8?B?YWtkY2dmZzhaWVhXY0owMnRvNmV6YmxzSUMzcktGQ0x1bDE1L1pYQndxaWpr?=
 =?utf-8?B?TlRqM0pYb29JdjJIOWRYR0ZMenpJYWhlWVp3Y0VORlM2U0lObTBQYTUvUkpN?=
 =?utf-8?B?dWVRNTBINlVEaTlyL0FUU0VsYWVMYVFpS0VUcjg3dUVEV2xCSlJCYUhodHcz?=
 =?utf-8?B?Vk5MYW83TFhwMFpteERkSVUyNS8rTGJ0THNTQllnVVRjMDE0bVdmTUc1d3dF?=
 =?utf-8?B?VVZ4aEsySzd4c1pWOHdEYkpMY3NYN25vZmUybEJoRTlRM2g5ZjBZM2JuRTdN?=
 =?utf-8?B?dWEyMnRjS1FseTRYT3BKcll3UnBzK2o3ZUNEMzFkVnNUU1o3dytvVkdydS9o?=
 =?utf-8?B?dlZGMWhXVVVYa2FQYmYwdWRFT1JzRUs2NnFYb0VNUWtYSnFGR2hHQzFLWFBt?=
 =?utf-8?B?M05vRDhZejNXWU1OZWRtTUhaQkYrcjRyYjcyWDFycU1lR0E5TGE1RWQwNlBx?=
 =?utf-8?B?WjZkdmY1aHVrdnNXSlR3NmFFc2FjMmJrU0dOSVdobTRRdWtkM09HRG1IT25u?=
 =?utf-8?B?MzdXOUF5NTRPcEJUcGVISzVuenMvS081cklIcER2aERXUDlzNlJORk5OcWNX?=
 =?utf-8?B?MGIzOVpWYmU4YkNMV0N1dmV4RHVVSTVCTllzNnV6cUliOGEzeUxFbzM5RGVk?=
 =?utf-8?B?eGtrdmx5enlBb2lKYnk1RExHTXhqam1lbS9rNFZyUllBc0ZSZm1MKy9ORFhl?=
 =?utf-8?B?ZjdRQlZPdTVUblJzQWVZRFV0VEdUU01IZ0VkNnFaeUJQRWROQzUyclpta3BU?=
 =?utf-8?B?emRnVEY4V0R6ZGNuOHZ3QUVFRmVuS0VPU0JRS1FrMlJoalJtUk55WDdHWklI?=
 =?utf-8?B?aDAwdUlGTjFxVXo5NEE1Y1ZLS2ZoaWEwTUlmN2JvNEcyNmYwTFBQalZsNG02?=
 =?utf-8?B?RnZvL2ZQNVBDRE5GbTBoV1RIYnowcWxkNzh3Rnd5dVRoclFIMVIxNHRjdnlF?=
 =?utf-8?B?ejRkK0U0RllQOFQxTTFCSGhVOVpJWlhPQktieUprTEdjM1R1T0E5bWxhb29a?=
 =?utf-8?B?RzhwVmVtcldOMjhDRWJrZGlQWGZxV1FhQ293UVFMaHNVQmNPYXpBWkFXZW9k?=
 =?utf-8?B?N09laXYwb2VPVTEzckZzYkI1Y2ZmRkI1U2psM3Izclh0dVVDRFNGNlJ2SHFi?=
 =?utf-8?B?TnRPUnV6T09jNzNVQ2hLdmpTZjVGMGNyc3A4SlRBbHljOXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlFEVHJWaGpGVjRGc1JwWGVGU0hqaXpscEREd3ZmQzBISnNLN0NpNDkzNlE3?=
 =?utf-8?B?K3pWempZMDh0NG5iaVV4RERMVWlXZGNFbERWb2JtQlRza2V2UXNrcEVsT3FW?=
 =?utf-8?B?VUJYMW41OXhjZEpOSnd6bEFQZi8xWHowZXRrWVlUOWZ6ZkRQQUxmU3JXbVhn?=
 =?utf-8?B?T3A3ejBCS1VkazZuamMvTkhhMmwzRzFpSnNzbGhDRU1ycEI1aWQ3enBBUE1i?=
 =?utf-8?B?dmEyNVQyL1Ira0pvaE16b2R0RTB5eEdCc284U0hhbGpUMjU2alZ3T20xK3ZZ?=
 =?utf-8?B?d1RBWWxyVCtvc0xSTXZGT3RNc2o5ei9IUkZhczBJY1dycUJGUWc5bCtsTHU5?=
 =?utf-8?B?aFlTb3hSZEY1Rk9NWUFDWXJLSFg1ZU9nb3hxWFU4cUhnR2JxTVJsRmYzajdn?=
 =?utf-8?B?OWo5cjc2R00valNKWmw0UCtYOHRIRkp1ejZ5eW14UEtNbUtQS0ZqelF6THN3?=
 =?utf-8?B?ZzBmK21aRFBNVm9ic0hEdk1ucWYyVzJiTisxYzgxWHdySXhxeWUvTlY1RnEx?=
 =?utf-8?B?VURLUE5NME1Rc09BdENhTDgzeE1FUm84WWVTZnF0dE13UlN1KzUxMWo0MlYr?=
 =?utf-8?B?NHFUK0hhMEtxUityZ1dkRlJkdjc1RWlTOXNoajRpejRlZk9lbnl5SHZITGgx?=
 =?utf-8?B?dVVIcnhGYVlLRzgzOHBqVU5JeUR4K3ovbSsra1N6N2tYTmZ1WE5LSUxXamF3?=
 =?utf-8?B?N0JHUTBLbDNiNlZaYVArL1V5WjI3RzBoY2JIVFFlcmhZNEI4TTdYYnp5RVVC?=
 =?utf-8?B?Y2hIMjVlWnUzSzY3cExMQnBOMlVpaUhndUZ4NnB3Y3FyVmsrdVNhazE0bU90?=
 =?utf-8?B?emdNbCsrR0RnZm1zb3I1WWlhQytlUG5ONG1UdG91STJkeE42clo5dEFDRnds?=
 =?utf-8?B?a1V2ei9oTWp2azhqMXBvVUcvczFqUjRoYW5POEN2M3VuVWJoUHdHcitJc3ZP?=
 =?utf-8?B?RnN1bjFRczFIRzJGVVliTFJXSVJZZC9DaSthZ1p0QUJNSTUwZ1VBRnFvYlF2?=
 =?utf-8?B?UFlraTROSEtkWkVyRkxyR2xySTR6cUh4anpBYXRLc0FkRTFZcDJZc1RIUHoy?=
 =?utf-8?B?c2I0bFF3ZHZzT3lmOFNrRXBYOWNpQVYxN2hLSjZpNit2MENaZHlrazFmK01q?=
 =?utf-8?B?VU1DQ3lDWUZ5YkNTcVUxUUk2eWFwQjNwSGVXSjJkd1VCRzJyQSs5ZWQ5VFhh?=
 =?utf-8?B?eHpDZDZLbHJpQ24va3FVaFdrR2N3U0NjendYUVd6ZGxFL3BCaVhJN3E4UDZY?=
 =?utf-8?B?dHFodmFwM1haMmd1SW5pa2RzUmUydFdQQW1DcXNzU2RzUE5IditKa0g0M3BO?=
 =?utf-8?B?QlFGczFjSGtmL2ZzUStkWml1ZWF5K0phZFlrZVZZSlFwcGd4OXlSeXE4U3NH?=
 =?utf-8?B?dGlQSG1Yek1iOWxBTHpkS1dHNUo1Nm9OL0JpOXdia0FCOG1pcmIwdURmYVgz?=
 =?utf-8?B?OWpQUnpYcG9PTjBOeXYvUFNXU1N4TERjd2ZleU9zM2xaM3o3TmZCZjFBaTJv?=
 =?utf-8?B?bXJxYi9yZlhOcG5VYlBQQUhOTGNHZWQrL1hiN1VwYTBvSmUwVkR5aGNJSXZL?=
 =?utf-8?B?SEZsSFpyd004Z1BZVGtrbjZlVndGdjZxZHhwVnFtZWQrWlJrN2ZPb0NSRVYr?=
 =?utf-8?B?Q3FXcnc2cXNxbTlmY3doQUZWK2gvNkhZeXluM0hXM2hnV1E5YWtkeWEyN3Jy?=
 =?utf-8?B?UUpiYWtEdHJMYkhsaFBmbUQwejB5UWtCbmw1TXlwUmlRUFNPakFlZ0xLd3Fk?=
 =?utf-8?B?YVZOQURYYktXRmZCMDZIbmlteTNvcEY1WXJ1QWVmbCtUZWpyV3BOajgvOVJy?=
 =?utf-8?B?YWRtNTdibjh3MFQzcTZMRDVXSlZZT3lrTFRURUVpL2dtZVBzVU9mUlRoL2hB?=
 =?utf-8?B?a081dU9rSWx3R281ckpEUkFDS002dlJCYWMvVEVtQWNrVGhiam0zMTdIc01D?=
 =?utf-8?B?MDlFQVdFbUQ1dDFvZlgrSWVLYWRHZ20zZ21WNmdFOWtRSXk0dlZrcXRFSkZZ?=
 =?utf-8?B?YUR2dGdLU3J5RUg2VnR2MzVrQWI2WVRWemlpZkZsWlNrMVdDQ2tja0FQQ2dq?=
 =?utf-8?B?ZXpFU3NCN0Y5M0x6OXVCczV0elFRZXRDNFQrZ1pqVHdIUXdvNmk5VThmaEZO?=
 =?utf-8?B?N1FLeTZtYnBIbjQyU2N3RTQ2N3JZb3dWVENldTVXYjduK2VWTnFkNDhwSXVU?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eecc0927-0b69-4f56-cf3e-08de307c31de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 01:51:50.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuf9+w3LNGfN7tTaq3UmjBCqx93VomSTSMovSPWcH2VRMSW22RrcroQUcdv/pc65IVC0Pa1y79mtq1kAjpulOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
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

On Mon, Dec 01, 2025 at 10:23:32AM +1100, Alistair Popple wrote:
> On 2025-11-29 at 06:22 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > On Fri, Nov 28, 2025 at 03:41:40PM +1100, Jordan Niethe wrote:
> > > Today, when creating these device private struct pages, the first step
> > > is to use request_free_mem_region() to get a range of physical address
> > > space large enough to represent the devices memory. This allocated
> > > physical address range is then remapped as device private memory using
> > > memremap_pages.
> > > 
> > > Needing allocation of physical address space has some problems:
> > > 
> > >   1) There may be insufficient physical address space to represent the
> > >      device memory. KASLR reducing the physical address space and VM
> > >      configurations with limited physical address space increase the
> > >      likelihood of hitting this especially as device memory increases. This
> > >      has been observed to prevent device private from being initialized.  
> > > 
> > >   2) Attempting to add the device private pages to the linear map at
> > >      addresses beyond the actual physical memory causes issues on
> > >      architectures like aarch64  - meaning the feature does not work there [0].
> > > 
> > > This RFC changes device private memory so that it does not require
> > > allocation of physical address space and these problems are avoided.
> > > Instead of using the physical address space, we introduce a "device
> > > private address space" and allocate from there.
> > > 
> > > A consequence of placing the device private pages outside of the
> > > physical address space is that they no longer have a PFN. However, it is
> > > still necessary to be able to look up a corresponding device private
> > > page from a device private PTE entry, which means that we still require
> > > some way to index into this device private address space. This leads to
> > > the idea of a device private PFN. This is like a PFN but instead of
> > > associating memory in the physical address space with a struct page, it
> > > associates device memory in the device private address space with a
> > > device private struct page.
> > > 
> > > The problem that then needs to be addressed is how to avoid confusing
> > > these device private PFNs with the regular PFNs. It is the inherent
> > > limited usage of the device private pages themselves which make this
> > > possible. A device private page is only used for userspace mappings, we
> > > do not need to be concerned with them being used within the mm more
> > > broadly. This means that the only way that the core kernel looks up
> > > these pages is via the page table, where their PTE already indicates if
> > > they refer to a device private page via their swap type, e.g.
> > > SWP_DEVICE_WRITE. We can use this information to determine if the PTE
> > > contains a normal PFN which should be looked up in the page map, or a
> > > device private PFN which should be looked up elsewhere.
> > > 
> > > This applies when we are creating PTE entries for device private pages -
> > > because they have their own type there are already must be handled
> > > separately, so it is a small step to convert them to a device private
> > > PFN now too.
> > > 
> > > The first part of the series updates callers where device private PFNs
> > > might now be encountered to track this extra state.
> > > 
> > > The last patch contains the bulk of the work where we change how we
> > > convert between device private pages to device private PFNs and then use
> > > a new interface for allocating device private pages without the need for
> > > reserving physical address space.
> > > 
> > > For the purposes of the RFC changes have been limited to test_hmm.c
> > > updates to the other drivers will be included in the next revision.
> > > 
> > > This would include updating existing users of memremap_pages() to use
> > > memremap_device_private_pagemap() instead to allocate device private
> > > pages. This also means they would no longer need to call
> > > request_free_mem_region().  An equivalent of devm_memremap_pages() will
> > > also be necessary.
> > > 
> > > Users of the migrate_vma() interface will also need to be updated to be
> > > aware these device private PFNs.
> > > 
> > > By removing the device private pages from the physical address space,
> > > this RFC also opens up the possibility to moving away from tracking
> > > device private memory using struct pages in the future. This is
> > > desirable as on systems with large amounts of memory these device
> > > private struct pages use a signifiant amount of memory and take a
> > > significant amount of time to initialize.
> > 
> > A couple things.
> > 
> > - I’m fairly certain that, briefly looking at this, it will break all
> >   upstream DRM drivers (AMDKFD, Nouveau, Xe / GPUSVM) that use device
> >   private pages. I looked into what I think conflicts with Xe / GPUSVM,
> >   and I believe the impact is fairly minor. I’m happy to help by pulling
> >   this code and fixing up our side.
> 
> It most certainly will :-) I think Jordan called that out above but we wanted

I don't always read.

> to get the design right before spending too much time updating drivers. That
> said I don't think the driver changes should be extensive, but let us know if
> you disagree.

I did a quick look, and I believe it pretty minor (e.g., pfn_to_page is used a
few places for device pages which would need a refactor, etc...). Maybe
a bit more, we will find out but not too concerned.

> 
> > - I’m fully on board with eventually moving to something that uses less
> >   memory than struct page, and I’m happy to coordinate on future changes.
> 
> Thanks!
> 
> > - Before we start coordinating on this patch set, should we hold off until
> >   the 6.19 cycle, which includes 2M device pages from Balbir [1] (i.e.,
> >   rebase this series on top of 6.19 once it includes 2M pages)? I suspect
> >   that, given the scope of this series and Balbir’s, there will be some
> >   conflicts.
> 
> Our aim here is to get some review of the design and the patches/implementation
> for the 6.19 cycle but I agree that this will need to get rebased on top of
> Balbir's series.

+1. Will be on the lookout for the next post and pull into 6.19 DRM tree
and at least test out the Intel stuffi + send fixes if needed.

I can enable both of you for Intel CI too, just include intel-xe list on
next post and it will get kicked off and you can find the results on
patchworks.

Matt

> 
>  - Alistair
> 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/152798/
> > 
> > > 
> > > Testing:
> > > - selftests/mm/hmm-tests on an amd64 VM
> > > 
> > > [0] https://lore.kernel.org/lkml/CAMj1kXFZ=4hLL1w6iCV5O5uVoVLHAJbc0rr40j24ObenAjXe9w@mail.gmail.com/
> > > 
> > > Jordan Niethe (6):
> > >   mm/hmm: Add flag to track device private PFNs
> > >   mm/migrate_device: Add migrate PFN flag to track device private PFNs
> > >   mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
> > >     device private PFNs
> > >   mm: Add a new swap type for migration entries with device private PFNs
> > >   mm/util: Add flag to track device private PFNs in page snapshots
> > >   mm: Remove device private pages from the physical address space
> > > 
> > >  Documentation/mm/hmm.rst |   9 +-
> > >  fs/proc/page.c           |   6 +-
> > >  include/linux/hmm.h      |   5 ++
> > >  include/linux/memremap.h |  25 +++++-
> > >  include/linux/migrate.h  |   5 ++
> > >  include/linux/mm.h       |   9 +-
> > >  include/linux/rmap.h     |  33 +++++++-
> > >  include/linux/swap.h     |   8 +-
> > >  include/linux/swapops.h  | 102 +++++++++++++++++++++--
> > >  lib/test_hmm.c           |  66 ++++++++-------
> > >  mm/debug.c               |   9 +-
> > >  mm/hmm.c                 |   2 +-
> > >  mm/memory.c              |   9 +-
> > >  mm/memremap.c            | 174 +++++++++++++++++++++++++++++----------
> > >  mm/migrate.c             |   6 +-
> > >  mm/migrate_device.c      |  44 ++++++----
> > >  mm/mm_init.c             |   8 +-
> > >  mm/mprotect.c            |  21 +++--
> > >  mm/page_vma_mapped.c     |  18 +++-
> > >  mm/pagewalk.c            |   2 +-
> > >  mm/rmap.c                |  68 ++++++++++-----
> > >  mm/util.c                |   8 +-
> > >  mm/vmscan.c              |   2 +-
> > >  23 files changed, 485 insertions(+), 154 deletions(-)
> > > 
> > > 
> > > base-commit: e1afacb68573c3cd0a3785c6b0508876cd3423bc
> > > -- 
> > > 2.34.1
> > > 
