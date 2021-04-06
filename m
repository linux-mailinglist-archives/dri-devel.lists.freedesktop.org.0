Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12744355B78
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 20:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6966E2ED;
	Tue,  6 Apr 2021 18:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDEE6E2ED;
 Tue,  6 Apr 2021 18:34:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maD4wPhgG2I4ybW6em+KRbur4Czeq/WDHW7BeMO6hf9k3tCln3bsmpGGAXAqWRVuH2r2hsBKBVrMO3Dz9F5PkYrrq9Itk64EvSDiWtllSNZ6n8KTtu5N3SQ24PKSfLoWDJwY296mfRLQOIqwoC4L/cBA7Yo4AlXaAUFmTY53yh6QMWbzKJJ9PQkyKYZoTmvz52WtQg54HHQFbQgZzTabpKxcMuuI6Q9zT6lB0LCmHSmockbgyWjtBFYOS24seBr0Cugf10SQhQLzep5h3WjYdaaBx0B+7Iud3pPmzDTskfXjQGH01CtQenIeYD/6CQjNFedAYuEgsYPitUAvgOd19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1WJNdqcmk8xV6AuYskzlJWYEHsBmH4h3DyXS4ku0dM=;
 b=Ml2w0GFv4tjoJiCnvzY5qdLwWiZEmPmNHV21LSMp/h6wth1WyA6/01uV+RTl+GE5PSlbQ5sC9J0Q3XBzVQlsVc4Mjf0F/fjc3HDHxa4ohFsCEISAI0sw0E2/cCpWrsnhZ3xofwm3Bz+l8Eq6+y+UoMS6I10ohus7GP4nBYlUFNIJI9OQrEVNUUaGR0x9oaIK5+ER7Xu/TeTD23escXVmTMXAfJpPfptvE1EV09gw/OkGfGJCy0aSuEWa/ffbUW9PG56nXsGEzBamrKx/EhasO2MqszW45tTp+fQymzico8S9PsoYxIb9EtqesnCIDrfvYWZDUA8P+JnR7fWix/w/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1WJNdqcmk8xV6AuYskzlJWYEHsBmH4h3DyXS4ku0dM=;
 b=SJmlAJ/y0Gtpnp5OfNEhOo0ufTi7AbuBi+eYMRpEq/vkLsBOTmjIJIJF9SmnW38Wcd26TVqHphBJj6R71+oYf3UgdazsTeYjsClp7N+RVkFLN6IUbdEVPuHgLgK2pQfu8SlfpkegpdDXnuEEzH3F94nj/C3ncA/vyvZFgt1haezaAnPaeNXj3MPYCNK2NBD7Qm5vcli8j+X2eOoqr517ai81yDcBw6SOQiyLemZE1++B+soVGNCR48hyaLYY79Y/0LOHZ1/GW2uUk1b8H/YjbfJAf57A9VUdB9Gy4bfZX61xmKS3iHSmUgkEzgRo8f4Og3zRZ4ooqI38CKeJPhDdKg==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3515.namprd12.prod.outlook.com (2603:10b6:5:15f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 18:34:09 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 18:34:09 +0000
Date: Tue, 6 Apr 2021 15:34:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/18] vfio/mdev: Correct the function signatures for the
 mdev_type_attributes
Message-ID: <20210406183406.GC282464@nvidia.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <18-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <20210323193103.GP17735@lst.de>
Content-Disposition: inline
In-Reply-To: <20210323193103.GP17735@lst.de>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL1PR13CA0342.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0342.namprd13.prod.outlook.com (2603:10b6:208:2c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Tue, 6 Apr 2021 18:34:07 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lTqWc-001Q7i-2e; Tue, 06 Apr 2021 15:34:06 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7a45eba-3dc7-441f-d15a-08d8f92a9029
X-MS-TrafficTypeDiagnostic: DM6PR12MB3515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB35156989CBDD272A26F0989CC2769@DM6PR12MB3515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bw8oQsAu3cIAymesVfh0fVxl0b1MYj7xxFs8fB97lV+kt6qO4y40lk4kp2tJc5P4nfYZHJlMhnLhOx5jqiE+OemaTB1wdRvn6+NA8sPE2TQvQCdvH6qFuRcgpRhoY6YGMR542sHmW0NGVo9DWmi4Pyrx4VNLER9ePnGDe7cGdQoTjAUbuk8JinpsMcnOsL9OOEhV+GUf3d8U0HZN57atOfB7ryg/FNr3V3/UNP19C8RLY5obDekOiUdXAc79sLhMo0qMrP1RLvs8aU7Ng24Xs76j6uXZJqfmz5yi170vh0y4MmDlwixGMJb8Pe6LyJE3Uc6Fxiv2682sqWEgFAK5h97nGZW5wts/BsSqLfPpYSX4klWoWlwUq/+VHEvGHzXTgGrb+4qdnmUDg0a1yp6a7RSi3KdeOYTXDblqMvYSHiMZrt7TDy9xb26uAfCw+cTQp65mAtHynAm3yx5rCam8T/rO/PFXzmtqqVqrBpM4H9/KVKBZcALzRjv0uFJGGVW9e2s1OhxsKK2qgIMOa5m4fIVaCCE/xA7weEiAdv40mwqgi8bDHRpo2E47ulYSHjtsvxgrw6Oduga4aQygiITYAevODHWOPamV3HlE9Rkh+ZLqYieiNf3TwHVkC1KA5vx8F4cpNKJaoAxMzuR36WWTr6rXvC0k8cAKM9aWClEqRD99BBdkZY04o3Tnl+grVLWI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(107886003)(2906002)(4326008)(5660300002)(9746002)(4744005)(1076003)(186003)(66476007)(66946007)(7416002)(38100700001)(66556008)(2616005)(36756003)(478600001)(8936002)(33656002)(316002)(6916009)(54906003)(9786002)(86362001)(426003)(8676002)(26005)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1kCB9e7exdS6pbGS2qU5RRbKTWM1pO4spZwuKGRUgMLEW/hN+W9RxHOTybyM?=
 =?us-ascii?Q?SF1B0akEKkEc+iQmue8LosJDEZ/0rm+Of+LfxSJ63cL/679iluQYZsaq1cS1?=
 =?us-ascii?Q?F/UKZJnmkAZXw1dtRSfjxv0X949WNQEZE++BPzChFMy6VcFlDS8v1zktyBX+?=
 =?us-ascii?Q?15st/MuF11B1dhNrdbgEhFgWNW/iHLaHFi7iXqwPt03pRBr2Y3veE7fUqX2w?=
 =?us-ascii?Q?cwtPw9SekdlVLpP6oMif6jg9v25t7Ifyn6xlwVMQ9yTgzoneZIs+rClQwl0W?=
 =?us-ascii?Q?yn30UVLVdJyCeNjA0IAojMkHOHbNzXUPEw33S6vliG7QVBpdu1GuQMC2w784?=
 =?us-ascii?Q?B2nEINZUZ/ZgkZW0cXBeSRxmzjRB5CqcfWwn0R1mDEgDAWHdDg/LHC2xGxev?=
 =?us-ascii?Q?TVdVRyr8DNgTJnf89d96UzfBNGdZjiDen0ivre5pLrXztlcVw/ynDXGNWuj6?=
 =?us-ascii?Q?UjgSdp8cgqwyBjaI29XzULpCk/st2HTnvG8gz2Ju/0GfmkB4nlonomuB/LcG?=
 =?us-ascii?Q?GhhncOKsBTHJ+EtUnZr5JY3ruWVVAbW8XI0ifQj79ICmtlPo9KOG4I8aWn7R?=
 =?us-ascii?Q?NWFtX+SbIkIlmze0q08pZHIA5o2KwawqWdvILWHzX8DLtrDw1h6nWDuPA/dV?=
 =?us-ascii?Q?/dBKBKzPCmLsHwvLL7Wehz8bqeilUP/7EIrsLWesjHtHl1DVIlcjKIdQorhT?=
 =?us-ascii?Q?6AWxVLix/BlmJCGH3qQ8txexUVQYfOFXSAawDYgoDmN9S7GpiQZtSyp/JF/R?=
 =?us-ascii?Q?x+Wsa2SQFXUaKUu69ReUzdgBccg7uiD7iP23fC0bVxkYIRuc8i1/1ftb3UU+?=
 =?us-ascii?Q?VxYtKi/9iIEeaubijYDUBPJtN0ah4s5/bI8HQKG9FKvfnvIzxIiKjTPWvLCD?=
 =?us-ascii?Q?Cj3nGqn9PJlL82/B4Y66eN5hACiGlkqfzADUpohoqs3QqoJbcnMcux1Yb2eQ?=
 =?us-ascii?Q?LEioG7zvurdRM5Nb7HwMnXPlMToJVqFszsu2wS2cEizpvenKaduxWY1Wm8NA?=
 =?us-ascii?Q?3y6XSU7/9QdkSzMOiVArKD96sX8S7yikhWeU9QCuV+MyTYXHAw2aZQ7TUp65?=
 =?us-ascii?Q?Hpb0pKscT/Rx9BIWmN3eDs1ruMTLDlN4t6/wogHfs9PCaBbA/WZdt2xepzF7?=
 =?us-ascii?Q?OKlcu3rv8FT4oHpbndHYeBC7uTNCF+GG3sApOfglnczYfYDAacwqxEhCX7vR?=
 =?us-ascii?Q?k8oSJoCGM4B2H7Vfr4FLsgf85Clo9VMG/jsTzlnC73s4MDbK8Ms/0QLBnVL5?=
 =?us-ascii?Q?k85hvhfPMM+DkGifCxPFvFenQX5V+ntwfrE4U6rG3MgA+7GoYGoTv3T/RBmR?=
 =?us-ascii?Q?kPIkHY5HN71ngfz8WfkTPjT1AiyB+gD9/ZXjzeCVTpOWCw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a45eba-3dc7-441f-d15a-08d8f92a9029
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 18:34:08.5202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AninLrsYlWFOslVrVa7MPX49jfH3Tsjuk+azS49vAMYPg8bKoUzlhizzR3k9rUe1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3515
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Leon Romanovsky <leonro@nvidia.com>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 08:31:03PM +0100, Christoph Hellwig wrote:

> > -	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(kobj));
> > +	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(mtype));
> 
> Somewhere in this series you should probably switch
> intel_gvt_find_vgpu_type to only get the mtype, as it can trivially
> deduct the gvt from it (which also seems to have lost its type
> somewhere..)

I look at just this minor change for a bit and it just is a mess.

This only exists like this because the gvt_type_attrs[] are in the
wrong file and I already tried to fix that and gave up.

Deleting the intel_gvt_ops looks like precondition to do any big
improvement in here :\

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
