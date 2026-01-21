Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hlOlJauVcGmZYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:00:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416FF53FAD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1F710E716;
	Wed, 21 Jan 2026 09:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D/gS194R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013021.outbound.protection.outlook.com
 [40.107.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE39110E2BD;
 Wed, 21 Jan 2026 09:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKEpkpwr8kzf4Bv5unyhllFte8LSFPsNmtq7GNvbdsJN+/vlhkR6fGvnT/7BUQvOTMLYdU2l65XV2MVtsFdbMvU/qsCcybweDBZBvp4v8NEFQ3d8om2kO0Ue7yJLwSyd1pOBveN4dTf+fnmwTDyRpwK/QcR7LTx0sLZidXqpqP8QUxvpJfCFFbguSkIurfl1GP0C6HrN97ppi2A8X2L+C7wUcvEgIQ79snG7SsgZZ6edHdoLnuBWCJ7PNTPepXlboCwTDjTEzk4hkGhHvoHgwULV3yxUabUeZDiZatxqBGnQOn5hjxmVRdKgLTnYGzmJvZ4h7KKzrFsFYZS7I44ABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYipCjYA/WvGERMMwAV1PwxKeo8l3ViBZGkBjH98cX4=;
 b=xRafVLmtMzrF/bpOGnjbXjzxGY1ZZ+U4DPbDDDOMLG52f6HY/I1BHVj/EXRW6tN9M9fusj1XNEcjP8+OTvXQ+KZe/b6EKVa2Gv9gg36w4cEhlTadrPCupoq+diK0g1+r32brcTQJhQSLCiinBJgMlZwo+oldIFDdyr/n6J8YpGBiX7zchis3fYr5O2kM0o6uWuBaZ/S7h+i2GE74O0pN+qDLbFNGOXPq29lPOl7+tg47cSWfVNGi1Qj6dJoZ3yfLQFHkF5Yc7hpg2k5n3KhwxBCu/WJ8g1PAuIRaAOUgaToPekurQlh3XAuN18Eitg7tqsPpP1s8SBs0bjh2X1SN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYipCjYA/WvGERMMwAV1PwxKeo8l3ViBZGkBjH98cX4=;
 b=D/gS194RpvB9AxiUKYvz9nXcpxEYdhbDf5efCi48j3qBtV4N5n9AW3F+bg/P9m9mofdxK2pFcB9ZiVwLLW/A3CNHLrzJNsieIkATE6y9umhx6EDHCmQtIhQC2euPGUTwC5k+QAkGEodgG/DV8w+wd2uyfHfDI0dyK54wU3Q50HA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:00:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:00:18 +0000
Message-ID: <4fe42e7e-846c-4aae-8274-3e9a5e7f9a6d@amd.com>
Date: Wed, 21 Jan 2026 09:59:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dma-buf: Document RDMA non-ODP
 invalidate_mapping() special case
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
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
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-3-b7e0b07b8214@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260120-dmabuf-revoke-v3-3-b7e0b07b8214@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c2316e-592d-489b-aa5d-08de58cb8028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTVNTWoycVlROVNYdU50WWM0QmhVU2ZodGt0bG5kOHRoTXBwckNsaWRmVkhm?=
 =?utf-8?B?b050bS95bm9QOHJnWncwaHZMbWJjbDVWRFp6aXVwR2tteGVkSmVFdlJlbFpJ?=
 =?utf-8?B?anJLTHo4SW4yeU9QKzJ3T2o3bE9oaDIydVM0QVZKTDNBU3J2WmlVZ1VESm1S?=
 =?utf-8?B?SnI1WlkzUVdkRDJKY0hsOGl6YS9KNXRwLy9Jbm9ERUFzOTR0c0plOUJHUzFI?=
 =?utf-8?B?T1dYeHcwTER2TXFra1I5RE4vbnc4b1NCOEo1TktFV1pVMDI5dDZNK0lBR05C?=
 =?utf-8?B?NjlhaTZjYnpYYjU2eGI0aGJkWGVGbUI5bCtPaXF1eHdxSS9iNklxYWRDRmNP?=
 =?utf-8?B?TjMrMjZkYUVJcXlKbVFXWWw1V3pjazlVRUJjcWJUcVdBVzJkcGEyRmsrSFht?=
 =?utf-8?B?cmd3TzJGbm9PYVU4a3ZoMDR0OWUyNFp0MjBuYnZ6aTZ2OEdla0YrU1hZMXNP?=
 =?utf-8?B?eW1KZjhGbXl5WTJ6NVdTSHVaWXVFZ0RZcmJ4clZjMm5aTHliM3lwdjlpZVNq?=
 =?utf-8?B?SFRxSFVNWUwxaTNDT1poSTRlRzhwM1JsSHJkODlQb0swVDVqZEk5QkxXRll5?=
 =?utf-8?B?YUw4K2RSSmFKcDNjdnQwek5OTnkxWkEwOUhGN3Zkc0lDdW8xL1BlbTNES1Vs?=
 =?utf-8?B?enZXWklCbmhWMDdLb09Ra3QrdUE3R1FGRklkRDRNQ0pqYkliTTFrU0oxaDQ3?=
 =?utf-8?B?dmRnUlNXb0pORzF0eXJqSEdoVHBxYkltSElWb1pCcy9ZNkxDbW83U0NOY29T?=
 =?utf-8?B?TjRNK09rSXEzVGh6c0xvNHc5TktmM0R5MzlaTkxIM1I3OElBa0N6cUR2cUcx?=
 =?utf-8?B?UEtxMGVBdDRBTUIvT2ZEZ3VmQmgyeURPYnZvZUZOUmtNY3RabTl6TkYzMytC?=
 =?utf-8?B?Sy80SC95QlBMYkFSVk85VWhUVlBrV3BmN21ka295dWR4cW5IY05ETGlSS1RN?=
 =?utf-8?B?bFZmODFlYm02bVA4cXpSSWhucG1GVmZqR3hlb3BheHpOSFlSYUU5R3gzQzVh?=
 =?utf-8?B?anRtcGltQ3BaQ1A4WWVBb1VvQm1tWWMzQTlXU0c0c3AvWSsvaThnQk5MdUo5?=
 =?utf-8?B?Y2hhR0lCYjZDdFpLSmZkQUVnajR4ZDhDajNzQ0wvQTRhNHM2ZGhtNk02dWFN?=
 =?utf-8?B?OW4zeEEyaFBiWTZ5UVkyKzBieTJvM2g3WWRjSXdkN1VCZHkvQ3U0b054RGky?=
 =?utf-8?B?M09obUI2OTFvWlBieHd5c00xTXJ5dXNrbXZiNnRMazlsSkQ5em5uN09sak1v?=
 =?utf-8?B?TzZmQ1lxWCtuRE9GOERoei9qS01lbEw3cWFUeWtOS1VJRE8vQ1QrNzB0TERo?=
 =?utf-8?B?S0Rac2t2cHhjeXBvWW5VSkNaQmJmSjJISGJISDFDKy9nbjdrMXhCOVA3RVI5?=
 =?utf-8?B?TmY4ZXh1em8zSHJpdERGN01uQ0haUzJ5UU9KdFpnRFo3dk1rcVAxNWxHelA1?=
 =?utf-8?B?c2RYWjRodDZ4MkpSREsxeldZNXdtdHVEMk9BUjZHNk0vNkhLeVRSTXhSSkJL?=
 =?utf-8?B?bEpTcTgxNXMyZ05OQWFJZnJIQkEvTTEreDJGQytzUHc2MitRZlArbFE1V2FP?=
 =?utf-8?B?Q3lQL0F2Q3pueHB5Ty9uVC91bkhVTXNSL24randheitndU1BTG9yRU1XbUVm?=
 =?utf-8?B?UWhRRDVDTHpjWVA1UmZsK3kvMmVvUHF0YkdPSUg1eEttYVBkdHpETU1KVDRr?=
 =?utf-8?B?MEMxS3dFU1NWMHgybG5sd0FmcUVTNjlKcUp6YlhDK3NFSmd2WXA1ZUhSZTU3?=
 =?utf-8?B?UTQ2SkN1bzAzeTh0TVo3UXZxd0c0NFpmMVdjVWpVbEJRVUdFUGZ6RytpalFR?=
 =?utf-8?B?OWt0QTAvdWt1K3pUNlJYd1U1T2pEV24xSUc3bnpRY1VuUDEyOU5Ub2NlYVNu?=
 =?utf-8?B?ajhmU3RGUFpNVytwbXNHazhpRlJVSUJCcGkwMTZQWHhkMVd6cFlTNlFGdWNO?=
 =?utf-8?B?ZGJka25ZQmRaQW00d1I4YmFzYTNycGpINkh4cFZXTzdQck0yM2JEVVB6L3FZ?=
 =?utf-8?B?S1Mya282RkhFUXNPT05Xa0ZuaGlPVjR3QUFiQ2hIRzFpV094c3pEY0NEZCt1?=
 =?utf-8?B?TXIvREt1Z2xxbmJPSi9Wcjc3R0tMNjBXalM3bWRGRVprOEprc1MrTXBsb0o2?=
 =?utf-8?B?ZU0vbmhEY2Rzajg1aUhDZ3YzcisyS0prZ20xSlFsQ1RObDltREE1TXc3NXRp?=
 =?utf-8?B?ZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkxzRXd6cnozYkhnam1mNEcyWnZpaENKZmdwU1g5QnpmYTJ5cjRUWDZYelhG?=
 =?utf-8?B?YXNlbHRpeHBURkNrY0dlUTdMV3RFYndQaUdXOXJHZzdjQUZYb0ZxTmNSZ21j?=
 =?utf-8?B?QUcxOUlseG5wMDdPMGE2dFFuZERydzZtTnR2WldSeHQ3dmx2SWFUNWFJeDNh?=
 =?utf-8?B?SVFTU04yWXhzRndVNlNrMkFFUHZnUHd1aVJZVUtpSUkrcGxXcm52UDY4SGVO?=
 =?utf-8?B?UTRHbjJLYjc2QldkekN0Z3RPVVNkRkgvZmYvTjFPUjcxTFRvbGVnL1JycjZC?=
 =?utf-8?B?eE1VMFk0UTJZS1k3aDZITlVvMEI5d3R5ZjlRU0Z2N1VNZ3ZHREQrV2l2dnlh?=
 =?utf-8?B?M2JyZXJjZnVZMVJ1K1hUeTMrekFYZG1HcVYrNDA0VU9wdU9vTVN2WjI4bUgx?=
 =?utf-8?B?Qkp1Szh3NWt1YXdzNzJndHViaWlRN2dCR2ZSdDR6RkN5bzNpQjdYQmN4emtK?=
 =?utf-8?B?ZzRBTTZTN3dWL3JEMlpBc3d4QnRtMlc0VENXV2hKY2FsLzlNQTYxeXJNcFJz?=
 =?utf-8?B?S0R3YnJ5SGNJNDgxK2FhVFJ1WXkra0FUaHVKanpEdFRyR3l4M0wxTzF1NElG?=
 =?utf-8?B?dCtoOUZoSE5qQ1RUZEc2WVlzM0svTGU1ak45Tk10Q1R1L3FrM0Z0Ymx4RmN2?=
 =?utf-8?B?V0FtQm5MQXd4UXIybUJEQkR3VEJudzhlcHFGeGV1QWphN3dPK2tqaUtlS3U4?=
 =?utf-8?B?WWZnLzEvNEJJb21PZGNJYVBCcU43citSejhEb3dVOHlPbUgwNHFZSnlWcHdD?=
 =?utf-8?B?TWlaejlGYVNFSFdvay92TURubWhYZXlaNTRZUXJtZWY2U1Z0WDhvWS8rVUUr?=
 =?utf-8?B?QXB3TGt1SlhsdkFnR1Y4YmpxQ3UwSnpiejlUcTA4bjNYSExNSDU2aWRpWG1H?=
 =?utf-8?B?Y0R6YitoaUpZRlBGZlFHa2lFK09rdnlQaXc3OVJnamh1K0o4NzFaYnRYM1Nl?=
 =?utf-8?B?bkR5ekJ2dTBKOVpDZkJaMFRHVXU5VDBzSFEwZ3Y5R0pJUnlPdTlVWURHMXky?=
 =?utf-8?B?NEo3QzdzaWw2NnZhRmNIdTNzRVREYkhJeXlRTFRJVURvVXNHZDNoc3JUTGdn?=
 =?utf-8?B?d0g5ckFyS01nSEdHT3Q5NTNiM2dGOXUrYWJYUlRiNlg3VEExN0FQSFNacVBH?=
 =?utf-8?B?WmY2Q0o0bWVRd291VzlNQjA3Q3JjaTVhNUR3UDNncHdEaWY1QjJmdkhoUzYz?=
 =?utf-8?B?K3N6RU5rQ3dqU1hpdjI0R3NleWwvRVZPZ2NtNWt6QnN0THVvWmYvSCtTWUdN?=
 =?utf-8?B?YklnWWg5NFp2K1hBb2U2REhMMVAyaEs5L3dBdnFqeWk5M1Y0STdGdDA5S1Bj?=
 =?utf-8?B?czh3ZU41NW8vWlVIM0JUbHRRbXA0ZUFaekFFWG9uUGhkSFBibVBQMFMwMXRr?=
 =?utf-8?B?OGRvWGVFcFJ3d0ovdG9FYS9HYUJsUi9XVStrbVltREVaTUFlZzhzdFVpaDN0?=
 =?utf-8?B?NWloMGdSa1U0RHhVQjZCMjEvOHM1bjZqdWN5Ky9tdVNoakF0aVlseG1kSW1y?=
 =?utf-8?B?UUZ1RWpEZXZHenA2UUxMa1dwZjE3cEVKWWdpVVJZWlZZeWY4YTZwS0hHcktD?=
 =?utf-8?B?NloyaWQxTU9jMWU3bVJtYWxLZ21QUjZ6Zi9ualBXTGFib2NHZTFjN04rdnBq?=
 =?utf-8?B?RzZCaUhReW5vYitvdkEvdjFlT2JEUElSNE1qUDF0MUFDOVFCcUplR2Y3bmc1?=
 =?utf-8?B?emFWdDhzYkRtWGJGOHVtTWNwMVNjbU8rN2FIK1lkL3BDdXA4aGM2cnNaRnlS?=
 =?utf-8?B?dURISGZCM3pheE9NV1VnN1F3dllmemNQWmF6UDZNVzRPclBCeVo0T2VhYUlO?=
 =?utf-8?B?cW9SaWRNMVBWeityNDFLUnRvSlQzbXVqOE9IMHd2bjhva1cyTmU0MDAxRUNw?=
 =?utf-8?B?clBYSitwUUlybVBsU05JbWt4cFVNMVN3M3lnczN5bTN4d3QrWHo4NXVLNk1B?=
 =?utf-8?B?Y2VlblFTdzIvdHBzZ2duTmNqNW1pZE9ZeXZrcmxycUhGRFBMZWI5UE1BeG1E?=
 =?utf-8?B?N0dhQjhYTEFYTTNqVGgwdlkvVm9DVUEvTGNtd2MydDNSYzFOZWRPRHhYbVFB?=
 =?utf-8?B?TnNDSUUwNVNWdzFrY0lUdVVoOFZJRW8xRWRUZTBFeGNBK0FnemVZdG9oS3I3?=
 =?utf-8?B?QUxaQjViL1B4U2hjb1Rld21tMWZsK3BaZmZaNTdIUFU1Y2pmVUFxKzVBSGlv?=
 =?utf-8?B?cFFkazJtYUNvYStBOHd6WmIwU3F0ajdPMG9lckVQdVEvK3NPcWthN1RTQUN1?=
 =?utf-8?B?anBBZzRxQkxmNFJNTVB2MXYwMGZHc1BMcUlhVDBzdW9qWUpCdkZ6M1lLb2Z5?=
 =?utf-8?Q?IEF1vO3e+GSvN4J5cc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c2316e-592d-489b-aa5d-08de58cb8028
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:00:18.7370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suoGQVK1Q7lGfhDo/OTY3zPF/SPfKr0lOyQmnM+OZqk0gpjwscDqdJ4R70b7s5Pn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,amd.com:mid,amd.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 416FF53FAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 15:07, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> The .invalidate_mapping() callback is documented as optional, yet it
> effectively became mandatory whenever importer_ops were provided. This
> led to cases where RDMA non-ODP code had to supply an empty stub just to
> provide allow_peer2peer.
> 
> Document this behavior by creating a dedicated export for the
> dma_buf_unsupported_invalidate_mappings() function. This function is
> intended solely for the RDMA non-ODP case and must not be used by any
> other dma-buf importer.
> 
> This makes it possible to rely on a valid .invalidate_mappings()
> callback to determine whether an importer supports revocation.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf.c             | 14 ++++++++++++++
>  drivers/infiniband/core/umem_dmabuf.c | 11 +----------
>  include/linux/dma-buf.h               |  4 +++-
>  3 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index cd3b60ce4863..c4fa35034b92 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1238,6 +1238,20 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>  
> +/*
> + * This function shouldn't be used by anyone except RDMA non-ODP case.
> + * The reason to it is UAPI mistake where dma-buf was exported to the
> + * userspace without knowing that .invalidate_mappings() can be called
> + * for pinned memory too.
> + *
> + * This warning shouldn't be seen in real production scenario.
> + */
> +void dma_buf_unsupported_invalidate_mappings(struct dma_buf_attachment *attach)
> +{
> +	pr_warn("Invalidate callback should not be called when memory is pinned\n");
> +}
> +EXPORT_SYMBOL_FOR_MODULES(dma_buf_unsupported_invalidate_mappings, "ib_uverbs");
> +

Well that is exactly the opposite of what I had in mind.

The RDMA non-ODP case should explicitly not provide an invalidate_mappings callback, but only the dma_buf_attach_ops with allow_peer2peer set to true.

This is done to explicitly note that RDMA non-ODP can't do invalidation's.

Regards,
Christian.

>  /**
>   * dma_buf_move_notify - notify attachments that DMA-buf is moving
>   *
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index d77a739cfe7a..81442a887b48 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -184,18 +184,9 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
>  }
>  EXPORT_SYMBOL(ib_umem_dmabuf_get);
>  
> -static void
> -ib_umem_dmabuf_unsupported_move_notify(struct dma_buf_attachment *attach)
> -{
> -	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> -
> -	ibdev_warn_ratelimited(umem_dmabuf->umem.ibdev,
> -			       "Invalidate callback should not be called when memory is pinned\n");
> -}
> -
>  static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
>  	.allow_peer2peer = true,
> -	.invalidate_mappings = ib_umem_dmabuf_unsupported_move_notify,
> +	.invalidate_mappings = dma_buf_unsupported_invalidate_mappings,
>  };
>  
>  struct ib_umem_dmabuf *
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 1b397635c793..7d7d0a4fb762 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -458,7 +458,7 @@ struct dma_buf_attach_ops {
>  	bool allow_peer2peer;
>  
>  	/**
> -	 * @invalidate_mappings: [optional] notification that the DMA-buf is moving
> +	 * @invalidate_mappings: notification that the DMA-buf is moving
>  	 *
>  	 * If this callback is provided the framework can avoid pinning the
>  	 * backing store while mappings exists.
> @@ -601,6 +601,8 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
>  void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
>  				enum dma_data_direction);
>  void dma_buf_move_notify(struct dma_buf *dma_buf);
> +void dma_buf_unsupported_invalidate_mappings(struct dma_buf_attachment *attach);
> +
>  int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  			     enum dma_data_direction dir);
>  int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
> 

