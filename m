Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEA380C58
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DFB6EEA5;
	Fri, 14 May 2021 14:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B296EEA5;
 Fri, 14 May 2021 14:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSMz4Gx8J5or98dzykvO+J/oRdUZnynqbSBRvzz9AnR2DYmoylGZiYJ6Ty9NpACvNEzNG0AS92qSwYG7jIR5WR0TIwDjZlW0ENbkSKTBYgfmH2/AkdDvisaDITvOF/v8uCPrtM5QT2DYAAFqTAz+M6zIY28bZmMx2vh6Xb0S8YeMi8cGBV1TBPwiEk1AeQ4HzbzOQy0UZjnwtIHlP3gMWL1TO+SItlZwhNHbAYNdNZjWON4Ek/OyKbsEQDo4Gan6kLXkdzb+EKtJVRqgHs4S87YMSMR5vi1q7L0VmqxuNAiY6XxsN1HEIUIu9zwyQakTtPBk9A7ZJmFkTzkiSGSP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guF2gi+J+s5c7ydaokKQs7NGQKJIowDsM3lUY/IBUi4=;
 b=GSaqovHeLkIqy6cTlf4qMg0LuT8EoC6D/eepZ4zMYiv4Posdkf78dP8JObynMFP9qGkiJpcQtLqLZYdLQmxmTQR3XVnqqEdeCp48uJiY/+joFYMdEV6VLNCO1Yx7QR58X1TtKSjIYdlsMWzKKvSL25KbM90HLM/sP+DNKEgKqh2WQiIKv1q3gOhbFeYGAFNWfgngXfQUxzdvUnWBD//mSQadSrrEb/l6QylUjY9MeegY9PIUVPao6cUodMEV7njfITjf4FF5CRzvB9i77ZwXyx3WTYtk2rrK0xD98R9OAw/NhFmcHNUD6yVBsjQ4cXH06MECSG4obMMK844fjREHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guF2gi+J+s5c7ydaokKQs7NGQKJIowDsM3lUY/IBUi4=;
 b=u0xBFkIFKlEzQhNUvxDAXcC705AMUI3vQq9rpYa7qSg+7HqSp4wxfxYcqJ64wdl0HtFgfchSlxhfZAJex0b5t2O06P4yXhCMn6MqvWaYwRdrZAiPufHPaxw1TkWuOkxdMw7hmcsF2lfp/Ly/h5Csd0Rgf60cWu1solNa0jQX6m0=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4783.namprd12.prod.outlook.com (2603:10b6:208:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 14:57:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 14:57:04 +0000
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Nieto, David M" <David.Nieto@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
Date: Fri, 14 May 2021 16:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
X-ClientProxiedBy: PR0P264CA0252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::24)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
 (2a02:908:1252:fb60:cf70:a0fd:8c48:efd4) by
 PR0P264CA0252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 14:57:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7970283-14de-426d-0e54-08d916e88923
X-MS-TrafficTypeDiagnostic: MN2PR12MB4783:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4783AFF37CA289127744A3B983509@MN2PR12MB4783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IwYuMWX7Q06VXtgvNiIqwPwjyL36HVOicsOFO29Yk/NSgqTccTPJeyiMa/Pv3cg8jAWgNJSq5tTsywq0GMVXPa7lbXhZERuPVZpj8PQ/niEpAPaA/rHLfOJO9OLA/FsNP5f6A2ga760Jt1mUCg/S2VJBX+g0NqbHFDbOfTgyQNOQwWJzIpXl6pgisvaiLMCHU45jijfzKJm7yYpSAwijPNSRWssq963674Cs3sHDhvTBYUz3GyHx85d12bFGpJbZfq3zjpX/s/XfVV4y7i0fpZqB3M3nLUQVSq4hcdnQMcCL0xFwTXCigMFWR7OjexuaWcC/q9RAYiPt2rki3NDOqDt/TUoRo+oJXPQpZlIginsIYQqazyLPKcvQEPuh9BrFE2YBEEPGdUeEQrBTQLFQM0Ko7BtJX8aizoeGuTILdlDzSA5vGtSUw/TvZva0aTO+iW6/i5t3qT40oYkYSW52sQ9XB78TIUrqvxHoUeSpvueztI1Pf8FQgnj2kaVZkA0HNmEvBw4oZ8hE7u9Ji1ZhfrQhIvTxdHv8jg6WVHQ1M28YUOo3xDTZXfCMdGeCzFhGF6zF0nbUVZhqknK3j9VU8TSvsewiJKbQ7vxg9UFSot2Cc/NHcxg7/ixh9O80km4e+p5hdBMGj/HN0bFkvHOA4ho1JXPk5UFDwv6APBs0u68YO57vID7PDjExk30DVx8h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(2616005)(52116002)(36756003)(66946007)(8676002)(6486002)(16526019)(5660300002)(86362001)(110136005)(54906003)(66574015)(31686004)(2906002)(38100700002)(53546011)(83380400001)(31696002)(4326008)(478600001)(6666004)(66476007)(186003)(8936002)(316002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnpuQ3BzOTY1Q013ckt5ZndSR1ZBaVhOUUNKRE9lUXJHZ2FSTnQvUUwxRzBL?=
 =?utf-8?B?QkdjajhmamlheDZSNFhnMjlOYjRsc2Z6aDNpNnpLc3o5TXBaTmkwRU5ib0hU?=
 =?utf-8?B?VnQ4ZkJuYUEvYTE2NXhKRG1MaVlkWXpkbVEycmJjUi8vNWszZXpaM1hNd1pY?=
 =?utf-8?B?eXliTElFWnhiYkw0Qlg3RWRYZUVFeHpob213YTZ2REZ1UVdYOGFxMEk1aTN0?=
 =?utf-8?B?TjNkaXkrQk9PRHZlWGRPYm5kTUlDWlBDdGZ1NzJPNzg2UEVaOEpMMTREa3NC?=
 =?utf-8?B?cFpvVXUrNElJTk4rRnRDaDhUVXY1N05NelRPVVF1UG9qY0VRbVBsS2xCZUQ5?=
 =?utf-8?B?NXJySFhUcFYwUXUrbE9JZGpsSG5lWm92L1JvVUpJZEdZZUorOEF5c050WmVL?=
 =?utf-8?B?RisyOFVLdnRseTlPMTAvWTNscFlUY3pVVmhzMGN4T3IxS3ZXdVlXNzR0YUx6?=
 =?utf-8?B?QXI1MnZsYzU0QytYcjFDK29GUVlZdHRiOFNmaWZULzlqeVMxTUNZcDMyOFJl?=
 =?utf-8?B?UWJBdStRZFBuSG9LenlGYmhLRWUzRUZxVDUwNDFudzVDR1BNZ2trZ1BxOHRl?=
 =?utf-8?B?b1I3dG1rRitEamVQRm9GZWxVM283eDNXZEdiYWdNZUN5dkFnMUowbElQbDVD?=
 =?utf-8?B?OVVxYTJicmlKYkJ5R0VFZXhkaFhLNFhoeUpuRjVlNXgyV3dOSGxiMGJ2K2Vk?=
 =?utf-8?B?ZnRwZmtRc2p1UFNwQTRlaDhGVUtVRE4rNFNZNmY0Q28xMTRJcVhuV0RyVlpD?=
 =?utf-8?B?K096cTRWcHk5MlMwYnkzTlB6Z205cHh4d1BSVmpXK21uSUhLV0F3dElXN1lp?=
 =?utf-8?B?TXpvVGoybmMvcjgvLzBGY3E4aDdWa0xmS09ISGFPQ095ZXV4QU5FNHRBL25s?=
 =?utf-8?B?cUNFczluU1d5MjlTSkkwZlFMRnBLVXpaK3hHYjNhM2ExWEFTd3dmNTNPNDdW?=
 =?utf-8?B?c2tiWjhZMENSSGE5NEdkQ3RQTWN3WWRLT1BoQ3BEM0NCeU92c0VaUGRoT2lJ?=
 =?utf-8?B?RWFFY0l5ZWNCYm5TSzF4VURhbVhmOUdsOEFZWVF4a2NhcDFoRmtEc3NTWitC?=
 =?utf-8?B?S0NDRWlmK3E0Z29ZaGF4d05HbnJkRGJwa1lJRFVRbzhtSG9odExyYm50cnlv?=
 =?utf-8?B?T0UrbWl4RzlVZTZGR1NLdjFMNUlseFIwQVJtdDRUcTQyWmlaTnFRbmkrNWJJ?=
 =?utf-8?B?WkVlTmFLZWJPM283eWdzcTQxWm5Kem1tZEZLSExKK1Nudyt0N04rU092bitX?=
 =?utf-8?B?ZGpJbktlTlJ3VzRjbG0va1Y1TEZxMk5KY0JZWVZ5Zkw1NXlpVzM1bTZBL1pC?=
 =?utf-8?B?V0k1U3lJVnd5a05ydzlhOG9lM3lNNWgyNFFad2c2a3dCRzlKeE5wandvd05a?=
 =?utf-8?B?aGt0dnN2ZXkzZStzTUFBekZxelNqa3E1YWM0MXZ3U1FFUVRlckM2N3p6eUpv?=
 =?utf-8?B?ampFU2pBbGlldStQY3NMcVdSNnlzaEpEREg3V1dUeXdodjIvYU43QXAwN1FZ?=
 =?utf-8?B?ZlIvY2xLaG91UzlsN1o1bzROSFJGQ0dYWWhmcU9lbTF0VHg4SFZaMWpxUlFG?=
 =?utf-8?B?UjhUVkZOUlJVREl4R2NFOFltZ2lVdGw2Nnp2UjFrYmU2Nk1UdEFpRGpOK29X?=
 =?utf-8?B?bzNBWWwrMCtZcEtvSkNOMTE2ZVM3N2lsZ1B3Z3ZGYndUVVA5Wk5VMm13UE4v?=
 =?utf-8?B?aXR5UW0wNWFKR2xrVm9DVmkxWnFtMzBJRFV2QkpqSHlzZDlSNkl3dVQ3RjBO?=
 =?utf-8?B?ZkhPTEN0ZG9qR3RaTXAyYVVISXowMG42QmFTQTlua3ZNZkRZb3QrZ05ZSXFN?=
 =?utf-8?B?UHVxMVU3QlRvZVZWd2VZSnJ6VlJJVk1TV0IvM0NGYmNocXJ4cjZnVlUyTWNM?=
 =?utf-8?Q?IvsCv5jMIpH/A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7970283-14de-426d-0e54-08d916e88923
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:57:04.0634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD1j/FKH6U5j4sxX5RYixABxzbZ614UQz2jxCXVw06rciYabrxLTB9uNltxVtKCd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4783
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:
>
> On 14/05/2021 14:53, Christian König wrote:
>>>
>>> David also said that you considered sysfs but were wary of exposing 
>>> process info in there. To clarify, my patch is not exposing sysfs 
>>> entry per process, but one per open drm fd.
>>>
>>
>> Yes, we discussed this as well, but then rejected the approach.
>>
>> To have useful information related to the open drm fd you need to 
>> related that to process(es) which have that file descriptor open. 
>> Just tracking who opened it first like DRM does is pretty useless on 
>> modern systems.
>
> We do update the pid/name for fds passed over unix sockets.

Well I just double checked and that is not correct.

Could be that i915 has some special code for that, but on my laptop I 
only see the X server under the "clients" debugfs file.

>> But an "lsof /dev/dri/renderD128" for example does exactly what top 
>> does as well, it iterates over /proc and sees which process has that 
>> file open.
>
> Lsof is quite inefficient for this use case. It has to open _all_ open 
> files for _all_ processes on the system to find a handful of ones 
> which may have the DRM device open.

Completely agree.

The key point is you either need to have all references to an open fd, 
or at least track whoever last used that fd.

At least the last time I looked even the fs layer didn't know which fd 
is open by which process. So there wasn't really any alternative to the 
lsof approach.

Regards,
Christian.

>
>> So even with sysfs aid for discovery you are back to just going over 
>> all files again.
>
> For what use case?
>
> To enable GPU usage in top we can do much better than iterate over all 
> open files in the system. We can start with a process if going with 
> the /proc proposal, or with the opened DRM file directly with the 
> sysfs proposal. Both are significantly fewer than total number of open 
> files across all processes.
>
> Regards,
>
> Tvrtko

