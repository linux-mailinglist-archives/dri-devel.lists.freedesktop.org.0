Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE1C7B8AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 20:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54AD10E8FB;
	Fri, 21 Nov 2025 19:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ok+Kpy03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010071.outbound.protection.outlook.com
 [52.101.193.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F06010E8F8;
 Fri, 21 Nov 2025 19:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0EanIJKbjAaDPJt5GQSrQ6g3RGRi3Loi+Kx9+awVx8WeXGj/OwlJ4PyWcgb/kmCWwGaGKUNT/OFDJSPUW3YRQRD1XxLBe3e43xGxM0Fadt8e6O/Fv5iLGIq5yuXlyocTjWktFz8gUoA6xIcMWJKZcbwAg8KefodOL+zeyidCkz5TGWTTU1LHqVRASwP1fIv4+INhTC3w6+8mvIl9Wlp6Yu3jEeJ7R74toBaN/9DeHxPsIa6e4nLElD+wkaqmjtc0kZVjyzW2KhTrCDhMtRaT1fiYub72e9TxPDnKUmLQVqNpKQ6u4Ho5Usgt6DIxEDS4yB7ODnXX7Ds/MokY1Um6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0KZOvPv+PVE+l1w7z8v1nd9jh7D0Ao4Ou0spGVHhxc=;
 b=l58hZdsSGteeV59QduUBJu+oCLLtbaWAIbnQIqOqK2K5XCvy+8v+3MnJgh8NERQyWiq+h5tDZvvuTKInH4kVWZQfeVw10KfGZdL+aJ+qaxajbJ9BWerRNSUU93AoU84Axl1LsLMKP4kGKflZQQkj63FtbdgI9u5evSP+dU/gunypVVvoHuWXtR1HflF6RUPXgOVWdpJpu9CksAQK/KhyogAYjRzduriXNIUgilafUVmKkCQKBievvV3S8IePZOb7El+GLrEL+u27uCDlpYovidcyfXpLbwT7ttlxiwdKxTA/M202rEf4MikZLImm8sor7avYVHoQwYGDwl5AevO1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0KZOvPv+PVE+l1w7z8v1nd9jh7D0Ao4Ou0spGVHhxc=;
 b=ok+Kpy03u/AKgK3Eiakybq+SsEd4kkHkQE96FMWFUj+ucVAXk00kxYfuMmbU6JkvSCr2J44nfYM7Lx6Xg0w158sOdR/6KC6qhDPgxv00HuAotUphlffMlHRRdMonqeQJlF7X9FQjTsIh9lITlEjLP2YEBmnjFRZFaCJWDWEtRPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 19:36:18 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 19:36:18 +0000
Message-ID: <5da812b5-7e16-4343-b060-9960180949fe@amd.com>
Date: Fri, 21 Nov 2025 12:36:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix logical vs bitwise bug in
 get_embedded_panel_info_v2_1()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hamish Claxton <hamishclaxton@gmail.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aQSzYV0ytfQK2kvN@stanley.mountain>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <aQSzYV0ytfQK2kvN@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: e31d75fd-87c5-44c2-2338-08de29353e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STJBR05CY01OM3RETFYydm9XQlFnTDJKNmV6OTdEOUQ5b29qc2g3NlN4NWRp?=
 =?utf-8?B?TWY3a2dpMGJQTzNSMGtJbWxRU3diQVdjMDhUbVZ1RVJlRVFXZ2ptT0h6Nitl?=
 =?utf-8?B?OHZGV0xUeTlJbm1GUmNUNW95Vm5IVWE3VlNyOE1UTjZSVDFyYXBCVjlpei9v?=
 =?utf-8?B?dG1rZEIxQ0hVSDc3SDB0amZMR3pXY3JKYzZZNFZFLzZIbk1ONFRSVFBveHB4?=
 =?utf-8?B?RzJtRFRaMklsaEEwaXplbDNDYUsyOW1kQU1lZlA5c3ZtWkpaTExrVXduL0M5?=
 =?utf-8?B?VS9RUkdXQ3crUjduUmlSYTFkTUR5NDBLWXNxcmdSNzk0SXFTWG05OTB0Nmgr?=
 =?utf-8?B?bHlwYU5leWtuckpGeFJmNWxNRkJJeHA3Mmh1QjZxNFdTUURSRkpvcXA3VkU2?=
 =?utf-8?B?ZHpOWU1XWVc0M3NVOWk2UkkwdDF6SHNRSnliUm56TEwyeWFYT1d3azFOMUxa?=
 =?utf-8?B?bHViTGdUWmJUSER6RmMyaFVwejd6VHZGZHhTclJ5RE50R0RBWEhjekVyOTRm?=
 =?utf-8?B?elZKRFNCMmQrY2xURkdEbkpOcFRBcElrOUJpTjdIbGlKNGxxQnZmMmVXQlNs?=
 =?utf-8?B?VElVekJUbFE3Qk9EYWQ5NUVqQmdacUxaZXhsSFBBS3V3UUl4SHpFdDNEU1Mx?=
 =?utf-8?B?UkY3aTB3ajlKS01rUHMrb0tVaHdHekdLSDI3U1A5cTZJWHBHNThBNFlsT2h2?=
 =?utf-8?B?ZVNGcG15UjY4SmtUL0grN0ROOWc2OFkyQ0hSS0pra2FoVm05aitoUjB3Vkw3?=
 =?utf-8?B?c3lQQW5JTTRPSzluSmdqVnY3c29EK2sxaUlaeC8xQ0hPc0V1TTBkckhNTy9P?=
 =?utf-8?B?RUtoNG9TOGEzY1c1K2NqVWtoOUxSMGRLbm1xVEVXSzdCR0svOUpaZ016ampZ?=
 =?utf-8?B?dDBxb2wxZDFUZUJsc1hmMEhPTkYxT3Q1V3JGVGtRcWtwMnFRcWU5eGU0Q0JS?=
 =?utf-8?B?R0JHQVZFYkQwdlI5MEJmTXo2MGVZaEt0a2kwb3NIWlB2V1R4OWFEbUlYTHhM?=
 =?utf-8?B?cWxQeUkxNStpUG1DWTM0TDc0cFBlelVHaEQ4dzZzR3dzNHprTXpiQ2thNTBy?=
 =?utf-8?B?MzFFRTNIVjlESnNVV0xqVW1ldHJ6SnZMeVpJcUZLRERPc1pqais2MlNXald0?=
 =?utf-8?B?cHRpSXR5RGtadVVwMDBqWFR1OEVMMTA2elR2VXFnNkVPaEVQWUtrTnpKVXFF?=
 =?utf-8?B?R2JBRVB3WEd4MG1HU2pJb3VPVVlYV0tXU3VCRHU3b3ZMWjNtQlBZZXB3bkNX?=
 =?utf-8?B?NGRlUEQrQnJ1NFRnTlZQaGNYTW5uRnFFMDBKMFdYMlRwaGIyTTJKZVB5Unho?=
 =?utf-8?B?NVpiT3FQQnpPczFnMDlOV2JaZk9FK2QyTFhoMmloVTZMaDkwMUZQN1Uzc3h6?=
 =?utf-8?B?OEJXYmpkcU9uc1pmTnl1cXRxclhlRlRscGJQWllRK3Nydm5zZGQycUZyQTJi?=
 =?utf-8?B?aFRFR0hDdEVGazkwRzJDMjRtT3lreEs4RUc1Tjh6eSswZW9UbThGUlY4TzVr?=
 =?utf-8?B?MXRsZzNrRmdJZ3dYTU5Ib3lkMXBVTm5jVE5MM1JHcXJlc3dHZzJ5ZDRQRVNT?=
 =?utf-8?B?dzI4THZ3Q2JscHhVUGxaK0VFeEE3cGNWU0xNcWY3L2FNRnRPVStVWEtsMlRU?=
 =?utf-8?B?R1pHMW9oQUx3ZlhlY3ZtSit0YklVSlgrcHpERXNkYWtUSFVkMXRQMXNveVhI?=
 =?utf-8?B?ejV2VnprOG1DeGdDS1ZyZ0pVSGFCTjRCSXRGUWxhdnRsZFVRcUxmN3R6eWFm?=
 =?utf-8?B?b3NkMkVCSzcxT0hjb2E3ZGdmSTNZcG51dzBOK3VWMkhLRHgyNVYwVkNkcDlR?=
 =?utf-8?B?NHg1eUk2L28wcmpQNy9xZytnWHR1eDZuTVA1TkNjcTllRTA4QXhJTFBpNHEv?=
 =?utf-8?B?bXBhZTdaalBXak9KL2FIT3dML3FjRGo4WkY1a29iOE9pVUFsUUtEVnZVUkh2?=
 =?utf-8?Q?C01vNzDPNFusJ29772d/A1VFsj1YKfuS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG1wVkE5OUVOOHRoeXhTNnc2bVRTZHZZbVRtYlRaQW1DNFBPQUNpdjlYY1JK?=
 =?utf-8?B?S3p6ei9jR1RYeEt0NFVCUjRaa0M0aURSRFovaDh2eEhyUE1OU2lEK3R3ZFhz?=
 =?utf-8?B?cXg4emdJR0xYeXZGZXhmYndsMmNPVUpaT3I1bHN3N1JmMlo5RmhsZFZLdnhP?=
 =?utf-8?B?bjRUZFgxeUNUN1FYWEJ5TUlFWlFTRHdSUFFBTWN4T2NNeG03Qm1ubG84Nm5j?=
 =?utf-8?B?c3BZOE5EYXlRTWt6dFcyZ05leTIrYmxvVHhpTFR1S3Z1QkhVYldtYjNpSUlN?=
 =?utf-8?B?WkpTNmJzWVo4NGhKT1ZTdzZ6cGMxcFBGVU1BTWdab0YyV2U2VGFISzdOQkFB?=
 =?utf-8?B?MFdEOGI1cnN5OHA5VXJDWFNxOGtIWUUxSWtwa0Q0cDlvS3lTb204RGlYV3RQ?=
 =?utf-8?B?cWVoQ0dxOFk2UEUwcWc4aHdBYWo2bFF4TzY2aUhzQ2lQd2wzcVdmbld2Y29W?=
 =?utf-8?B?RGNITm1mUUUzVEpobnBObldSZURwQUtnOVBTbUNSOVJkUGJNaXZTS1FsVmUx?=
 =?utf-8?B?Y2Z0ZzN0enF1Mno0blFlUk52dm5sRTljMzJMRW5qR2pZM3h5MHl5VVUyZ0N6?=
 =?utf-8?B?MndXTFR3eUEzb1BaanFYdlNwYnQ4ZDBGcjRvZXhOUzVxeFN5QllIU3lhcDZZ?=
 =?utf-8?B?TTE3bUlrSXd6N0xvSnJLRjhPcVN4N0dVc3l0UjM5MG1jU2EzNjlpN1NBaU8w?=
 =?utf-8?B?aFcxQU9YT1BOVmVvV3pnaEJ2d3BVWndJV0Zzb3VEc1phdHRQQUk4VEl0STFx?=
 =?utf-8?B?MUp2Mjc1SlBOTldGVkdhR3pJUUp2NFUySEFVWjJKNXMxVHZrSmp4VjV1cUZ0?=
 =?utf-8?B?ZCt4WXE1TEdCY2dsY1hPRHJFSWdtN1BQYWl0VVpIaWhsbVpOODFjYXI5dmRH?=
 =?utf-8?B?SlB4VVZ2YjJjczZUTUFka0xxblYwL3JvVjFJejBuaG5va0RWL2paRWl6MWRP?=
 =?utf-8?B?K202aWU3QXY2RjZucmtkVHlPUkh6Wk1pN2JvS3o0VXpPbVY5VllsY2NZQk9x?=
 =?utf-8?B?T3ZWb2c2QWh5b1dwM2Y2VEVzTURsVTUzZkhaQ0JPazBrdzVvTzd0Mlo3bVVq?=
 =?utf-8?B?eHRScFFlaTZ0Y1JLZXBoZG1KVjFhK1owQ0MyOUkxcVFFOFRxVzhnRUc5UWU1?=
 =?utf-8?B?OVBjN09rcjZobStFTkpxU24wZUdVaXc5SWM1K0F1azA4SVh2dGZaZWZNZXY5?=
 =?utf-8?B?TlJHS2owUitkcS8yUmw2ZFdEbjZhVHQrMHRoL3dRanEveDdjZDhQRjRDQk5k?=
 =?utf-8?B?Q21ycUxVV0p1WmlaRG5tdUtlSXcwZjBzY2xJeXJMc2VFWDhiOUFIWjgvcC84?=
 =?utf-8?B?aEtVQTY2THhWNVhld0pzQ09KazJKdkY1cGswR05iL2lBSmV0RE52a1I5dUov?=
 =?utf-8?B?aTN0NjgyOWo1cXNpa0NOSFBxTnhQd1h2NHlTZHdReXJhcU1PTTRsUFNkNTFU?=
 =?utf-8?B?NW1pTW1nMk9FT1pKTllCczlyMEFDMEk4dlJNTk5UbnNxd1U0MWZNcGQxRS8w?=
 =?utf-8?B?Vm5EVm1iZk1TN3hZUXZBdWp3MysxaXFYZjQ0SFduQWdEWDhMYjdKbVlsd0Qv?=
 =?utf-8?B?UXNNWUxqN1B3aEVRVGdSc3hUMmpIelVnTHg4b1NTajFacEk4Zkdha3hQSTFO?=
 =?utf-8?B?VXJRT3N4UWlKTUMvVVVmRjRTYm5IS0xicG1QYzF1cXRDQTdRdXRJWmYvQ09r?=
 =?utf-8?B?VjAyWGVVR3YvUjJsTFBIQ0k4K3BUZlF2RVRjb205M2V5Y2tSY2x1QUl5YkRo?=
 =?utf-8?B?dzhoZWc5dVZLU0dmbm9SWkJvYTd1a29sZEJsWDE1MUR1MWpIeWN3V2lNQkhI?=
 =?utf-8?B?RFJINGdQVXl1K2l5ZEtYNE1hcWcrZzdaTDNqbHI0b2kwL2J6SDVPbS9LdHIr?=
 =?utf-8?B?dkRhNGc5SzFWZlRsSWxIVmt1aXVIZW9Ya3NhQTR2QXR3aS9pcWV1WWFOcXdk?=
 =?utf-8?B?VnMwMmNzWkx0eER5WllRaStPSTdNejBPTHpvSFdPN2VFaVNUbXkxWlhaakM2?=
 =?utf-8?B?d25RNmQrYVF2L2dXTVJPSHVMemxDMmU0MFFyUTJXMVN6b2VncUlsZmVnZ1Nx?=
 =?utf-8?B?STduZlRlTjI5dGNpUEp0dldwRS9kT2ttYXhzaHJqT0pHNDRxNStOa3QvNWEy?=
 =?utf-8?Q?Jno8l7PGtAegZRIjC4xj5RM77?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31d75fd-87c5-44c2-2338-08de29353e0c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 19:36:18.6099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pO4mC1jl4VZcUqrz1LPZHEtka34LNsx47N1S2diBF2KZdt1ONHMqEpyndLtAtmxa2CF88P9EkPGYve8xoK8OHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313
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

This patch passes this week's promotion test.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 10/31/25 07:02, Dan Carpenter wrote:
> The .H_SYNC_POLARITY and .V_SYNC_POLARITY variables are 1 bit bitfields
> of a u32.  The ATOM_HSYNC_POLARITY define is 0x2 and the
> ATOM_VSYNC_POLARITY is 0x4.  When we do a bitwise negate of 0, 2, or 4
> then the last bit is always 1 so this code always sets .H_SYNC_POLARITY
> and .V_SYNC_POLARITY to true.
> 
> This code is instead intended to check if the ATOM_HSYNC_POLARITY or
> ATOM_VSYNC_POLARITY flags are set and reverse the result.  In other
> words, it's supposed to be a logical negate instead of a bitwise negate.
> 
> Fixes: ae79c310b1a6 ("drm/amd/display: Add DCE12 bios parser support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Please note that I have not tested this.  It's straight forward enough to
> see that logical negate was intended, but it's always good to test things
> as well.
> 
> Harshit and I only recently created this static checker warning.
> 
>   drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 04eb647acc4e..550a9f1d03f8 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -1480,10 +1480,10 @@ static enum bp_result get_embedded_panel_info_v2_1(
>   	/* not provided by VBIOS */
>   	info->lcd_timing.misc_info.HORIZONTAL_CUT_OFF = 0;
>   
> -	info->lcd_timing.misc_info.H_SYNC_POLARITY = ~(uint32_t) (lvds->lcd_timing.miscinfo
> -			& ATOM_HSYNC_POLARITY);
> -	info->lcd_timing.misc_info.V_SYNC_POLARITY = ~(uint32_t) (lvds->lcd_timing.miscinfo
> -			& ATOM_VSYNC_POLARITY);
> +	info->lcd_timing.misc_info.H_SYNC_POLARITY = !(lvds->lcd_timing.miscinfo &
> +						       ATOM_HSYNC_POLARITY);
> +	info->lcd_timing.misc_info.V_SYNC_POLARITY = !(lvds->lcd_timing.miscinfo &
> +						       ATOM_VSYNC_POLARITY);
>   
>   	/* not provided by VBIOS */
>   	info->lcd_timing.misc_info.VERTICAL_CUT_OFF = 0;

