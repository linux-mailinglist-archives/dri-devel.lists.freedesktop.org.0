Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73042B21755
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F1A10E54B;
	Mon, 11 Aug 2025 21:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HUrhwFYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8911710E54A;
 Mon, 11 Aug 2025 21:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2pT4zj63OMkBRIRqtJE6CtIHX36tjxfwm2RgHXfxz4wLAsnNVhvJ3AkMmGxIHgRV54hHdEQT9okEWSMbCgGFpxVsMaI2Xrzlq5m/Csq3SN3o2A9y2lysdqbEXKqfgkGm5NbToOiKEpSbk6qfFMJ8XVTxS6viwOcuhqWGXfehk0DNy24vkOZecxbA683HDFGhFIj434LbEM3qIw1HQ+2KP76ibJysX4FawzJdqoLVO9ca+0cSCCPeJ6SrgcKPOyK3VmoxYZ/O87EIZgvjYsCjLu/oAKWGYiUsFa72kHljqrcYAEI2jndvwN2pPXvUMP3slridUx7uixF9EE1cRSx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuzmUttsVVsUClXWoLfK8nCFedQ3VLp2AQhsFa6qkVM=;
 b=h0KvxDQ3iRw3L2B6O7VpKW09zwKJsTGA/tD2FaYsxH4VvAjWt1dxFye2bXHzR06wYi1KK2kcAjUA+R0gFtylRyIfpajDlkPjbJlgQALBcxHfNQHWEc6JqeEt5rUbHlwFDAOd9MFC1Bmvm/wBBLlkS/WB8aXhGy7GV6Lqx1Y9R9lNPWUboLdQNUTQ6Nvj/6VUjwe8rJ/DqPbvnjwCx+JsMoTYrkI1kQZWrQeqMxfcygu3NKmS6ocu8bGYazGCX0LFEZBW3CZ0XYEm2NeODveO0MIeocFscLB2FW28vieWUqgf5WZai/XNYpl7a9kGbeGQ+KhFFJkrU1Vw8n4xiu1DXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuzmUttsVVsUClXWoLfK8nCFedQ3VLp2AQhsFa6qkVM=;
 b=HUrhwFYu+v5K2Djzr1b/V+9lQk8Vle6QLunS5aBUvMYM3H5S6vz2m84zMTOqZQj/GL3XkQOs736Gmj2s8DMFZzHZtVtSmfpFJTVjNr7eSRVcG6XRMTpCJ7BouCVGz3Ul9IG6IVtInsG3fi4jJgm1H957GMHRlgcjE1aFjExOqBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:28:01 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 21:28:01 +0000
Message-ID: <3c8e02c5-023e-451d-958e-4f86e9df1495@amd.com>
Date: Mon, 11 Aug 2025 17:27:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/14] drm/amd/display: add drm_edid to dc_sink
To: Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Alex Hung
 <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250726003816.435227-1-mwen@igalia.com>
 <20250726003816.435227-14-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250726003816.435227-14-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: ec688a41-616b-4368-c164-08ddd91df2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mmd1dGFHajQrRk9UUHllVndVRGtxSmt5bitOWFRiT0ZWYmJMNk4vODFSUCti?=
 =?utf-8?B?Y1lXK096MWE0STc0R0R4U2I4ckpnQnNzdjFtZTYrMXFpNytiR2l3elg5NDJN?=
 =?utf-8?B?Q2laY3RMSXZNTjIyVTcrenk4UVN6QUtvNGVqbzFWMlpuMHowRWtDdTlsRzYv?=
 =?utf-8?B?TEhJM3VVZFltSTR2LzMxR0ppR24reCt2WTVva1VabG5wdEZodEFoSmp5WVBE?=
 =?utf-8?B?QTYwQXhnZHMrOUtETjZaRnhWMXlQalJ0bWRUQ05QaGlMNXBDMVZEdVBEbytx?=
 =?utf-8?B?dUQrYk00d1EvYndDOVhSdnFwZ0ljbGY3S1k5ZTVOSThadHN3bjQxdTBqN0xS?=
 =?utf-8?B?OEQvOFB0cjJvSkp0TngwWkxkbWlMWGorVVBrWS9XTGFVU2ZrMzVETkhWUXhN?=
 =?utf-8?B?djhmWlYwaGgyRnRxdjBHRmliekhkL3czY2tZQmxrS0YwdVVOc3BjOVdGKzU2?=
 =?utf-8?B?RVB3c0FUNFRvWnFjUXBWYXVTTG5nSWxtbDhBRHVWdkRNNDl5YS9wMVNFcTFD?=
 =?utf-8?B?cHZmNXJ3bDkvZkd6WXMwOC8wKzdOUDF4RHMvblNpOW1aRjZHL1NlR00rZFRT?=
 =?utf-8?B?akVKUTVCb0drMkZ0QUFxNE9nQXpGaUEyTCs3QS9sUEE2WElLRWwvUEc0UkEz?=
 =?utf-8?B?TTZKbDlEcHd3b1o1bmRSOGRoTVhuOWdONDY0S1ZSaXVLcDRhU3JGdEtVNEpI?=
 =?utf-8?B?Vm5RUWd2UUNDcDZvblpBaWhodW1pQ1RBQlVaWjNDcm5OVEFlUmFvY1BFWEFR?=
 =?utf-8?B?SjVCdFBOV2VRQldUaDk0VkpOOFVrMTkvOXR2WlhEdUdlUEJSQkdVdnhDcE5D?=
 =?utf-8?B?WWc0MGJKbVVmbVZETGIraEFpWFNoY3htVFplRThydlliNS9pdmdRYnZRL1la?=
 =?utf-8?B?eEJsRzNNeWtyc1FHUnJzNUhrRFJXYkViTiswazcwYkc4Z1hGMlRNRFpzWmpV?=
 =?utf-8?B?V0hUTW8vU2hjNURiZFRjMWVUTGgrQWJoQlRmMTRSR04zN25UYk9lUWxTVkVk?=
 =?utf-8?B?VmRZS2JlTXJ4aWgyMnNWQVdZOTNkUFlRWUVxcFhmTFhuckJhcjVCR2NzUlZx?=
 =?utf-8?B?QnZJR2dMdWhJOThycG5vQXBqMXY5NmdUMWltUVVkbWlVWkx6QlkwNjIyVXZP?=
 =?utf-8?B?NjZ1VnZNeUxqdnh0aUhTSjg3UDVhalNjU2RtNGxTSGJhVDZpZWRzbUdzenQ0?=
 =?utf-8?B?VGVYNk10WUwvK2xLaG5Fa2JNNmhHT1cyb3MrT3BlRm9kdTdjdVppVnloMzIx?=
 =?utf-8?B?SFFNU1BRcWVHcFUvKzhENjhpdWt3Wjl2MFgwSGVnNHpLcjM2ZWlOTTd4MEZm?=
 =?utf-8?B?N1Z0N1hvL0NlK2R1SlREYVNoZ2h5TTQwTzlTRytaY1RuL0RtQndzTEkzNEFi?=
 =?utf-8?B?QTd2RkxCaDdtcFhJMUIxSGw3eVg0ZlFEQzZldDg1WlpOanRiQ3hZTXZ5dFVJ?=
 =?utf-8?B?bTcxSVpJVTZsR2F0TVpoTDBnci9jYzQ4cnhheXB6UE44cklrcktVR3IzRzEx?=
 =?utf-8?B?dmhOQTdvVWVzNWIvdzZLaDlvVjgwMExMWUJwWVhwYS9LaEpZWFJoT0NmTitS?=
 =?utf-8?B?dllKalFEV1NVYU5hVXdWd3dJY0NrbVJuelZUNDgxdzVtdlBTK2NhdW9zNitG?=
 =?utf-8?B?b24zRVZoVDh4L25GeGRXMXdESUhOakR4K0FKYkx0aitkdkx5VWl2Nmw1bWJt?=
 =?utf-8?B?aGt3RGNwTFJpWWh0NFZVS3JsUzhtN1BFb3Q5Tk9VQnc5bkszaTllQ0tXUFJm?=
 =?utf-8?B?djN5Y1hVa3pYTkp1UnBHbmlnZmF5VE5UOFZZcUtwaU10WlkyUnpNU0pmWmpn?=
 =?utf-8?B?Tm9kVjBlVXpvQkhPL0hnZStESi9wejN6TGY2VzlFaG9RVm1sVi9pRTFQdTRx?=
 =?utf-8?B?SGJTcXVkL1IvWVlzS2w3RnFaTm1LOTkvaHRudzN4SHNCWThodzZPNVpJNWxK?=
 =?utf-8?Q?R9NNgwoDtHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09lQ2VnYzkzdndzMzl0aENxdTZvRWhmYVJrNS9HZ2c3TVZ2YmkwNlhVZ2g5?=
 =?utf-8?B?UUtrcWh0NEFObzl3K3p2NUZLSnlnTGluK1BGQk1KWnJKZ3JiVENIRktoNFcy?=
 =?utf-8?B?MStBaEdsVTNCT2RnNTdhVm04UkU5bktmR0M5TEtNM3ZySEtFck81TmJEclFx?=
 =?utf-8?B?QmRnalRET2NBV1NydklhaTE5ai9UZU5FalRPUmRSQnhxRXJoZHFvazJ3U0F4?=
 =?utf-8?B?eHRkRG82eC9WMWFsbkxyODF5RmlSZWdvMlpuNTc3MTRReTJOdTBsTktBVkFZ?=
 =?utf-8?B?Ly9xVTV1RDJ3ZllqSzE4Y2ZWNmh6dDJ1S3pjZThMc1h5dHFWOHFZOHZLZGRw?=
 =?utf-8?B?TzBvbmJvYVNlSGIxdXZIVjF5bTlrSUg0WjBGNFV6Zzd4VFQ0Y2tsdUpYeDZI?=
 =?utf-8?B?LzQxK1oxR0RETFYzUmY5dVBIMm90M1FRMzRxT2VIeTgxTlhDVGJNT1ZmTEM3?=
 =?utf-8?B?YUZDVE5wazNIRWRnYmhqM0VPcmhQRHN2VzJYNGFCWU40UzBmb0N2cTFrUnZ5?=
 =?utf-8?B?OGpUcTZMSk1PazRBZ0dmYVpXSHM4ZndLVk1tdDhoTEZCVmt3akhKRDA4NlJB?=
 =?utf-8?B?MVRvcTIwRnBBZ3dwV2NEMzVteHIreFR0a09IMWNDOUxqUC9NVEExUHBLeThU?=
 =?utf-8?B?Z1ZpaVR2TklkOVZsT2R1WW9Ma2pKNnNjRGRtaDg2VnNleWxuTHZRRjZibUl2?=
 =?utf-8?B?dStXUTR6WWxnREpwYXpHTnBmaFhPQmE1b1BXUFVCV0l6bGgyeG1wT2xSd0pY?=
 =?utf-8?B?ZmRPTVVybG84RlBrd2dBWUcySWV0QlFBWHVidWJzdVh5aFRTM0l2QUllOVY0?=
 =?utf-8?B?K0syeTFvbzRZQmNkc0t4enVMZkU4NG4wNVJ3VmliUFhnc1B4OXJTQkEzNVE3?=
 =?utf-8?B?VUZiYURXcG5ZVGp3SUdsT0RvRjdGRllXRWlhWUpDZDRlWUo5ZHRuYkJDR2dr?=
 =?utf-8?B?bFRXTVpxNjhZN3RKQi9VRXJFbXNncGEybTlYZElNeE96WFg5QUN3N2J4cXhq?=
 =?utf-8?B?c2xIQmc0TDlIcHA0YUZBUlVRaU8yd1VFOFh4Y2VYbzJucWs0RFJUaG00Q2Fj?=
 =?utf-8?B?b0trMjBqbzJQa3R6RWtNc2lNSncyOXdhVzZEc0h5dE5iV3NzQmdOWnZ3M1Ir?=
 =?utf-8?B?U0lvb2ErZnNZTkNsV2IzRkg1MDhzQTNlV1M3a0NBakFQVGRId1I2OWRpWXNs?=
 =?utf-8?B?aENmQUlBcGtZWHMwV2FMcE80amsxOGNPR1hpMWJtNUxNUTVraTVtN2h3Vm9I?=
 =?utf-8?B?RUEzZjRnaGJXcFM1Uk9KVm4yS1hpdjJjZWRzM1JaUGxMNG9LMUx0cWlRTjIv?=
 =?utf-8?B?ZTlNMG1Wb0FjcHFSWVIwUWpNaklSSlc1RXJkY3U4TWNjTTZTbnYvNFhGTTlu?=
 =?utf-8?B?TVEwY0ZDUTNxc3MxMW5kVSswU2Fwblo0N0sxY0NSQ1ZMeTgzSDFBekdUK0pN?=
 =?utf-8?B?UlNRSE1zR04waWQvQlQzSkw4SzA0K01yQVJWNmV1STRQOXh2T2ZrMGUyNENS?=
 =?utf-8?B?c3FiazdEODhuSzhrRzRhYWZOTUpWTWI2dURtTDFLSEwxb0czODM1UCtSQ29O?=
 =?utf-8?B?V09mTXVjQy9qWnJ6TVBWUFRaQjB1MHE4cTZzcFZ4K201QmZERlNxUlh0b2RJ?=
 =?utf-8?B?N1IwZDcxZVJKSXVGRkw5dzhNSkJLUWZPbDdCT2IxYW1Id3FXRGVDc2ZLaGUy?=
 =?utf-8?B?WFdaZkFRYVArUW9CNitZbFh1T1VFNFlxYWN1SkY3Vm44Q21jaGJDaHRsSTNH?=
 =?utf-8?B?THlERmhYL1hIdVYyLzBOdVZMNHBsajlFVzFYR0o4eDZhMXo2d3c3OGdzcG1u?=
 =?utf-8?B?UFl1bmJDL01QaTVNdDQwUU5XSkhnK1MzaHBnZ1RZN3lneUlHSzg2UE1uRU0v?=
 =?utf-8?B?L212b1FaSDJzbTNLUFdPd25tOFZHYUcvcVNSdGluVkZ5U1pwdEw5UXJoR05K?=
 =?utf-8?B?T3RiZjl4QlVGOFFiS3E4YVBFWlNNYnQxUmNjd1Uxd1NNY0JmcFVPdXlEa2NO?=
 =?utf-8?B?UnFrdkEzQ0poZDlFS0QyVWxHSHBzUzRoZlFTc1ZYVi96b0ZPRldtc21oRVMx?=
 =?utf-8?B?ZHkzb1FpOSs0bFREL2NtWDlWNEhEMUQxa21pUUlkRFBuTzVnanNMaG84K01R?=
 =?utf-8?Q?jIP1D5RW3to15rhxdEqebAndR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec688a41-616b-4368-c164-08ddd91df2a9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:28:00.7539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 011j9EfOS3iDz7yAySIl3xkQdi76jliKZd+7cZvg1EXdHx2hg5Wny52j3pjbpKiZA9ITTuc2Yx5wUU5RDkOO4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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



On 2025-07-25 20:33, Melissa Wen wrote:
> Add Linux opaque object to dc_sink for storing EDID data cross driver,
> drm_edid. Also include the Linux call to free this object, the
> drm_edid_free()
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c | 6 ++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h | 1 +
>  drivers/gpu/drm/amd/display/dc/core/dc_sink.c   | 3 +++
>  drivers/gpu/drm/amd/display/dc/dc.h             | 1 +
>  4 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index b4ccc111fa08..493815829aa5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  #include "dc.h"
>  #include "dc_edid.h"
> +#include <drm/drm_edid.h>
>  
>  bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink)
> @@ -25,3 +26,8 @@ void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>  	memmove(dc_sink->dc_edid.raw_edid, edid, len);
>  	dc_sink->dc_edid.length = len;
>  }
> +
> +void dc_edid_sink_edid_free(struct dc_sink *sink)
> +{
> +	drm_edid_free(sink->drm_edid);
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index f42cd5bbc730..2c76768be459 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -9,5 +9,6 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink);
>  void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>  			     const void *edid, int len);
> +void dc_edid_sink_edid_free(struct dc_sink *sink);
>  
>  #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> index 455fa5dd1420..3774a3245506 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> @@ -26,6 +26,7 @@
>  #include "dm_services.h"
>  #include "dm_helpers.h"
>  #include "core_types.h"
> +#include "dc_edid.h"
>  
>  /*******************************************************************************
>   * Private functions
> @@ -65,6 +66,8 @@ void dc_sink_retain(struct dc_sink *sink)
>  static void dc_sink_free(struct kref *kref)
>  {
>  	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
> +
> +	dc_edid_sink_edid_free(sink);
>  	kfree(sink->dc_container_id);
>  	kfree(sink);
>  }
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 233d73f9f19f..215d3901480a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -2493,6 +2493,7 @@ struct scdc_caps {
>  struct dc_sink {
>  	enum signal_type sink_signal;
>  	struct dc_edid dc_edid; /* raw edid */
> +	const struct drm_edid *drm_edid; /* Linux DRM EDID */

DC is OS agnostic code and shouldn't deal with DRM
structs. amdgpu_dm is the one to deal with that.

Harry

>  	struct dc_edid_caps edid_caps; /* parse display caps */
>  	struct dc_container_id *dc_container_id;
>  	uint32_t dongle_max_pix_clk;

