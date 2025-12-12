Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E075ECB9504
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F33D10E093;
	Fri, 12 Dec 2025 16:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="njm9bQNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2099310E093
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQgAWiV6kpnywbiKQXbKfTVp8Ul02BpHxvLuJH7Ipf2d+LhQktSkIoqEZDoXdV4DowlIZzSAhXUe6Ku4NqABy6hP7Ey+A4zNVIHxOzfd1Ml2lfz+PUhlDHKfSN9wuWZxC4gII6DzzvZUnuoMTDR2PktocPex5IuSJRAvlsTC4KItCKECalkaYbA5FfaGBXOl/1Orieclsg4v039cKDNvctANMY1R3LtdgWIh3f2mJah3EYQ2ffyANEbYUCw26IuntMjr2emLXEluKl9COE9Ri92HEvu3nKPULM6F6V5kO8Y+XAhvbJ5AmXbLuRz2M0M5l6URQOB4BI8ayaV1leI0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YepKhbekqHjG49KEvJbjI2iXEw3s6WQDn79uFwMXpUY=;
 b=Lol6j2eI9mdmUkTS5OuASvw5rNqdTa1thgojQZpFzTue3h0NiUxM4dA6yohWeKdpv26X9JJ5RrgwwUjB0tXYf2GrFtQipezGM6WOzQsMWWcpnlwJPTCSxIb2dMalyRX9HHrCfNp9X3/PBewJG1JKhZwDRQkh96o00u8XIb4XoI1cmWJextT1awKtmSY/HQVla0SE+0iqPW+Hi0aRj3MwF08QBQyLkwYij5geNUtjrJzaHzlwg/M3ZfjiAbQZxEN+eTTvXhnLwOANkig4MN88bjioXYUBm19AL8P5cLe09VoeS63DItPmxo871sCffusCsUYVHUrwzcUWXJY3In5eZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YepKhbekqHjG49KEvJbjI2iXEw3s6WQDn79uFwMXpUY=;
 b=njm9bQNaYBUALxlTosZ3GJSAFQAvYnRJs+5u6Doit4WFoVJWY60/9glMgsTuIH1t+WnptGY0TRk3ko+hb1qEYRrmTtEyd7tDZjNIC9QaAzYdWPH3tYbE9kylu71+6rJfbz0UU277zNU90VfpWrp3qPWSI8Rj81KXC+/QyovkwnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB999083.namprd12.prod.outlook.com (2603:10b6:806:49e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 16:43:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:43:48 +0000
Message-ID: <15ee6051-0639-4c4a-bc1c-8762a5ae5128@amd.com>
Date: Fri, 12 Dec 2025 10:43:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix race where send ring appears full
 due to delayed head update
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251211045125.1724604-1-lizhi.hou@amd.com>
 <b6286dcf-d9a4-4dbd-b8e4-5b0640c7dae5@amd.com>
 <6589ed1e-498e-0f3c-740d-ada6d3e02c4a@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <6589ed1e-498e-0f3c-740d-ada6d3e02c4a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB999083:EE_
X-MS-Office365-Filtering-Correlation-Id: af833979-782f-48a8-fc35-08de399d9f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2J0V1VUcElLNmlqeXBYL0pNRVE1bWtGOGlVbmFyWTE1TWtDU0xpVHY3THFR?=
 =?utf-8?B?QUdJbWYwdE1GdnZEZ3BsRGV5T0RSR1hCeEpUVUJLYng5WVdUc1pjd0JXcDdQ?=
 =?utf-8?B?V2RJTnhGcUJ4YWY4Z1JoME1ZR0IxRWJHVDczczNOTUdRNTBReXFBMXFUWlRS?=
 =?utf-8?B?di9pMnhySVpTVEI3YmJHOElYRm1tR3lJLzl4Q1R2WTVjMGozdGc5c2F5S01D?=
 =?utf-8?B?eE1MaFZNOEhlRW9KVWlISnR5VkN0c2d2TG4xeG9yT2N4OUtxVFlxd0Juc3hU?=
 =?utf-8?B?QWdrZnVDTUQ2R1UzM3Raa1hXcHNRb2YyelBRcWdXMFJmbFFWTTVpSE5FbXl1?=
 =?utf-8?B?bDAvdTFSMkdSdVdQbEZPQ21VWWJiN3V6TmVNQWE3V3lDUGdRRkFHRncwemJU?=
 =?utf-8?B?ek83NGJ3MTA1eTVmMDJlM3ZzeVVWQU5OZDQraC9uR0NSV1VFU01WUDJOWmVD?=
 =?utf-8?B?MVhBZE9YUkt6YnoxTERDT0RIOWhxL1RnM1kzdU8zNndHQW1wTnFZbWR5aFlS?=
 =?utf-8?B?a1gwV0JYdGlPcElicmpNNXdvSWpnK1VEODlUMDBnOXVqQitxcUpSUEVOeWNi?=
 =?utf-8?B?ajRzd0NYMDVnT1N1cFpsVUlFa2dWWTBpQXJqblpVamRiUkpVaGpWOHZSbjNt?=
 =?utf-8?B?YytMYklhdzFDOGdKWW1Bemp3ZktyQWd2R05IMFVFZGVSRE5QRW5wTWJKdjg5?=
 =?utf-8?B?NVFvekRXZXFjRXFNc3R6cm9iN0ZDMHhFYjFHMldzWitKcGVaSGN6YTFwekdB?=
 =?utf-8?B?aFArUnB4TGtoRXROYVU3Wkh1RGFDWHdULzlMdHVHVU10U2JYZzkwSUhobGV2?=
 =?utf-8?B?R2diQlNCbnBRNlJ3RTkwVFMrbTcvT3dMcVVjcEF1SW0vMzZpV1ZNdnJLKzB0?=
 =?utf-8?B?QWlBSG8xWE5TMlo2bW9TdGRvd1ptYnA5S2hBMWVraDdLV1IxTS9Lc1V0azNz?=
 =?utf-8?B?cEJnQ2hMQzA4c05jWUFsRmprNnhoc0lSUVJKaTFGN1UvbHVxM0hDc053N3ZZ?=
 =?utf-8?B?eE1FT1N5RzhYMVJPdWVFeWZiU044cEpZRmthOEE2Q2RPQ21WWnZEZUhzOS8z?=
 =?utf-8?B?MWhiQ0RZQXp2RTZOdWdRQm9LdERNZXY4NVhMakR0NXNNNlhjSGkveUZmZ1hu?=
 =?utf-8?B?Rk9RYmxwbXlSUE02eVBaeU9YTWNpRytSK3hubkJ2VmN5K0t6MGwrajUxTTcy?=
 =?utf-8?B?dGFoL21ZSWJTVU9kUjZSQUVhdXBFRU83c292WUYzeVh1YUhqRkgxUlV5eWJz?=
 =?utf-8?B?Q1hOaW50Mi9zMTdmUGxUZUdabXR4ZWxseXRaTGIxbHNnVjNjc3d5V0FZOHN0?=
 =?utf-8?B?MjhjOXN6MDZMbWQ2L3JEZis1K3VFa3F3Ukt4QmpiaE5KOXJLYVBhS0FqMDcz?=
 =?utf-8?B?NEVpSFZzZ3IrTEMvRkE0SzFqQjBRSndvU3ppeHBYeFg2QU5rMHpGaHFnVzcr?=
 =?utf-8?B?NXVOWENhNTB3eGlWUU0yaVFNbE5EbUFBN3BTbkM4R29ydk9PRmQ5WkJmWTQ3?=
 =?utf-8?B?d0NEOXZhaksxcFU1SU4wRGZ3bld5QTMxMktDYmhJL2o0UVVDVFg4bzcwSFdS?=
 =?utf-8?B?bGlDTDV4UWZQV3VZVXJSNDhjMUZVUXkxTTdtbk94eFJZNGtUT1hLak9WYnp5?=
 =?utf-8?B?dXJDdDVDb2lGWFJEazZwb3h0cWhOM0hULzVPOXNJdkFhQkxLaGNwSWxWcUZI?=
 =?utf-8?B?UEJjSmdaUVVpb3lqajhxZVhUMi85SW9jRXFqOUJFN0psY2pTWDJJU3FYeW9M?=
 =?utf-8?B?UGdmakRRTHZPUnlqQ3NKY09paDlHcEM2ZnducDhyN0o3Wjl0TmJITGJnNnFX?=
 =?utf-8?B?QkJoSzJNVFdvdzNWaEhTN3ZIMG41MFNNM21VNE5xSVdOcTYvaG5KUXFKTitu?=
 =?utf-8?B?Yitxbmt5eHNiY1dUZWdadERMVHh0MkJhbGVLNDNVNzhtVjlSNDZ3OFE1VzNZ?=
 =?utf-8?Q?/s/wPtv5pFQuIstVSYwFEi/SlWqfN+It?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWhvTjJnakorTUw0ZVp5WFloWVd4TXN2TnNOdVkzeTVySjhzK3MrY09oelBu?=
 =?utf-8?B?L3FhTEI2YmlQL0ozM2E2blBjZEpMRTR1OHdBSit4Q1JEVUZtSTBnTkpPTWg3?=
 =?utf-8?B?dnlySnMvKzdMOEltTVlsN1NNR1kzcnFGck1JZlVRWk1DTDFoRzRFNWFvUnEx?=
 =?utf-8?B?YXJIUWJiSVliRU1FUC9YZEFsbFlrQ0hTU1NsMllWSSs0L2tLdEpCSTBoOXlX?=
 =?utf-8?B?QXpoQklEZlloWXdkT1Jsdmp1cDV1bU0vcUh1amUvVENwZzE3TVVjRDRUMlZN?=
 =?utf-8?B?dVhnWHVLdXB0NXcyZG5YZXkxTmJaODRPNDZiTVBCVytMcXF4clJ6SzNSZTU0?=
 =?utf-8?B?UzdudlczZmJQMkJIVnZhd015U1lYZGR3bEpobENYSU9SYU9uQUcrb0lvTncw?=
 =?utf-8?B?ZU56b1plRE52M0tVMlZMcnBwR0lpQy9YYUFYVFZQVFNDNGJHYUNvWDRuZGcv?=
 =?utf-8?B?dm16SEhWcHhTMUJ5ZDF2ZmY5NllpRi95MXlQMC9Zb1g0TlVXMkFRM0NwcnNE?=
 =?utf-8?B?elUrL3VoZnF1Q2pFUVJxUy9RVWJlWk9SeEREY1hEalFIMW1jV0k3NGlUdWkr?=
 =?utf-8?B?OFhROFhOdFRkWkV4Zkowbm1WVXNYOWJkRHZBaDg1dmtWSGNvL1NYN09EYmEr?=
 =?utf-8?B?bUpyQTFHNTQzd25oRXNNdmo4VjlCOEkvNElobG9XalplTldmVHh2ZUg1dndR?=
 =?utf-8?B?c1hTN0k5a2JwMUoxNVV4R2F1QVBOME1rNzFOTnNoeld2ZDNOUkJ0OGZrZ2Jt?=
 =?utf-8?B?YXZXRUozT08wRUQ3UFlqV2NwUldYNFBOY29pUDNKSm5tbzlqdG5tMHp6dHp6?=
 =?utf-8?B?RVBXWG9ub21wMVhrckVpQmFnbWZOZGJ4N3FMRzEzWTJ4eURyMzFLNFgwaDhu?=
 =?utf-8?B?bVRkbGNPRXBqd25NR2dRUHNRck9USnRhMW1tTTdjMkdjckdBMXJDR0p0NGdY?=
 =?utf-8?B?aEFYM3N2SjI0cTNlZkJVbXF3aXMvNENYRkVEWmltWkpGVW9iYVBUdGpuQnRW?=
 =?utf-8?B?aU1nZGVaeGx4ZnExUUtCSzY2NTZWcnNObXRKQ2FVdXNJajZ5ZHRVZXVQcWNH?=
 =?utf-8?B?dDNOdmxjRCsxQ3ZmcE5RNlBHRzM0c0R0VEVNQlNoUDRmRFg3RUNDOER1Wmlr?=
 =?utf-8?B?bWxwMHhjOTZsc2xtdTJGdzg2dTRjaTZ3di8vYmV2Q24vTXhwNHcyNmRtZnRP?=
 =?utf-8?B?NHl1U0JxaGNmOXh2VkFxSXRHMzUvY3FSRXpsL3YxemY2OThSd0FucGNlUmtz?=
 =?utf-8?B?NklmQUFSOEpmcmJiSUEzZENpWDdjM25wYXBXQjQ2MEZXMTNOa1ZuVnZXeG1E?=
 =?utf-8?B?bFRpcjVjdWxFalFYUmUzTnM1clNLSE1aaGxBZ2JUL05zYVNOMDNObWdOMFE2?=
 =?utf-8?B?TjU3blAxZjE0MEdCYlA5L3cvbTVwOVJzYlhyQXNHdTE1ZjBhUThzR3drRm1m?=
 =?utf-8?B?YnRtT0pIamNhc3h3YnkvTmZJV0FMbTFhVnVZWURGZ1dSTmlHZVVaOTZhRTB6?=
 =?utf-8?B?R1A0eVg0TzV3OUlKRE1tazRuZzNOUGszeVo0SXFYdStNYXRvMVozT2t4RWJT?=
 =?utf-8?B?dGZEQi9tam53S0thTDEvbGxYWG8xRlh5UWZUMGIxR0crWFhnOVc1UERGUkNY?=
 =?utf-8?B?ay9oNWF5Qm5OS0RhaGtZWVhWMVV4ZW1zY2lxUVVNUW9BSFZPRnlNOTl6Mk5P?=
 =?utf-8?B?K0RncmxOeDlvSVROa2hEeG42TnBPSXNRbmRkY21lRlRia2tDTXhvN0VLZ2hx?=
 =?utf-8?B?VUxUcU4zM21WU2lGTWtvblozMFVrZ3U1eDk5dCtBTXFXeEF2NldTdVJTNjJq?=
 =?utf-8?B?dGNFZWNob3EzTEcrOEo0QkI5Y2tUdEwvREdPM0phS2YzNHQ5cDZ0cHhaWE1L?=
 =?utf-8?B?bEtjYnM4SHRVeDlkT3JsT1lOTndyd1lUQmRZTmhNZS82d1lwdzM0Z3UzNjdk?=
 =?utf-8?B?bGhoRTdLckgxTDVHbzB1WDRjeGtyQXp3Rm9CZkRTTWVVL2xtZ1V1TXFIOTU5?=
 =?utf-8?B?K1RiVmZEZ04va3VISGhMTXAvSmpXU1N6cWs4MFJpU2pkKysxT2dIdmNpNzMy?=
 =?utf-8?B?NkFhN09WRzdqREw2S3hBbWNHNHVXL21lMFBmOERUSEhvaXRzT1pjVkROYkdr?=
 =?utf-8?Q?fKcO2MdTyhOanBARNTLM32Bk2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af833979-782f-48a8-fc35-08de399d9f8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:43:48.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tMuJh9yrdh3vpNii/rOeyB+fUKJaA8VObbpYV9vxEX4ZrRWs2oUchNn3jqSB+KnWWh1OQvCHMVZERdYIZSXog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999083
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

On 12/11/25 10:41 PM, Lizhi Hou wrote:
> 
> On 12/11/25 13:48, Mario Limonciello wrote:
>> On 12/10/25 10:51 PM, Lizhi Hou wrote:
>>> The firmware sends a response and interrupts the driver before advancing
>>> the mailbox send ring head pointer. 
>>
>> What's the point of the interrupt then?  Is this possible to improve 
>> in future firmware or is this really a hardware issue?  If it can be 
>> fixed in firmware it would be ideal to conditionalize such behavior on 
>> firmware version.
> 
> This has been found recently with a muti-thread stress test with 
> released firmware. My understanding is that this is a firmware issue. I 
> am not sure if it could be improved in future firmware.

OK, thanks for explaining.

> 
> I believe this driver change is more robust. It does not change the 
> logic but adds an polling instead of returning error. If the firmware 
> updates header quick, there will not be any polling. It works for both 
> current and future firmware.
> 
> 

Yeah I don't think it's harmful, it's just unfortunate to have to land 
code like this when it sounds like a firmware bug with interrupt 
handling.  If the firmware can be improved at least it will be right on 
the very first read in the polling.

Reviewed-by: Mario Limonciello (AMD)

> Thanks,
> 
> Lizhi
> 
>>> As a result, the driver may observe
>>> the response and attempt to send a new request before the firmware has
>>> updated the head pointer. In this window, the send ring still appears
>>> full, causing the driver to incorrectly fail the send operation.
>>>
>>> This race can be triggered more easily in a multithreaded environment,
>>> leading to unexpected and spurious "send ring full" failures.
>>>
>>> To address this, poll the send ring head pointer for up to 100us before
>>> returning a full-ring condition. This allows the firmware time to update
>>> the head pointer.
>>>
>>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>> ---
>>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 27 +++++++++++++++----------
>>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/ 
>>> amdxdna/amdxdna_mailbox.c
>>> index a60a85ce564c..469242ed8224 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>> @@ -191,26 +191,34 @@ mailbox_send_msg(struct mailbox_channel 
>>> *mb_chann, struct mailbox_msg *mb_msg)
>>>       u32 head, tail;
>>>       u32 start_addr;
>>>       u32 tmp_tail;
>>> +    int ret;
>>>         head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
>>>       tail = mb_chann->x2i_tail;
>>> -    ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I);
>>> +    ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I) 
>>> - sizeof(u32);
>>>       start_addr = mb_chann->res[CHAN_RES_X2I].rb_start_addr;
>>>       tmp_tail = tail + mb_msg->pkg_size;
>>>   -    if (tail < head && tmp_tail >= head)
>>> -        goto no_space;
>>> -
>>> -    if (tail >= head && (tmp_tail > ringbuf_size - sizeof(u32) &&
>>> -                 mb_msg->pkg_size >= head))
>>> -        goto no_space;
>>>   -    if (tail >= head && tmp_tail > ringbuf_size - sizeof(u32)) {
>>> +check_again:
>>> +    if (tail >= head && tmp_tail > ringbuf_size) {
>>>           write_addr = mb_chann->mb->res.ringbuf_base + start_addr + 
>>> tail;
>>>           writel(TOMBSTONE, write_addr);
>>>             /* tombstone is set. Write from the start of the ringbuf */
>>>           tail = 0;
>>> +        tmp_tail = tail + mb_msg->pkg_size;
>>> +    }
>>> +
>>> +    if (tail < head && tmp_tail >= head) {
>>> +        ret = read_poll_timeout(mailbox_get_headptr, head,
>>> +                    tmp_tail < head || tail >= head,
>>> +                    1, 100, false, mb_chann, CHAN_RES_X2I);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        if (tail >= head)
>>> +            goto check_again;
>>>       }
>>>         write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
>>> @@ -222,9 +230,6 @@ mailbox_send_msg(struct mailbox_channel 
>>> *mb_chann, struct mailbox_msg *mb_msg)
>>>                   mb_msg->pkg.header.id);
>>>         return 0;
>>> -
>>> -no_space:
>>> -    return -ENOSPC;
>>>   }
>>>     static int
>>

