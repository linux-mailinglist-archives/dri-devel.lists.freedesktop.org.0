Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5262123C6C5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C44E6E507;
	Wed,  5 Aug 2020 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC7E6E25B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 17:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbmOvc1yqLDC0CEmZ+SJ0+bxokjsuPSWaksneOHlX9MvfZ+tHQT//RfE7VkTTsudo5Xo3if9RD8JO6/xbVt3PcOYROkL+iBvuuCyd3bOzfOh2wqEbHyK90TJukvdfhHDGGOFVO/w8NmdmyCeA45/8MbeXiZ2G/DZtmN5cHK5/r1lbFJaWY7BKkraCak2ughQiIQ9q+bwlOPgHp+h8bTNlixNtQsSly2lOiMHARvyu6iSJQ8GfC9tPGth6INQ56/JG0x0kUk7rVSrbwaxKBJRn1S3s+wTvjo5y1LXuRUDAmkQvQqbrTZdboJPq/XmJyrqOhFSmLu2p8TE0vBS6TcTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wLHGsl2C6BI5j1457dAed07dHoa/4CliwDGpeWowms=;
 b=EihtR8bw1bvL1BFx20M+abDXu/yIggTyWRTokAumOcge+DMlMN/VbDQEcL5dJSlBtGVzXE63eqcFWVSAlqGHFdam5D0LIeULt3TRCxCs3AcSHtaHDqxWZ/VPbiIJUW3pOWnYpaV7fBVGHoR3wL6dyOjDLXzZn0HGR8MtMZx7pmvQx4AP7Zjcw22UGkHya9fBX2S5krHuixegVoHXvkHz3eAenTcjpFl3+dUKHF7r5Hr1ge2xucRZCCtaBjm/j4YBBBXjOvwkkyqgCX2YkKv9GkBADqtCsrE7rvDbiulzQqtwuXPyQVxSbHkFZmaaLSy2fG5gF4q0XgpzEOKOcXgX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wLHGsl2C6BI5j1457dAed07dHoa/4CliwDGpeWowms=;
 b=CiW6z32ZyxRj7D3q9bT8Iuoev15rOBsjdgw96aRA7g53EYm03m8CrI31YTQCdPWQMtCMJXpoq4VI5R1O3/dnKbDAsA27t1cJwbMwMLcTaOKIZZUBihtMqJWH9mfl9eNAzGE9M7eS/H9xIkKpBbte+cIHGKZjoPHXrAxFVKwWkJ4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=mellanox.com;
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (2603:10a6:5:23::16) by
 DB8PR05MB6698.eurprd05.prod.outlook.com (2603:10a6:10:132::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16; Tue, 4 Aug 2020 17:03:02 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::4025:1579:1d10:fd4d]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::4025:1579:1d10:fd4d%7]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 17:03:02 +0000
Date: Tue, 4 Aug 2020 14:02:58 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
Message-ID: <20200804170258.GV19097@mellanox.com>
References: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
Content-Disposition: inline
In-Reply-To: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
X-ClientProxiedBy: BL0PR0102CA0061.prod.exchangelabs.com
 (2603:10b6:208:25::38) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR0102CA0061.prod.exchangelabs.com (2603:10b6:208:25::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 17:03:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@mellanox.com>)	id 1k30L5-003QOA-0S; Tue, 04 Aug 2020 14:02:59 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c561fd81-bafb-45b2-6a16-08d838983f6d
X-MS-TrafficTypeDiagnostic: DB8PR05MB6698:
X-Microsoft-Antispam-PRVS: <DB8PR05MB6698AF9564BCD10DFACEFDA7CF4A0@DB8PR05MB6698.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H3oLK4DQy34IthsePWj+m2eUxKMWw32fALHR08cTHhfC1YCjn6Sbke6O516IPeZqLXEyscPRgrEen+KMQcwOw4Y5xgJKYfWIZDyV+YAlYCMfYxwtgq5x6Ykx9AN7xSn8fT+iyV/GLKCK7BvizYrwIP/dmFazcxTkjjrOeuIKT5YHGhOEbaV0gVzEXegvxcH1GX3OyCBHZCEJCJBps+DPwUGVTNzB9DlcLt1GjRHqsMF8aPEdtm395gy5DGNQBIbMtVkPkqqKIa8A5KNVdYyvrLbCr8PujbWJfrdbH3E71DYtsloEUahjdAnJK5hrOovT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR05MB4138.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(2616005)(4326008)(9746002)(9786002)(558084003)(5660300002)(36756003)(7406005)(7416002)(426003)(26005)(186003)(66556008)(66946007)(66476007)(316002)(54906003)(1076003)(2906002)(478600001)(33656002)(8676002)(8936002)(86362001)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ooX1gXy+Unzj5ZgWTuhCl4+QjUgNuUDYr9BP99YBYYIwDbW0L34SzMiYI6uEiXDQilu2h4J5VoM3a6Y0TlcU5sJ8jbajC8YH/uyPiabwBEfCcx2Wya1ZBZA1YacFGJ9fx6NXtWNaPJYzj5uWKuk5uOd2zMaN/1M11nUFFOZ7l0YqL68evnuiixtmiUqb9Z8kkBW7zFeB/3XmlDMlcDN3nsSYlCzwbwfKZONOVw6HcX5qRWZ1aq4440wXsnP7utp6cv4kgrtioNapuEyvYk0NSnqd50UMDZaYre9ulBqUJVF+wnpIdUyIz/dakZ03r8EDtQWwRtC8dnWWdYAJqCM63W1jleZab2sauVr0t6kA4xeIbUCn6H4ePLQlbA9Ba8ztvlgm4EZD4gfe2+tpuT/oGvsKcIl+Kz/5FdxF/1Cr2hX6nw2C4I55PeId69/PU6lwXihyorHTG1YhlckZMrkKZUJn586A9uVutI8WCSVL11h/yh3XJaFLpXDLc73b67ilGGCEZrdkatkv6lNHjwn1o6ew6kAz9JRQsemGeI9GEmn6keBEXQx5c8d0f1GJNvbREqWLFasT12ssbx8sM5hc11xS5UVkl/BWCDePa4c5TPVQW4DHdEFI7X+1pWStkOMX+fd+Bt3cfD8ohqDJzkun5g==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c561fd81-bafb-45b2-6a16-08d838983f6d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR05MB4138.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 17:03:02.7362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzQLuCw32OZmSzSwbCewJA0UXR68m5N9rn3ogeA9QLUAW5V9CZrohYyFDBqtZ6XcFe+t/qXXq1QexO7CjF4HdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR05MB6698
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: x86@kernel.org, David Hildenbrand <david@redhat.com>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 "Rafael J. Wysocki" <rafael@kernel.org>, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 08:24:58PM -0700, Dan Williams wrote:

> - Fix test_hmm and other compilation fixups (Ralph)

The hmm parts look OK

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
