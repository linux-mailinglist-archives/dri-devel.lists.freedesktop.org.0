Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72006A703CF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B090710E3A5;
	Tue, 25 Mar 2025 14:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KuE1kceX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF21B10E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 14:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpVSbZTS5Q9YtufW/kNBtoq0v7u5SCQIbqcK5fA6aMuLbGBbuPrCw3N1nvVMBi/5qQlLTXNbRJro0RYVdGzquZkTqg++oshV531yDluQgjl/vVTl5+ToFecnTseVcNbDYeRyFQ8DOT1KsbUe9oDcsvz2SeR0eew1s7kPbHMQG2W2ai/7B5XzYCXGoM6VLscpm24UiJA9eJNBppAzNbnrKcS85C9IcfWI59QiySZng6rXAJxiWgOlu+nue3mp95H5TWP5jIM0u2AGyxbYqAqcejzgB5n6d947pKyA02DJtLCvcO1MVo0QjAC8J5cMHp96IuUUylCAUra3+mE6Zn5OgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWQjZ+Sf3PnpBTKjPDTrSQjqdlcOwL94vIP8IHKhZ+Y=;
 b=lLigU47bXOqYMLMx1jswSWHZNnH6xZZNiYTwSwFR1GNgONydgJzOJVX3rl0UTYh66WukWViEFBimWSs87j5bGTfQiA/uqZvY6lwavauzNsM+JwS4+3PqpeYjgSYLQ7XLiBtNSpcn02LDbdZWbiKNKOLb+MBlhn3XY3PIHdt3NEJCi34RZ+BqjgGqXH9GhuaxTN5iTHdC+Py/jeLR3j915ec06GxWu8d2Q0kL4+0P3bOjQOBs+KW+LK9traGW+rdZu3Ef3IB21otm36OMJHtEXevPJ8SXNwwr6i+7hlr88Is0tdGJfpliJY915eDg6KHnfNo9MtMofeNulM58YjkJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWQjZ+Sf3PnpBTKjPDTrSQjqdlcOwL94vIP8IHKhZ+Y=;
 b=KuE1kceXOlSzOz7kL+qXtgqjOhtbKiMoV4L7eTmKgFGE2K2nO7QNaQGxJTOIGqLUBgkXc3JO88U2XRfozlLi7FYXuJgbgX0zKSlSHDDyjUp1PDetZqxuSmlnhzAOy6ekXlDi0nDXVZNAR2HRMhnpRcJN1voFmzrK9Ctf5H8XPNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPF0D2C72F0D.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 14:35:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 25 Mar 2025
 14:35:11 +0000
Message-ID: <295e3b6a-67ad-4b02-a91c-0719ec5909a4@amd.com>
Date: Tue, 25 Mar 2025 15:35:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Optimize DMA mapping for exported buffers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, simona@ffwll.ch, airlied@gmail.com
References: <20250325133744.23805-1-jacek.lawrynowicz@linux.intel.com>
 <92f87a44-931a-44af-9acc-65f0d062b611@amd.com>
 <afb06124-5e5b-4cf6-9e0c-c1740496c33d@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <afb06124-5e5b-4cf6-9e0c-c1740496c33d@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPF0D2C72F0D:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d090cd2-40ab-4835-906e-08dd6baa3f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czkxeXBSbzJBR0FobGtxRTM3bG9GNmF1bjdSUjhTUm51QlpjVENRc0FQK25o?=
 =?utf-8?B?RVcrcjRIVTNwNFZJR1ByanEwRXpBTWVLN1UwTEt3a3RZQlN5SjgvaWVLNGsw?=
 =?utf-8?B?U3ZCUVNRZ1dpMldEWDcyczR0bVREa2VGWktUdlZjdE9SWXNLblZoOTVTNDNz?=
 =?utf-8?B?VFlRaVN0TEp4WHBHMnAzdXhuVFlndG4yUlNZVmY1dzNiY1R1UUJUcnJ1MWh4?=
 =?utf-8?B?N2ZISTlHMktvYWZZQ2MvcWF2NHNXQkFWZktZQTZ5V0lDRGJRd3cxaWNlNWg3?=
 =?utf-8?B?ZGVBNEdnT1dPUk5UQVFIUFNrUk0ycDN6ZnJIVExNVHhUTE1kbUY0VTZnYTlz?=
 =?utf-8?B?SkdWRHIrWUJISlc4QXhqL2NQbXRDU01xOFhCaDJWcFZETEVlRkI2cHB5UlBa?=
 =?utf-8?B?UmlFNllqYk1OS2gvZTlQWnpjQXJUb0luam1vc055TWRqRHU5UDFPbG9PUk9n?=
 =?utf-8?B?STBHb3FtTXp1QWJaNjFRaEZ2YnRWUER3dGpOaEIyMHlwa0VjS25yZ2ZBQTU1?=
 =?utf-8?B?M3ZpWHpsRGZ0RTIxMzlPSkc1RDRFNndIMXp5VHhiNTB0WWVtWDNsdEFiLzJ4?=
 =?utf-8?B?bmFGUEJDc0RuaW8zdHdVaW1kUFZZM0xVemEzdWhnODYvRS9pS0VyTGFvWTlU?=
 =?utf-8?B?ZE4vUmVGWWlvZHhGRjRnOGIra3g1cVNWYkYyNzlkMHlQZFdnc3NFSGR3OXRy?=
 =?utf-8?B?dFpMM1pNd29Xcy9HQjhaUmJ5Z0wvZlptL0NiNFJDRXQzRUxYd1VUT2xTRTdu?=
 =?utf-8?B?bTJ2TUFHZ00zNzNrbmRXVlUyYzhmb3RGR3dvK0tqdWJNTFVySCt2WTIvWEVE?=
 =?utf-8?B?empUaVFEbWJlZS9WVjBNUjErVFkrOUpoZXh1eG45czZOVVpzYlIrRC9HVnl4?=
 =?utf-8?B?RzZKM0xpTy83Mjh0WjE3UW80N0U2dFJPa1RvbGFRQ3Q1ZnJGNmErRzY5aGx3?=
 =?utf-8?B?dDBVRjAxeEUreG9zR2NLZWxOendkWDhTNjlwTHA1ay82RGxEQmcvTXZnWnc5?=
 =?utf-8?B?WTlYUnRPQ2RxUGpWS3FrZmFiTk1tdk0xcTV5a3JHRkRLekVKVG9OVk1KYVZv?=
 =?utf-8?B?WHVkSmVMeVdqR2tTMGtqakM5VlRLaGZrNkhnYWdVSm11bU1mMXJLWHZsQ3I2?=
 =?utf-8?B?eHk2T3phd1l5YklXL2RGaXB3L2JPdW9hSWtSM213RmFqQm9PRXNmcnJid2hU?=
 =?utf-8?B?eUUzRURMcUZ1VEVsZmRaMDdPVHpNZ2NWMmRKdE5xaXZvazh5clFCd1hweEl2?=
 =?utf-8?B?ekFlbFhZVnFzV3JGNFY0MnpWSTdVSEQ3aE5tdWJPOGJYOUFBamtEUjdVTS9l?=
 =?utf-8?B?RjFtSklQYnpoaVlMa01hRGg4eU92NkxmNEJQR0k3Y29va1RuSTU3VmVpYTh1?=
 =?utf-8?B?K1A1WGNyQkNSUzAycEZPcHU5MlJoSTdSZnRPR2JFeEFTalR6Z0JPWitiU3JQ?=
 =?utf-8?B?Ti95T0pLcU1HaGhRcFFwa0Z5S2ZwSzkwaXJwVEdqRjR3QmtkNldyMUx3bW9D?=
 =?utf-8?B?a0RtNVBDbllFRzczM3hLMUd1ejNaRW9IUmtVUkhrbkQwbmxybjZhYkVEWVJ2?=
 =?utf-8?B?NDhpM0Faa21ockZCbzNOcnJpMEJCRkU4M1JZNWJteHhoaXN4QXgrMEoyV2tY?=
 =?utf-8?B?S0w3V2F1QWp3eVBGdGx2RlhrdWpZQWRQQmZMRFdBUjdzUlVDZlBuSFMrai82?=
 =?utf-8?B?UVVrcHZjOWVmd2xmbVVwVE43ZkowbGdYZTJUTENCa2lvQ05SVWZ5alVVMTVD?=
 =?utf-8?B?bktOYkJjMFd2OUo3b2dGMzNmQjdHakFVM1htNWlGMkxZalBvOThnRjdHSVpk?=
 =?utf-8?B?bllYZ0puc3pzYVBEV3Y4djFEWlRsZWtqNlROT3RoWG0yazBxSmc2OEUvdW5N?=
 =?utf-8?B?N0JrdnMzSU5aVys3NXplSG0yZkJsNFVsd1JUcVVGd1NlMkFwdnBCa25QbzZR?=
 =?utf-8?Q?UGsrtBi6kmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blJnbFNBVHljYlpYQ2k2QkZpUkJmVVlQbGhvek1CNXlwMFRhYWhiWFdNUU43?=
 =?utf-8?B?WmxkWDZCbDIwcUpoTFRzckdCc1hWRFVkaUh0eVptMnR3KzdNL3YwSnpRUFJS?=
 =?utf-8?B?V3YvanJnamtmb3hqR2wrTFYrRHdvcjJUZ2NPekdhelhrU3BJMFYvbGtmaldP?=
 =?utf-8?B?UjVqTUdhT0g1WVFIT29rbUp2c3J0eDllRkFka1RqamFNOUVVZnZFVU5ob3pz?=
 =?utf-8?B?M2xsLzFPOXlURjcrY2x5VXlENjd2c25VWG9lREVQM3BqUXFUWVV3K0JicGJ5?=
 =?utf-8?B?NnU4dDdrU3lwSWZDeWlqWCtKY1YyOE5VSGhHMVNnL0xMUTBIekhPaU9pNGQy?=
 =?utf-8?B?ZkV3NitEclVLYW1HSUJ3YVhPQ1hhakVyK1JTYWtFcGt2d1B2ems3LzdOdXFV?=
 =?utf-8?B?UURTNG1vVWpIMG5vQVBSYWswUU9HcGNXazBhTEM1N2RPSTFlT1B3d1N4SHUv?=
 =?utf-8?B?NkRIeWhxRTNwd0xYNEtKVGpQSTRwVEtObmlneXhNRHVLUTNOYzB0UzZBb3E4?=
 =?utf-8?B?Mi85UHhFU05BY0ttT0lvUUVIOEc1cE1IV0lkalpOdTlMWUhCbjB1OGNGV3di?=
 =?utf-8?B?eXlYc1hUWVNlajE3WmVubmJ5bTFQYUJVRGJzbnM1TlNVbGlRU3B6eENCMjUr?=
 =?utf-8?B?YUJwd3QvUW80eldjTXR4dGxwYTVRcy85bmRvRU9JMUJSR1R6VmttNTY0WWxk?=
 =?utf-8?B?ZWpkQ0Y1YXlkS1V6blNvMFhHY3RyMjFCZ0VNdlh1b3BtSXAzajJGdlJySk5W?=
 =?utf-8?B?cHVGOWZhaEl5WENIY2dUMUZvYnJMTkdjeU9mbjZ5d0g1TURYUHN1VUV6cDNF?=
 =?utf-8?B?UThDalZIMWlnbDRNa3BJQTRyY015Zk9xQUFkeTQ2MWoxMTlKVHFEK1BGQlcy?=
 =?utf-8?B?d2JkQ0pDRE9TTTNDSmp6Wk1Qb0hZcFZVdSs1cDlMR0Vla1NweW1BZDV1MENa?=
 =?utf-8?B?L0J5ZEJTbndTdjZmSTByNlZuOFRLL3RkdEd2dTNMZFpOTWxBalBrbFRsN1gy?=
 =?utf-8?B?dU1TMnlPUWYyZUtsS0IrVTFYVm84dVdhY2dGRTJvSVhZZDRKem56NEN3ZWp1?=
 =?utf-8?B?T3F2cnhndDVtT3l2SVhwVXEzNXlZcGhIcTBTSkFGdDQzZVpYeUFjTUN3bXM0?=
 =?utf-8?B?NGxIdCtnKzU1aTRPbEliMXZrVXd3MER4WmprYnNlaFQ3SG9NM3FnaUgvVW5B?=
 =?utf-8?B?YlF6SlZ0Z2ZqekZzRENoYXFvUTJlbW45azVXVTZJT25sVFZrUmZ6TzR2R1Fx?=
 =?utf-8?B?T0dsSTl3UVNCekRqME1ma0REQ1VncFdvT3RSbmhqVDM4dVZWNy9tU2c5K0s4?=
 =?utf-8?B?dzFHdUx1T3pacnNJaStYL2lrUkEzOTY3RGJuR1hwVzBxYUNIcVRQUHExa3Fz?=
 =?utf-8?B?T0RWaUFrT2dGWWc4czRHRWpteDlFMXpzaGtkV3FNTVpLOEp2ZjVKdU90ajIr?=
 =?utf-8?B?VHpuYzd2T25ucVVkbWpvMWVSdEpoOXJXR3hqYjVtU1c5VWNmYkxNcTVpakt6?=
 =?utf-8?B?U3k1OTVlMUtrekp5NkVnS3RSbWVKVkd3YU5QWjFuZE9yWWtMMWhDanBVRE12?=
 =?utf-8?B?dEYyRHJIRkFBOThUTTVSK2R4dFNVYVFKL2lxcGJ6Y0RtTzJ3RmwySmk4aUtt?=
 =?utf-8?B?K0VzRkRUTDBsUGVnbGEyeFRXZTJ4RU1Jc1VsOTgwcHJYeS96R2hRdHJRb1Ar?=
 =?utf-8?B?RW4vTVdFOC8vWGVvcFBMTzlsTWFyMFd3MlhDdjZKWHZBaUVTMTViakV3R3o3?=
 =?utf-8?B?NUVSL29IR2ozN096VWdNallRWXJFcWJ5bXR2d1BITlE4TFgva0w5TXljR3N4?=
 =?utf-8?B?VmVjM1J3WU9TK3llVkxoVFRERlVRWXZMbkJrT05ubi9MVUttUENXYklBRk1i?=
 =?utf-8?B?dDRxZkxtaGF6N1RCU2YxdjEyRld6VHZPMjBqRjVxS3ZFK2FpZE8raEtSTUlM?=
 =?utf-8?B?VWU2a1pXU2Y2KzVNTER2WlZRY1VMYmlKYzlFc25kdzMzOEk1aEUxN1RsTHZ1?=
 =?utf-8?B?amNrNnNBU0s2OXZ6TFEzYnJKcVQ0eWR6TFlDUnI4eEZ4M2xxTi9qbXEvalpO?=
 =?utf-8?B?dUpGQjByRStEVmZUeHBhMkRneHJZOHNVOEpWMlpvaW5lbEoxOGVDbGQzNHV6?=
 =?utf-8?Q?1MjEEXXaQUsPwv5Y0zv+sbb1d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d090cd2-40ab-4835-906e-08dd6baa3f2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 14:35:10.8881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMNkpfzDyU3v8Wo7q4Le7NlE2/M9E0eW9pwfc8CbnbXmYv8tcDMkp+Fl0o8zO9w4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D2C72F0D
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

Am 25.03.25 um 15:14 schrieb Thomas Zimmermann:
> Hi
>
> Am 25.03.25 um 14:53 schrieb Christian König:
>> Am 25.03.25 um 14:37 schrieb Jacek Lawrynowicz:
>>> Use DMA_ATTR_SKIP_CPU_SYNC flag for exported buffers during DMA mapping.
>>> The same flag is already used by drm_gem_map_dma_buf() for imported
>>> buffers.
>>>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_gem_shmem_helper.c |  8 ++++++--
>>>   include/drm/drm_gem.h                  | 12 ++++++++++++
>>>   2 files changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index d99dee67353a1..8938d8e3de52f 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -699,7 +699,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>>>   static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>>>   {
>>>       struct drm_gem_object *obj = &shmem->base;
>>> -    int ret;
>>> +    int ret, flags = 0;
>>>       struct sg_table *sgt;
>>>         if (shmem->sgt)
>>> @@ -716,8 +716,12 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>>>           ret = PTR_ERR(sgt);
>>>           goto err_put_pages;
>>>       }
>>> +
>>> +    if (drm_gem_is_exported())
>>> +        flags |= DMA_ATTR_SKIP_CPU_SYNC;
>> We should probably just unconditionally set this flag or not at all.
>
> A question to both of you: does this have an effect on performance? I'm asking because i have a bug report where someone exports a buffer from gem-shmem with miserable performance. Would this flag make a difference?

You can usually skip the CPU sync when you are sure your device is coherent to the CPU cache. And that saves time since you don't need to wait for cache flushes to complete.

But that is completely independent of if a buffer is exported or not.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> Otherwise we could run into quite some surprises.
>>
>> Regards,
>> Christian.
>>
>>> +
>>>       /* Map the pages for use by the h/w. */
>>> -    ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
>>> +    ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, flags);
>>>       if (ret)
>>>           goto err_free_sgt;
>>>   diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>> index 2bf893eabb4b2..7c355a44d0a49 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -589,6 +589,18 @@ static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>>       return obj->dma_buf && (obj->dma_buf->priv != obj);
>>>   }
>>>   +/**
>>> + * drm_gem_is_exported() - Tests if GEM object's buffer has been exported
>>> + * @obj: the GEM object
>>> + *
>>> + * Returns:
>>> + * True if the GEM object's buffer has been exported, false otherwise
>>> + */
>>> +static inline bool drm_gem_is_exported(const struct drm_gem_object *obj)
>>> +{
>>> +    return obj->dma_buf && (obj->dma_buf->priv == obj);
>>> +}
>>> +
>>>   #ifdef CONFIG_LOCKDEP
>>>   /**
>>>    * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.
>

