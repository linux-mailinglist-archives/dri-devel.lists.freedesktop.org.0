Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70C568F98
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 18:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A6C11BC28;
	Wed,  6 Jul 2022 16:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82C911BC31;
 Wed,  6 Jul 2022 16:48:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgjmwqnoC+iRb73ndm6B34r6hGN6AV4B+wOJ3ILijq22zOVN+xyNg8o+DAxxcrWCz/eGkXULepSLggNBa9JjWW1agHpaR8Heo7jC9EGMA3whC/XinGW92pop78XtHDADAg9NDjywEpcRayRgpidUUHVJyMQa0L605MIL1J8ncKXaspD4pGap2NqS8+ZjBBcYaTeFdDct43sESN21NQANh6QbFmzh7BJuJ+XfZpecVIyCNuinpTiLjoa47TqMiSVYu08GKyxOLLL6bXDNiJRPsBqkYYvJLUTFGL5n2fUOyrQ22vSl/yRvVq1VDVQC53WNR3qjQgbGINBd9j26E0jGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPPutliEJ+0V/YhgP5gAbAUE15jlkz3Q7cjOflgbR1w=;
 b=fSQfo4ddv9pFYUzeufpJICVc9ec+LIyIcrVXVoLGP+ENhWcogQndY1KEkQ2LJPBj518rrym5exMapwNGyG5iMvW57A4GoS3H+TmX+T9E9nzDSHBNUMLsaInvrC3BjsddI73nTSWmc//N9xYQOXlK1uZb6kTWkjcuGCNZxdy05v7E+B8zasY7W3PByozZnvW+EZIjPcJkRpBSHjrzt1WkG66zDPAW6boouXyp3HVp8+60uUn2BeKnCqjOcQIovJtdMlg6rCUXcBUN9kWTNNZ7HXvR7/z1B6OBRa1MRi3TIG+/+qZh3xEiYc/WipgPdFA4wC+6NZI359VbirXgYba5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPPutliEJ+0V/YhgP5gAbAUE15jlkz3Q7cjOflgbR1w=;
 b=TkQGzFKWC+RZCvfdKV1a5IFsy0sNzws8lrUIn1HUEyHuPd13xiFmuQeIHrpxNSSdqP1dGtkyDXPuMQnZyKSYBbLO61jImRrdhERgV1MtcmYsCgA3rjQ8JzPqr1mSubehdmfdUsju3YWfp3zMybt9jdi08gkeMzsV78Flj77+VEQQ6yBUf0aVWlxMLcNfsnF+wY2xb7EnGDv5NcPaWktLMtz2uPIUaB2lrJgJl3/ieaEe2kColbrUQUA3Jaf2XZq66ttw0EQoukZHsSo5s9FsMJhbMtQHuKO8MpQRVirW4/IOFh/yLcBr1Bsjk/bJ0/Sv10rCo0AmwVptytob+iCBZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR1201MB0226.namprd12.prod.outlook.com (2603:10b6:405:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 16:48:28 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 16:48:28 +0000
Date: Wed, 6 Jul 2022 13:48:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 2/9] vfio/ap: Pass in physical address of ind to
 ap_aqic()
Message-ID: <20220706164826.GI693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-3-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-3-nicolinc@nvidia.com>
X-ClientProxiedBy: BL0PR0102CA0034.prod.exchangelabs.com
 (2603:10b6:207:18::47) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15b60f44-8f5c-453f-ae38-08da5f6f5986
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0226:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9n6oBr3mkAUn6cXcmH86R4pgnr99VD7TifDTsxg2LOVLT+3qh8Yc/J1MSL6//rbqDCJA/BEK/8PQp46W99VIS/fQnSb0Vx1X9XrJWeGWVkNsb9lqXwBASI+CHYX6JMeo9D+WZVxJJOUyhBqAXbzvbcpEXDSaU3Jw70XftpSARAkl7UnClyOp84MRklrXhukBysKuDr5lS6hfiKM6uyVc8xQsZH22vWHKW2qN/3c4WWFtrK8bcoQC7CHPcTvGtaU1cAThEku0URCILI0y8jqI6b2vMVNn1xnEf4cq/nbEb35gKy45HNg8B8vNusl9E3sN3eonnNFCgtMHuVp557BszZZLl5D8tLMAV0j9YB7u/C5/Ajs201ho5RvwI8Uh6vgpHX1eAQry2rMoMOq4ubmRmA+IdNukxUJJjLvBaYlzEoHQaPVzG0CKOfkgqnzkaQGg3Q2S15gRXLHeyyvKh0VeDYogTgJnfR1IYpcT3wN8/ARgZd6NsyOr5g+R04GdJk1Gk7a1QExCKZNszovMhYwABxxdKDUSxqVYtYztEeeeOjD0ixjhIet1+l4RMcu8lWNuh/lLXIjYvUIs2dZ8K1I0aDXWJjbfYVvfvPeLwwUVHAxcuRWi9zGyIr4VQRrqKKVWbp1vyvd2r48eCT2b9pcABStoHzsNcR6WxzfsyYyT3b9Hy/TK5+2nYNxSFDjHJkKgnIPqpbV5hcFvBlSqPvEglRE660jtGS/EOiwhoScQ83cQrXrQ8L4ty7LI6vX0hd/rbmGZmhucI2g9ZANwEiy6Tf5b4TC8pT1jCMXGzhlFsiT79+flR6vWQI/60XTtySP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(4744005)(7406005)(83380400001)(6486002)(478600001)(2906002)(86362001)(7416002)(1076003)(2616005)(186003)(6506007)(36756003)(26005)(38100700002)(66476007)(66556008)(66946007)(8676002)(6512007)(4326008)(41300700001)(6862004)(33656002)(8936002)(316002)(5660300002)(37006003)(6636002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZGCnwihkDqbwISy5V0SvlKFprj1rBBZZac7EEzKsoRlRJsBug4tkQMmXx8yI?=
 =?us-ascii?Q?EZrXikGQpHMONgG4h9hk/l2zK2gSPGI+W2FzajYwi1g5zOm/ss5ejLSxS0WS?=
 =?us-ascii?Q?W8Rt7PUY4pv/xvRZBir4L2iNys9CWqogK1bp0Ab9ZPsmQtjb8rfTwzzP1Ifv?=
 =?us-ascii?Q?6sBAnBabhgwRipOhNEfNJH590ja2McYmPOWXbUkMh8fGO7zNgggeRD89rBiO?=
 =?us-ascii?Q?+7DmVuCJ8pnf3zbu8yXG3o+s60bnSadyX5a+/NXGCfDXVC13CjxKb/4wdwXn?=
 =?us-ascii?Q?vMqGLA8VXm0dvJaqNDDebXq11OJNCBQdx23Ol5LMl+VLIelk6TGecj0sJn18?=
 =?us-ascii?Q?KsUPoBII4LhtFTn3jrXmPywE465+xfFAI9VLjynqJe+4v4tnzkH0fTGjZ+ol?=
 =?us-ascii?Q?T6/TZpcitGGjvd4IQ/3qXR5QWVQ1/AuZu1eSc+eapi/kXrRrQiv1F4VREgon?=
 =?us-ascii?Q?ZAAu5SP25N0zfOI0Q9bSNqeuQ1b4GULDUvsc4YUFRSWXoNrx26lRepw5S/RC?=
 =?us-ascii?Q?cSpcgDTwCjzKniZpmp5YZqLckwXP2Kiorwew/0NqD5MVrWUbURAfWcn4BTFH?=
 =?us-ascii?Q?wkeRQ+PrLiDx9VbZKMOhBtyB+N3TrfguQ/d0T0tTH7Vp0OkRECWbAnHmzI15?=
 =?us-ascii?Q?lL/aDmh/8OvbIJBCMU5UnbJrCDpRW7Chh3J7wmjBRZiPf7LGiDMWjBzflh/h?=
 =?us-ascii?Q?5wxQsqeTcUuDnxlh5rSmrFIobbfcTSrSrZjOUO5b/4ZVFgCtm/aAOcObWN4u?=
 =?us-ascii?Q?GPvyRE0OQw8DbBQVwcRy+70kkhV02EWNvlaKPZ++zLemJ7lSSezumzxi/Bo2?=
 =?us-ascii?Q?9OVcZatN+/BvNMW5c8yDWUacA0N6SdjMYI2887NE6X1lAekLAgOtPn2jKNCh?=
 =?us-ascii?Q?azRsuyvXWN04FzpI1AeHuwmZ7V+S2cd+6sZFw8v/Tk9QnDhlgxalzwRARDpg?=
 =?us-ascii?Q?URVeaI0XpCv/c4LG7oiDwkPCi8thPXvbxh1CLdVfNbfy7Ukj8k45AgJ/vFku?=
 =?us-ascii?Q?PMvswf+Iya1CWRkr9VNWWsleEJx9fAL1UO5B6B0hyrwmbLhiMLqxcJygs0Dl?=
 =?us-ascii?Q?/Yy4YPIg2tfhnFOgnG1gbl2oxqpI6tWPsSCrWoN3dk59vwOFQIQQxZSJZtVe?=
 =?us-ascii?Q?/t1tjGSK86/d6x6agxfo6J/91788qVBJoBmPlA1O4mYz9367QOGCJrdsPSyp?=
 =?us-ascii?Q?GnluSOtCQ1hIzbSGtqx+5+KBKBPeeqbFeJchwbtop3+KXAfp2UO21pAfawDJ?=
 =?us-ascii?Q?AmRJMtoJeAtg5i6/3Ujy3+nAhHsXCCmBih+66+obmWSPPCGCpWsNa60xDqjq?=
 =?us-ascii?Q?QzHsNJs59ZHh5S4P+cXkLAr3b7KNRCk2crR8MpiRvVv4PAhDQF1dvgFA0bcq?=
 =?us-ascii?Q?efjfLTqQ7eM3OdpH0urLoRQvQXLepJM0dpt1H4TjsQ2iML+OHf+VBb1vM9uG?=
 =?us-ascii?Q?igXDymVqQGNB0ZTI/ES3dU5bs0NXIwVSCLXyCXVInU+e0uRkfPj0DDRSmVzC?=
 =?us-ascii?Q?Dfiu3s3TxjkMSGs+g7mMsdExCOfKCLgVBjpCHhsZvir4yrxRrVS/sx6HRs7A?=
 =?us-ascii?Q?LYM9Dn16p/y8FlngDHrm++hql7Eq+MSaMOyiJKoj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b60f44-8f5c-453f-ae38-08da5f6f5986
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 16:48:28.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGW6N3rIhZO39L15t6TLrAgijjJaea6q1dbARNqAPducAPChX1vJIHp24Eejm8T9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0226
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
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 11:27:52PM -0700, Nicolin Chen wrote:
> The ap_aqic() is called by vfio_ap_irq_enable() where it passes in a
> virt value that's casted from a physical address "h_nib". Inside the
> ap_aqic(), it does virt_to_phys() again.
> 
> Since ap_aqic() needs a physical address, let's just pass in a pa of
> ind directly. So change the "ind" to "pa_ind".
> 
> Reviewed-by: Harald Freudenberger <freude@linux.ibm.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  arch/s390/include/asm/ap.h        | 6 +++---
>  drivers/s390/crypto/ap_queue.c    | 2 +-
>  drivers/s390/crypto/vfio_ap_ops.c | 7 ++++---
>  3 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
