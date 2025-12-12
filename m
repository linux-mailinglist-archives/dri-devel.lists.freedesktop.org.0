Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F3BCB8DD5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 14:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5937810E116;
	Fri, 12 Dec 2025 13:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cSGKNBxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012041.outbound.protection.outlook.com
 [40.93.195.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E143B10E116
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 13:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qC8Bpd5q3aMQvKXvVGUwYMD7hm5WJUqLBT1TMijhwnx9vknT0XgW0nCAib+L0i1qxWSPfCvngvxjMkE5umsgzdhUcPD3NykAd92eJOYLiuqWhXAoGtDlu/sNBDNVim6AWX2T82f+XbBLef82vE3A77QLaEjJ7Ywp63D7KrFhStfZZmm0bgRyREC9nIxb9JUOj8Sao5oxg+yZXbQsIgz2x05M0avXuoAOC7SOBrfVKIPPLJxRxpiwIo2Ndc7WPV6uWYYvIJIgoJYgnj98m5GCiJ6k3y6LNZU8UtJXEOJJtlCRNGlMFA21jD3EPPivmXO0lkopsEVMEcEo38Hk60zqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImXXugIjXXtki42i51MkQUvRPcCOYoicgRKV3+4S8oI=;
 b=mwwDtrY8tojb96qWIv/NkVJIT+HX4F/u6Ik1QzLAO7TxMep/Cm2ZrubcRZA2fV7GOaTfNbIecJfiDaPmJ7WwsGR3qsNX4eQMxb4pbgDDBPjVZspWVR7fPIxaLsRiUTC26UMLWi9C3lwb5zxZuQzQEi08aEskmoX3TcnNScqn7MMSsplMvLdefgTsJ2deTEiFXppqYQ2EPqB5aLWxwfVUgC3ptg165oqlkJseNzn5Q1gytnEo+c9XSPvZgbv3QGSpJ+8kZ2nFm8mDaONdN1XxV6Qg1622uuFaU6eE2qJcvUEY4XJQucJHYH2OGN3rcO5/isq67Ge37V9bSL2mkP++Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImXXugIjXXtki42i51MkQUvRPcCOYoicgRKV3+4S8oI=;
 b=cSGKNBxNcuIFgdKAVtSsTe/LvMgN7X0asAumsPY9ZADbmyYW3TSs0uzmPoLpxtrIZNgOjz9whD1BUYexxfgeuXtqB+OeQv1yh16Sz83ZPAoF1t3YXozrwjZUthsj8BFKJky51WbhsrMsJMc4BkjTItwo/eYnlfqX1KEXk5m/GLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 13:06:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 13:06:50 +0000
Message-ID: <e35a9c5d-a09c-4716-959b-2720c72bf383@amd.com>
Date: Fri, 12 Dec 2025 14:06:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
To: Karol Wachowski <karol.wachowski@linux.intel.com>, David.Francis@amd.com
Cc: felix.kuehling@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, andrzej.kacprowski@linux.intel.com,
 maciej.falkowski@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20251212130238.472833-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251212130238.472833-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0297.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 704c7abf-ea61-491f-1a54-08de397f5081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1Y1SkRTMlArYldpY2dJYjYrSTd4djAvVTlEc25JYTk2b0RTcWJqd1k0MG4y?=
 =?utf-8?B?RnJkQ0l4U1BKZi9UcHdTVldYMlQ5dzNCMGE2cVJBYVZPVkpGV1lKM3p1bkJw?=
 =?utf-8?B?Nkg1ZWluTXVTR0N1V25Kb1A0clp5bm95SFFwb2MrUThWODBCMktFZGdtVk52?=
 =?utf-8?B?RVZyQ1J5ZWNjYmx5MHdpWERjcit2Tk9yRGdTVis4VnFVQ3dUSTEvSmd3MnhO?=
 =?utf-8?B?U05CQWU3NEhmeEUzMVdiUjdIS1BYSmx2djIyTjM1YkJlMDBsQnBsVE9FSTRL?=
 =?utf-8?B?UGZZMjlmWmdSWWJ1ZHhSemoxNFFnWHFYMHBWQTRhT1ZDSnAweGJ5MG1ZblJ3?=
 =?utf-8?B?YmFnWUZrb3dNMXlQQXQrVDJHMjV2clAvM3ZJdjU4U25OMXNCYXBlOFNrQmhl?=
 =?utf-8?B?czU2a1FrRDNBSG16bDJ6SUhjY3F3alJYNlcxOUwvc090ZG1nRVVkazM0b1du?=
 =?utf-8?B?UTA3bFZpMUZjT21DUHV3SExYcVFJMWRZVU8yeXpjUDBFZ2R2cFNqNFQwVXRT?=
 =?utf-8?B?MXJ1ZWZNbTFJa2JrRitnbmJqRTkxY3RKS0ZrUEtjVG1JVVpJU3FoOHpsTnBv?=
 =?utf-8?B?ZEJhdkN2eGZaS2xXR0RzaXQwbUFvdXkrZW5SOUhtSkNJSlZDSjlQNW5XK3d6?=
 =?utf-8?B?RVBJOUJYbVQ0c2lEY3h5b2oxV2FGL25BblhRMCtkdE1ndHR0MUNsbmVLM1Z5?=
 =?utf-8?B?eS9jcm5tbTVwWFRkQktTOEhUWEhoM2FMbVZMNFg5WW1SVU03TThGUkI3TDFB?=
 =?utf-8?B?dXhzR1ZXV29JY1BHQWMyc1Q5Z25jKzYzeVFhQlM4bCsxY0lCZ3lSMnZRQnhT?=
 =?utf-8?B?eG5vNWZwSkgrWFNGb2dXc3B1dGI0ZmhpSnZuNmhrVzZiVVhFSWdrcTlXYWJU?=
 =?utf-8?B?Y2V3SmFSb1BGQU0rUGZIR2FYWFZwR0I1MnB1UU1uTUIrVzBJeWtqc3VCUFA2?=
 =?utf-8?B?MVNTc05sQmRYaVliR1kzRTkrSnNOeDlaWVJhMHNQOVpvQmppTGh4WU5wM3dr?=
 =?utf-8?B?bjVNWW10MTZONDQ4ZjhidjQ1ZXhnRU1sakEzc080NTlPTWd4NUNZTVZ4YXNM?=
 =?utf-8?B?dVdUOGdlZWE2QW9wdFVkcDRnaUduZmNmT3F0Z2VIQzRkVFgxWW5vMUFkMTND?=
 =?utf-8?B?MGRhaEtjcDVFZEQ1Qmk3d283emtMQXQzeGo0WFRhSE9oNVI4bjFsWTdzTXpR?=
 =?utf-8?B?bzlrMTZBNDNTMitES3R5YXhseWo1Zkd6NDBqSXloSytoK3BIaGpTZE1Fcy9t?=
 =?utf-8?B?WUN3a1A1dDJRUWNzVC9wOG5ocitJcW9nK0dmeTVyQjQ3a3FqTW5icGwwbVp5?=
 =?utf-8?B?YmN0a1NHeTU5RjNuYkpMTlh5dVQ0VnpKS1d5dmJNelRSUVNXTFpsUWIwajZw?=
 =?utf-8?B?KzB6TzZjOG5tays4RklRd3RZUWdzRndIeTllZmZ6NHNMd202eTY5a0Z0UnU0?=
 =?utf-8?B?citvT2p5Qk1ISUUvVDJTNk1FSFNKemQweVBJbUtoejR3c3VOemFxSGV5SUtH?=
 =?utf-8?B?c0FZNTAxUlhrdGVaQTFSM1Njc1ZTZGJEQU85ZnpFRy9ZanBIcFcycFlqcTh3?=
 =?utf-8?B?bFZ6NlVGWWszenBVczJ4UjdhYWZFRU9YOHZZUlBLT1NXZzR0UnliN0RpZXhx?=
 =?utf-8?B?ZEFYZjYrZWUwWVJQZndleWpuYVBUYzdBZnpOcWs0ZXUvam9TL3gxc1NIdkpW?=
 =?utf-8?B?STRHZEVQNzBTd3hFcTZrYVhWcTdwYWQ5MG5XTzVuNGtTcmhadDlLT1BVRktT?=
 =?utf-8?B?S2hBSzNxZ1k1cllMdVpibUkydkF6N2w0aUZReklrNExTUWtmRHBtemcyb0JR?=
 =?utf-8?B?R1J1ZVlHZHdpdzNhdnNld1YrdTcwRUlyam9IaDVpSDJKTXgvVWovdEh4Mlox?=
 =?utf-8?B?UXFPVDVUSEtDK1dMakV5RUpWcFJkY2h2eXhQTnR1ZkZJTUs5Q2lnYlhZa3hN?=
 =?utf-8?Q?k8XYXhlxhp/ZIDV2Yqaj4rMk4+edFsu0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUtFUExGM09NeVJzSWszc0lJTTM1U1oxWnhWMG0xc2ovWExwdVM2OGxra1RN?=
 =?utf-8?B?ZXNvaXJpc2N0K1kyMFRYTG5YLzc2U2luWXVxUWIwbDhMeVdDZUdrTjlRT25z?=
 =?utf-8?B?Uktvdy9wclNLRTRpRkJOcjg1K0haTVNwVVZST1luOVk2ZjRKRW4vekFxWEQw?=
 =?utf-8?B?Y0hacEZQRjErcGlWZ25sckV6M2Y4WXA3WmVLRTJ6SzRGbzVpM1dRQjNBWU1M?=
 =?utf-8?B?Y0Z1L2F0Qk1QZnE1b3ROeStXVVhaMlJsNjJqWVRocGI0MVhteFpRT21RY2My?=
 =?utf-8?B?RlU0cjBnMGFwLzB1dTFoRHY2T2E2S1Fnb1BuZHNVbEVBbWlrMUVYaDNHbS9M?=
 =?utf-8?B?bXhYRVVsblhKT3k0cnJ5NTk0dUxjbVQwaEwxM3RmWWNiaGhrb1FZWTRkWW91?=
 =?utf-8?B?djljb1FpK2NNQyt1bFBnV01QNlRvTFpxbWRQZG4yNTBveWE2c1JoSW9zckN1?=
 =?utf-8?B?b3pBQ3cxb3NCZlV6S2dZWVBHRFY1SnpNMVBHUGRBS1h2TXY5L3dqMExkMDJw?=
 =?utf-8?B?V1EycFJ0Rm50aTg0NkEyMXVRb1ZwNFNpSFVBN050SS9QS1dveldUeWJuQWhG?=
 =?utf-8?B?c013dW5UbWZJRGhlZGRWWlozaWFSVDlDR1VnWDVLc3BGbVN3Q0Y3ckRDcWUr?=
 =?utf-8?B?WmgxUm1ZSkZYNUw3cncwUVZWZFkzVmRaR3VQQTNzWWl6dUhLa1hYZFVLa3Rp?=
 =?utf-8?B?L1dVTHByVzdVZ2FKdVBNOW10MENrTFRqUExJY2hIelJhTVBBOE8xSThqcUNH?=
 =?utf-8?B?RWtla0RuMG1xNVRQZHFtQzgva0ZKdmQ5OUdQWkhnSTFndE1oUk5YdzZpWWMx?=
 =?utf-8?B?ZXpPZjFjei9aMXgwbVBreFpGaXhDYkFzdk44Y01nQ2RkZzUwY2Z1WVlvSkIy?=
 =?utf-8?B?TWxHNFF1NmNWeGlka0NWMWw0eGI3a0ozc05JK05aOVlra2NaTU5HZTJsV2Z1?=
 =?utf-8?B?RHV6RjY4a0RpTFp3SlJjLy83czl2elNhRk41VnQvUFFQeUdRcmZjOHJQc3BN?=
 =?utf-8?B?S1UybmhBcXpBWU1PZWFRM1BrUEswYklaVXhCTjcxZWxzVUhnMjNKU3BLdDRm?=
 =?utf-8?B?Z3l1V21NbWhrZmMrTGYvbUJNbFFiSndtVXRnZWpJT1dnOVJyOHl1RkVJZGFp?=
 =?utf-8?B?M2hIb2ZOLzBjY0s3WFVpS2cvejdXRTc5N2U3Rms1YnZ4eUJhS3N5ZnpaSHk0?=
 =?utf-8?B?bGdLRk5iL3B3NGdoOTE5aHFta3p2ZmZEMzl0RWZ1eW9qN3dJOUdPUXQyc0dp?=
 =?utf-8?B?NTRIRGl4OXNMZHpQeWdSWjZ0dFFmRmExTUpXbi91c0YvSDI0WW9QVjlGckVk?=
 =?utf-8?B?dGJhdXB5cHJGRFVBT3lJUVd3cG9FYUp4Q3I2b2hXK0cwdXNQbUJNREhkMzli?=
 =?utf-8?B?aElocXB3aXpVaHFyckNqZXR3RnZybkY4RnZUbFRvTUczc0I2cXBONWFPUlRy?=
 =?utf-8?B?ZGVJMiszVE8vWTF1OXlQZG43WDQrdXZFU29BT3ZoU2RFZGFwNFBKSlpUSzFC?=
 =?utf-8?B?dTdXQ1I1YmNrM0E2cmxEb2FxN0N5L0NwK2dVRWVLcHFtWmFzcEhSa2lwTUVh?=
 =?utf-8?B?NnNuVEVNTkpQL09aeWhLbmtHMEpLbk9Hd3dEaXBVckNnZmhiK2h2SmFUMnFp?=
 =?utf-8?B?c0xnRlQ1U0J5UC9QQmdsN3FlRTZlb3F4a1dZZ2FwcGp3SGtRRXFIWENyMEJy?=
 =?utf-8?B?SjhVeTlsSFVrNVRqcUtxY2Y0enhrUEdwVHB5M295RTlDQW9ZNktxWnVQak02?=
 =?utf-8?B?TnJ5NTl3TFJIRXB6UTY0Lzl3K21EcENGQXJ2ZVdFbXdmR0tNZTJyNWc0Y1pK?=
 =?utf-8?B?TnE1VmdqcnNuVGZOK1d1eXcvNVpYSFNSL0VmTldhNndKRW5MMTNyZG9pZ2Vo?=
 =?utf-8?B?WGFOR2Z6UEpIWE5heEZiUk1aZTY3Mmd3dW9CcFF6TTZQa3ZabUV2dDhJNHRo?=
 =?utf-8?B?cjN0bnRNTVZScU9XdGZRQUI1QTh4SlhOdG5RYjZXb3BwWkJ6VGtYczIxVkVQ?=
 =?utf-8?B?akVVUytGdVR6amwvVnE3YzJtWE5pdzlUUXZ6bDY2cTQzVkx4UTNabVQreDVM?=
 =?utf-8?B?Skk4T1pZbGx5cU1oMkNuM2ZsSm5lVFdyMlZnWnlxRkQ2UXF1RDRXWGFKRyt3?=
 =?utf-8?Q?9t+jRNVRDEadF48pl2vQyKqDL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704c7abf-ea61-491f-1a54-08de397f5081
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:06:50.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWdfLNDWpbrlp3nbRbGAErGVs5tug7loNL4oNDidrTAkBOV/7AMila7LKxLXS9VT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
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

On 12/12/25 14:02, Karol Wachowski wrote:
> Add missing drm_gem_object_put() call when drm_gem_object_lookup()
> successfully returns an object. This fixes a GEM object reference
> leak that can prevent driver modules from unloading when using
> prime buffers.

Good catch.

> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

CC: stable 6.18?

> ---
>  drivers/gpu/drm/drm_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ca1956608261..e150bc1ce65a 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1001,7 +1001,7 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_gem_change_handle *args = data;
>  	struct drm_gem_object *obj;
> -	int ret;
> +	int ret = 0;

Please set ret explicitly in the if branch below.

Always initializing return values is usually considered bad coding style.

Apart from that looks good to me.

Thanks,
Christian.

>  
>  	if (!drm_core_check_feature(dev, DRIVER_GEM))
>  		return -EOPNOTSUPP;
> @@ -1011,7 +1011,7 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  		return -ENOENT;
>  
>  	if (args->handle == args->new_handle)
> -		return 0;
> +		goto out;
>  
>  	mutex_lock(&file_priv->prime.lock);
>  
> @@ -1043,6 +1043,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  
>  out_unlock:
>  	mutex_unlock(&file_priv->prime.lock);
> +out:
> +	drm_gem_object_put(obj);
>  
>  	return ret;
>  }

