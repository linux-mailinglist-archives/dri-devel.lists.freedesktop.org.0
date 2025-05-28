Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A0AC6A4A
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CB10E2E1;
	Wed, 28 May 2025 13:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rPob3Xv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9129C10E2DF;
 Wed, 28 May 2025 13:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9m6qbSavQmXyo2A+9woUesMj65NUdIuBOaqT35GcDHm0hrR55JNXMXtNsp6aW8BIM/6oBkAO0vOGH4bBQq9uTzCyJqlcg8F2csNtivlbdNsDwmwXsqhEDp5JKYMcMbUwmlOc7XPz6pjesfYsPjoZMaocnlPT0nictI+1IHaMr7hHtc9IoNEv7T8h8ibnuiVcXhBeB/FUrD9ypEym9njlpZYFNDUU7XSoZ2LoYG1eFK0W/omzcWgxNKz1DfXgCBriNSx+mffv71hqEElAGNn6j973pH9Txnoy4Sql4A1iUaFs4ydYVa8kE8G+KP3h742glgMAccgbabh+3bdkpDt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA9sqWqutvjxmIyGbSSjyOFakV7st2giiFY5TOYSpkc=;
 b=rZL0R5qHOZQHUpxwwY0yWsnx5xqpQInwFT8xAAijbaOmxtewfP7B2ZBzhno0Cn3BAq3U0Su2vRr5U0AySPuBKjLJCjbvQZxg4mrHzk4fXCwPv+l/ae17O3W0QnSZbUiCJFEQbDGoOwBW8zomiTJLa57HBUeXF0IMjDcrk6Joy6y8FkW2bPlJxzYoABYtb7fI39OsLaIKKqZ7nEfXAGRGs/AZTK2Tv6nb+H5Mjsk0s+0bRWB1xWTdlq8VluuiWSJ9Zmsd0dFU0m5pT9sbRdiyr3T2Tg1WWDRgU1MUOc1WNqYiclqHDQmsBE/CeWOUMK4M44dkYKXpTemhdkqWoeb/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA9sqWqutvjxmIyGbSSjyOFakV7st2giiFY5TOYSpkc=;
 b=rPob3Xv+eNtMmujcQRNLYqaRgsoT5J2Ar2zPXXIkR8KF3ORRbw0R09fhMWlFSkRVg6yKlIgukn1N99dF21v1GVjpbGsiTwau8N87NGN9KrsjiZZpCcq6DZMQivRgHyCmkp7/jMUWg+wlBG3ylcF31qWn2/iBCSNHokekzwc6jvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7169.namprd12.prod.outlook.com (2603:10b6:930:5e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 28 May
 2025 13:24:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 13:24:42 +0000
Message-ID: <8d9b509f-dbc5-4831-a302-e687b0a32101@amd.com>
Date: Wed, 28 May 2025 15:24:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
To: Simona Vetter <simona.vetter@ffwll.ch>, phasta@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, tursulin@ursulin.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDCDJ-sK9rRI6wse@cassiopeiae>
 <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
 <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
 <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
 <cbd3eaa4c228c0d0688745e8a539103eb2278a0b.camel@mailbox.org>
 <aDcB0AbQiHOVUyAU@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDcB0AbQiHOVUyAU@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf77b45-aa5b-44ce-01b2-08dd9deb01a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHV2aXRuVVBZQUFVVE5GY2l6Tk9yNFQwa3RIUWU4Z1BXTU5SQU9IbGluNHFX?=
 =?utf-8?B?TGcxODRBT1JLYzZaam84cEQ2OEpDQnpuRHdJL1M4VUwzQTZlK2xTNEd4VXhP?=
 =?utf-8?B?bjBvL3hYbmhuQTZQbHZhelFOdkp4SVZHeDNoU0ZRMDBTZWtNbzlnM1JrakNk?=
 =?utf-8?B?cllyeUVyV1l5dmxPWFg1S09INVg0TmV1ajRYQlBBVTliRllHWXA4TDhwNElB?=
 =?utf-8?B?TURPSzNBenhlb25ieHFHQitxaHhDOFQrT3M2WDRPSGo3eVFOU0tDUkNHcCtx?=
 =?utf-8?B?SnR4cVNzUG1DbjV5dWdDYitwWlJnSkZBZFp3bTAwZnBLems3Njljd1B1SDZE?=
 =?utf-8?B?YkdCUmNpeUh5bWdRSXRzcHJPbElQQWVsQU9kTVd6LzV4clJRakhob3pSRW1t?=
 =?utf-8?B?RGNoMWxXSWhjWHdxZzdpaFk0MlJaay9FV092S3c4cGRsc1RxallUaEpNc3Rq?=
 =?utf-8?B?M3NXNVp0RTkrMVoza1gwVDNwL3VEY1Rjb3ZrTEQ0SmgwYncrd2pabHp0ekw2?=
 =?utf-8?B?QUZqMytjczRtN2FFRWlnUlV6Qm0zWS9LckdWTXltWjNaUURpRkl6QVBNWGhi?=
 =?utf-8?B?RDE1RnUydVA1YlVYYldLZ2YxeGMvMnZreCtPejd2dWlPYlFMSXRzeWtBQTFK?=
 =?utf-8?B?bjc2cThiaEFoQlJGOVZCQUNGR2Ewbm9JaDZEb0RpN2xNbUZpUThXSFNLQmMz?=
 =?utf-8?B?NkxWcW01N2dQSDhHNkJhTVhrUU9acnlOTldkc016VllxSnV0d2ZINDRjTHps?=
 =?utf-8?B?R25jMTBJRmwxT004TDU2U0F6VWw1Ti9zY1lLVnJXWFBXV2FxK0w0TFY4M21H?=
 =?utf-8?B?UTE0bmx3aWc2WFhadVpsVnBEelkwTFVXb2JWZVpqbzRETW04VnJ2KzZMamow?=
 =?utf-8?B?Qit0REVYZkh5SzhrcGJWTGFRWk5QNndhOGZRNm1nQlIvNll4ak1ua2VXTzdl?=
 =?utf-8?B?WlA5Z29OY2JOQlJvZFNNdEU4L0JZVUwzeDNaNUlQenJ0N0QrcUJFcEIzZjJC?=
 =?utf-8?B?dU9EM2J1ZEMwV1NDeVRKYTRZUTlMWEJ6bXBNaFdtNVhwZlRNWnBJTStoU0di?=
 =?utf-8?B?TVlUQVlQLzZMQjFremUzMnlCczN2N24rNmo1SzJheXloMlFwL2NKS2dyR0VT?=
 =?utf-8?B?L3VYdkk1c1lrV3pWNGZ2cnAxVWh5dzZDRUduODBvL0lEYk4xWTV0eS9YODlF?=
 =?utf-8?B?dlJUeEVOREtQdDV4MUVtR0NmUDJ6NGovbGpoQjJCSXl5ekFZWENHQkhST3VX?=
 =?utf-8?B?N2xGVyt2czFDalQ1QmJWYVJIdVZGdW9WM3NXRHp6TXliRVBvd25EMDBJOXdn?=
 =?utf-8?B?bE1EUEsvRmUrbVYzT0RwTy9nV1k0OHczRGt1U2NnNVVTMlloSXN2czI4SHFX?=
 =?utf-8?B?OUIybWhxclFkaDBtUk1TSGNMbVFiUk4zY3NWUDYwbGllNXhac2RoMmMvWFJi?=
 =?utf-8?B?bzZIUnEyTmxldGhXMCtQMHhVVkVlb1FQRWpsM3I5d0FvaDNycG5hTFZMZmU0?=
 =?utf-8?B?NWdja3ZLZStwQmwzcUFvU3pmZXlTSzdkVEZjaDlMRlVvenhEb3VCNnhSRzlZ?=
 =?utf-8?B?b3VRRmIwNDd2RDR6QnpOU0NLMzNnQzA1aVJ4TXcvZk9zNU53TUZrbittRHI4?=
 =?utf-8?B?NWEwaS9PVXEvMy9KSmR1dGxJQTM3aXIwTHg2QlpwNStMb3YzRHhZSGhQQ3Zl?=
 =?utf-8?B?aVRFT0hyWWtRRmo5cVpnRDV2bEF6Tm5TbmhhRVdvSkM1RGlPUWVtS3c0V3ky?=
 =?utf-8?B?RGJEamYrVVBEL3U2VUpDMWJHR01rVUxkUFhzSjNwbEdQNVpidk1sYnB6bVNa?=
 =?utf-8?B?NGZVV0lYcE93SEtIclplVmozb1BLSjZVMnBlS1g1MWhTTjhzTVJSN21GTjNW?=
 =?utf-8?B?YnljZTYvcTZITEk0RGt5SXNmWVE0Rm5zN1Y4aXVOV08zUUNVYmFnbFgrcXdR?=
 =?utf-8?Q?yh7K3t/ApEc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T21RM2YvbU5CaVNGdzM3Vk0vdVQrNlFCV2U3WU9sMGc0MDFHR20yRURLNnVk?=
 =?utf-8?B?K3JGWTNXYk9BWCtwT0hwc29mSCsxZXVXdTd2d3JYZUphWERNaFRvVExsZzJ1?=
 =?utf-8?B?N01TR1FnaFBoQ2V1ZGZ2ZXkvRUFIUzR3b3lVQjczY001eEY1a1NRZE1CMTBQ?=
 =?utf-8?B?ZUFyU2VsNS9QcmJ5M05KYzNSc243TEh6YjZOU2pPeHk4VkFlbDBXYlhWdnNh?=
 =?utf-8?B?WThPdzB0M0lMSGpGRFFFOTJ0NHlnZW81dk9pdUp1RFVnSnNLZHZSSU9zWEJw?=
 =?utf-8?B?c0ozQVlQZnA0aVNTaXF6bW5KUVVWaTVVT3R0OVMvQVB5c2NVTVM3WUhISWpR?=
 =?utf-8?B?MzRVM2RvaEZGRUxHRUFhc0hqYm1FNlNKWlhCNEw0T2NwWlRHVFJBTXdZQXZq?=
 =?utf-8?B?Vm9vSWtGQ2I0VFMzaFRUVFk4cmtVOFRhb2NRK0JvRzZxbmNwQUdaeGpObGwz?=
 =?utf-8?B?WkxMZlJXcU4vWE9DQjU2SGk0VHlPTjlOTXQxM0VINVBKQlFQa0M2cFdTK0ZJ?=
 =?utf-8?B?OURUbkhSQ0ZxaWg0UXRPcjFQRG9MSGRTeWQ3cVhxcVBPbkFIZW9hZzAvY2h0?=
 =?utf-8?B?aWZFbVdWa1BBdlpKdHN2R0J5b1AzTGh3cjdGaks1VEJMdzFIbTZ6eXkzSXo0?=
 =?utf-8?B?NFQ4a09tYXN5T3llUEVXWU9zVHVrdDd1T2h6dHc1RW5MT2pxTzIycTN0MHN4?=
 =?utf-8?B?WUFPdnVkYjl3RHoxdTU4OFZtN1o4Rnd5T3NtdjByREN5UVplN242MTVIZGt4?=
 =?utf-8?B?WDFZVlg1WGJ5S0lNVE5meDFudVNMeW1PNUpwZURtaDhVUzFBVGtXUGJ0QjAr?=
 =?utf-8?B?VlpKMnpCQ3lSQ2ZBRWlRb2p6WVFlS3J4SUJOSnlSU1g0ellxNnJsdVpJMjRr?=
 =?utf-8?B?cXNudXpsSzRBWXNqYnFaYVZOSFhvaEFwUk80WEtFdlZ3UkJXb0l2VmEySzl5?=
 =?utf-8?B?MUR3K0ZKODVETGp6NXQ5WEx3d05EanMvQlY1a095M0JjOUcyeWU5RUhJcFBS?=
 =?utf-8?B?ZzRtTnYzVTdOMGRxU28yTWZZd3hHbk41NVBuMkYvUlRiMzhoQUQ5MjVwVnVJ?=
 =?utf-8?B?N2xoNEMvcXJnNTJYdjRTMUY5MVFTU3NyM25XVGVUZ3ZZcUg2dGVwSU9EenRG?=
 =?utf-8?B?b01YTFVBaXR0anVIdndsZlpaakJjMnNsQnc2Y3FqT0N3V2dSYk82ay9Bb3No?=
 =?utf-8?B?ZEl4anpSWVQzZ0xYc1NRRmhnUVQ5ckFDbjVvSFBKT1hXQ0lGRC9xSnQwd0th?=
 =?utf-8?B?RFJmMm1mRHRqbjJMSmE1bFp2QmxTS1BGRG9WVnQ4RGU0d3A3Nlpac2dKdEx4?=
 =?utf-8?B?d2xiR21MeCtxU0RleU5JQWs4Y3lRMDM5alJUTEVCOUtEa296NlFWa3JpTWU3?=
 =?utf-8?B?TUlla0xXMDQ4WlhEbUlBSjYzemxnU0xpd0h3MGRkUDRCV0ZJcHdqVktxNlFl?=
 =?utf-8?B?bGRXa0d3RWkzL1FGRVNtUDRpZGVrNUhuRWIxZ2QySys5bzc4KzJPTW16ZFh3?=
 =?utf-8?B?eU83VDJ6MGx6cnArQ05reFZlaDhPdnZIdmdhUnh0UkFuV1BReVZDSkRFRDhl?=
 =?utf-8?B?Rk9vSjhFeWVJdW5NLzNBaXZuYi9VQkJFSGhhNzlKcmRmTHYwOHlvR0JHL1g1?=
 =?utf-8?B?dEI4MzhhakM0MG1xK3N3ZVNtdTlTV3cxZ0Q2c1NKL0dMM2grMktZUkZnR1Mz?=
 =?utf-8?B?cEo5ZC9Ic2p1N0VnQ3BqRmwxczdDd2IvUkZnTGU4SXdDckFsRUthTHEwUjNo?=
 =?utf-8?B?VWVXaFdGTEVYZFV1SmVmMTU1V1poaGFZQ2xqWkxjWmpxeUZRQzZINmJjMDdP?=
 =?utf-8?B?c3lCYnRRM2ZmeUY0eTBkSGN1d08xS0ZkQ2hvZmkrOU5Vc1ZRYW5oQTJrcFhV?=
 =?utf-8?B?MXJ2bTUyZ09rL29IQlBkaFNEYjZDcy9HTWdxSSs5bVZWRWlJaVZJc1BLQ2FE?=
 =?utf-8?B?YlhrTzlqdkFJZmIwRnpiaGtoU2ZxRkk3MGc1RTBHVjRteW4rd3RobXdnN1ZR?=
 =?utf-8?B?SHFCTzIxZjgzZTVTVDZKOUpmaThlaUx1SW12d1FZNWgyNjZCdXFmQ0F2MklP?=
 =?utf-8?B?bDBZSmQzWDNtSkhWRGZDcFRvQ01FMHBwTnkxN3VZNkpXWUozTFJ3aVllM0JY?=
 =?utf-8?Q?uNuLJJv3EnZwDlkewxzzKZQtl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf77b45-aa5b-44ce-01b2-08dd9deb01a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 13:24:42.9252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1y8wmSBeb0jCdqtzsA4XC9QphpbuHb5miqZJBNdr1KrhhTkvnzAsyN6HmqsS3sM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7169
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

On 5/28/25 14:30, Simona Vetter wrote:
>> Yup, I've seen that a few times. I think we, the DRM community, should
>> stop that. It's just not useful and makes the commit messages larger,
>> both for the human reader while scrolling, as for the hard drive
>> regarding storage size
> 
> I do occasionally find it useful as a record of different approaches
> considered, which sometimes people fail to adequately cover in their
> commit messages. Also useful indicator of how cursed a patch is :-)

Yeah that's certainly true :)

> But as long as anything relevant does end up in the commit message and
> people don't just delete stuff I don't care how it's done at all. It's
> just that the cost of deleting something that should have been there can
> be really nasty sometimes, and storage is cheap.

The problem is that some links to mailing list archives become 404 at some point.

But git on the other hand will keep it's history (at least as far as I know).

Again on the other hand LKML is the one exception which tends to keep things forever: https://lore.kernel.org/lkml/16GLAZ-1rFguGC@fwd07.sul.t-online.com/ :D

Christian.

> -Sima
