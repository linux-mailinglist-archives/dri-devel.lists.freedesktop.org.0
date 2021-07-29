Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE43DA2DA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 14:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7816ED82;
	Thu, 29 Jul 2021 12:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297276ED82
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KL4RyKap6tnGthxUMFZjEvY9+TIUJUJV4nfRsgQ6Ombrbv+2MlAGtMHx6yyX8EzNRG4a39cPyqUpDLpurHk4i0BeqKm3L8q1sSoDZIp+FVCDDKtsfThae99BRzcUmqK3FZOUyuP4KyPyDYohNrM9PHPqoBxS9m+ocZcrS8Q34EwWuzpa+0b4mkmnUy+jO7HerfnxfMH9WHHE3SR5w5ogJcyZBzD4iMMmshovbx0YvDhvuzi/tYMFqiRFcnr9muy2oykej+QX5XoSepnuolgLqBoTs5uTLoWlHr+xQ0iSM1E16fiRCqXR5UBMnTjSJpiQgpRlhGliEFpi+tohcUcm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSmKQaqMpWO1jtO7L0ZpFDJDpAztpzCAWE0SXqN/Lm8=;
 b=cdisEaF6P+LyREnh/veVkZ8oAY9NcRiKqWoKj3P6z2g1BPf2JlaVzwHEKMVv9wHtH+u6664uJy6vtj15Q4SdixokoG7O0HDBPfXLGyDITADIZxh/Lv2YpqMOoG09H4h6lhdw65qF5zpjsBOJb1qGIzhXFullrhHk8yLdbM4I4apcAlkt5h5UxoWw2Rs2SgRa8K7tqgQ3zWzFb3AmxR3OwvNSud3h6vvTAJNPzrTYDzLJdZgtW+fH871FCAAI20aS8yL4cLQLOF3CcXYN9r7MoVgyvH5uYgVBGEqZxOLk0H9DYjhNYbcuAGawFsBnoEDwFXpP7VNVkdRtMO1uKW7uLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSmKQaqMpWO1jtO7L0ZpFDJDpAztpzCAWE0SXqN/Lm8=;
 b=dJ/UcFvo+phBSQRxMzEZizfIWytYXB2GQ2CrkNg3NxTFj1cNd1F/XSIQe4kaXM6WwBKfa3bp2UFeuusDKIpuXP6ZauPs1ljOS+zI98Vb9ooFqa8lonZeUgaVKqMxYOkxFmHIkeEcR3XBa1OkhDgXlB51YyS6nNk9pJLXEOE7IusdaqmgkWqYCJfdQyBQpubxGJI0neQC1Nl19OKgCIGtnApETIitHH1P7Y8X4E1C0wMulsT6x2KSQ4Yev/W19tHqTU8hmB+kV6RPFioR/mASH20JBeihcRPOZVisK3r0yMEmIE8fycQ56MII0KNmIYHNsgXUMtbEKtdm3JUWcZxVAQ==
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Thu, 29 Jul
 2021 12:09:21 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.022; Thu, 29 Jul 2021
 12:09:21 +0000
Date: Thu, 29 Jul 2021 09:09:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 02/14] vfio/mbochs: Fix missing error unwind of
 mbochs_used_mbytes
Message-ID: <20210729120919.GB1672295@nvidia.com>
References: <2-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <202107291357.SRO9xgCa-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202107291357.SRO9xgCa-lkp@intel.com>
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Thu, 29 Jul 2021 12:09:21 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m94ql-009z4m-8h; Thu, 29 Jul 2021 09:09:19 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb500a64-a056-4c6b-5091-08d95289b2b6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5286:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5286B088DC46E25A5E4A83A4C2EB9@BL1PR12MB5286.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiOxymOON0vJJCkQNJS2o7yWpGP7Xfum3Yg+iYTKaZD4bm/i7mR/eEiAM6DuwZ4FIFOPfPLo966LwbxgQlXXYZ/pPNbP2wZsV1W+Ose6+tuaODI/TZ/M/L3BlYp+Jj3xS3FGth5KPVfnT8qnZuckwXGzHv7GWyFuaok7+xk67SZKgDS6ziTSTcB2IWbv7/a9RqFWI+MD/mt4nawGW7zbyvAAsYYvDY6rgdEBGUOw6Ns/0N69qjqwhuSNh2rIgzOojUlv9h2JSLb30u1IyrFoyrRByBKM5rjAfvkHFmIugmbtkrz3biX/PKqLR6ExH1x7Jg7/bLDUaYrQf1y7HhZd6PmvHsR3VJdFyCSyXrVsnV80P4OTwOVinX2kaG6sSGn5wZY8LKKgmjVjQToYn8Q0A7cfH5UtCFgXhPaAneMorNp+rU+d25vm6UTo+wzrxFpnXhluDmyjTFvvtxNA/24fZXbvg8MO9hF2oVQiGHZqSS0a3w4XbBHieEwE2yDj4dMagZuT/4AAgsJEkIZx0kbnLTC8UoHim8TnvtY0EpFkA0Zh9R3HJodfIeJwJrtR0mGQtL0TJOZS1DtIHLHnCLjffa1g4oiXGFpvv5OMQgl75w4vEVJ94qqIeC8ZqDoU4N2pBoYJk/f6QuzZ2OFyYUwBVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(7416002)(2906002)(558084003)(478600001)(38100700002)(66476007)(9746002)(186003)(9786002)(1076003)(26005)(8936002)(36756003)(5660300002)(54906003)(8676002)(66556008)(86362001)(426003)(4326008)(6916009)(66946007)(316002)(33656002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aQFoPJeuamFyB4x9MTfAOC9biHBDaG0tGkMoxXcCkF1sx4GuOCyonmk8Vrcx?=
 =?us-ascii?Q?K6oahbsOiu1BOOTuLywWfnzPt41yPzKP8MALUEIhCOrr8nQUK7RrzPyAe0TU?=
 =?us-ascii?Q?aa5/NIg4wGZtDUgGvdh7QpNZBloIDGslGTFcdcsXs4pn6STCy3luBazthfl5?=
 =?us-ascii?Q?eXd2yzx2KQEs3DZLVLy/JU8ltqFDZhwwzuGxqgJsQqtjM1GX42JTYOVyA4XT?=
 =?us-ascii?Q?hVq35e4ulMPrgIICEazWJOvONGu2KbiwZ9YaFx+AkzGHfqMxuhgBzLkSr+bg?=
 =?us-ascii?Q?W2MEYxEcp+iLWRz3tiug6MUXM0FKf4nRq0qBHCA8R7LkcI024iztfPazc4Ku?=
 =?us-ascii?Q?cMuRWOe08qIjJzPwKN0q6T1Z3KjwtsMoT5p3ifVle+EZ1Xc6+tQ6jg4UBRuW?=
 =?us-ascii?Q?xXBpu0YmGGN1pZAKofuy3RTUmWkOQh+ceshLbuS8PZYje1/VIiM5OmCKXyUn?=
 =?us-ascii?Q?88f90eNl8sP0xvc0p9CHu+HYzzZGDe74YXcFPW1vkwROnz6vYxSrEKtHbuyG?=
 =?us-ascii?Q?ibdgonnVtrPS78WkaNWbto6zB6Gh4OFXsfrDQrnImYmZPgCCI+i1GIBvcYQc?=
 =?us-ascii?Q?Ke9bDPP/tj0w3T/NNlzCW9gxeocKyCUQ3eVvxwFvPGaiH4UMp6bXRy9JBD1b?=
 =?us-ascii?Q?3+EMabPvNrxLJFoX6Pa0l2BAH6TNTfLpXnnhpIIEUrB7dcl2P1hCm4892au3?=
 =?us-ascii?Q?7FcHvJyI95IQx1VeU8WAOfuia6BAHc9Yy+M6UWh2QCY2a+fjV6tiPxBrYkP+?=
 =?us-ascii?Q?svtYnUYLiWbAQOHEHFA/hQ0jpmZlfk3gN89ghhfVGQwpkJnHneiF6WcSz5co?=
 =?us-ascii?Q?3gqbOX82W1mBby6D9Og5rJhNjbbP6tcAgN0b5HYpG2BQwMuJk1myRaJ3ugXt?=
 =?us-ascii?Q?9b5VSBSANwtmg5KbONWDKpzyuHIoAYlacTE4mPsTNdFnOGVEAkKgxouaEdsH?=
 =?us-ascii?Q?KqAD7OOC5XrijS6OkWy/2eSnqovX+XM1TTucwny3BcxlODk6R1qu6tEGsIqg?=
 =?us-ascii?Q?zVxH4hUrB1yaclDwySxmDXkIhmYPl5wDEqql69m8ith0Po6x8pNbWkYYrwK+?=
 =?us-ascii?Q?2SgB/vxcKaVQZmZy6kvK6+FKxhF9bFzOHEAl226O0I6UVDfSm+CBw/wxIPMj?=
 =?us-ascii?Q?iLgl2YWgUlmTQm2UNiSpOjesutKo4QedHgZxNJbuXz6RoA0sJblSz0hrgT7X?=
 =?us-ascii?Q?bYAmFjYeHCQA/91nkO64aksssqKAdzYGOcSuX6mqy9zX4BfjVVa6Z0wKVxIH?=
 =?us-ascii?Q?d68JxZuKZnbqVe36vjexe249lpv1pwooV2Ff9txOM9eJKkZXXIEdU9p2s65Q?=
 =?us-ascii?Q?6gWP6TVbz/9Fl91okCfPFuNA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb500a64-a056-4c6b-5091-08d95289b2b6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 12:09:21.3040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5p5LoqWAuyKhVSnGNnU4cXGzAbJMtbQO+b4X+BA2rfvvKFom+vcxsY2iWdE7xncz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5286
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, kbuild-all@lists.01.org,
 lkp@intel.com, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, kbuild@lists.01.org,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 12:38:12PM +0300, Dan Carpenter wrote:

> This should just be:
> 	atomic_add(type->mbytes, &mbochs_avail_mbytes);

Arg, yes, thanks Dan - I thought I got all of these.

Jason
