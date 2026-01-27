Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONKDFzGNeGlprAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:02:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E479259A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB0610E52B;
	Tue, 27 Jan 2026 10:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Op5Sd4y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F8310E520;
 Tue, 27 Jan 2026 10:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjkGa7KPpZe4a1hSY9FTnsWsj8qyHoKPqt27M6R/8+K1FCB7qCUNxcJhnNpQzKfgsMYl+rQmwsjU3eZjuytHGHZ8PHOINJwe9BDTGAs8nOFwGpxn18b5HO6MT/19KDsGaPdpbi1qtt3TnBkcP1OPlb9n02mtKrU4AhMVv+vhCCG+SMgTbNJTpNqNhQnm2Seu2TDNgLgL0P0P2sT1WobNZf4cPUYokxRH0HYO2gUj1bB7vE1bFvpm8bj31QDwJISUFyE74HilzhWmNBz95hJK3tA+SINRAgSoCKfl4cEMsDmNTzA1EdXXbJntSlNBtkXSwmClv0HVMzzXv5A4E//ocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5OG70meHMNFS9hLg4HUd2dgegalGNxG1begs2OWnbg=;
 b=jRDGhpWa9IMp9NGYg958bmMHLJePi8zribrOC48VlP5zpOtFJ5FAoZvkvbhkmPJ8ZHy8G7K4iN60fbufgjdsGis2XTWE5wbwfTmD6l9FrgLuXT5UE0dyvXvM/EZNojMtc5a7v8tMLnMWyLK2rXjYdaJmn2vLgbma4/XzG+5DrjSxhfn14C8YI5CKRPryo908oLyCLWYo+cAlDqoPbEP9lc1cdtLcY43DsPZZZAlVr1GJZvEZx3+/Wm8ta6az6TZdclBEGrfzV6y1rl2dMRNPOl0yVM+FlmrP4IGzWzR6UwQuu798hGQsUTlsCd55KFkVIxKqs4WwvxfZeaG+T3/DTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5OG70meHMNFS9hLg4HUd2dgegalGNxG1begs2OWnbg=;
 b=Op5Sd4y5+e6a8mi5nqdl5y63wFNi/BhEI9tVnr/wcu6V8ClrEYdIGWvJ5JqEfot9U/y4YPYN1iVjPtDz90Z07ISwEZd+/GNR3+32NycOD3dKhBJWlU4rlUYHEPGYmZOxXq0GpC9Gaxj0vbKAOHlJX6jAI79pjExE4iUbwREGajE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:02:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 10:02:16 +0000
Message-ID: <83cd911c-99ea-4fab-821e-fcf703209731@amd.com>
Date: Tue, 27 Jan 2026 11:02:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] dma-buf: Always build with DMABUF_MOVE_NOTIFY
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
 <20260124-dmabuf-revoke-v5-3-f98fca917e96@nvidia.com>
 <0d2ec2d6-c999-45d8-a2bd-b5b21883db47@amd.com>
 <20260127095831.GR13967@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260127095831.GR13967@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0850.namprd03.prod.outlook.com
 (2603:10b6:408:13d::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 074df125-e27e-4bf3-9200-08de5d8b26cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0N5YmZtczlOYmFodjZ3b1RWTWhEWEdFQzNWUWZtU0xFODQxbS9CSHZodkJ0?=
 =?utf-8?B?ck80TUQzYzcxd0pBdUR5di9qcUF5VjBvNlY3aTEyWmRlU1FZamsxa1ozMW1Q?=
 =?utf-8?B?enlaNU1taDgxdW1BYStwZDhvVnk2OUV3cGtrUmMwdjQ2T09mY0JCV3hSWVI1?=
 =?utf-8?B?NWh4dHhUZTBLQU1CN1Mya0VQZ3RMRzZqTTZjSncvZWdQLzREdjZPYzVrOTI2?=
 =?utf-8?B?cWtuaWI4ckZwUFUwSFR3WTl3bVhld29YWCs5TkxaazNua1dDRllaeFVvMlVH?=
 =?utf-8?B?SU1iN3B6M3c1L0t1Y2gramhFQy9YaFRuTTJ1Szc2WkJCRGMzcE51NW5IMVl2?=
 =?utf-8?B?RnJpR1hPZUFsdmMwRU5rNEI5VVM5U0wvT3RmOEdrKzN1REhZcVdrMWJYVHd5?=
 =?utf-8?B?N2h1UExsQUR4Tkg4bXdxbTJ0TFA3Z0FPd21tQmp6Qk1RdjU4MFR2Y0doOXA3?=
 =?utf-8?B?WTNpMFNXT2xRcGh2NGVLSlFrVlF5eDJxNDhuNndlZTJtbTZUQ2srTXpCUWNa?=
 =?utf-8?B?aUUrUHAwS2ttYVB1emRYZjNWTEh6VmJLTEltTVArNlhuNkQ0bVZzVlRYZGVv?=
 =?utf-8?B?QXh3eko4dUJYVjFNKzN5b2puZDgwSEllSTlWZ0laazlrWFBlbktOYjBYWnVo?=
 =?utf-8?B?Sk9PWi9qT25OcHNPVEhZUDlkTGsxWjJhbVZSTkpZYWFVNVRQY3dVUEYxZ0s0?=
 =?utf-8?B?bnlNeUp2YlY2TkZVRE9EOGVmSWFtU1ZIclF5S05MT1RyUzdhZjNpUEJxTGVv?=
 =?utf-8?B?WFVsZmNiSXpua1Z5ZncveVB1Y2psK05jL0QzT3FURkdGdU1qVmp5ejA5Q2ZR?=
 =?utf-8?B?T3ZRcG14dmgwSDk5RldyWm9qVVFJVzhSZUVWM28vSGNUYzdKNVhzWVZBNDJZ?=
 =?utf-8?B?L0pSSE1xQ0lObVB1dVFtNWJmdS9tTkhSS09HYjdFUWZhSWEzREk0R2hTVXZk?=
 =?utf-8?B?MzBaYXRyRElCMkloZEtUNU5QcE1rdUpPSFIvVDdVbnY2RGlBb3ZZVXpYZm5N?=
 =?utf-8?B?MDdJdDB5SkJKZExlMmp4ckVjWis1YVZEWlEveVlVRkl1Ny9wVG1rejd0VUV5?=
 =?utf-8?B?TDEyMVhrV080YmgvMkRBVVVlOGNlcEJpMldsZ0Zwd1JlWElGVS9FNkgxN3Yy?=
 =?utf-8?B?RExqaHloaFpSYW9BUEJKamYxOXNweEVJaGhyTzZhaXdhQVQ4MFlRQ0txc1k2?=
 =?utf-8?B?YnFzSnVhdENyMkppbThRVzIzZmUyRHZDRmVyMlAvUGVFTHhrcVZBeVFvbmlI?=
 =?utf-8?B?MUJaV1phRGRqbG44UGdhUFk2bU0xbFphYmNZT1pYSXJEdjdZaGJJSGYrWGox?=
 =?utf-8?B?Tk5KZzg5YTNxSXB5d2pnQ3M3anRIYXlrTkZVbWpzOTBST2FJeFQ1Tkl1MXpm?=
 =?utf-8?B?aUc3NWg0cnhuWEpSQmZIMHp0N2RBNG41VXhaWXFXYSs2MUhDMEdYVkFLQmlD?=
 =?utf-8?B?a3FhYldwckdoVlo0Q21pU3ozblcwb1hZeU9mL1JWa04yUmFsV0RsOEU5Y1pz?=
 =?utf-8?B?d1VnVE1waDAxc3ZRb1JQb2E1OENVZmFpYzVuQS9KSGZSN0ZYZVJHOVp3dGlM?=
 =?utf-8?B?Zlo4UjFXVTJBN2pVVXFoQnJVdUltMHBlbVNTeG5TSTU0UFdCMm41VWdMajAy?=
 =?utf-8?B?ZkZ4UGtnQzgwd0U0Z0VucW9rVmF6K2NRTWg4c01SUnBmUStFczEyR1lkaks3?=
 =?utf-8?B?YjVBVTMyN25MU0xpY0crd09LMmp1aUc5YnJINnFtZzRmREcxSmFrbVZjN3hq?=
 =?utf-8?B?NDY0V0pJelRUZXptYURJeHdaVkc3emhpQmVsWmxvNWcwckJ1b2lIWUpac0Zw?=
 =?utf-8?B?Q1FrNnhCQ2hBd2V0ZHFyOWZmdVFnYkhDK0RxcDBSWVlPRjB0ckN2cjZKeFoy?=
 =?utf-8?B?VVd5bXlkLzAzTjhkeGozTGErWTQ3OFc0dENrY2d6UXZ4cmVZSk5UbkFOUmNq?=
 =?utf-8?B?UEdBR2htcXpPYXNZdUJRbnYxSkFhclVtNmZhKzhHbjBDY3RTTmVLYUJIYTMx?=
 =?utf-8?B?T3VheWdKUzJLZFpYQTZCOSs4K29naXp0YW14NWZBUENpVG1kMXlPWSt0dGpo?=
 =?utf-8?B?K0p5M1I0dS9CMkVrajhLbk51ck50ci9mL2tKT1BzY3BMNVdHRXFzd0JuVVFT?=
 =?utf-8?Q?9soA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUdmdEgvOEZDTXZYZmpQUWdieXdLUktnOGJyOHZzQmFIditkVUV5bVFJVHVS?=
 =?utf-8?B?UTk4cnNvVmdoMGwzMitMY3g2QWgvUExZeUxxeE5ya0FBUVVTcjZlS0FNVkQz?=
 =?utf-8?B?bmtFa3loSGNwMTBRNWRHeXhxVzR2eFgvM05NSXhadFpNMkc3Qys4dkNBZzQ1?=
 =?utf-8?B?QkgwRHBUdFhRS2tiOFFhRHhaZm0zYUxEWlArb1NtUGtRWDlzQ05ocnpnd2x6?=
 =?utf-8?B?VlhuUlp5T2JRekEwRXVrRU1jRjhuNERPWU9kSy92WDJiUTlGM29US0FIMDda?=
 =?utf-8?B?UThjVXMzYmVpRGhyc2Fad0RVbjdxbVBraFhIZ3VERjJ4QWZEWi9Za0crT1ph?=
 =?utf-8?B?cHRkVW1iQXg1T0V0S1VGSkdXNEFpMlVNZUt5a2RSZmdNY1lWSCsvUUtCbkVP?=
 =?utf-8?B?eDdoZWlDc0d1Q0xhMnNiM1daTW5abFRWWDJjNzVQMGcyNnhKMjNrZXpzNnRX?=
 =?utf-8?B?dHZRYmhlY0xGY1piQ1kyV3grdWNJaC9Mc3ZKL1cyVC9BeWNvdklianNFZ1Ar?=
 =?utf-8?B?ZFR6UjdsU0VmZXZZdytBUWZEVEw4SFl5ZVlzVWJvU09iZXRGdlZidnYzYVRO?=
 =?utf-8?B?OFBOblRQOVZJRTdJdWVXREt0OVNBazZnM1ZnYnlTQTA0ZDEyYmdsc2VTcUcr?=
 =?utf-8?B?NTZXQVYwVnhJTUxUTmx4dlJ6SWdLQUkvK1JXRE04QlRBcmdZbXFKa2s3THF5?=
 =?utf-8?B?elBJaHdHY0crdk1nOXI4QW12Q01RSnFOMVZWeGtUOHZ2QnB1NzZpejI3Mzhu?=
 =?utf-8?B?YmVKVjdhWUFWbTVFMzdmZThGcWFFc3FjczE5UkhzcVVyQkRjeW1xZFljQndm?=
 =?utf-8?B?UVZRVGpMK3lkb1ZOeWY3WjZqKzRISTZ2Z1MzTTJRRjRXbWlyQ051M3RWTXdI?=
 =?utf-8?B?L0ZYSUVsVE4wYy9ycVBMejhjZlVJaFh0TGhPcmZOT29LbkR0QlpNYlFWUGw0?=
 =?utf-8?B?Y0NGaVFjdmR6TUEvdERMTGhEQVMyc3hEYWt4U0tOU0JLb1Nvd3VSYlNPWEZG?=
 =?utf-8?B?ZGVvc2Y2ZGZLeXB0dmUwM0ozaENTT2JXamtCMHdkRllJRlpYbmZqbEdiblh4?=
 =?utf-8?B?MWdpSWZXYW4vUCtDaGJYQW9zbXg4MjlXNHROZXVzYzkwY3cxUy9VaVRRTUFO?=
 =?utf-8?B?WU94aW4zY3FZK21WckEwdEk3MFZHSnJmR2VIVERZMmI3bFVhUUxlRXpPMWUy?=
 =?utf-8?B?SFRuTVZXSEdNZEFKdDNTQUd6ZDE3UmlQcDVrK3JqaHN0cmNIUzIyL2F6ODBX?=
 =?utf-8?B?ckMvMmhVTHJYd05MSnZXU0Q3WUlScGtYV1d4dlhWTjBETUZ6SElYVFJBNFhi?=
 =?utf-8?B?ZUc3TWFYZGVicUdQZm5ydXNlZCt5Y2c5ekVOcG1aVlpGakhBUkFnb0tsS2Qr?=
 =?utf-8?B?T1ZiTG9VVlBzUkJoTno4anF2QVRLNG9ENENkWE1RTStCOFZsZ1NVWVlaRW1S?=
 =?utf-8?B?TGMxYUl4RTduZHdsR1RQamY0QmI2RWQ1UWlwZDh0KzBydDAzSE5hVHdpU2tN?=
 =?utf-8?B?QlJBUFB3aXdyV1F5ejlaU1pQdEZEb2xRV203eTNBM1ExTmU0V2Z2UlBFQnp3?=
 =?utf-8?B?U0FreWY5T0RHdm1yY2grc1JCbncxK3VaOUVvWVZKcWl5OFdRTkViL3cxOTdq?=
 =?utf-8?B?bFpyUWxBV0pIckdkaldsSU5PNHA0U2xlTkhiVElmcW5VSTFqSlM2NGVuMXpR?=
 =?utf-8?B?dkZkRkJyZEQvNDU2SUs2VjIrZXIvazZSZ1c4TmE5b3gvRm80cHdnQzhlMnJO?=
 =?utf-8?B?cDBiWnlLbG1LdFJDNHpzQU4yOE1QaGJ2MHNHSGpwb296cVBWNE9zcW5nRzU5?=
 =?utf-8?B?VGlGNW54eVJZQTNWRWEyeitqSjBIb2RwblRSU3d2d3N6WUlnOFJJOVNPd0Ix?=
 =?utf-8?B?MVRTMzAwcmRTRmRiWXdzWk1pN2FJOHlIMXpTd0o4OWRnL1ZpNGRIWUQ3bjc5?=
 =?utf-8?B?VDVFd1lKeHBpOGhxVzczK3dhdjVkd29tR0w2UTNBcFdXUUpNV1lJdXl3L0ZY?=
 =?utf-8?B?YUp3NlFUcmtSRDRUZEFmS040QWdMaWdZRmEwY2hGelRZOHpLU3Qzb1lja2U4?=
 =?utf-8?B?T3RtQnNleTVrRXEzM3hyVVN2THc1eG05bnJhTWJoNlRuSTYzT1VHMXQzbGVV?=
 =?utf-8?B?RzlmZlQ0ak1mMFJ6cDgwczNXaHFrdWZOL2FJSlJNRlI3L1dhR0tnVnJwRmUv?=
 =?utf-8?B?eTlESkRVK2JXcmJ5bk1nVll5NnoxUmJONVBMSDJtNEx3YUFsWjRGS04ramRw?=
 =?utf-8?B?Mk5vTndyWGRqbGplWWxQQm1GZUE1RGVxSkdjMFYvbk1HV05nSmdHQ1hqbENz?=
 =?utf-8?Q?WqOhCM8APO6L25QH6X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074df125-e27e-4bf3-9200-08de5d8b26cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:02:16.7533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/5aUzbgDB5/NnCfXXNdvCr1DqRs+RQlGB48aCIojHsQrUysfaq80Gxl3Qz8XdYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
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
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 10E479259A
X-Rspamd-Action: no action

On 1/27/26 10:58, Leon Romanovsky wrote:
> On Tue, Jan 27, 2026 at 10:26:26AM +0100, Christian König wrote:
>> On 1/24/26 20:14, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> DMABUF_MOVE_NOTIFY was introduced in 2018 and has been marked as
>>> experimental and disabled by default ever since. Six years later,
>>> all new importers implement this callback.
>>>
>>> It is therefore reasonable to drop CONFIG_DMABUF_MOVE_NOTIFY and
>>> always build DMABUF with support for it enabled.
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> As long as nobody starts screaming in the last second or I encounter some other problem I'm going to push the first three patches to drm-misc-next now.
> 
> How do you see progress of other patches?
> Can they be queued for that tree as well?

I was hoping to get through them by the end of the week.

Just wanted to make sure that CI systems start to see the first three patches (who affect everybody), so that we get early feedback should we have missed something.

Regards,
Christian.

> 
> Thanks
> 
>>
>> They are basically just cleanups we should have done a long time ago.
>>
>> Regards,
>> Christian.
>>

