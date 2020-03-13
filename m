Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71A184835
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 14:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15656E45C;
	Fri, 13 Mar 2020 13:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C696E293;
 Fri, 13 Mar 2020 13:33:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN1HYwEwvBONBC1rO5l1W2hoAVFWuzwKiLyEmlolj1l79ujTAH0jA/BNAgjV7/oH7jP2Qfg5x/aoIoMp+6vjCBXIkCdrDqmE7GkvQJDDX8B1tLex4kMTEn3sAMUu9g4PtoylhxA3b/JPkm5xLDpO+TcPLGvQ5NOM+ZrbBt/wHU63VetRrO8lml4GcJwKfXub3kd9J41qAAEx7GoCpg+bAddihVLKyAVnmqLrNOQ/9iwpxcI7RDeu8L5GwEPVQ8AKCOyyrMPA8ijfuEvHLt5WFgFqCSmLH0ilPBeb4zD4Ql2W0ieejHOvAUm+ZCM6ADbYLrvtXbpD5870C21b30txdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylnX//eralmqw1boCGRLSksDrlq2UQuXz9e91UJT+oY=;
 b=UXGKmZN1OuZAZ4oTaHN3KE8tM6hu/Rra1J9KMhsAgCg4iTvAGN+R+AePqKq5NBiqMeFsM62hTrVYUYYcySIU2AzgtxCR+6QdrGASZiFxpdpkxIkWtWNZFwBpmsj8uvLNtwhHY9bYI1bEeBbg00DL78g6sSbu2IegB3jQK6vGcXASPjXs5cr7JM82PKX0RwPZAJmNYpzhmKkKR65veW2mPGXddSQRPqMhv46/MGKG5xYVCeFWNMNFw486jz6etUFg5je6CWCBOK3d0+lwWihaZ2zsn47ik1kqhU/w+MWoHMEoppY30l/gSbwwOYeVUkVy8NIR6JLK4I7NkJbRqdicKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylnX//eralmqw1boCGRLSksDrlq2UQuXz9e91UJT+oY=;
 b=O7dKIf+sLv7F9Q3c3BkJ2fY7kASZMn+80uLAgyjB8LoXQ5pBVwGIijL3Yp3xIyvvHBkRZJ0n7vw1ojKihpKEfJnnF+JhAPvRJXJy77rE8ztjkeN9O9g5D6Z7IgyGgkywRzgnt16PPk6nbs9r1zH/4dnMATgnhhMK+AmWPFwle54=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) by
 DM5PR12MB1658.namprd12.prod.outlook.com (2603:10b6:4:5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Fri, 13 Mar 2020 13:33:43 +0000
Received: from DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::113e:3059:1470:c73c]) by DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::113e:3059:1470:c73c%7]) with mapi id 15.20.2793.021; Fri, 13 Mar 2020
 13:33:43 +0000
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org> <20200312141928.GK31668@ziepe.ca>
 <20200313112139.GA4913@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0beef7ca-dd77-b442-5f45-f3a496189731@amd.com>
Date: Fri, 13 Mar 2020 14:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200313112139.GA4913@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR0102CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::25) To DM5PR12MB1578.namprd12.prod.outlook.com
 (2603:10b6:4:e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR0102CA0048.eurprd01.prod.exchangelabs.com (2603:10a6:208::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.16 via Frontend
 Transport; Fri, 13 Mar 2020 13:33:42 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d48c0ca7-2d79-4639-9cdf-08d7c753264f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1658:|DM5PR12MB1658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB165803FB9A82F627DD983FCE83FA0@DM5PR12MB1658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(199004)(86362001)(52116002)(81166006)(31696002)(81156014)(5660300002)(4326008)(6486002)(6666004)(478600001)(8676002)(31686004)(186003)(16526019)(2906002)(110136005)(66476007)(66556008)(66946007)(316002)(36756003)(8936002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1658;
 H:DM5PR12MB1578.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJ9wANfwoC5IJZfK5WDR+HflR2ng8AnvtFdsxslPFfMtcD95MUALMMZabUQn6VxVZUhL1pYu6vIiqAPN0l9736Kej/eCxxSJUC/Xx2wzaU2nx8J/Fs50ESrBRGOJPW+TFd4ThzfTV65/y8IWu3N4fDXf8hewJCqv/5AI935yGgP33CO1W4B+N7e5xWLiwfdivkEWkruNEEPKVR2WgLFqDRHKjjQnnK35k11YsI/4+rdT9ohddKKGqkux2lnjbfJZFE95y35EqscUj98dEqEEnBouAh5CLhh6kW6MkihwuxP3YLjDKkd4V5K9JOJGqRxvAIXHiR3hLhdxdNIoMlxaNhBNMg2uoRX3K3On59uhqo49Y4ftZegievLw5fZuD0Rish6VDunmziz0k+bpXLBvKfOvT6ftJTlhzY5LXAnb+/Be5Wjzg5M7hltpGMo9M1w7
X-MS-Exchange-AntiSpam-MessageData: NtjCa5SSqEVsxmcYVtUkH8+wkp2hrqH2Zq+Hg/U0ojM9GZxxw3VCHcJsTbYVf8IlF387/tfIxIFLTgO63Sy/6Q3BKrjRONPDuZtjg+zAxI6kPwjh7Vn8luGR0IB2vtO7gQfWr1D96kyrXIWLvD2xwqLmj31dCJvBIO+2BpEpMYcxZ3uxGY9jE4TmhwRQ2AwrRsF9MO6nKoo5IMSemvqpRw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48c0ca7-2d79-4639-9cdf-08d7c753264f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 13:33:43.7288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mDCkjTFhm2hZt5VrICpYq/KI3LGzl0xiMPooaR0XY9LpxHJwdFR4Yk4CUdMEdPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1658
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Logan Gunthorpe <logang@deltatee.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.03.20 um 12:21 schrieb Christoph Hellwig:
> On Thu, Mar 12, 2020 at 11:19:28AM -0300, Jason Gunthorpe wrote:
>> The non-page scatterlist is also a big concern for RDMA as we have
>> drivers that want the page list, so even if we did as this series
>> contemplates I'd have still have to split the drivers and create the
>> notion of a dma-only SGL.
> The drivers I looked at want a list of IOVA address, aligned to the
> device "page size".  What other data do drivers want?

Well for GPUs I have the requirement that those IOVA addresses allow 
random access.

That's the reason why we currently convert the sg_table into a linear 
arrays of addresses and pages. To solve that keeping the length in 
separate optional array would be ideal for us.

But this is so a special use case that I'm not sure if we want to 
support this in the common framework or not.

> Execept for the software protocol stack drivers, which of couse need pages for the
> stack futher down.

Yes completely agree.

For the GPUs I will propose a patch to stop copying the page from the 
sg_table over into our linear arrays and see if anybody starts to scream.

I don't think so, but probably better to double check.

Thanks,
Christian.

>
>> I haven't used bio_vecs before, do they support chaining like SGL so
>> they can be very big? RDMA dma maps gigabytes of memory
> bio_vecs itself don't have the chaining, but the bios build around them
> do.  But each entry can map a huge pile.  If needed we could use the
> same chaining scheme we use for scatterlists for bio_vecs as well, but
> lets see if we really end up needing that.
>
>> So I'm guessing the path forward is something like
>>
>>   - Add some generic dma_sg data structure and helper
>>   - Add dma mapping code to go from pages to dma_sg
> That has been on my todo list for a while.  All the DMA consolidatation
> is to prepare for that and we're finally getting close.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
