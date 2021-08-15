Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D043ECAF8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Aug 2021 22:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AE289C3B;
	Sun, 15 Aug 2021 20:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91D389C3B;
 Sun, 15 Aug 2021 20:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ablOIq9P29MoZEoXbLHAv66EuSUy52jKJLSw1alArs6pr227WhfFBEZVTaoH7wuMOpHug4XApw1rPs4aJUjBkpWOkXX1LKlgPGQ+X1cIo4NxeUxHciffcxjG8amiiepMjvaXb3Yxt53Ee1NsqptHSbPFJxBbWppIVHeyqylxRGMSrVgTBMCHHuOqxJIMr92ri7OnoO5UgkLqzt63qJEWJJa7KQe70eEuqVBd5J80VJdNIILawRst22lK+NRQNSs0vF7Gk4YCTkBPhAR2HYEpFDoUQ9aG0SUnnS1ucfq82yXkXl/X65PdcMmrY3I4TT7RafG/pZ4tOL/rVska+rHbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjoGSoAVlvydt0Jv/Y5YjpYAlAZSs7uQpx+HqxTaA+0=;
 b=TOFz+RwHez4vrI5xMazAWyKcqerqzSCFZh5stI4iULBSuqrUGjtu1vLU84OhGCi9DN8KtkXtWZHtVDSB/meSm6fGpHXlGjHbaQqVelwMIeGOgdbobtaZjeRLlzOwgVk5lZc38WQhAOLsCOyOplmCEY7xQCXbmKHuON41ko62+LELYtynlDYLil9UV9Msj46p/lVgW0t95nBJP6of9B95CwhXrDFnN9zxF5Azy/Md3jq/nJYiAqlYC6xXK6I3FpSGQ8Nt3WmP6g8e85HMKtDsGl5l9dtLS7pA2kBdNclskvjvdGhR7GAb1CL07n60ZD1Q4/mIFBkgcqvaihpQf4EFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjoGSoAVlvydt0Jv/Y5YjpYAlAZSs7uQpx+HqxTaA+0=;
 b=Kz6O3VF1wdJuFea6jnIOMX3le5+onW/nh7bUy9eKWODsavZCzFXAgCig8tqsZm2g06tm/vJPrO+J41x0nypweyT21nXb8/JYVSNSSJvtW8wkgYwcA72/pLEV1u4crhlGoHrZpDjTg+qJ/E5qk94NGbWCwu6O0tnZmvncZjEShRFuA217VQVSPtzEfknAIFN2fki9qMpDW3WoPwXVZ8qO72sVultwBwTZYEat79bLmrTz9wlP3cHXhNMQxH3ZuGkeExOrsFc+4RTPyVb8NXdJK0k5WOO9s+CrKe3RM6WVBWljds0ihOvMH9VGebvDGi08dy8aAZlgwfPgi8zLOuzIQw==
Received: from DM3PR11CA0019.namprd11.prod.outlook.com (2603:10b6:0:54::29) by
 CH2PR12MB3701.namprd12.prod.outlook.com (2603:10b6:610:23::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15; Sun, 15 Aug 2021 20:40:31 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::92) by DM3PR11CA0019.outlook.office365.com
 (2603:10b6:0:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Sun, 15 Aug 2021 20:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.14 via Frontend Transport; Sun, 15 Aug 2021 20:40:30 +0000
Received: from [10.2.50.190] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 15 Aug
 2021 20:40:29 +0000
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: Christoph Hellwig <hch@lst.de>, Alex Sierra <alex.sierra@amd.com>
CC: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <jgg@nvidia.com>, <jglisse@redhat.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com> <20210815153713.GA32384@lst.de>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <387d5f85-3d15-9a9e-2382-6ce3c14bc6d5@nvidia.com>
Date: Sun, 15 Aug 2021 13:40:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210815153713.GA32384@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7afafabb-95a6-41a5-703e-08d9602cec5e
X-MS-TrafficTypeDiagnostic: CH2PR12MB3701:
X-Microsoft-Antispam-PRVS: <CH2PR12MB37012AA330D0F1F8563B44C9A8FC9@CH2PR12MB3701.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RARcpln7oKj8Vg1g9hXUW4o7bPattvQSInxnh/FzID4QSjx0ujr0/EO786yo54VQ0icGm9ixwwbkn9M2ZeMgqHed4cbfoPmycPITsQdbb1WJ1sIOjbAR0+kwSUoy5wk8xT09NOaByiw7m69ZJlVkutZMsubKXw2Oma6IQdvUIHd/mctRDZqflKApMrWGy/ZeSWoSaZItTuCnQ9+z1tHjt9HV2urSpUYoU6SFxo8hXzez+peTVDBSMZWWksi6ZFAp69Nf8tBZGh4ezOAKf/qRAPEkw6cyaq7Z0DOS+A6GkQ0Px3N2NHin4hGREXCdYuH6f9YjWFSWtFhM2zOOnu1dxJ+5fhw8I4+uC1k/aU6QKVSNfSOtXKAzuc4HOZMyl7K80k5rhnZ3XonGuILBG0IqSUfYHikZ1XFcwMvM8ppMAmwvrRP56/PhWUm2GgeRggWFJ/X3In6lXwOgasn+i8tRRGOg33U+dvH6Vn2MDCvKcQQyYZ+G+Ex/2tiDYtPWP8lJvPuUQGWln3obrk7C9lTZokyUl23HsEdED3YJ72LfcXk70WSlAtgZ93hATCOWGSp6yhcE0iSOxgWo/+DeuVFuEidMNM7JRdJTw4H4BnojzkgRadrAm2iLmlkx0f2YIxEgBz3hIzPyTsJw3Y0rKRYkOLdIqQyHw5CKuq10ZNMxySOkvuUT0jObD52rRV+CQbqToa9RBcPgk5BsB53VLeSx/S1nJkulB7ytn1ogeNt5MQyONXzYfDB5R6du5C7j4Zbv5P7qLIcPuf1w8p8pQSCJ8fOp1p+LedlMS5D89/lm+5OCrKC4/Vw6TimR9O3NtKA
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(478600001)(54906003)(336012)(356005)(426003)(316002)(2616005)(966005)(110136005)(47076005)(31686004)(82310400003)(36860700001)(16576012)(8676002)(8936002)(53546011)(82740400003)(70206006)(186003)(16526019)(26005)(86362001)(31696002)(7416002)(4326008)(70586007)(5660300002)(7636003)(2906002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2021 20:40:30.9026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afafabb-95a6-41a5-703e-08d9602cec5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3701
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/21 8:37 AM, Christoph Hellwig wrote:
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 8ae31622deef..d48a1f0889d1 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1218,7 +1218,7 @@ __maybe_unused struct page *try_grab_compound_head(struct page *page, int refs,
>>   static inline __must_check bool try_get_page(struct page *page)
>>   {
>>   	page = compound_head(page);
>> -	if (WARN_ON_ONCE(page_ref_count(page) <= 0))
>> +	if (WARN_ON_ONCE(page_ref_count(page) < (int)!is_zone_device_page(page)))
> 
> Please avoid the overly long line.  In fact I'd be tempted to just not
> bother here and keep the old, more lose check.  Especially given that
> John has a patch ready that removes try_get_page entirely.
> 

Yes. Andrew has accepted it into mmotm.

Ralph's patch here was written well before my cleanup that removed
try_grab_page() [1]. But now that we're here, if you drop this hunk then
it will make merging easier, I think.


[1] https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com

thanks,
--
John Hubbard
NVIDIA
