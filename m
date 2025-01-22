Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E43A19273
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 14:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956710E6DF;
	Wed, 22 Jan 2025 13:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x/3H0Q6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9701810E6DF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 13:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agrZlLUI4ehgRUsv+fe7JGbfKVX2bWBtjRBgEJYQZAACsCwrjS9aF0QAKs+SSrUD98nY3kBsNy1UwGa8sjlRXZZcStltdAG3Sgyx6wLIVIPJCGLfj17G+jNYlbV4qLdWAbk6dXA8H+HhElfrwhsGrXk7RNUZ0a2lacxBBEZq2pmtne8oyFFN2yRWidwSl8fvLJaEhfSnmQk4Ucm6Ta1LDjQ+C4NEHohz5L565Mcn3LHMrWu7+92rAEoxYteOyrd2Q1/7GeqZ6YAHoTskMi3UJduFctgNdVH73F7Mv8Nfz8kl/Kan49SQZEh4Y2gDle/COJzSvOpEO3pF5mbg9pEymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjMxcwBOLvfXyD28PT0WTVfH1dQNaGcj+/Aw0ej8AVE=;
 b=OK84sZJhjBaR4Rs0ay2MtqRA+tIaKDfB73amiDL/SNK6NGbQ8uCvo0reCXpJrZvvs/hn1rESxRcr+Bc5TWOKdlDFFMhUmfQADf4eZPHiRmPnxMCI+6t0ZWic463FNYU3riSqH1ySrT6mPeZN9Ao4c+Ult29vqoj2dnn9m7v+t3PsgI3qoNnLtBetP8a6GJrmNCz7gTG3DVnM/2MgJLDbB+t9/qfffC57GBvZjO8Yb++T8M890+K6tNwbxfMFS2SsA2oNNrqDff6KhPxUub85xK2kM1mA1I4WdepRB/WC0KYYVl09NK0P/+HeTmy+w8cLCVNeNsvn90aVRTKDDUxZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjMxcwBOLvfXyD28PT0WTVfH1dQNaGcj+/Aw0ej8AVE=;
 b=x/3H0Q6/5+oezIomS1P44DvGN/92wsqrdNX8RV3g0RYJLog4h7sfeTOioRxyavcobYu8o5A/xAJ00vZTLBFUv+tcDCDhqRXoY+of9TyyK1x2whxBMnvhr9scfkshwE0+Jtu1+5BGRnGo3t5PSNdXQMJiAy+9YiU6AR6blZ5pNIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 13:29:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.014; Wed, 22 Jan 2025
 13:29:19 +0000
Message-ID: <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
Date: Wed, 22 Jan 2025 14:29:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com> <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com> <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
 <20250121173633.GU5556@nvidia.com> <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a798a90-aa6d-479c-4c21-08dd3ae8c64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVpvQUUrWCtaMGxNOFN0M21GNVJIK3FsV1ZLWjFobHAwMURNcG9taWNJZ3V3?=
 =?utf-8?B?SHFiYUo1cjlFNG45ai9IVUJpQStjK3ArMG9lMFlIM3dkR3NVeEUrN1VZTlB5?=
 =?utf-8?B?TXVkcmZ4aVFTL2h0NkZrdUl2WGtYNW90cytLdTFjYWhXb29nOUE1c2F0VnE4?=
 =?utf-8?B?a2V2NTlwSDRSNE43YnBGenJNQkF3RDFCY2hwTmh3QkJwMGNvQ0RwUWJYUVNR?=
 =?utf-8?B?cDl3M05KRE1QLzV2VEtTNTBDdFlOZUZKMjNlL21uVDhKZXlDb1p1c3hYNVNH?=
 =?utf-8?B?ZnovbE8rOWZzQjB6ZjVBenBmaTFTa0xiU2FiaURsa2RZVUVMMjJ6VnI3Q3dW?=
 =?utf-8?B?am1KM243SFVXSW1UZi9ldkZQUnFlUFZwcWVSc3VuYnAwYXlyQmg1WDgrcVFC?=
 =?utf-8?B?UjAzMC9UdEQzYW94eEpkcHBLOU5aRWhNR01TMGUwbkdxMGMzTEIra3VaRTF6?=
 =?utf-8?B?bGpqZUdiV1Buanh6ZWtXMXlFOHhGK1QrSHpFTGtXTEpmeFlmMGxTTWZEa1Ft?=
 =?utf-8?B?K2c4bkVDQjdQcGh6UjNjTE1MSlF0YVZhR3cwMTJ3cE9RV2FzWnltN1JCTjNl?=
 =?utf-8?B?dGwxNjBmNjU0R0tUaG5aMVFuNytpamJ4dEthOXR1MkhiOHdMQXRaODg1Y3pw?=
 =?utf-8?B?L0I3YjdmKzBlUE5BaUh6aXV5eTA5ODZ5UmFpVjA5aU9Wc3Y0a0YyYVRkNDFt?=
 =?utf-8?B?MWxvd2lhSkhuMEdLVHhOcit0Q1Jvb0tWWCtQdWk1OFBYMTVwS1laM2dWTEhp?=
 =?utf-8?B?dkpqQXlyWFVSNWlXeEMvajBzVWk4SmM2bkxTUlFqMHFMKzA5bDZZRWtWUEJL?=
 =?utf-8?B?MEJya1NMMTk3bFBSbGhrRjRWYzJYdnhiTkNITWhhc1YvZWxncEUvTC9KNUY1?=
 =?utf-8?B?dUh2TU94QmxaanIvQlZPRGx2VC81TExzMlNya0plcWZESVFXaGtRaU9kMk43?=
 =?utf-8?B?R0VtZ2V6N3VTTzZQSkU3THNaTTF0UWlQR2hXandobXJ4cTNGRkhobHFWL1ZQ?=
 =?utf-8?B?b1NuR0llM3dXUGozZHBnc1QvNVVnUzVoWHFQVzAzZ05hUGY2dVVBcjF0R29j?=
 =?utf-8?B?ZGMxK3l3azJmeTNxQ01WZTEvZlVzaXlNdVJGcGZHc1VCcmJtWGV6UDUrTk5N?=
 =?utf-8?B?ZDJqRTFibmgxeWhiNUxTYnIwNy9iaEZRZDhzYjhVc09KY1Q2V2ZJMlVtODBx?=
 =?utf-8?B?OFBKalVHcHJnQ2pvQUkzQ00xYXRmSE80SUh4aWZWbGVSL3FNMktrdFhmTzI4?=
 =?utf-8?B?cWg4VHJEVjJqK044QTZOVG8vdCtlK2FubC93VmN3Yk9xR3JCRml3UytNczc2?=
 =?utf-8?B?RjFKcDZLVTQ3akQxRm96VzRxSDZLY1YrWDJqNE5RbEgxWXV2SW9FVFJqQ0dw?=
 =?utf-8?B?Y21qZHhvUVBKYzRsM0lDYW5OY0g2YjJMUFhYeHUxaVI2bTlsMlJQcWZQZVJO?=
 =?utf-8?B?Y3ZSMUZKVTJqQWUwWmtxWUlBOUN2bE1NVnZSTFJLSlFqeDVJYWlMQ1VUTlJt?=
 =?utf-8?B?blJEN0JpZGVCeVF6NWJ2TERFdzhFeW93dkxLRTdtKzdJVHM5VEFNemJ5a3NL?=
 =?utf-8?B?eSs2VUpvMEtsZTgxa0xBZ0w0cWc5bk4ycE5Xb25mak13TE50bGFRY1UwLyt1?=
 =?utf-8?B?V1d3NGFSRXluRExxMHQvb21lbUY1Mkc5OGEyWGk0bGZXTHNBYjBYWmFRM0oz?=
 =?utf-8?B?VTlXeHpzQnR2UVM5Q2cxZ1FydFFPT3VMVnUrRk1pSXRzcWdGb1JWa0VpNExv?=
 =?utf-8?B?Y25HMng5VnVCcHdkK0h4TVRsSUVqYk0vZ3NLUHJJNHd3MFBDRE1aaHpMVHVY?=
 =?utf-8?B?T3NFK29GbExSK2dNTGplQTM3dU8zUmphWkl1NCtuMXBTTmxGSUZHQUhhemor?=
 =?utf-8?B?ekc0bXdlV0EwL3hOQUNjbjV5eFkzOGNoVkZjR09NZVdiellLWXQ2ZDgxbkRG?=
 =?utf-8?Q?ShMb8GkZpiI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJuNWZRQlhvMFZ3ZTlhWXA5by9nZzJXRW05SHF2QXY5QzFRKzJzQTNzS2k4?=
 =?utf-8?B?SXJycmpYQlNRT1JZY3VGSkx3WW9FVHYxNXJrTSt2OTgxRlFVUndVUmxjU0JI?=
 =?utf-8?B?R2JLZC8rOEMxUC9Qa05BQk5kNWZKUjlINUFsZitXZDJYZEdwcTRjUndyR2Y0?=
 =?utf-8?B?YWRMYWxNT1R1Zy82djNiODZyNGFjM3c2dTFmQlZaM3lscmU1Ym8yTEsxUFZv?=
 =?utf-8?B?b0VxZ1FQbnFjWDdualpjelFyTFZaY2ErMDlhbkVacGxnN0ZOUkxxdGI1aDdV?=
 =?utf-8?B?MHZUcU1XclYwa043T1hiS1pxUWtTcjVON2trNDlFbEZWa21PcUZCSDZtQ1Zl?=
 =?utf-8?B?Sk5ld0FrSHo4VDUwRzlBSGlSVjZuL2tsNWZ5YXlDWEtqWUU2YVhxN3l5bHd0?=
 =?utf-8?B?OFhJTmNWMGlxTGFCUk9PMXdTbVMyMnRyaVM1WmdMSXBsS1I1WGJHczNyU2hL?=
 =?utf-8?B?NFZNQm9XanRRTzZaMXZNK1hpZU5qclYzV1Boa3BPdTZkV1RaRmZZMWRyZzJ1?=
 =?utf-8?B?L3VHUW1HNy9GU08vT25sNUVTNzlLQ3p0Y0VOa0VHeXkvMThUKzg0VUhUdHIy?=
 =?utf-8?B?MGVaZFVCU1ZhaEdHYTU4L0w3cDlGMTVnMnQvS0FPK09EMkVobVlqUUpsUktQ?=
 =?utf-8?B?OHpJVDI5SEZhSlhRYnY3STN6NDZqSERzM3JvNWQ5OTFsSk9oYjJIcE9pYTFr?=
 =?utf-8?B?ZWxkL3JOSlc5SkxzZjlpVHpwRk12UGZjV2N3a0lTem9DS3FHR1BhNFdaaDY3?=
 =?utf-8?B?VEorcHVBQkhuZjBJbUxua1lUVjlQTVowdkRVYWRVU0dTcThIa2RXNG11b3dD?=
 =?utf-8?B?Z3VEUWVYSWt2cFdkeGJ6aDJ2UTJtdEI5MXlMRlJ2WlJXa0JQL1MybU5qTlBJ?=
 =?utf-8?B?bWNOQUR0ZEdIRHF4d2hIWmJUMnE4NzJwVXJGTTR3RHJwRnVOTk1hTUt3Y0N4?=
 =?utf-8?B?VHZEb2R3a2xRVWxsVkVKd3c2QmtvTnc5TS82UDRVZ1B5NnNPb0dxU2l1U2J6?=
 =?utf-8?B?VXJrbjlQcWhsTjFVc1oyeU5WaExJaUNkOEovRlNsTmlJcmw5UTIwQm1IVEJy?=
 =?utf-8?B?d2hWMVNTeHhKWFJrOHppZWRtK1liSmRPR3JVS3pDZEplUisyTmpwSnRYVGth?=
 =?utf-8?B?RGpSRDVRV2tUUjR4aWpHMG1yRmo5cmxSZm9rZEtjeGg4alNxVEtvb1J2K2pV?=
 =?utf-8?B?NWpHRTUxUEMyWVRyOHVCQ0lacWNaVFpISGd3UVVWNS9wTWFUTkNvMVNJdnQr?=
 =?utf-8?B?MUx6Zk5JNVpQWTIrK2dOUXFwM3ZFTTE3TVl0cXphZFlVZHRVUm9WbmMvbkI5?=
 =?utf-8?B?THZGa0daNzV5cGFZcy85TDlPdTlzeE44bnUwQ2FRSExGV2g3TTJZYmNVZW9z?=
 =?utf-8?B?TW4wSGVHT2JVYVJXTFM2TTNBUTdsSEhGb3p6RGJYTEJaWkh0TWhGL0RMcjRX?=
 =?utf-8?B?TG9mc1Z0TDY0eHkya3IrckdTLzZmaElzcGFkM1NidWtIcjdEYmVkaU5iU2hv?=
 =?utf-8?B?WW56ek5JcnJmcS9EeGo1T2VVMDFtd2F4MmYwQUFidFEyd3hpa0NUVWNZWHlx?=
 =?utf-8?B?Rm9VUndVZFI0UkMrUlM3NTZYNkF1eGNrdVkxSVlSRnBCZG5wZUdHVDhkN01a?=
 =?utf-8?B?UTh0OFZPVWp1WlZlR1A5WjBWb3hlRFA4YzNFMkdUZmpqZ3BIWVppQTdnVEpn?=
 =?utf-8?B?d1lkeFk5SEVuem9vNkJSbFVNWmxtUFU5YzVRWUpqcFpEQ3I2UEFLdjA5Sjd5?=
 =?utf-8?B?MnZOTytrd3dkekJlL285NHN1cGlTeWhzd2xzT3k2aGYrdjQySmRoeFh5Sm9S?=
 =?utf-8?B?S1pPMlYwRG16K1g4emNXZWZTcWlNL1FKK1RQelRRbkpjM0hLd2hacHlhZnhL?=
 =?utf-8?B?ZmhtUVIwMy9ZWEs1MXkxVEdHbGN0dGczWHhXTVZqYTF0YWlrTGl6R2xramNh?=
 =?utf-8?B?L0RJVzFETFo0LzMxKzVDdzlFZmMwMWtkWk5GMm45ZWVHVHk2dFI5ajdhd2tw?=
 =?utf-8?B?SC9qWTVNcktMRkpzcHFKeWNKdlZNS0tTaGJxcnB1aDFnZUxJS0NrbGhFU3Va?=
 =?utf-8?B?bU02NTM3bzZVcGtLZDl6OHAyNGdQSVI1NlNuaGRaSnliak8vY0dld29LeWNT?=
 =?utf-8?Q?V9frZROUuChrny6TLO2zhtDkX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a798a90-aa6d-479c-4c21-08dd3ae8c64b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:29:19.2518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzKouNtS4vQQS06C1GT4SmVRn054T2UxesB+aeSXm1zgFoL/vehHOKP0CSWaqGTD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723
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

Am 22.01.25 um 12:04 schrieb Simona Vetter:
> On Tue, Jan 21, 2025 at 01:36:33PM -0400, Jason Gunthorpe wrote:
>> On Tue, Jan 21, 2025 at 05:11:32PM +0100, Simona Vetter wrote:
>>> On Mon, Jan 20, 2025 at 03:48:04PM -0400, Jason Gunthorpe wrote:
>>>> On Mon, Jan 20, 2025 at 07:50:23PM +0100, Simona Vetter wrote:
>>>>> On Mon, Jan 20, 2025 at 01:59:01PM -0400, Jason Gunthorpe wrote:
>>>>>> On Mon, Jan 20, 2025 at 01:14:12PM +0100, Christian König wrote:
>>>>>> What is going wrong with your email? You replied to Simona, but
>>>>>> Simona Vetter <simona.vetter@ffwll.ch> is dropped from the To/CC
>>>>>> list??? I added the address back, but seems like a weird thing to
>>>>>> happen.
>>>>> Might also be funny mailing list stuff, depending how you get these. I
>>>>> read mails over lore and pretty much ignore cc (unless it's not also on
>>>>> any list, since those tend to be security issues) because I get cc'ed on
>>>>> way too much stuff for that to be a useful signal.
>>>> Oh I see, you are sending a Mail-followup-to header that excludes your
>>>> address, so you don't get any emails at all.. My mutt is dropping you
>>>> as well.

I'm having all kind of funny phenomena with AMDs mail servers since 
coming back from xmas vacation.

 From the news it looks like Outlook on Windows has a new major security 
issue where just viewing a mail can compromise the system and my 
educated guess is that our IT guys went into panic mode because of this 
and has changed something.

>> [SNIP]
>> I have been assuming that dmabuf mmap remains unchanged, that
>> exporters will continue to implement that mmap() callback as today.

That sounds really really good to me because that was my major concern 
when you noted that you want to have PFNs to build up KVM page tables.

But you don't want to handle mmap() on your own, you basically don't 
want to have a VMA for this stuff at all, correct?

>> My main interest has been what data structure is produced in the
>> attach APIs.
>>
>> Eg today we have a struct dma_buf_attachment that returns a sg_table.
>>
>> I'm expecting some kind of new data structure, lets call it "physical
>> list" that is some efficient coding of meta/addr/len tuples that works
>> well with the new DMA API. Matthew has been calling this thing phyr..

I would not use a data structure at all. Instead we should have 
something like an iterator/cursor based approach similar to what the new 
DMA API is doing.

>> So, I imagine, struct dma_buf_attachment gaining an optional
>> feature negotiation and then we have in dma_buf_attachment:
>>
>>          union {
>>                struct sg_table *sgt;
>> 	      struct physical_list *phyr;
>> 	};
>>
>> That's basicaly it, an alternative to scatterlist that has a clean
>> architecture.

I would rather suggest something like dma_buf_attachment() gets offset 
and size to map and returns a cursor object you can use to get your 
address, length and access attributes.

And then you can iterate over this cursor and fill in your importer data 
structure with the necessary information.

This way neither the exporter nor the importer need to convert their 
data back and forth between their specific representations of the 
information.

>> Now, if you are asking if the current dmabuf mmap callback can be
>> improved with the above? Maybe? phyr should have the neccessary
>> information inside it to populate a VMA - eventually even fully
>> correctly with all the right cachable/encrypted/forbidden/etc flags.

That won't work like this.

See the exporter needs to be informed about page faults on the VMA to 
eventually wait for operations to end and sync caches.

Otherwise we either potentially allow access to freed up or re-used 
memory or run into issues with device cache coherency.

>> So, you could imagine that exporters could just have one routine to
>> generate the phyr list and that goes into the attachment, goes into
>> some common code to fill VMA PTEs, and some other common code that
>> will convert it into the DMABUF scatterlist. If performance is not a
>> concern with these data structure conversions it could be an appealing
>> simplification.
>>
>> And yes, I could imagine the meta information being descriptive enough
>> to support the private interconnect cases, the common code could
>> detect private meta information and just cleanly fail.
> I'm kinda leaning towards entirely separate dma-buf interfaces for the new
> phyr stuff, because I fear that adding that to the existing ones will only
> make the chaos worse. But that aside sounds all reasonable, and even that
> could just be too much worry on my side and mixing phyr into existing
> attachments (with a pile of importer/exporter flags probably) is fine.

I lean into the other direction.

Dmitry and Thomas have done a really good job at cleaning up all the 
interaction between dynamic and static exporters / importers.

Especially that we now have consistent locking for map_dma_buf() and 
unmap_dma_buf() should make that transition rather straight forward.

> For the existing dma-buf importers/exporters I'm kinda hoping for a pure
> dma_addr_t based list eventually. Going all the way to a phyr based
> approach for everyone might be too much churn, there's some real bad cruft
> there. It's not going to work for every case, but it covers a lot of them
> and might be less pain for existing importers.

The point is we have use cases that won't work without exchanging DMA 
addresses any more.

For example we have cases with multiple devices are in the same IOMMU 
domain and re-using their DMA address mappings.

> But in theory it should be possible to use phyr everywhere eventually, as
> long as there's no obviously api-rules-breaking way to go from a phyr back to
> a struct page even when that exists.

I would rather say we should stick to DMA addresses as much as possible.

What we can do is to add an address space description to the addresses, 
e.g. if it's a PCIe BUS addr in IOMMU domain X, or of it's a device 
private bus addr or in the case of sharing with iommufd and KVM PFNs.

Regards,
Christian.

>>> At least the device mapping / dma_buf_attachment
>>> side should be doable with just the pfn and the new dma-api?
>> Yes, that would be my first goal post. Figure out some meta
>> information and a container data structure that allows struct
>> page-less P2P mapping through the new DMA API.
>>
>>>> I'm hoping we can get to something where we describe not just how the
>>>> pfns should be DMA mapped, but also can describe how they should be
>>>> CPU mapped. For instance that this PFN space is always mapped
>>>> uncachable, in CPU and in IOMMU.
>>> I was pondering whether dma_mmap and friends would be a good place to
>>> prototype this and go for a fully generic implementation. But then even
>>> those have _wc/_uncached variants.
>> Given that the inability to correctly DMA map P2P MMIO without struct
>> page is a current pain point and current source of hacks in dmabuf
>> exporters, I wanted to make resolving that a priority.
>>
>> However, if you mean what I described above for "fully generic [dmabuf
>> mmap] implementation", then we'd have the phyr datastructure as a
>> dependency to attempt that work.
>>
>> phyr, and particularly the meta information, has a number of
>> stakeholders. I was thinking of going first with rdma's memory
>> registration flow because we are now pretty close to being able to do
>> such a big change, and it can demonstrate most of the requirements.
>>
>> But that doesn't mean mmap couldn't go concurrently on the same agreed
>> datastructure if people are interested.
> Yeah cpu mmap needs a lot more, going with a very limited p2p use-case
> first only makes sense.
>
>>>> We also have current bugs in the iommu/vfio side where we are fudging
>>>> CC stuff, like assuming CPU memory is encrypted (not always true) and
>>>> that MMIO is non-encrypted (not always true)
>>> tbf CC pte flags I just don't grok at all. I've once tried to understand
>>> what current exporters and gpu drivers do and just gave up. But that's
>>> also a bit why I'm worried here because it's an enigma to me.
>> For CC, inside the secure world, is some information if each PFN
>> inside the VM is 'encrypted' or not. Any VM PTE (including the IOPTEs)
>> pointing at the PFN must match the secure world's view of
>> 'encrypted'. The VM can ask the secure world to change its view at
>> runtime.
>>
>> The way CC has been bolted on to the kernel so far laregly hides this
>> from drivers, so it is troubled to tell in driver code if the PFN you
>> have is 'encrypted' or not. Right now the general rule (that is not
>> always true) is that struct page CPU memory is encrypted and
>> everything else is decrypted.
>>
>> So right now, you can mostly ignore it and the above assumption
>> largely happens for you transparently.
>>
>> However, soon we will have encrypted P2P MMIO which will stress this
>> hiding strategy.
> It's already breaking with stuff like virtual gpu drivers, vmwgfx is
> fiddling around with these bits (at least last I tried to understand this
> all) and I think a few others do too.
>
>>>>> I thought iommuv2 (or whatever linux calls these) has full fault support
>>>>> and could support current move semantics. But yeah for iommu without
>>>>> fault support we need some kind of pin or a newly formalized revoke model.
>>>> No, this is HW dependent, including PCI device, and I'm aware of no HW
>>>> that fully implements this in a way that could be useful to implement
>>>> arbitary move semantics for VFIO..
>>> Hm I thought we've had at least prototypes floating around of device fault
>>> repair, but I guess that only works with ATS/pasid stuff and not general
>>> iommu traffic from devices. Definitely needs some device cooperation since
>>> the timeouts of a full fault are almost endless.
>> Yes, exactly. What all real devices I'm aware have done is make a
>> subset of their traffic work with ATS and PRI, but not all their
>> traffic. Without *all* traffic you can't make any generic assumption
>> in the iommu that a transient non-present won't be fatal to the
>> device.
>>
>> Stuff like dmabuf move semantics rely on transient non-present being
>> non-disruptive...
> Ah now I get it, at the iommu level you have to pessimistically assume
> whether a device can handle a fault, and none can for all traffic. I was
> thinking too much about the driver level where generally the dma-buf you
> importer are only used for the subset of device functions that can cope
> with faults on many devices.
>
> Cheers, Sima

