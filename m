Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800838F78C
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 03:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356146E99E;
	Tue, 25 May 2021 01:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DDB6E5C1;
 Tue, 25 May 2021 01:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnWAYq2DYSIYW6iOeOviLR3oXCMJJJZF61V9KKDvU2QxUV79f78Od4x9Z17QFuYS5TThUQM6Dzh5/bVaSp8eqTObGKRtlbsVjVbhBmqqIYXnI3oKCF+qcSbCuFMdaTvgVOg+90zKr+fhRYd/TZSaszikGYWunuCo6urGnOKmH2vBCEyAix2/WHNcpS0dhI2lMI2lyDZ/hYJpYaPQprogJBqRIDqrjDDKLNimJ+mQ9v+6vWecWTtc0oPPMDNe/czs2WhFnxgAmY+fFTPqR4prPRm0Z4ccn+yxYaqp2X4ok75KivYpgxg5ujVhoj03pVtzBDr65yhExOVIrCimLjoXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs77B8WKghey5N9TGirCGUFv3BoOnZwqhcRQDDgtnhg=;
 b=KzdlXscX7eNW36PtXjZEj5vvObwIm7wTy/0PQiEbnhSBJtbPviEp9OV5IKauYSFFFQe/WmarX5A/57T7t//SoqoniqJYQ59nW6NE8Pbi4qzMhu8RabW2NhwstVixnpbCdMEhYm4FC+O971oyPjSCp+MybnXaBCpD/sDcDG9ZAWSptm0j27M2Dh83i8RZ/eTUMsJk0EBvHrljdiMr7WjC4yx7cnAGjKx4sadplUw6ksnfCP3vBnPH/KdDx9eSADwcgI+ut8AvQWQrOqDuUCtu4JRQ9YdI/O+mobY/7jIJ5HCF1ICCtcGtuhTMUFTcY6NQPBKo/j7QVDjGNpatYfCR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs77B8WKghey5N9TGirCGUFv3BoOnZwqhcRQDDgtnhg=;
 b=dwhM71PfOMoYhlei+j+YI/1DtH1ZMvS5FsECTAR4IJBk9yfnvsgKngBJfA3QCTiR1yc8sLqV70JlqY2I7osnMvWKwFWGU9RMjCYy5EnhB72c6TNsVhvsRCNI9q9eaRsfRWw/uj8kriRbIXxi/eahv9YtrbqRc9TDX99Mkesy00zYLyVOOgLGRNyFqgWcN+9DNSdv1iWweAcVLLXkWsCBiM7sGR1oeeT5nL9bNZ98nUnbKBYrhTVFcz5mQlv+Ciuh2BpLF8VMBL/uEN/DgajOVz0b8vRGGBCK4G61Wma+BGRX8V8GmkZFKHzhCl1DBbnojHQB36G5UUoiiOf0ISVLwQ==
Received: from BN6PR13CA0009.namprd13.prod.outlook.com (2603:10b6:404:10a::19)
 by MN2PR12MB3008.namprd12.prod.outlook.com (2603:10b6:208:c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 01:31:32 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::ad) by BN6PR13CA0009.outlook.office365.com
 (2603:10b6:404:10a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Tue, 25 May 2021 01:31:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 25 May 2021 01:31:32 +0000
Received: from [10.2.60.51] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 01:31:18 +0000
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
To: Andrew Morton <akpm@linux-foundation.org>, Alistair Popple
 <apopple@nvidia.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <ccedcc53-ead0-a482-1ef0-3702cc82faef@nvidia.com>
Date: Mon, 24 May 2021 18:31:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68d0f4be-31ec-4eb6-cf32-08d91f1cd3fe
X-MS-TrafficTypeDiagnostic: MN2PR12MB3008:
X-Microsoft-Antispam-PRVS: <MN2PR12MB30081116ACC7DF89952AC5F6A8259@MN2PR12MB3008.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Juozi7ME+ONBjhp5tGi+YsTC2SnGiXBm0WFPFoIebctRSbnDcFsi9wr9Vd3rDcZjZ79ntlcuQrAS8/Us29kEoZUjbshnmvmMOw6NDielFYfRmsUCVTxsr4FJZPu2/C84deeW4vlvixAianqJUJ7FPFGDY77VIm3tXTCL/rmsF51omlDuu5GHcNSFEtB1hIFRG0tAEYbn2XY5LLgpqKpXA7CJadMJ/GwkoE2PL5bKxGbVAbEsAeHG66wc26UQg4N3HwbF7vx3ncjlbw+XiY/q6HN7P+bOi+pQ84FmIGPsg8mUKJF+jXYlWX1dzdvg5M7Tjm5j1Ba1ev0ORyXFdrA/Zgv6m19/uJGOCnw8W3FXZ5KVlFDgEeUtzz5P6E1e1AF0pcmPr4CxIkBp08IJQZeIVgeo+agF2a1PAxcKPyPA8gvc6oGYOFibvcPQt3gbk+pS8AtmxQUZwKAqKuEB45o7FTNVSOOfR/30hUrkbp4NI16fwA5dcjIg/+4xBFvUMXEJrYqoJFVZGH9SiAJAaTJLQXlfT2YWOx+bDbcpK7zgMswcgULrPUAwDvUdQcfRgDRcU906f4wbEiWKlkhBxst8wPtqQJQJRIZ6dHFj7teNWnGqsSd9QVWrJSbgaFhL61pTmvNfKPmH818vFUvTLAJkE0QDDQwts7p/YcOMcPKhEDFkWFBTdkGvpNJeZPFZYjrT
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(70206006)(70586007)(86362001)(36756003)(16526019)(186003)(110136005)(82310400003)(82740400003)(36860700001)(356005)(2906002)(5660300002)(47076005)(54906003)(8676002)(31686004)(53546011)(426003)(7636003)(83380400001)(336012)(7416002)(6636002)(316002)(26005)(16576012)(478600001)(31696002)(8936002)(36906005)(2616005)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 01:31:32.2315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d0f4be-31ec-4eb6-cf32-08d91f1cd3fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3008
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, peterx@redhat.com, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/24/21 3:11 PM, Andrew Morton wrote:
>> ...
>>
>>   Documentation/vm/hmm.rst     |  17 ++++
>>   include/linux/mmu_notifier.h |   6 ++
>>   include/linux/rmap.h         |   4 +
>>   include/linux/swap.h         |   7 +-
>>   include/linux/swapops.h      |  44 ++++++++-
>>   mm/hmm.c                     |   5 +
>>   mm/memory.c                  | 128 +++++++++++++++++++++++-
>>   mm/mprotect.c                |   8 ++
>>   mm/page_vma_mapped.c         |   9 +-
>>   mm/rmap.c                    | 186 +++++++++++++++++++++++++++++++++++
>>   10 files changed, 405 insertions(+), 9 deletions(-)
>>
> 
> This is quite a lot of code added to core MM for a single driver.
> 
> Is there any expectation that other drivers will use this code?

Yes! This should work for GPUs (and potentially, other devices) that support
OpenCL SVM atomic accesses on the device. I haven't looked into how amdgpu
works in any detail, but that's certainly at the top of the list of likely
additional callers.

> 
> Is there a way of reducing the impact (code size, at least) for systems
> which don't need this code?

I'll leave this question to others for the moment, in order to answer
the "do we need it at all" points.

> 
> How beneficial is this code to nouveau users?  I see that it permits a
> part of OpenCL to be implemented, but how useful/important is this in
> the real world?
> 

So this is interesting. Right now, OpenCL support in Nouveau is rather new
and so probably not a huge impact yet. However, we've built up enough experience
with CUDA and OpenCL to learn that atomic operations, as part of the user
space programming model, are a super big deal. Atomic operations are so
useful and important that I'd expect many OpenCL SVM users to be uninterested in
programming models that lack atomic operations for GPU compute programs.

Again, this doesn't rule out future, non-GPU accelerator devices that may
come along.

Atomic ops are just a really important piece of high-end multi-threaded
programming, it turns out. So this is the beginning of support for an
important building block for general purpose programming on devices that
have GPU-like memory models.


thanks,
-- 
John Hubbard
NVIDIA
