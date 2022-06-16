Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C1E54F195
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB14011A90D;
	Fri, 17 Jun 2022 07:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5239010E787;
 Thu, 16 Jun 2022 23:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKZehjgatXEfbsV4oveKMYMLLP1hFmyL5ap7OZeAlNRfcIF3VNNW+HmywfSGjLK2Suoq12BP9usszt9OCRkVFNzOLtcjvNnxFuETcbRadxYak7EOA5wj187WILJxtxCrjho9eQihM9xes285XpBrKEkvl/if4c/DblnNYYh4pHFQL35JEHkE50K42rTcr+Iq8Ry5sZ5ihR+oiWlVvdr5DZ5RwunMkaSIzLiS1UQNu0tfZdLL1uQq0wRd3WDOS9BdpLMbcOY58viXAkSN7i0HT+cYMFoNTioJ69eYtVo+xBDcSl/2TU0PcaBRjODZHUPMWKpw2NznDBYglPvht7IPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTVEbGIqANGV1nCYY5JLveZ8+X+S9FhO3K30tJcpdHQ=;
 b=UmigOT8rNPgu2xnbfPoXEGXfhSOMdDroiezMLVj9BL2qV0mjnZS0ll5V3YUZFyxr0II4DNxtPDFh7fKxeCJWicfDyCdh2MXEAt/JvbbkIPfNK+rAnVPpUqCozEj6WeMdRXPMWnbEJpvcXns55u6rZXepjO3Pbfm9ggN9brC395G2ibm/iM73zFcr2+8y8r9OTP67oI56veOHTCenqNANAlSm//jrUvA3TF8nTz4flOFBiO/vPkr+eTQc7eCVVPTnEF1oPk42MFG/SujnH4jTQq52hViyoTLuoDB8+UNgj0bjjq5zPe1RczAHoEtjUCDw6ohXxR+OIJAytrKy1y7WLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTVEbGIqANGV1nCYY5JLveZ8+X+S9FhO3K30tJcpdHQ=;
 b=Ap61RI/cOCJVd6hflxMkp3ejqo9nUIbSf7I5l5ylX3+lwX9By+/NqioLQNkqcxGW/4VEsH6DQfSVqDIplMzFc+EdCZmZXhjZQvM3fR/c2vwYeQhyGrD59JMPaCNZVUSntxMLm91F4C4QS6/RFi/amMacYK9eZbbQSLhejTy+I76oS035q4Mrxayn3U4nU05pjvPFHFJ06iB0SxYGREXbBFZu+kGmlFsV8a80iyMaxQjdfUAvLwmZg6VPskTI1gDB1PNMTdGvjCYeT6mEyzv99VwmtJbb8DFCW6wMfsAMmbD0ncPS9ZhfZXveTUlrI7uxHI270jnhB26rHJwz2LznKg==
Received: from DM6PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:100::22)
 by DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Thu, 16 Jun
 2022 23:53:14 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::9a) by DM6PR03CA0045.outlook.office365.com
 (2603:10b6:5:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Thu, 16 Jun 2022 23:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 23:53:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 16 Jun 2022 23:53:13 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 16:53:12 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 16 Jun 2022 16:53:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
 <gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
 <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>, <vneethv@linux.ibm.com>,
 <oberpar@linux.ibm.com>, <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
 <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [RFT][PATCH v1 0/6] Update vfio_pin/unpin_pages API
Date: Thu, 16 Jun 2022 16:52:06 -0700
Message-ID: <20220616235212.15185-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 602ead53-8a49-4af1-65bc-08da4ff360ba
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_
X-Microsoft-Antispam-PRVS: <DS0PR12MB6440B2AFCEEE70660D4CAABEABAC9@DS0PR12MB6440.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcwaPb2PpVz7cdMw6qJdjIUdGKk6STX9REICK5rRKbR05MMqCwwJoqc9cUlgL0mMRxCZYtq6tSRuvjZUl+hU+J48gOeaMA3D2OblX/rUx+w4GLitLORBDcd3aa5KaZvzDqwcNFLf/cjH/6UmiLDhddKzTjcEQviGKEQSEg8J64u3VNSa4x89p0/qbQEnkENWChw0kIh8lNApLJtYaBs/yt+fK1A2PXidHvV2A6aurx2e8kvUmf70FJEAaQuLnwgg0p+Xxxtx9Fyn9SjdYR96M9iY0CdAIZVCZv3m/xZGbgAFvunnX6uZoqKv+EGWoMJtalDG0q1KTg0m58DZQ748Z0rPCp2hAqJUHxUE2Oz7FuVA0otx2spJkDFTRyTzfvI2HCPMuN2UY3WoJl0K5Bt2Sf12dXYDXg2Qge4aBq9ORIJuWduLMgHSFF+fdRQ9MO12PkW8cLZyWEgGiD+ch84oPp4pphZOMVFm/jLJLYRiTn44X+MvmJp7Y0MtCGxtmV1/gTU6S+kN+Zu1DZFDDs6jeFt2hgGghtp1Yh+pAMfE55I2xkQHf8lA+fO2/7QxgZLkC8ZXUox2E4zijp1iEZrdsDvhF48XpXHtFLnf1tnKxm7heDQ+Ofe/XKgX7wnn+b5vNE575IyD9Zs1OrqY84KAPgLjIbb1I9lIGEKLlIdOwmjCA7BvMYTWBK8KRbntMeykIhmcofbeooEmWIEYdFdHt5LPA8tUHbc+sSlGTayI56C+1KM8m6y6c4+TPUIboX36u2O0uEk6n52uUH8Hbn1vvxlzISPIcfhw/8WCzXhLpEOQ/+NRWR1cmADpM9rEdUb9rXbNYJwVaYG8ZbDKxyryYo2QGJOUDHaDwP3mnWdQHYM=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(186003)(2616005)(26005)(81166007)(83380400001)(426003)(356005)(336012)(316002)(1076003)(82310400005)(47076005)(36860700001)(498600001)(2906002)(8936002)(7416002)(7696005)(7406005)(36756003)(110136005)(4326008)(8676002)(40460700003)(5660300002)(6666004)(15650500001)(54906003)(70206006)(86362001)(921005)(70586007)(966005)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 23:53:14.3572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 602ead53-8a49-4af1-65bc-08da4ff360ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6440
X-Mailman-Approved-At: Fri, 17 Jun 2022 07:12:24 +0000
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a preparatory series for IOMMUFD v2 patches. It prepares for
replacing vfio_iommu_type1 implementations of vfio_pin/unpin_pages()
with IOMMUFD version.

There's a gap between these two versions: the vfio_iommu_type1 version
inputs a non-contiguous PFN list and outputs another PFN list for the
pinned physical page list, while the IOMMUFD version only supports a
contiguous address input by accepting the starting IO virtual address
of a set of pages to pin and by outputting to a physical page list.

The nature of existing callers mostly aligns with the IOMMUFD version,
except s390's vfio_ccw_cp code where some additional change is needed
along with this series. Overall, updating to "iova" and "phys_page"
does improve the caller side to some extent.

Also fix a misuse of physical address and virtual address in the s390's
crypto code. And update the input naming at the adjacent vfio_dma_rw().

This is on github:
https://github.com/nicolinc/iommufd/commits/vfio_pin_pages

Request for testing: I only did build for s390 and i915 code, so it'd
be nice to have people who have environment to run sanity accordingly.

Thanks!

Nicolin Chen (6):
  vfio/ap: Pass in physical address of ind to ap_aqic()
  vfio/ccw: Only pass in contiguous pages
  vfio: Pass in starting IOVA to vfio_pin/unpin_pages API
  vfio: Rename user_iova of vfio_dma_rw()
  vfio/ccw: Add kmap_local_page() for memcpy
  vfio: Replace phys_pfn with phys_page for vfio_pin_pages()

 .../driver-api/vfio-mediated-device.rst       |  6 +-
 arch/s390/include/asm/ap.h                    |  6 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 44 ++++-----
 drivers/s390/cio/vfio_ccw_cp.c                | 90 ++++++++++++++-----
 drivers/s390/crypto/ap_queue.c                |  2 +-
 drivers/s390/crypto/vfio_ap_ops.c             | 21 ++---
 drivers/vfio/vfio.c                           | 38 ++++----
 drivers/vfio/vfio.h                           |  6 +-
 drivers/vfio/vfio_iommu_type1.c               | 34 +++----
 include/linux/vfio.h                          |  8 +-
 10 files changed, 142 insertions(+), 113 deletions(-)

-- 
2.17.1

