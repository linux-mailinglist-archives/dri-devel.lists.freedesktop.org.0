Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMfSHj5mhGkh2wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:43:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224F4F0F5C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF7C10E887;
	Thu,  5 Feb 2026 09:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rYiTvBRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010071.outbound.protection.outlook.com
 [40.93.198.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9089310E885;
 Thu,  5 Feb 2026 09:43:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBzqpQrwW93Xx/ujw4RWa0j7BY8DiIvUAdjrUwSsDJ+P0eIIB9cVY4FhDN8Etutnn+RsR3ioOCaUrwZX3IlRdN2RYjDqbopU4Z8u8OIZR7RlBwYHYljREjE7gWM1nzJAiu7BFn4246WqUZbZ59EENV8oTwdSEbvNxmiq/ZhUMTirHJ74dWb8BIyzOEv1C+y1jl53t8r7uI4O5VSFwdPlYOKlArRvpA1gG+55XwwEoxVaXzdiTx5CsO9lt54gom2zCIXv0Pq05GmNefF62wBT98eNpy4V+H9scp3wLb7YIZfe2FDitlcAA2jnLcaciB2uruGtyXxzxwd/iRy0MakmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEnn+viOKUyIwgcL6tEv7DLf/bXVt+Vs5axH08IEoFA=;
 b=goFTIhRK6LvBMpjrNIB2ezOcctospT6n3js96zDyPuhxt3zt/xu+V9HGeqyvWZs13cegTkXPY67Ui+JRb2cAhSxi2/uO3Pn7Rf2QB82g+k7IwtaMpDr6mDmJSg9gjTbhv1dus8cqOIl2Vx1DwiIcHHEphzcrGEZFI2Qdc1+WEe5WAlAtRJZQuysjXVE6SesLcZ0kCcQTY8RXtUwAfeRp/VYqIMdqfKYgUth+V5SHZO6F/QaK84t30qzdeOEUPxnQ3ilb7FamRjxaY2+6WW0A+S10WcBtnL3WTUFD+8AahRR5HAUWPvn0LiQz9uhNf7lwBpnTjXfxTBSxqD6PtlLtfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEnn+viOKUyIwgcL6tEv7DLf/bXVt+Vs5axH08IEoFA=;
 b=rYiTvBRyn9pH36jblZQpREu56I1wdTwC9IBDiDTFmJt2jgamRFR0bX8/y7Gm1gkw1l5/hYcbWHpOQwE2wBaTmZapoN4yQoTDIVBd7m8jdvn2Kju5SRd6CFS8tPSCCS0O5SHnGgXDgnwG23cxBhelXTLUq9OmLypU2cAmciidQg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 09:43:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 09:43:18 +0000
Message-ID: <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
Date: Thu, 5 Feb 2026 10:43:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
To: Alex Williamson <alex@shazbot.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
 <20260204095659.5a983af2@shazbot.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260204095659.5a983af2@shazbot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:408:ea::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ac9e62-858b-47d3-6e8f-08de649afdd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2NDTllDUTNNUXl0RTBIZFhUODNKRlR4U3NuTzBjdEthVVFiTllKK3EzOVBC?=
 =?utf-8?B?T1ZCbzhlY3F2bCtRbElOakNyMi9adWFyRnhlY3QzWSs3OGNjeU5YamduckZL?=
 =?utf-8?B?L3ByWmN6RHRTNE82OEorM2I4TS9oK1NOUTdsV0gzQmRYVFBPSDNtZ0FJbTlt?=
 =?utf-8?B?d2ZpN2tiNld2aGdVbnp4cThoNkhBUHNsYTVoSDZVL0luSTJYT0JDRDRjeWpp?=
 =?utf-8?B?bnZXVDZRUFk0SWdja3laTXlxSWRKTC85Ymhndk85NDNxU2g5QmRmNUFWZjc0?=
 =?utf-8?B?cmNNclZ2c3ptN3EwZU1uK2cyRDN3a3JSalZnQ3RLZmxWN3Bwemd1Vk8xVzB1?=
 =?utf-8?B?c2VlajBjRVQyVkNJVTB0YWdycFFMbm9xZ2htL2ZKSFo0ZmdaVkFqRG5RM3h5?=
 =?utf-8?B?SHZodnV2V1JkaFVqNFdUTmI3REI1TndQYTJ1bXdKL1BuMkxDcWpISEJESlpH?=
 =?utf-8?B?a2cyV01WWUhoZVkwUHRCTXVCOFRIQmRpQWVIa0NSUkE1bkpyZXZ5ckJqSXB1?=
 =?utf-8?B?aCtRMXpuV3JRS1dTY29PWWE2SGVNVWRwaUQ0SmZRbEo2RkV4Q0NwdDREUnJK?=
 =?utf-8?B?dFNXWjdxdlR3d1BQZWdLNjd0N3RsbzRpVnc1b1JyMlhqL1hDZFh4UDNFV0VJ?=
 =?utf-8?B?UXJkSGxmd0R3OGQ0ZkljSWhOelJMeFVSenVQSFAxeGVEU1RVSFY4bmVZSzNo?=
 =?utf-8?B?bmR2VmZHbllaSCt0cGFhY2k1U1JTNTI1TlJld0JzeTdMTVhkdDhzVk91M3Ba?=
 =?utf-8?B?UUczT0NNV3RqVmlNV2hBM2N3VDIxU0tFeWpjck90bjlVQUttckRCOVNZK3dj?=
 =?utf-8?B?NW5ybDhzVWlaZmNXVEtVL2xOTi9HYmp5aGtiWm9uazNzcGRDQzdTREpORnhK?=
 =?utf-8?B?bXAwRjJvQXJJTHp3d0lmRWcwRGd3Q0xvTTI0T2VFZ2dhL0Rwdmt3KzFqZGxB?=
 =?utf-8?B?akhLMUdUTlQyVkk2M1hOMlVZWWordDRDcFVGWldJaEpmSmJUeEJsMElwa3VS?=
 =?utf-8?B?VDlpelVKZUgrUFFMc3RLNlpxQjlBV2tNUS9CY05qMHBYazF6SHE3SGhrbjZs?=
 =?utf-8?B?VGI3MHpkdmJFN0FoMWtrck5wSTB2OFd3S2ZFUnJpdmh1TWZIaWVnazdSL3k4?=
 =?utf-8?B?YmtUa1Z0cE5lOWYrVGovS3dLaVVWMzJBWTFrcGNrODZmSE1nOEYzSC9tZUI1?=
 =?utf-8?B?YktZcUdhb2VhaGJXUDd2ZitJc1FXTVdIRWxnTSt1SmpaVXV2QzlVRjRuYmJ5?=
 =?utf-8?B?RlVRcU81TUVJQnJxVzQ3VnVRMHdVSnFjWDdQSjdTKzNQb0JtdDlhZHlUNDlF?=
 =?utf-8?B?N3I1dzlGVmZXZ2JJbGxxUGYvRk85TlZjTjRCVG5hNCs1T1p5YTVLdE9TQ1M0?=
 =?utf-8?B?OXlueFA4UXNqQUp6VHZicGNhVld1QXFFbVZicW5LRHF0cjZJUVRnTzErSVNE?=
 =?utf-8?B?UHJocFFIcVJlWkhIVHVRYyt2WTFQUWJuMEpTU3JtaURHMS9OU1hDSVJsU3ZV?=
 =?utf-8?B?UGF2SXZsWjVsaXp4aWJkVENHeHNjeU1qUStNTWF1c0ZVRkdEbEJzdDJIUHQy?=
 =?utf-8?B?eWQzaDhaMGhMYlpsVENWZU5WOTlsR054d1g2bVVNay9ycFludUtGZ1Rsb0FY?=
 =?utf-8?B?ejRyY3c2c1RGTkhiYzgrUk1DaHU3dVpnSWtqYlhrZzQrMW9keWxRUnl1SmN4?=
 =?utf-8?B?WUlkb3JvU1ZacUNqOE9kb3Y2ZzFnMWpwWS9yN21jbHF5ckdJZHJJeHJIZXBF?=
 =?utf-8?B?aXRzOGIxR2l4OUd6d1VUTWVCY2p2c3h1YjJ3UHluR0p5bGZiTWxlcjhOTTF6?=
 =?utf-8?B?dG9SQXkrZWxwRm5zUDI5aDVlRzROSXA2K0V1QlQ5M3BwMUxUMXBwSk1wOWdZ?=
 =?utf-8?B?Zlczbjl5b2pYU1Z5RnljTDRxQXNWYlAwZTVtaW52WEJrbzcyTk42RVdUL1dB?=
 =?utf-8?B?VkZRSml5MXBmZFQ2MmJiejJVOVF6T2ZFZzIrMlIrL01odXhhdnBqVy9VV0Ew?=
 =?utf-8?B?UEFmN3pRbkplbGg5eGIzSW1YTFNxSHhwTHpQTUFUUkR6cXB6WFVoTnl3bGJ3?=
 =?utf-8?Q?JbrR07?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1dYM0V5WHEwNTJFbVhNS01zOThrVVFKaXRqNk9TR3FlUVhBRzhvbTUweitQ?=
 =?utf-8?B?a0hIQjBDbUdodnZMRWdvUTlrQVIrU2MraDJzV0JIbmNnM1o3a21LVmpudVVV?=
 =?utf-8?B?cWxkNkpuMnlSZnNZeFVhOC84TmMvK2hVV1U5cEdaYUpCRnA2UHo2WGpyeERP?=
 =?utf-8?B?VGhuYWFTWXdsSXJLelUxT0ZpdkNGZHpKbk9oaitHVkZQQzVYandDQVhweDlu?=
 =?utf-8?B?NWt5VG02b3ozWXBJcy9TVzZCZ0tzWi9MVEJ1bVZRcTVpZnZHN04xQjN2R0JC?=
 =?utf-8?B?eGRqZUh3SGVpTlArTHFweHdyWC9LeHhzb1paZEJyZEc1TFVHUHdoV2o2Sk1K?=
 =?utf-8?B?K2VqVDVid2ZsUFJTZ0hST1pFNlI4dUVPSEtlTnVHSW5xcjZROHRYa2lwbS9q?=
 =?utf-8?B?NVhvRnprUlRaam9CdTY1VWlMRTFDOFIyVVNieDFERnhHZFMvVytuU3FpR0Nm?=
 =?utf-8?B?bUIwSnVIajRzT0JhdEVKN05BYVNKejdWWHE5Q3dYZVFrOTZDZ05EREk3Z0ww?=
 =?utf-8?B?RkRGRmhpemozeTF0SjVWbXBadUd1RkhlNHdVNVY3R2dsYWc0eVplYURKcmQ5?=
 =?utf-8?B?Tnhkak1zU0Z5MzUxZDBYRU1CbytnTW8zaE43Z2c1OUo4OW9WRVZsQlZzaERm?=
 =?utf-8?B?bjRTV2RnWWZWd3l3SWFpUEg1RkRyckJka3dKSU1lNnI2UmpuTUJGRU16QTNO?=
 =?utf-8?B?S3pHb2JQYUpUNFNjbmE1SUIybmN2NTM5RnFkUXUxRmxvSndXQXNkWXJqaXUv?=
 =?utf-8?B?YUYwN1lTSGxlWEVoVGdLQXBFSkVIdFJEVDgzTGIrYW9nM1JWVGZtU1dMZUVW?=
 =?utf-8?B?RnAvODFZOVNWWjRSUlM5UkorWjkzbDE0cXRLM0FCNVk4NGdBaTBhZ2NIZTg0?=
 =?utf-8?B?R2Q5Uk9OK0owS0oxcUY1cDlLc1YyRWlpRlFxYWJCeGJUMUtSZzBlUUFjY243?=
 =?utf-8?B?ZlNuREpCMmo4QS9SeEI1WVhzK2YxWkRycWtidWpzNkVvK0JmazRFZjFnTWdx?=
 =?utf-8?B?M2pCdGpwNXRaci82dlVwVDZuZUloOGtBVDR5ZTR4M1FtN054djEzaGhQd0dH?=
 =?utf-8?B?ZExpTjRHU3pkZ2JYQTNhWEozRzEvbk9HZENHcXJnNUUxRHQ0aTU3VG1HZHhs?=
 =?utf-8?B?V3plczlJOG81eEdJZUJzZmNRVCtxNWtqRllVTlRURTVKT2pzSnJuLzhHaFZO?=
 =?utf-8?B?eExLTGhLT3JCcDhabkdPdm56bFJWYmowT3BZd0VWU0MwQUpLM25BeFFZMW1m?=
 =?utf-8?B?Z1l5bU15aWFZZ1p6aGdUbTdFdzdvcUFOQ1RuNWY3Q2NMaHZDTHJHOVlpMW00?=
 =?utf-8?B?Z251RmwwZDdGZUowcjJsU2dBUUh5Y0R2VkM2YVdCUHlIbUlKeWlDZmpTYlVr?=
 =?utf-8?B?T3gxZmpUdzhlMjdveEsrV2tzcjc2RzV5Sm9QY29wT0FXYU5yZWlhcngvMkxB?=
 =?utf-8?B?dUZSMS9paVc2UDRYYzJvNnh1VjJMdTFzaGpBTHYwRzFDRkNab0xLVDAreit6?=
 =?utf-8?B?enVYQjlJbFI4SzNvT053eVdkR1ZPYzAxMDkyT3RUU1ZaOVBUeEtjeEpKNWpI?=
 =?utf-8?B?R3A3VFVpaEhCNmRNNWJ4dTBtQnY2RThtVFJGS3J2K3pyZExyR3hrYUhmOGE5?=
 =?utf-8?B?NkpBSjZDRXppRW14NFdmVnlmVTRPVjN2NTZDSW1qM0xhOGZnWEgwNkJVaERZ?=
 =?utf-8?B?Z3dLWnhFYlZvc2c2QUZxMTZaQzRsR216NFdqV1dGcVFCcStjRk1SdlF6M3Vy?=
 =?utf-8?B?MzJMWk1TZHl4S1RtT1ZwSWFLUnZLYmxtQjRGbzI3M2FINVhSQUZPdHJ0YTF0?=
 =?utf-8?B?VVBnT2h6dVJZdG5pU1d3VWIxSUY0b1prdnlzb1ZVejY2UkRQNWRzSXJwbFJB?=
 =?utf-8?B?anZRMTJWbGhLZjE3UzVQYjYweEVmem9KY3FONXRaNTdWa3YvMkMwUTNiSmhY?=
 =?utf-8?B?ZHlTQUpIb2oyZmROb2U1b0VPaGVhdTJ4bEhaZjNQbFpXSHlMSVo4cWJZNW1T?=
 =?utf-8?B?V2ZjVUdQeVI0bGIzZGlYdVFweUU4TWlkR2U3UU5nN3llcFBhdVZ6YUZuWjBF?=
 =?utf-8?B?M3lWajUrVlZpM3MvR1NGUXV6RXNlblhZQjhKcEJucmhoOURmZm8zZ3dXdTNL?=
 =?utf-8?B?SysrRmM5MHpQa3Vha3lkdmJxZ2l2Y3lIaHp4MGlUa2FjYm5IMy9vSjhkR1N6?=
 =?utf-8?B?V2ZjWFFjUXoyemNtci9zaUJtSW9qTEJtS1dmMkIvaTdlTDdvaGFEUGpDSGVX?=
 =?utf-8?B?cDc0R3JpUjVGcXhIclp0U3pQNUE1SkYvbG01alRlU2FBYzZqK2tVaS9NUkI5?=
 =?utf-8?Q?PVBogPGWCaEGndmeQ3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ac9e62-858b-47d3-6e8f-08de649afdd4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:43:18.1143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xgVj4ibwsWQujklbn13dQ2gem2W83eFgr7rbVdkEzMADhPONSq3GHv7YPfVc1NM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
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
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 224F4F0F5C
X-Rspamd-Action: no action

On 2/4/26 17:56, Alex Williamson wrote:
...
>>
>> This chunk here doesn't want to apply to drm-misc-next, my educated
>> guess is that the patch adding those lines is missing in that tree.
>>
>> How should we handle that? Patches 1-3 have already been pushed to
>> drm-misc-next and I would rather like to push patches 4-6 through
>> that branch as well.
>>
>> I can request a backmerge from the drm-misc-next maintainers, but
>> then we clearly don't get that upstream this week.
> 
> Hmm, drm-next already has a backmerge up to v6.19-rc7, the patch here is
> based on a commit merged in rc8.  The tag for that change was based on
> rc6.  It can be found here:
> 
> https://github.com/awilliam/linux-vfio.git tags/vfio-v6.19-rc8
> 
> As the same tag Linus merged in:
> 
> 1f97d9dcf536 ("Merge tag 'vfio-v6.19-rc8' of https://github.com/awilliam/linux-vfio")
> 
> drm-misc-next only seems to be based on v6.19-rc1 though, so I don't
> know that any of that helps.  Thanks,

Thanks Alex, that was indeed helpful.

Simona, Jani and Lucas can we do a backmerge of 6.19-rc8 into drm-misc-next or does that completely breaks the flow?

If it's not possible immediately then I will do the merge next week or so when the final 6.19 is out and everything merged back into the drm-misc trees.

Leon the flow of patches through the DRM subsystem is documented here: https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-misc.html#merge-timeline

Thanks,
Christian.

> 
> Alex
