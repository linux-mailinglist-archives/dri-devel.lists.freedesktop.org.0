Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5823557EA2F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 01:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4AD18B1EC;
	Fri, 22 Jul 2022 23:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27A218AF46;
 Fri, 22 Jul 2022 23:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxogtJNhAE6uh6SW4KJHeUYwAAexYJABA7qesFTosEmsqn3ZNXeE5L6KF5vbc4c7+XtLPDS+Rex2iGDsIOPPqgFpI2AEOGm2s9Aw+XSjPUX9cLKWIo0ZdtKZB1NLeqlhbGxpieex6GqosPi6mjADKsWqpuEIs2u5CDD465rpRuj1L3uuQLanQ5G9JoHyA3PGkg9VekDRCoH8f+N1Y70gL3mRixspSACHfRQoeX+c6gETiiTS25atULW+TJIYWBSF2dayvEFHcmyh7Rz2Zl3aw8kWCRlXYAj9GRfHxpYMM7/YXcsi5bSsUhIo++wMxmMtjvxPngnJAranJhA18fncpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlXGPBfy12P50MGHfQ5rFXzF/WEhtQSzLJPTTS4+JDI=;
 b=LD1L1yvIrdDFanNvQvNiC7VB8DmZmeK3lvz98Tqd44F0NvdX+YEkCXK0s+fEUODahKNlDoURvD9HpJhfwvX7voFLrqOyW+2yNxiIGE0mgjC0s4NiRLGJrhsGM1bPkDRgzS6U/IBo7YGyN4rCbCnp0kevtk5L0hU9+kszEBp+WmFtBHzu86KX9daRaOK/xexUnNim7YjzYu8duA5NTEak/UosxL23QYuk1XC6qDFoj10mOT0lY7/Y7jleyIribxdqmz46h+5w2EinAeFDJCZhesdmAJQN9rhMnmEiIocg/yb7JgNc4vn1fmvx194E2Xe3s0DOM6YafDxvXACvnICd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlXGPBfy12P50MGHfQ5rFXzF/WEhtQSzLJPTTS4+JDI=;
 b=tXpGvtVvnZqUgRXqpoV/8f7F4DQHDlsGCXnTTyIqxaDwSH3P5MMYFXXkPeVXHpyMz93U3uY3ByREb5RY9+h9E5RuMVENu1b4jilhP39cCRKplASvseOHxwmDbgQyYiwmuAHYfS7N5JygIS4T9zco4LPhcjqpn5fxsWLwHJbWGSfFkGmJXXHIYuDqiiUTpB7axcg3zGFAxysnl0ppOt8Snd1sjCgiu8SlVhvNV+A1OZCBBFSdQ3rJHK4ECMlQ+xMdnzATb96pY3IoTwRHVKvjbjvXRdtIWcksc1xgkmP7DSl05gh4N4JyOE5rWsRl0RB2GLnPb1d1oLlrTu+auw/ObA==
Received: from BN8PR04CA0025.namprd04.prod.outlook.com (2603:10b6:408:70::38)
 by BL0PR12MB4739.namprd12.prod.outlook.com (2603:10b6:208:81::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Fri, 22 Jul
 2022 23:12:25 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::b) by BN8PR04CA0025.outlook.office365.com
 (2603:10b6:408:70::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21 via Frontend
 Transport; Fri, 22 Jul 2022 23:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 23:12:25 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 22 Jul 2022 23:12:24 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 22 Jul
 2022 16:12:23 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 16:12:21 -0700
Date: Fri, 22 Jul 2022 16:12:19 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 00/10] Update vfio_pin/unpin_pages API
Message-ID: <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220722161129.21059262.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220722161129.21059262.alex.williamson@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 337f5923-56c2-41af-22b1-08da6c37a3f2
X-MS-TrafficTypeDiagnostic: BL0PR12MB4739:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwhvnXYv5XCXcN7a0URN8Kg6sEoc2euHi0V+kG9pN2hkvl93anJzFkG7KZKYjlLOOWcveeZelupQN1sTHLHuWL5CCdqHARIM6SRDI4eI2JD030L68OY+gYYd8RIqsyC2RbEDNikN1yz0RnRkXdUkesV/YA99ZNv8SUqQUCUu6UQIPPbeGPj3PjuTPj84V0HcTZJX0fgN3mg4X/2y+xCj2RJRPWUAEh4ggE0YJ44lFWsO1q2q536K0C0AiYFfIWD9En8Sa0TH4540Bj2OZk91LfMPCAfB0Zs6cv2IucCMIDhb38wK5QK6tC4/shIlxIjhwVw9yjxzcOEwa835zGXyTxSDLhrl9lzodfiTUXtotZVOuFfO963IQL157fYGxx/VrfnDtggIXUDYm6saD7v/MQwP/pkmrnOrtCK74i8rQI0Td2JFpMW+f4Hb+eOeMeSwzbfZWpLckp8IuJudhs0hGfz6SIbAmKiE2vTb7etmvPjFh2Z38SGZIsN4NpFbcoW+21ElFLrpNwGryzFeCJd9uaKbHO5RWbuo6tie3fJeC8KM8QIBlCsBdvlXWsPQGiovjVcdlVFcqP28EAtb+UFOO2IyrdgNAnUH/DBYRQX/R6HggilsqJ8q+lKKB8yQQPFTl3ZAUF3oyBl25ttQgjBp2BijEf9tpMZJhTuSJd8SlGdL28X+xD+BUMQRm6EO86n871NuijNIv+c3R4POON1cq55+jbvYSOMQBgL0pt0/j11VhMCZ1Uf3AEzBWihjfRx2IWjdiVYjA+SumR0We6HcyLBLlz5sAXk5gqA2400FvJ0P25+6LD6is71uTIIVZQ6ThvGUpT9Bh6KFJe96p0UE2w==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(36840700001)(40470700004)(46966006)(82310400005)(40460700003)(33716001)(86362001)(7416002)(81166007)(82740400003)(7406005)(478600001)(8936002)(316002)(36860700001)(356005)(70206006)(47076005)(4326008)(9686003)(8676002)(426003)(186003)(83380400001)(5660300002)(55016003)(70586007)(40480700001)(6916009)(54906003)(2906002)(41300700001)(26005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 23:12:25.4027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 337f5923-56c2-41af-22b1-08da6c37a3f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4739
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

On Fri, Jul 22, 2022 at 04:11:29PM -0600, Alex Williamson wrote:

> GVT-g explodes for me with this series on my Broadwell test system,
> continuously spewing the following:

Thank you for running additional tests.

> [   47.348778] WARNING: CPU: 3 PID: 501 at drivers/vfio/vfio_iommu_type1.c:978 vfio_iommu_type1_unpin_pages+0x7b/0x100 [vfio_iommu_type1]
 
> Line 978 is the WARN_ON(i != npage) line.  For the cases where we don't
> find a matching vfio_dma, I'm seeing addresses that look maybe like
> we're shifting  a value that's already an iova by PAGE_SHIFT somewhere.

Hmm..I don't understand the PAGE_SHIFT part. Do you mind clarifying?

And GVT code initiated an unpin request from gvt_unpin_guest_pag()
that is currently unpinning one page at a time on a contiguous IOVA
range, prior to this series. After this series, it leaves the per-
page routine to the internal loop of vfio_iommu_type1_unpin_pages(),
which is supposed to do the same.

So, either resulted from the npage input being wrong or some other
factor weighed in that invoked a vfio_remove_dma on those iovas?

Thanks
Nic
