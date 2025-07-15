Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D3B05537
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888AA10E388;
	Tue, 15 Jul 2025 08:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zNSz8Dim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FFB10E1B2;
 Tue, 15 Jul 2025 08:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ly/vp85XKvPIV9lHBx6XK+p6qnksL+c+yaBzma1MXq6jWDOwPl+/BDqZY+007b1jFp9UFAuswSjGJSVO7mxI8yjWCTY08wMmTCMgFEeYBLDsKhlTN411xp8o8weMp1Tao6LFjelHKqaWdu+lLW3XIdP9zv2Cn3O3P5rXBSZRG1F8x5XZ24/yV/LMZkGM2UZftY9kz99erHl099KXmc/H8/hdtLl/hyHsqHv/OF+Q80N64mnmIL+0DxtlPPkR7OkyNDzg/YoHcD1YsCNc2zQzutNv9wRKkmt7qkgY1x4AqbEeHdrd63rc+lEshzPaxs2uxyiCpqTmIqtm9zS0263nvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LpXljiFioWHu5mll26BXM/s/FlNAEyaXwlRXhrcg7Q=;
 b=ckq6LJBi7kjPUvtcTDVtBXjeDnrllo0RtS7F6uZEb/vSwSAEcl8MxP1oQ0+9/sQKlYYKmppaKEbiqYJGJLAD35BmlDARL3fnNm6bkHJoe5340O1KmIK2vLcwfrD6avLocEObPau6J/Iu8oF4kcSY2a1B8dzQoWl8GAAtgx8KNfAIV3Frtd/ZKr2aKZ0h9uY+VEWBlUrY1CNnNxYAHnaSRwm9l1avDkNDFDCx0bSw8+VFwc6uWHGSh8qARXdh/gCdQtJsOoeoKrgETgIxR4KgvnjnbbK//FByidIM5SKmwMDP6PqYHeBMRfSzUVYTQ+OpF2sfP2sipjt4A7CJxMIzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LpXljiFioWHu5mll26BXM/s/FlNAEyaXwlRXhrcg7Q=;
 b=zNSz8DimY205p2fvBH03UPOnyHBSkEmjreWjua+L80vlsPmkp6MCDCMuGdsVHlsADhqTHvKap2e7bA/NOWmTf8D8WYmW+gKp6UoA6Mdyz2oCm52U4f916wZA2dVI1P140NtRgi2DFjrShPj6DM6YAo5n0z2DIh0FYTXhQw4gYus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 08:43:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 08:43:47 +0000
Message-ID: <c3b85c75-839f-47c3-912a-0181ad5e108d@amd.com>
Date: Tue, 15 Jul 2025 10:43:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm: Revert general use of struct
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
References: <20250715081121.34473-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250715081121.34473-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c51568-a04e-4d76-77b0-08ddc37bb709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWpONEhnU1dFOWNCKzgwckVhRnNoZDhYMmZ1ek8xejFWaHVNUjB4UUxLZXBE?=
 =?utf-8?B?dkI1VS90Wk9uSCtLWkNWWThveEo3ZHpRQTNjcEdQVVU1dkVNUjdjQkFXejhm?=
 =?utf-8?B?eEpKWUcwd3R6YytBU21jNTRORVBpazdFbStBTElQL1BmYWtvSmV3Qlh6cmxO?=
 =?utf-8?B?OTQrdU9WRmpsM0ZzcW05S1VibFd4L3FRUHdJUHc2WCs2eE9NeGdVYVBLVldK?=
 =?utf-8?B?V0NtbmMvWE5iQ0phYVNBRURENWVOQ2NzcitYUnBxZ1ZHaGtkT0p6ZThPZVJB?=
 =?utf-8?B?RWpUbW5jZ3pHMU9jMXpIK2tweW1ZZHpaRkp0Z0RoZVlIVkpEaXVDSVFNVzRJ?=
 =?utf-8?B?NVRkU3E5UitBU0hRT3FWYWFIM1VpQlpOcElNazh5MGRKTVJBQWx0c2I2OGQ0?=
 =?utf-8?B?Z2c4RFE3R1lxd3ZpcDhhMStWYjBIQ20zSHF3WWZ5Z3FyVWFnT200M2hlbUN4?=
 =?utf-8?B?NDRzZTlVNHM1RnhOdnVJMDczVHZYK00zc293VjhYNmMyZ1JYWlRCTFdLNXZ1?=
 =?utf-8?B?Znh5emRuN1NWS0QrUmJLL1BoaTdEakhCSEpCZ0ZHUXR0ZU8yd1ZvM1dLUDNN?=
 =?utf-8?B?aFU4eTJVUk1JajVMQmZuWEVPVXMycE5MNzRBNGJDV2NjcDQreEhvMmV3ZHdz?=
 =?utf-8?B?YkVsY1hmZ2xSN01EeE52amEyeDZPR1FRRHFUZWt2YnNySG9vdTRpS0dJcmtB?=
 =?utf-8?B?NkErdFRWR0RhRVRreWV6T1BtczFuZG42UzJBT0lrL0tZVU01NWV5TlFhVUlW?=
 =?utf-8?B?UERHcUxQeE82Q05XSXFTanFWbE9PbWNSek1Fd3QzZkh2eDF5a3laNHNBYVM1?=
 =?utf-8?B?ZXNQQXBmYXFTb285aHBNUDE0bXNkN1NmV3VhTTdXemUxWTBjZWFyVzlIdUFm?=
 =?utf-8?B?cStER3NUZFBTSVVLRlFWUkk2bzNGeXlFWlNxTTFkdnZVZFRNRm52OVFLUy9N?=
 =?utf-8?B?LzRnQWc5UWp1V3ZrOG0wTFU3QmdjV3p1NkhzRlhWalU1YU1LaEt5eTFqeWZt?=
 =?utf-8?B?bFZMcXJDWEZId3JlV0M2M0ZMOGtjbWNZVWcrTGtlSmsrWFZsVHp3NWRrK0NO?=
 =?utf-8?B?cWZZNldaZDdLYVg3MU1lTnZZbTBUWHh2WWdwSXFnd3hUSG9obkJGNDZFazRX?=
 =?utf-8?B?YUR6T21ZRTJGSUJxNDMrSGdpQzBYellWcThGSjhqSGtva2RLelVkUjVVekQw?=
 =?utf-8?B?c2FDK1NjMXJaemRxL01kQlhwNm5iU2N0OWJoRitPNENtRjM3dUlwRnlmVnM3?=
 =?utf-8?B?aEFHcjQ0ckp4V0tlMWU0aThUTGkyYWxUa1pTTnpCaWloZkdKZ0p1cmhRTlNi?=
 =?utf-8?B?Z3FDOHRtVWNNT2MySW9xZGxVcFd5cVA4Wmdoa3BHWlJXZHFlRWxRS3JIb2Vx?=
 =?utf-8?B?MTJtdzJXRlk4dWY4SXYwUEpCYlVFV1BUbVIxMlBXbXhNUWFqVkJ2TGZ6QVpx?=
 =?utf-8?B?SkxkWjNqRFAwM2VVbHNGaDhvalhiVkRURVo0MXh0MkZWc011cVdtalVtS20z?=
 =?utf-8?B?ZXEyalZPM0lRSHlNWEhxdzVwc0hqUmxQeS94ZjZLWHlqb05sUmFOaW9BRHFD?=
 =?utf-8?B?c2lKenNwY1A1dVFUcHY3bnFBelJ6TGN3WVhqVE9yYXZxMTBVVTlBY1hoRmZS?=
 =?utf-8?B?amZwRi9UMElyb05VY2R4VjdaMHRsZm55ZWJQOUFXcmdaaVZ0K1d5bkQ2TWM2?=
 =?utf-8?B?RTFSTFlTQzRaNU1KU2x1NUh3NU42c3R2bitnellFallGUjF4cERXYytkWU5O?=
 =?utf-8?B?QXE5N2dxT0RVQ3VEWE9tbGlsUlFEZ1FuMG8zUyt1MmVkYnVjU25heHIxM21w?=
 =?utf-8?B?VDJmQU5ZSTRqMEdrZVdSbDBPMWVhaDRuSEJpNzcwWit4TVpkTDZmNzdRbW5P?=
 =?utf-8?B?eGk5NzZvdDN6NDh2Wjd0UndlZkROamVOcVlhcjk0dzZlaThhYVorYzFlMERl?=
 =?utf-8?B?Q0hIbnNOME5nWk52eUVLdnRDNWlRdzNvejZ1cmJEY09WNHI1eURXeGdrK2RJ?=
 =?utf-8?B?NDRHeW9TMElBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2hPaEhkbnpEMTZLckVrWWh4eFhBNkpyOXY0VEpCZ204YTdHNFhpdmJ4WWxR?=
 =?utf-8?B?aVFCODF2UHR4eUhGaEJFVU8wOXJIdlVsMFAwVWI2QzFETnRIQzhPYmtnRWVC?=
 =?utf-8?B?NHB5UEJQeGZtbFZqNTMzdGNpdFFLMWQ2ZFhXb21iQm9sd2wzUGJJeENuRFAw?=
 =?utf-8?B?Vk45QW1LajZkVWI2TVc1blNIaU1FTXJtejFQR1hpbWZiTG9OSjZ4OHo0Ymd5?=
 =?utf-8?B?bHA5WWF5MThQeGdUeFFDWXFhTFFrdmRHYjlOSWRNbXNBb3RVdUlUbVEzRFJu?=
 =?utf-8?B?azZTV3kzVTBrSVU0cVhCbGNrNk0yODRXU2xhUTgyU1VhUWNROXBrZjZtWith?=
 =?utf-8?B?cTI0NW40b2Z5V2plODQ1UndaM05ic3ZnNCt4VU16eDlmTTVrTlpKT3gzM0N0?=
 =?utf-8?B?YUhSRWpCM3VXODZBWHVNWkVFRjBBaXRqcEJ5eVNRTmJWeUNGRDB3REVXMnpO?=
 =?utf-8?B?S3JlSXFvS2c4dzg3b3NJY0Jib0wyY21GdlBjTFk5WUlROFZVY05uWkNJY3h6?=
 =?utf-8?B?azV1clVSQmlocEZzNmtHMFkyQWNMcG5NQkVnV1dzUkNvMCtQSTBkZFdISTZl?=
 =?utf-8?B?M3JXNGhVazJuUjJwb21UOTNLNlJqaEZmN2NabE9TYTJBYzFEOVc5K2h3RGtt?=
 =?utf-8?B?WG5rb2JLUGRJcklORjdLOHhUSHhJM1NmWUxZVXJzNTlpME9RNEdsOFlLdmV4?=
 =?utf-8?B?NlVNdmFDSFN5dHVYSWRrMTN1d3lmNWhFYXI1dGlBTURxWU1IVFkzYUw2VGZV?=
 =?utf-8?B?YldEbjk2MEptbXMzbjZiQXpFcmhub1Z3eUoyazNkQ2tNU1Q1QUpkcy95UTlj?=
 =?utf-8?B?a1Fad2hWY1dGRGhXdjRMM3VLN3hScVBqVVB2TTFmQ0pVMXhTRm54WFFGN0xm?=
 =?utf-8?B?UDVhTHJ5Nk5OeWd4ekMwcFQ0RHM1RU1jMkhBdTg5Z1hsUERYNERkVkhSbHF5?=
 =?utf-8?B?bXRCSG9FN09IellCWE0yNmVzem1XejBGa2JwUjNPLzFYVElZaUpjN25rL2xZ?=
 =?utf-8?B?U0pSMWE3S1BEZVFNSU8vTko4ZHd5WlJVNzAxNmttNkZDRkZEMERKRGJCYW9m?=
 =?utf-8?B?OGs0ZWF3MWtpMS8vbFphOHI5Yy92djR6S2lOT25qWWdRL0hUUHIvSnRBVVZo?=
 =?utf-8?B?cmZkVnZnYy9PMDVYcis4cTJxdXVJWU9DUW9JYjJjbElMaUdldFF4dkZsdVNF?=
 =?utf-8?B?YStHRWJBZmM1R3VwMmpId3ZmaitHcS8zU0t5Y2FsSTBxOHhHTUxxN1BkbTJQ?=
 =?utf-8?B?TlJpc1pxNmRyWFcyb1h3WlE3UXh6c0ZNeVhuOWNLNWpkYlQzOVVSTlBIVk0w?=
 =?utf-8?B?eEVyaEc0YVhNVkVEZkZ5WllNK3UzN2dKb1dHRWRVVUdyN3RVTUIvSGtOQ2s4?=
 =?utf-8?B?MnA4VXViQU1JNEh2RktjUk9iK3RIN2lsaVdjU1FvbUNyUzdEeFF5QkcyZXk3?=
 =?utf-8?B?S25mK3NTR1VkVVlJQXpNeWZxTjZNZFlqdE83Q1Q2TDVNNkVMT1lIQUFKYlJl?=
 =?utf-8?B?NUw2UXdRSHp1S29jTUxNS1NOdC9GRi9XNFhGV2lacGVRQmlpV1lJWGlUdThC?=
 =?utf-8?B?ZVF3eVRqTHZ0TTQvTkRSNk81ZFljZXlEeE96SnVIdE0wN2FRNzRPSk5uUzZV?=
 =?utf-8?B?UytnNnNmQzZ2b05GMHBtWWZlcWtEYThaQkQxbUlaZGVlTFNvWVVJK3FvQXpG?=
 =?utf-8?B?eVVkbS9ySlVma2xDeUp6ajZiYjJpMGs0NTVEcTZRNk91NmpiY0xDVjdlVjNa?=
 =?utf-8?B?RnVJUjVaa0xXQkRITG9zajJTMEU4bDJjMkRNWWJqMG50NEtJaGxGN1ZCSmdZ?=
 =?utf-8?B?RWJHRnBlTjdDZlNCd0xpVFlYbTRUSnpXWlNxcDJFYm9wYjc5WDRtYWtRMTJZ?=
 =?utf-8?B?YUhHcXMvZ2dNNDNySVoyblFaZXh2bkxrbGZDUEN1cjhPeDk1ZHNKNjNMYzgx?=
 =?utf-8?B?dmpnTURJQUNLZzFCSDlZWjhzVmFuZUhPUDZhUVNDREJSeU5uREEwcXN3TFNM?=
 =?utf-8?B?TFcwOTFNTVhxQUVGRXlrRWVIa1M4QWpteGVielZnK2NJVmJyV3hDOWwwR0JR?=
 =?utf-8?B?SXVlbytrOTYwd2lLT1VzSWNDU1NPd2k5OHVUYWtuSy8yVDFqd0l4UGlucEdk?=
 =?utf-8?Q?pS5MxkWDazc4+n9FU6TMJYWrd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c51568-a04e-4d76-77b0-08ddc37bb709
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:43:47.8675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmJtdMwdUO7i3cjd/sKYPyxg3A/gxK4HEeMnZHeW3c/gU1Q3cOBXORduj9TNXmzp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
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

If it helps Acked-by: Christian König <christian.koenig@amd.com> for the entire series.

Regards,
Christian.

On 15.07.25 10:07, Thomas Zimmermann wrote:
> Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
> in the affected places. Separates references to imported and exported DMA
> bufs within a GEM object; as before.
> 
> The dma_buf field in struct drm_gem_object is not stable over the object
> instance's lifetime. The field becomes NULL when user space releases the
> final GEM handle on the buffer object. This resulted in a NULL-pointer
> deref.
> 
> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on GEM
> handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
> Acquire internal references on GEM handles") only solved the problem
> partially. They especially don't work for buffer objects without a DRM
> framebuffer associated.
> 
> v2:
> - extended commit messages (Sima)
> - drop the GEM-handle changes to be resolved separately
> 
> Thomas Zimmermann (7):
>   Revert "drm/virtio: Use dma_buf from GEM object instance"
>   Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
>   Revert "drm/etnaviv: Use dma_buf from GEM object instance"
>   Revert "drm/prime: Use dma_buf from GEM object instance"
>   Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
>   Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
>   Revert "drm/gem-dma: Use dma_buf from GEM object instance"
> 
>  drivers/gpu/drm/drm_gem_dma_helper.c         | 2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 8 ++++++--
>  drivers/gpu/drm/drm_gem_shmem_helper.c       | 4 ++--
>  drivers/gpu/drm/drm_prime.c                  | 8 +++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  | 4 ++--
>  drivers/gpu/drm/virtio/virtgpu_prime.c       | 5 +++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          | 6 +++---
>  7 files changed, 24 insertions(+), 13 deletions(-)
> 

