Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9BC7AA8D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778A210E8D0;
	Fri, 21 Nov 2025 15:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gKNsLXAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916A310E8D0;
 Fri, 21 Nov 2025 15:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J533CA2yK+uwgFVajbyIfSpjVi+ZEzdV1XEHkFnQR8BNL6wgPZP0ymrLA0pp6aBdl7GLqm9vzGjwGc6qGnaZ4I3xZjM1VGsLtT2J0FR6+VytgLIbeLJOpoA6dT4D/p6wYlPBXxRmz/ihDcu0UctKU1/MAA9Udyw2hIWMwGQTtJyFJiRW+maDBWFjzp0XVj2SvHo5Jt84A4nn1pWyVlZXq7AT1Qgu7yoJ97F05Y/pPoPre5OqgCr9Eu4pJpwo/ucHFCoqgFXc37MfVJwonImYo3Tso90mfMa9Is4nvF5kLa/1GFQN5jjBPrKuc3Ur6OgtnyEPiOpBcC6IRzy8FtCPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4spVH7k5XMYgK3l3Cdmwxffbek6aXmtkgdVpLl0IYQ=;
 b=MQNhrzgM002S1j5br7Hwi5tZOovmnaNoy/j0r6xVr3CXFNZKUgtJc8GIGvnMXUlClGSFL/rpHittJ2zUoYYcAsR8nOw1776+sfwHsm8SnI7jFlbKUO7rehCplOOsOn2zXuOYrq6di9UpH+LCCGFqlx5/e9rQFe+qmjz85bFb0MGytca+iTfgE1Wp/vudINPRaut33CEAufpPkAYHly4Ir6YGY6TxxcNsEBr7UZkBnw1sYY+4m8HTGC3eRUJNL82LoxeT4aiIVeeodOHtJDbPK3KYIOr8uYbcqx3mnReli4m4oB1vUEf7vLOm6JYyDgW35viCR6BuNwnbnPgYJ1qdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4spVH7k5XMYgK3l3Cdmwxffbek6aXmtkgdVpLl0IYQ=;
 b=gKNsLXAkxvRgZQNBZSgesAvbAJImsGILCFOqE/9Tr/SNt7oT436pFJvS2JZ16UkTK04pNHAJSEvIIfo2XcEBC0eocrqzMVK6rSA84/6xgh8m+n1xCUrT34UtVXCSUlhML6g6Ulk3iLv7PDciSzvR292WCOMg/31y832eUrhmpYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:54:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:54:10 +0000
Message-ID: <43acfd2a-8a8b-4ca1-9435-a29ed77a3cba@amd.com>
Date: Fri, 21 Nov 2025 16:54:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/28] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-28-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-28-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9599a1-75bc-4105-ad0e-08de291635bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE9Rck56MlBYMmgrdVdlbkVBZXNBdkNVUjY0Y29Oa2RlNG50enBZR2xtWkFJ?=
 =?utf-8?B?bG5zQjQ0VGNrSDI4Y0VaSzN1eXJiUkExYjVMNDhTMFRpaGljWXdYYjBxaFVY?=
 =?utf-8?B?Y2pYekVxdnNzQi9DUDAxNTZod0VFQ3UxZTRwVmViL1Q0OTltZ3M2a25TVStp?=
 =?utf-8?B?Mk5yeGpuTE4yVWZWbE1YQTFQd3VrLzh6bjB4TGlIUmswdjcwZFp5MjdlbDZO?=
 =?utf-8?B?TVd2QmlaZUtiUnh5Q1dNLzU4a2JEbitHa0o4TWoxOFpNRlBHMVRUQVhUY09C?=
 =?utf-8?B?VEQ5UWY4SVhXL0VhMHFyU2ZLUnNrRC8xOWpUeXdobXVPdVFCNnExZi9KSFk5?=
 =?utf-8?B?Q3ZIc2Nrc1hid0xSWVRNR1V6a2VJWEhrb1RQelU5RCt6cGtqZXZjeUphRC9x?=
 =?utf-8?B?U0dtRXNKSnlqaWNrTmRWQ1lBdE1KMTBsSndUejFwK1RWSWMyb3p5SCtlMExJ?=
 =?utf-8?B?N0J1SVNRUGtqRG1oZ250RVRScExzcE8ycUlTeU85bm9uM2Y0MmdtRjNZNk03?=
 =?utf-8?B?eHorcEQvdVk1L01aaUhRZHNuQUNnSjFaeHlUbUZCTERGV0RhRStGTVQzYWlU?=
 =?utf-8?B?MWs1QlBNYWRrTjlLK1FXbWhtUVlsOVI1TWZ0Sm9lYmF3SXMwMDMwcTFzbHlS?=
 =?utf-8?B?eTBqQkhVL3RKaG5JajZnTUpybFRwYkZjT3RGWlhVZE1jU0s1c0xPNFk3c3Fs?=
 =?utf-8?B?R2VLdTBPeVNJK2RpWkxwQUNGamFiTDRMbjVBZk4yQTRDNy90dkJUbnluR0hs?=
 =?utf-8?B?cGp1TjRPS09jWS8vUmN2Zy9aME0xTUNlbG5xbUs4ZDhBN3FGTG1WdnVmaHow?=
 =?utf-8?B?dFBRMmQwK2svTkJLSFpXOHFXZlBqclhULzl6L01iaTEyQXdQSFdwSnVMM1Z2?=
 =?utf-8?B?Q0VFb1pTZDF0dEJXU0hyVk01R21iU2FlREt5bDU3b2lQTkk1VGltLyt3NUpz?=
 =?utf-8?B?NHdSWFNUcEs1d1YvdmR4bG5RejM1NDN5TEVDRjR1N0dqR0pCQkNZSUQrT0NE?=
 =?utf-8?B?VnhCS2tlaEhRdFpHVjdQeEwweU1qS0E1OE0rUUtjbG9PTjRZbW9mdmNDYTNo?=
 =?utf-8?B?bVZ4RFA3akM1VXFuTGhRRjU4eUpBWGVEazZ5R1dENXpaYk80SkNBbnNQZ0J5?=
 =?utf-8?B?QXZXc3FOMytjdWRJQWtGMXlBT3Bmajk3QWtrdXJxZW1McElpaW93aDM5VW9z?=
 =?utf-8?B?RFpvM3NxdVRiRjEraDFleEcwSjFIUVRKb2E3aThncTJWS3o3UlNUcGdRWjRh?=
 =?utf-8?B?UzQ4UUVWQnpQWmtYcklUd0dHdTg5MU01eXRWV01IQ0tFWkY4c0NpalkxalVI?=
 =?utf-8?B?c3Z1cnBUaTZ5SFhxYnhwVExheEpmdllVZWEwVEM1YnR6b2hLUytSYTc0NDF2?=
 =?utf-8?B?eDh3U2IydDcydSszRFNVR2JJMkdMVXBiM3RZaWc3L2J6aCtqTEZPYU9YSDV6?=
 =?utf-8?B?UVRvRy9OSHVYcWk2N09Cb09Oak4yQzUxY2xUeG05VjhzbHZacGQyR29FbWtZ?=
 =?utf-8?B?ejhVUURYbWdoR2lDWUVzZDIxN0UySEdTTFp4RHdiWE5MOEVjVVkxVU8yeFoy?=
 =?utf-8?B?a2xOcFp4U09mUDVFakUwcCtuRlZOV0lJbXdyYjA0SnVBZjM5YjczbTZyaXJE?=
 =?utf-8?B?K21lQnBoYS9XQjZoamJKMWNoOVZWS0FHSGlnYVpiR0dDaWxEczVXT09sUFgr?=
 =?utf-8?B?TE50NDY3NUJiSlF6RlJHaDZ3VGlsaFQ4Y3VDK2NJRWx4Q0NhdGVVb1h1WkhE?=
 =?utf-8?B?UVN2aUQxM0RDMXBKaHVEMzYvTHNtWmFjQ3hBRktORVRUTFRqQXg1dm0ydW5m?=
 =?utf-8?B?dmliajJTcGd0UVFFU1FuNVZOQ3BRc1dWQmxDWDdGWnN1L01ocXBQOE4vWHoz?=
 =?utf-8?B?ZFJyVkI4Mml0YVU0b0xDdi9FbGlDamVNV0twNVZ1M3RrUUpoWGF4RGE1WlVW?=
 =?utf-8?Q?E95kpENcBz+8Jd2sZyoV530v9xdPtVQG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUs0ZnN0Q2lYdllOZjJlb1I0VEF6akhEWVNzaXlnK0VtYkZaUENlZjBGNnJH?=
 =?utf-8?B?MUVKY0tmVWdaWEt0RWdnRkFhY21DVHJKWXoyRjRBUGlWNXh2MFV5RU9OSlp0?=
 =?utf-8?B?SHRidm5JRlU1NWZhYjNLY0JjVE1EclBuOVN2NEtscXQ5M2JIcWZMRmhRcTdT?=
 =?utf-8?B?RkJ2Z0wrUThrVzlrcEE0TEtPQWZ0KzJ4eC8ya0dTZGJuNkl6RmU1OUsxQzgx?=
 =?utf-8?B?UG5SZXR5M3hZaTBqNVlFY0R4QXo1NzVZaFhiRE1NMklYeldhVDBTVWhvNElX?=
 =?utf-8?B?TDlaRFBkTVlsSXJ1RXBPbTAxdjV1NjlXdTg2QUZxcWJ4MlE1aEhzWnNqM2ZS?=
 =?utf-8?B?V0k3Ny9TWU9Ga1hxSmFCYkErb2EwTzUyMFNtUFRyNFc0RURGZ1lLd0RqMm9X?=
 =?utf-8?B?NmdxYVpheVFsYUdSYXJueGZUd3R2ZW5QenRaR0FTVzNzTlpHN1lLWUMweGN2?=
 =?utf-8?B?SVU0NGlXNmpWSElrY29jeGlIU29wTHAvQVF5WXlVUHRCZGJQSVNIaHNNbGVX?=
 =?utf-8?B?UGNZUi9yRGhLVWx3Ty9rOEtVRWsrays3b3Z5WGF5dGhCSjBGNG16aXFTeWRJ?=
 =?utf-8?B?OWZCWXIwc3JSbjQ3ZE5ZV3RRcFZMMjhyNTBxVzJLZThnWmpac1daamJZcG5U?=
 =?utf-8?B?UWtPeGF6OWg2Y1lKZjNCNzgzaE0rM1RCNlA1V3QzditTeVdOc0lFWE1OeEhN?=
 =?utf-8?B?OUVlN09lQWJEa3gwc0RUd1pIVFpvQjhHbWxqeEkyaU1VSVBJUW9wbHo5QUZK?=
 =?utf-8?B?MXk4b0JubDcvemxxcnRZNnhrcTcwNElENUdhOC96MVJBU3Z0ajFISGtuUCtq?=
 =?utf-8?B?cVhDbVM4MjFnL2pydHJCQWUyRlNNbzJZbjRCRXljU0xWSlJuWk9ScVZrMTZM?=
 =?utf-8?B?WDRRaWd1czZyaldUVEpZeStzeTRyeTRPOE5oVTJrVGgzQ2FCQjBUNkhSdDd6?=
 =?utf-8?B?S2ErMEJwVk1WNXZVd3ExakNvZ3RQWlZvWVRGdzR4OFZCakZTbUkwbjF2UnRQ?=
 =?utf-8?B?dDBTekpRbjRlSUs5Q2NQdXcxRVJ4WldUOE1aZjhZaUtaellZZ3dQdVJMSUZ4?=
 =?utf-8?B?NW5oNy9sNGlacm5QQUhtcVBKRWh5UXJqcVkwd0l0SDNxaHQxRmhaMVE0bDN3?=
 =?utf-8?B?Y1lCYzZOR2FSUm54b1B5Snhma3lZK2xHYVRBVzltaG1vaW9LV0RIYVlFNGlh?=
 =?utf-8?B?U1dnMmdpUU5pVnBuRk41enVnaE1zWUFRSWJVNGxLRHJFdXYvT2k5Ym0zeW9M?=
 =?utf-8?B?ZTdCc2IxelQ4T1hURW1VVWEwRWVya3dBSFN1S05ISnpLVkJ0Q3hNTThOa1pE?=
 =?utf-8?B?RG5rYUllZFJBOEloL1N0NytvS04zQXJmYWhFcWIwWEFNRGVnTEFKaGROcUdm?=
 =?utf-8?B?S2hWSDVseWZqSmVNa2ZKSzhRbXJKV0p0Q1h5OE9GUFBNeW9HWDV6Z3pMN3VZ?=
 =?utf-8?B?bGxJQUwxazNpbEpOaEdPTXVtTjVjTW5GYk54NGQwTVNNdHFBMzZ1ZTF2VmVl?=
 =?utf-8?B?Sythay9uV3Ztd2NBdHJyVGVJN1V5ZmFZcCtqbHVRbE1HSDBtalE5NnlGYzBi?=
 =?utf-8?B?d3VRQjRkbXhqc3hBZ1lzRzQyN1hNd3NyRkRBdVY1eWEybFg5RWVYU0pDY1ZF?=
 =?utf-8?B?VnhqaWxhK0Via0oxSHVWcTdQcXZEN2pNYjB3STc1TEx2S3VjOTdPWndFbWdB?=
 =?utf-8?B?dHIzSXhLYzhZUXh6dEJ2R1E0dkZyRk5odjFpaHExbkZjcTRJSFMzNlZ0dnZo?=
 =?utf-8?B?MDNEeHp4UXVKbXZuNEhvM0RRdEtBbmpjNzUzWm50Z2hpZzlRdTBSa3RqU2Jr?=
 =?utf-8?B?WklRS3YzN0dMUVd5SVQyK24yRXFwSllzMyszcWVjT2Vvam5aN1ZudkRFTjVQ?=
 =?utf-8?B?N3F4ZWh0aUExcFcxNzU1SmhkK2NONkE3ai9WUzJtZ05DTW1hVDMyNCtSWm5r?=
 =?utf-8?B?NFo1djBEd1ltbEM0UUlVZDZPdmgrcGtHQTUyVW1TZFhrbmpLUjh2bWsraHF2?=
 =?utf-8?B?Tk9xSGxLNFVENTh2clkycWxkbDNHaWZqYlJSaUpIMWFGNDNETFNCQXhHZTVo?=
 =?utf-8?B?aWdyR3huRVlTYmd4RmpXVjl0OFcwL1BNSm45ZG1vdkUvc29GUTRlNUdNTjJm?=
 =?utf-8?Q?jLFO8hr7AQpvWO0J/EFsXei4j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9599a1-75bc-4105-ad0e-08de291635bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:54:10.3810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muuPxCHEteAiXMKlmgE+eRvoHctW/c19WcNuQvg5RPb5BAcRwLt13W3e1gDkAjAO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> It's doing the same thing as amdgpu_fill_buffer(src_data=0), so drop it.
> 
> The only caveat is that amdgpu_res_cleared() return value is only valid
> right after allocation.
> 
> ---
> v2: introduce new "bool consider_clear_status" arg
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

It would be better to have that ealier in the patch set, but I guess that gives you rebasing problems?

Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 90 +++++-----------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  7 +-
>  3 files changed, 33 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 7d8d70135cc2..dccc31d0128e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -725,13 +725,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>  	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>  		struct dma_fence *fence;
>  
> -		r = amdgpu_ttm_clear_buffer(adev, bo, bo->tbo.base.resv, &fence);
> +		r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
> +				       bo, 0, NULL, &fence,
> +				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (unlikely(r))
>  			goto fail_unreserve;
>  
> -		dma_resv_add_fence(bo->tbo.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_fence_put(fence);
> +		if (fence) {
> +			dma_resv_add_fence(bo->tbo.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_fence_put(fence);
> +		}
>  	}
>  	if (!bp->resv)
>  		amdgpu_bo_unreserve(bo);
> @@ -1323,8 +1327,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  		goto out;
>  
>  	r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
> -			       abo, 0, &bo->base._resv,
> -			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
> +			       abo, 0, &bo->base._resv, &fence,
> +			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 39cfe2dbdf03..c65c411ce26e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -459,7 +459,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  
>  		r = amdgpu_fill_buffer(adev, entity,
>  				       abo, 0, NULL, &wipe_fence,
> -				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
> +				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -2459,79 +2459,28 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>  }
>  
>  /**
> - * amdgpu_ttm_clear_buffer - clear memory buffers
> + * amdgpu_fill_buffer - fill a buffer with a given value
>   * @adev: amdgpu device object
> - * @bo: amdgpu buffer object
> - * @resv: reservation object
> - * @fence: dma_fence associated with the operation
> + * @entity: optional entity to use. If NULL, the clearing entities will be
> + *          used to load-balance the partial clears
> + * @bo: the bo to fill
> + * @src_data: the value to set
> + * @resv: fences contained in this reservation will be used as dependencies.
> + * @out_fence: the fence from the last clear will be stored here. It might be
> + *             NULL if no job was run.
> + * @dependency: optional input dependency fence.
> + * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
> + *                         are skipped.
> + * @k_job_id: trace id
>   *
> - * Clear the memory buffer resource.
> - *
> - * Returns:
> - * 0 for success or a negative error code on failure.
>   */
> -int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
> -			    struct amdgpu_bo *bo,
> -			    struct dma_resv *resv,
> -			    struct dma_fence **fence)
> -{
> -	struct amdgpu_ttm_buffer_entity *entity;
> -	struct amdgpu_res_cursor cursor;
> -	u64 addr;
> -	int r = 0;
> -
> -	if (!adev->mman.buffer_funcs_enabled)
> -		return -EINVAL;
> -
> -	if (!fence)
> -		return -EINVAL;
> -	entity = &adev->mman.clear_entities[0];
> -	*fence = dma_fence_get_stub();
> -
> -	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
> -
> -	mutex_lock(&entity->lock);
> -	while (cursor.remaining) {
> -		struct dma_fence *next = NULL;
> -		u64 size;
> -
> -		if (amdgpu_res_cleared(&cursor)) {
> -			amdgpu_res_next(&cursor, cursor.size);
> -			continue;
> -		}
> -
> -		/* Never clear more than 256MiB at once to avoid timeouts */
> -		size = min(cursor.size, 256ULL << 20);
> -
> -		r = amdgpu_ttm_map_buffer(adev, entity,
> -					  &bo->tbo, bo->tbo.resource, &cursor,
> -					  1, false, false, &size, &addr);
> -		if (r)
> -			goto err;
> -
> -		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
> -					&next, true,
> -					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
> -		if (r)
> -			goto err;
> -
> -		dma_fence_put(*fence);
> -		*fence = next;
> -
> -		amdgpu_res_next(&cursor, size);
> -	}
> -err:
> -	mutex_unlock(&entity->lock);
> -
> -	return r;
> -}
> -
>  int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  		       struct amdgpu_ttm_buffer_entity *entity,
>  		       struct amdgpu_bo *bo,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,
> -		       struct dma_fence **f,
> +		       struct dma_fence **out_fence,
> +		       bool consider_clear_status,
>  		       u64 k_job_id)
>  {
>  	struct dma_fence *fence = NULL;
> @@ -2551,6 +2500,11 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  		struct dma_fence *next;
>  		uint64_t cur_size, to;
>  
> +		if (consider_clear_status && amdgpu_res_cleared(&dst)) {
> +			amdgpu_res_next(&dst, dst.size);
> +			continue;
> +		}
> +
>  		/* Never fill more than 256MiB at once to avoid timeouts */
>  		cur_size = min(dst.size, 256ULL << 20);
>  
> @@ -2574,9 +2528,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  	}
>  error:
>  	mutex_unlock(&entity->lock);
> -	if (f)
> -		*f = dma_fence_get(fence);
> -	dma_fence_put(fence);
> +	*out_fence = fence;
>  	return r;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 653a4d17543e..f3bdbcec9afc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -181,16 +181,13 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags);
> -int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
> -			    struct amdgpu_bo *bo,
> -			    struct dma_resv *resv,
> -			    struct dma_fence **fence);
>  int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  		       struct amdgpu_ttm_buffer_entity *entity,
>  		       struct amdgpu_bo *bo,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,
> -		       struct dma_fence **f,
> +		       struct dma_fence **out_fence,
> +		       bool consider_clear_status,
>  		       u64 k_job_id);
>  struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
>  

