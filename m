Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5553D58DA40
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 16:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9F19906B;
	Tue,  9 Aug 2022 14:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000FB97EF5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 14:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htiZGUeJ8q6oxDt8ujq/A0TWoRxKCaVMbDe9EPfr+Z9+JWdESCEB+leor5Qw5c9HqQ1bcAxNf4o6hiOjvsiDEJhY4m9bQ9DNKc4+lo0b2DHQUEd6r1j7mEUbgeSva7TKHtE9meVXop2pdgSRObZxpbxuQKiZeMh6KMzwdKDr5JsFUH+9ZipwTUZklOk72L9ufN63sW3blVtz51I/lVhlw19Q22vXQS5DeTWmaT8WnVoEANPfH6KYnA3n978TcboDShIahva+vIXZ4HG/8xmY2ogOrChGDPw6kcwcs5/Au4A8dQyLNx/R69iAH+OVyc6ujd/rWv0AD/9ivYXkgQa0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Irlx3GmywSoiLpLjVZno+HdNtktSY4X3TGcX4YUAaXs=;
 b=VzjSfFzld+7mr0lc1lr36P3T2owVsPiynayosbAE8R8heytjvjnwMDSfUpZN+6h59r9JBO4dtbJcl4ooza7M2IIdIgfvBhAUToRwCHwTmCDKO2wMrzPivuObv9tYO6Xu641C+bOePE/LjqRKjBHHHmUq+WfVm8bwxh0l6x4Mgu7b7j2JJCyzrwWfMf6XPicZ7mXfhy0m64vZmlDskk8wpKknB6+pAjq5Me8iaaqSoTHYTVC8jMFyydN9HBMgVujrf/6iGsB7LrErWZjdulTD6Wu+EoEPTnxvZQTcOG6hRWNzGUbWRJeNrKOqmWDuNz8e67EoPzeQDmFspse0AX8Dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Irlx3GmywSoiLpLjVZno+HdNtktSY4X3TGcX4YUAaXs=;
 b=l/jOCfXAkRrd2HKepkVUsLp6Wvti+tX2r00gnMN1I6kSBGoqRapVz3xTBcdRoQN+2CJ0xvIujbX9aIwRlViOe3Kk1xwjFROeQczuzVxNji5a/zmCD7wpC8YtMWWTyS34rG7HGTWrpzZ3hpAjLxNLpwb//OYlLPCuNYCMjGpT4Pjuv4j0nfQ2W8/Sr9YLGSSSvYHu13rGcGBO1pQIf6GvcAHl6bGraEZUuRmu5mbYkP8OedzXN8oBiG9oNMmip65GBfdHZHtpY7HI1DfUIrmkzFt5RklVWN0BibTGEXUvms3FYoOpkap/zm/RbbPNk4+WwRR85+L7DEqF1lM2UcQRJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 14:22:23 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 14:22:23 +0000
Date: Tue, 9 Aug 2022 11:22:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YvJtnW8gvFzdSfH0@nvidia.com>
References: <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
 <YvCozvgodIY19LSr@kroah.com> <YvFOEPdC9r8QBH11@nvidia.com>
 <YvH9X5puer4jpzMX@kroah.com> <YvIU/wMdqFA1fYc6@infradead.org>
 <CAK8P3a3y2=FyzK4S6MRfZdrz=DdLat1ajdT_uPmN533mNYmF9w@mail.gmail.com>
 <YvJQqxWAQbevR9Ok@nvidia.com>
 <CAK8P3a2149buJammrS=hqHPjKOYLRjJOxpSuT8-D_avYPZndOA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2149buJammrS=hqHPjKOYLRjJOxpSuT8-D_avYPZndOA@mail.gmail.com>
X-ClientProxiedBy: MN2PR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:208:239::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb1ebe20-852b-404b-0aae-08da7a1293e3
X-MS-TrafficTypeDiagnostic: SA0PR12MB4368:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iOwB7H+xlWdgvpuKFLXFvWxrtYFoIIHj/mhdxt58pH8BqG4G8gazma1rwHMjronm2csg0VMs8YNDWuDpI+HtTmW4pbgAPLuTjwSv36536Xyamc2+hIAfGO8o9zAMfG7pD2piGr4BK8udm4ACvuZK5gNnkdGAmMO2k/yDYV7FLXh/9KEdWg/cK1KlW/qe1NjmwWKpiZiHEdnU+qcbM3+X/E77Ob3nLHXSknpiUxZYVUXMASbI85sAuICcGsvFyKuNHMg/5SVYg8CLvkultfhijCOW8Dbdeiw5WP0JoHX7SFphB5doZ0QMpA3guXAnA/RyqGHqRh1HPIo6WmA5eFaZXjb114uw5+jzj/QZE0blOS2cfsz8AaOeHieR7TI35QkEw6cmBt/2qV19/C0D8m1J+WErt4UwmveC+RKTexmyD3LIQSPy2FKKw1Nkuzv7w78hA2ooFbRAKDwEby8/w43wB+qzS1nYEkbMsLpkhyvsmDirqpTFZxuATkJRK9zOSwBEx6RFddm0nX6xGg/droIoY7Z4Vdt6EPgZ8Cq/jHL9T765XOYv3Z184SfSPWt44aezRAb6Em84lfxaauYFeXiqBxKE4/lO7So3AkYHG1erpuYnmedcaLklbMA9DFvDde9L4kUYJiR+J9hwOSVYcm2+rdNE26ZV75sRwUp6Cm2vFSLQI8aNJ5JATB5Fqxj0Tgpmbz1cmnak6C8KIk7bKVd965jWy7Q0AuFMV54x5nLxGTXQMIxcqsPfgMPzpgPg/Xjk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(86362001)(186003)(6506007)(83380400001)(53546011)(26005)(36756003)(6512007)(5660300002)(316002)(2616005)(6916009)(478600001)(41300700001)(54906003)(6486002)(8676002)(66476007)(66556008)(66946007)(38100700002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTmJptS8+I/PVzJsP0sy1SiKSRsT10c+91IhpZpvH0v6X0FH1yVzrGZMKZmu?=
 =?us-ascii?Q?FB1ccKjCu52SzS9eEpvZ1Kd0q4iJ5CF9pOxhonndCsXVQv7q4nXNbD1UMGBP?=
 =?us-ascii?Q?0ft5l+ybmMYT/A0cFv8kKgbq40z3fm5cjDRhp6NfLpZHP8nI58XnWEIXkO49?=
 =?us-ascii?Q?0V7bXNklGfgKoOnKPnT9aUqxeA4Pb5pQWWyTrWdzNcPlQay8sOnDwtsrBEf1?=
 =?us-ascii?Q?qavaPMadUeMhAGT/LJxqkEPpKDPum8YkHCCYZ+dLIGzMwrqAlJBYK5HODbBx?=
 =?us-ascii?Q?fHqESpQ138TokbGaYBmU0I5A16dKT8ve+8aQPsd7SdADuCHJCW/1cpEZrYxX?=
 =?us-ascii?Q?P1YGxU4JlLcEsAuHfIi0cLeU+QB5tE0358tkGwI06N2A4ZYDKgH8yYzS097h?=
 =?us-ascii?Q?rQ9lZ5U+bRqiWzdbnPFyh96rgrwPT867kLN7lew3Ua9S03gS2qG/gegtOdEL?=
 =?us-ascii?Q?tfvfqpI1Hf+xzjsQUAWchN3PtNnGajHKJl6tamzdIy5KtIAil/f1fT7EwD/Q?=
 =?us-ascii?Q?lLg5IF1GNoi7VonfLGM1T5h8fDn0XRYa5PLKvKL+ordY34+StIcTQLaLbcuV?=
 =?us-ascii?Q?JXiWgYnMNekPFoA2NAexO+a7OIs9pVl6TOXEYGI7tF3R2tpE7lTOLGujC9Zk?=
 =?us-ascii?Q?EBd293u5RuNYd9kt9ghIkqn3Xno6OOvWrhJErtrz8wcX3a3Kh65LvAPqzL6e?=
 =?us-ascii?Q?vkjmEnyw6o+qhcxkY9wb05r5lBIzKAxtjAHuRtK8FsDTDfn9uIJqPi8nxqly?=
 =?us-ascii?Q?O/D254Oxo0hkQ2/IjDXMWR+q9n9koi+zWYdaGBZrCOaDtEvUaFUP1dvnZ9Ns?=
 =?us-ascii?Q?mPYrn7fxCjTq5CK2ku4IKkO7dxt39LfkqDOQg5wy73cRMqdwiNJzT1oABAYA?=
 =?us-ascii?Q?eHm4N/Q4wpb2gXso64qbOG3WyC8ZQGV97rTzRKWZsDEeJw5y7BO/g8BrXu72?=
 =?us-ascii?Q?Xvy+4//4E8N+jJmfADr4aCyRK86c/DVel86s83+hF0R3DmBwP2ICmjMDNFr7?=
 =?us-ascii?Q?PyNLHMKHjv3WfjNBYIsrK/TQzNFRNXzUeZmL9FG+8elDHcN3zh8+GVs39SwV?=
 =?us-ascii?Q?HeRHqIVE5MYzUpctzIjwpk0uWer5J9SZUKQXjJaPIsgksHoHR7PC6oAuTbEi?=
 =?us-ascii?Q?ei8O+52WtsHGfNgK3qsrkhkGSVdqFn1aHV9eaa/4Wq0zR4L2hgKBrfjIdjYc?=
 =?us-ascii?Q?t8IW7cCh5LzYZ7D/WTV2VKQeHRJw4CHzSeCYQuueh4exjHWeQVQqvVqLidMG?=
 =?us-ascii?Q?f1qhSLXLoyJdzvJet/G6eqqA3GlTrx4rUr9iWO/uUxdLXja26u3lWVbW844H?=
 =?us-ascii?Q?7KjLnpxBPpZas4uRAfZRrxwq57uWo0yo83WSLYm/07wyvvMETgEXkFFn9R41?=
 =?us-ascii?Q?xAL2756BiZLSIybdhjh1U5qRJgktf6tcygg/A8MDay3ZyYwB6VfIxA5U6Pk8?=
 =?us-ascii?Q?78eld1Ix/hS3MkzRWHmsnQM7DggdAPAP4Do5wn86SJQJwRjDYY2AFIkNx6CF?=
 =?us-ascii?Q?MsPQroCiCEtyADsZ8ZhE45P+tFY23kIyh+VYx750pADUCvSSoD43t/vA67Ey?=
 =?us-ascii?Q?vkaxXyvt3buE5IGvVZtwlb2LH2ybm7xglPcrqzkF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1ebe20-852b-404b-0aae-08da7a1293e3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 14:22:23.7038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiLH08cVze1/dGOfSsq9Df0v57NTgZxfPGRaUUTjoFMsXvKhscfpnjhRwKdydiHY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368
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
Cc: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jiho Chu <jiho.chu@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 09, 2022 at 02:46:36PM +0200, Arnd Bergmann wrote:
> On Tue, Aug 9, 2022 at 2:18 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Tue, Aug 09, 2022 at 10:32:27AM +0200, Arnd Bergmann wrote:
> > > On Tue, Aug 9, 2022 at 10:04 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > I think for devices with hardware MMU contexts you actually want to
> > > bind the context to a 'mm_struct', and then ensure that the context
> > > is only ever used from a process that shares this mm_struct,
> > > regardless of who else has access to the same file or inode.
> >
> > I can't think of a security justification for this.
> >
> > If process A stuffs part of its address space into the device and
> > passes the FD to process B which can then access that addresss space,
> > how is it any different from process A making a tmpfs, mmaping it, and
> > passing it to process B which can then access that address space?
> >
> > IMHO the 'struct file' is the security domain and a process must be
> > careful to only allow FDs to be created that meet its security needs.
> >
> > The kernel should not be involved in security here any further than
> > using the standard FD security mechanisms.
> >
> > Who is to say there isn't a meaningful dual process use case for the
> > accelerator? We see dual-process designs regularly in networking
> > accelerators.
> 
> I think there is a lot of value in keeping things simple here, to
> make sure users and developers don't make a mess of it. 

I don't think the kernel should enforce policy on userspace. As long
as the kernel side is simple and reasonable then it should let
userspace make whatever mess it likes.

We have a lot of experiance here now, and userspaces do take advantage
of this flexability in more well established accelerator subsystems,
like DRM and RDMA.

> If the accelerator has access to the memory of one process but I run
> it from another process, I lose the benefits of the shared page
> tables,

There are several accelerator "ASID" models I've seen - devices can
have one or many ASID's and the ASID's can be map/unmap style or forced
1:1 with a mm_struct (usually called SVA/SVM).

Userspace is responsible to figure out how to use this stuff. With
map/unmap there should be no kernel restriction on what mappings can
be created, but often sane userspaces will probably want to stick to
1:1 map/unmap with a single process.

> E.g. attaching a debugger to single-step through the accelerator code
> would then involve at least four address spaces:
>
>  - the addresses of the debugger
>  - the addresses local to the accelerator
>  - addresses in the shared address space of the process that owns
>    the memory
>  - addresses in the process that owns the accelerator context
> 
> which is at least one more than I'd like to deal with.

It is a FD. There is no "owns the accelerator context" - that concept
is an abuse of the FD model, IMHO.

If you are debugging you have the mmu_struct of each of the threads
you are debugging and each of the ASID's loaded in the accelerator to
deal with - it is inherent in the hardware design.

> This is somewhat different for accelerators that have coherent
> access to a process address space and only access explicitly
> shared buffers. On these you could more easily allow sharing the
> file descriptor between any number of processes.

That is just a multi-ASID accelerator and userspace has linked a
unique SVA ASID to each unique process using the FD.

The thing to understand is that the FD represents the security
context, so it is very resonable on a multi-ASID device I could share
the same security context with two co-operating processes, create two
ASID's and do accelerator operations that work jointly across both
memory spaces. For instance I might consume a source from process B,
process it and deliver the result into process A where process A will
then send it over the network or something. We have these kinds of use
models already.

Jason
