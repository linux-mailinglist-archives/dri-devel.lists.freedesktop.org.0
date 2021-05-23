Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6C38DC23
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 19:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB636E527;
	Sun, 23 May 2021 17:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED86E6E527
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 17:16:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKx2j4YHfLpRV2Aly8fpuVhnCqrH4pTCoYb8+7GX2a3AMobjOWZbCbDcRlj3ePbeODuBZhALmr6W0VgbpCl2Nt5fr8ZZbNinuPW44vn/Dy3HwitcLiI092T9eapjctspQYFnrk50oBjIXQmKC+0Cw5RqRCRaLCEYzsP0Ae4jm3daTBYdXq+j6g+3AXzMidHKCRsrPi7jbBKcU/LS7Vy2NUBG8ZOCxiSYC3GFlWxbrMF+qe3xZx54GbPeLLbY+9fANH1sChefWInHPgK1d167ASdUik+PpcPRPmdt9KyJ1pNcI41mnJwDkjxRTl+AtnhxcIBxl84jIofwiyureyCu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdK3kBMm/GI2w1Fww7m9W81MVzo1DlkbcEoUNGbqoB8=;
 b=VsrKfY6TUmJBfR9F0DC29XJJPnia2VsnHZ7NvigE/8YxmQYcXQpKEtSNK9UPxqf8+c8+HfwdRHKEZEGgMo/IC9ODI3QveidjroD53OVvwRtQxILaJhXU3qHjZIPUfZCYRKIFUva71od6j4DY1y7F7e54ODLalek/JB5UMmCHRFwT6FbeU/4RFdWqRMobTde1/mHScrCZWU5CfeGIwRrY+0jRtV+VeFg3alkB3rgTn7SmcHp8ykOIUVt9bOg7189Wftm0M0tYYi0tvfqFiPB5BxHLLHd4g4aO6k8u+aj9GkkNmDqVQ8GDsFAOS8cQdarnYHhyJNBDGQW6GXK2nBz4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdK3kBMm/GI2w1Fww7m9W81MVzo1DlkbcEoUNGbqoB8=;
 b=EIqJrFodgUf3/8bVER8l1moQmwBQ/K66qoHX97rlBdXi8C2cB5U+A/h9P8w9v6F5voBMdUbb621Ut9DjjQUeOTcxqVt7MW/Wv4ao6LknfJzPwYB5cF25dS0tLJLw4JPtNSHq8t3CVYqxNcbBl4fXvLZmjXpAWAYKUVnhZhGr0oY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Sun, 23 May
 2021 17:16:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Sun, 23 May 2021
 17:16:09 +0000
Subject: EPOLL for drm_syncfile (was Re: [PATCH 4/4] RFC: dma-buf: Add an API
 for importing sync files (v6))
To: Daniel Stone <daniel@fooishbar.org>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0a54d998-1c4b-724c-ec2d-a6c23aa35c21@amd.com>
Date: Sun, 23 May 2021 19:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:d716:abf2:6ef8:7167]
X-ClientProxiedBy: AM0PR02CA0090.eurprd02.prod.outlook.com
 (2603:10a6:208:154::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:d716:abf2:6ef8:7167]
 (2a02:908:1252:fb60:d716:abf2:6ef8:7167) by
 AM0PR02CA0090.eurprd02.prod.outlook.com (2603:10a6:208:154::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Sun, 23 May 2021 17:16:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f33df75a-7892-4545-5ad8-08d91e0e74bc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:
X-Microsoft-Antispam-PRVS: <MN2PR12MB409663C5307F84362D6414ED83279@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6oXRstqp+ZNkOgS90gIyQfAmjKHewxIlxDoCbHFmnZzl2QY+gGREaWWcOp216etC6WTfhQNFlVRwfYeMzTK2MDMel9gIzzs1oV4OrguCpGnMYlsY0t467d3ZRJGI7IdkaDHaoIjlqMX373PxvvijRfB4oNwO+3fDy4FD6Fonpl6P3/vcM0gkplP8hjMNtpQgZvUt5W4msxdgUweN/AOSVjIpB7E8uqyy1++LiGSFQyIDqro3Qq9Il8DlgsWZpRYkT3bF8Xrfuio5NZs95gOhj2i2fpvcCC936ivZw58e8SbhDHA98DGQBq2+yHyVxYhyra7WEiaMnTEZl40O1UelY4lRK97muxgRyLICA3ra68bXqZPOK/klA1pU3bTfKZs5mKO7U109qLkX0EOehWhax0jo8P4gY1OAqarSydeyOvsH00uh2CWOH9VaLi+/7v39zBkB0ejh3IaZb2fJZWXT8lje7QiFSUW0Bluz2l3CO2V6VMi2NP0aYJlWIHmmBCCAuvYx6VzpivmBB5kU9pyaUw/T5gpecZeK/ywuDOe6gYJUouJ08vkxwvTVOt8+h79VbjEtVRKult7kqy9qF3qFVA534SLCO8+dwyYJNchRESKUFMjgYBtcvaaqiOFd0XGVKUNMMNjS0BzShlGLNwceN+J7XaC2f38OJM8+AdcOTAWpv3ck0xk4H34csjqIIXrb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(8676002)(110136005)(2906002)(478600001)(5660300002)(36756003)(54906003)(316002)(52116002)(38100700002)(4326008)(6486002)(31696002)(6666004)(66476007)(66946007)(8936002)(186003)(16526019)(86362001)(83380400001)(2616005)(66556008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q296SDVwcVZsQ1FtUUQyUC9NZmh5QkE0RXZSNVBwUFJWcmI3dHEvaWt1Mi9R?=
 =?utf-8?B?YXdleEZ0T2FSSUI0NkQzek9MaDFua0JOZzJmd2YvbFpVUlJVd0VGUTBVYUVD?=
 =?utf-8?B?MzhKK213ZUdQQnVqU0lMRXd0NjhJVDhiaVJ5VnYybTZ4LzJqcFl1MUlvNmlt?=
 =?utf-8?B?Y043OVB3WFBZTzVnTXRDZ3pxc2Y0Zld4SUpuTTJsQVJOaHJpeGJRVWUzbVVD?=
 =?utf-8?B?RnpHRWRsMWRvQklpZ2hqTjhXNGRoTW5LN1FVYlE4dVc3SGxrbGxtVkFpSVdy?=
 =?utf-8?B?Y05YY3NZZjJoN2ZHbXJSWW9qRHV6R2JHTjV0em5zdllGV0szMUQ4ejJ3N3R1?=
 =?utf-8?B?UnJIdzcxSWlmaEx6enVhSEp2dGxjcU01VmZ4bzJqbVdRQVZzT2hUMUpraEdV?=
 =?utf-8?B?T3VkOFFWNFRhNm1idGZIY2c1UzlFQkxDTHlkSHZvakI4azFFWGk5b2NQVmdG?=
 =?utf-8?B?VSsxUDgwTHQxMUpQaVJsUExwNkpvUFlYV3VqckJRVDNQWE5LY1dhKzNmSGVp?=
 =?utf-8?B?Zit3RHZXMzNnUkxwVzdicEVnZVlUT3kzN2NsV0tXaW9wTGMzVTB0S2Jzd0dy?=
 =?utf-8?B?M29sQ2paMDlHeHhNTGhDSWFadEVwOVFiUXUvdkJ1dzFLeUdnRVFUaXIwVldq?=
 =?utf-8?B?VDRMWXNETzdncGRiNEJpMlFsZW1WckVGWFlBclpjZ05qYTMveXlaU25Dcmho?=
 =?utf-8?B?NmZpZWwvcXBVOXM0ZDRkU0N3RG80RjJzbFdxT05JWHlDMUM2ekVWZisyRGJX?=
 =?utf-8?B?QnBNRmNxK1ZRUlVnRENSdjZtbEY5UStOZnVJdDJZcnBFRFQwSnZiOWtEeG5y?=
 =?utf-8?B?VmJiR1NpN1pqY0oycDdpaEFIdnRBL3NaL2FQa3lPaWV4eU1UUDBoR2dJZG9W?=
 =?utf-8?B?MjA5eHRzVXhJM0pBRDR1clYydmJ3Qlg5RWxpTTlCUFQzVGtad2hoczR4cXlX?=
 =?utf-8?B?MmdmbTY5aytwTnFZbWpndUpuSXZ3aW12dThHdUlxQmhUK1hRN2NDNnBnZ1pK?=
 =?utf-8?B?bDNOV2JBVm9lWlRBT1NNYy9VOUxWSlBWWnVPSEE1MmdCZTlnUGZLdjlTWkV5?=
 =?utf-8?B?QjFhbmIrK0sxRi9mYXphK3R0K1R4b2JNZGhLVHREdkJ1RC9qakNFTjQ5QVFQ?=
 =?utf-8?B?ODZsR3lPNUNiT2d1RlZEMlc3SUpFbi9sNUcwVkFVVW5FWGppRThLK2VIamsx?=
 =?utf-8?B?WUYzSlZxalZnT29TNmUyR1NVT2NnVWw4eTVUYldvYmhFbGtwbEdiTUJyNFo4?=
 =?utf-8?B?dXI4SWVIem1ZY041aUJxZjNjb0VQMDdoa0I0b2hNS0l4WW9CeVFrT3crUTRE?=
 =?utf-8?B?ME9MUmpkd2pGdEhCRi8zWXRmaFRQdTBUV0prSVNhTGNaWkRWeHV2OG5Majh3?=
 =?utf-8?B?SWpZSWVWN2x5Y0p6SjFvV1BCQXpnd0dCOEdmQnV2TGVteWF1eG5WTWM4VVdF?=
 =?utf-8?B?eExwK0JXQ0NmUFYwSEJZVG1MelY0d3U0YWdsRndLdDZhVXFOVzJ5STFqRnh1?=
 =?utf-8?B?QnBKcWY1RmdLRFNlYzhFMmlld0dUdkRteHVBQkNraXRDdS82dHBrVTNlMHVa?=
 =?utf-8?B?elg0REsvZ1NlMkFRNjh2cWhjVGpYYmlkUk9oQ0JUKy9aWlVJTWdLN3B2dHVV?=
 =?utf-8?B?LzNveHZsamorZ1I2cHFzMC9SZEhRcWQzWDhQR08wQnkwR3M2N29zWEU1dU5P?=
 =?utf-8?B?RnNKakxlckhFUU16Z0N1SUJMK01QTDl5cjBIQ2dnUmtML2lkTTJIbTdVb0ds?=
 =?utf-8?B?b2duWnpRUHNVeVUra3FHQ2toM0hsTWk3WnZYQnA5REF3enkya2g1cHV3NVRa?=
 =?utf-8?B?RjJOMWpkVzArazJ6SGxBSHlTMU9tTzNGR3N4NUlpdlZwQUszZXJFaTU2aUNr?=
 =?utf-8?Q?P0azZ+Z1v3Owt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33df75a-7892-4545-5ad8-08d91e0e74bc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2021 17:16:08.9360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5D6HSPnKNp6QF2746hxwrgndrXI2CMX6ulWnFT85WKQwkJ3eRfBu3r36iF2V/WcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

separating that discussion out since Daniel had a rather interesting 
idea here.

Am 22.05.21 um 22:05 schrieb Daniel Stone:
> [SNIP]
> Anyway, the problem with syncobj is that the ioctl to wait for a
> sync_file to materialise for a given timeline point only allows us to
> block with a timeout; this is a non-starter, because we need something
> which fits into epoll. The most optimal case is returning a new
> eventfd or similar which signals when a given timeline point becomes
> available or signaled, but in extremis a syncobj FD becoming readable
> when any activity which would change the result of any zero-timeout
> wait on that syncobj is more or less workable.
>

I think the tricky part is to epoll for a certain value.

Not sure how eventfd is supposed to work, but IIRC we don't have the 
functionality to poll for a certain value/offset etc to become available.

We could of course create a separate fd for each requested value to poll 
for thought, but that sounds like a bit much overhead to me.

Apart from that this is a really interesting idea.

Regards,
Christian.


