Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7375568E69
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989D310F31F;
	Wed,  6 Jul 2022 15:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3F910F29D;
 Wed,  6 Jul 2022 15:54:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADll2Sb2WK4Y+Pab5LX/iobxwFTf2YpX7czZMU2LnGivIwAvyuyWg3eJAWSpU41O0dnJQ26/YWBlxdDJ8BLU8wH4LZGmv/jgEHZrzpcbMhLX73lQu5NhOPwDPsWPIq888ipREaR+cX/hOCGS6QnVfKShCjB4YhGeDZTyMJ+h1YsouOp+6CAA701cwGR6Yi1MwNbiM9AnanUm6rAlE5oWzEEpmoqe23skqwukkNTMu8cNOhX9RnK6dc9nOIHDOLxz0ZxZzqaoE984rz6hu8GDiDw6kXt+rGszP3xPdUHeL3levBOnsmZZSiJKY0jqJBoPr1GdynqlBn4Q1BE6e7Jubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OClUjcB2or6x3cMJyYLCNmEzKFa31B1yRRBHLirGXmo=;
 b=ZJtqin/XP8nv+P0dq5VADAQrD+SpFcins+p2+xS7tW/jvKCIolCA5N0DCTG5BrNCFgaNGasimKJm05czsGJIk54QYZ8fypW/uybaYlEryf5exnGj4Cjjb/T7SRAy0eSynR79v9YknBVNWuHYebGm7+ZyQ8r6eqELinLRJ27TqL+fc+WpuOZ5wJ6qZw8MTGJ5MEgRnlb3LJ331Flt50WtgXIbYEkCEJPexwJN7aV7jp8kCuBVgbZxQbMq+/hxuKclvtMIGViGZUT4Qkjo2P8GcDiw5tBcpAixGL7jmFr7eJetszD1Z4+FCPTcDXU/winoWG7//YzOQOEZg3FFb0LgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OClUjcB2or6x3cMJyYLCNmEzKFa31B1yRRBHLirGXmo=;
 b=UWMSWnWheAswvbILmSIP1zJqh8/7dpLiTJuR9LYuW3S6xPZEOKLXhc59MVBUkE9R9T4jpSN67cmUPDPvE++lhs7Rf4x6Dm+/4Xb5nijjoo4GVw2/bRQWMaeIuMQA80ySLN9mF6wUSdsfyKpgp2//ObkKpysd1Gkt6nu7S6ryOHucKbajBy/C7nUllMG/z3XS1hTJA58HUZk0jwS6PAWGr6dGjOybo8myAkmksEl73QrD1tZ2WCEcw54506QIpsIqbvNKJ4AfL5O44lXCKzVOXzb/puwkSXISLi+hiwubNuxi45DBi536paMSAaIHPOTiD9kt99fSwDhgkJ1ifBaOoQ==
Received: from DM5PR07CA0106.namprd07.prod.outlook.com (2603:10b6:4:ae::35) by
 BN6PR1201MB0195.namprd12.prod.outlook.com (2603:10b6:405:53::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 15:54:52 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::41) by DM5PR07CA0106.outlook.office365.com
 (2603:10b6:4:ae::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17 via Frontend
 Transport; Wed, 6 Jul 2022 15:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 15:54:51 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 15:54:51 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 6 Jul 2022
 08:54:50 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Wed, 6 Jul 2022 08:54:48 -0700
Date: Wed, 6 Jul 2022 08:54:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <YsWwRhGlCkiQhlY3@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
 <YsUyGS7kct2BbiS8@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YsUyGS7kct2BbiS8@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e39b936a-f7f4-4c15-9020-08da5f67dccb
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0195:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFOaZNeb5Sx9nNmCgifQETXEhO2iYyRAQiHMxij2hnM+iQl1HjJKOhH4Qw+QBI1LfQR8zu42Cvpuxj5vf05iMlphLzryVWZZ2azP4dVarYthpdQT700u/43w8/gojymDBpNjcpxAX3RspkcjagXqhX7LZ5UB4yyMiQUQ+EoJ3MVNOpD1HVehxlCIejBbh3DmkhYIsN3utfc7085lyBr/G1VlZDZmiiBrXfONiSkf2JwCj22Z0kpi0Yl3a7dP6vmaTnSedkOG/5VekAiVqciGVbI+frrbeUk7LM94p7oxLj8Ttvpc9WLTDrCTuVKK2vC0oNK3omPQ+4yzaXHBkF2s7jjJ4RC5Xo766XkP4DBIpUOorm0QTyg1YIb0hOwtTRlwgexG+06WAl781qhGSOXDht20YkXX7wro71Btx2Kd3X2WB9UrWuWg8EHql6k1g9zPAKjVIjcxgwUQYCDBbWdlb9GkA5OhXAMGTVelQVzfufSxsrclhZPqCSWxeZjXzXL53TQNH67BZQoVcErvw0sOd0FX3VOhxeQI9th5/621szQbsPI3SMrr6R9lYHK/cdLaUv6AiFCgfQJJWmda4PK8NPf5vNDIpv5kr0+xrkYbS9ZSAgU3j+U63Lq4VaC7x99EbQ4KpIh+3eLh3Ln78hazL3VzeEzxX/PO3/gVMCLczJGlaBHmeZlCzUE0/zMPdZMjlgxa8uZTiiGo7n44GDKrWE0dlf1YleF5p7gGtthP8RL8GC885HxUzg2mmLQrEYNU/5Y34ycCP+nGOPL/CQ+W4kBYyoJsRsiLROrA2WOCKae1qh57Uvh2hiCPCHp2C9w7FqwKbkDGpZ3AWHuX2v4TRqUYuP8NgtYdfSXchVoZmrA=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(36840700001)(40470700004)(5660300002)(82740400003)(356005)(2906002)(81166007)(41300700001)(4326008)(8676002)(70206006)(70586007)(36860700001)(82310400005)(186003)(4744005)(478600001)(316002)(8936002)(86362001)(40480700001)(40460700003)(7406005)(7416002)(9686003)(55016003)(26005)(47076005)(426003)(336012)(6916009)(54906003)(33716001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 15:54:51.5538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39b936a-f7f4-4c15-9020-08da5f67dccb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0195
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
 corbet@lwn.net, pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 11:56:25PM -0700, Christoph Hellwig wrote:
> > -		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn, 1);
> > +		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn << PAGE_SHIFT, 1);
> 
> Overly long line here.

The following PATCH-5 drops the "<< PAGE_SHIFT", addressing this.

To not wrapping and unwrapping a line back and forth, I think we
are fine here?

> Reviewed-by: Christoph Hellwig <hch@lst.de>

Will add to v3. Thanks for the review!
