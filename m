Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2C9F48E4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6EF10E0D8;
	Tue, 17 Dec 2024 10:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kAGWZF+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D3E10E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:30:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orNGAO/pB06f34gUYHWpZ5ipN2LK9xXTtASHQFF/VUOIKs6/GGFYDnMrfRU3ciBexFIO0OBv9mVfy7+dC6ia2QzlWJ9fcAGj/i0gjo5MX0qYcPqy+OmoHe5lJeEEKdvNUvAWkp1bCWPrBJvHDPBHSUgMqdEFbX4c5vc/yDMZqcHxkO0z8PXxK2pg6MnUnEa729Wl+qDUjEV7ZmTBHrjdYs6I/2SuXd2nWKOy+qcw866ClxXOubzQ99KvDdI9zgOvy/AOOnTUusrk0WEkHve8OXPV75Pk2COA8d0zF88oXAQDJCKommA7rWx5rkRntjUjXP/afE+jm9hFIMGo50D82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlBUz882cq5O/5Gu3lHuKBDur6L2JFBcWG6snyLXRZ8=;
 b=aqT+1pGrShB4zrBBuEFLvxz02HFbIoR9jllRvJBG4sj3UEvDUTpe4tJ3B788Um+VSBYQDfkjZIAesrqoaTK/1vfJMdcO2CRc5vWx5tEw/2mFfcBiGdlhjDkzMk5C0nR8E2ALDxv5SmMauIE8dillY6VUYiEhe8Udgq5UuyFHgKQDAT02c7AnTm1Vjh9zsI62/pCdwERJgUF49bIAZuLLaQ7R3faPHEVpcmcovHm5mNUJW9uqRitzD0geEirI616QZNsHP9WiU2R4YRrj7vp0+uOjOdkM+kGHItZxN+2v/ZH5SV+A/luydMmx8a9rB8LfumJJgYeh4NO7oWD21WDK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlBUz882cq5O/5Gu3lHuKBDur6L2JFBcWG6snyLXRZ8=;
 b=kAGWZF+4tx+9kNaPxbhMLBGZSxNIGYiFTVUMKc2Pw4IbarBxivR3w1n6m5ytiSC4prIvu0UWQUGQRZlpwEptXpYNw7cpjKNJe5j2iDpAL60nr/Hjcs1ff02TuALgn4tPAPEmOaawU1uSnMYtkd6gz2HVBomI4u1wYJNvMuCvPs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 10:30:11 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 10:30:11 +0000
Message-ID: <2147b626-f305-4b3c-93a0-14b5b0845e89@amd.com>
Date: Tue, 17 Dec 2024 11:30:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/vc4: Use DRM Execution Contexts
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-2-mcanal@igalia.com>
 <tmg5jqpts47oqwuohcutyw44nlhvjz44ctsxogtwvjeky7hdwv@ykux7b3rrsco>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <tmg5jqpts47oqwuohcutyw44nlhvjz44ctsxogtwvjeky7hdwv@ykux7b3rrsco>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|PH7PR12MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3beee8-e612-47b3-082e-08dd1e85c92f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmxDeU1TK2hML01zV3QrV3FzUEhhWFJydkxGaGJHL2NyRDFJMis3L1ZZUWxW?=
 =?utf-8?B?cjNzeldOdFJPMWM2UFNKVFhNc0wrMUZBZHpFK04zYmVhclR5VVpSbmJSZFEy?=
 =?utf-8?B?ODJZQ2duSHd0SWZrRE4zaDREUWlobDRFSFZuT240MGtOTzRJMXZhMXVnN0Fr?=
 =?utf-8?B?djdXR2VDbEtmdmE0cTNOdHJ5R1ZkN3lFdGh5bVUyU3poVnZ5VUtCOVEyR1dl?=
 =?utf-8?B?SEdteW5haUhtSElyZ1BFblNlMlNpQytZLzg4UGtESTdFN1ByODN3anBocmtI?=
 =?utf-8?B?L0lFMjJxemFxcDlZSXVxRjlRSDRvZnhYVmJBMXE3OXdFcW5ERGRLU2FncjZ3?=
 =?utf-8?B?NVc4K1dVdU13ZDl2dW1pTnI1RDVWS1ZaWlVDd3VRVms0WStJaFNtYW5aM0pD?=
 =?utf-8?B?SWVmUkJGQmVZcU85ZkpYK0wraVB4QjRNU3dmNzNqVUM2K1RPaXdSWCsxc3pN?=
 =?utf-8?B?dUkzSC9tNGhkR1FGUTN6dC9pZ2VIU3dodTM5amJCd0dRaUxyVWxqMnJ0dlRy?=
 =?utf-8?B?L3lSN1FxTUdwUWllS2pHcGk5dDVXZ3pVQmdCRFRiUDYyMkErWUZJYytaSnFv?=
 =?utf-8?B?akFXcm5wTXNObnlLQXF5OURSN29kTkF1cnFiVUJhdFRMNndwSk96Q0gyY0dN?=
 =?utf-8?B?RVN2RnhWWTJab1F3UGtTL3MrT1NOT0YrNzBVMVVWSndXVEVrbWk5aTMySW5l?=
 =?utf-8?B?ck4veXZuelVOVXRPeUVNUzYzWDFHb1NDZHg4bnBkbUs0VXJGN3lvcmt0eHlC?=
 =?utf-8?B?R3dZRU9vSEV3NkZNeFRUTlRWaHlDWkNyS1cwMmtvMDM2TEo1RUZ4T2FuN0x5?=
 =?utf-8?B?YmkrRWV3TGVsK3lSUGgyM0g5bkxRdmRYRCtESHRLdUhmaHRicUdlVlE0Ym1n?=
 =?utf-8?B?Skd2aHpBbldqZmlVVlcydFdiSlh6NUhDd3FiNit4OENHQmsxeTA5d2REbnFJ?=
 =?utf-8?B?eHNvZmRvOGhUdW5IVkZWY25sbW1KaWQrc0l4S1l0WndmYjRDVjF2OGplLzFt?=
 =?utf-8?B?V2JoWWQ4cWYxcUdrTlhsdHMrdERvT3RYZzAxcUJobWVwYk4yWncyZmJtQVNS?=
 =?utf-8?B?ZmUvMXVQcDkxQnZxUDREWE55c2x6OWpmZllMZFl4TGwrdkRVWXowQmk3dWcv?=
 =?utf-8?B?cDBYMm52LzhSUDdZNUU0NDJOdVBkcmV4bllJcU1jM3EwTmhnMzB6LzdMYW0v?=
 =?utf-8?B?SjI1Z3RJcW85SHVWVW1tYlJRNnFHZGMwa0x1eExjV3JpVmFIQ082TE0yS05I?=
 =?utf-8?B?aDd2U3Rza0F1cHhWamRrcWhCczBSZjNCYnhTUUR3T0ZiUk5QWjJrOTg5M0h1?=
 =?utf-8?B?Rk8rTk1sS3RWYnkxaCtreWk5aTVkWmxNNnNQaW05QVUzc0Z2bnR1cUwwelpx?=
 =?utf-8?B?bmUxMHhPR1ZYTmpaaGQwT1NTSHdQTHgxdThJYWJTY29LRDVyNzBKWE9SZmY4?=
 =?utf-8?B?YWJXaVYxVEo1WjBNbUM2L2E1b1RjdlFiVEpycGROS3lhaFRtWXhvRUFjMFVL?=
 =?utf-8?B?MGF0aURITnJRT1MzdEgxNFNUQWJlcjN3UUVDMVlXandpZWp2d0dRa3Nod3NR?=
 =?utf-8?B?R3V2VWRiQ3pkU0diZEl0WXI0VTFqRFdJYUgrczluVEt5ZGVLd3BPSG9SN1d2?=
 =?utf-8?B?dXdBY2k5US8vbFgzRDZaL1pOY3YvbEcyRXppcmxvUlcvQjczNzMvb2NoQ1hy?=
 =?utf-8?B?RWtpU2pIY1VCSkxzbUFmZ0tsQUV5a3podGJkNnVKbi9DWTR1Sk9Wa2NWN0t6?=
 =?utf-8?B?ZFBKZE5lUmRkaFdmUkNtOGpFYWZNa3NIS1NOM0wrTTRpMTBuenF6SUxQZndu?=
 =?utf-8?B?NlpCZDVNZG5zRlJEOHhrTHZ3eFR2aXBMY0JXaDlsMTUxYWd1MkRVY003cWdD?=
 =?utf-8?Q?C9mES+mADyAqr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzhUc3gyTTRBMy9NVkVGbFhkR1BZcGhMK3FDTHZLUGZsQWwrNitvaHFOOUhY?=
 =?utf-8?B?L2h4ZGtyNmZUWGR6bmJMWXg5NjJnVXdUNG8xSS9vTnJudmZ6SEdvQm1selJm?=
 =?utf-8?B?VUpnQ1dHM3N1cDFqUUFQNTRNM0JqSFBUbWFwZjY4RVZWM0IwY2xpUWhIdnU1?=
 =?utf-8?B?YXA5czZsbDRXQW1Renl1Z3d3eDFuYm9sZ3Arb0FrVTB1RTY4Tk5TZFJJUDNi?=
 =?utf-8?B?SDd3SmtHOFNnN2liUk1NdkREQmQydDhZZmhOa3Z6c2hUL1JpZWdyeWF2akVR?=
 =?utf-8?B?bW5SUjVUVkovcElNcVpXMWtWeHJtREFQR2wxcy96bnR2Njg4WUdNMk9iZUVZ?=
 =?utf-8?B?TU9GV241ZHpFWnZpN1g3MzYzQWpNdGxYSkZObEpOd1NPelhTN0hFSnpiM3VR?=
 =?utf-8?B?YlFya2ZqemVDMzU3Q1VKaUdwVTJSNGNsb2wyZzJmUFBRN0UxVkp5N3lzSkVp?=
 =?utf-8?B?Y2pZaFFsVFJFMjV1d3R3MjYraTFaTXg3a2xCSFdKUVUycE5xWHNaekVxd0Rw?=
 =?utf-8?B?cnhBS3pkYVhyTXNqZWZ2cVpBb0lFNUtpSEQzMjVDUHBmaFNRbzNESmNuV3Jq?=
 =?utf-8?B?NjUwcVhGcmlRZEhpdkswN25DSkJIeTQzSkNFa3BNN0lVNzJ3SUpmclFqRlJP?=
 =?utf-8?B?RURVUzNQeDJDOTVNQjY1d2x5bENvb0QwQ3RUcjFsZXp0TE9Kc3VwbHBGZVN4?=
 =?utf-8?B?WDRUVlpUK2tpYjA5b2duMVRUUWdqbDBnYjlTQ2NZQjJIQnRLRmIyZzRjZUo3?=
 =?utf-8?B?K3B1MEJjQ0tiODNJdVJkUnJWNkJkSUQ2U1oxN2dHQjlvOWo2akNRNDFzSFQ4?=
 =?utf-8?B?WEtSbElMcWp5YjhmcGx5OUVoYkRtbWpBMlBFSTVhRmY4L1VIRmw2SXZaNDBP?=
 =?utf-8?B?MkpBMUtpdnA0WUZiYkRWK042R2cwM1NGOHVzYis1ZmFOeDJwOUdXckx5UXY3?=
 =?utf-8?B?NGo1WVJqQ29Nbm9xaExuZkpTUWNQVFowTTAxOXdCcktZUWxUd0YxcjB2MWph?=
 =?utf-8?B?eTBSSG9rYWdzUEY2OVdGdC9kYkhvYnZjTjU2dXRjSEdBYWo3TlFOV0RSYlZj?=
 =?utf-8?B?eGgweHViL0x0UlhsSU9NZ09GZUZQYlJnZkQxMWFrMXJaNVVZeDFaSFJVTGx2?=
 =?utf-8?B?L1JUNDd4b0lzckVuTlJ5Ry9yb2xPeTBSNnB3ZE15MXlFRTNjM2lra2l5V1Nr?=
 =?utf-8?B?UXBzS09LcFQ5TVZBM09JLy9kRlI5NTkweWFXZVIvRUw3cVBHYXh6SXNJM3Fq?=
 =?utf-8?B?bW40R1d4dXI2R3Q1TTdNZ3VUTmhzMWo0STIvT1MyaXA1c2kvemRRdjc1NWxN?=
 =?utf-8?B?VlNOcnZEeEthaVVFRXN6U1dvMVV0UjFtcWI3RW5RM1VTSldoa3hsRllHNXp4?=
 =?utf-8?B?eUYrTUdyRHBVRmdmR0p3WGdQNDcwVGVFS3BwWEJOTmN4SEtORDFMRVg1YVJ5?=
 =?utf-8?B?K2N4ZEFFRXkwazd5Z2xTeFBwbmExaXlhZitnalhSYXlOUk9rRHpkaEFBclBl?=
 =?utf-8?B?c2k2bVB1NjJoQU02MnlYamJicE9WUjJDYTl1RWx1NWw2MXBHaUo5eEtaQ0RL?=
 =?utf-8?B?dUgzTEhqS3VYbDhUQkluZ0l5c2NPK1FPSWl6aVR3c1BWd3l5bDdnT3hlbnlO?=
 =?utf-8?B?M3p6cFllWCtRR0U2RTYrL1ZCNEVpaDlDYTZOS3BRUEFGQU1Jd01jZWdqc09K?=
 =?utf-8?B?VityVzdTb0xqcWNHelM1U3JkdjhobE5UKzhxRm9FZTJxSElkZzdVM1FaVXA4?=
 =?utf-8?B?VkFQbjFHYjlwMWxZYkwwdHMvM3JiUHU0R2pob29NQ3h6Q3dQay9HWWN4bTd5?=
 =?utf-8?B?S2p4NGJOV3R5czJTNE9DQmJQbXRFR1BtMElPK2FYVFp0Z0ZyeENGS0VWQzZC?=
 =?utf-8?B?cm03aUVHWDdua0lrcjNtWXQxZWNROXVTd3EzUzhITnN3K290QnVYNmRBb3hk?=
 =?utf-8?B?dkZSeFlPc2QycklWdEpxcTY2blJWMVo0eitaZlA2VDgwTjJDMXpnRCsreEtO?=
 =?utf-8?B?NjBBcDNxV0NlVzhrVkZwcDFLVTdqS2VPaldac1VoRGVKTkpZMEdwOXRXVTlw?=
 =?utf-8?B?T3dTcjFxZzJ6WThXZVpPWHJOSGt2ekxFbVBuQTIzV2pxV2o3c1VOWWZGcVJv?=
 =?utf-8?Q?SZbLh9VtHYv7tvyNY5nDZbw6G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3beee8-e612-47b3-082e-08dd1e85c92f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:30:11.3958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59wsgrPEFU4kKzx+NnsLkpfcMCt0e9CRKzMKIEAzbSkmqpkkPEF9gpoZdI3W2P3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951
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

Am 16.12.24 um 20:08 schrieb Melissa Wen:
> On 12/12, Maíra Canal wrote:
>> VC4 has internal copies of `drm_gem_lock_reservations()` and
>> `drm_gem_unlock_reservations()` inside the driver and ideally, we should
>> move those hard-coded functions to the generic functions provided by DRM.
>> But, instead of using the DRM GEM functions to (un)lock reservations, move
>> the new DRM Execution Contexts API.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/vc4/Kconfig   |  1 +
>>   drivers/gpu/drm/vc4/vc4_gem.c | 99 ++++++++---------------------------
>>   2 files changed, 22 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
>> index c5f30b317698..0627e826fda4 100644
>> --- a/drivers/gpu/drm/vc4/Kconfig
>> +++ b/drivers/gpu/drm/vc4/Kconfig
>> @@ -13,6 +13,7 @@ config DRM_VC4
>>   	select DRM_DISPLAY_HDMI_HELPER
>>   	select DRM_DISPLAY_HDMI_STATE_HELPER
>>   	select DRM_DISPLAY_HELPER
>> +	select DRM_EXEC
>>   	select DRM_KMS_HELPER
>>   	select DRM_GEM_DMA_HELPER
>>   	select DRM_PANEL_BRIDGE
>> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
>> index 22bccd69eb62..1021f45cb53c 100644
>> --- a/drivers/gpu/drm/vc4/vc4_gem.c
>> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/sched/signal.h>
>>   #include <linux/dma-fence-array.h>
>>   
>> +#include <drm/drm_exec.h>
>>   #include <drm/drm_syncobj.h>
>>   
>>   #include "uapi/drm/vc4_drm.h"
>> @@ -578,19 +579,6 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
>>   	}
>>   }
>>   
>> -static void
>> -vc4_unlock_bo_reservations(struct drm_device *dev,
>> -			   struct vc4_exec_info *exec,
>> -			   struct ww_acquire_ctx *acquire_ctx)
>> -{
>> -	int i;
>> -
>> -	for (i = 0; i < exec->bo_count; i++)
>> -		dma_resv_unlock(exec->bo[i]->resv);
>> -
>> -	ww_acquire_fini(acquire_ctx);
>> -}
>> -
>>   /* Takes the reservation lock on all the BOs being referenced, so that
>>    * at queue submit time we can update the reservations.
>>    *
>> @@ -599,70 +587,23 @@ vc4_unlock_bo_reservations(struct drm_device *dev,
>>    * to vc4, so we don't attach dma-buf fences to them.
>>    */
>>   static int
>> -vc4_lock_bo_reservations(struct drm_device *dev,
>> -			 struct vc4_exec_info *exec,
>> -			 struct ww_acquire_ctx *acquire_ctx)
>> +vc4_lock_bo_reservations(struct vc4_exec_info *exec,
>> +			 struct drm_exec *exec_ctx)
>>   {
>> -	int contended_lock = -1;
>> -	int i, ret;
>> -	struct drm_gem_object *bo;
>> -
>> -	ww_acquire_init(acquire_ctx, &reservation_ww_class);
>> -
>> -retry:
>> -	if (contended_lock != -1) {
>> -		bo = exec->bo[contended_lock];
>> -		ret = dma_resv_lock_slow_interruptible(bo->resv, acquire_ctx);
>> -		if (ret) {
>> -			ww_acquire_done(acquire_ctx);
>> -			return ret;
>> -		}
>> -	}
>> -
>> -	for (i = 0; i < exec->bo_count; i++) {
>> -		if (i == contended_lock)
>> -			continue;
>> -
>> -		bo = exec->bo[i];
>> -
>> -		ret = dma_resv_lock_interruptible(bo->resv, acquire_ctx);
>> -		if (ret) {
>> -			int j;
>> -
>> -			for (j = 0; j < i; j++) {
>> -				bo = exec->bo[j];
>> -				dma_resv_unlock(bo->resv);
>> -			}
>> -
>> -			if (contended_lock != -1 && contended_lock >= i) {
>> -				bo = exec->bo[contended_lock];
>> -
>> -				dma_resv_unlock(bo->resv);
>> -			}
>> -
>> -			if (ret == -EDEADLK) {
>> -				contended_lock = i;
>> -				goto retry;
>> -			}
>> -
>> -			ww_acquire_done(acquire_ctx);
>> -			return ret;
>> -		}
>> -	}
>> -
>> -	ww_acquire_done(acquire_ctx);
>> +	int ret;
>>   
>>   	/* Reserve space for our shared (read-only) fence references,
>>   	 * before we commit the CL to the hardware.
>>   	 */
>> -	for (i = 0; i < exec->bo_count; i++) {
>> -		bo = exec->bo[i];
>> +	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
>> +	drm_exec_until_all_locked(exec_ctx) {
>> +		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
>> +					     exec->bo_count, 1);
> Hi Maíra,
>
> So, I'm not familiar too drm_exec, but the original implementation of
> vc4_lock_bo_reservations() has a retry of locks from the contention and
> I don't see it inside the drm_exec_prepare_array(), why don't use the
> loop drm_exec_prepare_obj() plus drm_exec_retry_on_contention() (similar
> to the typical usage documented for drm_exec)?

The way how drm_exec and drm_exec_prepare_array is used seems to be 
correct here.

drm_exec_prepare_array() basically just loops over all the GEM BOs in 
the array and calls drm_exec_prepare_obj() on them, so no need to open 
code that.

drm_exec_retry_on_contention() is only needed if you have multiple calls 
to drm_exec_prepare_array() or drm_exec_prepare_obj(), so that the loop 
is restarted in between the calls.

Regards,
Christian.

>
> Also, probably you already considered that: we can extend this update to
> v3d, right?
>
> Melissa
>
>> +	}
>>   
>> -		ret = dma_resv_reserve_fences(bo->resv, 1);
>> -		if (ret) {
>> -			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
>> -			return ret;
>> -		}
>> +	if (ret) {
>> +		drm_exec_fini(exec_ctx);
>> +		return ret;
>>   	}
>>   
>>   	return 0;
>> @@ -679,7 +620,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>>    */
>>   static int
>>   vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
>> -		 struct ww_acquire_ctx *acquire_ctx,
>> +		 struct drm_exec *exec_ctx,
>>   		 struct drm_syncobj *out_sync)
>>   {
>>   	struct vc4_dev *vc4 = to_vc4_dev(dev);
>> @@ -708,7 +649,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
>>   
>>   	vc4_update_bo_seqnos(exec, seqno);
>>   
>> -	vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
>> +	drm_exec_fini(exec_ctx);
>>   
>>   	list_add_tail(&exec->head, &vc4->bin_job_list);
>>   
>> @@ -1123,7 +1064,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>>   	struct drm_vc4_submit_cl *args = data;
>>   	struct drm_syncobj *out_sync = NULL;
>>   	struct vc4_exec_info *exec;
>> -	struct ww_acquire_ctx acquire_ctx;
>> +	struct drm_exec exec_ctx;
>>   	struct dma_fence *in_fence;
>>   	int ret = 0;
>>   
>> @@ -1216,7 +1157,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>>   	if (ret)
>>   		goto fail;
>>   
>> -	ret = vc4_lock_bo_reservations(dev, exec, &acquire_ctx);
>> +	ret = vc4_lock_bo_reservations(exec, &exec_ctx);
>>   	if (ret)
>>   		goto fail;
>>   
>> @@ -1224,7 +1165,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>>   		out_sync = drm_syncobj_find(file_priv, args->out_sync);
>>   		if (!out_sync) {
>>   			ret = -EINVAL;
>> -			goto fail;
>> +			goto fail_unreserve;
>>   		}
>>   
>>   		/* We replace the fence in out_sync in vc4_queue_submit since
>> @@ -1239,7 +1180,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>>   	 */
>>   	exec->args = NULL;
>>   
>> -	ret = vc4_queue_submit(dev, exec, &acquire_ctx, out_sync);
>> +	ret = vc4_queue_submit(dev, exec, &exec_ctx, out_sync);
>>   
>>   	/* The syncobj isn't part of the exec data and we need to free our
>>   	 * reference even if job submission failed.
>> @@ -1248,13 +1189,15 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>>   		drm_syncobj_put(out_sync);
>>   
>>   	if (ret)
>> -		goto fail;
>> +		goto fail_unreserve;
>>   
>>   	/* Return the seqno for our job. */
>>   	args->seqno = vc4->emit_seqno;
>>   
>>   	return 0;
>>   
>> +fail_unreserve:
>> +	drm_exec_fini(&exec_ctx);
>>   fail:
>>   	vc4_complete_exec(&vc4->base, exec);
>>   
>> -- 
>> 2.47.1
>>

