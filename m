Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E4A799AF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 03:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12BD10E1FF;
	Thu,  3 Apr 2025 01:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BQh9u7D3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163110E1D4;
 Thu,  3 Apr 2025 01:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9CrYBXWZ3+kfuKZjvR1uK1OBAdc1w7Rk47OZXeThbN7xW+GXvSX8oNGBfviVAw6YZ+vMgW53nG1bEmzGIjZYjKCDqouUWKIpPbWGvcSNYVhmc/io6G6cuvkYcG6LL4rXDP79wZzKNhdX5qtLhxYC/Xn0v11LP0iofKfEZzxKEj/IN14qRZ4DMy3a+FQmH9OO+HNvV9Ka9VZuGMaDvhhN2XSarW6BcBcoBMFve7zDeV8y1UHbSI/Y9ndhXVdgJcMpD6vOqfR9m7ykTcESNTjUItWzXgBz4iHGbUEor6uiAtbz95aXdYtfSUi06PR7cQTI+Iy7NMcXnL8/nUnAeFUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TpjkSCCHP4K85KWTexXNwMl/MeAXQ/uUbbVOCjDPSE=;
 b=Mnz3MqMEskjPYz3Pv8WKgm6VWeuuot0z5j2sDmJGEmwcLlmIbEgWjXvjAxPo61UqujtJwPD/thnx+5/Ks5EjJ6UdEQ0TkuA8liMlWCXnq0kGF7twRhhhZKPiUtdK4q1soRyw8LW5G3QCo+V1DTYJm4PyP2NMfcttBNt1g16Ex05xHPJo2xCqTUoH6AYXQAH2ym2SDRFq66ABpJeRwhDKuzkDLSRm0DTJp50P/U4HphciVQ6vn3P+7QxDXY7OZuFRlwYXNcXLC25pZXR9oPY22JJOmxbWF/LC0C899Lbm7wbSbQCsQfpakDqoKyns6aG8WPjlth9Y3NnFMozrrnrQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TpjkSCCHP4K85KWTexXNwMl/MeAXQ/uUbbVOCjDPSE=;
 b=BQh9u7D3Tp0fDJNEtBOE5DzpISdxoOWMZKsbnUh7R8/pcZDsyuqlgc1A/wY50hWsXc4ADg1eQxMxwm2P8Xw83VLIT3iLtmDMi3ZIL8iPOe576GVSTt9bX1VKH9VsC9EDLhHcHkA+3E7ZxFP4LqM5swk2yCOp7agLWmnqmH5CfAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB9036.namprd12.prod.outlook.com (2603:10b6:930:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 01:30:21 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 01:30:21 +0000
Message-ID: <ee4b2ca0-137d-4bbf-8d44-25c263bbac55@amd.com>
Date: Wed, 2 Apr 2025 19:30:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Remove the redundant NULL check
To: =?UTF-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dillon Varone <dillon.varone@amd.com>, Roman Li <roman.li@amd.com>,
 Ethan Carter Edwards <ethan@ethancedwards.com>,
 Ivan Lipski <ivlipski@amd.com>,
 Iswara Nagulendran <iswara.nagulendran@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Rafal Ostrowski <rostrows@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20250402142134.375176-1-a.vatoropin@crpt.ru>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250402142134.375176-1-a.vatoropin@crpt.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::15) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f05357-4f8e-4297-4008-08dd724f194c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnNYUEZFOU5Vb3RwaHowSnl3dXBiMDhVWG16NjFZTGplT1FrUTRkYnZpZDd5?=
 =?utf-8?B?WHVMNlAxb1lNZlppanR3L1kzbzJ3UjIxTFgzQ2ZiQ3Q5UGp5c1Q4RmlGOXls?=
 =?utf-8?B?ME84WnZQZUk1aUs2UFo3YktubXNxYnc1RWRScHFjUEg2UXFtV0ZoZDcrRXNJ?=
 =?utf-8?B?NXRidVlQbFJCNVl2Z2p6M1lNU25ZMnJ4bzVNYW11TGtuMXBEZUlDVlRqZmJK?=
 =?utf-8?B?SHQzbUowT0xjL1dlVklvK0p5QkZrQ3NYckRKU2tPZjAwMjBpU2o0bGo4MjdF?=
 =?utf-8?B?TlliVWYzODQyMWFVbmlPUCsxc3JHSlV0d1U3TWtwV2NiNkEvSHNraHpWZUtD?=
 =?utf-8?B?N3QxRmNxV0NNSURsVjBGa2dqc1pLVDlGNjlUdVV1emcwV0JPQ2ZDMzh1clJh?=
 =?utf-8?B?VmJkUnA2Q0xGNjNCL2toQ2dxRTBMMlEzdVVUSkRNc3R2enlTSHJxWFVpMGVU?=
 =?utf-8?B?cGFjTTUyczVrdTIyekZvM2VxTytBWS9Bd1VSdjAzdllDak1xT29HWTJXOUhB?=
 =?utf-8?B?aktjWDRlN04vME5Hd050RXhwaFk2c05JTnl1bzUrZmYwT1I4V1lwZFA0dGRj?=
 =?utf-8?B?WjErbmI1d1dRVEJaYjE4dTVFTG9HQkJVdjM1VDdMbkJZZFhweTc0SmhUNzN0?=
 =?utf-8?B?WWJMaVFSQm10cFVVT0Zmdm15aGUzQWVZNkpuQVlBMS9xY3AwVGMzNmExajM2?=
 =?utf-8?B?WDV6a3hOc0JsWG9UT3pSNDEvRFpNRWRPNk55dGpybHhuK3RQSTU1ejJiTit6?=
 =?utf-8?B?MzRsL1dEakdrdzNBNG5NNTdxVGR3Y0g5K1BjVWpGdWZCUEFid1VaaWZFU2pN?=
 =?utf-8?B?WStiU3puSDdacDZCaysxSXN1SjlDbVhVMjYwbHZWQm0zZnM3dnBvVU8xeUZp?=
 =?utf-8?B?dTl5c2owNllYQWx1a2RLRlcyZCtSN253SWFaOHRZK1BDZWFnVVBHeTE3d2Zm?=
 =?utf-8?B?SHZuNksyelpYZVFOTzB6M3lUSkpsUlIwMUFMUHZqQmhVMUZLZlZUOUFvN0FC?=
 =?utf-8?B?c1VlOW9FemptQmJ3T0p3UmRKMUFtSnpoMnRZSGcxT21DWlZFMUxmY1JrVDFi?=
 =?utf-8?B?Wkc1QTdSa0p2R0JzUmw1WjZLTlIyOGtSWXFGaFJGSi9YNWk4dVZoUVVSdzM0?=
 =?utf-8?B?d0h6NFI1K0xicldvODRjbzBRTjV3TC9JRnRkSlhtYmlBZytWS1pDQW9mWDhE?=
 =?utf-8?B?S2laRTJmK0FJUmdnTkp3K29EN0VMT2ZkbUFOSFlyV2dSUGJkQnNRY2Nzc2RK?=
 =?utf-8?B?NkVMdmU0TkZGL2RGTTl5NEM0b2phMk53d0plcnh6MDI4UVNreUMrV2RLZk9E?=
 =?utf-8?B?Z1B0SE0yeTdmNHdzVFpYanAya01SRDhYVXVGaEZEaTBHUVVhMm9pcVRzTlVa?=
 =?utf-8?B?SDRKcnJ1MVBzdUNVajdJWSswK0RYWUdXWGFRUGhWUWw2aHhGeElNaTBwcUk1?=
 =?utf-8?B?eU5KTXNyZFhPYy8vait3N0V4NEEweGdTY3c0SHYyOUdxNE9WTkQvSGlGRWt1?=
 =?utf-8?B?QTFsa0YwbEN4T0NiTHNCQmNSaHFYWDY3RzhCWENSVzVPWldmMnhlUlRZLzV1?=
 =?utf-8?B?Sjg1ZzcxM292UllvZERNbFExM0ljSFF5WGg0T3R0MHVxQzNuNzNzYmQ2dmFv?=
 =?utf-8?B?eGZDbEhGVmdJc3Njcml0UGhXMUd5WngvOC85TjNuZEpsU2dNOXdrQ2IzbXh5?=
 =?utf-8?B?VDNIa20veTJ3a215T09UQUdrR2pKdTNNaGUvTmFWRmMwc1h3WnZEMldUZHFx?=
 =?utf-8?B?RUE0QkREdTQ0dDdHQzhCekRWVitIYTl2MjZVRXUzRDMrMDNxbnM1N3lFZEpq?=
 =?utf-8?B?eVNwSnA5L3g0ZEQ2VndiQTVyTzlDY0NhaTNyNG5xeTd0dVRLSXRyRUJGQ2JL?=
 =?utf-8?Q?PWMQmTWzzjI42?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkdEKzBDSU9ERCtaVjdZVHZpdFFGOFRaaEY0UkJUOXU3MzNRbmRsWGlRa3Fx?=
 =?utf-8?B?T3BWckhwbGZvRkVUT1ZCcmc5dUkwTDU2VmJwNmVjcXJGODZxdEtweTg1Y2Nn?=
 =?utf-8?B?a3B3TEwxdEoyV0hVU09iSjBtelg3dlBCZFpjR0ZuaHFCcU9yVUNwSXZRRVJr?=
 =?utf-8?B?aVlWUC9mRzRLem1xajc0T3Q1cmNyR2hnOTFiMC91WnN3bGZoaG5sNEIrbG9Y?=
 =?utf-8?B?dzZKNXlPdHRidVgvVXA2L1B5Ky9ISzAwV3pvZE8zY1YxcGNJSThEQlhZL2Zx?=
 =?utf-8?B?b1Ayalh2UUVwSWdYdzdJRDU5WWdNcHM2d2RReVFJRHF4Q3Ezc1N4d2ZSOEVF?=
 =?utf-8?B?LzdUZ1A0cWllTkcyeVJ0d0RtZ01PVGtqUEVTK2c1OXpVMlQvc1VwUVdpaFBG?=
 =?utf-8?B?QnFzTU14ekV4WmxOeVB1SmV3d2ExUmVwRGFsekplQUtRbzdYZGt4ZDJLL3Rw?=
 =?utf-8?B?bXVnRmNxOXhNdnh1bUxwbUg2eUxxYThQRk1xUFFxREg4REpBSW8xY0c3dnhl?=
 =?utf-8?B?dDAwc1Fici9OK0JvSzgyenJLM29Va3ZLSW1FRkVnMnRURU9naWRVU3k0OStx?=
 =?utf-8?B?d0tBWVdIWDY1eTdiTVdjNEhMNU9iVmRISGxkOS9JekhzMlZOL2RzVnNFOXJ2?=
 =?utf-8?B?bXdxcG1Db2lhUWV4a3FJbWtOd3B1aE80Z1daeWdDT1BNY1REY3h5Y3VFVHFi?=
 =?utf-8?B?akVvYXpHeENqQnIxUkhUYis0eC9SMzQ3WTMweUVyUXl6T0ZBaXIyYzA1SStQ?=
 =?utf-8?B?NjFhdG1LWEVhRndBbU1BeStFZnFXZHB1WFRVWHpQR2J4Z2Q3MHI1RjZxWHFa?=
 =?utf-8?B?TWhKR0tiNW4zWkxFdXNZcFpheG9qczVKbHlYdEZaeGxYRzRTdUwrL0NydUFP?=
 =?utf-8?B?emMvOVh1MWVZTjZyMkorc1cxMURqVEE3b2FsK2JseHlBMzZET2luNW1ma0Uz?=
 =?utf-8?B?TjdHelVxTTUvOVloM09xSndhUUZEYUUwbEcyWDhETEU4WHZ3TVJnSTIxL01H?=
 =?utf-8?B?c202K0NUTVRycDd2ZUVUQlRSaWdOOVIrQXRqUzFESTdWT0xTWHhQb3pyT25y?=
 =?utf-8?B?N244NVdBV3NjU2FPOE1qTkNVUHhPK2xTb2h0dDFLNTZaU2VNdTdMYXNETHZQ?=
 =?utf-8?B?STZtWlFIYlI4aENCYXpkRDRIdlhtYzIvRUw4c05lUlhQRGtaT01ETHRnaS9R?=
 =?utf-8?B?WVlPaHhKWjI1TWFaQzUyRDF0QkxQMnR3ZW43Uk5lSlIvdWdhUE9RUlAyTmgx?=
 =?utf-8?B?VzZRZFU3NGl4UzRRSUtNMWprSThYVlRxWDg2L1o3QldpQ0EwQmNsMmYzM01Q?=
 =?utf-8?B?dDVVSGxuU1VXYytXc0MrQ3hDemlNa3hGcVh5ZHVrRWR4cUFFWGxZL1hRZlYw?=
 =?utf-8?B?YnQrYjY0MVF3MXZJZ3cweDNaWjMwRCtZa2t5SjdaRU1LcUt4ZGhBc1dVM20v?=
 =?utf-8?B?KzE3OHVoWTYwdURlZ0pleVl0cU5iVjRaQzltT290UFVPTnkzY3dGeDdWTnlJ?=
 =?utf-8?B?NlpPSVV2MkorSWhtdmV0a1QwcUwwU0lJYTYvY0QzS2ZpK2lOM2o1SlFVNU5W?=
 =?utf-8?B?TGpSeEdFMURmUEJzV3J5eXZFeU0vcVo3SkZJM0FhelFVTFFheWUwUGhqeW96?=
 =?utf-8?B?QVRNSDZkcFRiYzFhL1hncFNYTUQ3Wk0vSi9DRkxRak50MlhDVGZkQnFoQWhL?=
 =?utf-8?B?Z1AzYndCaWlnU2p0eTI0VkR0WkJGblY0dzZNNktlRzFrWUtRSFAvQXRHU01t?=
 =?utf-8?B?QURPTkVzSkJxc0YzcG5GTG4vdkdRS1JNaFBwMlh0K0hPT3lHUjZ6WXlrNU82?=
 =?utf-8?B?QUpxSENZT0NjNnVYS1VlTTZ6QkpFK2hEQmlRaDFqbXY3SFpWdVBVUjVHSVRI?=
 =?utf-8?B?dXA1dTQrdkYzVmM1M1VnclVpY2ZJL3RZMmNMRmRpR2o0ZjNKcGhJaFplRmh5?=
 =?utf-8?B?ZW5nL1pNZHpHMEROeFY1dk5FM0Y0bll5QmhTeTVmRytrNHUrM3ZxbEV1bU9Z?=
 =?utf-8?B?ZXNFaGF4YmlXVXFKWWQ1cjBBVjBHWUxyR09iWHpmRENhVUFmeWlxakQ1S1Jx?=
 =?utf-8?B?NTZJLy8yMGxrRUxmcjg4ZUZJa2t6ZCtPN3JLMkdIMm9ReEdpa1pHL0JnZWcr?=
 =?utf-8?Q?SsfMqfEhpXi0kI8Ssj8CAPjcT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f05357-4f8e-4297-4008-08dd724f194c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 01:30:21.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYjfVUR71ewo3aEuTw19Q6+nRn0OyHXoNxSLW5KTUbu6xmLUoICt7VfLIxVrrSDo97jyIBRgb2gmdW1Miqajmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9036
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

On 4/2/25 08:21, Ваторопин Андрей wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
> 
> Static analysis shows that pointer "timing" cannot be NULL because it
> points to the object "struct dc_crtc_timing".
> 
> Remove the extra NULL check. It is meaningless and harms the readability
> of the code.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
> ---
>   drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
> index 13202ce30d66..76e8c4dcf339 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
> @@ -1891,8 +1891,6 @@ static int get_refresh_rate(struct dc_state *context)
>   
>   	/* check if refresh rate at least 120hz */
>   	timing = &context->streams[0]->timing;
> -	if (timing == NULL)
> -		return 0;
>   
>   	h_v_total = timing->h_total * timing->v_total;
>   	if (h_v_total == 0)

