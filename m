Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D9756904D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D8411AA2B;
	Wed,  6 Jul 2022 17:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A7910FD4E;
 Wed,  6 Jul 2022 17:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4bGOIb7VrnTuCUL9Yv0GNUIjp4eB6gU60DxnPq1tjdmBhoN4aGeQlpCF3a99qZq2eoBVdQmQOhucFXiW8t835oFULRCTYAnTHlLMcodEk9N2xqpkAHhKalzqj8exjFGMpOpU+sP0QSEGymNXZQ1CX43/DIpKMKKTr3SNlFnFavoCCRs6nvggHdcckrFKjss831RJz/lbkTsGw4g9niSwKPy1wvs6Ksdgl5kIiCMtauDaf8oLAvl1D3KTjF1K/fkFVL/bZ/JtlNfICF1ZR/SPFfwSOmhxOndikn0utCl2HUZraALZ1U1m/GBHTGMSbKlxWCd8PU2zIB3vsRkTeAk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAbWpD5CJOJvzysXSSJ2RQv2wM/6KghQ1ASRtvVljvE=;
 b=CUfm4YfSoFdOLXKpLTSFpbdsZHsuaOTLSyQCssppLoWLcgNsmg2UhaNnaEzBscwV0oHhe/CTwsq27to37JocIOtKG4hTyTOiat+SHYDa/isvBp/g7ChxgFCtKZWzHLlJqSIOeU2b53Lb1GGMHhP/J4Li+VWT6kB1JeGAu2J0W8IFZUy0u4BPKuuUmMV6rvYRIMcHgLovN2dvd/bTBi9ZMlx4dgnAAlRCo38/RCeREp/9eXUjuJNNnPRVTWkiJiCbfpB/3M8IbXUweO5bJ4RLgbY1fgVixf9uwVwTKBGnwUNLYrG5sVe3+YVa3DOvL1a0nXLIsWjrQa1IfbYCrMeswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAbWpD5CJOJvzysXSSJ2RQv2wM/6KghQ1ASRtvVljvE=;
 b=iCctWF59r58iKiu7YUVC63xcNmAulrvg/qojH6xtyD8DET0BNt9qMANX2hiCH64R7dZ7wHnbnfCrL9IVk3UQY7h0tfa81kTp1s02QwWxE0QEkkYsf2a9DvEg/BkumvF6CIeO/dHqg17fZHDkfTTB1oMkC5EfA49Yae+njsF8xsqknm1M/3t2FW7NvPBtDSpqxCGJeowvLJ6PR8e0s7hThjx72zi34puWVzavjejeB38PJpiAdXPycJmmHJcZ4EszYzzhjRv8+SLbWGxE9kVVMzl1q3Mrxcx6kpRybaJfRaBpaIhWaOvYpYpKeCDKMftWi4g8E8V8ZBPO2XV83OFLow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW4PR12MB5643.namprd12.prod.outlook.com (2603:10b6:303:188::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 17:05:55 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 17:05:55 +0000
Date: Wed, 6 Jul 2022 14:05:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 3/9] vfio/ccw: Only pass in contiguous pages
Message-ID: <20220706170553.GK693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-4-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-4-nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:208:fc::33) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304915a4-a3b3-46dd-8de8-08da5f71c9cf
X-MS-TrafficTypeDiagnostic: MW4PR12MB5643:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PucM7TtUSEr0BcCoFSp+1008lUFmNqRHkrCk44oKpjCckqYkkKxtXEHgNmSEFZRK+Dl+pYFlYMINuMx8X8iMi4P4UJmRig6eMakbtScW4IOPnjB0lxQFOI2azY3clO1ZO4oTB/wf7vtk3Vzg1T+rns0Ua1NJBxeTNAuF0g8jnEM7Er0F7FArh2DhwZa+Hz+CygczNFPjA9GYet4EyhbBVCh+Q7LaCw4suQdab0hQ87el1+UIUn/uhD8PVPBn+y59ERIzu1Zd1Mjb/EwGy0fYGOl4c4RzXfh4iiYDDSCA4AWwwMxSCb1A5PukkM33/tH9pphktalBQt9Fl8CTPtwYPipJaBpBQLTHisM+KlQXBVjchegTGgAFuO4vJswqbQsDsB4vHNHEkzWp/LLux936lPJOj9AT0jj50LG3QuKYyw/OjyQ+MR4fvPYFl/iijH1qCXN3zQI7w6QI0Psaxskx5O8xFM1oMg5SpuQoQKBpeWV29I1YrFWHIp1FGR+VodMJqs9aYsX5jXJSg9bvMRlaoQ8KT4MtKhD1o/XUPE5UXAWhGAEngk4ky6g2+IrLNgMh0R/mYqeNvu3NqmeTNh2hQXDCgH02eUYLPx7BH3zuQWsxW4YuJtcVCFFiTRliqVjqgwu1EER01c8TS1LNUXdFs5rLatE8zPB3nFRKjneYOmNV+lgty4C+I9N7bTpBQp295htj4H/kFrEp2q7szpEgwqLArOPbzvcJTH92CtSZB+b51eQRwYEc/hDT7/qpN8lyrXziUz7IGo81OQrxu4/QbJLWBYSucH2WIjKDgWRC1pScc7LVVy9O1IuC6a6hybOQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(8676002)(4326008)(478600001)(66946007)(66556008)(1076003)(66476007)(6486002)(186003)(41300700001)(6506007)(2616005)(6636002)(37006003)(83380400001)(316002)(26005)(86362001)(2906002)(6512007)(38100700002)(8936002)(6862004)(36756003)(7406005)(7416002)(5660300002)(33656002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NLxmbqXRv3rr0GSNGOvXMHrJL5qC3g815C7cDXyIJsbQQFAUX4TyCYLVJXrV?=
 =?us-ascii?Q?R3Ap2sGDvHVutcr0UxvOrMeydcYryET/cNXqitz7y5TdDc2X18GVBw5dPWEj?=
 =?us-ascii?Q?XMrvkN08rEmSCBnFbZwjYExflIK2I7Q8deiCHqvlOBJFP3EDmaehc2gUsdpx?=
 =?us-ascii?Q?CI0hCqc9jsskC0FTAntRDriKQ+SciSktcDwTNS/rwvyXCxSoYreidw79u5TX?=
 =?us-ascii?Q?QAUCxv4xpb3nSQ2FA6CeX49xtFlx3Egs2vg+ueTBM4IEFJ4V8Ho0sOWqdrCK?=
 =?us-ascii?Q?b72Tm0i526ok4u80UvX90z7qy61YYstCYNgkZLiC+WuYNdq+00i3aq8/cegy?=
 =?us-ascii?Q?nn8LdOP8FCAft2QKMnd3Z73vz7zDo1ZeJ/nfRvOHZtBnWs8+Q8YsriRvAwyn?=
 =?us-ascii?Q?1nrwPgGOT9IwHrmnHGNQEaXMn4dsgEAawkVtgdzr/bdwXNx1oD167CT5pwaM?=
 =?us-ascii?Q?kHiKB0DVWnA/yEGnrNH+f273MgzFpS84ycJmUAh7XofpU3NxgwJ/h3lknOVl?=
 =?us-ascii?Q?4QA1YKYiczt7Ykd3Z2b5RWvcimsO78OFEjyJLa9qBbRPQffkj+Qiroft7yJN?=
 =?us-ascii?Q?6HkwXZnnjnEJ/0hw4R5diW1IiwXNO4FrtJDgdTxWod0twpjqmy/BzKghrCtS?=
 =?us-ascii?Q?qQnXseSAKCn5PexAGoKJojGEQjENyabDJUFO53qNaurAML7iIG1/nMDXeWeW?=
 =?us-ascii?Q?C+kfnX87s0ak92Edi6X3A5+O2Idse0tZAFcmco1qSMvzeWsOH1kxlpEtSIoX?=
 =?us-ascii?Q?WxWxL9e4lPnwVqW4z37Uacg8GJEzXD0JAp9aIsCpeC2DAxVPVWPzm8gS8UmC?=
 =?us-ascii?Q?DnTSZjgz+SsU1w6TXTTrP2BR8hBUaMlWzhOlnJf5OCVWp1BkT2u9yi6ZfbMB?=
 =?us-ascii?Q?4MnSrMkpX7iYLyajJfgd3bXUGUuqpWAs753rN7ji+e9ZPpdq5pOuaerEtz4e?=
 =?us-ascii?Q?Ugb+NvfjsnIg9TueuwaxxbS/el7lw6juteyx7DFWOKXIlltcgzkMrDfPR2d6?=
 =?us-ascii?Q?SojdhyhEk7thBmEh4RsTfIEUBhFAjac57Uv/z60dIe0lOJYDapMaeFk8b/Qk?=
 =?us-ascii?Q?j7CKxqn1dCIVXEfjUjLfKO9Vabt97sr1Po0v6F6pa72vyIwtdwGiCUZrmKJc?=
 =?us-ascii?Q?eNM3KqLi4E+YtcyaQHWGACkE+ah6WoT0F56PpVVTsMLo6ThNma7Q8Y8vsheC?=
 =?us-ascii?Q?mT4hdBBb33kLd9eWrOsx4sWHjfcWHPeuPBFmQF1kC5koqdLXt8sQ9O9MzeVL?=
 =?us-ascii?Q?YPqh+5KCWMuMkmvE31WEMEeaafu+kdp2Mpkn73zhG3ZvWwe6wABAvPMpu/NX?=
 =?us-ascii?Q?+Y9bSIUDRwFFpyQCO8qNzYaj8w9fd13f5gzj7AtyUA1HkwIRfcB8e79Wr/8l?=
 =?us-ascii?Q?SEY4rXYaW4/58tOWBbfKIXAcV5qiSVAsmtXBq+EkEQBO7g8/FQyQi6sGy8wn?=
 =?us-ascii?Q?lk/jfoWT1E8pVYSW9vPB9m4XsAUjFv3N7yrjIahDEjDmPwFBDOtIa9+AvlFc?=
 =?us-ascii?Q?J5g9D7nMMrvLChYdkudIJ4hNrfRG+W3Ljl3/vVJW2uWc5Acxw/ii9To9Ld7a?=
 =?us-ascii?Q?SnLPACzIA1i0p5Ru1NDNm12pSHhZ7hTSqjxBei0A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304915a4-a3b3-46dd-8de8-08da5f71c9cf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:05:54.9830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZfRcwtynMltMjOJ6h/4HPw33pgBa2bF5CjhLq/WDC5KTHfLIVtMThnkKJsZIP3l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5643
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 11:27:53PM -0700, Nicolin Chen wrote:
> This driver is the only caller of vfio_pin/unpin_pages that might pass
> in a non-contiguous PFN list, but in many cases it has a contiguous PFN
> list to process. So letting VFIO API handle a non-contiguous PFN list
> is actually counterproductive.
> 
> Add a pair of simple loops to pass in contiguous PFNs only, to have an
> efficient implementation in VFIO.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_cp.c | 70 +++++++++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 14 deletions(-)

I think this is fine as-is for this series, but someone who knows and
can test ccw should go in and fix things so that pfn_array_alloc()
doesn't exist. Allocating memory and filling it with consecutive
integers is kind of silly given we can just call vfio_pin_pages() with
pa_nr directly.

	pa->pa_iova_pfn[0] = pa->pa_iova >> PAGE_SHIFT;
	pa->pa_pfn[0] = -1ULL;
	for (i = 1; i < pa->pa_nr; i++) {
		pa->pa_iova_pfn[i] = pa->pa_iova_pfn[i - 1] + 1;

It looks like only the 'ccw_is_idal' flow can actually create
non-continuities. Also the loop in copy_from_iova() should ideally be
using the much faster 'rw' interface, and not a pin/unpin cycle just
to memcpy.

If I guess right these changes would significantly speed this driver
up.

Anyhow,

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
