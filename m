Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFWNI0jacGnCaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:53:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EA57F3E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA9910E7D3;
	Wed, 21 Jan 2026 13:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ItVwzuS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D46110E7D0;
 Wed, 21 Jan 2026 13:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL9XbjsLMP2Zk9veyWDLp6Uw3+Y5KcvbZqIYXTpBMunFxYSYkd42su+X2F9sslw27qBll/bB1mT/spaTuGtaUG4ZqD/MsqJeKl8lezNsj67J7r5YsmxdKwDIUGpgkwSW+cbJtqMPTNa3mlLsWV/tb6h1LcN4p3nE0Y7K1lf92j34z629fTWNrqrp6Y2iOc4hASSdQ2ItMPeW9Uc2ASUs96gE/8kxYOs9O/8DCcfHFXmWImEnHkk65I3mVwQjL42R+DU3V2hjSSU4cYYHvK7aNPHC/w4lgwDkfQFr+VevP147pFL1npIRsRkJB9eHX3Fn5hwq3eWzkj7p+cEN1OiezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWC2EDpcMao6As7JOabA28Z08OG33QvL1mik3mGTn+0=;
 b=XScUNCD1iN+7HWBtyRU6BjffzNG0OGH/iarzMTHVyENsTtFzmW+TNos+vAGN305iatnUtGGPJlAdRkKmntxFiDfiARuBGvrpxRyip454sZkYX5LIgpPKycbFO9BpamvSnU0KW6sTa/oui16MzwN+Bprr90hKE8lbWCP0oBg6Qh4wDavN42qYw6jkGEEua1BcQkcluT6yhbzvXDGaK+ei5zF5VndRos8+Gp8cTnYP6IjFHJ2KWS7/9mderBnLiVNfn27e0yhwMoNWxq4HoMjczgXvlKsncmDLadmI9jz6XpLf8RncGv0Xo5qZMOAi6ICrdPALljW5foBeJMJ5SkQ28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWC2EDpcMao6As7JOabA28Z08OG33QvL1mik3mGTn+0=;
 b=ItVwzuS+VAQMzkRgNXC/li2WnNgNVz3cz59+zOGDmTl+UbJ3orBrlm3GNcfNbYl+kfASjmj3cnJkHtJtQC9+MAKAE9ka6or1wfeeL/k3ogYV1TBlyVyTk4LRDdenFds7sM5NkGEJnp9sdMRsB1an3JJ+0fGpmt6F/MLIwNnHJ78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7116.namprd12.prod.outlook.com (2603:10b6:510:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:53:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 13:53:05 +0000
Message-ID: <8a8ba092-6cfa-41d2-8137-e5e9d917e914@amd.com>
Date: Wed, 21 Jan 2026 14:52:53 +0100
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260121131852.GX961572@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 64210bfb-4f31-41e7-16eb-08de58f466b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blJqTVBZLytWUGMvZTdRV1hhYzE0ckxCNXRUSm1rNjY4VXpqRCtQeWNsUFFK?=
 =?utf-8?B?WlYra3pqV0tTTVd4bzAyclJrSVB0NTNPMWFUN0huQjAvTnhrclhPMVhIUGQv?=
 =?utf-8?B?RFVyampMZTRBdGpkYWUxRTh3b2lNcEJGZEFVcFkwK3czVTRhdU1qeFhKYklV?=
 =?utf-8?B?cktUbERLVDE2VGFhNURiMHFyMmpDc0NWVjk4SkxmU2FRNHEwaWhmWjloSWFN?=
 =?utf-8?B?Zzc5cEpCUFQ5eW5jQ1dHMnZQd1kwRGl1cXBORjVncW5UMVptYjVLRjNuZkVB?=
 =?utf-8?B?bTFkK0FDMWFNdGJ2UTRhRWFTTFA5WFBMKzBhcmJuUVQzNlFyejU5NU53THUz?=
 =?utf-8?B?VURrczdxdlljdHlVRHFOaG40LzFSZC9OVmNRWFpLTncreXFqbHcreTlxRGhH?=
 =?utf-8?B?QmJxTEExcktPUHAwcFZoTW1ROFcrbnZVOWwyRGl3TWc0ZTlRQzdTQnZtR0Jj?=
 =?utf-8?B?YUYxSzNQTlh3Z25YSnlkaWtQVGhVMjY4Qkp2MGhrM3JxbEpSa2IrNkhKek9K?=
 =?utf-8?B?MVhOSjhOQTZnL0JiZ2FCNk1ZWEVDcVduWGNrSittNXg4eVlJQm1lSFNtUnlF?=
 =?utf-8?B?UTFFekhMYmJENmp6QTJ5U21tZ1FJWVhEZ0hwZm1ZRW9pQW84TjF4dG1DK3RV?=
 =?utf-8?B?eHYzcFI3K3Mxc0VHbWlTQ0VCUHZ5QVBQbk9vb0xxcGFNRThOUUF6bXNPN0Jz?=
 =?utf-8?B?am1wK2pXQjBqQ0dsRlNnZERyeTJzcUNFY2E0QzFOQ0xFR2JyRy9xQXExNkRa?=
 =?utf-8?B?b21TWlpXSk1veDczQW5HRnRCOUJDcDFHeC9IOWtVZEVRZmZMZ1RRcW4yVkJO?=
 =?utf-8?B?Tm1uaGxpS1JUV2JCUU52VVFkanBlK0RrMlhkcHFBV1NSU3BnUmp6SjZadmI0?=
 =?utf-8?B?R1laUUlidlg1bVFUWGVBL2JETkxVa0JGYUEzN3pNSGN0TGVPdDlMTUhMakVY?=
 =?utf-8?B?ZFhBNmQ4UHNmemcvZFc1ZFUwN0o5VUV3b2tBYjd0cm5Na25XQ0ZTV2JmMlVD?=
 =?utf-8?B?VUh4VkN1Q3VoRFhrR3pIKytpVlFJSjNFOEhlTjA1UWNFMHp0YWRrMkkrOEky?=
 =?utf-8?B?Qi9ZOXlNdENTUkc5cVMvbWpHanQ4UUFpYmlWQndFVnljOURiY0FOaTBUUHFH?=
 =?utf-8?B?QjQ2cGxFRER3SEFhT25DVlp5SWgxcjM4a2hYYU9PRVNLa0RkVFhCc1J1bC8v?=
 =?utf-8?B?NmxadHFIL05TUTdaekd3UHBTekhGWHpuL05OYzdlSFlBOWFLa1RiK2RZa0Rm?=
 =?utf-8?B?V0JlTUxKT21Kb0ZqK0c1clZjQjN6MGovZlpKM1UyU2NMdy9hSGd6bmw1Y1Ru?=
 =?utf-8?B?WUVTN0ZjUzJzc0NSY3F0aEUxelVPcFJ6N09YSlVQUzhCWFVGaHdneVJMUFBw?=
 =?utf-8?B?SVR2R0VFYVpKbWtNVUFZNjN1S1BaS2NNeG1qTVBTZXd5UGlOMHBnMDh3VHZR?=
 =?utf-8?B?OUo2TE5PSXlmbXhQTlgzT1FpTmdVNndlUE40SHhOdFhEU1VYM3J6a3FudXYx?=
 =?utf-8?B?ZGxzclFGQ2tMNUlsSVN0Vm9kZFpCaG00bmNFMWlVOVo3cmlBS3lKbFh6NlZS?=
 =?utf-8?B?a21uQjBqSzd0cXA4eklzWWV3VUVHQnF5bnpJY3pYdmQxS2xxeHk0bTdHWDhC?=
 =?utf-8?B?bjZVSUZWeUNGbXc1VUNibXRCaWpZTVc1NEUzZWppRVcwRXlpS3ozR0xlMng1?=
 =?utf-8?B?dzFDalRDRHQ1QXA1OUVSWGltQVpqZWNpNnp6dVcyUlpYdVkwT1ZkRzBwMm41?=
 =?utf-8?B?eXB1UjVKV2VUZUlSMzZBcFA1NWI2SU5HR2RFbllZa3Q0YkhsblFmLzZVRHM4?=
 =?utf-8?B?Z0FTc1Jud2hVNi9ZV3ZGcDB1b3VBWWsxUlo5TTdYUVJDNVFoclRtcTdLUkhM?=
 =?utf-8?B?alJPWXhIc3VVbWloUmlIR1VjQUZXK3pPM1EvbURzWHJBNWlqb1ZyNXdkQjRt?=
 =?utf-8?B?emFuaG5UcnE4T0puSFdub0Q4V3o1ZlNrTmhiWXpoc2J1amxhYWlYVWg0RlNQ?=
 =?utf-8?B?TjA2Zm1DOUNRNU1mMlFNR3dYdUpzZFhXeVVTN3Y1bFJURXhmbFhzUjQrcm1u?=
 =?utf-8?B?TWZJb0FKRnF6MVpXSGNSVWd6Z1R6WFAwSVZvd2RvbUlUMHlKVzRINWZkUjRL?=
 =?utf-8?Q?0APw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2JVcHZFNUthblNTOXltM3NCN3Fvd1gwRHdTaGRvSlQrSXlsR0cydXlkaFVV?=
 =?utf-8?B?L2RzM2ZkTThwVDlLNFM4Zi9FUDgyZkNWYjZSZWtHaDFOMzhuckJpa0tNL2Vm?=
 =?utf-8?B?UVNCYXVNeHhCZG1RYjhMeTJjMEYweEljOTYzblVmUCtOczlBeXdBSGdIM2th?=
 =?utf-8?B?ODZvako2OFF1T0drSWRNVTRsS1dDMXlCekxxN0I3b0FBOTdWTGFCY0FNWnBo?=
 =?utf-8?B?ZmZ2bzVNTzZSdXNhcytkRmhnT3VXUDZWeDU4ak14a1ZFekNFRTIzNnVXVExK?=
 =?utf-8?B?UHRzeC9kNjFKTzgxUHluVG52cWlZMHNsTTE4TElBNnRPbUVDYW9sS0pNd0JR?=
 =?utf-8?B?Q2tTZTNUUG9VR2lqVGhqc2R6UmdNVEs1eFp3YVZwa0Vxa1JYS1BySDZ3endB?=
 =?utf-8?B?TDdZWE9DMEJwUW1VYUYraHRUUTlwSVV3dEdSNnF1ZlN4OExYb0ZKZTdaLzBY?=
 =?utf-8?B?UXlleTVCOWFTRGJ6aUNuOHlVVkRHaURqODJUbnZuR2szWHFCVkdFd0hrdUNm?=
 =?utf-8?B?VnhzK3ZhV3Ivc2FRc0U1bUVWY1pRNXAxcWtUd0NJOXBpYVBEckFWWUd0WUVM?=
 =?utf-8?B?TUJ1eUovQmgvaWx2NVFRUklpckZYTVdqSVpqWmpGcXk1bFRObnZFVnZaTC9p?=
 =?utf-8?B?RGI5bHc1emRTV0lEeUl6UHVvMDNndlI5T1NRdzVjZEkwdFg0b3VoZkFlWnBt?=
 =?utf-8?B?dTBaTmdoZUV3RlF4UllQTWdEZUMzVk9kblU5eUZCSTM3QXVtN1VzMVc1eW5q?=
 =?utf-8?B?YW5SRHcybkNYcWpCS1hMVU9pckg1RUduUWZOQk9IVWYxdjcyUDRuMnZ5WVVI?=
 =?utf-8?B?NTFDVW9EM3ZZd25nbXpLd0ovbVh0ZUlyM09xVkc5czBBR0ZEYmptdUtWSHRt?=
 =?utf-8?B?VXhYN1BkT0VWRGVDV2taWW9UZjZrRzVPSnNMejFMVGR5THlDNUVRWTA1cnNy?=
 =?utf-8?B?MWJqYmh6aVRkVkwvUUR4TWdVK3pNdEEyNE4zeE1CVHFteVZBYVJZWlgxMzVv?=
 =?utf-8?B?cDI0eWo1VHNjODV3UXN4RlJITzhpaUtYWUV0Z1FDdDN4TGJkREhPMXJYTDdy?=
 =?utf-8?B?S0RWV0tabW5Eb0ljeEgzbCtuRlRKZEFyZUJmS2FpT0J0bEY5aEZOeDdsRGJq?=
 =?utf-8?B?UFB3Vm1iT2QvTTFKdmthTUdmclYyck9TS0Jqa2owNEp0emdKZ245WGZpWGJr?=
 =?utf-8?B?TGhLTDJFb0MwNFNWa2FURnRmVlUrQkluZEhoRk9paElKRXFOTkFJN0pvMDJ5?=
 =?utf-8?B?UVY4bGIxQlEyTUVVZ1ZzVW5xYnBIbFRma2REd0FtVEQ1YWdwNUtxR3hoRmxT?=
 =?utf-8?B?ajdMeFRmcUV3Ri81M2lPZktaS0tjMkZtbjZOdVl2eXN5NXpWZ01Sb2grd2xY?=
 =?utf-8?B?ci9wS3kwTWtjOWJTMm9FTVg0dE1pSldISjhJR2cxQmRrT0FsQ2c4TytLRUNs?=
 =?utf-8?B?Wml2ZUhyZ1N4UklUM2VJWmgvVk9FaUh6c2J3MmFwQ2hzM3crSm5tMzdXSXly?=
 =?utf-8?B?bW5yYnRTN1ZpU3hGUjVZcENuc3BNWmhtR2Z5dllBRm5zWjl2YjQ1dVM3bmZq?=
 =?utf-8?B?NFJjVGF6RTBPdDZaV21hdFNwcTJMZ0kvRkJlTGUwRnBQU0Y4VGZVY3FhakxK?=
 =?utf-8?B?bHdxTTFEbzMwMVo3R2VhV0dlMjE1OVhMK01HMTRaa1hrUHI5QnJkbzlaU2JG?=
 =?utf-8?B?cDJuVXRrVWM4RkhvMVFDMVBYd2kzZ25OTlFoWllWT01ibVMwS2hKOHJUOFZH?=
 =?utf-8?B?cjFGMk05cWZIMVl1NWFjMFpXV255MmFhc1I0bkc2K2dnZGVpQmFKN2pZWnUy?=
 =?utf-8?B?cllIYXgrdUNHN0NVamxZRDB4bW5UalpIbDNUdzAvZThkVzl4dTdSNmI4T3VP?=
 =?utf-8?B?ZTBOUll2aGg5WTBYTExuVmtDa2pHa1RDMlR3Skx0YUFYMFRycU9HTUQ1ejdS?=
 =?utf-8?B?azRxSGpNelZvaDJDenhEeWwwNnBtSk13SFE3b25JOWJVVzBRVXVjR0ppNmFm?=
 =?utf-8?B?VlIraWVLSzFuVzZKN0hNNW5TQVQ1Q0VIUTlJYXE1dWxSalNJemR3SDBsV2lz?=
 =?utf-8?B?cXJ3OFhwcmpDei9iTmt6ZW56U0VwVjNwcUlVaFVzaVNhYU13SDRpS3RtV0ln?=
 =?utf-8?B?cndBZ24zRlN3cFBJb1RhQUhtY2wzZEM1QzhLTEd4cjFDRmIzVUxaSVJUT05O?=
 =?utf-8?B?clZ0TmdYOGxjdVhoTDJTWlJTNU80bXBPNDlEdU12Y0NMb1Q1eEVtSTkwVWZI?=
 =?utf-8?B?M2IwZGdNaVI5Smx0bXdUWmFmQW0vQTBraTlzUk9GUGF4ZGY1L2xKZ0crSDRh?=
 =?utf-8?Q?KQVOg3CYvUfvSlirK/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64210bfb-4f31-41e7-16eb-08de58f466b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:53:05.4454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqEJUnZJa3VYEz9Xmci5DgrpCKHYiFs8jzd+L1m+8VJir/TFRNP+/8ePB9Z+UGWx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7116
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:mid,amd.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 3E2EA57F3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 14:18, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 10:17:16AM +0100, Christian König wrote:
>> The whole idea is to make invalidate_mappings truly optional.
> 
> But it's not really optional! It's absence means we are ignoring UAF
> security issues when the exporters do their move_notify() and nothing
> happens.

No that is unproblematic.

See the invalidate_mappings callback just tells the importer that the mapping in question can't be relied on any more.

But the mapping is truly freed only by the importer calling dma_buf_unmap_attachment().

In other words the invalidate_mappings give the signal to the importer to disable all operations and the dma_buf_unmap_attachment() is the signal from the importer that the housekeeping structures can be freed and the underlying address space or backing object re-used.

Regards,
Christian.

> 
> Given this I don't want to loose the warning log either, the situation
> needs to be reported..
> 
> Jason

