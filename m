Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98FD0C464
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 22:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1C510E947;
	Fri,  9 Jan 2026 21:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oPmXgqdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9913E10E91A;
 Fri,  9 Jan 2026 21:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2p0wE8ch9b+93IeIV2lxlmYjRvPE4kMZxtsJZNTGOEMN/7YC2vzposZt0Kc9Ltlcyxx/TXKApdk8QQu6BtOa/9R9GewRl3+gBrRxhBWSM+XOf9MAc5DAiGXC7GpJGrx/orCMJUQreES2g8eYQmn4XnWuAMwrIR0jYZioz8eLNemshpe+AJLY2VNGfXxl+/hL+hUvGnsOrm53czM0hkJ3wXXvBb7qKj44i1m478F7xbpuyOF2Dk95nPAaTV5XFfNasJXj2Nxu54DhGZVUDXeirzz46LaT7l2Av8eRScHvLvSQHrDneJQjIiI6o2enE1e0DN0s3ZJK+U+7wUdgCMgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOLyCMNG3LmP5e9i0OD6IqmDYpcTRIK7ROBoE3trsTA=;
 b=PG6mHtTEWD15OcRgrI2nSR0qebHfAcUeKPiFzm87WGmAov6lGsLdeK8gRVy2xOhPVzqxksl3BfCbF902BvTUoQZFJo7f8Kc1IDmAS/rmd1FPmAWs3RbVpxWR71zByF5fNgIFkG0+Ebp4DNY35IrZeolCaw0CUUyfOSi8xHjE+GH4C7cxge6+HswfeMeLejQkC62Iy7o9f+wKvTdlUZ9smL6K/ydRBfC4SisEaw1UGAd6u7/LIOn5b7Q5WvUCnvBxk2gKvPxLEPbK1wLim2OO7OiQuMRKM+p/CEZuF9fmX1iQ8H9rkjx681uWf8tiTeErOsObT9QsivHteSf6fj3GJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOLyCMNG3LmP5e9i0OD6IqmDYpcTRIK7ROBoE3trsTA=;
 b=oPmXgqdVgLH5YROgkGpyrZP03r7AYc3/cYrlOMUIWnUsjTvKN00MIiMxZcygfWMXzy/V+nR8A7/IykAwLqHwhpnsvlmcVrpx9rzgOBP3UUcSrJqrLb5OKNUSmJkppOAQSEOQDsVHWeFgINvuu+Q9oXuE7uu5djmBX8oDYuhj2U8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 21:16:50 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 21:16:50 +0000
Message-ID: <dc26748a-3ef4-4b7c-9772-8dd7a7f03364@amd.com>
Date: Fri, 9 Jan 2026 16:16:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/amdkfd: fix a memory leak in device_queue_manager_init()
To: Markus Elfring <Markus.Elfring@web.de>,
 Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Oak Zeng <ozeng@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
 <57a9f219-2612-4a64-a9fb-44b04e09ec15@web.de>
 <cc24a955-f5b2-43e6-a4fd-ff446d699fce@amd.com>
 <e76fc27b-0742-4685-96e6-f6000bd62fa8@web.de>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <e76fc27b-0742-4685-96e6-f6000bd62fa8@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ea05ad-0bc4-47d1-bf5f-08de4fc4675d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzNqYit4ZzNVNVU1dG1iL3ZTb3FqQjBHamlXSko5ZGdKV3FEZy9leHBPL1Bu?=
 =?utf-8?B?VTM0aW41ZzQ4WmtObXJ0NWIvemd0NERqZHJaMW5QbUFDZ2xySDlxTmJqY1JX?=
 =?utf-8?B?R253ZjgxMmVIaGFSNG94RU10Q3JrWExRVmQwSkZVV2lVckx4OUZ4Nkh5RmFm?=
 =?utf-8?B?c2lrTTBHNXZXN2pqRGppc1UrcHg1Y3NNWkNnRmFsTVpIV0pIU2VicXRjWFdm?=
 =?utf-8?B?WU4rcXViT255TnBTaWJvNkJhOEdEVUQvV052ZjZTYWZNSGVjaEpLUHFjM3Vw?=
 =?utf-8?B?Q3Q4RWNFWlQyNGdleGx1elpFUVJyTFRtSmdkOGpkYVg5Mzh3MjN5SHM5NGoy?=
 =?utf-8?B?MGpEbEZNVFc5emgzbFBBejVHUTBaeTFQR0N2K0VoTFdJVU42cnJQTkRQMnVD?=
 =?utf-8?B?ZXVKTGNJYXl0V2tTbmdycGNQZWF4U0EyemNQaFNEb054bDFWVTJWUGxPVnRy?=
 =?utf-8?B?UDZqUUxQMjlVVmd0eEYwQVgzRzJycTdMQUxYUWZQOWtlREFQN1ZxbW5HcHdi?=
 =?utf-8?B?cHRaazF6a2g4bGxaL3R2N0lwYVNKTFhJT2d4QW9KeDBoNlpHREM2Y0IxZFRS?=
 =?utf-8?B?YUovMXBuTmFhbDIwNXNWenFiM3dsbjlmZXpTb2pEMStRV2tMcDRXcHhNQ0Rh?=
 =?utf-8?B?Qmh6RHJldEhGVUVXNHIwYWh1NkRXb2JUV3ZRRXdUbHFMV0hHUldqaVlvTUU2?=
 =?utf-8?B?TXR0cys4YnNSeW1ZcDVLamhUWEVXY25iYjRuSmdCMVM0bUo0QU5rd3hoR1FC?=
 =?utf-8?B?YzlwRUlPR1RFcUc5MUUyWFhESk5OalYrWEpockRLb0xpb1VZRE9YUzRhQXBO?=
 =?utf-8?B?YmtZTHplV3FDeXB4Z1E0RFkzYXd5bUFwUklUaXJLRzZlU3VtUnBhYS9Ld1Ir?=
 =?utf-8?B?NWxGQm94VWJqUThLdTVEQjRzTDdaRGI1T2JXU2RJbE9mREdhU0c5ZHcxRTl1?=
 =?utf-8?B?M1ZEZXhSQ1NWM3phd1QwYjYxcDNrSzk4dXF6Q0xucCtOTVlMTW5mcU91TUN2?=
 =?utf-8?B?TEMraWpWeUk0dyt1TzhpQ2VkdUp4TUpvM1lqQzY4cG5aS3dZY014K3FNQlls?=
 =?utf-8?B?MDVqWkVxbTVETFR4bTM2aExCdlUzcHNFNzIveWpob1pGM3RDY08vUHQrc1BS?=
 =?utf-8?B?cGFwRElEWng1Mi9UenZ6cDR4TkpWWjZDcG03VlhNSG5RZzJ1U3QwNC83dFNT?=
 =?utf-8?B?UU5tdEJncUlqNjVZVVlKSitRWVNtYTR0NlF3Wno4anFMVm9odmZkNm44OWZJ?=
 =?utf-8?B?MlAvdGYyMW5ZTHI5L0JKV2pRakVtOVIvNGNTazJKQ1hJdFpMM01mUE9pM2Ix?=
 =?utf-8?B?ZWJQa0JUVDZSMS9TamJKWjNtclBvVzYxR1BIcno3UU5qSTVPQ1NqNmpCN2Rs?=
 =?utf-8?B?ZTdIR0FkTktkUjY2amZLbmx4RDRaR2ZPb004NVg4R2E4dTkwc0szcXhqRGlW?=
 =?utf-8?B?YXY5VmsyaUVRSjZyeC9mRzVzRjJBN2prUW4xZXN6Sy9MQVUvWERKcmF6azFW?=
 =?utf-8?B?RlR5dGFKdjhPTi9IaEFPZWZSQWRTaDdydGhlTm1UTy9yTzIwZUtmV3JDYnRW?=
 =?utf-8?B?ZEZ0SFdNUDZpZEJEMjE3ZW5YcjF3amZFVXRNZFQrRzFXNk01aFJmcC9OdFNx?=
 =?utf-8?B?MzRSU29PWUpzVm5CU2Y0dEhLSHMrSWdiemt0NlFMc1BJWWR5YTlkTi9OZjlM?=
 =?utf-8?B?ZllFS0JVYjNrSkVQSy8yTytBNGl6aEJxcllKV3lRWFRxR0hQM2o1MjZiS0Qw?=
 =?utf-8?B?N1NuTUhIUkprbkNOd05kaVZ1ZEVvSDFSd1VaZTFzeHZhYzFKZjBycm5Camty?=
 =?utf-8?B?UHpxSHIyQWhQTFhXUlV1VEJZNUdRbW9pK2xyMnhBUjYrcHd2eEdVeThuNW5O?=
 =?utf-8?B?TGl0LzZqYXM3TnZkK2VYRnZHaDFDeUR6bS9PMGpHdnZrb3E4UVdCY3RIa05Y?=
 =?utf-8?Q?pdEITGTBhKu9VlHDIyrqbPoGz4QkcBV6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlA4bkRZNUc1YjdUL1BmTmVZbGdKRFhPTEdQTFQ3SFc3ZHVXa0syQlY2My81?=
 =?utf-8?B?YnFWMUFyOUtLbFBoeHhPcktqYndNTmF3ODV5ZkpqbnJ2T1VYRi9mWS9Pekht?=
 =?utf-8?B?VnB4YWVPQVhNa3QyUWw4bENIc0VnT2k3VmdPN0lTdUtmNWZEa2djdDl6aS82?=
 =?utf-8?B?Vmd0NGx1aGhFbjFqeVBVVEV5ZHVwQW5lTjNHY25yRXRnUjIrSGlpSXhtQ3Fi?=
 =?utf-8?B?clJidzNMMG55bS9ka0x2YTB2bHB6amVTL0hPMUhVeGFEZUptRUFpajM3eUth?=
 =?utf-8?B?SWxLSGRESml2dm5XNDMxVVFCMjhmNy9oNHZxcFo1eDJmOEF6WHZWZ1NtSkFJ?=
 =?utf-8?B?RFIvM1lpekZsR0lyNVhBaFVtalJaNE1Tc1RQNmNWZ3RuTGt3cHZvUDR3VW5x?=
 =?utf-8?B?Um45ZjVUTllOeGpGU09PekxraTV2cFZPOU5ZLzlUcXVCbWtFRDdWbHFyUW9p?=
 =?utf-8?B?a0NwRnZ1aTF6YXhYLzRzbTVwK1VqS3NBeEg0aktJdm4xcG5XQ2JJTlVCTm9S?=
 =?utf-8?B?M2ZRQjN0dzZ5S2k3SGsrNlVlajR0VUVrejBvT2FMNjFnM1YzeWozdmozZlZG?=
 =?utf-8?B?bm14MW81TEdIODJjWE1lSUxSS1hhd09KaWJiQkNnalRzckRtYUZNZjREL216?=
 =?utf-8?B?S3Z3Ni9DSGlJUW53MTdTbjBjWUNYQ0NzQWFNZHNWM2FYNDNoNlFveUhERmU1?=
 =?utf-8?B?b0Y4L2pnTDZ0TFR4Qjgxekg2QnozaExqcFBTQlJwM0V5Y2ZVYTdLWEFacGhX?=
 =?utf-8?B?WUl5b1FSMFRTWDc3QTlxNVRGZjlHZ3J3N2w0WTlTdU9TRjd4a09vVDlDUThs?=
 =?utf-8?B?Um5nSXh3Y1hOWHRqbDRZQkdwOVhGY05oRVoxM3NmbCtmaWtDTUljY2tSakow?=
 =?utf-8?B?M0VFRFU0QVhqdG9JanhwaDNqK0MreGwwajRXVndHMmthbDdQdU1nOWxXdmlO?=
 =?utf-8?B?U1J1VEwzRm94RnlFMnJxSmRKbWV0NkV3enlDZ29ia3RzSUx6enUvUkVlelpR?=
 =?utf-8?B?MEVpR3lOemdudmRaSGZiR3g0Z0pLQlFFaVdzSlMxNTRLM3pIdUloVWJsaE5m?=
 =?utf-8?B?bW55N3Q4OFp2ZDh1a0JGcDVLTjB2Q1NWcnlEVXBPV0lYTmE4Mi9pdUdnSFEz?=
 =?utf-8?B?eUFEakhkSkRjZFpHQUNEZ2hST210Y1RmVWZ2Z2NidGRtaXNsZjBFZmV1NjZU?=
 =?utf-8?B?NDNBQzk0ZS9ZN0drbmRFY1BIeVpuWmt1eWFJOWJsUjhJZzRlbzZma3lEa3Vv?=
 =?utf-8?B?NEt0ZmlrVFY0c2RjZUJYdUl3RWR2eS93Y25iTWNBYlErdzNLbHM4eFA1WEdj?=
 =?utf-8?B?aWJCRE4yQkJ6cFIzNEc2cm5VL1BvclhsNTNMd0o1SXhyUWl3TVNueEViYVJI?=
 =?utf-8?B?N1RqNWEzVGlNV3JZQzMwUit5aElJZThZU010Z0NsSzJQeUJseGdPcXludmxa?=
 =?utf-8?B?Rzh4ekJKMURQRjNmdVNyYXNyOExIbURzQTNQdWZIY29FMldybXVQcFJ6QWhU?=
 =?utf-8?B?SFI0V0t6WmNTN2JKS0VHaVV0UElGVHBEZ053RC9EVHkwYjkvd1cyNU03cU9R?=
 =?utf-8?B?a0dZcnhkU3RWZDY3ZUZFNkZJUjh0ZVJnTURJaUlWRTBMenkzU2FKR2grN3F4?=
 =?utf-8?B?cGY2azQ5UWJ5TjVGTWVheUlsQzdSOFJtRWtCSWtrL0hmK1RFcStBR2N1UzI4?=
 =?utf-8?B?SU9yNy9hVmR3T2RLc21DbnpKajVydGxET0tMZHRBSldKZ2xieW9OTUY0R0sx?=
 =?utf-8?B?R3dNSjhjYnZkVHFhSDQ3UGRGdnZoR0hlcjdMbjk3RVdwR2tsd2d4dTNGQXQv?=
 =?utf-8?B?cVdueU03b0p0TVRFUzd3bUdiMmE4Zk9SdmdBTGF5TUh4SDVac3BJeXZCMmE0?=
 =?utf-8?B?S2JJbHVVRkF4VDl5Z1A0QzhiTStDLzJIaE1aSURCTTc3Q2pQekVNSmxnZlBh?=
 =?utf-8?B?VitTeFdlaHJUaXA5WEFDWWNWVmphL3NEVnNUeFU5SUJUVDFIMHk0VjI0YVpH?=
 =?utf-8?B?V2J1eGU2WTAraUdwZWJyUmZFQk9LK1JZVXpsdmdrc3pvVXdkTXgvblJzdjhH?=
 =?utf-8?B?M1hOZTAwNGh1cE0xRTFPQVJicG9zU0prWmp5VktsMmgvZ0ErZ3hvTE16dlA1?=
 =?utf-8?B?UzQ5RVpJY3ZEdEF6S2V6ZVdheVRua1Fmem5Fd0l3OTEwdDV6RmtIaFJyS2Rm?=
 =?utf-8?B?VTl4WXNMMFBpT2JhZTZFMVU0NTkzSmZXT3BpWUloTHBnUGgza1lYTVEzTzRj?=
 =?utf-8?B?UHM2U2ZCU1V1QTZLaVYyZGdPQnJOZWx4dGp3MVdzVmNRTWYzdnZsc2IvbGhY?=
 =?utf-8?B?a1BIOUdiUFliZWV3MUNXVzFZV1ZCS1c5Qkd1WW15ZDNSTXI5NXI4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ea05ad-0bc4-47d1-bf5f-08de4fc4675d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 21:16:50.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpqDeh7X4Y+vZuotvJ78aNK0i7HRnFS/Vm/6+Uky6GPgO/ZjkTUDm5rsCau1YwJYo9nBQ9ehdaTFOHbOvN0fSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
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

On 2026-01-09 03:37, Markus Elfring wrote:
>> My conclusion is that this WARN is just unnecessary.
> Would you like to omit such a questionable macro call then?

I don't feel strongly about it. I already submitted Haoxiang's patch.


>
>
>> But it's also harmless.
> How do you think about to avoid special development concerns here?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.19-rc4#n1242

No. I think the WARN is used exactly as it was meant to be here: to 
check for something that should never happen.

Regards,
   Felix


>
> Regards,
> Markus
