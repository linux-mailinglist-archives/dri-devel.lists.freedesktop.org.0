Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A644946A3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 06:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D5E10E67C;
	Thu, 20 Jan 2022 05:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91E510E67C;
 Thu, 20 Jan 2022 05:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmfND6qG36ugzFIdL+Co7QoAa8y3UIiymblwF4hry41PVj7t/T1ow4EY5gtFQ5iHqAmJGcj3dyAUHCF89hf+slAgRiI5dkZJ6rZ1jBS9XWKZi9XUW4EXKCzZmFSAbrv9oReC/YW63kA5rzrylMsrKtvb9VK8rvELHI4sbOymUM6iDPHLPUhnnC5vamEQQP/SO8+slvk5Fcx4fAsutwyPVDg2zDGHovvBezCBQ+fUyWTQPVCTvjq2HGXcyfQzOqJsM6i2lE0gdvCMZA5zn0OQ30WWUGnq9SyJJXWiLlz+4+zUQk9hlY78ebnbiqOMJjpZmwYS/LnSc2p7dIW4Fo0waA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wqta+qxoz2lRmi6B9DBY8cUfeaPCpnUJMfO2iWegnu8=;
 b=Ntl+IEaJyEa9piGPBeiUC86/jAV7teOq99T1TC9Pciuko5idiaC2CyJmD4MC5bs3hCXV7wF0qODMz8VR/eXtxx3745gKQ9IzPED8EU8j6dRWlbDnBIR23bNz2AP7EcVfBxTgFHJx61v/NcXI5T92oc+1NtpBUVkw3HgtzJtUsr3u1RQGsKVkbuMX6ON9GWEGfjo7D2kpC121JQaSSJPoIA4gVxbR6pLEJPDJ01jPwQ05hia37fCIN2nDt4HdDvz3qktCjM4cQGwld95p1oSntX0CSexPtyM0aIEiDI+y9mnB7DD13Sxh60LRlLPxw2l9Eg53chCIZsUJy3ojunCKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wqta+qxoz2lRmi6B9DBY8cUfeaPCpnUJMfO2iWegnu8=;
 b=EdqUsx+frWubHEL/7eK07yJCOuKhPSsxE9LOuQl3kpaDd04xTA1ADPARZpt0kX+4/j1de8es/erx6T99c/mEbCMotUNxb+0tNJNwUYQpfIz4VNo5Ciu3+/SbcaUWoGIcz44R+063QcfplUYU4Z6mIkHtAgl5nQd4IREzNFBj7dqgfvrZbaWNdvuhGZpz5xV/jwGMXmOzUC50SMZ06zZklKmiDaiKt/XIaGdcTBfTMuksNyDKPz17WSfastyArHQ4TN3CjpKYy1MCOiAWxgbmyRZvF/wluf6twf25Zw0cbDKDfI37ol4XykXIpPjLAM7dc5o3+YXLCsVGwvVduxX6Lg==
Received: from BN0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:408:e6::30)
 by DM6PR12MB3338.namprd12.prod.outlook.com (2603:10b6:5:11f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 05:01:39 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::67) by BN0PR03CA0025.outlook.office365.com
 (2603:10b6:408:e6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 05:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 05:01:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 20 Jan 2022 05:01:36 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 19 Jan 2022
 21:01:33 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 06/10] lib: test_hmm add ioctl to get zone device type
Date: Thu, 20 Jan 2022 16:01:31 +1100
Message-ID: <2652278.CYUQLKzMqb@nvdebian>
In-Reply-To: <20220110223201.31024-7-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-7-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 442bcf7e-9026-4da7-6e6b-08d9dbd1f11f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3338:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB333874C8B10D2C3BA8038B3FDF5A9@DM6PR12MB3338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wbcLprc0LIKlh4IE10yp6YQUXHI4CXmwEJkTQ1j0kT2P6Hpnh7PnGCMEfbKOirASviTpQhbzH5md+thUGugOvm/LDCLkogv6Faka1gCelKddT5lia0IEVB707R8WT57qZ3rsgVIn0t8laxYpp8iTiFjfKYheE3fQ8KLyIzgg/64Ly6DjKNq1ONtjOQlPkJk4qDwuk/AvLg8yo8vy0ihXdWrNSzDVjJACjGf6GwcdOrnsm8xjUi1PvzdZN4zoOkR0oC3ZbCkM5Y526V4qvF/1i8cg4oB1gILeLh/a3VGjrFJ5d61r9N2u1JRzshWCEBduKWwy3lKPfKb0cpCYUsvkXZn4KNaVjbonOxLIxr2IMHaZI7sbYX0fMpwjBa02l34ANzmuDCwTtVyZezp/TaSH6kh8waJU4yZjncxL9u+ldtfW3ZxtkTSagpcduE2YzPEBVU2q/GmHZrd5sisJz/yNYC8OIzuscIgeSoLxEt30p8LfTnUdxGt8nzcUta5EmPpRTIjRWOWTbgCb2shf54LSPAChv5R1xkRheZg8mPpKHhRZyuIcdbDbLQMwV+c38/rmRWuC7r5Eu225dp/8/MsWb3JBcLVkB5bUdBykxJEtlMqYCrWQv1z2HsuYqfNmdMGOrrpUjU+3rOfzKTH0lndwE22MDZz9Y7eFyCtQZoo1H/B5rbszktzdm/itE2B0oZzCWG14FBohqWXRTqI+c5Gm2PhQ7U4qWDeRsiOjZLEO9jSBMXePvbwrAuM7ayhEF/2FzBwIrxDnLem9z72IFDGL65Z5zgzen0q1zQFHJZ8im8w=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(4744005)(54906003)(36860700001)(33716001)(186003)(356005)(4326008)(9576002)(9686003)(2906002)(47076005)(70206006)(508600001)(26005)(316002)(8936002)(70586007)(82310400004)(81166007)(336012)(86362001)(110136005)(426003)(7416002)(16526019)(5660300002)(8676002)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 05:01:38.7933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442bcf7e-9026-4da7-6e6b-08d9dbd1f11f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3338
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 11 January 2022 9:31:57 AM AEDT Alex Sierra wrote:

[...]

> +enum {
> +	/* 0 is reserved to catch uninitialized type fields */

This seems unnecessary and can be dropped to start at zero.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> +	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
> +};
> +
>  #endif /* _LIB_TEST_HMM_UAPI_H */
> 




