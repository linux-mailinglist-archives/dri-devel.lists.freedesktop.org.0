Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOELFOmScGkaYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:48:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82BE53D6B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2653310E1AB;
	Wed, 21 Jan 2026 08:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VtcpixmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFAA10E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 08:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg/6lyhv4DDQZ9BiZ5OoimrNeZHUjNPl8GWvalusCc5VggR55lyamAQnr+FhYRQs4sCJJUQd6jkzj4RGajeyq32baz99vZ77mLRbcfytoV9ftBwnGH5WWKsZa3P7oNyJmnPls1+ySx5X+R14JBBRHAGfD5x6Yt7w5PjpufiX54GLhkPeX4vp2A0+ohosoero/qxcg42hu4wbSTSP2aEzw2Ej3W2FJDgkTaT6iEgKV4oL+l0JMhHI7dqak3tixGWpM+5zKR4smX+wwOHWh1iaj8ah+hghLN+WLNwN0SuSLm5G1wRue7YvqvM/s8FPvr5JXoYNgyl8rAb0iWGEm7SdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQLKMUdPfnyhWNlVyELNOQj9qo+oKpe2GXZ4AOt1su0=;
 b=l71xUQtfSLhH3ztpEuWmMGqPSGndDq1herP+EBNDNwBTT+sgfrPLgCO1LTnLuzL4VxudhapQ7elFajihpud6kRhqHB+EQpTwLeAlipB/yu6y7qHm8kvbu9dujiePSCZ/ZGDMGldW8t9Rm5g1CxkzvwnoDULRTyg4GXUSd0CmH8ns+QaaSqV2wCsJAj0TopWwmpXpIML+Ed/80zwEMhf6odvoJpZtItCofZErU6n1xSVcF0tYRepf/RzBwum83resjlzQIGrNFglrWpE2jvqCGW/e+vY1LZ43vZAEWtWe+NcGXhPnmQRJce/qtKYIUsPqjfIGZxvyrqyzIpO8CL14Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQLKMUdPfnyhWNlVyELNOQj9qo+oKpe2GXZ4AOt1su0=;
 b=VtcpixmBrGKOvdts5jFptVcNvX3otPRrnlWH47SLvMMMKTmYDZBUQKklqAyktlS9ZETAJgMSFYBal6dh71xZVUUmERnfKRG1rvjO/C8alYTwgGRcq673GkEyjqTi/q+VdoVUsly7lNEwUomNtOqjgaJKtCvWH0ru4r6Wz+CvMnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:48:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:48:33 +0000
Message-ID: <4e5c0b99-bbc1-4785-bee8-52b82d696d59@amd.com>
Date: Wed, 21 Jan 2026 09:48:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dma-buf: inline spinlock for fence protection v4
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260120105655.7134-1-christian.koenig@amd.com>
 <20260120105655.7134-6-christian.koenig@amd.com>
 <5de308d9-9ed9-4ae7-8b0e-1ec53282c5e9@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5de308d9-9ed9-4ae7-8b0e-1ec53282c5e9@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 289315fa-e32c-4c11-66a8-08de58c9dbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1dlWFJ1aG9LZW50djBZdE9ER1IycVNmam5LSWRVTHhxWTE0OEZRNnVUY0V6?=
 =?utf-8?B?eDVJZGZZejJudXU1ZjVqR1g4NXpFd01ZMDE4MnlDaXdVMlhqdFJpOGE1VWRD?=
 =?utf-8?B?ekU1dm8yRTRjVjZHUGVUcmcvNGliY25kc0ZIWi9tZ2ptWkZ0RDhqMXl3R21l?=
 =?utf-8?B?UWE5c2ZOdDZXWmViOU95ZDF4ODBEaVdER1hzN2RCTC9EeDNvc3c1V1JDcjkv?=
 =?utf-8?B?SmhMb2I5bGR2WFd6SzN0N2xUMXM1Um8wRW1OVVkxdUQ5VnozMUx2Yk8zZzNG?=
 =?utf-8?B?cCtSVlJIYSt2Wm1OVm9Ta0czMFhEQVM5aVFLVXhCUHNiTVN2RitNMlQ0RnV0?=
 =?utf-8?B?U0pYamRxeW1LYVFlRk9JemR5T0NnZ0kvWnlaS0ZyNWMxUk14WkxwMUJRN2sr?=
 =?utf-8?B?dXVkYTBBQWlOd0pjeVcxczZjbHJmQUJXelNIcFhvWVVQRlhNMko3WkcrSTh0?=
 =?utf-8?B?UGh3SnQ4bUExa0VLeE1nc0MvNHdKSzN1c3JkcU56Zk5vS3dmVU9NTStRRHlQ?=
 =?utf-8?B?R0J6YUtaNi85OG5GZ1VxYU1od1ovNmZMa09TbzVxdDMyYzNHd1lZb1Q4Mndp?=
 =?utf-8?B?QjZVS2FWaVFvZ1YrbVAraUhTZ0M2Q0V3UlZYV1ZkZjhENzFPdEVvd1ZhU3dB?=
 =?utf-8?B?UkpvMC9jbkdBZHFNQUdveVFYdGJyVnNhQlN2TzhPYzJXTWpRQXN6Wlo1QllR?=
 =?utf-8?B?TUV1RHJRck1Ba1Q2QkpuUUxaNUZNMmNESWRlYkwzckduUU55TlhleWpKR3Fs?=
 =?utf-8?B?M1Jqbk9PWm4wMUdYcmhHaGcvc1c4aVRKZktabEVjeUFuU2duczdJV3VzSUhk?=
 =?utf-8?B?MFB3ODJkYTdZNlVkcUJ6NmcvOWhUcGRBTlpKRkYwVXlZV2Q1TXMyWU1LZ2cz?=
 =?utf-8?B?VVdmMU14bkF0VTJ3WGUzZ0FuNmRDMDQzSjl4YjFQb09hZjEzNDFaZWFqZ05R?=
 =?utf-8?B?YjAxWStnbHdvamhiSnBCSWhxdVgxZ082MzlCU0ZpNmk0MXNWbFhTQTNWUWJp?=
 =?utf-8?B?OVlKRWErUzRyZzE4TmFxQVQwV1R3a0VUbDdicHpGOGg3ZWNWZzF3aE9jVWRV?=
 =?utf-8?B?UE9BR1ZVd1F6RjlrQWRtdm9WKzcyb3pGYitoaTBuZEFsQWRwVWgzenA1THcy?=
 =?utf-8?B?bnhJa1NmZUNnNXZGL3dTRFZHTmFGU1NjWE1ZLzBBMFQxRDdsZ2Q2MDF1QVNT?=
 =?utf-8?B?VlNhd0g2TUkzL21oZG01SmVMZks4T25LcE1NYTIvdlU1WVMyWDR3VGNiSWIz?=
 =?utf-8?B?cU1PZXFJbmhSQmV4R1ZZQVdYc0NhZVdlK1Zzd05QQko4SEtlUDRMb3gwOXBn?=
 =?utf-8?B?dld0WnFNV3BFMEZrS2FPTTF0YUJEL3c2MVRibmdoUFBrVk8xcjBtTkRzVHFt?=
 =?utf-8?B?WWozTHhIRExwWnZUejcxdmZHRVM0RkhGdTdVV3JCbjhFdklnZ2dDd1BJK01a?=
 =?utf-8?B?QXNRc0xEdm9UbkhDblRqTi9OTWprczUvQU5WWkhCQlZCNG9lclJCaHQwUmhx?=
 =?utf-8?B?STZHbU5QbjFZTGdtT0NFMW1JVlR0a1JNNUhPcnV3TXVHMlZPejF5VjM1ZVdx?=
 =?utf-8?B?Sjhib1F3RzdQQVU2b05od1pQdWJ0bkVpR0tVTGdWTlJNellRN3hPZjBGcXBj?=
 =?utf-8?B?MGliZ1JoLzVGRnQrZHR4UHk3SGpOWmlvWk1NVEU1VjBuK1dUVGo0RGdrZGpJ?=
 =?utf-8?B?V1E2Ni9Ma3c0NG83SFJZL2J6cXp4VE93djRpRGRkcVBZLzFaR0NYVk1aSURD?=
 =?utf-8?B?WlNIL3dWZ253WDlTMndqSldLT3pVbFEzdkxsUGI2MjE2Uis2SmVZT3J4RFJ4?=
 =?utf-8?B?a2Z1VUlUTHJXQm9CdW51SG1teFJuRWRqaFZMZTdRL1JseklLWlhYRDRNdkFV?=
 =?utf-8?B?M3Ivd01vODhteEJpckVadnN1VkFYaUNPU3ViOXV5aDBLK0lpcjVtVG1NK1du?=
 =?utf-8?B?bjV3ekhiMVl1OFZwQnlCR1lSb2N5RTlnbDBnaUdoQkxhSlNaM2g5Y1RFTys0?=
 =?utf-8?B?VU9HUVcrT1dtNjFhOXZDbXVIYnUzdHlWbWFRMlNpR3lBQi9MZ1JzcDd6RUdI?=
 =?utf-8?B?UGlDTEl1MkpSUTR2b1pqMjRwSHpodGxVYjNSSjVTVmRJcWg4TUFIdEJJMU43?=
 =?utf-8?Q?K5WA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJIMlBYZEVYT3B6YW9GZVFnNmRpRC9yazVOWnMyNUY2Q2xRamVCUmFHREpQ?=
 =?utf-8?B?bHNramdwc0RLN1lubWVUcyszNGo0NWVMU2JkNm1LbzhTb2J4MU8rbkZ1dCtW?=
 =?utf-8?B?RElCa0pqbCs2M1U5b0p1bUJKU1hucithSmR5SXZTZ0tid0JiaGpYcHJWSmgv?=
 =?utf-8?B?TnpXK01hK2pCM3FMN0p5ZFlSamd3bWFzNXJzUnJ0dkZxUDFFU2ZlRkQ4Q2U4?=
 =?utf-8?B?Vm5jU01heEt5Zm43Z3BMQmlhWDV5Y0dnY3k4R2s2OUdtZDB5bVpmV2ZMZWdI?=
 =?utf-8?B?NXh1RnNqQVZqdGc4QUVOUkpwZVgzL05IVElKN0xPdmcvS3V1Z3VyakNmWmxI?=
 =?utf-8?B?UkdzVTViM3BSd1hpUkVTbW1QdjBZQ3hYTkVBOENlSC9IUWt6d1hiNlRrNHpk?=
 =?utf-8?B?TVJqRVFSUitWcnhTYkhuRkJ4dU5vQTI0NjBxaGFKbklyd1NoOVYxYkkvaTJm?=
 =?utf-8?B?b29weGQ5TE1SckdVdU1jeDJxdFFKU1Qwd1UvdXFxVndpcWcxZTVvaGdMMXhx?=
 =?utf-8?B?MnJ3OUFSbU5LbGtza3Q2NXl1UEY4aFpRendnUVZwdWIvU0F6V1FwQloyc04z?=
 =?utf-8?B?Rlo3RVdDVXkyQ2VpNWxMNlBpbjFNVGNGdGVUK3NBYXpWU29yOWtFVTM1Y3NJ?=
 =?utf-8?B?MWZPNmtxQ0twd1hNcjRZb0JhR3lGRGdWUnM3elZKckxIRHBGbkpNYWRqbWFj?=
 =?utf-8?B?RGNvajRiWGk3djN6WmZOSnFVZ0JYRkVlOUQ0MDltNzU4YXo1OElML1lDaExz?=
 =?utf-8?B?bmVzL0tmNG5XVnJ3OXFJbUNUTEFNeGtoN0tmZTI3d09RR1dTWms4S0FtT3FR?=
 =?utf-8?B?L0RHMzV6MzhtYmZtdThzQjBKV1JKbSthcjE5azQ5enE5RWNDdlo5OGxCWEly?=
 =?utf-8?B?QWprS25kK2hvZkFUWkE3ZnhjNUFZcWw0djRkVUJTYlBsRWFuWWZUUlp1SUhF?=
 =?utf-8?B?OTlkcDZhZUtndHNkMGxOWWFyblQyRC9waWMwdTBmWC9xVEJhQ0IyMFIxVGpo?=
 =?utf-8?B?YUUzRVpFNVJGNElSa2RiNURvMURvOXlwRCtSSHRUVWFzZlpUY0VnbmRMa0Jp?=
 =?utf-8?B?aUpBZE5YTkliOTcrcEN5MVdVQ2MvemlZZ2dMOVZUS2lsSFN5R0hYdW45MzJl?=
 =?utf-8?B?aUo4RGpVWTRJWm5nLzBwcEE1UnVKYzRhN3d3K29Cb2lXOExUd3BWbkdmTThn?=
 =?utf-8?B?Sk54a0E2UDdWOUlRbFVraFFVMGN3VnBqNHl0ejNHNjVPQjNZZFJxS1Y2RjlD?=
 =?utf-8?B?R2hjdEZ0TWtOOVFhcWI1d0dYS2RHeEdwdHpJUnk2ZzlmTTFTcGw5UUNwSEVU?=
 =?utf-8?B?KzloQ2t3T3QwMHNSMUxENEdDb0FiTnlYSXQ1aTR3T0tNeEhpMzl5Qko5T2ZN?=
 =?utf-8?B?N00xNldHZGNZWkN5emVNL1lTWnpTbmtqcUZ0aHFyVy9DQXBwRVN1ZnpkK0lI?=
 =?utf-8?B?b0VDc1BlaUZaQ3Q0ZEIyZWRZMlFpb0JTY1VlYTk4ekNMazE0T1RrUHJ2TjFL?=
 =?utf-8?B?MVVuaVVjUitSZlpoek5GMlJBdGRMWjZlMjJZRzlxVTFPbFh6MnFWWmh2Z2Jr?=
 =?utf-8?B?SWcyODY0bEJ0NmgwWks2ekg4UmZNbHkyNDZVRVZUUXhLajJsaHBmMHVOd2cv?=
 =?utf-8?B?QTFaM1VWdFY4V3VZR2tPZjdFbDZMQXFxNnNZYiszYytGOXFpQUY4My9iR1Fu?=
 =?utf-8?B?WFVPWldYYlZUYmw3OHhLTkVKK0NqVGNvU1NyeWcyQzRIaTVVdEllOHcxY1kv?=
 =?utf-8?B?QzJDMDc0L29scEhUVlBVTUt2amJQME5EZlBWbzJqYktXUmhxZG5hcDNlWXNn?=
 =?utf-8?B?NENRWVM1KzZiU0RuOVh3TjhidFBML1l3Sy80U0hOSEMwSGgrRVhmSHEydk42?=
 =?utf-8?B?UXN0L3gvU0pBQzBCSkJsTGU1Q0Jhczc3NTdqaXFhZW1OeTBKbFkzN0pzOEdn?=
 =?utf-8?B?S3N3T25lTUVMS3g4S0sxTXBOamo1T0tTa0tGRlB5aEthRjh3WEtreHF0MUdr?=
 =?utf-8?B?K3AyWG91R0FIVjl0L3RuaDN1aEdpa3BTZHZyWmNXT0JiOXV2RU5FcXBGcXBW?=
 =?utf-8?B?a3RWOFc3NEc3NndMMVFSd0Q1Z25HNlZRVlliVmR3enpWdGZsRkhQMXBPTlFn?=
 =?utf-8?B?VW93cytiVWMvenhCZ3dEZmVqQlQvUStySVFLempjVHA4eTRWcVBTR0dtSmJI?=
 =?utf-8?B?dXdBWTZZaGk0eEo1bERCSjZqSVVVa1FYR1BKTnF0eTFMdWJ5aVBkOUJjVFlB?=
 =?utf-8?B?VDRHQVV0QkUwWlp1ZE9pRTFSRXBidWozY1ljSmZtRFNrSFFtdFlFN2s2Z09t?=
 =?utf-8?Q?YkymlnXNEtI2mvkRcj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289315fa-e32c-4c11-66a8-08de58c9dbfc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:48:33.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e191VN8v2oNqKvE4BL/wQhGrQTDbZtGk9nkk6uOqTtp42Ps32B905cQ813AS5oQC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: A82BE53D6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 12:41, Tvrtko Ursulin wrote:
> 
> On 20/01/2026 10:54, Christian König wrote:
>> Implement per-fence spinlocks, allowing implementations to not give an
>> external spinlock to protect the fence internal statei. Instead a spinlock
>> embedded into the fence structure itself is used in this case.
>>
>> Shared spinlocks have the problem that implementations need to guarantee
>> that the lock live at least as long all fences referencing them.
>>
>> Using a per-fence spinlock allows completely decoupling spinlock producer
>> and consumer life times, simplifying the handling in most use cases.
>>
>> v2: improve naming, coverage and function documentation
>> v3: fix one additional locking in the selftests
>> v4: separate out some changes to make the patch smaller,
>>      fix one amdgpu crash found by CI systems
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence.c             | 25 +++++++++++++++++-------
>>   drivers/dma-buf/sync_debug.h            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  2 +-
>>   drivers/gpu/drm/drm_crtc.c              |  2 +-
>>   drivers/gpu/drm/drm_writeback.c         |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
>>   drivers/gpu/drm/qxl/qxl_release.c       |  3 ++-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   |  3 ++-
>>   drivers/gpu/drm/xe/xe_hw_fence.c        |  3 ++-
> 
> i915 needed changes too, based on the kbuild report.

Going to take a look now.
 
> Have you seen my note about the RCU sparse warning as well?

Nope, I must have missed that mail.

...
>>   +/**
>> + * dma_fence_spinlock - return pointer to the spinlock protecting the fence
>> + * @fence: the fence to get the lock from
>> + *
>> + * Return either the pointer to the embedded or the external spin lock.
>> + */
>> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
>> +{
>> +    return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
>> +        &fence->inline_lock : fence->extern_lock;
>> +}
> 
> You did not want to move this helper into "dma-buf: abstract fence locking" ?

I was avoiding that to keep the pre-requisite patch smaller, cause this change here seemed independent to that.

But thinking about it I could make a third patch which introduces dma_fence_spinlock() and changes all the container_of uses.

> I think that would have been better to keep everything mechanical in one patch, and then this patch which changes behaviour does not touch any drivers but only dma-fence core.
> 
> Also, what about adding something like dma_fence_container_of() in that patch as well?

I would rather like to avoid that. Using the spinlock pointer with container_of seemed to be a bit of a hack to me in the first place and I don't want to encourage people to do that in new code as well.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> +
>>   /**
>>    * dma_fence_lock_irqsave - irqsave lock the fence
>>    * @fence: the fence to lock
>> @@ -385,7 +403,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>    * Lock the fence, preventing it from changing to the signaled state.
>>    */
>>   #define dma_fence_lock_irqsave(fence, flags)    \
>> -    spin_lock_irqsave(fence->lock, flags)
>> +    spin_lock_irqsave(dma_fence_spinlock(fence), flags)
>>     /**
>>    * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
>> @@ -395,7 +413,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>    * Unlock the fence, allowing it to change it's state to signaled again.
>>    */
>>   #define dma_fence_unlock_irqrestore(fence, flags)    \
>> -    spin_unlock_irqrestore(fence->lock, flags)
>> +    spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
>>     #ifdef CONFIG_LOCKDEP
>>   bool dma_fence_begin_signalling(void);
> 

