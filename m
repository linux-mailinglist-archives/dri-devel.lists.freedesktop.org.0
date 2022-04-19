Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BF5075B4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 19:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8397A10F05E;
	Tue, 19 Apr 2022 17:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F198610F04B;
 Tue, 19 Apr 2022 17:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyQ19BdcidDo9QLqczEZaDSyEnNN8Wo+Dm/Ab9Ma0t4i2TXySmpesoFfE3nyEJ3JrxRzNqWNxQ0j0BGnmJYJ3Mc4sczSD1MMg5NR2Wzq6MZkhkdsVeFLbETUpSV03KIcOYYH88pH9wSYsnZ8+Qn2DzsXoo2E7vmUsegilLEpPUXWexzr3GCbvR+q9m9A6NCzUwOEsC6zbKnYnosmzYfCC8vlwr+KmPSlgk3OYAvekYjmoJdVvc+0dOSSkwRdyCzDed2vSkOiZboVEa4xJ3f5uzJQzfV7L7yuGNfCk1gX4DKpB190zIH1s0C7G+laE1oCG5DIAHgdfyVeRXPPaYvhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg7iVLmUzpCuNkTSMHRFlq+bBGXRLA0bh8fVs2ztDV4=;
 b=BPa9sW/sR6ueWiX6b6wPHelOw+iF67DMfRtAv2mlnHtJbjK9YeBeZyYz0u4F6mierM+6qPsvnUIe4ncFciY3Y/bXohiHmM+A6V3u+EK9y8AEMjq0vXXTjOKy2mocgs4dM+UqP/j2oVwBboHfdergW77RMFjV0W8nCTgdpdtXx1GkhS73UOw/XBmQZ2fkRolDvXXS58W9Lvm5r3abrXsq9fowcC2RKR4teXDBnxkSZcUZgGVTBYStlzNrevz0jRvEGA0Sr8RC2mr9xGVPXuMXSogCZZ2pTINLmU+PLHcRWfJNcCEZJ3oxWa6U/o7Ns3PJ4gmFHIYnru1vfl31SiltYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg7iVLmUzpCuNkTSMHRFlq+bBGXRLA0bh8fVs2ztDV4=;
 b=HDT7Vmb1QbFHOy132s5KFX5DRdzHj9LGDC4OZGOLA6zUYqnELE8oCiZUHgz+mJ04JM7CGiJ29CqDDYbLUupIXli7uQ+KMrXYSiIzGv4OcuaJk7miOEfGuiLPaO2pVQAlrolGxfM7eJ9BGMa84+BLVCjm3fObNrUnTyezbCWEW6ORMzv5PdPPcP1bQ9h4ODbt7yhRger+jslfH/aqydK939OGHBZSJMs/7NuZ7TlVSFyvk5n+4d8zVHhUkHrk/bP/JpatmCRK5cH8M4JNTD3lwE0s1ePtLPryXa0rddVpwc8cIGSVy6sDekUalmsdar2oHQ+26t9HTd1+5wD0HOG8tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 17:00:31 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 17:00:31 +0000
Date: Tue, 19 Apr 2022 14:00:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Jason J. Herne" <jjherne@linux.ibm.com>
Subject: Re: [PATCH 3/9] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Message-ID: <20220419170030.GA1251821@nvidia.com>
References: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <9cebd8fb-e7c2-690f-90f5-be84f9a9d6b1@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cebd8fb-e7c2-690f-90f5-be84f9a9d6b1@linux.ibm.com>
X-ClientProxiedBy: MN2PR01CA0047.prod.exchangelabs.com (2603:10b6:208:23f::16)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3abb4e0-7c22-4c06-e667-08da22261c9f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4512:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4512732B574F648028BE73CDC2F29@SA0PR12MB4512.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/1L1hxropDun/i+4aowbOzBQ3gM65UVE+9XlJ7ihVjWtU4QXQ99nRUe7D+AWFK5gWMpMCIX2VQNVh1tgnaLE5wBTcFeaEQE/OZyqNf6B3whVFvs+N2nQbjiBN+EB48sZ74UExibf2LiiW4tDJH5MRb+POSkkVU/OTgwZw7hCLQi7e41QUwZw0GnZv4p3+HmuxslW5vqiSs+zlLU+QNpIkEoktZVSv5yWjuhH75Bcze4zYj/OSWYRqKggymT/tc+oqTloCkqLe4OwgN9ix8kcM8UzKS3WhNJ5uwDZGOmE+EFEo5ThycLMyb+biBb9RC4h9CpPJ06Or3d8XV6HLsx3tlf1j8oq0WJCKeiGlduvrmJUCQWwDX1ArMh0bfEhg/o2d36P3qm+zcvfKqUlWUiTRngtu8MF1zcFwEX89/IXLYik2HRMADRfwL/xdebl43ulyXaKL/7uRlgd6UKGWIdCJumIm9QjJimIm65DnVGih+i8f8vAQcufBKzJ+PUVWL07H+e335cA88UewCq9vE6qZNkTiuz/kjh6leNZe224Bk3hftnP1xv1JzTi4TE/GnMA6C/FxnELEcqpY5pL5eu3VKJhFo5m88rGb9ALU6b3esk/u6NEhwBFQuke9aGvjAvEW0p2TASBBUyLLcGIKC+Ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6506007)(4326008)(316002)(86362001)(53546011)(8676002)(66946007)(66556008)(66476007)(6486002)(38100700002)(54906003)(6916009)(1076003)(2616005)(6512007)(26005)(186003)(2906002)(5660300002)(36756003)(33656002)(7406005)(4744005)(7416002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9eF8/qfTw4IdBOhAKPz8kpumRINsSnVCjXyQ80JGdjD5mAvVRlDnXDeuAMsv?=
 =?us-ascii?Q?vm4CMcIgchG8s1RoqZ8gxfASx5CTpIvxH4bNrg7NRz1sFYM9s9dWHFjHr+G4?=
 =?us-ascii?Q?pTYqnrT6Q4hTQoLnZgDJPYQmToT90QyeMTc6nhImQ1yaJHxWsJW5vIN+nfa/?=
 =?us-ascii?Q?zQ8yCTiHsJbQyH+q1rTxZkBNrkNjd8Ab8OABRPiDE4YZr5u7rJB+sylcn4xt?=
 =?us-ascii?Q?ngb/qphecfofaZIYOXOLxQOlZ2vJPHsdtOwkBQ0bmxIYAKftkizya1pF/0Hi?=
 =?us-ascii?Q?Ps4lTbGpT2zbXDhTOydEu4gS/cIUA5RYLg+oHkTWF8bWAAJ5JKOw9DZgiqMn?=
 =?us-ascii?Q?d3aMSgmjAU3LaTmSeQF0jMJX7j8LWdI74LXirTtMNk83P1PSolbUh7uZazZB?=
 =?us-ascii?Q?ZNmoZghhaMyXLSKz2wrwART8YftCYxeeACFYblOJCOR8NwuSXpRufStTYPBR?=
 =?us-ascii?Q?JzkgbcVq/ICXc0yCjmQjEh/veMUIaWEbgwbEsxyZ66Mp1ZQsexwqMT/oasDO?=
 =?us-ascii?Q?aJF8RLMghLggpgc47534c/0dIE6Jsnccx4mgsC871yTHk09oi5/8zpzn6FLh?=
 =?us-ascii?Q?l37lRPIz9cjuTrh9mA9u/mluPeodFf+dnV0HBL9sxXAWRdU70pOB6w8TfwDM?=
 =?us-ascii?Q?HnxjNaYxy3FthSJ10G4sHVEqEx5Iq5HrFKnNnFp1z1cM1AIqcKKdOsAetSg/?=
 =?us-ascii?Q?FRELubOLAkUEo/NJRjOyN3eRaVZBEEGsW9v6ORYvgzrcbZQJrnMtZ2kQdhXI?=
 =?us-ascii?Q?xQVGg7oXorF+mZ7jZklEToQo8NtbIi88Z7aM9Zef2734Jh9BgV7PFfEuxplS?=
 =?us-ascii?Q?ZyvKuPFH7nOQ7QI+ZDaTULJaktKyiVGzwltC7Mw6fVSg0HaialKlzPgUu0pP?=
 =?us-ascii?Q?EhXvm3mxIDZftTNWTGJAJRkMgnUhJ/zuS0/W+C4KodZIgFZ9lAlH2322t2Qx?=
 =?us-ascii?Q?ldQG/pvFtTsMJ62TTUULnagOgjvrQvP7q+uzbPs2dQ/JaLsL/8iTO7K2GCff?=
 =?us-ascii?Q?Q6HZrAkxAuVgAx9ojLsEf7PYdUBde/vccbJtuGC81x9k7nsPasMUkSHRjU/A?=
 =?us-ascii?Q?IuCc2fJhju7JgKiU00is6TJxyk23mdUaa50cU4W/gXrjKM+f772j8MPfJPRK?=
 =?us-ascii?Q?nmlIOooM/msda7/NgR823ZbRKIhzaAolIf/0YRaccii4T7Mj2E20zN71UdmL?=
 =?us-ascii?Q?gQc0+xb76PYHq1XYVquOdJWkaBJn3kSkObodCCZ76Od9LWdscGBl+RVVtWmk?=
 =?us-ascii?Q?b1/T74wg5IsnHdh77j1DPbpvBdukTNe5XyeXAdMUsJxL9UmtEB12698Gy2n3?=
 =?us-ascii?Q?VYKH/voosUglLVJ7TS2dmJvkQSsYNaxwbtIiLvq0+wp7ICjFOgx7+Aw2ZcAF?=
 =?us-ascii?Q?U9lsgjmLHHp6/9fGDXuIKTH1Ev0vyAX9FSTdVXlzDAeSz2S9c718pZoFZioT?=
 =?us-ascii?Q?/+XpAZZYHXYVJpExfvaRm8NaOi2jEVoc2qP6kqZtBWmn9fvNrTGQ9mfLVeF7?=
 =?us-ascii?Q?7Uty9Vfw1FeuD5me0CG5IU+FXQK5SYjXr/zwyPlak+m9daP9Ryqa9is55JyE?=
 =?us-ascii?Q?aDYzbxqDj0zOmeFi22WfSvbbgLt2h3b9O8/buWtFaWw4YRAOQBbsD6oqc8DC?=
 =?us-ascii?Q?Y3qFMQByycqidMM4fzTBYw06mp7JM0LAqM/bGDIyTM1hdczoyyU95SICIJMH?=
 =?us-ascii?Q?eK0Un11Uy3cZYcxZv44uhTOKS8WnLniPb8ubYDCyn034GtSka3SA37rDkZaB?=
 =?us-ascii?Q?4EfkAdLdRQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3abb4e0-7c22-4c06-e667-08da22261c9f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 17:00:31.3970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rflb48v2hVhgbSM1Q0lUHu3Kc3zpqHFaypKVhRalo2erM0wp4gFpqbOmY3cIOZt7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512
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
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 18, 2022 at 11:25:15AM -0400, Jason J. Herne wrote:
> On 4/12/22 11:53, Jason Gunthorpe wrote:
> > Every caller has a readily available vfio_device pointer, use that instead
> > of passing in a generic struct device. The struct vfio_device already
> > contains the group we need so this avoids complexity, extra refcountings,
> > and a confusing lifecycle model.
> > ...
> > diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> > index 69768061cd7bd9..a10b3369d76c41 100644
> > +++ b/drivers/s390/crypto/vfio_ap_ops.c
> > @@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
> >   		q->saved_isc = VFIO_AP_ISC_INVALID;
> >   	}
> >   	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> > -		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
> > +		vfio_unpin_pages(&q->matrix_mdev->vdev,
> >   				 &q->saved_pfn, 1);
> 
> Could be contracted to a single line. If you feel like it :)

Done, thanks

Jason
