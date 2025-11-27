Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D25C8DA6C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6710E7A8;
	Thu, 27 Nov 2025 09:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NRW6bkX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011030.outbound.protection.outlook.com
 [40.93.194.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70D410E166;
 Thu, 27 Nov 2025 09:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Emmqsr40lZ5ngQNbRt8qOYwhit7VVswlVRWvHuRFaIUdxUrOQeTMJPjgmxs+CsaUBc0hZ1q37jAVXAtj9kx9a55rT/e0ce5s5uAQureJUAqCV9ZDF9bBQy1jh5acOqTy4TFhWKl/xhhkVItuUqalLoMUcx27XiDPaOhVOcSihB/cuB0SC7N6Yfg15Xgd5ZWbvoih1yTueqlpWKrTFlLAOl2LPBTHaGmoDDjPOFtZuiZyPCyjc/FgVFD0P40iSU93FNs9eT84/3MSjHpiwg4U9fnrYDHMFBOH2E5PUmlrPaCaJJ9z7ZTP4MGH3SSyvWN9ryXxcerZaOhG3rY7ixYBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faMmN97KwlTQYGSR+Vu5fEPJMt30fUDHuL+nwgE4SIk=;
 b=E8n89q0b1PLICDGljXjtiACZndxF2W8Rec+A5wiE7JjppVFRI3qddkjIYBscLzlaiH3mKIvKcT+W0OTqhfFmGch0iDLqd+9uw9cXmUg6r+91H/qXVsPgOqkOn3y5N4jNrVbHIxHg32UjfRT2ELWqj92QLvoMF701+1sXMSuNH0TxDb258QJidFAssUTTFYNG7VC7xTgBnrPZRoNH1ynbyY92W113vDvieYbcoWYMS5laHErjggos7a7+tDHJmYbJZlftntf7P57QhuCF9t+MytJsJ2C1+mM+cdXZYe0u2UCLNnjedPo6/FqoAxpmdy8nCVk+YAjDrCVZa7kR9d1CUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faMmN97KwlTQYGSR+Vu5fEPJMt30fUDHuL+nwgE4SIk=;
 b=NRW6bkX61KD8PfpaYRlpOlNOpSzLdu+y4/34Y+XIwnPc6o0hYp6p1rpcYHQAQqfczYt0NwzkLe4OXsR6eQn6pAr3q/pVJJgx54+0X2im5iDEfYmog11ErOI5OZLjl1D3y4P74pf8h/qPAX9gl/daADcGBZCY9KdDkllxx066DRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 09:55:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:55:34 +0000
Message-ID: <b1c3dd51-1ba9-4036-b964-8e9f4350bbee@amd.com>
Date: Thu, 27 Nov 2025 10:55:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] amd/amdkfd: Ignore return code of dma_fence_signal()
To: phasta@kernel.org, "Kuehling, Felix" <felix.kuehling@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-4-phasta@kernel.org>
 <cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com>
 <d46f753e660694ab46c65409a5e43f050b7eb2d9.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d46f753e660694ab46c65409a5e43f050b7eb2d9.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:408:ea::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7ce4ea-a86b-4751-0cd9-08de2d9b1bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3krSEM1NThpdzdydlMzb0YwZWJZdnA4RmNSYmwzOFJkaFVmMm13Zm9UMVZa?=
 =?utf-8?B?RHZxUGVtb3ZNVmZJV05tOGIyc1JJK3JPRkdlL1BoSi9UelhDcmphdlNYbi9v?=
 =?utf-8?B?N2w0Y2NEWDlWUWVmMmptbERSWnFtdno5L2xRdDZJRjFJREIrQWhneHp1QXN0?=
 =?utf-8?B?ZzBUd09ieHZyZG5aYUxqSHJvM01LbllObHFXOGQ2V1BBUDdJcFpKVnNrTWhm?=
 =?utf-8?B?bWNWQXhDNlUzMzR1YzVzUEkvWVlZdU5VTEFXTGo5emN1WVlTY3dWNDQ5T0pa?=
 =?utf-8?B?ZGJVbzNxa3F0NEdlZ1VLeWJIL3dpd0haYUd6dlg3OVMrWEphQ1AvQmh6QmM4?=
 =?utf-8?B?cU5TUUU2ZVZRaHNmcmpGem1mb2o4UC9ZWWcyZGk2UUVwbE8yejJkSUw5dzdR?=
 =?utf-8?B?aHYzYmlRa0lIME1RSmRHZmY0RVMwZzhTa2IvYlFRaDU4WWZnUzNkM05URm9q?=
 =?utf-8?B?dWpMOGczL1o4SlhzWFBxOWlkNEIyUTNhM2JLZ1k2K3I4TFlPb3JkR2E1bWdS?=
 =?utf-8?B?a3FNdWpBVlVMVVlJbk9zeVhDdUp4cVRpTWdMN0ltdkc5SnFUSVRYQnBRcTBG?=
 =?utf-8?B?YXFmdE5ic0pmbTFSRmtMbisrYUcrSGhkKzkyaDR1K3YzQUxlMmpXTzFGTjl3?=
 =?utf-8?B?NnZzaWZreUZFMGxQaE9LdVZ2aUNPUnZIWXBpckdRWkI0ZmVoRVhvdkQ2eWky?=
 =?utf-8?B?NElmazRDWUgyT2xXeTdOcGtCYnZlWlQwTE5HRWJibVpBUTBONGFUOG8ySHJF?=
 =?utf-8?B?bjJTQ3ZJT3phck9UaGl6cEdJSkFJZmQ4Vm1IRDA0amVqMi9naFRHQlh6UEJN?=
 =?utf-8?B?MThKVG9xN0EweFNuTkg2OVpMYXNhck9rL0FMWCtVdnJIZUR5UDl5bjJiZTBx?=
 =?utf-8?B?OFZLZUNQNk1XSHFCeHhhUUZQOE9QZ3lUSkVOQ09MOXExVDNIODRYR1pjckc0?=
 =?utf-8?B?Mk9VT1FwZEYvYURjaytxTFQ5K1NiWGNPbjNmZFdOcldEdTdIVUFDdmpJSUtS?=
 =?utf-8?B?WTRLY1V5aHp4QnRHdFRKd3R5QlFSVDljNUdyQkJtOHZaUG04RktCb3dTTm53?=
 =?utf-8?B?MDc5RC8rSmlVazFSYUNZaDBlU0NuTytraHI2S3laSGdvWlBCcThqVGJaenl0?=
 =?utf-8?B?alVnYUQwR0E4UFIvY2JCaCtsR1dtb1hYZ1crTXMvYXREb1RGN0RWa0tkd1Vz?=
 =?utf-8?B?OGU4cFFabkpwVHkvTENnUjJsMUw0dWZsU3cwQ0RCczE4RzN5TmVldk53Nkpr?=
 =?utf-8?B?dlpFc0dwbTJUbFJja1k5ZFpjQTh3cDExMDJXUFRXRm4zbVJ1K092d3lZaUEz?=
 =?utf-8?B?aFUwNXJrSCtFQkl1Vlo3NVkzRWdpUzBiRzhHZnk1a3lITHhqamhoTXcraG1W?=
 =?utf-8?B?dDNybGMxMjRzZ3pNL0toMkxrNHhmMG4vTVVmUUkvV1V0cExwQzJvL1VHcDJK?=
 =?utf-8?B?akxseTFnN3NPWmNPU3dNMHJ6T3ZrYnZmU0d6ZDJLZXJHZVVIT0dsdW5lZVRx?=
 =?utf-8?B?bmpjVnRYWGhjZGJYM0lIV2NhazNkbXVyLzVxdHpkL2lCNHF0NWFxZ2pvRGsz?=
 =?utf-8?B?azc0WjUxUTBGU0Z0RDh3T2FtNjdBc0svUndUQXVNZWVSTmRBRnFjeWtsRkxG?=
 =?utf-8?B?d3ZDQS9hMnZyclpDZk4xaWN2c0p1ZWsxL21qTDBxclBGMkVyUjhCVTE1Wm13?=
 =?utf-8?B?MExaVjEvTEZEN2c3MXdqYk44MkxCd0k5WjE3K01IZEVEZDJpVkV1Y2ZSREpV?=
 =?utf-8?B?UFY3ek5DZC9ORnJic0h3LzJTSlJnVUZ6T0xMRFNUTlE0bEVNMmRiUXgxQVpq?=
 =?utf-8?B?VEdWbEhRYVJ1U1FTU3gvWlZhSC8wNTZ1RVIzZlFFeEY4N2Y3M2t3NFArS3lS?=
 =?utf-8?B?YWxoRU9qQW4yMU1TWWR6UExwdUZaeFF2c3NJR1c3Y3IxWmY3TjVBME1lckxk?=
 =?utf-8?B?NE5QWjJ3Zi9wMDQrNjdIVzhRZmJUTGpMU2VvQTBHVkJOeHJ6U28yMUtxOGll?=
 =?utf-8?B?NndOdlJZcUNsQ1c0MllIMkJVbUhqbm9WU2ZCWHQxSGZBUC90MDZQVGYyWmpB?=
 =?utf-8?Q?qhNB97?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUVzOUZDeHRhQjFXclpSWW55TjR4ejFjOXhSVjNoQkpMZXRVbHplRWFCVyts?=
 =?utf-8?B?NFJmc3k2a1VMNmpWdzk3aW1aNENzWnFWa0s2V2FrYm1mVWVQeDhUaTRuRmJV?=
 =?utf-8?B?Q0s5UGxkU2ZuV2NZaU95dlNWSlNSMUVFaE5PK2NRL1NvR0k0SVg0bXc3Q3BJ?=
 =?utf-8?B?MW5LNUFYSVVXakkzLzBzWWxjczZZSXVOSDhtNlRNcVJNbGdTMmZ5Qkk4dW1I?=
 =?utf-8?B?RElROHRQZ2dBbHZtK0tGM29kQldEbkVkR280WC9FcnRuY3lqaXc4WkE1cGtr?=
 =?utf-8?B?bEU5QmlIbStsTS9TU0o4NUVHRzJ2MjN0dzl5UEVKVSs4Sis0SEFuL2lMTDhC?=
 =?utf-8?B?RHF2TUptMGNvYzRXNk1oZUZQUWgzMmVoalFOVkMzN2kyMThtS1VkaFZvQUF1?=
 =?utf-8?B?OUZVbC9qNXlhMnVXTGhoNnFEVjJoTXRwSGxiQ1F3SWpLZGlBMTgyUFdyZEgy?=
 =?utf-8?B?bno5RlREZ3hxNkdkUXJQVlY0S3E5Q3BXRnpzeUU2aHNsYWs0b1AyY1U1eGZw?=
 =?utf-8?B?MXZ4U215bVJ3NEg0c3YvSjRJMkxielFSWXdHazVVMU01ZUcwemI0UWdOZUJv?=
 =?utf-8?B?SXFCVEtmTHIvQ3ZFZXo1cVpZSGg2TDJMOVdCQk5Gakw0RkpRREpFMzJKQTc2?=
 =?utf-8?B?OVdZQmdnN00rRC95L3VDNzkvMnF4S1pxN3pVakNCRlRIK2NwSDFOSkZOTVgz?=
 =?utf-8?B?Y0h3Q1pSblZ3c1NERHRsWFhVTTU2UytHNC9TSWJ6RWVnWDM5TnBZR1R6SkdB?=
 =?utf-8?B?Z0F0QlAvY1g5M3VxUUcvWDJmMHdXSU5HdFhWcklKa0VEREEwNEVpRS9wY3VB?=
 =?utf-8?B?RUZTL3B6RGd4enkvYXp5S2hTYzNYd2VaK3ZCTnAwS2xFS1hzdi9SZllTWWRk?=
 =?utf-8?B?Y0lrT2NMVEFlaE51Q2h2cGxYWDNobXBGT0krNFhkTnNDWFp5anVNM3h1WDVo?=
 =?utf-8?B?VlYvcUZ4cjhrRTRMbXEzZDhYZVdLaC9kSU5XUlEvU2duYVZTNDI1Rm1tVkYx?=
 =?utf-8?B?MmJJT0dKYnJkaGZobGZIdHJWVFNXYS91U25KVEYvRXA4dzZObTJ1Qk44QXlk?=
 =?utf-8?B?bGI1TmVlTkVERGt0c3RTWDBZVitaYkFhWlp3ZGZ0eityMGNsMDQ3M1EyaUtN?=
 =?utf-8?B?Y2hpVkZ6UGdlUDJwOWJlZmZZUVdtbG50VHIxVXhsQVJwOUxZaVp2bVhCQm1M?=
 =?utf-8?B?Y2FaN0xjMkVod282aXdLVGtTTU43akRsWXc0RTBiWGMvbTljMkFHMVM1Z0dK?=
 =?utf-8?B?SWdDK1BVbzJPSUs1dmtyRFZJaHN6SEVMOUhSLzMvZFRHYlc0SGRGeGJiTlc0?=
 =?utf-8?B?Z1lpZVdwRkpWbVR1QkhxUTFYWDlhRjB5RE5ROWg4eXV6Mk1ESVlIVmlGK1dm?=
 =?utf-8?B?RHIrcFliUFRVQ3k3UHRoaDJyck4zUXRDOFRqb0hnWFo5TkVrREU4bXdQNFN6?=
 =?utf-8?B?QmZCZEN5aDRZS2tlbXllNHZDVGY0cVcwNTR3b2lOVlFkSzNTWmYwOTBidTlj?=
 =?utf-8?B?eHk4dmZNNXplYm5uWnROY29WcCtWbXV1ejNlMUszZXFOZitSc2FuOWd6OS8x?=
 =?utf-8?B?QXJzbjVXK081ZmMzNHk3aC9ITmdLVUI1WmxBTGd1YmFLUmNxNTFOUU1QeThy?=
 =?utf-8?B?dkhLditGSVpOK0J6UHdjakFtNGpsUjZEWkJ3b3lPNVh5d0p1RW1zNlk2cFJM?=
 =?utf-8?B?NWp4dmpNcjIrM2UwbHNaWmY3SWIxeFNXUTNUdjJIYjYvTFArS3J3RTlZaFR3?=
 =?utf-8?B?OFF4VFNtVVJWUlRrenk3KzVGMnRveWNCMXRISlQzeHBocWhISDFtR2kyUi9O?=
 =?utf-8?B?QWwyL2tEZ1llejZGUVlEZ3BzUjEzbVFUblIwTjBQSk1xRHptak9DR3BBekxK?=
 =?utf-8?B?RVVORGxlaUxEc3ROTUJCVVl3YTVoRUxoK1JnNUgzQzZvbGRDNGhXNDdFSUM4?=
 =?utf-8?B?Y2duRVdMVWRwb1ZUZ2dVeDA2RTFCMVdZckdLMXl6d01XaVpTV1NtakRlVmNp?=
 =?utf-8?B?TUZ0TThWRkd2VHVSU2NqWStuZ1R1c1podmRtOTFYbllVNWg3dVhhRzh3aTFZ?=
 =?utf-8?B?NWJEenUrV2xwRU1RSWJsa2MweDFVVVdWaTJSL21COEZXN0kxTDBoazhNZitC?=
 =?utf-8?Q?cFAySgBiuYpKTwoO4acbbjJqu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7ce4ea-a86b-4751-0cd9-08de2d9b1bed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:55:34.6150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2TC7tc41puHELQj9xOUuU5lbGurlG2r2jR1owjHjJCXQuASDeIBwGx8LVNoOioM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781
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

On 11/27/25 10:48, Philipp Stanner wrote:
> On Wed, 2025-11-26 at 16:24 -0500, Kuehling, Felix wrote:
>>
>> On 2025-11-26 08:19, Philipp Stanner wrote:
>>> The return code of dma_fence_signal() is not really useful as there is
>>> nothing reasonable to do if a fence was already signaled. That return
>>> code shall be removed from the kernel.
>>>
>>> Ignore dma_fence_signal()'s return code.
>>
>> I think this is not correct. Looking at the comment in 
>> evict_process_worker, we use the return value to decide a race 
>> conditions where multiple threads are trying to signal the eviction 
>> fence. Only one of them should schedule the restore work. And the other 
>> ones need to increment the reference count to keep evictions balanced.
> 
> Thank you for pointing that out. Seems then amdkfd is the only user who
> actually relies on the feature. See below
> 
>>
>> Regards,
>>    Felix
>>
>>
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>> index ddfe30c13e9d..950fafa4b3c3 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>> @@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>>>   static int signal_eviction_fence(struct kfd_process *p)
>>>   {
>>>   	struct dma_fence *ef;
>>> -	int ret;
>>>   
>>>   	rcu_read_lock();
>>>   	ef = dma_fence_get_rcu_safe(&p->ef);
>>> @@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>>>   	if (!ef)
>>>   		return -EINVAL;
>>>   
>>> -	ret = dma_fence_signal(ef);
>>> +	dma_fence_signal(ef);
> 
> The issue now is that dma_fence_signal()'s return code is actually non-
> racy, because check + bit-set are protected by lock.
> 
> Christian's new spinlock series would add a lock function for fences:
> https://lore.kernel.org/dri-devel/20251113145332.16805-5-christian.koenig@amd.com/
> 
> 
> So I suppose this should work:
> 
> dma_fence_lock_irqsave(ef, flags);
> if (dma_fence_test_signaled_flag(ef)) {
> 	dma_fence_unlock_irqrestore(ef, flags);
> 	return true;
> }
> dma_fence_signal_locked(ef);
> dma_fence_unlock_irqrestore(ef, flags);
> 
> return false;
> 
> 
> + some cosmetic adjustments for the boolean of course.
> 
> 
> Would that fly and be reasonable? @Felix, Christian.

I was just about to reply with the same idea when your mail arrived.

So yes looks totally reasonable to me.

Regards,
Christian.

> 
> 
> P.

