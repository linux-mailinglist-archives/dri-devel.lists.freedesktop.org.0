Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C725BC43BC
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 12:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C1410E7AB;
	Wed,  8 Oct 2025 10:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UaS3gHHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5210E0EA;
 Wed,  8 Oct 2025 10:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkEhhNpS2A743k3vO8c7GSIiTE+ont/PMFTHIQX5lFesGexbo1cMaObPdX10sohhO3AJNWt122xqPYETRv4v9EWuqAI7/X7a77fOxpX8i/sI4HHwboP5hRI+mz27wF9EVojOl03YlHqaFsemaAxfvSctDfzX6vge7ByUv5y0/e8j2cJBsz0OCqeSDfM+e6VleL+cNu8CFOozF0FiYaQsWngP8/SSYGE0IE2wcJl54Xuk6bbpRFJY+lvFZlwPOmfgLaBXV/lsKZ7g13KKFIaqVi22SIHxKkAN0TDyFLVk98IQC0pOxj3w026hrQa3pMRPDE9/sjO1aVHMer1GvBFYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=povV+DZNGvize0y//siyFPqxx3DUXNyO+0efMAAPpsM=;
 b=PYM7HcVaE0yU6Kl8mr3/9xkM53QOi7TuzjvGvfD29F1CrctnkcEc1eXOk1yfPOH3z3hQdy3yQ/FS0Gryi3gxxGD9MqP6wNKsSzUZYtLh7cOJS6hYC4el3VvK1DxPLSGjt9l+BZtr9btGvtFTtosLIY408h9Zy0KiTtvSZbDClW2tIxvikKV2XlSn3xfZS8wf29NUNG/uL3B26NF6senVvNbhU99+U22sV/dyoTzHY8hNa9NfJ9cio7EV/XGzZm5QmU8fi3VQMkWQb685IgMGNwlVZYiLj4KVGAlQPr/3rp0vpuXoDHYy/MzhS0MG3n6NOR9d2ZMxeAakqrFMjFPNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=povV+DZNGvize0y//siyFPqxx3DUXNyO+0efMAAPpsM=;
 b=UaS3gHHiseTT4c6Xyej4XVB4d+ZUE+121JmJ1ezL7Fvq6wOQtTWzGKxJ8mq0oYSlAJ3Zolq1svvU68xgxFFKgaAXdpgBT83reB/FpMstGWuW1TzkyYIs93IuSdDofQDD5C2VpDJH0ihz3+OBn3dlZucJQI7rzcnzDpjwIYxmBOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 10:01:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 10:01:57 +0000
Message-ID: <62b76033-28ca-49b4-a81d-9d3ea2539acb@amd.com>
Date: Wed, 8 Oct 2025 12:01:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/5] drm/ttm: Add getter for some pool properties
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-2-tvrtko.ursulin@igalia.com>
 <b9a866ea-0f67-4e34-bb30-f8e297ee26f2@amd.com>
 <c3cb4df5-d6db-4cff-ba4c-c51f6503181c@igalia.com>
 <07ed348b-e8a7-4831-88d2-b53fcd07d5c5@amd.com>
 <a09343b9-2b37-4805-b1e0-54e97af8cd53@igalia.com>
 <c7560981-22c1-4d90-99c9-5dc757a0a89f@amd.com>
 <a095f53e-4f6a-4cce-9e80-c780816826c2@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a095f53e-4f6a-4cce-9e80-c780816826c2@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0441.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: c56ba42d-c7bd-4dd0-f8f7-08de0651b778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmlQeGRVb3Z1VGczbUpTbzF6ZWpzR201dkdscUw0ZEhGLzFHZjMwQVRWa2ZR?=
 =?utf-8?B?VWtxTG9JV3Z1Y01qVHdFdUZzK2lSYmZOMTRtT1NWZUdQMHNBQlhvQllQdktD?=
 =?utf-8?B?WFlYZ2JpZWRxaVEzVXRFTERPMkhJMzZLb2JlOVVZQUZiSmhKMmg4aWc3cGcr?=
 =?utf-8?B?ei9Iam1kWndyTEtmMGlIcVJSNDZSbW1FR3BEWjZKZGRxcXVuRmdaYWhycTNn?=
 =?utf-8?B?NGE5TFpDaXhUam16ak03RW0rSGNFTzdDWU5hem9jYWFueUpvVmFEWGFOMjdn?=
 =?utf-8?B?Wk90ajVIUDR0eWpzT2dGUWJDNXJoeFJaRVZFaFpzM3pSa3Z5NjVoQVVpejhG?=
 =?utf-8?B?RDFUQWFKK25ROU84M3kyRkM5Q05PYVVaTWVOQzVLUlhpb3doNy9XWWlmSEIy?=
 =?utf-8?B?WFVkOENYRTYwYm0yaXgzSnRFYjJoVHowbURsZHE1SWFwKzNyL244bXlhMGxm?=
 =?utf-8?B?SkE4NkJDbW1FUlJWQ1A3V2puekRVWTJ0OUExek96R294YnN4UnhmMkJuYlFm?=
 =?utf-8?B?a2lkNUd4azhBbUFiV2htZXlxRlFWRExQUEZQNGpjQndSdGNSQ09LNG1WZzhs?=
 =?utf-8?B?ZmNrM0NKR0hXa0plZkQ0RVpOb1R2SnExeVB0S2NaQ3ZqaWk5R2JTTzhndDJy?=
 =?utf-8?B?RXJybUl1RGJ1TEZkb0JmYjY5WC9NVm5ENjBPOUU3NDRhMUxxNlc3Q0pQZ3dI?=
 =?utf-8?B?aDB0cUNOSC81TXJqRHJQbWlsYy8xTllQSHVrU2c2VUV6YnBGZStqUVlLTGQ4?=
 =?utf-8?B?elk5Y1hHSk9XS21lK1lYKzBwbnBvM1ZrM2lXLzRZNnpJTEkyN0t5U29RNXo2?=
 =?utf-8?B?RTF3ZFVKbktjS1dEWXpObnZGbCtnV256bEk2L0FFem9oTm9INE90ZW9SdC9i?=
 =?utf-8?B?NXhTWlFaTER0cUxtcnVYL2JQakt2Qml4Nkcva09hMEZUOTkrQWFqVVNOWEFM?=
 =?utf-8?B?SWQ5akcvakcwRGhCd2x0N1dQY1lBNTBnNlltNUZUSjJIRW5XVnY1d2hRTGoz?=
 =?utf-8?B?cUc1RDVsTGpTVmk3ZHYvRXF5MWJSamRiUnE4a3pSSUd6dnZLcE9zWTZuL3E5?=
 =?utf-8?B?MEdLVVh1cjZzc0lyeFlGKzEzemoyM1JmR2U4MXBVUGs4NlI5TFNMUGhrNXZK?=
 =?utf-8?B?TXpkQ1hjQ0VwL2ZDVmRKUGVoZjVEREZRbFdMdkYvNzBHdndtRTlQcFFCVDk0?=
 =?utf-8?B?UlIrMzYxdkZVeUJsb0ZZbU1YQVZaWHM0S2w3UVY3a0hrZk1ONWkxYkZUZVhP?=
 =?utf-8?B?QkY4MGt5MlpHNzF1U0JOT0dlYUxkVVdVZmlCMFpDckhRNUF1d2R1NXB3T21B?=
 =?utf-8?B?djhCbTFZdmZKQmhXcXlUTTVhWjA0QlJhNmdYdjRuS3FXclNocWxTYUp5cGwv?=
 =?utf-8?B?bE1aYWJMK3RWMlhBRTRKU0k1VUFma0x2QWI2dWpKVlMzSnlPUTEveG90TFNm?=
 =?utf-8?B?Rk5GQStEaC91ZUQzdkF0MFVFZm5GRzg4L25lcmVxL2hDYUpqVWN1MXpRQVpH?=
 =?utf-8?B?WDhMWVhxM2FiWHluSDlOTmVSMFFDUUlSTDVaWjJpNGFCT0hCcFdLajQwNXcr?=
 =?utf-8?B?LzhibDFRYTNUS0RpUGlRZlFjZzB2YytWTUtlY1lnSllMdG9CYng4alljMVI1?=
 =?utf-8?B?TGdDSkpyMW10RllZMCtlOVRNd0VuOWlWRHpDMUdoTEl6VDNpakhuM2pJWnhx?=
 =?utf-8?B?WEcrRnRORzF2cWQ5ODhzYytjSk9aaVRlWGtRSnpWY2RIdklpRW0zeDJVM3F6?=
 =?utf-8?B?dUlsMkJNMnB2VmZJRVJqSU45OGVEczlHZnVoUjhpQStjSjZweXJUU0g5cXJJ?=
 =?utf-8?B?WC9jMjdWMXU1eXlnclNVUXR0cmZpSWxOQ3U0UWUyMEZHMTRYaXZnK0daYWNW?=
 =?utf-8?B?RTNKRldpZ1ErU280QWlNSVM3K2k1VklUcThhZEpMbys1QVl1YnhFMU55K1FK?=
 =?utf-8?Q?PTs1U4zlgs7ghU07gPypHu4hKAxiwmQt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1VWQTM3bHdFZUZTOCtVaVE0cTMyOTNkQk1XMTVjN1ZVWDNPaStaT0RjbmxX?=
 =?utf-8?B?L2dvN2lPSWV4dXA0dWVTeFBhNlF5YkRoMGFJUnoxc0tHUzkrRW80WXVrdU9o?=
 =?utf-8?B?dzF0WWsyY1RwNjBVSlFNRVZza09lSGUyaU51K2V1ZndmamNLRUI3SU9YVXEr?=
 =?utf-8?B?czl5SnpUNTNOcUtKL0ZWWmJOcXgveFhManBWdGgrckNlNldxeFRTV3QraXVU?=
 =?utf-8?B?YWlPbWJQMjM5NTE0SUQwWTV1UzBYWWdSbGMwK244aGJTcnU1ME5PNThmS042?=
 =?utf-8?B?QVo0aURxZFg4L0ZBdmFjdDA5dmEyU0pCWjFRT25EUTU5aHpVMUtDekJRQzcx?=
 =?utf-8?B?NDBjb1QwQVhxc2RBQ1YvY2xJVTZBbGhQazdhN0N6MVJhZ3R6ZzNNMW9mYWpa?=
 =?utf-8?B?a0I1NlRCZmlpVm5aVC8xV0s5VzB2bWJHNUpHT0FSMXd1MTdJdjUxUExZdG9h?=
 =?utf-8?B?cW51dEN3K3V1L0VubDZFL0pxQzd0eVRuRm5lNVNNbDlGN1BVa0xOYndBQVVj?=
 =?utf-8?B?ODFoSDNzQU1CbS85MWNXSU10QU5jc25GNlFOTDluZDN4SU8yN3hzYStUa3Jq?=
 =?utf-8?B?NEVzWlcwUUcrKzJNenZzRHNRWU5wZUJUa0llKzBwbWFSSVp1RjROTVkwVVlU?=
 =?utf-8?B?cVhvdTlVM2h4MFhQY2RwWEJ4RG45NGIyamdpMnkwNjlxcmZrRTlUSllHOXY4?=
 =?utf-8?B?aXFBTWM0bDBMTFZmamoxUnJZUW9XMWhwZS9qTnF3T29reTg1RGl3YUg3Y3FQ?=
 =?utf-8?B?TXFPWm5vQm5iL2t1RVlDUnVNZmJrN085R0FDZzkxUkt1NDRiaEtRTDVIR1ZE?=
 =?utf-8?B?VnJGOUFEazA3STh6Y0xQeGJpdGxIYnZWeFNDY1R6Ly9WbGdYdkNIQmE5VSsr?=
 =?utf-8?B?MFhpNGFJOENnb0tmRWttRXBsdnFmUGNURElvSXY0NlhReDFWTzJyUnNwdkxn?=
 =?utf-8?B?QzVaNzJGU3RTM3hnK3RHTEhiRVZ4aEU5V3ZkT3dtK0tIcXhPb2RZOXFNSkJC?=
 =?utf-8?B?QW0wb2RLeStoQld6R05mamUwUHl1cXRsWmYzTlo5UEJoQ1daRHBJOXFRVkl1?=
 =?utf-8?B?UEs1Zko0NUVQcEhVQ05zeXY3QUtpeiszNTltc1BWY3M4bm5icmFHQmEzWUpW?=
 =?utf-8?B?TXVueVl2ZDNVSVVvcUp2a0ZXL1lpY3UyUEVDcTk3OXpUajRSZHFDSjhMTk51?=
 =?utf-8?B?VE9VQjllV3lleVRNaGdHTE5Cc2Z0aHlGWHBMYXl1ZFQxM0oyUmN4Q3d6YWZj?=
 =?utf-8?B?bGhMOEo5N2RvVkQvblJwOGkwUHNEcllXSWVYUFZudFBENmZ3Z1VFSkthS2hJ?=
 =?utf-8?B?OG42NGkxVStqOXBLTHZraEc4Y25ON2t2UHY2VUdYVHhuSysycUpEUlk5MEJi?=
 =?utf-8?B?RnA1TlNjdHdJSUpaa3I3Qk4vQVhDWkI4ellVaXduUUFFOGdmNTB3N3JjRnQr?=
 =?utf-8?B?RnVZNUExSXlhcUZyWHNMeWk4NGpCVXZPT3ozWmJjTlZEY3kzM3F5TmNRSFgw?=
 =?utf-8?B?V2Y4cUJlS1ZaNVNnTHkxQTBmWk1JSHNoWVlIZXVobFgva21zWVprUUxicTFv?=
 =?utf-8?B?T1pwWGVvUWlQK2dEdnE4NnBuY2dPb3Y1UGlBN1MyeFNnbXFBZksrWjRSSGIy?=
 =?utf-8?B?TE9zM3U2M3Z1RGRBMmQwUzl1ME45ZHNNc1RVSDQ0SnZlWmtPbTBWY2x2U1Rz?=
 =?utf-8?B?cTVqVHBoWmtlUFRlNzdmbGx2RldnNFpBTmFMNGtMK01QRmUzMWpXaTUzYnhh?=
 =?utf-8?B?ZnFZUDVBU29UQTNiVVdBUVNFSVcxY0VFaU9UTTIyT0FrZFl6TjRCdldJZHFr?=
 =?utf-8?B?SGovNU9hSGtBeVBaNVpwTkwyZkdBZlNGRjhDdEZ0anNOMlQvdUkweG1kSjBP?=
 =?utf-8?B?YmZCWlZRQytCYmVZLzhselI3Ly9MM0o2ajlLMUM2OXFTQ1NBSkk1b21pdGpD?=
 =?utf-8?B?bGlYMmprbXFRbWh1cmZDK2tDSWNBNFk0bzhnak1HdmI4WDFuenJrQ2dpUUNV?=
 =?utf-8?B?aFFXWWdad2s0YldHVlVHb2R2TzlETU9NcUxkbFIwM1JMQmx0bkxxSk9jejUw?=
 =?utf-8?B?T1ZTZzdWaXN6OUg2Y0pxa2t1S2xQOVkzajBvSmt3NkNGblZreVE1bmM1TFVG?=
 =?utf-8?Q?etafwPz+x1WWj1xydJz9Petkw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56ba42d-c7bd-4dd0-f8f7-08de0651b778
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 10:01:57.5529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3u9iCR7S3H9QZqNrt3S7rgjc4Tl6D3XynwMCjT6NEu/4nmflL6v6ztQ4mHVuPgBv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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

On 08.10.25 09:34, Tvrtko Ursulin wrote:
> 
> On 07/10/2025 16:04, Christian König wrote:
>> On 07.10.25 16:27, Tvrtko Ursulin wrote:
>>>
>>>
>>> On 07/10/2025 15:03, Christian König wrote:
>>>> On 07.10.25 16:00, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> Please not in the header. Neither drivers nor other TTM modules should mess with such properties.
>>>>>>
>>>>>> That is all internal to the pool.
>>>>>
>>>>> Hmm IMHO it is not that bad. Especially that ttm_pool.c and ttm_tt.c need to have access to them. Alternatiev is a new header for internal helpers which sounds a bit too much. But if you insist I can create it.
>>>>
>>>> Wait a second why is ttm_tt.c still needing this? For the DMA32 eviction?
>>>
>>> Apparently so, goes back to:
>>>
>>> 680dcede2762 ("drm/ttm: switch back to static allocation limits for now"
>>>
>>> Then there is the newer usage for ttm->use_dma_alloc from:
>>>
>>> 71ce046327cf ("drm/ttm: Make sure the mapped tt pages are decrypted when needed")
>>
>> Ah yes that was the DMA layer hack for encryption Zack came up with.
>>
>> In this case please put the functions into ttm_bo_internal.h. It should already be in the ttm directory for TTM internal stuff.
> 
> Then ttm_pool.c will have to start including ttm_bo_internal.h which feels it is making the component separation worse. Add ttm_pool_internal.h? Keep in ttm_pool.h?

In that case just add ttm_pool_internal.h.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>
>> Going to comment on the other patch as well.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>
> 

