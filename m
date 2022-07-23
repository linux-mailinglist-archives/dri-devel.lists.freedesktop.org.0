Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31257EAAE
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 02:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342F42BC12;
	Sat, 23 Jul 2022 00:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9DD2BBB5;
 Sat, 23 Jul 2022 00:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T77h3mgM7qskhXsE1IGaFkTpf2yCL82KCGy1kFevV6N6NE4OVuDOAbOOOrwGswkeIUtmWas2aAblV3Ms1voDGwP94lBedQPzYJ59D/nQOn7H3oj3LOnJkWN1Utvv3CZz4MNPYBCDtp5bvlLmVvwruMYrn031cP1Agt5+LJG8cF+8iCxRzC25gKtXlteIjxw/tOrdutt62qaTk1aaaIIxBfLR2YxA8vtM9iWNhim+TsPIzPm46z+aE6Zvg54IdPkDQgkAjRWwbDi3mw/6SmtP3yHXjUidFuzGMGAf1qQQLmOJnO6ZiW/OKOn2tzhaDgvEQZBKFXvSGuJfFqVNcvbduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5G2/e7OUebQ2iW3eCdEqxc2JXPmrtXwDmC0CS2aSTo=;
 b=PJBryC9yW+0jkFtoiIIdE+xTCELkYa84krmUDDnqVtgApxdDIHV50PG2UgEBDI2ESOk8ftu854njLe++PP/Nlh52HAFFmh5UDgdmcH75QRRF8kca4K5s60fiMdVvUT3PuVWNLwPCeklF91zOUzlpxO348I4obsOgcCs0ZqrL9GP+ygNU6X4L4yVY6ar3nKlgUuVJm5K56Lh6t5NnZg21Mcs51QWaRcY1dlADoB4/ZXW7sDDcp28CqxDNqRGhE0Yyjgq8i91H85i8lrhA0KLxicGPb8sQNvynUgwxYnRudJkjrW76YQCsO4QZt0yyxDdMmxp1sdonQeGTHGOGLrDmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5G2/e7OUebQ2iW3eCdEqxc2JXPmrtXwDmC0CS2aSTo=;
 b=iavIAWZ+nbsuReXfI7Ausac/BbypJP1s2zL3eVhKPVr62f4lpC4NCUqoKbLhYLIh/0EUTGvIbFmktJip1GPBWc5VdklLj6+MPICotY+ZHz3aVXYALjbk2+VME3Gwyi6A3HR6Nb76aSx0djYiZbuyhlS8CnvxAfOno1Wda6Do3xtY7po3HU85dI+M5D6JcJ959fr/tK5DqEaYvc1x099PyZSZS0uX+1yErCt9/ipf6kyVYLMDVbix2hsaElV0ZyrZL9K/Z8YlXCZnjZro47vlMYH/C1sHKdsmk5UaLBQHvlcTRWwXn8mKFbC9t2m0nPKjeH/kJRsWQRSMHUiF88OEBg==
Received: from MW4PR04CA0312.namprd04.prod.outlook.com (2603:10b6:303:82::17)
 by MN2PR12MB4568.namprd12.prod.outlook.com (2603:10b6:208:260::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Sat, 23 Jul
 2022 00:38:35 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::aa) by MW4PR04CA0312.outlook.office365.com
 (2603:10b6:303:82::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.24 via Frontend
 Transport; Sat, 23 Jul 2022 00:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 00:38:35 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Sat, 23 Jul 2022 00:38:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 22 Jul
 2022 17:38:28 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 17:38:26 -0700
Date: Fri, 22 Jul 2022 17:38:25 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 00/10] Update vfio_pin/unpin_pages API
Message-ID: <YttDAfDEnrlhcZix@Asurada-Nvidia>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220722161129.21059262.alex.williamson@redhat.com>
 <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
 <20220722181800.56093444.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220722181800.56093444.alex.williamson@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59d4fa1d-b3de-4137-8319-08da6c43ad60
X-MS-TrafficTypeDiagnostic: MN2PR12MB4568:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eLCed88kFBpqeTpBUauo2tXFFMmUhWa0fkXZTc/S5fkgsV+/1G5Bj6To9vlCVPfRmu8L5Qr8vRNEwMAgb1mrjZ9myDGYCtWoGa7qzvEFuYaVht0l/sCBcsjtcuJKoEjMkJwd18JC80Mnfh8A10eUCHQQgxAZLGr2EpTwh1XTYNnfFAbWVp/K/Ct4owtHX6555V0oZ9uacshrPc42g7+Zy+ZN/0CEzMXmwiz6aukpDmWkhByYEAOliX8RkocP8fvtynu6L3GrOU9JkW5+QswCPTn1aboz9t9yeeuVeWP8LRkm1xUdQ8nAYkDMmVwsTIzSL07LZl63Gdrrwha294fxBe5S4D5/2oWUF4Sr0KxnVvNlGyQ2L+bE+9BYGJQIPW2FUv8eLQ4llu4H0+5WJOtoP5eKZuTpumZNzXUzYDB/4+VDW90EINlne33xBYQYUan8VwBc1YjShImIW7gpEPSxvAnV4wXHWgVEXSNge9o7gBZnMkwKh7ROBX4+ClQGvDZP+GLSBUzNRmrfgj8P+XsXDACIzJGgUHxUSAldZvF6l4VudIbjwruwvUzuGPUgUZ2W3DNsYWlZnMAJwFlfRVnbfeW4aA64Kc47995YhhIHOEN7KYg0PcQWwUnnIEnDUeoXNLQ9tHaFhf+f+lLjnwOIozBxC73ZAlvj9hwvQlsAL9KDa1wTsGB+DlKgd/Oxm5msvhVlc5zqUBtD3eaTEYSFHFi8xku7JRbWKW8oSnJ36hyCuRyZItgMg/05vz71rLLMU6grtv559Y7x9xsbpLYV8yXg9RD16IcoYhUFy0+/e3GEALlaH5I2QZUd7WWz4/Q9hRvWjnK9L27XTZ7A6YgWDg==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(40470700004)(478600001)(356005)(86362001)(81166007)(82740400003)(9686003)(316002)(426003)(6916009)(186003)(41300700001)(336012)(54906003)(47076005)(83380400001)(8936002)(82310400005)(55016003)(40480700001)(26005)(33716001)(5660300002)(7406005)(7416002)(70586007)(8676002)(4326008)(70206006)(2906002)(36860700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 00:38:35.2801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d4fa1d-b3de-4137-8319-08da6c43ad60
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4568
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
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 06:18:00PM -0600, Alex Williamson wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Fri, 22 Jul 2022 16:12:19 -0700
> Nicolin Chen <nicolinc@nvidia.com> wrote:
> 
> > On Fri, Jul 22, 2022 at 04:11:29PM -0600, Alex Williamson wrote:
> >
> > > GVT-g explodes for me with this series on my Broadwell test system,
> > > continuously spewing the following:
> >
> > Thank you for running additional tests.
> >
> > > [   47.348778] WARNING: CPU: 3 PID: 501 at drivers/vfio/vfio_iommu_type1.c:978 vfio_iommu_type1_unpin_pages+0x7b/0x100 [vfio_iommu_type1]
> >
> > > Line 978 is the WARN_ON(i != npage) line.  For the cases where we don't
> > > find a matching vfio_dma, I'm seeing addresses that look maybe like
> > > we're shifting  a value that's already an iova by PAGE_SHIFT somewhere.
> >
> > Hmm..I don't understand the PAGE_SHIFT part. Do you mind clarifying?
> 
> The iova was a very large address for a 4GB VM with a lot of zeros on
> the low order bits, ex. 0x162459000000.  Thanks,

Ah! Thanks for the hint. The following commit did a double shifting:
   "vfio: Pass in starting IOVA to vfio_pin/unpin_pages AP"

And the following change should fix:
-------------------
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 481dd2aeb40e..4790c7f35b88 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -293,7 +293,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
        if (dma_mapping_error(dev, *dma_addr)) {
                gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
                             page_to_pfn(page), ret);
-               gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
+               gvt_unpin_guest_page(vgpu, gfn, size);
                return -ENOMEM;
        }

@@ -306,7 +306,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
        struct device *dev = vgpu->gvt->gt->i915->drm.dev;

        dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
-       gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
+       gvt_unpin_guest_page(vgpu, gfn, size);
 }

 static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
-------------------


So, I think that I should send a v4, given that the patches aren't
officially applied?
