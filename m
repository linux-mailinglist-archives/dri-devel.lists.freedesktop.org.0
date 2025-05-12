Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B3AB3388
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 11:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2805910E170;
	Mon, 12 May 2025 09:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="crSJANdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AFB10E170
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 09:30:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGsFrLlUQLK2zFex0vl/IqJ2ks1UmuSAM8o0KH0sEzOD47t0x1EG7VO1ylWpyEEqE3sWFbQyrw74uYVPTtHjBQOf6ZIWjcwjJaCNGnGPn6kQ3ZXgw9LVPtGty8pzxpqxO5GbICxSTDCgdqvfbAqkxmtlyjdZ1tTfjWPF5UUzN0xfvh9mcQ7QczlF44BeYl54NHn+90jx3iAVV3Esbsy54ruQ5OkhWNrGBKK2c5l8TFoNaqT7wP78mKAidPrA5MYsDdjxZOkbYPaL/MU4QaKdSd40TPxzIH3iUjJcrt1+J2YnCmWL6Ipk99cGtdbze5wocYZ0LzjmsC01T9wk1gkPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W504QNJzwkXIoG/0VHbOx+qPUHC5oIxLKhJFOZyyjtA=;
 b=k4rNVOB0vmHMrNjrSzQYMbaiW/7jjq8wAtL+tsWKDWYqWg/497aAhPvvCKP62m6fj2p/CqxRR55e5s92stb/FRuyvXVIdgbnjfRtdtE9gZI05ZRI28XJqgCOHWdvZasB5luVD8TjP/q0GOb4lhIEW8Ms8ZPKI+fYV6YwlFYEDyJZNgIq0PNcawt/x1j89BZIjdm31u0C0s0fqiEYzSB49CRYsEcXuzJizRlIcAiow/baW+mvZER8SCXMn1NPZMB57hBM3d00RlmgH/z6CK0dPguny81zl9XbKwqB9engfg4XTd0F30BOglFh27ODqkOIcN3VfPgKLFuvySTR1xAJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W504QNJzwkXIoG/0VHbOx+qPUHC5oIxLKhJFOZyyjtA=;
 b=crSJANdvNNpQySk/Lxu0WCS4ST0L+jdbC49EfPCv17lOd4wPo55Nk2u6G5ljqXxIyoVkU9khriWohgwFDGzekv1cwF/VYCLLcp5UdCHHWE9ybkbyBh7sLvYuRhiCbaMSn67ExGYv4FF5+eflsDdOX+kNIqg5nJ4Se8a1F+NYID4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 09:30:31 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 09:30:31 +0000
Message-ID: <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
Date: Mon, 12 May 2025 19:30:21 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SYBPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:10::28)
 To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 336c923d-f6ea-406e-3b7a-08dd9137a354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2RjUGhwbDZtTmdIUS9CWFRVQUZHeWphSGFIQnJqSEcvaW5wekJISG1vc0NI?=
 =?utf-8?B?YUhlcXBGTFphM21vOU9CdWhtdkkzZlVXUWt6ai9leE5Hc0krWFA4N2tUMlVx?=
 =?utf-8?B?L21nRWJOSXdtK2JvbXZicGdORDBoYlk5dC9uRmNxa3NJNG9wK0xPMy9XaFBu?=
 =?utf-8?B?Uk9GZ1JpNkxURWloK2xFRDJHcFRPTmU3cXl6ejhHNmVXRGxPb2dKU3pobkQ3?=
 =?utf-8?B?Y0FsLzdVNHlPWExjRUpGeDNEeStPdnQyRXZZaytHNDc1aHRBUVBaL3d2alFy?=
 =?utf-8?B?YTZSTWpaY1o4UC9NWmlNelIwM0FKWGVTbDRQbmY1UEM5cWdhdDdNYzlnR1pR?=
 =?utf-8?B?ZGNYa3RNRmJYMjRCRDd6WW5abk5OanZFL1B0bEF4eS9OOGY1eCs2cVdkQmk4?=
 =?utf-8?B?YzFndGhwY3dMN1l3OTJIZ2dhazhOZVY0cUJPZlQzWWN0UjhoYW41NmdFZkht?=
 =?utf-8?B?ZVVrWlRQSy90R2RVUHRnWnV0TTdqU0o2Mmx6VEZtV09xVjdlbEJ2Skh5Sng2?=
 =?utf-8?B?TWRPQUUxZC94SkJSMWZUTS9VZVFzdkhPZ05CdXY4TnNqZkp1SDhJUzVNTFBT?=
 =?utf-8?B?WnRteWNLOXVxVEErcUdxaHBvNUtYQTZlNmk3WkZuZWsxbnpyNWZFUnp5c25w?=
 =?utf-8?B?R0I3RDJDak0wMHRSbjVKWExOL0tmZ0dEKy9hM3c4ckFpc1dqN0JyNzNMcXZz?=
 =?utf-8?B?UVBYWXlNZ1MzL2pwSTdaMEhnaStLM25SZXhQQkFTUW9VQk5nSWxocVlGS1NR?=
 =?utf-8?B?MysvcHZoTjBRcDcrU3RmbkJnWTBMNUNYLzh5ejMxaE9ZamxDMDRtZndaVU1x?=
 =?utf-8?B?bVhLL1RwNllxS2pWc0k2S085R0ttM2RFYUd6dnU4V3AxVFd4Nkc0RnU1RHZt?=
 =?utf-8?B?dUJLRFRSRVJWOE5PQllsVnpMM1dST0JuZFhkdlZoTWpTUWtYenpSTUt1R05M?=
 =?utf-8?B?bXBJcmVkVTJ5ekEwZGsvUk9FVzliMzA5T0ZDME9tWVpDcHdkaDZlcjVVeFNN?=
 =?utf-8?B?R1c3cW11S1E5eFYrcXVFQndoQ0gzUmJkR1d3UVNnc2hjeHpzTzJnbzBnMkZN?=
 =?utf-8?B?VGZQMjBwSDZ2b2ZKWTA5alNvd2NSN1YvcXlsMkZQNENJZkVxNS9IaG9lUGxq?=
 =?utf-8?B?dmVrN1Q0WmhPWi9nenovY3J6ODkvYmRtc2hiR0lFQUhpMXArbW84VTUrM0px?=
 =?utf-8?B?QnV4SW1sUkZkcS9oeGJHdlh5WU1lVXorR3doYU5JaDF3ZXl5ancrSFZIckRm?=
 =?utf-8?B?UFpLSjdranVYMk0vWWFONEZ2a1oxU3JqeWpTT0lxNzZkSmZUVXZ6anBKRDRr?=
 =?utf-8?B?cnZOTzhodUZVVmFLc1RodjZjRDBDR3JiZmxXRTZaM24vT21zRnRPZWp6clVB?=
 =?utf-8?B?VFk3NEJCaE9JRGRnbjROeWhSUWVEMnJ5R2tRcWJJd3NNSVhmVjVOZ3pEWm9O?=
 =?utf-8?B?eVhDOGNoVXNRSUJqdDJBN05FaXJzcjllVE8zQUg4V2tQejBCMGJ5bDR5dVJN?=
 =?utf-8?B?VDJYTjVBcVdvVk5IY2VHWnJ0ZDRtamp5d2dBazBPdi9qUThMMnVIUEZpaHpJ?=
 =?utf-8?B?bmdiSXBicVFRL0oyRngyV0U3czJCbWU1bTdZVndUZk0zYTJId3VKNFh1K212?=
 =?utf-8?B?TDUxLzArMU5qM2lRdjZ1THM0OGcrWmc0QnpCRkkxWE1Kbks0SFRFMjJway9D?=
 =?utf-8?B?OWVBaHFKeWFnOVJCUnM4eUFHTGN4T1I0TC9aQmZ1RUw0UFN2SzNhZ1YyUSs0?=
 =?utf-8?B?R0tSMHJkbDVTTllUcWtVUi9IZkdsQ1p2Z3ZkUWZ2R2wrUDFuNmRRTzY4ejFn?=
 =?utf-8?B?M3IyMWtpUjVCbWhwaWprNDEvazF5d3FKS2xOZ01aendWRVFEdE0wVFdvSy9Z?=
 =?utf-8?B?VFE4dHBJKzdtQndaaG1zWGorNW5UcCtXTGxOQzdTa2g4QUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWxUTGRNMHdLeldmYzV0dTM1TjBxTm00a2hsT01IemVVUE1BZDhZUTJ5bC9Z?=
 =?utf-8?B?cXlrVlNJbVE3WXNhczZGU2FKeWl6RURNN3JJY0Z2U0JKTzFsTitFOHJFakRt?=
 =?utf-8?B?K3I1VHZXbmRCdHl5MDlCRVUrRE9ybGNEc000UkVkVi93eXBjZnUyd3JWcmF2?=
 =?utf-8?B?YkVlaEd3aHVlV3NvUE9XWkg4YVVIVW02Q0o2MHBuQzl5RmlSN0JTcUtwODZ6?=
 =?utf-8?B?TlpJNGZJS0ZleDkvaXVBUXFtOXBEUElKYVlqSHNVK25lUmxXeGYwbmRLaXNu?=
 =?utf-8?B?RCtDejN5NlV5SzZtTWZkR1NtVTFtZXV6a1plRm1iRytNVHQ4VHhWTm1oSUhR?=
 =?utf-8?B?Qk9QSW1WSnVVN25yalBIOTBkQWpIY3J6VklYdDlqRXh6TjlXRjMzUjdhVFdF?=
 =?utf-8?B?M2VraWEvejRBV1J4YmhyUkkrc01ER1Z3N3V5WHU1VWZTeHF5b0hVRHI5dFZB?=
 =?utf-8?B?N0xNUGF6a1BIdTBMUXBqTEtNM3ROTWhCMWs0cmJSazdLU0p1RkFpaWd3Q0x1?=
 =?utf-8?B?NXhOZ0VjeG1hakxnd1pVNHVRcWlNcHEvTmRTS25NVzJkbUFmT2wvaGpBZG1z?=
 =?utf-8?B?WEprTDZqN2FyUWNLSUR5Ykg0bU1PUFZsdzdoRFJUc0xLVXcwekduZ3E1akV6?=
 =?utf-8?B?RStYYWthbjRuektJVHJwQnRycFpmWGRrQW1Bb3h2R3VyWlpyVHQwU1FBOEw4?=
 =?utf-8?B?ZlZpWkMyYndBV3RvVEp3Nmk1OXVUaDJDNHdYb1VKSUNZWWNOOHFKQ1ZjUlVy?=
 =?utf-8?B?WUV5bFQrRndVUzhQd1NnV2Y0RjU5cmRPNGcvbmUxdndTZnNVN1Y1Q1FvMm8y?=
 =?utf-8?B?aGVTOXRBQnNOKzNCNDUwT253cXArNERUQ1Y0SEFEWVZyaEV1cWxwNkM2ZDBy?=
 =?utf-8?B?QTBDTWwrVSt0cDROa0hhVHRwYmlHbzJxRm5iRTJXdkZpUm4zQXIzMngxc3Nj?=
 =?utf-8?B?NmtsTDhDM0FLWHBLR0JRdVN1UllsOTVCdllDUnoyMUhacE9nTTZjdk01aS9I?=
 =?utf-8?B?U3dYZmh6YUxqeENTcC9Dd1haYlRIVEhMOHNFUWJJTVpyZCtDU0VZU3NqVkdZ?=
 =?utf-8?B?TWJ4QTBsZ3dsa2pGS1ZwK2RvdFJ0bFlrRGZIU2w4a1l1RGFQZ0t4RXEvOVk5?=
 =?utf-8?B?SjNIRUJKbm5rWFIzQkNmRXA2dzNHT05nMCsxZlNXdHFKZ05obEV3czUwWU54?=
 =?utf-8?B?K1FnN25XTkllZHVjd2xNSlVETHRacFNEOTJhTSs5alBhSFdnKzdTOHN2Sm9D?=
 =?utf-8?B?d0xGcEtjcUpDOWNBTE83QUgrd0VHZW90bkJ2QlFpRVJCNUxPS21BVGpmWmxG?=
 =?utf-8?B?MldYckt5T2hUbnJkMHRSNW43K3NGUFNhWGpmZjRQVXpuVDJ2WVRuQ0dYTHNQ?=
 =?utf-8?B?V3k3S2YydXhSbzQ5clhjRFRMbkFIYkgxTHhId1hURnZOTGQ2bXI0ZCt5N3NZ?=
 =?utf-8?B?eHMrdHdFS1pQV1J0N1RLNU41Z2EyYXlaTXV0Rk1Oeit2WTkrZ2hMY3Era1Ri?=
 =?utf-8?B?VzJVUVY4WnlZTVZuQzZxczRvVW05L0pjNnZoTnFNcjUrOGhsVzdzNDZDTlhu?=
 =?utf-8?B?OWI0U3o2RWFMOVp0Slk4S1FPUDY5SlhaWGY0bS9OTHNRN1hxaEx2alV5Vk1X?=
 =?utf-8?B?dk9PcytmZ3lhaWtPdkRXdzNYbjRwSmVmd21GdFk4alh2TkdwK21ORFhvWUZZ?=
 =?utf-8?B?MXlXeXRWRTNaeTVQdDBzamN4UCswWlNDd3JFRElPZUw5OHBaMXR6c1p3dkZt?=
 =?utf-8?B?aWRRVGh5TCtuby85V2RSMVBGUVNEdE82eCtKUGU2TE4vSjdQWUF0N1NybTJz?=
 =?utf-8?B?aWcwQiswMTZYckRZajZqRDV5S2t2eC83VTI1TVB6ZGQreVBEMU5scHdmS2VG?=
 =?utf-8?B?bGFuV2hxdUloQkN3NFB4bDRtdlBrakg4cm1JUlVwSm9jSU9QSVA2WGQyVGx0?=
 =?utf-8?B?NkxBODRTdEFIeXpFd1lONHNZRmxiODhLdVlWZHlmQ3puVG52Zi9iWUtsbENP?=
 =?utf-8?B?VHM0L21jVjRhTktwUGtIa0NzOVkvOVRyQnhnK29aUjlkT2p0YzhHbVlSVEVk?=
 =?utf-8?B?M0xCVDF1MnF0Zks1NHdKcERxaGVzcmVCb0hrdjJuV1RJbGh6Q0YycUs3eith?=
 =?utf-8?Q?1mSH7bW8qoyCDS8soVKlw9oX3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336c923d-f6ea-406e-3b7a-08dd9137a354
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 09:30:30.8345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1rcKz9civPT+jGCaXUXx2vdo3s5P4Xpjv9l06j21Ce++l7hOVFe0pbbn2wDPGVnocHbqWW46Dw/nxHuXVTJWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512
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



On 10/5/25 13:47, Xu Yilun wrote:
> On Fri, May 09, 2025 at 03:43:18PM -0300, Jason Gunthorpe wrote:
>> On Sat, May 10, 2025 at 12:28:48AM +0800, Xu Yilun wrote:
>>> On Fri, May 09, 2025 at 07:12:46PM +0800, Xu Yilun wrote:
>>>> On Fri, May 09, 2025 at 01:04:58PM +1000, Alexey Kardashevskiy wrote:
>>>>> Ping?
>>>>
>>>> Sorry for late reply from vacation.
>>>>
>>>>> Also, since there is pushback on 01/12 "dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI", what is the plan now? Thanks,
>>>>
>>>> As disscussed in the thread, this kAPI is not well considered but IIUC
>>>> the concept of "importer mapping" is still valid. We need more
>>>> investigation about all the needs - P2P, CC memory, private bus
>>>> channel, and work out a formal API.
>>>>
>>>> However in last few months I'm focusing on high level TIO flow - TSM
>>>> framework, IOMMUFD based bind/unbind, so no much progress here and is
>>>> still using this temporary kAPI. But as long as "importer mapping" is
>>>> alive, the dmabuf fd for KVM is still valid and we could enable TIO
>>>> based on that.
>>>
>>> Oh I forgot to mention I moved the dmabuf creation from VFIO to IOMMUFD
>>> recently, the IOCTL is against iommufd_device.
>>
>> I'm surprised by this.. iommufd shouldn't be doing PCI stuff, it is
>> just about managing the translation control of the device.
> 
> I have a little difficulty to understand. Is TSM bind PCI stuff? To me
> it is. Host sends PCI TDISP messages via PCI DOE to put the device in
> TDISP LOCKED state, so that device behaves differently from before. Then
> why put it in IOMMUFD?


"TSM bind" sets up the CPU side of it, it binds a VM to a piece of IOMMU on the host CPU. The device does not know about the VM, it just enables/disables encryption by a request from the CPU (those start/stop interface commands). And IOMMUFD won't be doing DOE, the platform driver (such as AMD CCP) will. Nothing to do for VFIO here.

We probably should notify VFIO about the state transition but I do not know VFIO would want to do in response.


> Or "managing the translation control" means IOMMUFD provides the TSM
> bind/unbind uAPI and call into VFIO driver for real TSM bind
> implementation?
> 
>>
>>> According to Jason's
>>> opinion [1], TSM bind/unbind should be called against iommufd_device,
>>> then I need to do the same for dmabuf.  This is because Intel TDX
>>> Connect enforces a specific operation sequence between TSM unbind & MMIO
>>> unmap:
>>>
>>>    1. STOP TDI via TDISP message STOP_INTERFACE
>>>    2. Private MMIO unmap from Secure EPT
>>>    3. Trusted Device Context Table cleanup for the TDI
>>>    4. TDI ownership reclaim and metadata free
>>
>> So your issue is you need to shoot down the dmabuf during vPCI device
>> destruction?
> 
> I assume "vPCI device" refers to assigned device in both shared mode &
> prvate mode. So no, I need to shoot down the dmabuf during TSM unbind,
> a.k.a. when assigned device is converting from private to shared.
> Then recover the dmabuf after TSM unbind. The device could still work
> in VM in shared mode.
> 
>>
>> VFIO also needs to shoot down the MMIO during things like FLR
>>
>> I don't think moving to iommufd really fixes it, it sounds like you
>> need more coordination between the two parts??
> 
> Yes, when moving to iommufd, VFIO needs extra kAPIs to inform IOMMUFD
> about the shooting down. But FLR or MSE toggle also breaks TSM bind
> state. As long as we put TSM bind in IOMMUFD, anyway the coordination
> is needed.
> 
> What I really want is, one SW component to manage MMIO dmabuf, secure
> iommu & TSM bind/unbind. So easier coordinate these 3 operations cause
> these ops are interconnected according to secure firmware's requirement.


This SW component is QEMU. It knows about FLRs and other config space things, it can destroy all these IOMMUFD objects and talk to VFIO too, I've tried, so far it is looking easier to manage. Thanks,


> Otherwise e.g. for TDX, when device is TSM bound (IOMMUFD controls
> bind) and VFIO wants FLR, VFIO revokes dmabuf first then explode.
> 
> Safe way is one SW component manages all these "pre-FLR" stuffs, let's say
> IOMMUFD, it firstly do TSM unbind, let the platform TSM driver decides
> the correct operation sequence (TDISP, dmabuf for private MMIO mapping,
> secure dma). After TSM unbind, it's a shared device and IOMMUFD have no
> worry to revoke dmabuf as needed.
> 
> Maybe I could send a patchset to illustrate...
> 
> Thanks,
> Yilun
> 
>>
>> Jason

-- 
Alexey

