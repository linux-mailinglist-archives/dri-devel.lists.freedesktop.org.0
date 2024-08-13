Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F295058C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DAF10E333;
	Tue, 13 Aug 2024 12:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3o/NKkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6900910E332;
 Tue, 13 Aug 2024 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723553453; x=1755089453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I7hG/0P4YZRW4a/01R2XwTUYnn33DO4+r/qElZGtfnM=;
 b=S3o/NKkAlWsZh6Z6FS8G4w2oaqMuDRR79jrWCop9tUHcSknJhXHaY/0L
 s9agqil/+JjrEJtR97T4QLlU8Dp62fDs3ciicVDszSQmwd0pfafUaBngh
 qW5yvy+hVicD02BO9QM87S5mHA51oGm1hmeiPOQ5xHcwvDO+XZeitNHqs
 nATGwPRK+ZuJBdCGP5xCop+yMGF0YI/EZN2j7cMHzATyMTQ/HUnrjegfy
 fn6H8BdjVZFP8ZybdJJ8bG1hcYtHGVtlnyhiJWZ+PtS/+2Hd+sjR7JLPj
 neQ11AoKDYyB1buxLfQ9zt/smG10K7Jg922yxtnaPtQum+PqeLyJjEFFd w==;
X-CSE-ConnectionGUID: rzkueSGyREigjHq1qs+x3A==
X-CSE-MsgGUID: 0nOed+DcSk+i2ZM2RAnYdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21582842"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21582842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:50:53 -0700
X-CSE-ConnectionGUID: 8iqqnqkSQACF4+Ea7IwVWw==
X-CSE-MsgGUID: H7iirF94QwmUtSKBhjvcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63340004"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 05:50:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:50:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:50:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 05:50:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 05:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pH2ITChOIuoym5QsO3cQ7FRb9ow+BRVJny1vTPk9mlYr+GcK3cN/8ZDVxn3EcqWWlaiR8SW3SnecPqMJgr6RLPTkj63Oh27UNb7zKyChrHhg57d9ld2qt4bcYpr6+b6UxBFsxCLrCV/sm5t7FyqE5HkwZfb2s6Q4842Wfd7DLSC1MNlFPQ6Nzo3wbo55lm93cD7gPHqgY5QKBwW43Flty6yzalpmXJUFZELw+wgTdsbsjZLr9YjyILOXqqLXkiJ8g96MydSxQHRj9MF0so4z9J3pp6humY3t7Zwb4BpfOuvHh4fg9gfLp1y2NMaelZ1yWKmK9z5gfoXdQ0uZYT0x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uut2w/O65qqLjF2VY/KmzmeJ8FTn6nd/iN03odGFEaQ=;
 b=sNJyQSC+2KulnsiPiueYuPiJhCuFrFiJhu250fq4MbMDoFzjwG5aAqAAxRKi4PmUicMgU8kYnxLxt2rMaGUxseH773NuMiZGa1/yREN0R+jzsWdUtABVlWr4Wi8b9/AgNpsaXFrfS+Nt5vGFZAMEGaB4uf0u9Z+jqnWguU1bVfEYL0Lvgp6yqaXQokqNeyr9erOi6badYD7JZGKxggIAEK3j/uIpXR0kYXcXjq+9IIglKgyy/bIkStjV42BCfGlGSwAacloSPDkSRLtswp1mPdtR+yLVnl3RcfOpJaT5Xpw5dMy8q8LuFQWrGTAoia3U/baVMX6pIwPo+kcOBB+h1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 13 Aug
 2024 12:50:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 12:50:49 +0000
Message-ID: <8aa1bbec-e8ac-4abc-8bd4-b1a03efe121c@intel.com>
Date: Tue, 13 Aug 2024 18:20:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: clean up fault injection usage
To: Jani Nikula <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <akinobu.mita@gmail.com>,
 <akpm@linux-foundation.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
 <20240813121237.2382534-3-jani.nikula@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240813121237.2382534-3-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW4PR11MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: ecaf5873-e061-4744-39da-08dcbb968e85
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTlNU0dtT1J4Y1FrZWpvdUhPZXJNN2NiZlVMSTlLMTRucEt6Z21JYTBxWHMz?=
 =?utf-8?B?S2l1dnhnT08zTFVlSm5seHZlMjVLem5YeWYrUExsQW5RZ05EMFZlL080YWNR?=
 =?utf-8?B?NDExTzdYa0VyZ3Q4MGhrL3NxYThmQjFkcVF4Y3BacTJQNFEzaElRbi9kajRO?=
 =?utf-8?B?dVFybGF0MFdoVEkyS1k2Skc0VG1rdUhOeTEzTnNOK2NXdENQWENiNTdDK1Iy?=
 =?utf-8?B?eW9SOURmWVE1TXFLNDE4Zzg5M2RtWndZUVNVUlBNcEYwQnVnSU1iT1NWYS9U?=
 =?utf-8?B?R0lMVjFjb0tpMjhncXdTc2FHRi9kRUtNUjc1eXhmaWlkczc3OEFOaE5ZZ3Zk?=
 =?utf-8?B?WDBZRmRwdENyaEJhYVRlOUZ4enF1QlhZbUh4UHB0b2d5dzJ5QnExNy9DeUtC?=
 =?utf-8?B?a0dvUHUyN0I5NTlOUm9qOERpbm9INkd4M1RQMmNoQ2RGTVFqbFBhd210MjRG?=
 =?utf-8?B?emxKdlNFREhiUXVtSkpJSnUzV0ljMXJuMUJOUW1qQzZvUENRRzFYdnFjeE5N?=
 =?utf-8?B?THIrVUdYckdCdFljeS83aW51TnV2ODFJUkJqQnFWSTU1RVV2Um9mYmpoUHZ0?=
 =?utf-8?B?cXV1Qzk4V1M1eW1lNlR0bDVjRDBmeVd1UUhpbW9CbnIwNHlMMkkvbUNoclR1?=
 =?utf-8?B?YjNoRG5TQ0V0UFJpTHZUdmNVTDB6MGVOeC82Q2hhdGNGcHNETUEwUXBic0Ns?=
 =?utf-8?B?cCtzeWlXMGFxeTlpQXA5MmNYMVpmMktIV1RYS3d6SVNaNnV5ckNpUzBPUEVV?=
 =?utf-8?B?b1YzMCsreUVKem9lWFJFNVpia2EyY2tReWNLMUI4UlhDZ1V3V3h0c0VySVFT?=
 =?utf-8?B?bDBtdDJBdEVMSDNqR3ZwZUtvNjR0K29QaDIvYmVhRmptOVdBazA1NlhXdjY4?=
 =?utf-8?B?dUtQanRYcUNoSCs5Q0JSVjJrd0lxTjNsbXFhTE84ZVZkSjMxUUsvU0c1Yno0?=
 =?utf-8?B?T0twRitBK1B4M1RIY1B3MHhKS1k2eVB1WkNvcXEzSHZpNjk3bVMycmk1Uk5w?=
 =?utf-8?B?WTRBczM2c1B4aFRZVEpvQVBsRDhBNWVNRi9kcVNCWWpNTVp0QUNxM3I3TW9B?=
 =?utf-8?B?QXVVWVZMZXYwVmxMWVlmWU9EMUVEZUFUWk5kL3NBcU1FNTNsQTlMSzQ1UzVL?=
 =?utf-8?B?MXI3N1p0UXpGVHEwVXBzZ1JReG5CcUxmODYxeHhRTzlQMDhCQXMxc2xlcEZh?=
 =?utf-8?B?WERuR1JRVVB5YUVhZ0grOFV5aHVEQ3F4MG05SU0vbEFHMkpkQXNIM1JWRjFC?=
 =?utf-8?B?Nzd5WldaZWVOT2IwUHNHMndhL3FJbU5HczFVWW5PVklBNmZKdnNUQVZkZWpS?=
 =?utf-8?B?RnFmc1l5TUVNQnZhQ2VuNkV6NXFVb3BkcWtIMWp4Sm5lRmk1aENEbjJ1UzlS?=
 =?utf-8?B?ZXpwTVZXYUtsQ0txTHpYVU5MUG1HbXF0OWxQeVhuSzRvL2RHQWpPVDJpL0ZP?=
 =?utf-8?B?aUN2TGNHOUpFeFVzdUtORGkyTEhlK3Y3b2liNUoyTHh0MUorRzhqbHJrMFZl?=
 =?utf-8?B?Tjk4d1JnTzczNTQ5WUplU3J3Nmh3aC85aDRRbXFJcDlhVXBkU24zNFdaOHli?=
 =?utf-8?B?SGdVZEVocFZ1M1lhTmF0WVhJcmYrSkNGUXhUWXJPNXIxZWhPVHdIVFdYRDJa?=
 =?utf-8?B?TUErMGFZL3FrQ04ydW5xaXE0YzdDMVF6SDNGVUtvZk8rQ3N1NEp5N21KUVlD?=
 =?utf-8?B?MzdBUG9JR2NpcmZ3RTVwbGhwNXJsUlJUZ01kd29BR0ltNVJZV0FwTUNKVThI?=
 =?utf-8?Q?gDo3VvqazVwSS8llV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFZONXNhY0lTVy9Lbi9TRGxhTWlWaVRrdHg4aHBpQWgwUEJnazVYL2dSY2NE?=
 =?utf-8?B?NVdYNVpqeWFISzMvck9NU1AxbDh0ZGZ1dkg1eW9Nd2dBREc0ZEVqUVpFOHM4?=
 =?utf-8?B?RFp2RXZYWVhFTGhIbjZpU2RrK2czckZycTA3MFJadEpmcU15ZisxUFFzKzlu?=
 =?utf-8?B?NExieHNrNkRSSmxsb1QzcExXRkpSaHZqa0tldTRXem84eGlLb3NtS0IxYWxD?=
 =?utf-8?B?R3k5UHdZZXNJLzViNi9hNXI4VzdwTFVvTnFBRU5vdGJZWS9qdUhNaG1KZFBp?=
 =?utf-8?B?eUtFa3BaYWZmaDBoVExwSG5Qb3JTQzV3N2U2ZG5HY2pOd2Y1cWNDUkZlOE55?=
 =?utf-8?B?NEhYT1FEU0xFT0t1VzgzK01JL2RaY05QSjdLajhZaFdBcjF5Y0xwd2oreFNx?=
 =?utf-8?B?U2J4LzU1WWU4MitTaUdORDZxMkt3U2xSbGpqTHlLRXVaMUZCZklmYzBINjV1?=
 =?utf-8?B?blpmblZuQUU1SmFPRWYyRmEyU1pLa1djdDRKdWxpNW14aHNhSGVvYUtlYW1q?=
 =?utf-8?B?c1hTL1FQd1lBQ3BsOGFMMDhSb1lMOXlBbGovaHdZdmtKTWl4T2xPWFNrV2V0?=
 =?utf-8?B?a3VYMGxHZldSSVN6K2VyR1o2aGV3MWJ3aVk0NzBjVi9pS2k4cTZnSlNnVzdU?=
 =?utf-8?B?Z25KOTBDVEJOUjYxRHF6WTZ1eFB3QjZhRXl3cW5uTkd5WFhGR2ZrZjVKTlZx?=
 =?utf-8?B?YzY1TnNoaWVRM3dhZ1IzaHRGNVJVTk1RNjUySDdqZ0RoVVhSTTgvb3VNUFFl?=
 =?utf-8?B?Nmc4RzB0cVRHaUJtODRraStjYk01R2RtMUplMVhRdllDeCs5T2k1SHErbGYx?=
 =?utf-8?B?R20vZDNDa3dLdkZuaHhma3ZNYmNVd005Q3B4aWlDTVowUXNxSUwvUktiZmVR?=
 =?utf-8?B?aTFyUjNINHpUNG1PL2xPUDZyR0VvOU1UZzhveS94QThFMGRzOGdsS1hWbFVj?=
 =?utf-8?B?UEcvbkhUSnUwNDNFbkNvUC9FcnQ0TWpndVJHaXlnekZWYytrN0l1cW5zWStF?=
 =?utf-8?B?UXE3cW50WGJyVTZQNlVQSHVLSld6QUd4eTdKSnNLOHpSeUdUTzVvYXNYMkFD?=
 =?utf-8?B?M1VmSWNTaHJYUFIvMzRvU3lnb3Fhd2l3R0dGZVVFLzA2Z1MzZFZiRS9SZXhN?=
 =?utf-8?B?UTB0eEhwQys0VDRFdE1HWDNrMDBuQm42Z1hYbnhqUGJ6ZWgrOEU2QlArb1Rj?=
 =?utf-8?B?ZDA2MGZHTERIR2xJcjJTeG5pMWFRZFY3eXlWaXBzOU4xOE8rR3BKQW1HL3pY?=
 =?utf-8?B?N2tFTEJXWGN0UllEVmpRYk01eU1DZlFac3dHZjgyWllSTjgwU0sxZ29zWVpp?=
 =?utf-8?B?SXJRZ0NqUlBFc0FrRElGSzFFWEtPYzVKYW5hNzlndnp6OGtRVzRoMUhSNG9K?=
 =?utf-8?B?bTZhSWN5OXdyVTYwYUhZZkpVSG9zZmdwVHdJT2Y4ZnJUTFlzMFlYVWxBdnRr?=
 =?utf-8?B?Zyt6R3d1Q2VsRjN5OUlLRGFHOStOekJXTm56em9RQ2xVQkVwa0NPU0VKSDZh?=
 =?utf-8?B?ZzV0WVBhQ2dncDc2b3hlRXFjZDF2TmtSUWJENStrZkl1d2lXaXp6MUFzZXVO?=
 =?utf-8?B?NnNpQWtaM1M1NE5hd2xKQWhHMG5Sb0N1bHNQdzBwUHd4eEZlNnAzUjBDVWpI?=
 =?utf-8?B?TG84ZUQyRnNuMDBRSkU5SzdkbElWcmozSEN3cEsrWUphc0lUMjc4QjB6eE1E?=
 =?utf-8?B?blppNFBFYlFOV0pQWDNoaFQ3ais2UENlWm51aGxwamJuVlBTeUdyUGhVNUVL?=
 =?utf-8?B?ZFZXN2gwLys4cjlpSXJNSHJndEJBLzF2V2JBTU9GSWhGcXZCVE1QY3NIeGJX?=
 =?utf-8?B?cGhxSEV2ZXV1VDJKa2FhbkFVMjEvR3ovd2lVNmpXZkZjQTdkREg1Q0FxTmFW?=
 =?utf-8?B?eHZlYVFzZThQNHl2cVNXT2xwS1JvQ2NtUHBKN1BoenBEYmREakg0Y0RKdExD?=
 =?utf-8?B?V3RJTFNWNThnWGFvWVBmTGFUMUZzcGhnR2dHY0dIWllVUWxDL09MUWpBbk1L?=
 =?utf-8?B?ZHd2QnFlL2lVOS9FcHRQc01Ya29pS05nZm1rMVArTnk2cmZkRmtZdGVNWVQ4?=
 =?utf-8?B?cG1XZHM0WFpJaDNaREtTVysvUzUvVG42T3BMcjZjMFg0U2tabiszRExiVURz?=
 =?utf-8?B?Sis5S2ZEOEdneStZMjdUMHBObGhramExQTRjaHYyelBvcmg0UnVxejJUTmhY?=
 =?utf-8?Q?6eN2S6fNeiFmaoWeqGt15Ds=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaf5873-e061-4744-39da-08dcbb968e85
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 12:50:49.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tktt+Q80en74YUp1SZSunqSz7EEQr4aVcJmiJrCdx9z7ZyQ/GhN/yKe8F3Q6XWQX78qTMSKDnyM5vM34o/P6q+a4yDBfOD5KB9jdWA1894Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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



On 13-08-2024 17:42, Jani Nikula wrote:
> With the proper stubs in place in linux/fault-inject.h, we can remove a
> bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I had previously raised the patch 
[https://lore.kernel.org/lkml/ZYBNDXoVO7LB_S0d@rdvivi-mobl4/T/] to 
address the header inclusion dependency in lklm.

Given that [Patch 1/3] in this series also makes function inclusions, 
such as should_fail, independent of configs, this seems to be an 
improved version.

Assuming Patch 1 is approved by the maintainers, this patch looks good 
to me.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_debugfs.c |  7 +------
>   drivers/gpu/drm/xe/xe_gt.h      | 10 ++--------
>   2 files changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 1011e5d281fa..b381bfb634f7 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -6,6 +6,7 @@
>   #include "xe_debugfs.h"
>   
>   #include <linux/debugfs.h>
> +#include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
>   
>   #include <drm/drm_debugfs.h>
> @@ -26,10 +27,7 @@
>   #include "xe_vm.h"
>   #endif
>   
> -#ifdef CONFIG_FAULT_INJECTION
> -#include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
>   DECLARE_FAULT_ATTR(gt_reset_failure);
> -#endif
>   
>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>   {
> @@ -214,8 +212,5 @@ void xe_debugfs_register(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_debugfs_register(gt);
>   
> -#ifdef CONFIG_FAULT_INJECTION
>   	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> -#endif
> -
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 8b1a5027dcf2..ee138e9768a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> +#include <linux/fault-inject.h>
> +
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -19,19 +21,11 @@
>   
>   #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>   
> -#ifdef CONFIG_FAULT_INJECTION
> -#include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
>   extern struct fault_attr gt_reset_failure;
>   static inline bool xe_fault_inject_gt_reset(void)
>   {
>   	return should_fail(&gt_reset_failure, 1);
>   }
> -#else
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return false;
> -}
> -#endif
>   
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_hwconfig(struct xe_gt *gt);
