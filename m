Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF62B1ACF9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 05:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C31410E5D5;
	Tue,  5 Aug 2025 03:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4JphTqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BCF10E45C;
 Tue,  5 Aug 2025 03:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754366183; x=1785902183;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7ACXZZ8rz72RlW7FZwhpALl2w6mY9ktbwINWR3VXs6g=;
 b=m4JphTqZly60OXFAuaD0A/2kWVsPME7nM0kFDL8GCt2WkZl8C8eWuBmF
 J1fUgwIhaBhawatJl0PGsvG/uD36mi9qK2y7L+xysRl88FZP97tmWe7vF
 yZt5cUNUy7QrPp6naZ8K4OMtsQU5j19NDkjPCYxFPSkxqpH/W6Ojy5QLU
 Qguuhdnewsujb6m/CDcVI/RKmSKzNoXfP0AGuHERfdXj4W8HDsod6DvTq
 D6rGF9RfyaLOiS4d1pDr65dKMZ/Z62jv3dLLcYqu/r7zVkQwu/u+HqR0w
 kq874D369KTkxdt4GqGvn4siH6X10Kp33tO4cI6drisG2U/y08eONsL0E w==;
X-CSE-ConnectionGUID: dVUQHiM9R5+gmhOjtQQKCg==
X-CSE-MsgGUID: NSF0xDpcQF+5cDhPDA3xyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56563274"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56563274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:56:22 -0700
X-CSE-ConnectionGUID: PlvswBkuSJ2sUnCBNhz78A==
X-CSE-MsgGUID: zDcAHeJKT/WHifUkypKOXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="188034188"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:56:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:56:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:56:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:56:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhbO0a50AotV28Rd3gPEcZ0lLkpwCpIcwWvcG/28ioglxbMNYg0O77uLsgoDq8A2UU4Egx/4IerqsyuHYUHUp/rjNgmXbjq/tCViBt3NpqaRfw3+oyxoU1oudPUI7Ib501rgtBkasu+14SkEhpsJQO0yhnuGlRkSmF7O9r9mb5E3Ou+dR+0b5KqPuKdBYyARAmR4/FeCCVLwLdEpUPq4GMUr7NiaZdrBMEamuqlShoKh7P1bZDoUKoCl6hRKeIWUaEHCptx3pG9hp1/YbqVyLKH+uBzlgAnKNyl+wS5XdypXV0vkLuSK0NcFs8JDn2aDwWdqXq64YXO0IrHAMln9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0K3yX71m7FgoabpmtpGEe72Ij4vmK7eFKETUV25qsg=;
 b=dXWF1gUAQGK5MQfmww20ZORq60W8Dpmk3pL0P/8/l6t/3PUQuBBzdkd6dD2FU3Af8v8QCGGF2OlHPQ5WxDw3rzV1N0+Lh2Ktoy2tFldDoC0JRcA0YamMjgH1KbjKYmAb9diOCWH4202gWLututyVU0g2dX8gbLJ+jnWBY3T56I8oUQMXdTeigFX1/Er4FPAVQmEpJ8ENEW3MQRO80wrsvFJwneWe8TF441YX+pc+rOFCVnaGOtYvcPBvNVR17A4EKczIMZi9I0j2xtRyI9e6kXKQkr9n1XQ/Qsp152c8Nsy+QYPYVcCdMZlnULHhzILsw+zmoVrDgkzJp9YVk5BT8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Tue, 5 Aug
 2025 03:56:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:56:19 +0000
Date: Mon, 4 Aug 2025 20:56:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@redhat.com>, "Boris
 Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
Message-ID: <aJGA4BPLJRs0RLfz@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:907::22)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ddd411-07a8-4c78-e671-08ddd3d408d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0lUa3N0RkFqd2NMWXBMVTVzdDZOWWprY1hxM0JPdVFuWUg3aVVlSHJ4UlJt?=
 =?utf-8?B?V1BoUlBpMWU5YTBKNVgrL3ZiR1pxbTl4THNVOHk0VXpBODUySUxUbVZEdmY0?=
 =?utf-8?B?bTM0VGNTdG1RUGVQQU9SZG9OVGpJMHF2WWJnL3c2NlZLcnhBZjZRamJvbVlS?=
 =?utf-8?B?QVdGaVgrZFJObTIxOU1JNzNLQkxlNktoUUJXYmNERk1YMXFGOXBRdjBrcEdq?=
 =?utf-8?B?a2ExbXY1TWIxMXlhT1NSTWFLTGVJRWs1eUlIdE1IcjFMcFNBZ1dmVWMrUmE5?=
 =?utf-8?B?ZzNDS0FxOTA1WG1BeHZ4SktGT1VkeFhiRHMzK2FZaWs4TTNpeU5xZUFKT2VB?=
 =?utf-8?B?b3pSYnVoSk5yRFZkY3NNbkNVdk9nRTdHSFM3bjZHN29NWnk3ZllCRndiS21k?=
 =?utf-8?B?VUQxZ2JJU1dqTTBjRmxCeDFNcjlSdkNOdUovb2QwdU5PL3RTWWl4M09xTU0w?=
 =?utf-8?B?eUFpSkp3dWVDaUExVjI2Q25BWFBFM3J4RDFXL2NOcGRJd2xzYU9DQTZKeits?=
 =?utf-8?B?MW9XdzhVaEZSN0IzZFdUNzlTcjJVM2UrTWpnTzVic2hPVS9HWHJqdVhlY0t1?=
 =?utf-8?B?L3FMWWgwWUZ2MHIzRkFMdEdtWWhJbmRibjhteng1VGJ3VUNzZ3R2OTFMbjVG?=
 =?utf-8?B?bTl4R3h4bG1mVzgxaHd1UjNOZktBK2hLbWFOSHliRmp1UUZSbFVpK1l3QWJ2?=
 =?utf-8?B?QW4wMFRVTElRVmJFTUhOMXdZbElpZGVFZ2Z5Q1RwSXdKSFJkaTJDSXhjOHpE?=
 =?utf-8?B?d1VyQlB6b25JVjUxNnQyVjhsb3VUZ2FYR0RIUzVhdXpPNHljVmZiL1ZWb0li?=
 =?utf-8?B?Sys0QllxZUFvOW1FY3dZcENHNS9kb0xWL0xTaWl1dmZIcUhrOWRBQUdPY3c2?=
 =?utf-8?B?TGZybC9GRTZudUllRXh0cVNpZWJEelVCcHpDZWRnQzEwbzl2WklSTlNTOU5W?=
 =?utf-8?B?Qk9EKzB2dDRSWEo3YXlKNE5zOVJOaWdCd2plMisxRDZzODVVWmsvQzdleXNI?=
 =?utf-8?B?bC9uYU10OENGYjJvQy9xNFJNdVNiT2dHZ0pEV1huOEU4aWo2V0ZITTU1SFB5?=
 =?utf-8?B?NHpCRXpML0N5SHN4aEVCYjNHR3c3ak90TXo4U1R2RXZGMXp4dDk2L3hWTm5y?=
 =?utf-8?B?RVVkdWpYNGNpZzhOeEFVZG03VVFlOWJjc2FEK0ludmxTQnprOWtKendBc3Zw?=
 =?utf-8?B?OHlXL2xob0p1MzNiMVZLVmNvODg1Z0Znd2w2TjNMVGpoaUI4eDVsOHBjdWFY?=
 =?utf-8?B?YkpieHpFSTZpZU9MOHpZaHVhMnBDbmwxaDlRSXhJZlBBN21uTjEyNG5QZkMw?=
 =?utf-8?B?cFNmc081UGJoQ081T0JMNTg5R0g2U1B6R0I4VFN3YWREamtNZmhBdGJ2Nlpp?=
 =?utf-8?B?YkRLNjFoRVEzNUpTRzhuNWMxNElZOEp1RUJHUTRGd2JsWkgyTTQrMmpEQzc2?=
 =?utf-8?B?M2Y3UXl6YVZBa2EyRWdjWkt2L29BQU1DNmRSN3FvWklXRkJOb1dlN1BPYVdO?=
 =?utf-8?B?TlU2bkRnZjlZaWpBMk9iY1J6TUhOTkk4amJqRklCcG9nUk1QSTVhTFZTR21J?=
 =?utf-8?B?RFlGbVFWUlNIL3RQR3ZvWXQwSFNiV0dDSERlWVlrSThucGVTL21RQWU4OG5o?=
 =?utf-8?B?YThXT0FHUVlTNjE5RG5IcFcvOGFVZ1VjVndUTk5HRHpCNVRSd2tSbHovWXJs?=
 =?utf-8?B?c3ZGY0VXdGRNWUZ0WDlzNnlvMjJGSUxkMkpJdUhudTR2U2NVSHRPZ0x0blZv?=
 =?utf-8?B?U2tzZzVBSnpUUGM3RkdURVRHam9RRzZmdGJ2d1U1Z1pkVXI3UmhlOVkyWjJY?=
 =?utf-8?Q?OYZ98ZrQjwJrQXAJjKoarFTw9WFpoTEP6tzp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRVZUE2RTRwQUVCQ3RyNWJQQzBlTGsyc1krSkVwQTJ0Nk1aVmNqTHRLeHNP?=
 =?utf-8?B?Y0pBc1Q5VkwvNDVoeVBSRkRURHBKNldYdzlaZmJHN0RpckhNZElGM1pJdFFY?=
 =?utf-8?B?MDdXUXg2enV6QnJPdWl3QW15MHIwem1jazk0NkFWcnIvWGh2SnpvdWJjR0g3?=
 =?utf-8?B?R2FRYStBNkJUekV2bkhndGZzREpNUzJDUjhnNVMyTmtCMEE2a0Foc1NoWlZD?=
 =?utf-8?B?U1B1QXNpS01oOGdKb0VucXBwZVpSRmpMZW1UK1pDMXJaL0RBK3JOMU9jb3hO?=
 =?utf-8?B?MzV5LzhWczBodVlVOGNDaUp5dXlheGhCQ0ZEaTFzK04xcjd5R1d5dm5HZXpl?=
 =?utf-8?B?TXdMbVNoRWxUcHpPMDRpcU5LaUNZSW9mTXk5WnFnWUc0NFp6N3UzSUt6Mmw0?=
 =?utf-8?B?eFNwekFYdUVIZ2pjZXNvSk1TdWJlR3Y1T3ZSWGRrN2ZuOERsaGY2czF2a1ds?=
 =?utf-8?B?a1N3UWFqc053U1dWRTBxV05QK003dDB3UnhwbFhueC9yT1VCazNGeUxMWXlH?=
 =?utf-8?B?eHgzYmpFdzJiQnlJckdWbVlHSjhkeWc5VlR4NjBmdFA3YlY3UzUzQ0d4MTdV?=
 =?utf-8?B?cEdtZWE1SkU3cit4UURkZjdFZTZ6NU5GaUR2RjhJM3NtQ0sya2c0S2tPQ04w?=
 =?utf-8?B?Ny9oejc2V0VzUllQd2Z5MmxTVEVWdGJJc3E4OXZlbVNkam1mUThUakszVEJI?=
 =?utf-8?B?VmpQV2xITEY1c2d3dXhBMWVHSmdFbmdjb2ZTV3FPbkFrK2FjNGpxUWN2QnhV?=
 =?utf-8?B?VHBEREJoNEhlZ2Q0NkNyelBXK0NJLytzY0J6SUhIaGhPbzFOU2RsOW9lNDNr?=
 =?utf-8?B?c01KanBQUXMyS1Y2c09WdnRVMnFYVkllNHZNbnRYSjdpdzRtbFVtVXJKcHVl?=
 =?utf-8?B?cWZXbVFZRWRSSFhqWkFmN2hVVS9pRkV5Q1U4VjY3QnJmQWRWaUpqRW0xN3M4?=
 =?utf-8?B?SmFiMzM1NDlCYlJYdzdiZUVSbzJDNHBjWlV3WFN5dkZZcnBaLzZSVml4RkpZ?=
 =?utf-8?B?WE1ZZERuc0lHYllpdzdjL3NGUmM1QVd0MlJSU0hxcmVmbVZjN08zb2I5UnNx?=
 =?utf-8?B?NjNYQjJqRXZoRTBqekJ6eVMyc01YNEtYc2I5NW9jbmZUa0UyZExDV1RGZlRC?=
 =?utf-8?B?UlozM3Q2bXREcXd0ZXBoSVJ1U1ZKamJTZDVmd1ZSUjMxdEt0RmNlNEJ5WFNj?=
 =?utf-8?B?NjZJVzJyS0lIc1dEY3ZZYUQ3VTJFdjNxM3VqY0RMZDg3ZWNKc3k4N25nZjFo?=
 =?utf-8?B?VVlxNzlQa0d1UXhKem5zY3hKWFFjQVU2TTZxYVhWTWJNMHg2VldYTUJ3QzUv?=
 =?utf-8?B?Mm5pQ0J1ODhkcXd5cmtjUE1ZYk5uRm85VHpFMzI5THRKY20zSWR0KzRnMU9H?=
 =?utf-8?B?ZWoyWkZaaFdsK0RuYUtlZ2pWNjFwaWN2RjlNMmoxMUVFc2grVlVKNk43V2wr?=
 =?utf-8?B?bTM5LytxeXdTOTczdjBLMkNXYSt0WVBXMW1LVk5HeGlZVElqL3pxTGNuUGp4?=
 =?utf-8?B?M1hPQkRPcm5JcGs2Zkg5VGVGbHRoSmRCM1RMYUJia3k5WFZ3UlYwd0VBU2Rw?=
 =?utf-8?B?MG50UGRvaGtGT3d2QkVqb2JvZE1MRGtTN3l6TWRHWUtvbHQyc2pPNHR0NmRl?=
 =?utf-8?B?UXFWbTZVMDFnVHdwMG1tMVlGKzZRR0o4dUJUMWZ5TFZ3MENpNG5JdmQ0czZL?=
 =?utf-8?B?d0kvbVFzWEdKSExNWkJrazdFNFpRU1lMbkRuaTVDVnpSbWF4YkttTXVGd2tO?=
 =?utf-8?B?eGtrcWVkRW1sRE1sM1crWUI0b3VYNEpxNG1CZlJhbE1KeXlXZHc1R0xubU1S?=
 =?utf-8?B?SFVsby9ZL05RVEVhRjJsLzBqTUhlbEhmZTNsNUtrRW5jWXB4bWYzQmMzeEl2?=
 =?utf-8?B?Z25USVRmTGdHbXluc0xYVGxTK3JMWnB1VkJpKzM5dFliekQzVm5kbFppdmh1?=
 =?utf-8?B?aGFLdFJUMVlNWjlzMGhzZHR4ZU9OL2NNNG9BUFRnTjJZU1RKci9PMHAzVnBY?=
 =?utf-8?B?V0F3enl3c0FwbmJBbm44REJCQnh0U1crTVdDS2FyWWRmYUQrZno3Vkk2ZXFG?=
 =?utf-8?B?QXhYY1RtcnB0NXVIVnJYNzk1RWp0WmRFUnZTSTR2TkEvTmdadEoxdHNVWFkw?=
 =?utf-8?B?emh5QUVwdjVWeHVkRDJxdERpMldGZ2lObHpKTi9BRHplZ3RCa0hpaGg3WEFy?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ddd411-07a8-4c78-e671-08ddd3d408d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:56:19.2664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHoAfbVju2Eq6rHRYjCGsOw52DIGRcOxSd4lB6UlkJXlkFcq410ulj+9kfJkyM9IsEssaxB2Lqv0AVqL1YUNAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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

On Wed, Jul 30, 2025 at 06:30:26PM +0530, Himal Prasad Ghimiray wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
> 
> v5
>  - Use drm_gpuva_op_map—same as drm_gpuvm_map_req (Danilo)
>  - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>  - Fix kernel-docs
> 
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org> (#v4)
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 106 ++++++++++---------------
>  drivers/gpu/drm/imagination/pvr_vm.c   |  15 ++--
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  33 ++++++--
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 ++-
>  drivers/gpu/drm/panthor/panthor_mmu.c  |  13 ++-
>  drivers/gpu/drm/xe/xe_vm.c             |  13 ++-
>  include/drm/drm_gpuvm.h                |  10 +--
>  7 files changed, 112 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bbc7fecb6f4a..f04d80a3a63b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -486,13 +486,18 @@
>   *				  u64 addr, u64 range,
>   *				  struct drm_gem_object *obj, u64 offset)
>   *	{
> + *	        struct drm_gpuva_op_map op_map = {
> + *	                 .va.addr = addr,
> + *	                 .va.range = range,
> + *	                 .gem.obj = obj,
> + *	                 .gem.offset = offset,
> + *	           };
>   *		struct drm_gpuva_ops *ops;
>   *		struct drm_gpuva_op *op
>   *		struct drm_gpuvm_bo *vm_bo;
>   *
>   *		driver_lock_va_space();
> - *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
> - *						  obj, offset);
> + *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &op_map);
>   *		if (IS_ERR(ops))
>   *			return PTR_ERR(ops);
>   *
> @@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>  
>  static int
>  op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> -	  u64 addr, u64 range,
> -	  struct drm_gem_object *obj, u64 offset)
> +	  const struct drm_gpuva_op_map *req)
>  {
>  	struct drm_gpuva_op op = {};
>  
>  	op.op = DRM_GPUVA_OP_MAP;
> -	op.map.va.addr = addr;
> -	op.map.va.range = range;
> -	op.map.gem.obj = obj;
> -	op.map.gem.offset = offset;
> +	op.map.va.addr = req->va.addr;
> +	op.map.va.range = req->va.range;
> +	op.map.gem.obj = req->gem.obj;
> +	op.map.gem.offset = req->gem.offset;
>  
>  	return fn->sm_step_map(&op, priv);
>  }
> @@ -2102,17 +2106,16 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
> -		   u64 req_addr, u64 req_range,
> -		   struct drm_gem_object *req_obj, u64 req_offset)
> +		   const struct drm_gpuva_op_map *req)
>  {
>  	struct drm_gpuva *va, *next;
> -	u64 req_end = req_addr + req_range;
> +	u64 req_end = req->va.addr + req->va.range;
>  	int ret;
>  
> -	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
> +	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
>  		return -EINVAL;
>  
> -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
> +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->va.addr, req_end) {
>  		struct drm_gem_object *obj = va->gem.obj;
>  		u64 offset = va->gem.offset;
>  		u64 addr = va->va.addr;
> @@ -2120,9 +2123,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		u64 end = addr + range;
>  		bool merge = !!va->gem.obj;
>  
> -		if (addr == req_addr) {
> -			merge &= obj == req_obj &&
> -				 offset == req_offset;
> +		if (addr == req->va.addr) {
> +			merge &= obj == req->gem.obj &&
> +				 offset == req->gem.offset;
>  
>  			if (end == req_end) {
>  				ret = op_unmap_cb(ops, priv, va, merge);
> @@ -2141,9 +2144,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			if (end > req_end) {
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
> -					.va.range = range - req_range,
> +					.va.range = range - req->va.range,
>  					.gem.obj = obj,
> -					.gem.offset = offset + req_range,
> +					.gem.offset = offset + req->va.range,
>  				};
>  				struct drm_gpuva_op_unmap u = {
>  					.va = va,
> @@ -2155,8 +2158,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					return ret;
>  				break;
>  			}
> -		} else if (addr < req_addr) {
> -			u64 ls_range = req_addr - addr;
> +		} else if (addr < req->va.addr) {
> +			u64 ls_range = req->va.addr - addr;
>  			struct drm_gpuva_op_map p = {
>  				.va.addr = addr,
>  				.va.range = ls_range,
> @@ -2165,8 +2168,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			};
>  			struct drm_gpuva_op_unmap u = { .va = va };
>  
> -			merge &= obj == req_obj &&
> -				 offset + ls_range == req_offset;
> +			merge &= obj == req->gem.obj &&
> +				 offset + ls_range == req->gem.offset;
>  			u.keep = merge;
>  
>  			if (end == req_end) {
> @@ -2189,7 +2192,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.va.range = end - req_end,
>  					.gem.obj = obj,
>  					.gem.offset = offset + ls_range +
> -						      req_range,
> +						      req->va.range,
>  				};
>  
>  				ret = op_remap_cb(ops, priv, &p, &n, &u);
> @@ -2197,10 +2200,10 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					return ret;
>  				break;
>  			}
> -		} else if (addr > req_addr) {
> -			merge &= obj == req_obj &&
> -				 offset == req_offset +
> -					   (addr - req_addr);
> +		} else if (addr > req->va.addr) {
> +			merge &= obj == req->gem.obj &&
> +				 offset == req->gem.offset +
> +					   (addr - req->va.addr);
>  
>  			if (end == req_end) {
>  				ret = op_unmap_cb(ops, priv, va, merge);
> @@ -2236,9 +2239,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		}
>  	}
>  
> -	return op_map_cb(ops, priv,
> -			 req_addr, req_range,
> -			 req_obj, req_offset);
> +	return op_map_cb(ops, priv, req);
>  }
>  
>  static int
> @@ -2303,10 +2304,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to drm_gpuva_op_map struct
>   *
>   * This function iterates the given range of the GPU VA space. It utilizes the
>   * &drm_gpuvm_ops to call back into the driver providing the split and merge
> @@ -2333,8 +2331,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   */
>  int
>  drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		 u64 req_addr, u64 req_range,
> -		 struct drm_gem_object *req_obj, u64 req_offset)
> +		 const struct drm_gpuva_op_map *req)
>  {
>  	const struct drm_gpuvm_ops *ops = gpuvm->ops;
>  
> @@ -2343,9 +2340,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  		       ops->sm_step_unmap)))
>  		return -EINVAL;
>  
> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
> @@ -2421,10 +2416,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @exec: the &drm_exec locking context
>   * @num_fences: for newly mapped objects, the # of fences to reserve
> - * @req_addr: the start address of the range to unmap
> - * @req_range: the range of the mappings to unmap
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @op: ptr to drm_gpuva_op_map struct

s/@op/@req/ - Kernel test robot.

Also I believe Danilo's suggestion here was to define drm_gpuvm_map_req
as the argument and then embed drm_gpuva_op_map within
drm_gpuvm_map_req. So in patch [1], flags would be added to
drm_gpuvm_map_req rather than drm_gpuva_op_map.

Matt

[1] https://patchwork.freedesktop.org/patch/666211/?series=149550&rev=5

>   *
>   * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
>   * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> @@ -2442,12 +2434,10 @@ static const struct drm_gpuvm_ops lock_ops = {
>   *            for_each_vm_bind_operation {
>   *                switch (op->op) {
>   *                case DRIVER_OP_UNMAP:
> - *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
> + *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->va.addr, op->va.range);
>   *                    break;
>   *                case DRIVER_OP_MAP:
> - *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
> - *                                                     op->addr, op->range,
> - *                                                     obj, op->obj_offset);
> + *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, op);
>   *                    break;
>   *                }
>   *
> @@ -2478,18 +2468,16 @@ static const struct drm_gpuvm_ops lock_ops = {
>  int
>  drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			   struct drm_exec *exec, unsigned int num_fences,
> -			   u64 req_addr, u64 req_range,
> -			   struct drm_gem_object *req_obj, u64 req_offset)
> +			   struct drm_gpuva_op_map *req)
>  {
> -	if (req_obj) {
> -		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
> +	if (req->gem.obj) {
> +		int ret = drm_exec_prepare_obj(exec, req->gem.obj, num_fences);
>  		if (ret)
>  			return ret;
>  	}
>  
>  	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +				  req);
>  
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
> @@ -2611,10 +2599,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>  /**
>   * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to drm_gpuva_op_map struct
>   *
>   * This function creates a list of operations to perform splitting and merging
>   * of existent mapping(s) with the newly requested one.
> @@ -2642,8 +2627,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>   */
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 req_addr, u64 req_range,
> -			    struct drm_gem_object *req_obj, u64 req_offset)
> +			    const struct drm_gpuva_op_map *req)
>  {
>  	struct drm_gpuva_ops *ops;
>  	struct {
> @@ -2661,9 +2645,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>  	args.vm = gpuvm;
>  	args.ops = ops;
>  
> -	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
> -				 req_addr, req_range,
> -				 req_obj, req_offset);
> +	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
>  	if (ret)
>  		goto err_free_ops;
>  
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
> index 2896fa7501b1..57116709de81 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
>  static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
>  {
>  	switch (bind_op->type) {
> -	case PVR_VM_BIND_TYPE_MAP:
> +	case PVR_VM_BIND_TYPE_MAP: {
> +		const struct drm_gpuva_op_map map_req = {
> +			.va.addr = bind_op->device_addr,
> +			.va.range = bind_op->size,
> +			.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
> +			.gem.offset = bind_op->offset,
> +		};
> +
>  		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> -					bind_op, bind_op->device_addr,
> -					bind_op->size,
> -					gem_from_pvr_gem(bind_op->pvr_obj),
> -					bind_op->offset);
> +					bind_op, &map_req);
> +	}
>  
>  	case PVR_VM_BIND_TYPE_UNMAP:
>  		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 3cd8562a5109..59a9b41bc967 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -371,6 +371,12 @@ struct drm_gpuva *
>  msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>  		u64 offset, u64 range_start, u64 range_end)
>  {
> +	struct drm_gpuva_op_map op_map = {
> +		.va.addr = range_start,
> +		.va.range = range_end - range_start,
> +		.gem.obj = obj,
> +		.gem.offset = offset,
> +	};
>  	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
>  	struct drm_gpuvm_bo *vm_bo;
>  	struct msm_gem_vma *vma;
> @@ -399,7 +405,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>  	if (obj)
>  		GEM_WARN_ON((range_end - range_start) > obj->size);
>  
> -	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
> +	drm_gpuva_init_from_op(&vma->base, &op_map);
>  	vma->mapped = false;
>  
>  	ret = drm_gpuva_insert(&vm->base, &vma->base);
> @@ -1172,10 +1178,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
>  				break;
>  			case MSM_VM_BIND_OP_MAP:
>  			case MSM_VM_BIND_OP_MAP_NULL:
> -				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
> -							    op->iova, op->range,
> -							    op->obj, op->obj_offset);
> +			{
> +				struct drm_gpuva_op_map map_req = {
> +					.va.addr = op->iova,
> +					.va.range = op->range,
> +					.gem.obj = op->obj,
> +					.gem.offset = op->obj_offset,
> +				};
> +
> +				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
>  				break;
> +			}
>  			default:
>  				/*
>  				 * lookup_op() should have already thrown an error for
> @@ -1283,9 +1296,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>  				arg.flags |= MSM_VMA_DUMP;
>  			fallthrough;
>  		case MSM_VM_BIND_OP_MAP_NULL:
> -			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
> -					       op->range, op->obj, op->obj_offset);
> +		{
> +			struct drm_gpuva_op_map map_req = {
> +				.va.addr = op->iova,
> +				.va.range = op->range,
> +				.gem.obj = op->obj,
> +				.gem.offset = op->obj_offset,
> +			};
> +
> +			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
>  			break;
> +		}
>  		default:
>  			/*
>  			 * lookup_op() should have already thrown an error for
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index ddfc46bc1b3e..b74054b0a476 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  			break;
>  		case OP_MAP: {
>  			struct nouveau_uvma_region *reg;
> +			struct drm_gpuva_op_map map_req = {
> +				.va.addr = op->va.addr,
> +				.va.range = op->va.range,
> +				.gem.obj = op->gem.obj,
> +				.gem.offset = op->gem.offset,
> +			};
>  
>  			reg = nouveau_uvma_region_find_first(uvmm,
>  							     op->va.addr,
> @@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  			}
>  
>  			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
> -							      op->va.addr,
> -							      op->va.range,
> -							      op->gem.obj,
> -							      op->gem.offset);
> +							      &map_req);
>  			if (IS_ERR(op->ops)) {
>  				ret = PTR_ERR(op->ops);
>  				goto unwind_continue;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 4140f697ba5a..5fd4245a57b9 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2169,15 +2169,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  	mutex_lock(&vm->op_lock);
>  	vm->op_ctx = op;
>  	switch (op_type) {
> -	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
> +	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
> +		const struct drm_gpuva_op_map map_req = {
> +			.va.addr = op->va.addr,
> +			.va.range = op->va.range,
> +			.gem.obj = op->map.vm_bo->obj,
> +			.gem.offset = op->map.bo_offset,
> +		};
> +
>  		if (vm->unusable) {
>  			ret = -EINVAL;
>  			break;
>  		}
>  
> -		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
> -				       op->map.vm_bo->obj, op->map.bo_offset);
> +		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
>  		break;
> +	}
>  
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>  		ret = drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..4b3e78745363 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2316,10 +2316,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
> -	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
> -		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
> -						  obj, bo_offset_or_userptr);
> +	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> +		struct drm_gpuva_op_map map_req = {
> +			.va.addr = addr,
> +			.va.range = range,
> +			.gem.obj = obj,
> +			.gem.offset = bo_offset_or_userptr,
> +		};
> +
> +		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>  		break;
> +	}
>  	case DRM_XE_VM_BIND_OP_UNMAP:
>  		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>  		break;
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 274532facfd6..892ffe75a62f 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1060,8 +1060,8 @@ struct drm_gpuva_ops {
>  
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 addr, u64 range,
> -			    struct drm_gem_object *obj, u64 offset);
> +			    const struct drm_gpuva_op_map *req);
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>  			      u64 addr, u64 range);
> @@ -1205,16 +1205,14 @@ struct drm_gpuvm_ops {
>  };
>  
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		     u64 addr, u64 range,
> -		     struct drm_gem_object *obj, u64 offset);
> +		     const struct drm_gpuva_op_map *req);
>  
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>  		       u64 addr, u64 range);
>  
>  int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			  struct drm_exec *exec, unsigned int num_fences,
> -			  u64 req_addr, u64 req_range,
> -			  struct drm_gem_object *obj, u64 offset);
> +			  struct drm_gpuva_op_map *req);
>  
>  int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>  				 u64 req_addr, u64 req_range);
> -- 
> 2.34.1
> 
