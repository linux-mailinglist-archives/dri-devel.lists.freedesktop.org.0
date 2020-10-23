Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD04297984
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 01:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B6E6E84F;
	Fri, 23 Oct 2020 23:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E1F6E073;
 Fri, 23 Oct 2020 23:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMbLNnZY+/mR+5N2ob2Y3IMcjdPJZjNdBidFgeFQ551+4HHxi+c5Tebri/L/R6hiXnbzeDPPouWYAR9RmpFKd4ltEgzA347HQxNsPXODdj/5fZoJwK0uM3BW76VjlnJtxMjRH1mJTqQmrvM3KfyBl+GT31+IoYlItOeS50bKL6AHYZb+i8rGZR/Vx5CDq40B4H2sXIDjF6hNedFF2fHaM6u2HrVA3zJGYbl4JSrtPYp/Ksf4zOfHQM18Gl0yGOma58hiq7c6/7a9vfGUtYUg/srRJvUAYvML8xuV1lESLoT5RniUR8ygialOERdbRCHZ+s0BwKw0RVqJJB48+S+hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7rUNzBv7Ovn3jY5Z4Y+VP3qCSJhOqSSskSMbj0vU2I=;
 b=O2wZSbirZauApI9650ooPJNWNBug0raqyzWFuVPD+Kgu42bPjc/yHQzqmbmXaXALFcg/pDXDVg/v+rMwqYFKY35RCBMzJbSs/8+nRf6K89qzTiIMlmbLi5MQ95kNdvN01WDkuh4S8KLFxJMwtU+D95eok/NYvhIvG95adCsAorTNk/6gLGyBEhKuwKzLLXZ2GokMJiexFIgo3+zA58EiO8TTTgj8fP9SWZGFvBaXmUiPgzfNTOEIj++wYPwkp9URK9GjwL7v0DwH+ZhhW6Z05aKMt6fH+H7kqa5+jG1rNBq+w8u/o4on9VtHZeoIc2WZ13pNxxRxis9GkNx2PEDS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7rUNzBv7Ovn3jY5Z4Y+VP3qCSJhOqSSskSMbj0vU2I=;
 b=nnKoMkSxut1i7kwTjI6WbBytgFGtVp+NmBGFsnbWsTh4qtq1oNHi2bTE3wwx+eGw/JpYjXg4sPAJb/rghNJR47X4DTI/SNhE3QbyhscdZYkgrmL1kBS/bq5ylFEnuwE0DTDAmWKv9kI6WpIWR3Kdn2I1+xlI80aE0d8nOFNHwc0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (10.255.175.85) by
 DM6PR12MB3178.namprd12.prod.outlook.com (20.179.107.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Fri, 23 Oct 2020 23:16:42 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3477.029; Fri, 23 Oct 2020
 23:16:42 +0000
Subject: Re: [PATCH 0/3] drm/amd/display: Fix kernel panic by breakpoint
To: Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org
References: <20201023074656.11855-1-tiwai@suse.de>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <1d3e22ef-a301-f557-79ca-33d6520bb64e@amd.com>
Date: Fri, 23 Oct 2020 19:16:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201023074656.11855-1-tiwai@suse.de>
Content-Language: en-CA
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::13) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.35.64] (165.204.54.211) by
 YT1PR01CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Fri, 23 Oct 2020 23:16:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a0bf8ac-5911-4459-c47f-08d877a9b305
X-MS-TrafficTypeDiagnostic: DM6PR12MB3178:
X-Microsoft-Antispam-PRVS: <DM6PR12MB31785147DB7FADDDEDF00C50991A0@DM6PR12MB3178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMQA1s1QMS8QQYzSTcyQJ4lJkHxFXimd/Cp0CB2ejXi3kBpmxXxodvHcWiu0873CmmQ0u/bzPhXn7x76r0toO1BcAAld+J9FCLFdAjIWdayMMqHlLZR14v+xgMhMEnREFhpVQQzQveQzEEhpYLxfD99Lqpff2BKXhFg6YZXcPaAX3/6CBzFldtEpj0Z4AUmRy4Z/YLOK6kMMOyKmRNNXIF+Xpa0jwn7GXvFSC6dSUK0k7lWfcMBg5OihOW+9H01DJ8Am1XtNAP4soOz4sw6HfUgO+6HHtgHlMU5YwEoK7U5HxC8XuQUg0QZhsJvaDlGbXiyy6Ck33Kwqyioxw0E3FgAnCgDiaYuwtBxqFS7l7YJ6bNFyaLbBZLKes9wOMFcG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(4001150100001)(86362001)(31686004)(6486002)(5660300002)(4744005)(316002)(16576012)(478600001)(4326008)(956004)(186003)(16526019)(44832011)(2616005)(66476007)(53546011)(66556008)(83380400001)(66946007)(26005)(2906002)(31696002)(8936002)(8676002)(52116002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7dbEk3JnBpW2f/UekSLoEVuOi6XKccGc6GMl32hH41lzr/FWZv9O3C6eLbmTOkmYPutYbECR+22/PSRuB3ktNxK8xdga4cl8YKQyNscW2HQUHWYb3OlZccgdgBT1Vh9h2grwYz0iD0v5wuWG3jjafXQaIXWV8qsYkRNpMbep8ZLP9caa3qKoM5g+tSH96/5sSqCNHTowCovagP0TS8KdmHt+ihKwvw0+yqdug6ZCKjteRKt4Bxz0HJ8Ho95tMTZV60dbV6EvCNcCX0jGvNzRgclQLqYW57Fs8bC9pd9/7b57b7r6dHdFZJUQEHz6vwY49kCs5jQOx2T7Fv2mHK1sU3JkBRzdDUl9OnTdMK6+iEf16PCXy9J0btFnNWnT657CiKQs1TPMytFao48RQqAiHfAeSOn5CwkenHkiiy+rvQD3TPLZFz3p3Et1B8hOyCOdJMBsxzVy5YZwHzay7arHkmKem8jXUUS5K+Z1Q/5q7zFtKfXcgxBU8TXFkKrFkVs6Mo+oXqVQJB5hGYu/zfrJwTGntsSZY5xB2sM9Gvxyzo7na9U16bJW5MxEtpRiymx94Q23Xn55W4JYriPSB6xkdBxX1hNBN3U5RZKEgj3KqGzjVB8c7421v769Hph8xaEOuKLuEAGi8dTPNwdOUnW0xg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0bf8ac-5911-4459-c47f-08d877a9b305
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 23:16:41.9527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vllPQH3w3wENFP4jqtOndXMRL5DWJoJ6zP4BqgLSMbXSlgnUwuVgILYyhSdKz7Z3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3178
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-23 03:46, Takashi Iwai wrote:
> Hi,
> 
> the amdgpu driver's ASSERT_CRITICAL() macro calls the
> kgdb_breakpoing() even if no debug option is set, and this leads to a
> kernel panic on distro kernels.  The first two patches are the
> oneliner fixes for those, while the last one is the cleanup of those
> debug macros.

This looks like good work and solid. Hopefully it gets picked up.

Regards,
Luben

> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (3):
>   drm/amd/display: Fix kernel panic by dal_gpio_open() error
>   drm/amd/display: Don't invoke kgdb_breakpoint() unconditionally
>   drm/amd/display: Clean up debug macros
> 
>  drivers/gpu/drm/amd/display/Kconfig             |  1 +
>  drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c |  4 +--
>  drivers/gpu/drm/amd/display/dc/os_types.h       | 33 +++++++++----------------
>  3 files changed, 15 insertions(+), 23 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
