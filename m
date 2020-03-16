Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1649186811
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 10:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18736E3B0;
	Mon, 16 Mar 2020 09:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EDE6E3B0;
 Mon, 16 Mar 2020 09:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3BWMDmUQNSZYM0FNTzsfYX9g9INCvUuA5V+1llH1TrUyGDeHVJaJq4LaGRbpHTb+5dXo235wIebeFnSAQg+ZbIniLmVEnBYfJp2amBSGR9akgZ2ZUWpT1f7KxE9IhweHYayIO+TdIRJ8tvx+rdK0hfta+SAsuWkru/3VNXQqSr2zww52pyLaNQp2R3Q81Po27xppeMzMwM6sSGzwNRuoAIy02SgkDcAE4BmzMF47Lca7JTvGYd5LiuL7sh3AQ/jIsOXO/4pLFTvIh/RP7OBUxSnNzN1ufGHoMtxhPwsqFAzejAvbbubwYRYVxB58TWQXwKF5fBsUbwNL7pXwZe9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE/ehu1roYRqkIQBrMNoQ+RZ2LuRlp/+thwnapVYCeg=;
 b=Zb9KIfEYn9CIeDpcM3xl5edi4QRKZsYMXzz+7qrSvOOHR5ZOUI2lIQYGWPpamNJbjtSSORUhrBAoxGjVNDdLHLG/Zf/j33CIKrJwzWu4+xDVPJ+2HfmdaazDOIYPTlBosDyzm1dFDczVrKrq9z1MIlqRm4K5aAX3QR0c/JvSuqWzaGm3+3mjI+Tm/zkSEgBtG6uEYfyBBLzvYHdLoeGylMBdq0HmP9iXpOwqOL5ODabLlHKF8dmACVvtcBE1Xp8Vrta9ayUj3eD4cZqM+hfSk91EJJ+C/a6qEz/aqGBfy2iJgDLEjCXNDVRSyU2hTy3alHVnKCoIeOQBqfVVNHREQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE/ehu1roYRqkIQBrMNoQ+RZ2LuRlp/+thwnapVYCeg=;
 b=M3W9OCYujWN6GtXOl4JkmRIbitsCUAWAcEGbel8zWE1LQhKsMPKMSJKpCN58Lwrfa4Wr9vWPDFwRoCUvgTCU0W//15AG9bZ4AQfxqId9gwz9Ib0vI4jmRZrTvnS/v8Efr5f0lumaoYt7gcIQzcIQdegeYqK12OapFQxzK7W8IFs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) by
 DM5PR12MB1593.namprd12.prod.outlook.com (2603:10b6:4:10::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Mon, 16 Mar 2020 09:41:48 +0000
Received: from DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f]) by DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f%11]) with mapi id 15.20.2814.021; Mon, 16 Mar
 2020 09:41:48 +0000
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org> <20200312141928.GK31668@ziepe.ca>
 <20200313112139.GA4913@infradead.org> <20200313121742.GZ31668@ziepe.ca>
 <20200316085642.GC1831@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <eb567569-426a-0845-b443-a20155897705@amd.com>
Date: Mon, 16 Mar 2020 10:41:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200316085642.GC1831@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:205:1::44) To DM5PR12MB1578.namprd12.prod.outlook.com
 (2603:10b6:4:e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:205:1::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.12 via Frontend Transport; Mon, 16 Mar 2020 09:41:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3f1327c-a7c8-4225-4309-08d7c98e3f56
X-MS-TrafficTypeDiagnostic: DM5PR12MB1593:|DM5PR12MB1593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB15933899057C5EF833D5E53D83F90@DM5PR12MB1593.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03449D5DD1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(199004)(2616005)(110136005)(5660300002)(4326008)(31686004)(2906002)(52116002)(186003)(16526019)(316002)(36756003)(6666004)(478600001)(8936002)(31696002)(81166006)(66476007)(81156014)(8676002)(86362001)(66946007)(6486002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1593;
 H:DM5PR12MB1578.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CuLZSlaTdMeSayUaDNpWYMGYQ4Koo8AMZ7G8vkTDQYFW8J/jFj6Qa5uVCRBYcEfNr+AJJ8xtw3OJNvgUrQlHYVVU8BRu7D+pQnkekGwlkhDj03sucbyWZzktGQ/ktENFiQmMVmIJNYZsD6936fG91Rmn45Ue69b0kNPsY0f8B07u1LglZTF625blOIyh5M3DXIgDoY6b52GiZxqW0gFAKM6/+yMGu4EgVIYbNlix5riWy8k306ORIuaC9JnYJp3x8px7utAWRsi8LKl+gvBBFXaFwc39SZLrwyErfla5QLL2IpMu3MGIxlWM6ToAuBwVLj91EH6mbiOyGYDXSLucK+VJr2zwIG+TRuafwmLp7yLeXxBoiqao68cp3itedkYfJsMwNd6WQ3C0rk3QpxZRYnzi90LlZh0LbxrZYwB8WjEgtigQVJKmgL0Td2CxRKm
X-MS-Exchange-AntiSpam-MessageData: D3I2axjs0aokLlh64gy5DIOCMwyZld//r8xbziSbaBLahNsWmG2sy4jel3uOJ8qk5OBCYkgut+CDCmb4fpvsQcwcm9ABgfoVhGQNRQFLUP6Ed2I4PU3fw5nGou+O/w7pDF4fobSVL9vuoUdP3NoO/aLz2wUnxKZ62+3TVRMyt/qd+m12x0vU/75g9TvZNCAbGmQY1jsC9S5c8dnb4l1hGQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f1327c-a7c8-4225-4309-08d7c98e3f56
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2020 09:41:48.5949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSzmZQjxDdLhuiMuSaU4W38H3Kh7ZveDP5R3q9shkPYhMIHo6IxQ/bAqRoRjRUGg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Logan Gunthorpe <logang@deltatee.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.20 um 09:56 schrieb Christoph Hellwig:
> On Fri, Mar 13, 2020 at 09:17:42AM -0300, Jason Gunthorpe wrote:
>> On Fri, Mar 13, 2020 at 04:21:39AM -0700, Christoph Hellwig wrote:
>>> On Thu, Mar 12, 2020 at 11:19:28AM -0300, Jason Gunthorpe wrote:
>>>> The non-page scatterlist is also a big concern for RDMA as we have
>>>> drivers that want the page list, so even if we did as this series
>>>> contemplates I'd have still have to split the drivers and create the
>>>> notion of a dma-only SGL.
>>> The drivers I looked at want a list of IOVA address, aligned to the
>>> device "page size".  What other data do drivers want?  Execept for the
>>> software protocol stack drivers, which of couse need pages for the
>>> stack futher down.
>> In principle it is possible to have just an aligned page list -
>> however the page size is variable, following certain rules, and today
>> the drivers still determine the correct page size largely on their
>> own.
>>
>> Some progress was made recently to consolidate this, but more is
>> needed.
>>
>> If the common code doesn't know the device page size in advance then
>> today's approach of sending largest possible dma mapped SGLs into the
>> device driver is best. The driver only has to do splitting.
> The point was that drivers don't need pages, drivers need IOVAs.  In
> what form they are stuffed into the hardware is the drivers problem.

Well I would prefer if the drivers can somehow express their 
requirements and get IOVA structures already in the form they need.

Converting the IOVA data from one form to another is sometimes quite 
costly. Especially when it is only temporarily needed.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
