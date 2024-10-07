Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7699356D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5312710E3F3;
	Mon,  7 Oct 2024 17:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S0BKbzRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2810210E3F2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 17:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvWT4XjuochEqXqNUGgLto3DochNvkmBcTR2vEusVDFiXxIXJ0/4UsJf5RH7Nw6d/DeVtjRmRSnrexCidZ7rsdzWW4GVnrLuVFlMt+acL6HE/AUv9SE1plWE1GXXaC4qPKg6KPZIR4dgNtL9hUmjvSr6WjsD8w1ImAiY39qluPRhAC67Po27msoM6XFkH28siLSyDoImqIoMzODTZLfU5s39mGnzAoOCr+ovQUw2L/oq6Yo3my8kXV/GhNQftM9H/APe64bnim3y9JXvb/OE51SDbZNIGFVckUC9YM8gp6PuwbIIcYLqVExgz9snPqz1UeHj9QUcWBl83YqAQWwCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3To6UXaa2ZyuJKaPbC/aLUcWByAzFGMqwd1lQ4ZlPr8=;
 b=YcDoVlqXVpBF3v0uSOlayOmNUPQ4whLeMW2BL7QlNwKpJ4iSs9FgLI0o8+MjaZkSWa5MpeFH5Nbx8EsrvnIt49avW2wCWWEyXfWJZHS6t2sHMn5PaHxBTQBUp8xEGm1/yDWqyJEObslrXjKnvYMkR4ja8lPBMK8fMS5bLV5K+6/5Olna8dLwKTQtST1cSzpMMMOgmbItBJRrN5JKDOtOzIdR3ZDIf3/Kco830su7+iI/NhxZKozvh9jZW4W215ONuYEDPxonJUBU5ZppVeEl/jv1XkHXXaqHvkHaDg7ULBU4UHTkwGMQm21oUl2wLTmVlrog//hapEv1UEgQXw6czg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3To6UXaa2ZyuJKaPbC/aLUcWByAzFGMqwd1lQ4ZlPr8=;
 b=S0BKbzRIXC+pWj2PG5rMusBAV7Mgs/7exvo/oHLbri2fNXFkzOQplYSHNPeqfhqULQdAmCm2kVyb0qqavxPlJgiPHrBRReaWfYApn88OYyZSU8ZtdaROJ7gVeliGkZXjTlMz2fDgnnjkiaDdXRIBgbO1xcwWEzgeFo5sktj5xjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 17:53:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 17:53:33 +0000
Message-ID: <8badb067-3cb3-431f-8081-be1bc0b9729b@amd.com>
Date: Mon, 7 Oct 2024 19:53:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Patch "drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job" has been added to the 6.10-stable tree
To: gregkh@linuxfoundation.org, airlied@gmail.com, alexander.deucher@amd.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com,
 matthew.brost@intel.com, pstanner@redhat.com, tvrtko.ursulin@igalia.com
Cc: stable-commits@vger.kernel.org
References: <2024100752-shaking-sycamore-3cc4@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2024100752-shaking-sycamore-3cc4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: e9008717-1505-44e9-8e99-08dce6f8f5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xNYkNGWENBR2xOUG53QllZVkQyeTRmbjA4dTFGSTIwRUpDd2NZbWNVeVg2?=
 =?utf-8?B?WXhLZEIwakgvTjRaNm1qYkVUK3lqcGg5dHNZQTlHS0RTNWdhcEZjVElUcTVJ?=
 =?utf-8?B?TmZVSjYzNGo1b0FxeUlha1pRU2lvTVV1enZmYWN3VEw0dWZpOHA0eEtOUUV0?=
 =?utf-8?B?ZnpuQXFQWDNjUjBCdmQxc3FiV2crUi9LZEpXa0dQUGt3eVY1cnc4VlBLS0dv?=
 =?utf-8?B?Uzd4cm5SZmVyT3NyaW9DVFkxWWx5WGdFSXpyaUljNGtGY2JncHBqU1ZzMGk1?=
 =?utf-8?B?U0JyKzQ3VkNHaFg0NUZidVZnUzE4ZjlNOHpaUzBKNVVQc1k0SStIS2xXcUxJ?=
 =?utf-8?B?OS8wMXg5SlhnNDY4NzV5OExVZURpZENQQUl0THUyZkxIZFdJa0pCUjhCdU8r?=
 =?utf-8?B?SEp3VEFxeGJOUHJ2V3pSWlNOMmRKV2NoZXZ2N0xmSTBlZTMrejdRZjlaVEwx?=
 =?utf-8?B?NmxhYWNLYUs1NDNrRkxKaFRWUE1UUklZRFpqeG1RN1c1ek1BanBCNjNQdnNH?=
 =?utf-8?B?bmRNd0hKd0Q3eEJRejFYNGI5STFRZW0xN01iQ21EbXpCWWR3TFdFUit1NVRL?=
 =?utf-8?B?eE0xUmdSMFdlQ3NnSVhXMEpPQUdRYUdCVDZqWTF6WERwZzFFMy8xZFJaRW12?=
 =?utf-8?B?ejN5VXVRR1phTCtiQW16YWRjWEMvcXRqdUlvYlVjY0xjbk1jYTNPSFpFaVZs?=
 =?utf-8?B?NzRNWGkzUmVhc05odlp1eE5ZbXlsKzBPYjRGU2JNYjZ5eDRTWXdrUEV0ZGhN?=
 =?utf-8?B?bGE0bzBWMFhFL3BiVldvS2FKeEQvKzlIMkF2dDl3SU1FUFdadjJHMDltbTVJ?=
 =?utf-8?B?SlY3V3F2dzR1c0Y5dHBaU1V5ZGNQdHptSUNIam1QWUtjdFlOc0VxV3FnaC9J?=
 =?utf-8?B?SVFRK1BWVkRycEdvNHpTbXZmMzgraVV3ME1NL1ZXeUZLbXJ4ZHoxbjgrc1dD?=
 =?utf-8?B?bk1VNmdqNmxsaU51V3NPNWNqbTJTa2MvNlFPY3M5LzY5ZWtCbFptM3RXYTlP?=
 =?utf-8?B?UXFSWjVxdzVpS1dCSTFWbGNLQVpXcW1xUFhYQUxuUW9JdU9Cam1DS2lYcXBB?=
 =?utf-8?B?dnFKeCtvUlZualFVcVp0VG40MzRialp0ak9rM0xQNy9RVzZHOGFPUlNBa2hJ?=
 =?utf-8?B?SWxKS29kdjd0Q2hPMUY0NmdiUWNGY1QrVkVWa0p6aHZRY3RHakZzejZ6c205?=
 =?utf-8?B?Mjl5aUQ5ZEZGVVd1YVZiUGlSQXhMZjZlbXdpMzJhaElnaWI4ZHR3STZZZ1c5?=
 =?utf-8?B?elBaL0hSZ1daeG0weUpLa3hreXZObVlZOE1tSlVVTlNEcnp0SGlqcnduMDZZ?=
 =?utf-8?B?cEoyaVorRTRpMzR0TGFUMmE2c01mdTd0bWFoVndvTHY1WlJSaWtJNFozbERo?=
 =?utf-8?B?U2EvYWlLdHFJRS85QlU0Y1NmQ1JrTldnbk9Edk9qbUNhbG1uNkt4TVU4bjlX?=
 =?utf-8?B?eFFPbklBVmFDd0tBdlMxS1o1YnZyelY3Vmd5THNRMUovYVhqNUdHaXQ5ZU5R?=
 =?utf-8?B?SUs1ZXJrcTdkVjFUdDNOcXFLb3BJcitsTS9IWXI2QW1aa0tBZlIzczMycVZW?=
 =?utf-8?B?ZFJuQ0N2c1FpcmsvZ3Bla1l0L3o2b0dmbWNtU0kzNHgvakYvSENKbmhkMlpX?=
 =?utf-8?Q?JbCpyWVqw4oN085NicvY9pT57Z3tVxkpKox948xHJ5WU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OStURGRQYXNsdG1sdHp2UEVMV1c3MU1HeEltd2hFMk9MYUl3U3M3NGtJaFdk?=
 =?utf-8?B?aGRHUUVrRUM2L3ZORlNjUGpSWElVWmo2YWNxZWhzeUtOQXJkcnUxVDFJb2pa?=
 =?utf-8?B?d3Vrcm0rUFZQQnE4UFRaeUtzNzZkY1Zrd1VXOVNicWY5bHJDL3hja2F4TWdV?=
 =?utf-8?B?djVTOWVNTnQyczVldDRMVDFoMTI5V2tOTjFTMHlzZllab1NNcklQL2d4czRT?=
 =?utf-8?B?c05DcTNxemZSNTgzd3QvWkxwU2pqUkRLdk4vaURubVorSXFOUXdtTE1OYWxN?=
 =?utf-8?B?SElYcEZJNkRpTHVLcFB5dVZwd3RRdm9rRzE1T2Ftbko4V1lDMVVUa1lwUHAx?=
 =?utf-8?B?WW1oNVhyVjVQUWZodjRhQW0ydkF4cUdqd3htYmx6WW05ekpwZkp3Wks2S3ZS?=
 =?utf-8?B?MW01RlkwL0o5b1czK0gxSHRXWjBtcncwL3ZRSTRONWZndWo0aGZkcjhIdVpn?=
 =?utf-8?B?V2RkTUtkTDBRK21DeDRlMGxJVnN5U1l1TmhRVC9HWE55dkx6SzkyNlpFMlEy?=
 =?utf-8?B?YU10WC9lSkpoMEx1aExjdHFKcnFSTnhJSWp4aGh0ekVCalM2UUx4S2lPYkFL?=
 =?utf-8?B?aS9yR0hxaFBDSjloTlVrRGZoL0FETnVDbHdwNm9Sell2cEtwVWEwYzhmQnNl?=
 =?utf-8?B?M0RiYTRoLzNzUi9SZEI2QlZZRzhQKzlmdC82eW5VUWd5aUVObFZwTFZncVNI?=
 =?utf-8?B?OVlueVVzeHhqV0Q2WFlTbS9zQ1lvN1p2UVdnK1U2Z0l6SjZMUFh1NFlocStO?=
 =?utf-8?B?NVUzaDA1THV6eFZPeDFBS28xWC9xRDBiMUljWmIwNDdRcWdXOEpsSXpYL3Nk?=
 =?utf-8?B?UEUvRGZOTW1wd3ljNkZML1VpNDc4MkprRUZ0dE1BaGd4VC9JWkdYNU5BSzk3?=
 =?utf-8?B?V0IzMTlrVHMxSzA5ME0vNXNiT1ZRa0RtWnB4RXFmYUo0alN2OVpLVjl3a0Y5?=
 =?utf-8?B?QWhBTU9SZ29aYzkzbXhaWFVCVlBYaUNrQTk1OEtSZ1NxOXZQMjlHR3l1eDkv?=
 =?utf-8?B?a3liVDJyY2F1WlFvaEd6RGY0S2RnOENmTnFsVkpmd1dvQ0pyWGp0eW1vYm56?=
 =?utf-8?B?cGlDVXdLcDhtdTE5WTRNZTlYWkRoanFEOUxUc2JaQmc4N3hwUnlCb28wZ0d5?=
 =?utf-8?B?TURtUjcvQllxQ1lrb2c1aFpNVFV4THlCRGNvY05kOTdBM2RlQkdOUEYvbzEv?=
 =?utf-8?B?bTN4M1JpUDhkMkc0dnNQZHBDU3BZM29hV1Q5ODRpMzkzeEVXb0E1SzM5MHhw?=
 =?utf-8?B?enVvcmQweGZXMGExekMzQXNXMnR3enBGTTdqN0Z1YUxDRGZvM1NoNVFlU3RG?=
 =?utf-8?B?WE00VUJMRzUwdkhTZ3RvSEcrV0FIUHIzZHJaeVMrK2JKMnJSWUlCMlNHZ1hj?=
 =?utf-8?B?Y2cyUStHcnRmVG5TekZjWUs1eFFVeXFRZjZZY2xOQzVsQnoyWS9WS254ZVJB?=
 =?utf-8?B?b3MvNmd6QzFIM0c0Y1FVZ2NTQ0QzWkN0RXJGVmNlS3VtaGtJRHVTeFdCMG9t?=
 =?utf-8?B?ZFhJUUpXZ1hWRnFOajlJeXlkc2FPVzcvWjVxUDNwVzlWY2xwQUZ4cmljRXl3?=
 =?utf-8?B?WTczM3p5ZW5rblJEdDJ4NjhXdnpZVDU1YkhrQkRJZFFUcStkeWhqODRTeFdS?=
 =?utf-8?B?aktEZ0RlenpHRFNiS3VwWER5WUU2NkY5akZBcEh1OGFjbGt4SkRraG5hK1FJ?=
 =?utf-8?B?V1hBMWY4bm1BRlhNR2EwQWlUMjZnZXNmRDNwMmpYSXB2VnZGeHRGVDlnYXpI?=
 =?utf-8?B?cUtaRzhkT2JrTHpMeVJIR3ZkUlhiclA1c25XZk5rQ0FQeXZZMDBtUWtlYnp1?=
 =?utf-8?B?ajhBQmNwSlorME9BWUk2VHBUSm5Hc0ZZbFVpTEhhT0ZkQXdCME5Va0lhbHJY?=
 =?utf-8?B?S2UvRGRpYzlZWjlWTWl1WkxFTVVKeEw4WVV5RXdVc1V6dlBST1JodHZCUldl?=
 =?utf-8?B?V3RHSE9McHRLZHFLeEkrVitFcmQ4Ri9HVFZIMHE4bUU3UUMwL3VSc2U1cXFy?=
 =?utf-8?B?OFBBUEdqV1F4eUdjclFMODk4VU1VWkhpd2pQcjAyRHJETXlmMUpQeG1MSVh3?=
 =?utf-8?B?b0JaNmgzSXhjWnNFSHNIdFRqZmRPMGdqT1JlQ29LWkx4SGVVajErSmphL05w?=
 =?utf-8?Q?KJ9kQAFCYmMbkZEQBqgKSsJQW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9008717-1505-44e9-8e99-08dce6f8f5a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 17:53:33.1514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F83UOp2qTOeN3bAgLjnjywxlFlVmxs/B2T4w1tZBUikkPCtUsE4dFqQLhQRUTR3M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903
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

Hi Greg,

please drop this patch from all backports. It turned out to be broken 
and the old handling has been restored by a revert.

Sorry for the noise. The revert should show up in Linus tree by the end 
of the week.

Regards,
Christian.

Am 07.10.24 um 19:50 schrieb gregkh@linuxfoundation.org:
> This is a note to let you know that I've just added the patch titled
>
>      drm/sched: Always wake up correct scheduler in drm_sched_entity_push_job
>
> to the 6.10-stable tree which can be found at:
>      http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
>
> The filename of the patch is:
>       drm-sched-always-wake-up-correct-scheduler-in-drm_sched_entity_push_job.patch
> and it can be found in the queue-6.10 subdirectory.
>
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
>
>
>  From cbc8764e29c2318229261a679b2aafd0f9072885 Mon Sep 17 00:00:00 2001
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Date: Tue, 24 Sep 2024 11:19:08 +0100
> Subject: drm/sched: Always wake up correct scheduler in drm_sched_entity_push_job
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> commit cbc8764e29c2318229261a679b2aafd0f9072885 upstream.
>
> Since drm_sched_entity_modify_sched() can modify the entities run queue,
> lets make sure to only dereference the pointer once so both adding and
> waking up are guaranteed to be consistent.
>
> Alternative of moving the spin_unlock to after the wake up would for now
> be more problematic since the same lock is taken inside
> drm_sched_rq_update_fifo().
>
> v2:
>   * Improve commit message. (Philipp)
>   * Cache the scheduler pointer directly. (Christian)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify sched list")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.7+
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20240924101914.2713-3-tursulin@igalia.com
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |   10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -599,6 +599,9 @@ void drm_sched_entity_push_job(struct dr
>   
>   	/* first job wakes up scheduler */
>   	if (first) {
> +		struct drm_gpu_scheduler *sched;
> +		struct drm_sched_rq *rq;
> +
>   		/* Add the entity to the run queue */
>   		spin_lock(&entity->rq_lock);
>   		if (entity->stopped) {
> @@ -608,13 +611,16 @@ void drm_sched_entity_push_job(struct dr
>   			return;
>   		}
>   
> -		drm_sched_rq_add_entity(entity->rq, entity);
> +		rq = entity->rq;
> +		sched = rq->sched;
> +
> +		drm_sched_rq_add_entity(rq, entity);
>   		spin_unlock(&entity->rq_lock);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>   			drm_sched_rq_update_fifo(entity, submit_ts);
>   
> -		drm_sched_wakeup(entity->rq->sched);
> +		drm_sched_wakeup(sched);
>   	}
>   }
>   EXPORT_SYMBOL(drm_sched_entity_push_job);
>
>
> Patches currently in stable-queue which might be from tvrtko.ursulin@igalia.com are
>
> queue-6.10/drm-sched-always-increment-correct-scheduler-score.patch
> queue-6.10/drm-v3d-prevent-out-of-bounds-access-in-performance-query-extensions.patch
> queue-6.10/drm-sched-always-wake-up-correct-scheduler-in-drm_sched_entity_push_job.patch
> queue-6.10/drm-sched-add-locking-to-drm_sched_entity_modify_sched.patch

