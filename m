Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPqrFKTfcGnCaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:16:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD5583EF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC5810E791;
	Wed, 21 Jan 2026 14:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="isouwlw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8018210E791;
 Wed, 21 Jan 2026 14:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVnhkpQFIBepVFgFZ8nMRtAh+9VIOO1GDVQpnrU+GL4z26PPW7Z8lNeD31ZcOJLh41CKZ2yafr+gnju3QcLXwPkQWQoVvqvTxMxWKZQykPACGFuuWxKrSYhAIOQkL74L1ilkKJ1mtmGJO29Y9LAsYWJPYTzvGsOWAdjqIydGGLDC6IDCszNbC+MlxrkikGNoeS4CYn8BDQyGanSt+q10P25nv9BC5RsCAcVoMgBCdrv3HJzJXmZMmdfKa0Ifs2PbcLBPwdPQtDJTXGi8Kk1zWUQ8e0P/SvlZJ4x8e9/vJBJC2JsCh2LVIb/4mZDJTEeArQ6Dr2+Pdevc/fPeNkrrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0XreyKuk6ulyTLgL/oz37M+990R47kyrBb0AahPj3I=;
 b=Fak5VgFGeBtuFJtqU6PITBOPVMcSYzyCYaO16DF+XU/Qy185LMPLE3Aj2xHWKVPFJllR012ZHNtYmOg78UKWGqWy4hqQT6k17zZlNfvelKMuCC7WBTe1SESJeTy2GHpDvwxgdWDIeFojG11BHLUrf2uq9Qgcm2Rz5JjzIOJu9P1Czu+XwgVpHM/OROo2NAeENjziBHVSIui9GPRCVlwjOj2EF4zIKGSp44MkOWjLRD4cl+0xG/XrJlIExWyXt466pJsDmVygtAemze1I4anBHY63zAE1Gc/9CQ0AC1Zj1KdVfAkKaT/VDw6LDKO2wtYjccGQ4CKtnRDy7Kh1MrBTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0XreyKuk6ulyTLgL/oz37M+990R47kyrBb0AahPj3I=;
 b=isouwlw4WLAF0U1mbG+OB2jeIKONKRzFrxZrERjNWQRCqA02DGlHDacadRx71daeY1lwUw8B/mVolYSud/KOZ7SjnAU4k1lU35Jy05XJHqWXy/RMao+jDViiYsg9mhMro5zJ+w4nszGvKz1dhC/o4CbTOt912PaSZ+PVEVcP+Us=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8204.namprd12.prod.outlook.com (2603:10b6:8:e1::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 14:15:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 14:15:55 +0000
Message-ID: <8689345b-241a-47f4-8e9a-61cde285bf8b@amd.com>
Date: Wed, 21 Jan 2026 15:15:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dma-buf: Document RDMA non-ODP
 invalidate_mapping() special case
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-3-b7e0b07b8214@nvidia.com>
 <4fe42e7e-846c-4aae-8274-3e9a5e7f9a6d@amd.com>
 <20260121091423.GY13201@unreal>
 <7cfe0495-f654-4f9d-8194-fa5717eeafff@amd.com>
 <20260121131852.GX961572@ziepe.ca>
 <8a8ba092-6cfa-41d2-8137-e5e9d917e914@amd.com>
 <20260121135948.GB961572@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260121135948.GB961572@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0124.namprd04.prod.outlook.com
 (2603:10b6:408:ed::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 8847602a-3bf3-407d-364e-08de58f79722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmJXRDdBV05KRmpQSUpuOWZDN1p3VlRjbVpNekhWWDBWZDZ6cVhCdVozVXFh?=
 =?utf-8?B?dUdpenI1amtQdFlnYjU2cFNUM2g1N3dNNUlHdWovbTY0RGJHUnFHK1BaN29E?=
 =?utf-8?B?aUFtVGdIWEpsdFcwSzc1MmpjVWZpR2ZXeEdCaWU4Y0JaOU1weEt1Ni9RblRz?=
 =?utf-8?B?TGYyQXAzYXdUVTUyczB6dHF2Y0VvMVRQQUlldHVLUmVaWGR0eEMyV3huakFZ?=
 =?utf-8?B?ZWc5dzRCUUQyZVpOaUNFeHExdTNGeGJ3NXR0aWxCa3lJeU9VNmtHbDdtM09o?=
 =?utf-8?B?YWNnMU5kdkVyVElDQ3RZNFJxa09GQ21RYUlVL1JPZEdmTEdWWFFoZnE1VmFU?=
 =?utf-8?B?UXdNUExRUnRSNllvcXcwSkhTZTFpZUJOam12bVcwTXFYY1d5ZlNlUkt3NEND?=
 =?utf-8?B?djJvZFZabFZmS2FtWkk2VXVGTGs1eVltbUpmSnJDSS9wd3pUajhMa0R2M0ZD?=
 =?utf-8?B?T2R5eWFlc1lFMGp5WnhsUkhjU1ViUVVhdzdxSG9ZU1JmTm1LeGZBQWVXRUZm?=
 =?utf-8?B?QlF1Q0dyT2xlbnJvZ1NaM0ViZ3J3K2hLdEpVbjBIeW4rL05aSng5Y0o1MXhC?=
 =?utf-8?B?MmZrR1dDdHlvd2djZW5RMkdIVXZWek9SNUl5VlhDTi8xN0VWRlBhWm5lMFo3?=
 =?utf-8?B?TDBNZzdQcmg1bWkraUNjdHJwbmZiUTAxQVBUTitNb0t2MTJzK0FVOThIZHVB?=
 =?utf-8?B?em00em9LcGJCT2tWckNiVnVGbzVMSHFMM3U5cjIyK2JTVTkxQk0vV3d4eTdx?=
 =?utf-8?B?NjY3Q3BTWGM3cldhWWZBSGxidGJSSWhMKy9TL0orc0ZMb0JWbUJlTTMvSEVm?=
 =?utf-8?B?U1gwZUtZWnZ1VlVUMS93Y0JXTGEvY0Vod3ViMG42SlRHYnpsMmg3Z1pQbkJG?=
 =?utf-8?B?WkxBS2tNZ2gzQ0ZKVGRWN1pSTkxQbjNTb1NYc2NIb2tsS0pRYk02M3FUUUxZ?=
 =?utf-8?B?Yi9OQW44ZUFOdkdBN0JNSTJac2RpUytva1FtdTRUQzl4VS9qT0d2OFR6WE1o?=
 =?utf-8?B?Rmp0dHhRNTZHMUFyOHVOTVpta2JFZ1MvcXE1djZHVGwrcXdGbllMVXMvaE1P?=
 =?utf-8?B?eS8xWGY5OGZ1aTIyaDRqWHVyWC84YUI2bnBDUUNVaXFyOEw4S094MmdVc0tD?=
 =?utf-8?B?NHpxTlc5WnRQQ1FNbTN2ekNlMnZpK2pzUWRkTUxKRU5ub05BUUNDWE5ZU21j?=
 =?utf-8?B?NGdaanRULytJWmYzc0xYVk1JanBtZjVBSk9ZSTJFZU5wV2xUbFhFUldETytV?=
 =?utf-8?B?enhjM0xvcXcvRUVkSUtSTDF1bGhiVGQrUEVGR0JkblNoa0EvS0MweFpzVTJV?=
 =?utf-8?B?emg0ajVOYWs1LzRaM1ZoRVFkc05ldGFyOVh2OTZmOWtBNEJVemZZcUg5b1or?=
 =?utf-8?B?a1hUWnpUdVFBUUwyVU5yL1BROHAzc1pDODFsd0tRZHZpRFZDWC8yY3hvTnR5?=
 =?utf-8?B?VHBHQ3Q3a3dVQXJSU1hJejJqNjNKdE9YcEhWSFp4NVgrNGg4THRFeUFUQjl1?=
 =?utf-8?B?dVlqODFPUytOZTVOdzl4aGN5QU4yYzl1VWJOa0RxVXNEcGFLdFZScGhmMk5U?=
 =?utf-8?B?YWsvTWkrZndNR2FGSVlzTTBtRTA1RVJEN2hGZTNEbThFWHhNeVg0VE94Vzda?=
 =?utf-8?B?b1R3VHlFMUl1MHQyNTRieVNrdDV1d3o0VmpNZjVUWUJKYmdpOXAxRTVEM0Fz?=
 =?utf-8?B?QURuYUlYNTFvZk1SdEx0eG52RHMrS25yVGFzRjhZWWV5YWZqZTdxc0oxSFpv?=
 =?utf-8?B?RGd5Y21UQUwzZUNtZVcyendPbHJJZnRBVWY2YzBGQlNrazdoaU41d1Q1S2l6?=
 =?utf-8?B?dUZFMFdtWlJ5U3pqVGtpcm5ZTjRLcXQ0MmlaVHl2UmtvQUZqVFB0TUw4eFdV?=
 =?utf-8?B?MnRPMWxsU1JmR29qUTRFb2xNeG9mck5DYkltRFZLaC9pNXVWUGtuaG5FWTEw?=
 =?utf-8?B?MVRsVDVwREdnSnNNSUk5K21qSjE3MW1VdDhKQ084VldjcHplNDZkUFI1eEJk?=
 =?utf-8?B?TjB5a0I2VGF3blFocll0WTJ5SjZIaGpJaDMvRDY2Sm1ZcVRpRlk5YTBGeUNK?=
 =?utf-8?B?eXdKOUUvZWlza1d3RElMTzJhWkhzQTR2YStaOFpLdFU5QVZ4bGVUeFI0Yloz?=
 =?utf-8?Q?ADx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0JLYWdHbVFBeW5rbVhaZUp2QmR5VWx0cVc3dWFsM2d6R1hCOWpJU1lBdnAv?=
 =?utf-8?B?c00yNG8yVUhGVmd1a3VqUHdkVTdZNWRHVThVWDI2QnczYzdURWVNNUpoR1VG?=
 =?utf-8?B?bXpsRnhJNWIrZHJBaTBMV3pHd3drdVFTd25uTW9LcFNMdTIwTDN3R0sxdlA4?=
 =?utf-8?B?N1F1SFRwZHVNS2MzYTdVMi9zYjdKNXdBNkFzUUs1YTJXMDlJWFRKLy9Ra3hS?=
 =?utf-8?B?aFgyTzlCRkFZZHpaUEVLWEtTLzRXd3ZwL3NXODJyanFDLzcyekZDQUVtOXVB?=
 =?utf-8?B?dXpSQ2ZvVThFakJsUDY1b2NPQXdXVER4TFlLelgrcmt1ZmEzWTdkTzRWcHU4?=
 =?utf-8?B?djFLUUxXVG90S0xVSHhXSzJpb2IzNmdNdzJoOEF6bFkyeTJGcXpodkt4VG43?=
 =?utf-8?B?bllaN2N2eDBUSU9YYzd6amhPUUgxNTRmejhTTFN1ekk5VzJQZkZVNlhkcGFG?=
 =?utf-8?B?RXRrZ0tVSUNWaDBFdGhGU3E1N0RaMm1UK2VTMmFqdkNTWGpzSUo1bU9zd0Q3?=
 =?utf-8?B?cytNbzNLSmJUeW96TDdKNS9VT3dOOXNXRVZuRzNuS2dFODhVVUlRM1IxRHNu?=
 =?utf-8?B?TDE1N2NBMUpBMHJxRU1vQmpkMUtrR3pZZGN0d1dXUTFTNFovOHpWT0N5aVV1?=
 =?utf-8?B?VmRjWTIxODBuWHVobVk4cVkremJkMjhCbGJwTXJMd1Fmd0JoNDU0WHUvMHpi?=
 =?utf-8?B?K2tSZTF3Yk4xMjlGWGxNMzQxc2lyYWgzREg1TmFmNFI2Q1RsV1BwQlM2VWRB?=
 =?utf-8?B?WnZDRngzQmpnUEM2aGxlTkJ0RkVhVUkwdEZBc3h6eVl4eFZCbnU4K29MS29O?=
 =?utf-8?B?cTZFNC9ZQXIxNmFWRWV1TXlTT2hidHE2bTlzYjNJcVFBcnlBdmVNYWFzeVFm?=
 =?utf-8?B?bEFscHorUEdKaVZMd0pHUW9kUzlGZVhacFptclR2amVpU2Y5aDVGQzJiVmZK?=
 =?utf-8?B?ajRiRHdtWEZmRnlZQkp0TDVjNW5ZVlpZOUN4SlYrZ2ZEMGxKdUJLMmxIZnNX?=
 =?utf-8?B?TmxaR0NSTW93M3NlUWE5cy9iK1BTT3ZtRmJ0WDFWNjdRTjJ4UUFCVEdpVVZW?=
 =?utf-8?B?L0lUQlIrS1VlQjAyZTRWcHpZRjhaMUU3VURMcVhhWGsraE0xY0xxWU5IV0xj?=
 =?utf-8?B?Tm9ZaFYxV2pKQ3RYMVowOVl5MWdpQm5LZHlIV1JHR0hHZmR2Zkp5TG5qZ1Jj?=
 =?utf-8?B?Y3ozNUFUZjdEc2F3dkFxVGFhVW1KcERlL0hxZXVWckpXaGg4TWNjdUFmWGpw?=
 =?utf-8?B?cnhHb1dsdVlINm1Fa245bzNmZUh6VDU4OVFybnMweFk0cmlMYzFEeG0wa2J3?=
 =?utf-8?B?YWlFbUR6aG1OUHp3cWhVRVFiS3ZNb3ZlQmlWYmF6czZMVFVaaEJPcExIM291?=
 =?utf-8?B?YXBUdmRGL2w3Q0twc2xWMG05c0hUdEFvRldUU1VYMDVVS2x3Wk5FeUU4VDIy?=
 =?utf-8?B?RjBxQkxIbXdNV2RTTGdqMGs2WHhBbkZtQUd0aVdycFZQdmdGRDVNVGJxdFFj?=
 =?utf-8?B?dmZJZUVhV3Z3RTFXVFhyYkdXNmF0QXZ6c01kYTZiL2psalpQRXRkTHFyS2FF?=
 =?utf-8?B?SzNnYnVsa1JtL3V0aVZ6SkJmRXlOQjhGN3VUVXF5Tmo3Y2xxckgvQ2E5YWo0?=
 =?utf-8?B?eG5YQzJDMDJpdWJMcUJvSzdFSlBjN2VUckc0Q1Q2U0FSZHRxdDdHRUJLUUZa?=
 =?utf-8?B?eGc0T1JuVk0yNmJZamszSUhNb2daZ1ZneHZvMmlvVHM2V3FVRklPMk1rajFh?=
 =?utf-8?B?cm9qdzlHZmgrdVpBV21tM0ZBL1FjQUdqalpkTURxM2NsTGxxUXVtYXgyTVAw?=
 =?utf-8?B?Sk0rN0k5U2JrSWdmMnpLTk1pQkZkbVNpbXZtVzFROThzcHpXcFhRUExzMWlh?=
 =?utf-8?B?WndzZy9LUy9wd2psMG5rc21zOXNmRGFhMWZoczlrWVB1TVV4V1JVWE90SE84?=
 =?utf-8?B?RnREU3l6eFgySDVQZjVLM1FwbXQrZnB6eUpnMjV0UEt5SHFpbjBmMnB0Q1pv?=
 =?utf-8?B?eVBiRHF0OUZTWTVUdnM5aFZnYU1YSmF4QTQ5bjNPOGEvUWp0aDFLd2c5by9T?=
 =?utf-8?B?SHVLclVJVHZCaVdVeW9ld3ZRTGRFS2hZb0YraTJ0QVFJT0Rxam1qOEZySGJR?=
 =?utf-8?B?Sy8wNmdaM0ZXTm1aamtZc0JEUXhVSEQyTWRQWkNhakFrY3N3bTh2U0FTUHZ5?=
 =?utf-8?B?UE5sWE1PTC9lRWVNSkpjaVpvd0VGZ1ZRekR4U0srRDhkT0xBOWhVQW9VQ3Yr?=
 =?utf-8?B?cVdjUitqR0dHcFJPMFpzeU1TVVB5R3FjaTFvSGM5K0tUUmY4YURQQ0dRaUpy?=
 =?utf-8?Q?EnR8lOqDHibeiQuF/G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8847602a-3bf3-407d-364e-08de58f79722
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:15:55.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSczRagAd252fHzR0orwkCYhId8wymJRQ0ar/9isql8JZjttx3yKY4DMdPkn7n3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8204
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:mid,amd.com:dkim];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 87DD5583EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 14:59, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 02:52:53PM +0100, Christian König wrote:
>> On 1/21/26 14:18, Jason Gunthorpe wrote:
>>> On Wed, Jan 21, 2026 at 10:17:16AM +0100, Christian König wrote:
>>>> The whole idea is to make invalidate_mappings truly optional.
>>>
>>> But it's not really optional! It's absence means we are ignoring UAF
>>> security issues when the exporters do their move_notify() and nothing
>>> happens.
>>
>> No that is unproblematic.
>>
>> See the invalidate_mappings callback just tells the importer that
>> the mapping in question can't be relied on any more.
>>
>> But the mapping is truly freed only by the importer calling
>> dma_buf_unmap_attachment().
>>
>> In other words the invalidate_mappings give the signal to the
>> importer to disable all operations and the
>> dma_buf_unmap_attachment() is the signal from the importer that the
>> housekeeping structures can be freed and the underlying address
>> space or backing object re-used.
> 
> I see
> 
> Can we document this please, I haven't seen this scheme described
> anyhwere.
> 
> And let's clarify what I said in my other email that this new revoke
> semantic is not just a signal to maybe someday unmap but a hard
> barrier that it must be done once the fences complete, similar to
> non-pinned importers.

Well, I would avoid that semantics.

Even when the exporter requests the mapping to be invalidated it does not mean that the mapping can go away immediately.

It's fine when accesses initiated after an invalidation and then waiting for fences go into nirvana and have undefined results, but they should not trigger PCI AER, warnings from the IOMMU or even worse end up in some MMIO BAR of a newly attached devices.

So if the exporter wants to be 100% sure that nobody is using the mapping any more then it needs to wait for the importer to call dma_buf_unmap_attachment().

> The cover letter should be clarified with this understanding too.

Yeah, completely agree. We really need to flash out that semantics in the documentation.

Regards,
Christian.

> 
> Jason

