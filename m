Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954DC91952
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E63710E8D4;
	Fri, 28 Nov 2025 10:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3f92hqA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72DE10E8D0;
 Fri, 28 Nov 2025 10:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUliT9RvdY+4sTzRYuCvpx8DnlohXYpa/vAi45mmP7DX7Q6w5EXQMon0q5B/S7EB9iP92ONzA+HKmO8U4/L5sSVSk+Y4A5N+u+L68NKyPK1U4i45jcLwfIBAQeAmVtTIkJYe5AiJAgFFY8MpRPRWcP2dm3QivgOkgv90TzJS04FxZBUJJdOa2DypUP1Y+keIwBr24yiGGXFGpM276fUvGvU8GoPTy3v/Zmr5qnLut/8LsAouILkeGF5p5g4kHNRgU2k5UFN0JzPMT7UzV78JfEStc/PV49oMFigoylDuqqQ2ZIaoFXvqfBQUaL7IdagKliAkaOAaAxZyywDZM7DXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQt0/XT5XWQfkfEZuefecuOj2JB+Fi1ghUWo/SlcwrY=;
 b=KPwGjmB2Ymu6LKcuhGhFNShFzd8DT3rwdMuwTXXA927BV0tP/A/Ovwqr5Jsu0Zo57a+XGf1HIzMAT0oNy6ivl9syzgeLr4QS1ESbmlZnCP+hf9kA39/ssODD/7A1bjakea/+ec/adpBahcam0vtSSIJEF2ZrFb5wOaEEQaHNH83BAUQljDSyYWMpLRTaHOoYRdjJff/e9G41+8B6U6lKJaBroZ2m7SJE3bTtRRwPwgbn3hY6SAw7HgmpfXoEWlbraI1mRT3BqArkpRBJ3e+wVaAmlIz5vXghahO0iurqwo6InASpeURoqDcztnxo26EgsVTkoXx8GVdqs+XYP63WUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQt0/XT5XWQfkfEZuefecuOj2JB+Fi1ghUWo/SlcwrY=;
 b=3f92hqA8QJVEPWq3s+3oQQmXGHtaG2gcKHZo1j782TQOiR6YpoSi9h3ry6t3AhZpF9v4i0DqL9BR4G2Ah6tqvvcZOTPrkh8qkC9ncpQu59AZh5OtGLkFTOEVXLXLCZcodBkAYRPSEymYAcON4Q4o9cdfRloe6GujyAE5zk5p8ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9335.namprd12.prod.outlook.com (2603:10b6:408:1fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 10:12:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 10:12:29 +0000
Message-ID: <fad3320d-e598-4e8c-8c19-7080627da658@amd.com>
Date: Fri, 28 Nov 2025 11:12:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-14-christian.koenig@amd.com>
 <3cf92ff5fa9c9c73c8464434b0e8e13e402091fd.camel@mailbox.org>
 <30c8a395-6870-4787-a954-6c9cbc68be62@amd.com>
 <29754f848abcf7aebf7950862ef780362034fcf2.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <29754f848abcf7aebf7950862ef780362034fcf2.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0984.namprd03.prod.outlook.com
 (2603:10b6:408:109::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: c570b175-5443-4c52-a5a6-08de2e66a305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXloeDFaUFBpQVhIMGdXckI1K0VRUUNnbnlLNWVJSG1OSUVlYTFqMUhCUjdy?=
 =?utf-8?B?Mk96NkgxMDVXRW0yZUlST3RNSmd1N3VZNHF4MlhpSDJvRkZ1MXQ2UHc4R3BT?=
 =?utf-8?B?OGJCTk9zZDRjSm5BVzZLOXZVOFVoSFF5VjRpZEpTV2RERzR1aW5MbGE5czBz?=
 =?utf-8?B?UjRZUitvbitPZGJpYUlya3JHQVdTOElYS2ZuUHBNZ0JhZUlpbEhNQXZUcXBW?=
 =?utf-8?B?RDMrcWJyei96eStTOWRXMXV1MTNjZ1NXWi9IamFBcGVnejNLb2JPRXFxU3JG?=
 =?utf-8?B?eDR4QWl4Q2tQUXJmRm1lRzZJaUNJenRtRGtBRFk1Y21LMGM2cHlmdHB4ckpx?=
 =?utf-8?B?TGg3eXV3MzFLcnpQR1lLY09FK2pSZXQwWjlTZ0JIRktTL0JBVTY2b0NzZ1Vt?=
 =?utf-8?B?bDFQM1BDb0Z1Zm1XTWFyQUx6YnhhYXFEbTRJR00wZTdqb0N2UkZPSkluWjdn?=
 =?utf-8?B?M1lUVDhobENuREhpeEh0UVQ0MHdqd3kzd1hFdC9oQkZuK2JvMDFMY3lEMVRC?=
 =?utf-8?B?MXdNczRpcCtIVlc2ZGQzZ0hXZVVjVXNEUUJLb24yZXBkQU92OEJxUm5GQ2NN?=
 =?utf-8?B?UXBZUG1JWTZBZjNtOFpPUzNnYjJvMmcxbk52UU1iNkxPcDdGcXRnQU84RkQr?=
 =?utf-8?B?cEdoRTZpNlJLM1VXMjYvWW1IdUFrcXVwbzVNcEwrYS81cGhBTXREanc5a1Uv?=
 =?utf-8?B?d2JZSm5xTDkvRzRsbkR5L1JJb2NQTWFjeWViK0NUaFUyQjd3MnJubkJyOHp0?=
 =?utf-8?B?TmNaY2pMQmF1ZHRBcWNHMmdWa2JycStqeGhFUDA4Sy9tcTd0dDBDNndvSWhE?=
 =?utf-8?B?ZnZyT2Q1V0w1NTVGZFg4N1ZGOGMwUFZoTmVMa1l5dVRPb3VZT0JQaXkyQkE2?=
 =?utf-8?B?TnVWdnJVNVMrUEF4RXB4UU1xV3hYRzA1THNySEpwL0dOcTlvZGpSMkN4aFly?=
 =?utf-8?B?Uy9uQ01uYURyTEVBd1lZQ2xnUGNMdnU0L2tuSFR0Y2tlSUVjRjRZRm0wbnNC?=
 =?utf-8?B?V2doajJraGVXcGhYdDUwMUo3Qk9VTG9VZ2wxVUpWV3NTMWhhd3ZsaG1tbHQ2?=
 =?utf-8?B?Sk9QQlBhNDFGQXdmdW9hRGZZdGJ0NUowcHB0K1ZXcnhLOXpzNnVTVUFtM09J?=
 =?utf-8?B?RjF3SXd3cHZ0ell6aG43UEFpeTdGVE9FSFlGOFFsVVl0dkkzU2ZHeWdjM0RO?=
 =?utf-8?B?dmtKaC91Rm04NTA0SktQYVlXRzV2bjNsWVY0V0NpRjhSTzduT3VlcU1ZdHNW?=
 =?utf-8?B?REVoMWRJU3hCdU1RRzlhL09Gb3lGRmhUL3Y1N0JPMVNlSkNqUFliNTc3WVQv?=
 =?utf-8?B?Y052M01MZ0FaODMzNjlMYmNSNmlBeEFhaU9yOUdDVjQ3U1g3RTBIcnFjOUxz?=
 =?utf-8?B?RGpUdkVLTjNlL0NLeDZqMERDS0dZSzdlV3hNNjBBeTZvRVVvSW5tZ1NPRHFh?=
 =?utf-8?B?Zk1tK2xqU3JpYjIrVzhrV3gyMENnSy95eHIxdnAvZU83YUdZVVc2S0R6RThM?=
 =?utf-8?B?VlBMZmpVQ0IvdTcxTitDR1RXejVNNm1OZHdjaCswUUVmeFlWbWlUZ1ZYQWJq?=
 =?utf-8?B?NW9aQkJleTg1T051aFFjeUVSdEI0S2l2ODlMZHJSb1hmWWEyam9xbGtJZXZR?=
 =?utf-8?B?OUw3bHB2WWlSOWxDWTdaWktnTjRYc1JhbU9GaEpteDNmS3A5WGZEK3lPM1h4?=
 =?utf-8?B?SEQ1SUl6eUtGMlBackdHakVBMVZvUUVWblM4RmxOQ1d5U0pLSXpNK2ZvNXBG?=
 =?utf-8?B?aCsva1ZyUk1KTXJpdzQ3Yzd4VjFNbS9GS3RhYlBLSHJ4dGJ3cEoyb1VzcWFq?=
 =?utf-8?B?QzdRS0dPK3V4eWVKUkNmUjN2RXdhbitvT1hOYThESXpySEtOMHZFK1I2VENi?=
 =?utf-8?B?elFsemhMR2J0Zmh0dlk4MUFuOWphV0RFYXhvWFJtSm4rZTRZOGFweUlUSGlO?=
 =?utf-8?B?WTBwNElVN2VYdHBrbHVIaDM0eDZ6Y0hmWnVjdmwvVE51SFVZZjdkRDNTZ1hX?=
 =?utf-8?B?cTA2bzdhRnRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVsZ0owQXcrak8yS0ZMZmM2V0haekx1MmdyK1BMaitsbEJGaVZsclN4TDhW?=
 =?utf-8?B?MkZDSXFCRjdIM29BZUk3UHFsQTZ2NkkzRXBBVjRXcHI5NXByWXltWi9nVEUv?=
 =?utf-8?B?T1hXQ1lrK3k5anA0WUdOTGNVMUEzdWdxMkRPTVdJWTJDUkhmK1NwUFB2bzRV?=
 =?utf-8?B?QndQbWNWdjc2UVBIQVZiek10ZjZNdDViRHJxYi9wT1JYVThkQXQxMmdyelBk?=
 =?utf-8?B?MHBxVXBQdEQrd0FnVWFoREJENTJsRWxsemtxZ1JobHlhSjg4SU52bE55Zkxr?=
 =?utf-8?B?eGlwaWU3d0hoZ2xoQ2FKcVY2bGtiNVVKQlZ6d2J2YktLbzZMTHZWYXdqNkZs?=
 =?utf-8?B?a0pFTkM3dCtyMlFHRjZ1KzJhYWRPeXJ4elMvOXd0RFJYWkM5eUZic2liN3B6?=
 =?utf-8?B?YWlHOEpQcFJhZ3RrNTBDenkrZ2hNTTlJZ216Uk9ualJiM2lIV1pqTnhWc0h5?=
 =?utf-8?B?bGhNV2QyZEd2dXVEUEU4SSt5SnU4UnB6bUIzcjlZSGlMM2E2UnBhbUxTUDh5?=
 =?utf-8?B?YlBZcWZCV0YvMDArbm9PcS9KblFBQlQrckhBczhhMmFnVmJZek5uYVczS0Nj?=
 =?utf-8?B?bHoxUysxdmJWK2xNeUFBU2FuTnBRZDdva2RsN2QvbXhkSU8zQWtoeGRwbktj?=
 =?utf-8?B?Y1lCM25DWkx4NmUxWU9ySHovZWszWmd6SDJVekJhVkY1cHRESHJPUFZjMWRr?=
 =?utf-8?B?UDJDbGYrbkV5OEQ5Vy82U014Qjk3a3Byc2VhL2NiSWRSM1J1bkpBa1d5Y000?=
 =?utf-8?B?bExsK25tNlI1TlRDcDlFY0ZTRVRncXpZZXVWRGIxNUlOQUxOY3VVUHI0Q1pZ?=
 =?utf-8?B?Z05udmE3UUlVcExWRUVEZUxjTFBHY0t2M2JpeERvd3ArTDlXMnBMenp1VTNH?=
 =?utf-8?B?WjNXdWVSSEJmOWx4b1dubmJQSFQ4TjZvai9vL2pFUmFlSXFsT1QxTE1PRi9O?=
 =?utf-8?B?L0FwaTdZUmFWcWFrOFF6ZDBPSkQxbkhWWVlsRUlEVFphRWVRNjhpaSsyNGtl?=
 =?utf-8?B?YnlFaDNrMGFtTmdIVFM0a01jb0FUWEp1R2JWY0JXOWlJWnlHaVJPRFlMaXRp?=
 =?utf-8?B?U25YWlFobVZKT1dTdGZZRUpEZThMbGVsWmpsWndBbjIxS3RBSCtyQUxBRHZM?=
 =?utf-8?B?bFQxbHk2QkRhK0ptMUZyb25tcm44cjFveldTY1kxSXltMHJSa2lZZE5va3hn?=
 =?utf-8?B?WXkxWGVvdnlTNkFQS3I0Z3I2WlZONUNwRUt0VGRhUllFVTNPUy9MRFdYL25n?=
 =?utf-8?B?YjlwekYvS1c1eml0SWN5QjQ5MTZ6aXJQUTJKdUh2QW1wOXlndkNhV1J6UnJ4?=
 =?utf-8?B?cmp4SytyN25XYys0dEdFT1llUlFZYWwxVlVkeU8vM0tkRFdZNEwyV0twOWNn?=
 =?utf-8?B?dWxsRyt6ejhuQ2xIRTQ3WEpDV2UvUTllUlJIWStrSUNERG1UQ29FU1BLRFNL?=
 =?utf-8?B?Vy96Q1FBbFdUN2d0dG5DMTY1N1ZCcGZMbWV0a3NsQnhpNHYxMFJtSG11MnA1?=
 =?utf-8?B?dEMxKzlzY0lPdWY1VEEvTENUWVJrU1NMZHlIL2RETnFLYldrU2xza25sNUpX?=
 =?utf-8?B?N29kcnFSTFkrcGd4TGpCd3EwdmtQQnF0YUliNUFpU3AweUMvcHJKWDMrb3hI?=
 =?utf-8?B?WldCcUhsUFk4UWhmRXhoWTBBMUFxR296dmw5QmNmU2x3dlBHcElUY2dQT1U1?=
 =?utf-8?B?cHNiVjAzMTVHRG8rZnZxemphNTNqdU1ESDQwM05sUS93UUlyQUh4R0RsVXhP?=
 =?utf-8?B?ZkVueE0vcG5iUDhMYjJSbTlVMU5aa3I4SjJXRUYvUXZVWU1OT2xPQmhndlVw?=
 =?utf-8?B?Nk5iRmswQzZVcWkwWDlhNS9zeG56UHkyRnlMd25BSERkbnpOTHBVMUNLaGx5?=
 =?utf-8?B?QUVwZ296am1JUUM2MTFPT2lBSWxEYUI3MFlvRXkwS2tOeVhEblovK3hSaC9u?=
 =?utf-8?B?b3V3VzlhMHBkRVN6eC9FREtzVzhZU2F1QWZMNk1BdlorSG92a3VQNzZCbldp?=
 =?utf-8?B?VVBPWFFEdnNzRGNZVXhBUFB0UUJvK01BWEovYnZONXFjS1pvd1l6V1pxVG5o?=
 =?utf-8?B?bHg5c0NvajRXbW96anZTTk1jVGc1OXNzWSszKzYvQ1cxaUxGMTBhRXY0QVR1?=
 =?utf-8?Q?YgKo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c570b175-5443-4c52-a5a6-08de2e66a305
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:12:29.1694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BJuydUf2TEVzt/h0ddF4qhgS890cgPvao11LEsX+yFjg31ghW9J0yE6BiycDebW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9335
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

On 11/28/25 11:10, Philipp Stanner wrote:
> On Fri, 2025-11-28 at 11:06 +0100, Christian König wrote:
>> On 11/27/25 12:10, Philipp Stanner wrote:
>>> On Thu, 2025-11-13 at 15:51 +0100, Christian König wrote:
>>>> This should allow amdkfd_fences to outlive the amdgpu module.
>>>>
>>>> v2: implement Felix suggestion to lock the fence while signaling it.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>
>>>>
> 
> […]
> 
>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>>> index a085faac9fe1..8fac70b839ed 100644
>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>>> @@ -1173,7 +1173,7 @@ static void kfd_process_wq_release(struct work_struct *work)
>>>>  	synchronize_rcu();
>>>>  	ef = rcu_access_pointer(p->ef);
>>>>  	if (ef)
>>>> -		dma_fence_signal(ef);
>>>> +		amdkfd_fence_signal(ef);
>>>>  
>>>>  	kfd_process_remove_sysfs(p);
>>>>  	kfd_debugfs_remove_process(p);
>>>> @@ -1990,7 +1990,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>>>>  static int signal_eviction_fence(struct kfd_process *p)
>>>>  {
>>>>  	struct dma_fence *ef;
>>>> -	int ret;
>>>>  
>>>>  	rcu_read_lock();
>>>>  	ef = dma_fence_get_rcu_safe(&p->ef);
>>>> @@ -1998,10 +1997,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>>>>  	if (!ef)
>>>>  		return -EINVAL;
>>>>  
>>>> -	ret = dma_fence_signal(ef);
>>>> +	amdkfd_fence_signal(ef);
>>>>  	dma_fence_put(ef);
>>>>  
>>>> -	return ret;
>>>> +	return 0;
>>>
>>> Oh wait, that's the code I'm also touching in my return code series!
>>>
>>> https://lore.kernel.org/dri-devel/cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com/
>>>
>>>
>>> Does this series then solve the problem Felix pointed out in
>>> evict_process_worker()?
>>
>> No it doesn't, I wasn't aware that the higher level code actually needs the status. After all Felix is the maintainer of this part.
>>
>> This patch here needs to be rebased on top of yours and changed accordingly to still return the fence status correctly.
>>
>> But thanks for pointing that out.
> 
> 
> Alright, so my (repaired, v2) status-code-removal series shall enter drm-misc-next first, and then your series here. ACK?

Works for me, I just need both to re-base the amdgpu patches on top.

Christian.

> 
> 
> P.

