Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BB2B422BD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E671010E89D;
	Wed,  3 Sep 2025 13:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KyP9oIrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DB710E89D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 13:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4C1+jDyQerr3nlyBy8VYI5DZzgLqK7a7vRpgMVke6CthP4ZHE9GcQzk1n7xRdnAwIVmYkOpPPDybibeBRXGufJ7wM2+Y1pwjlGe1kiL88KsD2HaPsSqbHBhomQ6wWtt3aey4y/vX3kwQxhS4rplYsAANGVsM5PL717a7oxOUxgAN+67qaHcLBHQ4VMYbDv09H8X69EuS2GHe90nacW3sRhkn3I7V3JXFp1L4ndFZ7WvZchx5VUE9kXZvL5qVMzYLOJ5admJiKggbPC+BTjXUHkF1Ne5mxTPam7Mk4PCAEOpY5O8WqTHhxkmjCNtY6XqaH4JwIuDzuh5fXJ4vDcY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea4ira5mrHl2k8pon7RSD6hM6MqlpCRHxWWUlHJwi7E=;
 b=U6gZR8KrOY3NckhoaygW7FOTseFWSvzP8LpS468Du+1sV+oWFjgNaRXRdAFF0wA391f8linN00lZ/BwX7voqomaangtiIf5PrdjZMuGXL+dclgbLGmjKiqB+gPBmdTonwsws1C8S2X5qmNxZPZq7hR+sRRZEtNd3wV7Vq5Sc3sDEguJDA2OV7cCP2vtuiCL7KknDKA5wEqlKJEHTmOegL7tWf5iTrLWnX3CfeU9z0X3LsbKKT1S0/fMTbD9PUVwywEetxVrKcsC8EewlynJllV73MRDb3zFAyBRDwbA5l9O83hj9y+6uWuP/etr4IV6Yn0wcHRKHpToRBLOAxcNRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea4ira5mrHl2k8pon7RSD6hM6MqlpCRHxWWUlHJwi7E=;
 b=KyP9oIrjLUKXsu4pIOno6EYBiWuK40g2lSW/Sy3HozFcVvKVcFfQ3cKCGpeczyzlGgV9bXbK5xeDdOypXWJgZHJyMuTiM0euqFbwu7MsCW7XwfA6NwalLJSKxa7U0cTDHBZe66jDxFQpac5GxMW29w5MVowFMzOM4RUZquYtLAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 13:59:09 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 13:59:07 +0000
Message-ID: <db9502ea-18cb-4907-b901-0118c898bd04@amd.com>
Date: Wed, 3 Sep 2025 15:59:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-2-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-2-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0034.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::9) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 73652973-44ca-499e-8ddd-08ddeaf20c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d05oVUpCSVNXSmlETUE0T2w5dC94N2lsM1VGQ2UxUTVrRG5FVGFPVHltcnlv?=
 =?utf-8?B?eSsyd0tPSmtKbWRpbzNNckVwQ2Zsbzl4YVp5REREZ3NxZnZyRmpINXQ4dUhX?=
 =?utf-8?B?Q2ROUnA3N3NFb2wwYUVXZzl5b1VaL1RTUHFyVk1OMnRUVHFzSWZRV0lLZVdD?=
 =?utf-8?B?dzJGWEQ2cG43amNGalowNCtkZ3ZoL3BBL1JudjRxN3NVMUFueXlFZ3BjanJJ?=
 =?utf-8?B?Z1pCUnhzVll5bXpJMjNadVgvbHdBNm9qaDFzSW91OXVFUzZReHU0Z21JKy9M?=
 =?utf-8?B?Q0VtVUNJZENVQS9KSFNGa3pPVjRUUld4OXlJM01HQ01QaUtzSTJ6bGZkR01N?=
 =?utf-8?B?byt1ME5WT012a0tmQkhla1YxVW1XZVc3ZGpucE1lZTNzNzFrNjJzcXgrZXU5?=
 =?utf-8?B?WTB2cVVneXMvK3I1Qm4xWDlUTGxHdE12eUo0NjNQK2xWdHNJSVUySElKcGcy?=
 =?utf-8?B?azhCblM1ZVo2aVdxWCtubytMU2k4elFJL0VsWnVjNWxlUzlSdnNRN2VVOUdC?=
 =?utf-8?B?dEVtczFybjVkbThCWU1MNFg4UU84bVA0UExBbVBaYm9nL3ZQVXR4WWczSzVC?=
 =?utf-8?B?UDNXNkkySGlDckxMUWFZOHZPM056Qk9QcVMvTWJYbFZXeC94WDZINjlyTHls?=
 =?utf-8?B?Nis5cHErVlZzR2ZEbFNjdW9udzZRNFlLN2k0VzRadUpyb3BRTW9zTmdiVW1z?=
 =?utf-8?B?aDg0aXJPbTZ1Z2l2eDJZc2VPMllxRWlGQUluVzRBNlp4ZEhlVExySVkraGhS?=
 =?utf-8?B?clBVSHR0aEtJS2VjQjhTc1dxdWFpZ1JHREl2dHMyWE80M0d6RjdOK20vUEJ0?=
 =?utf-8?B?d05DRzNqNlRPVEM2c3ZiL3ZWQmNPa3A3clpWcjdPQTJFaHdaT2pwQ280aXc5?=
 =?utf-8?B?d044MndBR3U5S3pyYzNEeXVyVGJvd0QrNXhEWkMvZVpxY3cvanUvS050cmhZ?=
 =?utf-8?B?MTBoNkZ2c1FFcWI1NVZDVjlzN0kraFRwZEVZam9GcjJPVExYbHlTYnhPRUUw?=
 =?utf-8?B?dGMzR0lGSGNxcXRPQWZaVEpCK1VndElRcUtKNXROV0NKL3ZsUndvNnRGOHZi?=
 =?utf-8?B?WjZISnFWNzltbTh2bmN4VnZHdStYcEVOQnR5b2FhdSszSEM0TnVWcDlnanBB?=
 =?utf-8?B?bWN6anJxdjRyMlRkMjZXNDlOdEJDclpkNUtkVU1lT3BBdVc2T2poVUttaDVp?=
 =?utf-8?B?cFdnMXg5dlBDQ3dwRXFKanZSRmVSWXVRWW1YSTZMNjd1UHl6TGFMQXVnM24r?=
 =?utf-8?B?WXlxcXBLOWhWbUR1MHZvSTUwSG9XSFdONnV3c3VtYkU4TitpMUVJd0tLS1Z0?=
 =?utf-8?B?NmxaK2c4Y2ZDMkhINE9DTXlZQTFLeWEySFBLZnBvcXNQOWRqYldvQzk4TC8v?=
 =?utf-8?B?UGFOa3ZqVEhyOStDaGlaY0lyUmJsb09JcEZmL3VRdGtTTklYaHRVbG5VZ3Nj?=
 =?utf-8?B?NlpqcjhVSEZRNE5uYk9iWE96THM4d3lMMmlsTW9BSmNNbFVQbmNzUmNzOHdo?=
 =?utf-8?B?UXlsei9lV0ZjRnZOeVhBK3VoNjZXZHBGY2dlR2Z3L0M1cDZTYmdPQ2dHRUxk?=
 =?utf-8?B?a0k2ODlOZndOMVpmeERadDRMY2t0NjlaOFQxbzlRNHZWeVVybDNLTUZIMm40?=
 =?utf-8?B?dm1xblkxdmMxZzBldGlRWW4rZHdhS0xacUZLbklIY0F1OStpeGhLNGxpbG1B?=
 =?utf-8?B?Vll5ZDNEK0E0OEFxRGZGN0dKVFNsY1g3QXVHMWc5K21odWVjY2syZENHS2tt?=
 =?utf-8?B?OFZkdUVtam1GNW82RlZaOE9Cc09LbFRVU2lQWnRVQW1zdEliN29XcUxxdHdN?=
 =?utf-8?B?RkM1RlYvREw0TGhxVVNUSW5Ca0YwUm1YMUp3RGFhbTg3dk1oSGFrTE9Zdllj?=
 =?utf-8?B?N1RzRHZEMU10T1VpQWEydzVqVnBnKzd2S2pvNC9LTzlCYUo0L2k1U25QUU9p?=
 =?utf-8?Q?Rne8jMNZZwg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlRODhWRmZGMFpLVThHcC9SYk82d05BUkRBMlBUVGlNc0JCM2g5UmNmaUox?=
 =?utf-8?B?WENTd3lHNldieGVhRXlNNThOTkp1aUd0Z0M3bXJib25xQ0RoRFdneC9yN3RU?=
 =?utf-8?B?VGdHMEQ0akQzNXZyZWFQMEx0NVNFeXlYc3JqeFRqTERSRTRwdGZQclZzM3Nx?=
 =?utf-8?B?aGZHTlBwVEhsY2owejdTemNSYmk2R295Ri9xVjIvUzh5N1A1bEhaKzFyKzQz?=
 =?utf-8?B?ZXhDekhSREY2bWtOSFJiL3FxejVqeS9wZnJLcTF6R3prOVd6dlo0MFRSRjJs?=
 =?utf-8?B?RkZmSWZrcGJUUVd2T0NkKzhKd2FJMWpQbVpRazdVQWxRVEZBbjFWN2sxa2tC?=
 =?utf-8?B?aDlFcUpoLytnSnZwb2h1NDNWcEpRWXU1eWIyclBmclhRaHQ2OWRSUUNGOUY1?=
 =?utf-8?B?NzJHYXhYSFhHYkRiODlybnNvdXdDdHFFOUVmWnRyUmduZXRRdzRuWmx4WEE4?=
 =?utf-8?B?cnUrU29LNndlMTJNSmhzWjVvOFpaSWpjQlAvMnUwVDNTVWNsemcwYVQrb0lh?=
 =?utf-8?B?OHExU2lrbDc4d1ovOTJKd0ZYMEwwekRSRU9RV3F6akFCeEFKV0Z1WTdCY0c2?=
 =?utf-8?B?TW4xQ1dkaFpQUERaTzFmZklxZTlqNXVQMXVSWm91M0RGQjI2QTgwQVR6ODh6?=
 =?utf-8?B?TzRXQlVBc1F4aUh2MEhrTUFsbzVVTmpZSUVZZU5ScWdXdjBBMFFmaEhzNmdt?=
 =?utf-8?B?Tk90eFpGZmFnWW1laDA5TThTbXM2aU9rQ0Ruc2s0WWV5bzgxMGloUmVuTnY0?=
 =?utf-8?B?VWQ2NC80S3lMbmloTXR5SndBdGhWNlo4WTR1dnBjREJpMEtYaHkwekRwQ3JX?=
 =?utf-8?B?NGJ6WC9UNnhlYjNZVGM5Ym1vbHcwSVh4TWcvVlZMMWF2VFVCa0wxNEgvN2Rh?=
 =?utf-8?B?NU9qbHcreDlmL1J4M1laRkRGTVZjazlEMExhajl0cmo3b3BDMHdCZTBlMFpM?=
 =?utf-8?B?b09aZnRpZ2R0L1dwZWo1aFd6WnJqK2lDaEFQdDZqanEwRm1ISmIyUEJHN2Q4?=
 =?utf-8?B?WTRxcWQ2U3pDUTlrV3lKZTAxNFI0eGlNd0VQZEE5cE4vS3VLZEs0NDFRc2Zi?=
 =?utf-8?B?UXVkZVlZU0krb1lIWjd0TUFJYXV1SHU4UW1HL2RTNDVKNkl3ckZtTzA2TStF?=
 =?utf-8?B?ZWtJZ0lIUENkanVpNlkyejhlOFd4c0RzNm9PVnBqRnpaK2tuZnAvdnNiT1VY?=
 =?utf-8?B?NlJIcEJ3UWRCQUwxMDFxa1NEamlFZDFnYldZSzhJWTJaSWVuaXZhMUp0U3hw?=
 =?utf-8?B?OWpROE9BV1lEc3Y5YmZnejZkTVpmczFyTjZJZGlvMWxjVEVnUTJIOVNURzZ1?=
 =?utf-8?B?Z0VSVTV4cHEvd0hIbGduWGdsYk1jS0dHK0htd1RDTnJlaFVoczlWWG9Sc2Uy?=
 =?utf-8?B?OXFxL1hDYUVuT3FUUE9VMUJqMzhZeHZuNlZidDF0eWYyMFdpWGdBNXBDN2FN?=
 =?utf-8?B?Y3IxUWZ1RnJreVNUQUZBaEovdXZIQW1BWTA2b0JvSFdiRDRud3J0SGxwOHgr?=
 =?utf-8?B?bzN1WVcyNllMV2JBNlpSSTFkbEdOeTU4dzBNdHZ4QkNVNjJSRGFXTUFNUnh1?=
 =?utf-8?B?MlJKcjd1aDNBSVhJNWR2bnhIUHVFV3N2R3cvK2FGQzVXOFluMFVmQWdCeVo0?=
 =?utf-8?B?REtOdTdicjRzdEMxN1gxODg5QjYxajBMeWlXQVZhd0ZqR2c1MmVoNmNidVEr?=
 =?utf-8?B?RlUzRFMvbnhTM3NpMk1LME5USDloZHlKSVNhWFJNeUVoTDNSMit6MFNwMUdK?=
 =?utf-8?B?bU13VGFsRGNOSlh4SnlnVkQwaUg1S2xWS2wzZ000SkQ1dkV4OUVTdTBiZXBW?=
 =?utf-8?B?b2g2ZlAvakdNWVNrcTJscVlXb3ZXTUc1dUp1OGVVN0N2ZUlwelZSUXdQckQ1?=
 =?utf-8?B?M21WUGpDQW5zLzdVNU1nSmMzTGhYTVZXY2U0cnFUQWpLTkJmcVJ2K3N2MWhD?=
 =?utf-8?B?UCtFQzFnSlJpVjdBSHhLOHE2QlJPQlhJbHZBdUZmQTd3bHpsQ1VTeDZkQ2xT?=
 =?utf-8?B?U2dXR0gvSG5VTUNLTFUwbHNpSm9ha0doUWZ5NUFIL0h2aHJiRTdwU0VHcm5a?=
 =?utf-8?B?TkVEbGdtOWdwSmo4WE1TSXRNeDhHSE0wT3JDT3hMQi8zWE5vdUpUYW1lTHpw?=
 =?utf-8?Q?WF8u7HRr+oKA3qyA5a71WWl5I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73652973-44ca-499e-8ddd-08ddeaf20c72
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:59:07.2236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apuVVG835dQwVzBzppq4KqoxvWir/5e9HC3rfRuuNPQqDFnsvk5YjwKsbOiCQsM7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
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

Hi Tomi,

Thanks for the patch.

On 4/25/2025 1:01 PM, Tomi Valkeinen wrote:
> Add two new pixel formats:
> 
> DRM_FORMAT_XV15 ("XV15")
> DRM_FORMAT_XV20 ("XV20")
> 
> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> subsampled whereas XV20 is 2x1 subsampled.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
>   include/uapi/drm/drm_fourcc.h | 8 ++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 2f5781f5dcda..e101d1b99aeb 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -346,6 +346,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
>   		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
>   		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>   		  .hsub = 2, .vsub = 2, .is_yuv = true},
> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> +		  .hsub = 2, .vsub = 2, .is_yuv = true },
> +		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> +		  .hsub = 2, .vsub = 1, .is_yuv = true },
>   	};
>   
>   	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 81202a50dc9e..1247b814bd66 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -304,6 +304,14 @@ extern "C" {
>   #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
>   #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
>   
> +/*
> + * 2 plane 10 bit per component YCrCb
> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> + * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
> + */
> +#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
> +#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
> +
>   /*
>    * 2 plane YCbCr
>    * index 0 = Y plane, [7:0] Y
> 

This looks good to me.
Please feel free to add -

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar
