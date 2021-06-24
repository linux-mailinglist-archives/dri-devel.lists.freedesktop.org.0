Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD613B2BD7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654976EB47;
	Thu, 24 Jun 2021 09:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696496EB46;
 Thu, 24 Jun 2021 09:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMSovInSeqscmIjdZl28v8EUHc3qIrlIIvBsJmBLGpMdEAMPFwbsAari0+Xt12brATJPqYKkFNbXHAzfPLjK0kIvDgywOAnxFrWSuKrAOuZi73/iUETcRniJGiw9hyYl3xDC6SqbQ/3oK0FzIj6YGmTK328ET72GtnWPY67lvNdqZoN+ABJ4ZPxWpU5XAJxPs2Y8sr4WTochbh4QjpUh5MSgoaQ73CwcivTutDXQr2p9Zy2OqpK87cpCQELabRJSJFJE5vgcRqNWYErWyIeCPAvs1r6Qv92LyxVwq/Rewi7e34rQ4EQIEPUjbNTbJKuV70Li9OGr5bSXAu+K2iie8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hl6R0JiV5EtAwY4px38KP0cu53RquT2zE0HH5fII+WQ=;
 b=Q4Y3EA7SFApvOvISdk4uHq+pZtQy+RNckw36hqjCOe/lzbiy/AaPM/fc3pO9SK7MjVVIUWgsjovU1oUrMZrBNDQ3gQGcbkEl8Y5VdrSjbVmQ9x9EfnN1TOamoN8wTLPB9+gkEC3dOJshaa9UHt6I7AgUkC6p+XVykPVF3Wc98F16mzjmqBhLw7KrjS5Qqy4HCd6G3QVaknUMU+gbCTVai9Lq6JhZ5jYz/IAFCjo5yO3Mjy/Y0ZyM4dEd7Exg1K5/qY4Yla+WMx6/0bZhEy0Zk2t7T31Wbcce76m8USZrm8xKhzmhPrMdnsc2YfPAGc/EAIdagOo4A1CvJUHCBKBSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hl6R0JiV5EtAwY4px38KP0cu53RquT2zE0HH5fII+WQ=;
 b=ty2Euy2V3IDUd8hkjda4Jr5FvpIuZJsXBUCczn6mh6GXlZKXUY1KowRRnRLyRDF13Y13ex1LTf9mwJEsqQSNIW2shAvpPDythgXpbONB1pG91r7G0NvseBU80I0ctFiAQJAprPLgjcKRvOSZDQDd+2V+ZrgHOODtCE64MvLqKJo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 09:53:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 09:53:00 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Christoph Hellwig <hch@lst.de>
References: <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
 <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
 <20210623185045.GY1096940@ziepe.ca>
 <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
 <20210624053421.GA25165@lst.de>
 <9571ac7c-3a58-b013-b849-e26c3727e9b2@amd.com>
 <20210624081237.GA30289@lst.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <899fe0ce-b6d7-c138-04b6-4b12405f8d93@amd.com>
Date: Thu, 24 Jun 2021 11:52:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624081237.GA30289@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1b1b:b0cf:e32b:2813]
X-ClientProxiedBy: AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1b1b:b0cf:e32b:2813]
 (2a02:908:1252:fb60:1b1b:b0cf:e32b:2813) by
 AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Thu, 24 Jun 2021 09:52:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00420f8a-7e8e-4ff8-76ba-08d936f5d9d5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45495924BF568FB930F5736583079@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCp8qYv+ofxlyEP4O7XheNassrSOq6sm1rN/jE4dIgMHbtNxuYnkmK7fJAgKCfOCvICEba5ICiPyVRXn0Gql7H55OB5CLvLRcsGcVJm93sbdmWnNnBKRGl2loci3xZJj8QxP5ZlOZTioRjrrEbz0MfqqvX3QLqnFOvp5EkVo66FxGftaASvS/isJmfeeW98f3KK5hShjHi4IKUYkgppvhPp6STUHVJTldjYYn6HUEKt9a5AisURd5PzGRwwZLS82wXT+8O3A8SbnvUupClk3D2NxPfzKFdKicf5BHaV1iU0JoRAi62armlkwHj3UBmFAeCNwtTg2EkaQAfuSQ19jhyMOjw54N9YLfU7YbxEqsrbYU40IIpTxu0im491UON7PKePow61A7huJTKz28XceqXLqJamjgcwK1SNUhkFr2WfEUNZiIP9zPmjC9qZmsW0n6EOL+3qRjpNWUKdblh+ZlTihAKSVp79jn5MGVt7DJqMMutQW1nPLWf121KQHVG1omcc3ImNeg34VA7CJ5XEjXzNXyagjI3Fs3XDemhCKx/rHfLTg5MflesP+ziE3AE+zJuxVXn4Ywkb0E/UkCexfCPFCbbQHHXAQxqeiRvVszC91B2YG4eLRDPjyyPFXJoJ/OU0McFs94FaWmCppVW3mg68AfsV+MvKzwvxjo5D8JAzgmdwwFwjOOBoBQ6WCmLi+c8DTxsGnR1gFNREQT67qnSxXJrCr6uSWuVhcDzTgGpltTqGjPWcRLCy/jbuSNAyj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(36756003)(86362001)(66476007)(66556008)(66946007)(6666004)(5660300002)(38100700002)(31696002)(6486002)(83380400001)(16526019)(186003)(4326008)(6916009)(478600001)(54906003)(7416002)(2906002)(8676002)(316002)(31686004)(8936002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkdVbEZDRmUyTkNQemd2c0VGbDdrdVpnanpGZ292VWgzVU11b1RxSDJuMWtz?=
 =?utf-8?B?UW1kRWtVYjdSSFU5ZXBCWG1XeWhESWI3UTZVQkxXbXJwNHdmWlp3bHAvWXVM?=
 =?utf-8?B?ekYrUjZqUUx3RHBwRmp2SkFtQ28wckxkT1NNT3hudnFQWWVCSzR4R2ZzSDMx?=
 =?utf-8?B?NEJEcFUrSytFMTRnL2pOQ0ROTFpMSTVBczkrQXVycitSaEsvai80T3RjOTRR?=
 =?utf-8?B?TzZMa0Y5ZHNXZDNCQW8xbjBqUFFjZ3B4cEQ2elJFMlBVajR4bE9Cby9hT3c0?=
 =?utf-8?B?RXlkOWMwU2lEdHVYZkJqRzF0b2ltNXVvejdWRnpVb0p2dnl0cHB6NmlnQnVG?=
 =?utf-8?B?R1k4eXFMZDliNW9aK2FWM283Y3gxbGhNMXpzb0laMDRaN2lyMjh4MVVPRmRS?=
 =?utf-8?B?MXJuUFJNc3laR1hRQmtJOG40NU5Sd2hrS0dMMks4T3ZOYTFpSDlPdHZXYTFQ?=
 =?utf-8?B?aXZVQU5CRXVpS0t3Uk1LR1VPaHR6UDJ3TXdTaTg3YXVvSjVuV3gvTEZyMVBk?=
 =?utf-8?B?SmpRQ3RjSGQvZUtENjN6VGFhS1daSkM5TGZNMElQWnhYMFpsbGt5S1g2UGdi?=
 =?utf-8?B?U0FvNE1KVnpuUmRPUFRzUmpKd3ZUOW1RY2k1alBqY1VGdUlqWEsvYnhRNURj?=
 =?utf-8?B?aU9OTnNkM2hVYkplcHpCQXp0cDlLdWU5WHdDMXJkZVBmendndFd5b1g4aDVB?=
 =?utf-8?B?dHNiUXJhYnMydWMrU0xhWEpIditQcm5odHFUTDNydGRkTUNleWJGT1RUV0kw?=
 =?utf-8?B?RjlBUE81RndGTUJuUDFNUTJrS0xzeVZJWWVDYzhrb3dOTk9LQXU1Y2w0MVBV?=
 =?utf-8?B?Q3BWMnNLQ3VTb05xZ1MzZGxwWGM4M20zUjdYdFhOaFY2NTlid1d0dGZtWGtS?=
 =?utf-8?B?Q3lvWlYwb0RWY1l2ZFM4VFpHMDdCTkNoSFQ5TmROanBDTEptRmlaU2JUejJm?=
 =?utf-8?B?aHZkRVdUREd4MEpUQlo3bmptK3FqQ0Z5SEVRMFR3eTFWemk3UmdlL3dpdVNX?=
 =?utf-8?B?dmNSVHY5RHdrcURpbEJBM0JQVUJaSnhEN0x6dEMwS25abEZiU3N2dmpPL0ZT?=
 =?utf-8?B?OVZwQjlzWGNDQlBJRlZZOUhuMFordTl4d1BCbDNsNFI4U3M4OHhkaEdtWTI3?=
 =?utf-8?B?Y3JCNk55YTgwS1d1NVJZVXZXWk10ZldiVEVDY2svR2I5RVZxOHJTdGpZNFVk?=
 =?utf-8?B?ZDJwUnhFQmFJZVVxQWVLam1XSHU0VThyMGZTdytrWmFsRG1lRVB4cGY3OXYx?=
 =?utf-8?B?TkNXOVdCSjhwY0hwcVlVdHhsaHBIYVlDenExR2RIQ1NYcWJOc2xlVE5uVk1u?=
 =?utf-8?B?U0srbUl3TFd1NmlzTEdjK215WFVhRyt4RGhzQ0FBMHhrbFlFa1N3clBqaXBv?=
 =?utf-8?B?a2dIM0RlZWxsYjAyZ0liNURUU1FGZTZtVTJmS3VvYVF2TWQzSWdwVjF4NENI?=
 =?utf-8?B?WmwzbGw1c05OcUVIMzF5cGJaTnI4UWdrRzJ5WUo3VjhSZTdSNWdrMm1MeUpk?=
 =?utf-8?B?eFpxWmdxNWdQT3J0SmlTcjc3NVlRd0c2NitiZ3dQdUlWeHZwTnZZK3VSMFVu?=
 =?utf-8?B?Vmo2OHVvRVZ5UkxPSE5iTllJWlJ2eGVrRGx6aVVjOUJTMktNc3VpZFpNMURa?=
 =?utf-8?B?ZGxxenA2OEpZV0RUWDRuK2d2b3lERU9HblJocXVyR2d4T0FQbVN0S2xEdlBF?=
 =?utf-8?B?ODZUQlJuek1KNVdZWXNxanNOQ0VRbllYazJ6RHBtZW40azdVUUJmRWVoNUpM?=
 =?utf-8?B?czBScFFsZ2hLOVVueVVIYndqaG1zdFJ0NlJSN3NFR2VwV2wrWURFWHJ3Vk9D?=
 =?utf-8?B?WFZTZi82dUtMSVlKeEttOWExSm9lVCtiTDJVeGk5ZTZLZi9Ia3lWUWxjc0VW?=
 =?utf-8?Q?/zNPVxfG09YwW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00420f8a-7e8e-4ff8-76ba-08d936f5d9d5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 09:53:00.1787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUyJEDjLX7nbe1UPsvdZTDgdodSnK7LA0BfKYd3jI6fecl5gWzqhZFW8Jtz25Q0j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 10:12 schrieb Christoph Hellwig:
> On Thu, Jun 24, 2021 at 10:07:14AM +0200, Christian König wrote:
>> The key point is that accessing the underlying pages even when DMA-bufs are
>> backed by system memory is illegal. Daniel even created a patch which
>> mangles the page pointers in sg_tables used by DMA-buf to make sure that
>> people don't try to use them.
> Which is another goddamn layering violation of a subsystem that has no
> business at all poking into the scatterlist structure, yes.

Completely agree, but it is also the easiest way to get away from the 
scatterlist as trasnport vehicle for the dma_addresses.

[SNIP]

>> My best plan to get out of this mess is that we change the DMA-buf
>> interface to use an array of dma_addresses instead of the sg_table object
>> and I have already been working on this actively the last few month.
> Awesome!  I have a bit of related work on the DMA mapping subsystems, so
> let's sync up as soon as you have some first sketches.

Don't start cheering to fast.

I've already converted a bunch of the GPU drivers, but there are at 
least 6 GPU still needing to be fixed and on top of that comes VA-API 
and a few others.

What are your plans for the DMA mapping subsystem?

> Btw, one thing I noticed when looking over the dma-buf instances is that
> there is a lot of duplicated code for creating a sg_table from pages,
> and then mapping it.  It would be good if we could move toward common
> helpers instead of duplicating that all over again.

Can you give an example?

Thanks,
Christian.
