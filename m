Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF514350B57
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 02:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745836EC03;
	Thu,  1 Apr 2021 00:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF696EBC4;
 Thu,  1 Apr 2021 00:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0EFZsRHuAzc3tMved96zuBYBl5NlZhIaZo23wO/IDZWpGCYKDnMukW2tBKkWZZWR/dFZNuBf5ikniyLRJEkqOotuGEL09ul2yTN7NPOQ0eyVtmU8IXcf+zbq+91WZIEETeYYJcPpb9G/YKbbX9BH3rBlYHadMaLR3avOk2UQ5d8YvCmKrV5eFWoYCkT9yhq5WiV/R231MTJw0lXn1FYglCRnoCbkUlZwflajWFHTREesFetptaI76ojIk/mF4UJE9aIBRpZEsBZMT3NYEYyBv7B/5x75e2uaxHKrl6sm9KmKy+xYpZ3qAR7l8N3rGVVaeGenCKvPDzeYEox+jbBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02dqO4PC113SnNoKYRD+v4Jz0t8gBaTnBaGti0otKxg=;
 b=Dh8NzFKnfBSYHbFRVaXq5QoKXQyp9U7IebgXlVRk3e8FCg+8lIZGwB5wLPmRq3l8WUDsyumY5XrqimYSPhZGcpVZptJ5GPihixnleLluP9G23YcILsjP1iG9pc3uj5JmrEIPyOLyfZHa33tSeDX+VRptX3z0j8s8vfZWNxJXL0JrIwKKH+CynUJELVTGwTPISTL+3AnN+ht7bcdv3yqwr07TrwQUf/Fn5BIonabMOv6aulwr59+xXXrRPqzmA2a4YGkVkxY5Fj5nlzlaO2lZsUn4TmwYcH1wdVD5bCFQVhAky6OIs9JyM9dnQy79I6doYMuxmiYceuiRpK2jSNTrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02dqO4PC113SnNoKYRD+v4Jz0t8gBaTnBaGti0otKxg=;
 b=W78ahZZqCXEfWmX8+zuL7Bm1gB2PN4i8ypE409XbpV8HyFbCZvSyr/BgcuHmHYh0iMwmJuLCcZZsi+29iCZW1wX8+bQ1vKp5ID4QltRFfKrPSfs5q4Qr7kjJUmfYeTFk9ELOjyyr1EN7z7cZYGtoZXJ0l3aRxCeilPaRLO8MhPRaYSRPx2V/vw0kRVLP39UCEClPxHaHKmetcHEGdkf+zIYlAiq4AkmDdzVg9riZaeWZcaAt+OZLiDFoT/imdRzoq6N5eBxg1uV3gIm2ITpsaKRvMuyo5oE3oGz4vZpxrvXUCOpGpKkMHAWOwbPLW4RSXneh3kKqImKW+frzJMk/ng==
Received: from MW4PR04CA0053.namprd04.prod.outlook.com (2603:10b6:303:6a::28)
 by SN6PR12MB2622.namprd12.prod.outlook.com (2603:10b6:805:72::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 00:46:05 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::90) by MW4PR04CA0053.outlook.office365.com
 (2603:10b6:303:6a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Thu, 1 Apr 2021 00:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 00:46:03 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 00:45:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Date: Thu, 1 Apr 2021 11:45:57 +1100
Message-ID: <35941260.J9UuDlmC3F@nvdebian>
In-Reply-To: <20210331134604.GK1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <2124945.3NMGunUBXV@nvdebian> <20210331134604.GK1463678@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e4ec86-f40a-4d16-04e4-08d8f4a786e6
X-MS-TrafficTypeDiagnostic: SN6PR12MB2622:
X-Microsoft-Antispam-PRVS: <SN6PR12MB26224C80274B4A5038000C8DDF7B9@SN6PR12MB2622.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +7zgNVU6kzXagGya9Md1qxWL8t946Q5MwzkB/MSIhLk86SDO+RSFa/H62t3ixR9+22DI+cavyIoac8kH7/b1LSqzkchCHRyTW5PXgYDmFw85M5ILqkoA55Hz+Eec5PXWrI3PCnBMwvNc4HZFz2gk5IaKLMekeWGCnlIlCfp4LkgOGqCuynzgJkcpjc0pOEwePkpRIANNPLdk9q9AHG0umAngJM3HIJp2LEfMfe4QJYsQhRnSB866EBp/vP5JziSxOEVyGNhyN1xcobVGU+g1EjMfV3E4azK/omZrC/WiL/QiJy52uhnSYiZpDllY+M7NdwjTVaOFUDsM5tc9gyVobahEzNRyghNSEO2ajmpdgO4OzyBKmpOrj+xHZF8xm6sTEJSCObgKSsGz9YMFGFfQVDmU5qmrSSKdi9rxMx8PKuXIMlgkd5GH1rCcKbRaPs5f5KmiESOz/h9MH2MXemKmeu4nsi/eEibxwgXEpJy3S+M0UW2fBIIlga2imeujTlsbhOiFzFHHJQQXhefdhqzjLrrgJJ2uxyprwPfc5DPp0nL5HI7rIwP17QInwKYiy6Q7PyqdUghMads5x8P9t4kQFf09+k1nI2zTN8w2KQON35qsuqHsL8ek++L2qL2hVqFlwQ90Iy3zl382NQKFg5n96tMiDQUV0wZ8oXXTJBqnSBuEPmdLBaN+18A7IMOkxlpz
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(82310400003)(16526019)(9576002)(356005)(83380400001)(336012)(86362001)(8676002)(7636003)(6862004)(498600001)(426003)(5660300002)(8936002)(7416002)(70206006)(54906003)(47076005)(36906005)(2906002)(36860700001)(33716001)(26005)(70586007)(4326008)(9686003)(6636002)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 00:46:03.1763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e4ec86-f40a-4d16-04e4-08d8f4a786e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2622
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph
 Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 1 April 2021 12:46:04 AM AEDT Jason Gunthorpe wrote:
> On Thu, Apr 01, 2021 at 12:27:52AM +1100, Alistair Popple wrote:
> > On Thursday, 1 April 2021 12:18:54 AM AEDT Jason Gunthorpe wrote:
> > > On Wed, Mar 31, 2021 at 11:59:28PM +1100, Alistair Popple wrote:
> > > 
> > > > I guess that makes sense as the split could go either way at the
> > > > moment but I should add a check to make sure this isn't used with
> > > > pinned pages anyway.
> > > 
> > > Is it possible to have a pinned page under one of these things? If I
> > > pin it before you migrate it then it remains pinned but hidden under
> > > the swap entry?
> > 
> > At the moment yes. But I had planned (and this reminded me) to add a check 
to 
> > prevent marking pinned pages for exclusive access. 
> 
> How do you even do that without races with GUP fast?

Unless I've missed something I think I've convinced myself it should be safe 
to do the pin check after make_device_exclusive() has replaced all the PTEs 
with exclusive entries.

GUP fast sequence:
1. Read PTE
2. Pin page
3. Check PTE
4. if PTE changed -> unpin and fallback

If make_device_exclusive() runs after (1) it will either succeed or see the 
pin from (2) and fail (as desired). GUP should always see the PTE change and 
fallback which will revoke the exclusive access.

 - Alistair

> Jason
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
