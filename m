Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13543E3ABE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 16:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D0B8984F;
	Sun,  8 Aug 2021 14:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2050.outbound.protection.outlook.com [40.107.212.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93BF89057;
 Sun,  8 Aug 2021 08:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltAfO6wUtANh+zL/ZQnDO5y8UitwD8XouNNvG9YwJ4bTBcqDgJrHGWeePRK5vFsIJtCiXvtWw3MxdV7H/gSyk7JQ9aSUIdJulckFAFTTfoOGyJub7L2pJO2GweyzMCe1DwD6K5YP4gP1oCJEYJULwflEu+sidxINvMHwYLmSnQuNPusgJ2KkZdoxbuA8Lq+nqx/Ncfydlq+/6C9xsAyfSnmvP+HKj5ufXn3VCKUOogRdOC0LWybnK3876XfDAMhxNuYRfIcsj77vS/oq52uKrBmK+rCv1Iu46K9da23gT9m9FhwlGTM5nsRNJU9xNurW+GTojzCQeEPbP4f+HNyzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/RGAJknooE9Djhl97guu1XK/xCdaQ/XCwgF7v9kTkA=;
 b=AIQUAoyBC+oUGEftsdtvwQEa6CV1ffIi2uhI0N/u7n3vKppZf9W1m8zH7ZEUHaf0Ds6Jqdt7y2PZUUMYSFMXixMM82J8gLXbu8HsRmG6gv2vo0taf4fNeSlFkX29BaM4+6owYiTPGKLWwzTEcRS1sKZ9gFvbcEWJQfFxOfl4jo0a6K11dzDfJjntmbZ1wCZ3IHf1bJj6f/WvpgnkjLk/XUsym1CNaB+ewDVict1kt5/2HrvAMQTyBNBSizWu6OWEDDMw6Hu57Xt+a7VXjUKexHUB/s7hmQzPZvc/BVTvEF4Il58lxYix1QUbiNXeConVlb1xzC5GvmmVuJVm65Ms+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/RGAJknooE9Djhl97guu1XK/xCdaQ/XCwgF7v9kTkA=;
 b=jtelv8o7qEr51w+a8U9gdOYQ/UQrZJ7nMjCymzk68G7Z05z3l4OOJW2P8EIbTeGC7t9brKONoT7fS+9CfjbWtig+PgJwxYOwUA44sLITwnccYdjcenb4kXsbMnQZB9nAh4OoG5ggYhZUSfQU8Ii0q7hg0F3kp3sX98odaC2iQS5Vg/jqH06G9U6PhX3As6mYm4Ee2T4O8wSxad0TChJaSq3Z/rk7r2hjiHejTisHLH0293efaoBlUj/Qb5/2LIekDKTrJwGDGTQYSp7XV2xKn/80OFoBrM3xSbngjEXEhmIHJ9I6vzPD60udrs7IS4tZfxwmvgIGXfROY8TmgyrASQ==
Received: from DM6PR07CA0058.namprd07.prod.outlook.com (2603:10b6:5:74::35) by
 DM5PR12MB2519.namprd12.prod.outlook.com (2603:10b6:4:b5::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.21; Sun, 8 Aug 2021 08:54:48 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::70) by DM6PR07CA0058.outlook.office365.com
 (2603:10b6:5:74::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Sun, 8 Aug 2021 08:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Sun, 8 Aug 2021 08:54:47 +0000
Received: from [172.27.14.153] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 8 Aug
 2021 08:54:36 +0000
Subject: Re: [PATCH v4 01/14] vfio/samples: Remove module get/put
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Tony
 Krowiak" <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Daniel
 Vetter" <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Herne
 <jjherne@linux.ibm.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 <linux-doc@vger.kernel.org>, <linux-s390@vger.kernel.org>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, "Halil
 Pasic" <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Vineeth
 Vijayan" <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
CC: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>, "Leon
 Romanovsky" <leonro@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, "Zhenyu
 Wang" <zhenyuw@linux.intel.com>
References: <1-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <a5fc93a0-4634-d0aa-8b4c-0dc28b1459d5@nvidia.com>
Date: Sun, 8 Aug 2021 11:54:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd05e1ac-103b-44ad-f4b0-08d95a4a2d08
X-MS-TrafficTypeDiagnostic: DM5PR12MB2519:
X-Microsoft-Antispam-PRVS: <DM5PR12MB251973393625C9941809DC86DEF59@DM5PR12MB2519.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMlVj7ZIwwFIMUcH2+f0d0OXjAUrrhiU3h94vgUvO2v7qAA/YfrcsQqC+1zln3SrU/ouSVNwC7V2i9y70Uo4Gcek1w1enXHzjk0LP6FFcJ75tPvKFIuzEXS0KSMuxkGQC2AKWEFOsPfdsYmfVQoGdXBIhEjtPwRppfIs97EPZFpk1DXI/0JeijB3Z9i04zRo4M6yhjaIqQgrkXmzTAV3pwge/ffLEYEQB2A4oJcysiInetbWj3o3Mez029RuNINaMflxQtA+vdczf878zVNwuLhkjwrdIP0p0Ke0+ODMIiYje6zOkK0nV1K+R0tdp/X6rCymuUE5lmfR+6XA9PaiiRpzE6X4vf29jJL0IvIdK2VntnQ441PqopO3/X453MwInKNqssLqDINGXoXlFFLe0MEdQ+1JAxuSfl2SpL8nWUyz6QwMlEkv4fG7Mh7T4uLBEErAvgkYAMRzdFcYVyN3eU/bXvsU4ffTJ0l3N8ZwpCouKoCfeAR9bEI4sGllKi7N2hnWVcILrJYaCuAU8LFRQPCGVN4nuaFTaj+xaHP4wn1y2uIW7ProRfouxSRx/q6E3RirEQn9LqUtd8x72A+fB6G4u+4N0Qp+IYKps5GlkzfQR6ARLgchuzi0JX3IhFyN/ICSwltNAODYOcjEiv6VpCUYsuGYuKRBIF+H4rT+MVjVNSa4yxzdEsAe13NMERdBSlW5iwLMwgWQ19ZToTNcQW7Jt8VZyUUDZhaG2tbf3n3YQXZyqsX/szMmxmaiTXzGVrq+23B60aJoBb26wkWoLwjM+ewgf3edzrObFMA1NhA=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36840700001)(31696002)(478600001)(7636003)(316002)(4326008)(356005)(16576012)(86362001)(2616005)(31686004)(47076005)(7406005)(110136005)(7416002)(82740400003)(54906003)(36860700001)(70586007)(5660300002)(426003)(70206006)(921005)(8676002)(8936002)(82310400003)(336012)(4744005)(186003)(6666004)(26005)(2906002)(53546011)(36756003)(83380400001)(36906005)(16526019)(43740500002)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2021 08:54:47.8057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd05e1ac-103b-44ad-f4b0-08d95a4a2d08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
X-Mailman-Approved-At: Sun, 08 Aug 2021 14:16:45 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/6/2021 4:18 AM, Jason Gunthorpe wrote:
> The patch to move the get/put to core and the patch to convert the samples
> to use vfio_device crossed in a way that this was missed. When both
> patches are together the samples do not need their own get/put.
>
> Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
> Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   samples/vfio-mdev/mbochs.c | 4 ----
>   samples/vfio-mdev/mdpy.c   | 4 ----
>   2 files changed, 8 deletions(-)

Looks good,

Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>


