Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59FCA698AA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 20:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F3610E11E;
	Wed, 19 Mar 2025 19:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZFBYxUvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9427010E08E;
 Wed, 19 Mar 2025 19:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErpKJOlWUhd9/cyOzVHl8xFgFH9mzdghEjxSAPGfVckEg6hFf2BO611xCMtobcY9GHO0txVJwxz4Qby8QyZHSCv7EkrmFArBZz/d+fJjvuFv9VrEsFht4BaFFh9hMQ7fl0JR9otrNb7jzAS5InoMyz5R2/SFFD3Lx+PrWcpb6p8xk2zweD9RvOhElEtKpqKeJOaTJZ8S3E2rLj8d/pf5Tw2woVQgBkYPPCD1F0PfSPKsZ0V79yJv/qi+34BPXt6kjQNnrVNbGdAihQoWQdQixvc9hwh1y1pEC+j52dnNLCMoWQSiwRNOO/zAzGal2s5Y65u9+ALQKT1RCFW5OKQZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0FwQzv2srRy2HRHbLEwHbbPY7iK/wmtVfdQ5UaEqmM=;
 b=iMxaNmontx/8qE9as5aaI42kkR66AWJaKIDYlJSGDZpPjh/s640NtDmGskk641Enh2qjcrx3dGI9h1w1kYEEt3Hn6kX+Twk90ZlszRFhewS/nZcDlAk9XydJTH/BgLpoxDlx2pMkpEcNqES7uU4WoG0ICJ79x1Z05+h/MnfJl93iWsTrqZd3QcpBmMW3rHt85CTIQBjGo2JsITDAa5j0367Sl7qMfd8+c/ugOxse7ue0M05rdBk40iM/vZKbTa3x0l0w8cYIBoD67L8NsG578L+TPG8obawC17mp6mYKvKXCRyodzG1rl2bAuuOYdZVhmSDiTDLdft8uxberRg8J3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0FwQzv2srRy2HRHbLEwHbbPY7iK/wmtVfdQ5UaEqmM=;
 b=ZFBYxUvvYRuZ0BJMpjEznyRja9p+uMGqwOmhXf5j0bu986rs5TTn2BwkCjzgaQOgKDzi4UoKrH5JbogN5KqJR4MjRyv3aoYIJeXvLqv4kdBnBXuZC/ox6vlqg/l5p+rkS8un1nteBgPr8v5V9kKJcv+hacd0+zMOwl0V33tibrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB8016.namprd12.prod.outlook.com (2603:10b6:510:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 19:07:35 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 19:07:35 +0000
Message-ID: <d020cdcb-5e7b-4307-b3cf-ccffe9cccaa7@amd.com>
Date: Wed, 19 Mar 2025 15:07:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics caps
To: "Daisuke Matsuda (Fujitsu)" <matsuda-daisuke@fujitsu.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>
References: <20250314011809.3243791-1-matsuda-daisuke@fujitsu.com>
 <BL1PR12MB51445BCE0365432BF55DD3EDF7DF2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <efa255c2-efcb-4f6c-8864-3791d1969520@amd.com>
 <OS3PR01MB98657096B7CACA994F9B3E21E5D92@OS3PR01MB9865.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <OS3PR01MB98657096B7CACA994F9B3E21E5D92@OS3PR01MB9865.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0277.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: af7a5e68-633b-4d93-85fe-08dd67194ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWJEb1IrODlya3UyUTNSOU1aeEF0djd5anV3RWlvVm5jUEZ6blRqS3pGeXVW?=
 =?utf-8?B?b3lWcDBCSDR5ZHFXcjhyQTZmMTlUU2xEZEh1akwwVmZNN1lWV3NyWHJSUmJv?=
 =?utf-8?B?VlJwSlBjaTdaYkdUaFVwL0p0bVRiWFpOTzZ5aDFYM1ljTWw0NEcxaUVVdFZ1?=
 =?utf-8?B?V1BOUGdPd3cyUksvT2pXOCtQWGRYTUFVR1JhNXd0ekh6bGkyYyt3eUxqeHNq?=
 =?utf-8?B?dW1OZStDUVh5aUFlOWJpa1dSK3FXeW5MaUdTT1M2cjZLeUM2aS9SUWZQQUl0?=
 =?utf-8?B?UlEyTUVTZVJjZmswWTVrRGQ0QWVUbnk3U0xZUzNSbTZoc3p6KytwbURabGtH?=
 =?utf-8?B?RHIrZHlvZWJoYjlWV3lKTXJxemhHSStTTkMybnBnODliMGpqUG1FaDRJYkhl?=
 =?utf-8?B?UW9SVUN2OXlaeHlzZy9SVXhiRTJnSEQrdVBGWmwzd2VwYVM0Tm0yNzloaG9y?=
 =?utf-8?B?SVJjcDVLUzk5V3Ixd0crNUFhMDlBYm9UaTJtWFVBK1B6MlBFY2lFU3BjVXdz?=
 =?utf-8?B?UU92UWJZekVIaEpKbkxQU1RlOVFCU0xGOWZlZ0JkekhUdFdVTDZwdGhXWE0z?=
 =?utf-8?B?OGtXTHJPT2pCcHdnZ1F4MFc5Tis2NWRoSUlXbXhXY2ZuaU9lYWtuOThLUU5o?=
 =?utf-8?B?eVBMMkRwN2ZOUlV3R2NndzN6ZlVLTkdlZG5NYXl0RVVVZEsyUUpQS0VxR1h3?=
 =?utf-8?B?b1FzVXhZcU9uN3plQ0JjVGxKQW5MWWlnYWs5YlFTQU44NnRaclVwUXBmVnlN?=
 =?utf-8?B?YVphUlpsdjE5WXlGOU0wNmIydDNzL0R1MnFNWEVCYzJ2VFA1OGVXY2FZZmg5?=
 =?utf-8?B?SWJ1NkwyQ2ZRbFRxWUtLM29jYXF1Yk9uaE1MTFdZUCtHSFFPcit3a21ST0k1?=
 =?utf-8?B?K1NoNWJpSjYxNzU0S1BRUmlMdlZscHZCQ2NlTUZ2WmJnN1pEMVM5S1hpaXdR?=
 =?utf-8?B?bUhqN3o2aE5WOTlINWlQV2U1VWdyLzRTUzRGY2VybWdXVDJCVWpkcWErQ1JL?=
 =?utf-8?B?MFpGeEIrMDNPZnZsR2JOaVo0a3FLVm40MW1mcGpGeDF0OUVWZDJ6RTZDMW9V?=
 =?utf-8?B?ejAvQUVyQTlYTGwyM1RKUDNxNHFHYkJSQ3hFQXArcEdnSzh3cXR5cjM2eVVD?=
 =?utf-8?B?RmNtUjQvRk1rcmMzZ1BZTDJXZFdXdkhBaDBYT0E3bFNYd0piRXFxdmVhT21l?=
 =?utf-8?B?eW5STjZTcFZqeDNDUVh0Z2szeWdEKzlmUEtaRi93N0hhd3JQOXJxVU5ZK1JJ?=
 =?utf-8?B?RXh3QmhGcFlHSjhGRzloelI4M3U3Rkp6eHFtc015dzh3eFlBMzJCR3Q2NTN2?=
 =?utf-8?B?eWFSVTJWaVlkaVJTRlg4dEtBZlFqaDZoaWJUVHlGc25NZDJMWGxaeGk2Wkxj?=
 =?utf-8?B?T0grZnNrNkpuVURFL09laG11TUlXRmlyZnYyWk5kbmtvUU5KcGJkcEpiMWtw?=
 =?utf-8?B?cU01dlFqV1M4MlZKcEwvTDdpTXJUQkEzUTdoZXo0SG9ud0prTXZQbmwvU1hJ?=
 =?utf-8?B?SzdYMGRUaGlhL1VnK0hCRk9NVzQ1Q1RPN1ZWK0psOTN4Rk84S2JYckNHL1V6?=
 =?utf-8?B?cFg5ODNxUVVMVHRMOVJmWEZnNGNHc2F3WURCR09PVVIvdHowbHgwK29WeHQ1?=
 =?utf-8?B?SGJpUnBxMWxKZDNMRmNmbEJHbitsSmNVb1JhZnpKUkVqY1JkSUxKampqY3F6?=
 =?utf-8?B?YVprTUpNT3Q3MzU5Z0dHWDM2T2VadWVSTHJzVXdrcGpWYjN2WWRZR1RsUjdx?=
 =?utf-8?B?K29NV0hDYUhmWmpJSCsyWE8yRVNUWkhadVBjMmdNNUp6VmR1V1ZWT3o3eUpV?=
 =?utf-8?B?VGMzbE02KzZ3WFVBTE9kQnRnQlNRT2MrU3FYRFI0ZlhHWDI0WVVNSHpTQXFv?=
 =?utf-8?Q?Cr9p9kIrCdsuh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlNveHV0NG9VMnlKVVRIdjRXdUxZS2wxRDRSNERCVURXMEJNSy9oYndwUFMv?=
 =?utf-8?B?eFYrMHNHampOc0RkMksxT3ZjV1BSUTMzb2FYdzFUV3JLbFo0K1pvRGx0YjNT?=
 =?utf-8?B?VUtqM2V6c29hZ2RBeTdFenRLRjg3VVVNY0hwa04rdUllVUhmTDFrU2k4MnVN?=
 =?utf-8?B?YStrVmdvWEY1ejBRZE4zbnFhQmZkMzk4Z2pOTnlNNXphT1Y2RlhLZzZLWHRY?=
 =?utf-8?B?R3J6WVB3ZC9ZSkFLODdIVkFyclNQYTI4WlliMEdwai9IdmZCNCtRY1ZKWmJa?=
 =?utf-8?B?THZITlJxUmtXbkdlc0VMNGM3eFM4dzJZWWRMMzBEREJ4UVZzS3N5MFUzVHlm?=
 =?utf-8?B?M1ZwZGRmcVYra0ZNRDlPL0hjdS9LaGIrcjNreFBGR2E5dncxTmJtMGVmZ1Ez?=
 =?utf-8?B?ZDdJbHJmcTNOZTI5MjR2bmRud1dhL01VcVFIR29hYmpPRFUySzZFTVJFV3lv?=
 =?utf-8?B?QU12VDZhOEZuWmd2ODhxNXd1N0xKN3pyOXBNNnlYSlRtemNCYW14TVAvOW5l?=
 =?utf-8?B?V2pQQ0lIdU5hS3FpOXVMZHFnMDFERjZIY1VTVFNueGxuR3UzMjVlc2lPNkY4?=
 =?utf-8?B?L2dSdVJMazVsVHo1TURQaXFRcXF0Y1ZHUkFzTTV1Q0JsQkYzeGdMcDNzc1RL?=
 =?utf-8?B?RXlGT0xwV0hLUnFmR3FJUTBreHpWY2s5dWhITVBaMkozL0hIa3NiKy9STW16?=
 =?utf-8?B?REdqNktwenkxMytSOVdiaU5hN0tvZWN1ZnpjS3RzMmR3eTJLQUFVcTJYZ24r?=
 =?utf-8?B?eUR3c2ZRcDBhbU40cDZZbkp4UzM4WGhYWW12bldQS0duL1NEVkRmOXNpY3Za?=
 =?utf-8?B?SEJkQmdYend0VVpldklYMWxKZHM5MTRPNEY1TDFYZjdBQ0VFLzVVNnV2WnRV?=
 =?utf-8?B?a3JFdEE2SHJtSTlSakF4YVZna2dzV3FJdFFiZktkNDBGMmRCZXRvQ0pZMjg5?=
 =?utf-8?B?TXphT1hQTlA4c09QckVYdnZCcmRJcDRMN1dSNEc5Z1k5YWcweG9rM1NqdUZs?=
 =?utf-8?B?aWZkd0RFUmd3RkNGT3Y5djNSUXFWbjhJQmUvTUJNakhDZ055dXNKYzJrd0hw?=
 =?utf-8?B?Q2lLcU1kN3FZWW9abmRyK3FRa2I1aUhNL3JHSXJpNWQ3V2lscDUrMWt1WUhZ?=
 =?utf-8?B?OWRDMzF6dXgweEdpcFFVOGt0bzBkMERGNUYyd0l5TmpBa3N6NWV0SXR2SGp5?=
 =?utf-8?B?d3hQV25HcEVNaXZwYXlNL0tlb0RuQUNkWVlGR2dvSm4zaVIyWFF0YmR6VmJn?=
 =?utf-8?B?MlExWlhoelNhSUVFWXBGb3dHdXVvV2Z1QmY1YUlLcG1xT0s5TlRyaHRSRFh0?=
 =?utf-8?B?Rk5nbnVjRzdUcWl1a1dNREQvdWxaRGpML3hBaXVkQUxSRGRaU3Z4bVAyWWti?=
 =?utf-8?B?dkViRkJycmFzZHB3VEVtUTRBeFZwZlU3UEZSc1U3UXZacDE0cUJtU3JnRjZw?=
 =?utf-8?B?THpjQkgyN1ZRdXF2Y0huM1hvM2ZLYVlwSnpJcDBVV2E0MDhHdVdySlZoc01B?=
 =?utf-8?B?djV6WFpVdjVVbHIveW1ubUxTdUJLQldxWlRpSXdxcjV3UmxqL0hDVVZxOVhu?=
 =?utf-8?B?cHNsNi9Ed285UXJYblYzT0dDbFZJSFRPaVN1L1dWdmZNaHJsNUh2R2FMZUpj?=
 =?utf-8?B?MzhDcWlzNVZtMzEvOXQ1SzZqSWVFanI3MlZJeXVNWHJPamJUNDl5UmxTMHV3?=
 =?utf-8?B?ZmFnWjl2ZnVUNHhZS2V0OU95YVBUUzZPSW5wa29xM2ZRSlhZbXo4cnc3WVFS?=
 =?utf-8?B?Ri9NY1l4L04xcWt6bEU3eTdlWDFzaU1PbXlzTUtHTlFDZzBrUzJ0NkN6aU4r?=
 =?utf-8?B?T0t1RWRreWFyYTUrUkF3Y1N1SHN3NURKV0o2dDFPejAvMHhWdUgwaVQ5NGVQ?=
 =?utf-8?B?MUJYSUovbUgrd0MxclFTcUM0TnJrUU90SWRNS1pwWEdZNjVXc01qR2VnVFJk?=
 =?utf-8?B?Vk13NkNWVDhMVXNzV21iL0NSS3VwL0pNdHhqZnNTTkQ0NHVtcEJyMXYwTnlF?=
 =?utf-8?B?TTVHVm9zeTVpWGQxTlp4cVJhcFdRd2VpUnlRa3ZlV1RhMnBkQW9pMFAvK2VN?=
 =?utf-8?B?dlhFMzJLcXEvbjZieUxwSDI2ckNwRm4xUWowR0lnVThseWpReStvTHhOb243?=
 =?utf-8?Q?LSQadIneP8n+zfcjzpo5+I7p/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7a5e68-633b-4d93-85fe-08dd67194ecc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 19:07:35.2358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1Dve2FllBJghBaHfskmz8tOQnTVEm1v59fFOS86dK7YGEFPYFoDdAf9noTexFdUA3ZImjVQmGui+M9JKOBcyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8016
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

On 2025-03-19 03:02, Daisuke Matsuda (Fujitsu) wrote:
> On Tue, Mar 18, 2025 5:35 AM Felix Kuehling wrote:
>> On 2025-03-17 15:07, Deucher, Alexander wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
>>>> Sent: Thursday, March 13, 2025 9:18 PM
>>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Deucher,
>>>> Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>>> <Christian.Koenig@amd.com>
>>>> Cc: airlied@gmail.com; simona@ffwll.ch; Daisuke Matsuda <matsuda-
>>>> daisuke@fujitsu.com>
>>>> Subject: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics caps
>>>>
>>>> Currently, ROCm requires CPUs that support PCIe atomics. The message is more
>>>> urgent for GPGPU users, meaning basic functionalities of ROCm are not available
>>>> on the node.
>>>>
>>> + Felix
>>>
>>> My understanding is that PCIe atomics are not strictly required, but there are some features that are not available
>> without them.  Warning seems a bit overkill and potentially confusing to users that have an existing system that
>> otherwise works fine.
>>
>> I could see either argument. The GPU is capable of PCIe atomics, but the system configuration (chipset, PCIe switch, etc.)
>> is preventing them from working, which has an impact on some application-visible functionality. A naive application that
>> depends on atomics and is not carefully written to provide fallbacks or fail gracefully in case atomics are unavailable,
>> would fail silently or produce incorrect results. So maybe that justifies a warning message.
> The Linux kernel commonly uses "warn level" messages to alert users when an incompatibility restricts functionality, and this approach aligns with that practice.
> To address the concern about the message being too general, how about making it more specific like this:
>    dev_warn(adev->dev, "PCIe atomic ops are not supported.  ROCm performance and functionality may be limited.\n");
> This is more direct and focused on the impact to ROCm users.

I think it's not a performance problem. There is no general 
lower-performing fallback I'm aware of. The functionality impact is 
limited to kernels that try to do fine-grained synchronization with 
atomic operations to system memory. So I'd be wary of making the message 
too scary without giving any detail about how to avoid problems. Anyone 
who reads this message and doesn't know what PCIe atomics are, is 
probably not affected.

Regards,
   Felix


>
> Regards,
> Daisuke
>
>> Regards,
>>    Felix
>>
>>
>>> Alex
>>>
>>>
>>>> Signed-off-by: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ++--
>>>> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 2 +-
>>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 018dfccd771b..faeef136e272 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -4374,7 +4374,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>>                        return r;
>>>>        }
>>>>
>>>> -     /* enable PCIE atomic ops */
>>>> +     /* enable PCIe atomic ops */
>>>>        if (amdgpu_sriov_vf(adev)) {
>>>>                if (adev->virt.fw_reserve.p_pf2vf)
>>>>                        adev->have_atomics_support = ((struct
>>>> amd_sriov_msg_pf2vf_info *) @@ -4395,7 +4395,7 @@ int
>>>> amdgpu_device_init(struct amdgpu_device *adev,
>>>>        }
>>>>
>>>>        if (!adev->have_atomics_support)
>>>> -             dev_info(adev->dev, "PCIE atomic ops is not supported\n");
>>>> +             dev_warn(adev->dev, "PCIe atomic ops are not supported\n");
>>>>
>>>>        /* doorbell bar mapping and doorbell index init*/
>>>>        amdgpu_doorbell_init(adev);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>>>> index b4f9c2f4e92c..c52605a07597 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>>>> @@ -240,7 +240,7 @@ struct amd_sriov_msg_pf2vf_info {
>>>>        } mm_bw_management[AMD_SRIOV_MSG_RESERVE_VCN_INST];
>>>>        /* UUID info */
>>>>        struct amd_sriov_msg_uuid_info uuid_info;
>>>> -     /* PCIE atomic ops support flag */
>>>> +     /* PCIe atomic ops support flag */
>>>>        uint32_t pcie_atomic_ops_support_flags;
>>>>        /* Portion of GPU memory occupied by VF.  MAX value is 65535, but set to
>>>> uint32_t to maintain alignment with reserved size */
>>>>        uint32_t gpu_capacity;
>>>> --
>>>> 2.39.1
