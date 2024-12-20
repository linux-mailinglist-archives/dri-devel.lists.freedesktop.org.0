Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397899F9293
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 13:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5041F10E087;
	Fri, 20 Dec 2024 12:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bQAvTPTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E698F10E087
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 12:53:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/Yt+ebsbWHofRSV7BBiJOATrTTj9X5g1joy3xSg3GcONDrPew2OsWvj+5A6BhoyDZ6teYLIXz8+h5RSxk2ydWEF6onXGHVYuaxt6Ghbv20GEyekxny/mMMlxZEgI+kyFK97tg70Yh7CrxdeE2PjQs2yFYuRSY/1ss5y98zGe5bQpAcwM01aCn0m7oZHDs5n6sIgPVqoiW0HPFwNKyBFVoGHUK8sp6NNVV346dQ7jFZANo0yoh/8PZxlBw3xoVjh5s92etgdLYoAEhXV3O+L+93lsMuQBYeunW7PZnKEg8mhctsFa3ri6F5Dl39a6NYTCyLoU4av943tptS75gkaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4s/HuIjGFN+7xY9+zqPzQJq+nzJFzj6gap+bng7oO4=;
 b=NBoZn91EZ9c+YezT17JZ47kX/XKNy679WixHF9JzHzqi2phVcNGwJv/mCLDWSHqfjuMFfs7ir7qe27H1dupDUQa3wX+j9xaDF7fVGhHjWcB22LmysELVcFt0zQtpWYahlOMKSnyDWQWpe++S7B/ar8U5wjogqb5frFwm5m0NDXcvCgI/9tjXAfF8/ZSVVDEge3DU+eG310PwZyy95uwTRF3zJWbdHv48pXeLL+tc1tBaLd1PQkuodFuhu2M5OL7EOu0qIOSNTbMpJUtne2/SIc4TbLqFuy+H7M63MbWTOURQj+ghf/CjiAvkflEBwnWqBaSGgRVfH9DxDvDFJyN65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4s/HuIjGFN+7xY9+zqPzQJq+nzJFzj6gap+bng7oO4=;
 b=bQAvTPTphZ/MyUWYY93MnAG50adQuq3bmH6ktq9aVENBC3pK8LLmoAQQxCviPKc9iDqbSE6TWuofbVOkOvI+O0da7WPJ15rdKp6K9RVZ2QY0vzFP77TRO6Ie/ZzeYr7tiAu2NB8Tbc4qhH2XNTxrCa26vsIh3B5eR9q2DGW2j2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 12:53:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 12:53:45 +0000
Message-ID: <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
Date: Fri, 20 Dec 2024 13:53:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
To: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <20241220124515.93169-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241220124515.93169-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ce36f4-e534-408d-d455-08dd20f556ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THRIdDNUTkdXeG9KNXliQk1DWUh3TTdVNGFrMmhPeXFYVVpyTkhDWTk4Qk1W?=
 =?utf-8?B?eUxwb2FPRFhtdVNoRXFtZmtYNDRMaEZXODFua0hWSy9qZ2QxR2lEU3oyb1Iy?=
 =?utf-8?B?UnBTYmlYOWRnRC9nWG45REdienVSVUhlZnRZZUFsZlRHckYxam1EblNEQ2NQ?=
 =?utf-8?B?dmprMStqeGdhZnNGSEw0WWREcUdXZWJ0UEZLdjdLd05FaS9xYXA1Ym9RV290?=
 =?utf-8?B?QjMxSjhwRWoyRnBFZjQ0eU5VVzJnV0EvNGtBSkluOFlnRUE0bC9vU3dkaVl6?=
 =?utf-8?B?cjZ0dTBNcnQvZE55Nm15ZVh5aTU0Rk5haFNQc01KWmJwNU9zZ3pieXp4MVdD?=
 =?utf-8?B?SWtqY3d0cWNYYW84Y1pwZnJkNjlDSFZXcHRrWmJhREdhanIyM3htd2g3ZFI4?=
 =?utf-8?B?YmdFd3FxRVFlT0JwK1pCL2VoTkd6NEF1djU2SXcrUERwa2srY0RwMi90enpY?=
 =?utf-8?B?R3VhNFFZcFVDUXhSa1JqR0duK3pKTDBYSXNTQ05rSjF4QWFxUkxCNEtTNnlG?=
 =?utf-8?B?Q01GVDNkd1oxNGVOU1VYMmtJRHRzaGQ3VE14NG1jdGV4N0M3bEZ2UGxPb1Vr?=
 =?utf-8?B?V2IwUHhzSi81WHBnYzh3YUZoeG5NQlNXYWNtMDlEcThJMWdnOHRUdkVJbFhZ?=
 =?utf-8?B?M056UEs5MzdISytYUTY5WjhGNytLN29KTXhFWWZQZG5OQ1dtK0ZRSkswVWgr?=
 =?utf-8?B?QWtJOG03Zlp0d0FrSzE1aE9POFRKdUpnU3ZPdlQwS3VlYkxiWmdoZy9tcU01?=
 =?utf-8?B?ekhnN3BkZkRDOVRKOWIrY3hFcFJCcHZwd3hvMHZ5WmpJV09qUTFhc0YydHMx?=
 =?utf-8?B?UGpEOTdiTTFaNnpYZVRNMGpvWTlXdnBXVjBGTXh5NnZKakFjVVZycTNQZTFP?=
 =?utf-8?B?N09vQ3pCMUcyNUd0czZRcVp3TGxLdWNGVXgxMkN3NVhyWVdoU055OFFkRVhy?=
 =?utf-8?B?ZTlBa2hUV1N2c1ViMWlFc3BKSUN5NXVSN1I1Y2k4eHZwSVMzcGdBd1hpcXIv?=
 =?utf-8?B?cEM1NTVGUHYyK0xIWSs0YTJMVUtQRUx0QU9Ca0l0MWI1NWF4TEVwWEQycjJr?=
 =?utf-8?B?SklHSnJuaVlOZ0hTb0lVUkZkc2NNNngzbFlRMWE3dFdXU3d5RlZTeUM0UU1Z?=
 =?utf-8?B?K0g3V01pZ3ZGV1RYUVpKTVFieDVZME85M1hlVjJIRFJBOUl1cEJWVm1EbFFJ?=
 =?utf-8?B?UXI4c3NlTXVlWVlKZlMwcmh5V1haRGtsdGxCbjBxYWdCMHA5bzlrQmFZMzF6?=
 =?utf-8?B?d1liU2lKSGJzbHRVS1ZxcWY1OWVENHVuRXpRSUhETkVwdGh3VnY5UmVMdkZG?=
 =?utf-8?B?Y2FLR1BlNGZ2L2JQbURZMlJjbzdyS3V3V04xTElicHZsWmF1RURwclpZdk40?=
 =?utf-8?B?RkpyNERpeUtDS0NXcWF2RnRVWUQ0aWNIS2l3V2QwZjdjL3k2YzRQSTg5USt5?=
 =?utf-8?B?cERoSWt3cDRVT29aMGhZVVJndmhNa3BJL292UkJGZnFBUnBkbndCRzZLa1NM?=
 =?utf-8?B?N1duTDJRWHFHOGQyNUxHOUdvQVgwVjUzQ3BEbXJJQVltNkdwT2VvakV6RlI5?=
 =?utf-8?B?cVpZKys4UjNmZGNNcmh5anVnZHJ3Rnh2ZitIUzNLNmNmZzZLR1dXZGt3QUJm?=
 =?utf-8?B?blFCcGZzVHB2aUlPVG0xTXN6c2VPaHZKbDN2K1hINzVMRHh3aTJsLzM4bXVK?=
 =?utf-8?B?dE9wK0p2akFaRkFQdXN1d3dKYjJ4MDVObUFFMG1PNVI4WlhpVGZSWFpFeVZK?=
 =?utf-8?B?VVVlNm1UTjg1bnR2ejlsaDEzM1p0a3crZ3k1SkduL1RpU0hhMmRqT25KZ29n?=
 =?utf-8?B?Y3ZEU2tibnA3b1lpVzUxekROR1NhUnpGR2lOanpvVTNyZnRWWDR4YXBEaUFY?=
 =?utf-8?B?K2E2WGVycDNhS0hCNUpDVTJwaW9pOVk4MUFmRkJobmRmLzhBWjV5N1hNaXV4?=
 =?utf-8?Q?KYNLY9N7NuA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmdwbUk4RUtQV2RjS2o2LzdJY0JxelRUKy9kMWdGMEFWc0JyTmtWcklPR1pw?=
 =?utf-8?B?MTdUbkhoYjNtaWJHcTNKalRDZE5kNUxaTFQwY1p1TWd3c1M1dlVCVHZvdWk4?=
 =?utf-8?B?emFqaGE2andvOXdWaFVKdDRGaUtGc3F0WldwdUFXQ1ZKWGRlU2JzOHVEZ3k1?=
 =?utf-8?B?S3ZlRWlHeTZSZW5WMStlSW0zR1pxMXpmWDAvcjFrUW9rV0RiakQ3MytURWNn?=
 =?utf-8?B?ajd4eThIVy8yK0I2cFgxWVlod0x1aThNTjZnNmRUM3pseC8vU1ZBTUNiOFdJ?=
 =?utf-8?B?b3d0V2hsOWgwbi96SjJoUU55ZjVkTGozVVFtOElka3g0YjlWZGVleFVrRjRk?=
 =?utf-8?B?Misrd3pyMm44WG90TGtza3Axc3dWbUdLMGlmK01UeHBCWm1ZTitWamR0QXRG?=
 =?utf-8?B?ZCtBWExhVTFuVDlpdW1wdGdZYk9oQkRiTVhoTnBhNDc5WC91Sm5waDN5V1cy?=
 =?utf-8?B?MFU1YkpoMHpOeDNRUVkzNUpTK2E2cUg3Q0tKWFBiSTQvZ3F2NnZjdytVVWdm?=
 =?utf-8?B?VEhVR1hJQ2k3amc1bUhkeXRvTU9qUE5EaEcvUnJvV1RYQjkyWm5xWlRnMlRF?=
 =?utf-8?B?MW1PaCtENnlkZ0ZIcGx6dEJIMFFqOVhhbmVBZ0FRQ09sdW9WM3ZOLzlkQ2JI?=
 =?utf-8?B?Q09nbGxsaitRMjdqRnJ2ZUJvRG90YzhDU2wzcFVGNE9WM0Y3RURMTXp0eUcv?=
 =?utf-8?B?TC9ZVjZuYnZLV1JnWXM2YlhZY0pqTW4yZW0yVFlKbHEycTBVMWptK0FuNjR4?=
 =?utf-8?B?U1hIQ0dTMENmanJxSEVQYW9FQUJDYVRKZmpvT0lRd3Nxc095UUtGTHF3Nk5W?=
 =?utf-8?B?U1pxVlo5bS9MamZJTWVFUHUrNnhCdStYdlI0ME05aTlUMnkzYkZzZENIQklK?=
 =?utf-8?B?b3lvUndhL3hOSGxjd2huV0JybzF0VUE3REhXV3ByckNXckV3RFRCVGN2RzZn?=
 =?utf-8?B?bkk0OERGOFV3eHhuc3JJZk5uVitXemMyYyt6UU1hU2xNOVJ0OEU3WFNvcUJ4?=
 =?utf-8?B?TE1ENzdvMFRQWWE4RUtLQ29YVm1rYjVGbDJ3ak1qbE5BSHFXaFgrWFg5YzZn?=
 =?utf-8?B?N3RYcjlnZ0E2cm9vVzEwNVZKYUo4dExIRzB2YkNoWUVVNDBlUnB0dXJLNnNH?=
 =?utf-8?B?NENqQ3I5WnJ5L2VFMG5FSHgrcjAySTRlbUplVnJPa0RhVDRVWEd1NmFJNnBj?=
 =?utf-8?B?NUQyTWZHSXJhK3M5ZWVuM3FuR3BMbUFBZDk5RVpVMTNEWEdVVXYvYW5GaFFW?=
 =?utf-8?B?ZGhkVCtZWThxUUp2dndLUVJWMXRyYTlsMHFYMkZXUHBkTU8rMUFYZndFU0JX?=
 =?utf-8?B?M3BsSDcvcHowdGFLaXRTSklUVHJkbmFTT0dpY3NadTVtUFJPbjN6dGZydFAz?=
 =?utf-8?B?Sk90cVB4TVBSNHlDWWh3MHZPMUc3L1FXazhob0UyVjRLN2NnQ0RTcDZjMkJN?=
 =?utf-8?B?MGtIL201bzZZdXNpWG5MQXhVelRsUGcrb0ZXckpaL2xtK0VWZ0pnN2Jzdm9r?=
 =?utf-8?B?cjNlek12N0FTQmtlU1ExUkRwNytmbThFUDZBajlHNTJoT2dvajk4VTFTS2xn?=
 =?utf-8?B?eG0wbHVMOUJJVkExUllXR0NTQVVkRmxtMUt4eGlvZnhiejYvV3dKeTZJcFlF?=
 =?utf-8?B?VlloTWhzYU5FS002cEkyaDMrVHJXWGpha2xJL1NncHIxakR2SnNUNWN6NmVY?=
 =?utf-8?B?bVFRNnFrQTE1c1VFNlFOdTJOVmk1dWw5ZnVwWUJlYmNNMHd2Zng0cVVFMU9k?=
 =?utf-8?B?ZkZKc1BRRGNiWDFOSGdVTE4yR0krYitKNXlYWE14SXM0OTU2alhWNVg0T3FF?=
 =?utf-8?B?c3hUT0NHWVEwN3pOTk5YQzFSUElYdGVjcFM5MEVHcU84VjdoWXIxTUlpWWpk?=
 =?utf-8?B?VjdOWUVCT29VRmtYR0dqZTRaYVBqZ2RkaHl1VlVRc1FkRGdsZ3RxWEhhTWtk?=
 =?utf-8?B?anhhdmZKbzRqMmVldnhkMXoycVM3SVZUajZjK01OZnRET1R1RUk0MjdFc0pW?=
 =?utf-8?B?Zk9melFCNWhodjZ6eE9ETnl5TVJmTkQ5cFZUdVJGT082aVg5TC8rMWRFRGVM?=
 =?utf-8?B?dEpLVTRsYTJXcXp4RzQzT2hWdEJoRDRxOCtYZStmTGl6dGFSbGs3NjA5T2ti?=
 =?utf-8?Q?VF4Rl8b5nmOYA6zhY0a468uC1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ce36f4-e534-408d-d455-08dd20f556ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:53:45.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: negLWwIEwVIG/BbMWdWzAnV9QUUPBL2EQEREp18M3a7L00cACUovcg/MT3vCTDrU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
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

Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> From: Philipp Stanner <pstanner@redhat.com>
>
> drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
> That fence is signalled by the driver once the hardware completed the
> associated job. The scheduler does not increment the reference count on
> that fence, but implicitly expects to inherit this fence from run_job().
>
> This is relatively subtle and prone to misunderstandings.
>
> This implies that, to keep a reference for itself, a driver needs to
> call dma_fence_get() in addition to dma_fence_init() in that callback.
>
> It's further complicated by the fact that the scheduler even decrements
> the refcount in drm_sched_run_job_work() since it created a new
> reference in drm_sched_fence_scheduled(). It does, however, still use
> its pointer to the fence after calling dma_fence_put() - which is safe
> because of the aforementioned new reference, but actually still violates
> the refcounting rules.
>
> Improve the explanatory comment for that decrement.
>
> Move the call to dma_fence_put() to the position behind the last usage
> of the fence.
>
> Document the necessity to increment the reference count in
> drm_sched_backend_ops.run_job().
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
>   include/drm/gpu_scheduler.h            | 20 ++++++++++++++++----
>   2 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7ce25281c74c..d6f8df39d848 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	drm_sched_fence_scheduled(s_fence, fence);
>   
>   	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> -
>   		r = dma_fence_add_callback(fence, &sched_job->cb,
>   					   drm_sched_job_done_cb);
>   		if (r == -ENOENT)
>   			drm_sched_job_done(sched_job, fence->error);
>   		else if (r)
>   			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +
> +		/*
> +		 * s_fence took a new reference to fence in the call to
> +		 * drm_sched_fence_scheduled() above. The reference passed by
> +		 * run_job() above is now not needed any longer. Drop it.
> +		 */
> +		dma_fence_put(fence);
>   	} else {
>   		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>   				   PTR_ERR(fence) : 0);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..a1f5c9a14278 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
>   					 struct drm_sched_entity *s_entity);
>   
>   	/**
> -         * @run_job: Called to execute the job once all of the dependencies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved. This may be called multiple times, if
> +	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> +	 * try it again.

Maybe we should improve that here as well while at it.

That drm_sched_job_recovery() can call this multiple times actually goes 
against the dma_fence rules since drivers can't easily allocate a new HW 
fence.

Something like "The deprecated drm_sched_job_recovery() function might 
call this again, but it is strongly advised to not be used because it 
violates dma_fence memory allocations rules."

On the other hand can of course be a separate patch.

> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * Returns: dma_fence the driver must signal once the hardware has
> +	 *	completed the job ("hardware fence").
> +	 *
> +	 * Note that the scheduler expects to 'inherit' its own reference to
> +	 * this fence from the callback. It does not invoke an extra
> +	 * dma_fence_get() on it. Consequently, this callback must return a
> +	 * fence whose refcount is at least 2: One for the scheduler's
> +	 * reference returned here, another one for the reference kept by the
> +	 * driver.

Well the driver actually doesn't need any extra reference. The scheduler 
just needs to guarantee that this reference isn't dropped before it is 
signaled.

Regards,
Christian.

>   	 */
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   

