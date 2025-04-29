Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DDAA0435
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DC810E126;
	Tue, 29 Apr 2025 07:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nhuBCARk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFB410E126
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zxx2QhynYu2wwVY3B/7olKNSd+cMKiYnQiA2w5pOOoUkfSjmTga2t9hnucmgYPMjTUx/J/0vN2taOMJul+9H4byIV8ao8N0cADY9M/LpUaFbGIYXVaHXbH6T1Biwog859D/3u6MzduguEQ8yToJjbHsd2uonyS1a8VTizlyQ2+4xgMv5BlO9B/tkmUGOWCmYLZpf/u6yZLBN7m/6/b5YK6pnunPEvcu+xHf9+5y+bZqdehnkSruRkftKjsH886HsywOrQSb3qCj+VWc5jM4WIlzMlOM/NZhi4jCdFLVuxJCdu1pcwcA1GgP6RCy7xNYJFcdBlYOJdNfIsLfzg9FfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44PgwtkpqGEQeXE1ocwxhWNYJjxgpE1CUtemIBIF/88=;
 b=CpElhFdGbs4vqg6S35AsvuLcEgo8MN7eU7vcU/gPIxSB9UG2XxtiKxsIKG0IGK67gF0yFvoroAaJ1TXOyBSiLUoWvxZUPVRt2WM7U6Nspz0RfkWl0QEUOwjCuy/bK2/0sUK4vcmnmkETgikI3ddS7A9gHAyXFW6/Mee79tS4CU8uoI286AbsKcAdkl/fLNaKmDpR0ewHyBqI50YkMr+cgc3BE0z8lM8Ig4bueAVqhnzO7z2iKwVUD23KVobWaOB2hGsksgdvkMqlccksNM4H5kCPSGvU6mQKiQGQ30K4oqzwDZeoTP+hdm1rgeykldTP9qZ/zqK/E2qJWaQ4drlVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44PgwtkpqGEQeXE1ocwxhWNYJjxgpE1CUtemIBIF/88=;
 b=nhuBCARkUdeZF8DhRx1BYu1407QzfVr3p2e8I8nH+TC0pbzMPir7QfaWkNYbbBU8wVkZwwUjNHFrbByfN5wtDlpzP6HWtER9A9/A25wTfxCkfp4hcak+CL4gZ756mPWoDF5pynjWbNUkpoPnY+4hBMNW3IwcvvSqL8UVyGQEvvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Tue, 29 Apr
 2025 07:19:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 07:19:20 +0000
Message-ID: <32cf322c-b23f-4127-b1f7-5cbe8894a007@amd.com>
Date: Tue, 29 Apr 2025 09:19:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <20250417102430.2828552-1-sunil.khatri@amd.com>
 <BL1PR12MB57534AEE3F7D3352F68B2A4493802@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <BL1PR12MB57534AEE3F7D3352F68B2A4493802@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b7f32a-a0d3-4a9a-3232-08dd86ee28fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anJRVlBSeXNRZnFybG9lNnljbEp4K3FhM3c5UUhjM3Jia0ZkSXpsMTl3enlW?=
 =?utf-8?B?aUVTVlV2TXVDUGtVaEp5bnIxdDZwT1hYZktpNXF0ejhyVU42K09OeWswSnZX?=
 =?utf-8?B?dWZ0NlhWOXpCU1czV0xhVjhRYThlZ1c1aklGaXVGWFhyL216NTUvUWhWRUZi?=
 =?utf-8?B?V0tYeTg1N0N6eStZdUtRMkErZmhZOEt5bTRmL3ZoTUFzWFk1Mk5GY21VRmRK?=
 =?utf-8?B?MUI4ckZTYlUyUmZ1SmFKVURNWUZWNHFraFl5aXV1d1FPZ1pXa0lEci9yU1ZU?=
 =?utf-8?B?bTFZd0d0dVpaT1lBWUluSXFsb1ZrTm8ySmtHblUyY3NhY2luM3dJQ3F2bWxa?=
 =?utf-8?B?WFNTZTFWSVlQYk00NDhiWjJpVHF6Y2c0dmd6QzU1SUdUblF2ek4yTkhka2JQ?=
 =?utf-8?B?RksvZjI2Zk1EdDdyN1I5MXRtTmU5V1VvdFMvV252MGZIb2x5UDd3TnZQYnBv?=
 =?utf-8?B?ZmtmOG0rK3VuWFp3V1Y5RlZwQkZQTVlFaDgzLzdPei9JUmEzdXEvQWtuaFAr?=
 =?utf-8?B?RGd4Mlk1c2xTU0dqVHVaSndEUWYybG5KNUgvUGlPNHZ0ZWo0dlRPQUFpR3Q0?=
 =?utf-8?B?VWZtZDNHYkczL056dUdXbmpURDJHeCs3K1V0TThiZU5WOHkyYXNhNHkwRzRx?=
 =?utf-8?B?UWFvOHZub0ZnQ0EzMUE2UDYzdXFjWUZkMWpIUkpVTld3YWxKTDBmVVNFejND?=
 =?utf-8?B?QTNUdy8wWWs4bDFQdllzK2VMbWtCdjFSUlFacTRvM2lKdzRrc3hybHdqdkQr?=
 =?utf-8?B?Y2M3K2Rtb2ZHTkFqSjhQSHJJczhxRUFaY2E3TlVibzl3dDdER2lUeGlTMXhz?=
 =?utf-8?B?TUlFY3pZOFpna3QxOVV5QnhCSDFtK0FraXhaNG4yVFN3WHhkckVVUDcwWHpw?=
 =?utf-8?B?c0xRb3dTZklNaEw3WkczeHpmNktaaVpaQWdtcm9PNk9VYi9JaktCQ1dob0NS?=
 =?utf-8?B?OE9vc0pKVXlRblZGQUFjSUhrSWoyZEFQTk02RHlxMFNPM2thSHMyUEN4WGxr?=
 =?utf-8?B?NkVndEpJZWpqRS91UVVNcGlvR2pEVXpGb2JhZE92b2t5dXlOZXM0eVpzRUtu?=
 =?utf-8?B?eXhoOW5odFhpczRvejlrVXVYWTRoZ29Oak9OVHV2Y1l6eTlwTEEzdHBHdlRE?=
 =?utf-8?B?WmVtc3YyOFRBL3d6NGlnNDI0WkFkSHUwM1FCLzhvVFpjUWxDWmlNY2tqeFU2?=
 =?utf-8?B?YjJhQzc3M0FiQm9DeDhzMXU2TEJjRmhWOFFkMWpZdVYrRXZNalZzREI1SmNh?=
 =?utf-8?B?Y3ZLcm91K1hjcXNpeGg5M3FnMFFhR1Q2NEhmZGJTSExtdzUrWXJHaGZ3STZV?=
 =?utf-8?B?anpNZ0k3TlNVZzlxU2RFVGZrZUV4WE0vSjRDM0NSc3ZHVkRtV042alNOQ0VW?=
 =?utf-8?B?ZkJwZHQrM2dVek4rV3h5dGxlQThRVDVtd29VRHM1d1JseHBOb2VQQ0xNUWFa?=
 =?utf-8?B?TTE2T0V4TFZsaXN6aCtWK25aVU1adjRLWGU4eDljc0ptSkhpbElkN3BHY3Vy?=
 =?utf-8?B?bVdOdXlqTTA5bWt4WG5nVWU2TXNCdFlhSFJRRHMzaWhFUTFoRTFTQlNucSs0?=
 =?utf-8?B?NHF6Lzc2cEQ0eVc4ZFFzNDN0U2JTQ0RpR0hodjZJYk1TOVhGWDlidXJOOGZ4?=
 =?utf-8?B?TnAveTEvUWZkckxKVGpKWlZYUVNuRnh1WlZDejdTWDNvYTN5ekhiYjRnNENQ?=
 =?utf-8?B?TGltTU1PZjZrdDZOR0VZWE9haHhWMjMvY3A4ZVN1aWlpaWZmTFc4cHIxWi96?=
 =?utf-8?B?RW5TOVNXTGd3dFVxRmZsQmpZYVIreWgxWi9XSzRWUFRYY0loSHVlMHpwR2JI?=
 =?utf-8?B?MnFzN2hNVndiYUQ0T09md2Z4bzRPMEIzR0dCaUh1T3d0dyt3RU9CaXlKY1RB?=
 =?utf-8?B?Z3dmeTd3MjdiZUZjUHNEZVV4M2Z3aDQwZHJmb2VOZVFjOU9nMVpMOTBCNFNp?=
 =?utf-8?Q?pa/AL3JWurw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXNjRlllQ3BVajkxWnRTaU9zaUIzaFk5S0FsRzByNFk5UDJ0L2xOWXVrcFdV?=
 =?utf-8?B?aHY1cks2cG9obWQ3OFYwdXU5aURxY2hlK051UHo2M0pCa1IvUzRhYzNSR3hq?=
 =?utf-8?B?UHVzQ2c2Y21JdHhSZ0QyMDZhZWZRb3hjU0FaSjV5QjdWMmZZZmVhZTZEa0dM?=
 =?utf-8?B?NFhnT1N6UjQ3dGQ3TWd2aSs0ZlBLZi84M2M0N0ZBdllUNC9EYUxVTHV1ZEJP?=
 =?utf-8?B?Q1lRSmhxczlYbW5wM3o1UjhUZEFBUmZvQW54aHJIczhWL0U3TGpqTGtNRWF4?=
 =?utf-8?B?UitTYzdRWm1vSlo5Zy9VK1RKUWtnU3BvTFUzbk93UnhQblE5N0hJRlJvbFNE?=
 =?utf-8?B?dFJlM0JLejVUSGk2azZSMnlXV3hBRXZiSEpkLzA4elE4WmszOEI3NGYxWVRo?=
 =?utf-8?B?RkRCZG5FcGlBOTFmRktJTmwrb3A5T2c5cXE0VE9NdFMyYnFySkNqaTUxbWJ1?=
 =?utf-8?B?ajA0RnprYUUvOEMyWDVNTVNLYlZuNno4a0l1aUd6dC81STFoQ1ZYaVhZQU96?=
 =?utf-8?B?M0szRmx2dWs2akZrakFrVzExQ2JVVlh2N29VdnE4RURGOGdldDYwVmNMVGdV?=
 =?utf-8?B?Y2ozVnVlQWc3bGJ4bjhVODJvRlZmZVN5SlFJcnBqVXI5T3dnTGMzUmlTQS9W?=
 =?utf-8?B?dnluQ3FtM2ZJcGtpM2tRZDRrQzh5OHEveDl0UE40bGRRN1lKbWpnNHNoMEZn?=
 =?utf-8?B?Vi9sQnlZa2MxeFpQeG9jYkp4amswZkd5YVlHekRSWUluWE5yam5MQUZjZFhj?=
 =?utf-8?B?aXlvM3FtNWpHaVpwLzlwaVlLMmx5NVRZYzZFblkwQjhvd0ZNQXVVOWx0MEdh?=
 =?utf-8?B?YW4wSGI3K1NPZ0FTc3ZEUXNWSG9wVDhVbzVuaTNVMjJzai9kWlQzY0NEOHdE?=
 =?utf-8?B?bE1mdmNPNEloRVUyYzNodlpWSjFzVFBqN01SZTlsMjlxYzJ0MFpkdzAzZXpq?=
 =?utf-8?B?SFEvazV1VTZacC9qZVg2OStOV1d5QUFNZjY1SW4wb09qUVYvUGJqYmpsT2Jw?=
 =?utf-8?B?dDVkcDBFVDgrZmlOZ1pqbjUzMmFpUDZIeW9FVWg3cS9qMWpXVFJsRStkNVVK?=
 =?utf-8?B?WGJqb3djNHV1L0Ercml2ajJRRFFBUGtSUERsL0I0V2VzaVh3aHFPSEU2bWl6?=
 =?utf-8?B?emNmeTFneEFRRERhdVlQaG9JWElxcVI0U2h4YjVkdmphZkVEZlZpYjM0Rm1i?=
 =?utf-8?B?bEtXVlFUUXJCZU1XaUJJaFZ6Uk5ZYjRFZldXbm1LbkpLTFBwWEtXSkJRcVdQ?=
 =?utf-8?B?ZVIrTDJpenpWNWZ4aUJCdFRqZTZEWHhCRkRsMUxkeTZEcW9VcUxrWSthamVo?=
 =?utf-8?B?UmNZbGtocGJMejlON0NaYWJSWnBMb1dpYVNuZ1hNcEZHWHhaMktGL3l6dG9m?=
 =?utf-8?B?RHJycitrZkMzZFNRRVBjcmkrOUlaM2lSZktuZExMb3NXWnpoOVpZRlNBeXVC?=
 =?utf-8?B?TitnMk56QVZHUjRGa05nSEtxWUhZQTU4dlBzb2toZExMcUZwSkpVQWlOeDBs?=
 =?utf-8?B?ZmZuZEZEV1RsaVUwYTRHaXV2NnBjNkhwK0NNL01tbTJtSE55MjU5eXBkdTRM?=
 =?utf-8?B?dk5taVFjVDNkeXV4S2ErU0pacjdmN1Z1Rnp0VTQwbWFQQ3pjZ1grRCttRGtJ?=
 =?utf-8?B?cEhPdnEyTkJrdmhkR3VoNERONmNDS2k4bWI0emszYlZCQVVUK3lqZDN0VUR6?=
 =?utf-8?B?QVpmNGgrYkQrM05Ibk1xZUExMUdmYy9hK25wL0IxWDdzQllQWGxmVk9XTFA2?=
 =?utf-8?B?NDhCdkpZQWtPNk5IZFZvaFEvSEpUMWtxQ2NxbjJLTDc1YnVRdE9HajFOY1li?=
 =?utf-8?B?U2pHNCtyQSswUUZVQzdIQ1lvWllXZFZlZitzQnJGbDh3cDViWGp4dmZZNUYr?=
 =?utf-8?B?TzlabXR6eU45Ym1vaEdpc2hQYld4OE40K25wVUhmL3NXTmJhQm15cEdMRXc3?=
 =?utf-8?B?elZLMko1NDN2SkxoQUdaOUEra0NQc1FuNmZzbmd4U0Y5RnZTT2ZTTUJUWHN0?=
 =?utf-8?B?NTczalZHdUdqYTBaY09kZ3U3bkhFS0Z3cXNsSXV6cHNkdHpHQ0R3Mit0MURl?=
 =?utf-8?B?alY5OWM4ekVjZlNEeEJUTkVwa1RhTUJvblorYW9KcFk4b3p6WDhzcmZMRFBW?=
 =?utf-8?Q?i0Y/cdB/Y90RIKoGPEbVLn+wE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b7f32a-a0d3-4a9a-3232-08dd86ee28fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 07:19:20.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lPGW552mZxNBA+qWirWTCPZtdwArh8hKk6Lksy2Yx/c0D2/ODBpEyL8HaVH6G+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
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

Adding Danilo and Philipp.

Christian.

On 4/29/25 08:36, Khatri, Sunil wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Ping ?
> 
> -----Original Message-----
> From: Sunil Khatri <sunil.khatri@amd.com>
> Sent: Thursday, April 17, 2025 3:55 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Tvrtko Ursulin <tvrtko.ursulin@igalia.com>; Pelloux-Prayer, Pierre-Eric <Pierre-eric.Pelloux-prayer@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>
> Subject: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done
> 
> Fix the below warning.
> scheduler/sched_main.c:397: warning: Function parameter or struct member 'result' not described in 'drm_sched_job_done'
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index bfea608a7106..5cd29e92b133 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -390,6 +390,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> + * @result: error code for dma fence for scheduler
>   *
>   * Finish the job's fence and wake up the worker thread.
>   */
> --
> 2.34.1
> 

