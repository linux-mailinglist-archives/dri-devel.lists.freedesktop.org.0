Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C113501A0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518886EAA3;
	Wed, 31 Mar 2021 13:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2051.outbound.protection.outlook.com [40.107.102.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234306EAA2;
 Wed, 31 Mar 2021 13:45:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEgVzgS0acuVY2HZUzFUYWuwgeqM/OlHQ614+Wtyl6rZKypRl2XQdv/ognIyRJRgZuwbmEwbx8HlfZe3WeWIaHJBRE5yTJhUPxrLjDiJ5FjcJtZ+aOdWQbDTRpMSIXKC5tnNi8lmBbjAm8glzYdJ03msSWXKobyleC0TKNlm2xjLVqx7VUaad2PQeyTfffZ7T11RpnYpfIeaOYuGDfcAELXqM1HwB0dMYSQRkb/atW6nCMY9YgtjlEVuubTIQK0F3QLRLwbKdaeg90lhN3ZziQmeuOPIj04WWSNw/yZdOXNvjmA1HMCWQAVvA3M/GD7bDTPm9SwPl92DtXlaQoazrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzKM0/kAI7/zHk3Mh6RAaYbyK/o0f7mdoms6zUOd8qE=;
 b=G4IOF8wqkOmt3zm4uMJAsXwjf9aw+UuLfdvTfnlJF5SQtQK4xyBiQgtydGqICtaOSO9Yl9kNtsAAqCyFkQODFC6mx5325hiQk6Ktng5gfz5GkOxd6xKlrUojzwsob2ap4XA02Ubs0OMZb8S3Ni52G1YG0h0nvPEJSN7K+bTlH+T6iUVHVyGVcGTiW5vGfmDSu1NlepIcPbGStknrss6TVx9UYAoUjmKh1A0zgLCsIVHtdId3SjUbczq9A7m+CppFeZ5rz+IyuHTuXoOafOF68gDgdroHxW5HiUmeSl5KKrRAmoMe3GD2kOlG7o0e9SIbzzHyAePlFklvrJKXtliCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzKM0/kAI7/zHk3Mh6RAaYbyK/o0f7mdoms6zUOd8qE=;
 b=c47QLU5AzWl2d4YpxgioVNtv75OXPPfjcmydfhkjALPgm3yyKn8es77kqvJ/fI7VbsqCSCYngMGP6bbVimcrwyiqHTEAUJhm5ywVoMA5k1831ZgZ6J5hrGPd/4ulcItNRGUGckSEn02sjsbPb3iLQev+50XmYQUHD4D7y9g9DDpfknRqr/B8Qf7wDcLn0TGKi4QHpkl++vMiW19+ZAns4V5k+UJHuExHLvtuUauFo6odTW8nr/EeJMcEmQZb6uumxmPVnZAouibm22ospiRzZSbKz4+CalpfcZ73Q36FNPqFKJqTL4dNhUKL3t7PRi/PLAbOpf7QQtk1yvi7wQsfAQ==
Received: from MWHPR21CA0062.namprd21.prod.outlook.com (2603:10b6:300:db::24)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 13:45:16 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:db:cafe::c0) by MWHPR21CA0062.outlook.office365.com
 (2603:10b6:300:db::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.5 via Frontend
 Transport; Wed, 31 Mar 2021 13:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 31 Mar 2021 13:45:14 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 13:45:10 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Date: Thu, 1 Apr 2021 00:27:52 +1100
Message-ID: <2124945.3NMGunUBXV@nvdebian>
In-Reply-To: <20210331131854.GI1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <2521635.masqiumSp9@nvdebian> <20210331131854.GI1463678@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4521bdf-97bf-4953-ae88-08d8f44b364e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4313:
X-Microsoft-Antispam-PRVS: <DM6PR12MB431395D0037A10963BBEE22ADF7C9@DM6PR12MB4313.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lyMc3OY1oFBNQX4BWc/hycmP9XVec5QSBFS6WAI73l9aCkoSIc9m9nsj0m8duArnHOTdlXCBKLWODQNLqtsxHACFjqflYA8mTGaUblQpzOrpj7rsvFIqtn2ndTSFlWejGvi9DFNaE/farNDkVUuI+0Oc5pITSmp/MMttb3S7WU2Brcz1bYAvShaKk424PAl7OsRqBSUS/deFTWQ8dF8QX0kBzoUphSg9QEHMJWx8xW6h/YwMUhgCISxUUYe32nmlA8TusOdeM/m4IUFk6ep7F/eUexUoCazhlskROo3xfv6awVuLsWchRqRdInoHctbzbpMlfJ2jtOCfCHP6/qbS0vXoh+EqsolsGOVcg3S3Bdl+EgnXuox5anAVJozLAURKNCuiQAvcUuN8RXXpc+1LvuHFAJVGSlzWhY9AQsERTVULgk8JWxjqvpdgbb8oaAZSy3BhZ7p8edkKJxEtz9LgKjrTRbjp3XAqrrqkZZgv3vUCC9sL11Il2GoqjidtM/Uf+ezMSFy66i+YYjKuQdRGG/1diIsMILLC4PPwQuwQzbfOQhM53jVIAAaHKXHrfCXKPI7JK2leORV88wWRzerP6nkemc5MXeG8OC7gmvbMbadc2zmm+hAPIF0hdRVHNnngiGrbce7p7IQsR7urDcnQY21rgyWWQBpeHEB13aZBTQOmQDI14KJIKtU+JiCPPta
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(33716001)(83380400001)(82740400003)(9686003)(5660300002)(426003)(478600001)(356005)(54906003)(316002)(4326008)(6862004)(6636002)(36906005)(86362001)(26005)(70586007)(70206006)(8936002)(8676002)(9576002)(16526019)(186003)(47076005)(336012)(6666004)(36860700001)(7636003)(7416002)(2906002)(82310400003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:45:14.2186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4521bdf-97bf-4953-ae88-08d8f44b364e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

On Thursday, 1 April 2021 12:18:54 AM AEDT Jason Gunthorpe wrote:
> On Wed, Mar 31, 2021 at 11:59:28PM +1100, Alistair Popple wrote:
> 
> > I guess that makes sense as the split could go either way at the
> > moment but I should add a check to make sure this isn't used with
> > pinned pages anyway.
> 
> Is it possible to have a pinned page under one of these things? If I
> pin it before you migrate it then it remains pinned but hidden under
> the swap entry?

At the moment yes. But I had planned (and this reminded me) to add a check to 
prevent marking pinned pages for exclusive access. This check was in the 
original migration based implementation as I don't think it makes much sense 
to allow exclusive access to pinned pages given it indicates another device is 
possibly using it. 

> So the special logic is needed and the pinned page has to be copied
> and written as a normal pte, not dropped as a migration entry

Yep, if we end up allowing pinned pages to exist under these then that makes 
sense. Thanks for the clarification.

 - Alistair

> Jason
> 



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
