Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E97D129DD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 13:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E70C10E3BD;
	Mon, 12 Jan 2026 12:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u7lmOgJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4742A10E3B9;
 Mon, 12 Jan 2026 12:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXSrceHtYcEIfqZzh/zoB8HDKcjDhHuVYBaGAOHe517TwNNr1FZZm7KULGHyGLV4dJKPjVRntDMiWZyAgXtQiKXakmF66/cW5z2hczMMC17AL3ImQ9RDgjhFof4tXFPYzaPpRhQ2fUfMGyVbHDxX7cBxvs7/tjysKxbva7EV8/gFClkkS0ykzBd2XeLfeDI5H5Gz+sy6Ra2UYaNxGh+ekeBfdk2CHp64Zn52nZAgyz4gU53YIQ47P9povTd6VJSfXwv6W9KjmoGWlbjZLQWPlUpECPKO4N7ZCfvGRnFg1BvkrrRUq0+idpUhHHLy0CVIzGx1MZklczPFK2aaa+d3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWEGiKtDYQ6QDdEs4LErxVUTly9rnodp5QBUe2HfRP0=;
 b=A+K61Sx4Ca8BEMN6+qYnKLA7oubRhM8J5wCNQHETMRp2gA47yUsbyetPTIb41eoExi2u52xRlrdz0iQ3etTPJhvzGBdJ2PvO+2vEUzwe3OTDE2jb89zrhb7XoRlxnVMQObSlZZ09AA7pe+mNVsDWrHx5Ro/U9fd+34DP8IaoSRlkk+LdCxqmlfmqOE88CsocZDfbC+lJigxHy63dLY+Xx3MFm5T2dNVO+uHTbJf1r0qx20/TUiP7Bw3ZOKE3+hysWPqybFS4y9NPA3WXsUQhHP+OzCciVIxfF/XrkSu4hKwn/ptPxjh6LyE429CLNpJsqm3igdDsy5IpGkuJbZ2GKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWEGiKtDYQ6QDdEs4LErxVUTly9rnodp5QBUe2HfRP0=;
 b=u7lmOgJcziFACTmHCJ743jwpP/eOjSkCGLM5tNBmXeFH6Y0kZcbz0tZGKTFD5taCmNg+wuqSjt3ZcpJgsgbkVOBafzm4N5a20jt7PO78GsQUQpu+gyXqA+Slo4Ii2yN39xlfjjQ+smIoxPxhjXhqk2TP4yJ1wk6715OfDiwvEVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8556.namprd12.prod.outlook.com (2603:10b6:208:452::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:51:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:51:40 +0000
Message-ID: <207265df-4caf-4899-83be-ecd5b21d95cc@amd.com>
Date: Mon, 12 Jan 2026 13:51:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] drm/sched: Disallow initializing entities with no
 schedulers
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
 <20260107124351.94738-4-tvrtko.ursulin@igalia.com>
 <a763700944ed4ccfe2f36ae805e4a348dd3fd10f.camel@mailbox.org>
 <340d0ce2-85e6-4fd8-992c-c35dda9b0cbb@igalia.com>
 <87d5ab37bb3594ee8b1707ffaa28f4937a7f0ad4.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <87d5ab37bb3594ee8b1707ffaa28f4937a7f0ad4.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0409.namprd03.prod.outlook.com
 (2603:10b6:408:111::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: dd72d8f2-4258-468f-6e1c-08de51d954c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW9WYmhxRFlrc1JCRms1cndOcmhqSHNjZFJuR21xYXRodlIxa3JFN0U1YnYw?=
 =?utf-8?B?a01UM0VHRXJseWUzMi9qZEZhRi9xY2RwS2xWOWU1QWdpT3hmcGpmMCt3ZUlR?=
 =?utf-8?B?SnRyck1PNHFia0UwaXNtYjNWdmpmNGhGME4yNVdjUXZET1F3SGpzUWhLekgw?=
 =?utf-8?B?NnVWR00zMXJZUEVFd0hZUHdSL0RpQ2xQaG5KL3lYVDIvNit5eG1RS29rNkRw?=
 =?utf-8?B?OC9xTXFqUUVDa0xKZmMzT1ZRUkd3eVc1WUN1TzhXMUJaTURoNHBOQjl0aVd1?=
 =?utf-8?B?c3NDZ0EwRGhucVNhc3h0VGJ1QXFNd29aNDJ2V21tQmowOHpEWWdjLzFLWnh4?=
 =?utf-8?B?RHVzZWo2R2pqajkvVmpFdFNPb1MzbUhENEloU3Jrem44N1k4bFBGZHJ2M25z?=
 =?utf-8?B?QU4yaVdDYWY2SHZBU3dHR0xjeXo2QzN0bVNQTGxLK09pMXRkaDNiMklSa1ZY?=
 =?utf-8?B?MjVXSG9vTGxBRXJlR1V5aHhFRFQzUzhMTGl6WUZqc240dmlybFdsR0NLUity?=
 =?utf-8?B?NFJCRFBCZmd0bkpTb1JGQzBhZ3hKZjJhaEk4cFhQZ00vN3hGWk4vbG9vSnFT?=
 =?utf-8?B?eEtrdlZ6R2pKOXZJbHNzZDcwNGJ6TU5aMmRuTTc4Q0Q3VWdZWDZ1YjRWSlRw?=
 =?utf-8?B?Q2NzYkFTVERrdndyZURIekpoNzNZRXZuMUcxVkRuWkhqbk5lNFFHR0RpdlRM?=
 =?utf-8?B?VVRibjhCcXdjRUlKNWlOOStpZmZkU1poYXpKNnRZYXprSWx1Z0NpYmppNDRZ?=
 =?utf-8?B?MHJLbExwN1YxSzYxL1dtbjlXQm9mTE5xRXo3L3hLTFB4bUZ5SGp1UnVCYTNG?=
 =?utf-8?B?Qngra2tVVHJXNE5XT3Awd1BEQXdhMGJvQlc5bG1STmY3UU1lYmJFdCtVVSt6?=
 =?utf-8?B?UXB0WWE1b25ZN0l4akVmN2pIVm9yVVJ0U3BURDg1U3MyNG05SmFmTTFQOFpE?=
 =?utf-8?B?V0wwR0RFY1NTdWJOMENyVEt3NkhZblVXR3QzUittUVovVnh0YklsUjgyTkhD?=
 =?utf-8?B?bzNOTWJIQ0o5K3hWTGxMT1VlVE15VWxtUFE3c2RmQWQ5WUdOM0NXeUxiaXJ1?=
 =?utf-8?B?Y3pXcHNnTWs2T2FYTTZqb3hEbFZjMCtXb2FvaWtQM1dHTmZQeFVFOEQ3UDFN?=
 =?utf-8?B?S3dDdUZrYkpIYll4MUZkSDhsbkVDL0Mzbjc2eS90Y3pGOEZtdTk0N3Zaclh3?=
 =?utf-8?B?YXFHbStjV3VCbTZrdnBSaW8xODZ4VjNNaXNpV2J6Sk10S1hHcS9aWDVOb2pu?=
 =?utf-8?B?aXQ5bkQrM0tjR1U2Vll4dU1xaDNGYjRDNXA4MXQ5c2dYQVJEbWtoeGZ4dVQy?=
 =?utf-8?B?VkJDdG93MEFlNkVqSmlraWNRUHRvZXRUS1JqNlkwNkZkNk1wanRMSS84Z1Ja?=
 =?utf-8?B?VGtGa2gvYWNxSUFKTGc3czJHb1BIZUJSdXpVS2Q1eXZnQW1xWmF0eVJrSVEz?=
 =?utf-8?B?ZWdVQzhsMWxPQUdPQjdsakErMHFWOFFwM2I3dTBzTWZaY2VpMHAxSnIyeWkx?=
 =?utf-8?B?Z08yKy9GbWlzRXJWZk9LajZaQWdLaGR5Y0MwbGozNDltZzhwUkJyMTd3dGF4?=
 =?utf-8?B?OFdFdGxkU21ra1JiMDlxSmt3d09lQkNpaGhKcm5wQm81UWthd1VIMHlXVC9o?=
 =?utf-8?B?bHZUaHJCVlgvRlh2YWRxWVl4bXJBaHFQaHA0NlpKOHdlSkFqcGF5eG1YTHlz?=
 =?utf-8?B?cDA5bWVXRFJySElMN2pUVVpLTHN0VGJBUExBRXNaVkFRVWlXQkIreCs1QVA5?=
 =?utf-8?B?ZjhBaGNpVkREQ0JYZ1h2c2g4emVzcUxkZk0rQTlVay8zajJLVk52b2I5c2Z4?=
 =?utf-8?B?dHpKMXFuVEZOZTZ2WjYvSGxNZ21hT2NFL09oaW80Nmd1OWNpN3BQM2l4NEx5?=
 =?utf-8?B?anZKR3c4QjhHNWNDWXQ5Z0MxTmVRRFJ6eDd5dmNzcXJaekdMWUFZNkZtdzVY?=
 =?utf-8?Q?PLaj7vbdU+wH1YZmCvadHfETVtBFOd9l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJWMDFKWGR5ZWFIMUhYRkxkMFBYN21ucGhTdkRDL0NZSFhjeXd1OEJxUzFY?=
 =?utf-8?B?TEpIOFBTTDBYVzNkblJRZzJHVXNNU2R0Z3dDdHMvRlNKYU1hNXMrSTV0OVpR?=
 =?utf-8?B?ajJqKzJYTHU0ZDhKd1drSit3Zk5LeXBvVlNMRUdpRzRZV1l1NHlVZGtmVE5z?=
 =?utf-8?B?KzJKT09tdWl3NzVkMGlNWU92VTg4RG94SWVpcG5ZM0VNN1BEU1l1MHFKRm9L?=
 =?utf-8?B?M3luSDgzZFc5WVhoTTVGL0xUdWc2UldCN3hNdHU4NzBUZXFmR1U5aUp4UkNp?=
 =?utf-8?B?MWRZSEVqSU12R0ZkMUVENHhYWTVQd0cyS2ZvSHJTVzlTT1V3a1JzWGQrRkty?=
 =?utf-8?B?OElRcHRQMUdUaEZnVGpkZmJwamdGYUdlSjUzMG9iVkErNlR5Sk1tUEE2VHNq?=
 =?utf-8?B?U3pMMXg1UWM2dmVCcFVXY3BuUDFkZEhRVnNzSDVIU3lnYWU3UHNDWmhVN0dj?=
 =?utf-8?B?eE1KdzNuV1ZtNlQ3c2cvQzNMNTFrNnRNelA4UU0yR1VOOTY4TFN2SWlZd2pX?=
 =?utf-8?B?YUlLK043WDRESUxJUm5OZmkxV2ZJTC8xU3Fmejlza1N1YVJoSTVtZnRybUNu?=
 =?utf-8?B?ajkyaW5aNC8rcHorV1ZrbjJ1a2kvS2FYN3JUb3lFMDFIV3M5ZVVpMm1LcFZP?=
 =?utf-8?B?QUJmYVRUMkhPOHd2UXBnVnZFTmJoaTI5Mnd6OGptdXBCMXRPbTFxQ0dLcTEz?=
 =?utf-8?B?ODVoeXFFUG1NQm52SHBIbEpiVk5mQkE5bVNOTmFPNTU4RlBzc3FWbWZ2eTBw?=
 =?utf-8?B?b2UxbW1iRnZjR29FaUtQMDBYK3crS2ZVZ3NIa1NISzdJdjNYSkFBZlZSR0ZS?=
 =?utf-8?B?Q1I5clFPUFBGZGxNeFBlQ0R0NDBZQzdTWEh5UUpkT0taMmIzbGNsdGd2Y29t?=
 =?utf-8?B?QUFpY0paVVMvN1lWbXRKVEVNeHMwSStldzQzUXlnZnBudlRCaWZPU2hBc21x?=
 =?utf-8?B?TERieVZHb3hURWQvckJZaFUvNDk1azZrTmliaU9FQUxSWFloNWtFazh0eHlm?=
 =?utf-8?B?VnNHM05mQ2RMZEh3M3NsVDd0T0Y3RkdJNWVpWDBVZW1GWUdocE5yS2Zsb3RC?=
 =?utf-8?B?Z0E0U0hINW5nSmVkUytKTkRMbTRMVjN4V2wyZ2FwcG1iRGxuV3poNk1HN3lN?=
 =?utf-8?B?WWw0ZWxwSEpMcW5peHg1ak9PMVZnSVArL2ttOTJoN1J5TTl2ZHNwR09VMWgw?=
 =?utf-8?B?ZUVGTWhkM2lwRGd2Q2E1M3o0UFNYOHhYSFQ5b1pEVmsxZEhQeThhZ3UweUlZ?=
 =?utf-8?B?eWdTWTFuQTJOcEw2cUtDd2dnUjExbGxMai9ZSTdMd0Z4RVVXZVQzR2VOeGdZ?=
 =?utf-8?B?RlhmcGtRdStDZzM4Mlh5U2J0a0NBT0F5NzFoVUdSaXd1TndEU0thNzVGaVFE?=
 =?utf-8?B?a2QvZGkzeUxvTFRxSXZaNGhwNkoxY1BiQXVLRStZVWg3NkRGSCtGTFl0d2tV?=
 =?utf-8?B?WHBDQnh1QXQ2d0FPN2h4OWpjM1hPS29pL2xlWk5pZmVkYWdBeWs1Nmg4VmNH?=
 =?utf-8?B?ZXE0NDlaMTFRNHRvTmRkYUNwTDI4Umc4QUh4R2hWVnFWb1BJZzNaQVRwYVFj?=
 =?utf-8?B?REJFbTRMMldaKzBpZFExcXh6R0ptVHVYUXB5T1JCejNjdWd0SVZreldqTFpH?=
 =?utf-8?B?SjJ5ekIrZElKaG1EaVA3UUQrbUppbmhmYVd5MUFrK29UODk3ajJvQnQ5aTA3?=
 =?utf-8?B?c0JSZEZJUElzT3pJNDRTS2NQZlB1Y2ZhMUU2Zy9jRGlwUWZ4Y013TXo5SGNm?=
 =?utf-8?B?U2d3OGVhbzg3Q1YxRk82N1E1QWhIQUFXNGdhZFd0UjNJMWFQQkIrWFdMYnhx?=
 =?utf-8?B?UjZ4Nit4TFUyMUdhQmlQVGthSUhnSjkyS1JIWTBHYlc5M0trakN6cVJ0aTY4?=
 =?utf-8?B?ZkNHVThLTUd0L3g4RHcrOWVMdU1XY1NlYlp1V2NoV2QvUUJHTFBncEFxWk8r?=
 =?utf-8?B?S3crNjlHMXlXR2tYMzQxUlZBRDRXMUk1bUxZaDc4RVRRR283OFZpcHEzazhG?=
 =?utf-8?B?UURFSDBPSGFyaHRBUHVxeEozTUxyeGhCaWFtMm9MSk9TeTEyQzBjeE5kZnd3?=
 =?utf-8?B?b0hvZ2JOVjM2c05uN1JxeElnWWluSXJZQmlnQnlrSHdEQmNDYnpMSW5rMno0?=
 =?utf-8?B?MzcwaXYrajlLQmEwcS9vSGc4VFBKaXdHayt0SnJIU3piZkNUbWJ6UkttWTlo?=
 =?utf-8?B?VDBGNHhkTjFMSEIxTXpFSWFXRm1QQmMycWZ3b3ZGbmEvVjU3SmpwQ0pTQXVX?=
 =?utf-8?B?Mnh6dXdPUjdobWNOc2hhWFJMcW9jUHQwV3d2UnVHQ0EwZkU3K1JtTmVyQmVj?=
 =?utf-8?Q?ljRgu4SsTPKAgDItbp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd72d8f2-4258-468f-6e1c-08de51d954c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:51:40.6561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6TPLE8Mht7G9+kUx3akcjs6kcSRRiwuz0vfHjAlhPInpdYpgR0WxdovR2T81BQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8556
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

On 1/12/26 13:49, Philipp Stanner wrote:
> On Mon, 2026-01-12 at 10:29 +0000, Tvrtko Ursulin wrote:
>>
>> On 08/01/2026 13:54, Philipp Stanner wrote:
>>> What's the merge plan for this series? Christian?
>>
>> It sounds that staged merge would be safest. First two patches could go 
>> to amd-next and if everything will look fine, I would follow up by 
>> sending the DRM scheduler patch once amdgpu patches land to drm-next.
> 
> Works for me.

Sounds like a plan to me as well.

Regards,
Christian.

> 
>>
>> Or if DRM scheduler maintainers are happy for the DRM scheduler patch to 
>> also go via amd-next that is another option.
>>   > On Wed, 2026-01-07 at 12:43 +0000, Tvrtko Ursulin wrote:
>>>> Since we have removed the case where amdgpu was initializing entitites
>>>> with either no schedulers on the list, or with a single NULL scheduler,
>>>> and there appears no other drivers which rely on this, we can simplify the
>>>> scheduler by explictly rejecting that early.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_entity.c | 13 ++++---------
>>>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index fe174a4857be..bb7e5fc47f99 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -61,32 +61,27 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>   			  unsigned int num_sched_list,
>>>>   			  atomic_t *guilty)
>>>>   {
>>>> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
>>>> +	if (!entity || !sched_list || !num_sched_list || !sched_list[0])
>>>
>>> I personally am a fan of checking integers explicitly against a number,
>>> which would make the diff a bit more straightforward, too. But I accept
>>> that like that is common kernel practice.
>>>
>>>>   		return -EINVAL;
>>>>   
>>>>   	memset(entity, 0, sizeof(struct drm_sched_entity));
>>>>   	INIT_LIST_HEAD(&entity->list);
>>>>   	entity->rq = NULL;
>>>>   	entity->guilty = guilty;
>>>> -	entity->num_sched_list = num_sched_list;
>>>>   	entity->priority = priority;
>>>>   	entity->last_user = current->group_leader;
>>>> -	/*
>>>> -	 * It's perfectly valid to initialize an entity without having a valid
>>>> -	 * scheduler attached. It's just not valid to use the scheduler before it
>>>> -	 * is initialized itself.
>>>> -	 */
>>>> +	entity->num_sched_list = num_sched_list;
>>>
>>> Why do you move that line downwards? Just leave it where it was?
>>> num_sched_list isn't changed or anything, so I don't see a logical
>>> connection to the line below so that grouping would make sense.
>>
>> It looks completely logical to me to have both lines dealing with the
>> same scheduler list, accessing the same input parameter even, next to
>> each other:
>>
>>    entity->num_sched_list = num_sched_list;
>>    entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>
>> No? In other words, I can respin if you insist but I don't see the need.
> 
> Fine by me. Though a little sentence about that cosmetical change in
> the commit message would have made that clearer.
> 
> 
> Greetings
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> With that:
>>> Acked-by: Philipp Stanner <phasta@kernel.org>
>>>
>>>
>>> P.
>>>
>>>>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>>   	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>   
>>>> -	if (num_sched_list && !sched_list[0]->sched_rq) {
>>>> +	if (!sched_list[0]->sched_rq) {
>>>>   		/* Since every entry covered by num_sched_list
>>>>   		 * should be non-NULL and therefore we warn drivers
>>>>   		 * not to do this and to fix their DRM calling order.
>>>>   		 */
>>>>   		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>>> -	} else if (num_sched_list) {
>>>> +	} else {
>>>>   		/* The "priority" of an entity cannot exceed the number of run-queues of a
>>>>   		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
>>>>   		 * the lowest priority available.
>>>
>>
> 

