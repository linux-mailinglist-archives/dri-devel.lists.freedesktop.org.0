Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C09C84B0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7501E10E1DF;
	Thu, 14 Nov 2024 08:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KHUa0sv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D2410E0A7;
 Thu, 14 Nov 2024 08:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdtvwNlwqeAq3BknFcvH85tAusXQBHEPCrj8R5YGMBRemPw81VlAQ5p2pM9uF6vQnKB/U/E6+mqDyGN5bpAYyWuKIRJD0N56IUJ/B8LzvdNKLHjDetcOtHJNZIV7vuPv3cECB5jx/LofGwL5b4kmII3ZVc8vRLYEjYBydKZc6EkKKvpBaQNZp+n11CKNoQt3nTxqQENb2X6LluO2xlKwRsNkVtHrZzY97wgCwht5/St4pLgmTN3oz0wQT3lPDEddgsynl3klCfqOcYBQEGDw+dINjv7qw+wNu4dVaDBFqb66o/E+nrFNA8WyzrtAvntzLa3D1WQzJ/j+PA9jvenfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HwhHup+UAFy43kVaqzLA5oRv2v4S16LXMwM04UpkwM=;
 b=LpYGLSmZD+er9vQDPZunhLkcUPZ6X0qlyHQOitmrkztsZDwDuavdlh0YDtNQMV3dIGBALoXH4N2mgR7QWj4qU4OQcsrmWvcxOrkZj0hXDgV8LsSSdEL8ThQwjbfhKE7yMJ68nQf4i7QK98xmn+jmTa/td8kxCQj1lgnxfwEQSdCNUdVQZWuZ0EA7rIFLRgCEU6v7shEzFwF+XtvIp2GYIujvc0yhPXNe21SWUUHVpru4qhC611avK3IbXRSikgRSM+ofsyVQCaAlRw/kmV7CC/6/6PfqEY6/P2JLS8aFd0Ymj69rvrTxt+t/Y0awmVWuSL8dDktvam1gFJa8QH0I7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HwhHup+UAFy43kVaqzLA5oRv2v4S16LXMwM04UpkwM=;
 b=KHUa0sv3/ErSTw1thbRVkVdSWEY8XKMiascJ+sr898xuAxke1YFRr6t47d0sqADnormRO9AbzRqAGjsxZ89hBoPahF/tue+TCJwYNYe8Vkv+TZHNIRJ7yI87Xs101Puf53Cc5Flzcw1uoYxc7R+gxcSmY1hnCeZg7c5NSQ06xqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Thu, 14 Nov
 2024 08:16:17 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 08:16:17 +0000
Message-ID: <93788edc-541e-4f7e-afe1-02a2526be684@amd.com>
Date: Thu, 14 Nov 2024 16:16:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Fix null check for
 pipe_ctx->plane_state in hwss_setup_dpp
Content-Language: en-US
To: Zicheng Qu <quzicheng@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Dillon.Varone@amd.com, Alvin.Lee2@amd.com,
 nicholas.kazlauskas@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 relja.vojvodic@amd.com, wenjing.liu@amd.com, george.shen@amd.com,
 mwen@igalia.com, yi-lchen@amd.com, martin.leung@amd.com,
 srinivasan.shanmugam@amd.com, stylon.wang@amd.com, jun.lei@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tanghui20@huawei.com, zhangqiao22@huawei.com, judy.chenhui@huawei.com
References: <20241105140137.2465572-1-quzicheng@huawei.com>
 <20241105140137.2465572-3-quzicheng@huawei.com>
From: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
In-Reply-To: <20241105140137.2465572-3-quzicheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0050.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::12) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6fbfe7-9e58-43b1-9a0f-08dd04849cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uks0Z282d0paL1krRDBBNmFsbU16OTQydzM1SjBlTEoxYzNDY0NWMlF4YitN?=
 =?utf-8?B?T3JoSzdhU09nNXkxaEwyTlZiaEdXQm5WbFlRL05iMnRMRTNBNzhSN1ZVR0FC?=
 =?utf-8?B?L013NGRHQUt6OVlzVjh0bTJkRjBORVBGa3p0dEg2UmEvT1cySzE5NG9BVWl1?=
 =?utf-8?B?N1NZU0V0Skp3SVVWREZWZ3E1SXFsSThPZm1YUGNzZWM1UXNWR0l5Yzg1ZDlT?=
 =?utf-8?B?dFhvaWxaQjd0Z0JaZ0RoQnJYQTV3Q29iVVJ0bnB4NWxvTG5pYVU3c2hvRzc2?=
 =?utf-8?B?a1BWR2Jsc0NTdmlXVlV4TnB4bEpmTFMvZXlubjdRUm5FaGFqOW95K3d5cjZw?=
 =?utf-8?B?TEtyMStUbFVvTUZBTnZ1Ymk3Vmd2ZFkrSjc4SFlRM29uZW1UaXRya1ArUTZS?=
 =?utf-8?B?VUp3MGpDbTJ4Ky85SmhhaW45MDF5aEtJclJKUVFIT0N2T24yY3NnWG5FWXZr?=
 =?utf-8?B?RFhCeDF2a09IVHZMYjRmK0pYUFcwZ1h5Tmd5SWc4aWwraTlvY0tFblE0bkg5?=
 =?utf-8?B?S1VLNldrWHhMSkxCY04xeEpKRm1xVDNpN3UxdUNMWFNHRGNFZ05pWjR2VDZs?=
 =?utf-8?B?SEVvcDJRQkI2elZIczU3bndWaVN0NnZCd005d0kycnpWOXBkVFBEU3RtNUl4?=
 =?utf-8?B?dVplaDRPUHNTdHAwdGRrY3RndHMxM000Q0JDNGRVZTFGU3N0RGNoa2toOHBG?=
 =?utf-8?B?VG9iWVpnV01KWk1LY0Rrc1d2ME5QQWNxTWx2MTBWeVZhbG5yZExFOG0yL1R0?=
 =?utf-8?B?TjNjb1VEQnRndnA5ZS90aUlvYVVyN3hieWEzL0RZRURKOWwxUmpRQXZSUkF2?=
 =?utf-8?B?RzVPcG1oUjFzWFRUeDZyeElPclc5OWRyUVVFNjUzZ1FQNzJoNmRPOXVkc3JY?=
 =?utf-8?B?Z0ppdkRPT01ZTXRleFNjYURORFByMGFpRDJzNlJkVEZXYXRkVGN4c254Sk5m?=
 =?utf-8?B?alhxUUpSR3licnd4Y1ZJVjkrT3R3eFZKa3BONm9iV0xsdG12aUlBTHdtRzgr?=
 =?utf-8?B?NXF5b1ROWHBucFdpVnNZMENiZFFqSHYxaGtQK3BxMnI3N1JtLzJLK0ZQV3JB?=
 =?utf-8?B?Z3ZBSlpRWkJORDNGc3h0aHFjYVRDY09JN1ZhNVRqYmRhaDR3NGJRTXEyQllS?=
 =?utf-8?B?Y3N2ZFVKVWx6T1lPRHJxSTcrR2k2WithNmtGa3VBMHdKbjFGcExFTjlLYUpM?=
 =?utf-8?B?eVJ2Vy9iRnNpWWNEMFhZTHVaWU42ekVNQXJ2RTg4N3NuNzlmU2NRck9kUW9G?=
 =?utf-8?B?ZG9FYVJOejl3cHFvZGNMa1dCWnZkVUIvVjVIUFYzd1p1b0tHemZHU1plaXRP?=
 =?utf-8?B?Z24raHJyTWJUbHRiMnRPbnVONkxWbVpiNnJvcVk1bnFRazVaQ2d3Q3liVGdC?=
 =?utf-8?B?OGpFWS83aUZkNnJBMGJhN2svNU5qSWVVbm5sNmgwQ0FDZys1MTNlK0NOTkxa?=
 =?utf-8?B?WTh5a1FLRUR3cDFuSHJXdTdwcmNKSjhrbjMrYjBhSnJYK3gyL3p4QldLbE9l?=
 =?utf-8?B?L2lVMEJPMDJQOU9lc013NHFzM3hnWVk1aEt4RlJoSUhydVJHNkxlcXFEdlB1?=
 =?utf-8?B?RGR5MWVzdFNVR3lCU3FvT2Zyb3dRUktUdlo4ajRiRXl5eTJhYWw5TWpiWkR1?=
 =?utf-8?B?Z3pmbGdMOWZhZE9Bb0NxU3R1bi8vVXYwSDZ3UmMybnB4aGMxcG9pWEpVRDlh?=
 =?utf-8?B?Q2piNXdxODJ3QmxOaG9EcGs1aXd6ZjNOUEE3T2lxK0pOWHFxaHhneVN5amVQ?=
 =?utf-8?B?dUFrdTRyZTN5WGk1enhWS3dCVTExUVF0cWtqRXo5c1JzV0h1RGpZWFI2eFBn?=
 =?utf-8?B?eFcwSFFBM3FUbFl3RnA0dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6604.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHB4aTJaZHdtOHlqa1JMUVQ4NTJIM2E2YWl6b1Q1aTJxUU03WWE2V3I5cTJG?=
 =?utf-8?B?a0tSS1U0czJvNGZhVy9LVCtUQWk4YW9KV1hIdS9rRDYxeWxITGR3Mm1WV09t?=
 =?utf-8?B?ZVpXUm5uelhOWlhqRUJjQzRXLzR0NDJVblgyMEpXREFHTU5UbElGMDgyUDBn?=
 =?utf-8?B?MG8rdjFkazArbGIvNEpCcUJBT29CTnA0NFZGTk9YQjNrdGZFdHFwNEUwQkpa?=
 =?utf-8?B?ejhrTVcxVXV2UXZZcFZ2RmlrRDNqakpDSXc2ZTFNSzE1bE54dkhOU1VHR3Z6?=
 =?utf-8?B?ZEtzZ2J6VzRua0RpOUdRUGR5ZUZYck5HNU5NR1NFR3Ryc2l6eUVzQVY2R3E2?=
 =?utf-8?B?dDNGRXYweCtBVzRaS0ZwTm9SbFlFNkovb1EvbUJWd0h4blBBemxtQnRrRDdJ?=
 =?utf-8?B?TWpBNUd6WjA3T2NtZnE2dDRUMmd4cVFsZlAyVjNWREpOOEJFaHpLQ3F1QVlK?=
 =?utf-8?B?cDdnV285d082Y0JFV1hFdDEyOHRyOVNZZVNUNCtUK0NqK1JPSjh5b0JKMkg5?=
 =?utf-8?B?TGdKbXYwZ2RaZmREMzllaXk1eWdXa1JFeStaR0FIREZGR0U3Unp1TlovK1hz?=
 =?utf-8?B?d0w5RCt3emY1VWJFTUIwbWkvb012S0FFRktiWmhvRGt2ZUZFTlRqQkhFN2RK?=
 =?utf-8?B?QmhzQzlxa2VIRDVTL2h1MDc4MEdya2lEYlF0N1czNzBRWFc1YjM0VGVCYWtC?=
 =?utf-8?B?Z00zSG0xUkdGeXhhdlVOSzU0WnpuQlpjcVhUYzFXZHRZUFRiY2NSYzFoWU12?=
 =?utf-8?B?czNKbU9OY2J4bzVxeDBCWW52NU83dTYrQWpXdjhpUURHRm1vVlhrNW90NmRB?=
 =?utf-8?B?bTNYNDVRcTBWcnNWeHJ3ZTZ6QlpCcVdoMkQySnEwYjBUWW1jRVAzNmF2NmZ3?=
 =?utf-8?B?dWJmTFVZb3lna3VZaG5OcGUwKzlTWXhKT2lXTkwzZWlWMWdsald4eU9raFdI?=
 =?utf-8?B?SlUxdStrL3lrMTU1bmpZMFhtZTdtbFVKYSs3OE1MS1ZNbXdNK0ZVWVhiUkpn?=
 =?utf-8?B?TWF6bjVDaUhVV3g2NEF4c2FXRFVwYlpZbXJSajZUb2pMK21XKzNTMWlsR2F0?=
 =?utf-8?B?WGtKeXp4MUhmMGxnaEVaVXl6UjFSNEkvcmhFdTR1ZXFBaVBCd0VlRFB5Z3Ex?=
 =?utf-8?B?SXFWK3U4V0JXNlpuc2QyMTZId1ZITmlVV1UyUml1STZaYzcvTnRhOXVsQUoz?=
 =?utf-8?B?ZXNYYVlvdkpOdER0TkZGNFB2TUFnQ0tCWmh4bHMrUVJoaWFEV05XeUIrai9u?=
 =?utf-8?B?RmZuSnpZaHpUWXI0MGs0UUFid25oaW9Kbnp0ajhlL3FHS3preXZSVy9sdHM2?=
 =?utf-8?B?R29KU0h1NHlBYTBhdGw0MVNGMWV5clNkaHcrM2ZXUUpvUFdsODBzUE1OOHEw?=
 =?utf-8?B?T2xGb0JXZ3gwVnl4SFhCRER6M0I1N1Z4M3V5UGxwZ1lSQ0dXU1EycExMSWxh?=
 =?utf-8?B?eURadmRsRDRKMFNaS1ZLYkp6RzhKQld1K0Q2eE1EcUZmMk5lZ05sV2hlVEp2?=
 =?utf-8?B?dVBGWWxvS25pRGtRdUV0aVFuTHluT2RCekZHaHFhSmQ1TGdEdEhENVVsbUNU?=
 =?utf-8?B?VkRUSGtubFIrWUFPRUJmZ0hNRHVpeXJ0VTVQaDA1T3NvZGdqS1Nac3VuUFk2?=
 =?utf-8?B?YVQwa2xqaDJWUmc2Wldpb0FpaURjQm5EbXh6RmJ6Tk9JRzlqcmhYSGM0cEY1?=
 =?utf-8?B?Q1MxZCt4OHJaQzZMY2NKMXZ4c1VEL0pJYU9UQmYwWW1UdXo5bFlFZ3U3WUtB?=
 =?utf-8?B?QUVmd1BrTU5OZm8wWEdqVEVRbllLUHZVZWRNN09tc1lFa1cyUHJrQUJRbTZV?=
 =?utf-8?B?NjNoTlVNMm1ybThhZ1pHZmZEZVdISmdCUFBEaE40QndRSFVBNXJPL2pZSWxp?=
 =?utf-8?B?YXdCNlBWVHVtMG1JNDhhaWh5dmFXeEl5cXZtUE54Y1Vjb1NsZE5CMk5SNVlC?=
 =?utf-8?B?d01JbUswcnIvazRJV1Qwd2RKbi9LeDBuWE82TFFJczVEd2FrMEQvd0dKdlhL?=
 =?utf-8?B?R3p6TWlTNllLQ1QvQXlPZlE1dktNUzdCWVRjc1NlOWZleGhvNC9lTTNOdTFi?=
 =?utf-8?B?aWoyaFk4RHd6cTZLSFZ5SjdOSXJYdXlqQ29UVTRvTStybWp2NEduMUpUc210?=
 =?utf-8?Q?iYL2JgnQRAgNrn3S3PDxf+tnS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6fbfe7-9e58-43b1-9a0f-08dd04849cd2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 08:16:17.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkp6WwYgUZxjX44gUlRUdADStDe64GnjEfLuuqL+IOHPYNJAFlTk+YEKvsnZ8mcxOeR1Wxs/Vfe86bHkbuN6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236
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

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 11/5/2024 10:01 PM, Zicheng Qu wrote:
> This commit addresses a null pointer dereference issue in
> hwss_setup_dpp(). The issue could occur when pipe_ctx->plane_state is
> null. The fix adds a check to ensure `pipe_ctx->plane_state` is not null
> before accessing. This prevents a null pointer dereference.
>
> Fixes: 0baae6246307 ("drm/amd/display: Refactor fast update to use new HWSS build sequence")
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> index 7ee2be8f82c4..bb766c2a7417 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> @@ -881,6 +881,9 @@ void hwss_setup_dpp(union block_sequence_params *params)
>   	struct dpp *dpp = pipe_ctx->plane_res.dpp;
>   	struct dc_plane_state *plane_state = pipe_ctx->plane_state;
>   
> +	if (!plane_state)
> +		return;
> +
>   	if (dpp && dpp->funcs->dpp_setup) {
>   		// program the input csc
>   		dpp->funcs->dpp_setup(dpp,
