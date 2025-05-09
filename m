Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB50AB2066
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 01:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886AA10E096;
	Fri,  9 May 2025 23:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LUonz95w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CAE10E096;
 Fri,  9 May 2025 23:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzwbuzVbH+Y+SNUMcudAkXUmgHzmqlyOEkP6++xLS10LLNHFV56niAPo8RzeB+vbl8zBEdOM380gNJobEeMbNf8GxnPWAXY4+OJufwN7lopzfcmLLZhkoOK9LGrkJM3etKbHM7u+gOcaO5P2Rw8/e31ibVR9Iv63tzIwEHqOfUfJGVfeCJF2zQI0SFCFQDlry1ZdH51AHJ4skQYh8pEW7084wmtwK6Ow8m9GSKYlIEMqjWNy/s5tlsIbIMW41ROQLmFvLajdlA12G5eFJjUDaY65f6fXoZsktxMc99Ofhf1jWDfyOKl8721apiNG7nu4ptT8t2J0jGZTo9SIUxlRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3avSc42qtul26pjf/sls6kwQSKshE6G/VixwRz74rU=;
 b=p/iGzFnrB4zB6ItHQb6XnEP+J+sg5k5UVSyEPwe7nmCejd9Gz7V/MW8GMknoRhDDQuf48dA/iujco05mdPSp1rCzSNPia08HJh4g0nzcrPdW0RQmf1oKKfmmO5cGPZuT2NVCiJ1hcN8dOzLQcjMPGI2krcJukIG/OSDzB3zgfTlbgCifPeLCiQc2eSqgzMqhFVtfARDqYdVG777009vzRMMKlWCqIhy1QUFRIBa3r+FQ69vsXahFUwLI/zu/aTEcEGBkRG01CN1b4pxd7RtBUOZLPS4hFhr3CSpIUDtyh2NuI8mel5g5vdJIQwmKYeGFAy2wx7n3rZvvgizzhgVUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3avSc42qtul26pjf/sls6kwQSKshE6G/VixwRz74rU=;
 b=LUonz95wh0aQcwlHozDgAIz9yBFCHUMMufydYaLhIKUxW02L0e3w53MUnS2HiMKD3HY695EoIJW1m4MuP4JphR3KajN8D+l1oVwPOr8A+Oo9l32rTTHhHv0S+ciGNmDYHgbYXDCBqd9lkpF05L5VL23/SfCjO6C4uwJqhfggY7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA5PPFC3F406448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 9 May
 2025 23:59:01 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 23:59:00 +0000
Message-ID: <99b0aeb8-bfaf-4720-95ce-8196ece640f0@amd.com>
Date: Fri, 9 May 2025 17:58:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix null check of pipe_ctx->plane_state
 for update_dchubp_dpp
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, rostrows@amd.com,
 chiahsuan.chung@amd.com, dillon.varone@amd.com, austin.zheng@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250430141156.827763-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250430141156.827763-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::39) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA5PPFC3F406448:EE_
X-MS-Office365-Filtering-Correlation-Id: d35b8c5a-a4f5-455d-73a0-08dd8f5577ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE9FZ0cwTStJbU8vWXZHVExOUE5RczVJWHI0R0Y4dHJvY3lyZ3NNdXNjM0hm?=
 =?utf-8?B?aVBJZVo0MHF4VzJqQldtVjQxTk4yMy8yMlRpb0o5K1h0TE9KekZaZityMTJn?=
 =?utf-8?B?aFJIeU5UdDMwdXUrUktQZTZSRmlZbDUyTzFSNkI0eXhmQWNOL2J0M24wUWh2?=
 =?utf-8?B?Q1ZQUFA4eXNpWTJBdVEzeW0wcURvalFtRjAwRklSRnhJNWtPZzUvOHl5bmt1?=
 =?utf-8?B?MFY1RVpoV1poSDRyR0QydTdQeElDMGczVFBHWmxLMWxLaElnb2VtRE01R3lI?=
 =?utf-8?B?WEhkWnNQdEV5U1pPOFhPS2prYVhjZmhFNHVTQnJNK1F5SE1OMEs3ZkxvYjV1?=
 =?utf-8?B?c0dCWkNiNWtjQ0tERDhDYWM4dXdvZzdTcWJYOWNKS3RSK0dlZGp4M0ZpTytC?=
 =?utf-8?B?N2NvekpBZDIySUd6ZUdYZ09lZDZ0b3A4aXRBdXhGU2Q0em50QytDSWxOUkVs?=
 =?utf-8?B?bFVJUFQ1S0lUM3pKdnAxYmFJSy9wWEs3dWxDWnB3ZHM0TW13aDFoSll5NExK?=
 =?utf-8?B?VVBsM3o3K3BFSHFHM2YzRy81bFBRYWZXa1JaNjhCRE5zVWh3UzJoT3RDUnlq?=
 =?utf-8?B?UjRUYUJKdTJ0QmNXdlNWWW5hQmhIWTJPVWVKNGtNUDl2MlBRM0wvVFBma2xJ?=
 =?utf-8?B?d3c2RjI0QjZtS2g2Z0dvU0d3dy81VG5sR3d6bkVORGgvVSt2WVYxWlF4T0dk?=
 =?utf-8?B?MzhKYjl3M2pGb2lHRlZWcStSQWdxRVRLT2s2RE50bnF6cCt6Wlh0N2diUGc2?=
 =?utf-8?B?SnFscytVcUlkT05PQUQ4YkY3cVlTbGtwK1o2UVlLZUhybzFjU0t3dUJiSTRH?=
 =?utf-8?B?U2U0UnVxdlo5bC9wOUNOem9CSWxEaURXSUJONm5ZR2VzRk93SldnRHR6bVpj?=
 =?utf-8?B?aWlBcFIyRWtWdEVCVkRZQmdaSlVCU2xBSFZLWnJzQ2VGNGp1T3pqSVRnbGdu?=
 =?utf-8?B?VnZMOUVOdXRYWnAyYzhYbytoODcyTWNVTkFOTm9wQXYzbWVpb3drVC9Nb3Rn?=
 =?utf-8?B?YllwdFdPRnJHVzNFaGNGZjVCVFRXTVEyVmcza0VYWVJCR3JBWUV6cG9helA4?=
 =?utf-8?B?TlNXU1pjYThYKzVyYjZTV2ptNmNLem14Rnp4VWdxczh0K3dzNmM4OGVHYU5P?=
 =?utf-8?B?WFRWTDRNeEI4WHQ4ZDdxQ3NVVGE1bXY2Z3crajRhNTNGUHRGb3RnQzAyMVpN?=
 =?utf-8?B?cEw0aVByTUxGVHR4NEwwWno0MUE4M0tTRkZmNEdUSDB2WUtrcjV0ZVhvYXI2?=
 =?utf-8?B?Q3dYZW1LZ2NUR1c0VGVEVStMSmYreHBSaGFCWC9aTElSd1FxNmJzOXIwbGF2?=
 =?utf-8?B?OHpRSzJIRi9kdWdPQ2JCa1JUaGpKeURIa2hhcStoVEJQUWRUSXltWENYek9w?=
 =?utf-8?B?ZUxEei9XaER0SnREbjJtaGFyaGx2bEhsWGE5cFdDZWZaQ0hQZ0pMejRycyth?=
 =?utf-8?B?YlR1dGtUall2MThkbDJHOWRBREU4d2pCc21JSWNUM21aVnF4b2t3TUlMcXpz?=
 =?utf-8?B?MVlPcGpqK0dtNTB6TDN2c1JFVkZZZWlqZlV3TnQyUG5Kd0lEaTkwdEFsZ3lH?=
 =?utf-8?B?SjFuV2lueGNyRDBzQ3ZidHJoSUJlZzdJSldmM09iRTRLMTE1blkyRE84aXIw?=
 =?utf-8?B?YUdTUmIrd3c0TnRmbDY0KzluQWFJWVg0Y3Y5eDdlSjRwWCt0bEhMd2JLSmdX?=
 =?utf-8?B?d3ZBRE5pMjNPZWFkSFlHMVl0MW5CT1IwT2txUjhjK3dHZmlXODQwZXpvc21z?=
 =?utf-8?B?L1VrZG5KbURYa0tTeVY2U2pKRXo4ajBBNWNtcHJSdUlhUjIrcmlCb0hQQnNF?=
 =?utf-8?B?WWt3R0RBRHhKdTFFWVBhUFRDcGtROTgzOU5RbnBvcHVXMkF1L3NzYkc4MlZY?=
 =?utf-8?B?TGl0OEI0TWxieFdFaWQvV2hvbndkS2xhYU56dWtaaWMzdG5BQzU2YWtvbE1X?=
 =?utf-8?B?SkREY2xHSXdqb2pOS1pjci8yb3RuMnNEemVFbVdBSC9uM1YyekkzUHpyVndo?=
 =?utf-8?B?WGIwTFJCcFJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVRqMlUvcElTOFM4NGo0T3hPRk1YSEoxYzJxSk9OM2Zpc3VSYU53VHNhTk9r?=
 =?utf-8?B?bmNwc0dPUGZpV3VnVjJrTWp2MFZEdytzVnEvTEVxWWZHM0hjcXFDWmNsSjJq?=
 =?utf-8?B?QU13ZWlnNCt5d0hjRFo3d0VrSVYwcU11YUFhd09RVktYTHhueUEwZXROZDBD?=
 =?utf-8?B?MVdpMXJWcGl5OHMvVFFoWU9qK21IZVFDSFArdEdKeGUxRWpUMTBLVFRNMEU5?=
 =?utf-8?B?TURROFE1SVArVkdGUXB5anJZT1JBSGlKL294U1lld1JNZmRCWjV6di84cysw?=
 =?utf-8?B?Y283RnA0eEhPMzZpR0pIVmVFaFgrNGlWb3JzaEZCSEEwU0N6WUwzNzN6RWxh?=
 =?utf-8?B?UlRXVTRXYng2Vm9MOFFZZG1mYmxUSldvMEdQaXd6Y1Zkam0ra1U1bU54WkNi?=
 =?utf-8?B?eGx1bzNNZURYSTlDdVV3NEMydTNSZGt4TDh6QlMvTWtpZkpMUnZPY2JzWllY?=
 =?utf-8?B?b2ZKam9ET2lFK2hDM1h4UXBZc3IvMGF3TTBtUllIRVJnUFVhZmFFQXpMaVhD?=
 =?utf-8?B?TWlNck9kYWtvZ2F2WmNWRHUwVTQrZTRGUFg5RmpEeitQVkRlbnpvaGtvZ3pM?=
 =?utf-8?B?a3pRMnlqeWhJMG9wYm5hbVZKOUZwM1l4dXBlMDZOYnNmcTJNMjFGQ3JvYlRt?=
 =?utf-8?B?Z3dzMFJMVWljRndjNUt2R0IyNXQ4M2xyR1pXLzI2WXFNZHpYY01KMW10cmY3?=
 =?utf-8?B?VnpFS21qSklPVGVSSSt6VGpkdXF2WDM3UTVBYUVWenFBZ0F1dWNIWDZON25i?=
 =?utf-8?B?QXBYd0dCSVpYeklQR2ltR3lmNnRUOWllTGY3YkhqbzlPbHFVNnNjRnoyTUNX?=
 =?utf-8?B?dVVDSnhFZFpCUnhQODQwWHhwb2JrQWhnZUE5RFMwcDhBbDZrVWphUHJXYzJK?=
 =?utf-8?B?V3NRQ1pNZzVGdElkbllhanY0WXMra2FwWHoyUFFUb1VLZU5CdEliK2tpMFJm?=
 =?utf-8?B?b2o1MVA1Zm9teXdvTTM0WFE1bFRwbEEwN3ZtcmNIRHBCSmt0NVJyTWwwVzFV?=
 =?utf-8?B?SHFveWVOZVVPeGRvTGxobVg2RTg0NjRFZ3FEMVY0aVhHUUhYUVJUa043V3V3?=
 =?utf-8?B?eFd4Z3JqN0liNUxQYklnQk9rbFNDSHdTR2pYWWgzdUlRVEw5a1Z6RlJGQUph?=
 =?utf-8?B?RzMxVXNXSVZQOUNvT205UWtpQVBSNVoyMXI4cEpzZlo0R3o5MXNBRUYvOUkv?=
 =?utf-8?B?NDV1MlVqNjJ6ZEVKQTcxMUhJaXg4Z1Z1QUp2aU13Yis1UEVmQkxPclVHSUhN?=
 =?utf-8?B?UXBjVHBlM3pySlFMa3VJZEVLdzBTMFNQZVhaQzJSQ28rYUJpWlhVT0gwNTlO?=
 =?utf-8?B?bU5CSnB5Mkp6T1p2U3ZPNUkvQ00rZENmTmR5MDlyamw2eU1qc1pYMFJBOXlW?=
 =?utf-8?B?aEZGd2hmSDZmREtpTXNZUnZuMVZVQ0F1WW5JSDZGcjMrbmpxWVpzMUJxY3Z5?=
 =?utf-8?B?ZmV4NTJKb0x3T1h2aXpadUo1dEJ6Qi8vZHNKaGhaTGhlbi9vb1IwUTdvSWtz?=
 =?utf-8?B?VFVpc1g3QkF0TndUM3o4bzR5UVNWVjVJVU1sOGs1OHJTTU14aFFkQUpBVUtu?=
 =?utf-8?B?cHA0d1V4dkE1c0ZzRUNMUEpadVg1V0w3VllwRm5ETFZ3dVZUNDdxWFpUb0NE?=
 =?utf-8?B?aW9vOVFkTS9lMGxUVUJOQ1g1UCtST2FVV0Q2bzltcWI3K3BYaGQ4MkNpeXV5?=
 =?utf-8?B?d2VxOVlXNk1kL0VYYi8vWFd3SERXTG1XZkpWbVAreGVLRDBiaE9MWG4wRTZ2?=
 =?utf-8?B?ZHc4dHF1Y0dlQjMwQlRvZmRLM2F1OVoycVoyNTYwckFOOWhqRU9ReTNCaDVZ?=
 =?utf-8?B?UHBZNjVyeCtCcTJleWEwRzhBSE5jUmJiYnpNQTRnc0hodHg1RVpITGx6cThR?=
 =?utf-8?B?Q0FtMm5xUXk1KzdOODQ1ZXZYM2h3c2MyRWUreXJOa05yNmViaWljYzNHVk0y?=
 =?utf-8?B?QVBmWnk1RWcydC83THdrSnVPZVpvekFVZDNzSlR1Zjk0OTN6ak54OGEvdkEr?=
 =?utf-8?B?c0d1NUhSbm5jY0hIQ2dMTlcrbVBOUlFsSlZ2bDV0Y3hyVDJJMW5xUFBYc0Zr?=
 =?utf-8?B?NVQyck1FUGpVVGh1S2Z4QndHejJHQ2ZMNUpGWmRiNUo5R1lNdCtEWk9pczNz?=
 =?utf-8?Q?2hn5We5uuQT4plrj1UHkH/WbI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35b8c5a-a4f5-455d-73a0-08dd8f5577ed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 23:59:00.7806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyYGS57xqYQ/etPNWlp/WwJEt9vlF8VGFtX8Jah8ZZhr2Km8MMm2sRRQYPlAp3S9AqEZzlh5ZfgRnBGMWwsjaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFC3F406448
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/30/25 08:11, Melissa Wen wrote:
> Similar to commit 6a057072ddd1 ("drm/amd/display: Fix null check for
> pipe_ctx->plane_state in dcn20_program_pipe") that addresses a null
> pointer dereference on dcn20_update_dchubp_dpp. This is the same
> function hooked for update_dchubp_dpp in dcn401, with the same issue.
> Fix possible null pointer deference on dcn401_program_pipe too.
> 
> Fixes: 63ab80d9ac0ad ("drm/amd/display: DML2.1 Post-Si Cleanup")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> index 8611eb9607df..c8c8a17ff183 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> @@ -2259,9 +2259,9 @@ void dcn401_program_pipe(
>   				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->hubp_regs.det_size);
>   	}
>   
> -	if (pipe_ctx->update_flags.raw ||
> -		(pipe_ctx->plane_state && pipe_ctx->plane_state->update_flags.raw) ||
> -		pipe_ctx->stream->update_flags.raw)
> +	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.raw ||
> +	    pipe_ctx->plane_state->update_flags.raw ||
> +	    pipe_ctx->stream->update_flags.raw))
>   		dc->hwss.update_dchubp_dpp(dc, pipe_ctx, context);
>   
>   	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.bits.enable ||

