Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD8E387831
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3366EB3B;
	Tue, 18 May 2021 11:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E6489FE3;
 Tue, 18 May 2021 11:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAAQVohUw5spyVEhK+J7yggMzQO9zEhnTJ43pFKFaUyLDiRiXLLl6K47RG8yPDcPVJR5794hvrUWE5flUwFDi4mnHEjJ4l7fC1xOE7yNWvnYu7dXx1x9PZ3cho5tCcw9WA5+9BFCXnFyCY9xKbsEqrPnMD19zTJa7C3fDpQLOSutlz9125Jkm5C9oilW4fi2bvdpMgQby0jzpzMk0bMQXdTJJfirgpaqbT2bhVMfB8Qe4yNV500EbH0BvVdNZbmOzMW5e8SNe4tvll8CCqjDkaX+s+B5NP9Im1u2QlhHhGfBdIwFw6aokaEIfrt44J0SjgQvQOiyvd5H9bPAzAj2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kK2QEwg/XBH3F3RK5WAljT743S3J7ZCvjM5u19bbObU=;
 b=CTtOxa9QfT3QiXY/pgbZrAVXjVCm2+yYBpkCfJ6+o5X+KRZoaf/4vh3+650NwQU50Y4erkwNRLtS7bJ4rfB1tKo0WRS7pIi7+aqgosh0SLTO1+yTRwZmO0QuoMS8hLzicbgwFHsi8EGp2mDYzNSmBi7UgiqtqLir2tG8U+SNBsWiu4socor8w485YZnsXBG1EyMzodcCLOwjdZ+zoxpXpMOOmsmLK5eocLV4M/eqH3OAmncl/Z6agVHc4uN6KEIROEVwe5hL2qcaf1i436wiYTweGU7DTx6ejY4ot5zhCr8m8geGbDs1fUdaxHq341gelIDdRtM1iis/bCzd5AdSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kK2QEwg/XBH3F3RK5WAljT743S3J7ZCvjM5u19bbObU=;
 b=k+YEvP04DoRZpwXwAl78Skp3bdMx7SurLpS5o3AZvGCeT7T9R4DW1kSOHmkP5ceCDk01PUUIjoq/qMKkV60ep33BzDtqzDDzkwfyPcj5sAuRH5xjGT8oaGR4W+U9YD0f/cCVX9Lbi1YYvbCVEsXVxdhThwYmjtSrkUGoUpMfbZdE2YJfSuVvnAWkst41TqiK4cZfH/typdavtMnp6H5S5cw60V6qOYSH61Og0nVFQ1GDGF5JMoytT22RO80vpsvlqLkKDZEtixulsaHAya8bKPaQ0KIamfSRk3RGZy7d1rV0cHtiOV5ASIYycIdirkD2GwBuLQOVhCvkestkCEo0/Q==
Received: from BN6PR22CA0038.namprd22.prod.outlook.com (2603:10b6:404:37::24)
 by BN6PR12MB1617.namprd12.prod.outlook.com (2603:10b6:405:d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 11:58:16 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::ff) by BN6PR22CA0038.outlook.office365.com
 (2603:10b6:404:37::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 11:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 11:58:16 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 11:58:11 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 1/8] mm: Remove special swap entry functions
Date: Tue, 18 May 2021 21:58:09 +1000
Message-ID: <2009782.faHf7sVjGQ@nvdebian>
In-Reply-To: <YKMjvKGIHdwQN2Ml@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-2-apopple@nvidia.com> <YKMjvKGIHdwQN2Ml@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e74b7bf-743b-4368-e3b2-08d919f438b3
X-MS-TrafficTypeDiagnostic: BN6PR12MB1617:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1617E628F848E50075D0BD3ADF2C9@BN6PR12MB1617.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dhZyjhtzq+w2F7MEBwd6talLQ1aWAfeQakn2i7/TteuTrKW1UHVJq8fe+pWy3bOVnHQBQU+U6tMemDANVTP9t3P38Ixo7LFMNpdh+dVkwkIIZK+VL6N9sRLNfWKqb07H89iL5A+k85YyBvSLtfO31Ox4eZKc+gTLw+yOLVFTPtUdzXM6TjIXk//yiVt8ZCOtDm+TGymYR3Tn7stDX/escgLuWMHXHNjVQuvdtPXzBEdvsrn9S5F1+7C+lKWDv85fhPTgAS2h8Lgk3NO9rqxy41FrNTCxO2YnlGWfC24g2u2w0QzIgySs0wWZ3JAzXRfI21iU1hjttpFXeVFUZiMqfm9QL/fb3LcUvKGT60XYgYpKJVKyV1kdeKS99T27Wr3v6JAF0+yapwt1cvbrrmBxpQLBLzOh7DckxF45f9Nc6It/xdmtbinToZucrQmn6eCuUpNk9t/6XWJ3CINN/maaUbV2FqiVFxV9Gwp6y2kYcF1ukdHHhSDky6Z/V73CpOyEnTxlHKogwJTotmjSi2CtryzHd98ZS/dnZrj7Z3+h32iR+grX71pkZ8n/e43zAipsjM2OuKxgL1GWEFNtBgD67DJ6/s/addw00Dasqxbdy14F38VppQZyAzp0OIOuzduPMuFd+TQyf3Q2yanvvgreBKIZnj13pmTr+XYGU4zkHfLCRJPozgQckOcJPNS3P+ncz5MsLUEEKLWGOKYxcD+mNvlTORmoAXinWU9cyhyA4ho1faBAWVxfJhEwDkSH8oSWheLZqHs9gZYnP5c9IchTkyWH8QRrWiscuuSZjna5OEk=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(36840700001)(426003)(356005)(82740400003)(7636003)(336012)(26005)(47076005)(16526019)(186003)(36860700001)(82310400003)(83380400001)(7416002)(2906002)(33716001)(478600001)(36906005)(316002)(54906003)(966005)(8676002)(8936002)(6916009)(9576002)(9686003)(4326008)(5660300002)(86362001)(70586007)(70206006)(39026012)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 11:58:16.1894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e74b7bf-743b-4368-e3b2-08d919f438b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1617
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
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 18 May 2021 12:17:32 PM AEST Peter Xu wrote:
> On Wed, Apr 07, 2021 at 06:42:31PM +1000, Alistair Popple wrote:
> > +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> > +{
> > +     struct page *p = pfn_to_page(swp_offset(entry));
> > +
> > +     /*
> > +      * Any use of migration entries may only occur while the
> > +      * corresponding page is locked
> > +      */
> > +     BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> > +
> > +     return p;
> > +}
> 
> Would swap_pfn_entry_to_page() be slightly better?
> 
> The thing is it's very easy to read pfn_*() as a function to take a pfn as
> parameter...
> 
> Since I'm also recently working on some swap-related new ptes [1], I'm
> thinking whether we could name these swap entries as "swap XXX entries". 
> Say, "swap hwpoison entry", "swap pfn entry" (which is a superset of "swap
> migration entry", "swap device exclusive entry", ...).  That's where I came
> with the above swap_pfn_entry_to_page(), then below will be naturally
> is_swap_pfn_entry().

Equally though "hwpoison swap entry", "pfn swap entry", "migration swap 
entry", etc. also makes sense (at least to me), but does that not fit in as 
well with your series? I haven't looked too deeply at your series but have 
been meaning to so thanks for the pointer.

> No strong opinion as this is already a v8 series (and sorry to chim in this
> late), just to raise this up.

No worries, it's good timing as I was about to send a v9 which was just a 
rebase anyway. I am hoping to try and get this accepted for the next merge 
window but I will wait before sending v9 to see if anyone else has thoughts on 
the naming here.

I don't have a particularly strong opinion either, and your justification is 
more thought than I gave to naming these originally so am happy to rename if 
it's more readable or fits better with your series.

Thanks.

 - Alistair

> [1] https://lore.kernel.org/lkml/20210427161317.50682-1-peterx@redhat.com/
> 
> Thanks,
> 
> > +
> > +/*
> > + * A pfn swap entry is a special type of swap entry that always has a pfn
> > stored + * in the swap offset. They are used to represent unaddressable
> > device memory + * and to restrict access to a page undergoing migration.
> > + */
> > +static inline bool is_pfn_swap_entry(swp_entry_t entry)
> > +{
> > +     return is_migration_entry(entry) || is_device_private_entry(entry);
> > +}
> 
> --
> Peter Xu




