Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A1mFq2inWlrQwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:07:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F37187649
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB86610E57F;
	Tue, 24 Feb 2026 13:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zCmP1tAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B8910E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 13:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2+BPh6bYs+hBkuWStFo6WfA8Z0v1A4J3po8E/MVUmicNX5mdJbVs8c3rUJZygYsOK2YpqEya/lw5FGaafX0CkHYri8eDG54sqlpf2n7Mor9S1eA3+GqRJijC6ouu5cNxyg86y7LoNRMpQwKJS76hldRR3/JxqllNN4SONd0id+Ra03jIPnNmr6pv7YB6DdgJecuPBJOCBaw+V9swW8piHsA/77aJ3LpHqHE4YUxb9h/wMbYQm9pu9c4UFAnapcTuKo2GahEO6mWETCmEl0AF5/8YGDdiWpfAY3/XZYVtsTzQ9P6sAKHhZ8L2ol6qyfCLcTjFmdoPKsc8iNns3WZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l0YHXwQonVQFhUZJn1NqJPcN5ozVz6RffWN9kH5eTw=;
 b=EFjKJflLG5veVylRPK83bdrBfT67anFuulMw1aOoBoCZNKvgS+bJgOAUxIGY2q07nnOGECDGOf6cOhuhPAh5q1Opa7v9/RIszCSMN5kZfN9Bw1fZ8AOz7Kd8qOFU5DIsn+a8Wi1E2BmLmDZOukdL5FKOVAMAPFvTYmiQnOFeo+WTDTzPWLXkKAOo1fCnUaR0PymXY/9Vn7icaP26b2/ZZNSrZ6U7nueHsIgl/Gc+6YbVJD8bvGdxmGL/b36aP97vGsxq+uenvX4063hXAlnwD+i1w8d4Tav7F+fqUCsjj5FPpxmv6hMBqyR8U+qLhsAjWJV7uYNTV39Isv65p4+E0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l0YHXwQonVQFhUZJn1NqJPcN5ozVz6RffWN9kH5eTw=;
 b=zCmP1tAD/b0gMPauMKBJEIGvkxEu3SEmSnBNCtzIiBA/FOrLEAqWHZYPtJB/1JPaUXprwLwyG0P8L7pmrWghg7UFy1fVMktq9jxI2TOuUEWxEBA3vSMgX1m9a/a/prsmw4G5o53PL2qmrUrGXQ48eCymT3QFYEDjcJz36xI3954=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by LV8PR12MB9182.namprd12.prod.outlook.com (2603:10b6:408:192::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:07:50 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:07:50 +0000
Message-ID: <37386f3e-8c4c-44ee-9268-aa589cd9e469@amd.com>
Date: Tue, 24 Feb 2026 18:37:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
To: Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org
References: <20260224110310.1854608-1-mripard@kernel.org>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20260224110310.1854608-1-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::16) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|LV8PR12MB9182:EE_
X-MS-Office365-Filtering-Correlation-Id: 0715172b-c369-4737-44b2-08de73a5b63b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cStEclo2MDJadXdBS0dueGhKdUZmZ0hYcm5SMjFEdE43SkxPbGNxd1F4c0lR?=
 =?utf-8?B?K3RsdE9ZbmdWQi9pa3pTQnpqeTZ4cCtYRUFkdDQ1dmZWcGFoTFpBUllOaGlw?=
 =?utf-8?B?TUNhMVlTTHRtdFpMWml4bGJEdUdwMXJpSXZHallsTE41U1I3M20wTFRXVEdD?=
 =?utf-8?B?TjVDcUpLWWQ2aEozMEpCQTYvSmM5NGpidXlBUHlCekFwZVBjV01sRnZtUDdj?=
 =?utf-8?B?dU5ubS9halB3UlFVa05sV1h6WjQ1S25EZTREYk9YZUJaRzlzVlBMbnFxdCtJ?=
 =?utf-8?B?WGVDNWdudUhMVU1ITWVYdTllT1AySElMNG4rTkIxd0RmNkJRUFV5TEZubTRp?=
 =?utf-8?B?clJCRWx3dDhHVW1zQjFUN0QxZDhtTjZaMEkxRFRYUnVhSFRnNk1TbU50SGZM?=
 =?utf-8?B?RUlzdFlCdkZreE5wU2ZVKzVyeGFNRVRYdjR1M2tqVDNlaHlJWWRyaFVTL3BN?=
 =?utf-8?B?WHczSThOM0hyM2lYNVNUNVVLdUVaeEd2c3V4S0F0VkVlS3dFT3lpb1V1ZFNR?=
 =?utf-8?B?Tm1PNnYybldnbW5sNjFXalNzRzhzTC9VdThieTZ3WGZRdmZLWG9zb2lsbjBi?=
 =?utf-8?B?a1ljMEc4Z3E0WmhBR2s2SXJjOU4yYUQzU0pWSEgxZEUzenhJSVZlcGpMZWJl?=
 =?utf-8?B?aS9kYmxGT0hEWXFMZkZLdVpnbFJFMTl3UE4xdzBoVVFZd3ZRakZ0emJlNjJn?=
 =?utf-8?B?ZmtQK29vUnVJa0tSQmlxVHhiUkdmMUY0Wk5YODdlbi9lNitad01ZUUdOaWZk?=
 =?utf-8?B?SHlsMk51bm1UU1RhWEZ3RjZBS0VTY1Z5cnh2WGozZllyVTljeGduTExzSzAw?=
 =?utf-8?B?bmFyVTJEUWYvUmZxbFZrNjRIdTlhdGxqai93UTNkUWJmVGs0WldTWlI5R01X?=
 =?utf-8?B?UGpzQmlTVk5kY2JucXRSTGlGQjFlZTdwZmV2a2EyVldydm9lN1BEMEc2RU9w?=
 =?utf-8?B?dUZVSnBGOVFhQ3JXVnNMOUpURDZUeW5VK0hBenJDK01aRVVUSnRsVksveHI5?=
 =?utf-8?B?SEVsbDJwQzhlT3pmUm1Pc1ZXY2V2V1JWTnAyallTSUxJMHNDcHFodmI3T2ZI?=
 =?utf-8?B?SFArRVN6TEZYRzJHeTViUFQ5WE90bnAyUXorOVIwbzRGTy9xa1l0TmhwSFQ3?=
 =?utf-8?B?ZWRlaW9SQW9HOVo1VXExQUZoSzhrRlZnL0xjOGp0ZVFCWmc5QmJaMFV2dFRT?=
 =?utf-8?B?b0oxR0dLT2p1b09ZSHNrRmduWUYvNXNrNzkySWZzQWNlNTZlZ3lKbXY0dXFo?=
 =?utf-8?B?TndPN1ZLaDNyc09GOHcwUkZGaXhvQ3d0ejdxcC9PUzdVVGtQWmJCQ3A3WDlW?=
 =?utf-8?B?YVIvS2tSMFI2MUhGWWVnR0MySEQ3K2VnU0hpMlFvaFBiNWVzMUkyQTcwTkRO?=
 =?utf-8?B?VGRFbmM0V2tVZnhsVXIvSXVkWU41VFJtNXFRdXpNSjUrZmFPMFBxSXBBLzZz?=
 =?utf-8?B?QkpOcEpROU14bEtHNGw3cFhXTmRyMUFTandEbnlkWXdUMHFCQy8wU1Y1cTRG?=
 =?utf-8?B?MW9Fc0ZUaXR4YXp5OFdPbEVQa0xOaVdTek51Sm5iL1R5NGU2ZE1HL3FGdEsv?=
 =?utf-8?B?b3g2WEZhaWVIWHdWUlVHTWMrWllsTXlHRlJFQW02ckhWQTlaeDduQUloeGFz?=
 =?utf-8?B?M0Q4MDY2VFlRQVRkQUYzSjVGNGlkU2JhM25Ba0NXaUlPbUVTTTkzWVNlb2Yz?=
 =?utf-8?B?U1dJcHIvNXpKeGFreTZCREJrbkY3WGYxSGZPOWQrTmNqdEVhUndhTGgyUWRa?=
 =?utf-8?B?K3hmSW1CZm1uM0JVbzI2S2VtMjNVeTZ4NzVVTWdqQk9JcVgwNXlWcGZicWVy?=
 =?utf-8?B?UWNzT05PclVHZGQ1c0NhTHBzMkx2Mk5SUUZFZG9NWXFSN1BwT2trMm9qNmEw?=
 =?utf-8?B?WnB0ZWlCckpuL1Q5dDI1dHBNelFHc1hMdllvM3BpWU51L25CNGlLOTJQUElj?=
 =?utf-8?B?TTdRTU85cWF6RnBndnRJRE9pd251djljZjFsdGpyZlJDOGZEN3V1cjhqYks1?=
 =?utf-8?B?K0dMV2NkeUV6OVIzNUE3aXphZ1poanZtdFd2ejdCdGJmTmpRa05Rbld0UENl?=
 =?utf-8?B?RHZJV09CYXltRUUzQUs3dWFudHV0VjNCQ2FuZDBvN2NoOHZDVzdKTjNzdmh0?=
 =?utf-8?Q?yy9M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2pzQkJEcmpXdWJGUnFvaFB5eVltVEhTOUdhY0g4TEhmYnBuUkxOeXFQYlFl?=
 =?utf-8?B?WXJ6TVBuRUhPS3dmSXlVT0hsazQ4MmlMT0hIUW9uNlNPUnlqYlVvV0piQUU4?=
 =?utf-8?B?UC9MWFhzNjkwMHRORzl3WEd2bEdZYlh4UFQ5WFh2OEplazgxY29UQlpxSzUw?=
 =?utf-8?B?WFJsSDZSTWdsOXRwTGY1WW15YmR2TWlObEh4VUU3K3hiU2kzUng0bytwVHE5?=
 =?utf-8?B?WHNmTjA0TjhBUWFDMUFkN0p5eSt0ak1vR2NzNTJOQ3JpNm5ydWgzNTBRZERp?=
 =?utf-8?B?c0wvSXdrY1RKdlQyMWZyQVZGVlBJVVUxa3RIb2k1VkhvOHBTZ3BHUU45L2dC?=
 =?utf-8?B?RytDTG1XeW5RWDJqb29nNTRucWNvWDRWTTRHaXdDanBMRnk3eEVxc294bXNI?=
 =?utf-8?B?bmI5S01MNmtBaGhyN0JpUm9ZQkpIeVZxcHVId1Z3UkpsaXpBcGRKay9mM1Nk?=
 =?utf-8?B?MXNjamFqelAwaS9LRi83Q1lPUzNKdGdEVThvNERpWXl5RUE3YWZYMjR6TTlN?=
 =?utf-8?B?UkNMYkN2Wk1IQXZLclFUL00yT2pSMWtQRVhzRGMzaHJ0SVpueExMb1BnOWxk?=
 =?utf-8?B?enVMUmVyUlowY05YQmE0Q3d6cTNNYUJpNlg3QVdsYVhrZ2JOTE1qOHdkcERO?=
 =?utf-8?B?STYxMnl6Qk1Dd3pURS9CbjhncUFzSmV2ZElobC9idXNpN2poTDk4Y2c1SVFl?=
 =?utf-8?B?M2ZXYnNiRThYcjIxS1BOSVQzREFxdUFCdzZ6R0pueFZXYlRRRHBncTRuN1JG?=
 =?utf-8?B?NzJnM0YyeGJWOXV1Y2Z3TThXbERhYkFheUZqMDNJR0plQ05MQjBlNlFpYWpU?=
 =?utf-8?B?NjVscVhYMy9tT2NsL3dOWFZjNFV3YWE1UENkbjRPYjFYL0ZSSWQ1VHZyb1Va?=
 =?utf-8?B?Y0lzbFdLejhhck9qQ3Z0Tlp2dHAxVXdra0hxYllrQ0V5VnVhc1VVb3MzNDI4?=
 =?utf-8?B?VTloc0tHazJ0MCt1dnc1NHVzMVNxVXVRTGZ4dmZXQStQc2hwdlFkR3JXWDBR?=
 =?utf-8?B?OHkwN3RaVjJBZWsrcFBhR2tDZE1xZHI0amVJY2xQQjkxSVNzTms3SWVOTWUz?=
 =?utf-8?B?UjNwVFVVNnlxVEZlVEVsa2t1VE5KNElhQ2lST28yRmZMMXBHOE5VbnlNTUxJ?=
 =?utf-8?B?MlphMC9VT3VjWlNJSnBILzFVZkdBUERDTWxNT0x6d2UwcHQxd0cyMjdLV09u?=
 =?utf-8?B?R3VjYUVvRkVKU0lZWitDY1BGNWRYRDZSenJIVjR2R0RQN040WHBRZ0paVWFG?=
 =?utf-8?B?dzIrdlpkaXNzRXhnRWxxb0J2b0xseGE3aEdQOHYyaEJneDZJSUpLOGlYMFh2?=
 =?utf-8?B?SEk3WmVtL0R6OFdPL0NkRHVNbmtnRGxJOEVGUmNNd09Rd2xRakhtVndSeXpl?=
 =?utf-8?B?dCtIcGNieTJuT084dW5DZlZYWFdRdnVMYzh1WFdBcHB4TXhOS2xKV3ZlQmZw?=
 =?utf-8?B?UFMzVUY1K3FNQVh5TTRJaC9OYVpvdWVtMlhOTVV5MVZrZWFlak03ZVJnZmE0?=
 =?utf-8?B?anR6b0JHeW54Nk9zMVVZVnozUkFKMVhWUHF2bXpKb3RVOE9XeFFMNkVJZmxL?=
 =?utf-8?B?THlqSGorYmtrdUV5VFk4YzZsL1ducTF4RVJjWWpHeDdHM1cwK250cUZZM0s4?=
 =?utf-8?B?ZlNRclY1Y1A1T1p1QmFoQlhqM2tNMG8rc1hmZTVISVpnUEwyTHNUZFc2MVJE?=
 =?utf-8?B?Lzh1QS9wNFNQZ0h5ZzZlY2lxMERSWFZra1hTTGpEVGZFTWJ6THZpaVpiYmVD?=
 =?utf-8?B?YkUveUI3dloxbjZteFIvOFdMWDFYNVlCaFhPSFdaZW00bkJiVzVLMEdaWWNh?=
 =?utf-8?B?RlVCMnpaUVZWejhIUW82Q0F3aHFOUHpKRlNuemtKNktja3Y3eVp0YXVsSmdj?=
 =?utf-8?B?ZVhPZmxFUTRMMzVmcXIwUkxSUDlyT1FpKzliejl5MitRWUVNSzFOOFU1RWlQ?=
 =?utf-8?B?MXVOcVhmZFRVaWhTVXRiRzZ6bHM1S2FzcHhxYWpROTMvNG9KZmhoZUpvOEFN?=
 =?utf-8?B?azU3NUpVR1daZEdBcWlOQ09wMXExZGtvMnRFVnVoWlBLdUdRcGZ0MGc3VE5s?=
 =?utf-8?B?bFRsQm5mVGFjSWJScXNaVndOcGorYmp2RGozN09aVVdtTlJQYW4yd3dhVTNo?=
 =?utf-8?B?dXZ0dEprTnZmYk92WUVmUWhvQTFGKzA0MFhyVHhMT1NuN1AvN2laRnRCcE4x?=
 =?utf-8?B?czBLVHN4M0RUYWJzZ3d5T0M2ZW8zR05QN2ZSaUxIc2lCNVg5Z24vSGxxVEdv?=
 =?utf-8?B?Z21QSDZsWi91QmdqcTRyTDlESXNINEdSeTBJT21yMmNXVWNqU0dnYVd4SGND?=
 =?utf-8?B?N29VWDMwM1VRNFo3MGVmUTFkVjU1N0hFaXhSQ3FZdXFoMnlhbzhtZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0715172b-c369-4737-44b2-08de73a5b63b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:07:50.0639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCL4LyHPcnnYRs2wEPCVXeLNye5BbfRvQ9aUC4qUY70qEMfdWqHQfdc+SpsW7MOnDeDyXr0vGrOKeFLvJOj2zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9182
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: C5F37187649
X-Rspamd-Action: no action



On 2/24/2026 4:33 PM, Maxime Ripard wrote:
> Some DRM tests cross the 1s execution time threshold that defines a test
> as slow. Let's flag them as such.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 4 ++--
>   drivers/gpu/drm/tests/drm_buddy_test.c        | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 82a41a456b0a..a5a5a35a87b0 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -419,11 +419,11 @@ static void drm_sched_change_priority(struct kunit *test)
>   		drm_mock_sched_entity_free(entity[i]);
>   }
>   
>   static struct kunit_case drm_sched_priority_tests[] = {
>   	KUNIT_CASE(drm_sched_priorities),
> -	KUNIT_CASE(drm_sched_change_priority),
> +	KUNIT_CASE_SLOW(drm_sched_change_priority),
>   	{}
>   };
>   
>   static struct kunit_suite drm_sched_priority = {
>   	.name = "drm_sched_basic_priority_tests",
> @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kunit *test)
>   	drm_mock_sched_entity_free(entity);
>   	drm_mock_sched_fini(sched);
>   }
>   
>   static struct kunit_case drm_sched_credits_tests[] = {
> -	KUNIT_CASE(drm_sched_test_credits),
> +	KUNIT_CASE_SLOW(drm_sched_test_credits),
>   	{}
>   };
>   
>   static struct kunit_suite drm_sched_credits = {
>   	.name = "drm_sched_basic_credits_tests",
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index e6f8459c6c54..35ca79525f43 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -908,11 +908,11 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
>   	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>   	KUNIT_CASE(drm_test_buddy_alloc_clear),
>   	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
> -	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
> +	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
>   	KUNIT_CASE(drm_test_buddy_alloc_exceeds_max_order),
>   	{}
>   };
For the buddy allocator part,
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>   
>   static struct kunit_suite drm_buddy_test_suite = {

