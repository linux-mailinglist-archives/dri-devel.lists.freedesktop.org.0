Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA41827BEB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 01:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5AC10E347;
	Tue,  9 Jan 2024 00:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA4A10E347
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 00:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieOFDDmP6dj0UNiQVru06gCEL0F3sPhWZju3peqD8v0S3F+YXZZbI0gKomZWZnxWgvnuY6DdAoMYtogr+xs+FC7VJ4ojz74inLTpe2CoewrBc6Zh0d8zEaiIAo7JIHMs2sKcrPqvxTxuVTEWMexy8CR8PSaN3/m82So/hdgZH2L6tpFeL9OS36uf7m5UByUvE6M3sqv44AmrjJMnt78R82r063wBvk18psifC8P1QSLjJC8SrE35ztUTO8g6zksGvpj9B3KybH1K0ik2JlkN4p1P/oG2YLvUwGEoL6KgbvV9oGKgqewwH/3zvEsO9ApIn4jkWaOMBeM78C8Cxg1OiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7v8vUzUe3N5nm/qDax4pRPB7aWEazJjnsK+IATlaw6A=;
 b=EUF97/ukpbR/0DdwJq8B0X/T3p8U3LZo7xHAitCLJAflrbOnPsQ+HyLn2u8za2VF2Q3arRgunPt9lvEdPTMvcn3Rv95d8U/ga5fJJ8UvLCRetxKCbVeBjZiApIf02m49C6TqhYl7/B6gt5ScAXFLc6AI+d3Vjy+KKs8EwRGJ7hymYNB66428zAa2W/s/KOfwynD2+Ey+sj7ClKWrZkxTIb/pi3fSr1JeXeV/8rUj3c0NSFMYe8MznptpghBc0wMQNyOrOMBE3S6SQYFVRowkcfBeuY6YIKBNBR1aBIWKWJZ28RS80ffaat9A6C1xzijPxlS4hik8Vg/Ullw4BuGDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7v8vUzUe3N5nm/qDax4pRPB7aWEazJjnsK+IATlaw6A=;
 b=BlyOtcTAu8REs4SHVoJieIWYFNAu8h694GJSeHYXRiFLDKa4L2v3cpIphxfptWbz2PEUAA+NqqExlYBNgewnG0006M6R0FkMUfyMXyf+kdPWo5X/XsT+XnPRJhisOlM9Z/fApFC0QvU/yb8cbNn6+YEpenIULRoerk3qHrlCBnvIte47Rrr8ICZyaWM1qJaPmWx1WlPxPDdpJevMvrS6IQw1Wt7TzsrkPclQPFyebyAqc+XHO07n/3rKKD5QjuvD7nTXtggGUeizA1AnWQLV5K1TbAHmBP41O3XSZnvISYnT8f6RqjiHot9O52fRoeJuVGfmvMBKbCGgyvHtiLkvuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9409.namprd12.prod.outlook.com (2603:10b6:408:21d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 00:22:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 00:22:21 +0000
Date: Mon, 8 Jan 2024 20:22:20 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <20240109002220.GA439767@nvidia.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
 <20240108140250.GJ50406@nvidia.com>
 <ZZyG9n0qZEr6dLlZ@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZyG9n0qZEr6dLlZ@yzhao56-desk.sh.intel.com>
X-ClientProxiedBy: BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9409:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f06772-903f-4c22-a98e-08dc10a90c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1/RShumm7KDczdcdIu5YVuSY7VyeCOefYsfG4uLKXekHotnU5DTOl+/4PbKTax+GHbVnffAC/hCmejUFhaiMRdse2v1MbrFIS6cFEfWCE8tPe22yrcZmU9T+ggzcc2qTOC3PFuzn46oXEhhsoRcnxrArO/Gd5jdm2EQKt/2rtfqj+T3cOEo1/nNpJ1b23SLRucfWRBjBED6a9w9+m4c4tqCuSfnQcCofaw1UKPPbk3q0NX75bP91SZCedQGLbsVgydRw1O65XiqhqB/lKJiX3HWTu3NoDpJ3mVRS6cQtaAKmuy5e8hozbjphWdNwisitdv6IxY433ZBtpFeyADoLb6Ti9+q6LD/Z8RVTuyYxlsUKqcRU702ub6qKBttjFqdoq2dsIIBSlGpYPNNk4YkisLSVYq6zMHMiR1L0u+Q2kLOQcBy7AJ9X/pYG7fOGPb6CYfcZG0LzfHj4yCVbBXKg6EcVg8x3M+sNVuJiZQeD4erta3elHVtE2OP57iNCzHzZm5HhfTaFdsDM5I1AsyZOnX4brcT35bSw1BTEGn8//TT/juqsgKIYYnPjZ6BSkYtchnHSyKkyO4ucCZH0uz15Xw5aPW+TgafUgSaT7dq00QwUkQmD1jxAAkYcPrYd4ix
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2616005)(8676002)(8936002)(1076003)(6512007)(316002)(6506007)(26005)(83380400001)(6486002)(66556008)(66476007)(66946007)(41300700001)(86362001)(478600001)(6916009)(36756003)(5660300002)(7416002)(38100700002)(2906002)(4326008)(33656002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/KpMPlNWNd/6Og0YOleucIlCQXkKZEVhE+LWCCMJnocy3jn9Tdeg1nZPW/zz?=
 =?us-ascii?Q?K/hGqaHIVxMHdeHqcsre/3Vcart3NZaKGO2F6GKxZ+iWvsUZF4H6DVgIe7q0?=
 =?us-ascii?Q?owA9Pf978tYVGsBx3j6WDyINcUX6Iw8X9Esspt7TX0ayW/3tQhktCn28HRap?=
 =?us-ascii?Q?TrKdI/ALr7u/iIWgHw/s7W17/SNEs5L9KDB69ha2mpdvQbfAZPPC5tA+2PZB?=
 =?us-ascii?Q?JpUuE0x/sCXLRz3p1D7LmKNDLaTuZiLZUTLO2NHRLeA8GDv16C3OCGLlVO+6?=
 =?us-ascii?Q?mSBuKox0FZX08M2kOIAVLdJ0ASgZMFMf6J/XFhlKFcGAg32wkXh3sDaobOvX?=
 =?us-ascii?Q?iNOyW49CLPI2UNXsJ8sHnYSqqoe7taEik+uc+xTsV4W7fpOcjHfPqVHTx8Rq?=
 =?us-ascii?Q?Zf6lIcZj11rumY/R0t5ggWmxarwzoABTfpYHmARumaOMFES76rxUipctiTCs?=
 =?us-ascii?Q?VDUR6sVVq+Cqtclpm56fM06L81DUGs49dxgOatAYaSRo65SXCSn7gsevih44?=
 =?us-ascii?Q?6ohEJQv2NJesu70rLMQv6JFr0XV5JNTOgaw5Y/8x6ekdTBDsDanRdBPlMpRm?=
 =?us-ascii?Q?lGyU98JOw4+O1/mzRxvTl7FLXocPwsO0MT1nqAXkfS3ApIrpRwug9NKW0MeT?=
 =?us-ascii?Q?nuli12ChRgTu/uQKjj6KUugaSxWQY7UXuxlASxJrYJJgtgtgDNp5Rn2sxND/?=
 =?us-ascii?Q?IvwEQBekLTKa/+5THLTHyR7xpRzu9Gg6PYdQNpo8Qbp1kf0rqL49tOmvF52O?=
 =?us-ascii?Q?8c0pZsEZAAVQgfk5kuuG81GrObzjcDJcD/cn63XBf4c9YZAGkRjas4Q8TKal?=
 =?us-ascii?Q?vZBE/dtpHqmlgKFdEFh8hDFtfX0H64XVJjL9Lfe7gdGHa5Q3WSVDipDxiNYp?=
 =?us-ascii?Q?SIST9jU/Jl+hyWADMeyTdTmqZzG7W/0u6ndZflsd3Y0YhGAQLkKtg6ffUNZi?=
 =?us-ascii?Q?sDTzhRPYVC7T3zm61ZlhllsLii7YDcBs69XIbfADFjd+6CrirywQofKto6ON?=
 =?us-ascii?Q?BFRsATXMQZTHP2+nkTIwBEpQX6y70tmcyjEeobhvdJv93UisR03XG9Bbu0+Y?=
 =?us-ascii?Q?cEJu5md7Skqt7tZP5RkKyBUf0hzsINsMd05bp1zatM3uqHlP2KIG4ICR5I8l?=
 =?us-ascii?Q?xco0zjP4/ok/9XPfQ7CkBTNYzSGQ/rB6eNW+8R7ZECYKnd+dW1Zc9D2eYDbj?=
 =?us-ascii?Q?SxVsXkyGZuNuP1OrIM+BMbkod9WRa7OsYDY+QNvE8Nms2vtkM9jbez3iuGkR?=
 =?us-ascii?Q?dkwZ4tRimFRF05v8mT0VLpd8RI7/MwsAO26ngp0PAVNVauWqTT+FwF4eKRLx?=
 =?us-ascii?Q?iTqzHHzJmpH7QuTyzapK1/V2F/qTPbO/11OKaOVYg/I7riIX7VpuXAbOg2yf?=
 =?us-ascii?Q?J0GjcssOF70YjnSxDwxLfQVbRABXnoxRzWwEQPPx2aqpGVTI/SJCZMoYeQXE?=
 =?us-ascii?Q?8xE6iu4udFDbkgK7ZA3/rgt1GmlK2xNyA/b5u980Xt4U6fD3HcPU/luFFccJ?=
 =?us-ascii?Q?LNdyjT4udMIr+NfkXknqhL6rrwqZhal2YUj5PuigHR+ABTzCKPixZf2suvlv?=
 =?us-ascii?Q?LUIo3yLbZ7qt8BqbuDHLwif0qgnwZxv7fo/JyUb+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f06772-903f-4c22-a98e-08dc10a90c10
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 00:22:21.9278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9s6WDLG+l8RKTw44sZDh4vkVfwVcD1xTEaaLtiAAsgkzy5A8AwYZM5YM6QrybzBQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9409
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, maz@kernel.org,
 joro@8bytes.org, zzyiwei@google.com, yuzenghui@huawei.com, olvaffe@gmail.com,
 kevin.tian@intel.com, suzuki.poulose@arm.com, alex.williamson@redhat.com,
 yongwei.ma@intel.com, zhiyuan.lv@intel.com, gurchetansingh@chromium.org,
 jmattson@google.com, zhenyu.z.wang@intel.com, seanjc@google.com,
 ankita@nvidia.com, oliver.upton@linux.dev, james.morse@arm.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 07:36:22AM +0800, Yan Zhao wrote:
> On Mon, Jan 08, 2024 at 10:02:50AM -0400, Jason Gunthorpe wrote:
> > On Mon, Jan 08, 2024 at 02:02:57PM +0800, Yan Zhao wrote:
> > > On Fri, Jan 05, 2024 at 03:55:51PM -0400, Jason Gunthorpe wrote:
> > > > On Fri, Jan 05, 2024 at 05:12:37PM +0800, Yan Zhao wrote:
> > > > > This series allow user space to notify KVM of noncoherent DMA status so as
> > > > > to let KVM honor guest memory types in specified memory slot ranges.
> > > > > 
> > > > > Motivation
> > > > > ===
> > > > > A virtio GPU device may want to configure GPU hardware to work in
> > > > > noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
> > > > 
> > > > Does this mean some DMA reads do not snoop the caches or does it
> > > > include DMA writes not synchronizing the caches too?
> > > Both DMA reads and writes are not snooped.
> > 
> > Oh that sounds really dangerous.
> >
> But the IOMMU for Intel GPU does not do force-snoop, no matter KVM
> honors guest memory type or not.

Yes, I know. Sounds dangerous!

> > Not just migration. Any point where KVM revokes the page from the
> > VM. Ie just tearing down the VM still has to make the cache coherent
> > with physical or there may be problems.
> Not sure what's the mentioned problem during KVM revoking.
> In host,
> - If the memory type is WB, as the case in intel GPU passthrough,
>   the mismatch can only happen when guest memory type is UC/WC/WT/WP, all
>   stronger than WB.
>   So, even after KVM revoking the page, the host will not get delayed
>   data from cache.
> - If the memory type is WC, as the case in virtio GPU, after KVM revoking
>   the page, the page is still hold in the virtio host side.
>   Even though a incooperative guest can cause wrong data in the page,
>   the guest can achieve the purpose in a more straight-forward way, i.e.
>   writing a wrong data directly to the page.
>   So, I don't see the problem in this case too.

You can't let cache incoherent memory leak back into the hypervisor
for other uses or who knows what can happen. In many cases something
will zero the page and you can probably reliably argue that will make
the cache coherent, but there are still all sorts of cases where pages
are write protected and then used in the hypervisor context. Eg page
out or something where the incoherence is a big problem.

eg RAID parity and mirror calculations become at-rist of
malfunction. Storage CRCs stop working reliably, etc, etc.

It is certainly a big enough problem that a generic KVM switch to
allow incoherence should be trated with alot of skepticism. You can't
argue that the only use of the generic switch will be with GPUs that
exclude all the troublesome cases!

> > > In this case, will this security attack impact other guests?
> > 
> > It impacts the hypervisor potentially. It depends..
> Could you elaborate more on how it will impact hypervisor?
> We can try to fix it if it's really a case.

Well, for instance, when you install pages into the KVM the hypervisor
will have taken kernel memory, then zero'd it with cachable writes,
however the VM can read it incoherently with DMA and access the
pre-zero'd data since the zero'd writes potentially hasn't left the
cache. That is an information leakage exploit.

Who knows what else you can get up to if you are creative. The whole
security model assumes there is only one view of memory, not two.

Jason
