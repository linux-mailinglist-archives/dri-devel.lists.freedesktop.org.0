Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45196AA12
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 23:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1936710E5F4;
	Tue,  3 Sep 2024 21:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S3zuzI6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C5F10E5F1;
 Tue,  3 Sep 2024 21:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyNm2Smcp5N4L1YyyDArQTxIdoQ9VF6slqBfNCHSRZoDoa9Xus6W9pddP0zc5KTELbWaUyK3N/Xg3h870fYDYX9oYvaBmG+9ExE4YXzK3V9DRCqRCy3+2EtgfylLbXWZ/U4LFbhW6j5t4ZACxYpZOezB1M5C8iHy47I4AOHuohEAWKYf8gCGutqgyEMYUuRr+3ySfGpDbxcGcEsCtTRgHIFcuZCF4VYOqXALhQ2pDDrc9IlqU+Nb9WsGdWGmORmwwHx62/M0D57mHBfY9IqlyNURlsUqCI+XGYuB3cNbZgeImn5quMGiaiEdTh4Y1tzPfFLrOVclpaIx7ZuIcGyttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQvkoYiQd+xrJcwbc7qtZOMgG7mG38jJKlrEcjTLHQw=;
 b=J3NXLqsrGgdypHYd0156IDWItUbZeBoptpIpF7HdKo6JYhRsIdLtDZ6dwgvB8EhYTXJtsr4GNHD0KqB+bzJD+iLBge5SyaADx/S5u9CGK89a3PiFU3LJNMZMCkVT3Wt3yk7eeRylTdJcD9IBR+Jv3qkBFTF7lRmQl9s1PrOw9YIuFXV2PGxrsQU8+zEGfbsWNAQUX7vOcmpZAspVPqnQ0c9o6xdjob+Yt1f/xlFSgzeXZk9N2QpuSbT/1X8Xo2WvvuFSM5c5Wf7YdpGEC+olvXO1OSFSGqQU5+XIdnU2L/vyuzoOgG0QzkrdN1w7B4oFq93xXxWJCIz4sDlr3dkm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQvkoYiQd+xrJcwbc7qtZOMgG7mG38jJKlrEcjTLHQw=;
 b=S3zuzI6/R04Wsdn37F800ygsa8Zm/gtBeuB2CRS69hD/OoB3ZllS1oElK8/JZkHp/1+g7IqjSHDmbJIooVT2fRVLi/yirD/PGAPmpNR7e1go5rSlmgIslwpE4jdJmkf8yaNq04pbzKRMcAnr4OhfA9jNZzpsIa/kBXk6NDVP7VU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 21:27:37 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 21:27:36 +0000
Message-ID: <3525aa03-4c5c-4d40-ad95-0bb1243d40f1@amd.com>
Date: Tue, 3 Sep 2024 17:27:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Avoid race between dcn10_set_drr()
 and dc_state_destruct()
To: tjakobi@math.uni-bielefeld.de, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
 <7b9dbbbb1e6a3aa6d7a4d9367d44d18ddd947158.1725269643.git.tjakobi@math.uni-bielefeld.de>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <7b9dbbbb1e6a3aa6d7a4d9367d44d18ddd947158.1725269643.git.tjakobi@math.uni-bielefeld.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0261.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::12) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3a745a-8569-4076-38f9-08dccc5f3b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3RTb2hLUDJqQ0FXMWRraGhVNWp6T2VET0xvUjFSZGxOWEFDdFVsazMrT2pE?=
 =?utf-8?B?SnIxdEJRdndYWVdNejQ2a0o0RzVHOEYxcEF1am5XN0xMVHRBMzlyck80SVZT?=
 =?utf-8?B?aGkxcU1zdDkzdVQ2cVV0ZWlQaVZrNURqUEdTbVhsSmtaV1ZmZG9OVUxBSFBv?=
 =?utf-8?B?b05ZL1ZwZ2NXWjVwMTI5SnY3WGdkQjRYeEx3a2dhVWNsVFdXbTVHZjR3NzVv?=
 =?utf-8?B?K2pYbnk2N0xRS1gybS9sV1NBdUt0My9MQlFVTlRLdjloRTZ2ZXJPb3IreXg4?=
 =?utf-8?B?WVZJdUY5NGZ4Vy9SQ2tiSEZJclFXdFdVUitMTEsxMC9kWDNxUUt5dUoxNHV6?=
 =?utf-8?B?K3gvblRxMmgrV3RQd0NKZU55MWRvRnVrVEprRUJQNFRhL3ZJR21BM25ySHBD?=
 =?utf-8?B?ek5ZSmJ6eU96NnZDcG84Z042OHpzbk05eW1KRFNvOC9hRHFrRzR4cjZzSEVK?=
 =?utf-8?B?cDF1RTIxYkJWZVVjSHNLVVdzbWJ0ZmxsRjd0d1NtMDFYaXgyWFB1cVhZZjRn?=
 =?utf-8?B?cU9BTkVkbHQ3V1dVWStyOUIrM0svZiszdE8wc2EwR0tHWjZxTGVlRnh5RWtF?=
 =?utf-8?B?OGZTVFVpS2tmZFAzTFhxTGl1RDN4NkZ5MXFqekFDUld5K3NUNzJtTmltWER1?=
 =?utf-8?B?L2ZvUHRpRjY1TTRGeEU4QTlRS0swdTVkd3UrbzY1cDRPNHFNTGFYRjF3Qmxo?=
 =?utf-8?B?dVh3TFNYZFYyckZjK1IybitUTVRCTGFQeEIzWTZ0dEEvVXpra3BQcmNud3di?=
 =?utf-8?B?K2xrTkZ6YlJtREY0bUpKLzBEMFdNckxIYWVUZS9Fb0c3dGNXUVFyT1JzL1o1?=
 =?utf-8?B?NkhXVlNJOXNkREhmamsyVEdEd0ZLQjdxV1FGY0F2b3J3VElSTFFpNERvdlFN?=
 =?utf-8?B?clpvOU5tQ2dIcFdwY0RvWlBZOW9pRjJLQUExME9QRzRpMG8vbVkwZE1pbFht?=
 =?utf-8?B?MXltZ1g5WUlVNGJ5M3dUZmdQblFJZElkMVN2TEFDOFc4VS83VVlZK3R3UkZq?=
 =?utf-8?B?VW9VTVQ5b3c0R3AxVmpXdVB2d0VNMFJrUXpXUXp1Wm9PU2MyL2pHaE9ZS3hU?=
 =?utf-8?B?cFRBU3BBcDc4L0FjcnNEenFnQWNlT2dicWF1cTNGMkdSUzUrSEVwZWlEdUN0?=
 =?utf-8?B?V1dzb0h2SG56R1lOT1R3WFpSSVllekJvRldxSlBMQmdqRlJzaXg5aGlvMzdo?=
 =?utf-8?B?WFJaeGN6ZGxqVDdqZGM5ZGtkRUw1Uy9JenZUMXoyRnlEbFhjc28zY2Y3QVFZ?=
 =?utf-8?B?ZGRpY1R5MnRqZnAwakJLR0JXYnpDQldNN0pjRlVSWE1MUWdmb2NzT3ZVYzFv?=
 =?utf-8?B?WUJEMzE5bEpmekxQQzRpMHRQNDFKV2ZXajk0Rk00RG9SaDJ0cHJXNXZJSVhJ?=
 =?utf-8?B?RnNNRndTNkZYekYwYUg3ZjJzbWlUYU1SaHQzTUswTm9HWHVhRVZaeFlRUkVL?=
 =?utf-8?B?UGljMm4wdHViVVozNnVSNXVsQjl4L09adlBSa2VxZWY0QzRpNTJaSHZQYlNR?=
 =?utf-8?B?aEt0MFVJRkpYZkZSZHM0VUsrY1hwYW8zNndLN1RTTEp1d0hBV2NnSG04QXlE?=
 =?utf-8?B?ZWUwOHZWUzBEMVlmSG1qdFVWa0RuUDhVU05Ja2dCdHFlZjlqcDE5V3R4U3lD?=
 =?utf-8?B?L3BLeHR0RE9jRFpTcWNrbVNoNWo1Z1RsSzZla1RLUHdCTXN2UTZZZWtkRFVT?=
 =?utf-8?B?d0pVdWNmVHo1ZFg1ZkFNZlUwSHZscUN4cWZRTXRZUStNSWo3R3gwZlp0dE92?=
 =?utf-8?B?eGd2QkRyR1FNckpwZTQ3OUNnY0IrR21pWWdYUzhXeXBLOU9UajBsdUVSZXVY?=
 =?utf-8?B?OGk5dTV3OE1SeFhCQWRwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STlVd205K1NmMTZNV1l1VkR0bmdoRzFVay85bGozYWJmV1duMmtqekF2ZUJo?=
 =?utf-8?B?cGJ5SUk2M1BpR3hIZTFOc2V1SkhoVWVhRHdQSWJZU25NbVZYWWVibFVoMkhS?=
 =?utf-8?B?RWJwVm8xcXowcXV0SE9kT09CWnQxOGtxOGtvc0JtNHRnQzFieHFobm53ck1S?=
 =?utf-8?B?VWtZZHNmQ0JuNlVnakNybHBndmxUQTh3WmdPV01RQlNXbDVNWnM4dUNobUEx?=
 =?utf-8?B?bkIveC8vcDFLQU80b3l6SlBQU2RtSzJ5UDNOZ3dPdWVPTDJ0djQyaWxMcUVO?=
 =?utf-8?B?NnNWekM1eC8waHFGOUU3a0Qxek1RM1pGczdveTVYRWtQZHF3T21KWDkrOFpF?=
 =?utf-8?B?MmJRN2J4STFQTmdqK1k3MlpIdlZYREJEY1V1QXpiV2hvQ0lWOUVwaDI4d3M0?=
 =?utf-8?B?VHJjSFg1VElNVWtxSWpFNFBKWFpCTFFKRHUxOW1Vei80NzI0RDA3NWNzSDN6?=
 =?utf-8?B?Q1QvV2lOaks4aEhJeGF3bmZYWUdEWGVDeG9jTk5tWkVmeEczV0lCQVYrVUxy?=
 =?utf-8?B?TVBaemJ6OG5mS0gwK0ZUY0c0cFlLb09VU25iaVFaZ21JRjZtdXBNTmhGMVAr?=
 =?utf-8?B?Z1RxTTAydlg1YzF3bCthc0FKcGREdytZNVB0K0w3OFlKbk82UlF3bjM0M2dm?=
 =?utf-8?B?blVVSjh1K3BHLzFSR2wrTEFzTmNZTU1lTmVTK0tNOXRraWJ4b2RyQ1Bvc0FD?=
 =?utf-8?B?SHU3NXQ5QlhEcDMwejN0eDlEUms0M3luRUlQRUcyaklyNXExWllORHk4MUh1?=
 =?utf-8?B?dDNtdzFwUEJFNVhPSkN0cnFpSFhLY0lINXV3OWw3enBEM1d4bHBMV1lRV2Ir?=
 =?utf-8?B?UnhQMUVMWFpvTGlyTnQxSTR3R2xVTVpYS2hvL1JhYStyN29BelBpYjZXYW9a?=
 =?utf-8?B?Q2xMMzRUQjhvRFFGM0hUUzNrdXhCS01IUkhKZWU2dzIxZEFPTENQbnVKL3Z5?=
 =?utf-8?B?ZGJUN1hEWjV2cXMwLzZaZldudTA4RlgzY0UzQVRUbjNOQkQ3Q2cxcS9DNFNi?=
 =?utf-8?B?TUhPTk5pcUR0ZmQ4MHB4UWlxbzlDUXR2T2FpRGo0QTVJWkl1THlGTnZVdnhw?=
 =?utf-8?B?a0k2TzlZWTRFaHQxSmd2aFI0OUNvejRLZFAwRzg5TDI5bjZIUllvMkhIZndR?=
 =?utf-8?B?U3VONGlnS3RzRnVxblJXd2w4dDRnd3NITlZCa3ZtV2xpZ3M2bXhIczdqQytQ?=
 =?utf-8?B?eHZZYXhBbjFjUERvNkJ6bDR3cTZibUE4Wnh2OXkvZGJXR1AwTHh5cURTTC9J?=
 =?utf-8?B?MURSNVFZamhVNlliMUhmcGtFeVJoQzk1SUNRaWU2VmR6VWpmUnAyNmloQ1Vl?=
 =?utf-8?B?SC9sRE9nVHFmREIyZWRnRmR4ajV1NHRhYVEyMFh5eVhBWGNaZ21sSzMwY0JX?=
 =?utf-8?B?ZDJOV1Z6U2tqbDl6RlhRdER1NU5YSmNjUnpBaGpWdzdCbkNDSllLbFlid1BB?=
 =?utf-8?B?a3VkU0p1MnVWMHRlWjQ0N0FFcmJUL0JxY201MFlTZWFCbzRLMWt6NnB0ME9w?=
 =?utf-8?B?Q0lXenZtY1JXL2ZScU9VaVhoWTBNbzNKUVl3TkJYZXNqTjJXZ2ZicUVhMDc0?=
 =?utf-8?B?Ym5hbmkwTzZwU0R0UHhJZXpBc002Wm54SVlrT3crMkRhV3NpaWY4QlZ3RXJZ?=
 =?utf-8?B?ZTMyMWRPVlh3QjlmMmJ3L0RLL2JXOVNMU0o2ZDJDSFVsM09vQVFXNkZtU3Nm?=
 =?utf-8?B?UWZraGJMalU3Q0tTbGtGamppSjVCeWR4K3pmQ0RuNjNNSlR4UE4vekZaVmZm?=
 =?utf-8?B?elFzU0dyMEVzNkdrbk53SEtWbXhCeUlFSGZjOHpzcXJnQ05OY0ZvblA0MFg5?=
 =?utf-8?B?VzJJekt1S0h5NUhJYUlNUTZqYm9Mem5ZY25xdE0rV0FhM2NSeTlGenNXS1Ra?=
 =?utf-8?B?ZUd6UTFiM3NqSkFyNXdIazBBTTBVY1RkTWt3Q2hQQTRoUTNOVUxza2Z1Yldo?=
 =?utf-8?B?L0tzZDduYzRvZkNROG0rVmxObnZJMllMVXV6RDVqQkdiNTJTR05PQzh0N2U5?=
 =?utf-8?B?L25ycmZ6NFNGeEQ0WDh0SkdWdHpYK2ZtZStqa3JQWjdaeGg3a0xETjhqOVVN?=
 =?utf-8?B?OGlMUEV1SitBOVNLZ0l6QUVTTVI0cUpNZVM4dUVqQlVlQ1dMNzJwOXpsS09N?=
 =?utf-8?Q?XRzn61QaxQJok4vmr6NLPRW9M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3a745a-8569-4076-38f9-08dccc5f3b09
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 21:27:36.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UaGTR7VpkaRcIyJyboidHoSttSKCRwYmhwbfB8UAn2cwLlk7q9cnnGQYN/uYkGZThcDs6O007uQMmoIaMtJuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169
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



On 2024-09-02 05:40, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> dc_state_destruct() nulls the resource context of the DC state. The pipe
> context passed to dcn10_set_drr() is a member of this resource context.
> 
> If dc_state_destruct() is called parallel to the IRQ processing (which
> calls dcn10_set_drr() at some point), we can end up using already nulled
> function callback fields of struct stream_resource.
> 
> The logic in dcn10_set_drr() already tries to avoid this, by checking tg
> against NULL. But if the nulling happens exactly after the NULL check and
> before the next access, then we get a race.
> 
> Avoid this by copying tg first to a local variable, and then use this
> variable for all the operations. This should work, as long as nobody
> frees the resource pool where the timing generators live.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> Fixes: 06ad7e164256 ("drm/amd/display: Destroy DC context while keeping DML and DML2")
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Thanks for this fix. It also makes the code more readable.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> index 3306684e805a..da8f2cb3c5db 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> @@ -3223,15 +3223,19 @@ void dcn10_set_drr(struct pipe_ctx **pipe_ctx,
>  	 * as well.
>  	 */
>  	for (i = 0; i < num_pipes; i++) {
> -		if ((pipe_ctx[i]->stream_res.tg != NULL) && pipe_ctx[i]->stream_res.tg->funcs) {
> -			if (pipe_ctx[i]->stream_res.tg->funcs->set_drr)
> -				pipe_ctx[i]->stream_res.tg->funcs->set_drr(
> -					pipe_ctx[i]->stream_res.tg, &params);
> +		/* dc_state_destruct() might null the stream resources, so fetch tg
> +		 * here first to avoid a race condition. The lifetime of the pointee
> +		 * itself (the timing_generator object) is not a problem here.
> +		 */
> +		struct timing_generator *tg = pipe_ctx[i]->stream_res.tg;
> +
> +		if ((tg != NULL) && tg->funcs) {
> +			if (tg->funcs->set_drr)
> +				tg->funcs->set_drr(tg, &params);
>  			if (adjust.v_total_max != 0 && adjust.v_total_min != 0)
> -				if (pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control)
> -					pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control(
> -						pipe_ctx[i]->stream_res.tg,
> -						event_triggers, num_frames);
> +				if (tg->funcs->set_static_screen_control)
> +					tg->funcs->set_static_screen_control(
> +						tg, event_triggers, num_frames);
>  		}
>  	}
>  }

