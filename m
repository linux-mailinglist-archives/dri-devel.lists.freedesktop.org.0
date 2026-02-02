Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKhqCiXBgGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:22:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB9CE1FF
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8520E10E2CD;
	Mon,  2 Feb 2026 15:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gcWqT3Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012041.outbound.protection.outlook.com
 [40.93.195.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB6310E1C2;
 Mon,  2 Feb 2026 15:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAoKScbrcFUb8jqlZrlVoLvihGVz3Gat1WYlJHFZ/QjqRsd8Y1C4FS0ALmXQ/uVHePlxMgCSIjos+rb1kJYYWlLLEPLaSlhu7s06d3KfP3XywVvsg87EOsyXzOaIOU+jSFiBui6Dcfa14tZzxsIbPUvWbRBrD4tst7kz8xp7a+TjJSPiJuwyhtGcBNEspGqIeVixqXSS6AB7CCjigTj28vH02VDsrWNaLmAfDUUa00yTQmpDMflgEc4HbtRRSv9RP4szBAKdIBCgkOOBKvgW2K1S8P0LBRZqxZ/YE+bQ2sCpBJTcqgAT4xtcoEZymtdbvG5NsoKLHLcAKS9ZuCb5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZgM/l9s1mJElKG/r8xRqRdVfNyN2EnhesVeUXexMQw=;
 b=b3yc6/9Bi7A/mDv++TKIkA5/3J7Yc+21C0QfEV27SnAYVshkJrUPUBaJjacwPwBhXyfwOxbXBHf3BFicK7outH6ni6cqjecQbZhcef5YK5WQZeeBwSv+C1zOHJuUpcAonroDm23SVq60X65M54iGffQsTo2htZkWVT4GUNLJp1aNZ3RiFK7Jw7W9AMXMyOD3IkF8qM6ohkgmMhicesGuUUAalUN+cPxff2SyyRloQcGwqHnvXgRlrwYtiT3mj/9piLkbxT2FigrPOxsZjRoPeBgetZ9c6b3024SFZXMSafqktfwch7sQS2paLyngDquldgK5Cvtef9fU7yHPeA3qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZgM/l9s1mJElKG/r8xRqRdVfNyN2EnhesVeUXexMQw=;
 b=gcWqT3RcsAhdUD3YhWVZSSQc5H0D0pZn1oRiVDhj2oI4Y3+ZGJrrCiWqphiIafWFKRftJwkX/api7b0eCjUxDu6RdFlHhawdHoX6TfRyOb46EE0ddO12Qli9Z+yB3FZCU47HAF7dggjzUKOGj6Js5xSbGdDlf3hdkRkF9lXAd+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:22:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:22:03 +0000
Message-ID: <44ec9689-045e-401b-b9cc-17abdd938bc7@amd.com>
Date: Mon, 2 Feb 2026 16:21:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
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
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <31872c87-5cba-4081-8196-72cc839c6122@amd.com>
 <20260130130131.GO10992@unreal>
 <d25bead8-8372-4791-a741-3371342f4698@amd.com>
 <20260130135618.GC2328995@ziepe.ca>
 <d1dce6c1-9a89-4ae4-90eb-7b6d8cdcdd91@amd.com>
 <20260130144415.GE2328995@ziepe.ca>
 <c976c33c-4fa7-4350-8dcc-a5c218d1b0d6@amd.com>
 <20260202151221.GH2328995@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260202151221.GH2328995@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:408:fd::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: d94b6e74-5ebd-4842-2de3-08de626ed12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZytvcWJTM0ZEOXNBaUllWkthOWZHZXozc0xmaWwvNFRjelROdDRDOEN3V0Y1?=
 =?utf-8?B?Z1RlT3krakJPdUdWeE51V0FsYVhyN09KZTArSDM2WnVuVk5GbWo5Q3RSRW5D?=
 =?utf-8?B?T3llUUhRbUZlL2l4Z25LbzVWNklOVFpoV05uZEVmQmVzc3lPMFdKRXZyZEk5?=
 =?utf-8?B?YWQ4RzVXRkxFY2xFVXdYalNLdW1Qang5QXoxVDZ0QUlDVFZmb2RBWU5ORVNU?=
 =?utf-8?B?OVp5ZEVzaFkxaDQyU3ZVMHZEbE5NU3dlY3pvTGhFaFVxN3R1b1VBZTV5MHBS?=
 =?utf-8?B?cXVZaVd1TlZIc0hNek5Pdk9TZEhkWTU1L1I0a2Y4cEtPRDkwaHMvOEhJbklO?=
 =?utf-8?B?aHNEQ3Q4VlZhNlF1blVlekwzUTRwdWc2d09nd2JyRFRwVDEyV3IvaExYZWJV?=
 =?utf-8?B?UnhmK01LSm15VHc3YmNRZE5XVUhIUVFNdlpPK2JPR0ZUMXFOZm5EZ0pmQW9r?=
 =?utf-8?B?ZFNScHUvSlVlT2h4S25FRTlxL2p1cU9paytJWDhNdjFmcEUyVFdEVUp6cjQv?=
 =?utf-8?B?RXpzM0NvS3pTQldBT0xNNTd3YURQZ3VlQXIrRnBSbWl0bWErZGhFamJnL21W?=
 =?utf-8?B?ZmJ0b05SVWNrMU1OZmdQTjdFam5LUmpGZ3BlMURZdk9BS3laNEVDcFN2OHZJ?=
 =?utf-8?B?WTRUSkx3MFFTQWNLM0RvYnZwc2JPSFFwR0VKN0ZBb0Fxa21mNHJGbTNkeGo5?=
 =?utf-8?B?OHB3R2dTN2VSTTV1OHdra25SS0s3dTFTRW5EK2lkU0dHekQzVEFLNzNGTXg0?=
 =?utf-8?B?OTNtT0U0SnVhV2xNWjEzMElYRDJoRDRaaXJEd0NCOTlranRqNFoveStQUmtG?=
 =?utf-8?B?M09DU0p2M25QaFVCZFdYYThhMUMxdEtYYXRJY3dWelNSS1pWWlF2K05Xc1Ir?=
 =?utf-8?B?RVZGSE55aXdJakhPYkhvVEJQRXpLbkk1bUVKMDM2RWl5dDRIQzd2cUlQLzJ1?=
 =?utf-8?B?NlFGTVVEN0RLY3h4c1VhRHFtS1dRcVNLNjRYOVVrc2cyWUtTYUpvWlBLazdt?=
 =?utf-8?B?akN1TkFQeXBaY1dMa1o5MjJKLys5UDJrcnh0OHdnTUpETFBjUUpBOFBWUHQ2?=
 =?utf-8?B?cHljT2t5NFMzcmszbys5YTlnSkxML3FMUDV6SUNpMmNucWRITTZBMFd5dmNY?=
 =?utf-8?B?VUZCcUovZDB6TGRaUjM3cjJkMEZEOGUvZGVQNjdPbjRGZ1ZGK0tOVFE0OUg3?=
 =?utf-8?B?UnBPdWhMZjM2akpTUjlMYXhKek9oTGpoZi9JQlU5UmI1SHRHbWhyNW04OEVF?=
 =?utf-8?B?MzlxaFZnZ3U3ZDRGSUhOeElhODduYW03UFk0SC9qc0UwNmw3aWMvaUExU3Jq?=
 =?utf-8?B?cXhWbWNhNFhYNjhJNlNmN0MwMUNFcXgzWldrVVBjQmFKbEo3aDJydS9JdzNq?=
 =?utf-8?B?YURTT3F5ZGRaN0lYdUptVWE2ZmVBdmlkazJpUDlLUkZsa2dCekI0eFk2OWlm?=
 =?utf-8?B?aG9NeTFJUEc1b2FpZEpIcU0wbmJFUG1OenlGL2NLMklkWlY1bkZJQnN2ZTRK?=
 =?utf-8?B?cGVZL3pFQlhheU1qWUVFazNMQVhpUWJCTUpCSXgvNE1pWWpsQ1V5WENkWlQz?=
 =?utf-8?B?RDNBWllOdzhMY2tvNUUvR3FBTHlOL09Ga0FGQjNoMVRIRnFvV0ZmcGZVOVdh?=
 =?utf-8?B?cmlQcHBZYjNZRCswNEp3bjRyTlVPYzk4eVNZc3pMTkt0bm5jb3dDQUdxV3cr?=
 =?utf-8?B?cXlONDcyRkIxaGEzWDZBNFBwdmVmZWNPTUdkb2N5UjlPZkE3MTNuTGZDRWhr?=
 =?utf-8?B?Z1IwbTdWNlQwWTdSR2xRcWxidlNXbFdFT3ZTdXEzMUIzYXJTOC9OWWI5bU5N?=
 =?utf-8?B?UnNFWTBCVGJVOVhJdkRxZTBMSXdSNkhlUlJuSmlZUDJYaDVrdTduaTZUL1V3?=
 =?utf-8?B?SEwvMHRrb2txODZJT28xS05hT2NKYTk4RGFuQkJaQVhXQ25qSDhrVytzVllo?=
 =?utf-8?B?QldQQmNUdk1rVGE5VkZLUzRXU2ZuTm92S1B2cGZnaWxCR2JNUmt1TlZNNHg4?=
 =?utf-8?B?NjBYdTY2Nmw5eFg3Tlo4eUNiYmZzNlY2N3plTTQ5UmNJdVZHVEhEVUk2VEFQ?=
 =?utf-8?B?TlpabGVCQTJqeEdiam1FdktpOWw2cUR5b1AwTFdjV0NaOElhZUdrYlR0MFZK?=
 =?utf-8?Q?HBno=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yml6WWZSVzlKSzhXa01rc2hRTUdlcjFVbllxQjJ6WFFzeGpXWjFLc3hDaTVO?=
 =?utf-8?B?SUkzTUM4bjFkbWM4d3pnOWc3RS9ub3N3cGZGSnU1c2V0M3Jta3BkeFdaLytY?=
 =?utf-8?B?a3BpNWc1dTl2U0xHYm41NFpaMHBnRkVpR0VUSWVDb0Vra0VQQUNIeDl3ZGo5?=
 =?utf-8?B?bmt0UHZKUHlhRXdHNGJjVVM1SUJ0TUdXaXEyRnNuaTFxMytsS0JSclpVQ0gy?=
 =?utf-8?B?RCtDTU5RTSs0ZDhWSDRLUlltZmV1dk4yRXZHeTQrT3YydWdVOW1tZ2Y3MjRo?=
 =?utf-8?B?N2V3am5aTmNHQ3pOZnl4ZitwRHRXQUxPcm1WWDdjOTBMRHlXNkFSVEh3dVUv?=
 =?utf-8?B?V1dCN1FCSnNTWGgrdk80MTU2d2pCMi9WTmNMcVZEYlF5MGIzOUNpMW5pNmRN?=
 =?utf-8?B?QlRXNE9pMmprUmNUQ0hVQ0NIamJ6R1FOWVlxVkY3TktGYjRZZDI1M2xOOWg0?=
 =?utf-8?B?VkNGZkJmQ2FDR3hvZERsOFNjb0FBb3ZDR2hsYzU0KzhPMFBHaU5qZm5oV1JK?=
 =?utf-8?B?akkzSVEzdnM1VlRQM2dOdFVxVnE4M1FuNm9lNER5RkNEQTRKT3RTUmVLemxD?=
 =?utf-8?B?R1hzbVQ3S056bDY4aHA0K05KbXUvMTBEZ3AxNGxVZzJnYWlpckxsbHpoS1Qr?=
 =?utf-8?B?ZjdLMm8zZHFzaHBCRWdMRVJKV2JGdkRKQVlBaExnMHJaV2dyOEs0V1RjVXZN?=
 =?utf-8?B?dTNuaEM0UWduNWQydm9uZjVER0MwTGFURldYcWxUTDluOG9PTEY0MEFkRmxS?=
 =?utf-8?B?bUVCRnhRZFo3MTlNN2NxTzdJZk1BNmljcStFT29xR3NtL0xUajlMclNvcjNX?=
 =?utf-8?B?Y0xwdmMzWmtDOGFMQ2RLUnkwWkFmNEhGaklUVTl6YkRLU3RDOTg3dVM2SGVF?=
 =?utf-8?B?TkJpdlZYZ3FjdmgrbjBjRmtTdXc3STJVeHRsTGdGYnVkdVBBbVdBWDROWHZS?=
 =?utf-8?B?YzJ6cUE5Yk12czdRQmJUWUdYdnNNYmxOdW1MWDM5TjR2Mmg3Q2o5K1NmZkNl?=
 =?utf-8?B?MVRoRDlZSys2M0ZLcnRwRzB5SHo5TTVOczBKbnY4L1pZdTB4QldxTGMweUtj?=
 =?utf-8?B?VE52MmZHZ0dvQU5oS1lyQ1M3eXpJTURzOWEvLzZtMThzYzVkWWx1Uy9JTW0x?=
 =?utf-8?B?WFJVY0RCcG5vU28vcVBiRU1xTWtZbXl0TXBQeVhkdkVqQXJNVGQycXBpUWJi?=
 =?utf-8?B?VUFHdHpCZWxRaGViWExNUHhFNHJ0T2VnckRvOUplMEdILytSRytxMVlKM2xI?=
 =?utf-8?B?WURxeEJZYjQyTk9QMDF0ZWs0MThjeHRadFh0VUJ2VDZTa1Z0WmVLQ0tMMUpU?=
 =?utf-8?B?RTRrMmhWVzJlcWIvbTFLRWRzaTBMNmZSSkpIY3F1aytLTXBqcFdNKzg5dXhv?=
 =?utf-8?B?TVplTk1jZ1dJSHM1a1JIbWp2Z2lScy9yMXhScStnU2hjbUpjSFl6LzVUWDE3?=
 =?utf-8?B?V1lXZWlOdUl4RzNseWdiY3hpUDVTeGRoOGVEdXJYbnp4NWUrTlUzSVhwMmVk?=
 =?utf-8?B?dlVrSzN2ODk3U2Y0bmdua3FSTWhSUjRwRlVxdUFHZTNXd3I0QnMvSklxWk1x?=
 =?utf-8?B?NCtDN2I3NUM1RWNONEVqd1VqM0lHUDdZZkRmZzVwWUV0NHdkNTZucW5rZ3Jq?=
 =?utf-8?B?YndtR1JHczlTQVZFbjZFaVF6OElSYlkxR0h5cGUwbjMrTGY1TTVvTGpXMEtW?=
 =?utf-8?B?alExUjA4L01CTklJYk4wcWV3amNrMmttSmlNU0hIMG1aZHlBKzRxM2prY3Fl?=
 =?utf-8?B?OFRwN1NhbjBSWTVJTjcxbityS0tpZ2V2eDZSY2haV3dVcVFKVU1iZHJQWHE5?=
 =?utf-8?B?NkNjTWY3WmRya3BJS1g3OG14dFpOREZmdHdrUXpwU1FQUUpOUGR0a0E5MHhB?=
 =?utf-8?B?djNmSlUvbnc2cm5Ua01CdGp4TlROc3pGT3FWTmp5LytEM1R6eFFkTVpXSDB3?=
 =?utf-8?B?aDR1VURTWDBUNkZ0QkVHTHFGcXZTTW1xNzY5cjR6ZmQ0amF1THBIZTRPOFRX?=
 =?utf-8?B?Ny91M2xTS09LbFBjYkwxQnE1L0FpNGhHVnNaOE53SHkwdTYxeWNjK1VNdkdw?=
 =?utf-8?B?ZzFlK21KcVp1Y0hDS2dFYjh3TVFxZWt1ZEVOQWJPdDlyU3p1TlIyQmxnWTM1?=
 =?utf-8?B?M2RXeEpycmVXdnp4aW82Kyt6OUsvSnNzeWRpYWxlaHN2TzZObCs2akVWQ3Zj?=
 =?utf-8?B?Nm8vc1pWQ2psNUVrNjF2RldvMzRlSEEwWmRJQ3Nocms5ZzMwOHo0VVRpdDRk?=
 =?utf-8?B?Rzg0NGo2WFNDeUlFcDdwZU82b2ZaeTFybW04WlBRVmxUQTh3bmZSOVdob0ZK?=
 =?utf-8?Q?beX5pLs/j5nZeVxzoS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94b6e74-5ebd-4842-2de3-08de626ed12e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:22:03.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6XdeO46B+oO8hCBuBsiV6Caj70smIQyXHIZPR3G4FmR4VWvvpqKdh1Bs6OjIkhX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: C2DB9CE1FF
X-Rspamd-Action: no action

On 2/2/26 16:12, Jason Gunthorpe wrote:
> On Mon, Feb 02, 2026 at 09:42:22AM +0100, Christian König wrote:
>> On 1/30/26 15:44, Jason Gunthorpe wrote:
>>> On Fri, Jan 30, 2026 at 03:11:48PM +0100, Christian König wrote:
>>>> On 1/30/26 14:56, Jason Gunthorpe wrote:
>>>>> On Fri, Jan 30, 2026 at 02:21:08PM +0100, Christian König wrote:
>>>>>
>>>>>> That would work for me.
>>>>>>
>>>>>> Question is if you really want to do it this way? See usually
>>>>>> exporters try to avoid blocking such functions.
>>>>>
>>>>> Yes, it has to be this way, revoke is a synchronous user space
>>>>> triggered operation around things like FLR or device close. We can't
>>>>> defer it into some background operation like pm.
>>>>
>>>> Yeah, but you only need that in a couple of use cases and not all.
>>>
>>> Not all, that is why the dma_buf_attach_revocable() is there to
>>> distinguish this case from others.
>>
>> No, no that's not what I mean.
>>
>> See on the one hand you have runtime PM which automatically shuts
>> down your device after some time when the last user stops using it.
>>
>> Then on the other hand you have an intentional revoke triggered by
>> userspace.
>>
>> As far as I've read up on the code currently both are handled the
>> same way, and that doesn't sound correct to me.
>>
>> Runtime PM should *not* trigger automatically when there are still
>> mappings or even DMA-bufs in existence for the VFIO device.
> 
> I'm a little confused why we are talking about runtime PM - are you
> pointing out an issue in VFIO today where it's PM support is not good?

Exactly that, yes. This patch set here doesn't break it, but most likely makes the effect quite worse.

> I admit I don't know a lot about VFIO PM support.. Though I thought in
> the VFIO case PM was actually under userspace control as generally the
> PM control is delegated to the VM.
> 
> Through that lens, what is happening here is correct. If the VM
> requests to shut down VFIO PM (through a hypervisor vfio ioctl) then
> we do want to revoke the DMABUF so that the VM can't trigger a AER/etc
> by trying to access the sleeping PCI device.
> 
> I don't think VFIO uses automatic PM on a timer, that doesn't make
> sense for it's programming model.

From your description I agree that this doesn't make sense, but from the code it looks like exactly that is done.

Grep for pm_runtime_* on drivers/vfio/pci, but could be that I misunderstood the functionality, e.g. didn't spend to much time on it.

Just keep it in the back of your mind and maybe double check if that is actually the desired behavior.

Regards,
Christian.

> Jason

