Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DAD3AA528
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F26C6E81B;
	Wed, 16 Jun 2021 20:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1E76E81D;
 Wed, 16 Jun 2021 20:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIm0YaKa9nm2fqPpLE8ndyxF6QeqVK14J3G5pMc4azUD21K8Gs/YEDg450SgbxM51nmkbHVTOQejEtaA3Gvv5w8B9ER79QixHs8U85MRSia/ZDwGVsgK/fVYDf8/5nq7BPkWB2WeNCjHQDkM30gnSN0JSYzCz+tPAqDH7+qY93XapnYNtXHTi/6aDe32lY2O6g1JSG9hrcjrne84SFt7Krekz4o5p/ueR6hJ407fhJp50yPQ2qFn9buUuX3ZoLnKl+QGJ8vBWECqyrOFY6Guiv+0psP2+27us1d5R02LZWi5NZZUzE0757hCGp12YirSHMUzLWB+3Wy+KaW9CjSO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMNd5s5Y9eybtZa9leXIAtTi0LzKxJ3TJ0BUQ6UbwHc=;
 b=HJO0UwUiX6zmp1HF4UASSglgdJWVkzKfUaSKYihNIjfLXYcwcmX0WwIwBexgtyVRQFhUgSxV/Ho00x+x95jZ7tWer5Y2fS3Wkfg2y1Dxm4ERgC7Cg9V8hM6+lfuG0rOFk1lcojBUWTjuLX5N/3wcHeoKoOv0Cew7U9S4104f/Mmir4DdkpBt9Luw1Xfac+U1ptTU6adUu0VpJVMVRLxWOGP9PUFLjl0Qus0E9F63uEdJaOyQaMDlL1ZtEieTX/kBO+lBhqWNeKqhz0bdB1HpTk67XblEm20p4eJM8echr5ljs3XwY86AIiiGTPc0FMvEtGto8kiUNXzMAgf6qFipgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lwn.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMNd5s5Y9eybtZa9leXIAtTi0LzKxJ3TJ0BUQ6UbwHc=;
 b=kFdGr2IPzko7PLTNHWVtWMvaTBzRcrUL/Eornfj1abifql+XBcRuClY9lgfqznj+sik7zKPE66CtM6Uo6l6cTsVB9+exyZbEvNtgfTGsmueTI5TctTIK1+SGOWHRPbOtNJrcv2Tg5iANHgcu+0j8BfPxZP8kmmnLRv42u6YmCA4Dp33Epmw8/HsT1wt+2tfO6DQ1QzxTqxWl8L+H8wHXfGB2yxRDSeRjSQHCjIw98dbKnZcHDmX4wmRWlKSFnjTT9p5ZbCbCeVihSjxeDHV1B4140wIaB9/LRXjRvb2bVMMOqw/Ck/RD7bsGFTlAN8uYcQY8LJSBKNEScg3vF0C1bA==
Received: from BN6PR11CA0043.namprd11.prod.outlook.com (2603:10b6:404:4b::29)
 by MW2PR12MB2523.namprd12.prod.outlook.com (2603:10b6:907:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 16 Jun
 2021 20:20:43 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:4b:cafe::ed) by BN6PR11CA0043.outlook.office365.com
 (2603:10b6:404:4b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 16 Jun 2021 20:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 20:20:42 +0000
Received: from [10.40.101.248] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 20:20:36 +0000
Subject: Re: [PATCH 06/10] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-7-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <e9536c37-946c-7a9d-cf84-9c8eddcf0101@nvidia.com>
Date: Thu, 17 Jun 2021 01:50:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615133519.754763-7-hch@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3818840e-2531-40f5-cf24-08d93104376e
X-MS-TrafficTypeDiagnostic: MW2PR12MB2523:
X-Microsoft-Antispam-PRVS: <MW2PR12MB252318F14157401839C7079FDC0F9@MW2PR12MB2523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnwEZknozvg7a50XrCC/q0XDWj+Q5XXVmrkHSRynG1/lJqTPzZAOO5pOJdOkRnbH5CFIq8bicp3pzgwS+zTnBL6KdMo5zCu6hqB4/b+vR5xETcAy1wn2xmuEo3q6AOpinAmaQm7JPxjGht9WQZndxGxUT/R8eXZZTJXSjfAgdbKiTbIT1leVxZYyUTdYuzQ8wv7RnpSMY5GQPN8wIvREYjr0JWV15x4RbasJA9SHFdmYfe11FVEQSgV3HLT13KqjprV0ESxGtShgKtp5og2zl4BY2brYS6t3/v7T5Q4xtUIb3/55KEkgfKOk/N1EifuiP5AKABdeq8tFgZGMTlwb3UZMS4ZbZLGfdIgxPeRfQtQKVSVRLqnC/bUYyK/pFjFsf+4tZJRj9/ZALRVG9wKKDqB7K7klG6PiavILMB9100DHPEZCHTn+8f1564m31hpgdzN439Ld6Rcl0rVg3SRr0Kb0Tvpg8bF47DAuEXlLgRbFx+XsyQkpGTm1gNtthtd2JGBke8XO/g9BmMdf7O2trd/c/6zmGlM5zRY5MKdwaIyVrBGis+M+l1VFqp1l00yFNRytdF5uhZrABLKSUmUER84/2OVEYTHW84XDMpIy+sgEF5qyQziN36eaYQwT4dnXTrT03nI12iNrGIm3FZxy+QdV64lRA5suCsdKVOJA6CMjFlcl6r+DnymlwjgYJLRM
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(36840700001)(46966006)(31686004)(186003)(7416002)(86362001)(26005)(31696002)(70586007)(2616005)(4326008)(478600001)(4744005)(8676002)(36906005)(316002)(110136005)(426003)(8936002)(53546011)(36756003)(83380400001)(6666004)(356005)(70206006)(336012)(54906003)(47076005)(16526019)(16576012)(82310400003)(2906002)(5660300002)(82740400003)(36860700001)(7636003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 20:20:42.7605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3818840e-2531-40f5-cf24-08d93104376e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2523
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
> For some reason the vfio_mdev shim mdev_driver has its own module and
> kconfig. As the next patch requires access to it from mdev.ko merge the
> two modules together and remove VFIO_MDEV_DEVICE.
> 
> A later patch deletes this driver entirely.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

