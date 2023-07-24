Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06275F87B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC6810E319;
	Mon, 24 Jul 2023 13:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D42F10E319
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 13:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4WH0ryhRNhUKtwWI7MiFSwYIOTHGkr2NIXgPoCW84kaq6OT8PZJmi2e8QWb3PCND6BSdQDk+4MPq3EYYqlpCGwHDj8xR8BiPLTR8mo+HGc4ESoxTL+jnS7lv2eQJ6EIuA+7IsKcfUjBML0VndvHWYTFBJFfRFikTzzVB+AhJQW9dFTQq+vuRbBD5QtCA6wbpeEZj4PnN9mfKys66v90vye6e9m/N4uDuBnkGbnDuvlLqhNVhhuL7bcrA5MrDhwfEX8hg8amWW1/xq5RVIxfxznO4DY/dz/ItyB38HbElNfKvAYsyyX7mkjhVRtc4SQYcGSrJan+FqFv1mPsCotDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/09n71snllHjFHRMVrjiRX7oSy6Zdp5gmwNJY5RWpg=;
 b=YP3RYuQaEeKn+CT6FzbSpBM7IcnVXWfmPfXyc2eRUes53GE3qDbxc3SF6zD5Iz020xwbu78BzSLK6+vfAFRb3V94lNiqCP9HaIV8L64sYcM45z/c0n9pn1CihdAljZokjkMetxQc9nf6gJXF25v8wFF7aSyDwAxPZ2jZknsIH7ITBq8y1UxqXDroCOaPMO1VSbU39whEzukGPsXaoOFtMBxEur8vejuoTqTj5WkV619iJspTKbaBOh/yiUxgx5e3q6j+fatf/S2WESa8ZFIFvz/K38yq9Fs1gIiDYUGpzk2jsW5YkWeiisU9sinrTzXsYJj9+af72nJMQhEWa0qyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/09n71snllHjFHRMVrjiRX7oSy6Zdp5gmwNJY5RWpg=;
 b=ohKNIww2n2v6b5/Dm7FJ6Omw/c7+WbGHtNnb2jTpeJweUkjpGsFEKJLawMFGAOK5sa9J9dl54m9xJtYsoxfYfCRC6Vt+HyrVkQn+zVBIVS3WEOBMBLDIQPrdMK7UuD2JBJzemRROJRCM4AxyCMZkeOqkpyK7bnn2zTXzxOJVLMWpBugUYbzT3xiUILyz2PR4JCKTm+DqusG5WjRyoFDHMXfEOTNzizDnCY16bSf17Li1d9Z1A4xVarqnJobLq197D2VFuputAP9fqOXOUqQcmWH0W5jy9y9sbT5hzBtNyboKfhkEEcAblGO2mcYT94UEH95VhTUnL0cpinyzqosg2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:37:35 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 13:37:35 +0000
Date: Mon, 24 Jul 2023 10:37:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZL5+nmkkTtP95jAm@nvidia.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87zg3lzbd1.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg3lzbd1.fsf@nvdebian.thelocal>
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3652c0-f267-408e-81ad-08db8c4b23d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPuybVw27VKor0nODLEZ71MGECSIBonEKO+wHYVV3TS+/3GPJqTwUjVKQJCIVNlE7tFr/9wbig58f5vrqeALpwWF6NKZw2aArCvHt2NarA+En/yIEayfS2QMMiIUFp1hdAI48TnFNa1+PvPRIOaS3G0MSo1xfPUxoO9g/GSCKUSXti9DvUCQg0KWSemPvyDQApiyq1DqXyJiI9acdHMLk791Ef55lFPfxksnFBs4xEaji9Za0l4Uiq4CdvUkWuDKgx5eLHwHiWafY1chDtCAaQXKD4AZBzlvIwueHNsNZk3cyC6bmXXQXowLO7JFN/I7Hj6KIGwkKqCceWtHDdxHPgs6c/R1H3Ey5gy5nbT2yO3ULSf+Mk+HtQ/WVIhzu9j5/VdmsZRHpyUnKRTG03fJEthyAOTMLG3qxn/L270oQi/O2a8R/i2XeCKOBAFTesz0OekTFWnnM1WBsjlV6d0wUC2+vCmJ0E0oZMomrOUX6zmtBN70UxAxZZ/dAA/QT7mFHY6Lw0DwxMUEUmNezU/zvp/XgGnLpYF+SvXfLhrCMFqtmuZ/+iLBu41e6EwtkPjmoi991XTzB+ZBRY/uIBwl2mFlrJ2glJftP9Ry4Lrdycs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199021)(86362001)(6486002)(38100700002)(478600001)(66556008)(66946007)(66476007)(37006003)(54906003)(4326008)(6636002)(6512007)(316002)(41300700001)(83380400001)(2616005)(2906002)(36756003)(4744005)(8676002)(6862004)(8936002)(7416002)(186003)(26005)(6506007)(5660300002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P2W1RNlpAY4Z4cnZQhhMDL1nPWnnK0ErWleUMCctnG27ZP4GBXY1z1j9bPKT?=
 =?us-ascii?Q?MkhkHxCCE1IaQXJaf5KrikqlLzBwshYR0PCog50XIKIO3VXjmwdi6Yl1IsEz?=
 =?us-ascii?Q?A4lBBz7L89blrC2FvwpebyBt+o6LitEXY2Rpp8fdbKgOYQAWIcQN5QMATw9k?=
 =?us-ascii?Q?owkXMCuc4v+55vij4DjCKvhi6SJWoUPcjDFCk/g5B3NO33jjpjH34ESD0vwh?=
 =?us-ascii?Q?dAFYOHQMcl119MXsAUlLeJryme+PuNqXXfjA0J3dOX/eP+lq4zR+Eci7FTAS?=
 =?us-ascii?Q?Me1wt2iks+SJKm1Mmav9jyQi6YvzDpBoSDcKUXGWTkE3U6ncBefa4MKoCAmI?=
 =?us-ascii?Q?rsTTbvKzqvVi2REmM/LjfJfZY3hpyIizldDsbWd6PVjQ6XgNw9CcCSdJaR2l?=
 =?us-ascii?Q?AxLBxMJkYf4cOBFD6Mu9DicmGC1Mh/dOLXKdc4lU/WC5YgJy0kjrs9FNxvcz?=
 =?us-ascii?Q?IhrI6Jbvo4Ga4UtRzzTU588uG4b7CtUSpXP1o9Bn9iFsAwAW7p1UHsCLqYCH?=
 =?us-ascii?Q?ZCEymadF/cECcnNjj78gOz3eINDFVwMgUmcBYla7i1XwPIC91uvREADiaxuk?=
 =?us-ascii?Q?kPY/ZWH1I91ivgDs5/EyQrKD3V4ezzTf35HL+UNXnFiW2eiPuU9Hd+2F7PXh?=
 =?us-ascii?Q?IcyjnkW+HOpaM2MzJYDSZ5KCQjN2W0jStMkInlgIztgUnHaSwYLQJT4i85pf?=
 =?us-ascii?Q?6sT/7Qy9ZyCMt3Zx2xtJIdN27/347JTGWqst8awrquK6PvShvAaNXYwd0pmY?=
 =?us-ascii?Q?gLfrdzCb36y2pb8KYjsvDMKcRwpIB+Wc0e9RFlfa87EduTuILjo7K2qexuAF?=
 =?us-ascii?Q?LsGnaR02EJR/TwU1QPmAip3PS5H6rAZeFSK3Mw7RnOyF8Fa/BpuVNcnLDK0V?=
 =?us-ascii?Q?Juxu9hMLknLJUDU4f6Bmfy8ewyW0SERkQQhBtAW41+Q1PeiGqe3XTzboEb0g?=
 =?us-ascii?Q?2G+K8Zh+MkQavZwbIDY+XkLQyWpIu2K6JAMfljXZhizW3R1nS83V1/0ARoCn?=
 =?us-ascii?Q?0UBqllRbQAfVlzVsYhfU/OdiP6oYeopAO5iV/cJcAMz8cyTwB/ulQ5kWUoCI?=
 =?us-ascii?Q?X5yxhZiTLszw1POj00KZTFagxJXyCnVH/a+0M2wyCOxGuktXkvVIHD1bTgkQ?=
 =?us-ascii?Q?4YkQnXd2uaN4v5taxObNQ2rusm3yTZ2w+CimXr9qzk3J0YSsJ3eBQiba9fK4?=
 =?us-ascii?Q?Q+/2yPPDAWE60wKtgHrDoy3mXYhztNGl1NYt7IP+g5MWedmhAqH0piVQGQ6V?=
 =?us-ascii?Q?hBo2Jvgv0IkyRFZcvyK5u+DPXAaH+xyxcwbYj9Amw/0fa7Ma8vkphgCdLt28?=
 =?us-ascii?Q?xmtIUJd2hnLEBy3GMVbHW/55A7mUSCpAmmQaozq0aN/sl37O3MG0PS6rGaI8?=
 =?us-ascii?Q?8JXZapM2yc2aIT6mxbUI6SgTy8bBV2PDtmINb9kj0bK66dWkDk0cQbANQ8tu?=
 =?us-ascii?Q?SGjLgQffMNJ58Yqk03vvz2v//J7e4tY/d+k0UPzuxctgxXn2NIXwmIIviuJd?=
 =?us-ascii?Q?AQPN3lqInSiXkxhDvja3o3AAOjfVcR79shIzmKqRIeRHAIzm14Esa+56oZ30?=
 =?us-ascii?Q?cM+unzxBvpgu8yohWoQTchi5WE4o9NaK1w0c671K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3652c0-f267-408e-81ad-08db8c4b23d7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:37:35.6117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qo0iD/kZz2VUrCMDBCa6QUTXhEUTqfqUygi7PZ8vHLfZC71AVvHOrXGdbRYQK7D7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hugh Dickins <hughd@google.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 11:36:47PM +1000, Alistair Popple wrote:

> My primary issue with this patch is the notifier is called without the
> PTL while providing a PTE value. 

Right, this is no-go. The PTE value must be protected by the PTLs at
all times. We've made enough bugs already by being lazy with this in
the past..

And I don't think the existing sequence locking helps make sense of
this at all..

Jason
