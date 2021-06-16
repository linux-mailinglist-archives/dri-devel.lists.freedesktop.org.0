Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654FF3AA532
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BF26E820;
	Wed, 16 Jun 2021 20:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2048.outbound.protection.outlook.com [40.107.95.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1856E81F;
 Wed, 16 Jun 2021 20:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPjMNusBEbhqlNN5rHb9Fcm4oD/X72BffHRFUihVuYcLLV1nSDMDZGNFoLP6hu4T5SjT5R2Jy1/p+SsiUCdGJUIE++kjTfBjEx+0LJQBf8ATXEOPKEiGwDDddazLgaCfR2M/I8QGxXlPG5M4W6yWBleDLOXTXbduyalPKX/Ezdxvpej9GhKRm4pgPBya2PdNDyxmPg2TDCaHmG26tUp9UGR9t4A97LbLADs+OnX68F2wShB2XVvv5p/V5LA/ebxXI+Y3x6Ht6uU9++IlCWBucfdDfnCoWHxsQXDDjy+m1lXqal6EvgxXz54fHYJ5yeKNCCW1HUg4onFnh9IdVg/TFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYB0SD7aJGL66ifWWB1n/PZFqGsWcXAmRz64+yaDK9E=;
 b=lk6v5MXl/VcIcjRi4SqZHelxJgBRArB9QDnpL8m23i1GT22Ad0nt5ONPRz1lzZ/wwbXBGfACvZrPnUa2vx8KaJx1/3jr0VOXRfm51z8y0Y3+ssLXW8iJg9ElQzz5AT1vfJmKlVhUW0mTgblKZ1usPM1SzlhvreAtaWt5tylFmffpkydUiB+tOUR5+3S2Sxdos0Mt7yt18M/zyPC9P2/AQ6Gvl2c1sGYYVABKraqMwVkqks8faaEn0XmR68JHQX/Df6sf5RcimzfXdK8I9v0akLJqCWBCzHTvuJpfjsPRCNvPnHMW5+JByuvKdCMbuiFgbtPtxfPLfnAOzBYj6UM5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lwn.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYB0SD7aJGL66ifWWB1n/PZFqGsWcXAmRz64+yaDK9E=;
 b=gHJOYUIdCkAnCtflDhLE+114iW5jnhDO/X8nYdAGVlXNRPeZei8zSMBHjyA94QSIUz3vbMELu+anchV477nX92Cmau1tKEmfhhfVO9nMJvTdZrSbkuzFUs7a5ruf3euZJTN+mZSI1UNVxlusXnCqzAbWdityoeCo1NnCg0pR3Scgmv30d7Ww9aGEoVrLx7A9tVRLKXnRB/VvGd5zzoS+auLxhDgZ5LyzftIFe4ogVTEpXjl6riLsDkT6VZAYsWOejTbR+I+dWLBwOP6o+odT5Rr94RYLDLBN1Ly5AHKDu5Gzy4z7ymqeIvE2IGl6Md9myqF+V1PDDffGlXxSmenUlw==
Received: from BN6PR11CA0043.namprd11.prod.outlook.com (2603:10b6:404:4b::29)
 by CY4PR12MB1544.namprd12.prod.outlook.com (2603:10b6:910:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 20:21:04 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:4b:cafe::82) by BN6PR11CA0043.outlook.office365.com
 (2603:10b6:404:4b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 16 Jun 2021 20:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 20:21:04 +0000
Received: from [10.40.101.248] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 20:20:53 +0000
Subject: Re: [PATCH 08/10] vfio/mtty: Convert to use vfio_register_group_dev()
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-9-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <9e2d3a44-1371-d8c8-844f-69a29699a13d@nvidia.com>
Date: Thu, 17 Jun 2021 01:50:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615133519.754763-9-hch@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ffd217c-bf73-4e6d-6d74-08d931044419
X-MS-TrafficTypeDiagnostic: CY4PR12MB1544:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1544CB0F3DF47AB3AA6AC0D8DC0F9@CY4PR12MB1544.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJq0HW0mEkemPFn/H1hQuRQNbnckHQ3LOTnNYa2lZbSoz2/9TLNfhcn+zLHhYYwCGWavilPcHuwLkITV6YOkd/WdtUmVkOFFdzQ4tGIlo6dZwFSQfjKYpUjEda0N/VTARb1TyxgpEmSYPGewcmMONNEcGH/cujwYHwbtr5BvF9/Ylln9JZ1VoEcP/fJvB/uTMFB6t9kC+hxDwRlxVb2kazT+h7XAmDVzbH9ZJo1+2yX0scMcEwsoC5D+S7rw3vQynHpnheVoxwTZeRITnMq5PH/flpjxg2IfSRb6m8/84BcRv4ZZpJDuZHVUFBhkP5WFUr2Ym5PpW/6e/EovrnlIKLSz/d9L+LTu/bn/wg/OGTj++ssKld3TGKepsgmRdMF3bxM9rmgghzpNIv4wd3shfdmrisgFuwYlAd1Uu1K8cNuFXM/Gw/hh19LBxhy9GtDpLJ7EWqJmSJwF9kPjB/m24Buf2EFlzcOuBofZ7KXmiHty35Np7JvtehYHVCBWwwP8QRw2qdNLtM0U2l/RkGwqJWbDaFvLQh9dnhoYcnNf6TyqEfz7XISy6AfWHBKZZm0YSZGMTV8IQKiiZNL8HgeANNObZW1tVtrhl589mkEYKNlElnld60ERnLYx5OBDQEFeyC06+U3wrHyKJjpGYswiiFijWzWMqJZWTR60dCwMsB/iscEFg9ZX5t+7GSnCqO6H
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(36840700001)(54906003)(316002)(8936002)(26005)(186003)(82310400003)(4744005)(478600001)(6666004)(86362001)(4326008)(36756003)(36860700001)(31686004)(2616005)(31696002)(336012)(16526019)(110136005)(426003)(8676002)(70206006)(2906002)(36906005)(82740400003)(70586007)(5660300002)(356005)(7416002)(7636003)(16576012)(47076005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 20:21:04.0014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffd217c-bf73-4e6d-6d74-08d931044419
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1544
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


> -static int mtty_reset(struct mdev_device *mdev)
> +static int mtty_reset(struct mdev_state *mdev_stte)

Nit pick:
s/mdev_stte/mdev_state


>   
> +static const struct vfio_device_ops mtty_dev_ops = {
> +	.name = "vfio-mdev",

I think name should be different that 'vfio-mdev', probably
'vfio-mdev-mtty' or 'vfio-mtty'

Rest looks fine to me.

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
