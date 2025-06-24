Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B2AE65BC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 14:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA7D10E594;
	Tue, 24 Jun 2025 12:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="STbX4vHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A8510E594;
 Tue, 24 Jun 2025 12:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yT59O/lUu8/pC4tN4xsFTWMVxs04gbET2x1UbftejaHgG/BHPnz9R6eRaxZ5j7162cwkrDHIhGXF9RX0yT8omWgWLePYFUsHXXx8pLIQxGDJ4GmMbCHWNUUoMpreF5Ju854eKT/NRc6McMmc3zkdIEApnP7GiMIMdOwsEB1XrPnf5RXdDTvN6EouJmD2sek1ceu45j/UzWibNmk7jLG/SZws9sO7WMIei2NiZ5H/Jl9oUnSPbDVue14YXQieHlmmMepjZLix+62FOnRD/Ddoro9c6fA5oOo65YNOSOmuB9drgN+QoPMR+V4um9Td6ryqMqNeuwblx78RtiO8pGwEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03t/8WnWA/GhPFh/WNwxd7z1KoQVR3e42IzfZqVg2rs=;
 b=wACFzt+/kdPTQZRdFo67O7SsUUPZgB8FJa2vspRqVNdneEXRkTL+TEQaHK8AjZNdCUUEXh3vl9LemHEna/AZ74FBqHwosHNA3rYl02vNzsVNFS8ssqQjIQPReM30+itK64r0ytUPPUJlaq0vKAY1aB9AwA6d6/av+xAAXZWYKZjkyfP8dvZXd0s9o/9hYW5Zqg8vvFD20lW2tGQAZO3z1EsA33+O3XRlBnPPJdOnHHxptCK4qZMJkEOoR3DEJD7HlmzE7hIPAHC/N287UcO7PRaPxfjYr0bDS3q46Tateif2GBhyK9DlMiPPkpDmxPkO9tVX8bmJ56C1U0Km430HfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03t/8WnWA/GhPFh/WNwxd7z1KoQVR3e42IzfZqVg2rs=;
 b=STbX4vHBSxb61By95Kt72cE8DtvWTJUWT3Y5lyZfwd51iwpACM6jZSRVlRdwRpvMIYu/FmtjwmXzVYafYhHoYmtaUb4plDxDog06IHMikMvXvV7yawFohmINfTwOWYx/xu9fTc+8RbCPS3135ZneyoNQ1mqRhQDuMXSrYxTAQ6SlkrJuh3/GhsjxxLGgL1YUAPqe1dIDKNntrKagWOBawg1RG+RHLrsvwCi306ttE34nWzh2byNoXHG0gpatJ5g5CLvYoa6F+9TycML8Qi7CGGUlruxh/n1+5mNvgoKC47PMPI7r4DY1K+eToneDNeAVtT66mPbVK2BpVqUbX5kInQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 24 Jun
 2025 12:59:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:59:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Jun 2025 21:59:19 +0900
Subject: [PATCH] gpu: nova-core: replace `Duration` with `Delta`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-nova-delta-v1-1-b37d75a593ac@nvidia.com>
X-B4-Tracking: v=1; b=H4sIACahWmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMT3bz8skTdlNSckkTdNKO01OQkU4ukVIsUJaCGgqLUtMwKsGHRsbW
 1ANLn0KdcAAAA
X-Change-ID: 20250624-nova-delta-f2fecb58be8d
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS0PR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:604:1c5::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b540d0-9faf-4f35-ecaa-08ddb31ef83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWpUMGRuRGt0MTlVSkNtcGNKZGxPeUVTZTh0a3UxR0h1emIzTHRvaTVBZ1B2?=
 =?utf-8?B?VDJzSU1uaHdPaDJFRTFJQ1BEMzNMQW1WY1c3STFVVkQwemZIQUJ3REJsbGxX?=
 =?utf-8?B?R0FhdmdqakFIUjJLZGZIdjlDSG53bG1QVFNEUXF1QVlzemJJZVA4ZkIrbmc1?=
 =?utf-8?B?UkpFdmZvRGd1ZGJ2R1A1Z2ZoM3Q2T3VMV2l0dW9oYzZZZkJObi9YbEpBZmtn?=
 =?utf-8?B?Vi9hWWVvNHNhbHZNN2JqWVpoRnByMEJBbjdOVUVjOXc4NjFHTE82SHhCbTJj?=
 =?utf-8?B?MVk4YUdEWHprREQxVEMvZlZqc1Vmd3NxdjFqRlF4WnpOTzhhWS83cGRUR2pv?=
 =?utf-8?B?NEp2UDNEZEphcWpqNUxpQXFUK3lxMnRVMlJZUEo4cFBEeUZJUG5DUEdVOUth?=
 =?utf-8?B?eUhXQkt3NHBjRkkwMjU2cHBPUTRxSzI3dENBYWpvbkZDcDVVUHNWeENJeVEv?=
 =?utf-8?B?YTJWbU8rdnphREc3OUlPbFo1dHk0ZEM2WDVOMnZKNFB4cS9zeStUNC9OVCtW?=
 =?utf-8?B?Z29rOHdJQmJKMnlZRThWTUg2MTZzVTIwbGZPeVFGMDUrYVVBVHdvVmlITjZL?=
 =?utf-8?B?WDZZM1Y4U2wvQTM5WXA0amZteUcwbXg3RmtUdG1tRVZ1R0hnN2JEaFZ3R1B2?=
 =?utf-8?B?RXMxR3gwK3ZsM2h5VXNocHBJeGhwNC9PSUI1OTh5STRtbUhxc0VTMUlQd04x?=
 =?utf-8?B?UUZqbjVuK1UzNHBLdW5tMHdwZUpsVzVUL21jL0xMK2ZkaUVCay9HTEN1aVgz?=
 =?utf-8?B?cExvbmIxOUpRbGVoS0lmK2lGQkFNMFFuVGFvS005SmFVRWRPWTMyU25lQXJL?=
 =?utf-8?B?c2d5Unl3Ym5HOTA0WXZxZkdnTG96Yjk5Umw5Wkc5Zk13b1dQTHQvSFloWnRW?=
 =?utf-8?B?YjNZRElMOHpicUVKZHJHaFB2ZDlPakFnTFpuZmFwVjlCYzdUbmp4YUwvakxy?=
 =?utf-8?B?SEFiTGN1QkR3SWdXT2NJaXV4dm9GU212TFJOQWE1Q0ZhSksybDA1VG9rRGw0?=
 =?utf-8?B?WDE4RWhzTEN6RmV4Sktwa3V4MXJmQW5zMDRiWmkwd3R2VGR5Rkw1SkVsVS9U?=
 =?utf-8?B?QXlLWUczWnY0U2tVdUxwdjlTSm00L1hWV2FqU01seXVFeWE5RDliUlRsMUky?=
 =?utf-8?B?QkYzaEVrQkhsVTdpdm1pZTIwK1BKek1vSUtNb0h5d1U0blpZZktpekxQZEZX?=
 =?utf-8?B?d0k4Y3NwdzhudzBnZUpRalB3d0pLbXIvREg3US9DdllFcjFVVm1DVGJ5ZE41?=
 =?utf-8?B?U3hpSDFxWFRTYUxmaExjUllPV2Ruckxma2NkbkY2akNyVVp3MHVkenVJN0RO?=
 =?utf-8?B?UDRWL0pyRjFHS2hURGdrSk1jOWtlNXRTeUF3Q3RIdWpYOXJpQ3VPVlZ2dCt0?=
 =?utf-8?B?Q2ZoOE1wNlZ4ZERyRVllUjAvc2JsYWYzS2VaM2orcGdZeXNKSU1LUUhCNlNa?=
 =?utf-8?B?clJRSkRUM1RFMVFtQnBMYXBEMDRkeFZEMkVoVENheGthVkdzZXBVemxZMGgw?=
 =?utf-8?B?WmwwUTBGNHNmSjRWT3ZlS2xMenZsSmhBZEJQME5UZDIvZnYrZWFxemZHcHA0?=
 =?utf-8?B?VS9EM2ZGMVBRSWd0OWFDTjB5aWd0L0NGenhVYklDWjlpK0hvUnJyalRjR00v?=
 =?utf-8?B?VENRRDVpai9haFFPNitxZzVNQUxScTcvMTg4b2FVSmdwVy85UGl2dlprK3F0?=
 =?utf-8?B?bHgxQ0pURGY0L0paL3N6QlpoMWMwbk1ZME9aV0JmVzFoOXBZZXVkVFB5b0Nh?=
 =?utf-8?B?Rk9pVVhmeGNzbmZCVDRlZWQxb1ZCRERyYTBjTGM0azZaRmYrRDBwOWVwVVBF?=
 =?utf-8?B?MEx4eFZsUmlxTUpUM2kwYnhBR2JvbjcyVm1kRWpoMi9WMmRPd1YwY0F6eTgr?=
 =?utf-8?B?bTRCQUtMVSt2bDJhc1cyUTY0QmNjdkpRL3MyZ0pBRUtuSW5IbnJpdWVSNEx4?=
 =?utf-8?Q?bJ3BLBVXaLM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGdJcXZwbk9Ga3VJTGIwZGNWSC9TZHgreVV3NEpHN3hZTTRzTmxocko1SjE1?=
 =?utf-8?B?Q1FBSjV4bFNBV0F3MG9YblhKSC9CSGFLUGh6b1BSMzczMTZOSWVZY3NZa2hH?=
 =?utf-8?B?OWlxeU1WZG5hTnpSTVNlVkZXc2F6aWpydnpXeG5PL2VWZTVjZWhBaEZVbk5D?=
 =?utf-8?B?RjNNVnVJTDFkTG8vT2Z0OC9HNzFoY0tkR1E5c0FEajkvYlhJUXB5NDlEUXdx?=
 =?utf-8?B?TUdvQzg4MXdnMlBYeW53czZSWDN4VGpJS2FMdzhjd3NQU01FQjVEcUU4QXNj?=
 =?utf-8?B?UE9oT3E3VGpSRWFNamQzWTY3bHJDS3BzMmxSMFU3SVBiUEVlcWZHdy9oQXF3?=
 =?utf-8?B?LzZDMmFpbzFSRFc1ejVmZFExQkQ3cElBbkJ1VkhJdU9ubzZKNHhLZ1UyMHF1?=
 =?utf-8?B?RGFLblluc1RDUjdNTFE5Vk91N2NWdGZ1aW5WN3Z5MS9FdThtSW1hRGdKOSsx?=
 =?utf-8?B?azJPbGJuODh0bnl5Slp1cG5nMXp3ek9DcURjbUhTVURQNlF0VjQ5aHYyaU9Z?=
 =?utf-8?B?dGVLOFlKRVNyd2Q3S2hBL1BaaG9FWUNobjZYbjdPWGZXSERLTXN4QlNxVTN4?=
 =?utf-8?B?MlRrNXJQWG9RdExiV01KOHZqbkRWRVNCZlRXNEN4RkUrZFhDZHpOcmMzTEJr?=
 =?utf-8?B?LzZtWXV3T0hHVDA5TUJTNFFtZzJJaDVnTklTSkh5UWp5V0NPaHVsQVo0dVI4?=
 =?utf-8?B?NmUrc1JLcmJVMmNYbHV0NTZ6Y0s4c2F0VWxtVHNBUEpENElLVVhvazR2MVNm?=
 =?utf-8?B?ZkFkbTkrbC9VQVUxMmREUnc1ZHh6bXdhN1Z1QVhyTHY5aEV3aS9rNnJ0TGlB?=
 =?utf-8?B?d0x5NXhGSzljRjRic0VCeVBzT1JTWVNvTkVkTzRiYW9WcGlhcCtsRlRaTVZV?=
 =?utf-8?B?WDlsVUppMDhCalBMVHFGK2MzTGZNckZQbmdLYy8xV0hBVFhSOUJub2dvUTdJ?=
 =?utf-8?B?OFhjNW4xWGF6THBqNC9TMmd2d3YvWVBPa1R0Vy90WVFDOFJTV1BTblN4eUtB?=
 =?utf-8?B?RTgwYVhEOUdRdU83Y0tRbGorYWdjYS9rSko2K2h2WkQ4Vi9QWWd3WEdvTS9O?=
 =?utf-8?B?QUVIYktzQnRFMmdmTlY1NnhNWTB1RnBiU1AvTGV1NHFLaS8zVGJwdEc5c2RB?=
 =?utf-8?B?U2lTN1NwRW5FcFZOcFVXTDJFb2dMeVZMU2dOVlZYVDd1c3dhbGdUQkU0cm05?=
 =?utf-8?B?VjFMeWNEMmp1SXM2N0s3alMydjY0ekQxRGlLaEF2Rjk5aHVFeGpveld2dEMx?=
 =?utf-8?B?VVZLWDJjVVJ2ekJGdjVyYzUvbWxPVEk2V0NQTGJTZ25RRGYyWTVsYzgrNWJP?=
 =?utf-8?B?ZmZEOC91N28wWlNTaFJ0Y0crUUlvdnFLYmFVYS9YYUlVdEdzQ21xWHM2RXF4?=
 =?utf-8?B?RmdwUWlMT0VPV25NMVl3em11OG5scTd4a3h1K2M1V2FOeEZlNG42Z2xPU2dj?=
 =?utf-8?B?YWR6ZGRuOHZvell2TlZMY2J6ejZNcElxZUZxZHJhQVFoZ0hkMk9kQ0lvR1NV?=
 =?utf-8?B?VEdhK0FybTd0OWV2Y1FZcUI3MjV3WFJTMnR4YjM1RE0wcjRvY05kdndHTHo1?=
 =?utf-8?B?dlY3UGtMNjFmUEd2aE9hRE15ZlBvSXZUaFJBdFpXQzdTKzdQUUFxVktTZkww?=
 =?utf-8?B?dzZxTjRseTcwM3VLeC8vNE00VzdNQ0NJUTA4RzVrdmtld0JzVnkyT0U3UHNp?=
 =?utf-8?B?U29CMklIVXJsRkUvRjl2Nmt2c1drdlhsTWU1RzZ5bEVvZ3hEUkxveHN2STBT?=
 =?utf-8?B?bURaQzVJUzBzZjlGYlM1SmZvTXJaMVU0V3ZCMTNrbUVOK1BHbER3czIzdWFQ?=
 =?utf-8?B?eXhzVmpRZ1ZUblBvVzhrcDg5Qkt3OEJCUmdTOVBEaGhJb00wSFVvQ1VDTnNE?=
 =?utf-8?B?emRoa0cvV0VjS1ZIc25lclREclE5akk3SDdXU0NYaUp5K0NrZlpuUGY0Njdy?=
 =?utf-8?B?VlBNSVRaK01TYmtmYVFCcHJEc2xSbytWbEg3a1VuUnlCR1NsZDhQZFM1MDA2?=
 =?utf-8?B?VzZnWlpnL1FPNHo0UjdMYzZuNHh4OXJZcW0xcnFQR2E1dkRmNmVyZUZTekZ5?=
 =?utf-8?B?VDUyVFhKUXpFMU94WHRGd3JTUGxmaVI0VmkwSnFZN3BUdzRHS1p0SVBMclU5?=
 =?utf-8?B?ZFR2TlVNNmJEUzNnUE9HTVF5a0kySjZ3WHZaYWVNck5DZS84VnV1a0o2U2d5?=
 =?utf-8?Q?kiLWIuWvwjFDNQ/DMB+EJsO+muvTnYtBMhFhZJXwrc+J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b540d0-9faf-4f35-ecaa-08ddb31ef83c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:59:35.5877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J12pN6OCvVoU1TZE1Xfo0QlUCQvi7tWvTLFj4PMYiU6L+975KIoPxsZwxgbOMJZjVSLlMFy7SqnJA8ymjPWPcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642
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

The kernel's `Delta` type was not available when the `wait_on` function
was introduced. Now that it is, switch to it as it is more compact than
`Duration` and cannot panic.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 12 ++++++------
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  4 ++--
 drivers/gpu/nova-core/gfw.rs              |  5 ++---
 drivers/gpu/nova-core/util.rs             |  8 +++-----
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 07be1c30668c4bef9e073fe6ad49234aceb7fb81..f604e82c98120f2ab0f49b94be928967aa318df4 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -3,11 +3,11 @@
 //! Falcon microprocessor base support
 
 use core::ops::Deref;
-use core::time::Duration;
 use hal::FalconHal;
 use kernel::bindings;
 use kernel::device;
 use kernel::prelude::*;
+use kernel::time::Delta;
 use kernel::types::ARef;
 
 use crate::dma::DmaObject;
@@ -334,7 +334,7 @@ pub(crate) fn new(
     /// Wait for memory scrubbing to complete.
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
-        util::wait_on(Duration::from_millis(20), || {
+        util::wait_on(Delta::from_millis(20), || {
             if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE).mem_scrubbing_done() {
                 Some(())
             } else {
@@ -349,7 +349,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
         // RESET_READY so a non-failing timeout is used.
-        let _ = util::wait_on(Duration::from_micros(150), || {
+        let _ = util::wait_on(Delta::from_micros(150), || {
             let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
             if r.reset_ready() {
                 Some(())
@@ -362,7 +362,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         // TODO[DLAY]: replace with udelay() or equivalent once available.
         // TIMEOUT: falcon engine should not take more than 10us to reset.
-        let _: Result = util::wait_on(Duration::from_micros(10), || None);
+        let _: Result = util::wait_on(Delta::from_micros(10), || None);
 
         regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(false));
 
@@ -453,7 +453,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             // Wait for the transfer to complete.
             // TIMEOUT: arbitrarily large value, no DMA transfer to the falcon's small memories
             // should ever take that long.
-            util::wait_on(Duration::from_secs(2), || {
+            util::wait_on(Delta::from_secs(2), || {
                 let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, E::BASE);
                 if r.idle() {
                     Some(())
@@ -523,7 +523,7 @@ pub(crate) fn boot(
         }
 
         // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
-        util::wait_on(Duration::from_secs(2), || {
+        util::wait_on(Delta::from_secs(2), || {
             let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE);
             if r.halted() {
                 Some(())
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 664327f75cf4199cca37d22ca18b2b9abac781f8..4e9af40fee914bfdf89588565d99503971c6af32 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use core::marker::PhantomData;
-use core::time::Duration;
 
 use kernel::device;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::falcon::{
@@ -23,7 +23,7 @@ fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
             .write(bar, E::BASE);
 
         // TIMEOUT: falcon core should take less than 10ms to report being enabled.
-        util::wait_on(Duration::from_millis(10), || {
+        util::wait_on(Delta::from_millis(10), || {
             let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
             if r.valid() {
                 Some(())
diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
index ce03ac9f4d9d63cbfa91807c29efed16f1fa0cc8..d5b68e02d405750b18d634d772f15f413453e80d 100644
--- a/drivers/gpu/nova-core/gfw.rs
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -6,10 +6,9 @@
 //! the GPU is considered unusable until this step is completed, so we must wait on it before
 //! performing driver initialization.
 
-use core::time::Duration;
-
 use kernel::bindings;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::regs;
@@ -19,7 +18,7 @@
 pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
     // TIMEOUT: arbitrarily large value. GFW starts running immediately after the GPU is put out of
     // reset, and should complete in less time than that.
-    util::wait_on(Duration::from_secs(4), || {
+    util::wait_on(Delta::from_secs(4), || {
         // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
         // status.
         let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 5cafe0797cd6f9567afb7e1e9af23b961a8a87f6..64fb137607643464ef579481fec19214f3556bd5 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,9 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::time::Duration;
-
 use kernel::prelude::*;
-use kernel::time::Instant;
+use kernel::time::{Delta, Instant};
 
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
@@ -34,7 +32,7 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 ///
 /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
-pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
+pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Delta, cond: F) -> Result<R> {
     let start_time = Instant::now();
 
     loop {
@@ -42,7 +40,7 @@ pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Re
             return Ok(ret);
         }
 
-        if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64 {
+        if start_time.elapsed().as_nanos() > timeout.as_nanos() {
             return Err(ETIMEDOUT);
         }
     }

---
base-commit: 3606620b316c29e3de8ff87b40828c722086a9c9
change-id: 20250624-nova-delta-f2fecb58be8d

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

