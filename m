Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4503AA52D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272036E082;
	Wed, 16 Jun 2021 20:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D7B6E082;
 Wed, 16 Jun 2021 20:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECVaKbNloOzFNJtaj1ksopxM1hV/bmDGYt8cHueDyikiap4JNHI2vheC+JDSxhqZm1pv6OSWGadfb74A21w6Z++6A13CsUoxNpgKUKkL2xBqupRwtTQysdVixGKX/3T9WZef2Z/VSXA3VGNnKauo1adLbifAxgQAQCDHsgvlTmnoY+ZvvN0IkvShZvopq5f/LGbUFf0GHTMdooYh8QxW+PmqgN4gGQWyfXe+dN8dHqIleWfrkZocTSjMX6C3oeYqG21nMCeUC0/ie52RNm2Xa+1iuZScg0yc+Cw340Fr2GFAK6ypMN+YX7dHxBwkp+B7frzc8pv6hln8pEvHxuhzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ2QrSIZZ461cGDGJ5TinMlhuC4lslCawoC3NYfSfgk=;
 b=m8lG8LT3o0whJJEg0y11vKR7GtLCQE0+ENriPJ4WE6u9s8mr+G1tGaprdaozqLxs4m4GZMcmYOkOl5Wqm0if7+g7rpyJSOqEoO1+rbuK3qiHTe8KO2a5Tr3dpgBgQnXpqM3Tm/Dn4AMERNNbAp/jrsOLgwCF1jXj4lPXrKJl9PC+7isCkYDqB+HoPzIG4S4AIlbsq2/2czoFbuu5Fiv76bATgX4YxRzF8Np+SllYmw+U+TDJXi03yGmIAUNEhdcg8RKcp18/NZtBbesZrEVFByDF91+KSHv8kV+tLlwi/2DOk5SlxJUgTePMrbO6wdH1Ng/hfJIgvr6lHEaGwtVEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lwn.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ2QrSIZZ461cGDGJ5TinMlhuC4lslCawoC3NYfSfgk=;
 b=BHX2lYYswOR7LcprLgN4tLOXy3aio7pKvFyDh3evXBeMsOQNSwpf12pyJsD5DXaWtUvv+3g5qX+V5x4JowTHmxQkoJ52uYLgXGI2syXW+4MdfBV+rvvNbIauLdewM97IRTKvfniEIzJSBPR21wSL6SG4asBdeyezsFAvWdSK6fJLCWlrmtlV7I2lHw7OQB4o2N90XVGH7U9UsyIiT7fn/OWth5BZRMLYsBumF/I9ubKGxGwIauQTndN+TBDBW3vZNlt2rdL6VxDXLJdZP+qmoeUOKhoVZTuBwmAHw7e4nicOMAZBN48FkufdnVWFAWCG3tW1jQN4Oa4ARQh5P4GRYA==
Received: from BN6PR11CA0043.namprd11.prod.outlook.com (2603:10b6:404:4b::29)
 by BN6PR1201MB0225.namprd12.prod.outlook.com (2603:10b6:405:5a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Wed, 16 Jun
 2021 20:20:50 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:4b:cafe::89) by BN6PR11CA0043.outlook.office365.com
 (2603:10b6:404:4b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 16 Jun 2021 20:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 20:20:50 +0000
Received: from [10.40.101.248] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 20:20:43 +0000
Subject: Re: [PATCH 07/10] vfio/mdev: Allow the mdev_parent_ops to specify the
 device driver to bind
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-8-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <161fdf49-9577-1273-3709-9e288838aa1c@nvidia.com>
Date: Thu, 17 Jun 2021 01:50:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615133519.754763-8-hch@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f024fe0-849a-4fcd-a227-08d931043c1b
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0225:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0225B319019CA02D6B1B1EA5DC0F9@BN6PR1201MB0225.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95lwOwFdhGG2RXZ7VVttELNmNQknyCTa2oq/oAShVoHd/4u0Gou4wt/r4N4m2kqFV3/Kc0JT2s9kF9fTbfhXU54aoBLoONZFsFghohrnJk7fTzoNnYhcJN4aUAedR3iQn833643GGM+/83LdSSfvcqUCQQJdhyFKtwPwtABSreGRyCodnOiKKdqtpu9+hxthRASP4p4Wvf6MNpmSe2zPE37AjsjdFXvzwO0tmFc/7JTHFy8knrWJUijUCoK98CyBn+D8ceKzYrv2K7aQKIJpnZqDXcmsaAuda24cBBayv7XVnsGBuORM5YA+OnkP1Yi7oIr7UGHue52bckVuTAZeOw0KAN+CsVpsOfrODC0fLECSzHJi1hqqkm2sEAF+xNguPzoCjNEOpqeFQOUCPpEB8OvpDui+6Yyt/xgfbeHPG3zDORNvnQLZqG2tNRfKIik3fGyr3rSYiGCpdrxI1nHOuxAayC9EcadabHQwBgLKjvr9lRb2eurCf+lAbqgymPSbvXCDkomfYccbmUXfqpUIzMpzFQ1s+NIE32LC8rNO+xFVFm9d0Jv3KjiwvCFUAKc71/79UTbU9l611tTPxQ3iwJcRTxMrNLhJHdTG3vSv7uX2YKjufHTqbrV3SuS5FUBJlTMvfneEbMWKnehgxlT3Iryqb8xPl0y3TrkX+/lRMuf6MiVufMnmfE2y2A7QTADJ
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(16576012)(7636003)(54906003)(70206006)(31696002)(70586007)(36860700001)(336012)(110136005)(36756003)(82310400003)(36906005)(478600001)(2616005)(356005)(316002)(86362001)(7416002)(26005)(82740400003)(53546011)(16526019)(31686004)(426003)(47076005)(186003)(8936002)(5660300002)(4326008)(4744005)(8676002)(83380400001)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 20:20:50.5731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f024fe0-849a-4fcd-a227-08d931043c1b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0225
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
 Cornelia Huck <cohuck@redhat.com>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2021 7:05 PM, Christoph Hellwig wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> This allows a mdev driver to opt out of using vfio_mdev.c, instead the
> driver will provide a 'struct mdev_driver' and register directly with the
> driver core.
> 
> Much of mdev_parent_ops becomes unused in this mode:
> - create()/remove() are done via the mdev_driver probe()/remove()
> - mdev_attr_groups becomes mdev_driver driver.dev_groups
> - Wrapper function callbacks are replaced with the same ones from
>    struct vfio_device_ops
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/vfio/mdev/mdev_core.c   | 30 ++++++++++++++++++++++--------
>   drivers/vfio/mdev/mdev_driver.c | 10 ++++++++++
>   include/linux/mdev.h            |  2 ++
>   3 files changed, 34 insertions(+), 8 deletions(-)

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
