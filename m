Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPERM/K1e2neHwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:33:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AAAB4043
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44C310E117;
	Thu, 29 Jan 2026 19:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TsAayN0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5313C10E117;
 Thu, 29 Jan 2026 19:33:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxBykKD8HiNQ2SqloFfs4JGfOG3hU/IQ7bZ8GPiHz7l3KNMaDKlJUhcSSgre0MgfE4GUi8ykTYY1gPRDrNvXwt/q2biHw+LiIy0xWNazRhj0TlxLoGSxxuUbws5a+Lt2GYZJQqi5Vo9+O4PqjbvmbwuIW1QeGyIvJPMTXb5RVZ70yO5W32UfgPizayLpt+mGVEC/AUsqTObaQqfnICOminpVzfndokhQjIPXIFJiKw69uM3bQdMV4HUbgLXxiakyL6B7G6qXZllIEQ/sJKxOjfh32Jhkfw+Q/dW13OUm6WpmfO6sZ2itzEeSi8+69C37rtx5h39/cD8kdW7ngFw+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqHtPXUoawEQx+a9o2NINHLfyfea3oczwyPtEm9kFTM=;
 b=cqgCbBih+pws5SMzutN2NNUjBXyuVxCW8/hcGe2qXFxWuOjeHCEqzL0NPnlWWkCJGVBBd6qfDXhtc0bwKxMF97gLs4eus1rWKUtttzetpjosL6UxXckd/r4kWRYFa89/NrB1jSXMlXKwLY72Bq+zvB3zUkiPAzjiY+C472iJceQohmSvbMTzVvjGdg5RrQTU+hGxp5AK6UjUlI0aVK9ZJwVv46JBV2kFySMJaOSLf2HuFrZ93WLR/W3bN/cS5nyfgPwbG5xtQCLgIbZY57TmB6/OmUAKYH/OBwpqI4imEK8qmk6+nsy57VSfHuVNHuzVVID2lOnOb5dXuCCfuSvHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqHtPXUoawEQx+a9o2NINHLfyfea3oczwyPtEm9kFTM=;
 b=TsAayN0G4OhOKkbnFEK8uihBdlBTv1Ho/bidjJJjUaUcYousTYfiC54GDGBeeqHmXP+Oo0IBB3u64mmp4IFwvjzdE9vMGb+gf3SAwoM3cqW8T/k2fvJmz3zcXFWMJwvyThft19s5ZGiUh6fmfhlL1iNci3SzBg7O7muNPCzuOW3JX3a1mwRLFTn8useZVpNufkkggRhd1N0/VrYAh2Dw9sj9YXa06bp3F0Rr3wJvDuk5dmIfOMOmDHU2jc6GdAgS6RkIpiX1YUbc6lqUV5JxV5kA97G/kVK/n8wf9yGWbWInUKn7omvZSXIOPYa40h2UqIb5HGEBqab6nrMztkjlIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 19:32:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 19:32:57 +0000
Date: Thu, 29 Jan 2026 15:32:56 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <20260129193256.GI2223369@nvidia.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
 <20260128151458.GJ1641016@ziepe.ca>
 <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
 <20260128193509.GU1641016@ziepe.ca>
 <aXpwecQRovIurYKV@lstrano-desk.jf.intel.com>
 <20260129185731.GA2333318@nvidia.com>
 <aXu05pVbw8EbkRZX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXu05pVbw8EbkRZX@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BL1PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: d13c3c12-0f28-45da-2ecb-08de5f6d346e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEhVTFRJS1JXNE1YdDZVUy90Yis1T1NuTW02YUh2eWFXdTVSZHZhVWk3bzAv?=
 =?utf-8?B?RjFEYkNid3Ira1AzTldjUk9vUTFrb25IWlhVMGhSUU9VZmhUejcwYjc1YnpG?=
 =?utf-8?B?REhaVDByTFBQeElJWkYvYVgxbjgzV2ZDeGZ3U1FrSDZ3K29zYkFLYmE1c29i?=
 =?utf-8?B?bUhZKzM5ZVVlL2hRV2FJTGYwL0hQRVNnSHFMYWNFUjJBaUppT0szSjNlRVZp?=
 =?utf-8?B?NjhYcjdkRG5YVEREM2tqSGhCbVhvU2V0ZDVXcGdMOVFQakNyZ2dBbmRMU3ph?=
 =?utf-8?B?aTh5ZlYzQ0U5SW9GQ2FiMXBNMzVXYjkxVE1qWWtiQTdidnMvNHJpRUZvTE5Y?=
 =?utf-8?B?eVpCQ1gxWXR2S1BBbzBNQnJJMy9jNXZlUjgxZlNKRTZKcnhxdUtFVUlhVVdI?=
 =?utf-8?B?SU05eUgxallHbzllZ0xUR2NzTWhlQXM3VXNtVHVRR2ZmT2xtSlgrTVcyRkMx?=
 =?utf-8?B?TmtrRzlmUCtXeEI1dDFhWXpEWEFkekZTVExrTmV3bG5lWU5uYkwvb29HK05a?=
 =?utf-8?B?czljeVcwYUpybC81eVo4cmVwN2ZlOStSWUR0aERHa1l3TXF0YVBaakpCYmhz?=
 =?utf-8?B?T25uNGdoS0JhekpNaTg4OVUzdk1vNWFKUkh5MXNyeEV6TnUxME8yVktOVE1M?=
 =?utf-8?B?Mi83SjVYUE9NbldEMk9vRGZlcE9kNmFKWTlNS3RWQkxwWmgvSStFNnpidzFB?=
 =?utf-8?B?MUg5NDg0MEZkLy85SE1jdnRQRWRlQTFhaWF1eTYzTnFDaGhMdVh2QVlqNGRi?=
 =?utf-8?B?bWRUMXA5SG0xdmdSa3JwcEtzRm5aREgvc3NGTGN1NlpiUDJyRWhmTjJwSUpG?=
 =?utf-8?B?UWprY09ZLzdicFJMcStTSkUwWDFrZXJCTStFRmxOMllCdjJHS3NySDhSVmZi?=
 =?utf-8?B?cUJZL2NzRjNrVmhxeFZLR0w4NE84R1QvRVZCYTJnWTA4R0xaM1Y5TC9qeXlh?=
 =?utf-8?B?U3g1c0lUMXI2WllwMjlGNU42YmlDMUlLZ2pwQzZzKzJ2SWxIdTBDdjhtczcr?=
 =?utf-8?B?UDdYK1RwS25WQk4zeTlaZGt4ZjVwMWRSQjFBOVdMbGhQckNRRnZuc3p1cC9r?=
 =?utf-8?B?OHB3RkxzdEhpY0RMK09sa2QyL2lSeW03N0dJQ0hjU2NFUk4xcG5aUFdWb1dF?=
 =?utf-8?B?VkN6cnlCWnM0OFQ4TnlMb2ZZMi85NEJyMXd5NXJRS2J0MlpuL25YMmpwY25k?=
 =?utf-8?B?MUJZejUxS1NKbzZRdVJ0di9XT0RXSHBJSXlzYmtYK2EyWFdOdzFLd24vYzZK?=
 =?utf-8?B?L1BSVWZlZklSZVNkcDNIYlo4WmtFVHZSOFJKZnUvUFhMampwZUUrSEFaVXF6?=
 =?utf-8?B?ajI1bG9Mc1ZNS1o2TjlHZ1poVjM0Y3FwWDIzRVEwb3FleDhUdXpsOTNEekdj?=
 =?utf-8?B?SXBnbGRkbVJLaFA0bFRyZTVlK2hVZ2ZNZHpBZUdjL1E5LzRLMS9ITTdXdVcy?=
 =?utf-8?B?VURtTkpHTjg2MGtBSER4NFdodWpFR01iVzZFUTQvWEwwN1R5dFNWeVpzRE5l?=
 =?utf-8?B?WllVNjN2K2ZRbWh1Vm5VWmVpQndEakRzQU1jbTMrNjVrZUNHNXQxYlFlRFZX?=
 =?utf-8?B?bnNwQ1ppenhHUG9KM3pNRUhjOWMrQkg0Mk1xQzFGK2ZNUWVOa0tQVlloRktV?=
 =?utf-8?B?MU5FU2VlcG5JR01iTWRyVEtpeVBKcjgwRzR6enJBV09xa2xpait3OENYVW5u?=
 =?utf-8?B?a2xFZkJEdTBXYUthUkVDQ3dFdzFZcEtnaGZWcVcxSitFdnR4UldScjVjMnhV?=
 =?utf-8?B?d0pHb3JtYjREK1JlajIvKzYxcWdQem5KSzRUUDZqa3UvYUx0SWptdUEvUWR0?=
 =?utf-8?B?OWN0eUdjU3J2RHhqVWJSVWVKVGhmYVE5eEw0WmkvZXVvbDMvVkEzV0p5WkZ2?=
 =?utf-8?B?ejViTW9acFBMQVJWa0MzazVOOUQxUnUxdzhOdXhXWTlFUXhiZlJEMmk2Tzkx?=
 =?utf-8?B?N2pyNjZVRHdGb0F3ZXlSbFdadGFORGx5MHVTeUhPeHlmRlRZU3VxT3pKSFIz?=
 =?utf-8?B?WnRXb240b21ySHJPbWRxaDVWdDJvZE5ZNzBUOTk4cFo4b0xKQjkyM1pxZmFh?=
 =?utf-8?B?aGRRb2ZjbE9zOThFdDM3WFVwNUhJSnlnaE5LQzIzUUFQUEhyZllmMCtiM1dQ?=
 =?utf-8?Q?aaJo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VllJTGpSMVlIa3pTSHdqTmdRYmIzaUQwZWFYdzhEZWZwcVJ0UHJ6dFNLRndu?=
 =?utf-8?B?Y1VvVkhjWTdwMEdJUmdHSmwxYjN4K1BOU0x3bFBHMWZ1ekNURUNicnNjMDRa?=
 =?utf-8?B?Z3JlbDlYOUNva1U3c3dLKzd0Y0Z0anhnMjFwcUQ0VXZ0dDdydkI2NW1CL1cz?=
 =?utf-8?B?TGpmNDhPWlZmQmJKNzhrRFp4UHNVWER5QVFGbUZHWHd1eFZrOFFyN1ExU3RK?=
 =?utf-8?B?dm0xbTU5UXRkRXJUTFpyM0grelZHYzJMYXhoUXRNKy9YbXR4K2h0OTZPTzUy?=
 =?utf-8?B?aWFsWW95VmRJZEMwVVZ4Yks4bWp5aDFiVDFYZitLcUd0Nkl2OVJZblRCM0c0?=
 =?utf-8?B?OHdKRTVNME1QdCtoY005S0Z0R1JWMXU2eTZwQkUxcGg1ZDVCTHlTc1FycTNL?=
 =?utf-8?B?c2FkTlNVSnc1clVyN2pXMEw3eGUrSnNLelM5Y1BZRk9LLzBzSmE1ZkwxZHlw?=
 =?utf-8?B?SkIzZG03UFhSekxTczZ6elhJMkFZOFgwVmhSYUJ3S2tiblUzYkVYMFdHbG9H?=
 =?utf-8?B?UWlWcnFmekFEYjBGelZpdFdCUVlLeXIvT1ZrZzlIQmNON2NvOVhNbjJhZnZ3?=
 =?utf-8?B?RGIyUm5zcnJ3bWpBckhnWkNGUEY2SDhEODlFdzhXbENWTDZlVkplS1dlVVpL?=
 =?utf-8?B?d1BIMEREdkFIMitMeFlUY0t1Q25wdm9zejQ2QUQxV3lML2JaSERrSDFmYVNi?=
 =?utf-8?B?VFZnbTJKb0czQ1JuTmREdDl2TVRLWmkwQlczNHZmUkFIMmwxbUMxcVQyazU2?=
 =?utf-8?B?RlRoeG5PM2U3dnQ5TXBFcmY2UURJZzlQbzNSbEh3WTV5c29aWGU3aUt1K1Jz?=
 =?utf-8?B?RUtGN0JQVnJvZjZ6Z1NkNFdFa0V4UXU0bVBFbGZxaXJTeVZ3WEhNU1dCSExZ?=
 =?utf-8?B?Qlk1ekYyZ1JVZ2xLWXZjR0lHanpSeURFcERJOTBraU10TmpBbjhNQ0wvZkta?=
 =?utf-8?B?V3A5aDhiRFZCNU80Z2Y3bmdCOVlJZ1pNYjIxTUE5S0ZMYTZYZ2hYeW05Z2pS?=
 =?utf-8?B?NW5Sci9LTTMrUEpvWmdnV2N4d0src1VIUE4xUDQxQ00zbDI2d2d3akZvclpq?=
 =?utf-8?B?VjR0SjhMVnl2ZlNhQ05WVzhUZHRoR1Z4c3Y0dG5YOGJJT2NoRmdKYWsvdXV5?=
 =?utf-8?B?UUFhRm90U3FWUUlKWGEwaW9hRzhCa08yUDdSNFdjVnVmZ2U0bGdhSytlQkpu?=
 =?utf-8?B?bm1UdW1iK2JhSWllcFIxTkplYy9mTFkwZ0ZTcGFqWHhVVVJLaXU5bWJGRHJt?=
 =?utf-8?B?Uys5Y1hBcFlJclROQ012SE1hQjcwUTdScFE0K3JWTVpWQ0p6STV3Q1YvV0FB?=
 =?utf-8?B?a1RNTEk5RkQrcyszY29uRW9kZGlnbGk0NlVPQWc4NWljOXJuTll4bkhYcHhv?=
 =?utf-8?B?cDdtMmtRYm5jTDZFajl0a1AvRE52a2tTWW1DNnFZN0RIcW9vMnFBeDhERmph?=
 =?utf-8?B?ZHlsK2ZIeEdraXpBU05xNFQ0Zk4vcjkzYmgxQkdDS0I3NVpCL2tlQ01sZTBl?=
 =?utf-8?B?UnYydDJLVStncm1EVmk2TXAxc1NFK3R1TTlMR0hCYkJoMiswQVZ4MktITkhQ?=
 =?utf-8?B?Z3dmWGxyNHpBQkgzbVczYjlCMW00bFRVZjRxQTlkTzVLTHg4YmJqUU5QTm52?=
 =?utf-8?B?aTlBM3ZLaWgxeENJOERFR3puL2xldDJINUp4TnoyeXM4TVpkR0wvd1hpVFhj?=
 =?utf-8?B?TlJGK0ZwUDZvMnlLVDNCQ2taeXp4YzMwNG82dEJlYmVFOWYrSExhY1ljZFAr?=
 =?utf-8?B?MjNad2ZUZTE4OXhDa2R6SHpsN1RhbFNJK0ZsNEV6NXVtdFBXY0Rvb3JWNCty?=
 =?utf-8?B?TXNBTG1ndUlmakMyaXZsZnhSeU5EUXVQUGxFcllGOTZZMTVmdkYzemxvbjc0?=
 =?utf-8?B?d3A2YWNndW5sWVdGZEZvUUc2UW0zd1BJNUNtdExhMEphTXl3U0lXQTFWYytx?=
 =?utf-8?B?WVVpcFJtZzd5enFVbzBnNHpKTWovbjlGZmM0SDNwOG5RTHFGcmhLSDhQdWxz?=
 =?utf-8?B?cFdEU3UyUXJDMkRLQ0dCTS9PdWljTzFJSTYwWjhLTExCUURUTFJRL1V6R3ZR?=
 =?utf-8?B?alJ6WTQ1WVNIRjJzb0x0TmV5WFZ5N1VOUEJ3RWlXUDBTNTZ5dEdrbzlSdWh1?=
 =?utf-8?B?N1Z4aVJRY256YmNTdGdhS3VMYURMWGFTcUZYMmNRb1JOaDY4YmlEV3VFMG9v?=
 =?utf-8?B?bWZXZGRQdjBmNk85b3l4YnJ2OEpNZGVzQmNBU2cwZndDWm15OExtTithdGJn?=
 =?utf-8?B?andOclhpc05neXZ2S0sxaFJKMjhRTUxHbWswZmpBakxpZmtkZnFtREVwVnox?=
 =?utf-8?B?dXJrVG1oU0VSMFh5TlhkOTF6ODVpaUNwREJGdUFvdzdVVEg1c3czQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13c3c12-0f28-45da-2ecb-08de5f6d346e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:32:57.0348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USZNf7Xp37gnJ797IgikJdaTIYxU5Pk+v2h94OHAE7nKfKSWoOVFloNISCzJe2DO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 35AAAB4043
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:28:38AM -0800, Matthew Brost wrote:
> > DMA API is already bus agnostic, I think there is no issue to plug in
> > a ualink_device or whatever under there and make it do something
> 
> I have thought about this, which is why our idea was to roughly duplicate
> the DMA API and layer it almost exactly the same. My only concern would
> be the semantics.
> 
> dma_iova_alloc() ← This is reclaim-safe currently, AFAIK.
> 
> ual_iova_alloc() ← If this allocates GPU memory for page tables, it is
> basically impossible to make reclaim-safe (i.e. call under a notifier
> lock), avoid dma-resv locks (i.e., call in map_dma_buf) without
> subsysem-level rewrites in DRM for allocating memory and driver-level
> rewrites of the bind code / for Xe, Nouveau (likely Nova), and AMDGPU.

If GFP_NO_RECLAIM is your only issue I'm sure that can be delt with.

> Then of course dma_addr_t now means something entirely different from
> the original intent.

No, dma_addr_t means an address the DMA API created for a specific
struct device that represents that device's address space.

There is no issue to have a seperate address space for a ual_link
device from a pci_device.

> DMA API, as I believe it should work aside from the semantic changes and
> perhaps minor tweaks to go from struct page -> physical address over the
> network.

We got rid of struct page from the core DMA API already..

I think your biggest challenge will be to describe the GPU VRAM in a
way that is relative to the ualink networking... phys_addr_t might not
cut it.

Jason
