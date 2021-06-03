Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CED399CB0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329AB6F428;
	Thu,  3 Jun 2021 08:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261F66F428;
 Thu,  3 Jun 2021 08:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSH+qaX1SnOlyEmcoVSaA9G3P7nYNQtYbYojObgkB9lRIdTKplfV5MkLgWelTkAVMxmczou9mDPwZQMG2ZPtFSqUC23resEf4Ee68Kkvaz490UNjxkXa4e4g4YLHeovGCOZAOsaQTV9jE9j0tjRAAkQxqQrXYq4Izp3gA/5rn7i6sgBCCh7PEF0tWTs5qTfSEw3xeRb8m8+seFmopC9OKYEL1rZNLafQWcbrMWov+QdvIEbxqMFYJSlxFfNYh9S2GM3oSY5wiNTWKvgV3WATGqe8XmWDpnqqBflUSguCHPe0/FXv5yafzF04AQfrdE1RFmqdx+DsxwmtpiNZ3PABQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL2uzsbXBWrjP+SIFPUn7wbHLp3iwHEEMohKzHLy/z8=;
 b=f3557TstwwD2E68SctVrzDnjAvJqaTBbeq0f2KoTeorMcdGJzbvTIOz7clvUTgpUXkqAD/SK1qOb2TfOwDtUHiMsi8a+vUV3fCH0gg8dGDE/vHpno3Q7R84t7QciZ16p91dHbohSvLkCd19ZzdBE+VI0vwCFH+nYBh/LCo3uS/MB8RHyKvVtGKNu3HeYmAdMkWrlTb4qaU9tlbm+ve2AYpHCPIoB4sEH7PAKWKleGHFu6m77Y9/QplTWFc1yJJG5X65z+g8xva9fuuPy75LypmiT3MeYPhgYeMg+Hz4HCsCiBnHt4x/84+poUfJ2PpCWFsRtHdsQJaWPf7e3Z6NFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL2uzsbXBWrjP+SIFPUn7wbHLp3iwHEEMohKzHLy/z8=;
 b=KxoO2vng76C7u+1AdtI03U8ULyIuuM4r2D/EmAl1t9mH4lZGz44ei3VlDcoHvz5XY639QN4eV4I5KQgm6u93Kz8t7GqwyemMVC8eCT4ZWD4kruYhdw5zPRpc+Dy0Dd2uCzhQWcGCzJ+/h2Cl2jYpJ6ZtivRO7ckVaoQ97qQixa30xqy//qeTt4Ax+Zh0+5kXYRAiYIYRNqOFlrP/a6B6h7Rt9bNktVURRuRQ9fUNaASGDZFZlUP2j9yWLH1ZUZBgD7+SWSnrVU5bGD3Khc2d/eO5yhwKQyoojRj974s7x0Ed541a3XsczZ9gAhIcTZX2AOxJekrkugjb6UEnZ4kgcA==
Received: from BN9PR03CA0410.namprd03.prod.outlook.com (2603:10b6:408:111::25)
 by CY4PR12MB1622.namprd12.prod.outlook.com (2603:10b6:910:f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 08:37:17 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::a2) by BN9PR03CA0410.outlook.office365.com
 (2603:10b6:408:111::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Thu, 3 Jun 2021 08:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 08:37:16 +0000
Received: from [10.2.95.151] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 08:37:16 +0000
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
To: Balbir Singh <bsingharora@gmail.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
 <YKzk0ILRsyazMs2W@balbir-desktop>
 <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
 <YLdGXSw0zdiovn4i@balbir-desktop>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d1cf8ee3-3bad-f31b-770a-26d03d457efe@nvidia.com>
Date: Thu, 3 Jun 2021 01:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLdGXSw0zdiovn4i@balbir-desktop>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cca83f86-ae35-4faa-f833-08d9266acb74
X-MS-TrafficTypeDiagnostic: CY4PR12MB1622:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1622AEB3D5E1A894A089B665A83C9@CY4PR12MB1622.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BMoTZa8CIFjTNk7JYTPWu7j/MbG0hR/H09hEWXuCsTOU06b0rKYmw22+dKm+a9/tW2pH89C5Mj/WcSvR6lwO2nfBlmt2COYdMywnkOowk699Icqdkmg7CfHvzeuAAf24WDZinnlE5FNMmo2zHSYGGSkmW6pY4Yl1dGifqg+sYXIwairkBhmymtr4nGwZRVD9lOYQAkGsykKsJe8QcWHCiAvN4j7qU3OWUZAZVdc4fU8yZClhGBvqr5RDjKeNPFPSKHQSSe1JRlGT3Uy2zMIurUBaZ/iu23KpkAPnYgIO3chW7KTOi6OI+0DEoKSYHmCGcstnKmYWUwBCteH9F7dWS0zz+RbaVIr2976zriT2o8l3vuMQg/7y4S4ypSwRTNES+hkIu0KL0odZUF2FC0R+yMPN1NK+VQKLrxj9+ZkYUGEMC+B4QNOmbt+Z1PX/ONQpTn0oTDDG/V1KkJtQFmckbOtzCYXuDWhcEilG8lYdeaDjim+73J+4UtC/Dnkw8hV/yILkyty456NdJIH2kWOzEQVhxjjoAhB75N3evjKyNp4QXQRulunWADWokr8WaIYpg+7ofWNS+6PXgbjFQiCrXqhhwIQFJ5BLEK0AZppzrkiX+81BJLRwkjc0WJL0EidE3X7ABf/1Ay/+hVNl7tnk6+Whq2YUtRQR2/al/EahCk2qgd1W7+Zacw4c6kAQqTt
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(36840700001)(36906005)(316002)(16576012)(36860700001)(26005)(82740400003)(31686004)(7416002)(70206006)(478600001)(5660300002)(356005)(6916009)(70586007)(8676002)(83380400001)(47076005)(86362001)(16526019)(186003)(2616005)(336012)(31696002)(426003)(8936002)(82310400003)(4326008)(7636003)(54906003)(2906002)(53546011)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 08:37:16.9716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca83f86-ae35-4faa-f833-08d9266acb74
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1622
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
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, peterx@redhat.com, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/21 1:50 AM, Balbir Singh wrote:
...
>>> only impact the address space of programs using the GPU. Should the exclusively
>>> marked range live in the unreclaimable list and recycled back to active/in-active
>>> to account for the fact that
>>>
>>> 1. It is not reclaimable and reclaim will only hurt via page faults?
>>> 2. It ages the page correctly or at-least allows for that possibility when the
>>>      page is used by the GPU.
>>
>> I'm not sure that that is *necessarily* something we can conclude. It depends upon
>> access patterns of each program. For example, a "reduction" parallel program sends
>> over lots of data to the GPU, and only a tiny bit of (reduced!) data comes back
>> to the CPU. In that case, freeing the physical page on the CPU is actually the
>> best decision for the OS to make (if the OS is sufficiently prescient).
>>
> 
> With a shared device or a device exclusive range, it would be good to get the device
> usage pattern and update the mm with that knowledge, so that the LRU can be better

Integrating a GPU (or "device") processor and it's mm behavior with the Linux kernel is
always an interesting concept. Certainly worth exploring, although it's probably
not a small project by any means.

> maintained. With your comment you seem to suggest that a page used by the GPU might
> be a good candidate for reclaim based on the CPU's understanding of the age of
> the page should not account for use by the device
> (are GPU workloads - access once and discard?)
> 

Well, that's a little too narrow of an interpretation. The GPU is a fairly general
purpose processor, and so it has all kinds of workloads. I'm trying to discourage
any hopes that one can know, in advance, precisely how the GPU's pages need to be
managed. It's similar to the the CPU, in that regard. My example was just one, out
of a vast pool of possible behaviors.

thanks,
-- 
John Hubbard
NVIDIA
