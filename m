Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013174FFCF5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 19:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BEC10E180;
	Wed, 13 Apr 2022 17:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9E410E073;
 Wed, 13 Apr 2022 17:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4e5wiGkLbudqdiCWZwCwX6eJ68RmIAKhAopJoGy5v2pCkSdViI1VQ6x2fWS6jfTJZHaULQQt8ZeEXa9L2kVTbYcVqaJnroXM60p0lNSSYATNy/pHOgvksi+XIazti8/e+JgrmLiQYdF1Zx7aHArhOJ7lwitucVw+wyoJfWnTe0fFEE6WYNPtDfc6kVW7Oy5GZ95SKZbJZvc3o/U2OjFZ/gSgi1GPfk9hXImkrwAp3hR9nIxpSnVNaJxIf1r+itcXoNOkOy15wUG5OCa1cgRA9zVgNQU3vrpKtOY2ZIh0TsADRnqFAz3IrvCCpgfwvHubb/dR8+vinOSw0OE3gZ++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg7IgG741BoutTU4bkRJUGDshBvqdwF24pQsn5DQK9w=;
 b=TiGDVP4efu+fcV+AyNrcVkMVr5+gLoW+bOE3uLvQLwAbBbMbOWS7eCED02Fkg31oTTLKQhHEQVhWV6k9qPzRoFY+pXP3Mkv13kJZIZdIvqisOv/HpnS69MEx+7wGzJcWg3voK8qvsX90KI8Wrf60IMSVipgkdSU6BO7sdtOb8Sc/+zGgohf2Espk8b5Ckl0tH74xARtE1SDpe/MikzMThpJp2JuVr+3o8xYu2gCkVBkNpA9QQIhsAlNoZ6WLF/atmJYw/uHH8Sa9hMU+JHegCQQcmLsLecuaBaZAfEE3/E+y3SNm2BkGGQpCAJTAJLBpqxV/ieD2kWqwIgoHCFNANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg7IgG741BoutTU4bkRJUGDshBvqdwF24pQsn5DQK9w=;
 b=a/SeYglb4Nmi4lAYu+yBO1Eti5Liep8pnSvjGy6q+PFkif8Z3HSV0EUSpyH9bpZYdzEFnOE8wp1q6Hy+6pQXrPqDYTC7Rn8dGZzbtx8MmQZVaxvYZPlK2oJ5HKtAk+dGVnFrvMjxTdI2nFavWAFTGqUm8vI2p3Zt+EF+ZmgD9i/y2pxfsvJgqvTnA8u/P5FB8pu/bmMpkIMNos2gM0a4UCGEmlyQoXO7NNL3te9WQxP42ATMCudHldnXlVRkvlRq8G0+iFg5AwvWNlV8OUkmY1gtmx/sBPnopQetBqEMwY5f0tSvJXMvLzKQa1Ljnr8E36QfyZqfV+0mkXB6nMLweg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB3624.namprd12.prod.outlook.com (2603:10b6:a03:aa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Wed, 13 Apr
 2022 17:37:28 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 17:37:28 +0000
Date: Wed, 13 Apr 2022 14:37:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Message-ID: <20220413173727.GU2120790@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de>
 <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de>
 <20220413161814.GS2120790@nvidia.com>
 <20220413162946.GB31053@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413162946.GB31053@lst.de>
X-ClientProxiedBy: MN2PR22CA0019.namprd22.prod.outlook.com
 (2603:10b6:208:238::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3653b32-cb73-4be7-df67-08da1d7447de
X-MS-TrafficTypeDiagnostic: BYAPR12MB3624:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB36245AABD92E79793BAD20A2C2EC9@BYAPR12MB3624.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4RqVsHyaFYJw1xIz+hzXDsqXMkVS/6wET78tyz9txYtU2Kut8O1cJZITv/ECXxmzzWsKlLs6ixC/k3H2MsOZ+E0Giaoo43Un9YnsLRZxRK77GlGlFHcqa2OrM4k5y075kxtK5M1/RW87A39Eypvl/LNRDAYGjDSanifAM9WkZxSa9Q1AJ2vs881gBf7+6leOgnWRzkMyUnSnwMdO80cmuwR8ub3PNQvzi9aiN5ZGgl+KYTfD1Jg9sQyCofiaeXoRG43+CwRJoncDPJU5i3LLIQOviy0Lh48f+jIeQ6NC3vFn3wwf4pNGmDkL8xvYdhKeO6uxoBlGK7nUEKsm/1+HZgp/jvrkAJ7L0dzrPeLEc8sxmiLcZzltU7mneCXbs0mHWKlGyh8Urc9BpTT+stlJec1GSY+8M9j9LMCoo0Y+HiJorfqqDe6C8Alb/RQC7oRkFOFFNSh6o7fm6+q9cdf/4tMFSKNTaymqe4MJk2UNeX5X5+ZIu3LVGGORfVcEujywG0teEV3BUuqRlFvRxAZkzLbU62VAHCnqXIGlSHX6HiiImh718uA2+D8dwp9iO0OptDzsTEsG4RX7/3sjFLf26aNlgZd6yQS6QrgDFn7oORPMpo9aPZHSfwcWK8K2Xl5fzSZ49AQ2qp5cHWa8I2qffg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(6512007)(38100700002)(1076003)(8936002)(33656002)(7406005)(7416002)(2906002)(36756003)(5660300002)(508600001)(6506007)(54906003)(6486002)(66946007)(8676002)(4326008)(66556008)(66476007)(86362001)(6916009)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCr0xGOBX6+sQPv7f86mf2S5nxfmsD+54nsqW09fv921Xu/J25a7+TfgJxR4?=
 =?us-ascii?Q?dt4YPe7iTUJ/ufHgCt1k3v4bdJd1Boxtzw47hzsz86uCsdYfDFzFMgnR0z6K?=
 =?us-ascii?Q?7QZkp22shr49uoP3cCfj2pKEhQGT0a/qLZ88Mj47Kig9f+lKPQWNbNuRosZH?=
 =?us-ascii?Q?JhLLBIktoqmbP9jXdWb/Ho8gpSlzl6Vu+P+frB+/MCbjSzJ1C/Sb/QlW4O8U?=
 =?us-ascii?Q?bRC28pZeA6A3tBW5UZ886I4LHJvs35wFRPD4zDdz9z6Z8FcZkVnfYHrHYBkK?=
 =?us-ascii?Q?/ekoSMwmxkg6nG9txPgqE7LUaSZFPO0ATudGhilJdHDJDhlhN52Fl3tIE8Cs?=
 =?us-ascii?Q?wfgwfTA/yyxj++QaW9n3v53xfyDJnMYUg4oXlFgaYt1wBiVscpbM+3bVLZNJ?=
 =?us-ascii?Q?4iCgQVANaneQi9etLUWmbRyR/ixgsFFzfq/QBGb51rqIfVFmBlwuXb0o7Bub?=
 =?us-ascii?Q?BAiNJML1OcL1DglgPJI//LDqa//7+AO0Pi/jWB5JGRBY58ES6khQk4sL2KrA?=
 =?us-ascii?Q?CScxnLdGJtWZQBLcdOp7MdmL+ZcD4uz/d0Vy1OL/aFl7ERRhD3HQmRWL01kk?=
 =?us-ascii?Q?vWrLRwQjl6Nc6tcxTQtZyMGndrRLw7v3KO2Ffp20s9yuIuLi8BLbVMF2Ui4h?=
 =?us-ascii?Q?x2BTs3W1vaaWLPPslIDuLiztZIyE1OUE4VcbifVe2yR+oV/KWvMseX/tHKFA?=
 =?us-ascii?Q?ZC9nh/6h0NH13F4SF3eyWXhmoLi3SXl/2h1Vw7PcmLOhV998KPdr3CyjXNcS?=
 =?us-ascii?Q?En4wE/qSCwO96o6yyy9eJpY+E2u9MOElNEcoOcGjtVexyng4Sq/0ymkNGGOC?=
 =?us-ascii?Q?p6zqmhDV3qVyoGmhhKdcCdmTnURjmNsBTCt73shdD1TipA/JibHBGkDgRxlv?=
 =?us-ascii?Q?ipe2kzfg3OMuHZ00GzBPTkQfuXA1Ei7nTTNkC8MQ4Ih0nI0NRuNA915j9kgs?=
 =?us-ascii?Q?CCYPEZl2enZJ+3ggawUdgEBRvyb9B3caMmP0UROeacPtfBbtMLmfZnYiVHor?=
 =?us-ascii?Q?M2XMUOV49bopOIOQKnrgFd9ljz30jYJX2MqXbirGgbKijzn7X47HSiKaS2wE?=
 =?us-ascii?Q?mHbe6J7yRyTQfSZXgn6TSeFM2h4sYbKV258OUlCFmQSAin+ZykGzcEhCnFW2?=
 =?us-ascii?Q?mWDjoZvzoufflEgpogjwdJXJOOUVOSAPEfJzbaHeY0v46k4987rXrlRqRbI1?=
 =?us-ascii?Q?EI9LSGK24y5wIuZINsM01Bo2OSjugFnGCJJycXXskLqE1c1vDicYGQz3FuTo?=
 =?us-ascii?Q?KeswtZDJvVs0i8iBgoyteTItEh3jdgwd3uQNP5dghncZNRYvGT0xcoCK59AH?=
 =?us-ascii?Q?j9lypVY0CMk/Uwxu26J7jt8TOyyA4VwsnCK7jipVfP2pH+N6OwWMYo9RHCgY?=
 =?us-ascii?Q?lX7AdMf5WhDy9fvyyulyyHf+KhTb9LBGMN2EP+8dsTo8ixavz1nZaT+FeJWe?=
 =?us-ascii?Q?iXUv+1YK45T5+LB5Tc7xMT4ipvORDG6nirRAQeHAuLCaMsBrifUMkh4A2weh?=
 =?us-ascii?Q?6RTVdHOmdRmJZr2e1BpHfHlbW8/d8pQ5FYaT6NpXDR5SsyDBTeUvUSeVztd2?=
 =?us-ascii?Q?zKBEx004uM9Jn3prYn7k6KPOEOBMSAXSGOYZjTfde3nFFd4FRydvWOseZCps?=
 =?us-ascii?Q?uAblRj9cbVX/8vbp+Fe+Dkh/pYf8eQv4At0b647GlVordtQtWL/9GOT6cRBo?=
 =?us-ascii?Q?RU39Z5xzYbRpSIvjsMF6JL+vL/BMJqB4B3WRXFx3Pd4xG1tj0kVq6lvKmmPj?=
 =?us-ascii?Q?OcB5N6wgWA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3653b32-cb73-4be7-df67-08da1d7447de
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 17:37:28.6327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lm5eD1kbIHIVWBizs1iZciXH8Zri5H/6DtyYzPuHolSA34RuaZeLe2kKHDMVAE3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3624
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 06:29:46PM +0200, Christoph Hellwig wrote:
> On Wed, Apr 13, 2022 at 01:18:14PM -0300, Jason Gunthorpe wrote:
> > Yeah, I was thinking about that too, but on the other hand I think it
> > is completely wrong that gvt requires kvm at all. A vfio_device is not
> > supposed to be tightly linked to KVM - the only exception possibly
> > being s390..
> 
> So i915/gvt uses it for:
> 
>  - poking into the KVM GFN translations
>  - using the KVM page track notifier
> 
> No idea how these could be solved in a more generic way.

TBH I'm not sure how any of this works fully correctly..

I see this code getting something it calls a GFN and then passing
them to vfio - which makes no sense. Either a value is a GFN - the
physical memory address of the VM, or it is an IOVA. VFIO only takes
in IOVA and kvm only takes in GFN. So these are probably IOVAs really..

But then, I see this code taking GFNs (which are probably IOVAs?) and
passing them to the kvm page track notifier? That can't be right, VFIO
needs to translate the IOVA to a GFN, not assume 1:1...

It seems the purpose is to shadow a page table, and it is capturing
user space CPU writes to this page table memory I guess?

GFN's seems to come from gen8_gtt_get_pfn which seems to be parsing
some guest page table?

Jason
