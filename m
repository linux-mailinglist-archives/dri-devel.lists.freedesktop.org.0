Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A9388C51
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310E66ED1B;
	Wed, 19 May 2021 11:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2088.outbound.protection.outlook.com [40.107.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764236ED18;
 Wed, 19 May 2021 11:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aehnl+0ofynJeY73r8Ub7PgzHvZ31nKD18YEtDqy9jeCIPLE7xqWMSW3rUeUPmxl34rZkUB1zMe9GyiAgsb1akbp3sTu4khPMhQVcXHScAqFo3CgiHFonEZX3ro4lWzr3LegGt7UzEdIzANb588FwxD+0QmAtfWcy+raj/9MRXzzSurwho4jljsZz6pTGgTPKyjsHEn6bzGg7OI5wHEUL2j5VncBp9OOoAPAZaJpnWw0OBaFDaTp1gY04FO1f1cJGsEAc69Yqn79Y4J6HSox+tcalAe4WYLj22RFSJAuZ8uJjkVWqbM8irLkCj7Ps6Ojulk3i6jnRl/M4oaGsvVdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DfRxZ+5VEOIpzSSpe0jdE2XkRnpvc4rL9wNBbngamI=;
 b=VBpTEplWsYqQKau36j/2i0seWElPlG0DaLism1CwxnyPeDIaiubNv/G71Row3GyP5VTqTuT/9TgrKs54Tj5c0tx44zYzAYCkGShq9nLE2zLqhHvXDfkqgUg9x3P3AdHwP29HRFRRbbBtA6AUULHriMTrKl9vzMSSYTHTNmhYPfH25z3qajwP+Pg/CyViHV6TqZJid/+NVr+7Nj4+70Rpoh72OD+i3M/EjaEhiKTuaZYeupIA8LZ0J9aDCtfVAsVMAj++GXvOds/oLHXsBrkbTbgfhrf+S1C8o9NA1q5JKRAofgLPfDGUKDlUWt8sL1lsP1JGGt/OQJxvQZCqq6uikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DfRxZ+5VEOIpzSSpe0jdE2XkRnpvc4rL9wNBbngamI=;
 b=KU7G1rIDr9p6Y9tLaZff1J/MX0q5HrqKy7mmeAeuWy/TWHKcnyp4u3xX38jjhWM8ZPTv+F/9l8RPJ7k345RvsEU8fwxPCpaUsSDIdvx7NKcmagGlfSpBlck1/3le1Ms3wpC3wyuHSBAy+q08wQCq4U9QwMsoOzOC00IgjqN4OXs+3sVYvuW5nYeNefqYhsxb/JwykuN8uDTS0E7mUQLxVJ7lr36HDzc0BdyZFlmx7he7s7YVVd5UoC2PCMHZsPrBeOdaNcTkBhcOjKdk4Bukb8ZhyToEKtE0rdEhUow5IDjcVrPsV+w/qy4SgAE8vqTFlV3yJKQYqxOezaqpw43xYw==
Received: from BN9PR03CA0359.namprd03.prod.outlook.com (2603:10b6:408:f6::34)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 11:04:59 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::94) by BN9PR03CA0359.outlook.office365.com
 (2603:10b6:408:f6::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 19 May 2021 11:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 11:04:58 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 11:04:55 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date: Wed, 19 May 2021 21:04:53 +1000
Message-ID: <2235357.HsqDk0zIjc@nvdebian>
In-Reply-To: <YKRRgZmRMdk1vH7A@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210518230327.GG1002214@nvidia.com> <YKRRgZmRMdk1vH7A@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b0ef9d4-36e6-4232-7f63-08d91ab5f159
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-Microsoft-Antispam-PRVS: <MN2PR12MB38377842BCD32C537E6DB787DF2B9@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwWuasoXuvWV5NQQVV1oO3hXN0nr0wukMkaxIDB3VyVPC/Ai12Xpx8i5sfyrViXXd6z98upa2pptC69wnyTTJvjT91IBO+rNw/fcM6G2j33IU18j3jYMAFWrADy/fwinsq+A1lMGH2v9gnLHAVfx9wr1DM2CLidZwoWZiWP0hZHOxFK3dV7hPoBndfATVWX+1wOHvd41//p/Rx76EyPyYzURPyuLhjN7539IJ7OQr/6RftmmwnoEmJIYH3na/v8jRGaynx0YECBcAYC4DvK0PBeH0WdKL+u4FzT9c8Ey6hnBfgnNMCqNBX7Nzla97dmXSREiqZNaN4msHEGPtkUqdTyzCwS4l8jb0GausK3Qg5NpB5qPmDpWLIfVJinkydOE80bYu0omH5ezCiNOPHmtX4S5vDSgeuKkCYJoaiLETzR3khGqXcKie3Iop1smQt0DyMk93ieH+75RG29Wknq7RyoTgiBsP9JjyVdLGK9pzWNWZ9Eqs031gdMPuY1mrchwQG2ffLqgwPd+DL9SFUCpC3SKek2X81E7c0YnYEUNSCuwdQKoK1yNoelpMNeaf6UtdXY3u/JOFJYDhoui/wSoa0FyRgY8seVY5kSw+yJJL94sYwwFbfdjG4mkYxDiRcYWYxT+51NQKDtvOIz41NVWEqQlo+SZYr0Rr9IB+XGyLyn9jIkPisdsE9fAjKM9r2U0
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(36840700001)(46966006)(6916009)(70206006)(70586007)(9686003)(7636003)(2906002)(7416002)(83380400001)(36860700001)(8936002)(26005)(186003)(356005)(16526019)(47076005)(82310400003)(336012)(33716001)(478600001)(8676002)(86362001)(4326008)(9576002)(426003)(316002)(36906005)(5660300002)(82740400003)(54906003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:04:58.8403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0ef9d4-36e6-4232-7f63-08d91ab5f159
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3837
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 Jason Gunthorpe <jgg@nvidia.com>, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 19 May 2021 9:45:05 AM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> On Tue, May 18, 2021 at 08:03:27PM -0300, Jason Gunthorpe wrote:
> > Logically during fork all these device exclusive pages should be
> > reverted back to their CPU pages, write protected and the CPU page PTE
> > copied to the fork.
> > 
> > We should not copy the device exclusive page PTE to the fork. I think
> > I pointed to this on an earlier rev..
> 
> Agreed.  Though please see the question I posted in the other thread: now I
> am not very sure whether we'll be able to mark a page as device exclusive
> if that page has mapcount>1.
>
> > We can optimize this into the various variants above, but logically
> > device exclusive stop existing during fork.
> 
> Makes sense, I think that's indeed what this patch did at least for the COW
> case, so I think Alistair did address that comment.  It's just that I think
> we need to drop the other !COW case (imho that should correspond to the
> changes in copy_nonpresent_pte()) in this patch to guarantee it.

Right. The main change from v7 -> v8 was to remove device exclusive entries on 
fork instead of copying them. The change in copy_nonpresent_pte() is for the
!COW case. I think what you are getting at is given exclusive entries are 
(currently) only supported for PageAnon pages is_cow_mapping() will always be 
true and therefore the change to copy_nonpresent_pte() can be dropped. That 
logic seems reasonable so I will change the exclusive case in 
copy_nonpresent_pte() to a VM_WARN_ON.

> I also hope we don't make copy_pte_range() even more complicated just to do
> the lock_page() right, so we could fail the fork() if the lock is hard to
> take.

Failing fork() because we couldn't take a lock doesn't seem like the right 
approach though, especially as there is already existing code that retries. I 
get this adds complexity though, so would be happy to take a look at cleaning 
copy_pte_range() up in future.

> --
> Peter Xu




