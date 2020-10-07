Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67C285921
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA9C890A8;
	Wed,  7 Oct 2020 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0863A890A8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 07:13:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSOwKnSp71wrRp7wjEi4SQdcV1lC3htsbN9K5oj1NUa8cyEcF6b4NHopu1s+PgnqbJ65PI4T5JWd2LDBIaQdSHY/e8DC1P5XCs0iMinnCEi85pIs+rLszpNayVQCsgVkAF0ZT6VKe3aY6G5iTjRkhKTz6SRTrnhTLZEsLMRRo1ls0m0ytQd++AgdxrWQ+pgs7HBwftXWSt8S4ZLZKiL/VsjBXoUjX1TIkk78BDK3iYrBOpJ4Cj+BXcnwbD9VGf82N3gXSSZOt4eKuBWV7rWngUxH2rAKTfftoUMzGZJPnDeVAfOC0ehumY23jn5Gl2N5BlbP8NLRszlCf6K7ouLG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEpUHoOjky1yM60BXPTG/EA8BbeAzTKN2cwciBN7a1I=;
 b=P+job8eUiNf2eGsHOiJX5V1CjwhBz4GwJ5eT0RoLSCfeHuFlYJUMoT4iUFn4ti2kJSw4k5nfgIEbEaZTvOAqiOhG+uv7OhKUD3ZyL+Ebjbp3Twz/RGHXtVHXhiHMpsC4ZghlRr1lYOGDvcYF4ONgp/bodG09hDBPhjQSCNcLZk76maYjRiHklaVwe0iVA+BF6XrAxTK/IgIk05rDpZnx7WILeqjFOQSjjwnQUwLYElhHXNLdKlY7HGHj+9hEnZG+1JgXa/YVGADP4njIjyijC3NbI8icWde1N8EENv1B4G2tow5JAkCRnr5RZhhJQrn4av0jTU4uD8fR1vX6v5ybhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEpUHoOjky1yM60BXPTG/EA8BbeAzTKN2cwciBN7a1I=;
 b=muLtk21c5ToQDt5ZgaMCg55+izKc85Q5pUqHombsBk0T3Ut+uQSh/i1OTSMAhqYOth+iiJ9MwRECdILf4ZVkv8/VSIBvzg/CYaS6jubgIqK23mKYSN1Cbrw8FHiVfdgjDEAYg0qPNMYr6HWI+f6jQzILx37l1J+Gb64YS3hFf28=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3677.namprd12.prod.outlook.com (2603:10b6:208:15a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 07:13:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.022; Wed, 7 Oct 2020
 07:13:51 +0000
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local> <20201006154956.GI5177@ziepe.ca>
 <20201006163420.GB438822@phenom.ffwll.local>
 <CAKMK7uG1RpDQ9ZO=VxkNuGjGPqkAzMQDgi89eSjDoMerMQ4+9A@mail.gmail.com>
 <20201006180244.GJ5177@ziepe.ca>
 <CAKMK7uEN7=QGOJMMf5UwR5Azsk+3-apFjn_hFmoSUTDOh1f85g@mail.gmail.com>
 <20201006183834.GK5177@ziepe.ca>
 <CAKMK7uG_gFdyMTQetx56NqPommTu3EgVQ2eQUW_K8x=WmxPZyg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0a407552-606f-2e62-e9a9-afeea0c6b85a@amd.com>
Date: Wed, 7 Oct 2020 09:13:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uG_gFdyMTQetx56NqPommTu3EgVQ2eQUW_K8x=WmxPZyg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.16 via Frontend Transport; Wed, 7 Oct 2020 07:13:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56c5a182-3c02-437e-d79f-08d86a908aaf
X-MS-TrafficTypeDiagnostic: MN2PR12MB3677:
X-Microsoft-Antispam-PRVS: <MN2PR12MB367782B50D8FD25EFB4B6FAF830A0@MN2PR12MB3677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YYUX6xVooqXH7ETIsj3rtVWGFzzgwgFnl7aQk8B6cl7UliTdUBOWAcLt2vcE97DP1Sp8+Mi7zzuYxzs1kkTSGQp/E6Tk/rvTMSolb5kGgwTiQ3BlD82mvUBCh03OK13yVxL/tV1H0+n6w7ODj0dKkB7MF/Wy69L78+R2epiNs09yW3rUyA87mZdxn8TLhQtqz948cnoANT0bgVSXf0xytpnJrJ5xv1dWeXvz+g3ncM15CpHnIg0KwQRy2mjVq3JNm1M7q2bYAFuIXVFi47SF3NWPbXuELXVr6RC/gwUyHj0jb2cULClddHEz9jDkX5x/LlupptW3/nOIK35J/pLPCW74z8QJQeQhtcCs60Ncvp6NjJnNmQMlogI6TuI7a91R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(6486002)(86362001)(52116002)(8936002)(16526019)(2616005)(83380400001)(186003)(31696002)(31686004)(2906002)(53546011)(5660300002)(478600001)(316002)(8676002)(6666004)(54906003)(4326008)(110136005)(36756003)(66556008)(66946007)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wqlDodi7+R8bai+dbzO1jR/Z8/YpZxWgRpr8YAz916LSx9We7NRiel3vOL7Alk56TV/mlmjw9sd1Lr6Hsh9XtKzFeZ/rUyJaXiOgq50+KUR0K87vhNtcULi5phrKl3GgOKe3asE8FP+Z/XJbx9E+mFuQNZuIGN7Y66rmzs9zNkDpg1YTGRONKns8OWd7/dJ2Hk+KQJYABUhzd5M0p2b2kqRxmlDrH9fddvnNqgC/9HGIucP+42sPYOF4bI38oMNEanMAuVOxtXAhO+HxsMQ1aFLYuWGst/p/lyNEa7p/iTMNocs7LnQLaZ4HpfHlZcf0qmHhoWFEXrHZrdQIlP88wyF2uaarX9KP4jtfL7exhJHKIH3W4kH/BYVToq1sHU6b+ZtvEfx/IlAE+a0UWYyhDNINtEXEHZtXDNLubFSTKORmHbch1UKSg9Yy+nwbDEfNJ7EqtIWid2tfgALf/oyPqPHazZP8/VzxkpZ+HGRTrNDLfWZr1SIgw0tqEVWAYbrcKUPiF2ZhMhWJJVp1bg4rAmFvoO8TXT0uwEgexPdwxDt4gEUxNCw01H2ak8onJOlZ0XSJZC5oxlkWlrpsF2MruAb6hxaluAkvBgLyPq//Pm8h/YPuQLaQbq7mIkrylBwexiNmwyv/HrnAHNY3iHrTfoApfteKYRAa/yQGuhpsfo8goprW3dOb+5Q5AR1K76KfUByjOfpy7i5/yr2DMzHIIQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c5a182-3c02-437e-d79f-08d86a908aaf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 07:13:51.1098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwPsqPAs9o4+B7bYxnVAeYfpj3RS1yAm9W2uqPQo/LWaNaBYis6Wfk/jg9Wd5W89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3677
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

maybe it becomes clearer to understand when you see this as two 
different things:
1. The current location where the buffer is.
2. If the data inside the buffer can be accessed.

The current location is returned back by dma_buf_map_attachment() and 
the result of it can be used to fill up your page tables.

But before you can access the data at this location you need to wait for 
the exclusive fence to signal.

As Daniel explained the reason for this is that GPUs are heavily 
pipelined pieces of hardware. To keep all blocks busy all the time you 
need to prepare things ahead of time.

This is not only to make buffers able to move around, but also for 
example for cache coherency. In other words the buffer could have been 
at the given location all the time, but you need to wait for the 
exclusive fence to guarantee that write back caches are done with their job.

Regards,
Christian.

Am 06.10.20 um 21:12 schrieb Daniel Vetter:
> On Tue, Oct 6, 2020 at 8:38 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>> On Tue, Oct 06, 2020 at 08:17:05PM +0200, Daniel Vetter wrote:
>>
>>> So on the gpu we pipeline this all. So step 4 doesn't happen on the
>>> cpu, but instead we queue up a bunch of command buffers so that the
>>> gpu writes these pagetables (and the flushes tlbs and then does the
>>> actual stuff userspace wants it to do).
>> mlx5 HW does basically this as well.
>>
>> We just apply scheduling for this work on the device, not in the CPU.
>>
>>> just queue it all up and let the gpu scheduler sort out the mess. End
>>> result is that you get a sgt that points at stuff which very well
>>> might have nothing even remotely resembling your buffer in there at
>>> the moment. But all the copy operations are queued up, so rsn the data
>>> will also be there.
>> The explanation make sense, thanks
>>
>>> But rdma doesn't work like that, so it looks all a bit funny.
>> Well, I guess it could, but how would it make anything better? I can
>> overlap building the SGL and the device PTEs with something else doing
>> 'move', but is that a workload that needs such agressive optimization?
> The compounding issue with gpus is that we need entire lists of
> buffers, atomically, for our dma operations. Which means that the
> cliff you jump over with a working set that's slightly too big is very
> steep, so that you have to pipeline your buffer moves interleaved with
> dma operations to keep the hw busy. Having per page fault handling and
> hw that can continue in other places while that fault is repaired
> should smooth that cliff out enough that you don't need to bother.
>
> I think at worst we might worry about unfairness. With the "entire
> list of buffers" workload model gpus might starve out rdma badly by
> constantly moving all the buffers around. Installing a dma_fence in
> the rdma page fault handler, to keep the dma-buf busy for a small
> amount of time to make sure at least the next rdma transfer goes
> through without more faults should be able to fix that though. Such a
> keepalive fence should be in the shared slots for dma_resv, to not
> blocker other access. This wouldn't even need any other changes in
> rdma (although delaying the pte zapping when we get a move_notify
> would be better), since an active fence alone makes that buffer a much
> less likely target for eviction.
>
>>> This is also why the precise semantics of move_notify for gpu<->gpu
>>> sharing took forever to discuss and are still a bit wip, because you
>>> have the inverse problem: The dma api mapping might still be there
>> Seems like this all makes a graph of operations, can't start the next
>> one until all deps are finished. Actually sounds a lot like futures.
>>
>> Would be clearer if this attach API provided some indication that the
>> SGL is actually a future valid SGL..
> Yeah I think one of the things we've discussed is whether dma_buf
> should pass around the fences more explicitly, or whether we should
> continue to smash on the more implicit dma_resv tracking. Inertia won
> out, at least for now because gpu drivers do all the book-keeping
> directly in the shared dma_resv structure anyway, so this wouldn't
> have helped to get cleaner code.
> -Daniel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
