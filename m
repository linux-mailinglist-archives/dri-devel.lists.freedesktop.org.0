Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC2383D0B
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF196EA4E;
	Mon, 17 May 2021 19:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9606EA4D;
 Mon, 17 May 2021 19:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgddzbhNIJu27nXkZBrn2JfZGV+mtKfIDgXkolocDvAYHw8fca1cxfkrtVRXF3q6Xvxl80xbSt71nyP2GjyIjtUNlOkdGBljj4kULg8Cj29kSb9RZjkdUgKAm1NtDWXY1g3onMer6uicdZVuIU7OAL8Zc4bPZPCC0cxJPqWJwqQT7XcnKViTGBtSEpoIGOS3idW2ilzjGgENGVj6zq1Khr8F9XlfdEayUs4noypsrCVYJI02UtFteIioXqtR6X7b1wimV8t8LdBemayl15OYeihlpYW/XsGp+uhdfAEKZwSAmHkM1+k74QRlaHhvXO0NZ50IDsBfvel3eTVJwM5W1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtjVwnj0XfX6uAsRhiPGeKfPkzOq+XqSAcLsaHN2oP0=;
 b=eRdKq7fm66ZJ85deNmqDhGBbVqPoKPCa6LquUe6OEK3Ac75hoW/8Zevsuy+6QexWKVxxWjnZcqYK9vL0BApj9pD0KoWmwHATi1umnqI8f98Xa/RbrVroNXXW2mvKtpdkJG60mdqWzQPMbaFMbhpkrjpjHiXAwYT4Qy6PJ6Ds6++1ju0R9itTismX5rKD9NKqYUZyO8mz20un3OR85ghdco7HDI8vXxiOr9C3wtT66Fnt8TsZOdFnvzl2wZDnEBJZentz9OUvhBqjXMJyGjfyN9hJYgW+LM1M0FocQNNgF9Dg9P5y0uLNQqZdj0Lgwd0lKS2yW20sbHVb3YLUe7SGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtjVwnj0XfX6uAsRhiPGeKfPkzOq+XqSAcLsaHN2oP0=;
 b=v7puySwDeDj1FdGY+x7whNK6GsJraOd429DkQc0VBMlBCO2SUBypbRzi7THeTTBwX7LfYcEf3gHXOnVrgpdaQ+7rQj4mvwk89BugLwv6W7auRokAqsY6HIv16lwqiwmcyhBVBOEt5JnEmyP5FcF73O7vIJqHmKIBgDsSiX0ViRk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 19:16:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 19:16:37 +0000
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Daniel Vetter <daniel@ffwll.ch>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <02fbf997-2a2b-cbbf-3336-08728a45c2cf@amd.com>
Date: Mon, 17 May 2021 21:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bd86:58d9:7c79:a095]
X-ClientProxiedBy: PR3P189CA0053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bd86:58d9:7c79:a095]
 (2a02:908:1252:fb60:bd86:58d9:7c79:a095) by
 PR3P189CA0053.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 19:16:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36e9973b-ccc4-43e9-16f2-08d919684ab5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44051792A20B498EEB9F16D3832D9@MN2PR12MB4405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eU+Kgjy1tl+dGZeot6Mj3Ai/nY55I8WF1je3S/npUYxJ4tk80g7zbdP0QGE2FTkBcA1KEj7tosTzy7i24DCH1DccQe8Ajt2IU3ffVQc5Lj9JMP1jGR9K2Idx//1ftnqm2rvfKv/PI4jmFO0n3bsbk/KVYXwxaPoDTBvsG/U6WTukw2RBSKaderAO4IbscSM7PzjFNpfJBdHTu9d4SXKQOHuw34hqKcZxFIvp/223vIlRcXNazq9Qkf1x3+XuywRbNYECJ0SVRdr79wSLbB8bUpXixG7OMNaG6ph5hhTD5HFcwOekofOEdG3PS6wXEedCELaP5Rj6+LFuP+NuDKLd61eLjeN3j+kHEexpAqgNirWV8QZElA+jA0OueTy284T4e0JCbcHKdYISrKJHDhiY9TURtnHjBRgTk6CMgqsvNmubiiNRFFRhFNCTfBaYFS/YG9WIDvcP4Q1gJLBTq9j9Z/fAuYi+EmVVxA28dupmSU7njEPvnZy4xbfIZoLN1YpYt7Mzkcc2VJvkpC1SfDfwqCsgOIW064XVj4gyo0HrTH0gxAF1Hv9gmKfldsiV14CFDXcnJRZjNk1x+9uvrAcpjwZUDwSiW6j+HCap2oqnPqcQJ5b/1xDjCOaWc+Fhb7RGP57p+OkA+SBT0KlYJIKB9xaEzvNi3pRiQSnrIHxDdfxG7KGQdZHiBU97k0F30wFn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(8676002)(54906003)(38100700002)(36756003)(2906002)(31696002)(52116002)(6666004)(5660300002)(16526019)(66946007)(6916009)(478600001)(2616005)(4326008)(66556008)(86362001)(83380400001)(31686004)(316002)(6486002)(186003)(66476007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OFpmT3VtejIyZDVOam5hMFRCN2VPdDQrK09aeG1Jb0V5WitZUEtKM0VnSXM2?=
 =?utf-8?B?QkF0YUhkb0g0bE14ZTF1bEJzcnBub0dMNWpOYkgzbGVqREZDRlFIZTdqWFBZ?=
 =?utf-8?B?RGkwNlRBbCtueGxUYXN4a0F0bnk5em1UTS9pWkJNN3k0NGtUNWdtVFRpOEdy?=
 =?utf-8?B?SUJDbHc4a0d1SE91bTU3WGhqVnY1VExSZVNpdFZEbXNsQVpUbVhMSDFUZ1pY?=
 =?utf-8?B?d2UzUVhWY2I3YkZNckRseUVDSU1YTFIrWFo5b1hKRDRzc0xDOVdibUhGWkZq?=
 =?utf-8?B?eXdNUFM2WTNkbFFRU2JCdGJsT1orSmFDeXhoWStMb2c1TzlybVpUMmlFY0lm?=
 =?utf-8?B?c0VLdHEycHJPUTZZdlVIRnJxY2J0bVpzWTJ5V3B3Z1NZUFR6NkEwcDJwand3?=
 =?utf-8?B?ZDlPNm1RM3Ara21VZHNIaG56ZlR2NHhtYUlwMm5ENVZ5c2o5U2swcDhrMk5R?=
 =?utf-8?B?SXpvbEVJeE9ySFh5ZUk1M1dyTlAyS1pqRlArYkh1ZmdRamd5RW42Rll6d0RR?=
 =?utf-8?B?elpyYXpQckFVYjA2ak1YMWxLbnQ0Z09iT2JZdTRleThleHRMM1lKT2pYZVhX?=
 =?utf-8?B?Ym85Vk8yTXFCL2ZRQWRUWG1namNmK1h2Y2k4eDF2eVMzY3NHNzdtU3RiZXZL?=
 =?utf-8?B?V3hFZWlrVHZlV3NPbldFM0tNdldSYXhPQW9ZNHlwc3Q4dnpldFpUU3J0VnRn?=
 =?utf-8?B?WjZCdG5wdWZVLzVya0pYV2xWcEhSdlo3Z1E1aEphQjQrUnRCZWF3TUo4OEhz?=
 =?utf-8?B?ZFBxMzRzTTV5bXVXTEJLcGt4TFBNZk5iUEpqVEdUajFzVW1HZ1BjcmRCTWZV?=
 =?utf-8?B?U1IxWS90Q29CcExBMlBJQjFldEl1NXdRYVN6SEZzQ2l2R0xPUHVUK283R1RU?=
 =?utf-8?B?Q3I0UFphWldYMGxRakxXR0V2RU1vaG5YNGNvU3BlbEhGVTVQejNERWNTNndC?=
 =?utf-8?B?bFlSdGNvcjh2WW4zRi9uUjJMYVlxVldsQUd1cG5JSUZYR1YyNlAxVnVLa2FL?=
 =?utf-8?B?UFI4bzR2M2ZPdXRQblNvQTF5MXVnbnZKOXphTHh5U2tudTlZTGovcDFzYStw?=
 =?utf-8?B?cnd5cURBTlFpa1dvN0ljY2RUNEdmUTR3UTZETll0YVA4ajk3U3k4VnpwUS9K?=
 =?utf-8?B?cWRlSE1DT1hMRlFSMDBnUWtCNGtML0dNOEJLMmVGcTA0WHZIanlIUFJrSUFk?=
 =?utf-8?B?NkhjS01kdFVmNTFCK0daNXVCalFCb1h5a3hQTEZoaTdCdmlXU3BTVDNWWUty?=
 =?utf-8?B?NjIzMXZRZUNxdFBER3NGbjhuMzNra0FUQXRNT3pVNTFYMVVnampxUGVNb2hM?=
 =?utf-8?B?dzUySjlGV0ptUVluU2s0VHNZbUF1WFpBN0dhak9qUHdyVnFlZEZrNHdXS2hm?=
 =?utf-8?B?VWJZTWNDT0owREdnd0JBNGN0UjNsR0xSdlUzWHFRdHg5akZHcVVobHZvMDdX?=
 =?utf-8?B?SkIzemx6dkkzR2NEdjV5YzRrQmI5enVqelJzaUQ0cURUZUFocGEwVDVqK09k?=
 =?utf-8?B?b1NMcy9hVExvMWRFQm13VEkycWRCbDAvcmxQMW9TVlNkTGswUjRjaWFubStM?=
 =?utf-8?B?VENycHZuV2ZXY2FOeVNpeEdobG43UGFKc3YxY1NvZ2VXUkEyQUdCNk03blBx?=
 =?utf-8?B?anptd25LUlBhUjk0b0lLUUw0OGIyTFhFZUZHTzZCSDA2Z1Y0SnZlNzYzOFFZ?=
 =?utf-8?B?KzJpOWNkd1E3ZFpRVlI2aXJjQTd6eUdyWXZRR1ZvWGdKcVpZODZmZk4ySnEz?=
 =?utf-8?B?K1VsTVBSOVdXdEtwSUxFbFdjYkZCTzJhVUM2UUhjRm9BWHdKVmxnQkdzY2ZQ?=
 =?utf-8?B?YnUwV3NKc3ZHcXBxdkJ6SkdjQUxLaytJL2E2Q3RwRGxXSEU0SVNzQUdkcGdE?=
 =?utf-8?Q?xwavV2loo24f9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e9973b-ccc4-43e9-16f2-08d919684ab5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 19:16:37.3049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zfe/6vsU1w63cLhu4VaAd+P5yNZRCfxx5BCesaIQhqOohenDepVSlmI8TAa9NWa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.21 um 16:30 schrieb Daniel Vetter:
> [SNIP]
>>>> Could be that i915 has some special code for that, but on my laptop
>>>> I only see the X server under the "clients" debugfs file.
>>> Yes we have special code in i915 for this. Part of this series we are
>>> discussing here.
>> Ah, yeah you should mention that. Could we please separate that into common
>> code instead? Cause I really see that as a bug in the current handling
>> independent of the discussion here.
>>
>> As far as I know all IOCTLs go though some common place in DRM anyway.
> Yeah, might be good to fix that confusion in debugfs. But since that's
> non-uapi, I guess no one ever cared (enough).

Well we cared, problem is that we didn't know how to fix it properly and 
pretty much duplicated it in the VM code :)

>>> For the use case of knowing which DRM file is using how much GPU time on
>>> engine X we do not need to walk all open files either with my sysfs
>>> approach or the proc approach from Chris. (In the former case we
>>> optionally aggregate by PID at presentation time, and in the latter case
>>> aggregation is implicit.)
>> I'm unsure if we should go with the sysfs, proc or some completely different
>> approach.
>>
>> In general it would be nice to have a way to find all the fd references for
>> an open inode.
> Yeah, but that maybe needs to be an ioctl or syscall or something on the
> inode, that givey you a list of (procfd, fd_nr) pairs pointing back at all
> open files? If this really is a real world problem, but given that
> top/lsof and everyone else hasn't asked for it yet maybe it's not.

Well has anybody already measured how much overhead it would be to 
iterate over the relevant data structures in the kernel instead of 
userspace?

I mean we don't really need the tracking when a couple of hundred fd 
tables can be processed in just a few ms because of lockless RCU protection.

> Also I replied in some other thread, I really like the fdinfo stuff, and I
> think trying to somewhat standardized this across drivers would be neat.
> Especially since i915 is going to adopt drm/scheduler for front-end
> scheduling too, so at least some of this should be fairly easy to share.

Yeah, that sounds like a good idea to me as well.

Regards,
Christian.

>
> Cheers, Daniel

