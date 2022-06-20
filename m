Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33894550EB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 04:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58DA10EEB0;
	Mon, 20 Jun 2022 02:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C536E10EEB0;
 Mon, 20 Jun 2022 02:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HREgDB48xBAhokOWhI7Q58Ml10hdDa+MHP4psUxj5KpAh00x98J5b4DYX7dwGRmX0BaPpscTWvd6dApy3gO3hj+DUncYzhgx4Z+BdgM3zp18go/wCyeZRNBeJuB+SRWJ5fA9JVSq8YbzFwLAQjVjBrZ2B/zKiGHERzwF7/90SuatR4+WSzAhGVTFSHpsDSzQqfqlGbIlKaIeuQQIiv6HJdyXeuoCtc/Xm4/f3CEzXrz+Jfjo4Y9wktMUJcvLnZ0vd6x5BxNKl+8yC0/lW2jhuNh2VbZ3nP9rlShqZqH6Vv4GNI7FIntIzMfH942aZvqR1Q1af+X20JQJAsgqBs4oyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdeRBWNamyq0dRtPAGIOBRMw//0O4Ppq5FOAVJh+dWg=;
 b=NvhtH/4n7k1e54xia8CYiTDU4lisehj1ca8beI38hsuFDVHQCTr6qLUG3H2tuZNH4Zeckg88y0G5PHBJkj65o8dcN3kuUg4i80p6m2CFjIBppfSF9s8t1hLFmRCfxX6ITTzh389BLTpmVIYrvK0sLKl9VYbCYHVgpTmNsbA+HrK71C8854XcJ2z88Ooc0FAQJ5caQFswETT4IFbfIQK7tTK6HbSaBXWbUSgP9lA/ppk0nMvm6rOCs/JYq0KiSgsngYTz2dbY9pDHkIfhYGBK1V+U4332qmIyA5iOAg/CqKN5O4nogobkh43EKCaXWxxQ2WEQdpi4hVDGMa91e5CwUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdeRBWNamyq0dRtPAGIOBRMw//0O4Ppq5FOAVJh+dWg=;
 b=uBq9D6K0FGLVokU/MqIaPtmZFBqJS38T/W3KDYi1BC2dcVI5ohBbIdJM+QpnZ1lJ0nW1drixHPe4EaJmDfprZRczBUTeaVc/xUhoZ1vZJzBBi2/VAoDdYBJ47dOK5RTb3hDwV6nqHkFC0q1u3uVhkilOdzjX62EC3jkkRW1zOg2+QuQsptHcYpoYg1m+gw3RxYG0g3Nxbny9rdxL0O8TBDI05E9KqEgTVv9zCu2CH9wfwtdh1RH2YGxxATR5ZLecoL2gbRocVVcDGXSfA4cjmlsgEsRyRTMd4WgQHj1rwmoliePFVNn03UpdPfVGLyH9+ufx8nh5oOySv6pN844QHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR1201MB0019.namprd12.prod.outlook.com (2603:10b6:405:4d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 02:57:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 02:57:29 +0000
Date: Sun, 19 Jun 2022 23:57:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <20220620025726.GA5219@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqw+7gM3Lz96UFdz@infradead.org>
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25a0b0d7-8fb4-444b-f39a-08da52689ced
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0019:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00193E613E0D72D51CF9FA47C2B09@BN6PR1201MB0019.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbBBw9Ah39HQgTDG9BzMvJi2Wp7lK1aYQBisl7sZe9CwgFwXuBIpBBl7vH1rWqal7RGjHxKtyLknlqc7jiMLm5qY3e4WFH74xW13bNZJail6xHUInhhHT3yhrVXZ3x0T0RICXhUXyzkFhkxfiqMr7rB3FTOkUiNOO8ged6diCxCKlS+dXYP2lIz2vZnSl+HVefHFNnn3shphY5EmfyLeDs4WGrJgCsofY8jUCWkuurxAyOZc5HIjEY0VCYFaVgH0nfjoOmW2hATXs7RJ0I34ysZSijiOgg4MqgJBA6nWGTgfvmVvQaEPYJj/vLKBB3DY8lJqxsoS39klmAYRaSbkLpaUbnO48BH0L9D/qCRPhJ6Ev2nc3CAiLgj/WVeM8Y6VHicW7icfXgyvOn+kkuPHXk4LE+jzBiqMNitsNYZqCy7VSv7HQo0twPTfqT2l3eJH8blte+u5w16lJGQ+LZQTe9eNpbhtqUpKo3ucbfoNn9rkBvQ0V5NR6UwSO62xNbUizNUR0kY2RjGvaKlbrr3sni2Z+OyHJwwZ3DqK0lhvAvbT3mRVXAjyZ7jQYloPdZEpqzVcUUkoTEhCn2XOxFo4WswuOXlZfA5xKOIQ5IMkGNmoR3yWQFG4Jxnaog2ttmWDrcawSLFKPxcK6O9VdSJAUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(8936002)(7406005)(86362001)(2906002)(6506007)(6666004)(7416002)(26005)(5660300002)(6512007)(6916009)(6486002)(478600001)(316002)(38100700002)(33656002)(4326008)(66946007)(66556008)(8676002)(66476007)(83380400001)(36756003)(2616005)(1076003)(186003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ymJYubytJwILdP9AaFWLqdK038/Qp+bo68gGQ3lQAbsvPk+WSx06nJ56JRqK?=
 =?us-ascii?Q?UKGDxAx9o9LZTIWvaK3uvFh86dv+nDQGoOgwLSYev2/HNUTiwFSuxpN766MV?=
 =?us-ascii?Q?LmltRi/EV1FHiKHbMdy8V/ksqAK72HNY7jPgD3y+7RhCbjCpeBuXB3+RfT+/?=
 =?us-ascii?Q?KJQy+kVn+JRCZw9eYXDS+VUcjaO4rNTVbazpDJcOEabUMYn7UFmnyGExJoED?=
 =?us-ascii?Q?I1KrR9/x4/tY449PRfASELQHlDdMxZAb2QdgTAacdurf+nON2QXs/v29X+xC?=
 =?us-ascii?Q?OWZlwoLeMD0rYV7UqnUGWwwU3tCz/ekoQQiyaqNL2mJKI59WuPjSF00AxSQl?=
 =?us-ascii?Q?6BbEVCgtKkIw2Mc6NiOlGuuslhWYpr/wQfoUcerxO6ysfufKluHk6QtzttHx?=
 =?us-ascii?Q?o5A4PBmmMQXxEtNlSvBBOP3MZacNFQtFAOvluhtX49+WfnSjVls828Go2vR4?=
 =?us-ascii?Q?avOfFcZwWFPN2VD0m35Een4/LS5k3Jt7TWtPxJbpUn6sm01NAC2+Vo9C+nN4?=
 =?us-ascii?Q?JDsT3dqioovhcqmGuh5uJ7Nf56/Z5YDeouDmD3KTMFoI0ZfwPgbiuowi3HUF?=
 =?us-ascii?Q?1fsofvLFX5jwFKuzijUrbP5fL0QIR4JSCni792xf9QfoXK36QflkmG6DZ3hg?=
 =?us-ascii?Q?MJo4rE6YurGrSlwcrcmbE7P0KSG4atIdigZb88UMnYu1VvjiqND+Jmo3T1dC?=
 =?us-ascii?Q?+IkbDFcHVln6xdm5Ccs06O3zEc5JyEQOz7aDkTM15VJk974Y+4pwMAazvugL?=
 =?us-ascii?Q?qlNF5rUub1CLUsYv01Lpk9lttjxP5hJtHDP6OjR83Id2Dkb6z/c17TaScRCc?=
 =?us-ascii?Q?Wm57ut2ASszt98KWX7fdZLkQP4m3/Xd5fEq/CbkE3zP5zCdZQYVXpcV2b3Al?=
 =?us-ascii?Q?NFi/PqRxCyBxf9qzwB/H+TVn1+Ie1itlXOjDUPB11099xKG369gFAuFO52A/?=
 =?us-ascii?Q?11am/sqGzr6prO67QY24kP2Py47DNV4QiSO5SuTtmGCmgnawEWbhXKMADbB0?=
 =?us-ascii?Q?hSCMAINbNeaoQA1UQJqC/Du84eHqoQrOD0ukqieD/YtO2nc5iuiXTlHW4COY?=
 =?us-ascii?Q?fdp1LmQlA59Xvd+Heg08N3nJpTYjKy5iLv4Lqrwv/plLsI1qsFOAWkTWi1UW?=
 =?us-ascii?Q?16sRba6au1YL0SDYlkD2/wLA7Z8uulD3ivZsOvvl/QkjUn56qayoP5jBG2OW?=
 =?us-ascii?Q?zeyXZ0FtKCb5TtxKJ9H3qGx73W3Kgpmm/GhHDNP1O7YPOdKEEWWezIrryfri?=
 =?us-ascii?Q?H9wFuh2Lm/YsRgrvqBdBmdKIBpyCVxtHCKNK52vj+Seix1ezPIBO4DADG3t0?=
 =?us-ascii?Q?kYn/lCCpHyJPBNrxFb5f9BVN8kTU0WcosD4RBhyPtgvSu6dAw6D39qr6CvWP?=
 =?us-ascii?Q?lCcuakFEajGt3qMiO+qomr2Xo6CJhzi2+F5qimZRHkKjCw4OiCX8rGqEIu+Y?=
 =?us-ascii?Q?qj6g9oiHEOYhSQ246onnGMdWxkgswCSzv5c7XQiJhqbryyxR9E3H/kweKjsB?=
 =?us-ascii?Q?o7ryTyuQVRUzpehQxgpbBqQrtHl+HG7fyYzOvKOtwn1mM7soY9POjPeYGvpN?=
 =?us-ascii?Q?xaaZ9SukXQBAkQLKlQaoWcocZ1c8h6laVQb1xBOerBPrZK4D1SiDig0VrXBu?=
 =?us-ascii?Q?1kwA7Sqe927YoH76340tBypyGA9qqz4B6TkkWg/utHfU8gcrGKmOhBxxMFSg?=
 =?us-ascii?Q?ydLxschecaEhqzjz1fo4zcx2tuGMhdKlbbiu2x7eKhLLzkjW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a0b0d7-8fb4-444b-f39a-08da52689ced
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 02:57:29.2399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNQeS/jExt6Yld0lvsWh8g/2obz9s4MzaDFnil2ODgbcnirEsRcp1rEBVxgmHJI+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0019
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 corbet@lwn.net, pasic@linux.ibm.com, Nicolin Chen <nicolinc@nvidia.com>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 alex.williamson@redhat.com, freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 01:44:30AM -0700, Christoph Hellwig wrote:
> On Thu, Jun 16, 2022 at 04:52:11PM -0700, Nicolin Chen wrote:
> > The pinned PFN list returned from vfio_pin_pages() is simply converted
> > using page_to_pfn() without protection, so direct access via memcpy()
> > will crash on S390 if the PFN is an IO PFN. Instead, the pages should
> > be touched using kmap_local_page().
> 
> I don't see how this helps.  kmap_local_page only works for either
> pages in the kernel direct map or highmem, but not for memory that needs
> to be ioremapped.  And there is no highmem on s390.

The remark about io memory is because on s390 memcpy() will crash even
on ioremapped memory, you have to use the memcpy_to/fromio() which
uses the special s390 io access instructions.

This helps because we now block io memory from ever getting into these
call paths. I'm pretty sure this is a serious security bug, but would
let the IBM folks remark as I don't know it all that well..

As for the kmap, I thought it was standard practice even if it is a
non-highmem? Aren't people trying to use this for other security
stuff these days?

Jason
