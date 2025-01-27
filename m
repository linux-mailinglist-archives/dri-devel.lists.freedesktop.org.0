Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E665A1DC40
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 19:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB7610E336;
	Mon, 27 Jan 2025 18:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4fhkgDfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9F10E336;
 Mon, 27 Jan 2025 18:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dICWIEohbQOhVViVh9FvXj8906F3L+MdkCtrAd3GituyCKWbHqCUjQf1hqHM/bf/2+ewvaf0UuMxi+WIuk+MfWJtJMioLD5HgH7SfcwbKugG2LMzqKOHCzlwRr1QlR0QqGdsj9YzyyqVA8dlGNVoFi71Pzy6BLI5Vo6/ONAEgdHVetKpcx0Rvfrqk7OhpnF0DxFi9zm6YdVnIrKDnkmPlbjs2cCR00lIEXZ/tE1RMjRZGdnkb+0oqRkNB7rAOGZiUOXoCPeo9IfO9VxmVspnYGIPU6UKFcfpk0j7GN55zPZ7RQ4X0U1W7bIk5rRAolcnelbr/VKqVEjfu4NPifwmXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbWVNM/lC3kv9tuSE6gl9uOngloWFu7eI8YNvIGyfq8=;
 b=nfEadyB3K9+4cg9yMmScH9zth6DSD8K+v/4yR/uTFtKlLRArsUTkl1Hye9J5SJC9YgClxGWuEtYDsrikXHSph4j2XPqhgZstF7ZKJJbb5P1SKA/OYt+Um7E1S50ZEPCLQlYekQtSrjhHlYScaip03eg2rSU70f2zoK7sMnVrLr7SnKk9D8iiBBfFQTjiC/o8UxMOHNMNCecoTaoiIMHzXnMFVkclLKwZAvh7lJ+Gbg0uAICitiqa284LmRYp2jYC82HXrbs3Fehz+u3OAsXu18ww/J6hgas0SugdZh2n0n4BeQpwCvzPnAxRfy341T4Xiz6JCMBod4lWxxmwwzvlTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbWVNM/lC3kv9tuSE6gl9uOngloWFu7eI8YNvIGyfq8=;
 b=4fhkgDfcB+ag94+mpdXa6WdKnq/zmdAEVMEToI8hWo/GGmeIsgGqhpc+mDeogEM/MqsiDcBqbkad6PrUcfElwIHIvVoDq0iGls2+5ySOsighnmkP7XEepumuYnf4K7FIW8QMcngvZRFEFJeRbW6/7OTRBeUkKrwtXZ5Vu/0X/Pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7264.namprd12.prod.outlook.com (2603:10b6:303:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Mon, 27 Jan
 2025 18:50:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:50:20 +0000
Message-ID: <12cb5a8d-ef7f-4cab-85d5-947dae83639c@amd.com>
Date: Mon, 27 Jan 2025 19:50:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: restore wait-free fastpath for GEM_WAIT_IDLE
To: Lucas Stach <l.stach@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250127160258.289035-1-l.stach@pengutronix.de>
 <280a3079-d213-4892-869f-004776fd90d0@amd.com>
 <bf0abe8daf18a5718b1a38c29096967bfde36c12.camel@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bf0abe8daf18a5718b1a38c29096967bfde36c12.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f00a1c-cbc3-451d-c5bc-08dd3f0372f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzF1Q0hvdDVoS294V05CZUptZVlUUkUveU1SNGRnU2RHTnNFakE4VlhyUFJm?=
 =?utf-8?B?eVUrb3Z5Q0VvcWxPODBLMW8vc2F3djdEdDhSV0NBbWo5SnE3SGM3SlRtN3oy?=
 =?utf-8?B?N2wrN1gvMWxIdHZrUXFiYzBHcUMvVFpESUlCK0Nkdk00VWJ0ZW9IYlZ0QjRj?=
 =?utf-8?B?R0JFejE3YnhYZ1ArS2ozQzFML0QwNWFUWTZmTlM5aWcxOWRRV3BNNmN5OGNh?=
 =?utf-8?B?WGVWbzQ3c2FFRC9MVlJJcFAyd3d2b3F5ZlZvR29mcERzS2w3bFQwSUYxQVN5?=
 =?utf-8?B?a3hncEJnZzd2SlR5aFVpeVFjUFFFdnZnN0VZSkpWU2x0SEpNKzRUaTU0bVRo?=
 =?utf-8?B?blRkbWw4MmNvTkQwVHhSU3hKTWp3YUNtUFU3VW42dUF2M28vdVdUVGV2SDRP?=
 =?utf-8?B?WkhJOUtmWEFSRFVEbG1qcldFeTkxSFZvRWh1NThubHNSaEo3akdWTXVrT29B?=
 =?utf-8?B?WTd2ZUFwTU5QZk5pYkZUeGRrK0VKMHJwK0ZnQzM2WTZJZENMNXVyNm9FNHF2?=
 =?utf-8?B?M3ZvQVpuSjVCbWpRaU80VllaMVphRFR3V3BNK1lqbVMxT0FQeG9LVDhvTERZ?=
 =?utf-8?B?VFlBT09peFE0MXg5U0tyeHNxTldHZHBlN29yVnY2TStBMUJCcVZWSGZwRDlJ?=
 =?utf-8?B?eitwN1oxbXJnNS9xekYvMXJLTzlGSmhiYWg5cVI1U2lhTmNxUXlvcmQyam55?=
 =?utf-8?B?N3RrOXVkY3BjQnVMT3Vwek1OUzBUanZMdnVaR0FabHdFMTZxaUR0SmFnTkd1?=
 =?utf-8?B?SEh6c0h6UjUyVEhwRVdiT0VuWXdNaFNrKzltMXNVd216THIyTDJjR044cVIz?=
 =?utf-8?B?SzhUNHlncnIzM3lTb1dLUDJPRC9rZjAwbDN5Rno1RlgrY1pZTmhRZ2VwRUpO?=
 =?utf-8?B?SEd6WUlBbmlvcTRDdVpiRHRVMVA0N25oWHQ1Q3hrRkN3clB1K0lyVnVXbzc4?=
 =?utf-8?B?TndUaDJpSXNRb2YzYnBDaW5qbmdvejFTUTNmK011NVVMQWlzc2dhdnVMME1C?=
 =?utf-8?B?dHJ1OUFNdWRkMmlMUzc4KysyQ216SDRWeEF3TnNrZlpiWkkwRTYwK1V4a1lv?=
 =?utf-8?B?NWsrcUxFczFMS2VuZXJwR1JZZjUxK3JScGJTOTNoUmpBb3E1MXp2dURMMFRh?=
 =?utf-8?B?VGRkZDJwc3Y1RXR6N255Y3BUYS9Kb2pVbVVHU2dJYmRTNVZNcks3VmEyeGMr?=
 =?utf-8?B?b2ZCa2RZeTRSeCtOeDM0dHorODFFbDNHSUVXakFJYmhXZFJ6SmM3V3NOYkJk?=
 =?utf-8?B?YU1Hcms2MktXT2hqb3B2V2U5S2lPZVpuaGtZVW9RenQ2MjhiektiRmE0ZHV0?=
 =?utf-8?B?RitYR1JFVkt1aGVEdWF0OUVoMWE3NWlQR3NyNExJRzFNR1U4TlRUUUpCYnJF?=
 =?utf-8?B?eWxEbkc4eWRDWXpPN0pBSVg5eTJKSVVCUEpZN0wyaXAvWUcwYms2TWV3WW95?=
 =?utf-8?B?KzUrcWIwd0c2SHpFckdkSDBuYUNSYm5pWjJwSWpWR0xLM2lrOUprUFdEU2Zu?=
 =?utf-8?B?dnJvK1RMTHkxYmJQemhMdFlwKzFTNTRlUHAvQm9hTmgyYW9QREhBRTVMSXB0?=
 =?utf-8?B?U1MvVE93U1l5LzJuY2hUT211Q2NDc2hubkVKcFF0d0pqdForWDlMNEtkck9C?=
 =?utf-8?B?MW9ORk52VnBjdVU3cVAyNmlKR2JDSW5pOFMrQTZGUXhFTEFhN25rZ0F3MW0x?=
 =?utf-8?B?LytoNWQzTGV1ZDlRbHJvY0hzbkd3alYwemtJemUxcEN5VVVJVFowNnNCUmx3?=
 =?utf-8?B?RWRNbE1SMDkxZUtiUjNoK3ZhcVFRaFFvRDI5dmdNcmMzQktrY3dyL2dYZkRY?=
 =?utf-8?B?aXl6cjI1RVpJKy9TenVFQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BQUXljM2lxb2lidHYzcWlsYURaemJ0dHBUQVZtMm1aRTN0cTRzQk1uTDhr?=
 =?utf-8?B?eWZHbGRpNDlEQUFqQmRHUTB1TTUrR3ZvbjUyMFJGSFhMU2RTdTNLaVpJVUxn?=
 =?utf-8?B?dmhBeDUrZThlaFhjQmlhblN6Y3FtbkFFaUdweUJEczBvcG1qMVhlN0N4d3Er?=
 =?utf-8?B?cU1BdlB4M1Z4bmpFakpSU1hTWm9YVk1qSUVUQjI3ajhBaFRLWFFzbXNIYTJP?=
 =?utf-8?B?S0NZZFoyQktpOGhkK3BXN2RPV21sMTE2WU4vcmRiUHJEOXBFWldWdE0vbEsz?=
 =?utf-8?B?OTd3WHFlQS93QjNUa08ydWIxSXB1U05MQ1ZEN3JKU1dNM2xWYUFnZzRZOVRM?=
 =?utf-8?B?VzYwNExQc2JxMEt4NHFVSUpuYW85bnlZM2YrQjhDdUhsVHNlUzJiellpcGZs?=
 =?utf-8?B?OVpzbHBxVUxuT3ArcEtwS3AzS3dXTmpoTFpWZW00NmljMTZMSW1pZVlBeWNC?=
 =?utf-8?B?TzhVbVptUjExRi91aFd1SUdWQ1lLQVFsc2tDQXlzUzYxbHRUaFErR3dGUUZQ?=
 =?utf-8?B?TXJZVnFLWFZXd1ppelNpbFpQWFgrWnVlZFJCMHJTb25HZERyeC80Ri9BQVFX?=
 =?utf-8?B?dDlPREFwbTVVcDE2Y3MyWnBvR2NISVR6ZkZXdlRrMjFnR3djSldhMkswU1ZG?=
 =?utf-8?B?bFl5STI5L2U4ZFBGZ05ZZ1JIWnJWcEl5anNleTVxY2R2QWxpbnFJZXg0RlVh?=
 =?utf-8?B?RzV1cUFBc3hJZEFIZEJESDZka1pEUGQ0WW5jQ1lxdzRHcGFxbzcxN2l5WXRP?=
 =?utf-8?B?TEQ3aVFjZ1JuT3orbTRHMXk0NEZtamxhVG4zOHhKYklIbzJ1bkhhZHdSM2hT?=
 =?utf-8?B?ZVJZbzhkVUlZTkcyOHVvZWowbUZHVEZLRFlmd2F1WnJVRmVjZDRLOExGWG9h?=
 =?utf-8?B?M1NXdlB2WEVCNDBVSm9WSzdiNnZBdGRVVEVTR0hEL0crL2ZaQlNVVURCUSt5?=
 =?utf-8?B?SzVvRVd5RjNhK3NaQVVRSnd3T0czeHh2d0Qyd3grcEJrTXpUUlVydEhqcXhT?=
 =?utf-8?B?TDRja2VoTlIzVm1ldyttbVlsRXA1YmRGMDYxakRXNDF2RE5GTnJoUU5RMytK?=
 =?utf-8?B?d2VJc25oWUE2aTlRaG10dUpHMG5EY29OSisyUGZpbzZkTTZZQTllREwydzRy?=
 =?utf-8?B?dTdrdTczV1U3M08wd2FDNVJnU04wTkRtT0VJZEN6dVNVUmVkOEJjYldRTUxu?=
 =?utf-8?B?ZHBabmtPNFptdkhQV3ZxaDlOR3V4YS80WkRLRVFvcGluWVhUTDJ6dVhXSlJk?=
 =?utf-8?B?NUdyMXl0NmdabTZnNStsc0hZOU1aaVZyNlpYK2RSVHVxQkdIdlpmSzdkTG1F?=
 =?utf-8?B?VENwMWdpeTd1bDYySlF6eGhmaHBNVEdsTE1IazFScmlqWGRKMlJjZE14OThr?=
 =?utf-8?B?Q2UwR3BWVWk0RVJpZzV5QzQwSmlHbDBQek9NeXZta3FKM3RCTEZmU0RrRm5I?=
 =?utf-8?B?MndqTE1SNXJrbDNSSzZRanJQcVhSOXVzb0cvR2Q3bTNlYmJrdm9mMGZ2V3hs?=
 =?utf-8?B?cWhHMTJPbzdoeS9vd2FjbGdOcUR3U3dBdzhQYjdFd2Ryc0UzQ3VKV1BNVVpx?=
 =?utf-8?B?TFFsN1pFNVR1NHUzS2h2VnNDSkI3aCt6bWVyQVFDZDNFWlBmeFlNdUhMdysy?=
 =?utf-8?B?MWNOWlZjTzlQOFFITUs2NUtzelpWM2F5VklVL2F3VEs3SzJiVzlmeHJOZHhW?=
 =?utf-8?B?WUQ3eWtRYzdLNkJIV3Vxbjc3S3NrNVcyK0trcFUrWHJpNHczN2RrczFzaDBC?=
 =?utf-8?B?MGRRVFVZQzJGaVBZUFpUclVINzgzcEVsMStkYWt6c3ZYQ082SVhYcXNXNEdy?=
 =?utf-8?B?NkVWWHFicmZFTW4rYkFjcUJBY3F2bkdjVmV5L25PY2ZETi9qRThnRW1vRE9D?=
 =?utf-8?B?VzUyZ1kwdE5HQm1OUFJRbHpHVnUvUWhHVFRteFQyS1Qya0hMR0xZbWNxeWFw?=
 =?utf-8?B?ejE3MzhybGQwNEQwKzRmOWJ2ZDFsRGI4c29mUHBUSk5VNUZHQUlXMVo0a2I1?=
 =?utf-8?B?RFdFS2JySnkxMHNOZElJSnBhNUtXejhQV2g1R0NFNGc4Tis2RmVWb09LUnox?=
 =?utf-8?B?Vlp6ZW1hSU1OSjlHYVp1TFhpOUZKYXRSZ1VlR3JvSUJiUXd0eHlJNlBSbWNM?=
 =?utf-8?Q?JHEw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f00a1c-cbc3-451d-c5bc-08dd3f0372f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:50:20.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOs84GzPerpJdFH9ny77Alw9kpkQcr/XbIx0A4S0puNrAdMRrUyNtA97XI6vZBOB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7264
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

Am 27.01.25 um 17:33 schrieb Lucas Stach:
> Hi Christian,
>
> Am Montag, dem 27.01.2025 um 17:14 +0100 schrieb Christian König:
>> Am 27.01.25 um 17:02 schrieb Lucas Stach:
>>> This effectively reverts 0fea2ed61e7f ("drm/amdgpu: Remove call to
>>> reservation_object_test_signaled_rcu before wait"), as the premise of
>>> that commit is wrong. dma_resv_wait_timeout() without a timeout will
>>> not turn into a wait-free dma_resv_test_signaled, but will wait a
>>> jiffy for unsignaled fences, which is not at all what userspace expects
>>> when it calls GEM_WAIT_IDLE with a timeout of 0.
>> Marek pinged me about that strange behavior as well. That sounds like a
>> separate bug in dma_resv_wait_timeout() to me.
>>
>> I don't see why the function should be waiting with a timeout of 0 and
>> we have multiple cases where that is assumed.
>>
>> What should happen is that dma_resv_wait_timeout() should return 1 when
>> all fences are signaled even when the timeout is 0.
>>
>> My educated guess is that this behavior is somehow broken and instead we
>> wait for at least 1 jiffies.
>>
>> This here is probably just the tip of the iceberg.
>>
> dma_resv_wait_timeout() explicitly sets timeout to a single jiffy when
> it is entered with timeout == 0. This behavior was introduced with your
> commit 06a66b5c77ed ("reservation: revert "wait only with non-zero
> timeout specified (v3)" v2"), which seems to fix a real bug.

Ah, yes! I see where the problem is now.

> Between the two behaviors I think it is wrong for callers of
> dma_resv_wait_timeout() to assume that the call is necessarily wait-
> free in case of timeout == 0. If you want wait-free but are able to
> deal with false positive unsignaled returns use dma_resv_test_signaled,
> otherwise use dma_resv_wait_timeout to get accurate answers with a
> possible wait.

Well dma_resv_wait_timeout() with a zero timeout is indeed supposed to 
return immediately. Anything else would be quite a difference to all 
other kernel functions which take a jiffies timeout.

But the difference between dma_resv_test_signaled() and 
dma_resv_wait_timeout() with a zero timeout is that the later should 
still make sure to enable signaling!

A couple of people have pinged me about that as well and we also 
discussed the desired behavior on a bug report with Faith and a few others.

Going to take a look, thanks for pointing this out.

Regards,
Christian.

>
> Regards,
> Lucas
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>> ---
>>> This is most likely the correct kernel-side solution for the unexpected
>>> slowdown worked around with in userspace with this Mesa series:
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32877
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 9 +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 1a5df8b94661..75b5d5149911 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -567,8 +567,13 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
>>>    		return -ENOENT;
>>>    
>>>    	robj = gem_to_amdgpu_bo(gobj);
>>> -	ret = dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE_READ,
>>> -				    true, timeout);
>>> +	if (timeout == 0)
>>> +		ret = dma_resv_test_signaled(robj->tbo.base.resv,
>>> +					     DMA_RESV_USAGE_READ);
>>> +	else
>>> +		ret = dma_resv_wait_timeout(robj->tbo.base.resv,
>>> +					    DMA_RESV_USAGE_READ,
>>> +					    true, timeout);
>>>    
>>>    	/* ret == 0 means not signaled,
>>>    	 * ret > 0 means signaled

