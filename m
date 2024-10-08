Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9325994158
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6F010E49F;
	Tue,  8 Oct 2024 08:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rKzM5/Sc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66B610E49F;
 Tue,  8 Oct 2024 08:24:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKPDsn0QpFz/JHwmJm6Xvg+E/tDungqZiQirMSVvltwak5RDOSfNFmjdcgdnJwBVpa/YP3QAVRThAS7JL4hzrtr/ttJvlEfBLGeavGiN/CSMeafF01XK2kPM/rxZZjr0aLIzB28bdj0TKtH51Vfatiet9CKoUccFBQnj8ylCtT8exNdc2hYNCjXAyEgWC/LOXvIpgpyPxXXopVAz4ZW0O30Jjh6J3fZPNplyJb4IJK7krQmnr1cquFns0yO0dPr7GzaZa2L7F4LNjetumNtW0+g629lONhGfcn6h1QZn/B+KJCBZyDMPZ1ADZIrvdb10I0UoPHvtwC+4hBFR+1NWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiyL/43dAARZCOLyFd1QerbzAJNfgJX1XOt/IbAQZ00=;
 b=V+BqFkJW/jyPJN2IcHXQrrK8pl80ga9zNxnZJ4N+GBmQYF0KknCEo8XrOM5I2GnbBMrG/IQIdUlUVSOT/nKj0D8NzV+mKTkIIqRTbtAur1iTN7jb/mNhfbFczCYEUcVl+4coaP/ZgdxSXPL3bq8Lzx4UGsBCskIUbuCHUOyQscyVm/Wd7W6fccv4Q+s2Cb+S0qBxSaDlhoyrK93xS+oIKxD4o889E2UQVCx5ThwnwLEfpa+yf5s1IEHsYJwaydwjECHEL3fgqQnTQn4k9mdxe6ocO1JW2Ofb51FV+swUONqFBoC8wMnlJVb64vztRTQQIIChgKMWTqELDKXtRhM49A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiyL/43dAARZCOLyFd1QerbzAJNfgJX1XOt/IbAQZ00=;
 b=rKzM5/ScatdUqOO6nS4APrh5AHTgo7wueMvcOs94LXAEFXR0jJtrKJtzjMbccTBPr1kZ+H8INP3QH94s/ZjRcxgTnl6KvZ2TL4he4EUFkBiZZdn9TdhuyCSyCOFCB+FshhRGQTW3djWDPPUSwYTTYbZCF+YuUqc89p4OxQi577s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 08:24:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 08:24:55 +0000
Message-ID: <54f65e13-79db-4800-9d96-8943e9397822@amd.com>
Date: Tue, 8 Oct 2024 10:24:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com, jani.nikula@linux.intel.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
 <20241003124506.470931-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241003124506.470931-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 213df108-fc10-4069-4719-08dce772b047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGlwWVdkbjF3Z0xRbmwwditneVdmK0lUcExuVHNUcmZGU01iYzM5STdENGh4?=
 =?utf-8?B?dUJhKzdVamE3ZGFaeG1wSHBnZHdlYUtkV29zSC90S0tBbzJqOW9JNC9HSGE2?=
 =?utf-8?B?MnNwVUdjSGd3cXgwa2lEMlZHK1RyRExvV0kvMlI4RTg3ckRNVGZDMXQ5Y0Z2?=
 =?utf-8?B?RjgxSWYzdXhFT0lTRGs3STJhSDlFR2VGMGRHVFk0R2tqZ3NoL0xNdVQyYTZG?=
 =?utf-8?B?S0c3OStVVnp3eFZPSFpnTEpFNmRVYWRoYlFERUlyQ0dva2dXUjh0M1g2bzFQ?=
 =?utf-8?B?ZVQyZGlDWUJZeUtKdmtoNHRpSC9zNUlTRXdKUXQ0OEY3U2xweWlZTnc2SEV6?=
 =?utf-8?B?ZmsrcHlPQmRsWVBTSXpuL291U3YzVFJzSUV6LzhLcm1hTVFjV095RzRndFlv?=
 =?utf-8?B?NU8wMmk1cXh1UGRKelhGdjErUUVBSGJGdzdCVytLdXVDUU5NMFdwMjBUUGhU?=
 =?utf-8?B?ZDRMUVNHK1YwOVlUdmVkM1JINkFHdUhjV2lkb3IxbTU0ZVRrV0tTQlBQMXZG?=
 =?utf-8?B?cHg4a3VUZURjUmVFcCtxOVJOWGFtcUhqM2tuMVI0QzRBRDQwMnZXTjk3UEpl?=
 =?utf-8?B?cUU0KzQ2R0pXWmZGdjF3S1YzUUdqeGwvb3VIY0NWbnZCamZTRU1mSWhHaEpm?=
 =?utf-8?B?L3pLNXo2emtEdkx1RmhTdE03Y2RGODNuR3U1UEpzTGZtS3BxdTNhaDNsMW9x?=
 =?utf-8?B?MHRnUkZ5OG91SEpTUUhpWURJdldudkZneENGNmZVUHhRT0QzN1FXbFZ3Y0lY?=
 =?utf-8?B?MFQraHY2RzE0MTZzNjNNeGZtVDQ3aUNwdkYwOUJieFJDTWRRaW4wVHBaL1or?=
 =?utf-8?B?NzZ5My9wdDkvb3ZQMTdXa1FZUzBUWG9QdW9SZmxTTVNYbEc4bHJhWENiL2Rz?=
 =?utf-8?B?ZUtOSXJnSDRXYXFyUlUrbEtBdW9YOVRJSk8xdW1jQytYUVBQeFRUZ1V0RENn?=
 =?utf-8?B?VjhjekxWTjdmbTVBTFc4c041ZDRiSHJLbGFGZE4xNlpMQm9lSU04UjZheXNG?=
 =?utf-8?B?b2hKSkcwcXZ0bGp5UFVadW55WVd0UXQzbks1T1pwbFh1Wkh1QkVNdmRtQVZm?=
 =?utf-8?B?MnloV20vK09nNzR3QkVrVVB2QjhIVXRjZWdOaUJ3TnlBMkxTb0tSOWR0cEpM?=
 =?utf-8?B?WGlTbGRiMkViZUhIcnBtSk1rTGpMYnd3cmRDYzFaRldEY2Y4Y1U5NTZCOWxL?=
 =?utf-8?B?WXkyZTFiV0tuMWxtN0ZTMHRqa2xJbzNyMTlQekZybjdxenptWVZaczJIMDZW?=
 =?utf-8?B?cTlJN3VEZVZEbmdaKzQ1NkYwSzhzNFlyNm1RUWdValZEL2E1ZEpwcWx2WHNL?=
 =?utf-8?B?SXBxMEp6VFdzMVByWHdEdmRveWNTa3hnWGlyWnluQWs1bVNBazRXd3kzMm5y?=
 =?utf-8?B?ZG5iZXVlUDFJcDFjZTJJaDVEeCtocE9sbmg3Um5HMm9Rekc1OE9FOFY5ZTJ5?=
 =?utf-8?B?RzgrYXFtVGxjL2JBc211NWxub2l6aXFvRDhaWGg0OEtVREY2Y1g4cm5KTEln?=
 =?utf-8?B?YnlTdWQyQnpvdHJzNHIwVkN5d0x2NFJCVXNXK05hSll3Z2x0VTl6NmRVVE1n?=
 =?utf-8?B?eThrWkRsU0tORzRkaUdld2EwRTd3b1MvKzU5WlJqYXl6LzZ2dDdQTnBkbXcw?=
 =?utf-8?B?T25GcGdoTkpEeTVPemMzNDlJRzJDRWVBbGx4eGM0M3dGR1hCbEtQOTdWUUds?=
 =?utf-8?B?TnlFK1ZkVFNxemZHNy9WM0k0SlVKTFVhaC9aN2lxYTduQ29pOStoUVZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amFFU0pEWW1UVGxtWUZaSFdoQWdGLzhCYUxJeEZ5UFZITTU0a1Q1M3RwcWNB?=
 =?utf-8?B?cWNoZWFDc2Ewa2Z2QWV4Y0xzb3hUZFNEMXA2d3FkWFNnRGNsVXdIYWV5M1Uz?=
 =?utf-8?B?LzhoQWZmcnpJZURtNVJleUhTNkdjQlpqSThoYXdMK2NUNVBidUxvTUNxcTRB?=
 =?utf-8?B?eUUvb0dPTmtmOExQaXpMUlQybjdBRHlHbXhyZnFQKzhEMVNhTjB0WStOZVhQ?=
 =?utf-8?B?WTNlejhYaUt6UjNSQ0Z2dGJ4QnFuWFhxWWlIbkVLVEUwOGlyZTR0dXZUODhN?=
 =?utf-8?B?cXVqOGVmWWRCYjJJUmtyRjJqejJlNnJORWR3Z0kzOU5jNVlxa3lOM0hvY1d6?=
 =?utf-8?B?R2ppbk92bHRRTE5DVlhyTXlhYmpEZEZYejNrVUhWeS83b3Q3Nk50aytqNFU4?=
 =?utf-8?B?di91STdKZlJiWEY0K1h0THk4eDJRSUNwdzgxRWF5akNhOTV6eUZteUNjaVFu?=
 =?utf-8?B?amxjR2JQWEdDOGt0MVo3M3hwd0lwRHhqdHVnZjVUY2tjSkFua0RSRGhpODN6?=
 =?utf-8?B?ZUpWMEgvK1Z6TEdldFY2TmErQjQvZTA2TVB6d1diSGxhcFhOa0orWWVUVlJU?=
 =?utf-8?B?SXR4RGttYmdtVDB1OUdhRDRCb3BmdjgyRUcxRkMwMmx3NE9TcFRHbnhyM2lK?=
 =?utf-8?B?SGhqT05PZlorcnAzaGxBWUpBbGdMS2paaHlsWEtDMzFxZmQrOTM0Ly9tMUtx?=
 =?utf-8?B?L01OQ2hOYXppMEY2Q1ZSNE5oVGJZNXFMMGx6bmFjNHN3ZGlLUUlaVVlsY2tK?=
 =?utf-8?B?RWc2Y2ZtUi94MlBVeVJTdmZqZDJDUVRwZ2xiM1RDWFN6bTVpdmRQcXJaOWlC?=
 =?utf-8?B?dzBWb0pGVTlQTUE0Z1hyQkpoSDRGTGFxZExHcVp0RlplTE55dlkxT25xak5m?=
 =?utf-8?B?bVVtSVRoeHc3dXRaUGROV2cwZ3BJSVJOTVVyeTlyOHFOSTltcldzZzcvQkQ0?=
 =?utf-8?B?N1VhYUpqUjhNM1hUUWpqVm4zalBkaTEvTDR6cDZsZnJUQ3AxeVV6dndIeWFW?=
 =?utf-8?B?UDVxZ1czM25uNzZQTlpGcGMrdC9kTldHTXdvSmhwZUtzekEyZFZ0d0hKNEMy?=
 =?utf-8?B?R1hxS1EwRXhmZkF0cmhGN2RFNzR0Q2lWYWRFSWdnTkdlMFFsZHcrbUNQU1Br?=
 =?utf-8?B?S0J1T2xFRXRpcVBwSTlDQ2Y4VG9XT2ZDSVNEUTJmYjFvZGZrOVVHMlpnTkFh?=
 =?utf-8?B?RjFwL3NRVFQyTVR6YWZzRWlLUjFMc01MYkdwMjZnOWQrVG5wYklBZVFzSkV1?=
 =?utf-8?B?TWJxbEZxRlNJK2ZlQjdIekFvWjNRZjFYRUFibWNuTDBjMFUwR1NOZ1lacDZp?=
 =?utf-8?B?NzcrbW5tb1hRZG5RVWFXS2FHUVA1SmVCMlZwcENONlJIem4ydE9YNkptd0Ev?=
 =?utf-8?B?OGlpbHBNdTh6ZnR0aWd2VHV1S00yWXFxaFVNN0tHQkpjQkdVOVFtYnJlR0RM?=
 =?utf-8?B?elJzb2ZBbk94Z3k1S0Y1Z04rK1hJd3ZadEQ2cmR1Vk1yVXZTbnZidHhuWUx1?=
 =?utf-8?B?aFJVZXpmc2xlSnVUQnNyT1FOY2xDcHJNUGVzN1krR2JhNnJ6U0svbEhjbnFF?=
 =?utf-8?B?NlNtcW04MmNFUHVZYWVBeVY0NVJYN0FJLzVaalF3a3h3WWVJeU5HYjhVY3lO?=
 =?utf-8?B?NStvYkNHamlzODZUTWlZUXRiOWJQekNEWmU2S2g2d0VCSzExb21uUmV3UTRh?=
 =?utf-8?B?d0V4cCsrVkpJS0Z0V2orbmJSZFYySTFvVGMvZzRCTWg2MUhTWGRkVVlhbi92?=
 =?utf-8?B?Vk9DeDB5VDdWOExOUnBYQndScDdIRTZkLys4VmJ4dENLQTFKWlZyWksvWlNN?=
 =?utf-8?B?U0F0TDlEcFM1dGtDdFBmVGx5OXN2aDlTdzQrYXBySitkSkx6RXBqT0xqWEgx?=
 =?utf-8?B?TXNHa2Vxa2FnZUI1eHRsT1liTTBHVjZnc0tYN0YySFZ5SjB3ZVR5MVM4Qldu?=
 =?utf-8?B?Q1FvNTFnN2Vzdmk0c20zMGVpd0o0R3VSM3kvZUxabVNzcktWZEo4THNodlpH?=
 =?utf-8?B?cFNMeGlFZWdtQ0JvWjdncjZ0MGJCcDZOM1dnRHBTaWw1ZTFUZVY0cWYyQUFL?=
 =?utf-8?B?QVNZdSsrYjBZNjIrMHlrc3owSU1Ra3d4dmptOEc4TWwyMk1zeWJCNGZTWVlP?=
 =?utf-8?Q?GoB8Qn4VQmgh+nbN1Y67Oh3cY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213df108-fc10-4069-4719-08dce772b047
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 08:24:55.0808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7cSgz6yuDkA1oJWFu1HrsYlWqzdbsjuwIROea02GMI4g2WaDfdaYStVK3r/dJ85
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
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

Am 03.10.24 um 14:43 schrieb Pierre-Eric Pelloux-Prayer:
> If a drm_file name is set append it to the process name.
>
> This information is useful with the virtio/native-context driver: this
> allows the guest applications identifier to visible in amdgpu's output.
>
> The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
>     pid:12255	Process:glxgears/test-set-fd-name ----------
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 34 ++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 ++
>   6 files changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index f9d119448442..ad909173e419 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -299,6 +299,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
>   				     struct amdgpu_vm *avm, u32 pasid);
>   int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   					struct amdgpu_vm *avm,
> +					struct drm_file *filp,
>   					void **process_info,
>   					struct dma_fence **ef);
>   void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 6d5fd371d5ce..172882af6705 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1558,6 +1558,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
>   
>   int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   					   struct amdgpu_vm *avm,
> +					   struct drm_file *filp,
>   					   void **process_info,
>   					   struct dma_fence **ef)
>   {
> @@ -1577,7 +1578,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   	if (ret)
>   		return ret;
>   
> -	amdgpu_vm_set_task_info(avm);
> +	amdgpu_vm_set_task_info(avm, filp);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 891128ecee6d..5d43e24906d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1178,7 +1178,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   	}
>   
>   	/* Use this opportunity to fill in task info for the vm */
> -	amdgpu_vm_set_task_info(vm);
> +	amdgpu_vm_set_task_info(vm, p->filp);
>   
>   	if (adev->debug_vm) {
>   		/* Invalidate all BOs to test for userspace bugs */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 561ff832930e..920660c23e0f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2355,24 +2355,41 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
>   			amdgpu_vm_get_vm_from_pasid(adev, pasid));
>   }
>   
> -static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
> +static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm, struct drm_file *filp)

It would be nice to pass in only the const char *client_name here and 
lock/unlock the mutex outside of the VM code.

Only nice to have, but I would rather like to keep the drm_file 
internals outside of the VM code.

Regards,
Christian.

>   {
>   	char process_name[TASK_COMM_LEN];
> -	size_t pname_len;
> +	size_t pname_len, pdesc_len;
>   
>   	get_task_comm(process_name, current->group_leader);
> -	pname_len = strlen(process_name);
> +	pdesc_len = pname_len = strlen(process_name);
> +
> +	mutex_lock(&filp->client_name_lock);
> +	if (filp->client_name)
> +		pdesc_len += strlen(filp->client_name) + 1;
> +
> +	/* Add 1 for the NUL char. */
> +	pdesc_len += 1;
>   
>   	vm->task_info = kzalloc(
> -		struct_size(vm->task_info, process_desc, pname_len + 1),
> +		struct_size(vm->task_info, process_desc, pdesc_len),
>   		GFP_KERNEL);
>   
> -	if (!vm->task_info)
> +	if (!vm->task_info) {
> +		mutex_unlock(&filp->client_name_lock);
>   		return -ENOMEM;
> +	}
>   
>   	/* Set process attributes now. */
>   	vm->task_info->tgid = current->group_leader->pid;
> -	strscpy(vm->task_info->process_desc, process_name, pname_len + 1);
> +	strscpy(vm->task_info->process_desc, process_name, pdesc_len);
> +
> +	if (filp->client_name) {
> +		/* Append the drm-client-name. */
> +		vm->task_info->process_desc[pname_len] = '/';
> +		strscpy(&vm->task_info->process_desc[pname_len + 1],
> +			filp->client_name, pdesc_len - (pname_len + 1));
> +	}
> +	mutex_unlock(&filp->client_name_lock);
>   
>   	kref_init(&vm->task_info->refcount);
>   	return 0;
> @@ -2382,11 +2399,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>    * amdgpu_vm_set_task_info - Sets VMs task info.
>    *
>    * @vm: vm for which to set the info
> + * @filp: drm_file instance
>    */
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
>   {
>   	if (!vm->task_info) {
> -		if (amdgpu_vm_create_task_info(vm))
> +		if (amdgpu_vm_create_task_info(vm, filp))
>   			return;
>   	} else if (vm->task_info->pid == current->pid) {
>   		return;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 44da250217be..8df3dece54c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
>   			    bool write_fault);
>   
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp);
>   
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index a902950cc060..e473fe433d3f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1654,6 +1654,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
>   			       struct file *drm_file)
>   {
>   	struct amdgpu_fpriv *drv_priv;
> +	struct drm_file *filp;
>   	struct amdgpu_vm *avm;
>   	struct kfd_process *p;
>   	struct dma_fence *ef;
> @@ -1673,8 +1674,10 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
>   
>   	p = pdd->process;
>   	dev = pdd->dev;
> +	filp = drm_file->private_data;
>   
>   	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(dev->adev, avm,
> +						     filp,
>   						     &p->kgd_process_info,
>   						     &ef);
>   	if (ret) {

