Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B1308982
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B6E6EB22;
	Fri, 29 Jan 2021 14:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3025A6EB22
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqCF4ODXS4Fbo1mYR9J2HyFjkV6dtnEfG9HVYj12BBjQzjPZLlXHbZRQzpRXftoqkRvBXi8s/d6b7XjAePh3Q9ys9R5kw244Fx0iN7I6zILC0EKUZbbAPei6y/yQVjqyx3BGeaDYrgAG87DjoQhwyqvXWcxtBRLrdfKV7DLXPSBJ/z5cgcoOh7TGmaRdmMny78IAAES+8nQ4dGQz1v8+PlTFOm9WtdnszLxycDxkM3odLTO4ViHy2lRLK6kxKebP39r5gr3/tPlublX+2/2z12gthNyH68T1Ou9bdmPdG6MIcYalmt6M7duav16wwBw3CGk9IH95PfuwcgnE2LKQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F03PUh+xTfg1zv3xRvt2oiGOL5Ip0JKDTTm0B+vH03Y=;
 b=I6dmlkytscFgON8UwIC+gBJy8gnN49+a/Fle3cqFAcPqRzeIvlbX8oMgiQgsj6o+uRX7nw/dzbpWeq/yeJTrkovj3Mn4ZubFSMyJTqls9EpIdnaR2YacCGFszgveDMbgfMLyzfMwUhBeeYbUEepHLVZ8xC2Bb4Dkf5EBLDVbHBpkmfZUqBmoM0P0VZFQdMAVh0seU5CN1+Zvy48oVHFJdxfjfQeB7trWNdA+N+QiFnKoOdZljqpE0KaGZxc9lSYC38P6bqtdVMImhBzsy1SGxIX1PmVVXdnAT1mxD/0OT7ofmbYYUFCbAYM4lKHcfklCoR6IiPzsxEpLpaPm0p4uAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F03PUh+xTfg1zv3xRvt2oiGOL5Ip0JKDTTm0B+vH03Y=;
 b=13D5SGlgpQpmSkDckOMXIo9o+0n10UU/DnRMS/cRLT1T5ws13tFImXRM/ndCeEMx9UVBWzBQgescvE+rFcziMn7eivBnOIxhc3Dv7ytVpCf8r2jLbCRD/kTrVYEPrkhTtLrhpYTBegkJUyRW6tRc7VlOEJcAUs4zR5XQEMHK/hw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 14:22:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 14:22:17 +0000
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
To: Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
 <YBFG/zBxgnapqLAK@dhcp22.suse.cz>
 <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
 <20210128120130.50aa9a74@eldfell>
 <c95af15d-8ff4-aea0-fa1b-3157845deae1@amd.com>
 <20210129161334.788b8fd0@eldfell>
 <wgUb8smQArgjbRFYMPYVDmukBT-_BrqG2M6XIOkWdBcW_x-m4ORnl3VOvH3J4wrsNGMoOXqMAro0UmkdVXFNso9PEiNCFGEeruibhWsmU34=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f680ced7-3402-4a1e-4565-35ad7cd0c46d@amd.com>
Date: Fri, 29 Jan 2021 15:22:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <wgUb8smQArgjbRFYMPYVDmukBT-_BrqG2M6XIOkWdBcW_x-m4ORnl3VOvH3J4wrsNGMoOXqMAro0UmkdVXFNso9PEiNCFGEeruibhWsmU34=@emersion.fr>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0016.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:208:3e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Fri, 29 Jan 2021 14:22:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2e186047-fe45-48de-0bf4-08d8c4614809
X-MS-TrafficTypeDiagnostic: MN2PR12MB4335:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4335A2C940D073BFFE9744E383B99@MN2PR12MB4335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZlGOfXg5/0ZvNfcE3jTbgh2T5lVud7GARVALo0SkNjdZWt/ErKcwn/AOYUSiZWK+zntfR5XOAMpWQ9PQ42PLmC1sMjBqOdaSUrI55PyK+WQIPnRwsCzGCeI36aV36gfr5HG7aoYUaTjtYjSeSp6MKe7JZMEBSLS/wU9V1Bll9yGs4Zgmi65ij7/jZfmC0cg8dUzQjARgXVSpGcSfPKqAzOu7XJYzZxgiEywDUHFPADwtZtCeiwUsS9cOAryTCsiHI3TqtYTkNhteWtqZzT2h3bIBH05Y2SuerESPwyGKalKOlRDeB46d4ICUWhrB3Fyz7feTPmt3Hc9i7bCqXIrcg6lUF1PW//OHlOXJTXncyNHYLaSIiHP4ZvfzP1gfq/0HC3dQXpzT69RifJp0tv1q8NveuMVpzSf9dUqpjSvjork7uII9ucLbpIq3I49inF3P4MiYc912NuvbqhcKBf26Kr/S+feA6mN+LWTLYdh4pg9traUPvmPj9D9qxA4Svo10B7d5B/Pv84IFeOK2gKNkuXb/NVXH3+v+g3Q30w7bwRGqlVgkO2bvOEPj9Y4pQKqPXg+LUGEDkucyMv1bWh8+AhrozJwo0cfXBycdNfHrgbfSeC7DiIBkYZZYLXzw4mFImtJhbCzst1+NZKlp7GLng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(110136005)(8936002)(34580700001)(54906003)(83380400001)(66946007)(36756003)(52116002)(6666004)(66556008)(66476007)(5660300002)(478600001)(316002)(31696002)(4326008)(7416002)(7406005)(31686004)(2906002)(86362001)(2616005)(8676002)(6486002)(16526019)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXlrblU1MTUrWWpXRkhTc05qY1BaUFg0elVpOEh2cGtEb0ZoQWEzN01aVDVk?=
 =?utf-8?B?czFPNExOdFh6dDVkajNKSHRFZTV2VUhXNDAvd1c4NUlFN0tpWWsvZUZ1c0JC?=
 =?utf-8?B?T3RjeURsNTh2UEpSN3JiUXJ3U2ltYnlvTVg5MUhJMkxOd2Z5NjI1WVU1b3Z6?=
 =?utf-8?B?d2JvNGQvZWRJSEJnNGtoU0lOTVZWdFRPNmlLTEo3eXZGYTZNZEhOdlczaXll?=
 =?utf-8?B?L2oxYWRodlNoNXFwZG5QLzlLU0lZcG1iK1JCRERjd1lBSnRJVXJaV3hGUnJR?=
 =?utf-8?B?b0x2bXZOQVllMUtNWnJjdmpTeHJ1aW9yZGlRZHhjMlVXZmRzRXFScUdTdVhR?=
 =?utf-8?B?aCtQMFNTdWZwUFkwbTM1aU8zSWVMb0w3Skh3QVRNR3pHSGlBRGZLS3lXRkRh?=
 =?utf-8?B?N2lKVWdrT3BNaDdUQ3E4NmlIV3hSTVRQOUZEMmNYaER1NFF1SGp0bVJzWS80?=
 =?utf-8?B?cDUvTnh3STJ4WXhUdndjUFVBREhWMGwwYis0c2puZnRES1hIVkZvcmY4Qm0z?=
 =?utf-8?B?VExsdldldmtMZVR6dE1EWnF5RzVTajZ2ZjBnNE1LQzBESElsRGVKNHQ1bGlM?=
 =?utf-8?B?eTNIN2t0WjlyeGd0MUJmNjU1Q2x3SGNia0dCYkRURng5UHpzbUloRlhyYmMx?=
 =?utf-8?B?NjlGL1VqYTcyeTB2R01scDljL05RY0dLTkYvZHdpSzN4L0JqNm1OQVpRcmMy?=
 =?utf-8?B?QmFsNDBjSXJ0akRYUG1laGcrdWVlSUFjTHdRclRPbWZCbkFYOUFaZ1FVUklF?=
 =?utf-8?B?OGlhRk9MY25HN2lJbEl5YndFRFFsczZKZk1VMGVoSVY0Z2o0d0FaVDVKYS9J?=
 =?utf-8?B?RURZVjhCMGpKcFhmeXRJS2FZUmNzek1oM0FQSDNQeTR1cHRBQmRyeGo0SzFv?=
 =?utf-8?B?ckRaZm5DS0VnYWtFZHpPRkJsOTZvU3FjWm94Q3ZsTCtQellFd2dZL3ZCaUFP?=
 =?utf-8?B?WDN4Mnd6RGxhaWs0NXZ1dDNJVXdKWkcvM0ovaWVSaWlSM09PK3dQakVBdDND?=
 =?utf-8?B?d0d1bGxEMzN1VmNWY1Y0c0Vuc0E4ZTBnYi9DQlAyU3BxZkNrbDBIOGJvQ1dr?=
 =?utf-8?B?ZDU5M255MzRHekRzc1p4M3ZyVFErR2UxdmU1Y1JreUR0N1gyRU40TytFd2Z2?=
 =?utf-8?B?L0w3ck92d0w3dHpYZVBYWDRkOGNiMC9pVDgwc090SDk2bnpXU2J6RFk5ZE4y?=
 =?utf-8?B?NkNWTGdZcUNscHgrY1Z3YU13ZUMreGtWWFZoQjBMZjd3cC9PdUJ2MWRMSEg1?=
 =?utf-8?B?N283OHNsYzBLWVRsMEtLNm5EUjl4NHVGNWFNaUtDZVVycmJRSmNXQ0VKS05v?=
 =?utf-8?B?b2JRcThWMGpSeEJqZlpxMDZOdXBRaXkya2h5akh0MUlQb0Frc0RBcTE4V2ZZ?=
 =?utf-8?B?NTlNeW5VQVBiY3FwWGpDSlArL0diVkZ2eXhFNy84RFJaUW9kYVJDUms4aTNl?=
 =?utf-8?B?L1lqRngxc0ZIR0FYK21rR3B1dWhpQUlaT2FjdXZqWXEvdmhhQVU2VTVnSWhm?=
 =?utf-8?B?OU9QYmhWMUVqV2syVzRaN014MTVzajFzUjQ0aEtHZFBuZ2hmVWpLS0Z4OTk3?=
 =?utf-8?B?N0dudz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e186047-fe45-48de-0bf4-08d8c4614809
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 14:22:17.7526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3dPBsanbqt61ykXz6JRI353vIIOIw8XuWImW/NAafEtFRJs0HQIvD9KNOt+OVir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: Michal Hocko <mhocko@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, dri-devel@lists.freedesktop.org,
 Andrei Vagin <avagin@gmail.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hui Su <sh_def@163.com>, Michel Lespinasse <walken@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 kernel-team <kernel-team@android.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 kernel list <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.01.21 um 15:17 schrieb Simon Ser:
> On Friday, January 29th, 2021 at 3:13 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
>>> Re-importing it adds quite a huge CPU overhead to both userspace as well
>>> as the kernel.
>> Perhaps, but so far it seems no-one has noticed the overhead, with Mesa
>> at least.
>>
>> I happily stand corrected.
> Note, all of this doesn't mean that compositors will stop keeping
> DMA-BUF FDs around. They may want to keep them open for other purposes
> like importing them into KMS or other EGL displays as needed.

Correct and that's a perfectly valid use case. Just re-importing it on 
every frame is something we should really try to avoid.

At least with debugging enabled it's massive overhead and maybe even 
performance penalty when we have to re-create device page tables all the 
time.

But thinking more about that it is possible that we short-cut this step 
as long as the original import was still referenced. Otherwise we 
probably would have noticed this much earlier.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
