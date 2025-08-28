Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31027B3918E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 04:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5710E921;
	Thu, 28 Aug 2025 02:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="OsD+TrRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012008.outbound.protection.outlook.com [40.107.75.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BAA10E04B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 02:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGAY5rI/WG41jfGa7+Uo8pfDsvKvzG4GJBY8d6yXFZ0qPAguRamhAv6tIy5uaQ7wJEIHt136LomwB4ApkjhPG8zmUi+6cPSuRGfE+tsuWyoasUaxQMEkXQpsIHljFxfxT8wAwhS529G3+rFctF/3pskfmt9uTljMbjCiZTsp7vtAKoaTpXHA/CcOwP4Y3UbhBgeOCJP+z17ZyKukxiMRYIjZiM0XcLSrjhtqEIAOAmJXQd4J3Zn/y3Hg8cDgd3eCIIl3rQfzGd1vd9RrNXfQERwAwY4BuPpKt1iFuN5oFHEZDslTLXx24x/YIAzveYdcQDLLOMLx5hiOj4eMxYZd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXzaiOqJmcZi3EUvNLeIpsXmm5VtJpoc27qn7nKMI0k=;
 b=OkMJ7kQfdP+YLXlfOV6LjQ9Qov37MMHPr22LQ/9R1GWnCHum/hI52DoqkrUS0AZY3yF3fV/qxgOTB1tXDReYusZau7nxmJEulk4jHUQGcLVgbVkcs4UtzQJR00vH1B3B7NnEabUwJSIL8sNxpzcpNxUqrwecMK01yWsorBmNCetTEA8gGdAX2ig0h41kBf5Lp3maCJn14GRnV664fLSc0LkAAVV4xm5w8hIalRFBD96gAHnZ7nB1QKfnJEq5qQsXQa87leEFxiPDQ0BNYFkO2nO9a3aifBK7gor63PgfOU1fWJyzuhCWD0wwbzs0DBUe47zNT5AuIh8hwI+qkF6l7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXzaiOqJmcZi3EUvNLeIpsXmm5VtJpoc27qn7nKMI0k=;
 b=OsD+TrRG6Sh7rqSu4jIBLZZfzvThBEktC7ve4t/iNerYcWyjWwYX8HlzR9PkBjeUTKevKx2ozjX4oB/4IMejAEtfvJvvR54LPkFjTxgBqADv57EekCVf7jPI5tB4IukKqKkD196d7jUyRspnWAFazPDXHnif+nnHa05orHsuJ1ePkY+zFz77LMJ/ggs4EDxg+FPfLxwnScuqb7yxdWOoSfx4Fkbg3O22aYGFlQ9NRGzWNDUrfIKWZ9O5+2haiipkHK/1JLfErqTN+BqF/9XD5w9EpiT8O5Q20fl06rX8AszRXLLVC5NnLV7HCRLrncjII3YEQKFRHRaxK1qYojPeKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6670.apcprd06.prod.outlook.com (2603:1096:820:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 02:16:21 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 02:16:21 +0000
Message-ID: <b7438e06-b747-4afd-8581-fba671a35a4e@vivo.com>
Date: Thu, 28 Aug 2025 10:16:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Use int instead of u32 to store error codes
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, Min Ma <min.ma@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250826072917.186638-1-rongqianfeng@vivo.com>
 <51440ea7-bbea-c890-057e-109685a72cb3@amd.com>
 <eaefefb6-7ced-4c47-8bff-bae83f143b72@vivo.com>
 <6222cb69-fbb5-07b8-043c-cf0c25c9f3f0@amd.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <6222cb69-fbb5-07b8-043c-cf0c25c9f3f0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a182f9d-7cb4-415a-eeca-08dde5d8e0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0hjTEVQVGZoblJOY0hyVmNvY2l6UkZGVkp3d1JDbWN0QmZobGJ6Q1VrbERB?=
 =?utf-8?B?Sythc1kyLzVSaDNzZ08zWCs3cVZiQ1dNWkc0cVNFNWcvQTlIeFhFaC8wbDZa?=
 =?utf-8?B?dDhIdXhFYSt4QkJHNFUyZi9NdDFhUDBxMWNmOEFUcTN2UEVRMjl4Nkt2VUZo?=
 =?utf-8?B?UWs4YjNQT2FYVDM2R1YxVUZueCtDTUk4Q1F1SmpqYnJKN3M1WXRXTTFxSzBn?=
 =?utf-8?B?dFdacmdNM2pqcnRGNys0ZVQ3Wkp1RVR0akQ3NS9KN2xlVlVvVm1tNlVYMUp3?=
 =?utf-8?B?QzV6MnNOMEwwYkZnaEZ1WFlteTdEOHFGVDZtWjBtYVRlVmdtcWRUOXdkOUVK?=
 =?utf-8?B?dGlvdUlRci85VE5hOGtCREdveGkxTzBFWFJGWWw0SUpITnRlbGtnOS90eTIw?=
 =?utf-8?B?SXlyZkExNEhibUk1MXVqODFaZWlUQXllcS9qZ0I2ekF5WmR3RG00ODJwbm11?=
 =?utf-8?B?akwvNU9GWFVJbTZzWmFIVTQ3aGY4emU4VWpiWlBTL3pGOW5ybnpTelk3NVJa?=
 =?utf-8?B?Q2RiRmc1TnlJL2xCaHp0dEJGbXBvQlNEUFFnUVcvWHZrWTBXLzdhNWxNY0hQ?=
 =?utf-8?B?TWxlbjlLRkd4NTJ3RzlmTEMvem9UeE5TNlZCbzhpc3E4dHgxQ0xtdlFKQ0hN?=
 =?utf-8?B?MjFGeHpPNjdaZjArZkwrdjcvOVRTcDdKcDhreVdFdVMxTjRuc3FCY3MxZWlL?=
 =?utf-8?B?N0NEcXlCaEt4bHBRcW1qTDVIVzFQVVhRZ1ZLRTYrTlNGZC9hWFNlR1dtZXZY?=
 =?utf-8?B?YUtWL2tKN0dyOU5QUHpNaEkvS0NuUDlDdXk2S3lUM2JNL01DSXpaMllIVkww?=
 =?utf-8?B?WHVMeDNiL2JRQjA1Ky96ZHEyZ0hGbUY4K2s3S0Y5UU9xNnFtU2RUMGxEWitB?=
 =?utf-8?B?YTNOS3F5NTJHNGpsMDQ5ZHV2RzExRGM0V0NXNWZsdXV0Y0NtcS9CYmN4c3Ry?=
 =?utf-8?B?TG1RNWRINjVGT1ludXhKeXRYQ3l0cmhWbnZGNXJHcngraHpZQWtJU3JLcExw?=
 =?utf-8?B?L3cwc05uMUx6RHMzd2FBdUJ3cFNnSURBcWIxbUl4dllRNnJTRCtrM1JNZEFL?=
 =?utf-8?B?SmlDZmUrbjhTOGJKZ0twS1pVdnZidnE1bFUrV2V1bERMQU1udDRTek5jRSt6?=
 =?utf-8?B?SCt5M3JtYzkzSkpIVkNqb3ZyYmJ1TnJOZEMxTG1yMFRFRnljSUVQcTFlQ3Nw?=
 =?utf-8?B?SFpvQlNRc0dEM2pXTmNoWUpCK29tazk1WmR2NENhQkFGUVYvNFBrR2JEQlVu?=
 =?utf-8?B?ZG40KzdXNHFCVVo5dW5OQkRjeTRlK2NEQTV5ZE1XT2srb0RBWWhUbForcGIy?=
 =?utf-8?B?aGR6ZDM4am1KVUxRUXZtYkdLQXdKSTFBMEk1QVUzUDJmQzZoc0oyQXFiMXNs?=
 =?utf-8?B?eVdyOXdvc1kra1dEK3F6Rnl3dWEramdBYnNBT0VaODVvV3NQVmVxeklzbEFV?=
 =?utf-8?B?UjhYWS9rUXUvdU1EcXB4NXVIV09sdEVqNkI5eGtkRkFaejNIRUd5bS9EaXBU?=
 =?utf-8?B?ajVWNDFxeUhEL1A1Sk1hZEM4dnBwS0NjdGcyWXhGWXJkKzZGZWJXanNyNlZC?=
 =?utf-8?B?ZzRMcWZLWjhaUXQ5RzFvd3JnTVRrellpb3hTOGtWd2s3Tkt5Nlk3aGFwWHVO?=
 =?utf-8?B?ZmYxcWlyMGdIZzRlTHFnb3pDYXZwYyt6N2lUNnkvTkhhdjV4MnZ5dUwrbU5H?=
 =?utf-8?B?UFhDWlRuQmNKS1FnV2lHcEdXOGkyOTBUakNJcFFYMnhRNEVEdUxYWDZBSTVk?=
 =?utf-8?B?SEM3MmVFSFFxT2Y1OUk2MUNsOHJaemFlSURGNlVHV2dxS1ZTTHB2ZlcvR01P?=
 =?utf-8?B?ZjQ0ZVdhQ2ZtNzZlRDRzeHpzUy85TWFRTzgwSkpnTExmS0FWb0NLVXNXSUhN?=
 =?utf-8?B?eU95VmJqa3UvazNMQzdpZWhxRS82ejRSb1A3N0ZmRVR1Q1ZtbXk5dEJvZmFa?=
 =?utf-8?Q?91ZhHdRm/rc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjJENjd3UWZOZUc5dXdRVEJPclZ2Z0F0enMvREJUMmJ5NDZXdVRZMHJYNzFQ?=
 =?utf-8?B?MUltZ0duRVJyYzBETm9IYnNtdlJ4Z01qVkNmSTVuekJuaXVMU2FpRjlxU1Bk?=
 =?utf-8?B?NjNWdGVsUHZOOVE4Qko2dnZZUnNGYi9GblVMY05nUDdxaGxSM1ZDYThPcDdm?=
 =?utf-8?B?NlBEUVVRRnJSdmxFa2JNaHBQYWIvR2MvMXZFWUZacVpPejVRR1J3RWJlR1c0?=
 =?utf-8?B?VysxLzJmRi9qZmFLMWt0UGxGMVJKTFVVYVRpczJnY0xjN3cxa3ROMWZvMFJW?=
 =?utf-8?B?T1lGNE1jb2lRL0RCa1BQMjFZbVBKZmhZc3pleHRwdXVNcEZTcG1KR0RHbG9Y?=
 =?utf-8?B?SGxDOGl5czdqdmxoVDNIMFFxQnAwQXduaTRVaGFpb2gyaGtBTXExSUYrRW1H?=
 =?utf-8?B?VjcvZ0FTNXNkR2FCbFA4SW4rbFRncElac01oTUJOMlp6WlVRTWhQd3ZmL2t5?=
 =?utf-8?B?VS9YSFZGSThtQUNiZjVnSmYzSjdOeFQ5SFJ1TUhIQVZHZWJ3MnRUc0NZWWJz?=
 =?utf-8?B?U1hxVlEwc3ZRNVo1VXRyQkgrWFRRelNRR3hOdWNPc3lFK2hNbjJLTXBMWnB3?=
 =?utf-8?B?WHF5Mmk0SytIbnA1d0xkMWt4MDAxaHNycEdBKytyajF2eWJqelZGMkR4eHNr?=
 =?utf-8?B?NS94aTRCNlhiRjNVTUcxWFlBdTA4Rk9aNlQ3bFJVdkVJWkFBMFVraUNwUFJH?=
 =?utf-8?B?RzU5eU1YbUJ0d1FBd0YxYi9VSEN4eCtpeFFsNnFkZm93SGRUMk16ZFNaMGdQ?=
 =?utf-8?B?VHNsLzNQQThBNmprOStlbmV6LzFIOEs0WWhaZlZheUNKd3ZQbFhRN24yVkxm?=
 =?utf-8?B?eW81RjVyV21YRnhNd3RpalhSanBCalNJV0ZGQXZuV0ZjM2liMkZqTlQ5Uitu?=
 =?utf-8?B?WE05cWt3TnVIU3M2bTFZaE5qRE5QaWlTeGwyUFZhSUYzRzEydzNob3h0VU1I?=
 =?utf-8?B?c2tKL0cyQzQyenZZc0c0OHo5alphS2Q5Q2VSeWhYaDVNRktvZ0VKYVJnR0l5?=
 =?utf-8?B?UFZBZnZoT0NxZUtidmxGaG9sRGRiVUxZK2libTV6Q3c2R1NraXN6VnZHOHh1?=
 =?utf-8?B?ejJSbG5Rem5Ucmd3T3hJZlJRWWRCMUl4WTZ2RGdZS0hleGZsU095L0xSY2Q2?=
 =?utf-8?B?STRpVGJVYTRqU1ljR3lWVy9rVGlIcW9RQm40ZkR1WEsyaGdFMEVyM2NXRUtp?=
 =?utf-8?B?eHM2RStST094bld3ZTc1NDdxc0NCYXZ6MzlGT2ZWT2hNbkdPSldLTWxzRU5a?=
 =?utf-8?B?czZlYlR1cWR0VEJPNDlLU2lQL0lmSG0zdW1ONXh3Rlo2cW5Pc1U5TWRncVdy?=
 =?utf-8?B?SkJ5WU1Rb2N1WHd6VzBIN2V0YUw3U0hpZ2ZVbWRUMTYxNDJYY01MRHZuTFk2?=
 =?utf-8?B?UEo0VG9CTFBGVU8rK3NwZEhzN1ovcXNEV3lpM0pCMFArZ3Z2a0luKytmbDVX?=
 =?utf-8?B?Y0NRYmt2WGdCenFjcXlBWWpXUjRqdERseXZXNUZFR1BZQTZyR0FBaXNLU05j?=
 =?utf-8?B?OWlQS0s4eGkyVll4U2xLK29wczZ4cXYxVjNmY25uN0Q4OTkzbW1SRG9xcnQ2?=
 =?utf-8?B?OHlZQUUvL29EYTBud25lTFEvYjNqeFRnbGJwdXNiVDVpa0UzOVFkLzRweG5k?=
 =?utf-8?B?aVdlSkJuM1RFdGs4RWVTOUlkemtsVnFHRkJ1T3pSY1BGRE5LUGpvV2l6WGNF?=
 =?utf-8?B?ZjlDTzBTYXA1bFRtQUtqVTJYRmJsMXY4WCtZY0ZxSTZxU0s2TytOVXNFSTJE?=
 =?utf-8?B?Q2h4cWI4VlBpbzQ2NmZyd0NKZGJUSnNBa1I1WjFxdnc3d3ZIOHhCVHgrMWkv?=
 =?utf-8?B?ZkxNQkVrWURJT3lCZXZhNS8wZHArckE2MTNyWkxHTU00bFZLZ1NrUllKdmhW?=
 =?utf-8?B?K0VpZTVlakVaNkdvK3ZDbC85N3Z4bGlzelcyVmdHa2pPcWkxbG9xMjcwQmdQ?=
 =?utf-8?B?NkowQ3hSRU1nSi9OdWFwZzBxVnFPcTdENlNuVHNPWnl3QU9OcEtpV1JHNW0v?=
 =?utf-8?B?R1VkSFd6ZzJ6QnFPVVArdy9iZGFyN1NFaklzMk5lMFBpdnpMNUJMSEtwcTIz?=
 =?utf-8?B?cC9LMjFIc05GRUpoT0d2bis1NS82ZUQxV1QyQjBMVkMzRjUrVUNKTXNDTXRY?=
 =?utf-8?Q?qNpCIiH4aeuujBYx54DnzIyT7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a182f9d-7cb4-415a-eeca-08dde5d8e0fb
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:16:20.8995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrI7cb8viAdobPzrFdxTuIr/DU1MXdi+iIGz5xAXPdLBJ8nf3goyYyQtozSc1LHc6jZYsnSxFeut8u7QMgDpxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6670
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


在 2025/8/28 1:18, Lizhi Hou 写道:
>
> On 8/26/25 19:15, Qianfeng Rong wrote:
>>
>> 在 2025/8/27 0:31, Lizhi Hou 写道:
>>>
>>> On 8/26/25 00:29, Qianfeng Rong wrote:
>>>> Change the 'ret' variable from u32 to int to store -EINVAL, reducing
>>>> potential risks such as incorrect results when comparing 'ret' with
>>>> error codes.
>>>
>>> Sounds this fixes code issue. Could you add "Fixes" tag?
>>>
>>>
>>
>> The 'ret' variable stores negative error codes directly. Storing
>> error codes in u32 (an unsigned type) causes no runtime issues but is
>> stylistically inconsistent and very ugly.
>>
>> Logical errors with 'ret' only occur when it is compared against 
>> negative
>> error codes. For example:
>>
>> u32 ret = -EINVAL; // ret becomes an extremely large unsigned integer
>>
>> if (ret == -EINVAL) // This condition will never be true
>>
>> This patch reduces the likelihood of such issues occurring. Since it 
>> does
>> not fix an existing bug, I believe there is no need to add a Fixes tag.
>
> I agree with the change.
>
> u32 ret = -EINVAL may lead to a gcc warning if -Wsign-conversion is 
> enabled. That is why I suggested Fixes tag.


Thank you for letting me know about this. I will submit the v2 version.

Best regards,
Qianfeng

>
> Lizhi
>
>>
>> Best regards,
>> Qianfeng
>>
