Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4307962C04
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DB410E58E;
	Wed, 28 Aug 2024 15:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VkjzzIgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184D10E58C;
 Wed, 28 Aug 2024 15:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDiJODBySasWXjSgqEEdBwpF/AnF1xO89g4xymTIORfIkPLR7PeM5Yy7wNTixS6j+RuPNFZiRKME1/ySSsOVtDbJEg8Vhe38quD7UNz1insNCFkLJ/rALBtmcMix235/tmVQOOpmldRLC/j0IY85znXN6Pdx/+C6L/AaFrtJ0MgtfDsU7nWv7fLN8wuHCQXIjmu3rSKu4CoDsv21By+f6wCGQpaDwE9B8sikwvsrXtnHzMXcJsPgxBBnqHDyalrnVbbErJ9Bd3MR0q6+p+8h26MYNg2mfuU4w24a8SonxGGPLaYiGGh9HUPLGUj9j9htAVooR/UZLjBB9QBNN6VpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0pP8o5MRYgfJq50F525Nb74uHwBJgu2OeN44/WTuGE=;
 b=Vx9usMAayuvNzHdvN1XBF89C+fHL4v5jGEVLGiOKyxwdiIG1zLhHQgDBPHuj+tDPhGYl+G28hw50wmKH4Tk6YZ2upCygJYha3ZU5Uwy1Df1PiptF1P2Mr02jE3hStuucw9fv/pTY+GYxbkK8+eATa2Dda8U/oZEnK02+diU6kE0x8U8s4J6qdL9FIUMT/WR+VrgnG0HXUUYAgpEyMvlhtJirbJkAB1g9NsTqoU+Sz6wEiGVTHcdNK4qRFrMhEChmYp31DorRHjjGjD5VsQwCM1BrSAyluaiA6sQVG7SJ4rqqPZZJ7wk+8QRl8rbsAaYO9Z2EG3BRKtq1CqPBmpmnLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0pP8o5MRYgfJq50F525Nb74uHwBJgu2OeN44/WTuGE=;
 b=VkjzzIgYOfVIeZLqrb4oQwAj13G82B+MF+wK4Sevu6QcCTtj8+YLPUA2brjYFV7NbnNAk4kU2OaOT1FydQgUkhaI5HJ8xukOpHqOi647j1xd1hWaEe34XeuiiUmu1btIIV2vv3B2Buloex66XeXjKhSLwXSz2T3n2v5tTWP52/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Wed, 28 Aug 2024 15:19:54 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%7]) with mapi id 15.20.7849.023; Wed, 28 Aug 2024
 15:19:54 +0000
Message-ID: <e3122e5c-a6dd-4228-84ab-04747a3df265@amd.com>
Date: Wed, 28 Aug 2024 10:19:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: disable amdgpu_dpm on THTF-SW831-1W-DS25_MB board
To: WangYuli <wangyuli@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, lijo.lazar@amd.com, le.ma@amd.com, Jun.Ma2@amd.com,
 hamza.mahfooz@amd.com, andrealmeid@igalia.com, wenlunpeng@uniontech.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com, zhanjun@uniontech.com
References: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::31) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff2b4ad-4efc-4c10-24dc-08dcc774de54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rnp4WkwyRWlDQ2FVeGZGRXllTXlkWVFCMzBwcjBLSXlaeEVZK042cUVqeUVj?=
 =?utf-8?B?MnZDbEwxZGNlakQvd2NlR2ZreTZsMHFWV3JLNll2eDg2VlhGaWRJL0YxT3lX?=
 =?utf-8?B?WEdiN3V2T3ZUTXh3YlpLUWlFOG90T01pMjltNUJlK29EbXN0Wm04RVAyMWJx?=
 =?utf-8?B?KzlBMTRPZEllUDh5Tjc2NkhzSU84VmN1ZXFFN2MxY1FReFhFL1A3NHRHdkVQ?=
 =?utf-8?B?UjA4cm0xS2pKem9rMEdpVjUrQWhxQlpoZm5RTWlqVjBiNUhFWU9JcXNSVFBT?=
 =?utf-8?B?b0ZocHpmbVpaaHh5Q3Z1ZnBXdXJ5RXdtQm9LUVg5Ylg4L0tzZGdYWkthRXQw?=
 =?utf-8?B?MXJVdlZ2UDI0Y0FoK0VYZzRnYkVwNnNpajBzamkxZHRzNTFPb3owM1k4dG84?=
 =?utf-8?B?c3ExTmRHYXBCZ1NCWEJ0cDVEVFpQT0kxT2p0MC9zUE12eTBHWlRmdlNselpR?=
 =?utf-8?B?bUtsOC9IQnB0eU1ubWFUOS9nNERXa3loTSs3M01JdXZrZVN1KzNicGZpUWlt?=
 =?utf-8?B?NzRtSFBmdVBGdEZUT0IrYXFoUWlqVlg1MnJBSzMvbGcvU2MyU2dEZmtHWG00?=
 =?utf-8?B?aVBrUjhENlk3bHF6SFpyaGJQMEsrWGJRTW9LaWQ5VFE0MnRHdEE1a0cwUlI2?=
 =?utf-8?B?YjJFcWg0dTJ6NGkwbWZTbmV3SnRmUHVFSU9Ici81bWExV3JMS2JjdCtNbVBW?=
 =?utf-8?B?ZTh4VC9DSko3dTIrdzdQRzZFcnhhUUdtRXk0UDRjZWh4dlhWbnQrdmdycFZR?=
 =?utf-8?B?VFR3WUtDaE9XQXZsYjFEdlM3SmNzN1pldmJNVitZMCtHWGdnYU1LVGgxczQ0?=
 =?utf-8?B?d0ZrUlBISmxDSGZuRWdVYm1Bclp6Y3NacHdVZUpXMFFhWk9XWktIaUp3OEpC?=
 =?utf-8?B?RCtHakdwNnNYUWYzeFhuV0x0alQ4RE1FRTBjUS9PS1dQR2NhMUtyWkppRzF3?=
 =?utf-8?B?V2x3OVJpYUxBd2JYWWkrNG45SXAzQVV1Q3RnTm13Y0FpYU4rRmp0NDNKWkt2?=
 =?utf-8?B?c3hoTFlDU2xPK0xhRllEZnVoUWtWU3FMRkttN1RWTTcvdE40RkhpK3MrZWFP?=
 =?utf-8?B?UVBHRVo4Qk1RODZ2WTNRaERlN2FhWjBkTTVML0c5Q3JGVU5Vd2JKRWJ2OGhF?=
 =?utf-8?B?N1hoNHJOV1ZIUFpkb29XMGpSYVp0YkVucFdsUmlmSmRUemh5cEM0ZHFBck1z?=
 =?utf-8?B?cmR1OHhMcnY5cnRKeFlsSW55dC96aXl2ZU5jRG5mWHBwM1Q0Kzc1dnhadEVD?=
 =?utf-8?B?TmtrMTRhaUkxRlZkV0JFbk53WUxYYXR1ZmNqa25lTVZlWmFjelJwdVB4amtX?=
 =?utf-8?B?dm5La1o4M0IzQTJQZEN4MHgvdWd3RnZSSzRjdHNPU1hlMmhVd2tJKy9CZVdt?=
 =?utf-8?B?VVl0Z3JzeXB4MnZUUEpUVndYNFg3cHlzTnRBT2FGWTR5US9paitVNUpweWpP?=
 =?utf-8?B?RFNyZCtkQnZYRVA5V2Z0WEVHQ3FlcjQwSVhQeC9TeTI5WE9RWjlGOUgxMzlz?=
 =?utf-8?B?NkhoU1VscXZUcnUrMlZ5VXpaNW1BV2JJNFBQUDlXWTAweDZENmVQNmZLdWhn?=
 =?utf-8?B?YlhmSG8wR1J0ODlxeVY5S3k4MDgvY0F2S2xIWXlmY3pMYU9RMlhISjFOUXVu?=
 =?utf-8?B?b2tPQlp6K2QvdndwellpZFhZUTZFcVpQWk0wRFFQdU45bDJOWUU2VjRPQ211?=
 =?utf-8?B?c09CdTAxWlZXVko0YnNpOFFTT09zZ3JqSHJVZ09YWFd2MG5BRXN1aHhMMzhL?=
 =?utf-8?B?YWhLSEJTTWtwMUpKemNMMEU4SGZQWGNSRFJYNWVHbkFiTGl4QjV3RGJjRXJk?=
 =?utf-8?B?RXBtb3FIUFprWFBSVXc3bFBXekVqemh4TjlDMUNPbGdkZE43cVArMEVoNkt0?=
 =?utf-8?Q?+HJFE4Leci1Sh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXhWUVBlWmZCUUpEeHFMejFYRGNFWEEvb3FrRnRoM05NR2d2WVZ0NWwrOHVi?=
 =?utf-8?B?M0JHTWlVNzhiaWp1dTdxZU1sOVU2SVRyWEtXOGNDM2IwN2FVMWRsMk1xcW10?=
 =?utf-8?B?cEhGeHZhZG90eDhINk5KblBQbTlmVE1jNXFxeDdsK2VjK3lzVGtseGJXQUw4?=
 =?utf-8?B?RkRISk9uV1BMMXlFeERKc2cvSE1ZNWhScjlpcTh5Vkw0aVVEcGpoU1R3R1Vq?=
 =?utf-8?B?eGdHVk5Ya0JqWkhjNk03SWwwd2JtVXFFOFZOVkpCVm45MDd2US95ZGxwR1Ro?=
 =?utf-8?B?akoxaDBCWnVWWTZDT0RlWDlzT1NvVkdyRlprbmdLd29JVEZPNTd6WVdzNGZm?=
 =?utf-8?B?bUdPa1I3MWtQcENra2QrQkJkYzdKWWgwUGUraEdiK3lhaGFtWFZSbVljT3NN?=
 =?utf-8?B?ZjhuQmtFUGptY0hmSDlmNEpybEQyWTBETFZRb0VsNUUvLy9SNndBMjJMVnZp?=
 =?utf-8?B?TE9RY29uTmRGRzE4V1dYTzdUYUpCV0lvY3VTamxzNmJQUVhCMk1TdVVoTjJ5?=
 =?utf-8?B?WjlPNGM0OG5uSjN3dzZyYVlJQ0FSbmhYdkM1Q3FRQ0FFMUlhQ0ZTam95eE5u?=
 =?utf-8?B?SVpoc1daMHROMnBoQ3JUM3JOelA3ZjN2Y0dHN045emZncFMvS0k4dTVld0J2?=
 =?utf-8?B?djVIbTdZSTVqd1VHdXJ0UFMzY1I3NlZHT3YvZUZiTWgwd201NE9zRHovcTRH?=
 =?utf-8?B?VGp1S08wVFZiTUlLVTFmS0tyZ2FHdUUzbGdPQUFrZGxvc2FBeWVuT3RQRnBy?=
 =?utf-8?B?MG1tSm1aNlNTRGRHZFFkT3RoeTV0SEw3R09HNHdwZFFBVTAwUHEwdlczSm9y?=
 =?utf-8?B?NytCYy9ETjJZVGU5YnBIQ0swcS9BcFE3aGhhVlR0c2E4dHdtOEs4VlZGK09z?=
 =?utf-8?B?aTNIbHh6RGVuMlFrS0RzWDhSbHo0ZklIWUFkR2FtOU1LbHJjVTBuQWV0TWJE?=
 =?utf-8?B?UFdLdmpubFpuTjRGYmN0NUQ4UE45eU5zWUFOUE5DRno4SGRXbVlCdmtvUVdR?=
 =?utf-8?B?c0c4MHMrdElzeC9CZ0lYZllrYWcvMmw2WFNtSk5VcHpjd09aZkg3aGFqWnlT?=
 =?utf-8?B?L0Z5cjdEc0NaU3VqeElwbDF5M2lXWVRSbGx0a2E0MXkzOW5MWkxsaEZJenlZ?=
 =?utf-8?B?Ty82VU8vZTBNSURhZnRWVGVrRlZ0TlpNTVp1SXVJTlF3NURlSldKSGVOYlZt?=
 =?utf-8?B?dzMyYTNmelVEakxqaFkvdG1kd3lHNTg3NXlPb2ZJYkliOHBvdCs5RkNLejlW?=
 =?utf-8?B?eXJmKzFDL0J2TytFaURrNnFNdmtUV09CREpDQkJvVWdHRUZjUkk2UWJYT0V3?=
 =?utf-8?B?YnB6cXAzUFgydkpiSEw2U1h1NWpuWm9wYnh2TjhxNkN2S2tJVk1FbmljL2lN?=
 =?utf-8?B?K290eHhPNFRueFJPd3BSMi9lWGVnT09kVDN0NHNJZlBYOXNpNUlrM3hCN2V2?=
 =?utf-8?B?dTZtWUVYN0hNQmhDWkVlejZReG1BcENZNlRJdXV3QnBoamRpWnM3Z2dMK1dT?=
 =?utf-8?B?WFdTVFZYNnduNEwxeUl2c3NmU0RMRGE4RHJ5eE95Rzl1Y1ZhbVJxTHE2azVB?=
 =?utf-8?B?VlVMZUV2bUFBYVVqMGwvWjVoTU5nUVYyRmJrL29SZW8veUg0NzFXMS8zdS9n?=
 =?utf-8?B?U25ZOFdHSVZRTVFnc2dYalBKQlRLTFBld3dhMGkvaS8xbnFtQzZlTncwZ3dI?=
 =?utf-8?B?eTNIaVg3aTJzUkY3ZlQzM1pDMzJGWlA2cHFFWUorOVh1M0ViZDBOV3hKMk1a?=
 =?utf-8?B?SGxabm5kdHp6Z2lXWERMUW42Y3g1SEV0Wm52b1dsK3JlTUF6NmlhZnJvY0x1?=
 =?utf-8?B?WkQ0aHlFTEd2bWY2VktOVUN0MnZac2VyOVl6SWx2VlNtQlVOWk5LZjV5SW9i?=
 =?utf-8?B?Q0tuVm9jNzg1b04xMGVra0RmTTZmL3FQMUh1VGxxTTQzZmgrV0h0STdQMGh0?=
 =?utf-8?B?eFY5cVRpWkFsLytadGsvbk5lZk1uUHI4ejBsR3pqZmVLVzg4NDN6OUtRSWxE?=
 =?utf-8?B?amJSM2c2NUQ2aFJQQzdHa29xSm4wdktSUVptbUxNaXoyTTNtN3hEemZsNklr?=
 =?utf-8?B?UTR5L1pRUWJNRytieXJIK1gxWWNHVnRMenA4QU9xd0t1V0NjL2pveHFZQndM?=
 =?utf-8?Q?rUSaqcm05ZKAjuwYoe3XCwNnO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff2b4ad-4efc-4c10-24dc-08dcc774de54
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 15:19:54.1453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dUeuiSMdh7yb0a3yY56Ew3mEZm0qn0nuOiXYUbGUEjqUxv/UxNYucDQZtM+mE78eE58Aoj2h0dP4PyIC6FINA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693
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

On 8/28/2024 05:59, WangYuli wrote:
> From: wenlunpeng <wenlunpeng@uniontech.com>
> 
> The quirk is for reboot-stability.
> 
> A device reboot stress test has been observed to cause
> random system hangs when amdgpu_dpm is enabled.
> 
> Disabling amdgpu_dpm can fix this.
> 
> However, a boot-param can still overwrite it to enable
> amdgpu_dpm.
> 
> Serial log when error occurs:
> ...
> Console: switching to colour frame buffer device 160x45
> amdgpu 0000:01:00.0: fb0: amdgpudrmfb frame buffer device
> [drm:amdgpu_device_ip_late_init] *ERROR* late_init of IP block <si_dpm> failed -22
> amdgpu 0000:01:00.0: amdgpu_device_ip_late_init failed
> amdgpu 0000:01:00.0: Fatal error during GPU init
> [drm] amdgpu: finishing device.
> Console: switching to colour dummy device 80x25
> ...

This is production hardware?

Have you already checked whether a BIOS upgrade for the device could 
help this issue?

> 
> Signed-off-by: wenlunpeng <wenlunpeng@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Just to clarify did you guys co-work on this patch, or are you 
submitting on behalf of wenlunpeng?  It right now shows up as you 
submitting on behalf of wenlunpeng.  If you co-worked on it you should 
also use a Co-Developed-by tag.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 094498a0964b..81716fcac7cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -32,6 +32,7 @@
>   #include <drm/drm_vblank.h>
>   
>   #include <linux/cc_platform.h>
> +#include <linux/dmi.h>
>   #include <linux/dynamic_debug.h>
>   #include <linux/module.h>
>   #include <linux/mmu_notifier.h>
> @@ -3023,10 +3024,32 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>   	.dev_groups = amdgpu_sysfs_groups,
>   };
>   
> +static int quirk_set_amdgpu_dpm_0(const struct dmi_system_id *dmi)
> +{
> +	amdgpu_dpm = 0;
> +	pr_info("Identified '%s', set amdgpu_dpm to 0.\n", dmi->ident);
> +	return 1;
> +}
> +
> +static const struct dmi_system_id amdgpu_quirklist[] = {
> +	{
> +		.ident = "DS25 Desktop",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "THTF-SW831-1W-DS25_MB"),

As this is suspected to be a BIOS issue, I would like to better 
understand if the BIOS upgrade fixes it.  If it does but you would still 
like a quirk for the system it should include the BIOS version here.

> +		},
> +		.callback = quirk_set_amdgpu_dpm_0,
> +	},
> +	{}
> +};
> +
>   static int __init amdgpu_init(void)
>   {
>   	int r;
>   
> +	/* quirks for some hardware, applied only when it's untouched */
> +	if (amdgpu_dpm == -1)
> +		dmi_check_system(amdgpu_quirklist);
> +
>   	if (drm_firmware_drivers_only())
>   		return -EINVAL;
>   

