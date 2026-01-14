Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFBD1D546
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157D6897FD;
	Wed, 14 Jan 2026 09:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PqfZELEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29A89149
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGAajSnhGq57vP+3qal8a+2rfnY+Iyvk8It5WfNxEmxzk7fPm97wksqN1HkluSk5g9K3oIrMOa4otbEHaqvYRmHKTsL+ux4lZVSw819CRYMmJrTQ46h7MKb8tFy/4LYKwY7IiUiNXD9UUU7lHpgQcyLYdM8l+5XJy10HitIizbedBL3+SyDbsTN9r79ed0ME9ovTw0+DWaSegfDeZ7p0lbRjNepBaKB7pWUsh0w4qOQoyGNr24KRwO9/d0gef7PcxgYN9KLbT3Qzfb0wQwAg6KX78MBs7ipA49H556CquAzJMaIh6vWjgceNXFQ1MB+/d/6te+Jp8Xi2RmrD3mFYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh4UmVH+h5G0cDDmHuSpc/N/UHpla8aIxFhtKHdp2O4=;
 b=KTOrb75YOfVqfN1Hr0tajOzK0kvOaSy8kJgO59ZaElsgjh+KdNZ17MfyKBOclQpyGHR6XLhqt8Qr1940Ljf7S9bVerOPSax7nEoGuJqQ1lkDS2quMf9sOvxX94yOxSyzQ9p2UDA6Q9YE4ups7K7Dis9BbjrBZkgYene7Xm2IcO4BmNhkGAy6yowepDKV/4GlkURwEXyP53PwwTFJj3sTSuAg10b+v4RY5/wRgEbPa7j5F+4u3rdLEYlVY3uuezhDikXIc4+SQ4SS51lA9c32W2SctnTLDjSBvdwC+eNmN5VqHX5NLbyzP8gr+nGnB55yMNJiPIJTSJJf2tbFOrF4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh4UmVH+h5G0cDDmHuSpc/N/UHpla8aIxFhtKHdp2O4=;
 b=PqfZELEvOPC5vw13TfRrX5J0WLHBeaDSoVqDypvCZN+58dg4WPVM8wK4xznwFSugC6sBjzDIsI3D9v7VJKn4msU7PATVDmZ+y6vCbl4Erh73w1Wnbi6j+GGsMje6OHHjZUJzEX/PgehFlVnfdK719LKHCPPM3hxInIZn7BE/1jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 09:02:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 09:02:26 +0000
Message-ID: <068ca291-34f7-4488-8573-72b5fd240ddb@amd.com>
Date: Wed, 14 Jan 2026 10:02:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] New DRM accel driver for Texas Instruments' C7x DSPs
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>,
 Jonathan Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0354.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bed2a0-216d-41a4-000d-08de534ba3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3hTOUVGQXphWTJXTzl6cG5zcHlHVEc4RkkzZXlnU2J4NVNwVldnYVFPbkw0?=
 =?utf-8?B?MXJ1NmdMbFFOam5HdEQvd0RhaU5xeG5pZkFLdTBTb09JYzR2cGJ4UUcycWkv?=
 =?utf-8?B?NFU0ZW1GdGtmblR3ZEc3RUNoS1R2S3J3RGdxQXpvazd6REwwemVENCtoWUh1?=
 =?utf-8?B?bStZL2dTKzlIR1AyY3BIcms5Sk1Wa2F4S2ZDbHh1ZnRuNWNtUXNoRkhFTmRY?=
 =?utf-8?B?bHZHeGNwRExKTkZvVmg1QU9FT2ZBWGlqaHUyQ0ZFTWdtZFB1SEc1TEJXb2U5?=
 =?utf-8?B?SkFnRWRrY2duU3ZyZ012S1RGYnpjRmpvd1U5MTJHUmo1UnpseHNaM3V5L2FK?=
 =?utf-8?B?eVRKaDZxc0NoY2FkSXlZU2FwSXh4VUVBNTlrckFtMWI5RzhESnhjdEZQajBZ?=
 =?utf-8?B?cCtCRVF5QWtGaFZJQU5zcVJRa2JSdG5OV0hVYWRtWDVBWGdIRnZMcEtVdUxM?=
 =?utf-8?B?aDRmNDA2NWJadWY1VGhiT1NPQ3RrUTlnS2NzYWpBTHJzWXRRY1hoeVljelF3?=
 =?utf-8?B?Tm9BNFBkUDd6VXhMMVZYYWVZc2I0S3F1WUUrc2dBakdOZnNYL2UvTTJnS2cw?=
 =?utf-8?B?MEEraVhLK3V1azFxVDJHVW5EQkFrRjBCVkJVWTkyeDhxbU82MUxDTVZWNnVU?=
 =?utf-8?B?SGVEVi9KeUh1elZFcWlLelJtRXVHMlhIT1FXSjF6YXpKNVl5amZLU0RBL0xn?=
 =?utf-8?B?K0YxZm1wSGR4RGxOMithQTFUV0ZTZkg1V1pBZVhqSWVST3Y2MURNbmhWbUk1?=
 =?utf-8?B?NW9YUUczQVZ3UGNXeUwzaVBtR2VlVDdmUHFaTVgwbDRxSVoraGZRT2hJRm5C?=
 =?utf-8?B?MGZBdnE3cjdJSlc0amtFV1V2RlB6ZzVnZUtkT1MvR1ZIZDdFOW9FOGxadGlP?=
 =?utf-8?B?UzRGT1NaY21QNUdqYmhqQUl5L3crRzdNZnhUY3Z0c0Nnc01pdE1aTUZ2V3gr?=
 =?utf-8?B?VEs3WnBCSnY3TC9UTXV6OHdtTGp0aW1wb2QvOVV6S0NKeU52eE43SEtTMG5T?=
 =?utf-8?B?eTYxa0pXTXRPTlBsQzh2c3ZPQUdhYUNXY3EyZXI3Y1dEejU0R1FERkJ3TjBo?=
 =?utf-8?B?TzJrQjJRVE1kTys4UWlIYWpJMktTUWFNWVBueUhjNTE2R3pWTExVNHBKV045?=
 =?utf-8?B?RmtXVHZWMnpHcE5pNTZoMkdjN2NURUpnYnNodlBmYzZSckNRNGFjUUptZkxC?=
 =?utf-8?B?UG1qeXE0R1AvNmQ0U3c5UVN4ZFVoQTN4Qm5rL1ByT214R0tqTDRtZnFzSFl2?=
 =?utf-8?B?K0NicnhTL3hGRTlybVlZT3FZdW16TCtZUmQwbEVRZlRBZzB0cG5Da0NNZVJk?=
 =?utf-8?B?UVpsUlRtTkhFWTA0UGJuaWk3cEVtcDJwK1ZBcG9wVFgrMjVNUkRxeW56aUJr?=
 =?utf-8?B?My92L3JsclFiUXJZSFpxSGJ0czNUbVZKK2ROMkQ0QTUrMzd0RDZ3L0wvNnh2?=
 =?utf-8?B?bXREdlRFUFc2RUZsaGxDWWNwbFpSQ3Z3V0Vlb0g2WGUxY1NIUUh3NC9kSXFN?=
 =?utf-8?B?dlNDM3lydXcza2poY3RyWVRuSG4wa2NpUEFkV01sZm9FMnBVeGpHNjV3cjYr?=
 =?utf-8?B?cU1KMEpFSG1MeEhpK0JkSURxU0NpNWpOcGNaZzlZRDN4REovNi9uL003eXBH?=
 =?utf-8?B?VGVjNHR4WWZVbWRjV3JnRnlJdmxrZE5POG9Nbzc1MElkNmJ6RVhwbmNIK0NE?=
 =?utf-8?B?K3BNVDBSNU41dFNFbXNuUWoxR1pYc2RpVFJiS1JPa0ROeDd1VjY4a0ljWlJs?=
 =?utf-8?B?RlpyeEsrWjd2dGIyRzVoa0pWYVNLbmd2VWhqY1U2YlRaRkJlSTJYV2J0UHRG?=
 =?utf-8?B?YVJDdllIOStTZFU1Q1VMOHFBWE9qeDJQcjdxRVhHamczQjViWlRDTytoR05Y?=
 =?utf-8?B?ZG5zVmRtU3JLMXczM3VzM0FuZWJ2VGFPK2MvdWIweWRXS2RUZVMxV0l0Ly84?=
 =?utf-8?Q?nRgaqhhPqDLmPU2uOssxFWJVI/OgnjLS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXNsN2orWGg2YmRkVUJNRXlabVV6WWdyM0pjeUZlRTFHM01FQThTOERUT21P?=
 =?utf-8?B?NGV1aXluSEIzbnMxd3Y1a2FhTGI2NGMwRVdUeWlZMVBBbFJaTkp6Q1pBOXlK?=
 =?utf-8?B?ZTErMUFRSUxpY0lmQ2Y4YnZiLzhMUnMvVWZlWmZMMDRRdkhkZWFraXJ1SEdq?=
 =?utf-8?B?d2tQQ2pMSm1iUUtaQ0o2N2JhcTZsaU96QjlhbW9HblpCOU5iV1dNSjJ4WEY4?=
 =?utf-8?B?Wlk4cVczNEVCMnZjaUkvV2hzcTlvV3djN0J1SUJEVU1tZmEvYTJaSmRrRXYw?=
 =?utf-8?B?UzBGc1hRYTZOaVFnanhlQzZUajBtT1paajRmRUVIS0dIdUdoUzkreDU3WEVy?=
 =?utf-8?B?R3ZNS21ubG9PSjUrZEtzR1FNSmd5M0Q2QzhIVGxBeHplOUpNVXNLOTBSUCs1?=
 =?utf-8?B?N1hwNW5OemNSMWthb2V2V1MwODZ4Z2lSZUJKUkVXK2tsSXZxM1MxU3czVGp4?=
 =?utf-8?B?SWxVT3BzK1dpcG1CbW5FY1ZNN2EvamFqTUZ1WUY0U1Jpc2h2bEMwS3VLMFBZ?=
 =?utf-8?B?MWdtRkRUSTg4amtDMFBNOFpLZVd0U1BJblFXRmkxL05HeTQyS2xBVWYwUW44?=
 =?utf-8?B?cXRFaElUQkExcE1HaWNlT2FBVUV6RFUvSHVjM0ZOMlNjUGNDd3ltSzZSbm16?=
 =?utf-8?B?VGd2UGduaUdPYmpDTytkclVGWjg0NlAyVUZieGxGK1krcEl5dXNlOWtrR0Zr?=
 =?utf-8?B?Z2pDTzlkUmdRY29jVEVQNENYaDFhaWVNdzlFL2tQeERoZUpaOUZXRnNTTmxR?=
 =?utf-8?B?Qk9kOXUyalNwL3lWdkVINlFrMzRXL0E3YWpmYlU4N3dsSVRMTGRPOHZ4emhP?=
 =?utf-8?B?eE4waTdWclVkOUpMcGJWYytXd2F0dit3U3V5ZGlOQUo1dFg5WktJbW1KMXZO?=
 =?utf-8?B?Mjh1WWtkKzNxRGVRMVVCMEVUU2dmYXh4cGlhOFdQaEZVWnpnazZLTFRKS3dJ?=
 =?utf-8?B?UVpob05kRGNCakJBSmdjdmFLTWxlQVd0NGgyS3dTcnBmc3YrMzQ2dnBRemNQ?=
 =?utf-8?B?TkdaWmNoelhyVm9ZNDBpeWJ0STFwOEduOW52Y2VPQkpsekRFTkY0am9yZmVW?=
 =?utf-8?B?VFRWRm9LaE9xMWdBTGw1ZkxDY2tCWHJEL3R1bkNuTFMrcnluSnhKejJiOGZ6?=
 =?utf-8?B?VHRCZ2VmQnBWanJGU3daREtRbExkeXJscDNkQUlycWlLMlAvK0I2Ni93VThW?=
 =?utf-8?B?S2FObEw2ZHRCMldwdUNYUDh4OW82c25sYmpiTDk4ZWVaM2xaMDVPRU0reGlC?=
 =?utf-8?B?bHFmNkZlek1RdGJtVVpJR3VTcEorSGxtK1YxNHJBUjY5ZHIydGljUWVyMyt3?=
 =?utf-8?B?eTBBTUJaWXFpSXlHczFDYmF4Y2crNTk2dGozYUJVUTlUZGZGS0NnL0NmeERB?=
 =?utf-8?B?RkFqNXlWazFud2FxWk02RDN5N1djNDhsazA0Um90TjJkZWNZdTBKa1I4UUNx?=
 =?utf-8?B?QTlMeUczSTRiOHNkdzBybDlqTVp0U2trWlBwQyt6WVBDKyt6NVlTbzQ2YjRH?=
 =?utf-8?B?VGFQbjBxWmpDNWNTU2lIWEtNSHB1bmF5VGV3VUUwc3Q0NGhiTFVmMWZLV25j?=
 =?utf-8?B?T1owazhrZ1kzcm5qek1wOHlkcWY5ZjJvRDd6ZDdYWnJwUUpBbXVLd3llUnRK?=
 =?utf-8?B?MHRnaVRZdmRrSWZXSHB4ZklZWUd3QytXaWY5YU9NZzRQNmtDd3JKc1FZeUlm?=
 =?utf-8?B?ZGlITitIWHRrYytGNjJHQlhVWWZaTnI1NEFSVTdueGswSVVMazUwak5LSTFx?=
 =?utf-8?B?dUJUdjRUcDF2ZHd0cjdRSEI5Q3ZhZVJsa1hJbUJiVGdzRWs3TVM5czVNK09K?=
 =?utf-8?B?NUFJTk5KdmpTTDkySlRKb0dvS3V0ZUV4SE9XbGl1M0hKd2UvM3BjTkhIdUZs?=
 =?utf-8?B?dWJsZ3R1MHJrdFp3QTIrNzZVU1pUcFVlYjVyQUFvbE9rOUxHWldkVUpWaSs2?=
 =?utf-8?B?b0UyYkYwSUI0MjF2SlJIODd4dU1OVUV0aXh0djFWVTBDREpvZUhVc1YyWXVQ?=
 =?utf-8?B?ZFVVbDExanVzSmNsVlJSTU53QlJrTlV2MlFhNWM5Vkl5RVBBT001bDg4eVl4?=
 =?utf-8?B?ZWFwVlhmTGNENTJDTVAyOHNSU2FNRkZkL2RkTFMwNmtpY1RBS0Vzc0V3TkRq?=
 =?utf-8?B?Zm9VL1ZQYmdaTWduQW5EQVFMaFNpNVRJdjRJMWZjeVZXanJiTW1tWUgrb1JY?=
 =?utf-8?B?MElRTXhhYU0yd1JXUUF3MUEyazlOWjVWZXcxakRiK2U2am9tV0ZWUjVxSnQ4?=
 =?utf-8?B?czN0eUlYQVBhMWxaNSt1R2hIZDZyTkZGdlhEVjhMQ1Jjc2VweVprd3phUTdN?=
 =?utf-8?B?c2Vxc3FaL2RqN0pSSWRlTm5JL2N5Mlc4eGFQS1lidWw1V2pCbnl2UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bed2a0-216d-41a4-000d-08de534ba3a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:02:26.7576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2zzJ7pZnA+HaX21eJ+3N9dqFhuncK2pmPpba4660NRckjBHdEOKRNkGv+G41HZW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
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

On 1/13/26 18:44, Tomeu Vizoso wrote:
> This series adds a new DRM/Accel driver that supports the C7x DSPs
> inside some Texas Instruments SoCs such as the J722S. These can be used
> as accelerators for various workloads, including machine learning
> inference.
> 
> This driver controls the power state of the hardware via remoteproc and
> communicates with the firmware running on the DSP via rpmsg_virtio.  The
> kernel driver itself allocates buffers, manages contexts, and submits
> jobs to the DSP firmware. Buffers are mapped by the DSP itself using its
> MMU, providing memory isolation among different clients.
> 
> The source code for the firmware running on the DSP is available at:
> https://gitlab.freedesktop.org/tomeu/thames_firmware/.
> 
> Everything else is done in userspace, as a Gallium driver (also called
> thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html
> 
> If there is more than one core that advertises the same rpmsg_virtio
> service name, the driver will load balance jobs between them with
> drm-gpu-scheduler.

I only took 5 minutes to skim over it, so no full review.

You have the classic mistake of allocating memory in the run_job callback of the scheduler, but that is trivial to fix.

Apart from that looks pretty solid to me.

Regards,
Christian.

> 
> Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
> Tomeu Vizoso (5):
>       arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory pool for DSP i/o buffers
>       accel/thames: Add driver for the C7x DSPs in TI SoCs
>       accel/thames: Add IOCTLs for BO creation and mapping
>       accel/thames: Add IOCTL for job submission
>       accel/thames: Add IOCTL for memory synchronization
> 
>  Documentation/accel/thames/index.rst               |  28 ++
>  MAINTAINERS                                        |   9 +
>  .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  11 +-
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   3 +-
>  drivers/accel/thames/Kconfig                       |  26 ++
>  drivers/accel/thames/Makefile                      |  11 +
>  drivers/accel/thames/thames_core.c                 | 161 +++++++
>  drivers/accel/thames/thames_core.h                 |  53 +++
>  drivers/accel/thames/thames_device.c               |  93 +++++
>  drivers/accel/thames/thames_device.h               |  46 ++
>  drivers/accel/thames/thames_drv.c                  | 180 ++++++++
>  drivers/accel/thames/thames_drv.h                  |  21 +
>  drivers/accel/thames/thames_gem.c                  | 407 ++++++++++++++++++
>  drivers/accel/thames/thames_gem.h                  |  45 ++
>  drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
>  drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
>  drivers/accel/thames/thames_job.h                  |  51 +++
>  drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
>  drivers/accel/thames/thames_rpmsg.h                |  27 ++
>  20 files changed, 2113 insertions(+), 3 deletions(-)
> ---
> base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
> change-id: 20260113-thames-334127a2d91d
> 
> Best regards,

