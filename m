Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB77A8B790
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 13:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C274810E8D2;
	Wed, 16 Apr 2025 11:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="luNGIPrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8810E8C8;
 Wed, 16 Apr 2025 11:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgR8VBWXRb8Rf7Wu2g3TmLEusw37fBu4pJf65ELXGtT4JaMzaDsT8H50EMTsgXlLkX1CayMIwIDfkY2Y70M5Hx8DMdBVvVUgL86xKFdKBhPIvAJhfdecK6ESIzQJi3PIrx9WbWGNGxuileOqA5FySttFQfUeF6B1e+Zt3OnrDbGotEDXE1Xlg7nZKCvLQWwLvkWN/QnrU013Fe+bf7o29FAZu2OTAjuanclX6HwKdPDsJ/LapSrEjAJCZfK7muhBwfmXRHd/RzUVWCRo6ffkPeRGhmF87zSiW+HH5E/XI9lEzbPs9g79r2q8SApRTb3INPPIe5y2Ps2G5aUER4kbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlW1Ta75iXQsI8SehotsLWgmRaY7fNMLskldVauWSr8=;
 b=lp+mf1H/gdSFPCxYnDENTBR81lYNCU8nBVp8QgNqE7lhTxjyoZ9E96dI4rBAtpIkcgDHEmHQPUyHMOza1FIauPRdlw/HehiMOEkzKjrUTCV0Q9cD+gdsD/g7yJk83NTQhooHNPSexC+al3iL73BEs106hrgz9yqJKdphh1gLNnebrCIGgqLBvcuB8TSlXopvvf9qBvD96Ul8WJlPXdZNLg4BecEJp4mU/Lg5QQ1Tr1wYdEiVtJgdSfG3ETG3AQXAKw/rdwQ2/VBj0+tdyfvXOslsdcQRoIf9aFp6kSbGWs6B6iX+cZf/UqJqNAJqTx0cv03gzM9UMUnh59N5cuDJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlW1Ta75iXQsI8SehotsLWgmRaY7fNMLskldVauWSr8=;
 b=luNGIPrmlLiS3mgqTO8T9S9NrbP3AJemyBdVzhRwQCBr359SQmksT488dokEfnXdi5LCrcCfnOILHAQQYHfTLMLd4kqJUPmPSU47j1bNGzp/CymPgJK7MeqIJFiMAx7ybgVr1c9ELKEpc+F5LSEm1qtrV+2kKhRthqaFeIuwCk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6925.namprd12.prod.outlook.com (2603:10b6:a03:483::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 11:22:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 11:22:48 +0000
Message-ID: <4c41cd5c-db65-4de4-bcc8-4d3e80998af3@amd.com>
Date: Wed, 16 Apr 2025 13:22:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: add function drm_file_err to print proc
 information too
To: "Khatri, Sunil" <sukhatri@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <830a2b61-8965-4193-98de-d462a641737f@igalia.com>
 <2047d128-5c3a-4f9f-a55d-3188fe7ea3c3@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2047d128-5c3a-4f9f-a55d-3188fe7ea3c3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a300c8b-c5a5-48ae-fe4c-08dd7cd9048d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3dwNDNYaGt3VHp0am9VTkxEbVVtcHJDb01pRnBmWXBrWVVRSzVBMlpiQ2Fp?=
 =?utf-8?B?Vm82TXRjdERBa0xvTVBkZDJvTkFqZFF5anFTNytOamR2dFJmMUxBQmNkT0lr?=
 =?utf-8?B?Slp0VWJ6MGhUZzlFQmYxc0lPY200OXJUUlB3a3IvS1ZtSXd0WEZQQzhsdU4z?=
 =?utf-8?B?emxTUnE3L2RpUmhYTHIwN0RtNFRpU3F0SFVDWFluRGNDWStwbXE4aGQzSXla?=
 =?utf-8?B?dFc0cis2WVlxWVczdFRhYmFhUytoTHg4SU5URHg3cmdBOUQ0a1hRSWx2U2Mz?=
 =?utf-8?B?aFY2MTF0ZzIwdVVNL3NKenRXVHlaYktoVklGUXlUR1QwK3RCQ2V3eHJwaW16?=
 =?utf-8?B?VVczajlGejNHWEwyV1dqb1Q0Zm91eFNYZ1RHeWZXdXU0aFJkbkg4aE0yRDFX?=
 =?utf-8?B?bzErcHNtdmhnRjJjUHZZQ2RTeDQ2VnRKWmZCb1RuaUNNQk5wWTk1b2lpTVNn?=
 =?utf-8?B?d1gxNE96SUxINzBPTHEzTzlwTGJRSVF1aElpV1dtTlN0SVZlUVZuTTNGT1lF?=
 =?utf-8?B?UWp3a3FJZ3JjbERQSHEwU0c4MVdBQ1d1T3BCZjFzMzhETms2WEhja3RzbUFH?=
 =?utf-8?B?U0hMbDFMUzJVbE93UENJM0lmUzBkR09TbFUzNS9ka3NvemZaWHpMV0tYR1BX?=
 =?utf-8?B?TlVMMHo5R2VhQXB2eTEwQlBFcW9CV2wzeVNiUHY3WE1mbUN5UGdCVytTZy96?=
 =?utf-8?B?SVh1c1pmV1k3NFI1b3Bxb0RGejI5WDNzNXErVzdrbGN2U3l6MnI4aGg1RFBC?=
 =?utf-8?B?OXJBcVB3L1hWK0lwUVZQRWVFYVEzT2U4a3l2TFk3UzZaREQwWDg5NFhoaC9H?=
 =?utf-8?B?cW5lMXBjWHhlTGRLdnNkRkNVN1ZFdmw3TmwvcythajRucjErSGhScXIzL3BZ?=
 =?utf-8?B?QXJpeWNJazBBTE92UFE3b21vNms4SmNDOFN2MUJjL0lUajIvNnNzelp0RjhC?=
 =?utf-8?B?TFZBdVh4aVFtTFVwd2lZSU9ZWVRZb0d3ZGpqeEl1b0hUN003MXJDZGUxeTha?=
 =?utf-8?B?a0U3QTlTRWFlc0dQd3R6QWdmMEhzaU5zaExCNk9Cd1hyNG5CNGszZEFOVk9D?=
 =?utf-8?B?SWNLNWs4RUx5VDBMS3ZHQVRDano2VVJLeFYvdWxLUkxIbW04eUNsSzFrN3M0?=
 =?utf-8?B?SThFNWtwanNwc2VkckVFWGNJZXhOMGVEQjNKOXhoMlZvRXhYcWxibU1pUVhv?=
 =?utf-8?B?WUpsOWpoYkNMYk1HWngvWURpaEV2K1ZiSU5yZlRXQUNwdTRqeEVkUjUyN0FM?=
 =?utf-8?B?eUwycElhcjc3ZTJRcXNRTmxHMUU3c1dpVlNBSmh2WEx5RzM3SWYyQmgxTEEw?=
 =?utf-8?B?c1dISVZjZEV0YUR3OFJDNXVtVDc4V0EwN3lGMDlCZW5BaFhRR3RsWnRGR2Zh?=
 =?utf-8?B?d21pTDNLZjBuSmd1ZTZmMndSK05CY1VCWEJSbmltYjRDQTRqM045MlJUNjhv?=
 =?utf-8?B?RUwzaDIwcHB0VmF2bys3cVM5TnVLZTJHY1huMXRtRWtQSStyRHdFWUtJamdK?=
 =?utf-8?B?dXlXR1JHdmp5d1pjQURBVTBHTHhSbFZub2FTcHNuQWtUZWx3UkQrZVh1OGlo?=
 =?utf-8?B?K3hFNSs2ajVtTVl4ZmJIcFcwZFdkWWlzaWlZLzdVRXNWaUV1S0hHOWV0Q2ZN?=
 =?utf-8?B?Z1FOZmZ3Nms4SUczd3UyeGxMekFIK1hrN3ZkNlJNN1pPMGNBaktETnU4Z1NZ?=
 =?utf-8?B?ZXp3aU85czRRNGVPTnd4eDdIS0xiNTMwdHhvM0krYWhuV1hyMlo5Q3paa0Q5?=
 =?utf-8?B?aUJxek1BNkNyN21RY1ZRajRUV1VHUFROZnZvcFRLcjlCdUJuSnM5bituUUlX?=
 =?utf-8?B?aTR4R2tWbkkxeit4Z3VNbnFmZG1CVm9mS3NIeS8rTFZ1L3RJQ1hwQlpuTWNM?=
 =?utf-8?B?N0lRL0tsWVFtTzg0dlZyK1lXUFVBSHhjWndZMTMwMGRuaURIK1hvSENhRUJT?=
 =?utf-8?Q?7CcGERAhyp8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnM2d0ErZkd2U1BKRllWK1NGVWJrU3ZCdjNGT1N3a1BzcHE2THY2VDRLK2pm?=
 =?utf-8?B?NjZ1MVpFcmtWdHRXSVRhNDhIUUpkWHlvejZWdklvck4reEVSMHU5L1Z5d1Vq?=
 =?utf-8?B?Tm9DUHZJOUJwc1gvM3VhaUJLNGtYdnptVmpqZ0t0K25Va3hxZGtKSmgxWUd5?=
 =?utf-8?B?dE5xaERCbEZZUWdNb2ZvcXIvM250eDM5U0p0M2R2RVZyN0d6S0I0T1NuMk9k?=
 =?utf-8?B?OUxXSGFITUpiMWZwTS9sWEs2K1U3MmV1NjBkc0ZPck5ka05FVjdJZk0rVlJH?=
 =?utf-8?B?QXRWekNTUjBaVUVFM2Z5WkJxTXp5VVVraDVhdkduMVh6Z05Qb0I1ZGlHUTZX?=
 =?utf-8?B?aDBDQ01HQk9adE5YWWdpWGhLUXZ5TGxQSWhvMHFteHc3WnpFRGxHYXdiV0Rk?=
 =?utf-8?B?VGpISXdDVmVJd1FEdlVNdGxKRnM2bkhUK2hXYVZ1S3QvcDcyS0x6MTJmNFRN?=
 =?utf-8?B?b2tGd1JpaTVJbkFUNlJ5NEtSRFBBWHRHOXJNZEFWM1hYNFV4QThHKzVQdXVJ?=
 =?utf-8?B?VmVaNzJUT2ltcW1qUUdCVUwydDBUOWZ0b1VqTVByQU81U1VuU0U3MmpXV2xX?=
 =?utf-8?B?Zmx3QUozSG10US8raFhTMkRZODNCbEwySEdTTzg1TGc3MzYwSGl3eGR5YmlS?=
 =?utf-8?B?a2k4MFhPQmRLRzVZU25XejBmancwdkZ2dEJIUFlmekJDYWpMVzJoTjN2L01h?=
 =?utf-8?B?OFh1MllGZGpudUlVbXdvMTlEd1JNRkgxVFNSZTZuMUtjVkdIaTlha3BlUzB3?=
 =?utf-8?B?M1JTSEYwQ0dWQXRWbER4OUpPSDAzWndId3lZUTdaN0QyNU0xRElQWERLQ3Nw?=
 =?utf-8?B?YS9USWtzTnRhY01uWFJOaGR2akkrVXB6SUh1b3lNNkJKaUp6NHZJSFNkeXZt?=
 =?utf-8?B?WjEwcjVwMURRN1pFbzFSaXpQQmR4aitvMjVCa1NIUEtIS2VGdWJrRUQzaHlv?=
 =?utf-8?B?b25EWUNhTG1zN0MzWEE0RlNlZUtSdngrZklpMGh1MWI1cjdFUHhZQ1dWcmVn?=
 =?utf-8?B?RHpZRTJjeDlPTEdRcE5xVjlreElXU2lZWXVvZkRUUnVlY3BMb0xBdzh4ZC92?=
 =?utf-8?B?RVpGbXRXamdyL1NMMkszY05LVElSMG40TWFUVkswd3lyc1k3MzJ2UEFDbnIr?=
 =?utf-8?B?UmV6eUwzRHJtVklPdTFUSnhIc3dLQXY4OGR3bitHK0FIaklNYTd1TGRmdCs5?=
 =?utf-8?B?S3RRek5zRGxiZ3kvelRVVkErcGVoZXp4RlBCQkEyYnZiUHRhQk1sYmF1Slps?=
 =?utf-8?B?SFlndXowZzlvWFVpelRnSHRCL25veWtBalhWZmpWKzRmWis1NDEvcVB1QVRL?=
 =?utf-8?B?ektuQ1dZYUZDTXBiVzJyakxxd1VoL0ozYU9mb3hJZzY5LzVKV1VvWnIyT0E3?=
 =?utf-8?B?YWJOaE5NYUp4aHRpak9tb2xJb085d01uSVVzS1FwNnkvSzBrVDdVM3ZPSCsv?=
 =?utf-8?B?QkZ5S1ptYnZaSGxyTUVOOHN5MFBPTEkvT013aUlmeXJuU0drNytJNlRybTRr?=
 =?utf-8?B?SER0WERPaVkvNzF5UGZoQVpxazEwQUtyZy9GSWRkZkJNUVF4Q2RKYkY4cWd1?=
 =?utf-8?B?ZjNSeFh6UmNRQ0xwUWVQbjBPdzBlWHpLYk1FNnhkUEpDaUo4ejNIMFg4ZGxL?=
 =?utf-8?B?cUNEdS9GK0R1WlFpSW1SYUVFUmZWRStGT1VlQlpDMG9oKzlMby9yaTN4U3FI?=
 =?utf-8?B?N1F2ak1vT21Rc2gyQUNFSUpsbWcrQ3gxaG1nb09sVTZZMHhpMmJTRXhMYnNl?=
 =?utf-8?B?TXYrZTZrRzBGVVpkYm95Vjk3Vmhjdk1XcHVJTS9NY3MxRzZoMzJNcGNWKzNY?=
 =?utf-8?B?c29UTjA3TXE0UGNXdFh2RmxqRVBxeWVuWmJMbkdOUkt2RHB5SHYwSU1MRlda?=
 =?utf-8?B?M0RMVTlUNWJLM3RueDJscHBXWWNWbGFTdEpDcUxGcHZOcVV2N3lDbmU4b0ZK?=
 =?utf-8?B?MmFIYzBwd2ZTaXRhWCtWUVZjNVJyMXZIbTlYcUNuQ2puRGMwekJRQ3EvRUEw?=
 =?utf-8?B?QU5zQ0FUNFJQVmtiTGdJTVpEeVFXMU9wdUcwUFRkcENSM25PdG1jQk5nOE4r?=
 =?utf-8?B?c0pvb2FSRzBkRWlLWkQ4R1FtcGE0VUhMcGZ4YmdFWDJxeC9SS3hmQzVZbHFC?=
 =?utf-8?Q?lCq/tJXtexkuqZLRVbwVicK8H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a300c8b-c5a5-48ae-fe4c-08dd7cd9048d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 11:22:48.5225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hM0+mZnc7FHM5BQDvYdb3q7JKIln8BM+Fhm3z4voGagZZP/IuKcWh7Q5L7OFRCFa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6925
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

Am 16.04.25 um 10:39 schrieb Khatri, Sunil:
>
> On 4/16/2025 12:37 PM, Tvrtko Ursulin wrote:
>>
>> On 15/04/2025 19:43, Sunil Khatri wrote:
>>> [SNIP]
>>> +
>>
>> I was hoping something primitive could be enough. With no temporary stack space required. Primitive on the level of (but simplified for illustration purpose):
>>
>> #define some_err(_file, _fmt, ...) \
>>     drm_err(dev, "client-%s: " _fmt, (_this)->client_name, ##__VA_ARGS__)
> I also thought of doing it similarly but that dint work. There was lot of code to get the process name and pid along with client_name too. So ##__VA_ARGS__ dont work as soon as its a function and not macro.
> Also drm_err gave me errors and this is the way i find it not complaining. new_fmt is a string directly anymore and hence need to %s to pass but then the drm_err complain too many args for args to pass. So i have to combine new_fmt and args in one to get final_fmt and atleast functionally it worked.
>
> Yesterday even i though that i would be as simple as adding a macro.

It's a bit tricky, but I think that is doable.

You need something like this here:

#define drm_file_err(file, fmt, ...)
    do {
        struct task_struct *task = drm_file_lock_pid(file);

        drm_err(file->dev, "task: %s pid: %d client: %s" fmt, task, file->pid, ##__VA_ARGS_);
        drm_file_unlock_pid(file);
    } while (0);

You then just need to implement drm_file_lock_pid (maybe come up with a better name) to grab the mutex and take the RCU read lock.

Christian.

>>
>> Am I missing something or that would work?
>>
>> Regards,
>>
>> Tvrtko
>>
>>>   void drm_file_update_pid(struct drm_file *);
>>>     struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
>>

