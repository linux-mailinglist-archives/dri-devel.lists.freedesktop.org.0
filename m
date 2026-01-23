Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHIhLpigc2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:23:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308777871F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB8A10EB58;
	Fri, 23 Jan 2026 16:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g6mPFrpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9167410EB58;
 Fri, 23 Jan 2026 16:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8/8EwYXT8E2GxFbvmMxVO0MTjdWQt5rE/K7a/NoIC7DxpeUflhXGsONwp/1no4Bv+c5HQtqiSNiUDYX1i72U3KVDq9MDaea1aRKKJXPjaLmwu6q/gKyLJmegzZZbhUxD68i+x/YkktblvQKVIp5gXwozxqKkTkVx7Sq7n2QdO18vgd/v2ImN4quwctoAf3VJPJIZmuucs/HJPs+QSA+MtY/n3vRAOcs/3RawNSFrCYZ1djQzmH1lyA1JQHTiUuPLGcKUIoX5+6NH31tZ4Mx+M9OZAjCgYz+vGWuaUx3JpTHbuv7PtVFCmhZYLot0UR1sigcFeogQhRt4EkOgPzLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pqmRwb00ynmNjg0P+Pp/LuS2Ak3p0fR9UEyDUxqcU8=;
 b=OIbirseRgLlkw/yTea/PJxLOkv5N9NMxNMXX5l7GF19tLTf9pJr2zbObu/j7ZRFrLqEfN9wAYE8FRm1dCMg7Sc9N2Lb0rrhMzBOh6s98wHhtmWon9ywDbBCSFyDluWq3D1vNFVzw3H5E8j2+V7uwMFkc8XbPB6QkwjPAAsUqdQDop5OnMVebSrNRs97BAkOO+m2hp/70a24s1TCQplIPdkDhxBmb9eTSW15A3HqIF0a5mxZod848w4uvY1qJOPlnSj86/PjA6LeJC+rKjlz3CGlqlxHMblcQgm6MvUMUKhUOZAePbryPzCQYj7RtOKJBiBhqYgGfUK7M28KDCl+biA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pqmRwb00ynmNjg0P+Pp/LuS2Ak3p0fR9UEyDUxqcU8=;
 b=g6mPFrpQdzFbU7Rkh4x+2n4O6LPn5Bv8+xfsCCWaIQv+RpPyWs2m1RsEJW62awF6EFLqTJY2b2FMUtXW5HFE4zbjkJEM5cmsTvOkIENCh0IZAfBDftl5CUI4BtTCF4zcuox7mRMOmPeMn7Q8NSmQ5mIu+mSeSFI49dyY0xwluWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:23:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 16:23:44 +0000
Message-ID: <98b74c7a-44c1-49ba-997b-bbbab60429ba@amd.com>
Date: Fri, 23 Jan 2026 17:23:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
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
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
 <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
 <20260121133146.GY961572@ziepe.ca>
 <b88b500c-bacc-483d-9d1a-725d4158302a@amd.com>
 <20260121160140.GF961572@ziepe.ca>
 <a1c55bd8-9891-4064-83fe-ac56141e586f@amd.com>
 <20260122234404.GB1589888@ziepe.ca> <20260123141140.GC1589888@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260123141140.GC1589888@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0377.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4402:EE_
X-MS-Office365-Filtering-Correlation-Id: 02316e61-b866-49db-7405-08de5a9bc778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXE0RTgySDhLb0dCNFRydWhLUkxrdisxeVlmWWE1Q0NweEtqc2NpS1dOdTl0?=
 =?utf-8?B?SHNIM2dPVWE3YnFyWHFtcExVeklLeEVXbGc1djhKYVJHMFFhVXZVN2RqcHQ4?=
 =?utf-8?B?d1FvWEZIYTIzZExJU1FBT3NncWN4NjF5SHhsSEtCTnVsVjNLOEFSSmpCaDN3?=
 =?utf-8?B?M0RDVG9VN1JydGVBdHdWSjZiVSt4NmNsTHBxN2pFcTVyU0tDU0VKZWN6OGJO?=
 =?utf-8?B?OUZFRXVSR1pvdDJEQ21CWW1tL1N2Q3NEanVOOUR2ak1Ta2FiL2lheUg4NWRB?=
 =?utf-8?B?aGhZa2tpOFVBTXdvYkZ6bVc4eXNJN0J4N2Mxc1VtVmRFMDdNdGpudm1zNDZT?=
 =?utf-8?B?Z3hydDFucnNrTUdCTTlBZzhYK2VDenhOSFVEVmdRMnc1akhyYnloVzBQTU1F?=
 =?utf-8?B?cXZjdXgya1hQa2UyN3p6enEvUVpvNm0vLzFOOFlySGkxRFNXSWJtemtzbGY5?=
 =?utf-8?B?QXl2R1lXaUd1T3dPMDBVUDNSeE93RGhCSlZvdUdsRGpScEN0M0ZlN1F2dFZQ?=
 =?utf-8?B?dnFqeE1rVkJlaFJYY3ZqYlRNY3lqN3BuSVlKQWw0cTFqYUVhS1lLQ0F5a1FS?=
 =?utf-8?B?RVkvMEZ4WVNSZysrUnhuUFphUWtXQ250K3lNWTJheWh4aVl3VTFRZ2NpSVhr?=
 =?utf-8?B?aXA2aTladHVKM1hRUDlCVnpUelI5NlFFZFlDUzBXd01tMkZuUVJScnZrUDNp?=
 =?utf-8?B?Yzdtcms0TllWem82elNyaW9mL3lIaGlEdVpzanVCZUlIbkt6TjdKS3RpYno1?=
 =?utf-8?B?QU53dk9oNWZ4U1IyNWpzay9YOFUzb0dNV2pnWTh4WGhyRUxwRGtmRnhxOEdi?=
 =?utf-8?B?MGhpcjFmTERRTjNzaWhHOWMzZzJraHRUeGZrM0EzdlhQZlI1c29Ea2xxMXVl?=
 =?utf-8?B?cWx4M3ovS0orSVJMWW4xVXZDZlBnV0RvYitGR0FPOGJlYnRUN3VBbDRKRUEr?=
 =?utf-8?B?cnlxcVlFL1J2bDRpSTBKNDVZMVhEcEdZdU5qQ0p2RWpQWFplc3J3dkNnbVVR?=
 =?utf-8?B?V1dXdHBCejVqZzNKVytlajh6TkdXOXl4bHB6YlpDK2U5ZVI5UGt1L3dnTndZ?=
 =?utf-8?B?RmNVdkJCbmtLVTFSSDQxOXd6cTlSS3BSU1kwVm8rZHZmSkxjR2dIL2hiWE5n?=
 =?utf-8?B?OTdZRHR1Tlc3UTlyRllONUhacnVMQXpwWlBnSXZvK01yQWFValBjM3E4aVZ1?=
 =?utf-8?B?cXVEUkxFUjdQQkRVK2ExTGk1QUUzZkZGRjNkZUNmcG1kUVNEbm9kZ3hqRTBG?=
 =?utf-8?B?RUNVTzZ2OW15ZndNUTJrdnU4R1JDeGpYYTg1SDZEN05PdmZoNnBSclNFZ3pK?=
 =?utf-8?B?TXZOallpK0o0dVA4a2NIVG11L3RJVjBtaHpib0duejN5RHMvTC9DVzZKeVdj?=
 =?utf-8?B?RC93ZFdodFBmeEptMmZZdU9QSkJERThIQVQvYmtqZ0w0Q0tNRVdrV2JhL0o3?=
 =?utf-8?B?U1pmWVZSTzRUMEpldVk1eUdXYXk4UmhIMkVTQ2VhTTlwZm5kY3RSR2NzNHVS?=
 =?utf-8?B?MHJoMHJMNVhRcit4eVJoWlo3NGtSamFuRVpsNGlVT21DdDRNSTl2MUthNXRH?=
 =?utf-8?B?bkd6SVhXSUVjckJLaHM3dTBZWjg1QTlrM3VERzlDT2FZS21aTlhzV3NWTnZw?=
 =?utf-8?B?UytNam16OXcvOWlORXlEcXZaYkRGUGxDdkxYaUpSNVNWMXQrWU43OUgrOU9R?=
 =?utf-8?B?bDNqUllveXl0U09YQ00rN1RiQlJWb1o4Z0VsVk1sVDc5VWJUUDlaS3pCc2lw?=
 =?utf-8?B?NXo2MDYyRlhCY1BtdTd1T2tnOHh1R1U3UmY2d1I0SEFPeEtSbU9QenhESnFK?=
 =?utf-8?B?OXh1NUJwYVZCdzM3Zm00bHNaMEpJdVZBMzM3U3BiTHpoQ1owcUwxRXVFU21y?=
 =?utf-8?B?YzZxY1htckdpLzlnZWNIOEo3SkNmWkVZNjYvSmhmZlFpWUpGeDBadGR5VjFR?=
 =?utf-8?B?VldabUdwUEFJNmoxeEgrdDM4SFhWYWlwQ04vTjNoQ1V0OVBuc3BOdGcvaUFv?=
 =?utf-8?B?Mk5RYTVSem1iMEVka1I2elErZUo5aVlMOXhYamRMbW44OStHbURmajBYb0hy?=
 =?utf-8?B?VnErR0k4ekZFMWVjTHVSeWg3cnB2c3BHeldhWXpHNG9sejAzbFQvcWw3a2NS?=
 =?utf-8?Q?2sc4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEVKSnJYb0dweEJra2dWa0kxTjViUmk2Sm1OWFFpaGRNMkIzSXExT1VZZ09R?=
 =?utf-8?B?Z0tleTl6Q09kQUdRZGE2OG1NcG54ajNnTFE1Yjc5TEdrSEdsOHI1S3lNQ3d1?=
 =?utf-8?B?aXdQUzBFNmJpZ2NtU3RsYlN6LzlXWnVMRCs0UnVOTStwOVBQeFZGalRYVmla?=
 =?utf-8?B?eXZ5YWpnS3pHeVpMTVE3TVF3NGNaekxNL2xYWC9uSnJVdjc4SDYvSUlwV1lS?=
 =?utf-8?B?bWxNR0xmWGI0VjFrb3RoUmE4ZkNKTFdkQzR0NS9KNWV2TzBRd2VQUkVtUG5F?=
 =?utf-8?B?SVNIV3ZNOXpnL25BU3k1cEhrUUxYc1VSUDRuZjVKZSt6U05Qa2FGQWQyd2NB?=
 =?utf-8?B?OWFtZmtCYzVLMFQrWTVKeG1jZ0E4SlE4OVVoMU1CNktYUitVU3NaQS9reXZO?=
 =?utf-8?B?aWF1TXZaY0J6eGR6NEtrRHFjZFpRRDRrZFhOK0ZQb2N2QUF4NEY4OGI0ai81?=
 =?utf-8?B?U1RGY2dPcFg2b2dIRTNmR0o2SEFaNWc3Tm1MdXNyNk95cG1mZlhuL1BTOFVW?=
 =?utf-8?B?bXZYdmhVWWRtak5NVWNrY1lGalVEVjRoYi9zbmIrZ1E3MVVDaXkraXE4YTN2?=
 =?utf-8?B?K3J6RDVZcDF5RXgyQmM0Z1pHVXU2Y3dPbWtjODZQcEN0QThFT3RjdUJiTklD?=
 =?utf-8?B?S1IyNGxCd2dQMVk1WnIzU3BBYzRLa3hWRXhXclN2WDRXYU5Jd0ozcWhOWERn?=
 =?utf-8?B?UHgxaUlyNzQ5UjNhVk5rY216RU5WNXNpOGVjQVE2RFRaSzZTQUZCZ0JZTFUv?=
 =?utf-8?B?WjJWM1FuYzkya3hwVW8yOWFwZnF2S1RRV01rMExQR3pZL1k5SkxLc0l4dHdD?=
 =?utf-8?B?UXdLSWZCR0NmU3NlZHlkcDhVZUttSlEraldwTm1Td2R4SUdSZmJpVnpEK0VK?=
 =?utf-8?B?MU1mOGtTcmI4VXZCR0tENDk4U21HMWZYN0c1UGFTdFo5dVZaMXR0U0ppUytQ?=
 =?utf-8?B?S1NiTDgzclpjNUJSalV6R3d0WXI0ZGFoK002MEQyMmlSNnZodms2RXJ5cmpr?=
 =?utf-8?B?YW1hSUlRejZBeDVQVDQ2dVFrVlI2ZE5NNENtWlVmMnBmd2NFS0dDa2N4MWNV?=
 =?utf-8?B?WS96K3ZVbi9YRU5tYUpOdjJxK0FOMVpNcXpadXRWMGRsaDZGdjVOYVZQTVRp?=
 =?utf-8?B?c0ZGMmJTckVUM3NUQjMxRXVRUjZadWhza0FxTDJXSHk0MVUxOGFiNVRnZFpu?=
 =?utf-8?B?cElicFZta05nSHJsbjJsMlE3RmdsUlV0NnE2Z2Zia01XU1ZFajk3V1JNSWl5?=
 =?utf-8?B?M3QreHZWd1d4VDFNUUp6S2RkdTU2OXVpeE9xdXcwTDZFY3FDNThrT0YxU0lp?=
 =?utf-8?B?bmhicSsvRGp0WUJVbGgxdnNEY1NWdVdIM1BFcG1JL0ZUY0NKcjFndjdad09l?=
 =?utf-8?B?NEgwSWk4c21YWEVFbGl5YktyaU16L2RLd2dNdFlqeU4wKzFYQjE3RWpSU20r?=
 =?utf-8?B?YWVUK2F2eXdnRVgyRTY5RklQdFhPQlVEZUJwM0o3MndKNkRpNXZERSs3ekJB?=
 =?utf-8?B?eXZNTUVlVFhvb3Z5WHJLeEpFazZ6SXJUTkpqYkdtN1FFYlVDdGpNa1JKM0R0?=
 =?utf-8?B?Wms0WXVPQW03QnBvOWUyN25vZldOaHV0OVFVT1Z1cXZUUFd2S2NhUTdGQlcw?=
 =?utf-8?B?MElkRnBKdHVGeTY2dHN0YmszUW90Y2h2K0szNXlkMzRCUEtWT0dpbHNHcitp?=
 =?utf-8?B?OTU1ZStEak40b1Q1NnRITDRlZi9PRjVudE5tY2x3YzNZYnFrQ2U2aWNXbHdi?=
 =?utf-8?B?ejV0Y0pyWXNkRWNzNGQ5NlJ6ai8ySVlMakxlbDRRZjQ3cXQ5akx2VFFiVmRr?=
 =?utf-8?B?NDhNSlMxQ3VLY2drZWk1Z3grVXA0MUJ4T2hlUW82TGczdWNiL0ZZRDJsNCtx?=
 =?utf-8?B?OVdML1NlbzJramtVbGpDOFQ3OFBodkM3T3dZbTdHZHF0Y0pkL0lEN25ZczZN?=
 =?utf-8?B?amwzWXNkYjRsbm90Q3lUQnloM1V0Q2NYcGJXY3htMXV6OFJuMnJ5K0xBbnFR?=
 =?utf-8?B?NkZja1ZDKytDL3VRaW5QbFl6eVpMZ0V2WlBlYWRvY1F5RWNVdms1N0NvK2JS?=
 =?utf-8?B?WjFVcXVQQy8zV1VsQkh3cUh2ZmswRzZ6cDc1eE5iQ3dOTlM3bUxSMFBFRDBl?=
 =?utf-8?B?V2o4RGM3VWZnbDFOUHVnRGUzWVV6L2s1eE1jTUV5KzhLZkpCb2xWSGJ2OWgw?=
 =?utf-8?B?S1A1SklUdTR2ZUVTd09zSktSOGZFaXROT3A5bzhueUxneTEzQ0VlMUJKNkR6?=
 =?utf-8?B?YXgzVXIwa0YvWFVoTGp4ZzF3TkllRzBtR3prV1RKZlh1RUhYdnVGZXc0OUdR?=
 =?utf-8?Q?0C9jNrWNYf38JmoKvr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02316e61-b866-49db-7405-08de5a9bc778
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:23:44.9129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iT9Z0CM9DZmqGGYB8REIVsyJ/nWgM/k2vdWyhAS93kdXalKfZVpq98Nh+ODrSejC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402
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
	NEURAL_HAM(-0.00)[-0.984];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 308777871F
X-Rspamd-Action: no action

On 1/23/26 15:11, Jason Gunthorpe wrote:
> On Thu, Jan 22, 2026 at 07:44:04PM -0400, Jason Gunthorpe wrote:
>> On Thu, Jan 22, 2026 at 12:32:03PM +0100, Christian König wrote:
>>>>> What roughly happens is that each DMA-buf mapping through a couple
>>>>> of hoops keeps a reference on the device, so even after a hotplug
>>>>> event the device can only fully go away after all housekeeping
>>>>> structures are destroyed and buffers freed.
>>>>
>>>> A simple reference on the device means nothing for these kinds of
>>>> questions. It does not stop unloading and reloading a driver.
>>>
>>> Well as far as I know it stops the PCIe address space from being re-used.
>>>
>>> So when you do an "echo 1 > remove" and then an re-scan on the
>>> upstream bridge that works, but you get different addresses for your
>>> MMIO BARs!
>>
>> That's pretty a niche scenario.. Most people don't rescan their PCI
>> bus. If you just do rmmod/insmod then it will be re-used, there is no
>> rescan to move the MMIO around on that case.
> 
> Ah I just remembered there is another important detail here.
> 
> It is illegal to call the DMA API after your driver is unprobed. The
> kernel can oops. So if a driver is allowing remove() to complete
> before all the dma_buf_unmaps have been called it is buggy and risks
> an oops.
> 
> https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/#m0c7dda0fb5981240879c5ca489176987d688844c
> 
> As calling a dma_buf_unmap() -> dma_unma_sg() after remove() returns
> is not allowed..

That is not even in the hands of the driver. The DMA-buf framework itself does a module_get() on the exporter.

So as long as a DMA-buf exists you *can't* rmmod the module which provides the exporting driver (expect of course of force unloading).

Revoking the DMA mappings won't change anything on that, the importer needs to stop using the DMA-buf and drop all their references.

Christian.

> 
> Jason

