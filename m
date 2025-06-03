Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E01ACCB43
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 18:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A9810E091;
	Tue,  3 Jun 2025 16:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aCGKgweg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AEA10E091;
 Tue,  3 Jun 2025 16:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epEltJh9bG3E+Yu8eeZaVKXRILL2upMo4Y61bMeHV0fL5aO6HHEvxoe3oXT6K92a5jNcWxN1AhE3duhxdQDLzEGBH6FgzScgNC3YztVRZjNNVTEk9CQYfrldmrQJXVmFR+0VT+G62S9/eDPK8ZppW+X/xYMhOIaNNZxzsYp4bUQSlAiUkFPZ1lfDa8FxPX/qFE8TI6c2fLps0fglW+8F314q6ws1/m9dfohjSvKQPIKneSHRjBmH4XL6OB0S3eEE1mJYo1s0xfschWs+rni7JOfC5t1trPWMMujVjvFSyWIjyW3EOONsuRUU1xyyxc6ael4fux4gHfACz9NFaSc4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHB39Ku0IteC3OVl721eJM8PLeJOy60YPB5YTJ6hBdY=;
 b=XYigb/QqtURvJCu6NKhNEq67dV7kV7q02HMc7O7JZbZXWrLesPDEtM5ye6ZmSfVyLQMhreZZ73tqJHGgU7Rw/eTLPZnw4fRQDv6HalsAjp1fsaoV/sho9aljjf3tkTDxuW6/0huO5jYH4bdshm0wYdD5lmvYN18ZzO0y1gJDDaurCvNjSsfhiA4E02EaOkvWh56yVGduBoPFjI4ZBkhOTIGeBXb4doQXm98f0ugE1EEm+v0DkZvNyYauMszke+prG47urNy4G58Y/Vr/7AFWjXmCRWMVhxhly+6EYEbhTNayLY+AIkscEEcfmlf41tROLkKxJ4uYu2UDdyaiute5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHB39Ku0IteC3OVl721eJM8PLeJOy60YPB5YTJ6hBdY=;
 b=aCGKgwegjJJQa77z5KqXa4dl5Rug6d90uzR9Z/3X7INM5Of5W8YqUOucUty7Eq+6Lj5EW1JcWGkwrFx3UqNkF2M3flmVSYO7Z1UvgPoqK6UdoxB42UnWW1gxmzGHGGHrgU59Rwh4md/wu2nJU4wfEreSrDfVzpiDnat9uZ1EmnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6546.namprd12.prod.outlook.com (2603:10b6:208:38d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 16:27:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 16:27:25 +0000
Message-ID: <d5bbe511-97ab-42aa-97c3-e669849ebc12@amd.com>
Date: Tue, 3 Jun 2025 18:27:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
 <e969d68a-aff3-4560-be28-de17498d7b6e@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e969d68a-aff3-4560-be28-de17498d7b6e@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:208:d4::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cb523a-446a-4c56-a132-08dda2bb8668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1ppbkRlYXY1N0pXVjZ5ODROM3VPOTF3KzNLUktOL2tKRXNGT2pWQ1g4RjFD?=
 =?utf-8?B?eFYyRWFKODlhYkpKak1vbTE0SWpRajVtVlpNTFloR1lqS2NuakZZK0hnTDha?=
 =?utf-8?B?Y2UyeGtqeHRHUGVvUUp1TUFHUE1nbjc1MXBaQ0tseDJWV0h2dUhZUUNkOFRF?=
 =?utf-8?B?TEJ4WWZPcERaNE9sNnIxREJTb2RaUVZtWnFhb3gyNHVZb0xKTU1wS1M0VXAr?=
 =?utf-8?B?czlLdUJaZDZjS0M0UGRJWHNqMlVjRUs3ZkY5RThjUS95aWVBcStVNjIzWVdO?=
 =?utf-8?B?UENBTGY4YlZHdlhQYjEyL0RkVHoyTjBsaitxMVpIM3lQQWxEYnJUR0VjekZV?=
 =?utf-8?B?NGNva2pjV2Myb0hBS1FZRE9aWjRXemROZXNXbytNM2dVZ1B0dW5aNFB3UHRB?=
 =?utf-8?B?VXkyVVpLdGdOVTRSZmVNNnZtL041TFJOQTlvN3Z2OXJNeXVHb2ttVE1TT1Z6?=
 =?utf-8?B?OURQVkw3WnNzQW1rMjE2REg5aXdBZGFNK2s2elBFVkdqdDRXS0pRMVZkUWtN?=
 =?utf-8?B?RkxXNy9HUDU2Mk1FZHJEN3MybllLVjRhNHJzdDdjWUp1dmNQTjg3S0lDaEFF?=
 =?utf-8?B?RVhNOERjQ0RFK0hWZDhkR2hxMU5pVFIyMUlYeStoWWNaLzhTQzBCOFJvZkYv?=
 =?utf-8?B?MUowOUpNenNNMHpFZDJxekVUY3V4RGZZNDFWN3d0TVdhNVB0aXZJN0xDbGhw?=
 =?utf-8?B?SjFobnM1bnZCZ2hjSUFmaGJ2ZVdHNldtS3lNL3ZueUVjaHFjaUl4WnA5SFJ2?=
 =?utf-8?B?VE5PSlJ3eUZqOEk1U0hXcVQramIwTXhpUzdOekt1S1JqRUI1aFF0MlJzSlZj?=
 =?utf-8?B?WnI5NHYxeStQamhEWWE5Yi9zeWRkZStsWUlSK1V4THdIZ0hkdnlPbmZmQnlt?=
 =?utf-8?B?ckZqcGJnYXJUMWlVanVNTkZYcDcrVG82YTdyd2RUQkh6WEpLdDcvRnhXcFJy?=
 =?utf-8?B?dmNpK0FpNFNmWEFrWmVNSVA1WkVqTWlJaGdXZ1BTdTdpdmlQQ1ZueHFYeHRM?=
 =?utf-8?B?b3NyWE1ybG1RNFdBWGtoZTJGYTN0MCtFZmhTcjhZREtLYWFVUWx6dmdCbndt?=
 =?utf-8?B?VzA0R21VR1o2QVhrYktGM01wOUI4b21waDZNaktyMlQvdlRpVS9rRGY3YkE3?=
 =?utf-8?B?ODQwSFRLTmYrMVJtRUNMd0ZlbWJ0clc2YUtMZVJBcFBPMi9DdklZcHEyT1dy?=
 =?utf-8?B?am9XODRLaHhyVjZ2ajZxVHZZN2hOL0k5c0VnZkp0UW5NTUgwaVBWVGdlZ0F6?=
 =?utf-8?B?bHM2SEl6OEJ0UFBLcmI3YlZLMzFiaVRZdFJVZDV1czNyWnBqbzAzSGxWd3ZQ?=
 =?utf-8?B?ZmV6Z1ozc1g2UEpMZitTanFoYThBb0ZHREYwcU1RbXg2STlQbkJjSFZWSmxu?=
 =?utf-8?B?Y2lXRitVK2hQU3ZOcVZIUUQvNHd6ajFaeHlWZXY1TGsvZG1OMW1ldDdqOEJ4?=
 =?utf-8?B?VE81aXJEeU5Ucit3Z1JWV20ycXNZeFF6K0ZJaDdEcS8rSGhjVE5DUzUyNTNh?=
 =?utf-8?B?WS9IYlVOMzdHZWhYY2F2VGp6a2M0bjNzSnpJb2cyUUJqVjVrRjFXUi9XdWh0?=
 =?utf-8?B?SGFIQ1loNmhMQ2dVSW5hUjZxb1FhaWxuVkxQUnpoNkoxNUZYWGR1SHhVYVhV?=
 =?utf-8?B?eVA5Z08rZmlKLzMzTDVjOWN1L2J3cEdUZ3hjVUxiTUN2Zm9iWlFLMG9zSEQx?=
 =?utf-8?B?TDkrSlZNRWljY0dIYXhNMzc3NUlJRzUrMjJFVG5acVZGMlo4WmFjM3Z2Q0N2?=
 =?utf-8?B?a3dQczIweXhhQk9ZKzdlejdLbHlVeERKbmtoUnZMQlJqWDh5V29KZTIzQ2lP?=
 =?utf-8?B?VU9NNGVNcmMxMWJUMFY1TEI1c3JBMkNEakQ2WTRsQUpSQitnekl1OXFYcWVZ?=
 =?utf-8?B?ZWozbjNWT3E0NHhZYjRFSEdleHRlNk42U0ZZbkVoTkRaWUs1WS9lTDZQM0V6?=
 =?utf-8?Q?3wXtrzc0y5I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk9za2hHV2NCWC9YV1pxNmJ3Znpoa0p2STN5OXhmRTFKRjdVWnBJR2ZMV0Zs?=
 =?utf-8?B?N1UvZlNNYmgrajJGYUtZaVkzN2czNSs5S3kxYWxHN3Q3bTY3QVBjM1VpMzVp?=
 =?utf-8?B?UnNzMXd2NlRJUThYbnE0NU9ZQzV2V25sb2wxc3hnTGVxLzdzUjZSOVpLUzZB?=
 =?utf-8?B?YzVRMHprc3paRTNBcFIrM1NUSzROdDVrK3dlL3hUdEw1RlJZd3ZMcEs5UnA0?=
 =?utf-8?B?eFo0K0pTZGZRMjZLNjlXMVRHRDV5YVNkT3RFZWFrMmpkZi9VR2hwVTdZK2NH?=
 =?utf-8?B?ZFFUZnlIdmxkN1pyTjlITThNWU51bUw4T2RlU3oxN3ZIZnkzNWJsOWp3Y0ZI?=
 =?utf-8?B?L0JwbGhnaHdocEVISnBNek5RV0JQTGR3UzRoajd2eStobGR1RVdhN0hma2lM?=
 =?utf-8?B?bzdSaDBFQjc3T1l3RXd4ejJ1VVRxVHFnU2NpbzJ4SjBtbFZ5MHpOWDRua0tD?=
 =?utf-8?B?d2JuNHdFbytOTUg1K2lDMlpMaG1hdEtOR2xCYmNXYW5HcUhkTFFFYmU4SzY5?=
 =?utf-8?B?bytDWXhLMDZpM1paUmZYZWJDUHBjS3BkVmVZUEdtTHFiTFd1dG5YUW9lZDBE?=
 =?utf-8?B?ZERNYnFXQks4dHROTHZ4eTc4Zm10YncvTGxwUVF1UVhqVlkvMTcrUGkxUnZ4?=
 =?utf-8?B?RFFLazZEZmRyZDRQeFU4RUZkSEZZVzI0VlZUalBzWEoyZldhdGhuOGhxNndi?=
 =?utf-8?B?dCtNcjUycFBYTVZBNDBvV1NzWWFueURQVExhdkdBME96TW5DRVB6VkZVdWtO?=
 =?utf-8?B?b1Z5UmxHTzdVaHd2NHNxNjRXT0xVMHJaOVo4ZjNabVBoRzA5emVTUDUvMGVP?=
 =?utf-8?B?NW9NVUpqS0VxeUU4dFc1WkhuMDcwWjBMN3JuL0JmaWlqa2NXSzlFeW1lSnh0?=
 =?utf-8?B?ZVRDNEtaWUhCSE9lYk1xOW1rNndOTTkzcFZpM1RMVDNiWVNsTlEzWmJLczZz?=
 =?utf-8?B?KzlTTU1KQWhmNHNBUGtRZk9PbG9BNmtINHBPUGl0QlRwOHNzQmdielNnekVp?=
 =?utf-8?B?TzMycHdIMWdab09BaU9mcmlOYThlenRCNHoySkRreTVWd1lmN2pqZytNT09p?=
 =?utf-8?B?OVhISWxSZ2NtQmZSanYzMlFNbHNLRnVtNWtZU1hlZmJiTzdpbm1QVE9HWnhq?=
 =?utf-8?B?K3Ntb25Rc0lNdFRKcmJMVkF3RHBYdEdBM3NVWFdaenZrS0Z1SmVTeHN4Wnlo?=
 =?utf-8?B?RlJPVU1wL2lpdXl6alozSnQ0T2tGWFF3NVBKRzFVNHBjelA1MVAxRDdJRzA1?=
 =?utf-8?B?SFBYWXJTaDEzM3hRM2p6SmpLMENzTE5qSkRGNm9vTVNJaThmZ09xWTIwbDNU?=
 =?utf-8?B?QmJ4OHBoRTBoUm5aUWlQTWVHRmtTbXZubU9wYncrb2lXbjRzNTFWeU50aDJ2?=
 =?utf-8?B?OUhpNmJ6WTMxV2ZvZ3A0OGVubWlkU3VFQnd5ZzkyU1NZQnFCQXhWcFBkRDE4?=
 =?utf-8?B?WDlHTk9FWWw5cWU2N3l0aWRqdGQ5eEduYTdvU3ArOWsxWEl1N3pMekoxWXA3?=
 =?utf-8?B?RU95UkV4MW9GK29ML0Y4QWJIOEtzam5SbFV0NklmMUJ0UzcraStvZk9yQ3dD?=
 =?utf-8?B?RHFJbEpJYlkvRHRGdi9ZWVRFNFM2c09DMkhRVW9aT3JNM1ZxRDd3L2dFbE5I?=
 =?utf-8?B?NU8rbEg5a0NOS3Vrd3Rma3JxeUhWc0pRUkZ5V0dIZlNqbGRwQ3JHdmJhdGYx?=
 =?utf-8?B?d0lBMEJWTlBMU0k3MW1iOWZDYlRjNEdFb0ZCSHlYdUR2THBQcjlmTFc4ZENu?=
 =?utf-8?B?dFErS2VWVjVTbFNURGJ2SE9DM1lmbldjYkJ4RzJHRWxYSVozTWEvb2VZaVNj?=
 =?utf-8?B?TkVOd0xubzJEbUQxbUNSMGM5RmNlSkRudDg0SHN3bkp1ZDdweUZEd3BaR3VJ?=
 =?utf-8?B?M1RncTJaMW53UGRJUGtPODlhbHZtcWpDMXVXY3UyU08xQkFPV3loSWVHNzZV?=
 =?utf-8?B?SFZuWEhzTDFvSXp1YTRLWXZkMXI3aXdkL1dBbGlCRjdOUEdBZ1ZvVU9oNlJE?=
 =?utf-8?B?a0JiWTdBemYrOGVjcE9BdThZN2Vvc3BpYXZzWWt6ODRDM1JIU2JQYUhBRE9z?=
 =?utf-8?B?aVp1NFpoeTdqSzV6MWRDODNwYzlrV3BneGxsd2NTck44SGpYQ3M1bVhCNDl1?=
 =?utf-8?Q?YUk557fvXWuckc/GTzAMoirtw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cb523a-446a-4c56-a132-08dda2bb8668
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 16:27:25.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSUPKHhvU88QR0F8FNHost0qP5zRt+cT+nJGPRDZU5Q/fWx8ziiRlid+g1WyVX21
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6546
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



On 6/3/25 17:00, Tvrtko Ursulin wrote:
> 
> On 03/06/2025 14:13, Maxime Ripard wrote:
>> Hi,
>>
>> On Mon, Jun 02, 2025 at 04:42:27PM +0200, Christian König wrote:
>>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>>> On 15/05/2025 14:15, Christian König wrote:
>>>>> Hey drm-misc maintainers,
>>>>>
>>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>>
>>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>>
>>>> Looks like the backmerge is still pending?
>>>
>>> Yes, @Maarten, @Maxime and @Thomas ping on this.
>>
>> It's done
> 
> Thanks Maxime!
> 
> Christian, I can merge 2-5 to take some load off you if you want?

Sure, go ahead.

Then I can call it a day for today :)

Cheers,
Christian.

> 
> Regards,
> 
> Tvrtko
> 

