Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBE39AF60
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 03:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD536F54D;
	Fri,  4 Jun 2021 01:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2065.outbound.protection.outlook.com [40.107.102.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8AF6F54D;
 Fri,  4 Jun 2021 01:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiO6EXZ86qJDSlqWmTmnnNBxuvYM45Johx4+Mi9in2Kc4FiT9i8h6qFcUp1YWKVYObJsYdUJSLYngBYoy0b6NC74KVOm7NC9gr1UplN3rL2Mw28xu/qu9lAYEGO0b1VQwtXtNUtTIXBUguLBx5C3fqn487b3av9hPg6tYpuJBEEc1cJIMn4gcqa2gESX1CTNALZVSZc2jy+PZgJDbWk0xzqzq/fIZKG7/lWPjYCvwgjATXzp9GRHQm3bvL1iFH59vWZiAOt2gcXRnFD3Y94HRIAdWbr4ciC1DhAIUo+UQEyjIwAbvCD5KJMl0JH+A1KYejsSSZTqZe3QO9vqjGVVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4n1jDCxVL72eQjpw+W1NgqvAgmUYPFpjvnmCkUdv2c=;
 b=V10QRWSbV+IWlzAqBGRKzw2foZbjcVZmayDF+81418UXjxiGUpN2wQfd4REh+DWWx84m7pobPL06jaMGTuVfGT52BylI7OAHYtkYoHA5XQIxyr591/cayxIcymy7IBv5SzlnXCRnDmJCSY24v3OYLUwOOwTDgiSd9Rud4nH3X/pHwQvBrp0TvNFjgasgVXJ8TFoiTrZUtc7Q0aYFBet1iY3/JqaggEi1Q69DbEGO3IEBZP5sb3kgPcFny8jZe2ndvvoAmf44Hz/gUzC3QNtjRKSaN4hEX7zrdvKca2DT/UF3+3x5bHi6qI2VOKJXF8Yby0DdMvD+owvGHgMiJtFmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4n1jDCxVL72eQjpw+W1NgqvAgmUYPFpjvnmCkUdv2c=;
 b=W9R5JWJQd/kRQidBNjuPoyfEiBN+YsefjwsZjyeVqejdOZRRWluTRlgH9WszVVczbdFlqtmHRx7jRikuM2CuwBdRwBiQLqCRVETwUXoIk50UPQTtj0inTFoejgBdVX6yi5B/x3Vd7pK6RDKA+DdOQp5FRab25iXGglPbW6WJCFBxNlAaqyB5c2wHUsTCp6h9UuIlDI9y2O4wRCs4NxgPahSZkO6LSGDhwLisoaFaPHIAY46j+pK/Vo/rpq/8S2QR9QrIKDfk8DvSMDoZtQ0mqXug4/uzZoLFObNpBEn2LUTnMspZwVtF/bKVXqwsZ7k/0eR/TaZGilxwpkSjP4mtnQ==
Received: from BN9PR03CA0042.namprd03.prod.outlook.com (2603:10b6:408:fb::17)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 4 Jun
 2021 01:07:48 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::a7) by BN9PR03CA0042.outlook.office365.com
 (2603:10b6:408:fb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Fri, 4 Jun 2021 01:07:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 01:07:48 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 01:07:44 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Date: Fri, 4 Jun 2021 11:07:42 +1000
Message-ID: <10231977.pWpf7cJbZl@nvdebian>
In-Reply-To: <YLjrjJXMP9Y3bvej@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <3853054.AI2YdRgKcH@nvdebian> <YLjrjJXMP9Y3bvej@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbea646e-71aa-4fd6-3c5b-08d926f52b37
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-Microsoft-Antispam-PRVS: <MN2PR12MB383874D0ADA1DDA5BA1C1BBFDF3B9@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDJ8yK6JVpkitw5sSEcy/BG6FUCOfJPe9++DTE5pJV8DLqxwbI2Z390RpAK5Ugt4aY6Egg0AYwCk6LU+hTQhBAFzMVrqf55ok78aTI1ZRnCOpJ8woDtPoTbonuBSwuG/Ux6Nq0S4GiByRE43vHcMOyuhvUo+lnXMnxXDxHNeR8qdGv3hP0Du6nfYgoiZWDzmioIMwfgEpd9l0hFljDiFcSH5qmi4TBU37v9Pjm/xIfxOCDDORZEXgz8cOQs2H0HTv9wP4n+MpNpLzlU9H1tBGpifnNp3IZJ4PkvQLE8DDGlLUiGQhvveYrAYT5A0qF8lZRMH1LYtbPJPCWnVDV3Ur9PL8c+q9UEI9l/Ce0XoUb1kuZ0s343SG8RDkb9CT2DZefxQ8twv7cNvjqnEfaSd6O/mj2V4Oaw82o8NWOvBGw01f0Os3R0D0DMdRky9oyd3oxD5/7RraqOoLyD9CJH94yJ5cNSsW5gRUTOQvexr5kz486Q32m6eMnURQw51LmSOI71Egx1cjRzQc66d8XmkbAim2qUX3/1VSz+QCl8xNXlW+8afVzQSg0rQ3XjqBvYU3a79/KtXZPU4g40CEyvohhGQT9qLpbq1C88NoQrrrkWuCOCb3LoHJ9+1YAm8GRLz/D7eVQd8wdsA+NEWC1Y8y9HtWw3Nq0lgwDMoa3FQZsnZgPpkhcxDYaTrgGS8Ui4H
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(478600001)(47076005)(82310400003)(9576002)(83380400001)(7416002)(6916009)(36860700001)(7636003)(33716001)(4326008)(70206006)(9686003)(186003)(16526019)(26005)(5660300002)(2906002)(8676002)(36906005)(54906003)(426003)(86362001)(336012)(70586007)(356005)(8936002)(82740400003)(316002)(4744005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 01:07:48.1837 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbea646e-71aa-4fd6-3c5b-08d926f52b37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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
 nouveau@lists.freedesktop.org, Balbir Singh <bsingharora@gmail.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, 4 June 2021 12:47:40 AM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> On Thu, Jun 03, 2021 at 09:39:32PM +1000, Alistair Popple wrote:
> > Reclaim won't run on the page due to the extra references from the special
> > swap entries.
> 
> That sounds reasonable, but I didn't find the point that stops it, probably
> due to my limited knowledge on the reclaim code.  Could you elaborate?

Sure, it isn't immediately obvious but it ends up being detected at the start 
of is_page_cache_freeable() in the pageout code:


static pageout_t pageout(struct page *page, struct address_space *mapping)
{

[...]

	if (!is_page_cache_freeable(page))
		return PAGE_KEEP;

 - Alistair

> --
> Peter Xu




