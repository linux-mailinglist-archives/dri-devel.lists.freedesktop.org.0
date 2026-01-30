Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIMYGVewfGmbOQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 14:21:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D816CBAEFE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 14:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3C210E9E0;
	Fri, 30 Jan 2026 13:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DK4jqK8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0518010E9DE;
 Fri, 30 Jan 2026 13:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjO2ua9sp2fCQcveWDi6OXFrK4egujjdPbfZ2fXCMKBzsRrhYJdgV88LUCjiUEIxhta0RIZgVXUOrOXRb39WqUKcAE79OcrP6bRAGeP1gPwRZsix24BQ4Pvm1O7YRQ+IfjSSnuCYGiemlbEm1DuLKK2nSNGlCxoItfEg/njJKC50kVivycN414RALnOY11kkXO6ns9uc4K+w729u3UkkhxuWszy9Xmd8S8LCy6WW02aMGGYOvScbTeBlOL7ThoeHbi4Pza56mF6FpK4muJIj4safyzWUNpq+M0OnYkBdR6YcE343IsUMzriLRp60Fsn6HaEU5ZqtlpURQOy+kApt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IQjennPt/LlCVJ9R7VBQf0OtN9qohRUg3VGDVzgCkw=;
 b=vVh3dfNfFyus+EVEIOZjAJS1y89/mhXnLrCQvPQYSb+wpeRHvGmvebL+naTtSc17V50AeHcMGwJGjG4uqZdaEKBow81eRNV34FJm0Qk089PqZ7xgSzWsIxQwm+SzqTORtfTg/v+nA8AMGbuuZOIpKD5ocrAuZfyOQEt52gixAyU7J7Dk5mKb5zhuiYl5tG8zftiYi+NS9e8Cy8xx8YcrSf9Pqj6bwDKZ8QdwSU48Il604GzqLcpt8MdkQRZ6VFz0tG7VpowZfbuvGJpsKazf4myVp+r50mTUCmkOlxhvXPiMw+eMU8lSgMWmfYLuKx4io+Aj/JJIFK8/2HKl+DEtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IQjennPt/LlCVJ9R7VBQf0OtN9qohRUg3VGDVzgCkw=;
 b=DK4jqK8NZavHss7++DBGuScVj3H8VbpshWIhoxszY7u59E+dG0FOJd7V2A7c/1ZmokHhcw7b4H+3eSgwv+r4oaCQ69WNy4VubXyQHA0oxVKNwgZx4lmX7wpshtcLQnmRp2oOvbAj27tF1q+PvAgH4XaCKS7oY64PfUFdGeBa4qE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8854.namprd12.prod.outlook.com (2603:10b6:930:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 13:21:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 13:21:17 +0000
Message-ID: <d25bead8-8372-4791-a741-3371342f4698@amd.com>
Date: Fri, 30 Jan 2026 14:21:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <31872c87-5cba-4081-8196-72cc839c6122@amd.com>
 <20260130130131.GO10992@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260130130131.GO10992@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1d0440-e085-42cd-36e6-08de600272d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0lhVmx0WXJFMUdtck1OUUZrdW5vQXh1VERndGhuaEVjd0RVSS9Ba1dRWjBV?=
 =?utf-8?B?ZEJEV1JXV0VzOEhXYVVrN0VvMXhkclVKRjVIUGJ4YWFCVlFvcTZJbEQyNE0v?=
 =?utf-8?B?VEI3b3ZIV2tENjlTRktmTjVqQzAvb3JjMjYxdXJkNllxdHBzWDV1d2xpT29q?=
 =?utf-8?B?OERNVFArUVhnWXNhc0dIVnJhTGhyQmlNU0hOVE9wbDRaSGh0MFFUdnFjQmZx?=
 =?utf-8?B?TmhBekhoakZSNE9JaUE0bnZNeks5WmR4Y1haTHZJQlBBUEZ0Vjh4VzF2NS9C?=
 =?utf-8?B?QU9UUURib3UyQnJGcFkvbkVLbWd4czZwdEVMUFFEbnN2YitSRjNEWGtERW0z?=
 =?utf-8?B?a216RW1TTXFYUVJFMW0vWmRXc3VuTGQybnhkRFFoUFErU1hJU2NMMHdBOENF?=
 =?utf-8?B?RGF2azhSSERLVWczM0V2bUptMDVaandCeWI2NWRndXFUUmZtU2IrRysrUVR4?=
 =?utf-8?B?ZjVVNkY4V1l1Q2g2Z2VlM0dBejVsZmZ3bFJUWGNReVNWVzhHZUk1UHVwTlgv?=
 =?utf-8?B?ZkdMQ2hsTmNXdzYrK2V2NUhaRnk4R095a1lQanFuYndkVkZyQXdqMTczT1dE?=
 =?utf-8?B?VFlhYnZCeW41eGlSUjM2OUFGNnRucVdlR3pVdkFhbzVSRGxWQllycmhSOTFO?=
 =?utf-8?B?NGtyRG5vT3lmZDY3SDV5ZGxZbWJRYUM2OGFJR0Z2WTdYRFRrNGVUakxKZCs0?=
 =?utf-8?B?QkVYVE5Lc3BlaUFxNFY4ZVpoOGhnU0xTQWN2NXVuZXhkbVF5OEJjMkMyZ0pH?=
 =?utf-8?B?TWdzbm5MQTFIM0dFQmlZQkJ5NzJYd29JeitLekkybnpYbmhhRCs1a3JlTGVh?=
 =?utf-8?B?VVpBeGp3K2lXR0twODczQmxrSjVwVnhDTGkzeXlLazZJdjFOUEVZdWRnM1Rv?=
 =?utf-8?B?cFl4ZGd3eWtYZEdmRUo4a3VkUDZWNnBLdDRCWFF6bXY2VksyRlhrcFZjREhv?=
 =?utf-8?B?VWJBQmY0S1FiUVd3ZzF0K00vRFU1NkpRUjRYZm1vK3gvcWU1dnN6YTlKTGhT?=
 =?utf-8?B?ai9FWlpKV1ZpV2tHaldzZDRhQ3l5Zk1nS0U0a0J1VmxBMXkxRkxhcG5qVUhR?=
 =?utf-8?B?UG54RzVzQUE4ZFRaMVVwb3F1REhnOFFHVlhTQ0xrcXZkNkphRkt1cm5zeHo3?=
 =?utf-8?B?a0tBWjhXUFFpRnV1MDBOVUI2alpLWlJRTEZObFUwUitwYWpNUk9qVm81Sitl?=
 =?utf-8?B?THZ1L2cwQ3pBaEwwNzA5Qkt4VDZKaGZCMk5JR0ZLQTJIL2kybWJOMFl3Tzlh?=
 =?utf-8?B?WnBEb3VOWmZmNzVQMG9jdVhTZFd4eVVFMEpWSEFnRzZ2YzJFcGgyL1N6dkY0?=
 =?utf-8?B?WFl4SWdEK3MwRTdxbnFDTFJ2dmxEK2hhcUlPNDBZQTFTM0NWSUlUdlRsTVRH?=
 =?utf-8?B?ZWVvNW1hQjFCZVpxOHhFZUZ1OVh3TkJObktTcmRIMHcxdFpQNVJES2hsdkVH?=
 =?utf-8?B?THMrZXEzeW1BcS9BamVmeHFsbzhDbHdrRHVCQ0ZCZUZIRFg4RkdpSFZTY0Q2?=
 =?utf-8?B?bkNaUUxub0FsZjZjcG9TdWllZEZQM21WZ3FLTHhoMWlQMkRTZUpqUmhDZEVa?=
 =?utf-8?B?ekszc1VVRTNqS01KeEtDS1IxZnlTMXRHMzN6ak1nbkVZb2hlQU5ib1ZXNFZL?=
 =?utf-8?B?WEhkc21OeDhYMmxFS3FCZXNvZVBnbWs5Tm9NYnNjSTE0NXA0dmdRbHBqa0l3?=
 =?utf-8?B?Vi8yT1ZjZFZhek1FdTVkcDBDZGtEVWZrbkZOMkRtY1pZK3lCQnh4MWF4RWl3?=
 =?utf-8?B?aVNwKzVuZzdseUkzRkxiekJicEw3WFVqUlpPeWNsem1SR2Z6RHU5NlV5dy9p?=
 =?utf-8?B?ak5vNTFSK2d6eTFGNlh3Q2toZGdkV3NqMnVTQllPOE5JK2laMGl6YkNsQ2VJ?=
 =?utf-8?B?TThYOUxDbktyQ3NFZkEzMFZtSk84UFVYR0h5VUhHYnB4YmxpRUlrZVBHdEtx?=
 =?utf-8?B?Wnp4UjlxZHVpUkdXZ2dQMWQzWkYvN21Tby9PR3ZxTW1BSnZ2NE5YTEZOZldF?=
 =?utf-8?B?RWRkRStIS0lXV2hVYzhza2JCQTI1RStIVGR6Yk1LMjJMRzQ3emo4aER0QWlv?=
 =?utf-8?B?SVBWMVdka3BDemllSHQ3VkxXaTVxMCtQNGRnak5ZTFdQYXhZTm80MFhrbFRk?=
 =?utf-8?Q?OFCc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStXL3d6QVJkRld6ekRxaTc1NW45cDNBYTRqSTNxSnVwNCtaZnJHSVF2T0g1?=
 =?utf-8?B?WnFYN05vVTRpSk1TcDVnVUVmMDJFSE03RFZqeWlTa1JmR0R0ZFRmRVZsaU10?=
 =?utf-8?B?bXFSanloU1oxK3lBbTQxWURYOTRKWjlZK0pXL2xuYjRYbUJmTXM2MlEzVHJN?=
 =?utf-8?B?YlBRSzFzT2FGS0V0MmNrcHhKOENVTlNqcThhWFA0RE1JcWkzdUR5Um90MC9M?=
 =?utf-8?B?MktUNnpKcEZlMURLbktUeHdmRkpzbmpmZnpDZzN5M0YyQ0g3bW5DR0c1ZFdI?=
 =?utf-8?B?cktKN3JST3hmWGwvUnNTbzNCQ0R3L04wUGRvamlLQW45bW5HK212RXBFTWRE?=
 =?utf-8?B?STcvai9LSWRKaE91TlVsNUNFdkdDNEQ1Ym1EeWtnRzk1YVduNTlHVk1Gd0My?=
 =?utf-8?B?VjhrVFpHcjlkOWxyTGkwb1RDVXFJdG53MkJhMGUycjZPNVdvdk9nNFpQZll3?=
 =?utf-8?B?UGNub0RnQWM4OHB1dmEyU1dUd05BMC9SZitRc0NXNHErSW96RlBONnN4K0d2?=
 =?utf-8?B?akdiOWx1L3YxVVdNN2xuTGp1Q0JmMTBDWGNWRWx4WVhHSmZFc1MvbXcySDc3?=
 =?utf-8?B?TWM4YUhBYy9raWtDUktBVVhJZ1kxN1FzMFpxbUE3OXNsWVU5TEVmSWwxMitZ?=
 =?utf-8?B?ZzdOQVBjZm5iSVI3WlhTU1hJMjhBeGd6RkNPeHZCblpIRUV5SHZ0OUM5alBY?=
 =?utf-8?B?VFRqanhmOCtTQnFqZFlJM1lTRmk5UmRzV3hldVVqVG9uT3J6YUphSm8zRzJI?=
 =?utf-8?B?Qm9uWmh2ZmxxcUZucW1lWnhSYWdpb0NZRFppclR1Z01UVW5NL09Eb0pqSG95?=
 =?utf-8?B?aVlsR2FGaUd5R2VxQU1oeFd5ZTBpdVBObjM2MkhIejlHZEFMQVhDUEgvY0F2?=
 =?utf-8?B?NnZHZnFJUTh1TG9CVkVEODJ5Q25CUkh0YTZTNUdacHV2UjVlM0NtcWRxSXlR?=
 =?utf-8?B?bjBjakppUW45Z2VIbml2UXlIazB1Mmx6ZDNTMGtIUHdoZmE2SjliUlJkRnBj?=
 =?utf-8?B?cmU4dGc4YlpzREI2YVpGMFJCWHR0UkZpWVo5MjVEL0s1ZFRacHN2M0RsS2hz?=
 =?utf-8?B?MEtUQkJ5c3FERDJPNjNTTndPYm9CU1J1Y0tqSTkzMVMrUDNFOGt2c2dKTUpt?=
 =?utf-8?B?TDhPV0ZuWUk1UWFUTVJkd0VrMlU1ajZmd3ZZTU5rS2lhRE1uMjJ4M2d5R2VL?=
 =?utf-8?B?SW0vb2NSZDd2d1RzS3dWZzk0cjljN3Q2TWF1amZiTytnVkxZVXFtYkU1dUJ0?=
 =?utf-8?B?WW5aT2VYWGNxV1d3NHNNNWYwQzNwTDF3OEFLc3drcTRDSVdOdmN0eU4yYmJz?=
 =?utf-8?B?eWZlNjJUNjI2WklHczdONmFmOG15MENpSnM4bkxjTnptcjMxT0Foa1BsYWxN?=
 =?utf-8?B?VUIyaE51VFd1T01KZzhqQVVBaUx4aFdwUHlVelBQVmEzZCtHUHU0MzVKTGZs?=
 =?utf-8?B?aXFPYjJrMm1mUWFzaFBGdXFGVTZoRmpFNEs5b3dEU0p3MXE3NERobVhiUkg0?=
 =?utf-8?B?OEpHRWZHOFk0UkZBWXVrNGRPZzBEbXhJQ3Y2UjBmZDQzWHNEZWhybzlHdUh4?=
 =?utf-8?B?ZVdzMDFNSGpXZjVCVzdXRTFqanV0c293S3JobGxBaXhxWFFCTEZXZEU0eHlT?=
 =?utf-8?B?MHhqdnR1UlRYMzN3eFRFY2U0WkZ0RDdaRmU0MklNZXRZZmRFeW81aERya3Jp?=
 =?utf-8?B?L3RRblpSM3FlZ2tyOGdXY2RES3BES2U5T21VWC9jVkl0NzZUZFZLbHo5OTUw?=
 =?utf-8?B?MTZHcWtkdnEzaURTUVJNcnMyNVlxbmRhK2VndmxUUTh0L01yT0FZTDFDOW1I?=
 =?utf-8?B?eThOUnVmdlA3Wi9wV0RGckh4M0NHdmVjY1Zrd2hXaEtjVFc3UXpqQWIzeG9t?=
 =?utf-8?B?aUhzVUpXVzdlWHRXUWo0cHNncUhpS29hL1dzRmY4WHhrOHlvMll6RzIxdmZR?=
 =?utf-8?B?Q0lOUFBXWERUaDRFbVllWGNYTWl6b09XZHhqbVJZQzJtNS9zbXFlT1kyQzFz?=
 =?utf-8?B?cW4zWWFTdkJGeiswM0ErQklaeWJwVm1LTWpkYXN4bU5Vd2Z6cElOb005SzdR?=
 =?utf-8?B?NmovdUpzUU1yTkxqYzFMMDZOY2VHUmpSRUtNMTgxNjJRS3lHdFVoc0JXMHpU?=
 =?utf-8?B?clBUZEV3a2JPL0FuM0IybklwQmdoeFR1cHBCK2gvcnFUazBnbEwySk5VODEv?=
 =?utf-8?B?YnhhUW5pRkxSZGI3YmM1bEwyUzM5cWJoM1d2LzB6UFVlTXlXaThzbkdOcGZx?=
 =?utf-8?B?akJZdVhRNXNwc1NLUDVOMElFTStRZTNuc2ViNXFyaSthL1BZcjk2dzV2b1Yx?=
 =?utf-8?Q?yB20w0ucIJ3kA9kfz3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1d0440-e085-42cd-36e6-08de600272d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 13:21:16.8963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EqoeMi8MbAh3PswTkpaLRgh7grjOHess/rTNKn3ioNe5aewX3ZTKu8r/lD0r/DX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8854
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: D816CBAEFE
X-Rspamd-Action: no action

On 1/30/26 14:01, Leon Romanovsky wrote:
> On Fri, Jan 30, 2026 at 09:30:59AM +0100, Christian König wrote:
>> On 1/24/26 20:14, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> dma-buf invalidation is handled asynchronously by the hardware, so VFIO
>>> must wait until all affected objects have been fully invalidated.
>>>
>>> In addition, the dma-buf exporter is expecting that all importers unmap any
>>> buffers they previously mapped.
>>>
>>> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 71 ++++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 68 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> index d8ceafabef48..485515629fe4 100644
>>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> @@ -17,6 +17,8 @@ struct vfio_pci_dma_buf {
>>>  	struct dma_buf_phys_vec *phys_vec;
>>>  	struct p2pdma_provider *provider;
>>>  	u32 nr_ranges;
>>> +	struct kref kref;
>>> +	struct completion comp;
>>>  	u8 revoked : 1;
>>>  };
>>>  
>>> @@ -44,27 +46,46 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>>>  	return 0;
>>>  }
>>>  
>>> +static void vfio_pci_dma_buf_done(struct kref *kref)
>>> +{
>>> +	struct vfio_pci_dma_buf *priv =
>>> +		container_of(kref, struct vfio_pci_dma_buf, kref);
>>> +
>>> +	complete(&priv->comp);
>>> +}
>>> +
>>>  static struct sg_table *
>>>  vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
>>>  		     enum dma_data_direction dir)
>>>  {
>>>  	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
>>> +	struct sg_table *ret;
>>>  
>>>  	dma_resv_assert_held(priv->dmabuf->resv);
>>>  
>>>  	if (priv->revoked)
>>>  		return ERR_PTR(-ENODEV);
>>>  
>>> -	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
>>> -				       priv->phys_vec, priv->nr_ranges,
>>> -				       priv->size, dir);
>>> +	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
>>> +				      priv->phys_vec, priv->nr_ranges,
>>> +				      priv->size, dir);
>>> +	if (IS_ERR(ret))
>>> +		return ret;
>>> +
>>> +	kref_get(&priv->kref);
>>> +	return ret;
>>>  }
>>>  
>>>  static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
>>>  				   struct sg_table *sgt,
>>>  				   enum dma_data_direction dir)
>>>  {
>>> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
>>> +
>>> +	dma_resv_assert_held(priv->dmabuf->resv);
>>> +
>>>  	dma_buf_free_sgt(attachment, sgt, dir);
>>> +	kref_put(&priv->kref, vfio_pci_dma_buf_done);
>>>  }
>>>  
>>>  static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>>> @@ -287,6 +308,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>>  		goto err_dev_put;
>>>  	}
>>>  
>>> +	kref_init(&priv->kref);
>>> +	init_completion(&priv->comp);
>>> +
>>>  	/* dma_buf_put() now frees priv */
>>>  	INIT_LIST_HEAD(&priv->dmabufs_elm);
>>>  	down_write(&vdev->memory_lock);
>>> @@ -326,6 +350,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>>>  	lockdep_assert_held_write(&vdev->memory_lock);
>>>  
>>>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>> +		unsigned long wait;
>>> +
>>>  		if (!get_file_active(&priv->dmabuf->file))
>>>  			continue;
>>>  
>>> @@ -333,7 +359,37 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>>>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>>>  			priv->revoked = revoked;
>>>  			dma_buf_invalidate_mappings(priv->dmabuf);
>>> +			dma_resv_wait_timeout(priv->dmabuf->resv,
>>> +					      DMA_RESV_USAGE_BOOKKEEP, false,
>>> +					      MAX_SCHEDULE_TIMEOUT);
>>>  			dma_resv_unlock(priv->dmabuf->resv);
>>> +			if (revoked) {
>>> +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
>>> +				/* Let's wait till all DMA unmap are completed. */
>>> +				wait = wait_for_completion_timeout(
>>> +					&priv->comp, secs_to_jiffies(1));
>>> +				/*
>>> +				 * If you see this WARN_ON, it means that
>>> +				 * importer didn't call unmap in response to
>>> +				 * dma_buf_invalidate_mappings() which is not
>>> +				 * allowed.
>>> +				 */
>>> +				WARN(!wait,
>>> +				     "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");
>>
>> You can do the revoke to do your resource management, for example re-use the backing store for something else.
>>
>> But it is mandatory that you keep the mapping around indefinitely until the importer closes it.
>>
>> Before that you can't do things like runtime PM or remove or anything which would make the DMA addresses invalid.
>>
>> As far as I can see vfio_pci_dma_buf_move() is used exactly for that use case so this here is an absolutely clear NAK from my side for this approach.
>>
>> You can either split up the functionality of vfio_pci_dma_buf_move() into vfio_pci_dma_buf_invalidate_mappings() and vfio_pci_dma_buf_flush() and then call the later whenever necessary or you keep it in one function and block everybody until the importer has dropped all mappings.
> 
> No problem, I can change it to be:
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d087d018d547..53772a84c93b 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -357,23 +357,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>                         dma_resv_unlock(priv->dmabuf->resv);
>                         if (revoked) {
>                                 kref_put(&priv->kref, vfio_pci_dma_buf_done);
> -                               /*
> -                                * Let's wait for 1 second till all DMA unmap
> -                                * are completed. It is supposed to catch dma-buf
> -                                * importers which lied about their support
> -                                * of dmabuf revoke. See dma_buf_invalidate_mappings()
> -                                * for the expected behaviour.
> -                                */
> -                               wait = wait_for_completion_timeout(
> -                                       &priv->comp, secs_to_jiffies(1));
> -                               /*
> -                                * If you see this WARN_ON, it means that
> -                                * importer didn't call unmap in response to
> -                                * dma_buf_invalidate_mappings() which is not
> -                                * allowed.
> -                                */
> -                               WARN(!wait,
> -                                    "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");
> +                               wait_for_completion(&priv->comp);
>                         } else {
>                                 /*
>                                  * Kref is initialize again, because when revoke
> 
> Do you want me to send v6?

That would work for me.

Question is if you really want to do it this way? See usually exporters try to avoid blocking such functions.

What exporters usually do instead is to grab references, e.g. call pm_runtime_get_sync() when either a DMA-buf, a DMA-buf attachment or in your case here a mapping of this attachment is made.

But all of this is just a suggestion, if you are fine with blocking then feel free to add my rb.

Regards,
Christian.

> 
> Thanks
> 
>>
>>> +			} else {
>>> +				/*
>>> +				 * Kref is initialize again, because when revoke
>>> +				 * was performed the reference counter was decreased
>>> +				 * to zero to trigger completion.
>>> +				 */
>>> +				kref_init(&priv->kref);
>>> +				/*
>>> +				 * There is no need to wait as no mapping was
>>> +				 * performed when the previous status was
>>> +				 * priv->revoked == true.
>>> +				 */
>>> +				reinit_completion(&priv->comp);
>>> +			}
>>>  		}
>>>  		fput(priv->dmabuf->file);
>>
>> This is also extremely questionable. Why doesn't the dmabuf have a reference while on the linked list?
>>
>> Regards,
>> Christian.
>>
>>>  	}
>>> @@ -346,6 +402,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>>>  
>>>  	down_write(&vdev->memory_lock);
>>>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>> +		unsigned long wait;
>>> +
>>>  		if (!get_file_active(&priv->dmabuf->file))
>>>  			continue;
>>>  
>>> @@ -354,7 +412,14 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>>>  		priv->vdev = NULL;
>>>  		priv->revoked = true;
>>>  		dma_buf_invalidate_mappings(priv->dmabuf);
>>> +		dma_resv_wait_timeout(priv->dmabuf->resv,
>>> +				      DMA_RESV_USAGE_BOOKKEEP, false,
>>> +				      MAX_SCHEDULE_TIMEOUT);
>>>  		dma_resv_unlock(priv->dmabuf->resv);
>>> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
>>> +		wait = wait_for_completion_timeout(&priv->comp,
>>> +						   secs_to_jiffies(1));
>>> +		WARN_ON(!wait);
>>>  		vfio_device_put_registration(&vdev->vdev);
>>>  		fput(priv->dmabuf->file);
>>>  	}
>>>
>>
>>

