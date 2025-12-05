Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41531CA6DDA
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D210EA8A;
	Fri,  5 Dec 2025 09:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KVW2Mj29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1E310EA8A;
 Fri,  5 Dec 2025 09:19:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPwDUIurPZp2a9urZsFbTXRp4MMs0WB0Yui55OLL3K/xPgIXdhKSO28+U5Sfst4vA6iP/tjwg5qC6PIi9Nqzt1F0aS4fKuF/suNlV+bUhCVBfyiOcEsob8DmOVmCcjUSnsz6Ps4BAtxzbLT5wGkm5nP5bgMNgyt6PvUZkoXzDE2Vry58rwLhii/UUWy/kVKm+zSp4KYR5z684zcX8Mw2YFNwf8TdfQ38eeRpXi5JH22Iz8w2VZsXUKM9+UJhP64O9XvNeLp4Dpgumq8nUuSGvEQpMXezJb+C7I9OhpCNhykzq2glzTPbigzc+CMDb6aLkpYF/Z227CBAcwaHtphtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MALJdcflfjfgSOVfDTU3yodps4HNWflxKAIYn0OeEM=;
 b=dNsoiiXjGphK2T4mjtcf/S1RVHmtQd5MPN3udk+fVl3FI13+KpL1pZ9wYtcXyRBO4oF9SjqJwqH0S7rRfS70IXO5ZAhKkFQm0s585MJTvUH+tPKs7TyEgELoWUbEI/U4yZAMggoZsb7/QNtTxqeKXl/iCQbVWhRhZifys9ZYyAsGaoAnwN6/wO2DnDvk9iV1wKr0BCm9IU+ZquxvKNqg98qLHPjfiJNv7M29Ebm8BqnWkHonITrWxtyfnIqrqM3tmmOEcsI9UbIDqXEOjDr9QGKrna0T3bUgAj7ehOk0FIR44k2LJ0TzqEE9mUFQ1owqCXUkzzpT0n3hITxo/noeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MALJdcflfjfgSOVfDTU3yodps4HNWflxKAIYn0OeEM=;
 b=KVW2Mj29YAKugwOPSeJilAifViwdIcw1OsYIlAV1MDyVI/QZgK4QwerUXRcRzwIzTXiWVx+i738jJKggfdfvHn4vhO66oxM/Byt5sBUee8FsytSPdoE1/4xgmvs15eJE1LnsXEidtVWYYzGNXIPH5bKeVEgQA2A2lfpJMocPup8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 09:19:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 09:19:37 +0000
Message-ID: <3f71a73a-8360-409c-8a51-55c37230d4cf@amd.com>
Date: Fri, 5 Dec 2025 10:19:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
To: Alex Deucher <alexdeucher@gmail.com>, Philipp Stanner <pstanner@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
 <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
 <CADnq5_Pv20j+oSSFvfauUKvH8LUiVMCz2jgQyrDMw3CKACLNgQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_Pv20j+oSSFvfauUKvH8LUiVMCz2jgQyrDMw3CKACLNgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b07bc85-9027-4d8c-6fe7-08de33df697b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG0rREI0ZHJwVTlBRlFocnI1NjhwZjNQQTZPWWhVVHUwS2E4UVAyUVlWOFhy?=
 =?utf-8?B?YU41Y0hQdGJrN1RVTDFydHJnd25oVjJRVGE3M2krNytxY09hNm5CWTRCTjEw?=
 =?utf-8?B?SjNVYWw5S0p1QUc1eGVKMlJYU1lyY1MvWFRKMzlIa1YyYWZKdXNCQ0tCb1hi?=
 =?utf-8?B?cU83SHpqYkMwRjdGRHdId3NobUlualpLcjVUTjVsdjlVQTBTOStsMVpPV0d1?=
 =?utf-8?B?a3h6TUo4cFVuRVh1UE1aeENZRkQyaS8vbzFzWDg3amN3aW1lTUJQNStnN3hu?=
 =?utf-8?B?bkQ5eHFaRVgrckFseHFER1FsSUhBSmszUXdpcjlaU0NkZGJOMHFZNHlXLy9W?=
 =?utf-8?B?K2ZQeVdONFYvUnMxRDlCSE1laWhQUzRwRUx1bmRGUVh4TXlhMmpJZWNheHYy?=
 =?utf-8?B?ajdtS1ZYQTdKeEt3eDdhOUtPN2VZYkdwa2N5NzVINmNVYzBuUEZqMUxReU80?=
 =?utf-8?B?S3B3Mmd6NG52RnJRQ05oYy9YM3ZVQmxTeFJ2cTdQejczK1RDdHViOGF1cVNo?=
 =?utf-8?B?OGZ2bnZtTWFUUVVKSlludStqT1lWNjdtSzNPend4UEI5VGlHbUtNNmx0eFhM?=
 =?utf-8?B?MWxpZEhhZ251TW9xSm9HQk5PMm5ERHpvSVhzRlVtZTFoQm1XNDZwbHdlVlY4?=
 =?utf-8?B?YktaeTgzZjkrZ2d2eEJvV1BnM21aeGQ1OVZHeHd4RldtckFUdUJveEExVEhz?=
 =?utf-8?B?b3RJaExjbTA0MnVSK0dzZ2M5d0NSNzZxTHhjVitjUWdIUVlKejFRSEY1UStT?=
 =?utf-8?B?Z0NKaTdZRVNsdnBPZk15d1JiR1RoVXBJVEl1MDZoamI2eWhuTDVEcTdUc21F?=
 =?utf-8?B?dkdha0dRdnI5SEFZTUVSOFVnSDZiU2NWclVhTjNJQ3pkMjhYaUR3aUxUdldN?=
 =?utf-8?B?eE9Ham1EVmYwY3dvSEtLWnlmY1FwMnNiTE5IRnB6UkNYM2FxMXVIRndpbHpj?=
 =?utf-8?B?VjViT3RwaGVDaDhjWVpOMFltY3ZSYjFvdHNwM2dOVDh3Y3lwNHI3MTVscjh4?=
 =?utf-8?B?b0RyaHNiZGJlWUt6cU0zbmhXSHgzNlBONUE0RmhUV2NJUVBUWVZISGp4RFVF?=
 =?utf-8?B?bysrR1pBMUlVNUFoZXdLRDBwUTRXcm9uUkU2c0JLdW9xOXVsbjcycjUxUzdF?=
 =?utf-8?B?SDVSbnlKU3Nta3hQYU8xQnIrOGJ1UytTbGZGOERJZUdYa29STW1kUC9jQS9O?=
 =?utf-8?B?VXlqazF6ZVpSYVZaUXhxUXFHODdUdzkxd25pOUMxSUpZcWJWckhlclFJOTFG?=
 =?utf-8?B?TDJxMDBBTkc5UjZmS1JVcVpmdHh1bjhZRUpmV2ZWRWZOOUdoTi9pcTAvcmVI?=
 =?utf-8?B?eWYzMXRhT0ZCUVU5VTJQWTI5VENhSWh1NXgyNlBDV2p1ajRwVjhubkxpODND?=
 =?utf-8?B?MGphNEM0d2F5emNOdWxRK2ZyQUJxZXRVenloRUorREVHQ0NzSlFOVm1nOTA3?=
 =?utf-8?B?S3NhTnNhYjJ1NDYrbHk3RlpIVXFsdk1wWDMrays3eTVva3FZcXBvdS9hclhi?=
 =?utf-8?B?Z0dCVktVb2RDQ2pXdFJNcC9Ed3RxUnZXam9tRS9CZmN3cFFob0VicUdBNWJn?=
 =?utf-8?B?aHVqT2k3Z0tpM2MwOExjVkJWdE1EU3pINC9ma01QdEFrUVJSVklaZ2p0UFdq?=
 =?utf-8?B?Q0VFZVJ6R0llbmtmamJQcDdUMXE2N0NuTXBwSU02aXRoek9WSXNSVmxEU1Nw?=
 =?utf-8?B?cW9mZ2RFZElZRmlqbjFpMC8zMUltNU5kN2R5RjA0eTAwUk9yM0c1UE9vaWM4?=
 =?utf-8?B?RE55eEtHaU5nMnI2MkdydTJWZVI2cTEzMEhhVmxscUxlT3ZJNnFDMzRteFFJ?=
 =?utf-8?B?ZUkvbnM0cVRIQi9WMzNrL1ZvRHRlK1cybU9KYzZpRXEvOE5tS0FMNzM4VVpC?=
 =?utf-8?B?cUQyWmtMaDJGeDJYbkRGL1NmeXZUR2FjbzVybWRTRDlKeTNYSE1VVmhHSGhn?=
 =?utf-8?Q?a1y7VLJ5RhFGWqQ+IM5NPaGY1SZECRIN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3Y5bVF2N1NsVWZhKzFLR1BSdnMrSmUwVUFEdUFrN3R3aUZhQ3p6SEVXMFJx?=
 =?utf-8?B?WTRDYXdFTGVwWTNPMkVLV0xFeGo3SzZuZWRoWEpWWlh1QXFSSFB3RzhPRThx?=
 =?utf-8?B?cVUydWZmQkZ2TU9ZcnUzdlJ6THdlM0lrclRnTzQ0WXVsb1hrVUttU0x2amVW?=
 =?utf-8?B?MUwvZVpxdVhtVUd4d2NkTmZSc0VRakpxaFFzNi93SFc1bTNIMG5IQ1YzUVB3?=
 =?utf-8?B?dzUzdjN2UDZ3Mks3cXp2OFNheXlyZmVkYzFub3h2bzMxMjZtQytNK2JNM09P?=
 =?utf-8?B?djdjWWlDbHFlS2hnVUxCM1E5WXBEM3FWVC93Yk5oUldRWEFET3BsbkIzVm54?=
 =?utf-8?B?V2cwNHd4MnRuVXVxZFk4WEt6d1ozdGN1NUFuNm94ZWtENVVBZ1JwbE1Td0tY?=
 =?utf-8?B?Q3cyeTd6TEQyWVdzRjQ3Q0NYdEx5MkhQQlZDWGFxdXg1VjQrL1RZSnllcDdQ?=
 =?utf-8?B?N2IraEJQemplSlpqSTZ3UjhKL3RNQnh4R0tiUTFya2g2czEwekZDUGlMNkZT?=
 =?utf-8?B?VmlkaFRwcENndXIxbnpWV2pyRFlNUGVxYkUrb2pROXBUTTVjTmdSVWNKVGVr?=
 =?utf-8?B?VEtWM1U0bCtGVDFPQ0JYMmU1a1hwaWhaZHczMFV4ZU1ZTW5aMlY3em9Vb1pK?=
 =?utf-8?B?ckxJakorTzFkTWFnM1VwRGZLQ0VpRTRjZmdvUCtLK0NZb2RMeHRSNGhYWnJJ?=
 =?utf-8?B?ZXBKR1BMOUpjaVBUK3B0aVRxWHBoN3FRM05xSnY2MGo1Ymgwa0pWSnJraTVN?=
 =?utf-8?B?RDlaNUxtUU01endHQ0V5cHhpckNNNldEcG9BZXRZTSthZ0ZFN0RwSWVkdnNt?=
 =?utf-8?B?amxkeGlRd1pNbkFXdjdlQ1Z3Q3drOVdjZjdwMVIvUmk0YzVQSUM0RkRncVg4?=
 =?utf-8?B?UC9XaWFOV2YwRDQ3QjdFNFpJaXpqOVNjZEw0ZVJnc285VlpCZE1TL0lmd2Fh?=
 =?utf-8?B?ZUlhUWJDZzNSSDJvNzVsME40V2diK1M4TThlUUU0VmJRbklUd0ovbklqRzRG?=
 =?utf-8?B?QTFDS1VIOGozTHpPMUY4SklEcmFPM2xOTHBZSUcwQlFwUU0wUEs1cjZKZXUx?=
 =?utf-8?B?MlY3d1h0eGJHRGtpNmwvM2JvWjZQOEEzKyt2NTR6cGsrSFp1RW0yUldlbU1s?=
 =?utf-8?B?bU8zTmVSNUE0bGtXT3E4dW94STB4aWFlRUQydnhUOFBGRnN3cU5zdUdONTZq?=
 =?utf-8?B?M0VqQWc0bTJkcElNSHJKUjV4ZzlKc1o2WmJURDh2ak9ud2pja0hKaklVQWc3?=
 =?utf-8?B?STAzV1JZdHBTWnplZmlDYkV2RTlVMUxVZHExdXNaWDRjVUEwM2p0a3ZrUEZD?=
 =?utf-8?B?SXBqR0xVZkoyUnNieWpicGovcmpWOWp1bmNDQlBjQ1JkS2NmcWEyMUZnMDEx?=
 =?utf-8?B?NFdLZ3ZmZ0JuUnJmTUxpK3pNWEN1cjcra0lSYTkvektKdlBjTVFKWTZaRTBS?=
 =?utf-8?B?OUo1RlZEYXIrRGxVNnkwRS9qOHlOdlN6Qml5Y3A2clE1OE1yakhvelVMSEUw?=
 =?utf-8?B?R083M2JNN1pXRXRJVHVlMGp2M1ZEWW1zS3V3NFRteW54UlJTcVZUL1BaMlNl?=
 =?utf-8?B?eG9TdjZ6bnYvRFJIK0Z2dUdza3FtM1AxdVg2aXgzdmxLNFhmV2gzaE5kZ1Yw?=
 =?utf-8?B?ZXI1TXo5LzJGL1V0Rk1NSHozMVV1NkRJWk9KTVFyVWhBRVFZRThRTE1ONFha?=
 =?utf-8?B?bFkxRnNSVk5yeXhFRXdlbWlhTTk4ZjFBQ053UDl4ZTlXUndqR04rUFR4clFX?=
 =?utf-8?B?a2d6TEtkc3Z2MzdsWE5TM24rdGpCVHpzOW1idGFFUCtwcmpUeXdNWUlLQmhB?=
 =?utf-8?B?TDYrc01VaE5pQ3dhZ2pkQ21vbWR6T1BkZmFuUVlzeFM1Nlc1eDdDRUEyMVJl?=
 =?utf-8?B?QjVDL294RUJoZm1PQTVaT0FmeW1FSkRTZGMxcXRsK3FQYVpPa2xNTzdaUXVl?=
 =?utf-8?B?aGtpd2t3MzR4V1ZpVU9QdnRYb2d3a2NPY0NPYjV5MHYvT2Mxam9tUDlUSUo3?=
 =?utf-8?B?S29xNWtPcVgvNWFtamQwalIxUG5VL0NNODJHZFkyTCs3aGdWZ0JydjBqSGlo?=
 =?utf-8?B?QWoyKzVJeWNWN2tpZE5NOEVUTkUySFh1M3pKZ1dtd1JyTVZZRjUxQXAzMHoy?=
 =?utf-8?Q?EThnQzMWrInXjX12hFZcJ1/lv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b07bc85-9027-4d8c-6fe7-08de33df697b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:19:37.5477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORKDcxyaf6NkYiX61h8NUEoolTRzyqxRt29I9Iq95fa/e4OYIm5Os3eefyZhz4qH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051
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

On 12/4/25 17:04, Alex Deucher wrote:
> On Wed, Dec 3, 2025 at 4:24 AM Philipp Stanner <pstanner@redhat.com> wrote:
>>
>> +Cc Alex, Christian, Danilo
>>
>>
>> On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
>>> Stop open coding pending job list in drivers. Add pending job list
>>> iterator which safely walks DRM scheduler list asserting DRM scheduler
>>> is stopped.
>>>
>>> v2:
>>>  - Fix checkpatch (CI)
>>> v3:
>>>  - Drop locked version (Christian)
>>> v4:
>>>  - Reorder patch (Niranjana)
>>
>> Same with the changelog.
>>
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>> ---
>>>  include/drm/gpu_scheduler.h | 50 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 50 insertions(+)
>>>
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 385bf34e76fe..9d228513d06c 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
>>>               dma_fence_is_signaled(&s_fence->finished);
>>>  }
>>>
>>> +/**
>>> + * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
>>> + * @sched: DRM scheduler associated with pending job iterator
>>> + */
>>> +struct drm_sched_pending_job_iter {
>>> +     struct drm_gpu_scheduler *sched;
>>> +};
>>> +
>>> +/* Drivers should never call this directly */
>>> +static inline struct drm_sched_pending_job_iter
>>> +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
>>> +{
>>> +     struct drm_sched_pending_job_iter iter = {
>>> +             .sched = sched,
>>> +     };
>>> +
>>> +     WARN_ON(!drm_sched_is_stopped(sched));
>>> +     return iter;
>>> +}
>>> +
>>> +/* Drivers should never call this directly */
>>> +static inline void
>>> +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
>>> +{
>>> +     WARN_ON(!drm_sched_is_stopped(iter.sched));
>>> +}
>>> +
>>> +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
>>> +          __drm_sched_pending_job_iter_end(_T),
>>> +          __drm_sched_pending_job_iter_begin(__sched),
>>> +          struct drm_gpu_scheduler *__sched);
>>> +static inline void *
>>> +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
>>> +{ return _T; }
>>> +#define class_drm_sched_pending_job_iter_is_conditional false
>>> +
>>> +/**
>>> + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
>>> + * @__job: Current pending job being iterated over
>>> + * @__sched: DRM scheduler to iterate over pending jobs
>>> + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
>>> + *
>>> + * Iterator for each pending job in scheduler, filtering on an entity, and
>>> + * enforcing scheduler is fully stopped
>>> + */
>>> +#define drm_sched_for_each_pending_job(__job, __sched, __entity)             \
>>> +     scoped_guard(drm_sched_pending_job_iter, (__sched))                     \
>>> +             list_for_each_entry((__job), &(__sched)->pending_list, list)    \
>>> +                     for_each_if(!(__entity) || (__job)->entity == (__entity))
>>> +
>>>  #endif
>>
>>
>> See my comments in the first patch. The docu doesn't mention at all why
>> this new functionality exists and when and why users would be expected
>> to use it.
>>
>> As far as I remember from XDC, both AMD and Intel overwrite a timed out
>> jobs buffer data in the rings on GPU reset. To do so, the driver needs
>> the timedout job (passed through timedout_job() callback) and then
>> needs all the pending non-broken jobs.
>>
>> AFAICS your patch provides a generic iterator over the entire
>> pending_list. How is a driver then supposed to determine which are the
>> non-broken jobs (just asking, but that needs to be documented)?
>>
>> Could it make sense to use a different iterator which only returns jobs
>> of not belonging to the same context as the timedout-one?
>>
>> Those are important questions that need to be addressed before merging
>> that.
>>
>> And if this works canonically (i.e., for basically everyone), it needs
>> to be documented in drm_sched_resubmit_jobs() that this iterator is now
>> the canonical way of handling timeouts.
>>
>> Moreover, btw, just yesterday I added an entry to the DRM todo list
>> which addresses drm_sched_resubmit_jobs(). If we merge this, that entry
>> would have to be removed, too.
>>
>>
>> @AMD: Would the code Matthew provides work for you? Please give your
>> input. This is very important common infrastructure.
> 
> I don't think drm_sched_resubmit_jobs() can work for us without major
> rework.  For our kernel queues, we have a single queue on which jobs
> for different clients are scheduled.  When we reset the queue, we lose
> all jobs on the queue and have to re-emit the non-guilty ones.  We do
> this at the ring level, i.e., we save the packets directly from the
> ring and then re-emit the packets for the non-guilty contexts to the
> freshly reset ring.  This avoids running run_job() again which would
> issue new fences and race with memory management, etc.
> 
> I think the following would be workable:
> 1. driver job_timedout() callback flags the job as bad. resets the bad
> queue, and calls drm_sched_resubmit_jobs()
> 2. drm_sched_resubmit_jobs() walks the pending list and calls
> run_job() for every job

Calling run_job() multiple times was one of the worst ideas I have ever seen.

The problem here is that you need a transactional approach to the internal driver state which is modified by ->run_job().

So for example if you have:
->run_job(A)
->run_job(B)
->run_job(C)

And after a reset you find that you need to re-submit only job B and A & C are filtered then that means that your driver state needs to get back before running job A.

> 2. driver run_job() callback looks to see if we already ran this job
> and uses the original fence rather than allocating a new one

Nope, the problem is *all* drivers *must* use the original fence. Otherwise you always run into trouble.

We should not promote a driver interface which makes it extremely easy to shoot down the whole system.

> 3. driver run_job() callback checks to see if the job is guilty or
> from the same context and if so, sets an error on the fences and
> submits only the fence packet to the queue so that any follow up jobs
> will properly synchronize if they need to wait on the fence from the
> bad job.
> 4. driver run_job() callback will submit the full packet stream for
> non-guilty contexts
> 
> I guess we could use the iterator and implement that logic in the
> driver directly rather than using drm_sched_resubmit_jobs().

Yeah, exactly that's the way to go.

Christian.

> 
> Alex

