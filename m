Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C4693904E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7168510E079;
	Mon, 22 Jul 2024 14:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bYBLgBhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1B10E033;
 Mon, 22 Jul 2024 14:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkyVio+ZlTNqH3zLBhZhZgh6PR2FXroQWqnh69M58TEgBBkYx+nmLTXf8UK2kMDkmaH7Q/QPatqFMMdvy+8k5T2JH23Vx1wTDoZGXA9VZlCMAOiFIbYmWBzQ+oZ+Dh35MsPcUBehqRoBTZI/B0UGxozb17ewwaC6QrY6gMw+u2e/JRnjSqCoY0aQsC1SBcCsTAHCUIMAsrGhOAf5jTx89WzYmvVt4HKrkoGiE/X4bk+7QdYu62Ob8UgiFJd8HjO1EvstbYieeCys69Yd5C3nM95w0hHijXjY6vHWhN/SwzJGbGrRglE3kiZroZG+G8NohfeNHzDNxRuq/Ll0ixY4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etkxVznOmirtipceiD3Xowoco1qZy8u+KqyhzYc7mrA=;
 b=W1nw1sB4PZLBaf1wYOA3iCWaFt3hDYZfdh1Me+pjFr/DVRnYjDPdrlYtYciSW/v3/pN1Aihai2Qu/YILrLPiR3dxJ7h2lyAhnP5APOtu4aFSBxvhf+XYeC0YVscC7CghKOaKVHl/Hz4qBV3jw4ffPbJe/bqxEBlnX15GxnmtUQANZqqukzM9tG7kWfoZBd9POiffj+VZH+u2dXcUYUqSwWuCY9s5Mn/aSokfAkhgMHbtNa/LEpRUNZOr3PGqe7pxVAASbvw/PmR21s8GVGmsVhL4Tpjq/WeSO+mIa9ZllmbEidaFrhtEmLohhPUbwNjjfssrQlV9KU+I30ZL/r314w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etkxVznOmirtipceiD3Xowoco1qZy8u+KqyhzYc7mrA=;
 b=bYBLgBhib/+/AdsFjql9ZJE70elCAU7W/oo26SUNfbYCidLnOZmx2+YJ3i6bJzGgvwb6IPgt2XA0XSM78wXPi2czJLcJ8F97lrcFPGta1/OTsibBRxwr4Hk3VDTAPgDkg1wwqD4tHWqCoyiQuxpSIe9PYvSSEqw4M5iRbXuzx1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Mon, 22 Jul 2024 14:06:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 14:06:14 +0000
Message-ID: <eb8a2ce7-223f-4518-8d72-fac875a51f98@amd.com>
Date: Mon, 22 Jul 2024 16:06:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: Fix drm_sched_entity_set_priority()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240719094730.55301-1-tursulin@igalia.com>
 <61bd1b84-a7f3-46fd-8511-27e306806c8d@gmail.com>
 <bd1f203f-d8c4-4c93-8074-79c3df4fe159@gmail.com>
 <8f977694-eb15-4b64-97f7-f2b8921de5cf@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8f977694-eb15-4b64-97f7-f2b8921de5cf@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 161bf3fd-bd7d-46aa-b0a4-08dcaa57726c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjUyNnFOeHBIU0xvaGFBSWxZM3JSYlpTWDl5azFGdzByR3VMWlhmdUNJY2dr?=
 =?utf-8?B?b2Yrek9tZjdxSmhPenlaVXVyc2x4QzdJM1gxcjlIMTRPbGNMeUFUWVdFQ1NE?=
 =?utf-8?B?OXVOOUNBQnFYbkVGUmhPeFJzK0VXSnkrVWh0bWVLZVo2NEZHWVFOd3pVa1p4?=
 =?utf-8?B?WW8wRU03UDl5M1d6U0lkMnVhd05DRHhWRHJQa1BwMHRXS1IyMXc4Nkk5aGJ5?=
 =?utf-8?B?aDhVNTNZUXRxN1FzRDRHSW1udzBvd3lzOFQ4OVNZTTRwWWNuS3JVbGUzZWRj?=
 =?utf-8?B?aWltTzBxMGc3UmwwODFYdWwweWs0T25kaDdUTEptSlhWK2JKMjJOdEVxV3JF?=
 =?utf-8?B?azFtcTlmMkIzNys4MGpwM1BXeDllV0JsKzczQTNVU3laVFRJL2NvcGNCOCtG?=
 =?utf-8?B?M0ZFY1FsTTQyTGJxbXJtUlYvVmdPcjRDakY2VWRXc0h5YjhXVUoxekMvRGg3?=
 =?utf-8?B?YmxGL3l6eFpIcGtKcEFxTUU2eDI0WXVWeHRUVUV2UWJVVWtFcjdmQ1RxVjdK?=
 =?utf-8?B?VXdudWVxUkxCR1BudDZWQVBGWkxiYURITTJnTHNSc0RmTHNVQThpKzJHZGk0?=
 =?utf-8?B?NjhwN1dJeTJoZzZzcXZwSVdGWkdvUmlmSzJCV0pxUDN3UGhVQTNyazNzWFM3?=
 =?utf-8?B?Qy8xQS9BN05iblhyaGp1dFh3Ri9rVkRrK3A5UERDVlZ5TjRNZjMzSC9sM3k2?=
 =?utf-8?B?STdUWWlaUi9wVkVlWWJJNzFjQzhsVHU1a0R3UVMwY3R3a0V0NHc5b29VanVW?=
 =?utf-8?B?SExXUHlsenlhYWxUVVVzSGx2dHV2ZFloU3RtM1JWZTVSK21SdHhSc0VwSXJ5?=
 =?utf-8?B?S1NRYTZqenlYTDdxdkl1VzV0RUlSdi9EM0pIMkluMG1aNmRUakp5aU8rRWpx?=
 =?utf-8?B?NzM0SkI4VUxzbk93WFBJMW84aGxGb1cyZXJBOElZa2xiQjhmcXBDeDE3UkR1?=
 =?utf-8?B?dzJIYTJzOEhjRjNyZXo2bjlmY2JDUmVrMGNSTTBNUkIzcWVQblpRRnhJK1Rx?=
 =?utf-8?B?YnVuZXFNY3RnaFpsNDh6RTlRcEJTNnFCMTYzU0dYTENtS3BWcTdLZjFCTVFR?=
 =?utf-8?B?WGwydXdqSzd5M253SG1ZRmlWZk81R21FRWU0eUg0bkRCUTcrbFJ3YWhobGdQ?=
 =?utf-8?B?YVJZTFpBL053ajhLb2R3d3JTaTBYbGVuSXhwT2g1QlZWYkd6Vm1nOWZ5TzVy?=
 =?utf-8?B?dUxhanNITnlKRVhtQW9kNUkyNzdLYmJlSWtDRkw4MVpQeG1jaDBWZU5lZ3pR?=
 =?utf-8?B?RzhVVXY0K3JBR1dyekhyU01yTWNnMU1KMHBSRFZyNi9iQVJxakxYMWdGRUtM?=
 =?utf-8?B?WVVhWDZMOTJ0YjFHYzlCWVdXLzU0UEF4UUhZb1RCTStUNnV1dFloV2VGZTY4?=
 =?utf-8?B?R2JUWHFpUEl6VnJNTE8vYU41WmpjenBJTnNBVjdxd2N3bUtmZUQ5QlBHTG5z?=
 =?utf-8?B?cmt5MFBUR1pEVWhJNncrMjNqd1pPbkxHaCtqMHIySkNFUDJuRzRtcUNBSUY3?=
 =?utf-8?B?T1MvZ3F5Q1RyU0E5bjBnR0lhcDJNV25KZEVJa3VXSVpkN1FkVGd5bVlDTC9m?=
 =?utf-8?B?SS9ZbmhqZ29rczdvSW9OczMzM01kYmo5ZU05REdUakExR0lvb21wYkJQR3dK?=
 =?utf-8?B?b28vSHdzQzBreUZTMUNucmtPZkpRbTJXUlhJd0ROdEtZbVdYRFVOZzR6ajVa?=
 =?utf-8?B?SjMyQlREWTFpaVFTTUd4L2VuUjJzMWdKWHpweUlnenVCQjcwUmdjVkZndXha?=
 =?utf-8?B?MmFOTnNRMTZ3a2hMNWRjMzk2TlFDaDFaSFNHZUtGenZwZW9HdC9jQmhaU1I0?=
 =?utf-8?B?bUlldWkxdjV2VDFmVjIwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWY4cnJ1M0JUSjAzTzhwNHBQVVhncndRWnFpb1NOUFZrRHZKeHI0MjYrZ05G?=
 =?utf-8?B?a0M3aXJnTlpHd1piWnBSNzZGUCttQisyYzdqUVZUc3RnNlNJYTVYdEMxWVp2?=
 =?utf-8?B?MVROTlhhSmJ6Z1JYUmVURzFaNnVRKy9jeVZBYXoxTTRBN3BCTk9udWtIcWJP?=
 =?utf-8?B?Tis3Z005Qzh2U1YzNmQzcDQrNmF0Y01pZHgxa3N3eXhERUlkd0NhQzc2VEZL?=
 =?utf-8?B?dHQ4UDRoajRKYWdPODJrQjkzV1JjaEVNNkdSWGQwUlZyeWVQZUFyeFNHSVZE?=
 =?utf-8?B?YUk4ZFR1Z01pTkNkM2FETWpITXlib3VUWnRMWnI1Y1pRMGJ1L0t2NFJqSlRs?=
 =?utf-8?B?blJGekFLVHBmdEZ4TnNsYVE0cDkrSTFSbENlRCtJNE9sNnpZeGlHam95RUlz?=
 =?utf-8?B?SmZQeTF6RzVOaEtyNW5Hb0FPZU9WZVo2cWhUYUZxSUlQdmh0dEFhRHpPTkto?=
 =?utf-8?B?d3R2L29oUEo3aUEvYldYKzFlSnBsZmlzN1IzVHFhbUF0c2xkTU9oU0RUTXNo?=
 =?utf-8?B?b2UzdEpGZUZ4OUNCQ1o2bnpRSXNVMituWXhoOE53YnZvSmxGdWxIdGs2enl3?=
 =?utf-8?B?aTUwdXUvWSt2SXNMaklsSC9PSmhpZnEvdUttVHlJekhndUQrcHVQaGpicWVa?=
 =?utf-8?B?N1Z5YUpMbHkzRDF5MDVvcjRncDVaMEtBbkRiM2xLeTNBRWlwdlVFRmR6MVIz?=
 =?utf-8?B?NGZtalJZUHF0M3R5Rm5XRkZvUDhYWG1JbldQNFdRa2VvQ1M0M29zTFlveWpO?=
 =?utf-8?B?NnFWNVI4VUN2aHpYL093bU0rMEdNdUlJakhlY0xDZFp2RkZjUHUrL2dMTzZx?=
 =?utf-8?B?TG1XNmNwQnJaZGtwang4R25oV21Rc0R4Vi81MU5kYW9xYzNmUHNQR2Ywa25y?=
 =?utf-8?B?VjRiK3g1WHYyaEU4RFM5Sy9XdHYwSEFWTzMydlhPbG8xc0JaOFl3MXFXc0xi?=
 =?utf-8?B?YkdYUVZ2RGtiR3F4MWpYeElxTTlzb2VzYVlTNUdKZHgzTEQ5MWcwazFUN3BU?=
 =?utf-8?B?L3RiUGtEMzR1Qm9pamU5Mi91eFd3a1NNRjEyMWliL09KUkN4WGJDK21WVmpP?=
 =?utf-8?B?UXp0MldCWERibXhtMGVrWFlwYkpqY2E5WFlrWDJoSldrRlRPSCt5K3h6ZkxI?=
 =?utf-8?B?WDJ1UXpNQ05MVEp3Vmo1VHZ2c25xdUNsVitDbkVjbXV4Q1dMNzdnVXByWXVj?=
 =?utf-8?B?b1A4V0FHNmpPZnFPcXFxUzFPazhTcjdFWFRYZ3YyMEpoNUhNTGN0OTVyVFd2?=
 =?utf-8?B?djNGMGI3VHJ5eUE4RXB0ZjBNMnprUzl3R0EvbjJIcG0xRVUxei8ySTBXUjVZ?=
 =?utf-8?B?V0hpS2lHYWlZRHR2bTF0Nmk5MGZoVWRNVVJtcnZxY1NsaVZMQ1BZR1A1YWE4?=
 =?utf-8?B?aU1EZHN2SVRVamZENVB1WWRuWlA5MmMzUHovYVFtSS9zOERNUDJkYnVYYUYx?=
 =?utf-8?B?YmJqT1g2eG1kN1N1MXMwM201dUZRSnRqUlA3ZE9waWgyK1ducG1sbWhiSTB0?=
 =?utf-8?B?RUdkVjBTSnFsVUNJQ0pKQ0E1TDR6Yk9FRW8xNXcwNjR4U0E2QlNTVk43OTZq?=
 =?utf-8?B?L0ZPNFRnNjVycHMvV2hDZUMrd21oV0g4eXdPSEpyK2lVb0tmK3BINnV0Yi9l?=
 =?utf-8?B?N0c0TW5VOXJmRGJZOW1jT0gyKzdEdDcwdXZGYVVISDdLWEJ1N093ZTdvdEdt?=
 =?utf-8?B?K3VPWFZXRDJEQkk3WWpKVDRFZnR3bUVSNjh4YkpNTUVpMFY4UlFaZktnNTFK?=
 =?utf-8?B?Q09kMlI2SmlCNDR0R2xZQUUxSm43RFZUajg0UjFNUzNkSWxhMUtsSXhOSGxl?=
 =?utf-8?B?Z1FMY3VLek5TcHEyaU9XV0thNTNQMVlHdUlUTnY2TDRBVUFxWC9DSFlyeCtO?=
 =?utf-8?B?bVlMVHZvZ3FqQmU3cnJtbER2V1IwekdhMzhVeFRCWEJZODcxOFZSZTI4M0dz?=
 =?utf-8?B?QlBnRFZxb2RnUEcwT2JMaHEvVlNYazhkVjVWb21nRVJTSEY4d01tVXdXdkdK?=
 =?utf-8?B?MWhic3J4VGs4Q2UweUhKUStjQU80TDNtQnUyZ2RSZ2xxOXVDWjdsaFNpV25Y?=
 =?utf-8?B?cERZZWxVaFZ3U3E3TTZURnFRQk01ZTNweFZjUks3WXRtK2Y4MVRVRUFMVTBj?=
 =?utf-8?Q?0fC8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161bf3fd-bd7d-46aa-b0a4-08dcaa57726c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 14:06:14.1368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3irhqlITD3o7Rdbz0Zu2lJl7j3vN2ZAViEu4hPIZqhKf1lhR+BOHJZPPnK8i6et
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5769
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

Am 22.07.24 um 15:52 schrieb Tvrtko Ursulin:
>
> On 19/07/2024 16:18, Christian König wrote:
>> Am 19.07.24 um 15:02 schrieb Christian König:
>>> Am 19.07.24 um 11:47 schrieb Tvrtko Ursulin:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Long time ago in commit b3ac17667f11 ("drm/scheduler: rework entity
>>>> creation") a change was made which prevented priority changes for 
>>>> entities
>>>> with only one assigned scheduler.
>>>>
>>>> The commit reduced drm_sched_entity_set_priority() to simply update 
>>>> the
>>>> entities priority, but the run queue selection logic in
>>>> drm_sched_entity_select_rq() was never able to actually change the
>>>> originally assigned run queue.
>>>>
>>>> In practice that only affected amdgpu, being the only driver which 
>>>> can do
>>>> dynamic priority changes. And that appears was attempted to be 
>>>> rectified
>>>> there in 2316a86bde49 ("drm/amdgpu: change hw sched list on ctx 
>>>> priority
>>>> override").
>>>>
>>>> A few unresolved problems however were that this only fixed
>>>> drm_sched_entity_set_priority() *if* 
>>>> drm_sched_entity_modify_sched() was
>>>> called first. That was not documented anywhere.
>>>>
>>>> Secondly, this only works if drm_sched_entity_modify_sched() is 
>>>> actually
>>>> called, which in amdgpu's case today is true only for gfx and compute.
>>>> Priority changes for other engines with only one scheduler 
>>>> assigned, such
>>>> as jpeg and video decode will still not work.
>>>>
>>>> Note that this was also noticed in 981b04d96856 ("drm/sched: 
>>>> improve docs
>>>> around drm_sched_entity").
>>>>
>>>> Completely different set of non-obvious confusion was that whereas
>>>> drm_sched_entity_init() was not keeping the passed in list of 
>>>> schedulers
>>>> (courtesy of 8c23056bdc7a ("drm/scheduler: do not keep a copy of sched
>>>> list")), drm_sched_entity_modify_sched() was disagreeing with that and
>>>> would simply assign the single item list.
>>>>
>>>> That incosistency appears to be semi-silently fixed in ac4eb83ab255
>>>> ("drm/sched: select new rq even if there is only one v3").
>>>>
>>>> What was also not documented is why it was important to not keep the
>>>> list of schedulers when there is only one. I suspect it could have
>>>> something to do with the fact the passed in array is on stack for many
>>>> callers with just one scheduler. With more than one scheduler 
>>>> amdgpu is
>>>> the only caller, and there the container is not on the stack. 
>>>> Keeping a
>>>> stack backed list in the entity would obviously be undefined behaviour
>>>> *if* the list was kept.
>>>>
>>>> Amdgpu however did only stop passing in stack backed container for 
>>>> the more
>>>> than one scheduler case in 977f7e1068be ("drm/amdgpu: allocate 
>>>> entities on
>>>> demand"). Until then I suspect dereferencing freed stack from
>>>> drm_sched_entity_select_rq() was still present.
>>>>
>>>> In order to untangle all that and fix priority changes this patch is
>>>> bringing back the entity owned container for storing the passed in
>>>> scheduler list.
>>>
>>> Please don't. That makes the mess just more horrible.
>>>
>>> The background of not keeping the array is to intentionally prevent 
>>> the priority override from working.
>>>
>>> The bug is rather that adding drm_sched_entity_modify_sched() messed 
>>> this up.
>>
>> To give more background: Amdgpu has two different ways of handling 
>> priority:
>> 1. The priority in the DRM scheduler.
>> 2. Different HW rings with different priorities.
>>
>> Your analysis is correct that drm_sched_entity_init() initially 
>> dropped the scheduler list to avoid using a stack allocated list, and 
>> that functionality is still used in amdgpu_ctx_init_entity() for 
>> example.
>>
>> Setting the scheduler priority was basically just a workaround 
>> because we didn't had the hw priorities at that time. Since that is 
>> no longer the case I suggest to just completely drop the 
>> drm_sched_entity_set_priority() function instead.
>
> Removing drm_sched_entity_set_priority() is one thing, but we also 
> need to clear up the sched_list container ownership issue. It is 
> neither documented, nor robustly handled in the code. The "num_scheds 
> == 1" special casing throughout IMHO has to go too.

I disagree. Keeping the scheduler list in the entity is only useful for 
load balancing.

As long as only one scheduler is provided and we don't load balance the 
entity doesn't needs the scheduler list in the first place.

> Another thing if you want to get rid of frontend priority handling is 
> to stop configuring scheduler instances with DRM_SCHED_PRIORITY_COUNT 
> priority levels, to avoid wasting memory on pointless run queues.

I would rather like to completely drop the RR with the runlists 
altogether and keep only the FIFO approach around. This way priority can 
be implemented by boosting the score of submissions by a certain degree.

>
> And final thing is to check whether the locking in 
> drm_sched_entity_modify_sched() is okay. Because according to kerneldoc:
>
>  * Note that this must be called under the same common lock for 
> @entity as
>  * drm_sched_job_arm() and drm_sched_entity_push_job(), or the driver 
> needs to
>  * guarantee through some other means that this is never called while 
> new jobs
>  * can be pushed to @entity.
>
> I don't see that is the case. Priority override is under 
> amdgpu_ctx_mgr->lock, while job arm and push appear not. I also cannot 
> spot anything else preventing amdgpu_sched_ioctl() running in parallel 
> to everything else.

Yeah that's certainly incorrect as well. drm_sched_entity_modify_sched() 
should grab entity->rq_lock instead.

>
>> In general scheduler priorities were meant to be used for things like 
>> kernel queues which would always have higher priority than user space 
>> submissions and using them for userspace turned out to be not such a 
>> good idea.
>
> Out of curiousity what were the problems? I cannot think of anything 
> fundamental since there are priorities at the backend level after all, 
> just fewer levels.

A higher level queue can starve lower level queues to the point that 
they never get a chance to get anything running.

This basically means that userspace gets a chance to submit infinity 
fences with all the bad consequences.

>
> I mean one problem unrelated to this discussion is this:
>
> void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> {
>     struct dma_fence *fence;
>     struct drm_gpu_scheduler *sched;
>     struct drm_sched_rq *rq;
>
>     /* queue non-empty, stay on the same engine */
>     if (spsc_queue_count(&entity->job_queue))
>         return;
>
> Which makes it look like the entity with a constant trickle of jobs 
> will never actually manage to change it's run queue. Neither today, 
> nor after the potential drm_sched_entity_set_priority() removal.

That's intentional and based on how the scheduler load balancing works.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>> Regards,
>>> Christian.
>>>
>>>
>>>> Container is now owned by the entity and the pointers are
>>>> owned by the drivers. List of schedulers is always kept including 
>>>> for the
>>>> one scheduler case.
>>>>
>>>> The patch can therefore also removes the single scheduler special 
>>>> case,
>>>> which means that priority changes should now work (be able to 
>>>> change the
>>>> selected run-queue) for all drivers and engines. In other words
>>>> drm_sched_entity_set_priority() should now just work for all cases.
>>>>
>>>> To enable maintaining its own container some API calls needed to 
>>>> grow a
>>>> capability for returning success/failure, which is a change which
>>>> percolates mostly through amdgpu source.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Fixes: b3ac17667f11 ("drm/scheduler: rework entity creation")
>>>> References: 8c23056bdc7a ("drm/scheduler: do not keep a copy of 
>>>> sched list")
>>>> References: 977f7e1068be ("drm/amdgpu: allocate entities on demand")
>>>> References: 2316a86bde49 ("drm/amdgpu: change hw sched list on ctx 
>>>> priority override")
>>>> References: ac4eb83ab255 ("drm/sched: select new rq even if there 
>>>> is only one v3")
>>>> References: 981b04d96856 ("drm/sched: improve docs around 
>>>> drm_sched_entity")
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: amd-gfx@lists.freedesktop.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: <stable@vger.kernel.org> # v5.6+
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   | 31 +++++---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h   |  2 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 13 +--
>>>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c   |  3 +-
>>>>   drivers/gpu/drm/scheduler/sched_entity.c  | 96 
>>>> ++++++++++++++++-------
>>>>   include/drm/gpu_scheduler.h               | 16 ++--
>>>>   6 files changed, 100 insertions(+), 61 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>>> index 5cb33ac99f70..387247f8307e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>>> @@ -802,15 +802,15 @@ struct dma_fence *amdgpu_ctx_get_fence(struct 
>>>> amdgpu_ctx *ctx,
>>>>       return fence;
>>>>   }
>>>>   -static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
>>>> -                       struct amdgpu_ctx_entity *aentity,
>>>> -                       int hw_ip,
>>>> -                       int32_t priority)
>>>> +static int amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
>>>> +                      struct amdgpu_ctx_entity *aentity,
>>>> +                      int hw_ip,
>>>> +                      int32_t priority)
>>>>   {
>>>>       struct amdgpu_device *adev = ctx->mgr->adev;
>>>> -    unsigned int hw_prio;
>>>>       struct drm_gpu_scheduler **scheds = NULL;
>>>> -    unsigned num_scheds;
>>>> +    unsigned int hw_prio, num_scheds;
>>>> +    int ret = 0;
>>>>         /* set sw priority */
>>>>       drm_sched_entity_set_priority(&aentity->entity,
>>>> @@ -822,16 +822,18 @@ static void 
>>>> amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
>>>>           hw_prio = array_index_nospec(hw_prio, AMDGPU_RING_PRIO_MAX);
>>>>           scheds = adev->gpu_sched[hw_ip][hw_prio].sched;
>>>>           num_scheds = adev->gpu_sched[hw_ip][hw_prio].num_scheds;
>>>> - drm_sched_entity_modify_sched(&aentity->entity, scheds,
>>>> -                          num_scheds);
>>>> +        ret = drm_sched_entity_modify_sched(&aentity->entity, scheds,
>>>> +                            num_scheds);
>>>>       }
>>>> +
>>>> +    return ret;
>>>>   }
>>>>   -void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
>>>> -                  int32_t priority)
>>>> +int amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t 
>>>> priority)
>>>>   {
>>>>       int32_t ctx_prio;
>>>>       unsigned i, j;
>>>> +    int ret;
>>>>         ctx->override_priority = priority;
>>>>   @@ -842,10 +844,15 @@ void amdgpu_ctx_priority_override(struct 
>>>> amdgpu_ctx *ctx,
>>>>               if (!ctx->entities[i][j])
>>>>                   continue;
>>>>   -            amdgpu_ctx_set_entity_priority(ctx, 
>>>> ctx->entities[i][j],
>>>> -                               i, ctx_prio);
>>>> +            ret = amdgpu_ctx_set_entity_priority(ctx,
>>>> +                                 ctx->entities[i][j],
>>>> +                                 i, ctx_prio);
>>>> +            if (ret)
>>>> +                return ret;
>>>>           }
>>>>       }
>>>> +
>>>> +    return 0;
>>>>   }
>>>>     int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>>> index 85376baaa92f..835661515e33 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>>> @@ -82,7 +82,7 @@ struct dma_fence *amdgpu_ctx_get_fence(struct 
>>>> amdgpu_ctx *ctx,
>>>>                          struct drm_sched_entity *entity,
>>>>                          uint64_t seq);
>>>>   bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
>>>> -void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t 
>>>> ctx_prio);
>>>> +int amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t 
>>>> ctx_prio);
>>>>     int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
>>>>                struct drm_file *filp);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
>>>> index 863b2a34b2d6..944edb7f00a2 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
>>>> @@ -54,12 +54,15 @@ static int 
>>>> amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
>>>>         mgr = &fpriv->ctx_mgr;
>>>>       mutex_lock(&mgr->lock);
>>>> -    idr_for_each_entry(&mgr->ctx_handles, ctx, id)
>>>> -        amdgpu_ctx_priority_override(ctx, priority);
>>>> +    idr_for_each_entry(&mgr->ctx_handles, ctx, id) {
>>>> +        r = amdgpu_ctx_priority_override(ctx, priority);
>>>> +        if (r)
>>>> +            break;
>>>> +    }
>>>>       mutex_unlock(&mgr->lock);
>>>>         fdput(f);
>>>> -    return 0;
>>>> +    return r;
>>>>   }
>>>>     static int amdgpu_sched_context_priority_override(struct 
>>>> amdgpu_device *adev,
>>>> @@ -88,11 +91,11 @@ static int 
>>>> amdgpu_sched_context_priority_override(struct amdgpu_device *adev,
>>>>           return -EINVAL;
>>>>       }
>>>>   -    amdgpu_ctx_priority_override(ctx, priority);
>>>> +    r = amdgpu_ctx_priority_override(ctx, priority);
>>>>       amdgpu_ctx_put(ctx);
>>>>       fdput(f);
>>>>   -    return 0;
>>>> +    return r;
>>>>   }
>>>>     int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>>>> index 81fb99729f37..2453decc73c7 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>>>> @@ -1362,8 +1362,7 @@ static int vcn_v4_0_5_limit_sched(struct 
>>>> amdgpu_cs_parser *p,
>>>>         scheds = p->adev->gpu_sched[AMDGPU_HW_IP_VCN_ENC]
>>>>           [AMDGPU_RING_PRIO_0].sched;
>>>> -    drm_sched_entity_modify_sched(job->base.entity, scheds, 1);
>>>> -    return 0;
>>>> +    return drm_sched_entity_modify_sched(job->base.entity, scheds, 
>>>> 1);
>>>>   }
>>>>     static int vcn_v4_0_5_dec_msg(struct amdgpu_cs_parser *p, 
>>>> struct amdgpu_job *job,
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 58c8161289fe..cb5cc65f461d 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -45,7 +45,12 @@
>>>>    * @guilty: atomic_t set to 1 when a job on this queue
>>>>    *          is found to be guilty causing a timeout
>>>>    *
>>>> - * Note that the &sched_list must have at least one element to 
>>>> schedule the entity.
>>>> + * Note that the &sched_list must have at least one element to 
>>>> schedule the
>>>> + * entity.
>>>> + *
>>>> + * The individual drm_gpu_scheduler pointers have borrow 
>>>> semantics, ie.
>>>> + * they must remain valid during entities lifetime, while the 
>>>> containing
>>>> + * array can be freed after this call returns.
>>>>    *
>>>>    * For changing @priority later on at runtime see
>>>>    * drm_sched_entity_set_priority(). For changing the set of 
>>>> schedulers
>>>> @@ -69,27 +74,24 @@ int drm_sched_entity_init(struct 
>>>> drm_sched_entity *entity,
>>>>       INIT_LIST_HEAD(&entity->list);
>>>>       entity->rq = NULL;
>>>>       entity->guilty = guilty;
>>>> -    entity->num_sched_list = num_sched_list;
>>>>       entity->priority = priority;
>>>> -    /*
>>>> -     * It's perfectly valid to initialize an entity without having 
>>>> a valid
>>>> -     * scheduler attached. It's just not valid to use the 
>>>> scheduler before it
>>>> -     * is initialized itself.
>>>> -     */
>>>> -    entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>>       RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>>       RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>   -    if (num_sched_list && !sched_list[0]->sched_rq) {
>>>> -        /* Since every entry covered by num_sched_list
>>>> -         * should be non-NULL and therefore we warn drivers
>>>> -         * not to do this and to fix their DRM calling order.
>>>> -         */
>>>> -        pr_warn("%s: called with uninitialized scheduler\n", 
>>>> __func__);
>>>> -    } else if (num_sched_list) {
>>>> -        /* The "priority" of an entity cannot exceed the number of 
>>>> run-queues of a
>>>> -         * scheduler. Protect against num_rqs being 0, by 
>>>> converting to signed. Choose
>>>> -         * the lowest priority available.
>>>> +    if (num_sched_list) {
>>>> +        int ret;
>>>> +
>>>> +        ret = drm_sched_entity_modify_sched(entity,
>>>> +                            sched_list,
>>>> +                            num_sched_list);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +
>>>> +        /*
>>>> +         * The "priority" of an entity cannot exceed the number of
>>>> +         * run-queues of a scheduler. Protect against num_rqs 
>>>> being 0,
>>>> +         * by converting to signed. Choose the lowest priority
>>>> +         * available.
>>>>            */
>>>>           if (entity->priority >= sched_list[0]->num_rqs) {
>>>>               drm_err(sched_list[0], "entity with out-of-bounds 
>>>> priority:%u num_rqs:%u\n",
>>>> @@ -122,19 +124,58 @@ EXPORT_SYMBOL(drm_sched_entity_init);
>>>>    *         existing entity->sched_list
>>>>    * @num_sched_list: number of drm sched in sched_list
>>>>    *
>>>> + * The individual drm_gpu_scheduler pointers have borrow 
>>>> semantics, ie.
>>>> + * they must remain valid during entities lifetime, while the 
>>>> containing
>>>> + * array can be freed after this call returns.
>>>> + *
>>>>    * Note that this must be called under the same common lock for 
>>>> @entity as
>>>>    * drm_sched_job_arm() and drm_sched_entity_push_job(), or the 
>>>> driver needs to
>>>>    * guarantee through some other means that this is never called 
>>>> while new jobs
>>>>    * can be pushed to @entity.
>>>> + *
>>>> + * Returns zero on success and a negative error code on failure.
>>>>    */
>>>> -void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>> -                    struct drm_gpu_scheduler **sched_list,
>>>> -                    unsigned int num_sched_list)
>>>> +int drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>> +                  struct drm_gpu_scheduler **sched_list,
>>>> +                  unsigned int num_sched_list)
>>>>   {
>>>> -    WARN_ON(!num_sched_list || !sched_list);
>>>> +    struct drm_gpu_scheduler **new, **old;
>>>> +    unsigned int i;
>>>>   -    entity->sched_list = sched_list;
>>>> +    if (!(entity && sched_list && (num_sched_list == 0 || 
>>>> sched_list[0])))
>>>> +        return -EINVAL;
>>>> +
>>>> +    /*
>>>> +     * It's perfectly valid to initialize an entity without having 
>>>> a valid
>>>> +     * scheduler attached. It's just not valid to use the 
>>>> scheduler before
>>>> +     * it is initialized itself.
>>>> +     *
>>>> +     * Since every entry covered by num_sched_list should be 
>>>> non-NULL and
>>>> +     * therefore we warn drivers not to do this and to fix their 
>>>> DRM calling
>>>> +     * order.
>>>> +     */
>>>> +    for (i = 0; i < num_sched_list; i++) {
>>>> +        if (!sched_list[i]) {
>>>> +            pr_warn("%s: called with uninitialized scheduler %u!\n",
>>>> +                __func__, i);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    new = kmemdup_array(sched_list,
>>>> +                num_sched_list,
>>>> +                sizeof(*sched_list),
>>>> +                GFP_KERNEL);
>>>> +    if (!new)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    old = entity->sched_list;
>>>> +    entity->sched_list = new;
>>>>       entity->num_sched_list = num_sched_list;
>>>> +
>>>> +    kfree(old);
>>>> +
>>>> +    return 0;
>>>>   }
>>>>   EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>>>   @@ -341,6 +382,8 @@ void drm_sched_entity_fini(struct 
>>>> drm_sched_entity *entity)
>>>> dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>>>>       RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>> +
>>>> +    kfree(entity->sched_list);
>>>>   }
>>>>   EXPORT_SYMBOL(drm_sched_entity_fini);
>>>>   @@ -531,10 +574,6 @@ void drm_sched_entity_select_rq(struct 
>>>> drm_sched_entity *entity)
>>>>       struct drm_gpu_scheduler *sched;
>>>>       struct drm_sched_rq *rq;
>>>>   -    /* single possible engine and already selected */
>>>> -    if (!entity->sched_list)
>>>> -        return;
>>>> -
>>>>       /* queue non-empty, stay on the same engine */
>>>>       if (spsc_queue_count(&entity->job_queue))
>>>>           return;
>>>> @@ -561,9 +600,6 @@ void drm_sched_entity_select_rq(struct 
>>>> drm_sched_entity *entity)
>>>>           entity->rq = rq;
>>>>       }
>>>>       spin_unlock(&entity->rq_lock);
>>>> -
>>>> -    if (entity->num_sched_list == 1)
>>>> -        entity->sched_list = NULL;
>>>>   }
>>>>     /**
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index 5acc64954a88..09e1d063a5c0 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -110,18 +110,12 @@ struct drm_sched_entity {
>>>>       /**
>>>>        * @sched_list:
>>>>        *
>>>> -     * A list of schedulers (struct drm_gpu_scheduler). Jobs from 
>>>> this entity can
>>>> -     * be scheduled on any scheduler on this list.
>>>> +     * A list of schedulers (struct drm_gpu_scheduler). Jobs from 
>>>> this
>>>> +     * entity can be scheduled on any scheduler on this list.
>>>>        *
>>>>        * This can be modified by calling 
>>>> drm_sched_entity_modify_sched().
>>>>        * Locking is entirely up to the driver, see the above 
>>>> function for more
>>>>        * details.
>>>> -     *
>>>> -     * This will be set to NULL if &num_sched_list equals 1 and 
>>>> @rq has been
>>>> -     * set already.
>>>> -     *
>>>> -     * FIXME: This means priority changes through
>>>> -     * drm_sched_entity_set_priority() will be lost henceforth in 
>>>> this case.
>>>>        */
>>>>       struct drm_gpu_scheduler        **sched_list;
>>>>   @@ -568,9 +562,9 @@ int 
>>>> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>>                           bool write);
>>>>     -void drm_sched_entity_modify_sched(struct drm_sched_entity 
>>>> *entity,
>>>> -                    struct drm_gpu_scheduler **sched_list,
>>>> -                                   unsigned int num_sched_list);
>>>> +int drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>> +                  struct drm_gpu_scheduler **sched_list,
>>>> +                  unsigned int num_sched_list);
>>>>     void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>>>>   void drm_sched_job_cleanup(struct drm_sched_job *job);
>>>
>>

