Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2AC58AD4A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 17:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4F2B73C3;
	Fri,  5 Aug 2022 15:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36642B7D74
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 15:42:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lZuNIcLOqdcGctcJvBT5GIIc9Eo5pZEJvBIm7Fko08TnDCFgGdzF9uNqtNNkTU9HjmB8itt3tHvAmpoOgaNI7gNXgDH69MCDMdeSYZC3WTB7qNJKbkaa9Y7w54kNQimiPBpGD7evfSYmVbAIb3ykYtspVRSMRIhZmxhIQGAx5WMQ4U6euNnspPT3KrOjMRweyqKEAh6XXJgLfuUrHdrPnRzlsXZvCO2py6cQ/PS7u0GzwxKtdKnu0D12T4/HzUT+MOegKcmegqlpuNt/XCo7Vb/DIEzFRQb7NUj4WK6Dyiy/55T6Bz6IByjgXCtR8F+lwwJKeyHX4oG4jy/CtnQ6Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9G/JdirGbwj2q1NMLb2kpVTUK9KtSzikxzuZakdPBE=;
 b=h7yzUR9yTIEn+sPIo8rZrAmbv5O8nMK5yhu1rT6d4p3g90lRJ8s/4PKdimXQ0FOVAJm5Xl1vYPD3K0ubq6qRucT2BYRBraaT3i8nHJ6OqxHehA5PXJGyqmMMn6zlZep/Ke1qfHUMyfqhPLeOm9OeElREO/NTeGR/dBddEwLUZq6s1UTy/aY7P6Cg5UfHXQOmRbjtjNMgI6lrJpWx+fc7Aa7LgzNN51WqwMqrdawxKVEwnh33BIPciN9uKpNWcjVCUxBiNad0jPQ7WqwsnlWMJv0HPen4UTURozijBYurNdKHciK8LWEdm1ExXi0tQO5J1XAihryB5c/7eqyZ31XWFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9G/JdirGbwj2q1NMLb2kpVTUK9KtSzikxzuZakdPBE=;
 b=6PcL0X4aMHOotPluQaEpXcgF6KxAu3rYQWnA4Ug9pRsPYyxuOgW4V+mwzwXhF4m+RqhOama3bkfQxXskXXHYsOU5A30x5ODUTKwuTfVcFRk1LKREzJyfs619BTdSMH2Yqq1dcsv7fjQiax9Qxadu9ZW4qAaWTu9aHLwBVqc4kiY=
Received: from AM5PR0701CA0057.eurprd07.prod.outlook.com (2603:10a6:203:2::19)
 by HE1PR08MB2842.eurprd08.prod.outlook.com (2603:10a6:7:34::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Fri, 5 Aug
 2022 15:42:01 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::f5) by AM5PR0701CA0057.outlook.office365.com
 (2603:10a6:203:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Fri, 5 Aug 2022 15:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Fri, 5 Aug 2022 15:42:01 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Fri, 05 Aug 2022 15:42:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08a1e21321ebf567
X-CR-MTA-TID: 64aa7808
Received: from 76f52a4d4e4f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF99F824-C6F1-46B9-8CA0-2E44D2D1547C.1; 
 Fri, 05 Aug 2022 15:41:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76f52a4d4e4f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Aug 2022 15:41:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwCT5t/UTOawygVLK+hjwN5Xb96n8tM+W/95LGAZefTArfZG6Y3yQHHQ86VTknsM0FWapf4QXSyeGAGyNIAFIFRDgCdsIWbI/Qud4vT/bHsb59ar4qo03T+i7nI54Ui4H1E9vU7F53DdgXsOKnkXiPdDGnMkvTTR/7j987n5wGx43Lj9IrBSaLwsF4NBKCdgpc60XDe1JlKVoEHTuBfYrH8UdBdNRgUo5ZdLtFgFVqu2UHl8i0fZiL+BfF3t9QgOwhihZOket01iM30LGYxH57y8l/coLzRnBHZ+ggm81tPf0cKN6So4r7nW3nFqNGZOt9eXXMC5vFLizdkpipd+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9G/JdirGbwj2q1NMLb2kpVTUK9KtSzikxzuZakdPBE=;
 b=YPsVaxmRQXWZnn/vEQXATCOIl5es00NYm2vbWdyQj27hnfxtCFScaig8p1yp1fb59JolR9wKWk0Hr6Q8h2BMeDW/cTqm0oljZm3qPl8RHEPq2eeqd6JQxQlOmXwlFsnfhBa7m5QKXBT+FeSG+GFJTzLklFQA1pRz6jIJfV4iFksP2dNE1sRuIxK0GDxxx4gRF1kXkDhH1hqSuBBSEQD75/FuNum4d20AoAx7RXeV27G6BtYNpEeo6FGitIf2dQlsJiDzYSU9BBJC6HTLtOlg3ZR5MiNPse/tmAhSl2eLfnR1X13FMIuyFB/xmjxMPUkQ86qJi6P2Dpr4lt6ENN6k+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9G/JdirGbwj2q1NMLb2kpVTUK9KtSzikxzuZakdPBE=;
 b=6PcL0X4aMHOotPluQaEpXcgF6KxAu3rYQWnA4Ug9pRsPYyxuOgW4V+mwzwXhF4m+RqhOama3bkfQxXskXXHYsOU5A30x5ODUTKwuTfVcFRk1LKREzJyfs619BTdSMH2Yqq1dcsv7fjQiax9Qxadu9ZW4qAaWTu9aHLwBVqc4kiY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 5 Aug
 2022 15:41:50 +0000
Received: from AS8PR08MB6805.eurprd08.prod.outlook.com
 ([fe80::c91e:5344:358c:b0e1]) by AS8PR08MB6805.eurprd08.prod.outlook.com
 ([fe80::c91e:5344:358c:b0e1%5]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 15:41:50 +0000
Date: Fri, 5 Aug 2022 16:41:39 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Olivier Masse <olivier.masse@nxp.com>
Subject: Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf heap support
Message-ID: <20220805154139.2qkqxwklufjpsfdx@000377403353>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805135330.970-2-olivier.masse@nxp.com>
X-ClientProxiedBy: SN4PR0501CA0057.namprd05.prod.outlook.com
 (2603:10b6:803:41::34) To AS8PR08MB6805.eurprd08.prod.outlook.com
 (2603:10a6:20b:396::14)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 46acf916-95e6-414b-361a-08da76f909f0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:EE_|VE1EUR03FT032:EE_|HE1PR08MB2842:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1/VoQOV2BkkkWf1sbRKb7w95PhFxASSj8779J5R+C9lThRocTUKawBbWVZ1iD7WpQNkJ/0zgYY6UyLv9ipPIdRLgj+ZTOmmsoAvzM9Sg1r364RVw63Hp9pun3edYUHmtV4MLILaBhmBVzeALmKg0gac2pXNaWUAwWblUaONWJ8e4k/00zBSviNrcyA6v6sY/Gz3GVvKd+7M42ZQY7H/2SBHur7VF7iQJaUXBPryMjLHxAqv9PM7npOBEtFkrin2KHc6nGti6gqAipOTyKwDAmPfgORZC2fLqLaeEZIIMKx1pkhBgydD4LIGhd2ExL/MoxVjaWCD+YghuUiJWq1xlbODIUBGkBF8uflO7MowYyOuX9p80IPmoc7lmiSfAz69B00vHjlezC1Tv+JLo0AkAeYfyhl0a+Lr5GzcOiQAA46LIP1Uh8fxOSOrAI9TrWPzScYW5DfcsaHuKE4ob+PJpiy4/iyZzFlvbbN1lhH4xboezhqt5J7e/j2nhdDLS1J6QU7LRnBljcUABh5E2C55TfDXl+G9yWYqkX+8Xi+Nuix/ulVRUrlUEDzlWSnBrS9pM2hdi2Mb4jdOFR9hp9Ihv9tMxyNpOiG+160T3kebNJMZ6ys/SOw1MuMJXRufJqAQXwP+/3YS8fsHymj46az6DN9jaXsgRcweOK0Xb4i+ZcAl2G3+p2wfNmXv7qFsU+rJDNjwmSToveSBHQeq1kVIhLSpnulYoVNoKFfGzggMb/rw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6805.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(7916004)(396003)(366004)(346002)(39860400002)(136003)(376002)(478600001)(41300700001)(6666004)(26005)(6506007)(6512007)(6486002)(9686003)(30864003)(33716001)(44832011)(2906002)(6916009)(86362001)(316002)(38100700002)(4326008)(1076003)(8936002)(66946007)(66556008)(66476007)(5660300002)(8676002)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 69ff7077-cc6a-4171-6035-08da76f90347
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRKh3eoK4mU1xUr6jaNBYPi8K+LmcT285YNTStY5jLSnxVkjOCV2AkbqPyn+BihgSWbIUf2y5LQ6VMVbX7HM1ur1iVHNZCiy6xkt4m60InqnF6FjhDfqRFxPwc9FMxtwsCUsOYWuAaGikhEYQsl0EsNwAtfmm8Q7wshIybP3SeX2e0yfjoAnnsSxpgGfW9M917lYLf3jRU2+KAsua3Bgp8oiOfUMcQFATuRlywJIfsbEhTnOMsIKlOpJCs+wWxNaZsbunQxtPjygfZE1eBD67KQHoLRRQjkX4KXOy0ykvmeM8wwgojK5sDyhz4c6qCcF5EJc5WuXQlpDp0Pg8HUBBY6PL2rVhPz71RqlGIMoo25fbkeRiilubCmGEa2ByUhugtynknfBaY88nj39xeFtsWunw3RUgArYwHlYsm1xhMWRJ9IlNh6zs5nTI5hrTpBdn2g5p253CjkZsZZL5QdJP0VWdFDhdbiEJ4Fu6nV59gmMLvwN2Hfm861/YzI2sAgJcrIwzUEXdKd5YP2k5Z3IjPccMs15B9g5dzASXthDXwiG65bjGlxTVaagUFYUVc2mnclQRN+rrswPgNqeoxeqqPNRbOguxKGQockQyPwQwjoCRLkVBkVgCtvqoy+tCNOH81V9RHitLxvRZsYIZONiVe9Ym0p+BjmNQtqyxR55w56ry2B93hKVHeyNwMucU6Mm9B7CcDyhtFRU74Uot9odZgoQ4vxc3w/ApQiUYXWBlrBboHM4jk2lAN2mtijp4zp75mPERtz2PUcA4TvRY68v7EMtl2gALVQMZHdfwA2Hg3p+ZYcJQlsLAfc36J7rYKTX
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230016)(7916004)(4636009)(136003)(396003)(39860400002)(376002)(346002)(40470700004)(46966006)(36840700001)(83380400001)(8676002)(4326008)(8936002)(30864003)(5660300002)(40460700003)(70586007)(36860700001)(2906002)(186003)(336012)(33716001)(81166007)(70206006)(40480700001)(316002)(47076005)(86362001)(1076003)(82740400003)(82310400005)(6486002)(44832011)(6862004)(356005)(41300700001)(478600001)(6506007)(26005)(9686003)(6666004)(6512007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:42:01.0455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46acf916-95e6-414b-361a-08da76f909f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2842
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
Cc: clement.faure@nxp.com, benjamin.gaignard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, nd@arm.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olivier,

Thanks, I think this is looking much better.

I'd like to know how others feel about landing this heap; there's been
push-back in the past about heaps in device-tree and discussions
around how "custom" heaps should be treated (though IMO this is quite
a generic one).

On Fri, Aug 05, 2022 at 03:53:28PM +0200, Olivier Masse wrote:
> add Linaro secure heap bindings: linaro,secure-heap
> use genalloc to allocate/free buffer from buffer pool.
> buffer pool info is from dts.
> use sg_table instore the allocated memory info, the length of sg_table is 1.
> implement secure_heap_buf_ops to implement buffer share in difference device:
> 1. Userspace passes this fd to all drivers it wants this buffer
> to share with: First the filedescriptor is converted to a &dma_buf using
> dma_buf_get(). Then the buffer is attached to the device using dma_buf_attach().
> 2. Once the buffer is attached to all devices userspace can initiate DMA
> access to the shared buffer. In the kernel this is done by calling dma_buf_map_attachment()
> 3. get sg_table with dma_buf_map_attachment in difference device.
> 

I think this commit message could use a little rework. A few thoughts:

* The bindings are in a separate commit, so seems strange to mention
  here.
* "buffer pool info is from dts" --> I think you should mention that
  this uses a reserved-memory region.
* sg_table nents and genalloc seem like low-level implementation
  details, so probably not needed in the commit message
* The usage steps 1, 2, 3 aren't specific to this heap - that's how
  all dma-buf sharing works.

> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> ---
>  drivers/dma-buf/heaps/Kconfig       |   9 +
>  drivers/dma-buf/heaps/Makefile      |   1 +
>  drivers/dma-buf/heaps/secure_heap.c | 357 ++++++++++++++++++++++++++++
>  3 files changed, 367 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/secure_heap.c
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index 3782eeeb91c0..c9070c728b9a 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -20,3 +20,12 @@ config DMABUF_HEAPS_DSP
>            Choose this option to enable the dsp dmabuf heap. The dsp heap
>            is allocated by gen allocater. it's allocated according the dts.
>            If in doubt, say Y.
> +
> +config DMABUF_HEAPS_SECURE
> +	tristate "DMA-BUF Secure Heap"
> +	depends on DMABUF_HEAPS
> +	help
> +	  Choose this option to enable the secure dmabuf heap. The secure heap
> +	  pools are defined according to the DT. Heaps are allocated
> +	  in the pools using gen allocater.
> +	  If in doubt, say Y.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 29733f84c354..863ef10056a3 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_DSP)          += dsp_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_SECURE)	+= secure_heap.o
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
> new file mode 100644
> index 000000000000..25b3629613f3
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF secure heap exporter
> + *
> + * Copyright 2021 NXP.

It's 2022 :-)

> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/genalloc.h>
> +#include <linux/highmem.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +
> +#define MAX_SECURE_HEAP 2
> +#define MAX_HEAP_NAME_LEN 32
> +
> +struct secure_heap_buffer {
> +	struct dma_heap *heap;
> +	struct list_head attachments;
> +	struct mutex lock;
> +	unsigned long len;
> +	struct sg_table sg_table;
> +	int vmap_cnt;
> +	void *vaddr;
> +};
> +
> +struct secure_heap_attachment {
> +	struct device *dev;
> +	struct sg_table *table;
> +	struct list_head list;
> +};
> +
> +struct secure_heap_info {
> +	struct gen_pool *pool;
> +};
> +
> +struct rmem_secure {
> +	phys_addr_t base;
> +	phys_addr_t size;
> +
> +	char name[MAX_HEAP_NAME_LEN];
> +};
> +
> +static struct rmem_secure secure_data[MAX_SECURE_HEAP] = {0};
> +static unsigned int secure_data_count;
> +
> +static struct sg_table *dup_sg_table(struct sg_table *table)
> +{
> +	struct sg_table *new_table;
> +	int ret, i;
> +	struct scatterlist *sg, *new_sg;
> +
> +	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
> +	if (!new_table)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
> +	if (ret) {
> +		kfree(new_table);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	new_sg = new_table->sgl;
> +	for_each_sgtable_sg(table, sg, i) {
> +		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
> +		new_sg->dma_address = sg->dma_address;
> +#ifdef CONFIG_NEED_SG_DMA_LENGTH
> +		new_sg->dma_length = sg->dma_length;
> +#endif
> +		new_sg = sg_next(new_sg);
> +	}
> +
> +	return new_table;
> +}
> +
> +static int secure_heap_attach(struct dma_buf *dmabuf,
> +			      struct dma_buf_attachment *attachment)
> +{
> +	struct secure_heap_buffer *buffer = dmabuf->priv;
> +	struct secure_heap_attachment *a;
> +	struct sg_table *table;
> +
> +	a = kzalloc(sizeof(*a), GFP_KERNEL);
> +	if (!a)
> +		return -ENOMEM;
> +
> +	table = dup_sg_table(&buffer->sg_table);
> +	if (IS_ERR(table)) {
> +		kfree(a);
> +		return -ENOMEM;

nit: You could return PTR_ERR(table), in case dup_sg_table starts
returning other errors.

> +	}
> +
> +	a->table = table;
> +	a->dev = attachment->dev;
> +	INIT_LIST_HEAD(&a->list);
> +	attachment->priv = a;
> +
> +	mutex_lock(&buffer->lock);
> +	list_add(&a->list, &buffer->attachments);
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static void secure_heap_detach(struct dma_buf *dmabuf,
> +			       struct dma_buf_attachment *attachment)
> +{
> +	struct secure_heap_buffer *buffer = dmabuf->priv;
> +	struct secure_heap_attachment *a = attachment->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	list_del(&a->list);
> +	mutex_unlock(&buffer->lock);
> +
> +	sg_free_table(a->table);
> +	kfree(a->table);
> +	kfree(a);
> +}
> +
> +static struct sg_table *secure_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +						enum dma_data_direction direction)
> +{
> +	struct secure_heap_attachment *a = attachment->priv;
> +
> +	return a->table;

I think you still need to implement mapping and unmapping using the
DMA APIs. For example devices might be behind IOMMUs and the buffer
will need mapping into the IOMMU.

> +}
> +
> +static void secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +				      struct sg_table *table,
> +				      enum dma_data_direction direction)
> +{
> +}
> +
> +static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct secure_heap_buffer *buffer = dmabuf->priv;
> +	struct secure_heap_info *info;
> +	struct sg_table *table;
> +	struct scatterlist *sg;
> +	int i;
> +
> +	info = dma_heap_get_drvdata(buffer->heap);
> +
> +	table = &buffer->sg_table;
> +	for_each_sg(table->sgl, sg, table->nents, i)
> +		gen_pool_free(info->pool, sg_dma_address(sg), sg_dma_len(sg));
> +
> +	sg_free_table(table);
> +	kfree(buffer);
> +}
> +
> +static const struct dma_buf_ops secure_heap_buf_ops = {
> +	.attach = secure_heap_attach,
> +	.detach = secure_heap_detach,
> +	.map_dma_buf = secure_heap_map_dma_buf,
> +	.unmap_dma_buf = secure_heap_unmap_dma_buf,
> +	.release = secure_heap_dma_buf_release,
> +};
> +
> +static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
> +					    unsigned long len,
> +					    unsigned long fd_flags,
> +					    unsigned long heap_flags)
> +{
> +	struct secure_heap_buffer *buffer;
> +	struct secure_heap_info *info = dma_heap_get_drvdata(heap);
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	unsigned long size = roundup(len, PAGE_SIZE);
> +	struct dma_buf *dmabuf;
> +	struct sg_table *table;
> +	int ret = -ENOMEM;
> +	unsigned long phy_addr;
> +
> +	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&buffer->attachments);
> +	mutex_init(&buffer->lock);
> +	buffer->heap = heap;
> +	buffer->len = size;
> +
> +	phy_addr = gen_pool_alloc(info->pool, size);
> +	if (!phy_addr)
> +		goto free_buffer;
> +
> +	table = &buffer->sg_table;
> +	if (sg_alloc_table(table, 1, GFP_KERNEL))
> +		goto free_pool;
> +
> +	sg_set_page(table->sgl,	phys_to_page(phy_addr),	size, 0);
> +	sg_dma_address(table->sgl) = phy_addr;
> +	sg_dma_len(table->sgl) = size;
> +
> +	/* create the dmabuf */
> +	exp_info.exp_name = dma_heap_get_name(heap);
> +	exp_info.ops = &secure_heap_buf_ops;
> +	exp_info.size = buffer->len;
> +	exp_info.flags = fd_flags;
> +	exp_info.priv = buffer;
> +	dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto free_pages;
> +	}
> +
> +	return dmabuf;
> +
> +free_pages:

Should maybe be called free_table:

> +	sg_free_table(table);
> +
> +free_pool:
> +	gen_pool_free(info->pool, phy_addr, size);
> +
> +free_buffer:
> +	mutex_destroy(&buffer->lock);
> +	kfree(buffer);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops secure_heap_ops = {
> +	.allocate = secure_heap_allocate,
> +};
> +
> +static int secure_heap_add(struct rmem_secure *rmem)
> +{
> +	struct dma_heap *secure_heap;
> +	struct dma_heap_export_info exp_info;
> +	struct secure_heap_info *info = NULL;
> +	struct gen_pool *pool = NULL;
> +	int ret = -EINVAL;
> +
> +	if (rmem->base == 0 || rmem->size == 0) {
> +		pr_err("secure_data base or size is not correct\n");
> +		goto error;
> +	}
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		pr_err("dmabuf info allocation failed\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	pool = gen_pool_create(PAGE_SHIFT, -1);
> +	if (!pool) {
> +		pr_err("can't create gen pool\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	if (gen_pool_add(pool, rmem->base, rmem->size, -1) < 0) {
> +		pr_err("failed to add memory into pool\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	info->pool = pool;
> +
> +	exp_info.name = rmem->name;
> +	exp_info.ops = &secure_heap_ops;
> +	exp_info.priv = info;
> +
> +	secure_heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(secure_heap)) {
> +		pr_err("dmabuf secure heap allocation failed\n");
> +		ret = PTR_ERR(secure_heap);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	kfree(info);
> +	if (pool)
> +		gen_pool_destroy(pool);

nit: I think your order should be reversed here, to match the opposite
order of allocation.

> +
> +	return ret;
> +}
> +
> +static int secure_heap_create(void)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < secure_data_count; i++) {
> +		ret = secure_heap_add(&secure_data[i]);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int rmem_secure_heap_device_init(struct reserved_mem *rmem,
> +					 struct device *dev)
> +{
> +	dev_set_drvdata(dev, rmem);
> +	return 0;
> +}
> +
> +static void rmem_secure_heap_device_release(struct reserved_mem *rmem,
> +					 struct device *dev)
> +{
> +	dev_set_drvdata(dev, NULL);
> +}
> +
> +static const struct reserved_mem_ops rmem_dma_ops = {
> +	.device_init    = rmem_secure_heap_device_init,
> +	.device_release = rmem_secure_heap_device_release,
> +};

What are these reserved_mem_ops for? Setting the drvdata for a random
device seems like it could cause lots of problems.

Is there a requirement to support assigning this SDP reserved-memory
region to a specific device? If not, I think you can just drop this.
Otherwise, I think you need some other mechanism to do the
association.

> +
> +static int __init rmem_secure_heap_setup(struct reserved_mem *rmem)
> +{
> +	if (secure_data_count < MAX_SECURE_HEAP) {
> +		int name_len = 0;
> +		const char *s = rmem->name;
> +
> +		secure_data[secure_data_count].base = rmem->base;
> +		secure_data[secure_data_count].size = rmem->size;
> +
> +		while (name_len < MAX_HEAP_NAME_LEN) {
> +			if ((*s == '@') || (*s == '\0'))
> +				break;
> +			name_len++;
> +			s++;
> +		}
> +		if (name_len == MAX_HEAP_NAME_LEN)
> +			name_len--;
> +
> +		strncpy(secure_data[secure_data_count].name, rmem->name, name_len);

I think it would be good to explicitly do:

  secure_data[secure_data_count].name[name_len] = '\0'

I know it's zero-initialised, but that's done on a line far away, so
may be best to be defensive.

> +
> +		rmem->ops = &rmem_dma_ops;
> +		pr_info("Reserved memory: DMA buf secure pool %s at %pa, size %ld MiB\n",
> +			secure_data[secure_data_count].name,
> +			&rmem->base, (unsigned long)rmem->size / SZ_1M);

nit: What if rmem->size < SZ_1M, or not 1M-aligned

> +
> +		secure_data_count++;
> +		return 0;
> +	}
> +	WARN_ONCE(1, "Cannot handle more than %u secure heaps\n", MAX_SECURE_HEAP);
> +	return -EINVAL;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap", rmem_secure_heap_setup);

Is there anything linaro-specific about this? Could it be
linux,secure-heap?

Thanks,
-Brian

> +
> +module_init(secure_heap_create);
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.25.0
> 
