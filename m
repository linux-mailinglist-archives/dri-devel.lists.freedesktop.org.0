Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONzJEq2ZcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:17:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A108454349
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD5410E045;
	Wed, 21 Jan 2026 09:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dD4y+WkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194D710E045;
 Wed, 21 Jan 2026 09:17:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuUhTiudGNS4VFT879TSFwzqraDR2q4b6RxFXY0hg+RRMppI3/oyuaCeEd0BMokspot0QIOivKbtF62YPbft8qYO+ugiA/BVDj3YZ3uVJ2hJnXzDNMrMwWTZIhjYZ4pGix//SPY/1TS8NeGlPJUKATjE5XcC4A9xZNNaPC004RB+ueGGDprnqFTjf3m7wPVAQ/czlD81ChZWGchNpAW55ZRBoy6nmXOwwuilzzd+0VClFqPf8IeQWDMP7HTbcINsuS1yCO01mo4DpkgWkjTXzCJaBRJ1+3nU720E6KHcP0dte/Rinfh3Z3RS3PMLB0qvqf4yOSfVMp3nKUX0ogBX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnGpEef9c4Cgj9FuaxB3n4+DS1c2FsPIC4AvF9uSvXs=;
 b=VSxThKpXssnn9nIVTaK1k1fprK5T9/Gb0vJ9UBEKETQifcdpur2rHvfm0uqFiTLBYfax08hXJrb4B+4h6Dvl3+CBa7GOGhZt+sziSWAB3LiGWzVxXn/pMN70860sqhFJIcSMppCzgV5dVeTEFBzaXGOVpCDnDJPUXbY4BoArVomEiequtCKeShsCMG1CFtCyKfvMSzC1DuxWn4TTZZ/q6Fsjs5dsx9aaiRqJJ6cD0dOLx4OybDsBqE4LWCuyKg3/etrS0LFUrColb+ebr4BKDI1QiHMWMiZNS6OpQ00kQU50BsuW0Wq0Y2Y714pzsEKihUnCR1c8+USxdhGmijJ0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnGpEef9c4Cgj9FuaxB3n4+DS1c2FsPIC4AvF9uSvXs=;
 b=dD4y+WkEC95gMqnbiTRh+1bN4nURVVde2o5xg8EeiMbBdwt5nxevLc7QjjnA1GKBBLxUYRtFWXYsj+zrtFhZ00Um+cNvlXo/TH6OsUb6FTzp+C9FUI58417ivBMLAWF8zkmYsMyqEAXv2ZKykH4lxZFGoEVlpMpGG1o1CpDZFKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:17:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:17:25 +0000
Message-ID: <7cfe0495-f654-4f9d-8194-fa5717eeafff@amd.com>
Date: Wed, 21 Jan 2026 10:17:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dma-buf: Document RDMA non-ODP
 invalidate_mapping() special case
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
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-3-b7e0b07b8214@nvidia.com>
 <4fe42e7e-846c-4aae-8274-3e9a5e7f9a6d@amd.com>
 <20260121091423.GY13201@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260121091423.GY13201@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:408:fd::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2bc323-266e-4a85-8309-08de58cde42e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFRmUWtaNzNRS0UveEdVK3Eyc1JkcVdMcjJkdlVnMDlrMTFxbGVCY3BJUzlX?=
 =?utf-8?B?NTFkWFJtbjVoTGZKazMwRGhDM0tLdkZYUFpmL1dnSmh5akJlWFN1YXN1OURV?=
 =?utf-8?B?ell6NG5uSmQvdTZMQ0oyVnNuUGlzSnI2VHMydXZDZVZUanFhSzdTaWNuU1h6?=
 =?utf-8?B?WjV3dFJnSUxpdlBaUU5SNUk4ZjBuSG1IdGFjSkpDekxCSmFkWXUxaVRuODRk?=
 =?utf-8?B?aGlmN1hTNityeEFtQm5KT1ZoYVAvZWh1TWFxaHZwQ2pZZFVUcGNSNzlIVnh0?=
 =?utf-8?B?UmczZUN3OWhCWHptbSsrcXZKVXFPWDNyWE1kYjNoNUZIWVhiRlJLN2h0LzBM?=
 =?utf-8?B?U3pQTDVJRm93UmJrV0VWL0YybDFDTHpiTURaRWdJd0RjRHNwNk5kOERDM24w?=
 =?utf-8?B?U1dJT2ZXNW1zWTNUZk1NenlkTFFJekRURWhqbE5VQUllTnBOOXFoRU9xWnhH?=
 =?utf-8?B?QUJSd1JhT0xmT09mVlJCN3hscGtxeWhtOWJnVjFVbWhtQlB5ZHZSb21ySGhD?=
 =?utf-8?B?UmsxZERJajRIODVOR2pjaGFZRllZK2hWb1cxYWhKWXdlYTZvNEw1c3VNSkFa?=
 =?utf-8?B?cE4yWUtHdksyQSt1Z1JXZlBoRjljRDZpdEkwdm92ZWI4R2JqWmtjZWVjbnpz?=
 =?utf-8?B?Wm1jdmpLeHgvRXhOMUFwUGZUQ2k5cWp3OXhFMXU2T1R0SE5OcFM1K09tY1Vm?=
 =?utf-8?B?UVlMSkVERFFWekQ1eWlRVFlRcjdqWTRsUklJUVBBNE1RRVV3V0k5VSswMnFt?=
 =?utf-8?B?TDBmRVdJYi8yQnREMnU5bGZtOU4rQVIxRmJqbWx4Rmpya1JFTTd2MzNGc3Mw?=
 =?utf-8?B?cy94L1ZuR2U2TlIrWk1oWVBUVkFJRDRLNFJPNTA4dHR6S1VQWUNSRzVlU2c3?=
 =?utf-8?B?TTEzaTF6bGU4N0VrNVJoQklCTGxRVk1DVkRuVWhBSVRWaDRxeHVRYy9hdWJP?=
 =?utf-8?B?MkZiVXhkVUl3UW9pQlhkcXFQOGVjdXdhckxoNFpGY29tMmJrOTVsSE5zSzR6?=
 =?utf-8?B?bmZvTkd3elUzZS95MUQxczlhWktTODhWMFpZZnVoZjRLS1o1djlLYU44MWdD?=
 =?utf-8?B?UEZZNktPUnhHZkNxMmhQb2xpSkg1RmZkU0Q3eTNsd0xVMUZMK2xQSEhnb3hl?=
 =?utf-8?B?WE1BZ0x5cTdIc2doTDlBdWpZNG1BZjUzalNXQVhCVURwZkkzV0RwNUd4UmIr?=
 =?utf-8?B?a3ErK3V0aWlwKzlkank3b3N4L09xcGZ4YlZ4RlRiMytYb3RmeC9NVElrSHU3?=
 =?utf-8?B?UkV3V1FBOXN4TWNnM1oyaGlPWVpwazhtdnFDNmJLQ0NzeTFPRm43bmUxYnlP?=
 =?utf-8?B?YnBWQU5FQkNyYVhUS0FxY0s1ZWNjNDVKQ2dQN2V1K3NpaU5CUjNuQXpVb2M0?=
 =?utf-8?B?ZVg5VDN5dW4xTU90bW5hbm5Pdm42bE9Pd0hzcG1wd2dzaVBnWWc4aE9PQ3do?=
 =?utf-8?B?WkdRem55K3MzSWdsQzdzeS9BVEU2RXlHY1l5aUNoNm9hVG1jQ2duTURQRVJX?=
 =?utf-8?B?MWtodTg1VHNkRDdicm1oWVVGVmY1SUk4M3Q1bVJ6SDRtbGUwVksxTCtCUmZG?=
 =?utf-8?B?bXdzUWtKR0pZWlZRZWdMMXNWVmtJWnhsa0k3M0xBVFQxN09MS3lMV2JPUExp?=
 =?utf-8?B?NjRrb21TS0EzcGsyMGhWbmlPVCs5dkNUYUdLdk45YXVHSW9aYUJWVForYVFq?=
 =?utf-8?B?bmhoQjczYnoxaFVxQlhYT3JnRlY0REViUmo4U0M3NEJDeC9kc2RXN1BBME9l?=
 =?utf-8?B?dzZuRkhhNS9yUHkzZXAwZnhySDdHbzF2TmIxQ0hzb0xySTk3WFkxSFo3YkJ2?=
 =?utf-8?B?a0ZLNnViU29xWndqU1Z0V2hZMEdsWmFxUnBXWWVaenZGWDczYmJ6c3lyTUJL?=
 =?utf-8?B?Q1RVZ2FmZmU4aVZsaCt6Q1paenRKdkFXNFh0YnRSVVFyYk5JbHlSME9aM1NC?=
 =?utf-8?B?OVZqcjFSaEZkYmQwQ0VKdUVRZ1VxdjRjd29XTFRUTVVTY1NmdEQxQWtCZElC?=
 =?utf-8?B?WDRZRnloREQ3SUdIdFVGRnBET2ZRdW9TN2c4a2FiK3Y1emFTUU16djFiSlZ4?=
 =?utf-8?B?Ujdjd2ZMM2NyTjVGVFNpNWNQZkVJSU5sVjhOTk4rSkptT3hGWUJoMFRuSGY3?=
 =?utf-8?Q?Va00=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZIYjJXdllOWmZERkkrQk9DMnJQekNFdkpnR3pWcE1kNXJOU3puTDNiWkdt?=
 =?utf-8?B?NkpXeEVrVFZBaWpVbU80L251Nms0KzB6MjB6eVdUZDhXV0xKZVMzdCs5MmdM?=
 =?utf-8?B?S0hIeVhPejA2d2ZkOVl3TVF4aFg5RTlrMWk1M0tnbVQzTm1oajBhT3pxTERq?=
 =?utf-8?B?YU16RFZpcmVWcHBkVDYvL1p2MDRUL0dlMzFpQ2tINnJ1RXIwWEVXemVNando?=
 =?utf-8?B?L042cXlNYlBRTy9od3VCclJjSGhZelYzNThPWS9hUTdyVVVLaHVON2V0NGsr?=
 =?utf-8?B?U20yNTlqNVRZTkVHL1BsY0t6a1VLMGs5bEl4MXZhWmVqelp3WXJGSDlRZDBK?=
 =?utf-8?B?L2NWT1laUytldUNZNlloSld5ZGhFOVV2ZHNUWHdIMDhIVzdtektyZ2cvTXRF?=
 =?utf-8?B?Wi9XRXFSaWFuMjJ4QTBucE9yb0JNdmpGM1AvMmdHMTBITWM2S3pnTElJU2pI?=
 =?utf-8?B?dG1ZMGt4eFp6bUZQUzA0ZWxBZ3luOFNlYjFlbGhKbURlQzJaQ0ZTSVE3amhx?=
 =?utf-8?B?Qi9Jbk9vMFM5NkF2ZnJuRlFoRnZxd25yd1JrUHZhUHgxNWF1dTQwQXZKaTRu?=
 =?utf-8?B?NkNzNDdmc3VwV09aTTJsRjEzY2FYekhLWlNJVTl2OEhzNnorNTFLOXlnbE5Y?=
 =?utf-8?B?V2FlZ0NiMWd6UlF3ZTRhQVVDZ0VMenFKMkFPemhWcm5RT2RVbUJNZUNGZXVX?=
 =?utf-8?B?eWlxNlVhR25iWlBucGZDSTQrNHI4TUh3dHdmcnluUHVyNWEvaUEyaDB5Vitk?=
 =?utf-8?B?TVZOSGNyS0xqRGZmT2VMM0ZXSHZjOVJXRHVjdHlMa1VIY0xTajQ2ODhVNXJG?=
 =?utf-8?B?S1FSdU1pQjFGZUY5bE1Vb2hpY3V3VTErMXY3UXBwcTZTNGl2eVExUyswTnJM?=
 =?utf-8?B?WHhad2tRZCtKN0JRRStBOUFSS1BLd0h1UUs4dnd0SWg0WGJXbGIrRHpwN0tH?=
 =?utf-8?B?blJWOXNPRGRqNDJlOU9HTEQ3TzRtSXBkSCtUb0xveW44dDZ6VzNmekxOM0JN?=
 =?utf-8?B?RElWSEYzS1Z3NHFya2xoQmltYTJUK0V5Um50TFpsN3BDcnFpM2lqeU9zZG5C?=
 =?utf-8?B?QTVQOGVRQ1orWkI0Z1RBSkFiMkgvZDhDd3ZJQWQxcUV6eGhPakI5ZmJrQnNE?=
 =?utf-8?B?eXBYM2tWcGpLTmd5dGtmTjM5S2gxNElsbC9VNURHbDBIOW16L2JNUUlNVmxM?=
 =?utf-8?B?dndFYnJkTTBBakJFdCt0T2pjdWsrdnc2SzAwZXlINDdiS3Z3YXdBSGgvVmlz?=
 =?utf-8?B?ZFBrNnZKUnF1NVhLT1Y1NEl3STRXSUdLNFBYQnlsMnpCblN6SUw1NExBaG9u?=
 =?utf-8?B?WiszMmV3YkFwRHhublpqYjVGK1g5UGpXZ243WlE0b0w1Zk9VUlFrN3hsWkxS?=
 =?utf-8?B?dlVDTzR6L0Z5aG1qMnBZMktLaWNnci9HRjRzUDN2a0w1bUxKdnpPU3dXbnh5?=
 =?utf-8?B?cU9CT2FoMmszbVY3Ny82Z2NMS0RmR0dSWktvWHBLSkVxSE9UVXFpa2ROZWZi?=
 =?utf-8?B?amU2SzN4RktXYVdQKzlObEo4ODk2N2xvVk9EQ1hJUlZQVkxNcWgvS1dIZy95?=
 =?utf-8?B?cXFuMkdVazBYOGNGdGN3YVFjS1pNN3ppWlVtM1oxTWJwUURSY1MyVkdGcG96?=
 =?utf-8?B?T0hMaUNLNjNSd241ajJmR2FNd2VHQy91RzVOeGJsQjVFdS9TMHlTQm5WMmVM?=
 =?utf-8?B?dHprYVFLY0VzZVdRNFZGREVGSjBCMDJaNUI0VTVNN0tPRCtFb0hyYTJPcHhP?=
 =?utf-8?B?RS9wOERCMzlLa1ZseUJycU5OOVg5UlI1NEowOUhMVU5Kb09ndnU1cktOdGtw?=
 =?utf-8?B?aEVOSnJhamNtNTg4eU92VVNpWFZmdTcvNG96ZXA1bUJCd09iZDJaZXMzYlVJ?=
 =?utf-8?B?aVgydWoxUitXZUNVTE1nNlNXR0FQNE53MjBzbGE4dVdwODBraXVheHZEeHhs?=
 =?utf-8?B?NjA4ZFRGNWxmcXlKVmhrMDV6RHR0T005SURaSTNCc3QzejNHc0VwTHVGMTlX?=
 =?utf-8?B?bHdaZ3QySEZ1Zjh4TW82RU1GUXAyMmVmYzFBdmRNdiszcXhCVDBGTWczWWN2?=
 =?utf-8?B?aWJQZHBYdUFRWGQxMjVJMmZxWGltZkRzZkF0cE9QcS9tMnlLVWRremdPb3Jo?=
 =?utf-8?B?alZuZ0RwRG9xZjZ4a2FXQmcvd3NYZys3aU5ZUUlrMUZQdTZRUVIxYlgyWCtD?=
 =?utf-8?B?SUl6NUx2dTBieVZ1ZnpxS3VGendnU2cydXNvV2VXQnJHMU83Q3dkcitjUEll?=
 =?utf-8?B?cWtFMU9RcmxtUGU4YUNJMjIwZXNwUXJpV1ZnRzh2bFFYME0zem5LL3gyamhU?=
 =?utf-8?Q?xAMC7BsYV94j8KXhdz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2bc323-266e-4a85-8309-08de58cde42e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:17:25.4550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLuOuSWFEzfL/hVy/Lwb7NB1uc+wlPuWeDEY6sneykS3phjuFhoCRMY5WFEQf9Vp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191
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
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: A108454349
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 10:14, Leon Romanovsky wrote:
> On Wed, Jan 21, 2026 at 09:59:59AM +0100, Christian König wrote:
>> On 1/20/26 15:07, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> The .invalidate_mapping() callback is documented as optional, yet it
>>> effectively became mandatory whenever importer_ops were provided. This
>>> led to cases where RDMA non-ODP code had to supply an empty stub just to
>>> provide allow_peer2peer.
>>>
>>> Document this behavior by creating a dedicated export for the
>>> dma_buf_unsupported_invalidate_mappings() function. This function is
>>> intended solely for the RDMA non-ODP case and must not be used by any
>>> other dma-buf importer.
>>>
>>> This makes it possible to rely on a valid .invalidate_mappings()
>>> callback to determine whether an importer supports revocation.
>>>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>>  drivers/dma-buf/dma-buf.c             | 14 ++++++++++++++
>>>  drivers/infiniband/core/umem_dmabuf.c | 11 +----------
>>>  include/linux/dma-buf.h               |  4 +++-
>>>  3 files changed, 18 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index cd3b60ce4863..c4fa35034b92 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -1238,6 +1238,20 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>>>  }
>>>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>>>  
>>> +/*
>>> + * This function shouldn't be used by anyone except RDMA non-ODP case.
>>> + * The reason to it is UAPI mistake where dma-buf was exported to the
>>> + * userspace without knowing that .invalidate_mappings() can be called
>>> + * for pinned memory too.
>>> + *
>>> + * This warning shouldn't be seen in real production scenario.
>>> + */
>>> +void dma_buf_unsupported_invalidate_mappings(struct dma_buf_attachment *attach)
>>> +{
>>> +	pr_warn("Invalidate callback should not be called when memory is pinned\n");
>>> +}
>>> +EXPORT_SYMBOL_FOR_MODULES(dma_buf_unsupported_invalidate_mappings, "ib_uverbs");
>>> +
>>
>> Well that is exactly the opposite of what I had in mind.
>>
>> The RDMA non-ODP case should explicitly not provide an invalidate_mappings callback, but only the dma_buf_attach_ops with allow_peer2peer set to true.
>>
>> This is done to explicitly note that RDMA non-ODP can't do invalidation's.
> 
> We want to achieve two goals:
> 1. Provide a meaningful warning to developers, rather than failing later
>    because dma_buf_move_notify() was called on this problematic imported dma-buf.
> 2. Require all users to supply a valid .invalidate_mapping().

Nope, that is something I would reject. invalidate_mappings must stay optional.

> 
> If I allow empty .invalidate_mapping(), this check will go too:

Correct, that is the whole idea.

>    932 struct dma_buf_attachment *
>    933 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>    934                        const struct dma_buf_attach_ops *importer_ops,
>    935                        void *importer_priv)
> ...
>    943         if (WARN_ON(importer_ops && !importer_ops->invalidate_mappings))
>    944                 return ERR_PTR(-EINVAL);
> 
> And it is important part of dma-buf.

No, as far as I can see that is what we try to avoid.

The whole idea is to make invalidate_mappings truly optional.

Regards,
Christian.

> 
> Thanks

