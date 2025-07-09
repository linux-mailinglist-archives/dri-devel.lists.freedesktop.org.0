Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909DAFEB4D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A395E10E7F8;
	Wed,  9 Jul 2025 14:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0u6Dwm/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1822D10E05D;
 Wed,  9 Jul 2025 14:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7ELH52z27iQshYyMjXeotqb9JSjx87n8nrZO7J2C9iEHLoJzVZVStNuxoXK6EZTRw26zRv7o67Ey4pLIANsiVsMQHwg31RefyNrT6k5I+sT8lopQienOz6RBGja7j0s5VrhSVVE3p/RP5f3IP0Tb91Ampk/W3Hn9u2UUEFMvM7xRblR8zlJB5j1BzXdmxwlZR7mi/U08O3Jc/3DGqwRHA7fJ2WMmWibVnMqmAoaPwHzScwkbnBGXJO1puX5UTGnNhIMOANDE5EaMB2k1FFOgwHxWRjR1YSLRGNkjVf4pgPuGliyfGH8n/AAUh+WCj+SmVloxP+7kTebyxWnfXxYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wbadu9JA7NAGpNqIni8YkSEZKl1KjMNT8Cl0yaemjDw=;
 b=fMv11CBjCM1Vm4OWzZgDGqYGIHPadntD4wa/pYWhsKnyszXPzGnreRFTw32ANOEFCLocBQQH2lIDtimcPM8snCxBDY8CIQFtfkmfDFWvcgTPYtoFRxwySCPokApNfV2T1en7SuBiYZQ45/b/PwGIqC1wntBzQ0g0rgmJdK9rOzRk0ktegjSLLFMLqFL/4iII9un6VbnEjYWI+mij+oBmDD5ESD68kA78ltEu6KCx3oj7XN9rQ+SuAVrNJY8CP6g80MtJH1+n+wYZqKslmSvrYtRe/8b5AF3lHB5lFYXMxOL2jSxv478YldwZbMa2hcgCS4Eu6Tixu+DNAvmuYPyiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wbadu9JA7NAGpNqIni8YkSEZKl1KjMNT8Cl0yaemjDw=;
 b=0u6Dwm/9mTyjUCO4Z07i9Yov464jy34mBIeRsaFIKYdsuWIHYT+sV3yecC5yhtTTxmVvTmFTUZpwb9yU23iVpa7XJ7OF9Kulzw9cD/8uuXL1klTSe2n5MF1RfDKS7Cc2vWCKX1G9XkVFW6YxtXd063q/TZP3zVNWAhnUWlEww2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPFD6BF22047.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 9 Jul
 2025 14:09:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 14:09:25 +0000
Message-ID: <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
Date: Wed, 9 Jul 2025 16:09:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
To: Simona Vetter <simona.vetter@ffwll.ch>, Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aG5xglf8BeGzleWM@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0298.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPFD6BF22047:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf25e1e-ec3f-4205-4013-08ddbef23602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnBFanBjR1gvclJSTXkxdFdVTlpEeGgxb0xsVTFsTVc0ZUNicE9SRklRSElF?=
 =?utf-8?B?R3lzT3VyZjJwK00xYW5pcDFOTTBzVmxTNjcxRExxQzBPVjhhV1ZGTkIvS3ox?=
 =?utf-8?B?bTVBQVA0WEhNdGpCTEYrQ3FFTWpVQ09TdVprZzRQOEZEdzRCNXZaWGMzV1NR?=
 =?utf-8?B?M252eGxMQzJITDhVZ2dLbUxGcGNuTEErZ0RrRytVUjZzVmc3a0xSaWJQc3Y5?=
 =?utf-8?B?Nks2U2xIdTdqTmdVUmU0WlpGMnVqSm5PT2FsR0ZyVjBXMlFFdlhxMzdiQUdX?=
 =?utf-8?B?YTZzc2RZYXVSZmYyeisxelRkVVdndzBzOHVVaGVzZWpVV3g0ZTM4WDVsN2Zr?=
 =?utf-8?B?TmVxOTZQYk5TL3lKU3U5Qnh1ZUxqNG9mcFBicVh0ZGxIK3JDaFRDZ1J4eTJs?=
 =?utf-8?B?d0RxVHRGUzNhVEZwcklRTmVHUlZOeUpoWTBPdjV0U094MnN3R0Vyd0JpeWFm?=
 =?utf-8?B?YTdtemdCYlZNTUFNdkhER0l0QzN4WTNGS3d0eXUvVE8ydHVTd0JxUXNMMTVh?=
 =?utf-8?B?TVFYMXc1UTJjVHowS3Nsa0pNM29HSDNybTRlRlZzaHV1b2poVW9aOElsYVNx?=
 =?utf-8?B?MDVXOGxkbjl4cVdyQmF2d2dNcmlLbCtwVk9BMEdOdUxMTEVTM1Q0dC96MVA1?=
 =?utf-8?B?OXJkdUFoUTBSbWVua0t3MjArRlRpZkV5NVhNb3ZBaHJQaDhDWUZDNWZvc2Zz?=
 =?utf-8?B?WFdZaFRQdHpKUlBDR25BaWlFKzRPVC9sNmVoTjQwbjU4V3NCRkhrUm1oNjJt?=
 =?utf-8?B?L3Z1dWc5cnN4WnhXK1pnSW5ZRmFGSUpHUm5rWmFJOWkwMFBjMUZWSzJLVFVV?=
 =?utf-8?B?akNVMldCY3FMaFgvaWZReGpjakEyUlUwRlZLUE1SRk5USnZ4NG1jZ0h3Qk9j?=
 =?utf-8?B?TXBqUWZrKzd0VlZDSmlIVSs5ekMyR0NvblN2RVh5Qi83Um9YUGVZUUtycjE4?=
 =?utf-8?B?WWsrbUU0NzA3QTBqTHlSazR1Y3J3SHJoaW83UDYzM1VOUzFiM3FoYlVodVQy?=
 =?utf-8?B?aVU5c0doRGJkQXIxbWdhTHdpSUtZaG9LUndkUGw0TVoxS25qT1k2U2hINXI3?=
 =?utf-8?B?djNtSVV3amZLM3R4TXBQcVdxblBMYkVOSHdUcEZIdHlXM0hVMWdDZzNlNU55?=
 =?utf-8?B?QnpXeW8vQkVkTTNIdDA4aVh6ZVUzQmtyMGRuUXhBbDdDV01SZ01SNkpiam5x?=
 =?utf-8?B?MFVjWmx1NFkzZFIydExMTEJrbC8rRVBlcGhMZjBNYkRDVmVYV1dZOXQwOXc5?=
 =?utf-8?B?aFIrYnBiQ2VNVktzcDBwQlRpOGlYRjhVN2pKcFJxeVZoTkMrMDZpNEd0aUZo?=
 =?utf-8?B?SVhycU92KzF2bzhxZXBUT0xMOHlxZFd5djkrNElJQmNOU3RtVmhoVURoQW1Y?=
 =?utf-8?B?dVBrWlY5dms2MVNxTUt4OVY4enhHNzcvRWhjajVmL1duZ24wMWhyMWxsYmhw?=
 =?utf-8?B?WkpPQWxsRGIxVmU5Q1V3dVRsc015S1M3WTd6TDJpUWVxalF1WjBidjVVVUw1?=
 =?utf-8?B?MjhVYTRIeUhkMFRqWmE2RFJ4bTlEcGgza05mODBjMTZpdGNNVGIrdW10MytS?=
 =?utf-8?B?clBkSGU3c0U2U3pJU1hScFZtOFhmU0IzbUxXSlVjWStzVjNoTjBqRjJhenl4?=
 =?utf-8?B?eFg1ZkVGbVlPUThYVmlqa2xzdE1DUE0rcFNrd2pZNDdzak9qNjhBN2Zham4v?=
 =?utf-8?B?VWZ3U2swVURPVzVBU08yRERFWkt6OHVJdmVMbWg5bUFtQkp1OTlHaTZka2Fp?=
 =?utf-8?B?aExRblVFUlJpVHhUN3QxOHNXQVk2ek95UW9lZEgybmc0TXA1Q0dydU9sUUVk?=
 =?utf-8?B?N0RCWGZoMS8rYXFML0Y1emx6ZVUrWExEUVppUE9EQmhQQ3ZvUjljYTJucnBM?=
 =?utf-8?B?VTZoRDNDMXpEeFBqQUtDbjNrRFQwMVZTZUo3TGtvR3FmSHNTWmxsdEJFU21E?=
 =?utf-8?Q?nUXWfP5SGJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S252SXNRQUdTTlJQcy9YbjdZcUZtMHlPdWt6UzUrYnhtUno1V3kxckd6OWVM?=
 =?utf-8?B?cmd5Y1N4V2JxbCs5QkJmNkJjWndBMG90Y3NqMXVPVi96M09la1h6dGJXVm4v?=
 =?utf-8?B?ZWthM0VkV2tjK2w1MElNUnREYnlmOGk0U3k4YVRUeFUxcDZ4MkVxN1ErV0JS?=
 =?utf-8?B?YkpaWnBpVHFURldyZmxLSGp2SVBpMFEyWGZIUTZkK1NPZ0g3UnZSa3Rsblox?=
 =?utf-8?B?ekwyQkRJcXNDSWlncEg3MWlXTTNXcmtaTitibEdrdnFYVm40UjlFdmVBUHA3?=
 =?utf-8?B?UHIxTHJYaUlhNkxiYktlb0RnWVBNK1ZEcnp1RzVnMEcyb0lZMGZFSWNoY25t?=
 =?utf-8?B?NUhlTTBtZUIzYmhjNHpKV0tsdzNyc3ZQVHVHWFRrOElWZS9YQTZ4U2NZZFU2?=
 =?utf-8?B?T0R3Q1BJdHoyYVAwcytQQUVkRkExaUlYdEwzeStPWkpmQXhRcU1lSDhudVZN?=
 =?utf-8?B?VUFoSlYxYW9PYzM4YlBUMnZLeDlqTklOMDE0WEdzMm5ta3k3SjlKZjBNQVla?=
 =?utf-8?B?SW41MVJLQ0txQUhEVHQ5TWloUWVrQ0pYYWFuSzhlQnZ3MXErMWJOMHFra2Zm?=
 =?utf-8?B?MWU2Z21OQXFENytjS0RZRFQ0S0xwNXZzRUdKQlJhNzJIK2JucHRqVTlhUEVR?=
 =?utf-8?B?Yldpdk45S3NDKyt4QUdIdmcyaEp5cktwY25mWlUwempQMXp4dWg5d3N0bVVR?=
 =?utf-8?B?UE1Zak5ENXIrTVZTYkw0K21RS09ZY0IwaitraFBEakFmTVQvSC9iNjJXTzJZ?=
 =?utf-8?B?ZEpwdlA0OFIrN2NTVzkyT1pMSGF6Z2phSXQxZDZHbFBPSlRLandlOHZySzVj?=
 =?utf-8?B?RUxOcGlhRUlUKzhlSFN3dnllR0hJbjVjWXRLdy8xcXRoUnQ5OXgwQTU0SFhy?=
 =?utf-8?B?NUJvUXZ4d1IyT1haUDFvWnFkb3JJQ2dpU1BQMGdWaVArNlpiWDd4MUZweFBU?=
 =?utf-8?B?ajRTUFlWR2I1LzJxY2hGT2tzcWdrTnk5Tnlka2UwYk83TXQ2Q1YxZmFJMWha?=
 =?utf-8?B?dUVUaU9MZTJhYVpWakQ0VWs0UENlaE5oWE00Y2RaQmNBQmpXTG5GZVloS3gz?=
 =?utf-8?B?ZjVRdWV4bHJjcW1NbVJEdDBCVzJzN2ZNZUVJaXRxRzlQWS9zZDBYeXowWmFn?=
 =?utf-8?B?T3hrVGNhSlhGeHVXSXJ4MWZGTDZkOHpObCt2Z2hRNTYyU3ZMODRWeER0M1RS?=
 =?utf-8?B?dFd3cUJ5VVpPNkorSWZoa3VpNmpQcEhRUnJ4UnlKM1FmQyswY3hkYTJta1hS?=
 =?utf-8?B?M2lJU3FLalpVYk9jNzdsb0NYZUc4d2Q3TUV5ZXUvZm5jMVBiS0pkYlVrMUlj?=
 =?utf-8?B?NXd3YmV3RFFoNGFudVk1UkRHbEJMS1FDSXJIZGZKR2NIRU1zN3JxVkVaTHZS?=
 =?utf-8?B?SC90ZElzM2RDOG84ODdMQUJWWGttZjNXSVU1bG1vZGZuc2hOeUJvS29LbFdx?=
 =?utf-8?B?SjVlbWFqQTlwM09mV1N4VEFkMW1lVDZYcE1OYUtTbnVTWXFhRnFqMFNmaS9x?=
 =?utf-8?B?SG1sSVR4djgyVzg4b2NhZldKMldEUXdlZzhhbmJ4OG1FVzFRek10elpKSzJy?=
 =?utf-8?B?SXdQTFdpNStiM001ODhUY1JVQm9kWkxqZFdBZTlJTkp6NnlXQ0NZemtoSFU1?=
 =?utf-8?B?YS9mNnNlRjJFT1VRQURvc3VSYi82MXAxSjcrUmMxZ1E5VUJjTk1NM0ZMZlFS?=
 =?utf-8?B?NFl1dFhnOU1oRkIzdGNNWnBveDdGcVBIZGZoTnZpK01sc2tNb0w2ckFNRTJ6?=
 =?utf-8?B?ZDJ0SEZjU3QyMXphdUovN3hZNXBuZWJMM1FDelMzNDNGWEVvTFNQZ1dsK1R3?=
 =?utf-8?B?enV5Syt0UWhTemg3UytCajU5dEJhdTc2bkNrelVVQXVSK3pTWFZFdW9pamFD?=
 =?utf-8?B?WlR3QVJpRFRtYVpKZXA3UzJ2anpSclY5KzJ1dkplWk12OE1uTlRjbEZub2R1?=
 =?utf-8?B?TWxKZVEwMzN4ZDF3cGErdjJhSzZSTlcraERCcGdtQW8ySnBsdFRxL2FrUjRi?=
 =?utf-8?B?ODNseGpIYkFsSVBMKzFQa1FTVTAvaWRoQ1dtNjRDR3hYbE5IcFUrTE9yNHRp?=
 =?utf-8?B?cFFRd2p3eURSVGNkckFweHkvRVJoa3VhMng3T2haZWlUamxuVXNWQ01pRGtk?=
 =?utf-8?Q?LEMg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf25e1e-ec3f-4205-4013-08ddbef23602
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 14:09:25.6356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gid8VrmmfjWAYgztq5viuL2a1PZ08Y2Iahd/2ykEGhXmnk6+VtHokW+h/B8Q3Okb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD6BF22047
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

On 09.07.25 15:41, Simona Vetter wrote:
> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
>> Certain errors can cause the device to be wedged and may
>> require a vendor specific recovery method to restore normal
>> operation.
>>
>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
>> must provide additional recovery documentation if this method
>> is used.
>>
>> v2: fix documentation (Raag)
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> 
> I'm not really understanding what this is useful for, maybe concrete
> example in the form of driver code that uses this, and some tool or
> documentation steps that should be taken for recovery?

The recovery method for this particular case is to flash in a new firmware.

> The issues I'm seeing here is that eventually we'll get different
> vendor-specific recovery steps, and maybe even on the same device, and
> that leads us to an enumeration issue. Since it's just a string and an
> enum I think it'd be better to just allocate a new one every time there's
> a new strange recovery method instead of this opaque approach.

That is exactly the opposite of what we discussed so far.

The original idea was to add a firmware-flush recovery method which looked a bit wage since it didn't give any information on what to do exactly.

That's why I suggested to add a more generic vendor-specific event with refers to the documentation and system log to see what actually needs to be done.

Otherwise we would end up with events like firmware-flash, update FW image A, update FW image B, FW version mismatch etc....

Regards,
Christian.

> 
> Cheers, Sima
> 
>> ---
>>  Documentation/gpu/drm-uapi.rst | 9 +++++----
>>  drivers/gpu/drm/drm_drv.c      | 2 ++
>>  include/drm/drm_device.h       | 4 ++++
>>  3 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 263e5a97c080..c33070bdb347 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -421,10 +421,10 @@ Recovery
>>  Current implementation defines three recovery methods, out of which, drivers
>>  can use any one, multiple or none. Method(s) of choice will be sent in the
>>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>> -more side-effects. If driver is unsure about recovery or method is unknown
>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>> -will be sent instead.
>> +more side-effects. If recovery method is specific to vendor
>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>> +specific documentation for further recovery steps. If driver is unsure about
>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
>>  
>>  Userspace consumers can parse this event and attempt recovery as per the
>>  following expectations.
>> @@ -435,6 +435,7 @@ following expectations.
>>      none            optional telemetry collection
>>      rebind          unbind + bind driver
>>      bus-reset       unbind + bus reset/re-enumeration + bind
>> +    vendor-specific vendor specific recovery method
>>      unknown         consumer policy
>>      =============== ========================================
>>  
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index cdd591b11488..0ac723a46a91 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>  		return "rebind";
>>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>  		return "bus-reset";
>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>> +		return "vendor-specific";
>>  	default:
>>  		return NULL;
>>  	}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 08b3b2467c4c..08a087f149ff 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -26,10 +26,14 @@ struct pci_controller;
>>   * Recovery methods for wedged device in order of less to more side-effects.
>>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>   * use any one, multiple (or'd) or none depending on their needs.
>> + *
>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>> + * details.
>>   */
>>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>  
>>  /**
>>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>> -- 
>> 2.47.1
>>
> 

