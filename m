Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85DFAE685A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 16:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FF010E5D6;
	Tue, 24 Jun 2025 14:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kHG4p2zP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF64189C48;
 Tue, 24 Jun 2025 14:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7ZCNqrJ3hx35kO9cbZeLqnApmZpmmY8bfy3nlk4mKLGdQov/YEPRXJhT0qsnN+fxWzzyzbq890PAFh6u60mtL3Q3OWX4dtweEvTW2/Y2DpZGJ1lrFMgbhgf99dalDGp7MMmAkXUysqYbdKkuaErdKKIjGofvA9ly+PmsgNY8TxISSMOqF/oR2nRK4XejlxBOuPWumYNArJf0V7VPYxSyNROjVxCvb48eHWELK5PPnJYAZtTWMbdB733BAq/LGJ/OsUjuIAkcML8Ddro4KS9oPgJd7pgMLavS3MhAVIROFlRZQzHvTJ1lDrFld9dPrCKEp/iAiEcqadl1HeevrKhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyLfmC43PoEj7tF7bXoFkqRM+z57ZG4aJH3TbDSOdlU=;
 b=PEqK1fbrAMwVevnqhrXPvYqCKmNx3d8BHt8I8tqdFS4TpweqXHm+OXh4sVT9sA5G8tRndlSCKSkSkmrvnGDooCzLRUKVoTnz+Wz2NWPquevB/IUA3kxNi3luYos7Y43ZZPUD5QdhGyIet7YCW5UxIjtv5LTUfx3v7TL3OHYDSu748jCYB3BOBkcXm6s0nkLqwBztkWuMab2SCgCYtryoCOt35oCGeUqlp0VtXonOFN7VoD3VFZ1L14JDeDkmv06vjyvYycCJJuauOTa7TWIBbawIOOpcd3bhBa9dA1bdKfJ0dZOkM/bHxePJOFeWTQePVeXrpF+KniyWAj96pKK/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyLfmC43PoEj7tF7bXoFkqRM+z57ZG4aJH3TbDSOdlU=;
 b=kHG4p2zPQM7Or5bzbSYu1muEoVzTH7eNbcAwcQQPkdL6Ij1dTbhD1Q0G0lv7wjsixuaaBJBDkXeBrcilXpsZC0VzItPGI4VET2WndP8oAkorfQJeoW6tye/d2asMVffibzLolN3rbTVHREy4MVYpD1gtyNo+u8I8Va3V16+/6NA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Tue, 24 Jun
 2025 14:23:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 14:23:36 +0000
Message-ID: <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com>
Date: Tue, 24 Jun 2025 16:23:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:208:329::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: edc6aa44-9102-45f5-0b5e-08ddb32ab4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am8vTURtWlBBdW5naWYwTzRodVEvak5ubnE0OEdSZmdtcFg5NkR2V2kwMUxo?=
 =?utf-8?B?ZHJmRFA3QlZFWHlMeHFMaDhOMjdITXltcDh4dWhFMWluSENGY2UwM2VvTGxs?=
 =?utf-8?B?RTB2Vk5YTWpBci9JNjI1L0M4bW5uTXFlNkc5czZ0Q2FFS3lXSDdtOG9Qbmdh?=
 =?utf-8?B?OVdRTUdpQjFJREVkSnVGazJNVkI5Z25VRVFOYzMzenptNUIxOUJ2Q2lHZyti?=
 =?utf-8?B?YllCVGFRbUk5WVI0SkMxOGZVOUFINGpBZnhOdk5KdmxTL2tod08rWnNLM2NN?=
 =?utf-8?B?WU8xQ3N1bk1YZmxRbkN5OU1pNXQyVFdTRHZLdHg1eEo5V0VUUDJveUdYMjcr?=
 =?utf-8?B?cno0VEYySGdEd1FlWDFnSWthRm1FRGI3Qi9ZZGUrV3ZxU3BpWDdXbFoyOGY3?=
 =?utf-8?B?VUpxN2xjb29PenNydGtHNTdOZG03enU0c2VwMlJ5UmZOSk1NZWRwdkZSdFlr?=
 =?utf-8?B?dnkvMkNDOWJIZWIvbElpQXlWckgvRG01WWticURPZlJseXpEbVBqckhrT2Mx?=
 =?utf-8?B?eG9rWFlBYW9VcE9UTWI4eGwvVGQ1WjZVTmI2dEp5NWZ6WlM0UXozb01TZGd2?=
 =?utf-8?B?OC9XK3REVk0wRzNjTCtXNjFSamYzTDFVaGhORGtIR0graU1zcm1wSU45UUFr?=
 =?utf-8?B?SFFuRTV5bHdVenFKQTBjckVpUFlEUHc5T3hOQSthaXBFTUlnbmZtek1DcXdm?=
 =?utf-8?B?UDh4VFNOUHNZNFFkT3hVS1N2SUI0ZGZMNE03cDJYb1FTNE9QVTBLcXlVTG5v?=
 =?utf-8?B?NG9nRTNPOXlTSDc1UDlLNTBpRndpcHgvMENrN3lvQm1qb1VreEFXZ2hLVjNP?=
 =?utf-8?B?NUkzRSt2L01FaUlSSkZyWVdqL1pLSG9JUlRJcHczdHFUaDE3RXdLMUZheG5W?=
 =?utf-8?B?KzNyODM0QWlpNllpVWdiWkJrTFRjZ0E4b3R0ZkQwQ2RxemJGWUJrbFI2MDF4?=
 =?utf-8?B?cEJkK25PMFhOTkh4SC9QZ1BrSEplZ1ZHT3RGQ1o4NnovQ2Y2alhVVGJsRWNm?=
 =?utf-8?B?UDFqWDVIZEEyMkViWmFMM3crVkw2dzY3WnkvRjBaVldSbFd5SVhjV0czVSsy?=
 =?utf-8?B?L0dUWFpINkowbmxvRnd2QzZzbjlNQWhKbklPYkNFY3dJQ0thRTVpVU05c2NK?=
 =?utf-8?B?V2dWK3dybC9hd0d4c0NmVjlLNTYxTWFtK0hkQWFqc0pvdGxwNVFRaUxuMFFI?=
 =?utf-8?B?L0U5NHFXZVdacHlUT0Y5MWcrcjlyZ0thYnhmVGVPckxBbnhwelJXbTlTTmw5?=
 =?utf-8?B?RExTUXA2ZTRZQ0RTR1AwVDVmMzlDYzdHeXA3d3htcGZXMzBXYk5pSHpNbzd2?=
 =?utf-8?B?c2JJa2sya1NET0RZb2NWT2dMdkU5Y3VpZUhyd00wQ1Y4ajlyWTFVRWU3ZnJS?=
 =?utf-8?B?OU0xdzI3WHZ2cjZKZVhiMEF0SUVOWHIzaWRyZGI3c1RRZHhLV291ZVI2ZFBl?=
 =?utf-8?B?U1Z6akxpYnAwN01qNitLZTg1OTdIUVdqMkU2bVFNcm9adWFzcWNCbFBDVkdo?=
 =?utf-8?B?QzN4R3lyZ0xNVVVBSGdpRWxYVWRxUFA4QWp5VGNURHlLMW1XWUU1ZE9jY3pp?=
 =?utf-8?B?VkhtNFdGR0hqalZpcFpUYjVqWllqbEhoQ1pBenZ3ZCt4MUI1NmxvWlJiQ0Q5?=
 =?utf-8?B?bUxnUXUvKzYvZlJUbEVCSTI3Y2R1L0E1K1VUcTZTeFl1MjRUV2NMKy9Jem5q?=
 =?utf-8?B?N1BkSGVyNzhkMDVCM25EM1NtU1ZEbG1FTzZRejd4d2FYTTgrbFRSVkhyU2JD?=
 =?utf-8?B?ZUJJMTUzQlFzK255cGVFYks5dUIwWXdHSnR3U3F6dlIxRGh0TEx2UWtZTmVk?=
 =?utf-8?B?OFZFUnNWZXVMQ2Y1RG5WczVKT1B2SXUyV25CbmFHOTMva0doVTZZS2JWRzVo?=
 =?utf-8?Q?wemeryxBS4wFT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlRBTVA2K1hsRmNlTnh3YXJGaGxoY01yWXE1a0ZTNmZaVFhtUTYvRmJSRUZ5?=
 =?utf-8?B?dFg2aXN3Q04wd1U4Y2dDRlRha1lHR0dXWmNvWXowMkR2RGlydmgyZUQ3V3B6?=
 =?utf-8?B?WGd5RGtaZWY0NmU4LzNCOFFQV2ZoaW4vckhiT2JIcjFxRWJaUFBlYXlqRE04?=
 =?utf-8?B?MkFmQW45ZFp5SlUvNm5vNFFleWVaeTUvYXk2UmFubHY0YjB3TFdKMjFkQnJL?=
 =?utf-8?B?YS9TRHlGK1o0MXp4cWdvTmt6b3FmNUo4N2JRZVZiRVV5cVdYTHNuZ1lkNkpQ?=
 =?utf-8?B?aVhFTzJOTUdnSkZwa3VDTmJmWHRIQm1jVGdqSlBzKzJzSFovc1pFYXJhNExX?=
 =?utf-8?B?L2pVRS9abFluMTczQ0dUVTVGcGhHTERIUjZDbFpTeHl0cmNmUzZCZWhSZ04w?=
 =?utf-8?B?bTJpa1ZIcVZCcmtpak1abnZBdzhzUHJDOUFRUklFUG94ZCtlcDRtdEpLampi?=
 =?utf-8?B?cUx0WWgrN1owK2RlQ3VtckhhdlRUSytpbWU1SXpXbjB6K05jN1JXczNULzJp?=
 =?utf-8?B?RjFlWDdKWVdnUmw5b0tFWE9wSlluQk5NemcyVWdtZXBnYmttOE1nZlFOd0cz?=
 =?utf-8?B?SlFGRlVsd0hXNE0zYXovL1lzcWhYQWUvUHRDcS8wTVBOeHhTZDdlSWR2MGJO?=
 =?utf-8?B?eFdEenZzZjVyUTBFZ01rZUx1NFREOWtPaFJLRllCakU2dDhOeGFUdy9oanpB?=
 =?utf-8?B?RlhxOFNvREV2RmFKRUs4OTRwWWdTSHJBcWFjcE10aFY3NXVCSC9hSU5sb1Qr?=
 =?utf-8?B?VmJJY3FNajJ6MzBFN1l4bmh5bkVvRzBtdTdUekFLTmlDVkh3OFRYR21nUGg0?=
 =?utf-8?B?ZTZlYjNmaGdnYmFTSDRjYWoySmQvbnlXSE94a2dGeG9CVkxIUVV0YUpWdmQ5?=
 =?utf-8?B?OUxjQ1BTUFBETGNFcWZ5QUk1MkgvRHdzL3JyYlJHQ3ZnZXpwTk51eE5KZ1BF?=
 =?utf-8?B?ZFlSVXpoeitBUGE1OS9ha3VidDNQN0wyYzlQeXV3aUhpK1BBUmpMQ08vQndh?=
 =?utf-8?B?ME4zTnBmRUlsMTJES3c2N1k3TkxNaFYvSFFBUmpEeWZsb2sybEpRbGxMaTFs?=
 =?utf-8?B?N0d3NDd2RFEyOEFKMTlRNHhvZzU5QnlVczVKOVQ4VGJlUUhXNGpXcEtaUno1?=
 =?utf-8?B?Qy9lVkJ5QWRuZzZ4cVhSN3FxRGhzQUl6UVhxQjQ2Z1Fzd242ano4dklpNysy?=
 =?utf-8?B?Mll4azVXWlZsQWVvZGM5ejZKNG1yTmxoVjRvOTBmYjlKNENDeHdKVUVxbE9k?=
 =?utf-8?B?VEo5bkRaMTBtZ3h3V0RNYVUwakdLUC9JMTdBREFPbEdqbForU3BBczkzeTJX?=
 =?utf-8?B?TmNlUTVaRWZlRjRiUGV6VXBnbHozZnc3YytHYVlhUUVrK0pmTXZwYVhCaGdD?=
 =?utf-8?B?U3JEbUxlSEMrWkFUcDJDaWtTWHg5UmR1QldFMDg4RnJ3eWxXV2tSTTcvSjVD?=
 =?utf-8?B?Y1FWTHNZQmI0bE96b3VXRjhyUitiYnZJeXBhZk9GRWwyRUtJMXlDa3h6UEF1?=
 =?utf-8?B?L2c3Wkh6LytWWWxpb3RJK1ZFUUVwcTYrdW44SXBESzhrQ3Q0ZGhnSVZNQkdo?=
 =?utf-8?B?aUh0RCtDekpHS3lQR1hLUE1Db3cvaTNjQ2VOQllvM29zVzlaRFlsV2IrRDNm?=
 =?utf-8?B?SXBLM3ZBbjBxUTRSbjFhdHFITDlsMDMxakg1ZUY0dVl2S1F0K1VXaEpKdXlM?=
 =?utf-8?B?ZWl4bnZFcVR5Z2ovYjAyc3o1VUpieFRuRFVmelUrVVRuS0Nsc2lpdEZoWXMr?=
 =?utf-8?B?dCs3T1lvbkprOWQyaGJkTjdqNWtxYzBoK3cwam9zc2hWa3UxbEZKTU9uY1Y0?=
 =?utf-8?B?aFZFTWtVZ2t2L2J2eFNzUDZ3bnkrbjcrTWZaSWFTcEpQdEFieGJKV1JWVUND?=
 =?utf-8?B?N0dCU1JKaUhuSmhrSG9Jc0tYODlRejBTKzZpRFErWFF3WWhjOWVseVBvQjJk?=
 =?utf-8?B?VDBkSDlhQUxVM0JnVmJCTDdnMGFCcWZpRFlURW1Qd1RwQ1VEOUNCWjRpUjFX?=
 =?utf-8?B?citKZ1VhY3NQVlRtTFdMTUtHMUNxemhlWmtWampYT1JZTkhJVVNpS3ZKc0dp?=
 =?utf-8?B?MWtXeHE5allhakV5alEwOTlxNC9LcmxSNExGcVJPSHZ6WCtRT1lhVWNmTWR4?=
 =?utf-8?Q?QTfWy3qLcCjcDUrXdhNvQCKzu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc6aa44-9102-45f5-0b5e-08ddb32ab4c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:23:36.3146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyyivbJiyWKT1onlGNDw+D02QnkhfG5C6ZS1WQ75auPxB8GfSGNC2qQIB9Qy3X5G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926
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

On 24.06.25 16:03, Riana Tauro wrote:
> Hi Christian
> 
> On 6/24/2025 5:56 PM, Christian König wrote:
>> On 23.06.25 12:01, Riana Tauro wrote:
>>> A device is declared wedged when it is non-recoverable from
>>> the driver context.
>>
>> Well, not quite.
> 
> i took this from the below document. Should it be changed?

The wedge event basically meant that something unexpected happened during the lifetime of the the device (crash, hang whatever).

It can be that the device recovered on it's own and nothing needs to be done (the none case in the documentation) and the event is just send for telemetry collection.

But the usual case is to trigger a bus reset, rebing or even reboot.

> https://www.kernel.org/doc/html/v6.16-rc3/gpu/drm-uapi.html#device-wedging
> 
>>
>>> Some firmware errors can also cause
>>> the device to enter this state and the only method to recover
>>> from this would be to do a firmware flash
>>
>> What? What exactly do you mean with firmware flash here?
>>
>> Usually that means updating the firmware, but I don't see how this will bring you out of a wedge state?
> 
> It means updating the firmware.
> 
> Series:  https://patchwork.freedesktop.org/series/149756/
> 
> In this xe kmd series, there are few firmware errors that cause the card to be non-functional. The device is declared wedged and a firmware-flash action is sent.

Ok, so let me recap that just to make sure that I did understood that correctly.

You find that the firmware flashed into the device is buggy and then raise a wedge event to automatically trigger a firmware update?

Why not fail to load the driver in the first place? Or at least print a big warning into the system log?

I mean a firmware update is usually something which the system administrator triggers very explicitly because when it fails for some reason (e.g. unexpected reset, power outage or whatever) it can sometimes brick the HW.

I think it's rather brave to do this automatically. Are you sure we don't talk past each other on the meaning of the wedge event?

Thanks,
Christian.

> 
> There is corresponding fwupd PR in work that uses this uevent to trigger a firmware flash
> 
> fwupd PR: https://github.com/fwupd/fwupd/pull/8944/
> 
> Thanks
> Riana
> 
>>
>> Where is the rest of the series?
>>
>> Regards,
>> Christian.
>>
>>> v2: modify documentation (Raag, Rodrigo)
>>>
>>> Cc: André Almeida <andrealmeid@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   Documentation/gpu/drm-uapi.rst | 6 +++---
>>>   drivers/gpu/drm/drm_drv.c      | 2 ++
>>>   include/drm/drm_device.h       | 1 +
>>>   3 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>> index 263e5a97c080..cd2481458755 100644
>>> --- a/Documentation/gpu/drm-uapi.rst
>>> +++ b/Documentation/gpu/drm-uapi.rst
>>> @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
>>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>>   more side-effects. If driver is unsure about recovery or method is unknown
>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>>> -will be sent instead.
>>> +(like soft/hard system reboot, physical device replacement or any other procedure
>>> +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
>>>     Userspace consumers can parse this event and attempt recovery as per the
>>>   following expectations.
>>> @@ -435,6 +434,7 @@ following expectations.
>>>       none            optional telemetry collection
>>>       rebind          unbind + bind driver
>>>       bus-reset       unbind + bus reset/re-enumeration + bind
>>> +    firmware-flash  firmware flash
>>>       unknown         consumer policy
>>>       =============== ========================================
>>>   diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 02556363e918..5f3bbe01c207 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>>           return "rebind";
>>>       case DRM_WEDGE_RECOVERY_BUS_RESET:
>>>           return "bus-reset";
>>> +    case DRM_WEDGE_RECOVERY_FW_FLASH:
>>> +        return "firmware-flash";
>>>       default:
>>>           return NULL;
>>>       }
>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>> index 08b3b2467c4c..9d57c8882d93 100644
>>> --- a/include/drm/drm_device.h
>>> +++ b/include/drm/drm_device.h
>>> @@ -30,6 +30,7 @@ struct pci_controller;
>>>   #define DRM_WEDGE_RECOVERY_NONE        BIT(0)    /* optional telemetry collection */
>>>   #define DRM_WEDGE_RECOVERY_REBIND    BIT(1)    /* unbind + bind driver */
>>>   #define DRM_WEDGE_RECOVERY_BUS_RESET    BIT(2)    /* unbind + reset bus device + bind */
>>> +#define DRM_WEDGE_RECOVERY_FW_FLASH    BIT(3)  /* firmware flash */
>>>     /**
>>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>>
> 
> 

