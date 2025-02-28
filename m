Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FFA49E12
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6310E058;
	Fri, 28 Feb 2025 15:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KLy/mwoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5416910E058;
 Fri, 28 Feb 2025 15:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9JaiDGdEvLGBncW8h4xJRXW3RK2SnAbiMWoxnxOjW9Pcsi5kPN7G0bizDOM/MZRpgj9xUT+n3mhgWm9c7wq56HEWei86rMDQdKRwVoEvWp/ht5ylqAxIGsETy4TOjWSjVlHmgsHUFqvGDeX8PtkGyshMHM8NOZY3jh4ULDkmpUCpsf9EdzZgPAvA5pg74nPrybuFqxXYcS/WcMHvv+AJRjieZvu7+JOmIqT/owBx4ZUxmK9by+ILShN0lXRKz558GpGvc1Q0cLoMJ7Wq5hcG9173d6jGE/h4dY7D5EQP6cy56Yv3SfrlS3eNwmY/gdvc0xsBdYYvnY7Y4iM9i1UPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlnt85PpRBxhIRX6HVvCSQMLP2FPHEdCpZciiQa1QPY=;
 b=SqcDRe4H5fO8wcMKTU1onFKak0EGt9aETReIUD3vR0+wIPb0SzFxGXY593lPgWTpuSLVAID16Wd3679Sb2TvJaXZFgyaUxb95PKVaXgcYbK4+lOUnflIuunlxrc6V1SMdaaJo1568Rd3Ft/5HrGudCVOt0I2r/1E7MloAFdn6Zt5fXI+alRd2ZI4fbXAbPB95RZ5shr6869N1dgRdV2CFSEAKWQUH88XuJbL3ZJy6LVcF2R+mW2MF4wQm5IFDdQ1+Lez0r8aDYEQagNPiiFOYjfmRxeHu6zHcig2qQxSdXSOaB37wlPHkNYzZqZyI5bnRQthKBtkn9YUl4JkAZXhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlnt85PpRBxhIRX6HVvCSQMLP2FPHEdCpZciiQa1QPY=;
 b=KLy/mwoVwRbObBhsatWOZtCGCPdcs2DQf7OENuF3ggv3DEBV/lnAsz6qxXRPoBQnjl3reCjkIMyxebhvHWi3YSwGR6s38hLV/ONAlpGKd3XBC8RFHakoQk+rzfv7lLGoBss1XlTgDQT4ecvxikKzTFHO5m5eo4R48/xmridNgV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4056.namprd12.prod.outlook.com (2603:10b6:610:a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 15:55:44 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8466.020; Fri, 28 Feb 2025
 15:55:44 +0000
Message-ID: <6d2fe1c8-db75-4ecd-aa5a-52eb428569d5@amd.com>
Date: Fri, 28 Feb 2025 10:55:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 05/45] drm/colorop: Introduce new drm_colorop mode object
To: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-6-alex.hung@amd.com>
 <88e05040-b3c8-40b2-a703-74ccf65d8df0@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <88e05040-b3c8-40b2-a703-74ccf65d8df0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH2PR12MB4056:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbb6180-9705-4dfd-1afa-08dd58105bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am94MTVEcHpXM3FNWUdZaWtzN1hiY05ITDl6cEo5eDcrSm9wNkJibUZ1M0k5?=
 =?utf-8?B?N1R6Zm1GSVloZWl3RkdhU1h6TGtvTE16K2NaQ04rVzA1VC9WQU9VVVVESFRZ?=
 =?utf-8?B?ci9CeGkyOEdFRkZpc2dGWk8rT0x1ZW1VMEJyT3h1N2hHRWJnWU16OHBpcVhJ?=
 =?utf-8?B?dHBtNUpxTlc5V0lpSVl5UGtPY0FQQ3dXN05SUHdsVi9hU3BpbGFoVVJLT2Nk?=
 =?utf-8?B?TkNCU3RkelA5cW84bmJIbEc3R3B5MWlGMmJPaG5iUGljblhSbjNXQXhsWmRH?=
 =?utf-8?B?aWZ6U0tJM0lyckthUWV0aU83bm0rMEdEUFY2cFUrWjhRWWQzcklMWmZOL2Ur?=
 =?utf-8?B?VFI0cy8xTndDR29raVBidW5kVjBrbEJ6Z1M1TjZnOFNscnE3NGU5bVBUSjNp?=
 =?utf-8?B?TjV2UnJtUUJnWkNFWGdXKzZnNFJKdEtabnZjQThiTzNWMGxXdXUySmdvbTdR?=
 =?utf-8?B?UGNGR1lSRDFDY3RLY1dyYm5WQzMyeXZQOHhjREtGaTFSUGVrejFyeFQxQ0hK?=
 =?utf-8?B?d0tsVlpyZHdYR1dtSUJKM1k5cXJqcldCemlzb0lFTWNKOFl0Yisvajd3Tlgx?=
 =?utf-8?B?YkxvajU4NE5LbUh0WDRGS0RUY2Y5VkwxdGZFbDRjUXJiN0QxaHVTaExpanNM?=
 =?utf-8?B?Q1RuWUl6RGxiVDFpdytaU1RGM2orQ3F3Q3R4YXVTRDlYdENPQkp0K2psZ2pk?=
 =?utf-8?B?VkdaZ3RIUlJmeFNjTzN1cTcrTlRNeEx1SzJ6d1U4SXpyS1BpNFA2VFRleml4?=
 =?utf-8?B?TXVjbDd4RkkxTmxLWnhBVGw1VkxUekQ3UkNOcTFTai9BRkE5MnhEWnhSWnJJ?=
 =?utf-8?B?U083V0I3OGhNakRjOEZDSFRIUEk2dW1Pd3pVdmsrMHlDelNnK0dUaktsaGhp?=
 =?utf-8?B?VVQ1Zk42U242aDVZaVJ2aFdqYUJxbnNoQ2I5ZWZDd2ViK2pFdm85TXN6K05C?=
 =?utf-8?B?S0RKYnZXZEZLU21DdlUrRDNSSEp6M2F6Vk9ONHVFRDJIWHI5bVVHRHVTb2hp?=
 =?utf-8?B?d2VvMFV0RlBYbis3Z3JrOW11WkJxSGtQV2Fhclc1VjZNMXNWU1NVTnZ2YkV3?=
 =?utf-8?B?RHJLK2JjcUFxeWlwV093WjZHTkZkQitFNjFxaEZqcGdLOE5CMjlQSVJ0S0Zx?=
 =?utf-8?B?clJwUGxGbjRWamp4ZnNwbTdLQTVUMm9QMUdHSVhFVmVPbGFCdmhWWjd0NE1R?=
 =?utf-8?B?dWJhWklyYTIrQ294aFR6aU5KZE5BK2YzY0VMZmxqL0dtOVNaVE9mTjNSSUht?=
 =?utf-8?B?TUF2M0o3TkEzZTVYbCtxY1NKOUZheE5CS0xUVi9OVnJBd1o5TFJndGRZREhp?=
 =?utf-8?B?MEFzZEwyd1Q2dGZSclBpYmVTb3FGczh6R055T25Fa3p1MDlVMEh6WVRrSVlW?=
 =?utf-8?B?eUIzSXhEOThJM3RVM2VxT0RXMmpJS3lyTG5OdWtNcFgvaTNhK3RXa2pjUjJj?=
 =?utf-8?B?TE50SG9RUE9xcE93bmFkNTVTc0VDcDdxYjhwVVlUUVBqdTRzS2ppb2grYklm?=
 =?utf-8?B?QzFQdDdrb2FwOG9tTzlGOGphZjEyUHpxK3BvY242Vk1tNWdhTnNYUklxYmJl?=
 =?utf-8?B?ekp3SFF4R1p2TEZEOWdyRDJHb2RnUDhiTVdDQjlsc0taa29FNGZYdk43SGFl?=
 =?utf-8?B?aVpOSDduVUMxNGZzUXk0YXdydFJyaE1SQlJUYTRIa3ZXdEVOWUYzbE0rTVlZ?=
 =?utf-8?B?YkR1ZWdqUHl5WWUrR0xXUjNZaTdUbkZOeXo5NkJ4OVd2dlhGeVZXcXh6NEY0?=
 =?utf-8?B?dVRUVCtjdUphNmxZdEJiajdMRFh5MTBNYXA2Q3NGUHBOcXpPdmcyTEFmQ1Zl?=
 =?utf-8?B?b0sxYSs2TmpHb09ZWUw3YlhRcDdLcHQybXVFbmt0ZGxIcnAvcE8vcTh3aGhh?=
 =?utf-8?Q?8+FTHkD+1/GuS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0NsQzhKL2ZXVkZ2YkRPU0doVEdSZUVFT0VrUjhqK1FBMC90aDNSaVNSZm5J?=
 =?utf-8?B?K1k0c2N4SHQrNzFVZ3RrbmFuSjduQTNlUm02cjRtNlBLQ0NVZ0JHWm1SZHg2?=
 =?utf-8?B?SG43ZmlHZU9Fa2svc0twbEFIVEpLdlM1akxoSktDK3pCV2lqSEs0enhNNCs1?=
 =?utf-8?B?V3BjS3ZYUVNiaWZ0WUtQM1UvZTlIc1JIMkxLUTJMcjZKbzkxcTZwY3pZN2R5?=
 =?utf-8?B?eEo3SVFLWHVleVJIUldIaUtrNk81Vk5vOVQyeHhlMzRsNkQvRDlSVWVxeUxl?=
 =?utf-8?B?a0VDVjRuS2tEU1JsRzdvOHZKSzZhNnNPQU9IOGZWUHVLSGpNSVY5Zm02MnNn?=
 =?utf-8?B?M1JJK2R1MFUzZWM5d1lOcmtPN1ZDbUdiVUtOTldVbW5FR0hLSXVvSytiMzV5?=
 =?utf-8?B?RWMrRkNpU05kU00wb1dWWFRPcGFDdUR3cnBCd3UyR3R6NDVCMmdBb0d1d0Z2?=
 =?utf-8?B?RXQ4SlQ1dlNES1ZXY3dteHBCVFphU3o0TE9XTDhNYVEzSGExWGh0ZmRQaVdz?=
 =?utf-8?B?Z21Cb09QSW9zYnNPYXIvNlFXS3dmK1hnbWhDQmNwM2U0SWtPZnRaTXJXWVRz?=
 =?utf-8?B?ZXNmRXQ4T1lJTEU4TzFCTjJoN2Q4WmlVRnhZUTU1WktsTVNLa1lodGhQYVJv?=
 =?utf-8?B?S1M4N1R0TkYrcVQycjRMWUhXMjB3M0ZmZEVwamFic1BkaFNNdTF0b1AzWlVB?=
 =?utf-8?B?RnBwbmFHUjNKZno0dWxLcW4zMUVLb21SdlJOM1V0MitEb0xlU0QwM2NmaFJ3?=
 =?utf-8?B?b3podXpkdTZWbzFXZmFMelpZek1DTkV5Y2xQcVFyM1ovRTNyd1BoU1dLWWpG?=
 =?utf-8?B?SG1CTUwyWVkwbk44cXpsdWUyTVpXRHNkay8zbXE1T2JZS3g2MFN5OWwwcWIy?=
 =?utf-8?B?NFpsTVBMWVF2dnI2S3ROQ3U2MEczNVFwSkpjNmgyVEpoeHZQdkN5MFRlOUV2?=
 =?utf-8?B?Vzl2Y3BXNTZLSEtoTTl2RUlEN29WRW5ubVNQRHZsZzFHbE5ZK3hSNnRIMXZS?=
 =?utf-8?B?YkZhTWNzQ1NjcUxRTjhVRVFPbjdxdkhVNEJBL1hhUGNjLzdtSlh3dFhuRE81?=
 =?utf-8?B?MjBtZloxMVNJVmFvRVZTeXEzdlM1dnVqZlpZTWl0RnA0dkxqK2tVUnUyTGho?=
 =?utf-8?B?cjJMMUFSVmFoQnlvVmM4amlGYWVmV05NenFONFF3T1JkbVhvdjYyR3cwb2Js?=
 =?utf-8?B?SVN2RGV6Zy9Zd3NNM3orbmhFZTRLUTlvd2lOTjdTY2NpK01rZ0ppaGZPNWJw?=
 =?utf-8?B?bjAvaS80eG5Cc2xYVkxEKy9PVDZYZmNtWENaQlF5eUZaTytPRUhZV2JDMEtH?=
 =?utf-8?B?MzFtN1dUeTczWExBRVhQaE1ORUxmS0tzS0VBQ2dUdSs5ajZaVzZvMlZ4NHl6?=
 =?utf-8?B?dCsvR3ZyU3ordHJab1NiMDZTalhRT29RbC9pTGtlemlHODNxNE11dThJdi8v?=
 =?utf-8?B?U2hKdmxZOUZmdnJGVTZHZ1BwMWRLR2Q3V1NvclI1cFA5RnhleXAyZWd2K3NQ?=
 =?utf-8?B?M1UwbDNwWjc2QklSOENHUFo0R2J5MWZCaUVVN0pOOE5wbmtJOFZGdysrb0tC?=
 =?utf-8?B?Y1NiSlN1S3ZEN0YyN2lnSjNzR01ROFUwVUdnYXFPYlpaa2FQWkQ1SkFiOVdJ?=
 =?utf-8?B?ek04NHcySm9oT0w1dW8wZWtXRTA0Qy8zN1hrSXlySmkxRkhlYlZUWVdWeXJw?=
 =?utf-8?B?NW1vWXgzQXNkaFVER1R1MHBiTDlWSnRBcktVU0NSejFRZThXR2poMFFHd0Zk?=
 =?utf-8?B?bnhuYXVHRll3VGllcURUZStIN0R2N0dyTFFJaWpFVzV5M1JlaWQvb09EQTFr?=
 =?utf-8?B?OUJYazZMWE1pQnV2b0VwWXFZNHBUWXRLeGdRcTRReit6ZnAxZXdxSVc4UmFS?=
 =?utf-8?B?eFR1Qmhmb3MwV3FNSEgwV3IzSHFjOU1ZcGFwV0duanRSVElscDlIQU9iTzN6?=
 =?utf-8?B?RUVDM2hYcFV6ckErWXY4NkZuN3VLZDZOcU11NEE4ejR3OFhjak9MbURFcnBX?=
 =?utf-8?B?cmxkRElrM1R3SmNJR2J2OVZlK2tMQlQzSkVPdi90MlFsTnRUd3IrTk43Y2py?=
 =?utf-8?B?cXhEclBycEl1cE4zZ0VnQmdBTWpXM0lQNXMvc1NPKzZzNDdmY0JlQ0hSbUs1?=
 =?utf-8?Q?iA+hIfXpLiQC6KWZpS+0tv+Ia?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbb6180-9705-4dfd-1afa-08dd58105bda
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 15:55:44.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfGvQzVffwPIoCcs+CMOT978hTpgbIP2CzeuQ6+A9oAxB1fQo0496S7wUoj+S0+HDAiFQ491r0uJzM5G+qmA/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056
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



On 2025-02-25 05:05, Louis Chauvet wrote:
> 
> 
> Le 20/12/2024 à 05:33, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> @@ -249,6 +255,20 @@ void drm_atomic_state_default_clear(struct 
>> drm_atomic_state *state)
>>           state->planes[i].new_state = NULL;
>>       }
>> +    for (i = 0; i < config->num_colorop; i++) {
>> +        struct drm_colorop *colorop = state->colorops[i].ptr;
>> +
>> +        if (!colorop)
>> +            continue;
>> +
>> +        drm_colorop_atomic_destroy_state(colorop,
>> +                         state->colorops[i].state);
>> +        state->colorops[i].ptr = NULL;
>> +        state->colorops[i].state = NULL;
> 
> There is no risk of use-after-free between the 
> drm_colorop_atomic_destroy_state and the state->colorops[i].state?
> 

This is using the same pattern as all the other DRM objects in this
function. If this was a problem it would've been a problem before this
change.

I don't claim to fully understand the calling code but this is called
from __drm_atomic_state_free and to backoff when an -EDEADLK occurs.
In the latter case it's followed by drm_modeset_backoff which releases
locks in drm_modeset_drop_locks. This seems to indicate that callers
hold the respective locks to protect the state.

Harry
