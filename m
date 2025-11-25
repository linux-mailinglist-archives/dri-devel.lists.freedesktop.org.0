Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19587C8569C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DD810E415;
	Tue, 25 Nov 2025 14:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Si3FgHen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B44910E40A;
 Tue, 25 Nov 2025 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764080816; x=1795616816;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SGPM7DTCl7PZJiHGa2nTFNn/WRk6LD7/nUgXIT/bLlM=;
 b=Si3FgHenHramQxfMV/Ky8oMPFpRyET0/3auBCxT7LFITqkCNKzTSdlIW
 GekYhpIfEXk8DhDxr2W5HNZyi3u7wer7omEaqQaOLhEd7uT30PphSuBk6
 wVpGFQWx+IszRHjtFzFEDDbjyJ5cpd6GcaLtjFz4VnFVZQWDK+WGgnY6W
 jNXNILY3NMT32QP5QDeb5k/qYWVTXMkRYcCiDQfB1IV78rVCBYuUMKprM
 HR98as6YSw5poIUtvWEVF+vZIVcaIHuluFeU8X6RP7kVOxUH3r5K+whjX
 leP91mfObj2qolIYfP9VxLzBp0QDE296k5iTuEmQ56ZfgIVYBSfu8zgS9 g==;
X-CSE-ConnectionGUID: WyAcjcwoR1CN8apRwvuKLQ==
X-CSE-MsgGUID: +zFXHA7IRTimDWj28J57mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65986702"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65986702"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:26:55 -0800
X-CSE-ConnectionGUID: dztIN0QsQeqhJkNRvKsXNw==
X-CSE-MsgGUID: hNqK+WccSn6sFvgeQSZqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="197130266"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:26:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:26:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 06:26:50 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:26:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBukn8N73+QC3GjEFw11uKwoEVCgsjICUpboGmJ4INGUDWzt+4gXpuMXUZEiKLpoavWDVm700JjDxcgW83tEIbs7e3mEClTrNpMDl+kHwXhWBrDCPnqp0oH0AJ0tGIWkOIHVNewC5IrFsQIMVXXbKfezKAiVcvueLLjRf/lXU4rVauKnlVSO97vGIrXiUE4vjYbT72QP4SkFc78G8OoStZtGVPN5Tpad9+bh1wykVi8AyvBNPU0Cch6pjwWFrS+XkZzuitLB2Mg3qp4KAAhMckRIEEx61hdgmD4ZTqkiNTfnS5LfP9KMorcnFIrZ5xUdRRtziFC9+i/fu/fu2ErvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vy+QOUp7fuCsSirhrCZrRYlquAKUcJPeozb2QCaiUSU=;
 b=L8OvH6k/+BQHBQNCE0kwzTeL4Sx01wNbudedmFjxyKi9i71ReKu8ylpUCqBcpRE9yzdjjoDgRT+o/z6s0Oc3/3oIotvewnVrfAIQmQI+A+X1LMHNAd7dkfGzYXPoHMqglbX4ezFNdnoDFIs8aqq0m2Cie79r3i/cCzB54ugeqa4GCKATcWoWAFoSY8VxGf1F7A7D0s15qmy2nK4V/pXg0f6A71snd8NJI8ydU7vFgQfK85TwTRoFRvzvMbGGrjhzpoTAMSrIeOqUc/pc8X+oGesWTZrs3AertrsmMAlVHljm84i9jvyTwC0W+MJug1xQQM8/WlBk5ACSCQucQplZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 14:26:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 14:26:44 +0000
Message-ID: <5565f3ea-6427-458a-b821-eb58890f16fa@intel.com>
Date: Tue, 25 Nov 2025 15:26:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/pf: Enable SR-IOV VF migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-2-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251124230841.613894-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB3PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:8:1::20)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: be0931cf-5120-4057-b92a-08de2c2ea83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFFQZWtuNkZpR2RSOXZkRC9wVE9vMFAyaFpGdVZhN2lmWDl5S2xSWXBQcUw5?=
 =?utf-8?B?cEtMNCtoMlVKMjhhaDBzUy8xdGFOQXB0bkx5UkVOSzF5YzZjeUx5SVROSnBa?=
 =?utf-8?B?ajZHSmFGWlppVVg5QUxpd3VvVW5JeWpHS1lHeG9OUHhQaFkrdEtWbnZTbnk2?=
 =?utf-8?B?MU5ETG12YWJseDlnSytFV1JVUEJJVUJaekw2NGdxSE5zbHJmTGhtU3FMZjJH?=
 =?utf-8?B?ODgzcUJJdWNwQjZLa1VORE9CSXRZcURLWktidGhYRmQ1eXNSdG1tV2VOWkZY?=
 =?utf-8?B?SjJJVnBjaEoxcUxBdVRTTDg4OXY3Y3F1elBvTXVMTzI0Z211WGEvdGFISmhW?=
 =?utf-8?B?OUE3OEhKTXJsa3ZEQW12a0V6RUhEaUVKd20yN3gveC9CYVpUbUhFTEJWR0xi?=
 =?utf-8?B?Z1JtaDVzWG01YjdybWZTV0dtdFYyUHFja3pzRXByZDVxMHVMTGFJREM1amlP?=
 =?utf-8?B?aW1uM2pkdWxjajBsajdIbWZCeG9UaWRRVHlUemJSaDhyY3FQN0MraWUvbm9Y?=
 =?utf-8?B?RGFMQlkvQUprM1NhQ3l2QmpoWWZCVk8zSEc0WXl5emd4NS96U3JZbVpFdXRr?=
 =?utf-8?B?ZWdQY1ppdlU3MnhHRjlaVEUxL3IxcU5Jam1NNVFUbG5DcWM2LzU2cVNsSmZ1?=
 =?utf-8?B?Z2o4ZW9tRTMyUURvZVB5TXdxdTVpYXhVR2VicXErbTBKTVI5Qjh3bU5EKzUw?=
 =?utf-8?B?citCYlF4d0FsMHBoOGZGWllFVzZTTkVaRldKT2xRK1RKSlhjZDlMeEVpSXpJ?=
 =?utf-8?B?WHZDdEhTTXQ1YU5meXBmWlgwN0dVSUpSbDFSMU9oUnl3dzR2SDh6Sm8yWFYr?=
 =?utf-8?B?b2FjWkpDQlpkSU5tcXc5VWhraEVUM1k1R2pYN0JvVGV5MDdqWEtXc3lVYncy?=
 =?utf-8?B?bUdueUZKNEdUZ0xoUWl4S0xtVWFQMkh0N3RYNmlyS3diUVZDakkybjU1OE1O?=
 =?utf-8?B?MDdMWnJCeGlIb2JyWTRzL2xRSDVxM3M4dW9ybEprNHBIT2FmbW1QRENBWDAr?=
 =?utf-8?B?bjJHYlFqRnlzS1pHRlR3MHlZcmNKWjhPcnhxWi9Zb3VjV2U0N2lJZG82eDhw?=
 =?utf-8?B?VFBDeko4RXJTL2paRE1nMUg4ZDlScTJOVExCbzI1bk5nd0ZZdFd4U2E4ck42?=
 =?utf-8?B?NDVKZ0k4M0JXVDRGV1JHQ1hVdVlJcnh3cEpaN3plREUwQjVPTzNobjVmYnB0?=
 =?utf-8?B?c1puazNqMmZDdlh4c2lEdnQrOURQcjZEd0x2SmY0aThMc2hWdjZWNnhuVk5O?=
 =?utf-8?B?N1BGeVR3S3V2R2sxWjg3aGEyUzM1SXZ4c0lCUm5oQm53cHY5T1BmOG9CcFRz?=
 =?utf-8?B?V1R5R3ZOZGtUV1FpMG95d1IxQmt6WnBCelBJOHhodThpUWFmb3hWZUhXR0ZI?=
 =?utf-8?B?YkdMZDdSMnU4TDJhKy8rdUYzSkhMNUgxM2hkN1pPNjRaVWMvMUZlRTNBUmQ1?=
 =?utf-8?B?Z3diczcvMlVpQmg1N0E4ZDJsTE43TTJ5bFBBZ0g4Y1hyZXUvT1BJbkVXZ3pE?=
 =?utf-8?B?V1A3eENrSGFmakdpOGRsOGYzOHNPWEJzZG5pSEFJeVlObG4xc05ZVTU1bUlm?=
 =?utf-8?B?aWg0aWR1a25CcTRFTTF5clZSd1B2ZjBzSkwvTVBGUkVzMExqNWYzM2dvREdx?=
 =?utf-8?B?NEhpZmlzVGpiV0ZxRjNkZm9KR1AzUjFTdmUzSUtOS0VLTEl3bTZrTGdCcWNj?=
 =?utf-8?B?Rk5GeUN5bXhTUGJPYnhQVHp5R2ExYk5QdEdFTTVMbDgrOG95NjNQZ3p5Yi9r?=
 =?utf-8?B?L2VSSE9CY3dPd3J1MHN0V1NxZStXbWMwaWcwbUxKQU5TbU05cjdKY0loSVIv?=
 =?utf-8?B?QzcyWkY1Qk81ZmE4Y2Fad1dWTmx6NlFNZG8xMHNCdE15VnlpS2J3YWN5NGJB?=
 =?utf-8?B?a2d4cWdoZkUzekNKSkROU1hac2o1Ym0rN3BlQkxhdm1XZGEvb0hlWkh2ZlEr?=
 =?utf-8?B?cnNqUDBDR3F4b3gwNEI4S0V2T242OVdTSlVpNkhrMzB4ZXlqTHJTZ1E0NTdt?=
 =?utf-8?Q?h6W5VcrYUzuGDGyMAEPV9Vec7HjTfI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3V4Y3RtazhrTlp2YTVCcjVyMWNjMmhKek5PTk9qM09WdjdhcUkzZWhJeVZz?=
 =?utf-8?B?UFR5Q2gzOHhXakc1QXNUTC9XcVJyQzZmaGpENWtuUXlrRW1UNnNpREN2V2kv?=
 =?utf-8?B?dkw5a3FYNm9Fakh4NnBxcEwvZHlxWjdSWWFwSy9zdnY1WEJ1VEVFTUdsL2Vo?=
 =?utf-8?B?emJqK2RxM1Vna1JnZFpGaFhORDFJaG9tbjVXS3RDU2l4SDk3bG9QZVU4STBh?=
 =?utf-8?B?dzNBLzNZb0xIWlFFQklKbGhmOEYrSGQ0M3hMWUlGdUtCSlQ4M3huNXhIdFVG?=
 =?utf-8?B?NXJwcXhuWVJDQXpYek1DLzBsL25QSFJ6NCtoNS96cjdEM2V6UUhnMjVhNzJ5?=
 =?utf-8?B?YjlZUW1tcFArcHkyNnBvc0VCcDRrZkVlYys1VTZxVFJQTXFacmNDVk5ic1RM?=
 =?utf-8?B?bE5rM3pMS0ZScTlKUXhZMXdyaEdkZmdMZE52M3lPMDZUT1pUUXd3ZU9qdzd6?=
 =?utf-8?B?a3hEb1FQd3I2ajdMdEg3b2pEVk00M1ovb2V3aGIrY1ZMRWZQVlNoK1VzRTk2?=
 =?utf-8?B?Zkwzcmw5dk1hMEdBQU1kODkvVTIzV2ZMUVA4UGRZc1hhcmZhUWUvU2hmWGdN?=
 =?utf-8?B?bXRVOCtwVUUxNC8wNzk1NHRKWmtGM3EwSGpjT0hTWFozUElMLytKa0ppTVM0?=
 =?utf-8?B?d29XRkpUSHNnOHkzVWo2dHZta0V2azBZUVJKajdDd0kxTHZqS1ZhdUF1UnU4?=
 =?utf-8?B?L0Nhd1RKSkdTcUpSS1B6c1Q4K1UrT0pNc0hITE9ad2FBQ3h6czRGdDVCeUdl?=
 =?utf-8?B?aGFYaEFRNVN6K0tyNUtTdVYydWNnZ0xqM2RLMUtIRzVPQlVackpRc2tvRklh?=
 =?utf-8?B?QlVKajdsaEFqVVRvd0NmbzhqTG1vRXA0bE5pR2NPVGV3L3dCdnZJVjk5ZEdP?=
 =?utf-8?B?T2tWc3p1Z0VpZVpmZ3d0dk0rOU9za0syR1lHUDhwSUh0Sk5MeXJka05heno2?=
 =?utf-8?B?aVhzcVphRHdLdDZTQlVDN3FScnFlQk84djl4aDlnYmkyeng0TWU5NjFZNXBX?=
 =?utf-8?B?RkpzME1JdklpMjh5VDljRDc4S0pDVFh6U2RyTEZZM3drS2RGUVFwMzdFbjZr?=
 =?utf-8?B?QWFvK1pmcGlrSFptUldWc1B4aHNYTE1RL3lPU1lTRThhV0pFSWw5NTdITktr?=
 =?utf-8?B?bXpDWlUzN213WVU4WFhjRFpCakttTFhRTGY2SE50TDVxVCtETitBN1RFcXU5?=
 =?utf-8?B?WXUwbnJzeGxxN3p2eVpySHVxUU9TOE8rSHRwTzhSUXYwdkFGZVdWVFppSWtE?=
 =?utf-8?B?ZWFqOHY4MmxvejRoY0s2c2RZaWkvNlVyWm5laHFONkxLMERtdVltb3RvTGRG?=
 =?utf-8?B?Z296QytzZFVMM3pybXZmYjBHRTU2cW9FTHZDM3J3WmNPL1AwWnZQNTU3cm1B?=
 =?utf-8?B?ZkZXQ0p5M2RyUmdhYzNhV3VFVnl0dUpDTEtFbFBHUy9kVERLUmNKTHFqbTY2?=
 =?utf-8?B?NHpkeExzTmdTLzl1NEltdnV5Y2JWQWJ4ZjBRejBnNFRBWTZHb05RWVFiVm8v?=
 =?utf-8?B?K29GK3FtME03eVN1OE9HampGeTRRajh4VHQzTXBFdWhVU0NudE5ELzcrUnpx?=
 =?utf-8?B?ZFo4VThoNlV1cGZ0MGx2UnBRYUNYMGY2akJqSy92VzJVYm5oNXVqd3crRDB6?=
 =?utf-8?B?aTcveG55MlBuM3J6TlQ1S2FuUHpyZThpemIvZFM4Y3NCb3lZYXNsT1NtNEpQ?=
 =?utf-8?B?K0R1TmY2VzdLeTZxSEN5WDBZOEY3cFZnNEdlZnhjaWZoMGp0V1lYd0JsanQz?=
 =?utf-8?B?Wjl3bmxpU2xBZXdTbno3czlHYUtHcmZaTkk5SWZ5UTgyOVFKWXdZZGcyakkr?=
 =?utf-8?B?U2phY2JiT3NGWElZd1h0MmNSZXhkNExQL0wvQ0xEU09PVGU5VHNaQUUzT0g1?=
 =?utf-8?B?NlNxdzV6Q0J0Y2M3WFNCbUgxdnhKT1djNHJVWXYrNERLZTIzdmRQMlU4NWNE?=
 =?utf-8?B?ZVV2Q1o0NXNXYXk0WmVWNHNQb21hMEZkL21MVnNVTklNMDlwRjJvL2lNakJs?=
 =?utf-8?B?cm9oRWhMbUJybHpKQ0xCdGU2dGlPL3pzNUNJYnZncjJvY2hrU0NVNERZb1NC?=
 =?utf-8?B?U1RDUWs2UHMreERWQUpZaVhMNlpuWWkyRUlBenA2MTl6T3RueXdaOEIvWGFD?=
 =?utf-8?B?TTFDYkgrdEJzSXhSc0FOaHQ2amh3MVVZRVhlYjRQWVFIWE1XTlNBRWZveGYr?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be0931cf-5120-4057-b92a-08de2c2ea83d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:26:44.2096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ng/Z5jZAZu3Hkf6VILXZL9EJNIukagS7ge+iuE6QOTf55FNvyEIu1iyEZb4DWM+Q3VPNqlmQezLv7XEvpqKyWqieinzWt5KyeZY9YvS2LgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
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



On 11/25/2025 12:08 AM, Michał Winiarski wrote:
> All of the necessary building blocks are now in place to support SR-IOV
> VF migration.
> Flip the enable/disable logic to match VF code and disable the feature
> only for platforms that don't meet the necessary prerequisites.
> 

I guess you should mention that "to allow more testing and experiments,
on DEBUG builds any missing prerequisites will be ignored"

> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  9 +++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 35 ++++++++++++++++---
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  4 +--
>  4 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index d5d918ddce4fe..3174a8dee779e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_migrate.h"
> @@ -1023,6 +1024,12 @@ static void action_ring_cleanup(void *arg)
>  	ptr_ring_cleanup(r, destroy_pf_packet);
>  }
>  
> +static void pf_gt_migration_check_support(struct xe_gt *gt)
> +{
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
> +		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -1039,6 +1046,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>  
> +	pf_gt_migration_check_support(gt);
> +
>  	if (!pf_migration_supported(gt))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index de06cc690fc81..6c4b16409cc9a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -46,13 +46,37 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> -	return xe->sriov.pf.migration.supported;
> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG) || !xe->sriov.pf.migration.disabled;
>  }
>  
> -static bool pf_check_migration_support(struct xe_device *xe)
> +/**
> + * xe_sriov_pf_migration_disable() - Turn off SR-IOV VF migration support on PF.
> + * @xe: the &xe_device instance.
> + * @fmt: format string for the log message, to be combined with following VAs.
> + */
> +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	va_start(va_args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va  = &va_args;
> +	xe_sriov_notice(xe, "migration %s: %pV\n",
> +			IS_ENABLED(CONFIG_DRM_XE_DEBUG) ?
> +			"missing prerequisite" : "disabled",
> +			&vaf);
> +	va_end(va_args);
> +
> +	xe->sriov.pf.migration.disabled = true;
> +}
> +
> +static void pf_migration_check_support(struct xe_device *xe)
>  {
> -	/* XXX: for now this is for feature enabling only */
> -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> +	if (!xe_device_has_memirq(xe))
> +		xe_sriov_pf_migration_disable(xe, "requires memory-based IRQ support");
>  }
>  
>  static void pf_migration_cleanup(void *arg)
> @@ -77,7 +101,8 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> -	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +	pf_migration_check_support(xe);
> +
>  	if (!xe_sriov_pf_migration_supported(xe))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index b806298a0bb62..f8f408df84813 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -14,6 +14,7 @@ struct xe_sriov_packet;
>  
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>  int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
>  					  struct xe_sriov_packet *data);
>  struct xe_sriov_packet *
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index 363d673ee1dd5..7d9a8a278d915 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -14,8 +14,8 @@
>   * struct xe_sriov_pf_migration - Xe device level VF migration data
>   */
>  struct xe_sriov_pf_migration {
> -	/** @supported: indicates whether VF migration feature is supported */
> -	bool supported;
> +	/** @disabled: indicates whether VF migration feature is disabled */
> +	bool disabled;
>  };
>  
>  /**

otherwise lgtm,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

