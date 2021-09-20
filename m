Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B48411478
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 14:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C1B6E4DD;
	Mon, 20 Sep 2021 12:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777FB6E4D4;
 Mon, 20 Sep 2021 12:30:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehj8icQXyFzVyLdMfUtntCdP5Mkr/9wEdxCh2QI3nYLJv47DL+gzLYe8vRKhwvkfZ51owv/oUzln1hfE8WE7mfjYG4s2AbngOyRI51fbx4tsDuq2Kum+0hZlZ+WHqU4q13SNekWg1harYssx5h4aWC2+59MDjJfVSViIFtgqcL6Fs78biiRaDBwDqHw1yyEevOT/gCmMbjqkJqOiomo56qCBeLsYn5/nbThGs2w30/gL3NN6e7wl6/7PQgGaLXMqMQ6x2XpbMwm9inTdHLmn8fLuPaJ8fy6kE46cjIHsHfR2swjDi/n5kweg2fSen4EsVP8GtO0/dAjISCcQJLh74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IssaKHXOlL/5l0F6k2RTzUEkiUmlswMaQF/zqO0vG0M=;
 b=lmgUAjwnxwiW0D3Lw2O3jPksH4nshdRIjE8BmXbN1UaZdPkQGyoXmS6W9UFJngGOCEjNsOm41lnOnG8Pa19iY2j3UElsAh+jh9xP1gNmThOz4zTgoJmLqiXOsko8fue8u+0dOMf0PtMIwVBDHcbTKGSDuv0UYADJTgwyTZlaY7Mkv0X1M8HpzgCR42qzObABT+wFEEyXCdruP69lN9SHRTe8L4LT1qdRoAqQhzBuc9lxjyISO/Mm17H8WccYKXZejWcoEmXM6zsoApNM3ejq351RWXVt4TRMevIaKmlWvV6DCl/Uu5RN1imgixPi65u62lfYrdMl290J5A1lZbScnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IssaKHXOlL/5l0F6k2RTzUEkiUmlswMaQF/zqO0vG0M=;
 b=na2nzhjDmgZrskV1wjnLPwvp9IdaoI3wZR9RgIuUF1PvIAayzpelSX44SWrXWYCDv05zNHo7bKd4t4LRnEXDdp6ZFn9r20xwWvweEkgfaEFr5+LD9lw0o4uukiYLlQaUlSqoDdINH81MR/GfnpvSPvGI4ajiGUoUaNDj/cnjCH+fVrcFDm6cnacjOBYDbtsUSCtoDUsrIkVeJa1MnrnXaFlTYCezS6xf3K40X4ScbcX7sdiub0iqyJb9d/ZNcPtZYW2zdFHK7BuVhXsCG+DfuCJscRRDfHYRmpXGgUw7Q7PJsLrwC6rw/BFAWj8R+XWrPxJBedsFnsvsIQ7ICZhsZA==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5304.namprd12.prod.outlook.com (2603:10b6:208:314::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 12:30:20 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 12:30:20 +0000
Date: Mon, 20 Sep 2021 09:30:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 4/9] vfio/ccw: Make the FSM complete and synchronize
 it to the mdev
Message-ID: <20210920123018.GF327412@nvidia.com>
References: <4-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <87zgs7fni1.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgs7fni1.fsf@redhat.com>
X-ClientProxiedBy: MN2PR15CA0038.namprd15.prod.outlook.com
 (2603:10b6:208:237::7) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR15CA0038.namprd15.prod.outlook.com (2603:10b6:208:237::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 12:30:19 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mSIR8-002upC-PD; Mon, 20 Sep 2021 09:30:18 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c254cade-8a1c-4cda-6472-08d97c3268c5
X-MS-TrafficTypeDiagnostic: BL1PR12MB5304:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB530416AA84CE31D4F6C6D2D0C2A09@BL1PR12MB5304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YC6IdPbEWZqLMz59p/DdbFRsTaeRZqRe9Hb7ThZOnNuDLeas8hZknoOdiGgTGLH45RVyjp42LPjjvxN60FFY5V09q8dPX3Y3wLnaNZG98PDbEZhoI5v12IS6ikLKY7eIuITH/Il6Qkavlv8vCCZqiaBEiST4XdosREdvlJ4cACKOtMtEGnjeAcWogXvcyZ8mMbvbJyZUQ/0EGjC2eDD7sEEblZ42h/8bPAxKK9Z3n5V4gGQmOiIEk8T5pcQA3uZTuJ8bCcDJ3SQqnVZgme9OgGvQRAOkCJePvayFG9O1MMNkpfj+PCGr5wgokxmajw1yNpfaJjL4x6GWsR7K3Wjho4WvCHSLyn/VHP4R4z6jgAXzhFtUvXJ2ntUyWVEhCNdWYaDF+ai5iDcaL+UPXxUSXoZ9/AyVx97Lm1qGJwGLd0nwa3D3ImSS1ePzaXW9BX7TITxqrk4xXwJK0i4XvioJ2xjW9MLB8+HBY0EYS6W1jKkK5CFEwPYs3o3TdFNGVY5eTkvIFPg1myc7zXkvD9OclGIMIgycQfTi4MgKYgjrvXYxDgb4TAUJpdt8M5PewZPHJRVDyKUGcr9YRji/gKrrLW5yd6r+ACn8uvUUjw2E8cGn6FuDsHhfI3w+EmPsBXJ1HlTdG5HZcmFCfjaPGKbfl3aM3Jxo7eayhejEThoQ9aBR5pvC+sFCDyaB2i716Y9n3IMLJdAzJoxcG3dhS9W6rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(36756003)(38100700002)(8676002)(5660300002)(83380400001)(54906003)(9786002)(478600001)(9746002)(7416002)(26005)(66946007)(2616005)(186003)(66556008)(86362001)(66476007)(6916009)(1076003)(426003)(4326008)(2906002)(316002)(8936002)(33656002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c+DDouDLRV8yd13CEC0atE2mnc3Xy5WTvS8XHvZpjEwgj7Loi4p3WSNe2ZaS?=
 =?us-ascii?Q?QUYupXl8dGTqYJBm7BZEVB2SLPjXjJ+aQDz5JBXdBulp2ruQO+5fAky6Xe6x?=
 =?us-ascii?Q?vXTrAhudfLMlGuKD5Qxvwe5x6NtSIuSEOpAX/s66yLoix+ZPqvFbud+CK19f?=
 =?us-ascii?Q?do8xVwIHsLssYe++g5pU4atrZDPKwKj1mUAuTe6JdcYtU7Ce85PxXRFYfeFL?=
 =?us-ascii?Q?pPiC543jAk+YUl14YfjWQqUDUN74haqxlHctwGkfebI5HxM8d5d/ygxwDzbc?=
 =?us-ascii?Q?TZ1UnJw+/xou/7hRvuJxiOcc83iLjMfmU7YfYThAs5tvbG8iYpGnuscWlY+B?=
 =?us-ascii?Q?ncM0NYxZ0EpdkCf51WF7KQy9coKMHIdfrfrEoOckJL1ACK0kGKPfIrpP9hYi?=
 =?us-ascii?Q?jj6rWxWg4eUKtwmRufETT1lcedrlGgI4fExQSdr5AknDhV7ViuN8o69joxbO?=
 =?us-ascii?Q?Jq325G59SQCSLhjcJExgoeseVIH1mOX0zAskx9VD3+bdVu4bIacSmTfXLSt9?=
 =?us-ascii?Q?awXKqBTWkPViu/sLrGoofl/R7GvkKPhngVoybReKGF3vchwR+Tv+2fe7hMNd?=
 =?us-ascii?Q?WGbidh9rtah+R7U91YL8toTPel7BicnvFIsGw0kFignRLqOjZ4OT8pBdnhTI?=
 =?us-ascii?Q?XfywzbdcZoZsodMrnlO0Whflg6I4YDllsXrLT1fafFPSoCx0Zttj0U94jWoC?=
 =?us-ascii?Q?nprbGCgdZzLymJagaJicChkEhPPGjWRQ6AucPGGH9J50X9pFgBhErNY4P7Hg?=
 =?us-ascii?Q?9PRtjwCqXB35+PGWxCc8xFulZGLNI0uy/MXtmx+15O+TX3qB7CRBsTynS0kT?=
 =?us-ascii?Q?oyQqrnUtOB4um7UeCrt6W+X7KlaNc0aJ5fehHlAbi36EpM/oiomFRASZTRA3?=
 =?us-ascii?Q?T0cwu8Rvb+FR47tQBDPexpJGM5ovg/iz09h1i8iLtGQV0EaPS4dNTwqCiR0P?=
 =?us-ascii?Q?bJRrw1VNWZqreId+f9iEEsSic1dR14dBr3cZ8HFxw4+ih7yjwOasei4x+PBC?=
 =?us-ascii?Q?qIIz9afAqQ34/TshufkmhrlnH/cJxZ8+QhLOrRRMNjrSn+wOqg2y/OFE5P+r?=
 =?us-ascii?Q?QmNs3lZwO4k6QHrYAr3jpajDIirBScRQ/FfyeLYxjmlgSFR4ruDeITnjn5hI?=
 =?us-ascii?Q?TLWvE9wvc085GDf+UG8mxVb2bJ7/9taZL/CMpnINqBdDBcSwghTuSuoiDGsG?=
 =?us-ascii?Q?o0+QT+D8MBzXE4chdq+6b/th0CGMLO5JZoWog8wHO+Iv0a4eCtYCAFk6wCG9?=
 =?us-ascii?Q?7nFl6V9r9loCpUgDvTRKNXh5WxJ7AKEVXcV7uQ8hz/ZCQHd6vG8vz9XtoJ4J?=
 =?us-ascii?Q?aHa8CI1myG7syjUCg22VnWF1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c254cade-8a1c-4cda-6472-08d97c3268c5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 12:30:19.9881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJr/WZ1e1EfiJwXbzSz0hUCWQG2jwLe+qXG0XML3VS0+2kIUxgtiN2m/gfuwg7qb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5304
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 02:19:18PM +0200, Cornelia Huck wrote:
> On Thu, Sep 09 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > The subchannel should be left in a quiescent state unless the VFIO device
> > FD is opened. When the FD is opened bring the chanel to active and allow
> > the VFIO device to operate. When the device FD is closed then quiesce the
> > channel.
> >
> > To make this work the FSM needs to handle the transitions to/from open and
> > closed so everything is sequenced. Rename state NOT_OPER to BROKEN and use
> > it wheneven the driver has malfunctioned. STANDBY becomes CLOSED. The
> > normal case FSM looks like:
> >     CLOSED -> IDLE -> PROCESS/PENDING* -> IDLE -> CLOSED
> >
> > With a possible branch off to BROKEN from any state. Once the device is in
> > BROKEN it cannot be recovered other than be reloading the driver.
> 
> Hm, not sure whether it is a good idea to conflate "something went
> wrong" and "device is not operational". 

Yes, but that is exactly what this FSM is currently doing, NO_OPER is
a dumping ground for all kinds of wonky stuff, and what exactly it is
supposed to mean or do is unclear.

> while the former case could mean all kind of
> things, but the subchannel will likely stay around. I think NOT_OPER
> was always meant to be a transitional state.

Then these sorts of failures should recover the device and FSM back to
an appropriate operational state and keep going - but I'm not going to
attempt to guess when each of the conditions are recoverable or not.

> > Delete the triply redundant calls to
> > vfio_ccw_sch_quiesce(). vfio_ccw_mdev_close_device() always leaves the
> > subchannel quiescent. vfio_ccw_mdev_remove() cannot return until
> > vfio_ccw_mdev_close_device() completes and vfio_ccw_sch_remove() cannot
> > return until vfio_ccw_mdev_remove() completes. Have the FSM code take care
> > of calling cp_free() when appropriate.
> 
> I remember some serialization issues wrt cp_free() etc. coming up every
> now and than; that might need extra care (I'm taking a look.)

I'm not too surprised, things like NOT_OPER just exiting the usual FSM
logic mean stuff couldn't be properly sequenced.

The new logic puts a cp_free in each of arcs entering the terminal
states broken/closed and all the flows that would get us to
vfio_ccw_mdev_remove() will enter one of those states.

It is quite possible this patch needs someone who actually understand
this HW to polish it up - the point was to show how ccw should be
cleanly structured. I'd like to go ahead with the other patches and
leave this for the ccw maintainers if it is needs significant
work. The other patches are what are blocking the core code cleanups.

Jason
