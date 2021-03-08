Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A38E331612
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 19:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D256E40B;
	Mon,  8 Mar 2021 18:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D05A6E40B;
 Mon,  8 Mar 2021 18:30:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icKzH0YEOkmbII7uPqgwzJXFtx7L9LVWuIPtiCF+eqOt3IfDktd4qAtca5xwEOEapt9maBM+3Vg2gnZLS5MpM9FF+Ig+uNkcAMFbjylkDIvfrW3YalKdF3z8olBYId/HlGF3u/pq8DMAHbiT8d3nKQCE1KXX+Y6Rs9qGDdFmzwuR+4Kd0qi2KmhTld6z49Of7UTuTUcrA6Z4zDQjSyMhn784dFKduhLd1gP6whebeYX1qVcw9OMtlAnd1kkNynvFEqu9/A7FzwwVO9l88DeplyJjSHr8p5FWQIYVl+UTUIwJenZ9Uy/vk+eFnLW9/p8bqBT1g4CcVd4s/V1GmOqbMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkTsDS1VBRlRmDj4lnHWIdUxmZ1zJAxRFk7Z5AkzEa4=;
 b=RTlub8KdPgtP9PuhbEgAEjHgOPziMfXfaAcfqZjgeuHoNMZgeKexiMVsSUJKWUngIiTetNE01kkjz87BSReMCdYwm6CARo+nAfgmtQXjUkkB4gMMKCYbcu4F1X0Bg0N6Rvf/n5oYem+BS/BrrN0htRDUx88P9eOrTyT8UG1S9EP8OfhIh4zGlOKn/53+lKM9A44b00lID2/7UM+KtRAqH3Q9Ur1kw0TVdrYdSliguqv3TfXcyue1aJDPTHbYR8Um4im7VqNAV/oen/b5diD5q88JMyijxsNjaWfl7j6YFObIrHORSLbtvp+b+aZ36mlWmoROsWFI8zK4HqI7qfquNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkTsDS1VBRlRmDj4lnHWIdUxmZ1zJAxRFk7Z5AkzEa4=;
 b=1gcBWPSDvjWmXpV/Lvb7FmIXSkcvG8X9IX1AePf8+5xiGE0bdNc7LO5DXdT2NhTWpv2x2QEQhq8oTAv0Ytg3IZT5QJOSb7BZ8uaRWZiMy38jp0Xmw4KgSRg8bxJ0v1jbh8yAJpN8ZO5683vlWUpS/fIdeeIQ6P5WY4OvUWaUBi8=
Received: from DM5PR17CA0065.namprd17.prod.outlook.com (2603:10b6:3:13f::27)
 by DM5PR1201MB0156.namprd12.prod.outlook.com (2603:10b6:4:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Mon, 8 Mar
 2021 18:30:22 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::7e) by DM5PR17CA0065.outlook.office365.com
 (2603:10b6:3:13f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 18:30:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux-foundation.org; dkim=none (message not
 signed) header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 18:30:21 +0000
Received: from rcampbell-test.nvidia.com (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 18:30:14 +0000
Subject: Re: [PATCH v4 2/8] mm/swapops: Rework swap entry manipulation code
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <bskeggs@redhat.com>,
 <akpm@linux-foundation.org>
References: <20210304061645.29747-1-apopple@nvidia.com>
 <20210304061645.29747-3-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <4cf3d4c5-b83e-902f-d1c8-a96248ce2ce8@nvidia.com>
Date: Mon, 8 Mar 2021 10:30:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304061645.29747-3-apopple@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c031f529-f106-4e45-bd4e-08d8e2603bb4
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0156:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB015688941E6B4778D1D7945BC2939@DM5PR1201MB0156.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCwLU+sYVDUIadGblpO/LSPSkbvheVSwpj69kxv0dsRWYRhYGRWj8YaEyY3vZGk1crvPkKDUuxucDhMPtYcU4wm6ei6ZdPCkxDFd+AkF1ZDq2dtTCbeZnBalzI5KowAfUYS7GfJzZd4xwsmUkEjqdpNzOVZjq/5f5Bf6nNr11/55cUK3qmNBIK65BKeRTV61VD2ZO8Q3WcfUy27HuQoNHS8Tv5W08ljlxGQbF8yFVxSDZUs38fPipN3+Dnw+b6Lr8ozbKC2lCd4ay5Prbkjd/9EIoaKiszt6DmrOBNAl47b42u5qyU15Jnk2M+Z3AE4I0LrZFQzAVhf13QxxPTjWn9E0mt1cAg6gyHWvRMNxeRE17YEKH5f0tpSiubHQcSQOTklBAS2UzdnqZUQgfi5+rjon3FdNH0OhciVYPrScJ9XJ/TFpuKN5i7ur0mrulwBTClt86xHqtnubzOBxNanHlv9eze+oxq5aSoTzC6bx+cuo5X1oMuV+MxyZEEb+cG+9tYbLTQ9v/954SbbaOxKf0R7VUUtY4phjldkjlLiHCBUs0YI5+RQZQm4Jq/PgxkMxnwMgNsd/gxRWVHWuaucQjF7TEUha9dp6dB5hW2CiKz36N2lgvNPPTf7pJy6ZQlAbqCDmdV7+JuyoaSP/vrc1iNNHm3J/UUqS1uZ/FT7VaikVs/cYCRQ1eAbwd9PI/AYUdjyAX02PuR0QR88zfbJ+lw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(46966006)(53546011)(31686004)(336012)(2616005)(107886003)(7636003)(36906005)(82740400003)(86362001)(36860700001)(478600001)(82310400003)(34020700004)(4744005)(31696002)(5660300002)(54906003)(4326008)(110136005)(47076005)(356005)(7696005)(2906002)(26005)(7416002)(36756003)(16526019)(186003)(8936002)(8676002)(70206006)(426003)(70586007)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 18:30:21.8314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c031f529-f106-4e45-bd4e-08d8e2603bb4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0156
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
Cc: linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, kvm-ppc@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/3/21 10:16 PM, Alistair Popple wrote:
> Both migration and device private pages use special swap entries that
> are manipluated by a range of inline functions. The arguments to these
> are somewhat inconsitent so rework them to remove flag type arguments
> and to make the arguments similar for both read and write entry
> creation.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Looks good to me too.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
