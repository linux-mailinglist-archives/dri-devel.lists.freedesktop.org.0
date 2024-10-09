Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AF996DFA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4964510E754;
	Wed,  9 Oct 2024 14:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V2zu3ox6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1004E10E754
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyUH1jYyQJeGzQsxkQgWhTAIWZtb23jIPq13VULf/W2zoqRy1riO2gkexvHvgr0cFZFD+BFokC/slcZpC1wBuKbQkCJ8hZcPVfF6GW0iIOr0A6s/FgyWficdLJ16tvzVSy6nOlbKALk5CxjVNWj0J/Cae3xaWx1OtgGcgDzOrq89uWLeqOC2t0IP1otCoh0SvS/3QNo+jEg8PJIFFSTH+veYFpNpKyY2/X3gbPjeIsHP1xtkP+E0I3Pz7RGF4cCSkXew9QKawwJurFL+uT/H4j80/4OtHnHU5XzQ3ZzN40K2yRKNjt0Q9p9w68UajdzJc9wkbNVW0iib++0rELi2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzy029I1WkSNq4y9LV8k1DSIORGs8aDx6DUGksVKe9M=;
 b=L8QfNIakOHOyahtpEa+oca6Ic/03a38C5aKesP4KRouzJMKexpQpXbiBvnO2fZSOf7IY4nV8TOJNLpoSj9F+fGIhpD4KQb8h2B5KIZCmJtiOkw/yJp+B5Hs+5X9sAlN17oBUXYCGz5DmCQajb+vPpo1tz60uzEx/2C/AZPpksDlPadyzUxQSXUTZxnTAJLfNT8YohThB5/h6HJfjhylNqGjBMFejKvi5n9MkNjQRZeAhMV0npDo6MdLVg9Q5zTbQRRVpCb7hKLxnWD0BjebPSQaGULwTSp4oq6JimFSyXBPLhEXWS1KSOL9Q7Fob3oOrhZRpivm2NBk2YOgTiu79PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzy029I1WkSNq4y9LV8k1DSIORGs8aDx6DUGksVKe9M=;
 b=V2zu3ox66PDhybIpWPy3S1rJlrxlo9KCNUxqBqZuJmmIig0Wzio0zvI1P42dZIKIIOGqmD62tQ08RSAnGCGWuLxsT3E7KAwkBueD6zIbzYT4HHUkpk4zDF6nTZLyWyx6FClEIV8OGgAewm/ICT5Ywtkan0SYCRla3eG+DEnMlrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8369.namprd12.prod.outlook.com (2603:10b6:8:eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 14:33:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 14:33:08 +0000
Message-ID: <3912d0b7-4678-43e8-9dd5-42e206b2e893@amd.com>
Date: Wed, 9 Oct 2024 16:33:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/file: fix client_name_lock kernel-doc warning
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20241009140300.1980746-1-jani.nikula@intel.com>
 <117f49cb-0dfd-4f36-8b19-3142aaf6740c@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <117f49cb-0dfd-4f36-8b19-3142aaf6740c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cc175a-876f-4360-834b-08dce86f4b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGRUSTQ0WnJVT1V4bnZ6U0t4bmdjdytxVVFiVEUrY2NWc2t0MXoxcDkvZ2FO?=
 =?utf-8?B?Y3F6UElHdmZBNFVMWUhjWHI3TzNLQzc2RitNYkIrYVJwOFV3M1VBVjYwb05l?=
 =?utf-8?B?dWk2V1k4WGk0bDZWRnV4cXdqL0hUTnFLU0w2RDNBdnEzOVU5NlVWREtxNCs1?=
 =?utf-8?B?aHNSWGF6OHBuUnlQZ3YzOHFtNmIvdFRJcUh0ZXlQYTlyS1IvQmcyUWV0Tmxu?=
 =?utf-8?B?UUFUQTJtQnFVaW1PdDVQWkE1NDlGczBnZk5vU21qMWJIam8rSVRwTDlRQXZ2?=
 =?utf-8?B?c21pUzUvbXNLMGFMMVVWUDhYZmVETkFER29YYXFvdmpDbjkzNDlZUW9tbktI?=
 =?utf-8?B?Zit0OEp2R1RQekpWQUZ1amhmcjRQejZCd2pRRmg2VGM4NGhEYW1vQk91YnMw?=
 =?utf-8?B?b2hBa0R4WmNid0ZQaGprUVZUOHJ6K0EzTkNWaDQyWjlZNUtwM05qMEtvMmFr?=
 =?utf-8?B?ZVV1bWN1TW52SGdMQ0hEcTcrYkE2SHZ2U2FzTU5vOE5TQ3gxM1FsbGZGZHNz?=
 =?utf-8?B?QVQxVElOR2p3c2ZZRXgreGVncTd6WWQwS1k2a05rb1J3YmhaT3hXM1gvSXcr?=
 =?utf-8?B?YTlKc2hkL2Vnb0hnOXhiS3RSL3RMNURKNTZiWUt5MjJrNm1EeTN1dCt3MkMr?=
 =?utf-8?B?NGhOMXFIbzdBaVJabVBZRnNjdWFjbjQremUvSWxTckRpejkwcGZwUm1aVVIv?=
 =?utf-8?B?OEpkakpBZnh4RjJJVm9IZ0RoOWFrdTRGSUpqSWg3Wm1ndDhNM1RSOUV1Rzdn?=
 =?utf-8?B?ZmZaZGFtNWozR3pEdUNnQnp1NEIxNllpaEw2ckpoN2d3RGlPVDVnRm9RQnBJ?=
 =?utf-8?B?UGVzSkNxcEhTU2dQMWxteGl5dTFoYnFZY2J2TStGRWZkcWJPVjRUN2RseGtQ?=
 =?utf-8?B?cjlzMFkrSHVmMkxaVnFydGNsdmxod3ZnS3dnWUxIZFo1VUVrdnpPOS82NE5T?=
 =?utf-8?B?TTJXUHN2SGEvMCs2R0RzZjRkNUsvQlBIbzNVd1IwVFZ5bGxvN2RlREhxWkJo?=
 =?utf-8?B?RUdSdDhDRTZvamRxbE9iY1RDM3J5d1RPYmVaaVBnb3k4eDJDMEtEeXQwbk9v?=
 =?utf-8?B?eXVlMWUrdVFvd2s1RVZhenlvckZiV29kWXpXKzd5SllLYzFtVnVJVkhwT3Yr?=
 =?utf-8?B?N0lteW1oUXhHbEFWcHJKQldRMmtGeTU0TmlUVFMxbHRjeUtMZXhUdTl3SU1o?=
 =?utf-8?B?WFZJL1Y4KzJmMW1LRXlhZnZnRUd6ZW1jcC8yNHVmZSt5NFRpTjZsMGFuYnl6?=
 =?utf-8?B?Wm9rYlpxeFRqYWl0cnJoTVRrQlliZUxBbytKUzB4Yi9la3RzMktKZnFlUHdy?=
 =?utf-8?B?Y2V0YWcyT3llWFFDaWlkL3hiQnBzalYzaExZZkhJRHdaSEJYbGl3RkR0UHJV?=
 =?utf-8?B?NCtzaVpSTGR2cjRRZSs1Tm1kR3hJZ2NJVGR2SWpwQjQvYWYzUlJ4MHdqbUsv?=
 =?utf-8?B?RnI3MWl0L3N4WHBRYldjWXc2a2dWWFplMHkzZ2Y5MnZZY0dISm9YZEtKQ05o?=
 =?utf-8?B?NzRWaUFhT1JhUkpyeExmU1BCMDlsb3VyclBwamRqSzVMQmRlcHM2Q1JRVkVF?=
 =?utf-8?B?d3l3R3E0dHVVM3NjbHRqVWZYQm5Mb20rNnExdFN4S09WeTVuL3pZYXBPWUQx?=
 =?utf-8?B?bThmVy9CTmxveCtGdkdnVWhVc0tPeEZXN0FrOUNhallrdHIyUWI1WjlpU2ZX?=
 =?utf-8?B?aE9jZHJDWjFSUHdmaUI4TGNoaDQ2ZytHOThaUnNXbFkyY1ZiMzNMbTdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c29oMUxwWUJHYXkxTUpZdkNOMGNFeE8yT1ZLWkRFUTJQUWw3cTYzeEZHVTRn?=
 =?utf-8?B?Rm9TSjRad2J3eWh1eGsvRjBiQUNrZzh1dnYzQnIzdGtmTGdPcE1zRVpqZm03?=
 =?utf-8?B?aCthY2luVlVVQnliU3NuNHFxcjluL3Z6R1FzREpIWGRaVHdtUUFTRW1yZ1d5?=
 =?utf-8?B?cDdPMWJ1VExTbXJkY0VkOEE3VXdPdVBvajgzNE9hcXdVYnBORzBrTkx0SnJt?=
 =?utf-8?B?TFVHYUJkYjhYNDY0U3hieWR5VlBwMUhNRnI4YkJwM2lHNFh4bi9IeHRXRWZU?=
 =?utf-8?B?emlwaUxtRkV4cHBWamY4TFhQblUrOW5TcnYrMU5IM083eWNVYjFXVktrQWtU?=
 =?utf-8?B?MDZXMDdzNUlKWWZRV01zTHlkdUZIRG1tTHBEQjJMaDU5d095TVduanZ4NFpR?=
 =?utf-8?B?Yk9LcUg2bkx4U1lZZGRPQUF6TGpSblNYemRFZHdlRlh0V21NTHhuMDc0OENz?=
 =?utf-8?B?Zy9yRTc4Z1U3OW5Dc3hsZDVQamlkRG9aRmJPb2ZyK1JCd0x0NWFmNlhtbk5r?=
 =?utf-8?B?U1FuN3NJeFc0aTFjdGNKbERYOEgxOGhTWm5Qd0RoWklmSDNkWEsyUzRpZmNB?=
 =?utf-8?B?WjV2ZDdJNEpaRVovcllzN3d2YlhSR3BSdTVPWmpuQmZ0aUhtd1doSnQyd29R?=
 =?utf-8?B?bDVES0xKS0U2eURDTXN6eXlWWThHQTZ4b0RmSEJQTWMrbE9ZMUQ1QmQvODhm?=
 =?utf-8?B?czVvRTJUNENDU2dXcEtQS2NqSUFKMEpHb3dBbFZFb3h3amJMR21Iakg5REJ1?=
 =?utf-8?B?aU1YWTRqRVZnWFRCWWJHTlRRYmpYcHRNbzJueWg0Nk0vVFB0WCszTWlwQW4x?=
 =?utf-8?B?dkFOOGFNeU5Na0Voc3czYkJxK1FTSWRhb251TEtBUERMZWQxdDhXd2JCUlNZ?=
 =?utf-8?B?WGNRczh6R2w5SHVZYXNVZ2JuRGEzTHd4RjFwRWx6RzA3UWM4Q1BuK012RTM1?=
 =?utf-8?B?R0Jtd09pOE1PUXJqc0lqTEtZTzY1TDJoenpZR1FFZkJmUW9vR3p5SnRsUjdw?=
 =?utf-8?B?Z2xQNTA1VS9DOGlueHJiRU1HNTVwOHNsR0lVdjdhTFZjN3VPTllENkZDRU9p?=
 =?utf-8?B?NndFK2xzN3lyeCsxTnM1R1hnMVh2Tys5QTZYbVBnYXUrRC9aQkEyYTR2bGlE?=
 =?utf-8?B?REtmQmRrTHE2VTFzUWk5Q0U4QTk1czFMYlBscm03aUhBRVhJcFJ0WEExYW5P?=
 =?utf-8?B?a1I2MmJtQnlkL0ZGYStjc0Frc3FDMWdVYUlBM0o5L3h1N2Z5TnFWNkJzeUhi?=
 =?utf-8?B?czZNamtJUGhnaDdxTDFGT1RMc0Z4UzZLbVJ3Vm9oNVRvVjB2dmFCTnRVbnVj?=
 =?utf-8?B?ZDkxcTd2blRTc09abTllbmVuRFpteEJzNUNBVWV2elZjd04xWFYxSjlGTDUv?=
 =?utf-8?B?by80SmdRMDJ0Nk1PNENEZjczQlZpcklKUlNmMzRGb3NmamZJS3dNSThWVE1Q?=
 =?utf-8?B?SVA0RU9VYVpFTW5uc2NJcnoxVFZ6Z3F4VzM1QzdGRjRLL3hwU0ZjY0QwZ2xr?=
 =?utf-8?B?by8wdkFUaWNYVUt0a0NyTW9yVmNsNnYyY0dHMXhYZGlJSFZqM1ViV1lXaVNO?=
 =?utf-8?B?cE0vWmxtOFVCQ1RBZUdxbWYrQTVHSkV6Q2FwdFNyMkk4R0pwOWY4aGd2MTB6?=
 =?utf-8?B?WUZMaHplQ3F6MS91cWpDdFlOaWYwZjhYd1c3Z3c5eVdRMXZnZkF3Z2RjMHhm?=
 =?utf-8?B?YlJNOXpYUGJrTnZRUm5ZRk5idkwzZTdwZ2V6TzRjUmxuNkNiOTlGOUh4cjQ0?=
 =?utf-8?B?SXRYbFZvS0ZlSWJqWTBncjRtb0dkS0ZDc2V2bGxkTzg4RUV1Y0dGcnRJcUN1?=
 =?utf-8?B?cng2TEJTbTRpT0tzQUtYeXNmc2tPdjQrMmV4QXN5Zyt4Sm9KYktmQWMvOGRI?=
 =?utf-8?B?SjNYTHJseStzemtjbGxPc2xJMExKMGJVTVFId0Q2dUdZVVlxWE5pZkJwWUQw?=
 =?utf-8?B?UXc2ZnZsWHA2bUp2em1yYW9rUVM5aWRJdDVNSWcyVWNuUm5nMloxdjBReWFm?=
 =?utf-8?B?bWttb1R1TUI5T25Yb3lieGNuQzlVYzlweXFoWmdTdUhNT21yVk9UamovdzA5?=
 =?utf-8?B?azlpa0l1SGJkMmFwK2RJWlJMd1l6TE9MMmpOdW9reWw2R1JIVGFYa3pPMm1Z?=
 =?utf-8?Q?XQaY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cc175a-876f-4360-834b-08dce86f4b51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 14:33:08.6395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+5TSEfHLj49F+e3eIAvN/UEgcDE0/tbse5Kd8ceX5giD7kpibMgPCiVG3iwoGkg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8369
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

Am 09.10.24 um 16:23 schrieb Dmitry Osipenko:
> On 10/9/24 17:03, Jani Nikula wrote:
>> It's client_name_lock, not name_lock. Also unify style while at it.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/r/20241009172650.29169e6f@canb.auug.org.au
>> Fixes: 56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl")
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   include/drm/drm_file.h | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index d4f1c115ea0f..f0ef32e9fa5e 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -395,7 +395,10 @@ struct drm_file {
>>   	 * Userspace-provided name; useful for accounting and debugging.
>>   	 */
>>   	const char *client_name;
>> -	/** @name_lock: Protects @client_name. */
>> +
>> +	/**
>> +	 * @client_name_lock: Protects @client_name.
>> +	 */
>>   	struct mutex client_name_lock;
>>   };
> Thanks for the quick fix! Please apply to misc-next

Done.

Christian.

>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>

