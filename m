Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE40AA4BD7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAB010E7A2;
	Wed, 30 Apr 2025 12:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hRD1IbDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A810E79F;
 Wed, 30 Apr 2025 12:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYyRd7sv91Ya5Bnt16qwPwWKGiztr8SxHZloDHkkRvmnoYr00nEPwPifIxjqYQ0HkULtIFn2ofbg1qEf22/oyjKoOqkY4dGE4Jr6AQyJQchPQyZe72LRladCC7lpI5I7xsMnRn8JHiruqpiH/Hr+R+BmJMPd4Bc3WS7HLjSdpxqKsI4NfSLHHEBfGPivexwBBeO+kmFqNcEzP00n6TcXzelkGwl8AtMfdCZHgxPLQUoB4/+JUzMKlwNMb7SAg46zCVZxDwFdXdhUaNtqvoiT1ueEd2d4sobgZlSIKCaHAi6m6Prj1DAnYK3+yImK8XpHndcMYYiGcBuY6Z0GklH8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02fDSqiDE9L1/tW5qgy+btjQTao5WTM+9TphQT/cr70=;
 b=kKRrO+gyrrHq9AVBisCKwh0XhBit88PteolCl9PbuqLhI8YIZ2nEdOoN8/nEif6RWkmahdy05HmiVRnEEyIGbhc8FGVK8xAmibeO8Gdmyquhdp/d2t8ieIkhB585hPp6IhYCKzdfNLYu4jI10TscdYUw0HW1AP6hW06PaEqRLmIfHrpL7P9pBxZ3NV9MDAKbruC3xJQzYbk7wqyA9ubm9uJdot0QSlXAYkaQIVrgTPCoiEBZ32aFbS+04S45GaidKIdaRxXdXQ1qd/LkiUEbXmYHgexXmGOA+bOcwwdnVhopq/VGwlripIWkbkQ0AnCBOLZLw6uP94nCOHdAWL9euA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02fDSqiDE9L1/tW5qgy+btjQTao5WTM+9TphQT/cr70=;
 b=hRD1IbDDfzseg/3+Q58Ke/UcHtumluVM9LwzxCRaH1dI0z55eH/c2jQfhTsPvGLlUTS0NJP76P49fYWuaioWw42wpL0jO7uYy3w4NksZyLMow3lElXYuVyflt8Wc2QMaPp9JsgM67sTlm3GAZUW59xWI41DXPTyiPvXp3H3dTYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Wed, 30 Apr
 2025 12:52:17 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb%4]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 12:52:17 +0000
Message-ID: <2009351f-d376-47da-997e-8736b1de84c1@amd.com>
Date: Wed, 30 Apr 2025 14:52:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Yadav, Arvind"
 <Arvind.Yadav@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
 <MW4PR12MB566769E097E394ED607DBD9CF2832@MW4PR12MB5667.namprd12.prod.outlook.com>
 <8409b02a-811a-4bf6-a4a0-2eb63778a79c@amd.com>
Content-Language: en-US
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <8409b02a-811a-4bf6-a4a0-2eb63778a79c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: e79afb3b-be48-412b-3a67-08dd87e5d648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTcxek9TLzFtdUI2SCtTTkFaajN3T1hNb1M4U2RPaUZ4YzVuUzlIWGJOMFF2?=
 =?utf-8?B?MUwzTFNSMENVVzB6WXhiOHJlc1dpcGZ1OVpTTTNGd240UVE5bklYRS81ZkZL?=
 =?utf-8?B?MWR4N0h5cUg2NkYxeTI3S01iSTdBdHhSYTNBWFVMNlMrZDF3SXAyb0dUUmFD?=
 =?utf-8?B?Y0M5NXdobzdsS296cDRLRHl2OG5VYVRSVnJZY2xUc0RqVjlLa2lOeHNQWWtv?=
 =?utf-8?B?Mkxja2NSRzZqU01Zajd2RmlNYk9vSThaalVRam5GSWZ2U1ltdnZqdTZEaG54?=
 =?utf-8?B?SDlXNnhCUjRGV25vNVhtbElXb1BTWDN2WEJRUUMvRDUwNE5ublgvUFF1eEpJ?=
 =?utf-8?B?bVFCQ3hrRWpRQi9obmV2M3RYem0vVmZwOGptUkF4NXMyWnZqREJpK0pGRWNu?=
 =?utf-8?B?b0FoZEtoSzlqOTNiVmNBc3RtL3M2aExJWTlGdnNQd004ek1VS2dicHllV3FM?=
 =?utf-8?B?eU1Bemx5QVBxcXV1QlpxM1JRbktwOEljdW1yL2syeW9ZMWh3a1NINktnWXMy?=
 =?utf-8?B?K2k5cFpybnlMV2VmaWxNR3JUbjlYTjVESTFTdndPUVpJUzVhcVhEOFhoZTE3?=
 =?utf-8?B?N2x2cEdFQStHb1JZcitDbk0rb092MXVibStUVllFcEVvSCtZc1Y2U1F0R2Y1?=
 =?utf-8?B?am10d3pQSWdzbkFRNGdnbmlBZjkvYlc4enpoYjRlazFlamRaN2JWZzFhQ29t?=
 =?utf-8?B?TjFqbVJIaVNkS09xYXQ1TTI5V2h5cVJ1Nk5Ta09yeEFCWDJqaTNMSnBuaEZa?=
 =?utf-8?B?UFZXQ1lrelJlUURuVmJzclhIK1l2Wi9aZVJ2YWdGME1oTkxBM1VNK0cwdHRY?=
 =?utf-8?B?d3V0SUUrQWNPalFWV2IvNWN2aDRmSlcrMktiUHAyKys4UENyc1E4bWlaQW9K?=
 =?utf-8?B?TVR5TE1HdFFvVzJ3clV4ZGhjcWYzNFBZL3pxblVKS0JQbTFmRkhuZmJUSDZl?=
 =?utf-8?B?OWlSZ3ptZWh0eGg1Y09nKyt3Y2pZdE5yMm5XQ280NGxXSERDdW5WZXpnZ0J4?=
 =?utf-8?B?MGlKejhJZXB3R1ozUkxERzFzaEx5VjdUeWhNc3JuRGI3dW9HdVFUM0hpQmRX?=
 =?utf-8?B?Y1k0aDNpTUNxRmRYUHRrZGlMakI0dDlJYk11UXBSc0JTUHBtbjN2ZndyZCs2?=
 =?utf-8?B?VFdieTg2bWRTZHlzOHFub1RzS1lnYy82YlVhcVZQempHeC9BTCtONGtscjhw?=
 =?utf-8?B?K3NjUllxTFoycTJaWkJUVWYyQnFNZjlZMUsrOE9WZlFxNm9aV1F1ME9JbUlF?=
 =?utf-8?B?R2lHTUVSTFlNdVpDSXVoT2x4UnU3RVVCZUc1S0t1MVQ4cTV0ejQ0SktmUTNo?=
 =?utf-8?B?alRWU3c4SU1VQVhlbDVUMTNwM2JiZVZVQS9WaU9nbHNtdDdZQ0VyclcyUXNr?=
 =?utf-8?B?OWZlOTZlRjExbHA0aXd4cDNsZ0F0Z2piWURRdEJNdjBNNklpMVlSeWVGRFlV?=
 =?utf-8?B?RS9VTWZua3ZwNTIwUzRnL2hJdUJuUWhLNnVKRTlTWUhDWXp2Rkp1eHFtOE82?=
 =?utf-8?B?TVJBWGhacTdCeFBRNlE3cTgza0tETDRKMkNhNGRKbDlGaWFJTlpFUHk0Y3lD?=
 =?utf-8?B?MjByaE5XL1RRZkl1Z0FJU01JK3BpQkMrWk5mMDFjakhVNmQramJNaERCZm9V?=
 =?utf-8?B?d0daZno3OHQydThqU3NYaW5vUEV0S3gzL3g4NWR0OGlJOFUvK1lkUmFHV2Fw?=
 =?utf-8?B?ZXM5dnFIT2tQYjZmVjIzUmhCVlhVTXA3M3BtMlBFS3pJMHM5VWZhNlhIeW5u?=
 =?utf-8?B?T3B3aWVWeXF3WEZNbG9DSllvN3h5MnFJNDlQZlhQbEQ0NSt5QXM3ZHBUS2p2?=
 =?utf-8?B?RkZ6ZWRSTnVBV0xIMmkxUk5pOHpxSmx0VXlLZitBR0pCUVpUbFRISS82ZHRE?=
 =?utf-8?B?em5xZzdad3JvbG1tNjBtNzdydE04RlZaS1p1dXczb0hPT1RHdmcrZXNUb1gz?=
 =?utf-8?Q?ItA9dKjyrrQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJ5Q3FDdlpQSUpITTl4NHZ2MkJ6RnM3Q3Vhck13WjV0WFV3ZUZnSWs0SERY?=
 =?utf-8?B?d08xYm1iZUs3WnNqYmdHRGJVd284VDhwOUloWUp1cjB2S2ZxcjBOci9BemlQ?=
 =?utf-8?B?RnFGRGthWW1jb0h6MERmNXhUaTJaQ3RqTG1qTC9VRnY3d0FpSnJCTzFpN1F6?=
 =?utf-8?B?RktCRWQ1bUl2SlJ2R3IycWJ6cVRCS1VtMVlWM1dPdVhVSXhZTThlRGtJdjhR?=
 =?utf-8?B?R2FxVnVIaFRqVEtCYXNvZEkzdHR2Z2plNGF3eDdxWXBQV0E4b1F2KzdFdTF1?=
 =?utf-8?B?d0IvMnFoeUYzMlI2R2ZCYlpEc2lCK0tHYUxRZlF2UEo0aGpGK2RuWUNPUG5n?=
 =?utf-8?B?bkZkZkVYUUc3Y1E3Wm1QMXBTSGJwVVJiRE1qTkJiUzNYcDJzMURMT1hjbys1?=
 =?utf-8?B?eEcvMTRPZUJ3NlhKUWtINnlkaThzWFl2V2VveFVDRzAzOWFwcmFaVGJxbWZm?=
 =?utf-8?B?VE93ZWkrZGczSTFOcldCTExWNVRuQjZrWEZucHozOHhxem1sZmpxVEpBYUlm?=
 =?utf-8?B?WUtxZGZOS0hjbW1qOGtCYmR2MUZCdXM5WmpjVG5yZTBRTjRNdmFhdlc2dTJF?=
 =?utf-8?B?L2JXSGtnSnFnN053RThmSCtQdEZhUEUwVzhhQkFaYnRjbjFBL2huYTRjQTZB?=
 =?utf-8?B?eWJ2VVBnc2U1c2VvT0ErSDZ1Wkd3RU9oMnJaZE15K1ZTRTdvK2tMV2pjUXhu?=
 =?utf-8?B?cU5zbDFYSUZsZ281bjNGQUcvR2xNWTczeC9paWlSWnBzUXF1cnBKZmcyU255?=
 =?utf-8?B?SlJYWHUrNzBKaERvdkJhMy8zTTF5UUhEOCtpSzNYeWVRQzRGcGxwRUJrREVZ?=
 =?utf-8?B?YlZmcW9sOW1sNlR1RWk5K0tWcTVXMUNRYkNhVUVGYnBvV3dKZ2R5NUlmWTMz?=
 =?utf-8?B?bncrMC9rdi94UnhqOTNUKzRHOXF5RnBBVklOSFJoWkY0ODlnbFUwNGx1UlNB?=
 =?utf-8?B?MDlYRlZLcnk2d2lSN01NYUVkMEF6NDcrSkNiSHV4UC9kWGJwL3dJb3NvT3R4?=
 =?utf-8?B?ckhRckhJOHphSGEwaHNvZFlKWnZPb0N2eUdaQ2JDQVZQU2ZQdDdVS1pXZ3Fh?=
 =?utf-8?B?ZExVaFJPMDhGS3hON3BTQUtDZVVwY1hpdkorajJQT2hGcFBVT3pxQVh3cEND?=
 =?utf-8?B?dHJ1bEhGeGhpdWxOUHplcm5sZzZuWmdGVFRPeUVUR2g5SjVlbmJhUWk1dWxr?=
 =?utf-8?B?M2tZWWt4Qkg0VlllT2c0MTduVm5CNEltSndrKzVVTUVETCtCQ1VRdjBkclBq?=
 =?utf-8?B?K2NpYXBwTStrbCtveUVBQkZIZ0dqQUgwbUg0SFhkblhQSWZSMGpkMFphaHNW?=
 =?utf-8?B?SndOaDFYYnkvK0NMbXNCQmNHcUJBZWt0VU9QZnhZdmUrSXJDN0VOMjA2NldL?=
 =?utf-8?B?aDVtRVdWOURoZlBQbEMzOFRMNy9Sbit5S0lJVGpOVnBGSVVBemswbWV6TU5U?=
 =?utf-8?B?Mk9LM2FtYnlyVGswTE14bmpOSEdVTDVqbzMzZjBXVXZpNm8zTml4djNxekdl?=
 =?utf-8?B?aTZIZ0VmVGVSbDF0Wjl0MDN2ZS9NUmxmNDJsNkRObDVKSjl1SU1wWnpDOUFI?=
 =?utf-8?B?VW00bEZjS2xkazVCQ25tcWxLWW9TSjRPcFJSNEtBOUFWTDlGV0dNK2I4YzFM?=
 =?utf-8?B?R2c1TGpxalJXaEFYcTExZUhSc25CTXE2YS9wSGQxWU1XWWRNU3JGZm9leEVB?=
 =?utf-8?B?amNtU0I1bm5wSVFCdE8rQlJPWldkMjVDUHlKblpKMzFQVkRCZzN6Ump3T0d3?=
 =?utf-8?B?dStKVkxWRTNla09aczdaWExsSUFvdDVMS2ozWXR0dUxXbUZCbmIvUFl1cWR2?=
 =?utf-8?B?T0FKUFhidkFuT0xSRGRCek94aTkwbm8xWFFQRTNOMEdGUXorUDBBdkg0eElS?=
 =?utf-8?B?V2dPdWY4R211N0wzbkdhRCsyTCtqTTJDeENJUWczUGV4NHY5MmdET3MzSkxn?=
 =?utf-8?B?STltdGFScGMvMURtaG1vZDZPRW92aUVJRXovSmpoZjg3Qk5aTXArSXNNMDc5?=
 =?utf-8?B?bEh6aGhBZldVWDVvK00zQ0phL0ZPU1VIZHlhbjVHYjlrMy82dnUwOGtKSGhO?=
 =?utf-8?B?TUVZZTBOcHl1b3U1Vk4xMUd2REt4bVZXRmttRUVpb2J1MkxBQlJKRC9xY21F?=
 =?utf-8?Q?Spi271KeSLNlZGMs/9voWpSbl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79afb3b-be48-412b-3a67-08dd87e5d648
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:52:17.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSTDL9N2raRZ5FLw5tytpuw4lF4afRgSWth6MoDzNsBU18qEk5DI/bIkNbdbVDzOX11OOq/AnH/4rCeF+H2qsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782
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


On 30/04/2025 14:35, Christian König wrote:
> On 4/30/25 11:28, Sharma, Shashank wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>
>> Hello Dan,
>>
>> --------------------------------------------------------------------------------
>> *From:* Dan Carpenter
>> *Sent:* Wednesday, April 30, 2025 10:05 AM
>> *To:* Deucher, Alexander
>> *Cc:* Koenig, Christian; David Airlie; Simona Vetter; Sharma, Shashank; Khatri,
>> Sunil; Yadav, Arvind; Paneer Selvam, Arunpravin; amd-gfx@lists.freedesktop.org;
>> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-
>> janitors@vger.kernel.org
>> *Subject:* [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
>>
>> The "ticket" pointer points to in the middle of the &exec struct so it
>> can't be NULL.  Remove the check.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/
>> amdgpu/amdgpu_userq.c
>> index b0e8098a3988..7505d920fb3d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> @@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
>>                            clear = false;
>>                            unlock = true;
>>                    /* The caller is already holding the reservation lock */
>> -               } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
>> +               } else if (dma_resv_locking_ctx(resv) == ticket) {
>>
>> Its a Nack for me, There are a few situations (particularly during the first
>> launch of the desktop, and also when eviction fence and new queue creation are
>> working in parallel) where this ticket can be NULL, we observed it during the
>> stress validation and hence added this check,
> What that maybe before the code was moved around?
>
> As far as I can see the ticket can't be NULL any more.

Yes, that was before we sync'ed the locks between the two threads and 
moved the code. The NULL check was probably a leftover from the code 
carried forward.

- Shashank

> Regards,
> Christian.
>
>
>> Regards,
>> Shashank
>>
>>
>>                            clear = false;
>>                            unlock = false;
>>                    /* Somebody else is using the BO right now */
>> --
>> 2.47.2
>>
