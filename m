Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0CF944A13
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BA410E911;
	Thu,  1 Aug 2024 11:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="cwJxBMDQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2084.outbound.protection.outlook.com [40.107.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030410E90D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 11:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFgVw143XjQQ2A0Fh7FupGgg4gCwS6v5zwJaohkOhiXXmKvk/5e8UE13yIm9ILqRlyIuUbmGkr3jIKsqf8p3R/7JSs1IRTSwTqWx2+wdhFDtNzXe4gxyPFCkzF7FNNDOZjB/6qV4ltFebEZvyyOYISh9znn3Q5cxmW6h4nPACXSCjrYnB+AgdnYXxgtq/XQbakU5OD/yTexoBJOiMjVTPVFdRX5jkVE3tUAgthHE1ZzBj4X5yKCfMF6Z2dx0Oqw9pMvUIoFgiazQTlQlSPuHn07IVh5JoCdJPy9VVIq6MyNVvyaWqnJyZsrPTtdclKk4xfkggmumv4lLVPoplyoIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LGKzB3QSRswVLJxrr1Yluc4BnPkdQcHMtaPPdjLdkM=;
 b=B0zbAnP1tg5EkPdskapuc7hvFjkF1CF6XEEHIX4IS9NZFvrd7MYE1wI3gciwHx2pjmtWEMYPh/Qb0chdkYR3+fmMriuS/pwTeSJ5m25+zDvfnEzX4fTUmnq7QCaAgU7Vhtrh2DFYZYmsWyvQFJW3XITKmzGKSh9X/um1l0Ev/t+uSpuUF1nEx2jndS0gepagHn5qHXLoloqqbJ1vNOreo1ThLRO9jlfDCoSHbNfjDHebGs6OKdAvVgMvMuKrD739s58h1hwB77osWfMBm+oNJ/kL9hL06wy2dymRE+OmsFp8qWzyrh+Ft4+nkuRwt3W996pwW7UJmKtYVZrcL+kD/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LGKzB3QSRswVLJxrr1Yluc4BnPkdQcHMtaPPdjLdkM=;
 b=cwJxBMDQj84D/0boTaO+vaYIeLghFomCiv56VK5r4qimMwEd07hIFC+gampBurZXCGShOEg2VqXo3Dw+a7h7KsspZoCNNRpq6FZ9+lfvttAAne3EpHWhIiMj7l2Bpvs4/84+9GwJGk4B1NvPZoNhT5rsavSNFyBiE8t2bpj6iJtwkC4lOs/b5BZER6JMoTaTB6Bm1W5dj5IgBfcrrqj94Jeh5sdj+kr/2jLnJYjsoDjp7F7CwVki9n/WT8dmYX3Dokrk4OQ3+9hjIt7n+EHlIibVLvUOqWSCeRVi+AWY3/Xb/XGdCpE/pgPpsx4akUr6FBtEDbFDMpI+ZOst8hW7NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB6506.apcprd06.prod.outlook.com (2603:1096:101:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 11:08:18 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 11:08:18 +0000
Message-ID: <50615530-f77d-4c91-affc-cb63b4c67d02@vivo.com>
Date: Thu, 1 Aug 2024 19:08:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] udmabuf: cancel mmap page fault, direct map it
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240801104512.4056860-1-link@vivo.com>
 <20240801104512.4056860-2-link@vivo.com>
 <46d00d9a-b86b-4e4d-863f-48d71060ef2a@amd.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <46d00d9a-b86b-4e4d-863f-48d71060ef2a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:3:18::32) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: fc97b9bd-fdfe-41cd-8820-08dcb21a3f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzVjSVg1Mk1Kenh4M01uR0NJcXpJZFlZUVlZS3UyZ1FrM0JmemFTZEUwWGxL?=
 =?utf-8?B?dzM0bGwzQUlFVUtleWRDaVNpOC84YURJRHZ0eW5pZUQ2RjJuZ09VQkhsTk83?=
 =?utf-8?B?TVNUUVY5b1dibnFwU3g5M2JpUG1ER3RPRU1ZQVN1QmZmdmxSMmRlUW9ZWFF6?=
 =?utf-8?B?c2g4Vy8yMjhCbVp1eXgzUit1ditzb2lKa0k0eWtzUjFDMWowdFZaZFhEV2JZ?=
 =?utf-8?B?cy9FeGtnRlFDYjlmdWU1eXVhZUlMQzlVVE9qa3pRUTUvV1loQnBiZFZjR1Fp?=
 =?utf-8?B?K0liYUpRTWhjdmUrMlF1MHFMeVBXbFR2d2E0bDBEQzhld0Y0dG93VExRNzlY?=
 =?utf-8?B?VDZTVG1MT3hEaTZBZ0hTdC9wY1U1RGFQalVRZERvYVp4Qm81RDNwbE1jZ0Jt?=
 =?utf-8?B?QkNOampJSlBuZ0hpQnBUSWtaNHJtWVEzMWNYZHJuU09VclYvU3JEVUl0N2Vm?=
 =?utf-8?B?eXNhT0xaOGdqQ1FvdGduYXhYRFBzVm5KZUpZOFZOVThVRXFEQTFvUWY2QXc1?=
 =?utf-8?B?VEJld1NyVEh1ZFZRRjV3M0Y1dVZobkRRM2pVMEFwOHdzV2VTZEhESkZCRFU0?=
 =?utf-8?B?c3A1SkJrVlQwT1huT2d0Rzd6Z1RPNlRQc0VQWllLY2doenU2NkVxWDZZZE0v?=
 =?utf-8?B?aGh0aXIxNDVyL3gzZUZBc29WR3EyVHU0cXdlM0dac2JadVN0SG0rR3JGUVFt?=
 =?utf-8?B?Snh6WHRTZHFici9XSU9HTi95dkhvME00S3BEdUFlcHM5eG5mTllzdWVLL1JF?=
 =?utf-8?B?TmRmSDRlVnVORkt1QzYyZjl2VG1uVE5seExEM09zQ1pEbnhJYjFzOVlXdlRu?=
 =?utf-8?B?U1U3aVIvb2M0RFMxY1FyRUY4YnNYczJIM005TDZtcUJnSitNakdCL2xQWHpo?=
 =?utf-8?B?ZFQvQzNtVUF2NSttNWxkb0t5aFUwUTAzVmFkcHR3NGlhemdKSE9YYVJjZlZ5?=
 =?utf-8?B?WHR3aHFML1c4SzkvRmZmOE5jNTRqTitQLzFGMUVwU3FFbXpiZStBVm1WRnUz?=
 =?utf-8?B?aGdsNzlDRURLNWRiVFFRcEM2dnhkdnhPdEpBc1hCM2pzalMyY3BOUDJpWDZY?=
 =?utf-8?B?S1lwTXViT0xjNnliVU1CUGxNZGh6S2FFaGw0Ty95czNRbWovV25NRWdZS3dt?=
 =?utf-8?B?bkIzYWZBclJhT3BqYktoWUh0a2tJNCtUdWxNUHJYbE5xYS94NlVJNTN2ZEs3?=
 =?utf-8?B?Z05LRlNXOUpnUGRpYzlhZHJ5WHNHT0M2VGVMQnVwcFNMRTh2dEx6NnkycHpP?=
 =?utf-8?B?eElSaXJKRDNkUDVQZzJrRTRPZkVYTndjM01kTFdTTi9nWjFUejVyU1lRdmdq?=
 =?utf-8?B?RU82TW9Nc1VRVGtoYksyQUszRnVGbExPK1dKVXptZUlNSWVTeWduQWoySzdU?=
 =?utf-8?B?TjNZeXNxOGhna21zRWdSamYzZzZ3S21qNnVpbG9DZ21XMFYxVUFTYzhUcjVU?=
 =?utf-8?B?aVBpOTZaRUtHMlhZOU1oYkVoMTB6UDhDWkhqaGtQaFJoOVNVWDc0Q1V6dldP?=
 =?utf-8?B?QWU2YXR4am40VnFZbkE1dzRVeDFTSVBIVVNXZ2x5Mk9MaE9MalZkZXhUUFFN?=
 =?utf-8?B?c2xvRUYvaGRqZWpWNEtwem5EcmZKMjRvT01ObGlJZVcvcEE2dEREdTRHTkxJ?=
 =?utf-8?B?K3czNmgvYjVCbzk2TkF0R29GaHUvclNjT003eERhd0RQQzFlL2t3dmM1OUFv?=
 =?utf-8?B?VUd4emRBdU9PdFBDNmhOc1VaaTk0dlU2N0tLNXZNSXBmZ2dqbDJoNlFqY0Qx?=
 =?utf-8?B?Z05ITnZUT1QyWHpvZ0ZGaGpuOGgvRmJnY21iVXJ3dVBkdkJhRGsrZmQ1Njhq?=
 =?utf-8?B?c28rbWpFYUVheVRMTkpVVUJDSGRBRkhNZ0tWU1V4d0YwSHkvUExGSGFyNElu?=
 =?utf-8?B?djVNaHpDamkyWFlZbE51R2MvSE5HbGtwSzRCOHM5MHJYMGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVVGaHVab0gzQU9Tbm5GK3ZrY1ZJQTYvM0t1N0pqT1duVkxudTBDRVJHL0Vu?=
 =?utf-8?B?bXNaSWlIVkpVa0s3Z0hkcUg0b095UWpaaXdicGZKNGRzSVh5UVlFMVhVSFAw?=
 =?utf-8?B?eE0zdWFwTmFDL2lmUVBnNkVHaStGektMQzNmRG1vdG1DN3pkaDgrV2cwdEVu?=
 =?utf-8?B?RkVrU3JhbGxkbEpSdTQxK0xvTjBHN1JtWWlocFRCVFloWHVTZEkrd2haVnpM?=
 =?utf-8?B?NHd1b3BzQ1lzckZINGpVRUpwNlBNb3IxZ3VybmNTaHAxR0NxUHZRK0dSN2ZD?=
 =?utf-8?B?dGk2OUZTQXZPa0wvTTJyRE8vQ2dTeXF5cDlmd01GOVlqTW1HTzU1cFVXMER2?=
 =?utf-8?B?OGUvb2NmQUlKdlNYOEtUd1F4Mzh2bWhRakZqYk81cXBhQ3RnWjRzbDRaUlIz?=
 =?utf-8?B?OTBUT3Zpd3FRZ2VHbFFjYWNtenVkQmJUeG1RaEp3M3pacnFLY3h3eUVsT01l?=
 =?utf-8?B?VkowQkg5ZWRNancwWFdyUDJ2L2Y0Q2xsTkxZdUg0aUpoWHpaVDFTYTBQaTBK?=
 =?utf-8?B?SG53SkJ1cDlYWWswZWtuMSsvcElBSjA5UktKSkZMT0JvMHZYZURIdjZoOS9z?=
 =?utf-8?B?L3g1SXlpUDZyd3QvZHh6QUMyaU9zOTd1ay8yZFhqYUZSRUorWHFZa01oSEEv?=
 =?utf-8?B?STZvdHN1Z2VrckJjeEFuR2pEakxPMCtjNURnajkzTVVYQml4S0N1bmgyRjhw?=
 =?utf-8?B?c21FMHV1aDJqSE5lajJQSXVZZ3BaUG4xaFhnR2JpdGtJYXVjbmFSMXlmbmZt?=
 =?utf-8?B?TmlETjlRQlB1MVZpOUxMSGdrWW1wUFlucVhmU1IzZGVJeTdRTGpsUnRPRmJa?=
 =?utf-8?B?cW5ucmNHZmFueHRTNzJzNjVhY1BaRWZnaUlhWjlyMWgrMHlNemVHWU9oV0xQ?=
 =?utf-8?B?SWtyejlZVU9GN1ltcEVSaHc0aCtiT0RaRDdobnVqNGsxT0RkdGFXWmJualRt?=
 =?utf-8?B?dGZySFpzTnc0NnFCWk5manVYYW1JbWF5a0txTE5QRUlSTEtiYzI3ckdXcWls?=
 =?utf-8?B?NmxsYmR1TU1WQVRMMklXT0ZpKzVhalRlZ25ZNW1kMHRkL0R4aDF3ajZ0YXJi?=
 =?utf-8?B?RTNUVWwzTko3ZHRqWU9MdUFFU3p4L21qMzdtNUY4ZW1jbVEzNzRrV1ZIMElj?=
 =?utf-8?B?UzZ3Uzh3SDM1RWlZQnFXSkFndklOYzMwYUlZcUlNVk9NMm5JZk1Ea0NZS3FQ?=
 =?utf-8?B?QnJBUDNhRTNPWmRHdlBNR1BsL1RqS1ppVS9NWXhGSjBPVFp0YnIzaEFyRHQ0?=
 =?utf-8?B?cUdVclo0aVVOeXdZeXQ4K0V5ZFB0ZHgrZXA1WTYvbDNlWGNhSDZCVVo4OHlj?=
 =?utf-8?B?c3JsbGNRS2xLdHBvc29rcVlacGxFU2wvMW9JbWhIRWwrVjN4YmxURTc3WGhn?=
 =?utf-8?B?M0xWME5vdUZQTS9FYVdNZ21rZ3JOd2RQb1lINVNnakYyRkxkclltMUV4UkM2?=
 =?utf-8?B?Qms1QUVldDJRZlc1a25aT3ZiOWxhNzBIdE5mbUt3T2xrcSt3aFcrTE5WRVNr?=
 =?utf-8?B?NTBpWERmRFNidHpGbzhqZGVOWGRPNnRjSThRQkpWNjcwRlQ4TVFUdDNhVGcv?=
 =?utf-8?B?MEJyNjR6UDRlQWR4OWRlRFg4MzZmNGsySWVZQ1I1bzZnY0JIbndjbjlGbi9T?=
 =?utf-8?B?dzRQZGVXbzcrdDErYWhvRGJUNHlPNFBVVlNJQmVoR3g2RWd2YkxPZzBKdVlu?=
 =?utf-8?B?WTkrR1dSNVFjeHd5YzlmUU5tUS9SYWwreEhhMGs5VFpXcUVkc2R4bmlWQm9N?=
 =?utf-8?B?R1ZsYmtmVmtTazdFTWMyZTZSVkFtRW9zQVRBeWErUTVBQVordGI1djJZOXBn?=
 =?utf-8?B?MWdLUjNQODBabFk3eG84VnZqSVdGcmVNblRhODllcExlcWZmMndKRU5Mand4?=
 =?utf-8?B?aE1wZzY0K01BMEdvcEZiQStJbjdRU0VjU2I1T1MzOXRJYWZqRTdyWFc5cHNU?=
 =?utf-8?B?WGRHanB0NGRuTmxBSFQ5V3dTZ1Nic3lxdWhabmY2ZUVjTVptMXJFZzk1UDI5?=
 =?utf-8?B?aU5UVU5WTDcrdEtWRnoweFJmbUtHZW56SG9QN1c3Y2JHeW9YWnRtbExsRkda?=
 =?utf-8?B?ODdhMmJtRUQwbDE4R29qekpPMjhoTkE3L3loNG1JTm4yMmxLMnBJUHZLTU10?=
 =?utf-8?Q?5zO2sg2nsdlvGaCvTplkEU4ul?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc97b9bd-fdfe-41cd-8820-08dcb21a3f16
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:08:17.9243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ya5p4fLoQWKVig6WDFBtexIn0h+50Tf9GFwPGygH+DsggPvBfEjpBNO4HOhSftGGP4r5KDY1w1p6SJ+VlNPeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6506
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


在 2024/8/1 18:50, Christian König 写道:
> Am 01.08.24 um 12:45 schrieb Huan Yang:
>> The current udmabuf mmap uses a page fault mechanism to populate the 
>> vma.
>>
>> However, the current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically. The
>> current page fault method only saves some page table memory.
>>
>> As a result, the page fault mechanism has lost its purpose as a 
>> demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> this means that user mode access to virtual addresses needs to trap into
>> kernel mode.
>>
>> Therefore, when creating a large size udmabuf, this represents a
>> considerable overhead.
>>
>> Therefore, the current patch removes the page fault method of mmap and
>> instead fills it directly when mmap is triggered.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 70 ++++++++++++++++++++++-----------------
>>   1 file changed, 39 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 047c3cd2ceff..d69aeada7367 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -38,36 +38,39 @@ struct udmabuf_folio {
>>       struct list_head list;
>>   };
>>   -static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>> -{
>> -    struct vm_area_struct *vma = vmf->vma;
>> -    struct udmabuf *ubuf = vma->vm_private_data;
>> -    pgoff_t pgoff = vmf->pgoff;
>> -    unsigned long pfn;
>> -
>> -    if (pgoff >= ubuf->pagecount)
>> -        return VM_FAULT_SIGBUS;
>> -
>> -    pfn = folio_pfn(ubuf->folios[pgoff]);
>> -    pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>> -
>> -    return vmf_insert_pfn(vma, vmf->address, pfn);
>> -}
>> -
>> -static const struct vm_operations_struct udmabuf_vm_ops = {
>> -    .fault = udmabuf_vm_fault,
>> -};
>> +static struct sg_table *get_sg_table(struct device *dev, struct 
>> dma_buf *buf,
>> +                     enum dma_data_direction direction);
>>     static int mmap_udmabuf(struct dma_buf *buf, struct 
>> vm_area_struct *vma)
>>   {
>>       struct udmabuf *ubuf = buf->priv;
>> +    struct sg_table *table = ubuf->sg;
>> +    unsigned long addr = vma->vm_start;
>> +    struct sg_page_iter piter;
>> +    int ret;
>>         if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
>>           return -EINVAL;
>>   -    vma->vm_ops = &udmabuf_vm_ops;
>> -    vma->vm_private_data = ubuf;
>> -    vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>> +    if (!table) {
>> +        table = get_sg_table(NULL, buf, 0);
>> +        if (IS_ERR(table))
>> +            return PTR_ERR(table);
>> +        ubuf->sg = table;
>> +    }
>> +
>> +    for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
>
> That might not work correctly. We intentionally remove the pages from 
> the sgtable when it is shared between devices.
>
> Additional to that the sgtable is *not* a page container, but rather a 
> DMA address container. So that here is also a rather bad idea from the 
> design side.

Sorry for that and patch 1 3 4's ops. I was not aware of this before. 
All idea to do this in mmap/vmap is just like system_heap and any other 
heaps that I learned.

But well to learn it.

BTW, sgtable is a wrong idea to maintain page, maybe we need to both 
setup page's array(order 0 page), and folio's array(only the folio, use 
for unpin)?

Or else, mapping page to vm_off and vma solely through folio's array is 
quite challenging.
Moreover, even in this way, the memory overhead is smaller than the 
current unpin list.

Thanks for your correct.:)

>
> Regards,
> Christian.
>
>> +        struct page *page = sg_page_iter_page(&piter);
>> +
>> +        ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
>> +                      vma->vm_page_prot);
>> +        if (ret)
>> +            return ret;
>> +        addr += PAGE_SIZE;
>> +        if (addr >= vma->vm_end)
>> +            return 0;
>> +    }
>> +
>>       return 0;
>>   }
>>   @@ -126,6 +129,10 @@ static struct sg_table *get_sg_table(struct 
>> device *dev, struct dma_buf *buf,
>>           sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
>>                    ubuf->offsets[i]);
>>   +    // if dev is NULL, no need to sync.
>> +    if (!dev)
>> +        return sg;
>> +
>>       ret = dma_map_sgtable(dev, sg, direction, 0);
>>       if (ret < 0)
>>           goto err_map;
>> @@ -206,20 +213,21 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>>   {
>>       struct udmabuf *ubuf = buf->priv;
>>       struct device *dev = ubuf->device->this_device;
>> -    int ret = 0;
>> +    struct sg_table *sg;
>>   -    if (!ubuf->sg) {
>> -        ubuf->sg = get_sg_table(dev, buf, direction);
>> -        if (IS_ERR(ubuf->sg)) {
>> -            ret = PTR_ERR(ubuf->sg);
>> -            ubuf->sg = NULL;
>> -        }
>> -    } else {
>> +    if (ubuf->sg) {
>>           dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
>>                       direction);
>> +        return 0;
>>       }
>>   -    return ret;
>> +    sg = get_sg_table(dev, buf, direction);
>> +    if (IS_ERR(sg))
>> +        return PTR_ERR(sg);
>> +
>> +    ubuf->sg = sg;
>> +
>> +    return 0;
>>   }
>>     static int end_cpu_udmabuf(struct dma_buf *buf,
>
