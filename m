Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB85ADF853
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48510E4A2;
	Wed, 18 Jun 2025 21:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vyJIFIdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2496710E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb8tbng+u6yjCg5PhE7EmbQYzyk5HE7lGbBLq07wFx3pU+D6qvYBjLNmLEJTJv0C87pLkA0kJO8Lcsc3slJX7lORJ6zVVPkFMVzBp/GMS3A8PwZgld0bb0WE/tuqh6v4VRqLi10Z7dKVzFtCMMwdGMWnkbtZ2n1fHoWd5Fv/FDJhZrESosVjssNPT5hXBqFwvdhr7hHAXRN8vF2K8ySvpZDoc7SlcHQAqAVCWJQXF82mwVLY9aDA/XTwhCuiiSkzS4+ZWMzNpGAf7TTa7uTJGrBy4RNC0NKnkHgbfMnnO7K0JY7FQTLltLlrvn9wSdAjAZPO3OLtuO+GcfhRZgg1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDkOlwVTrI9LSB+nyx0HCoYjDynogQBET5IGTUclkjQ=;
 b=GMc6JZdeQCrBsf4Za7kOL16pJOUhs8jlVqR7KMHr8vako5216GnAtg5wvnLAgW4ChGKZ6uFqXmwSjfnQbj0FC3OkMENEEHv8XmFSnqu+GcoSCp92oEdEv6c1sD8nNzLSeTwQ4G9maW1E7bOz5ku2Re1X0spZ3Y1iVQmCYCmwUeLHqkDOYL48mrvZRNQD0V4Dq/yUp1x02DNOrIS6g1ukt+iD5nesXeCRlt6imCBvBDH477g/eQXACXeXKwn2xs2QcY2hF6ZO85ibYPS2MSFaRxHuHsJgoqtgiw6yPIPAafHDKp2vikOdja6NY+ByqH66KIFN0tEF08rZevdAasZVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDkOlwVTrI9LSB+nyx0HCoYjDynogQBET5IGTUclkjQ=;
 b=vyJIFIdU0LRlujSVu0hmR+GMmhh+4m7LB32is2B/ollJcumwCPQ3vRJXJeUX3wZRlka+uviEg/ptOe5jpdl7qIj0qnPHZ8aFOkI5pFLbVNlN+7HfZDrZJLqfj9p7+bHt9c1LZUNU0uCu1VRnhvGTA7wfvS/+UUX1/Yb4zQn/KzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 21:05:09 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 21:05:08 +0000
Message-ID: <787e56b9-baa5-41fd-ba37-e0c7af1f3dee@amd.com>
Date: Wed, 18 Jun 2025 17:05:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, David.YatSin@amd.com, Chris.Freehill@amd.com,
 Christian.Koenig@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250617194536.538681-1-David.Francis@amd.com>
 <20250617194536.538681-3-David.Francis@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20250617194536.538681-3-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0309.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: a82c70dd-93ba-474c-a494-08ddaeabce4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDhzZHhrU2ZCZkRJU2RPR1lyM2RKWU0yR1o4R2t4VjdhVitiZjJZZUdhRVpn?=
 =?utf-8?B?VE9DcjhFVis1TFdKeDBFNkhwSWtkZkJQSlZGdXJiWWU1QlZiRTNMTVkxdVRa?=
 =?utf-8?B?bWQ3SUg2YXowRnhpa0MxV3laYTBjVytoUGVaemlVNVZyZjg0aU5SV0gxUlp2?=
 =?utf-8?B?eGZHWWFEMXdia3JUbUw3QmlkOE5NUVV2TWROamxMNXoza3pUbXdSYUhCTnQ5?=
 =?utf-8?B?c2Uzc3FiQ2UzMzFXWm1RUk5rbVlDanV5SUl2WU5RVXd2UFkxRzNNZ0xlSXk3?=
 =?utf-8?B?b3NkckFjM210TjF0ajd4NEVuOElPQWthRXpqbW9BbHpKY2xPQzFFQTRLcFpj?=
 =?utf-8?B?eGpONTVyODRmQ2w0c0N1QjBTTWlURGs3OG41aWpWNzVUUTd1M1lUS3h6L0R3?=
 =?utf-8?B?RHJmMzg5ejZLRG00U3lFc2VORG5UQ25qelN3QnhpelB1SDFxL0oxTmdPeUg3?=
 =?utf-8?B?d2VOeGpCaFJZU2hJeC95TjR6ZVI2OXJRbk51T0pPTjlpWGI5T0d4NXZSTDFG?=
 =?utf-8?B?S0pFQ1BuMFhPZFRXWldyTCtPVTBTRWxVTVZLcW9FUDVpUnUxbXlOdlQyOWtW?=
 =?utf-8?B?MkxnbHN4QVBKcmswVTNFVzJVRUc1RUkyZWNQUUVSeWxhUXhqQ09lMDdzZWda?=
 =?utf-8?B?SEZpYUNwYUgxZDBCMndzU1BFbUNXbE8wSWUzT2NvcDBkaUJ3ZVF0NXNIazhl?=
 =?utf-8?B?dzk2OGZlYU1zeDA3NEM1ME9vWTJVd0tyQmtNeEM1Y1ZMM1FPUWp3S2p3N1Qx?=
 =?utf-8?B?UXZpT0dOdHlVQVBuOFBBS1pyUUJYRWJiVEtVWXQ5TkRtWTFJV0pSbVlWYVgv?=
 =?utf-8?B?M0p5SW90ZlFGNklESkhHa2cwYzJQQmc3TW5nOXBiakNuUzU1N1hrem8zdlYv?=
 =?utf-8?B?NGkwcEl6MTdIWDA4WExnRi8valV1YmhoNVc3dmdoVFNOZUhTZUpRTlZRdEY1?=
 =?utf-8?B?NFJaeGFLMTlnU3dTL3hRN0VFNWpsM1d5U0V0R1FlN2dROTB0SmxrdWdlM0hy?=
 =?utf-8?B?Mk9teExtMWZ5MFZtcTJVNWNxNzFNTDA5Znlkd085Ty9JQ1o1VUdQSVNMRkpX?=
 =?utf-8?B?b1A1cVFDZGxpVndNdlhwSDZWdnRWaHpPTWtFMGZId3BhOW1abW5aSXlld0dn?=
 =?utf-8?B?T01uQkhheDJRWGlmRW1CS1ZSb3JSTy8ybDhNUDZEbTZTS3RreVYrUHFKUGtE?=
 =?utf-8?B?cjhsTVJEZzgyMDVNSkRqRVo2d09FbjJIUUJsdGpoNmlzc0R6RndHL1hTTHRO?=
 =?utf-8?B?enlTNThhYyswRFFpbkFjOTNjdWdkaDVyaGNDTTFac1VUYXB6N3AxTDYvcVVC?=
 =?utf-8?B?cHNMMm41QTV4YUNoUWFWM05wUlQ4ZWhuUm5hYzhHazYvRjlDZTQ5bDVwUU9L?=
 =?utf-8?B?Nit3NzVNSEIvd3ljY3ZWZERhMklUdkZUQWNLV3VSOGEzKzQrSE90WVVWOU9Q?=
 =?utf-8?B?SXVOQW91cXVqQmxldC9VRmUyYmxGU3NJK25lSm0wejRuTythV2JwMjdxdHdW?=
 =?utf-8?B?VTJEdWNZamtYcFpKZkJFUEJQR3dJd1A2bDYyZXROUlp6c2ZaWWhTVnhKR01W?=
 =?utf-8?B?TldyYk95RkhUNlhHTHNQSG9FR1lnanVBNFRGdHpqbGdJSzNKZUp1NWJxWHBE?=
 =?utf-8?B?c0FNWkpkM1dPKzZnSXU5b0F4Yks5NXFFSUpyQUNlT1BHYkpna3IwQ2kzaDRk?=
 =?utf-8?B?VitzckVoblNnUXA5bzVUMjNYbC9uVWNEYUNIYnJ0QzRFNGRqTERySHF1S09o?=
 =?utf-8?B?aVJVNlpLbUI4WlcyU3o5dnN1V1N2ZnFpRXhSVHFrbkcwTlRZS2xnaG56Tys0?=
 =?utf-8?B?TEdHQUovVVM4b0RFZDh4Tis0Rkd6dXpQZHlhZ0FRcGhBUEJyNkM4QzlKT1Rt?=
 =?utf-8?B?L0pSM0lqNG1JSWdmVHpXZDVXVE9QdVU4QkdHVnE5cUFvTjFHS3RobjJRZVl3?=
 =?utf-8?Q?dLDHE3LVnK8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TitmRTJiSDYzZituSS9vU3dFYVhxT3JPb1BWdjFhajViaEtLN1Y3eE5ReFVX?=
 =?utf-8?B?alRnTnIzRGZSeWZ2eHZjMUVEVHJEbmZkQUlsejlnSGZtTUpWcmhlN3BKaWFO?=
 =?utf-8?B?azZCWnh4d0czaUdXUWtOU1lScDZjbThNQVcvclYyeVRjQ2ozaEhVVDQ3Tk5E?=
 =?utf-8?B?azJsL3MxVFJxZzZZS2VSMERHS0I3VzA4eHl3N0pPeXR4V2R3NnRsUDdGUWRi?=
 =?utf-8?B?bFJuam5qYVNCRHhWaERQdEJBUm8yR1ZmcWppc2VsTkhIZHdVZnQ2NCt3UTFS?=
 =?utf-8?B?TXlYNWdjTkpvdjVKbGhRY0Q3bVdqOFVOcWtLeTdWck5QSE42VkVxc1VoTnRi?=
 =?utf-8?B?NExJKzBTUkNyQkh3TC95L2g5Yk85K1Mvek5WUXdFNkdEYTRzTU5XWlphR3Ri?=
 =?utf-8?B?eWltOGcyNHorVEYrNi84dFVtV3c4OFVkTUN0VHIwQWRaVzZuUlNhL2lIWWJu?=
 =?utf-8?B?REttNzBkeXFValBIQkhjZ2ZIUmdIYzgvQnY2ZlhBRmZzaE1UK3JxREgrMW9G?=
 =?utf-8?B?RS9hR3hrR1Myc2UzblB5c0JNcnhRek9RcDQzZW9GL0VDTEtZTUx2b0Vmd2p1?=
 =?utf-8?B?K2JSRzRLQld3OUhJUFFqTllTbzBwN0Z3SzFWdmZqZzZyRkNVZ0ZwMVV6c01M?=
 =?utf-8?B?VTRJbUxXU3pGa0xiNWFZQ3daZ3JrR1ZUcXZwend4QTdxN0lLNXB4YnQ2c0JV?=
 =?utf-8?B?VElVd0N1ZFhyWEkxZHc3RnFUUG9BV01XRzIrdkUzdGsvR1dQcTJMNnlLTytj?=
 =?utf-8?B?SjNSdU1TV0pGK0pRcGlxc28wRjRsV0UrQ1dCT0NwZnZCODRJUzJOdnJhc2hr?=
 =?utf-8?B?SGlNb0Q5clJDUVd6SmhJUnYyc0hLWGMyREhCcWZ5OUIvRHo4enJBWFcyeHZ2?=
 =?utf-8?B?VExuaGVyelhIVDZWaDZ5RlJCTmFwVCt4MFJIRklKV3pwQkVKdW84TloxbnR0?=
 =?utf-8?B?cXcva0JMSUY4T2FNQWFaalpVdEUyNWZTaWpzVnZkZHU2cXowZ3duN21oeVNo?=
 =?utf-8?B?b09SUFExMXYxZ1I3WVJtUmZzWjdpazNVQnE1ZHlsWkVHNEhNVHpCMlNtY0lB?=
 =?utf-8?B?N2NXSW1nZTRITGdFZHM5SXJGQUxhNWxaTDdPK1RZdWppL0szUGFvWWpkNUx4?=
 =?utf-8?B?dVR5aDAyN0dQWnM5VmJObGh1RDlyMEtWUVp4Y2VKMis4Q0xWUnJqUmk2RFRB?=
 =?utf-8?B?Y3RHSmp5MHVRZ05BWHp3eFJ3L0FUNy96ZEdyaW9WU3RJOVhQYXhTb3g4N1Aw?=
 =?utf-8?B?THBxVDVBL0hjRTRIb2E4WDRVOFRScjhkVlNRNHQ0ZlN3akhadmp2UERQd0xU?=
 =?utf-8?B?L0drbW5OcjJRQnE5QkY2Z2MrTDZCTWNxek4vV3NIRytLWjRWWWtvd2xYTGRP?=
 =?utf-8?B?ZG1iRXVVanFQSXM0T3hEai82MWVhclVMK1E4VlhTcktZTHFxNFFLeGtPSWta?=
 =?utf-8?B?MW1nQzBxZGs1NWt5UnYxSThsQ1BEeDFmOGNOdzRma2dtblYzbGpLU0c5QnRq?=
 =?utf-8?B?aTV2RzBIelZQeDZxNWRjWk80Mm9mR1FLV3I2MUQ2N0E5WElqUjcrZHY5RndO?=
 =?utf-8?B?emhFNEg5ZkVvUkNualAydGZGMDVJKzR6blNzV09BOVB0Vk4raXQ2TjZTZi9W?=
 =?utf-8?B?VWlUN2o0YzhjakJqT2tsQ3VDaGVDS21Kaks1dFZieFl1R01WU0w5VGNyVmFn?=
 =?utf-8?B?UGtycHdZa3llVS9ib3lJZnAyRVJlc0wwazNmRllJdDg3WW9VNmJ0NVZSUkZT?=
 =?utf-8?B?WHg4ODNRcmxMSFFRbFVWN09aMEJxZ3MvS1ltN0Raa1B0MVdITGZMWTZ3cCtQ?=
 =?utf-8?B?dFV6RjVQZGdyMHRFMWIxR0EwdVNRNkJOaEZCaG9KcDVZNTUxei9aejFPRnJ2?=
 =?utf-8?B?dHhtWG9JZnhhU1RKTzQwQ1AyU212cjFESktVYVdqZEs2TFNpY1NnV21UdVpa?=
 =?utf-8?B?YmtXUXlWR3Z5cTliQm1aQnpMN3NlSnh6SmJrenQrLzBsb3ZQbTYrVE1vZ1or?=
 =?utf-8?B?SXI4aHM5UXJKQWU5Ui9OTkZDQzF6OVVxNURURThsamdXdXZGR0F2MW1DTVFN?=
 =?utf-8?B?QWdwdUFLbE1kWDBKWWVERlhaKzdYcjBJUTRVNmRBdWRDQUVRSVVWZ01WNTd6?=
 =?utf-8?Q?6tlBKn7zFXHRGe0C0+z4i2oxj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82c70dd-93ba-474c-a494-08ddaeabce4e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 21:05:08.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WRe48YBsEOor4+7d1mK2L55oliz2Nfq3cJJPuWAYNJL4wsVkxpuHdpxgI9RderQvFg/0EnV12CYPBDBAZuIgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695
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


On 2025-06-17 15:45, David Francis wrote:
> Add new ioctl DRM_IOCTL_AMDGPU_CRIU_BO_INFO.
>
> This ioctl returns a list of bos with their handles, sizes,
> and flags and domains.
>
> This ioctl is meant to be used during CRIU checkpoint and
> provide information needed to reconstruct the bos
> in CRIU restore.
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 144 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  32 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
>  include/uapi/drm/amdgpu_drm.h            |  28 +++++
>  6 files changed, 209 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 87080c06e5fc..0863edcdd03f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -63,7 +63,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>  	amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
>  	amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
>  	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
> -	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> +	amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
>  	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>  	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \
>  	amdgpu_cper.o amdgpu_userq_fence.o amdgpu_eviction_fence.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> new file mode 100644
> index 000000000000..34a0358946b6
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining a
> +* copy of this software and associated documentation files (the "Software"),
> +* to deal in the Software without restriction, including without limitation
> +* the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be included in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#include <linux/dma-buf.h>
> +#include <linux/hashtable.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +
> +#include "amdgpu_criu.h"
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem_ttm_helper.h>
> +#include <drm/ttm/ttm_tt.h>
> +#include <linux/interval_tree_generic.h>
> +
> +#include "amdgpu.h"
> +#include "amdgpu_display.h"
> +#include "amdgpu_dma_buf.h"
> +#include "amdgpu_hmm.h"
> +#include "amdgpu_xgmi.h"

That's a lot of header files. Do you really need them all?


> +
> +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *adev, uint64_t pte_flags)

This function is never called.


> +{
> +	uint32_t gem_flags = 0;
> +
> +	//This function will be replaced by the mapping flags rework
> +
> +	if (pte_flags & AMDGPU_PTE_EXECUTABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
> +	if (pte_flags & AMDGPU_PTE_READABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_READABLE;
> +	if (pte_flags & AMDGPU_PTE_WRITEABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_WRITEABLE;
> +	if (pte_flags & AMDGPU_PTE_PRT_FLAG(adev))
> +		gem_flags |= AMDGPU_VM_PAGE_PRT;
> +	if (pte_flags & AMDGPU_PTE_NOALLOC)
> +		gem_flags |= AMDGPU_VM_PAGE_NOALLOC;
> +
> +	return gem_flags;
> +}
> +
> +
> +/**
> + * amdgpu_criu_bo_info_ioctl - get information about a process' buffer objects
> + *
> + * @dev: drm device pointer
> + * @data: drm_amdgpu_criu_bo_info_args
> + * @filp: drm file pointer
> + *
> + * num_bos is set as an input to the size of the bo_buckets array.
> + * num_bos is sent back as output as the number of bos in the process.
> + * If that number is larger than the size of the array, the ioctl must
> + * be retried.
> + *
> + * Returns:
> + * 0 for success, -errno for errors.
> + */
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp)
> +{
> +	struct drm_amdgpu_criu_bo_info_args *args = data;
> +	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> +	struct drm_gem_object *gobj;
> +	int id, ret = 0;
> +	int bo_index = 0;
> +	int num_bos = 0;
> +
> +	spin_lock(&filp->table_lock);
> +	idr_for_each_entry(&filp->object_idr, gobj, id)
> +		num_bos += 1;
> +	spin_unlock(&filp->table_lock);
> +
> +	if (args->num_bos < num_bos) {
> +		args->num_bos = num_bos;
> +		goto exit;

Since this path doesn't require any cleanup, you could just return. But maybe this should return an error code to let user mode know that it should retry with a bigger bucket allocation. -ENOSPC?


> +	}
> +	args->num_bos = num_bos;
> +	if (num_bos == 0) {
> +		goto exit;

Just return. 0 (success) seems fine here.


> +	}
> +
> +	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> +	if (!bo_buckets) {
> +		ret = -ENOMEM;
> +		goto free_buckets;

Just return -ENOMEM.


> +	}
> +
> +	spin_lock(&filp->table_lock);
> +	idr_for_each_entry(&filp->object_idr, gobj, id) {
> +		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
> +		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> +
> +		bo_bucket = &bo_buckets[bo_index];
> +
> +		bo_bucket->size = amdgpu_bo_size(bo);
> +		bo_bucket->alloc_flags = bo->flags & (~AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);

I'm not sure why you're removing this flag. I think we always set it implicitly when creating a new BO (and presumably during restore), but there should be no harm in leaving this flag set anyway.


> +		bo_bucket->preferred_domains = bo->preferred_domains;
> +		bo_bucket->gem_handle = id;
> +
> +		if (bo->tbo.base.import_attach)
> +			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;
> +
> +		bo_index += 1;
> +	}
> +	spin_unlock(&filp->table_lock);
> +
> +	ret = copy_to_user((void __user *)args->bo_buckets, bo_buckets, num_bos * sizeof(*bo_buckets));
> +	if (ret) {
> +		pr_debug("Failed to copy BO information to user\n");
> +		ret = -EFAULT;
> +	}
> +
> +free_buckets:
> +	kvfree(bo_buckets);
> +exit:
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> new file mode 100644
> index 000000000000..1b18ffee6587
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining a
> +* copy of this software and associated documentation files (the "Software"),
> +* to deal in the Software without restriction, including without limitation
> +* the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be included in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#ifndef __AMDGPU_CRIU_H__
> +#define __AMDGPU_CRIU_H__
> +
> +#include <drm/amdgpu_drm.h>

Why is this needed here? You're not using any uapi definitions below.


> +
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp);
> +
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4db92e0a60da..bf33567bb166 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -53,6 +53,7 @@
>  #include "amdgpu_xgmi.h"
>  #include "amdgpu_userq.h"
>  #include "amdgpu_userq_fence.h"
> +#include "amdgpu_criu.h"
>  #include "../amdxcp/amdgpu_xcp_drv.h"
>  
>  /*
> @@ -3021,6 +3022,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  };
>  
>  static const struct drm_driver amdgpu_kms_driver = {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index a2149afa5803..a8cf2d4580cc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -45,6 +45,8 @@
>  #include "amdgpu_dma_buf.h"
>  #include "kfd_debug.h"
>  
> +#include "amdgpu_criu.h"
> +

Why is this header file needed here? None of the new ioctls will be implemented in kfd_chardev.c.

Regards,
  Felix


>  static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>  static int kfd_open(struct inode *, struct file *);
>  static int kfd_release(struct inode *, struct file *);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 45c4fa13499c..1508c55ff92a 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -57,6 +57,7 @@ extern "C" {
>  #define DRM_AMDGPU_USERQ		0x16
>  #define DRM_AMDGPU_USERQ_SIGNAL		0x17
>  #define DRM_AMDGPU_USERQ_WAIT		0x18
> +#define DRM_AMDGPU_CRIU_BO_INFO	0x19
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -77,6 +78,7 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>  #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>  #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
> +#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
>  
>  /**
>   * DOC: memory domains
> @@ -1626,6 +1628,32 @@ struct drm_color_ctm_3x4 {
>  	__u64 matrix[12];
>  };
>  
> +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT	(1 << 0)
> +
> +struct drm_amdgpu_criu_bo_info_args {
> +    /* IN: Size of bo_buckets buffer. OUT: Number of bos in process (if larger than size of buffer, must retry) */
> +    __u32   num_bos;
> +
> +    /* User pointer to array of drm_amdgpu_criu_bo_bucket */
> +    __u64   bo_buckets;
> +};
> +
> +struct drm_amdgpu_criu_bo_bucket {
> +    /* Size of bo */
> +    __u64 size;
> +
> +    /* GEM_CREATE flags for re-creation of buffer */
> +    __u64 alloc_flags;
> +
> +    /* Pending how to handle this; provides information needed to remake the buffer on restore */
> +    __u32 preferred_domains;
> +
> +    /* Currently just one flag: IS_IMPORT */
> +    __u32 flags;
> +
> +    __u32 gem_handle;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
