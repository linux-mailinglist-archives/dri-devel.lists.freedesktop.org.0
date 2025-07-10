Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D515BB00194
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA1D10E8B8;
	Thu, 10 Jul 2025 12:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BO6VUhzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CECD10E8B3;
 Thu, 10 Jul 2025 12:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFsG4pnfHmz6+FPIC+ycF0i9vVHm/PTzTrM/VToDJHvuxqhFAbthGT1pKZTFPRif1Y/WvdfK5Ai2f3D4RXKXSK411Fq82AQoaMRim9UrK53iU8J2WibnfyR4C+bMilS1rDyeY/IwkJ/fhB6tvVY4iOS3d/IYWj44gKBsZOvMJPdmlHzZiLgxgDdbE/AttmlTTQKYjdQmGDa0b58GdtAKatB5j1k4U22W9e4jRBofp6tt2ESwBDXtYen2vyHGbjglN72U/99hS8Gks9AHPPRgVYLSAXMycnwAstPIy73mNQmeeuAnSgJurgIGflCS2ZwoIzndRuJEtQK4f3CywduIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WKU9IueZFVpniQyOchqwjtWcA1huUc5bDs78bpY6qI=;
 b=dE08/hS9zm5SxqQeX9R8avIVy1dFkI2ws3oSffLXBstoYFQWdI9FrGaYL2zSo4n6T1WHUH/fLLkfGsnMqMqGs6LKeDkSB9Z7q3m1Gads4qmNRDTuL9A0RHmJCFdQqqgOT/fK5iiAo9DcL6gRYXS2c22M5sh9fjTS12Tif6XK5BNWd4B6ICFDzpYl0ftgC3T/k5MlN+rI/7WPxu+61GWAi1OvI/i/RcQW/3fIAuEYZ8VSi8k2HPOrc7UHacmjr59p/gibv6EMfru3wMOenGi738UIMBPBhqx+NvM0IYOAz7HBC3+K1y824CFoZOQ+RvIkzhn2nfL3iLy8zw5wt0C+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WKU9IueZFVpniQyOchqwjtWcA1huUc5bDs78bpY6qI=;
 b=BO6VUhzMEpr92ZsnzTxudOLjFbMiZ1VEk5LVcz95Ak7HpWaMemKSKd70Gdsn6ThPZZ+J5t8mWlfqx69F0j0Y+eV4Fj0+z3Ys8pxjv7HCF2nJpyTMce6GZF1oZPWMV1lUqdu4zca5LCv6/y5QW1bPeTj01B4tISQhrjx1W/xh7AU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 12:22:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 12:22:35 +0000
Message-ID: <6df29eeb-756f-4117-9d56-204d778395b3@amd.com>
Date: Thu, 10 Jul 2025 08:22:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 rafael@kernel.org, len.brown@intel.com, pavel@kernel.org,
 gregkh@linuxfoundation.org, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
 <20250710062313.3226149-6-guoqing.zhang@amd.com>
 <b9bb9865-8bf4-4d9a-9bfd-945d38a7698a@amd.com>
 <da71b812-6ac8-4abd-82d6-4cfc6a168146@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <da71b812-6ac8-4abd-82d6-4cfc6a168146@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 07edd026-dff4-4f29-036b-08ddbfac7393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Szlod3lWVVRESWtzc1YwMGJleWhiRmhKR1BtUW5DdjgwU1luT2d5VE01L0p0?=
 =?utf-8?B?aE1CclpDblRZQi9MV1R6QzZyT2p2eTBWeHgvQlVkNXNWM2phL0w1WTZCYU1q?=
 =?utf-8?B?QWYrNXM4cnAza3hNVkI4MEdoUmdYRVBCVGNrQytNMEx1MG1vQm0zdTZRWmFC?=
 =?utf-8?B?V0hZOTBDRmJGOUt2T3hQRXRib1l0eVcwVW51VmxVVjhZZndmNkg2ZnZvMVNS?=
 =?utf-8?B?eXlCa3RzSlZNOFkrZ2lMT2p0KzBEdmQxQnZkZ1VNdVhRTmtKejRBMk9HMlkz?=
 =?utf-8?B?d3NMYm05NmhBb3R1dmYySENCcXUyY3JQdlFLaTQwUDJsaVR0VURBVkFnREFt?=
 =?utf-8?B?TXhHbTIrZXlXa3d6SmdBazA1bGhUeVpGcTcrS21Ga0d0R2c2ZmpvM3lkUGtr?=
 =?utf-8?B?cEVNTkNXalJlUXkxYTVtVXRJSStTTTB2M2RjSWFXcEFFNTlpRWR0MUI3Tk5D?=
 =?utf-8?B?QTJKR1Y2dDRIY2hJMkZNeDB5U1VDSjdrL0ZMbnZnMHFwb0RGbFlFQkVkT1lp?=
 =?utf-8?B?RzQ4U2owMnd1UFd6ZlhEbVZDYitNc2dmUWswUUdIelNoeXNkUXZzK1lkU0FE?=
 =?utf-8?B?dW1JMkZhaDVpN2pYb2hNMks1L2YvaWdJZDhjQTVUV1BGdVc5SFZobGhtaThp?=
 =?utf-8?B?ZEM1ZVFaVldzSHlrQTc2T1F5TlJ2R1ZGQUtpUlhGQkxsNTZwUmtWUXFjQVBR?=
 =?utf-8?B?Vml0WnlsdHdnZW5YT0FQdzR4Z2taSjRpV0xkYkEvMHZScWVIMFpkRGhSUW5O?=
 =?utf-8?B?ckMrcC9Wa0RSQUZ4eGV0NmF2VGFkM3BLNmlHVFh0bm56YVpWRHF1MlZDdnpW?=
 =?utf-8?B?VmRDOVJPcG50UXZpWUROdFdwNThtVzdlVm94dzNOU1VWWFk2TllhRFd6N0xn?=
 =?utf-8?B?TU80MVJtalhuWGNta0hqM2pkSXlRVjBRS0JKcG5EdGpIVmxvRjhycEc4WEdw?=
 =?utf-8?B?VTdwQldrcnBRTzh1VnRoSFRabzJoRzUvVEdFd2JKWlM2a3ZTR3FqOHNFVGJC?=
 =?utf-8?B?QXBUZHpYeUoyR3pLOUpINkFaQ3dTcnFsR2kwUzcxMnZxOWpva2p3ZTc4L3NP?=
 =?utf-8?B?eXBZM3M5c2QvNkdydThXWnF5RG9WeXRUaVI0OVVLWWxRNzBaL0J1dkI1WGJa?=
 =?utf-8?B?czdNcDlyVzhuVlRrN0lPemtXRk5JRXp3QThBMWYybnZSd1lZa09RMEc2d1or?=
 =?utf-8?B?S2VOTGNOZXlVbFIxNnlIL2RaU09KVmJGUnBtMEIyZ2c0UWduWS83a005bXhB?=
 =?utf-8?B?SnZRay9SQ0hOZW1GbWg3Q3BTamxtY1JqdnJab0NIR1l4K0FEakVkTWM3QTA1?=
 =?utf-8?B?VXZmdEt6bkxlRVdzTGhacHVoZGN2TFNzNVlPWCtNOTlKc245KzRRRzUrQ3ZI?=
 =?utf-8?B?QU1IdUJ0UEQ4WktFSGdMbndNQjlUaWlMNmlYY2Y2bU1ZN2F3bjdwM3lhTVh4?=
 =?utf-8?B?eFVIMjZJU2I4TGQzREUvaDFvOFRlTzY0bmpobDdTQjlZbW1PQWliZDFrZDNt?=
 =?utf-8?B?Z3lhbGtVT3o0Z2JXbmJTUGRMdTJWczlwR1NzRW0vQU9RSzYvZTJrOVRiZnN3?=
 =?utf-8?B?cVc3UkJpV090K2FLbXJSaFRzVDNDZEtlSk9pdFlQTDZiNnJzV2Y3cWowS3FD?=
 =?utf-8?B?aDlPNzdGNW4xdmNRRnZQV2pjSXJRNkQ5YmtVNEVObko3NSsvd1BKc1E1WjI4?=
 =?utf-8?B?RG4yd0laNUJFeFRqaUFWc1JXRGpOdnJnL3ljc3M0S3hpa1ExUU43RUNZbFBI?=
 =?utf-8?B?SDJvTlNMbDJwNzQ5dWZjdjhEN0ZGWmZoa3JZNUFWSk1PL1VMN21BazdkTkVG?=
 =?utf-8?B?eHJ2MUpVSkpFNm1Fa0xUOXh6Q0NaZHEwbG5ic1NvRGVuWWxqWDl0Q0NjYWV6?=
 =?utf-8?B?dzNMYVo3WUdKWjRtdEp3QUFTa004TU0va3hBNFNkMWJBV3Zldk9aZU96VU43?=
 =?utf-8?B?UVFlWVNBS1Z1V3JmMkZIRjY1Q1kxbTg0WmZ6T2pzcDNOeFphUUNCQnBlNits?=
 =?utf-8?B?b1BRNXprNGdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE90cXpVSE13bnpmMklpYUFKaXdxeTZlTXFmVjdCY1JOeWtQK29FVHM4NkdM?=
 =?utf-8?B?RUlCWmE3a3lrRmdWRTUrZXp4cklsOTZMRzVVa2RJVFd4M2xOT2pRanJSYlJF?=
 =?utf-8?B?a0FuR1lBZWN1cGV0WmU5cmdEaXFVVURoV0pmd2pndUlKemYrQmRCOFRsV3d3?=
 =?utf-8?B?S3djYnE4a0ZhZytWTHBLR3IxN0djQjMybm92U24rV0dkaUJQY2JnWWNCSVJp?=
 =?utf-8?B?Wm5abmFpbURLcmFXbHZDcURsQkFlSnkwZ2t3VGE0cmsrbXpWZEN5bmJjZ3VK?=
 =?utf-8?B?UlBlUTZNWDZTanB3bTZtZHZUdXhWcVFVRmRoN3RSQmFMTElORVh3WmRQVTc1?=
 =?utf-8?B?a0hTbGtmTmlrUTNUMUJEMk5FR20vZFd3c1RrRyt3bGVGY1BlZ0RwcnIrbGI4?=
 =?utf-8?B?bUE4bU1POTF2TUsyVzZPWmFhR3BJcUVmYXJRZWcvN0lkakZydjV2WkMxQmJI?=
 =?utf-8?B?c00zZzFwbUxUZ1RUY2JSdTlsY3VrTVBjazluYWk1Q2VTeWtaVFRGVlg5c3U4?=
 =?utf-8?B?Q0l2bk5NZnJkY2taZzFMMVZCRm9XRWxGTTQ0aHcyOXNYN3Axd0ZFbTZxbzZC?=
 =?utf-8?B?bDBpS2E0TFBBRmJqcmlhSENodHlZRElwOWw4SHlHWmhKek1HSk15NkpaSDJy?=
 =?utf-8?B?aTc5OXRhV2JUTFp0ekN3QXFpZE5uNlhLRzZkenNWcWdVOWk0WW4yc0VyS0Yw?=
 =?utf-8?B?eE04UUVRREdlRVI4RE5RK0Y0M1M0bUsyM1MyVDRqdmVmWVdQTHZFMHFIcVQv?=
 =?utf-8?B?VHFnd3AxcGppM0g0Z1JHNzVabVowZ2QxamU1MjF5eWdhVEI3YjRxbTN4bEVY?=
 =?utf-8?B?VWNwc2p6aFlJdDd6ZUMwKzhRTDczbW5aelpnSnA4THJsMzVyWHhZeUNveEp0?=
 =?utf-8?B?UmJRdS9XQVZIWmdsdWdtOVNtSFBMZWFaV0NacGRLd2hrRU13Z21oNU1xYk9Z?=
 =?utf-8?B?TStRTEQrYkVkcE0rV0FicTUxMkdRbWFrcUpVc0lCNG5HbWw3SFRVc0w0WWt2?=
 =?utf-8?B?ckg2WmJVWlR0S2ZRUEhndWtPaUtKOU1Wbi9zRVNnTGdaMEx3ejRkVUZGWEFz?=
 =?utf-8?B?S1Z5K2craUR0VTdaZGpZNDNaaVRJNjFTL1oxRU14UmNDVnUrK2FWVVBUTWFx?=
 =?utf-8?B?QTFPaVh4SmVSdGtodndlRi9JSFFlb3QrZHg4SVBIWXdTbGQ1WmgzeEdyNXh3?=
 =?utf-8?B?WGUvTVErWWgzbjJ4OTAyL3FsZjNoTjBKeVcwZ0VQekw1NlA1aUtPbGJYaXZx?=
 =?utf-8?B?Sm9RZERIOStzRFlhZmtZVVlpbVp0RUM1STFRNFFXNXlwdXlLWlN1MnVnN0do?=
 =?utf-8?B?b2dLV1psbHA2MHBLdThZRDVSYUF2Q2t4Ujdrcllub2tpZ29qMk9ucjI0U1hV?=
 =?utf-8?B?elZLL3ZVdWs2STJWRVp1QWxQT1dwL0UyY3laK2FGYXJ0ak1lT0VBaGlkUTlR?=
 =?utf-8?B?eFh4L3RhdE03U082MDFaTUcwYm9WTWl6SnFkdGZteHhFa0M0K2I2UXhrUXNW?=
 =?utf-8?B?Mkg3VDJTb01PL0pHbFhIY2xvVHk3WUVmNW5Gbk9DaWtZbnNGN00zczdJWmlh?=
 =?utf-8?B?KzZhdmkzZHBtK0tHdnAxQ25TMmFrdHdPOXEyQU1UclZnWEZiZlg1OUpMY05K?=
 =?utf-8?B?eWVUNExSdElrem9laXEyRVFaNmpQSlVmVEI1bTgrS0lBbEdqQ2pPWmI5QWRa?=
 =?utf-8?B?SHh4SXpSeWZuc2M5WVhCM1N2ZUNQaWhaekhlNUE2bWNiTTFiR3dVN3M4SUE2?=
 =?utf-8?B?SHR5TCthNkxaL2g3V21aOHZScm8zbUNYUUhhT3BwT1FFWG1hdzNKaWRSTFNh?=
 =?utf-8?B?SHVhVW1MNDUyVHlEZXlhczdGaTEwOXZqWEFkQVlCMTFvMndkbnE4YndESnB0?=
 =?utf-8?B?REtzaGkwdW1UR2xDaExPOVlaejZLSnNmZURBNUlkODI2Uk4yWU1TSTU3Y05C?=
 =?utf-8?B?cUNFMUFQTVoyRXRhRDE3SUVBajgyL3NXY3lEZU5NemNYc3VqU2x6cnREbHl2?=
 =?utf-8?B?cDJsUmdUMERTS1dwL2lJQUdsNWExeE9QUVVDckpvcXdQT3AxRXIrT1U0VWJK?=
 =?utf-8?B?YWFCNUdkc241N3Ircm9OOHgxdXRudnNTYUQxaDIyb0JvbW9pQkF6YjlTV1ZJ?=
 =?utf-8?Q?KeCiShjYTFkSU+ZYh/2/41SZz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07edd026-dff4-4f29-036b-08ddbfac7393
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:22:35.2592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tDCpRjAq1+EgqIzP0jyPgZJPTMQKxoVvHBW9qBRK0Ju0V/d56yn8OFJz3F2A1foWxXrfhppQnLQypIkwVz5dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
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

On 7/10/2025 8:20 AM, Christian König wrote:
> On 10.07.25 14:13, Mario Limonciello wrote:
>> On 7/10/2025 2:23 AM, Samuel Zhang wrote:
>>> For normal hibernation, GPU do not need to be resumed in thaw since it is
>>> not involved in writing the hibernation image. Skip resume in this case
>>> can reduce the hibernation time.
>>>
>>> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
>>> this can save 50 minutes.
>>>
>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> I think we now have reviews and acks for all patches, don't we?

Yeah we do.

> 
> What was the conclusion on how this should go upstream? Through drm-misc-next?
> 
> I've seen that you asked Mario, but I think I missed the response.
> 

It hasn't been discussed, but we have Acks on all of the non-drm patches 
so it seems most reasonable to me.

I'll give it a few hours today and If there is no opposition I'll commit 
it there later today.

> Regards,
> Christian.
> 
>>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 1c54b2e5a225..021defca9b61 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>>        if (amdgpu_ras_intr_triggered())
>>>            return;
>>>    +    /* device maybe not resumed here, return immediately in this case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return;
>>> +
>>>        /* if we are running in a VM, make sure the device
>>>         * torn down properly on reboot/shutdown.
>>>         * unfortunately we can't detect certain
>>> @@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device *dev)
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>        struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>    +    /* device maybe not resumed here, return immediately in this case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return 0;
>>> +
>>>        /* Return a positive number here so
>>>         * DPM_FLAG_SMART_SUSPEND works properly
>>>         */
>>> @@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>>    {
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>    +    /* do not resume device if it's normal hibernation */
>>> +    if (!pm_hibernate_is_recovering())
>>> +        return 0;
>>> +
>>>        return amdgpu_device_resume(drm_dev, true);
>>>    }
>>>      static int amdgpu_pmops_poweroff(struct device *dev)
>>>    {
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>> +
>>> +    /* device maybe not resumed here, return immediately in this case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return 0;
>>>          return amdgpu_device_suspend(drm_dev, true);
>>>    }
>>
> 

