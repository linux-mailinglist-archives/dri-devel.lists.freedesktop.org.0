Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2834F417
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDB36E0D0;
	Tue, 30 Mar 2021 22:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABCC6E0D0;
 Tue, 30 Mar 2021 22:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUFEBc36EtD7ikrkIolbQ5iTFDWVh0tTQuN291PCYc1Z42wMQ4GgIKD3wARDw4AtOd7am0/pKoVMTfBv9HW8AxkUEuNBOehUNMj0fWivEniKdgc+3tIMbEuGytU8NDgtmwGL4t7D3p5BTeSdaOKkPI2WtZINvT8lmCK7obh6DngCHWsIS7hBfedXTriSZtNyucbYuNbhGjdooJhnhhdVG9S+8zZWcvTEAQVWpH1/0yyQLb7K6HPG0aHk+MT54Av6SNd7hzuJ8PBH5qXVRnPMjncAGZqv1miYsa+yKTJnC/5thCj72BrW2bV8DUYbF384Qtas+Tiig+/C9F9rHb4Frg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V944gmzVtD/owcMbKJQPd+bzIabd4ZGL/Zbm1mhLQw=;
 b=dDllQNBXuL5nkeVs0HoUz0ysIi5oOhWO0DnG9LjU/QqEduPLbN9b2BzV0PTl51ZKPsKRL8e2zv9z38qvcuoXj4DNRxW+aVn/7lp4TXSGGANw16yW7w9JhCf+sDXP7wfax4kWMi/xNli1xIalf15GsA4ctHD6tsDlq54Azc+a6AQPXgVJkpcpxYy23ytRVQGpUwxRE2nAP9AKBu0cc4Nj1me1mULyDt8wVna9tNOadk0ZAKzUHljUit8H36mBgQMosi92mB9pkvktuU5A8pVaD2iyUvSAYE7MzGtTpg6C7d4WLuoy1QqpWHNBUjYGJhb/vBwbWzB8WEHPMzXXSWSUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V944gmzVtD/owcMbKJQPd+bzIabd4ZGL/Zbm1mhLQw=;
 b=pQF7/GO9niWmzLt42Lx67ScTwNPmMC7L5YD7qIcPQiRrLZmKUBkOmzpRT6eItGA3FKBtj5WXysF5HivTlUc+3VWu1ItbcT8nzaj4Nz1STty+U2P0Nm7iE/Di+AHMk+rX+ko9ZQu4fdCA3g/6t0kRwz5+EqCPsMICOlntJ31y9Vxoql5TalWo14fLRL+QHY47QLm83wwipvjFD1MJ+q6Dti0JL8xxdcti6YzPcblLoEkMy+uvMr9KKZv4NORBY5+JBmbX+332ntFttJx+Gv6fm4vt4bV9avA5QAEIBGfAVSEojntElDT/U4FxR61VG7Kk7u8aQq/gqFaYY1l3DZcgXA==
Received: from BN0PR04CA0160.namprd04.prod.outlook.com (2603:10b6:408:eb::15)
 by BY5PR12MB4917.namprd12.prod.outlook.com (2603:10b6:a03:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 22:16:47 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::b5) by BN0PR04CA0160.outlook.office365.com
 (2603:10b6:408:eb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Tue, 30 Mar 2021 22:16:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 30 Mar 2021 22:16:46 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 22:16:43 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Wed, 31 Mar 2021 09:16:41 +1100
Message-ID: <1636116.HIPWbOE89B@nvdebian>
In-Reply-To: <12442194.rtmf8Ope3M@nvdebian>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210330184903.GZ2356281@nvidia.com> <12442194.rtmf8Ope3M@nvdebian>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ef6f3a-4dbc-44c4-91e3-08d8f3c98222
X-MS-TrafficTypeDiagnostic: BY5PR12MB4917:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4917D1F58C38E60D7384941ADF7D9@BY5PR12MB4917.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k94x7HdsFN4Nl3HsK5alCJgrIEvED+WSxKucYmCQg8B0y80/fWCSWbwakClfJZVKnlgmsGIKKMY1JHizP4uQMRUxvs4hVKorMzJp0LfL2Tqahppuq7KAbwKeAcPc8x8oOcd+q8hnadK9W/tPF2negjIHm8LsE/YN9+NzY6fJXQOkNisYVMo7nJgrZMn+2Kza3ALlpRxSsYgpN7XK9zLjPiaPuWyB2zKzHCJRrpMZhaqVCJlFp3AoSOwSfj3zpK5W/H1zAPxaNAuu7pwLy2HLpM6pXodMTPkvi4hU3jMx5f/V2Itv5VchKS4x1d6AJys5ecAtkyr4ykRMI0GXHzzYNmWAEtdl6/yluOlhUFKPWPy03e2i8n3Z5knrZsTxFt5IXfSnnkTSYlGC7RE+XcTyMaeHl+LBKrMxjhwN8C3415TEPmmBAGSXFcwcFCV7lgx1rpIgXOId6+1ECs38EUz6De5oVmCuIqRVnOiDzrB2FpEPqC6J1QCLg8i3oPYVMexovsu7KSYUXvGj08nkuRT6BdyvzptNIaJpPhrD1OIIl4SnWHLdbcxdiQoWj7Cr41S9ZQWqLKxhP29aSsnqCFLnTF6ykZX1Cn/psVdRgSNa+V9Ucb78xZq+0DsPA72PkIUYrNwvM3PUdZH2oEZvlC+cxQx25e9lnXaG+fDbJJdlOXqxfKcdqVeZ8x6Y/FB55p88
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(46966006)(8936002)(966005)(7636003)(36860700001)(33716001)(5660300002)(36906005)(47076005)(54906003)(186003)(82310400003)(2906002)(478600001)(82740400003)(9686003)(86362001)(6916009)(4326008)(70586007)(336012)(426003)(316002)(83380400001)(8676002)(26005)(16526019)(70206006)(7416002)(356005)(9576002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 22:16:46.8705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ef6f3a-4dbc-44c4-91e3-08d8f3c98222
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4917
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com,
 kvm-ppc@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 31 March 2021 9:09:30 AM AEDT Alistair Popple wrote:
> On Wednesday, 31 March 2021 5:49:03 AM AEDT Jason Gunthorpe wrote:
> > On Fri, Mar 26, 2021 at 11:08:00AM +1100, Alistair Popple wrote:

<snip>

> > So what clears PG_mlocked on this call path?
> 
> See munlock_vma_page(). munlock works by clearing PG_mlocked, then calling 
> try_to_munlock to check if any VMAs still need it locked in which case 
> PG_mlocked gets set again. There are no other callers of try_to_munlock().
> 
> > Something needs attention here..
> 
> I think the code is correct, but perhaps the naming could be better. Would be 
> interested hearing any thoughts on renaming try_to_munlock() to try_to_mlock() 
> as the current name appears based on the context it is called from (munlock) 
> rather than what it does (mlock).

Actually Documentation/vm/unevictable-lru.rst contains a better suggestion:

try_to_munlock() Reverse Map Scan
---------------------------------

.. warning::
   [!] TODO/FIXME: a better name might be page_mlocked() - analogous to the
   page_referenced() reverse map walker.

Thoughts on renaming try_to_unlock() -> page_mlocked() and try_to_munlock_one() -> page_mlock_one()?

>  - Alistair
> 
> > Jason
> > 
> 
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
