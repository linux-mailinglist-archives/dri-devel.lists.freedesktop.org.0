Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A5755A16F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43AC10ECEE;
	Fri, 24 Jun 2022 19:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5B910ECEE;
 Fri, 24 Jun 2022 19:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0nISYKZPHB5BagomA4Nc2HIa3FieBnz7UrTTukbGM8wFf4w2WjR7DCBdKqn2IBz6YUgQN03xoPO/jYgSHNX+Epud60NzrK/wImpt31FcxMIInccTgk15jrF6c+fGb+/yHyuY6nCjEqdWcAw58zPzjHB6v4CvjPw8hAoqdq85CVs3Em2WiGgG9XyG5gAsqHO9GkvtvfpOsXk9LnFtu6OCzuYlWcRr3GRnVxWcbUdYQXpBiX4YCxt48sukZVxkwW9Ty3P7DV64HV4XEOTqyv6eyy+gxjwRZLHec2lMscBJnFe32cL5AZqm1BAAXuE9iRyZZ1KiCPfUTWL0HYuIHlEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eroiJynnWGd/FZUmHb9waiSg72Sl62A8vAIZFUu1tA=;
 b=lkTKmDl5a6RsRDhvxXtlv0HIecGwHnzZ3uB02yWvBwq/ZLgF0Pgy/lkh0QX6EWBRcnHubQ0hzyvhZguiQz+O0whYCPS6TzhPJd8pPm/v4aJuojauMgFnuNcJD4Q9o9P7KE1HoIOCVkJ6RRyogqb7t0R+Y+WOj/49RdKKQO9d1F089vsZ7pS0Xl5MYgVd6ym057hGFe5Djv2sfm7getagK5BWmN+5Lh8zgMmgwso4I+OvHDyTYy+VF5cnb7tTN0Zx5Z0GlIsYm8eb/CzaOxoxtVFw2E8QLR1uxENct0r1St0QPSAMO6zPNOkUea4Bltm9gwFudNftAmTnd5Ko3TrcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eroiJynnWGd/FZUmHb9waiSg72Sl62A8vAIZFUu1tA=;
 b=PtXb3h8QafaG1pccazWoZIT1DvuTbpdUhIoiR4PdPpekPvtM0eUjLnjjCRLUnzPWMy4V07kRhj0IK1n9yHrHqwGR52cMLv+VO7T9nZQP94gHMXeU4GLAFV2X/SBLpj0ciihwpsr7Zje1mHPaVLHw26r6hx1pcqedgw+0fe7d/StnvmXO+2NM1OVVDlb/slaaelR56kJ9pyq5brzTiG5KM2CNhZFGA9exA13gLxypT3pTXB3ZiVLC7vc3uJPGJCIg6XRLrTS26UQV+8ycxI9WH4CngrShYbBkV9oor4BKIgKH4mEhmQo01wMy3R8G7Wr8lTu/af7eAX6xk9BfQTfCvw==
Received: from BN6PR16CA0018.namprd16.prod.outlook.com (2603:10b6:404:f5::28)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Fri, 24 Jun
 2022 19:22:42 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::bf) by BN6PR16CA0018.outlook.office365.com
 (2603:10b6:404:f5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 19:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 19:22:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 24 Jun 2022 19:22:41 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 24 Jun
 2022 12:22:40 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Fri, 24 Jun 2022 12:22:38 -0700
Date: Fri, 24 Jun 2022 12:22:36 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <YrYO/KAa2bqmxEIu@Asurada-Nvidia>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org> <20220620025726.GA5219@nvidia.com>
 <YrAUZ7hXy2FcZcjl@infradead.org> <YrI2Ul/u6pRvt0rT@Asurada-Nvidia>
 <20220624135615.GO4147@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220624135615.GO4147@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 266349de-d9f5-4c54-7d84-08da5616e908
X-MS-TrafficTypeDiagnostic: PH7PR12MB5760:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WjjWCze/LnONHyFlrtJTDW+lroA+9xqqr6u1oQKqzDnZ3Lz6ipZ+eSVH9Plqkwyu4YDEKmHTy6ycAI3xiIEOpVPKEIJmjpXbJve6LRRtZNS3TdO3VLV7Q3+78Qjv+ju34myPzjpV4q4odsLmT/QM2FUKoR+N6tmlfKMgbxuwuepnWijs1ZdwVGfPYoLgCcfzmKP18QADiDJ9t6Ha4+lKVv/byESVkC3sNsghvKUHhSsTPjyVdlYQi673Pl+2y/N017owQNZWXcaGnAYbTJNJbM8CDG9b+2KKEiZZclZSk+/Zpvf1n92IJ4SH9DvYrYldch+ncYCcmRUWOWEPvIQ8MfKo7fOnd+AvZLeJXpOrNrE+z6B1wpWKzivBTMKO342sZP/uv/5+bFsXICq4sCo4cAYnH0qBQwP2dKKOPJW/gZynuiXIoarKm3V/0utSgZntu9mUchCGW9QjjG94QzY7c5+/BRMygab0Em4ltOOdbP37VsSdHPaT3r7tVRJBJwZfZVjpmcSP5foC5I6wMY2y4rhk/3TuIRjoe1cx2HUfJGkZRT3ZX72rym48n5S1FnMuY/XLIQ6K6A1kPo9D+W4llhQu888LvhszgbPvrV+DHoEZ/7DKhK1Pex79fYnUdJBkZeBXSoYo3dml9HjU7JRWf2sYMLMaxsuGmI9c2GV4lRFCpOTQbbevlkbIN9QkvdTUcThmwoNpPvzM1ECyDjUBdwmzmi5UJtr1HRMbt9IQ5gqdWhZJ+UbluSSGdQ76Wa24V1hBkQSBQ1cxG3lIUYzGlNZeZ1SrClYNEPzFmh4yP+gXzRyIANDHequJeMrdJ42VNZRQEk74VUSd70rQ2Eb3AA==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(40470700004)(36840700001)(46966006)(26005)(9686003)(186003)(40460700003)(82310400005)(40480700001)(6862004)(2906002)(8936002)(41300700001)(7406005)(316002)(336012)(8676002)(478600001)(36860700001)(33716001)(426003)(5660300002)(86362001)(54906003)(7416002)(70586007)(356005)(81166007)(47076005)(4326008)(82740400003)(6636002)(70206006)(83380400001)(55016003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 19:22:42.2919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 266349de-d9f5-4c54-7d84-08da5616e908
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760
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
 agordeev@linux.ibm.com, pasic@linux.ibm.com, kvm@vger.kernel.org,
 corbet@lwn.net, Christoph Hellwig <hch@infradead.org>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, linux-s390@vger.kernel.org,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 10:56:15AM -0300, Jason Gunthorpe wrote:

> > How about the updated commit log below? Thanks.
> > 
> > The pinned PFN list returned from vfio_pin_pages() is converted using
> > page_to_pfn(), so direct access via memcpy() will crash on S390 if the
> > PFN is an IO PFN, as we have to use the memcpy_to/fromio(), which uses
> > the special s390 IO access instructions.
> > 
> > As a standard practice for security purpose, add kmap_local_page() to
> > block any IO memory from ever getting into this call path.
> 
> The kmap_local_page is not about the IO memory, the switch to struct
> page is what is protecting against IO memory.
> 
> Use kmap_local_page() is just the correct way to convert a struct page
> into a CPU address to use with memcpy and it is a NOP on S390 because
> it doesn't use highmem/etc.

I thought the whole purpose of switching to "struct page *" was to use
kmap_local_page() for the memcpy call, and the combination of these two
does the protection. Do you mind explaining how the switching part does
the protection?

Thanks!
