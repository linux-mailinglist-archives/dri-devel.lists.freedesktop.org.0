Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OWcByVsfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:30:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2586B859F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669F610E92B;
	Fri, 30 Jan 2026 08:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t67dWimQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F27110E924;
 Fri, 30 Jan 2026 08:30:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cW9YwVs6yjkBv3pT7EQY2XVWJ3gArj7c2g5pavv6C8Z8gX2gHZ3FpP0Pm4ODi6Cfc2wUFT7mhiuy4VgFy5TNHsrAWbUiDw2II0WUviHy5Ar+RrOPty4BuR1CEcFtW8TwHKGSDZQm7T3cpn+eKWvs2oEkDIItTnHBEcFldvUiKBqkFP7f6jxR5gsjpTTTTZPpVZZOkAe89ur3SKSP9Z5P32xjO0y0jb+VgEi6wc8M0XSvUTVn5OrqGZPbTePDCoP2AUuBLnO2/qyg35hRuHxnNliHN3eOF7IIv/p3a6MWiS6NjswDDa6wG/DuhXkU0QDx/SJL08JeDzUwJfF+rssXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr/H89Z7jjZGo9rWY0Tlj2gEetQIBI+/D5eXe0Hcoko=;
 b=CIVauqvfG2CMmuJ9A2FnAku/uAdotR6blQSkLl80Y5ZzPWf4qN+jU69ZZ1oVaYoHnf8u4e15zWBxcZjCOCMd7HnNQ5XIU778Vs8DifVhf+733Pgf/pFxNlky5kpSTKt7uc+1qIPkjCsI7bvMuSSfPaY0fXEvfKjt08W6fWF8o79yzcdjF69WfWd6qGHBeGQcH4S9hE4ZAhKF5g7nJUptqO/NrgQ8DZat9l8ws+v6HdPbaGpOyaWsw8vkB8rI63ZKMnAvRpVlOm6TqdH5L1Ht7vREfTNukE6BK6n/Y9K4nqtKrW4O6W88Y4k0JAz5V3v8vbWv+W9klhnPxY7Fb7AVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr/H89Z7jjZGo9rWY0Tlj2gEetQIBI+/D5eXe0Hcoko=;
 b=t67dWimQo1K2NGas3LW691QrZIj4STZqV42604miGVq81BkDzyyoa3sUku1Ab3XIt5gdHJtnNpKxc0TqJqUgxncs6VWIt6cjYOMOw9UNMYAmG8tWOgn1I6KT5qqDCOAKeZYhQFmk3YBuwtdCJ+YwyDQGdcZDzJZPwzWrOdE9MEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:30:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 08:30:19 +0000
Message-ID: <3dec1de0-0e5b-4a47-b2cc-949edea16328@amd.com>
Date: Fri, 30 Jan 2026 09:30:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] dma-buf: Make .invalidate_mapping() truly optional
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
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-5-f98fca917e96@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260124-dmabuf-revoke-v5-5-f98fca917e96@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 633ba243-86e0-4b0b-a9d6-08de5fd9cd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXZtelBrVEFJSXBMYVhjL2F3cEJrZ1E3ZFdKYzZlR2RkWjBxOWtlOHZqTWRF?=
 =?utf-8?B?d0ZjMW03Q20rTUcvQ3dJYkZEL2drdjdiTWxVUWh5dmlYVWZXdHpVZXcxVmRQ?=
 =?utf-8?B?b2Y1a01ucUtBSUQ2SnI3SEFkVHNqREpuUHBCaklzb0FpTGFaMUNnMUpZT2kw?=
 =?utf-8?B?UUg5QmIzMUhMbFRWdTZXalljQVVJeWFqd1A4ak9EWU84YUNPRkJsL0EyV21o?=
 =?utf-8?B?Tnk4YUpkM01VejBvcUttdDY4bld2UncwUkErRGV0djIrUkk2YTZnSkpiem9E?=
 =?utf-8?B?ZVFKSVB5R2poNVdSMmFTOWpyVDFhNFZiWDBJN1RQUWwrbDgvaHFGQUVKUDJH?=
 =?utf-8?B?YlNIUkdlNTg1ZjIwNkw2QXBFQjNWazMyMDZHWmdWWEEzL2UvSFdxbWIzdGxP?=
 =?utf-8?B?blYyMzhsTTN2bG9pL2tEWEl0V2ljZzJMNTlhNGJtT3ZtekQ5UXpsN3M2RzRs?=
 =?utf-8?B?elJ1K244diswa3FqanFSd2VXcnhWcWtMUlBiZWJnbXNBVVA3UlJ1dFJwb2ND?=
 =?utf-8?B?V2RQcVVkd1NadVBmNi90RGc5cWlJTjYzNHp4ZW5LcEw3R3g0N1l0b2JJcmlu?=
 =?utf-8?B?QVpmaDJId2NpWklBOElLVUhZNUs1RDJkNXV3ZkMvTUVrNE1YT1R0NUdEeDR5?=
 =?utf-8?B?L2tsWm9JcWdHbUhOVW1ZS3pWQUhkU3h4TzhXM2V4UkJGcC9rQTFBT2tmeUtX?=
 =?utf-8?B?bVBDNEtlWlZoY0VKRUkxbHQ5d1c0WlpaSHN2Tm9XR2MyNW9EVGxuY0ZTWkUv?=
 =?utf-8?B?cHZYYXhiL2gya3lrM3lBRkp6RVhlNzFUR2tUSGFwNzY2QjU0NjBieFRCSnda?=
 =?utf-8?B?SkU0Sml1azJodzUxcFB0eThzRmZtRngwWEF6YVJCWWdXMEMvdXFtQWh1TXRU?=
 =?utf-8?B?RlQvc0NwOGhaZUVvNkxCOUxtNGVVaEpPc1NRWHg5TGFnWkZNZFRvZFNtM2M5?=
 =?utf-8?B?eDlUcUo1Rk1IbVR6Z3V2eW1xUFNYZ1NlN3haam9tV0VvQzVmeVlPc1gwbGRN?=
 =?utf-8?B?bGFEbGNObEJiNS9sRVB5NjRXUndVL1ZKNmlkMmRHSGw0cVlFOU5oVGRaL1dQ?=
 =?utf-8?B?R1RvbzlmMlZULzQwN2lCRkE3eGQrMCs1bkdiVUxuQzc2cFRaTHFaTW1OQmM4?=
 =?utf-8?B?TStlVDF5ZUNUZFJDNUxxTkdUN3FvK2owZU13enFVSnltUGMxRWZkVDlacVhS?=
 =?utf-8?B?WFhWNDdrUUVkUldtb293NVB0eGJPQTR0YjRjLzZ4U2JyRStON2VJcVlsOW1a?=
 =?utf-8?B?WTB1c3paQkl3ZHgrei9oeUFTQXl4VjEyZDBwTWU2OGhNTmp4TGVUbWtJdjVI?=
 =?utf-8?B?eEhqS1JHeEU3WXliUjY0M2FlaUhTWlBqUEoyVmlYMjdZVTNHQVRrSHVrNlAw?=
 =?utf-8?B?UjlIcG1DdFE0ZlBFTmJUdDVnbFo2L0x6NjVrMUFjdW5tQlExWWVrWThlVlB3?=
 =?utf-8?B?WVhmdloyNk4rZHFoOHl0WmZVM0krczBEeTRKSnFFZk9IdGErV0pHWGxXWDlV?=
 =?utf-8?B?Qk04SkdKdGlmWVB4dGUwQk5CODRyNUUrR3FqeVRQeTZmOGJub3EyOGk5L0xj?=
 =?utf-8?B?aEwyUjhxQzVidE5aQTBPL05NelNkbE81MEZ5YVVKeG9rS3o4WHRyS2FzSERv?=
 =?utf-8?B?WXRaeXpna0RHTTdhTWYydjZYdlg3TE1SemJsSDJtM1RUMEZReENYZDVtZWpl?=
 =?utf-8?B?cDMrMmdZVjh0SkRsbEppVHpvWWQ1Nld6TmpVT1FycEdzSDlJaHlHbWZNbVJl?=
 =?utf-8?B?eW04M1YrNWZMRU44c0pKY2VXbXpjOGdTWWU0emVSVnVZYlJkVlUwYitOMzQr?=
 =?utf-8?B?cUh1ZGpDVm1rTE1zYmFJVTlRWXlyQ0ZiWlI5aEJoN2RNUkJZU1VZOEZ6K3lN?=
 =?utf-8?B?aUl1ZVMxK3ZKZGxKL3NPaFBoS2h5a0s2VEtNaERxaGF3SDhETi8yRFhvOVZC?=
 =?utf-8?B?OFFFaDkzK09zQXN5WkF3UzJDNmRJbGVhL0ZXcTcyUHhyVjVTclpMazhWV2Fk?=
 =?utf-8?B?eTBjOWR4VTBIdGp6S243bG4xS2ZHMytOS09CQmRYSXc0ZkdsWXB5V0lzNFlo?=
 =?utf-8?B?UmIzdTNRWElqS016bTRHZU13Z0J2dFNCSUhQdm9acnRySkFPUDNQYkF2alZZ?=
 =?utf-8?B?bXEyMGpSNGZ5YmMrTVUwY21BMTYyRnJVa3RHcmd1TmExU0ZCVkc5bTBaRnJv?=
 =?utf-8?B?NVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1RiakppOXZOQUw0YnQzY0taUHhtWFozdXllNk5hQlpzemZPT0toK0ExNVha?=
 =?utf-8?B?cjVYWWVobWFHelVXYTJIaWNOT2pnT3JwNVFqSUZtbDBOZStQeW1TK3NiMlcv?=
 =?utf-8?B?UTBBOENnWE5RUmRnV2lnRmtEQkcreHVrMGlhRGJ2dnBQamRtUkExbWI3VWJy?=
 =?utf-8?B?dG9VOXI2ZTBxcU9oTnNraHh2MWRBNUlUU29DQXkwUSsyVDJmY3UxYm5rTGZi?=
 =?utf-8?B?SFZ5ditWMTFzcmc5WitRajRqbFpETHU0ZkF1RHAwTHhmYnArMzFicDZYV0NX?=
 =?utf-8?B?ZE9HUzdnYWdPeDZRQ2paVWdqajhWWjZzSlNMZWY4Z2Zzb3ZlVDYwTXhHbk40?=
 =?utf-8?B?cDNVdmE2WW9FNnF0SExJbGc3QW1iSGN2ZGozWDVac3ZRZ21nN2xtckxpT1ds?=
 =?utf-8?B?eHk4V2l4bTJUOUk2dmJvTWY0bnFhcG9WRit3aEllVE5laS9GdTl1aFlrWThr?=
 =?utf-8?B?R2ZBUlZVdURLK1VwYUp3c0dVNzg4bERuMk8xL2RuaVhtOHo1MWdRSTNpeUk3?=
 =?utf-8?B?dnJCay8rbW9Zc3Bwa29nRy8vaVNwMjdpa3Z5WnNMY0FlV3JIVGh6ZllhRmoy?=
 =?utf-8?B?ZFJOVktjMTBuMzV1b2xTb2ZLRFFqdXA0eGYvbUp2UjI4Q2RJOHQ3cW1IZGVa?=
 =?utf-8?B?T3RHMkRFRDlyVHNqNm1KWVZ3MWw4d0xHUXpOTWtCMXZSOERPdG5BS2UvU2lw?=
 =?utf-8?B?ajI3K3FTdGFzbnVaRW5ub0VMdlNQZUJUYWZCOUxXblhZS0lDWUJiaUhCR1BT?=
 =?utf-8?B?Z0NPaUl2WE9CVnAvYkZ2emlqbmRYbytmZ2szbC82aTh1a0RZSytPTWxvSnB5?=
 =?utf-8?B?dS9yeVZkL3lrdVU2SnhESyt0K3g0Q2RPY1hUS21WL3VmaHRFSFczSU1zWnZx?=
 =?utf-8?B?ZUJFWVBFNmpkcitocDlFbERUYTVWcnBpYmZBakY0S2hiNWpjT2F3MGpuN2FT?=
 =?utf-8?B?aml1VHhUd0p0NERsbSsxMHYwTWFJb21iaTFQZ0xyVGJ0UXVqVTBBVTVwMVh5?=
 =?utf-8?B?SHBqYTVUazhqbktMSWpEdUdUTklkRHd4QlAxM05Qc011R3N2Y0dIUFdyL2lr?=
 =?utf-8?B?UVptMVFySnNtMFZuU3kxNWovZUN4bjlUSjRGSC9ybVJPS0pYSU1yZFRpRzg3?=
 =?utf-8?B?TjBTNkpjUklBcTJMaklYLzArOHdxcTRFVENzN1g1N3pVVVhWYytBS1pSQ29o?=
 =?utf-8?B?ZDZqLy91dzlRQU5lZlZ2VUEzdTYrSER1MW1XSGhxM2UxeWNsWDlMczFJNXNR?=
 =?utf-8?B?NEJpbHF6aGFKOXJaZFl6Vk0ycGdOaGpRazloSHFWWXdiRTNJc2E4blZnRUpO?=
 =?utf-8?B?RTdObDdJS0dDSE1ENWxxMVFic3dLVmZWK0h1UlNBdDhSeXhOaU9GUHQrYTVl?=
 =?utf-8?B?ZTA5bENiQm12MXlzbG9HU0lLSWhFaGZpcWJMRWkzKzhnNHlsU0EyUFFYUEQ2?=
 =?utf-8?B?VWhxNFlYMHZnVm1kSHJyeVBKYkM4UmFQNkxsSVFCcE9TT1p5WWtVYVJJR1E2?=
 =?utf-8?B?NEgybG82Rkp1bTVMUHBZVjZwQ0VVT0lVQUIvMXNQMjN6aVVFS2l3dEJ4VWM1?=
 =?utf-8?B?Q0tmcVUxU29wZUZkUWdoMzQ4NW55MEVQNVlHdVF5NStrMnpMTG5nUVZSTTB4?=
 =?utf-8?B?NWNpYmh1WVlvbG1EN2xRbUxHTi9FYWU4Y0NCQ2w0Z0l4K0ZDTytVWlBJV1hB?=
 =?utf-8?B?SlQ0Z2VYMnVlQzVaUHVhVzRtaThpRXpoaHN3bnpPNlFNbXhPWlcxOENyUGky?=
 =?utf-8?B?K01zOXl3WnpRY2pSZVM4Rlh0UkpJT0Faam5YMDExc0J4eXFDMk13VDdtRFhJ?=
 =?utf-8?B?TkNuRmxRUGU5cUorbFF3WGVRWGl3TW5mNithcUpOK0FwL0RZNzNwMmcrVDgw?=
 =?utf-8?B?QnJjdXkvVXlHenorR29SV2dTL1lYVk56RTBoeDQzTXhIQjRrdWpUMnJPK29U?=
 =?utf-8?B?bFd0clA5ZUp5TloxNEljN0ZCSnZYSjNXTVlVLzBONDVYZHp3dzJnblhzSVBX?=
 =?utf-8?B?dGZ2SlVTaDd1YkNPTHY3Z0FSSmZhRlZIdFZCNHFpYmRROWphTTdOMmdTbHNX?=
 =?utf-8?B?SmRWdzduVnlTTG52Z1RxMDcrdWdJZVdBVEtrSWRqYk1OYklHZ0N0bWRUUmJE?=
 =?utf-8?B?dFh4VVBkc2NzendEWElXbjJjOVFFNWZwSEJRNmZLYlZYVHBnb0xHZ2tlZVJ6?=
 =?utf-8?B?bUd6bjBaSmdwVWcwSGlRSThUbTRhZENJR3VFeGRjL0hnOVlBNUNFUlk5Q1ZZ?=
 =?utf-8?B?YkErbTBod2dXYkN3VlJ1QjlmVG5XL2RlM05Yd1dyTFlJZUdRMFhMNDBiNHMx?=
 =?utf-8?Q?skhrZFBtSWITgZjwZu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633ba243-86e0-4b0b-a9d6-08de5fd9cd66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:30:19.5229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AxeDv2n2Vj2spDq+7UrRp3zVQi7cK5cSnMAZYkNgZiSidS/umLYUZWEnZ85erGN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C2586B859F
X-Rspamd-Action: no action

On 1/24/26 20:14, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> The .invalidate_mapping() callback is documented as optional, yet it
> effectively became mandatory whenever importer_ops were provided. This
> led to cases where RDMA non-ODP code had to supply an empty stub.
> 
> Relax the checks in the dma-buf core so the callback can be omitted,
> allowing RDMA code to drop the unnecessary function.
> 
> Removing the stub allows the next patch to tell that RDMA does not support
> .invalidate_mapping() by checking for a NULL op.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf.c             |  6 ++----
>  drivers/infiniband/core/umem_dmabuf.c | 13 -------------
>  2 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index cd68c1c0bfd7..1629312d364a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -947,9 +947,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	if (WARN_ON(!dmabuf || !dev))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (WARN_ON(importer_ops && !importer_ops->invalidate_mappings))
> -		return ERR_PTR(-EINVAL);
> -
>  	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
>  	if (!attach)
>  		return ERR_PTR(-ENOMEM);
> @@ -1260,7 +1257,8 @@ void dma_buf_invalidate_mappings(struct dma_buf *dmabuf)
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	list_for_each_entry(attach, &dmabuf->attachments, node)
> -		if (attach->importer_ops)
> +		if (attach->importer_ops &&
> +		    attach->importer_ops->invalidate_mappings)
>  			attach->importer_ops->invalidate_mappings(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_invalidate_mappings, "DMA_BUF");
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index d77a739cfe7a..256e34c15e6b 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -129,9 +129,6 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
>  	if (check_add_overflow(offset, (unsigned long)size, &end))
>  		return ret;
>  
> -	if (unlikely(!ops || !ops->invalidate_mappings))

You should probably keep "if (unlikely(!ops)).." here.

Apart from that the patch looks good to me.

Regards,
Christian.

> -		return ret;
> -
>  	dmabuf = dma_buf_get(fd);
>  	if (IS_ERR(dmabuf))
>  		return ERR_CAST(dmabuf);
> @@ -184,18 +181,8 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
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
>  };
>  
>  struct ib_umem_dmabuf *
> 

