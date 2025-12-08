Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DEBCADA2F
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 16:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5585E10E47B;
	Mon,  8 Dec 2025 15:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4AZJbI3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A720010E47B;
 Mon,  8 Dec 2025 15:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vksMq3U0eiGRn3Z+nRF71vGg4gHRh+dBTfbw6zMkt5U6YsMxlXzDWio+x7l5CU9vzHnybK7qtGyhPMqpBaRuyaOoDvB1SpDBbh7DfOTIJ9tyxpIuXCWYXsPGBqor/xBb4TvPxzHReGVDWqijEuQ32WGgfxWp4VbeJJhwYzUR2Q0fNOQko2fIYXRDGUGAdWa0low44iDyfz4LiiAh0RSJ+Gwdc4vSh1APzkZ+h9d00oOQ7iuZaOuNruyZ2ijNW5vFhO4E3R4j1qWu2fHv7h1VCorQPwMU748Wsl7px6XnK4Gf3ZPTYv+7ecdUM/b5Xs1S0ozvbG4N2KNiXK4OCBHSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2FL9tlXyaIM3IdoA92ZVyunR/jv5QfzkFhzqUmSSjc=;
 b=sPMvmIbVXuPz4oEyuHQ3SVqkB78XPvwotN8BjK47RdruqKzVLecRo/1uzbyV3N9jF2eIHkHp9Q2lbRA7pCuUpTGmyNTcfY9ulwmwi6xaV6hofEJY74vUQWd4w/pMXqecqgDs2dLyMHulDBAeO+CWKsasijS2NO2Sx1C4sYHNn9w3V1cjWo+rFgm51HiHmPgDIJuObO2SOfopWPr0ktoMPKpWoNkGDGzRbHAzST7+muXf/13bZftg11lwZNASw++PqdLfeIO/xa6YEr5cdQg07uRj9Y48GUWr1Ypwg6wPQnrDYD5d8RlgKljaxSvijF0gxYji498iwg0ehM5+FtX2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2FL9tlXyaIM3IdoA92ZVyunR/jv5QfzkFhzqUmSSjc=;
 b=4AZJbI3WoexgkhKjvu3qqohawnF7aEmrL12zicWyXctRxbEWTzvc1o4m7RT9ZXFw/YCKliNyYCzuU73Yl5vkbpOMKo9zMLaJnLGF1mZ83MHOGaI7Buq5/I1EGn0veCwg0SUPyUtLmHfRJVdlvWmviuffUzDSUXLhR45leqcawTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 15:46:43 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 15:46:43 +0000
Message-ID: <f86f5a74-ec10-4e98-8fc9-1aa00ffc64ae@amd.com>
Date: Mon, 8 Dec 2025 10:46:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nicholas.Kazlauskas@amd.com, simona@ffwll.ch, airlied@gmail.com
References: <20251201231807.287414-1-sunpeng.li@amd.com>
 <20251201231807.287414-2-sunpeng.li@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251201231807.287414-2-sunpeng.li@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::32) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: bb46a8e1-791c-49e1-4fc9-08de3670fc8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0tkVE9CbDFyaC82dStTa0plRGdSQ2oxU29FMVJXdjVFdWorcmhTTWtjQkNr?=
 =?utf-8?B?UWxjL3A3d0lZQUJoejhnaCsxVHR6cEJJbzNCTzF1NmFHVjVDSDVsWjYyc2RX?=
 =?utf-8?B?Z3BKeGhCQUJXOTZQZG42RDZGK29kSjJwR0F3aEx5dEIzWEcyK1JRZENXY2xh?=
 =?utf-8?B?VjVXeG9Tc3l2SDRFSk41N1lqK3k5MFM2Q1JuZk4xZkc4VVZNM1VJWWpUM1dP?=
 =?utf-8?B?YnpTMTE3N0lKeDBRamZ4emdJejVNOWpaRUtsc1hCeEs4WUI3MGY4dnoydHBO?=
 =?utf-8?B?eG41bHUySVlseTg2NzZ6UFF0Z1VqZ1FidE90MjRTcW9IejVtUjNGdlk1ZkVU?=
 =?utf-8?B?RzlJRldlYkdoeUZkUi9QZjduZXV4M1R2SnNEV0RxT0xNSzdWSVVOQ095T05G?=
 =?utf-8?B?cWNzY1FpbUY3dFhXdnFlWFM4bzV5M1d2dXNSdWxzekVtK1E2dit3UEdLR2pi?=
 =?utf-8?B?RVlnZmZSVHhDbG55c1FYRkRxRFk4NEpXZ2tCUGRPSFdEZ3VDMjRRQ2kzZGhR?=
 =?utf-8?B?Z1k4VFQzb2ZhbXkvQ0FNSG90eHh1cUJwSlkrYm54MWVXUlQ1bUtyczVzdXNI?=
 =?utf-8?B?aEdLVWJKQW5mcjM1MERUb1RyVDVhamtnUCs1SVp5Mlo0dXZWekJJMDVhbStJ?=
 =?utf-8?B?YmRrRjlmazBmYVlLNXFhdmM0elNVeHpKaXpjQnZZN25WMDZNYWtRVGlXTENR?=
 =?utf-8?B?R3FyTHE4b2pkSmtaSHV6Wnl0MFZJdFFLc3IwWitGNHBvWEtTWDVaSHJtK3JL?=
 =?utf-8?B?S1A5ME9MaUQ3UzhHeTgvdGFWNlh2VEwvTFBhdHE3U0xxVFBTdjlVd0dhaXVh?=
 =?utf-8?B?aUlNNHV5T1JJN1pucEREUVdnNnZGcENyVkNPS0JHTlhEVU1zbVNoS3NiM2pl?=
 =?utf-8?B?ZkU2eVN3LzdpdkxoTzRhTURPY0VkN2tqV09SRS9FNmpMYzNwR3I1NlZuSHhG?=
 =?utf-8?B?NXRGL2t2SUZ5dzlMZW5uSFJQaWVCckI0VVJTZ2N6WHVxS3MxdnUvSjgramli?=
 =?utf-8?B?d05TaGs1Y2djdXFhMHpKT0ZEancwNHpXRDdRektGNHhHOWxLcGg2dDhQOUli?=
 =?utf-8?B?dGRjUFpmbXBmeElOcE81QmY1OGp0QXYzYXJGS2plcG1qQXBGWWVsVm1heVJ1?=
 =?utf-8?B?aGRlcFBKTit4Q1dncW0wVG9YY1l0aUdqQ21VL3gvZWo2UlZmRTNqWEhtSjMx?=
 =?utf-8?B?Q1FYUkNOWUxDcGFTcUkydGlsSGgzNkV3OWhCa3FyRDBCSjNxYjRUSGtob2J3?=
 =?utf-8?B?MWZSZi9TQ2FjcTJHdi90RTFZSUsyTWMycTVyU2E2TFpjVEQwRDlrQWFrSEg1?=
 =?utf-8?B?alNVVW1FZmNtUys3a3YzdFJSNEFtOFpGVTVsN1VGSjVjMG5pVUhSZEpwdFls?=
 =?utf-8?B?R3FuYlEvS081dGlNWGViNDVOcnYwNVFMZEJ1OWpQaEJNSkt6K3ZmOHU1YUZK?=
 =?utf-8?B?cDR4bElrSUttRWhRWmxUNWVXSnZGZmJWSzlBN0xFQWIzSndhNTNsRk4vMWlM?=
 =?utf-8?B?S0c3WERwSER5NEFZRnNjREllOU5jbS9sdmYvSHZBQVVxNE9FanZLbWNSdG5t?=
 =?utf-8?B?U0NFQVpaVElmdXVrMXExNTFCMFhacmh1OEQ3NnlhbnBYY25YNDcwRUxQMEZG?=
 =?utf-8?B?Ly91dUVnU1RRaHJ1TVE4UkxWMmJjRE5hQkNzUXkvMlNVRnhRbFN4Z042OC91?=
 =?utf-8?B?bHJZVncrN05VeUxTWDBsdDVrbDAwcGxsdzhFTGFtQ1hoazJuTUk0bTBTOUFM?=
 =?utf-8?B?VkNRR2tRdFAvdnIrNVNLbGpWSHRsMHFYb0ZiYVZ1WkNEcDE4VFJnMklGTWls?=
 =?utf-8?B?YnkrNy9QandVVFNwWkJGUzF1ZmxVYUF6SmV1YWJOV285NmR1NUZEK1BNTWpz?=
 =?utf-8?B?dm5jSmdKYWhLdThsYXRIdWNsQjJ1RDFRaWw3RUJ1WkFackd6ejA1Ukt5RmFZ?=
 =?utf-8?Q?aUZVPUZcsWYmn0APEo5qjcxjEJFCPqjh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5TLzF2UVovRDByMzJBYnh5Y2s3YTJnamJONjdCWklHWWxnL2g3UVl6WEdD?=
 =?utf-8?B?RCtGSDBaaHRpOVVtKzNEQXlwemR0MWFtdUJsTmJyTGU3RzNidUpVQTdRRlpt?=
 =?utf-8?B?Y1VCbFNTWVFFU0wydFh3VVp4TjNZQnB4M2lQM1d0RHJxVXNmVWVQUXVEMU10?=
 =?utf-8?B?NE1tMmRMWStPNVd1NzE0L1BJMXpzZmdBK29ld3UvUGpPTnJxbWJFQVZtcG1Z?=
 =?utf-8?B?QkJ3QmxzbmdOWldldCtWN0tudFRobG52STZYeklDbGtVVnJwUlgzWUhVcm50?=
 =?utf-8?B?M1JjNENOZzM2c2djV3d2NGhxUERFYkF2cDZxRzZVU2FPUEVYY2FTK2FxVGdE?=
 =?utf-8?B?VVdJOEdNb0F6clZhZkFsUENvajh0aU9GSDE2QjhMWmRRZzl4a1owQ1NMdFFE?=
 =?utf-8?B?WElmV0FJamZhVmppNGJ2M1pCaUxNbVY0NFQ5cGxUR3QvejRlWkhyR2ZLZnVD?=
 =?utf-8?B?dXVkcEVYTk1PKzFVUVlxMldhUTNzUURXcjEvU3pZTEtkRlJWR0pMOGFSWTZS?=
 =?utf-8?B?bGZwWi8wL052bUFSWjYxN3lpVFM1MjNXakx2MXRzQzM0akRUWkM2eVQzbUc2?=
 =?utf-8?B?UGU1STdOQXRJdjd1YlVhMzVnTDM1TWpWZVorK3BKOXZSclNGUzhCNy9CQWZq?=
 =?utf-8?B?VlI5YTFiVm9YNGtqOTg2aFpWMVVTaHJER2R1Uy81RU8weDFLUzcxZmpLSm8x?=
 =?utf-8?B?czJhTDBVcjNteW9LcXNJa2xWdTRreDBqY2JwVjc0U1JwWjQwbm1xZjFYRlBw?=
 =?utf-8?B?WFpZVW9FSExNdFJyR2t2cG5aTDNTdzlxVmV4aWJHVHBXSGxQWnN1THhRTzdw?=
 =?utf-8?B?cjVaS1JxRnB4U2hIZ1liSEp6VFRFK0JlTXY3cGVoRlp1eU1HSWRQL0dWNFh1?=
 =?utf-8?B?dWZSRnp6MUtRNEJCdnhBZVFBRHBMK3dvM0pSVmkwbUpBd1pyVCthYUNyOWFP?=
 =?utf-8?B?Kzh2M01SVFduNUlMQ2dKNG5GUUo2RFVSQmUxWVI2d3lnekhBQzR1bWs3UHZj?=
 =?utf-8?B?WWduSVFnQjV3M0F5RnF1RmZlcHl4TTlNcUhXNmNqTko0YkZmSmdqZGk4WnZR?=
 =?utf-8?B?aFRjUnJLOFJrTnFnZytGOThSdVJhRElCUU1tZVlOK1NtZ0Njc01GS255ZUJa?=
 =?utf-8?B?L2ZiODJybFZvMk1EcUtkZDVBS0pVVnVZbWZoOEdCbFVrWlBYMklSWDJma2hp?=
 =?utf-8?B?czJHaldmcFpwcE5GYzJkQmlTY1dEaW9VUjE5YU9ZMXBQS0cxdFBwOHMrNUNV?=
 =?utf-8?B?RklDRVgyNEFqSTZJVlVqSlY0RzF3R2ZLSnlqZzJ0dUYzSEFQQzN1M1JoOEhv?=
 =?utf-8?B?L2sreFltZnNkVGVkSEdzb1o1VHE4aDNieTdOZVdXR09CWDJ3NnBLa0xNZlA1?=
 =?utf-8?B?THlxT0wxVTA1bGMxUUNyOUI0ZzlnYzJhb2F2eUVhclg2LzhRb2d3NnlJdGhY?=
 =?utf-8?B?UFpuTW9qWW9SQjVNc3pKaW5jV0pDcFJ3dUtnQnFzTkMzZmRlUEhidGJXWVEv?=
 =?utf-8?B?QWkwcmRFVEVFV2ZlR0Y0blQ4aHh5TlJtNkk3MDhBaFJjZjU0WEwxSHhtZFo4?=
 =?utf-8?B?S3lHZy9GTW9NT2Vxam9keEtaalIra284QmVMVFVXZlVKRm1BaXJoVkxnUTdN?=
 =?utf-8?B?VFhMUnFWQ3RVRTBXYlZsTGtKQUVOZkNuODlFekh6cVZ6RWR2RFZOaHJhRHR3?=
 =?utf-8?B?SDJSWXJKQmVJU3ROM0JHZ2VlaWRVSmRYa0orSEFZZWZlNWxhTm81aGgvUVZj?=
 =?utf-8?B?bWZ2TVc5MzJaNkJEL2FJb1V6aU1pQUVVTVdBUGRHa2VqbnVMRW1OTHpFbGVl?=
 =?utf-8?B?NjBud2N4NElVNFJ5RTVSVnNaUiszZTYwbmtCUWlicm5zNWpxNWo2T0pDbFM3?=
 =?utf-8?B?Y1l5TlJvZml2M0x3cnMvTkNvVEJxbGRFODl6a1JWUWJ6cjlTZ1NJL2Rnb3lr?=
 =?utf-8?B?em8vV0tteHZ2SU1XSGo5c2ZONXJEZEJ3UzBTM1l5UmRTY2VQL25ZckovQWth?=
 =?utf-8?B?ejhtcnRSTzJ4RTJuUkRSSHN4c3JrNVhMaXRXMzNSL1NuQWJSL1FMVVNSM2xF?=
 =?utf-8?B?MVBRdWNYZWtkTVU4aTk3c3NhYjZta0Y5aXhFK2F5UzRiemZrOStMbjhmcjJZ?=
 =?utf-8?Q?kdGd9LdSilQe0xYzjX4YvClBk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb46a8e1-791c-49e1-4fc9-08de3670fc8c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 15:46:43.5480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH0sNfR5ed96rYGTcfZle6B0B8MUyViCQK3SLmu2k2gnGzRCDFVI8qjfT9Ssp5rJ3X1tFGH+cs19h4GCTEWlew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695
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



On 2025-12-01 18:18, sunpeng.li@amd.com wrote:
> From: Leo Li <sunpeng.li@amd.com>
> 
> [Why]
> 
> APU DCN generations since DCN3.5 have the capability to power down
> almost all of the DCN hw block during idle periods. This is referred to
> as  IPS -- idle power states. In combination with a panel remote-buffer
> feature (like PSR or Panel Replay), IPS can save additional power.
> 
> Once DCN is in an IPS, no register access can occur. This includes
> control registers for vblank interrupts; IPS must first be exited.
> 
> Transitioning in or out of IPS requires synchronization with the rest of
> DC, as it powers up or down DCN, and may communicate with other MCUs on
> the SOC to do so. This is done via the dc_lock mutex.
> 
> While calling enable_vblank, the DRM vblank core holds spinlocks that
> prevent blocking operations. Yet acquiring the dc_lock mutex is
> blocking. Thus, IPS can not be exited piror to programming vblank
> interrupt registers from within enable_vblank. At least not in a
> race-free way.
> 
> Prior to this change, amdgpu_dm was exiting IPS(*) without holding the
> dc_lock, opening the door for races:
> https://gitlab.freedesktop.org/drm/amd/-/issues/5233
> 
> (*) From touching the interrupt registers. All register reads today have
> an implicit IPS exit, see dm_read_reg_func()
> 
> To solve this, the prepare_vblank_enable callback can be implemented to
> exit IPS, as it is called from process context.
> 
> [How]
> 
> Implement the prepare_vblank_enable callback for amdgpu_dm. In it,
> the dc_lock mutex is acquired, and IPS is exited.
> 
> v2: Add missing semicolon, add docstring for prepare_vbl_disallow_idle
> 
> Signed-off-by: Leo Li <sunpeng.li@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++++
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  4 +++
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 36 +++++++++++++++++--
>  4 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0346052f2e574..842a93e2d6ce0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9682,6 +9682,7 @@ static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
>  		 * We also need vupdate irq for the actual core vblank handling
>  		 * at end of vblank.
>  		 */
> +		WARN_ON(drm_crtc_vblank_prepare(new_state->base.crtc) != 0);
>  		WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, true) != 0);
>  		WARN_ON(drm_crtc_vblank_get(new_state->base.crtc) != 0);
>  		drm_dbg_driver(new_state->base.crtc->dev, "%s: crtc=%u VRR off->on: Get vblank ref\n",
> @@ -10108,6 +10109,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		 */
>  		if (acrtc_attach->base.state->event &&
>  		    acrtc_state->active_planes > 0) {
> +			drm_crtc_vblank_prepare(pcrtc);
>  			drm_crtc_vblank_get(pcrtc);
>  
>  			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
> @@ -10124,6 +10126,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  					&acrtc_state->stream->vrr_infopacket;
>  		}
>  	} else if (cursor_update && acrtc_state->active_planes > 0) {
> +		drm_crtc_vblank_prepare(pcrtc);
>  		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>  		if (acrtc_attach->base.state->event) {
>  			drm_crtc_vblank_get(pcrtc);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 7065b20aa2e6b..a99612fb3467a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -587,6 +587,15 @@ struct amdgpu_display_manager {
>  	 */
>  	uint32_t active_vblank_irq_count;
>  
> +	/**
> +	 * @prepare_vbl_disallow_idle:
> +	 *
> +	 * Set to true when idle has been disallowed. Set to false when vblank
> +	 * interrupts have been enabled. i.e. idle re-allow on vblank disable is
> +	 * blocked if this is true.
> +	 */
> +	bool prepare_vbl_disallow_idle;
> +
>  #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>  	/**
>  	 * @secure_display_ctx:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> index e20aa74380665..7839b56859391 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> @@ -656,6 +656,10 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  	 */
>  	enabled = amdgpu_dm_is_valid_crc_source(cur_crc_src);
>  	if (!enabled && enable) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			goto cleanup;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (ret)
>  			goto cleanup;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 38f9ea313dcbb..dd693419111db 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -258,8 +258,8 @@ static void amdgpu_dm_crtc_vblank_control_worker(struct work_struct *work)
>  	else if (dm->active_vblank_irq_count)
>  		dm->active_vblank_irq_count--;
>  
> -	if (dm->active_vblank_irq_count > 0)
> -		dc_allow_idle_optimizations(dm->dc, false);
> +	/* prepare_vblank_enable must disallow idle first */
> +	ASSERT(dm->dc->idle_optimizations_allowed == false);
>  
>  	/*
>  	 * Control PSR based on vblank requirements from OS
> @@ -277,7 +277,13 @@ static void amdgpu_dm_crtc_vblank_control_worker(struct work_struct *work)
>  			vblank_work->acrtc->dm_irq_params.allow_sr_entry);
>  	}
>  
> -	if (dm->active_vblank_irq_count == 0) {
> +	/*
> +	 * If this worker runs disable between prepare_vblank and enable_vblank,
> +	 * we need to block idle re-allow. Leave it to the next vblank disable
> +	 * to re-allow idle.
> +	 */
> +	if (dm->active_vblank_irq_count == 0 &&
> +	    !READ_ONCE(dm->prepare_vbl_disallow_idle)) {
>  		dc_post_update_surfaces_to_stream(dm->dc);
>  
>  		r = amdgpu_dpm_pause_power_profile(adev, true);
> @@ -308,6 +314,8 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
>  	int irq_type;
>  	int rc = 0;
>  
> +	ASSERT(dm->dc->idle_optimizations_allowed == false);
> +
>  	if (enable && !acrtc->base.enabled) {
>  		drm_dbg_vbl(crtc->dev,
>  				"Reject vblank enable on unconfigured CRTC %d (enabled=%d)\n",
> @@ -399,6 +407,9 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
>  	}
>  #endif
>  
> +	/* Ensure compiler emits the write before worker is queued */
> +	WRITE_ONCE(dm->prepare_vbl_disallow_idle, false);
> +
>  	if (amdgpu_in_reset(adev))
>  		return 0;
>  
> @@ -423,6 +434,24 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
>  	return 0;
>  }
>  
> +static int amdgpu_prepare_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
> +	struct amdgpu_display_manager *dm = &adev->dm;
> +
> +	guard(mutex)(&adev->dm.dc_lock);
> +
> +	if (dm->dc->idle_optimizations_allowed) {
> +		/* Prevent the disable worker from re-allowing idle until
> +		 * interrupts are enabled. Ensure compiler emits the write
> +		 * before disallowing idle. */
> +		WRITE_ONCE(dm->prepare_vbl_disallow_idle, true);
> +		dc_allow_idle_optimizations(dm->dc, false);
> +	}
> +
> +	return 0;
> +}
> +
>  int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	return amdgpu_dm_crtc_set_vblank(crtc, true);
> @@ -590,6 +619,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
>  	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
>  	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
> +	.prepare_enable_vblank = amdgpu_prepare_enable_vblank,
>  	.enable_vblank = amdgpu_dm_crtc_enable_vblank,
>  	.disable_vblank = amdgpu_dm_crtc_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,

