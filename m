Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEXmAEu/fGlVOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:25:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7226BB92F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63E010EA01;
	Fri, 30 Jan 2026 14:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZbOaBrmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4287D10E9FE;
 Fri, 30 Jan 2026 14:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3lbQ2CqfZ6lGbZvMvkruP+m93Ynjk3DId4krwEZC6fTcLh4KYq8i8ERzZ0qV+lJiLfrn0VNrWCKhgt39Pl5eC5ueXujsIvOYAXuX0MwSEgCZipMjQLt5o2L3aNiRRN7B2OCtNzoYEeZmXGPZsA+03jBfbXs4YDzvIZF/+3+CUfLgqHBISrWGXfN9/LSx51IgYOBoja4Z/HEsukwlxWU1MUXXkzcow4stx4XpuJ2CgpuofbWFGDqN4h/Pwm9LyWFNDGshV8XqBKyRYXv2+SmSaPUf2OcPzoooxSrYxeXrzZGPLOEfMqJfPqLKKc5ke3HpgGLt/eLviIXq+rrmuJ/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S++6AX6yey/g4wPzOrDsn10G0cbNuC4VCsT1V1KNPTk=;
 b=rMKww2U42u9HFurjKcvk3tacudJYXKRTANLSS+SZvF5gQPNjnG7RutSjaqVliDKQ0OYBhXdduVyVY50X208JcgvJz2dKC3JXEzP6yxfeXKxKjIAUyeiSw1Jt8gq3ky4GRXPirUgrTbq7kGn4Ejh1KgBJXGQQ/7VIOzRDmWtqA+C9KfaprxHmUAm7RfqJ5uALJLV4IsCUvuxT9bxpWGh5awVUnrP4+SuHBtImCmoWnMfA7mDjj23WcDbJMPEDw8D35N/W5bC91cNFICcvzdLlCS7hcU6/q6hhnjdKED8ySo5wFaSHK93L2FnO07buiP8THPFpxZGh+FPLeyqqcGwxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S++6AX6yey/g4wPzOrDsn10G0cbNuC4VCsT1V1KNPTk=;
 b=ZbOaBrmoN05kmT+oBorswC4L7QvIx0HzIPbBYly+7Fw8KTSgvKu4f0q0DgqYnVHgEBnXI0lwIUgYnU1vOy50862j0C3fCtxg0DbHyDgjq3HBj3oKudiabLX8numqNW13PPPTd/vg0GiHqaRgw161XxPCQ/p4Lk6t3qJtAN1PGu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 14:25:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:25:06 +0000
Message-ID: <1906a234-ad0f-4419-a8a8-d3a389d5ac7b@amd.com>
Date: Fri, 30 Jan 2026 15:24:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] amdgpu/ttm: use amdgpu_gtt_mgr_alloc_entries
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
 <20260129153336.7473-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260129153336.7473-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:408:eb::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 346f2889-6e27-41ef-3bfe-08de600b5d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjBwSWtwK3E0WWJQdENldnl4bm44WUUvWnQ2aHhtK3kwTERwTjY0RmNqWEY5?=
 =?utf-8?B?clJHMWxZU3RTUVIrbUVqQnBIZDhwVDFSUzNhQWVwV2NVVjFmNG91REZBWHNQ?=
 =?utf-8?B?bzhZS0FweXJ4cTRTTi9YRnNnVDJDSTBPTWVUZnBRTHdtVW1lamcvUTFxczA5?=
 =?utf-8?B?UWIzMGJXWGhiRG9ybEhvcVBKdWRnNkZTNUUyQ0IwaXV3Zlowb2s4QUIrTGtY?=
 =?utf-8?B?SDRsN1pRS0ZBdDNHNjZxN21FYTNadjRpbW9QczlwVU9SUFhtVWo4OGxmcGxZ?=
 =?utf-8?B?SElYbjczY2xud09kdnZyTnR4QU1yNGR2M1JPOFVySm00QXNNYnBsdE5qRWYx?=
 =?utf-8?B?WmFpZy9CdWI4amszQjBPaTJTVUdPUVQrcU84dCttcHZrL0lDVG52R1ZFZ2J6?=
 =?utf-8?B?bVg1TnpFTTlvZmRIZnAyK3JCOWlIVjZvcHBMMXFrOG00YTBKS3JzVklkTnVq?=
 =?utf-8?B?RXp2ZGdxejBRZkpKZzN1UHI3NmJZU1NTd0FuMnVEMWlDaWRCS0xDa1JVaFpz?=
 =?utf-8?B?bGZTeHNDMFY4bWlaa2ZQWFVXR29tdFBxc0lkK1ZQWGxGSmVqbDhCY09mbTRY?=
 =?utf-8?B?cDhrcjNZV2tzd3pWQTQvelZSSTZEbWVTZ3VlQnF2K3FFQ0g4alRTVERQaGs0?=
 =?utf-8?B?T0ZHR0dQVHZxc3JSUjVpU2FhWjRpVS8zSFJQZTF0cVdvcmpLaUVaMXIwdXd0?=
 =?utf-8?B?UUlLYXRKTmtuWUEwcGZvNFp2L0FTeHNrRzFiS29qOGZQMDN2Y2YrbjY3d1Z3?=
 =?utf-8?B?OEZ4SDI2aFo2WDZMN0hhNy9zYzVmZlQ0NzdrWkgyS3pnbVdqbmRUR3RuU1cv?=
 =?utf-8?B?ZDNyRU5YSHNnY0NRWkd1NFJxMFdZVmhsTDhvWExkM21OV243NUJhK21zUEtV?=
 =?utf-8?B?ZHhzWE14a3RnQy9jbXVFS3RBTHFBOFllQWJUdHRnY3pJTWpDMzF6ZFZLNGdX?=
 =?utf-8?B?d3lnQzkreHExYjVBSHluZll2cEJvUjMyUndEK1ZNTFY0cmlIN0ozQkZoNDRO?=
 =?utf-8?B?V25RRktXU3hndUc0Z1JUa1NCNjU4M3ZDNUNadXdVUitMQ1NlYWRPR01DRzJh?=
 =?utf-8?B?WnRWNVk1MmZ3U1FUaU9nK0xlNm9lL1RzTHBZZGR4czNaNUtGSUZDQlNGR3dC?=
 =?utf-8?B?b3orcHdJUkdHSVplQnRSZ3Z2YzhGcGJJbitQdjNDb0pWYy94d1pMb25RWWRE?=
 =?utf-8?B?eFB0RXdwWmJQK0VoUjhPTnh6YnNacWxGT1d4T282WGYzTkRrN0xlaExNM2tW?=
 =?utf-8?B?em5uVXJ2RGU4MnlrYXc3bklldXMrYmsvZkwzWDBOU2R4NWJ5cGpxeGh0NXdq?=
 =?utf-8?B?S0IxeGV1U1VkTnowdFVLMlI5cXRMZUJ3eFFMK2FMTGlPS2t1QjN0SjVmcHpy?=
 =?utf-8?B?bkZFUFZDQXhSUStkSDRHb3d5cG9vSU1xUnFFS0Y0aUZqWkdOdmw4SWUwbzZn?=
 =?utf-8?B?Sk9hVWlWRTVCeHpTZGdzb0RrS1NMbUFJOThQc1Mxdm04Y0RKV2FXbS9obFNE?=
 =?utf-8?B?YmlzZDgwSThlbDJycGtpYTIzckhDM0ZaWDJyQk53ak56elczeXRvZXB4dThh?=
 =?utf-8?B?Z2gyZnBNbUVLSTVDTTJLL3N3V0RFalpITXpuQkJQSzFSdFZ3RDFRMU5CcEg2?=
 =?utf-8?B?NThlb0tnNUJYNTM1bWRUUzg5SFI4Um02bjBmNUN1azZialNvR3l3aFR0aWs5?=
 =?utf-8?B?VHdXRkRxcWo5N0x2Rk1hclpLSGJsdHZlckhINTNvZnNwaTlKVGtmR1REWWpC?=
 =?utf-8?B?dHhFdDhiNDdiSnRNY1IrY1pOM0xrY0Y0OEdxaUppQnA2ZldGTFU1dFRodzQw?=
 =?utf-8?B?U2NZN2NBb2RkY0JCMXYvdSsvZm01YkxDczNmUzdDcU5RQmhtWktEaGprZlow?=
 =?utf-8?B?SDFycWk0dWdaMWlXaDZSOWZtK3g2Y3JFWFdvU1pVbWtGc0N3RExnVFcwZGxh?=
 =?utf-8?B?SzlRdEhjT29DMGhqSE5qWGUxS3RWOWtZcm9qNEQ2THczY3RLbmpuR0prVjJu?=
 =?utf-8?B?d3UrdjRWOW15VVNHcmNRWVZSN3RXUnkzS2wvTlhBQkFYRXRmakxYS2YvQnpK?=
 =?utf-8?B?azhoOG02RjNyVXNKYSt3NHhja2lkaXNmeURGR1JManlXT1FQVTdZNjB1SkFN?=
 =?utf-8?Q?gnyw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDdWYWlIQzIrUzlCQTB6U3paTzNUWFV5MlM3anp1QWF4S3ZteEJHRGIydHAz?=
 =?utf-8?B?UGdKYWZjdzEyRytKV0JQM3ZzS2VJaHIzcmxVajZ4dUNTZi9CWTBuK0duZXU1?=
 =?utf-8?B?MUtNbTF1TXkwbHZHZEtMVUZGNzVQRzhrMTFhRVpVdkFmRjlkT1RlYzE4Qmtz?=
 =?utf-8?B?a1hWam1CWi9TMTU2U2JkZEVxK0I3bnBaTE1Ra1JZZTFKUXZiZ2dIUDduUE10?=
 =?utf-8?B?enhtaUoza1BzOWF5NExVSERRcmVGcEN6MnJtOThFc1FoSzFvbXRiSW05VGcr?=
 =?utf-8?B?enZVclNTbnRKQVhPMmlEVS9KellTbHorM0tKQ054WEptamNIbW1mNWNnR0w5?=
 =?utf-8?B?STJDOUw4bXN2SkhPUHF2YnRyQ1NscFUwcm9JZXRhNk85M3ZiRTAxeElSaWNw?=
 =?utf-8?B?SjB0elJtek1YalgwUlI5UGV4WGNHR2ZvNE5zSlRQVUgzdU5ZRFN4Tk9JL0RS?=
 =?utf-8?B?TnUwaktPamVtWTNYVnVvSkpVemIyeUxJc0tHN04xcGhVUmg0U1JYNzIxVDZV?=
 =?utf-8?B?R3ExOGlmLzFkUUwxbVppRVlxTmY2dnRkQ09ud04xZ29sekhPTjY3VGtnN09I?=
 =?utf-8?B?MkdwRDRVK3BQbkZBTGY2OVBJdU9mL0Y1Y2dGQXdQWEVSeDlTcHdVV0RFczdK?=
 =?utf-8?B?eUtaT1pLdHZVRU9RbTc3UGNhR3ZuY2tZcjRlNUFLb0dJMEdJYU1oKzhObk1L?=
 =?utf-8?B?YnY5ay9sNmkxTXI0Yms1UFQxWlVMVVovdHNQcHpLVklwV3pEVThFUmVCeEZw?=
 =?utf-8?B?U1FiUG5TeVlzempIR0h3MEJlWTg2a21td1p0RzlGbVdVeXhVNE5tZEJZd2d1?=
 =?utf-8?B?djRjam11UlRGTEgrNnhEVGZUQml6U2V1TGd2K01VWHpyd3ZISUgwRzVHVEV5?=
 =?utf-8?B?eTY4MFJ3TTdXU3JoK1RQd2JkRktObDJWbGZIUUdQWWg2SEEzNU5pa1VtclpO?=
 =?utf-8?B?RzBDdEZRUnhOSm43WEc3RjU3S2VseWFuZ1Z0b2JLSFZjVVBOQ0NheVFqSjJn?=
 =?utf-8?B?Q1hUQTVkT0I0YU9ZMGdFWEJySVcyVHMyZjUrbUwyT0FEQ0pNOGdMM1I3RXZY?=
 =?utf-8?B?ek5JaGozTFpZU1FnclJtS1dJaDNYTGlvZ1BNTHJ6RDNsVW9nTFJITzdJbTNk?=
 =?utf-8?B?ZmFRektxWDlqN0ZTa3pKM1hLR0dNQ1BHVS9ScitidXora0tWd3c4clFJc1di?=
 =?utf-8?B?YllpZ3AveVNkTmNuQllLV1V6ZFMzZ3VWU3dMU2xVdkJWMGUzR0V6VFpXR2h5?=
 =?utf-8?B?cmIyc3U4OHhmVW0zeHpMYWJKOElmc2I1RjhZOGh4MU4yRzY4Y1JCVWVsNnlR?=
 =?utf-8?B?MEx2eUJweWplY1ZiSGZPVmQwUlNjdk1jNGdLSXMzK2NYdFhiVVR0blIyejda?=
 =?utf-8?B?NVJid2R1QmQ5N0xGb203L2NPZ2Zyb1EyQkc0UmJSK0t5UTBkQUQ4WFRLUjFD?=
 =?utf-8?B?cy82SS9PVFdac1lwZGNLZlJKQUdNU1pNYmxzcjM2N1NVOEVwWCtXMzU0bE1u?=
 =?utf-8?B?RHpQUWRoWFhGcnVHc0prZy9maTQ3S0w3VzlQQzE1MWl6Zzd0dUNzcDlUc1Vq?=
 =?utf-8?B?cEgrOE5xMnRPcmlMZ2lOM0VzSzc5QjA2b1V2dnhsT3RVdU52SXVJWHVkelVv?=
 =?utf-8?B?eWZUTlZwTzB2TEpNYTM5dy85U0kwZUREdFI1dWlSaTdGQXRnZmNqK0dxM3Y5?=
 =?utf-8?B?ZEQyVThxMkN6QjlvUFJBWlN2V2JQcnMvZWdXa04zVWdvZS95VFJWNGd5M2li?=
 =?utf-8?B?QnFWTUFhL2dYdGNIN2dqRExoL1lPM2liZUM5VXUrVHAyTE1jR01oTXlUTHpH?=
 =?utf-8?B?eGJiV1lwUzQ1TThObThQNHk3STVlMHNMQjFmcll6Sy8vR0NOZlNZZHZSejlI?=
 =?utf-8?B?b0o4Y215NnpVa3pNRUZESWtMNWhyY1BSY2FoUUxyU1JXNExhQ3lPU3VnZTU3?=
 =?utf-8?B?YS81VFc2aWJxUDd4UCszdk1teHBHc3EwOU9hc0N0cWRDQ095UlFYVFY3dnFG?=
 =?utf-8?B?cEpZQzBWY0RNOTJsY2RNSmdLakpkUlJUSE9BWVZsK2N1dzNOcUJCZ2VuY1dB?=
 =?utf-8?B?cSs1VmVyT1crWndBSDQ4QTZaV2tDOUEyWmxORkN0NWt5ZFpIekhsRExWT2pB?=
 =?utf-8?B?Nk5vR0tIYW5lb3AyQUhMVFpRWjN0cTlkZzdmakd3K3ZUMmw4b0I1cjZ3N1Fz?=
 =?utf-8?B?ZEFIYmg5K3hrOEsyeWxXUEFKSG9xZDZpOE9jdnZIenV1Zkt1V2tiSDRuZ1g2?=
 =?utf-8?B?bFRuNFN3dWJ5MFlVcTNSbEtmK2dlUzRjY2hDNlRaMFdCUk00Mi8zcC8zSDJj?=
 =?utf-8?Q?HLm38xMf2h5Q4wmdLe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346f2889-6e27-41ef-3bfe-08de600b5d25
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:25:05.8724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2chbgkVKZP4wOP8zVUVz9S1O2vBj4v2GlurGBMYs+3wSAcPH4FCyerkNUEQRyE4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A7226BB92F
X-Rspamd-Action: no action

On 1/29/26 16:33, Pierre-Eric Pelloux-Prayer wrote:
> Use amdgpu_gtt_mgr_alloc_entries for each entity instead
> of reserving a fixed number of pages.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 66 ++++++++++++++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>  2 files changed, 43 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 8b38b5ed9a9c..432bb2839dcf 100644
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
> +	r = amdgpu_gtt_mgr_alloc_entries(mgr, &entity->gart_node, num_pages,
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
> +			amdgpu_gtt_node_to_byte_offset(&entity->gart_node) +
> +				i * AMDGPU_GTT_MAX_TRANSFER_SIZE * PAGE_SIZE;
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
> +	amdgpu_gtt_mgr_free_entries(mgr, &entity->gart_node);
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
> index c43f352df953..8af0aab7608c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -56,6 +56,7 @@ struct amdgpu_gtt_mgr {
>  struct amdgpu_ttm_buffer_entity {
>  	struct drm_sched_entity base;
>  	struct mutex		lock;
> +	struct drm_mm_node	gart_node;
>  	u64			gart_window_offs[2];
>  };
>  

