Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJhhJdKOeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:09:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6A927A2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6115B10E50A;
	Tue, 27 Jan 2026 10:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PoM/OVwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010025.outbound.protection.outlook.com
 [40.93.198.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A71510E04C;
 Tue, 27 Jan 2026 10:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaYY/iqh1na+LKtImm9Fwo59BQSrDogSH6hiSf1MlvOOq4XrGLkhEHhfnZojPpeMwDG83Ipokl9aNvyO45eX6oVsaawM7K+/oRtJM52/ntc5RnaW/Hsn/QQWeXCc7RKJTF9xVA+VbhAQyERCeY3A3QWaOsKz96Wvwd5UO9ZJoOH5O+b/yVvTulBuvk/64K/btx4T++jy0xqPU9hx+wm7IhNVcMxtISndwgUvfiMipqcuuXQ0HG3adBFDs6vpcQocvNT30BOTk4uQEr5UUMTaMgnwgHmD8TYrkA3PzGo2mW8QaP/3OlepAYPbfIHUdkP0SdKqSodOCojkeZ/EJ3yrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUA/HOxp9Wyf4FnEnWve7IoihDin8tQ+CkPsnLsR5us=;
 b=zP4+XWktdr/Vsn6Ms3Mtud/xq/XV1NhXlglofdzpdEYx8G77HUoc/CgXfR9Cmi3dVbFXCXfW1Gez7ht+UDEgZLTZIo/78tLmxidpUQs6DN6+rTfbK3yQ6cs1j4UmA9oTgNs+0JwAp1a2FXcMLTdnIub2+GyUP2g2tkBkouOFapc/aQlfdJwodweBhhHHg3Pv3C2Y8hXeiTYfPFJDqpLQ/BUtbj4WMdzL1JLnCNWLyX81vvV+AY9LB3SBjvEvuKuNZ6GCcgZua00KbCRKoizcAPCBS4MgXkgm2RM+mhX07l7Iriv7YmjzL8VJw/Rb+8SZ7KNkMOsysnQxNPBtXZg9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUA/HOxp9Wyf4FnEnWve7IoihDin8tQ+CkPsnLsR5us=;
 b=PoM/OVwvHxoJPAXshsDrTc2BXU5VTnKvi0bGOciAH24KnEziNvxzi42NKUWuPX0Iuk0TdggKe1QvYIERdxJ2IcqSjKi81g6k6HmVBk/Fak8G3Ctz7giNlgj+asf/sSYRyR2sB1IE52d9X4wv7PQK0rdpz5JkeLZKdIp+xto3/sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:09:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 10:09:16 +0000
Message-ID: <2b187f72-36db-4e54-aaf1-bb5784786845@amd.com>
Date: Tue, 27 Jan 2026 11:09:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] amdgpu/ttm: use amdgpu_gtt_mgr_alloc_entries
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
 <20260126133518.2486-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260126133518.2486-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: c1eb6b73-f867-4381-a83e-08de5d8c20dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjNad2dRbHJCMnk2R2puaktxNVVuMC9EOU4rZ2Y3emdzalp3R2Z6dFpOUUdX?=
 =?utf-8?B?OUdZajhDMXN0dVZrVUlkbXROaStxWUkxUEZsTWlpSUxXN0V1N3gzemdDL1lR?=
 =?utf-8?B?cjNnekI3dEFEcm5lSW5jRk9FdEMvNkEzSnp1Zko3RnpmZUtIcHBwTEdwSExH?=
 =?utf-8?B?VzVUVlltSXpmM2FxdzA2QmdscW15MS9hTjNzMlloVTlCUjYyUWN6d2hqNFZl?=
 =?utf-8?B?SVBxeW94dW1sT2c1SUI5Sm9TMnV2dG1BZERYTHVmS0xzYSswWEdPZExGYVg3?=
 =?utf-8?B?Mm9LWUkvY1k5dkp1QXE5b3krTzZNcWpKRDkzUVIvN1ZXYWRmQ0hCOUVTSzBZ?=
 =?utf-8?B?K3FKcG1LMFZEa21ITURUc2VUSjYxRmpUcU00ZTE3WnN0S3YvWDBVNEFZcEdD?=
 =?utf-8?B?RVFIZ3ZnYVNsRkw1SE9DYlJtT1lHMzJpaFBFV2NkbHpkRkY4YUlrdE1ETGE2?=
 =?utf-8?B?bGhiWGR5VDNyTE41cVIzVkhFbDIvb0ZSTHFKYVNJZXgyQ3NMek5lclRtUFBq?=
 =?utf-8?B?Wk5HQmVCdUFDMUJxaTlWaDVEeXR4Z2RIdFhwY1dRMDBSM21RR1V2OTdrQXFP?=
 =?utf-8?B?Sk9PbmlndUYveUc4SjBTR29GNTY3RHZnTFlTZUppOHRvMXMxU1VhUk5JTzlY?=
 =?utf-8?B?TyttN0ZIcGplTnB0Qk53YzJtL0Joa1JyS0E1T2xqYzhyMGl4TkVGVU5POHpt?=
 =?utf-8?B?VXhiYjd2ajNCWW9LTktHaEMvMTJpM3VvVDFFKzhZSUw3T1BYVnFPM2VKTUxr?=
 =?utf-8?B?cFZvRFRnQlpjcjgxSlE4WU4wM0ZKWERxMndNbGZYNXdSanc5QkZPeXBDVzBP?=
 =?utf-8?B?bXBwekEyNFdUTGNLU3NvaHdKQXlwYjJtSGJKN0ZqOHFocTc4RzYrVmNxeEpj?=
 =?utf-8?B?RUVYVkZXMEErWlovWHRmdlZqZTVTY2lnRGdjRHJucXRYSmxjNzhGRHZmNFQx?=
 =?utf-8?B?TWVMbytCejhzdC8waHB6UVRXcWFpSGZpbEdPOUNZMUxvZTRaMllSa2lqQ1Zx?=
 =?utf-8?B?OTFKWFBJQUFLOXFtME5BYlY0a2hXMDA5MmV5YStqRWcvenpJT2ZBUDJ0NGIy?=
 =?utf-8?B?UFB2UFZJdGZ0YWE1N1ZoQkxHK1B0bjZrb1FyckN4NVdmc2cxcFhPeXBaVUZ6?=
 =?utf-8?B?OTJXaytNZEtTeURRNUFreHNaMnB3c0t5NW04b0VZODJLTTB4ZnE1dEZmN3Nq?=
 =?utf-8?B?VkN4TXovY095SzdBQjRFSlpjMjFuZEVXc205R2dHY2ZMaG8yVFlxbzRFSGZk?=
 =?utf-8?B?NXlHMW84SDVKWkR3cEZQUThXdWVYMC9INU1OdFdzZURpNVZCMkIvMHdibGFO?=
 =?utf-8?B?Y1Z1V2w4MENDWTZrS1FTT1RLMzRSdFRWVG1vdW54WWdhVGJHR0t1TlhWbGVy?=
 =?utf-8?B?bEgwekxkL0hyMjg0TXhlZWtSckR2SGhtb0tod3NiMnE2MW80bC9UVCtSS2M5?=
 =?utf-8?B?SzE5M0tkR3FUNC9Qay9NNVhDZ29IcFVWSWtXbnZBS0M3SkVKcHB3dEFnYVJI?=
 =?utf-8?B?RlpodDYwMWUxODN2eU8vdnRlRHprQm1NTHF3eDBEdXZZN2g5S1hNUGxGQXJ1?=
 =?utf-8?B?OGd3SUxhOUFUZjdPamxYWUxxQlI2cnU4UW4rY0JXVnp0S2RKWXhHWW1CTXkz?=
 =?utf-8?B?bFpDZldjTkZBZDZFSWptb05qQzBieVBhSVVKVWE1TWtUOGorMDI1NjduZW02?=
 =?utf-8?B?K001Y1FyVUdoUUlrdFJMdm5lSlFFRzZ2Ym9MSnhjL1BXdnRJT3N3cTdFR2sz?=
 =?utf-8?B?M21leUFSaFZGdFRpNXFTaXhoSjZjU3hXbXQvWUZETDRUTlpjMzIyQlRtbEJ0?=
 =?utf-8?B?TkVvVVRiZlA4WVBhSjhqWE93RWxhWWg0M0ZiMlpMbHZuOE1aV1l3aXdpM1Ji?=
 =?utf-8?B?a0N4eUdQVWVIaWVjT2ZXenozNjFpK3FCblhCT0Y4Tm1qaDMyQ3dJcCtNY3JR?=
 =?utf-8?B?eW16M1JkTFM5WFBmMHVDTk9JaUROUUFtMTFSRDJWOVcyU2p5a0V4OGRSUU42?=
 =?utf-8?B?cFNvOXhZazFkM0pQWGZSQklNUEVsTFcwWUlBemdoSTE2US9FaTZWYkRXRG9a?=
 =?utf-8?B?ZWw3TmoyMEI1dWhUUzZ1NHVhcThmcWFhaDl6bXdJSFVRSzZIejlDRkl0OG1s?=
 =?utf-8?Q?VnJo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW53NzRGLzU1WnlpeTJxRWZWYWtCTjhnM3prN0NqREs1K09tWFd0QTdCampJ?=
 =?utf-8?B?V3BZc3k4cnBpMHJEdW54M01LYm5sczJIakJ3VDhxL3k0bHhvT3VLTnltV21i?=
 =?utf-8?B?UEZxbnhhdWVwNk9rRGEvM05qWTBDY0N1dDVwU21kNkdaM3RUZ2JiTlcxeFRS?=
 =?utf-8?B?Rkl5OXYwMHlQa01zQTE5emg5ckFnQkJKazVkOVpSMjNNTVRBV1BoL2RhaXBh?=
 =?utf-8?B?SEo0YU1mQmdrT0tmTU9Tb0RYYXdvUEZjbVFCRU84bGhwaGFDNUprUUZ4a0NZ?=
 =?utf-8?B?c0VnZFJnOWJZbGFuSDlBNExHZWZoNnFRUjJadVgrQ1gwUUlFNDh5V0VPNW94?=
 =?utf-8?B?Q1JHRGhZb2dBRzNYY1hvVGdTS1dTUDhBY3JSQjJBWVNYditHNGlaSFFqYndB?=
 =?utf-8?B?dXZPNHFqNDJqVVdJK2ZMREZ2bGoxT01xWi9renlNbUkvZ2R2Kzhwd1ZBZ0M0?=
 =?utf-8?B?QStzQXBBV0t6TGEyWG94aVNsUWEwa3R6SWw2SVF1ajQ1RURnQzdJMnc3Q09w?=
 =?utf-8?B?Qy9PdGt5bktSVXZRMVE2ZjNsNHFSUTRmSTZmOXJiZ0FWaml1VHd5ajlmT25N?=
 =?utf-8?B?L3dDTEJoYWs0MTNTcm5CVUNzeEpoQVM3ai9GZ2ZLSkRkdjdTRDh6YjRNSnNJ?=
 =?utf-8?B?a3FIUldrdjJyODNleE9LRUlObndXVVJsYjNPWmFMWjBXQUVmZVJGdm0vOXBh?=
 =?utf-8?B?NlhFS0VvSXhBeE9BVVBOKzExTkUvVnJHdlRadWxQa2JqQzVEV3M1c1dKUGYv?=
 =?utf-8?B?VlhTMjhpNE9sSzl0RndmZzd0cFl4SkZSTlZlblFYMkxzQ1VkeUZTeW1yZC9h?=
 =?utf-8?B?Z291YjlwS3NjNFlhcGUzMXlnVGJpbHNiM25ubGZWSWR6SHVYNDV1MU5aL0Nq?=
 =?utf-8?B?RTBKSURISmFnSVgzcG5KNnBMd01nNEk2dEhLK0wxL2pnRWxCMEZkK0lNanRx?=
 =?utf-8?B?VmdYK2cwNjVZb3RZOWY4MWZQSm5hYld1YndkR2s5TFNsb1IwbTU0RjZnUURQ?=
 =?utf-8?B?YzlVVTJudnF2RmdWNTN1L3FZZnJSUzM4U2RBL25vNGgxNnlwWFJoRXNzRVYy?=
 =?utf-8?B?cUN0Rkw5TkxSdVFFMU81KzFzRWpORzg2Y1J2VUU3MFdWY1JmMzZ5M2poK2l1?=
 =?utf-8?B?ZStGdzhjUUdmL09iL2x5SEZlYlhhVFdGcmlTK1FkUUhWNXhSbjVrTGJvdllY?=
 =?utf-8?B?Q2NLVlRocEFSTTVuSmp1N1kxbXdDZXdaNDNyVHllODh3NVhPeGprZitqTG9k?=
 =?utf-8?B?MGhtZEV3ekhtTVc2TENHVEdNaGtMZk9BYkM4WG1wV2FxUC9qcnlSeDQySklP?=
 =?utf-8?B?aHQ5aUpwQU9XcSt3dU94MkY3RGdlVWhEMFIrOFFKTVRRUng3dlNTY1UxS1k1?=
 =?utf-8?B?Y3VRRm8wK2tQWVZBcENOYjZraTYxZXozYlF2eFJ6SHFrV3pHM1g4Y2UxckVL?=
 =?utf-8?B?SXpVMVdibFp5YUhPcjZkY3JVZUpXVXpVVWJQZWw2d2krdk9KNEN6bVBUS0o1?=
 =?utf-8?B?S0hOV0t3emFqNFhRb1lJQVR4QXVkdFRVZW84aWdVNlNuUjhuRTgwYUtEaDkr?=
 =?utf-8?B?VjNOQTlwQmFrUDQzeElaZEh6NWZuS0g4TlFnTUVJQVM5eDczV3lYM1FaTWdl?=
 =?utf-8?B?WlBuVVRLSjRpUEkzdGtFOXh6b0g5RE5KQ2ZFclRYcTZHb0xCd2Y4S3BZMGo2?=
 =?utf-8?B?d2FpaS9HZnJBWDloL0d0b0NQSS9RaGNWeXI1Tk5uTFlrSm0zTzVLR3pPOTEw?=
 =?utf-8?B?RW8rVDVHZVlJRGxnamswSHU3ZGoxclBvZE92V20xaXkvWWVrS3FkeVNFcXcv?=
 =?utf-8?B?SlIvVjJSOUV6bzJpcEdPbExJOStHL1pLejZCYlJxcFpTZmtrMXpoQW9JQmVn?=
 =?utf-8?B?d2FoL3pKamxFN0d1T3ZGSmJlNXhmTzBuWnIrejNJeEYvUXdlWElvMlF5Nngy?=
 =?utf-8?B?N3RhdXphUi9YOVVXRUU4c0xaOGNtekllcS83STdzVlFsNGthb1ZLTGJ1NHZy?=
 =?utf-8?B?MTNONjFmdDNNanhNeEhQY0poZ2l5QWhnbkI4N041alhEUHpDWXZaaExNd2R3?=
 =?utf-8?B?anBIYkFmeExma3lnR1hWRnMyZGpabURreFhSMVVqeVhoM2ZtN1NaS1FHZjVO?=
 =?utf-8?B?SE1mdWVJdysrK1JLTjY3Zi85Sll6bEpEd3F6WkZUb0RMQzlnMnJ5UHgrSkhj?=
 =?utf-8?B?aEFWN0Y0YXhqNTBOdnRuYVI0cEpkZzlOa25lcUtNeFloYVZVQVF0Q2d0eHB5?=
 =?utf-8?B?QnVpZmRweU1ILzJJOWRuL1JId29YMktCQVo3RnppNEtjYzZSajFzL3B5aVVa?=
 =?utf-8?Q?cOG31finxpRc6fGNCv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eb6b73-f867-4381-a83e-08de5d8c20dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:09:16.4106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHfBVZcLxpTBGuSJhxA0R1/tFs8ZB/YmoukJlOFSd71oWfsb4dq1xsoO3s8nNbrC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 4AA6A927A2
X-Rspamd-Action: no action

On 1/26/26 14:35, Pierre-Eric Pelloux-Prayer wrote:
> Use amdgpu_gtt_mgr_alloc_entries for each entity instead
> of reserving a fixed number of pages.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 66 ++++++++++++++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>  2 files changed, 43 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 8b38b5ed9a9c..d23d3046919b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2012,37 +2012,47 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
>  	adev->rmmio_remap.bo = NULL;
>  }
>  
> -static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
> +static int amdgpu_ttm_buffer_entity_init(struct amdgpu_gtt_mgr *mgr,
> +					 struct amdgpu_ttm_buffer_entity *entity,
>  					 enum drm_sched_priority prio,
>  					 struct drm_gpu_scheduler **scheds,
>  					 int num_schedulers,
> -					 int starting_gart_window,
>  					 u32 num_gart_windows)
>  {
> -	int i, r;
> +	int i, r, num_pages;
>  
>  	r = drm_sched_entity_init(&entity->base, prio, scheds, num_schedulers, NULL);
>  	if (r)
>  		return r;
>  
> -
>  	mutex_init(&entity->lock);
>  
>  	if (ARRAY_SIZE(entity->gart_window_offs) < num_gart_windows)
> -		return starting_gart_window;
> +		return -EINVAL;
> +	if (num_gart_windows == 0)
> +		return 0;
> +
> +	num_pages = num_gart_windows * AMDGPU_GTT_MAX_TRANSFER_SIZE;
> +	r = amdgpu_gtt_mgr_alloc_entries(mgr, &entity->node, num_pages,
> +					 DRM_MM_INSERT_BEST);
> +	if (r) {
> +		drm_sched_entity_destroy(&entity->base);
> +		return r;
> +	}
>  
>  	for (i = 0; i < num_gart_windows; i++) {
>  		entity->gart_window_offs[i] =
> -			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> -				AMDGPU_GPU_PAGE_SIZE;
> -		starting_gart_window++;
> +			(entity->node.start + (u64)i * AMDGPU_GTT_MAX_TRANSFER_SIZE) *
> +			AMDGPU_GPU_PAGE_SIZE;

If I'm not completely mistaken the GTT manager works with PAGE_SIZE and not AMDGPU_GPU_PAGE_SIZE.

Background is that we can only map CPU pages (4k-64k) into the GTT/GART and not GPU pages (which are always 4k).

It would probably be the cleanest to have a helper for that in amdgpu_gtt_mgr.c (or a header).

Apart from that patch looks good to me,
Christian.

>  	}
>  
> -	return starting_gart_window;
> +	return 0;
>  }
>  
> -static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
> +static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_gtt_mgr *mgr,
> +					  struct amdgpu_ttm_buffer_entity *entity)
>  {
> +	amdgpu_gtt_mgr_free_entries(mgr, &entity->node);
>  	drm_sched_entity_destroy(&entity->base);
>  }
>  
> @@ -2343,36 +2353,42 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;
> -		r = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
> -						  DRM_SCHED_PRIORITY_KERNEL, &sched, 1,
> -						  0, 0);
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
> +						  &adev->mman.default_entity,
> +						  DRM_SCHED_PRIORITY_KERNEL,
> +						  &sched, 1, 0);
>  		if (r < 0) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM entity (%d)\n", r);
>  			return;
>  		}
>  
> -		r = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
> -						  r, 1);
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
> +						  &adev->mman.clear_entity,
> +						  DRM_SCHED_PRIORITY_NORMAL,
> +						  &sched, 1, 1);
>  		if (r < 0) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO clear entity (%d)\n", r);
>  			goto error_free_default_entity;
>  		}
>  
> -		r = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
> -						  r, 2);
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
> +						  &adev->mman.move_entity,
> +						  DRM_SCHED_PRIORITY_NORMAL,
> +						  &sched, 1, 2);
>  		if (r < 0) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n", r);
>  			goto error_free_clear_entity;
>  		}
>  	} else {
> -		amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
> -		amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
> -		amdgpu_ttm_buffer_entity_fini(&adev->mman.move_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +					      &adev->mman.default_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +					      &adev->mman.clear_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +					      &adev->mman.move_entity);
>  		/* Drop all the old fences since re-creating the scheduler entities
>  		 * will allocate new contexts.
>  		 */
> @@ -2390,9 +2406,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	return;
>  
>  error_free_clear_entity:
> -	amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
> +	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +				      &adev->mman.clear_entity);
>  error_free_default_entity:
> -	amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
> +	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +				      &adev->mman.default_entity);
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 871388b86503..5419344d60fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -56,6 +56,7 @@ struct amdgpu_gtt_mgr {
>  struct amdgpu_ttm_buffer_entity {
>  	struct drm_sched_entity base;
>  	struct mutex		lock;
> +	struct drm_mm_node	node;
>  	u64			gart_window_offs[2];
>  };
>  

