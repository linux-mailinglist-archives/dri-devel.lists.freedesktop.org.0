Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MPmMaainGnqJgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 19:55:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452BB17BE1A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 19:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B0410E309;
	Mon, 23 Feb 2026 18:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VDtByfQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DD710E053;
 Mon, 23 Feb 2026 18:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLEUgMAY/40RlERrALzkofi7ptL0LDMRFIaS+jtQfdyuLtKITU9+owunKYLpp5eTGWOjCF61T3Wl0ji+fDmBQIVa01/sQGzvjo5J5WuW8SVBLwyQdMQCs6jz54LQ1IlpJj+hRzoVmSQClYcX4UjZhXv1m0jSdjMz2YJTZ/Gf8jxL/jv4xsCY7JWvqaocgyG/lKgwEh9tOd10UFOUO6az6FjLvtctNCRKnjXPCVGahJMeHCNN6jCV8gXL5RwhEyh2RPn5GQDpNivFWo+JnxS7YR3XttIv9YuLvjlWNw21t7ce1WxoMq5/crTC/hQaQJv/ObMSS6d46DqIfvtx2+fDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqAlS8ysd7uOxEsRC9UtYzJTEFDeb/jaM/XAifxOe9E=;
 b=B2LRoVi2faExkbjx8c8f2nZtTehqE4l7lzwMA5HhVOvztAyIQcQvLJ48YjK3UAcsQKMMaZ0aNBzFec4x+L6v7ut8NU5oyYH68LFoNPM+LW36Yj59oMnTxpxHym/GCFnbzHqfD4St9alSbrmvfTHudCRtykyA6y8IS4dd1Qg7cn84XfaCXjXxhs4O2i2PxIPZzHapsfeAmDEVKWVOTU5iz30KEjxvz3TZdqFanI+NcxpTU8y8LPKcnyifkRApYDsy4xSqvHD36LXmlXqyVXZB4S43KUOn/zIuNykQNnEDvbWZUfxwfExQfEBU79gmWdvcEKftzllQGNVdByIYcJ1qYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqAlS8ysd7uOxEsRC9UtYzJTEFDeb/jaM/XAifxOe9E=;
 b=VDtByfQ50CIIaNuH3mLgJ34Z+NqRF/en2oozyRUhe9mA0ux+hvzoNhGcjwNzsUTXdzzCsL0Lhc4RqPTUrLct/LKNFBcfUBwf7Jjjpa0ApMrhQRWCr1JnTwhmmD3O6nsKAvKCF+ykHeogWekace/Uj8ySeNLreQx0ZnG0JUf8HEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 18:55:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 18:55:25 +0000
Message-ID: <90088594-5835-4f4f-9e69-aaee67109aa1@amd.com>
Date: Mon, 23 Feb 2026 19:55:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] dma-buf: Use revoke mechanism to invalidate shared
 buffers
To: Leon Romanovsky <leon@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>, 
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
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260217080206.GJ12989@unreal>
 <0aa8147c-254d-4a1c-89ee-9dc4d4b6b022@amd.com>
 <20260217133431.GN12989@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260217133431.GN12989@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:408:f8::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b769b87-150b-436f-204d-08de730d1a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2JLMWlJa2krMndvUldFaGtYUUJBUkFXN2lGU3JvTEZ6OTVIbG0vdm1VZkZH?=
 =?utf-8?B?YmM4N3M3NzZNNlM2azBwYnNubEJiWlIyL20rTVpjMUNTTFVBck95WGltejFJ?=
 =?utf-8?B?cDREYmowemNWZVFPSHU1cFZ0cER0U1VqNVBoaG1MamtSa3pXWHlTcExtTTdY?=
 =?utf-8?B?WTIxbWd6ZllwSndIS3hkWWl5WGxlVnpRRkt0SEF1L0RXU1FueUQxV1NlTnpZ?=
 =?utf-8?B?N01VblVhbHpTUFFHTC8vVlJtazZGS2JqaW5qRU9VcnM2bmhDSkpZaTVFZkVo?=
 =?utf-8?B?aUxJQ0lhNTIrb01sb0lzeDU4Nk1NVSt6czFiQUhPeWRHSjhLSDRkSUo5RlQx?=
 =?utf-8?B?NkswMzg0Zjcya0g5NWpFRUJoOEIxMDNZaDh3TG02ZnZHVmh1ZWJnRVFBa0FM?=
 =?utf-8?B?QkV3TVAxQjllTEJXUHdmY1duby9ic2t1UVk5bnJ0RmcyQmRJL0hEY09Mb3M3?=
 =?utf-8?B?bFhQaCtyemxlZlErbmJzRDVBRm1PVVR5MVFtQmlUKzVWK0xFOVQ2ajExZ1Rl?=
 =?utf-8?B?eW1FWHZNK0pOVDJZNTYrM1pVd2h0Tit6U291T0dDYnpHOVRIQ3F0OTBPdVZY?=
 =?utf-8?B?ZHp4MzhmWlV1RGl3OURtcEhNWXNRY0NUVENqdGFKQ0ZYN0ZjY1o4Zjk1SCtF?=
 =?utf-8?B?bjRXZFIrREtMMWF1Z0cxV3QrTXFONnFQaU85MzBDV1JIRTIxZE10R0pjSVo1?=
 =?utf-8?B?ZnhnZUNKNXpoZUt1dnpieGJHOVBTRjRxZHRGWDFGUjErR2M0REhMTGhSTnpS?=
 =?utf-8?B?LzlvNlFPYU5RVEZGRnVYWk0vdjlNYUFVOW85blhXM01TWUtmeWoxeldVaWZa?=
 =?utf-8?B?N0ZscGs5RG5SQ2RxeVlNZ1BjZDBMeVd1R1dGR2ZFMWFOMEhDYkw3a2swdXJh?=
 =?utf-8?B?Ym0ybnRORGdLcy9VM0hZSUI2RkFKY3hRcXRLOFZUTVJ4ekdoSnRIcVczK0RW?=
 =?utf-8?B?MVFJeFhiZjVBL1dHbHB5eEMwcXVqS3ZXM1dKVmhUemZxdlBSQU5GMVZORjZV?=
 =?utf-8?B?aUxuVzJpWU4vRlFSRFd3U3RaTTV2VEpWcUxXTHFNeEdOUmlhQ0IxQ1haMUxh?=
 =?utf-8?B?bThhaTQxTDh1cXJ6SWtmUmRpZnMrcGpPMStSM1NpbVdWNjhkaytTOWJydW9I?=
 =?utf-8?B?TVBaOXpjSzlORE1yK2ZRVkljZlhMZTlCOFhJZ2RwUG43d3Faa282eEtnSWEr?=
 =?utf-8?B?d29xWmZuT0hDQ2hESVpHKzY2aEcycnVucEV6cFJwYmxacmhwZFVNakIzNjE0?=
 =?utf-8?B?TlkxNnpTejR3bFpaUk83NUhUSm1PMzdteGFSZzJJQUxLZHVZNGFjcXBPZ05x?=
 =?utf-8?B?cXlncVppd0pGLy9xMXR6UitlMFJxVkg2SUNsNitZb0FTbmNhM1NTSVRsenZH?=
 =?utf-8?B?S1NhNTR1OWkxaEU0YUh5V3dHK2I2MTFRcUhHZ2llVy9Mcmwxd29yNUlrSTNF?=
 =?utf-8?B?cGNYNFFIeVNtQ2FVVjBpL1U0eFYvVmhJbkszQ0RMcWVieTlwR1NzU0lGL2ty?=
 =?utf-8?B?clU2cERLSWJDNUZUV0FIald1VjFISldaNm01Lzh0KzE5SlF3RlFzZjJNdFpU?=
 =?utf-8?B?SFF5OU0rb2VMd1B1bW9MSXV0czZsTXVDdThuUDNyVGZvUDM4UUZrS0REOGtn?=
 =?utf-8?B?c05Xam1yeUVQc3JNVkJWMUhyWDFtbXB6anFQcTNUcmk0Z05DeGhVWFBWQ2lY?=
 =?utf-8?B?Uk0yL0s4SjRTVVhDNXdMTUJJNXNudFp5c2dnVC9EclJwTmtBNE9GOGhOcUpU?=
 =?utf-8?B?YWlNSGtDNlhjaXRVamxWSUhFY2NsQStGYlI4M3RJOGZxRFQzdUp3bGpubjlw?=
 =?utf-8?B?dUdubzh2eWNBNHo3OGptVkVBZjRrUWxnby90MzBEMzBkeVBlb2IzTDc1cTlF?=
 =?utf-8?B?S3crRjJ1RC9jTEMvRnFpM3c3clM2RzBEV1NKWXdSY1o0VFIzMTVVd3B0VlJt?=
 =?utf-8?B?SXUrTFlvZHU0QXB1UTVXamhqdnFQVWtKc1NkYVQzUUxlbDVqM3M2TllXWHhD?=
 =?utf-8?B?OUpBQUozbG5QWENWUFduUG1OVERLcGk0TytLeW95UmxmQS9tSkxFK3pxN1N5?=
 =?utf-8?B?RzcyTzN0cGVZNlNYTkw2ei94UWpTN3oxZzV4L1BtUW8yRWx5blYwbVBEL0R5?=
 =?utf-8?Q?jSmw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnYyVmFIVmtaM3IwenFKbUVrTy9hZVZHRmUrWm1CbWlLM2xQc3pRWHVoTkJZ?=
 =?utf-8?B?b3A1Lzk0dHN4dFk1SE5ueVVwOGNXUjhJdWJQcGlQSzR2R2YzdWUveFBPdEJC?=
 =?utf-8?B?YXZ5dlR1WUprbVpVM3JGdTJUR1kzRWVRSmdLR3FRNkZtcnRUVEdMMmkvdy9Z?=
 =?utf-8?B?ZUtjd0JBd1JnUkp1ZWtibnJGNFplRzJPem1SVlNxWUx5SXk1RWxIdjh0L0oy?=
 =?utf-8?B?TXhTOHEvbGt0QTE1V3krNTBMcmFpZ2FyNjNrVTkxeWd2clNEUkY2d3Q3Z1Fl?=
 =?utf-8?B?M0V0MG9ubWVoRE05VmsxNjdXU1VCMTBNeS8zMVk5TUZVb2JMemtYYzJXeUR0?=
 =?utf-8?B?Y0ZqdXZ0Q1FrU2tjV3RYNFFDZy9CZUtkbGI0eFR2V3JBWW85RzBTcVdoWGJs?=
 =?utf-8?B?WnFidWNveEdqRnVRT3pRWHBUK1N1b2FFLzIra3FLTisyWThtUkkxaGRXTHE4?=
 =?utf-8?B?SFAveE1EZkV5VVkzSVEydFhTV2twT3pZRXNtK0dWSnV0S0NPY2ZUTmx2K01N?=
 =?utf-8?B?STRSNHdxSGZsTkkwVmNpd3gvM1lsRkhybm0ySjJraENiaE5LcTRSSHBNUkx3?=
 =?utf-8?B?QjJQRXJTZWlha2lHelNlNlY1dnJGYUpQNGo3cUpINm5kOVg2SWdFQVVuWGt0?=
 =?utf-8?B?ZG0zbFhrTzMrbzM4cU1LN2I2amt6U2JCRkYxN2lnZGgySHVGVi82NXZDNHVk?=
 =?utf-8?B?cXIvMGFqK3RyT0NqdVlXaWtCUVdrT2J5TzhLRCs4OEIvaDlDMzBDR2J6bFI1?=
 =?utf-8?B?cGg2V0c1MmU4dWtQeGkrdXpTVVNlVjNaZDRVREpsUTd5NjQ3QWZYOUwzS2tZ?=
 =?utf-8?B?SmJHQkY5MTRUTGpRTkFUS1FPbXBJRitNd0t2M3FRNksyVmQ3SE00b3VJVE05?=
 =?utf-8?B?ekFnVGwzV3dhZ1VHVEJNWEQxNGVCZ3ZMZWg4aloraUpwWWpxRzh1SGFZT1Za?=
 =?utf-8?B?TTR1RjN5cjk0YlVoV25vS1NPWTVCK3dMV2xVOEh2NjBrTkthUmdaK2NMcDNL?=
 =?utf-8?B?bFpmSWxTOFhhSGNzWUhPUzE0eUkvYVg5UDlNc0N0cHByUVVESklXSGRNSEFX?=
 =?utf-8?B?MFMvcENzcHRwcmo2Ynl3amp2K2RqMXBlZitTRVErM1JmdXNrREpGejV3WDRF?=
 =?utf-8?B?NEd3Y2dqRWM5Uk93RG85UzF6UVY4VlUwOE1JckcrS2VEV0dMVzFSOHNIYlFa?=
 =?utf-8?B?Z2JnQWs2UFFyRjFEWWtXT2tLcVZLQjUrdUc0aW4vdUJnNURkK3ZtZ01uVXBj?=
 =?utf-8?B?ZHhiUzZTU3J1V2FLZWRldnhzTXlISUsvc2J5WW14WDI2dzVzaUJJUkF4dGNU?=
 =?utf-8?B?Z2hGVWk4a2FwZ3VUNUdMMStMVWQ5UktDZGd4YW9URG9qOUsxUWhHVHNzbGQw?=
 =?utf-8?B?NFErMFJPNmM3Mmd0S1lwMHU0MStPZTl2WkN4ejhra2lrYjhWM1dzYURtTU9O?=
 =?utf-8?B?d2ZqN3VLU2Q4M3R2cVBZcTZJbXBRY2Y5UmgyR000YkJ1cUNpZmY5NmlxYjNP?=
 =?utf-8?B?WlhxN2ZkK29wcUp3bjNNMzlmZHFLZTZndjRMKzdMTVdOUGtYb21EZW8xNVdQ?=
 =?utf-8?B?TU9qc3E2UGtOY3l2V3QzdDhDbmg0QWJIY0xGdDd4TE8rQ2d0VnVoYnRKYzFH?=
 =?utf-8?B?eFdNUmM2a1VndkFOREhLWnhkSkQ0cHNxNkY2dlVMRDVvRmRySFgvS1hSbDZL?=
 =?utf-8?B?UGYxcnFvb2FmT1UvYktZN3VOS2ozc25mTTQrMTFkbDNSV2VLLzY1alR1Z1NM?=
 =?utf-8?B?dkpwaVUyWmFNNGVXNlVPV2h5eitreWJRL1VPS1ZaNWRnTmdCaHJjM3RCZ2Rl?=
 =?utf-8?B?eDdtQjkwL0Ixa0JjRzNDSlZLRTNWSTFHUkY0VCtLTndmMmxQN28xS3RTazJF?=
 =?utf-8?B?V2FsSVFEVnphTm91Qjh0RWxBUHEvMzB3OVVKd0FSQjlyQ2pPNEhhQ05lNEtr?=
 =?utf-8?B?d2R2SnhsbVBiUVBHWmpXWkxQeTVGRkJYekZLUWdwRUdRUTVDRWJXcktEWlZD?=
 =?utf-8?B?ckRocExVbjZVOFg5Mm9sbzU0cTFlK0ZEUkNLbnFna3ROUHl6Z2JEU2JGRmly?=
 =?utf-8?B?T0R0aXZ0UURuajVWNEdmSHR5TlRMc3ZxeDhkUmtuVlNRN0luc1lNQTZKM0hk?=
 =?utf-8?B?WkNJaHZ6Q3h5RGZIT1h3M016UVdRYWp0WSsrcmF6dTFEeEJDY2RuaktVQXk0?=
 =?utf-8?B?SUZPWGdYRGJoditIYklLK1cxMDRCcStWMXFLd1hMclY4akZaZ293SG5saCs5?=
 =?utf-8?B?UGpRZk9oSDRFb1N2dTZabDFPTW5FS1lBcjVpQ0NvU1UzRDVHR2ZUMTE5clM5?=
 =?utf-8?Q?6gqaHa53dF6szCc9mJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b769b87-150b-436f-204d-08de730d1a8e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:55:25.4288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJQv6CNac1CI6BT0foePYvZC0CyOPYywTmPo6WH+uJkWaJEtGZCdkVhDAeDoa4dg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
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
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,amd.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 452BB17BE1A
X-Rspamd-Action: no action

On 2/17/26 14:34, Leon Romanovsky wrote:
> On Tue, Feb 17, 2026 at 10:52:25AM +0100, Christian König wrote:
>> On 2/17/26 09:02, Leon Romanovsky wrote:
>>> On Sat, Jan 31, 2026 at 07:34:10AM +0200, Leon Romanovsky wrote:
>>>> Changelog:
>>>> v7:
>>>>  * Fixed messed VFIO patch due to rebase.
>>>
>>> <...>
>>>
>>> Christian,
>>>
>>> What should be my next step? Should I resubmit it?
>>
>> No, the patches are fine as they are. I'm just waiting for the backmerge of upstream to apply them.

And pushed to drm-misc-next.

There was a minor merge conflict in patch #5. I think I fixed it up correctly, but only compile tested the result.

Would probably be good time to now test drm-misc-next if you have some userspace test cases.

Regards,
Christian.

> 
> Thanks

