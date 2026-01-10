Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641DD0CD6A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 03:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9810910E234;
	Sat, 10 Jan 2026 02:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sY9Wyoza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2968510E070;
 Sat, 10 Jan 2026 02:29:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1PxnZQ5vxpCFxzTC14IsuPWtXLsG5jbLb5ZzJSK/0b2JN7xGNQ2WAsTKdCZdzSUXiCHEghsErZCfFUQe38DlhrXm0tFeC/GfUjqxkZBX0r7QU2x8FH5vS4fIcN5Gi3idxKbMUhIhTOMkvciei0zRFrU86lZ8c30G+JxPuhw30xABzDIfAMeHp7yzhgV9MrzS6dr4D5S+id99bxJl9kMipdTmyLasiv9LaHQOnmdBTHtwvmaH6Xqp+X1Ch4BoV/l2tE8XxUuI4pjUfr/kPigZ73Rk0du9m84qdU5oT54Tej3dh54ubdio/oSH3QPP1xrzV6ldrkmpv41bhiwFEoYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc7lLxq350px9vG2SJM0EJDOlUmqsmVXrstpdcaw6tg=;
 b=ufHNlE2eObH8XwORRLIRyIGDRGPIe9aYbeNR3bu/ePV/yGz0LVu3dqvbv48pyNWe9BygKT8yTYR+rKUiYZ72zzV51u+laOYYvy/zNS4WeY40xROXwRu1E9R1osI4FrWZqTL5XzYBCW+Hd6R/TsYInqmTte5+8iND6W18wzyukWrIaBk+4EFO1hwtakd3NVo7inwFWf+DHnH9PEQ6gONYPuHRpCyhaXKseyiwHe44+BfEIsl7hWVb9vjxVKAW9T3OhxdtV5+Gdw1Ueanr9GhlaITxEYgTSz58s3QdoKoBWmsc/oCvJVQ8gVuUFh/nnZWpmbmZiNquQSBfr8xHBXJp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mc7lLxq350px9vG2SJM0EJDOlUmqsmVXrstpdcaw6tg=;
 b=sY9Wyozaqh3rUQ6imwSb697u8pxWRSKhwvnMk56OdzHFS458hfT19bVZGkzEakzMyVwwvll0JkjZLaBTtiR6o80GnjLnZ52pqsEL3/1hVq1YtaYG+LuvlaXXOpqFV5KFKP6mB+vtHphkYT7Nlzik6CF2H3wNboDHdMHyfJyJkq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 02:28:58 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9499.004; Sat, 10 Jan 2026
 02:28:58 +0000
Message-ID: <dc1f5de7-40c4-4649-8f2f-0fee4b540783@amd.com>
Date: Sat, 10 Jan 2026 10:28:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: "Kuehling, Felix" <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
 <ab5d1bb7-7896-49fd-a9ea-19294f4f57ca@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <ab5d1bb7-7896-49fd-a9ea-19294f4f57ca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 639fe93d-2398-43df-991a-08de4ff0024c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2g3eXVnSTlQdUhGNUJLMFludEhSbDdOWjAzQUsxb1JpcWRRaGJ5MFcxUlgv?=
 =?utf-8?B?ZGxQVDg2ZGltbzJEd2pFQmtuZW00blQrZzBOV3pySkx6YTg1UmVTNmcrZHBK?=
 =?utf-8?B?WGhXVUxZZ2ltaGhESU0xM0E0SzFWamw5YkRwV0I2SG51Sm1WRGJFWktOSlcx?=
 =?utf-8?B?YUhNK1Y0M1htS24xVi8rVUkwY0UrYXdNcVJOUWhPM01xSjVNYWJ1aUJYbXcx?=
 =?utf-8?B?ODVBM2pVTUVucE9QYjR5Qmh5MVpyeE0zbTVubmRQYTlCZXhWVlJ3bWV3b2xI?=
 =?utf-8?B?UmJHdzczMFRoc0d2TWdnZmJndUExTVlQTkNDTzUrcUg1blpuVVh4UlN2WndO?=
 =?utf-8?B?ZVFWY3ZhMjNqTHRMckhCMUllR3N1MDQrU1M3b3lZZVc0Wi9zWkQ2S3hHUEVt?=
 =?utf-8?B?RWhZUmZpelhveTJhVi8rVi9IRDZwVk5Qcm9aMFQ5N1AzZE5BOTVvL1ZsSGFD?=
 =?utf-8?B?RWl1WlBaa3FodFRLUm1xdDFBOWVrVlh6Wm9zZUlic1k4OVlaRXdpaTNFWGlh?=
 =?utf-8?B?dlRZaGlBQ1gvSnJReEZQZkd6YnNqRVdyOUV0SDlDbXh5d3Y0ZTh3YTZzcUxs?=
 =?utf-8?B?Q3lyR1NML0xsTmhFcm1UNGZ3RzRlbGYrTTBiL0VXdmNOYzBMTHpxTDRFbUVp?=
 =?utf-8?B?VkZ6WGlSSEZkVFdmaVVTeWtGRnFEY1RJcjlxOXE5cFRxZHFQN21UTUtsWW83?=
 =?utf-8?B?eXJ1c1RDL3djVWZQcFlrc1I0aGFYTEEybUYrWUt5UXhBUFdIOGN6UjQ3RDM3?=
 =?utf-8?B?TWRRbkhLRWFlWkFtNXd1VytLUlBlbUhGWWh3bmJlSThsYWJIZzBLWjZPelQz?=
 =?utf-8?B?dkN4eVhmd2VRSFZQWkVoRjk3ZVloRW5yMURsaGowaTZUcklReWZGNjM2Tjlu?=
 =?utf-8?B?bTNQQmdka3RqSEFBK0tHYmZ5cmN6V28vQVpsRUVmMHRTZldIYWdVWDdKVGpl?=
 =?utf-8?B?UEhkYWprNkRyT0ZTeFk0VVFhVUFsdG1TdVVFQU9qblRYMEhNQWJjYTA4dkF5?=
 =?utf-8?B?dlFDcDNLZFU4MXlzZDlMbmcrSlEvbmJkb0xvb1lMSWI5SzFsNjhyZXMySXBh?=
 =?utf-8?B?eWNKTDl1ZXpiU3liTjZHemRCRmRsaE5qOHVEMUVOZzllQUxiL0ZhNVhRbG9z?=
 =?utf-8?B?dkdNdmt3bWhwamdiKzhzc2pocnVudm00K0hrVUJxeFpQMlhTSEZBb1lwd0Zh?=
 =?utf-8?B?QWhpVmYzd2V3YVh6UXZtcE9qaUcvSmdmYmFvMHFZNzcwSlpwMUExdktBVTFC?=
 =?utf-8?B?ZzRMakxYSzdLTmdHaVhEcXFjVlJyMDlJVWE2dVlqTE9GSEZ5Q0ZPdjJ1bWwz?=
 =?utf-8?B?bjZFSDZYV0YxanlZS1hRSVF4TFRQaEkxem5iaHJIWDVScjB5L0tkb3pCRnJo?=
 =?utf-8?B?TnBRUTBybFNCNzBmZUZLZDdrWi9IbTZzU2xQYWpVSUNYTnZ4a3p2bzhBcnh6?=
 =?utf-8?B?RnpqaHFzY1BxL1A4R05Mb2JCVDZQL0crZkRDOUJhcnllK0p6M2l0RFdhd0ZY?=
 =?utf-8?B?b3NzWE5DZkpxOS9Zcmwzb0U1a0JLRHVnb3FrUWFlQ1Evd2VPT1g1MTB1c0Za?=
 =?utf-8?B?RG9EOTRLdkhrWU5GYjBqcDZ1ZHVsMnUyZzFmSnE0ZG9oclowVDdYdHNMN0FR?=
 =?utf-8?B?YjhkMjFHWnRER2Q2ZzZiS2FVMU1NdEkrdncwandYdFJCWEo0c3NzL085MHJK?=
 =?utf-8?B?WjhNQVN1WGdibFJaeWNkSnVWQzlZN0FybTZnT1pEQmQvRVh3Q3dhL2h2YytG?=
 =?utf-8?B?b29oRlRINGZ5U08xcVZ4YnJuN3dSSFRuVjJ6aG1mRWc5WTJ2N0hVZTN4bThH?=
 =?utf-8?B?U0JkN01YUmZYOWNiMTI5T0sveWpaZEdHV2N6RW1aSHlNeXVtZW1ST2ZZVlZS?=
 =?utf-8?B?c1BrRW84ZHZ2WVZpSEFQTWlJU0RqNDBQNlRMZ1JjUEw0RTdIejBOcjg3YWJT?=
 =?utf-8?Q?wTzDIszUvOTDWfS2D4twMWFJTFmo95BQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVczZG9rNG13aWJySkdmZndlZFVRc3gyZFRLcTM4NkV1L0kzMXZVcXdoOUFE?=
 =?utf-8?B?d25iY25kKzNjNExGaEFscFRoQjExcWRSWTZOQ3BrR3N0ejVBdHltNGxEWDBt?=
 =?utf-8?B?TWNLbldoTXpDVmxiTlR1a0FoVHRCN1FGb09iTWhaNWt5Nko0RkE2YlFhY29q?=
 =?utf-8?B?SENnSk9sZHlpTTEzYm9CRmFDRWJ2VnJDZVl6UUxYV3pZdURMZlNXeFdmYXFT?=
 =?utf-8?B?R016disydnh1Sy9TTjV1TEFMWEJBZldxNzdlS2F3T2dyODZrdktTUk5Pb3Jy?=
 =?utf-8?B?Z0RmU2orRkJoclJpNk9wVlYxcG9HYzRId28rVlZJMHlGN3FUdTJMQm8yTlRD?=
 =?utf-8?B?dXY2ZWsxeGdkb0pwVi9kbm8vQ2Z5QkRydSt3OE41OVhzL0hJT0I0dTJZNUg4?=
 =?utf-8?B?T1lmYjBXdHVDOWM1UTZyZlNoYmFYSVhPekVoUjN2ZE5UT1UvSXdaWUxxbWlQ?=
 =?utf-8?B?Tys4dHIvY3dzeFY0MEl3V0RiZFMyMmZKS0dFOS85VTdTTzJieXdNTllDb0wv?=
 =?utf-8?B?SkVpMUxaWmNWS1NoWEdzQ0RiNDJnYWt3NFBNNHMzN3JYRi9uOE1VVTU3QlJv?=
 =?utf-8?B?RlR4a1J5VkhRTDlSVUNsakJTSHB2Vkp3N1hMYnFiRWNnWkxlYUlnb2xHb2N1?=
 =?utf-8?B?WFFDNnVKOHlDUmlZSjNNZUhFZWJrTjhuMXVqZWV1akZpTVBhRW00VmE5emFz?=
 =?utf-8?B?a2tkVEVETGxBcHFsUDdheGp0eklPa2MrKzZid2todkRibEFtOHVXbWFJWlFz?=
 =?utf-8?B?Tk9lVkNTeVdlUTl6SWVHL010L0hyM0hjY1dvUTJmdkx1dHhxb1JlNE9QVmZ3?=
 =?utf-8?B?QzZwREJXcWJtcnRhSGZPcWI3R1p6L0FLUnpMeEtXUjB2RlRRRlVGa3pzbmVI?=
 =?utf-8?B?Y1hKYTc1dmFCRzhjd3FjWjVjSWg0RldSejFieGxCaTQ4aUgxMm1aclVHWENI?=
 =?utf-8?B?N09qUnRxOURxL2xwdmluMENIMXpKUENsUjNVM1VPa0NLRnpjcVp5YkdBUE5E?=
 =?utf-8?B?OUtjUXQwNEgwSlJmZFVhTWU0bXNrM0RoZ3BaVkd0eHhxcjJTQXc3cTd0eWhO?=
 =?utf-8?B?NEtCUGZWUCtLTmc5YUdmTzJYaXpWWkhlUEwrR28rVDN0SHNyQjQ2QjFocHhq?=
 =?utf-8?B?WFA3ZmFsL1FJeGpjRE50OFlJRHNad3hWQTZsS0JncTcrQWw3aWdmK1MvanBW?=
 =?utf-8?B?c2VTVTFYOUNwUjFjeVVxdWxlSHF5ajMvY3JTU0Rna2pRb2F1YXduQlBTQzRQ?=
 =?utf-8?B?amZzR3BWRmhPdit5YlRhVGZreXFuc1BxV0NEYWxhK3NJMHlsOTZ1eE5ITEth?=
 =?utf-8?B?Y1Q5TkRNR1pkaW5VRGkzczhGdDkvcll0NUFwQm4rZEFaZW5PbDdOdEMyRU5V?=
 =?utf-8?B?TGNGU2Zlem5yc3ZlTURFRlN1RUhqUnl3NTA0L2NSeEdxMWJjRkJDbHljQkh5?=
 =?utf-8?B?QlNjcVBFL0taM3V3ekNYOXJDdGhXVU5hbWh1bEc3bjFOYUxsY1NtdTRIMm54?=
 =?utf-8?B?SHNmb2tkSGNzNHYyejVXMFYyVkhJTVE0UG5mTG1qODgvYjN6VWwrOVBvZ3ZX?=
 =?utf-8?B?VHl6NFY4S1JieGxIVXlQNzhLMElMcnFBVXRIWVhLQmxRYVYwQlZyZUo1RWhQ?=
 =?utf-8?B?WGN4czg2L1VPekRCMkxPV0FtWDNjYWNUd2VZV21xSE5QRCt5MDJXaUswTHd1?=
 =?utf-8?B?ZWg2amI1aHQwbXduMTRoWXRuNjdmQ1ltZGdBQXpZN3dTcjJaNmZwVWdVVWxM?=
 =?utf-8?B?NHNMZ29UK205S3F1c29iSE9BKzlwS1pWYzBuZzQ2U0hhaXFhVjRZdnd4a3Rz?=
 =?utf-8?B?WDBwMUpiSVlLVTBCbkRnTzFuZDJmcEZtdzZQVHNwaUFQc0JjaW9tb0Z0VXJT?=
 =?utf-8?B?ckJkQU9VOHJtRTgwQU9QUHU3ekYwNWpaUk45dHZZUVBGN2V6TmhhTUV3YzBl?=
 =?utf-8?B?WWpRaGxKczlYdnRWUnV1Q0lydGFiMDdxb2VtTU03RHJ5blVXYXg2TzFFdDdr?=
 =?utf-8?B?ZHQyR2FFbDV5aWM4NGpCd0ZXeCtsOUpTYTJpUzhCYU02Qnd4a051Rmk0MGt0?=
 =?utf-8?B?RThiZC9PbjFKejFLZXJrNE56N2ppcjlqOERBTFc4dGtXVWUra1I1TlZjOFJt?=
 =?utf-8?B?Mk96c3RZbDRNQ1lvc2g5OGorNG5iVmwyY25MRzVaN0VRekhOLzAzMU9wLzNq?=
 =?utf-8?B?MFp2MDdFdU1qODMwdnhHTjZWTW1IME1Kb3g5eGo5OGVKYWFXem1KRFFieURO?=
 =?utf-8?B?LzluOUEyVFk0d0xJeW1sNmdnc3VhanlCR3NqamdzVTJyb1I5Zmx2R3FmZkVW?=
 =?utf-8?B?UjlXZFB2R3FBeWgrWmR6OVRBTFdYQXdzcWJOdnJPNGtsZG52bVJidz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639fe93d-2398-43df-991a-08de4ff0024c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 02:28:58.6126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/hID5nld8bUbiE40jRCAIIZsakli1AgRxWLOPa8pU6pjSFy/WO9PymK/a313w1pn+3ndfDvLv1qXeEONlXR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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


Hi Felix,

You're right - I understand now that the render node transition is already
Appreciate the clarification.

Regards,
Honglei


On 2026/1/10 05:14, Kuehling, Felix wrote:
> FWIW, ROCr already uses rendernode APIs for our implementation of the 
> CUDA VM API (DMABuf imports into rendernode contexts that share the VA 
> space with KFD and VA mappings with more flexibility than what we have 
> in the KFD API). So the transition to render node APIs has already 
> started, especially in the memory management area. It's not some far-off 
> future thing.
> 
> Regards,
>    Felix
> 
> On 2026-01-09 04:07, Christian König wrote:
>> Hi Honglei,
>>
>> I have to agree with Felix. Adding such complexity to the KFD API is a 
>> clear no-go from my side.
>>
>> Just skimming over the patch it's obvious that this isn't correctly 
>> implemented. You simply can't the MMU notifier ranges likes this.
>>
>> Regards,
>> Christian.
>>
>> On 1/9/26 08:55, Honglei Huang wrote:
>>> Hi Felix,
>>>
>>> Thank you for the feedback. I understand your concern about API 
>>> maintenance.
>>>
>>>  From what I can see, KFD is still the core driver for all GPU 
>>> compute workloads. The entire compute ecosystem is built on KFD's 
>>> infrastructure and continues to rely on it. While the unification 
>>> work is ongoing, any transition to DRM render node APIs would 
>>> naturally take considerable time, and KFD is expected to remain the 
>>> primary interface for compute for the foreseeable future. This batch 
>>> allocation issue is affecting performance in some specific computing 
>>> scenarios.
>>>
>>> You're absolutely right about the API proliferation concern. Based on 
>>> your feedback, I'd like to revise the approach for v3 to minimize 
>>> impact by reusing the existing ioctl instead of adding a new API:
>>>
>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>> - When flag is set, mmap_offset field points to range array
>>> - No new ioctl command, no new structure
>>>
>>> This changes the API surface from adding a new ioctl to adding just 
>>> one flag.
>>>
>>> Actually the implementation modifies DRM's GPU memory management
>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs 
>>> similar functionality later, these functions could be directly reused.
>>>
>>> Would you be willing to review v3 with this approach?
>>>
>>> Regards,
>>> Honglei Huang
>>>
>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>> I don't have time to review this in detail right now. I am concerned 
>>>> about adding new KFD API, when the trend is moving towards DRM 
>>>> render node APIs. This creates additional burden for ongoing support 
>>>> of these APIs in addition to the inevitable DRM render node 
>>>> duplicates we'll have in the future. Would it be possible to 
>>>> implement this batch userptr allocation in a render node API from 
>>>> the start?
>>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>
>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> This is v2 of the patch series to support allocating multiple non- 
>>>>> contiguous
>>>>> CPU virtual address ranges that map to a single contiguous GPU 
>>>>> virtual address.
>>>>>
>>>>> **Key improvements over v1:**
>>>>> - NO memory pinning: uses HMM for page tracking, pages can be 
>>>>> swapped/ migrated
>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD 
>>>>> unification
>>>>> - Better approach: userptr's VA remapping design is ideal for 
>>>>> scattered VA registration
>>>>>
>>>>> Based on community feedback, v2 takes a completely different 
>>>>> implementation
>>>>> approach by leveraging the existing userptr infrastructure rather than
>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>
>>>>> Changes from v1
>>>>> ===============
>>>>>
>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range 
>>>>> registration
>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA 
>>>>> handling
>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>
>>>>> This approach had significant drawbacks:
>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand 
>>>>> paging
>>>>> 2. Added complexity to the SVM subsystem
>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>> 4. Could cause memory pressure due to locked pages
>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>
>>>>> v2 Implementation Approach
>>>>> ==========================
>>>>>
>>>>> 1. **No memory pinning required**
>>>>>      - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>      - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>>      - Supports dynamic page eviction and on-demand restore like 
>>>>> standard userptr
>>>>>
>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>      - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>      - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>      - Zero changes to SVM code, limited scope of changes
>>>>>
>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>      - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>      - Multiple non-contiguous CPU VA ranges -> single contiguous 
>>>>> GPU VA
>>>>>      - Unlike KFD SVM which maintains VA identity, userptr allows 
>>>>> remapping,
>>>>>        This VA remapping capability makes userptr ideal for 
>>>>> scattered allocations
>>>>>
>>>>> **Implementation Details:**
>>>>>      - Each CPU VA range gets its own mmu_interval_notifier for 
>>>>> invalidation
>>>>>      - All ranges validated together and mapped to contiguous GPU VA
>>>>>      - Single kgd_mem object with array of user_range_info structures
>>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>>
>>>>> Patch Series Overview
>>>>> =====================
>>>>>
>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data 
>>>>> structures
>>>>>       - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>       - UAPI for userspace to request batch userptr allocation
>>>>>
>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>       - Add user_range_info and associated fields to kgd_mem
>>>>>       - Data structures for tracking multiple ranges per allocation
>>>>>
>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>       - Core functions: init_user_pages_batch(), 
>>>>> get_user_pages_batch()
>>>>>       - Per-range eviction/restore handlers with unified management
>>>>>       - Integration with existing userptr eviction/validation flows
>>>>>
>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>       - Ioctl handler with input validation
>>>>>       - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>       - Integration with kfd_process and process_device infrastructure
>>>>>
>>>>> Performance Comparison
>>>>> ======================
>>>>>
>>>>> Before implementing this patch, we attempted a userspace solution 
>>>>> that makes
>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>>> register non-contiguous VA ranges individually. This approach 
>>>>> resulted in
>>>>> severe performance degradation:
>>>>>
>>>>> **Userspace Multiple ioctl Approach:**
>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>> - Performance loss: 60% degradation
>>>>>
>>>>> **This Kernel Batch ioctl Approach:**
>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>> - Achieves near-native performance in virtualized environments
>>>>>
>>>>> The batch registration in kernel avoids the repeated syscall 
>>>>> overhead and
>>>>> enables efficient unified management of scattered VA ranges, 
>>>>> recovering most
>>>>> of the performance lost to virtualization.
>>>>>
>>>>> Testing Results
>>>>> ===============
>>>>>
>>>>> The series has been tested with:
>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>> - OpenCL CTS in KVM guest environment
>>>>> - HIP catch tests in KVM guest environment
>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>
>>>>> Corresponding userspace patche
>>>>> ================================
>>>>> Userspace ROCm changes for new ioctl:
>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ 
>>>>> ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>
>>>>> Thank you for your review and waiting for the feedback.
>>>>>
>>>>> Best regards,
>>>>> Honglei Huang
>>>>>
>>>>> Honglei Huang (4):
>>>>>     drm/amdkfd: Add batch userptr allocation UAPI
>>>>>     drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>     drm/amdkfd: Implement batch userptr allocation and management
>>>>>     drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 ++++++++++++ 
>>>>> +++++-
>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>    include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>    4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>

