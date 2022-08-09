Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3958D8AA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 14:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9779D2F12;
	Tue,  9 Aug 2022 12:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6549D2EDA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 12:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW7vNqcyN/qggtDu7WvJDYJyR2ztRvzGSa3GjDvcxJ6AnOcJFzLNsIAWcXuOP75RCUEFtChlJVrNBQxmF0Pk9O5zI31KELIoEgbAyIHT93gUZ5LyX0rnP0I+SBp1CqNpYgOpUJQoIeFojP0c9eouk3cQlYdWltbfiXZujGnFR9Zf6wHUDd/GJEtmRCLvQDeF835wi2oS2n30ETpyZkoTkRYQSyBlu5QoEeBDnTVGBbPBPJzC03awj6bRSMuykd3kl75SSl932uPB8Hlc0aNmg7vsbZR3KZJMD48ZI2PWbhupK/VhZPbWtLVBihEF9yxZ5X9KE9Rw101SoEzY8Hofsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzvrX1XV4HE+3mRDbAPxi5YGRJEL1we32P1g05jUg8s=;
 b=Oy6PsS5qh+LnL+IhTiXBaRYoh2JV7FP4lpzz0kHaT632JZ/74qSkndJIeEfUzADx8TlwYjlHIl/EVDGJFa4ckVUVls7QLHuUfJemPGT9993apUBYF1r3mfiCxOoLxwqbfLoRbZT7Z8HKNcniR+EIpDosyjJeiTXWZM70XUXx73WJh3CcyUSpkGko+VNvKQaVUTJjmaxWMOUEEApf58OBUoIDt4ixbuYDq30NDmjG1RVjmaQFpKV2oThdn62hFJZSO1G6s4x6AMGc4kz0HT6Ufbqbak+hIYGXKenoWPmo8P0dAxWTlMg8pgvUVHH4IGu3juxp19l0Rf7kNpBc3BhMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzvrX1XV4HE+3mRDbAPxi5YGRJEL1we32P1g05jUg8s=;
 b=oaGpB3u/g0h0XKaHpDMK1LWr8V/femgay4Dol1/Jvk++0DdGBiSvi7h3lukHprCV6Lvp19g4IVHj6/4UyR++yKUblfvZCq1hqvffJKTIo0/m32G9ZtmCnA+D0OmVwg+MXvFdNGYfkV6FBRHHdzd1MYt50ee76ANz/W0gzZmghrwcBMimoP6sUIyFZeTkryeaYC1wnabYpNwz8kXrigZwbvAyz1RyZe7XhxKZ6qltKYtqwn9d1cxZgG7d/+QiQR9MQEr/EPlgZMn0/pY2YOqt/otukmBcpTEJwbhlwleUPf9XcarbIvkB8w4cC6FbFBEy76OUY5ZHWngxjDZufc961g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR1201MB0018.namprd12.prod.outlook.com (2603:10b6:405:54::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 12:18:52 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 12:18:52 +0000
Date: Tue, 9 Aug 2022 09:18:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YvJQqxWAQbevR9Ok@nvidia.com>
References: <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
 <YvCozvgodIY19LSr@kroah.com> <YvFOEPdC9r8QBH11@nvidia.com>
 <YvH9X5puer4jpzMX@kroah.com> <YvIU/wMdqFA1fYc6@infradead.org>
 <CAK8P3a3y2=FyzK4S6MRfZdrz=DdLat1ajdT_uPmN533mNYmF9w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3y2=FyzK4S6MRfZdrz=DdLat1ajdT_uPmN533mNYmF9w@mail.gmail.com>
X-ClientProxiedBy: BL0PR1501CA0004.namprd15.prod.outlook.com
 (2603:10b6:207:17::17) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f6317e7-800f-4aa8-8101-08da7a015294
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0018:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yB/bqLnPliqf9tWdqJ8jzukHW/PZc2zCI4xBqt2JEAB/CJ8R7oAElZHnQu4SiroSyFSWoNkSx3G4CCh7j0y0aH3Fun27sXDi9I4625kF1rxLswp+DZyqHpx3YdVtOthIvqj8vVT3veYt85+f6c8pRsE3ZiCWnAjqYyQuU7Xe+I3jVuxNPsH1aOyP1NvBeT34SYpPbcCLG7qLB7aTrMWM9ZF1NHyjsYbkU1gPmfU94KOjw5+iH3b/B/MV+o507sBMjpqEX1k/oemCwQ6ScZvb/9hLz2yhd+CFjAlI/BtlPk3nuIWL07jYr4yod8OeVYQLtBnunRI6PuZ3L55bOFPOC4AB4WE8/BcliqUkn5oSr7VVjSznjm2pTpvBgF3MHyETx55IY+QTkr8jKEtzv1HRiRoc2e5kMAaztQa3zu8ayzBK12RSSg4+PORi9XacyesQC7NnQIA1eJ0z/ZK8Mm248n5vXwf3ysW1oWBApAMp+zA6idfFjVAkKFvuSP6oideANogS+R+llHsRy5s1RkUnZrhpcFdbVsEaDZ9helqkmJs71aEqL/FZvNA3smescKN7NJdZgeBU5K7CXphKB3uMPbW86gKe5OFcXQ3e9NWBy92daei5v5SKVeL+a4vnIAVyJEIDq/GmYexzy5qk9N+0i7Ycw1efMRCZiPGFWRDE+yo5T9Vv1EOQ6YYbvTPcujJWCm3MRvWqU1nWTeZUL80Qv1zb1zNZZ7JLqWwH5E1pBuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(5660300002)(8936002)(2906002)(86362001)(38100700002)(6486002)(478600001)(41300700001)(54906003)(6916009)(316002)(66476007)(66556008)(8676002)(66946007)(83380400001)(4326008)(6512007)(186003)(26005)(53546011)(6506007)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?io2/PxVXKKjnc/62cQ14eXLDn44+8M2EIGu/ZPrW3Pb+KXmxdxO7mrMyCbwK?=
 =?us-ascii?Q?Qg8O4SGh5iiMPDzQpoV/MHBOFbCjdi8GD6qeAd5OeDJukyZ6Iw/Ksum7NjaN?=
 =?us-ascii?Q?4jBWs9jrM7L//l+203v8GmPpKsLA8lofPV23C1bT/GQCnlfCrOkMQb7dgjyM?=
 =?us-ascii?Q?AU4js3dqSVOysqY9cO2aGac+sCgo/pGevolgjx2T/yPAgv6wi25PnMf9gaCf?=
 =?us-ascii?Q?rqYEZM5klIeYQwWMHGTYsm7GZZzWEQo+4tTDGkwGEYHuNy8o1wbaVYatbf1I?=
 =?us-ascii?Q?jPl1Z7c3XZz9HdgxekbocDOTJFe5s8gIKksiR1dlPVHJeqebDUeMiqKFAQ1H?=
 =?us-ascii?Q?P+S3kLVd2odeHdIJhcxQubZP7hqA7dDEmFnj0IZaLgrMzfhtHUn2Ydz/b5gs?=
 =?us-ascii?Q?93QbNaZfZF948aEWa5uaJIDpVriTjSLO40GsfwpK39Ddge+guzLfP42YaTkQ?=
 =?us-ascii?Q?SwSbvv8c9AyM+SHg00AKqXIN1M1rl1w40vIBIrhmTRlhgdTl0ueDJZC0lYXz?=
 =?us-ascii?Q?mSguOgfQTyPZCDkki+cG8JB1/t6EP8cp88jWKNMwlAxQbTK9o1mnAYhtmRfj?=
 =?us-ascii?Q?Qp9oJcEEL6k8uIUU2K92tkpgl9Pulzi0gVU1/7tUFoRcXqlKL5h76Jn8wDA+?=
 =?us-ascii?Q?YoYIjAHOjDZCHNlnntDT9t4U9YEDARL2SF46Hdh0qpRaFnOE/zV+ArvcF8ik?=
 =?us-ascii?Q?0xTm0OnENgP3zpwX/FjGCjBJCK/JCVFaFNz7tT7CI1OIIAFOoExE5C1K7NG3?=
 =?us-ascii?Q?TILdqqMJrkZAdjj9uF63q02G2yBoaJXS6u2XRi6cWyC3xSbkEkscE6pQsA/8?=
 =?us-ascii?Q?9qjVDw1IdJNc01CDTx5pRFQcD9W0EPax50X+esV2sSDgWOLQDnJmFAKsiig0?=
 =?us-ascii?Q?4mtQQFlEdvCLhTrp4w3jBPckR6tReyOZ2EHSf25UFmHElIvm7w3hnPQdKvAJ?=
 =?us-ascii?Q?FyzjB+43jBVvKivgk5QYWTEZPIWRE1n5eb0d12kCYc0aHJL5UajEFArrPF2m?=
 =?us-ascii?Q?ICqosoypxhZ1TDYuYJxWFMK48+VTmBYB1/8txnQlMo6NUy6VBFaq6BeXrEO4?=
 =?us-ascii?Q?vCyTr6PusWDxsp49sMsCYOhp0B24uYZbD3GoTuZkBfmz0yF0y2ZPDMeSBJ6R?=
 =?us-ascii?Q?i4W2jMSNTtdXXsixZCOBWXHnms4qwXa/YiBECoXydad8H+b4HaU/epws/FsF?=
 =?us-ascii?Q?Ibxr1xg6EuklaWsnFm+520CQuLsEIBVDzKsPWp5qAhgP1/hD1HSdgADC7yfi?=
 =?us-ascii?Q?P6+hLbpWcDeLI5TT956/TMN84mPSkhuczLt3oJhmBq2KgitW2on6uOHyl4fU?=
 =?us-ascii?Q?s4GMddpkJTiibK3lwmuvQNQuRj3R/dDvKcuOFtPN3IgifewqOa+Ifqi2Z6Yx?=
 =?us-ascii?Q?GSpFCFNgy5ZsvogpqnoK6uCO4jWgFLNrGGNZJq0XtNrB8N4tYhbBpMVWceVu?=
 =?us-ascii?Q?kSO3PWWnsSvBrpWHNnBd5gryJjCVrv4TmscBI0ldNZaSjuOdRC/4KcZo117E?=
 =?us-ascii?Q?bXzZpmmLtF8mbK3U4Q8bIJ1H4tdzMRYwru2CfTsDxHuXStBDnklMHAFXp3y5?=
 =?us-ascii?Q?RbM4dhr8DLu+/5eB/tYD4ZkOGRTVFbXqQc0gG1s1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6317e7-800f-4aa8-8101-08da7a015294
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 12:18:52.6615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmjZep2Qe5ZE4VRT3xwSt2BFiS+YQfbQSbIdVqZ5xXdfcr8I68mqUmNhDSIHXh8I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0018
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

On Tue, Aug 09, 2022 at 10:32:27AM +0200, Arnd Bergmann wrote:
> On Tue, Aug 9, 2022 at 10:04 AM Christoph Hellwig <hch@infradead.org> wrote:
> > On Tue, Aug 09, 2022 at 08:23:27AM +0200, Greg Kroah-Hartman wrote:
> > > > This is different from the number of FDs pointing at the struct file.
> > > > Userpsace can open a HW state and point a lot of FDs at it, that is
> > > > userspace's problem. From a kernel view they all share one struct file
> > > > and thus one HW state.
> > >
> > > Yes, that's fine, if that is what is happening here, I have no
> > > objection.
> >
> > It would be great if we could actually life that into a common
> > layer (chardev or vfs) given just how common this, and drivers tend
> > to get it wrong, do it suboptimal so often.
> 
> Totally agreed.
> 
> I think for devices with hardware MMU contexts you actually want to
> bind the context to a 'mm_struct', and then ensure that the context
> is only ever used from a process that shares this mm_struct,
> regardless of who else has access to the same file or inode.

I can't think of a security justification for this.

If process A stuffs part of its address space into the device and
passes the FD to process B which can then access that addresss space,
how is it any different from process A making a tmpfs, mmaping it, and
passing it to process B which can then access that address space?

IMHO the 'struct file' is the security domain and a process must be
careful to only allow FDs to be created that meet its security needs.

The kernel should not be involved in security here any further than
using the standard FD security mechanisms.

Who is to say there isn't a meaningful dual process use case for the
accelerator? We see dual-process designs regularly in networking
accelerators.

Jason
