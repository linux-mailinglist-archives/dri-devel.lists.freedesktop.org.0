Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D254627A80C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D526E0F5;
	Mon, 28 Sep 2020 07:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Fri, 25 Sep 2020 12:01:04 UTC
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CE46ECAC;
 Fri, 25 Sep 2020 12:01:04 +0000 (UTC)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6ddacb0001>; Fri, 25 Sep 2020 19:55:55 +0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 11:55:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.57) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS)
 id
 15.0.1473.3 via Frontend Transport; Fri, 25 Sep 2020 11:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZlHyC+i40Jx0QCfbC2UcUfkDR2Oqa5QZ538ZQtiw0yD+VqsCk8yKubMnVf46KkeX8Z0Ii8y7BbjLKCnI7Vsvl/mkeVtGma+H4MshL9kl1hi2mFlvMt77PBreqad9CjHIZJQGTk0S8EHT4PE/M5B6ZKVGfl8viejzmsePLgEFj7ASoJeW0M+lFleBPS08jZfFhuywRbHCug1mSuNpSFBRLD1acRNYA/wIX5i4zYNYVTSarcwViWAOSdOBXIWnpzLqkfcVoGIhAiwzPmc6+l5zYokD85jol4bFoT3R6fXhm582ggKVGEoz4+epkd5J25jvopsrjerG3L09VQ9gBQ8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7un/5f7i/od79b7GD2C9iKkz7Uw+RURaayiAbz5t+c=;
 b=DoCfWwb+FVHbSY9Di/tvjG02zgfIEsMJ46wFRJBG0siij4bnfnbulTwDqmgWiKL8skxwPXInkQ6S1pi343WKlXbB2+iu+f0zu9Yu69gfu32ZrWxzdBRoJGcQN60UYaev8gaJ1bfGKw/v2SqSJP4YA4JXM7mVNQ1dmq16ds9oKijrVzAtS4Rbn/UwPj+/VhuAAqL441lZvN1BcI3JWQVNRCxfmLIHFkFmnCuba742mVDy1qG9qt/uaaGsT6x/WWMBk97XhCHnZlj37OCkw6ElRi/7ajPDI2AgNeJsXTxNY4SnnDb8MNWADEPT4Qn8YAJg/fchD9Y7h3tCg6omreos8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB2485.namprd12.prod.outlook.com (2603:10b6:4:bb::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Fri, 25 Sep
 2020 11:55:45 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 11:55:45 +0000
Date: Fri, 25 Sep 2020 08:55:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add
 support in dynamic allocation of SG table from pages
Message-ID: <20200925115544.GY9475@nvidia.com>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal>
Content-Disposition: inline
In-Reply-To: <20200925071330.GA2280698@unreal>
X-Originating-IP: [156.34.48.30]
X-ClientProxiedBy: MN2PR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:208:23e::23) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23 via Frontend
 Transport; Fri, 25 Sep 2020 11:55:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kLmKG-000nOT-6d; Fri, 25 Sep 2020 08:55:44 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c69e17f-6cc8-4a0a-bb36-08d86149efae
X-MS-TrafficTypeDiagnostic: DM5PR12MB2485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB24852EA7682E2D2694D47F33C2360@DM5PR12MB2485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjETh35cKQuGlWia2cc4lJNFoN4EOznj0XVJk8IO3vdGooRPy6jSpYUzKjgug7pe5RVwvKR6fCV/P/KM0VZGJZcUKh/jwbNJGZqhQn7Lb/6y31GCBv+Oa6oH5Z4gjayobEAmLxfOBTW9GOoNYge8kObjsZ3NRvhPE7lnaJER2cuw63/+VsiJmy3PX9PlriiTz1iyX9ZC6Wg2p+QAtQz4UAS3NB4zybvXCrIM/uODWVvNVapaBlqSNQOfV0uw2mI3s2GTp+TlskgYb4LNW9Hgl0qf9r8mWSs9UhI4I2dKKq6UbFGTupSRrZaaASfGNFw6cchQkxWQT56vgoUpd5heNLlTfZSVLeZZ9w47kyIXQtCES6eOivTWgxZE3U55OO3V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(66946007)(66556008)(186003)(54906003)(2906002)(1076003)(26005)(316002)(86362001)(33656002)(5660300002)(36756003)(7416002)(9786002)(9746002)(6916009)(478600001)(2616005)(66476007)(8676002)(4326008)(107886003)(8936002)(426003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: XgbRTfOUWpFzL9fR1edgYoRAxsXKE8ZLpJ3IW3t+l2I2knfFsAYoJHYglty8CVXf4l1ismX0BQZQyfVOkz3Dkpwn+JwInAWShBSfvo9AvYy4oSSWf4WLtl12H6U62iHu1Y4Z+fwus2kQqulVMuSRIB71ThjoRcug7EW4jcuxsh+nI0MQ9yvpauzzuf1rbT7qHWCQBMYLZS3v8zr+hEf2DDDEN7jEvEShM5EKTSZ2jEZxHHCHajb45P4Ar3VFVp4DhpMJm9/iyfIFVv47LAm71V5KdSH6xHUK+5NV3rrSAsE/tgZOv8lipriGX5RLtbq1vbgNximWhaSp2b7mQhQ3yyMuij4DpoJPHiNMqgABrGO6SPu+UxcPxUyF9LGANgSvFesdHxl0/4dyIxnqLM0Xh+xOwdVvzgLm30Kf2ReqcvwIjUkCfRlnmMS37iCxIG+gZUflXNpLPgVrX4rTcIDCu0S4ItlFVUMQwliV/3OWPc0IpjfcbhPlnTekzx/0BIzLplW0KkNUGoyG15uWibWDrF6MnK3IIsSlTaaN24CTCFPLTF/3czC4Hqr1AcCrezAz+A+ZFw3JstzxWHdZwHDFfvNP+4ceF5Wo177xETIs1pMBXQ8Wai323G5zQ60isiH37L+RplH9tSN+BRXbNZktEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c69e17f-6cc8-4a0a-bb36-08d86149efae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 11:55:45.6416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jt9/UbD1aOgPmBRoSnCTZW++Abj+NEp99wMHpZcrjTgq/9EiOdSaV1SoIM8MyHWQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2485
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601034955; bh=K7un/5f7i/od79b7GD2C9iKkz7Uw+RURaayiAbz5t+c=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:
 Authentication-Results:Date:From:To:CC:Subject:Message-ID:
 References:Content-Type:Content-Disposition:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-Office365-Filtering-Correlation-Id:X-MS-TrafficTypeDiagnostic:
 X-MS-Exchange-Transport-Forked:X-Microsoft-Antispam-PRVS:
 X-MS-Oob-TLC-OOBClassifiers:X-MS-Exchange-SenderADCheck:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:X-MS-Exchange-AntiSpam-MessageData:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
 X-MS-Exchange-CrossTenant-UserPrincipalName:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=IqDFG02JscTGlt7X327i4HW06op2maNlGR5RUGXRBT+AyAVAwB9Tc3xu7LERRhoOv
 RnXngW/NtrfEh+2HtoCNCRHyg1sOLI1g1BMS9KdNR/U9FFiwu2jDLROIKVkMmuUw1e
 dMlgSe8DfzL+k9o/WahsZSjX4rCuGURppSosbz7oSf4YYjiirdg0OrlSbSxxy6F421
 qlHvDNDKMKJ/OWhJIVk0H4i9PeA2ig7z4GstTpd1FYK3E0sB8tLv+qYl7uDxsCF2aj
 uW4fnCO4nxF3c94lti4N29USkKbg9J8FicZDh9wut2CIihS01eMf28S59e0Vy6K/pX
 58Cxt+RedoSBg==
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-rdma@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Roland
 Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maor Gottlieb <maorg@mellanox.com>, David
 Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Maor Gottlieb <maorg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 10:13:30AM +0300, Leon Romanovsky wrote:
> > > diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
> > > index 0a1464181226..4899359a31ac 100644
> > > +++ b/tools/testing/scatterlist/main.c
> > > @@ -55,14 +55,13 @@ int main(void)
> > >   	for (i = 0, test = tests; test->expected_segments; test++, i++) {
> > >   		struct page *pages[MAX_PAGES];
> > >   		struct sg_table st;
> > > -		int ret;
> > > +		struct scatterlist *sg;
> > >
> > >   		set_pages(pages, test->pfn, test->num_pages);
> > >
> > > -		ret = __sg_alloc_table_from_pages(&st, pages, test->num_pages,
> > > -						  0, test->size, test->max_seg,
> > > -						  GFP_KERNEL);
> > > -		assert(ret == test->alloc_ret);
> > > +		sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
> > > +				test->size, test->max_seg, NULL, 0, GFP_KERNEL);
> > > +		assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
> >
> > Some test coverage for relatively complex code would be very welcomed. Since
> > the testing framework is already there, even if it bit-rotted a bit, but
> > shouldn't be hard to fix.
> >
> > A few tests to check append/grow works as expected, in terms of how the end
> > table looks like given the initial state and some different page patterns
> > added to it. And both crossing and not crossing into sg chaining scenarios.
> 
> This function is basic for all RDMA devices and we are pretty confident
> that the old and new flows are tested thoroughly.

Well, since 0-day is reporting that __i915_gem_userptr_alloc_pages is
crashing on this, it probably does need some tests :\

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
