Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7404A3CD56B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708986E079;
	Mon, 19 Jul 2021 13:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10hn2213.outbound.protection.outlook.com [52.100.156.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C62E6E138;
 Mon, 19 Jul 2021 13:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1zOXrZb7qDQIt+gqrVvnp88wXpK7dE1duTWunzSjUrpGx830HWMTEjts30LB/3J9URt8H9R7XsqPC2AM3b4tmkaawGFvsKCio1aFK3alSHRivUtLnxbIM0JpN10B8emZ+nNE+ws0C1kPbZ2uDLn++odvplYcV9iq/LpcT8KtQzDlHt0UGgbVajAb9b7a+umhrVgnb5tc2Jys5vFyQ5azwl+CHU8hAoXF8E/R7UwnxMZ5fMcaEl3p5xQMphl/ykHOITX1I48dQDNOhu15RzNTiEXu2TEQEIveQnN1v/o68NeGx7szSnrOsceb1yXr7yKBcmT/sXckj84Yy1TKC6/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLBWT2vdYSeaYNijQFDcjM2n2p9d+0Fuc1Ioy0adU4U=;
 b=FAourBn/ivdn5uUV9b0uBRgX3Zm51qNzQeO9Uuyg2zIcClVjkhvm4Nhl3JEAXtFMtb2bGtqtmQQLZw0aIKMuDLBmP+G9amPKhSTZSUWXm5OqR5f2SvlOdbtTErqDY0zIHrrJMThnEaZDMxcOMzLVG+hEGYwnToIMgzIP0YA4sbK3BsW5FHgGALdHBucyeGPe1FRKv8b1LBVQvKYSA8t7ZYJEKa/2/CmU/JbAJleQaz60GhfTeh8UwWC+UL48b4DqwCbTKgUb2Sd3cqkTfaOTeX/EzTgWiJVvNC7FpS92Avt7QtPqMUACSJzxr1GVmscObMdn68wpzjyHbJZhHpogAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLBWT2vdYSeaYNijQFDcjM2n2p9d+0Fuc1Ioy0adU4U=;
 b=ddVh3OGTTH+1bop9TsGSTRx1noykbI40iUtVr05wtGhitQeUtDrB7rdGLpOfDU4ABwjdSj/eT/KUKSi4QfJ93eX/MTd9gS7zXxtJCaFnivZwohnHaTk+ShX6lo5hq7MRmbSexlU99Jm74/rN8tAd9XBlAKp4YBgZNQjhJvS5ecDpJAzAuOYf8n/ZsbiyFjZDzqPX+L6sJ4pOqISWtSZrWFE3+wZK4zlzpvi+TPbW7xNqxjTaUGBcnANASX2nDw+KhvHlFNaLe/7Afg+XG16rTx1EtMM65tdeauTSCXfHdb3hZ6uQ5N8utGoOnFXJ8NZ/T/GKrPxa/l74cqSkFFKkfg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Mon, 19 Jul
 2021 13:03:28 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 13:03:28 +0000
Date: Mon, 19 Jul 2021 10:03:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 03/13] vfio: Provide better generic support for
 open/release vfio_device_ops
Message-ID: <20210719130327.GR543781@nvidia.com>
References: <3-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <87wnpma299.fsf@redhat.com> <20210719130131.GQ543781@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719130131.GQ543781@nvidia.com>
X-ClientProxiedBy: MN2PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:208:23d::12) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 13:03:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5Svf-004QDI-1D; Mon, 19 Jul 2021 10:03:27 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c05e42f-c301-41e1-41ec-08d94ab599d6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5317172E0E31AEC4221D332DC2E19@BL1PR12MB5317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YmI02rli1qabltZ9vpcwZDbzqmISquQb/vNwy9HargV7rx+/IjdXsqPt97Fb?=
 =?us-ascii?Q?r6+l3GDQPEnXntF4Wj4t/r3GmQZpAJL2CdC7q5f0DKn07vnp/UgK5BkisYRO?=
 =?us-ascii?Q?Xcu0BbL8tuNin0ixvIFu0QEqZv9JmKHDyXM21TBgp+oOke+iSek7YP0HLBA1?=
 =?us-ascii?Q?eRSUJEzQY6esiSD1cqbyFXYgCaGJkipxzFeKkPgE7KvibhBtkHdQEiTMuwRL?=
 =?us-ascii?Q?txrPV8FNdbtqEg2hTbl9j0pxpTJyeM7iWGeMQDswnq+/n3iPTfSztDB1tzG3?=
 =?us-ascii?Q?TNLG38OKzKZek2upnDVa2SOSUoofgpq/HWxGbC9VsHv14jjag3KEpI+oeEU7?=
 =?us-ascii?Q?2tOGU3gLtyEVgMbb174NodsCy2gEg9pqNXPMFaqkrBkmyYXqCwgK3zqmyRx1?=
 =?us-ascii?Q?ak2pgayMxQM2lySGWWQP9LJ4WuCgU84m5GPH3J64RvCkz7chLtYtfB3cU68w?=
 =?us-ascii?Q?QWjDYM7aHJOdJ+SFrz1WEPg2EVTucGM9HqglS7QrBj0j9We1sEoW6VruWtjy?=
 =?us-ascii?Q?ZqbxfRXRg5vZVaT1Wr6wlgZByP6h3cStvEa7y6f1ZG0UPrm73fWD0qwO0nR3?=
 =?us-ascii?Q?2Au0tBVoX1fR3E+BnEzQBB/OaiSjagjiIKikmc730zToZn43gEwhXk5J06pl?=
 =?us-ascii?Q?IZURU6lbbTUSC0QvN6FHS2kWjRqU013UcnF0XED+BlnuxGnzgrHIssmTfuSS?=
 =?us-ascii?Q?3JD2t0AhVNwrINsG0/yUBUfXztJfutQglWD9R5XahURP4MNNJto3pELTVaA1?=
 =?us-ascii?Q?9b8gfFdlra5LkcrSnkjTd90iIddcNgfcROlx1EhK2chaNs1ULGNyQCIfMnlC?=
 =?us-ascii?Q?APNrUYjh6d2UEf60q4G2pXAYzs1apGgAfnjBnUiKO4A3hlIEvOxO055Mb5cg?=
 =?us-ascii?Q?hCZM+WJii0hxC0asly/fHOVoHP5rPTZa0cTPiPjX7IO1q9vSVbOeP/PrxE6g?=
 =?us-ascii?Q?h1Rfz6fLYduAVUOBTzvJ5F3DqI9Z+YSOgBoD9SwzC+I7eFHpLNHQdcaZF1hy?=
 =?us-ascii?Q?QwQvaEmPyM4f+BCvp9JILwuFGQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(86362001)(2616005)(83380400001)(478600001)(8936002)(66556008)(2906002)(66476007)(36756003)(66946007)(6916009)(5660300002)(8676002)(9786002)(38100700002)(9746002)(7416002)(1076003)(7406005)(26005)(107886003)(186003)(54906003)(316002)(33656002)(4326008)(426003)(4744005)(27376004)(41533002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RIIK0vKAcUKcmxJ12ZPTaYciCzzrhxIZikgFpcqp0vat80C12DnUy4ePPpLP?=
 =?us-ascii?Q?vS/pDnw/geVaDFrl/JPsY6N0ev6ijPcldn2SpV2YBdmS7/sHhSisb8RtchPI?=
 =?us-ascii?Q?63MsG0sdu4paPzPVkazy+XpK9wMZT50Z4rcG5lZwJ1wFqirucdL8dhxB4afs?=
 =?us-ascii?Q?tExTcqLOemv2tlQ94dqbPArj/mpYGiChVRbfVliEWCDFEh4J5nNwYRvKa6oE?=
 =?us-ascii?Q?L1beRMGEfu6GIMuhJrQVmr/CpF9v31FgMfG5jA7fFvb4k7BVL2kGYly0qTUq?=
 =?us-ascii?Q?PKjiqzdpi+J8heT/KW/StDhgp/HIk47r3jDVXPybpBBq8j96yaOR6voUOyig?=
 =?us-ascii?Q?HukxP7uufu5IGrSyBwUsfSkh8V+qEsQ/5JHrdVzHxdHSiLumlwgE9TeElXAv?=
 =?us-ascii?Q?TriNqRxtKO71KzHJ8K35yA55F65j2HA54X/zugPEi+VKchUQdjnuHcuCyCW7?=
 =?us-ascii?Q?9PoeF7NWS2e7iUuAZIKGuWzd8wY3GLJCm2u3l5D5XAJxLyra01dPQvv6dV9z?=
 =?us-ascii?Q?4rbnzcgWZ/eDc9ydUzU0HFS6fVWsoucZbJXGApOQ/vxT4K6ET7z65zF0ns48?=
 =?us-ascii?Q?e++aJqVOBJhQBQL299zTkayKuhfUQPEKkaqW16NWbOVvY1XwB+Z+z9B7y/NO?=
 =?us-ascii?Q?wywsIK4X6591WdA6uGJNqSGyJbfzliXodTMVf5zQVnZ5Us9+7CPUvig/7CJO?=
 =?us-ascii?Q?iwksH/VJrpG73sX8b5GgQcfIHLYjiS/J+LMhGDRHBmn8oVM4os0r5eFrzAxd?=
 =?us-ascii?Q?mnMWSXrlrDD8Pb4uLJ1yvC0Hbe4RWuisDZgTgFmBQmVi7r5ax2BIVxDsUNj+?=
 =?us-ascii?Q?0XyL/rvm0mFnOfhJggGO1GMmq/smz7+4kNVB9nnDHKUOI9o/n3hKwfoMElLg?=
 =?us-ascii?Q?k3qqcSB17cl48EL6YXPsbViSdaNb+/ombpxcVBQf0eNGb1e6KE0N4IlEugmM?=
 =?us-ascii?Q?pJKzJQzE3fVXRD5MLVaalArm+z1UKOp7Zs9981JSMaCqV2Kt8AtXFi25N/FW?=
 =?us-ascii?Q?cpxhTED+Y64YDjFu3mF5PUCXnHuTGXmNYuJUipodIiob24GxTcIDT4M8XmRM?=
 =?us-ascii?Q?Tb8XvpUUamtUkmDj1BdwLjowzR3LqdA+gO24F+IXpy1dQt6bU+4G8x+mfcHs?=
 =?us-ascii?Q?GyGqJFhaCwlUR5IB7lMol+CB7ApIiHDEil4YvtymZPBJ6pbUqynHBSynDOK6?=
 =?us-ascii?Q?346xZri2eCxd97HAjmTWkD0+FQ2AcMCBN6daJAFo2o7JWP2wrYhSMx/0iqSa?=
 =?us-ascii?Q?dS3whLe2pWF05sfi+4rpyBXgV1O+9mIbF8XEZxx2PaUr5wIuydsyIWWsfNLa?=
 =?us-ascii?Q?98tQP8p2ttV70G0Pk/UqKevq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c05e42f-c301-41e1-41ec-08d94ab599d6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 13:03:28.4657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOtUl/II9K6x+AzCd33Q/og2qqXfLEDXEoQu2dZdXi2NAdQEfIzPzf16R1KU5Xkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5317
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 10:01:31AM -0300, Jason Gunthorpe wrote:
> On Mon, Jul 19, 2021 at 02:58:58PM +0200, Cornelia Huck wrote:
> > > -	ret = device->ops->open(device);
> > > -	if (ret) {
> > > -		module_put(device->dev->driver->owner);
> > > -		vfio_device_put(device);
> > > -		return ret;
> > > +	mutex_lock(&device->dev_set->lock);
> > > +	device->open_count++;
> > > +	if (device->open_count == 1 && device->ops->open_device) {
> > > +		ret = device->ops->open_device(device);
> > > +		if (ret)
> > > +			goto err_undo_count;
> > 
> > Won't that fail for mdev devices, until the patches later in this series
> > have been applied? (i.e. bad for bisect)
> 
> What are you seeing? At this point all devices will have a NULL
> open_device and skip this logic?

Oh, nevermind, I see it now. Yes, that needs fixing, thanks

Jason
