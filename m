Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CBBC85699
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9C710E406;
	Tue, 25 Nov 2025 14:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hGDihOgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46E310E406
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeaW1BQP3rXcBIWq6tPDwdcupRvWSO44kzP1ihrXXafHLqaNA6Pkyp/i7NX8/YyQY92L2mKkYfsoygs8OREq/m2SLBjEV9yJpJUFQXch+vWBYZjACchjGYL46V1EB3pJ5MBBz/QXza5/hzYIJdNXds2K3iyDlmoWLua1g0KWeiUCCqXxKnmDajxpaJddiG5fegYTymAVfI5XmMQeeL6Xnhwb4BbdWFw7JT4tdx9nh+c/BIe1zj9v0Fl5vhGbiQre+y7neaynprxGzCxL54DodEJE1FR/wDGQctwRTVGWamKgyyx9/1BvN65UyjtEp7jjUW/d7JeAIgjNH3o7P3KKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt4tPt206CC/c3+YUIJTMi5iA1H4Wtm/QkEW1gaEbp4=;
 b=Pn6W/Qfzk1jpRtEU0eIQ74Ldz6G/d6T1sPyNf5Df74QinoItL+gmrYin/tWdu3g2BdCnJPFguQbIFJfNlmectejitqDFiA265w7A25MY1HiE/4V5pvxsoKCwtoO6glKaSdiieqlTP/43DGJYMuAl9JFa/9PfgFsnX4/4/BYR10vaZGX15VDbIC/TQ5BS2dvSDh3Og8lZwIM9u0Qvz+xIRyMar7l4+7GsFhBxsRufvwfwdo0Eym82otym4zjtkePU337+R80ve3n7uyWzF9KQV/q3JMOHqYrvUlx9mA4+ATQ80zIM4vKzrxDnfMLKqo/rVTR6mpqOCF7igW01K1rH6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt4tPt206CC/c3+YUIJTMi5iA1H4Wtm/QkEW1gaEbp4=;
 b=hGDihOgcIlTHVGBjX5YBMjdqm6l4y+xiX6NFMvvAEuRecGZJ6ZD6SHjcMeG6NlTfWLgdgMzYPj3cbTdPeTsIphXixLJqTMqBzEmmgyl/ac16Y1rJ4ttvu5sJwpKl992AIleR7ekAcW0+wT7DyMbryYJAwLv21SMmgaiAgLjT/X8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5837.namprd12.prod.outlook.com (2603:10b6:8:78::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.12; Tue, 25 Nov 2025 14:26:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 14:26:45 +0000
Message-ID: <52d484c5-6dfb-4e2f-9caa-a61cf1d94801@amd.com>
Date: Tue, 25 Nov 2025 15:26:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum signaling
 timeout
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
 <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
 <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:408:fc::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ef1289-7eed-4f26-d733-08de2c2ea8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0tmMDd2SU9oRUNNejR4a1g4bktaWUo2cHY1ckhLSmNCcGdCT0U4SGpEYzNY?=
 =?utf-8?B?ZmVhNmk1U21aYWcrbFh4TGNaK1NxT0VqTjIzeTBOSFlta21FRnF6UmF3UGFp?=
 =?utf-8?B?TG5pUlNvZk5aTmlWcXBSUnJKRWRVRzMwdmV3WmluTmJVd21mTGhrM2RqMUxY?=
 =?utf-8?B?RFZ0eDRvUmRqaDNkaWxNZjBsR1hxQldvanZmOWxBL1JnQ3pab2xRYWJRSldj?=
 =?utf-8?B?SFlNQXlvLzUyVkRkV3JkRU4xQ1FpQmFpYmo0eGgxc3YwZjRZbTFOdnpyWUdK?=
 =?utf-8?B?eVNhamRncjNBcnVtdm1Kbncxd3luOCswNkdZUkdnL2dkMWZlQnBEWDFpakI5?=
 =?utf-8?B?eDJrQkpjeE5GRjhnQ3dtNWZjNENGcWRrOVErUEgzRDlrUWw0V1JqZnNiZ2xl?=
 =?utf-8?B?ckZuYm9hR2ljMnJlSXJnNktSOVBiL3NwTEJibTArTWlIMktJdTc4NTRPYzlH?=
 =?utf-8?B?NTdRZE9wbmpaNkpCcU5HYS9BMnZwdUVwcDVxU1ZkVWdBMzlKWElLM1ZIeDM3?=
 =?utf-8?B?TG1XU2VpYkRxK2dHdWNGT2JvM1VhQjg3Q0FReWRPWXdvUUcrV0hjcVU4eTFS?=
 =?utf-8?B?RmpEQzdFNHU4Z21WVDhnZjNqWFZiWVNYYStGekVMZ2FmeDc3YWJ1dWhOQlUv?=
 =?utf-8?B?Qkt2d1IzcXJtc2R5LzBoTVZ6dktLNmNmK3pCdnhpcFRvUm9Qa0Z5LzN0TUxj?=
 =?utf-8?B?bWlmQ08vRyt1NlAzTEtqK0wxbk41aGlrc3hzWVJ1a3V3cDdoRGVqelNjYnA4?=
 =?utf-8?B?RVkzTTduTGpLR1E2MVF2UHNwOUV1eldNRGg5c29nbXNSRERtaTc1dTVudFAz?=
 =?utf-8?B?MXlFa3BpWFE4TDFwTXNzSytQeDAyR0pyUzZ1Q2lmNWVsU0VHNjd0cUY3NW8v?=
 =?utf-8?B?WHl1amZwN24xZkM3cWliSUJ0SkRuMHhUYWtCMHFnSTNCbXU3dmFDaXQ5aUhW?=
 =?utf-8?B?UGI3VGNWazBrdVdJUzZmM2pMWGVMdHQvOFVMMGRQT1UwWjI5c0U4R0M2TjBj?=
 =?utf-8?B?WE0rMU1pVUVWOEFBNWF0eklHNzk1TGJ6UHVPRTdsdTZiRGxRSlNpRkxHZDg2?=
 =?utf-8?B?SmZZUDhMTnQ2ZW81ZlNseUxCMEp3RXlsTTNDejRSbGk1VlAxZUZIdWZJY1pl?=
 =?utf-8?B?dWkweVYrY2JRdUJEL2FBR3pNTSt5a3h4R0pGdTdhMWppQ1NNdTU4bGh0SXJh?=
 =?utf-8?B?cUdQckVZTE9sbWZVa1VmSjhGZFdNYjhWdklzTmZJYUQrWFhIV3lYWFM5aGFX?=
 =?utf-8?B?OU4zRHhqM0lsV0ZobzFyOU1rakc2Q0Vod0ZSeUZkaExjcm43aXNFQStKWGRm?=
 =?utf-8?B?YUFPR24vMzNPOU1JQ1ZCaTlYMTVVSW5WQVVndTR6VGw0dWhSUkpQcFRMQm81?=
 =?utf-8?B?R3VlYnV5amhHZVhQaER5NUIrWXRueE13RFFGQ0o1dWRQR3B4UE51TmYwY0Z0?=
 =?utf-8?B?ZGpPNDBkNys1b0ZIOGg3VDBPVnk4VCtYWHVhNzcwakpTYTVsdWhxWkNKZFRS?=
 =?utf-8?B?QTQ0QkN1amtCUDJmenU2Q3R4WDFpcVN5UWtoMGhRZTF2M1dIMjh1c2dWcUxl?=
 =?utf-8?B?RGJIN2swZ1FzRmRoZTRxSmtTc3dNempuSEJGOE9mb2RBVnN0b24vbXlCK2ow?=
 =?utf-8?B?aEtMUEI4a2FFY2Vpb3ZaTjR5MWJhcmZUQjJOeWVTMWtYOFBuUlNBTkROQzNJ?=
 =?utf-8?B?d2Y5RXAzSmpGZlA0Qy85bHZUMHRpS1RJZ2ZmOHpSNmtRd0Z6R2xKT09KRmRC?=
 =?utf-8?B?YmliWCs2MlVaTHMzZ2JzS2MvVW96Q1BMeU9KbjJNY1ZuajNmeElGRGVMaUlT?=
 =?utf-8?B?SklTdUE3ZnptbGZ4RkdEd0M1RDZLZWNGM3lUZlRTQjdWRFhlb3dxWUhzaWFB?=
 =?utf-8?B?SWs3Tmg1WHdwZFkrRjA1MHJVaUFXVXRNWjUwZ3B3VnhBdlNaWXpydmcxOFdF?=
 =?utf-8?Q?vnJxLljBbCBt5zZI2KXvoN1AelmazKEr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skw2ajQvb1ljVS9iNHlPSWNwUHR2MDZ2b1BTL2FNUnhKSzZOVHZpSHFJK0VX?=
 =?utf-8?B?amRxeUZQdlI4UC9LNDRBeXZabUZKT0hlTG1TUURxc0lqbUJvdHQwd2NXc3Z6?=
 =?utf-8?B?bnJuOThwbHk1K08zRUZiaC9rM0hVMjJUVFR5ek5NYndaRXN5Q0J3QUtTRVJ2?=
 =?utf-8?B?eXJkd1ZmM01aT0NpaVc3N01GOHVvSXNpQ1BZRDFVU0QyYURYQXM5Rkx5ZUg1?=
 =?utf-8?B?T1VwK2U2bVFNYittVmRZa3pZbCtBNlQxSzNqWUVaMHBwcVA1TXVNZndnVXNn?=
 =?utf-8?B?a2FwN2M0dTIvcnN1NGVtZVVuUFp4OWFDemZ6QlJnZTg5SlFZYzI2RTFVL2ZM?=
 =?utf-8?B?Z0pzdDQ2QkdQS3hMWTBvb1R5em1tVzRoNVZXdTRaamhGQUpYTE5NNUltaUJ0?=
 =?utf-8?B?K01weXE3WXdnak40WGZybllUL24xWTJ5aWhtTmRYajFIeVVvd08wZDFWQ1BT?=
 =?utf-8?B?eGxqMHlPb0JkM0pCZEhMN1R4aXY5bVN0SkE5RkhBdWUxRWRReUI5VFBlcC9y?=
 =?utf-8?B?aDI3bys1Q1A0RllqVUJzNWN2Z3FwTE9zOWRNaGJWYzVMZThjR28xS01kdkdi?=
 =?utf-8?B?RWpWS0pCaUxIcXY1YTJNbEtwcmdXcFZzUG14NTdyK2Z0YWJVTXRrYXB2ZE1x?=
 =?utf-8?B?THVIMEJKM09PclMyT201YUNBVTE3cnNaMkVaMGt4cWcrQlF5MDdDRGl4dmFK?=
 =?utf-8?B?WnNWVHdqMldsYVdHOVdvZWQxbzlpTkFmeEZrWk9YRW40RS9KQ3E5WEdpelNt?=
 =?utf-8?B?QTZUaHBNdDdjOTUwY2RFVWgwbXJUdy9sbWthK1hBY3pQWml2R3loL3Q4djcw?=
 =?utf-8?B?TXNQU3dzSmdwdmtmdjBhaGQyNGdwRGxHU0tWdVlreVNOSUtaUjFaZmp0UjJQ?=
 =?utf-8?B?SzE4STlEN2k4V3RMMDZYNmNHUjJUd1A5dkVWSCtNRnpXRHR4dzhDU2VKYXlZ?=
 =?utf-8?B?L1JZSitsaVVHQnFpSzlJMVBubVNpUnZmYy9TVnllUWc4eDlMamYwVXlhS2Jx?=
 =?utf-8?B?Ykp2NHNxY3NZdkp2YkpjV0U4MnNmTVBkS2lmeU4wZTZZRzIxcWhuU0V4SG44?=
 =?utf-8?B?bzJtNE1iVnpLVmFLSzNhcmtUTWQvTUZMSDhIQjcwQndIYWZJYU5ubDZtSG15?=
 =?utf-8?B?Z2t2bkkwdVVCSlJUMWc3ZTZQdmVJNG1oMWhpbUpqYjZRVkgwa1FEMkRjNW0x?=
 =?utf-8?B?MllPc1A3eHd2ckQ3cHV3eCtVKzRKWEltVThVTHlSNWM2aGNTamd4LzFKMFBS?=
 =?utf-8?B?WTV5WmhLK0R2Wjc3ZzFLd3c2dzVKSzJvR0tva0U1NTUrZC9ieFdmY1RtOUVx?=
 =?utf-8?B?NFRKRVVGNzgreVE3dUNlSXhzelBFU3h0d1c1dVBRVE1kN1I0QnlHVUdadCts?=
 =?utf-8?B?ZW9xVHprNDlUSHNjczdCMDltZXVNUWEvdEx0M0JxVklFMjIwQ0dydFpuZGtZ?=
 =?utf-8?B?S3kvdlNBbHUvclVkdmwrak11bWJtVUJRclE1TXg5VmdNYk9jWEcvMWdHZkhE?=
 =?utf-8?B?cUlPUEI5RTJVNkFlN2l0NUxYei9JMTNxbHdBWkNlUllDdXZ0QU1YMVk3dEd5?=
 =?utf-8?B?SldVeTlGNUJ5cDV3MGQwZk1Hb3Q5RmszdUNsVHNxMTdhS2JrK0paRjY2ZWQz?=
 =?utf-8?B?NW95TEhMN2xLRDRTRVk5amcxbFVzK2xTdEhzVmE5V3BOOUpzenp0YmxaMkJt?=
 =?utf-8?B?M0dGRlZDU2pBaUx3bGVPSkZOeGtLSHk4cTRDTkhMMGRpZ3dreVFrc3p6S2li?=
 =?utf-8?B?SUNqdDVpT0NTelFqdE9pd2hQemNxTVIvWnExalJZRnk5Zmdpam5Pb3F1RWZB?=
 =?utf-8?B?RERmS25SLzRxbGlOZHVlWlNFOUVjZmJ5WlRNc0s2NGdtTC9NdWJkRGVYM0xH?=
 =?utf-8?B?MWsxYldPb2JsOHlOb01POHlObU5nQlc2cEdWMzlnVmVnQ1RYRUo4WGtwZVZI?=
 =?utf-8?B?akt6SllmRUhZZ216dmtZYWJjM2RiK2M5WFptL1BJdy9rdXhMLzNuRTl0R2x2?=
 =?utf-8?B?MkI0cExKTW9KV3pYYk05aWdqUFVJNVcvalBpSW1xL2dpM2o5UjRQMk51Zldu?=
 =?utf-8?B?cmxLa0JwalB5U2xRWGRPSlhnZ2xDZmVwQk9QRXFoTm1UTEdUZXV1clQ4S0dC?=
 =?utf-8?Q?9HK0pY8ZdNHgfMJp40RwqY1XB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ef1289-7eed-4f26-d733-08de2c2ea8ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:26:44.8908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lveh7gKNX5dN8A9GBKDlNzLh+mIo1OXHJdoFnyaX9ixYhSGc82KPMS7Hgv/WR69F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5837
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

On 11/25/25 11:56, Philipp Stanner wrote:
>>>>
>>>> The GPU scheduler has a very similar define, MAX_WAIT_SCHED_ENTITY_Q_EMPTY which is currently just 1 second.
>>>>
>>>> The real question is what is the maximum amount of time we can wait for the HW before we should trigger a timeout?
>>>
>>> That's a question only the drivers can answer, which is why I like to
>>> think that setting global constants constraining all parties is not the
>>> right thing to do.
>>
>> Exactly that's the reason why I bring that up. I think that drivers should be in charge of timeouts is the wrong approach.
>>
>> See the reason why we have the timeout (and documented that it is a must have) is because we have both core memory management as well a desktop responsiveness depend on it.
> 
> Good and well, but then patch 4 becomes even more problematic:
> 
> So we'd just have drivers fire warnings, and then they would still have
> the freedom to set timeouts for drm/sched, as long as those timeouts
> are smaller than your new global constant.
> 
> Why then not remove drm/sched's timeout parameter API completely and
> always use your maximum value internally in drm/sched? Or maybe
> truncate it with a warning?

I have considered that as well, but then thought that we should at least give end users the possibility to override the timeout while still tainting the kernel so that we know about this in bug reports, core dumps etc...

> "Maximum timeout parameter exceeded, truncating to %ld.\n"
> 
> I suppose some drivers want even higher responsiveness than those 2
> seconds.

As far as I know some medical use cases for example have timeouts like 100-200ms. But again that is the use case and not the driver.

> I do believe that more of the driver folks should be made aware of this
> intended change.

I have no real intention of actually pushing those patches, at least not as they are. I just wanted to kick of some discussion.

>>
>>> What is even your motivation? What problem does this solve? Is the OOM
>>> killer currently hanging for anyone? Can you link a bug report?
>>
>> I'm not sure if we have an external bug report (we have an internal one), but for amdgpu there were customer complains that 10 seconds is to long.
>>
>> So we changed it to 2 seconds for amdgpu, and now there are complains from internal AMD teams that 2 seconds is to short.
>>
>> While working on that I realized that the timeout is actually not driver dependent at all.
>>
>> What can maybe argued is that a desktop system should have a shorter timeout than some server, but that one driver needs a different timeout than another driver doesn't really makes sense to me.
>>
>> I mean what is actually HW dependent on the requirement that I need a responsive desktop system?
> 
> I suppose some drivers are indeed only used for server hardware. And
> for compute you might not care about responsiveness as long as your
> result drops off at some point. But there's cloud gaming, too..

Good point with the cloud gaming.

> I agree that distinguishing the use case that way is not ideal.
> However, who has the knowledge of how the hardware is being used by
> customers / users, if not the driver?

Well the end user.

Maybe we should move the whole timeout topic into the DRM layer or the scheduler component.

Something like 2 seconds default (which BTW is the default on Windows as well), which can be overridden on a global, per device, per queue name basis.

And 10 seconds maximum with only a warning that a not default timeout is used and everything above 10 seconds taints the kernel and should really only be used for testing/debugging.

Thoughts?

Regards,
Christian.


> 
> 
> P.

