Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F50604E66
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5620310EF92;
	Wed, 19 Oct 2022 17:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C1C10F057;
 Wed, 19 Oct 2022 17:16:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE5lypdt9wuQTM8MQqWqMagtrqQWGQZOvAF+PxLsFQYaFWCdwOusu5PnBC5ASmsZ6EjZPkeAKOXaT4cqWNk+nQh1hRwSHBN+QMFyi1ETzwXYRQvdKs2rdowcEexTRhNi5+aYnr6cNCnFik1lzmlrZsKpltJyMrCZJQpwW+fatGhxAOlKcpV5H0ZC15G+ytgQhwCbXB6uDMbbltttvrPU6zG8WwblF/+UBz8THGrIHOxzjwpkqMk541S3RYko2HDOjJEThr8nzIxLNpo/UgTR9aZKQyXHP/eAyRaFc97mybqwW7nOApaiZbYlTQTNBzkyBVlDlSRkFJP3n4aWRJmqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC0GLYEROMxub8xcfHSjLc2jE6Y2Llr6BxEuajvnK90=;
 b=ayKbdGFLvRgpjOw11EtyuD2JOr/GuKppY65sMMoct6BKZU9GjoBZJGwO6XumS02gvsESVckbYgDJgHCVUJazaL2oCtnz1bHMadgq++bLaegQzD8QtxLawqn2Wcs+Y3CDTkNGAE1EH6ondl0PXjJdDJwMZvWc8ddyVICrVNUpEz+NxucDeXbE3/egmKrnUTCj9uVbeDXswdjo1nHiXex7SubATFvbOhwOy7XOaukQTKMSGh+SHaoXaVakOjJZbi03cyhmd7ZDonoZBjfeqQOw5TnLH/NdzFI6PYQ1+Vf6R1GevoQOwWfXJOPb4K12Aw3F2xk4bnUqnoHEe+Jl9FVSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC0GLYEROMxub8xcfHSjLc2jE6Y2Llr6BxEuajvnK90=;
 b=jrn2D9Ysu0essw2wHg2olzzoniIGWwZIEyaGU0a/Mee0n5rMg+X7ZZEDSpuwOBF8MgaqFhES1Grr3nACLFfsbQOsIHO2wqmpo8V6QgITpS3j8fRHUuM/xcvPCy5i887rCCQBfMEnG6rf7vsn9lmZAMlEArgOIHTQFuJU1XrmDaXjjl5izVbHzWMfAcgcX7OjjFzaSNaWoDVca5U5q4jZHbCwYTpvzp9t+XOHkpt4bevzXhJbiv9l84+ZLvwgqajvU8aOaacTDwF/RFvcMOQsNhdns7TjyJnPPEsUhmi1BttHGH92MGcc7z4jkLtdEkUmqOFU4XZSlcqC8tD8JxaCzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 17:16:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 17:16:18 +0000
Date: Wed, 19 Oct 2022 14:16:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v1 7/7] vfio: Remove vfio_free_device
Message-ID: <Y1Aw4Ync0SjaiES7@nvidia.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-8-farman@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019162135.798901-8-farman@linux.ibm.com>
X-ClientProxiedBy: BLAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:208:335::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 050e3267-5a97-434f-ab4d-08dab1f5a283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uam0HBj7BwsrYxTN7N90sKRQFi46yBMn5QGvg0gMJPOFPpmGOKNB7+b2h24LPD7jje/8nPaUvH8rdBM9OSxJdiZ2HAJD4nW+XVIYcNzNnPLg0aWR27OrWyZykvV+M+iIqSJklg7fabZrTD0TBBVqsx1HVlW5mbQufgmQKRCuo/sxqyN3Seu0XQRY01CAlT9d4ZZQiM/eifiATRtfZEdxhP7Zb5mc32qEsT7BmpcJ7J/vJS2JkkERRrACy01BoNfoI69dZ1YNo5ErtxEHi96WFx33183nDIjLDtKGBIhmWXznXBnGRdRtXQ1vuhkDyCpsbmOkdpstrsPjbJagptvGoUiVWjmQEpk0zugcLMp8VyEamaVBpPkXm4lPyHFIIwOYHTZbDQs9Rj8G+crSSAU3zDz89YCgeii+gouQiy1XCfw/QKIybaV33dRNw/HY6K6udZa/YkbnGhidjf1Ip2W0/7rQZXD9zHlY/z6wV8ZUJwRmX8VQYO8aXUOg73WJhQtcQUIKPJOeGoYlFGBUUFWei2cTb8dmfotwW7TJskKJdYiKGNZ19hKKsKKsxNA1x3DKoqAvB7U57ykdj3gMmv/QlRuuIZ47yq3TpvYkYiisNliJYzXZEbHj6FTgYDYJBE4VTpkYof4CspEukpfXHMAocBP7BKRoDcZkVZPjPllo0cQBbKHxGzBO8LX8zasd0ubFGO+yY9TsHh6gHk8CvKW3hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(6512007)(6506007)(2616005)(478600001)(26005)(186003)(5660300002)(7406005)(7416002)(54906003)(6916009)(6486002)(316002)(4326008)(41300700001)(8936002)(66946007)(66556008)(4744005)(66476007)(8676002)(86362001)(36756003)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?18gHApC9mIqdzv/nGs8seMN1y0a+2G3+CmlG/zh3aUblPmIXh2Ds6zrPYgp6?=
 =?us-ascii?Q?PlWMru22ZeJaGnlR30mI5dihXQ/IGWLYDtg+UVpcu2P6Z6fyd8UsiPKlcYJ3?=
 =?us-ascii?Q?UlrP63mEHESXMM0gvsWPRUtlJCdqynTU9xGouEaKipU4XnxpEBmiA0wKr/vy?=
 =?us-ascii?Q?mhTy/xkHY+fHeLc4/6uYJtPkQrepbsh8Qxu64qHmpZVn/ns7i/POGnSw4lhg?=
 =?us-ascii?Q?6V73VojDRwuTOBTuyTdxDujmzOhmD+7vU8xpFjOBMwY2KJSUAY6iqquFdan+?=
 =?us-ascii?Q?K8aoRaVIgVv/Vb4D0Wj3LSbOMRrIH0lCc97/SpFXa4fk9hOuy8dDnvEARQGb?=
 =?us-ascii?Q?epp8kl0no5CuqV5O7o/T9v2+Ituxr3+6Z7U34+kNtvFgEhJc+IYGrLWuONNt?=
 =?us-ascii?Q?wonQ0v+PRiMoJbQEoMv2AstYYzwSeF0QSgP6wYv4aHD8rfege60y+s9Vee57?=
 =?us-ascii?Q?S00jqCAx8QQLI+4DMkMpJTyWr3KtXSJl6Rs+AHz3KsM5Pqngx7bCYwl0BPE0?=
 =?us-ascii?Q?zlGqyMjsJpiWsQD9oOMsqCKZgyooSLC8OwF0WnKBNbvHKC34HNTNXbsBDi1N?=
 =?us-ascii?Q?jtNSyGdnKv5Gsg+vrlD8CBV1qvnOvph7ZZx5S50Y5r6ey8VDWpeK52+xqiT6?=
 =?us-ascii?Q?P8uusrcTbE4iQLJw+KyzJwWfgF1wNoxyhuz8XEcm2hivZX8kNM7VZnj7HPtN?=
 =?us-ascii?Q?akygX8+zJ9/ErfHC7mzQTNcHpwe1ORfjVgq7w9LOGbOB/HRAotvGL6L2jJpy?=
 =?us-ascii?Q?q+zeDPbKreVKdIpucYPBC7REC18t9aI+OdYrhYkBPYS2mkldHxGeOZaojS1+?=
 =?us-ascii?Q?gcrPdGhAbpm9SBgSymUp0ofpkiCIPud9biJWofP+UJkpPP1Jq2nmKjvvXDm/?=
 =?us-ascii?Q?cocqqTcCWW00aWrXi8OkkUXbkPfzmOzQ148WfnQ8dbyt8tYbJ/lE1O6tf/SY?=
 =?us-ascii?Q?Qtbv82P1PPtkurrT0GR3IdwsU0S+1bRjlsk3ktOoXA7hy+xvnWbfW3k1YQyf?=
 =?us-ascii?Q?POrxd98bQSRY38BydsmZq79Q3b1fJn+t18ryrpJGxqszVbYoYCEHa2P/9ulW?=
 =?us-ascii?Q?ukvf7pNj6fzjXjRZAciZoRZv+pvvSFIYiBKhgEI++fW7hZpZNnY/GMaJCkRY?=
 =?us-ascii?Q?0b6XfvqV+8TGbksEcABQEmI9WxjCV7/COmIIygN5q1+xDvVBHlSIuwsqLkSe?=
 =?us-ascii?Q?YmtynVM8NNT89QT3/eZ70GuSGqpw+TDB+DQ3xCQM+/NCRfaJtjdyeqTLTB+1?=
 =?us-ascii?Q?yZW4/eNr+CdqALGiz5PVcujNlr9xXNlFcKhh84350OpINu+kZlA2NXrt+m3G?=
 =?us-ascii?Q?eWqDHFOEa9PQ9uaCHF7TY+eUViAyllQwmyyr1lIswD8dNsO7u0opfLy7ba1T?=
 =?us-ascii?Q?34o3D4QAnDNe4QDAR7U+D6qRUG/0XTnawOTcPg5/4UqHY2GJ9jbKlF6yUnXJ?=
 =?us-ascii?Q?OSBgXZP2jzXyduMU/obvwkjGTZZPIkclNq3jUPTWI6aY1wlHz3qIMSbId4QU?=
 =?us-ascii?Q?LzE0uq0TxpG94DkaJcDDqFX/0v6pNg/y69RQiI0XJC6bG2NRXNlYcowygD0d?=
 =?us-ascii?Q?8I4l1BxjGg5j6PLsUFw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050e3267-5a97-434f-ab4d-08dab1f5a283
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 17:16:17.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPm+XV/Eh8Ajb5sQCWJ5wblUDYGFAQGVtROij5Ja08kLRhJXOJce7WA975MqFVX3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4954
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 06:21:35PM +0200, Eric Farman wrote:
> With the "mess" sorted out, we should be able to inline the
> vfio_free_device call introduced by commit cb9ff3f3b84c
> ("vfio: Add helpers for unifying vfio_device life cycle")
> and remove them from driver release callbacks.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
