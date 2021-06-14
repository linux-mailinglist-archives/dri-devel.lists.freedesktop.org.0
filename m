Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A53A66B4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 14:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D258891D2;
	Mon, 14 Jun 2021 12:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289CB891D2;
 Mon, 14 Jun 2021 12:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiRZiCpMSRvJlqTLr1cRWjDWGw47vtF6MjCaFw9MfpPqFxdYZM4p2dnH96pbDX5ZVssJXZh1Z02z7eRhhQKYhxaMQlPDxm/6rcSff4hzG8PC5PRdV9SjhRfqpL5Fwc52JNFYlneeCXQMRIKED2JDn9v1nA2PfZR9a4lCtg9PZ3gbxQOWWDemSkw4A21ayQ1ulr8eBHWj1SjyiYadDHmm/U2S9tH/LhMCb11YsuwdlfesgE4ur2uHWqRE3UHKlUlyFYI1bBQIW0QVAtxn5Ts+ct8pnhxy6x0qqLb4Ifp1Kc2IxqKBh7uAbvcpEoBpAAJsI3WNYuv3josfmyxPvCi7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vovSBIAn7YDUdNibZX/0zlm501S26NvUyJxE/ZzwU+I=;
 b=flsSXnvgI/E9xqPOeV01yidpo8y4ySBjAx4A89wfGgwl+syjChIhC9pUiz8mMBZlcAOGP0gwQKDwcCOk2n55SvTaApklY07wwo4oU2NbXuVVwqU4BQGWBNncYqOcz0rUqqYYfGBLg9OoLwVUIC4l+sDk2j+QObaeyeLKCmwuewSi2f2fI1J/a5OaCPg5KZa/FkUF6Mn2rGTVYz5EBT6y6CyRRHQwN4i5EuVOAM58QtWV6NQSnSNT1CT+TUf5T182Db81+QTa6/5KJe9lS4LDvL8TLsW4QriHqo8X7AGM1WuUNFHobXeL/mJ3a9gSN67ROUZgvyHY94RFqHuSaG4/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vovSBIAn7YDUdNibZX/0zlm501S26NvUyJxE/ZzwU+I=;
 b=OspOGafCWmjnLI4mOgppf+pUGqVWTcGb4joVLsEH27IoktTw5grXcsc8h670pcXlxhJe8dff5NnZqwAAe3/FlF4A1iWBY3CiM1LyoCCff/6kgkrCC/L+IPJE4tcWFoLtXRC+h3/Tqr9FtdxWnEEtcmplHvjdq8TbCzsJQzK8nRyh1mArVL2dq8wrjQnIg80NjdWh+Kb7pzo+HRZF9udBI6VDDN7cHtwThJv61TUlGp7CSHPe29pfe9m/RVY07sgDbHXHWm/ApiC3ONWcwSV68SDIfI66OMkVCr1re52t/6tXOIyjLZazO2Mry5eejVKXbCdz7tUlQj2OGPgNwcTTDA==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 12:35:20 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:35:20 +0000
Date: Mon, 14 Jun 2021 09:35:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 06/10] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
Message-ID: <20210614123519.GF1002214@nvidia.com>
References: <6-v1-324b2038f212+1041f1-vfio3a_jgg@nvidia.com>
 <87czsszi9i.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czsszi9i.fsf@redhat.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:208:23b::23) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:208:23b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Mon, 14 Jun 2021 12:35:20 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lsloF-006bV0-AN; Mon, 14 Jun 2021 09:35:19 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 440c66ce-493f-4a3b-b36d-08d92f30df63
X-MS-TrafficTypeDiagnostic: BL1PR12MB5062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5062C7178F276E2D49DFEA52C2319@BL1PR12MB5062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOBNgkY3H7TCi2Wf1Hc9OByZnup2/jHPIMUrYBedkFZuzSILp6qt7HOrrcBQM0B8sbURXCU+IGLiPtL8HDff6CZOlNWopdKEWpnAJ4wWhlCtgwSG+pMXyK1WKWOpP9mcZqkV0labkFaJ5u+iub4wt0JbYwjeZan8Hk9DgiPCJN4pOpnx+QJkOG2VpB7P2FrASt3PyiZv8TXIA+9vEbNtOYmpUAk0M0GBuIDjHrsUiYzZ/+FPDvj3ePC1nibv0uHj4uXCOkuQKQmpWkUwRXE17KOI/nwuA3rFVWmS9+b1T/9Pn0zPglNlyIR4WDQu062e6Rn/gxbm0/DzBC058c57xw/i5r6liSsz1lEBA3wpsX6iCiF6AoFO9U0qMsoda5lK0c3qrTi2WwoBTQsYnBqzpGL04/HyyaijnbYmX5zTCSW2WAB1v0ysmtd+AaedhE0+tz42JfH95FqQvCBGN01o5ah1UF9tgxNQ6nMc16B25GG/DlsriMB2wR35qJLngIlci80kQsy8OsCcl3jktmHsT21XlYQvHCoi4WYSikSJc7LvMv4oZ6KzlAtLCJedsagyZIcO4cL8b5EOpjmSpITeRC4fsk/+3/v8iBdWyKkZnkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(26005)(54906003)(38100700002)(7416002)(478600001)(1076003)(5660300002)(2906002)(186003)(110136005)(316002)(9746002)(9786002)(66946007)(86362001)(66556008)(66476007)(4326008)(2616005)(8936002)(8676002)(426003)(33656002)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/EPXrdp5hIgF+IpWyc3+63FGVz7onYnAAcehTGg6TcpRRWdgzy6xbhbG1v9L?=
 =?us-ascii?Q?CizF/yxOOLIdTeXB+LXqGNarLJRGPBJTrUt/vs4ycmB0xr9R2lEM2oX4Y0yu?=
 =?us-ascii?Q?8o7FXkduvxKpqJUC7Cs4WQdsR26aoNeC9qdm9ebLUueLDz/BWBc4xpkcGYVh?=
 =?us-ascii?Q?C7xmjC4zQz+V/qd82wHRGuLLuNXV1HmJWin6U2s1Oh+FLsOnOiwENc3IYJq0?=
 =?us-ascii?Q?nZnGY2TGEp93bif+aor6GnCrEu8HV24xVsfdG8uvIB4w7z6DtpRieuEk3O1V?=
 =?us-ascii?Q?6nFx3tyrxLoE2TD55uvdNntIM3o5hMMv76FYOno0M6j9xuTdTqAAN2VI4h3+?=
 =?us-ascii?Q?2VuT0pzqu1Smf+mgaX1AU3pVBuSZxQ0oPq1Ol4N8pVWlLYRCdGWKSvYjcJBr?=
 =?us-ascii?Q?q1e1L04xGYT7vPe1So0VZZk5RfdDzacTNWR7BnKTM+8GY8cy3e1tgaPTs7Mz?=
 =?us-ascii?Q?JZ0jt2NixLAlhmpltDLI540UbJfyAhjc8PsBcI+rtkLO/tVJdJ03dlS45cyG?=
 =?us-ascii?Q?DmDeqiYgbNQWulH7fjMrH8VcQxqCweUWe59WyTzIg+8hzFGZa+UjjHXgltEe?=
 =?us-ascii?Q?MyYwVo2MBa72+ojBGahJj4vP46Gwtm3I+VrCRUsbKQyXKIOzDiyiOHaibQrh?=
 =?us-ascii?Q?1V4A+fheRxlbFzSTQtky9hojLz/mIqr6M4Q0SeO/VTSggzzqs6cO62jXHNFJ?=
 =?us-ascii?Q?ilkj3+tpSXT/9A+7bv14crzx+bx/UwOO+34VdTdMkaqh+Laov/njSrZQJ/6s?=
 =?us-ascii?Q?R6KUHdG12LkLilsC5nQsZ85F3ams7fRWKx9/qdGkHYMXsQm7fQi0jH45USDZ?=
 =?us-ascii?Q?xf6YtS/jfjs4AgHeWuwh+qulI3gGkmBoqO6txeaJV+VRJSjX5bwx+NPdDiPz?=
 =?us-ascii?Q?jLYhNAbyigoOWcAyu2pVWHCepWmp4FRJrPQUxPFd7KxICLbCHwRvV0xQ6uaL?=
 =?us-ascii?Q?S3FDZPMlG/HUZcOuT9ZPLMi2gCr8LxL7/C1vEqXM2T0xSv+fwxZPlk+hDfLE?=
 =?us-ascii?Q?1XfRAGR56nfiZt72J9U6haAvPrxZMqA/A8vaCqgcfbZws+6E8p9vr3mW+gtz?=
 =?us-ascii?Q?y9QPQ5fAVBcuzBciU4Aa3hiTUR4rm536hLHkSX/qBv8Rz+BceHi6KG2Y69qu?=
 =?us-ascii?Q?dqMtvxFJI3OBEOk05nVb5Kn0zL75vmxP1jhF095dbFYbLcpbXeAXTZuCz1tJ?=
 =?us-ascii?Q?WtS7rvqTMD/jJqDqiGbKA0CzQZwCA9TXRk7MRq6DFZav04f/Ttp0KzvxW4hE?=
 =?us-ascii?Q?brCFxyCTTg/OwWEUNLsF5UtaIzeirSXguO/5oGA8QjWmM9Rpe1qT4XYhv20j?=
 =?us-ascii?Q?xWSn4V3oNML2oLyIGfCbcoXo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440c66ce-493f-4a3b-b36d-08d92f30df63
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 12:35:20.4943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkQEsu3mdmWXm+E1boqrHRoMOGTz8Om3AHM+y1zYKAY1VO78lLmeLHAjyAdkQP9+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5062
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 kvm@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-doc@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dri-devel@lists.freedesktop.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 02:40:41PM +0200, Cornelia Huck wrote:
> On Mon, Jun 07 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > For some reason the vfio_mdev shim mdev_driver has its own module and
> > kconfig. As the next patch requires access to it from mdev.ko merge the
> > two modules together and remove VFIO_MDEV_DEVICE.
> >
> > A later patch deletes this driver entirely.
> >
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >  Documentation/s390/vfio-ap.rst   |  1 -
> >  arch/s390/Kconfig                |  2 +-
> >  drivers/gpu/drm/i915/Kconfig     |  2 +-
> >  drivers/vfio/mdev/Kconfig        |  7 -------
> >  drivers/vfio/mdev/Makefile       |  3 +--
> >  drivers/vfio/mdev/mdev_core.c    | 16 ++++++++++++++--
> >  drivers/vfio/mdev/mdev_private.h |  2 ++
> >  drivers/vfio/mdev/vfio_mdev.c    | 24 +-----------------------
> >  samples/Kconfig                  |  6 +++---
> >  9 files changed, 23 insertions(+), 40 deletions(-)
> 
> I think you missed my earlier
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Yes, my mistake, I didn't think there were any tags in the v1 posting

Thanks,
Jason
