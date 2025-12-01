Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E011FC97E08
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 15:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625E910E3EF;
	Mon,  1 Dec 2025 14:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rOLnOvwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013021.outbound.protection.outlook.com
 [40.93.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6B10E3DF;
 Mon,  1 Dec 2025 14:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqPaRbOlnIIVjvsD86CCu5G8IXiDQa4mEwFLUt9JfE3a301T8OBW4ucj0fi+J74KrYp3WSASzbar1VDWdUXad5tPZsicZe1ieL2nH6Qhioy+kBwBHB5EeZzam+WO6apO17HfCf1La3iO/cxbMUEs9ntfM6rCOQqWjKM+Yuo33QqMa7mZUBGt6p5XJjYes/dFRv8eBrDKM8d4VGAxBCuE2FbK5iiyHIEf02Or9IYii6d9ryzbDuMqXtkcZDXXss6oYtZ96eUQD6m0rB7RTXA2jRFKa7CDLwtAgELSa42OzLQDW1Eg5rVz+TUN7T3gWGYMYo453mV3iy17ME3ld0m2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CAa/w4oHrnvV4/B863EsY4xvHYPDaf36Jj8V2GVsig=;
 b=UfoJp0MnDz96cPHV7jHdgHnjiqDKyQEYAdygONGPS4aEgK9aGD4SWcEJ79LZZuBIN3ewQmaPAIG9X/hR/HCG0KIvKGv8vKtcWQiyY/oYfFgMCJF/q0yPpsNcGmUW8fcEgUeDgre8ra3Xu08FhVf6DgQLjbjpCdPQss5/gnH2A54kZkJ3fOqFQmr2u4yZd4kpxmyo+QjT0XT/dZ2OiCUMR3JC/uQXUP/OzAhA+TgEV6pgv/8ydaRqAt1iRvGg+GNpEexfvaxiGyf5xq6jhdpAZc0kKaGjlaoA6/wHhVqJv6rr91Uge5J0mqZcEkYDea5K0zV5K08tdD+//fPZ2PJzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CAa/w4oHrnvV4/B863EsY4xvHYPDaf36Jj8V2GVsig=;
 b=rOLnOvwxYhlcs8s6i04CteBXMlXp+kQHW6ZdLBGL2VLFZUg/TGchENv/COgtkxZxcatWt4warptBf9z1aNE5vNs11z6Bow5+WGs8Bj63NmM0FNNuUZtcuksDCt/3BWB44/a54/Tm42AmnHCGSADATskEeoFiUUePIDPAzQW6XK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:39:48 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:39:48 +0000
Message-ID: <a1913f9b-45ee-4e93-8b16-f827ead35f52@amd.com>
Date: Mon, 1 Dec 2025 20:09:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/amdgpu: add helper to read UMA carveout info
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
References: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
 <20251201-vram-carveout-tuning-for-upstream-v4-2-9e151363b5ab@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20251201-vram-carveout-tuning-for-upstream-v4-2-9e151363b5ab@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::15) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7bea36-3900-4238-c64f-08de30e77a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEJTL2ljOWR5eXVSOVg1dnZGb2xmVW5OR2grL0N2dEkyL3B2MDNJT3VqSFZB?=
 =?utf-8?B?MGZmK3dOVUc1NjA0N1B1ZzBQcENRYnlMY25LSEp2elRUUGlRdzI1SzNYUldX?=
 =?utf-8?B?T1dqemtoTTVSTnE5Qmt0UTR2YmNJbVJqM3ZWWG9jTkdBdWhBMUtqTWxLV1Jw?=
 =?utf-8?B?aWI1eVIrOFJJNlc5WGR3cDFiK2ZXSjFhZlNwRzJkRVVOWHhCSDJDZjZlUVpt?=
 =?utf-8?B?ODc3SXp1YVJKblFNd25oZENGdHNKTFZSWlUyb0JSeWpOeTU3dWxmc21hNnp2?=
 =?utf-8?B?VEJKeldOU2czVEVaNGEyM2UxOVBaalhJQVVlT0cxMnBBVG5LRGF6cnN6dktp?=
 =?utf-8?B?MG52eU5VYmU4bEEvaHRoQ3pYNlpTOURkcVpWSVNDKzhsaUZPNFFUUUxNSzJt?=
 =?utf-8?B?RlBYZW5ZeXdJQnEyYmVvS0E3ZzVlRURNVXhyZXVOZElHT0JKRUM1UGJabUpq?=
 =?utf-8?B?b2ZHZXRyK3FNdTZTU1VnUGRkVmxKcnlvOGFRc3V1T1oreEJRL3VxUXhsOFgz?=
 =?utf-8?B?ZUZjRzJuM2VXNWVYM0gzbXlPWDJhQmNUQ0VDenFrUFoxYURXaWl2dkU1TkQ1?=
 =?utf-8?B?aUpXbG1Db1lzWGZiWmZoVWFVK2srWmRuMVdtc3BIZVNXcVBnd283MG1KNGVm?=
 =?utf-8?B?RkllM1lFTzc3V0Q2Q2c2bi9FcW1zYTU4c2xaL3hnM3F1ejR4SUNnZXJHYXVt?=
 =?utf-8?B?NG84Y1IzODBDcHY5ZHMwVGNXaDRuOWtJQ1gvOUJHMFZOQjY0dWJCaTlPeUJW?=
 =?utf-8?B?aW9saldoN04xLzZmK3AyTjRMUWM5TERmbGd0Z1M3Y1BYN1FPVXlyVnZ5QUNu?=
 =?utf-8?B?QVhKZURrYTlDZFNvOWIwNTZrUHBNVnVXbjcwUTJJTVNxZlpzRVB5YUhiMkp1?=
 =?utf-8?B?S04zWGlna1I1Z2NUUFJmelVLYlVjbDlaTU9VZHgyVzF4SS9DMzMrZ3ZXWTRS?=
 =?utf-8?B?aEJMVy9nNktVb1VmTi9TTGtudjZrMjNUK2MzVUFEcDZxSXRtSTVScW5HSnZL?=
 =?utf-8?B?ZnR3K0lLOTkxNGZXbjJuajdTMkZ0LzAzbkpDWk0ybWhROGJmUmhDNVVvZUxK?=
 =?utf-8?B?K1cwRmYrdmpjK3E5dmVIemcvYmtCOUFqdWVOMFRTTHNqZkRDVWprMUhPaDcw?=
 =?utf-8?B?Zys2YnFwN3QxWWpuUGhOSWtaditOVWlRMFJiTDF4SWQ0bDMzTDVzN3pDSi9Y?=
 =?utf-8?B?eXJ6dEhJalhEdDhydDdZMWIwaWZoWitxcmhIcXVLS3N4VjFHekwvMlNRa2hL?=
 =?utf-8?B?K0oxZzlaWFFOWmlwMFh5OFFwTjRLZzFQM0EzWGRyT21oRlhxeWFMaDc0VU9T?=
 =?utf-8?B?WXVCNWxzYXY4MUQvcjArcGVERjBoZDNVTTBBUkhJcmU2MEFTVGpxM0R1MkFV?=
 =?utf-8?B?YkNERmVjR3N2R0NINGFQZTRnYzNVNmVDQ1g3ZWd3amF3U2JCc0V4R1lRWWR0?=
 =?utf-8?B?Q1RITTZnaGRDTFl3R0NOSHE1OXg5S3l0ei9kV0lHSGtEWVpSWnM5Y2xvR1Ru?=
 =?utf-8?B?MC9NMGJjbGV1VTE0L242T2t1T1lLWjZ0TEU3cWRSZ1JBOC8vKzMrOU5ZaXla?=
 =?utf-8?B?L2pXdUJLYXRhVXZreTIrckxKWTRrNWJ6b2dnUzM0c2lYejNrM2JMNTNtV1R4?=
 =?utf-8?B?dFR0WDBSS0E0djFwWlNVd0UzMnFZRmdnUHc5Q2VsSWVDby9kZUpXWUNHZkd5?=
 =?utf-8?B?Z041bDc4aUdHS1c3S2pleHFQaGNNeDVoeDM3MnVidjgybEt1bXRlL2JMUThM?=
 =?utf-8?B?ZFR4QUdJSmVsRnh1b0FnSlg5MXpIam4vV0s0NU9LM1JIMjVBRnVIUi9XWVQx?=
 =?utf-8?B?U3ViQzJVaDB6M0FDemYvT1BTaTJvN2tNRWliVnFWRzN3SzNGd1N5WlhOTVRV?=
 =?utf-8?B?WGdaUWt3YS9LcGJXZVdLTjZqdlpKOG4xSjRYczhON2Zjb2pUMGo1V1BpRWZP?=
 =?utf-8?Q?21c6lyDD9iZOdzA1eR2xB4chB0P7bdTr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0daUTdrUWo5MkxqNnpFTnZhSFpZemZVNGIyQTZnZGhsR0xzL25qRE1hWUJq?=
 =?utf-8?B?aEx1VkVPbktjbmdFMW5BdFVoSVhkOFZSdnVPQytJbTlPRDdCTmRZZzdvbTRs?=
 =?utf-8?B?U0kvazRKeklPVVk1aUR6bHEycmFRd2F5SE1yVnFFeEtTZldrQUZLUGlXbHBH?=
 =?utf-8?B?cjRiTmRLL3dFVk9ReHBHdnV4dUVNMW10aWl6bHM0MlFmWlB2SXZLSmQzSWtP?=
 =?utf-8?B?aUpYYXFDZ29ZMGxjSGMzRWxYR3Z1bGxPTU83N2tkTEdNNDBtZmx6anZFS2F2?=
 =?utf-8?B?U2ZsQUh5OEtadUM3ajFqU0F2endUQVZDcEtIcWt6MVV2bW4ycFMwUUpOaUJU?=
 =?utf-8?B?S0N4c2ZLUVI0d010NjdGTGl3SVVSMk9XUlkvNnR0WjBUK2xveXNKcXRXVjYy?=
 =?utf-8?B?NXl4QktSTW9TMVNhd1NBSzFTVmpUTkh4NmwydEpmaXQ5UXpYNHY2YVJUeUJp?=
 =?utf-8?B?SmQ5MWs5TzlEVGZUV0dnZWYyV0lTZ1dBaTNRZGRjWXlzWXhvZXRWN3V3M1RQ?=
 =?utf-8?B?NHdtYUlQNzZreTl4bk44VFFGeWo0YkJFMnJjYVM0dHc5OUVPTUNUcXZYdTM2?=
 =?utf-8?B?cExGbDk4U1pLMFlsL1UxaVZZblFqejhnTTQzbzBOdFZJU0lQK0Mzdm5nbjNY?=
 =?utf-8?B?YVFWU0phbnAxZFV3ZEFUdnlpMlVkNjVCaTBQZmhFK2VTM0pRUkFrVUpxNE0z?=
 =?utf-8?B?RTN6MHlIMERWZ0lMVFVLWlYvYnduN0RDdDlSWklaUHRLNGVidDVDckt6QVJK?=
 =?utf-8?B?MnJVZ2lLUnI5MDFkampCV2tUQmExd3IybjMzV21Jb0xKTUtUWTB6cTQvRTRz?=
 =?utf-8?B?VVUxVFFWR3hiMy9IMXRMYjV4dnB4Kzd5bGh1cms4RXRKZjVQeHZpTmd5Ymp6?=
 =?utf-8?B?djNkUTVFZXJFcVd6U0hFUzZQbmMxNzRZaUQwZmFEVjcxYlFsNmdQdS9EUjlq?=
 =?utf-8?B?MTdaeVhtUlFkN2JGZEtwNWRBNUhhSU5oTTliMHd2N3FLSHpiMC94TmYwdU1O?=
 =?utf-8?B?TlQwbytuTmxPb2pHK3dVYjdYMEkvaHJXTER1Qk1OTXgwTll1NWRyUisvQnJ5?=
 =?utf-8?B?N1dWQ2Fua3BnZnVxVFZQWnpoZitMK0ZaR1RveER6eUZCV0lLS21iN1JYeHN1?=
 =?utf-8?B?NWVhaEZpRytxazRWRVo0M0tkSENvMHVzdFFKVzNYa2E0cXYzZHVnNlRON0d5?=
 =?utf-8?B?U3A4NzZHS1VjRTBFZmtCV252UnZ0dXhDclJKMHVrbUk4MzNvMG1qOU1GRis3?=
 =?utf-8?B?NDYydmlnUmpSQzRLbEZNL1JtVSt1S2RtYUd5MElidzI3b2k5RHdVZ3J1c3lZ?=
 =?utf-8?B?SlhxK0phSmhrcXpaU3pDNElYTEw5UC90M0RtbGRRMVJoZHNGcmpQQi90QXdK?=
 =?utf-8?B?Y0YyTlR6V3Q2UjNhUGtWc1NFMXhtNDZwZFhRM2o2WTRWRjczeExuQXlwNWpU?=
 =?utf-8?B?ZUhVcHQrSzNDMzBxamQ5cVlPUmsxN25WREQvanMwMzZFZG11UTk5MjVuclJa?=
 =?utf-8?B?UEdRTjlFZCt6MUxHYTJ3WTA5dzVnTk1EK0NQT2NqYWFtQkNnNFhGbHhOSFpU?=
 =?utf-8?B?b3ZZV1FOdWZXOTdJL3NuMEMyTVNGdmc4U0pBRmgzOUFrSG1wNlFMekhXTVQx?=
 =?utf-8?B?bEp6ZWxsZTV1N3dZQk9RTElSV1k3MTBkcGdvS24rWkFPbDVTUzYwYWsyMENa?=
 =?utf-8?B?Vm1VTnhUbDBCRkU3VUorLzhONlNKVEM3dWtSdFZaMm5CZ2FwYWVNaXh0eGRZ?=
 =?utf-8?B?RlhJOHRrOHJtNm5pd3dDRHZtc2FOVzJRbWIwbDQrSjJkNzl0RUFJRmhSaFRZ?=
 =?utf-8?B?aEg2SkM0N24vV3RaUy9VWllMZGYxeEVhY21GWHhMTU4zWVhJT1o1ZmpWdERi?=
 =?utf-8?B?OS9tTHdRVUp3aFJBbFZ5aEpvVHNtQW5PNG4yZDg3S3puVU9SQlFVMEc0Z1Q4?=
 =?utf-8?B?YUtUcXBnQWkvaTZRU2daUnBmbk8zWDJ1ekxvc29JVGptT3R3M1o0Vm9pRmxa?=
 =?utf-8?B?OWxNTzB6aDZPWEMrVVl4RE9JanFhTXRMMFY2bXhSaUlUUlRVVDB5NnZyb2VV?=
 =?utf-8?B?c2YwV2t6VEdWMFFudnNLK3BMVGRZZmJWZjJyek5tY0lCRDNNd05TTGpvUzI5?=
 =?utf-8?Q?JgSKGXojzcs0ahZV9yL6VL6R4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7bea36-3900-4238-c64f-08de30e77a27
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:39:48.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJMIr6Kgi7jEWVV9GbL8NvQvCS95l759DMx6a7IeNE3DXforeviERY/9e/KKqDxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932
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



On 12/1/2025 4:38 PM, Yo-Jung Leo Lin (AMD) wrote:
> Currently, the available UMA allocation configs in the integrated system
> information table have not been parsed. Add a helper function to retrieve
> and store these configs.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 32 ++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 77 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
>   4 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f9774f58ce1..ca9c2b54045b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1675,6 +1675,38 @@ struct amdgpu_numa_info {
>   	int nid;
>   };
>   
> +#define MAX_UMA_OPTION_NAME	28
> +#define MAX_UMA_OPTION_ENTRIES	19
> +
> +#define AMDGPU_UMA_FLAG_AUTO	BIT(1)
> +#define AMDGPU_UMA_FLAG_CUSTOM	BIT(0)
> +
> +/**
> + * struct amdgpu_uma_carveout_option - single UMA carveout option
> + * @name: Name of the carveout option
> + * @memory_carved_mb: Amount of memory carved in MB
> + * @flags: ATCS flags supported by this option
> + */
> +struct amdgpu_uma_carveout_option {
> +	char name[MAX_UMA_OPTION_NAME];
> +	uint32_t memory_carved_mb;
> +	uint8_t flags;
> +};
> +
> +/**
> + * struct amdgpu_uma_carveout_info - table of available UMA carveout options
> + * @num_entries: Number of available options
> + * @uma_option_index: The index of the option currently applied
> + * @update_lock: Lock to serialize changes to the option
> + * @entries: The array of carveout options
> + */
> +struct amdgpu_uma_carveout_info {
> +	uint8_t num_entries;
> +	uint8_t uma_option_index;
> +	struct mutex update_lock;
> +	struct amdgpu_uma_carveout_option entries[MAX_UMA_OPTION_ENTRIES];
> +};
> +
>   /* ATCS Device/Driver State */
>   #define AMDGPU_ATCS_PSC_DEV_STATE_D0		0
>   #define AMDGPU_ATCS_PSC_DEV_STATE_D3_HOT	3
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 610449d73a6c..92070738bd42 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -38,6 +38,7 @@
>   #include "amdgpu_display.h"
>   #include "amd_acpi.h"
>   #include "atom.h"
> +#include "amdgpu_atomfirmware.h"
>   
>   /* Declare GUID for AMD _DSM method for XCCs */
>   static const guid_t amd_xcc_dsm_guid = GUID_INIT(0x8267f5d5, 0xa556, 0x44f2,
> @@ -125,6 +126,7 @@ struct amdgpu_atcs {
>   	acpi_handle handle;
>   
>   	struct amdgpu_atcs_functions functions;
> +	struct amdgpu_uma_carveout_info uma_info;

Since carveout_info definition is part of amdgpu.h, I think moving this 
to amdgpu_device is better and then keeping the uma/sysfs options 
initialization (patch 4) in amdgpu_device.c. amdgpu_acpi doesn't really 
need to have atomfirmware included.

Thanks,
Lijo

>   };
>   
>   static struct amdgpu_acpi_priv {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> index 636385c80f64..7f4751e5caaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> @@ -296,6 +296,83 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
>   	return vram_type;
>   }
>   
> +static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_device *adev,
> +							  union igp_info *igp_info,
> +							  struct amdgpu_uma_carveout_info *uma_info)
> +{
> +	struct uma_carveout_option *opts;
> +	uint8_t nr_uma_options;
> +	int i;
> +
> +	nr_uma_options = igp_info->v23.UMACarveoutIndexMax;
> +
> +	if (!nr_uma_options)
> +		return -ENODEV;
> +
> +	if (nr_uma_options > MAX_UMA_OPTION_ENTRIES) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Number of UMA options exceeds max table size. Options will not be parsed");
> +		return -EINVAL;
> +	}
> +
> +	uma_info->num_entries = nr_uma_options;
> +	uma_info->uma_option_index = igp_info->v23.UMACarveoutIndex;
> +
> +	opts = igp_info->v23.UMASizeControlOption;
> +
> +	for (i = 0; i < nr_uma_options; i++) {
> +		if (!opts[i].memoryCarvedGb)
> +			uma_info->entries[i].memory_carved_mb = 512;
> +		else
> +			uma_info->entries[i].memory_carved_mb = (uint32_t)opts[i].memoryCarvedGb << 10;
> +
> +		uma_info->entries[i].flags = opts[i].uma_carveout_option_flags.all8;
> +		strscpy(uma_info->entries[i].name, opts[i].optionName, MAX_UMA_OPTION_NAME);
> +	}
> +
> +	return 0;
> +}
> +
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
> +					      struct amdgpu_uma_carveout_info *uma_info)
> +{
> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> +	union igp_info *igp_info;
> +	u16 data_offset, size;
> +	u8 frev, crev;
> +	int index;
> +
> +	if (!(adev->flags & AMD_IS_APU))
> +		return -ENODEV;
> +
> +	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
> +					    integratedsysteminfo);
> +
> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
> +					  index, &size,
> +					  &frev, &crev, &data_offset)) {
> +		return -EINVAL;
> +	}
> +
> +	igp_info = (union igp_info *)
> +			(mode_info->atom_context->bios + data_offset);
> +
> +	switch (frev) {
> +	case 2:
> +		switch (crev) {
> +		case 3:
> +			return amdgpu_atomfirmware_get_uma_carveout_info_v2_3(adev, igp_info, uma_info);
> +		break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return -ENODEV;
> +}
> +
>   int
>   amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>   				  int *vram_width, int *vram_type,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> index 649b5530d8ae..67c8d105729b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> @@ -32,6 +32,8 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgpu_device *adev);
>   int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
>   int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>   	int *vram_width, int *vram_type, int *vram_vendor);
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
> +					      struct amdgpu_uma_carveout_info *uma_info);
>   int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
>   int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
>   bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);
> 

