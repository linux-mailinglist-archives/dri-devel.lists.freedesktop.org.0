Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2972B01D4E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF1410E399;
	Fri, 11 Jul 2025 13:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5N2EjcOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3510EA54;
 Fri, 11 Jul 2025 13:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbF+gqHowFWvlOJFIo8OgRPCafa0VQskgQfMGV4WldETXyMHFOt9UP65ptOBMFA670Cki9I/JFpbOqESws/UwakrAZHVrzQTMtRm+ierI7JdvBeviMnPwmLM2sTnE6hfoancoQ7UlgllxBU1FHQpzjh/vl8w/9YEU3V5H7UuJ5DyvG7cT/M7ZJTTK8yTbDC2t4ZKv6TCg2SmmYQw83eIlAufDuXdJBPKn9DdWWkDsnLEpziwK26EKQ7k1GhWgbyNCDl7XF2KqnnrnU+GoD1lpHwvKJsrLKqdR89sEpUBxeLDhE+A8SeQiika9DxQVi1L84ajfKbsOnC+hLYL0ux15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w06V+hYEhib0Iu85HX8hF/JZSLVs1M2Z1jt7m1l/rwE=;
 b=uElhtnsWLf1UOHvjzekSsevNnYv8uacvF8IvsVbwBLK3koS2hgRqKiv0ptErNzdaXYUe3m/+AAn5XLq24KprQtezGjxxZgmCliLWbAQ2fCUr1A5FLN4jg7kKwm32wuXojMf0fbyfmhaqH2pZm7I3aFAQ7asOzgtE4qMkpmsKBHjeJPEffhp1DPdOq81rh9PhMeiNZROF/jQ+9BLn7zTPJVvP2dMSYnPY43pH6uz30bn3/dCZzNjqmME8Dlf6+k5Z59ap4Pci10hMqpF4xPC/Q/DIAdCzN7+hsLdRmwb9E1/ExKa3JSdS/2ZW5QpWgIFNmpqpnxePyZXWT0FrI62zNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w06V+hYEhib0Iu85HX8hF/JZSLVs1M2Z1jt7m1l/rwE=;
 b=5N2EjcORlIciNgp6ogcuRanDKDb+KLIyesVpWly1i37UM/rFFnzkcgW6ZNeGNKzUECqk2YlQ6MbrKVoUQipWTD8rqPOVT51TQXNkw0k0nqsIIsAEym8zrGpHI5d25jlVCIcHR/dmOAG18eU2s2s9eV/swInkuqt5G6PgUuUipig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPF49208036B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 13:24:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 13:24:05 +0000
Message-ID: <398f044d-7716-49aa-bfa1-cdfd3ce188bf@amd.com>
Date: Fri, 11 Jul 2025 15:24:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
To: phasta@kernel.org, "cao, lin" <lin.cao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250710063633.498633-1-lincao12@amd.com>
 <4ebbdcf1-6123-4076-920d-bf6bcd292fac@amd.com>
 <PH0PR12MB5497DBF0FD0A626EF5004800F548A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <d3999026bba8ace350c6e226881b98f901fa474b.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d3999026bba8ace350c6e226881b98f901fa474b.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPF49208036B:EE_
X-MS-Office365-Filtering-Correlation-Id: b8af1da3-2f39-48b7-d80a-08ddc07e358f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUprZi91WVlEbENoeE9CenVobHJwRUFYSGpabTM3MDZPV3dDUDRPWjR5anFW?=
 =?utf-8?B?MHE4VlNta3pSVmFwOGtaVnpHNk1KeHJBWlNpdHBBMUtTR1J1OGdnZ3FOaGJC?=
 =?utf-8?B?VzQ1OUUySUN5SEhXTmVMcGFUL1o2RS85SmZXYlU1czd0UDdrdlhTMW5BNW53?=
 =?utf-8?B?V0lveGpSN05EWU93bjEvMnNJQ2NER0E5VDdTT0NnSXlHVWRvOWl6SjZobWRI?=
 =?utf-8?B?R0YvNUpYRTV4UWJ0bmhNMXFMbjRwd05IZDZWdVNLWXdRVUk4Qmd3VjRUMVRR?=
 =?utf-8?B?d0lqUEl3YnlWWm5xT3NZZVJ3T3NnNGIwOXJMWTdVU0IvQkovSEZWSHc1MnVB?=
 =?utf-8?B?TWZTZHpXd2JjMXI5YXpYZ2VySGxXVDdFRmpGSWpqdm83RzhIaFVYaTMxOTdu?=
 =?utf-8?B?ZTBOTEdzR29IUk1RczFpMFQzMk9ybkhVaUNiaGpVRzJ4S2kxb0dySWlPK2Ix?=
 =?utf-8?B?MFdyUjMvSklQRFVsUUttNE9Kd3JuY3JBems0TThpZDRHbklrVE5tcG5DMVZ1?=
 =?utf-8?B?M2l1SUEwM0RwVjlTR25PbUhBdkxsd043b2VqQUxpeUE3MmIxdi9LMXZ0NUN1?=
 =?utf-8?B?SUF3bVdCVGZhWXhGbDEvOGVjVE1QUVlkYWpFd1Y5VHExSEo4SzFWc05nODBW?=
 =?utf-8?B?eElWQm0xMEhQSzJxM0JIamFnWDZvdmJyckJWcThHb1NwcXJIR3lUbVZ5U2VT?=
 =?utf-8?B?dGVpaXd1VllodWpVbU1CSk13S1FaWlRYbUVtVmppd0pzeU9XNmNVU3ByOVRX?=
 =?utf-8?B?NHpmZXNHZHN1TXR0K2d2bnNBVFltYUxEM3VYNGlGZDV1MlFrbU9tUkc0aW1w?=
 =?utf-8?B?aGJKWlc0dXVjM3NvUzVqd3RReE1TcURuYjBpVG12L295RUJYQ0pRSHZCVDcr?=
 =?utf-8?B?NnJwYXJxSmRObUViVkZYS3BuNTNheTdrT21aVmxwMmRRRS8yT0VUWkpNOUtE?=
 =?utf-8?B?N3hvYnNpV2NhblFPQU5OVDlZYVZzaThXN0ZacUsvRy9oNnRPc296c2hNYWVG?=
 =?utf-8?B?SFh1ZVpIRjU2VGtXZ2VjdDErZEFlQU8rM1JXMDhJQ3dtSWJQb0o5U2grTmlS?=
 =?utf-8?B?K1hvWlBleUpabXArKzdGUTkvN2lRVkZPblNtZEFpM0QybnoxSDl6cm4zQXN3?=
 =?utf-8?B?aS8yMEp6c2ZnbjJYeUFES1JiYzRpTnNFU3JaZVA5WmR5SUQ3QkNLQlpRUnA0?=
 =?utf-8?B?WHpXSlkxbHBvQzVlV3ZzMnoxN1R4eUJFVVd1Sjl4ODllTjl3UDEvUEVhTDdZ?=
 =?utf-8?B?NHlBM1FqbmNiaitxcDVvaXp4ZUdpYXUwaWVmanVscDVIZGh1OVluMVRBN09h?=
 =?utf-8?B?NXdlN2xXaXdxSWYzcllVdUhOb0g2M0h0ZktWSEpPTlNXTnVxOUt0eGR4L2pL?=
 =?utf-8?B?ZHd3NXhaUTBHdnFlWlZlbVlFL3haUTlsbnJvYTBUUHhKM0gxL3NET2MrSTVI?=
 =?utf-8?B?MWg1bUdVU2t5RUd5NmxYZTRNa1dZblROSnd3bVRoZkxzUFZNeWpYZHN4dlBE?=
 =?utf-8?B?cnhCUjlLUTJ2RXhJbFhkeUxRaFdJT2M5dXFCTGpScUdtME9KTmtTQnlsUzJT?=
 =?utf-8?B?UEdUbVF2a0lTNktJODI4UUhjbVNnNU9FeWdvRVBFWGJrcTdMZXZPVTNLbnFp?=
 =?utf-8?B?blY5Y2ZVZEs4WnAxaExTbGJ0TloreFlUS0dwODE0ZG9Kdkp3c3JWY0JreHdU?=
 =?utf-8?B?clNGdVMwVk5sZ2QvdlZxa2tNeWJ4NUZ1ZFdHeVRTZkxXRlFZTTVNWWVTTmtI?=
 =?utf-8?B?bjBoT2M4d1JFR2N5TC9kNjljNXlHSndYZExGMjBybVhWVW1RSVhPR0tuTXJF?=
 =?utf-8?B?UHdodzhKT0Q0b3ZoVTM3Qy9uTU9FV2N1dzdqelBNbmdHOStBYWZ3NDZJamlq?=
 =?utf-8?B?WEhJSmVjVjZFN1dqV1hMU0l6U3ZzWnR2cWllQ09veUlra2FoNVErUDd6NUNX?=
 =?utf-8?Q?N9k6l0Kn75A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnBxRDYxdmxIdURqbWFhbXJQZGRXZzdyUk1WOGlHYTNZYWJSdXpUaEVnWnJN?=
 =?utf-8?B?emNXczRNMDRJdlQ1dVllOXlvVlZra25UVWxDVXVNeXc1SzBUM0w0OVNtenhH?=
 =?utf-8?B?QlVCb0tCb242aVVPdU9taUFuUHM2dnJXSzF1dDNuS0xTTnBTLytTTXYwMGdj?=
 =?utf-8?B?VDhmd2dubGw4eFpaRVZEZTNQY3g4V1FzZXVpSitrUmNVaG04M1NTY1B3UnVu?=
 =?utf-8?B?Y2lkN1l2aldqbUhnaG55WlhhTm4xSFZ1QXloM0FYeGpqeGNwRlFhTDNuckFo?=
 =?utf-8?B?VERBMWlkaVkxbzYwS0xKWFo2LzZKTStSMXJIOW8zR256cnpXc0xyUGlNOTFp?=
 =?utf-8?B?MWUya0pKRU5aRTEvVU40elJEUW9tU1ZoK1REUDBnQTloUEpzODh6TDl2Rkt1?=
 =?utf-8?B?SDRQQVlpRnJGYmFYYy9BalVDeU5HcjVsZE9maVBYVDVXa2xRbDByNk9PV3dT?=
 =?utf-8?B?M0daQU1mSjIyZ01hdGVHY3ZGOUl5ajA4UTJuKzJNUHdEVFdKQ25kdVlxemt3?=
 =?utf-8?B?eit4RzUybGRTYkltMllDcDFsbU5haXhBS3h0RDQyMkJzTThXRkJsZUhiYnVu?=
 =?utf-8?B?TEQ1NVk5U1RXdzE2aHdhdG4zVDZyd3BPZjdUWGxGUm5WRmxBNGpsa1N1L0dv?=
 =?utf-8?B?Qjh4N3lsb3JrRjNsVC9JZ29kemF0ZWs4dkRlU1laK0p0WDJFMzg2TG90RGM1?=
 =?utf-8?B?c3lUQkx2bFA5RmNuSmJ0bEE0b09KL1h0T0VtQWswRUdhbDlFNEEwTlhUdUtq?=
 =?utf-8?B?OWp2OFBXWUZUV2p3TFlOUU4rTVZMMUZTTzZTTHdPdVJnL21VVm5qQllmYWRn?=
 =?utf-8?B?TDVpYmxXZEg4V0Zod3FQRUFnWmdBbUt4YXBXQkJNNWVNekROU3o2ak9aU2RT?=
 =?utf-8?B?S0FtZlQwcDNqWHIrRS9XUndvT1JrOGxvSjZYb2Z3UThrck9uWks1N0dTWTAv?=
 =?utf-8?B?V1I0RSsweWFSZFZIb1NkWTdEY1k5cTA4Ky9CZkdPS3gvbUNuZW1DU3RYT1pE?=
 =?utf-8?B?aThMeTR1M1pWaXdhMHZJZEdXQWhtaTZ0dWY4bmxCUzdoczVBMUkveFljYitK?=
 =?utf-8?B?K0RvOUVSTkhxOE5VN3BxNFJNaTVHSmp4ZmQ4NTJKdyt4YmU1WTNSU0Q2T3dN?=
 =?utf-8?B?VDJ1b2NXTmIwMWpxNmgzVzNnSldodGZJYmFCU0VaRityQ1VEdHVIWG5RK3ZT?=
 =?utf-8?B?ajJmalA2Y1czaHl4WWtQMzFjeUNZbmtITWFjV1V4WEZQaU1YZEF0WUtKeDJS?=
 =?utf-8?B?MDI0cGI1TFRtVHFDaE53c25HNWtpdzN2bXZISFBlaU12K25CdVRCYWwrTFFW?=
 =?utf-8?B?Y2hLSEhUNGRUc3pBSTgvWEU3WlZRUUU3SlJVaTZJWFdkYm5uYkFtV0tNYzdr?=
 =?utf-8?B?TmlOUU42aDJ0NERHOThkeGNKMmZhY21DZ20yYlhOMG5KTGN0M2NhNVRxYWNq?=
 =?utf-8?B?K0tyejNlRzBlc3laanBrZmtGRFZNZEJhY2tUbVpzMzljR1lORDh4enBSUi9I?=
 =?utf-8?B?Z3MwWmZJb0hqWHhkZHFzck1RYmw4Q1VON2R4cmhpMWNBdjBNTFB4Um9venk3?=
 =?utf-8?B?Sy9ZTS9nQi9wNzgwUG9mQmxEcDIyMEVDNXo4aVdwTlFORFFkQVJOeXZ2eE1F?=
 =?utf-8?B?VUMvSzJqUGFDTmVwZWlkVlRCaWppYmhmWDR3ZitTVnEycnNkYndGSGhCS21s?=
 =?utf-8?B?RVVwc244emY5OGNBVDM2VXZQd2lPZXMvajRacGlGUWpFcHlabWJUL3lZQ2Nm?=
 =?utf-8?B?MlNCc0FJaFYvY2U5d1JiaDBRRjdReVZIWFdRWmNyODJHOHQvT3lGV3dkTWwy?=
 =?utf-8?B?K3dvaVcrVFQyRk5jRmVmZ29UNWRJa3V5R1NIMEZsNGUrWWJxQ1hoNmF6TDBj?=
 =?utf-8?B?UzhYYmM0SmFoY2hEZTM0M2l4QWZKa2k4WDlZby95QytyUUN0WWNyTE53RWRC?=
 =?utf-8?B?WWYzbWpJQjRJSkFlMkhRbUpwcXlFTUhiQU1MY3B6M3pLOTc2QUtuakVScFVV?=
 =?utf-8?B?SUpzL2pvZEYrR0ZBcjdrWDdlSmFwK1VRckMzSjBwb2tmREw4a1Q4YzNZZlNY?=
 =?utf-8?B?WXhQRXllUFp5OGpWeUtDeGgxWkF6VVBCREFTaTczTUk4VVpwM0VUbjNLUklB?=
 =?utf-8?Q?JbIT3Cgpv/PBG9QLxKZsvtCGm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8af1da3-2f39-48b7-d80a-08ddc07e358f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 13:24:05.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmgejWou5coW6KX3YokEI1r4HLy4BicFYvAFy5FIaCbKeC90GUbO+2uOtPDXw/SC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF49208036B
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

On 11.07.25 15:13, Philipp Stanner wrote:
> On Thu, 2025-07-10 at 08:33 +0000, cao, lin wrote:
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>
>>
>> Hi Christian,
>>
>>
>> Thanks for your suggestion, I modified the patch as:
> 
> Looks promising. You'll send a v2 I guess :)

Well I was just about to reply that a proper v2 should be send out and not just the change fragment :)

So Lin please send a properly formated v2 patch.

Regards,
Christian.

> 
> P.
> 
>>
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index e671aa241720..66f2a43c58fd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -177,6 +177,7 @@ static void
>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>     struct drm_sched_job *job = container_of(wrk, typeof(*job),
>> work);
>>  
>>     drm_sched_fence_scheduled(job->s_fence, NULL);
>> +   drm_sched_wakeup(job->sched);
>>     drm_sched_fence_finished(job->s_fence, -ESRCH);
>>     WARN_ON(job->s_fence->parent);
>>     job->sched->ops->free_job(job);
>> --
>>
>>
>> Thanks,
>> Lin
>>
>>
>>
>>
>>
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Thursday, July 10, 2025 15:52
>> To: cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org
>> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
>> <amd-gfx@lists.freedesktop.org>
>> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
>> <Emily.Deng@amd.com>; Matthew Brost <matthew.brost@intel.com>; Danilo
>> Krummrich <dakr@kernel.org>; Philipp Stanner <phasta@kernel.org>
>> Subject: Re: [PATCH] drm/scheduler: Fix sched hang when killing app
>> with dependent jobs
>>
>>
>> First of all you need to CC the scheduler maintainers, try to use the
>> get_maintainer.pl script. Adding them on CC.
>>
>> On 10.07.25 08:36, Lin.Cao wrote:
>>> When Application A submits jobs (a1, a2, a3) and application B
>>> submits
>>> job b1 with a dependency on a2's scheduler fence, killing
>>> application A
>>> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
>>> force
>>> signal all jobs sequentially. However, due to missing work_run_job
>>> or
>>> work_free_job in entity_kill_job_work(), the scheduler enters sleep
>>> state, causing application B hang.
>>
>> Ah! Because of optimizing the dependency when submitting to the same
>> scheduler in drm_sched_entity_add_dependency_cb().
>>
>> Yeah that suddenly starts to make sense.
>>
>>> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
>>> scheduler sleep and subsequent application hangs.
>>>
>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index e671aa241720..a22b0f65558a 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -180,6 +180,7 @@ static void
>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>         drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>         WARN_ON(job->s_fence->parent);
>>>         job->sched->ops->free_job(job);
>>> +     drm_sched_wakeup(job->sched);
>>
>> That should probably be after drm_sched_fence_scheduled().
>>
>> Alternatively we could also drop the optimization in
>> drm_sched_entity_add_dependency_cb(), scheduling the work item again
>> has only minimal overhead.
>>
>> Apart from that looks good to me.
>>
>> Regards,
>> Christian.
>>
>>>   }
>>>  
>>>   /* Signal the scheduler finished fence when the entity in
>>> question is killed. */
>>
> 

