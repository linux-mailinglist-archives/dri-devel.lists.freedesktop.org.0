Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AEDB019D5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 12:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD4210E122;
	Fri, 11 Jul 2025 10:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bDFmZrvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B489A10E122;
 Fri, 11 Jul 2025 10:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuH/DqFA2ZG0GOd6tgW+qDoNiso+zWUivxnRd8f9YyZgu7DomTyofEbof0D1eb5uvVrijIkEwFhHoTEamVdCRynyUDj0wMZ5T0TfQvrl49QD6NtzhiZIygcEvKnSffVUZqWQPOIPLVaCI5ohKHvskoflxw4Jmb1vsLH98/qR0Cf3MqqMDGQuE+kiA4fcP9zOTp80tz97wCe7uJQgXASeKSRuMAuvQLLx3h5leL2iKkQq+l6eh0a8IjFpPG7hCv81ElNE5ynaKTLm9JuKn4Zol9IaqrfAV/O6At9dxcwj6V9qEnGtnvfjhzGLOt+2OJC8hOVGp4893vPPezrG2cFfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajDcqVGjrhHfuAGUsqBhflB+YAEi8Hce374T082at/c=;
 b=xbQ14eI2zlZjJk0H/Z9/b19zZwx4Tbo5Mwk9Lg7JpDQx5wn1MkjzOck0O7Oa7dnbFUEsFyHqY0NpI3nQuo77u1A/tJfxmB1/yccT+swEaGdbUz508q1YyylGPjI2P8WpqlQ9niEv+B5bqW5sk5X3+qFxpOKg5z9fgA7PjwzKaY3XzNWZLZ5xLIjU4X28Y7HlGoPmneGdyMRq93rErZf26cxG2fk2D4ckxJ56YC4icCMIAl1bgAwUzYIT7AxXK/T8HhoxbwJDdBWJU+ntXjh7jAmx36/iROq3Jy3VCXzXs9UcXU1aA6MBQZVxaA7bZ0QIh3ZrXvV7AC+fkLZYxn6iJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajDcqVGjrhHfuAGUsqBhflB+YAEi8Hce374T082at/c=;
 b=bDFmZrvO0Ur2K8whgvLwmkm91ZTDyBjeMZMLBKpXPt5GEed9skCW+A+QzJ1XINGZv9F7Zu1MAyyZBK+acWqHXML56NjsRKE0/HNuGEoMJHjtPTuqJ+tLrKDdbwHZQMVZe9mDXi2Gy5cUR5g3sNYbRteyhh84Rq8wIXhp0tYVGH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9397.namprd12.prod.outlook.com (2603:10b6:8:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 10:32:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 10:32:09 +0000
Message-ID: <bd14fdec-7e75-477c-a241-bac67f93d210@amd.com>
Date: Fri, 11 Jul 2025 12:32:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, torvalds@linux-foundation.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, kraxel@redhat.com,
 christian.gmeiner@gmail.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org
References: <20250711093744.120962-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:208:256::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f923c8-9860-42a2-c283-08ddc066308c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVRmY1FKYzJLNjQ5SXRWRW5yS2lqNUF2L1NOSGNJT3hSZ0hLQ3RkOWZiREF5?=
 =?utf-8?B?eE9lZnIvMVR5ems1UEdDLzVQR3RKVTRhUnRvV3VWbkI3SjNoSmxLWnROSDN4?=
 =?utf-8?B?dXRES1ZTckxYRVZKcW4zSHFmZVlHV1lyeHhnUTVPNlQ0U3lPT2hPbHptMVU0?=
 =?utf-8?B?WXdlTWZ6cjE3VnYzdHZadHEvejVwL1VyV1NweGhVS3dESjk3SXZIZWVhWGRT?=
 =?utf-8?B?a0Q2Nm5JeUZ2WWJJbi81Y1dycGNlRkNXWGx1ZHVRd1ZaUzBQbU9VL1p0aVk4?=
 =?utf-8?B?QnhmWVMrWWtBblJ3cm54SG5vR2RzZUdDRzd6VXJGQ0oyY2ZoN1RxNnpXVUhQ?=
 =?utf-8?B?SVVYV2lyT1lCbEJTeGtwVmN3VzJQZDRuUU1lS0VpNERmV2t1QWpuR2gxVVdv?=
 =?utf-8?B?aWM0bGt3ZDJSUzNqckJNbGJneVJvamk5OHUwMGdYQ3pwVkNBTy84S2tjVXJr?=
 =?utf-8?B?cGovVDcyRzRQWmVaQ0liTExHYUdVV3ExK3B6WlBMR3dTT0NtQzd5RVZTTnRj?=
 =?utf-8?B?dmN1WWhYbmQyVlU3Tlc0ODA1dmFnZ09NZWZjeFQ2VHVoejB1TjYrQVJzblEy?=
 =?utf-8?B?bmptOFJuMUVkL0ZGNFJYZlRWMG1VeVQyWTdTZU1paS91S1NJK3orR01CU2hx?=
 =?utf-8?B?eUZudHROdlFFaGIrc1pUZHU0UUVjY2lESTZZQ1pVQWRocTBEc3ZCWjFMYVg4?=
 =?utf-8?B?U1Rkb1haWndyNjlPVEhHdTBaVUFmMjk5TGNYdDBqT1RRVDQ0VzRGTDAxV0JW?=
 =?utf-8?B?NmEwOTdqV21xNThSN0Qya0JOWHpDODZlRk9BM1Uxei9UUWt5dnI2RGRaTFhw?=
 =?utf-8?B?d3ZxR1RiT1pva2UwNFUwNmEzOUFLSzh1MEx3MEhOaVFzM25XY1g1dEFMZm96?=
 =?utf-8?B?OUJVT3FqM1Fieks1OUFJZHk0djJqNWdQZE5RNWh6ZENJZUM1eTlPUVlSV1pu?=
 =?utf-8?B?TjBFT21BcTdIQW9SZXRJSVRKOHJwNHg2OS9Jdmc5M1JFazZjaG1rTmJJZC9W?=
 =?utf-8?B?b2pwK0p5b043VVZHY2ZKWVZYTzcxTTlZK0xCTXZjckt1dkVLdXcxMmczNFVt?=
 =?utf-8?B?RHZxVmdMbVFnRmVSQ0NQN1Y2aTNFelRCYkkxQngwbGF1UkxMbE0velVMaVBa?=
 =?utf-8?B?RmROck44QzhLM2dLOFhsOFBCc2R2QjdZYzNYZ1RwNTJuZHJ4VkxOOWRLU3Ir?=
 =?utf-8?B?MlJnM2lTaW1ZeEVTQnd2cHdsbG9SZldYVXJlV1dnU0dOTkpCQ1NJWE1MYmhC?=
 =?utf-8?B?UWVzemhHM0dKSm8ycG1oWkxDUitNZUdNZWNoZVA3TmI3MEdnQ1lBei9taXBv?=
 =?utf-8?B?a01sbFFVTlZBUnk3OFNNMURzWVVFUndCdUliRW1RQW1PK1I5Q1ptbmFnZW1Q?=
 =?utf-8?B?c1pyaFFORWpGM3J6OXJpN3ZmYkFURDZZWkdVR1RxT3hoUlg3L2krbmhlQXgv?=
 =?utf-8?B?Q1hObHFCTTByeFlFVCszb0w0dnJxK3ordEdnVFA3WHM5V1pHTXBMU21LWkpJ?=
 =?utf-8?B?VkdiUmI1TEYyZnNTR3dzanpjWEpreGNvUy9LQjVMK1grUHZxdTVDRjQ0VVpk?=
 =?utf-8?B?MW9tbUpFdXlXaVR1L0F0MHJkeEJQem14Uks2YUlVb3Jla1A1ZnVvVm9zYjF2?=
 =?utf-8?B?ZXRrQk9SS21JRlBqdEJQbklEYnA1d3ljTHNIVkJtR2ZXVGhZK1JuNDN1OTVQ?=
 =?utf-8?B?WkFydE9aYTBUSnlWM0pWcXhUSmd4aVZmb2lSOHRnUUlJOTlMd0hoRnNHWmE1?=
 =?utf-8?B?UlVrRUhNMHdHcVNabWJ6dG9WY0tkcDdpaC9HTHFJeUJxeHB2V3VSbDRXcHlS?=
 =?utf-8?B?Wkt4V0c4N0RWMFlrOTRma1VSSnNvemY2eG5FakIzNEQzSWQwTGZYSGRzZEU5?=
 =?utf-8?B?eU1mZldkcnN6bEJzZWwvaE1xWnIwZDJ6ditDNHpCbkl5aEFmZU5lL0R4elQw?=
 =?utf-8?B?cERlL0RWVEg1MGcvUElKQTl3dUZpWWhyak9jWjR0UWxIWStlMEh6WGxPdk56?=
 =?utf-8?B?ZGlmVGNwU3hBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWgwSERQNjZrZmxYSE5Jb05QWk5jQnZ0NFRWb3dmVUpuMXhBdFdWN1d3YlFq?=
 =?utf-8?B?YWdQN3Z2OHduNnFPcmxCMUFLOXcwcU5kcHNVL0VVK1RwWlZQckZvT0JBS1BC?=
 =?utf-8?B?aDlhZ2F2am5qWTNQUFNvbzFrdXdnbm9WeXFQd1MrRmNQbS9oZzNDVE5xYzNW?=
 =?utf-8?B?YmJyWGhNd2t6MVN3cTN0K3ZBVnZCRGZndnovNUQ3ZjhZV3QvZW9PSGVrejZH?=
 =?utf-8?B?bkllaEc4bGN0OUZabDBjOXpENElMRnRYZHRTcmJlWm40TWZSMVJjWHowVGFL?=
 =?utf-8?B?eVZHYjZUWjQ0R09qRG1veXc5emlpeWdpd1hIU0tJa0R3TjFuRzhFT0V3bWly?=
 =?utf-8?B?bERxeE5sVnVJSEYvQVpTVmNjMjRDb1hZRTA3bCs3K09NTXhKY1ZEd2RibHRZ?=
 =?utf-8?B?REZJbFprNHE2RWc0WVoxUGtaQi9tMGJCVjlJSnFtdkJzZnFZb3lvOEp6L2cr?=
 =?utf-8?B?MW5VSzZ2bmY1NnZ6cStJN1JFaUxZNXVJWlZDTkZtK2VMcWlhVkJ5YWE0dytW?=
 =?utf-8?B?Tlozdmh2c2JzbzRKaVVrdk85MkUyZ25JNmxoVmRoY0xEcDZzaGpGUS9vNTJR?=
 =?utf-8?B?ZldMUWh2djdrZyszMklCMlhPdlNxcFQ4VWJweGZWR2NwTDJPVmt6RzRxbncz?=
 =?utf-8?B?SGFhTTNmcitoOTJlUVNHbkVYZDFJWTVOMHhCVEZQa2tUTDFKSGo3TFpWWDZB?=
 =?utf-8?B?NGNnQThpcE1KbG5jQnBBOUJQdXU1RUkycjladWFOTDJ2WWtRNWl1L05YUksr?=
 =?utf-8?B?dm4rcWwzcHdxVGhGWEFTNGFNV2ljaGFqQVo4YlFCaFE3eGJxY3ZtRnVXSVJp?=
 =?utf-8?B?UHdpTVE1NEVyU2dUc2NuYzB3VVFFaFJkTlhQdUFWRUhPU0FFREFKWjJORGZl?=
 =?utf-8?B?S0dZWUlMa0pSMHZrQk9UUGl0REdkYnRDR0JEeVdGU0ZtZ0pEbmw1eTlFL0lB?=
 =?utf-8?B?ejR1VC9ZZUZFT2paNlY1VzQxcXZzYk5aUmpMTDQzVGlNZnlJVlpOZ3F4NFdU?=
 =?utf-8?B?Snd2WHNQd0ZxZVFWbjZiTUhCRHd2YjBmYVpyblo5dkdzYnh5UzJ6KzJGR1Q5?=
 =?utf-8?B?ZXAzWWZFZ25XNi9QTmlzVXI4UmxIWEJBOVZlZUQ0MWl4T3JaMlVlaldDQU9l?=
 =?utf-8?B?aS9iUnF5dFFpcFBRMGIxYjFYTnVIOHRUTm5NditrQjVXSHZSZVR1UURwOTdN?=
 =?utf-8?B?S0VHZDF2TCs4bmFSU05jMWg4dzdzQ1NVbVA3RjdRU3I2NjFZWFplZTlIVm5U?=
 =?utf-8?B?V21aUjVHRXppYzB3ZFBxd2owMlh0b1ErVVdxRkdoM3JFNDVJaFNwVEJjdFFp?=
 =?utf-8?B?VDdyNy90bWZsdG1kVFJxaGFYek4ya2lhanNWRkNsK1hnR0JkTWJybjJjbzkv?=
 =?utf-8?B?a1ZlUmhHVGhFYnRFN2dYVDJoSTB3SStRRVNQUElYcktHclp6cXpRVitsVjB2?=
 =?utf-8?B?NXpibEF4eGxiSEVBK3VSQTZIRjJqMU9HV2ZPa2x1NFFIMUkxdDJoVHk4bUhS?=
 =?utf-8?B?QVl5bjNNMWs4QVFvenpwczE2azJvcFhNd0p2L2hFeXBzZk15YWloRWhBcnpG?=
 =?utf-8?B?VXJzTENKQm1iVlQ4cXJlbmxyOG5sKzhqMDk4aEdrZTBPQm1WUnZCblR6NTFX?=
 =?utf-8?B?YmhiU05QMzFxdDdKeVl5RWo2M3FuRVJ6UHF0ZEt6T2VsaXAwK0h0amc5bkd1?=
 =?utf-8?B?VUNQR0N5aFFlQ0hKVk5HUk1scnpZRzRGWUFRdjRlZ0hrOHJMWExyREVoMUh1?=
 =?utf-8?B?K2hZeUJuaUdNSkpZa1diZ0lmQW9JVWhhNDF3VGNKNWsybTMvNVVBekpDbnlQ?=
 =?utf-8?B?dHlSQjBnK2Y1YXpWNm9lcURvd2lKZjFWSjdmbUM2YkhYUjk0Tk96OUNCRFJZ?=
 =?utf-8?B?RUhMODVFaWIvbGcvV3did29BejgvSjEzZjBZUm92MnUxTm02OUlUd0dJbS85?=
 =?utf-8?B?T21aQ0duenlZdjROODdmd1MzNXNURlVkQ2ZqRlhvRXc3V0xmWFRjRXpTZ2h2?=
 =?utf-8?B?WU9PNGpCUmpDNlhDZDJSN0ZQZm55RVNxRzNBR1MvNWhTd21GbkU5aU5QR2FU?=
 =?utf-8?B?YXFwODFtY1RPZS9jblBuay9INDZjMUVpMHEzTlJCTlJSV3Zqd3E2aEZJT3BG?=
 =?utf-8?Q?r53Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f923c8-9860-42a2-c283-08ddc066308c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 10:32:09.2607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXwuzpY0lxNz0/KqgSovrmCtRXmJeUxSGGjQVKum772IchCOu5KY3UfyCj9BeLoR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9397
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

On 11.07.25 11:35, Thomas Zimmermann wrote:
> Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
> in the affected places. Also revert any fixes on top. Separates references
> to imported and exported DMA bufs within a GEM object; as before.
> 
> Using the dma_buf as the one authoritative field for the DMA buf turns
> out to be fragile. The GEM object's dma_buf pointer can be NULL if
> userspace releases the GEM handle too early. Sima mentioned that the fix
> in commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles for
> framebuffers") is conceptionally broken. Linus still notices boot-up
> hangs that might be related.

Did I missed that response? What exactly is the issue?

> Reverting the whole thing is the only sensible action here.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the entire series.

Regards,
Christian.

> 
> Tested on virtio; and amdgpu, simpledrm plus udl for dma-buf sharing.
> 
> Thomas Zimmermann (9):
>   Revert "drm/framebuffer: Acquire internal references on GEM handles"
>   Revert "drm/gem: Acquire references on GEM handles for framebuffers"
>   Revert "drm/virtio: Use dma_buf from GEM object instance"
>   Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
>   Revert "drm/etnaviv: Use dma_buf from GEM object instance"
>   Revert "drm/prime: Use dma_buf from GEM object instance"
>   Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
>   Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
>   Revert "drm/gem-dma: Use dma_buf from GEM object instance"
> 
>  drivers/gpu/drm/drm_framebuffer.c            | 31 +---------
>  drivers/gpu/drm/drm_gem.c                    | 64 +++-----------------
>  drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +-
>  drivers/gpu/drm/drm_internal.h               |  2 -
>  drivers/gpu/drm/drm_prime.c                  |  8 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 +-
>  include/drm/drm_framebuffer.h                |  7 ---
>  11 files changed, 35 insertions(+), 106 deletions(-)
> 

