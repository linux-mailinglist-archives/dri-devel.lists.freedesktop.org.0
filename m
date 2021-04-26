Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BB36B603
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 17:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B884E6E842;
	Mon, 26 Apr 2021 15:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58C46E842;
 Mon, 26 Apr 2021 15:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2HYuBbtm6Hgq8RrYdsVhtZzciB0snUyCGVs0Z/rE1IBT5zH9iTOKu6gvB/iyI2fg2CCH5W2OpM2zCk6H1lulCFTzhu2Pgnt3g0Vn6AzW3M2Z4GYWEPXtC97aksmiEfpd/u4IaGGTNwmJuoOsAf3aHgHaaahuFMBVLALQ4d7KG2Bjo6zV4vNob+BH3EOqRKNdsI/nRmWuxu4ZRx1ntUe8FHuayhPXSmu05Dzg4w2GDaTCKY6e8WEZPqLszyygWPEqf6XB8DzXVRl9pKGwSueMfELsIT5bxhUFuh+5sXkKmdN82cjlhCcfe3lqZN8ilp4q68rjvWqUetXT/9Cp8vfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y4JaG9QIb+vOTWA79zzXaeGiMaEER3inXUOAfSrmGU=;
 b=b/EQtyo09LUas14p4G42iY9CbBZ68ZfzgO5nC4wfmLQODVt1tAiYQkRX+N+hS2kic035Qmu9GWfDsiDptO+VPPZPR8N1+2Iuetpbc8TRTwFcSjTPmJGCmlQtaWBHynmxMzih1ecvqws0++Xh1z71uF9g7gXwj9IqrQEWdx+YZ9H5KmdvGbaI0g6Rq9SEvw0CC2XO7X1BilhlRAtPq+WUuLchEsMKBIhUqjD9f7N7I6XJk3e8sgL9Gd87jg1gyQbnzXULLhGsUpToOjumOswQeyObbWVjLgRKXcR/s+y9ehm/sSeIu3QI6Wr5z3xpSu4qNEfWnrZQgzKxXHW0AyIRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y4JaG9QIb+vOTWA79zzXaeGiMaEER3inXUOAfSrmGU=;
 b=hBW/kqxGKwtzD1mzVya9FTaplJFxGBme7/GAx4ebVS09ZzMpnGygRNZCB8E2z4Uot1QtRQnRTty4P9ThzZkJewRYWfoT0s4vaV1wPlcwg615xWSXt/UiLq5TtJmclAaMoIfiiwRO2pNfkWqNxzhAf2IxXnlnw/jWgaPJry84Zg8SjjJb9x/ZsbHhi8ssCWh7aQUQOsGTZAPvbO4tQO/TlETJr4BgMAj/nM3+I//6Du+u0bJg68Zpxp3LcL36pp//wvwWST6NbH1HXfls/Gg5V/tKW0CSrCGQ1sk5gk1SusrKM79fjBtWnWCvaxxM5WjeR4/Jad/kZa+K5Lif3D04KQ==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 15:44:17 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 15:44:17 +0000
Date: Mon, 26 Apr 2021 12:44:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/12] vfio/gvt: Convert to use vfio_register_group_dev()
Message-ID: <20210426154416.GV1370958@nvidia.com>
References: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <8-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <20210426141355.GF15209@lst.de>
Content-Disposition: inline
In-Reply-To: <20210426141355.GF15209@lst.de>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:208:134::26) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:208:134::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 15:44:17 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb3PE-00D5ka-7e; Mon, 26 Apr 2021 12:44:16 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 082c3f0c-49d6-48f4-3809-08d908ca26b8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB40573599C255FFF82DBF21EEC2429@DM6PR12MB4057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrfHN6M9RCco+7AnuD2phxo1w8092QXhyvjpXL73hrmIwhtYjlfjMJeYoRcIUzbw7n3QK/nsGTxwgOl9FpFIcJQyOfSEjVp0b1naCW67pYd3jOyBTw61aO6wWzmxhO2gfb/CipDRuWIr9wRooELgdSzthIpncti77k34vDu/UU8wJJn7Vqtjha0GAiAPCYlnU5WPZeSXKTvmcwKeVHX9LLkz5zcU4LJ+ymtxeZ9nFZG8O8LIYRwmvn7ri6fk3qiakpj8Mrhj7f2yPHlbacsOFM+ly7KslIUW0PyeMatw8mVO5XrKZvDemam7WLhgib92Pw+jKq5qo+ESfgkU0HGYbH7HMo0n/jC/PH7hMigsNGIFwNJsZLxV1I0XRWhsvbaxo4Lx5S1RXBE9sLmCtsMjcnlNhPZOlcCe8GKuN35lgBPTiFSKArsd1Lp/54rUsOC2OrkfB7UIJP8IaUdGXyaRUgsAv03Z8x22VQcVom4cPthU6o5t6NtghUZJme2dPEUKusaTSyNYAXvTq7vb2XS7iy3Wk2SgDc3Pw/VnvQdcJvykl9ZHNNc7j91Ca7xBsuJThkS2aixf2yA2HB+7LMYldK/kcKHfkyl45GAOnE6aqrg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(26005)(2616005)(107886003)(38100700002)(66946007)(9786002)(36756003)(186003)(54906003)(478600001)(9746002)(4326008)(426003)(83380400001)(316002)(33656002)(86362001)(2906002)(8676002)(8936002)(6916009)(7416002)(66556008)(66476007)(1076003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iiQlTC0yWPVm0KtvHpu7GDGpqIEG2eSrL//m/jYmMaZys7DGOQjIKYkl+Wxf?=
 =?us-ascii?Q?2wnx3gAwFFN9aFWZwTV/uHG4LR67cEOFu3EYD1Ae3NSGrViCqoApr2sIiW2k?=
 =?us-ascii?Q?FVqGlJgO7lOr9YSg0kYY6ky3RLJfIWzuvZQcyjbt2r17/pNKr9+A01IAGtuL?=
 =?us-ascii?Q?l5J1fnpO8WepabnVmcNuuhCNcZY1QC4U6yQfJLJAlrLHluasphZu/SNmUUVg?=
 =?us-ascii?Q?9Jttt8jfhSKZQF+mPIm28ORPYe7vaQaaVU24j4FHBkz2c5N79v4F6A0M8bop?=
 =?us-ascii?Q?TJvTk6ujRJ8GwgN6lqdINs1Tz9Zi89F1bw7BcEwPVyX9MaEjtsys0gtEbipZ?=
 =?us-ascii?Q?TTelFv49QuB/GLHTsaml7JAP6bQ99y9CHCjmFPNwulkjt3WjqnccsCYIrjQd?=
 =?us-ascii?Q?dwHTxnnxbkiezwvMjOhSzzi/kZ1aftIIOfHyjxYtr4fgnF16jQhLiPKKETjL?=
 =?us-ascii?Q?z3tNJiH1xiJYHXACYAEsJRF3rcZ4cbS593fP06Y62YV0oP6i98ufHKovpEhC?=
 =?us-ascii?Q?ozfKEeT4mQqTNMQBn+Be/nm20Z8TgxtH/fVTfet2m8Nlo9oFRXDEs+WZun96?=
 =?us-ascii?Q?uSM4DNj9QvtDk/ePWEuf4UrmvEpAp1YdmbwvfYA4iVHWnPBbrnGjpTJrNNrj?=
 =?us-ascii?Q?RST02FQQW8V8qqTyjaXm/ElmaGR2+JmOyCGePdc/rWR5w1HD1bMNAJGCS7th?=
 =?us-ascii?Q?stgsCX+VxRuu8lwBVkVxvq/U07qiy5AgNN/OBD1H2RNBTyVOA5YDzcigTXY+?=
 =?us-ascii?Q?TCm4dIpmbDwoNvEVssGff1eBaCA9yk5bkvVGej7TKZCsykmh5QdlaWU3IEsW?=
 =?us-ascii?Q?j0peN+WacUL77QpRNP88CXB6rySHIU0jKxgv4Uc3mOOWEMOKCmmzMrSrdEA5?=
 =?us-ascii?Q?lq8SZptAg3Q3Gu9Uh8WnU1KtWZ8rmdF0D6j5uMh4wnMdsQnzjFYPgHQlmaSv?=
 =?us-ascii?Q?7+r1APRuoKKTGpnkFDwddtdc3GocesM0h7Ul/Va5JV9/MoEKlFThkJDUf7fM?=
 =?us-ascii?Q?T/wQ2AwFwmFgWw8sKvymcgok96OsYxFgUfFEEMhcB72f4zQcVzbpSl1NtD9O?=
 =?us-ascii?Q?u9dYxYJ9S5PARAeiApf2NTE2WA/d3BCrB71s+JYv2ex8KKY+3KqWyNdezghm?=
 =?us-ascii?Q?SraXJbiF1xXlV04c/jQhSa/NmfRnXaR5suxDsAOEja5SsiwbZjJY5pBrJFgQ?=
 =?us-ascii?Q?F74Dj1yHvtWvnKuy16vcb3Ga033vXc7DuwiPMKQguFxj0vqjPLWsfD1benQB?=
 =?us-ascii?Q?i6iUWHNtnk12C5y3wP7hKuxVGTqOXU3JCvzrqjn3P3RXbqME9gBPERQIh4F4?=
 =?us-ascii?Q?OFVMtQgcn3QT3dAuwqPvs5a2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082c3f0c-49d6-48f4-3809-08d908ca26b8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 15:44:17.8177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2dGIAAahNnGirakqEfgKKh+EQLfB49OMZBONE2rfBxfQSAO9D7bkH0zN3erDVCL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Leon Romanovsky <leonro@nvidia.com>,
 intel-gfx@lists.freedesktop.org, Cornelia Huck <cohuck@redhat.com>,
 linux-doc@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dri-devel@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tarun Gupta <targupta@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 04:13:55PM +0200, Christoph Hellwig wrote:
> > diff --git a/drivers/vfio/mdev/Makefile b/drivers/vfio/mdev/Makefile
> > index ff9ecd80212503..7c236ba1b90eb1 100644
> > +++ b/drivers/vfio/mdev/Makefile
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  
> > -mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o vfio_mdev.o
> > +mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o
> >  
> >  obj-$(CONFIG_VFIO_MDEV) += mdev.o
> > diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
> > index 51b8a9fcf866ad..f95d01b57fb168 100644
> > +++ b/drivers/vfio/mdev/mdev_core.c
> 
> I think all these mdev core changes belong into a separate commit with a
> separate commit log.

Gah, they were split, I must have flubbed up a rebase on Friday :\

commit daeb9dd3a152e21d11960805b55e34967987e8cf

    vfio/mdev: Remove vfio_mdev.c
    
    Now that all mdev drivers directly create their own mdev_device driver and
    directly register with the vfio core's vfio_device_ops this is all dead
    code.
    
    Delete vfio_mdev.c and the mdev_parent_ops members that are connected to
    it.
    
    Preserve VFIO's design of allowing mdev drivers to be !GPL by allowing the
    three functions that replace this module for !GPL usage. This goes along
    with the other 19 symbols that are already marked !GPL in VFIO.
    
    Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

I'll fix it

> >  static int __init mdev_init(void)
> >  {
> > -	int rc;
> > -
> > -	rc = mdev_bus_register();
> > -	if (rc)
> > -		return rc;
> > -	rc = mdev_register_driver(&vfio_mdev_driver);
> > -	if (rc)
> > -		goto err_bus;
> > -	return 0;
> > -err_bus:
> > -	mdev_bus_unregister();
> > -	return rc;
> > +	return  mdev_bus_register();
> 
> Weird indentation.  But I think it would be best to just kill off the
> mdev_init wrapper anyway.

Oh, right good point

> > diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
> > index 6e96c023d7823d..0012a9ee7cb0a4 100644
> > +++ b/drivers/vfio/mdev/mdev_driver.c
> > @@ -74,15 +74,8 @@ static int mdev_remove(struct device *dev)
> >  static int mdev_match(struct device *dev, struct device_driver *drv)
> >  {
> >  	struct mdev_device *mdev = to_mdev_device(dev);
> > +
> > +	return drv == &mdev->type->parent->ops->device_driver->driver;
> >  }
> 
> Btw, I think we don't even need ->match with the switch to use
> device_bind_driver that I suggested.

See my other email for why it is like this..
 
> > -EXPORT_SYMBOL_GPL(vfio_init_group_dev);
> > +EXPORT_SYMBOL(vfio_init_group_dev);
> 
> > -EXPORT_SYMBOL_GPL(vfio_register_group_dev);
> > +EXPORT_SYMBOL(vfio_register_group_dev);
> 
> > -EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
> > +EXPORT_SYMBOL(vfio_unregister_group_dev); 
> 
> Err, no.  vfio should remain EXPORT_SYMBOL_GPL, just because the weird
> mdev "GPL condom" that should never have been merged in that form went away.

VFIO is already !GPL - there are 19 symbols supporting this
today. What happened here is that this patch make all of those symbols
unusable !GPL by changing how registration works so you can't get the
vfio_device argument to use with the API family.

So, either the two registration functions need to be !GPL to make the
other 19 symbols make sense, or the entire !GPL needs to be ripped
out. The lost commit message above was explaining this.

Since it is predominately !GPL today, I'd prefer a discussion on
changing VFIO to be GPL only to be in its own patch proposing removing
all 22 !GPL symbols. Those are always fun threads..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
