Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979BC7A240
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A550D10E023;
	Fri, 21 Nov 2025 14:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZevgBPxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACDA10E023
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv2b7gZaVr84U9rEj02mPlg1MbR4azprdl2oyIk/RtfIJ9RACds3pBG/Ux6eywPnaniqyoKWRM2aY2CmnMAHu6VEfN/x5LM/uHTUEK9Al2S/yaYUnSmWCfgR72gX7KpHzr+VQZJM89jyStanNlZIqrd5zNEBRrX+vOFEjQB9CFVqe2Tz/pCKeJC20wexHwjoUL4X8ael+rZQLM4iHbhXw+l1zPwTMbJDt03dM6+j27AdDRa+WeFZsc0sdX5ryMaZgmaAevOxkqXkImtAfnbFkzF13ua+BX5Fcn2KtNsoOCc/UfcGyi24rsoICAeInyj8z1OiARYpTvZR31M0lSmesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vOGqiOXr/5lVeSWQt5PcAWXq7bnr0UuCaOoHkdK7DE=;
 b=TavaAijpeWHcUdxGi5dwIq494SG6809uKZogHcv3e5BzEHzjtoQbrYd5HC/g4/ZWUqpujL8c6641+JxI8mzKy/Hkn9tuV7xzgFjfKlJErods1zib64Sd8i5NFb16GBGep/gC28BNuh0MeIoY8F/bZXGgDLb6pZSoO9UlCfRxlV4dzgNAAM7ghuplgktzxdQQI/zF/DUjKywcgxFoBPGSfcmBtxtg1qRxfqEDjujZT9Z66JzC8So0pOEPDFW2l8orO7tJbp1eLK9b+hMohSI6htMbTBHmj/8DgAGPlzQIl7gTz4bD0Yj6EDi3/oaacfN7YStsN0ESyn8Iz1gtV2ogEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vOGqiOXr/5lVeSWQt5PcAWXq7bnr0UuCaOoHkdK7DE=;
 b=ZevgBPxLWfzOCtQpAdCM5MSo/DdGSGGVf4rRaBhNVJEMGfLhdB4g3T2brFuP7PoGVm8T3UsaM+mCB+3DgDyPcEXkfvqedFVUI07M/zwXkHH7WuEVkD0KSudQkJR+mD6z+zZPAYiVt7ggm6qAcILbVPIM7a7kNM4ySOHQ2/ECQA9YOAdgU9ZyOrNeNae8Ji4zYk42CzFJBCWVnrzXHFLk+7M+XFQeYS7btQe/LLyYEsJoN61YKcDJTcmED/ZLoPhfp/csQLkxnrtiPyjSBvQrPxlhg03TEKgKxEV2FYHNe1gaMr58z4UjT+kkGBF1jX0re7av/ZI/0XMLrn/jC0orNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 14:27:17 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 14:27:17 +0000
Date: Fri, 21 Nov 2025 10:27:15 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Joerg Roedel <joro@8bytes.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Will Deacon <will@kernel.org>, Krishnakant Jaju <kjaju@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH 2/9] iommufd: Add DMABUF to iopt_pages
Message-ID: <20251121142715.GA286125@nvidia.com>
References: <0-v1-af84a3ab44f5+f68-iommufd_buf_jgg@nvidia.com>
 <2-v1-af84a3ab44f5+f68-iommufd_buf_jgg@nvidia.com>
 <BN9PR11MB5276AC3E40996E4DCD9159CE8CD4A@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276AC3E40996E4DCD9159CE8CD4A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR02CA0120.namprd02.prod.outlook.com
 (2603:10b6:208:35::25) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: baa5f0bd-231d-4a26-5555-08de290a1280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K3+6yCWdJm/nXduDVEUKAuevVdFWORVHbxjXSO6ZyZb2H59Z2l962mhQPjfS?=
 =?us-ascii?Q?9vrBKQlO0JGJDQIo520aJtB6i1ZWIbG4xU22/gSKoLWmbtkYxmQr70iYTDrl?=
 =?us-ascii?Q?b3np1PX6a+7xw8BRIyN1xCZSXMZ8ZWAnUSuaebW9JLI4Q2mLLtpuT/kJdVMf?=
 =?us-ascii?Q?Tl6IyffbP6fnN/OxmDOdez0u7dtTwPsyNbhsVRk/GEOz9kP1lmYSFyOCj5ej?=
 =?us-ascii?Q?5f1kZiBqAMF4qwLOdoGQzWHyTTguGj/UjEJMzRvH1zx0/Q6u2FPHifApPr6i?=
 =?us-ascii?Q?23opFIjjCoVdFGpyus4nQYqCezaH7zLRiibXiGxIB2sJcBITECU7hyogh0tU?=
 =?us-ascii?Q?fjR4IUdKC61nvuqQl/IfvkedaIzQbo8uewveLwUZMugB/Fup6z4+65+4MKw8?=
 =?us-ascii?Q?/D5f5toKyfILsb2rBl6qBRSKYQLuJpXJip6SdrrWc2xwk8tCitUoz7lHcHIL?=
 =?us-ascii?Q?BR1cuAZOEVhsTmsURURgHxVpExGuBrcgpeZoVqKyU90KdNfHpi1LfWWoCuRO?=
 =?us-ascii?Q?EhgWsyYnAx+cqT5AHg0Is5M0Pxvv9rpY+veeh8U3Pu2Mm7Xkn5H9/Vbti+UG?=
 =?us-ascii?Q?U7SoZSxxITr1aj3ClrWlhgp5LfMij73Xztbrwd+Q7hd/XnaVPg+4N6tXKOr3?=
 =?us-ascii?Q?vUVCS6sk4f0vcuNdJP5qBvMWdWYgwdgoal9U+D3cF+z6w9fBc60Aw4zJ/kq1?=
 =?us-ascii?Q?+p1vOzx6ZP/LvQDR5X1Th1+dznmehkssUIAKQpSd/EJRADpi3p3i3QZc/QTs?=
 =?us-ascii?Q?zd5FMXtGzaAGDghaFH3wyl7f3pJp4gZmJmiUyW2GBkBO0NiCbG6L8717JoOD?=
 =?us-ascii?Q?XjUDu+xzIhDvaApQH6LSMU96iKUUh9TZM6DemGj6SxFzRSi3z9ZF/LRAGSL9?=
 =?us-ascii?Q?V0LiHJjY4EImJ7CYx1F3dUBA+H7XS2qMKmXqKRx7nKMUdyGdcvHEIiolJJIr?=
 =?us-ascii?Q?usRtnJOF6AJyokTGub4pXf9tr4NWqUD7fmDSsxcsnxUDKIqDHN7/Nm/JJCKr?=
 =?us-ascii?Q?Wm8gbH0LktQsJfc+0yGljZjouZ354n1Oux0KJ8xLFaDZWqkB9VRop5AESXwk?=
 =?us-ascii?Q?lujMYg2nnDYiRGxqbL3Ft+gAH7w/cpkZXBZR4yfi/aT3iL49kezdh1InuiLo?=
 =?us-ascii?Q?rjF4t1P4NIf6h39NPFJAHvRxFEiy987YiWf4Wwkjbcl4QFFN7pLCP7txkPLM?=
 =?us-ascii?Q?/pa1cVqLmmto0vvQXT/6KxDHJZDpT4Ht4/V2sFlkeJwr2ZrfgNlnos/iMtZR?=
 =?us-ascii?Q?1PEihk+wV8go1VXYykNZ6rZR7VRzFV18ea4qy2xB86yZQ7Zt9sXPwdkMxCUA?=
 =?us-ascii?Q?EFh7jNpd2ydJhax3Vovz68CWhGQxoVHTrx3mqrkCcVOAB2xB9pDBr/g3dbs9?=
 =?us-ascii?Q?j3JhIYKBOsku8O0H8g3OBNaI/gzGPAfHcaMCbvMginGkI3nIODiM+60GJBZz?=
 =?us-ascii?Q?YOf1n6hO41/IpKrnE0drKDWPzvMgZkiQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JLyyI+VVb1+IQDLIIMAUz9KVsXqCmzu6kJoK3BoRwkqtppREZys+PzwIz7G+?=
 =?us-ascii?Q?9g/iRvRZ51FhA4rBE23Qpn24xELRM0dje62HcWiugb4fJoeqd7eNJwNGdS5u?=
 =?us-ascii?Q?kYHc7oSS9QgZIXNHyOVTv+puDglX+3TlLHEUjQnhHEZWqEf1jLDlkpgU1mMm?=
 =?us-ascii?Q?7Q0ZA1zXQyU+jvYBwMOltXTMLWF4fenkyNpQzQa4O4wARZRk6BCoZ0c1JbAl?=
 =?us-ascii?Q?Y8ckhCay+weuRINPy45xNCTUNETu2Si/js8icL6k+SvILh61cOqzJA4rrwMD?=
 =?us-ascii?Q?X6i2lJ/bg9kfYO7DuwIdoNhC+uYv5FkDX8gImF7iJQe3+I4Vh5rrEwoyTaU7?=
 =?us-ascii?Q?C4EbhgORSNWi37X21PIYv5/0gRq+5ENZV3PGcjXnGqYsgeLpdMtXPqIS4usA?=
 =?us-ascii?Q?BzoYklLoHysTby9K6etUFjhUwK0L+uPAktMf03MlEh97XCPcxKlujy/K56Px?=
 =?us-ascii?Q?6I1xbaxIne1XTj4TJQeGZVtu3pQH6hg42OpLjQWcRQDDdVXlPvieA/FlMtmq?=
 =?us-ascii?Q?H05AEBkE5G5TE/OXtrYSphgKXinzMuf/6CA5/ziIIwURG8O1WF+xkx0LGguv?=
 =?us-ascii?Q?GKGublXq/kKpfvZwXld5E2hebY7DtnUG1sVnFWlCoMhb//wxNjPFlR+Ago8g?=
 =?us-ascii?Q?05XkoB2luZ+Hc7aNQygJttRUGERcZOD26z7eR5wBWBmg4unixvuIWkqqpe5+?=
 =?us-ascii?Q?dKaewZ4ProJmOxQRC6Y0wI8j/QUv6d8R2bRjDF9o86ie3hyzfBIez/dMvf+l?=
 =?us-ascii?Q?yF1qrXb4OL1dL8kQQ4P8cOKwqeVJgtuplwrlzmFmJkYqHJqoHOZVhJRdfsiX?=
 =?us-ascii?Q?OSPOTwF0O74M2UcRvGzv0a9F9Lc4Gv0Tp2chpyNpnF0RjSRMNHjsJmZto78g?=
 =?us-ascii?Q?++m40WHRZZYCRh+L4nB1rsaaK4DvIroJHWJHsY+yQraQsonFU9yaecuJXiXc?=
 =?us-ascii?Q?6Qm8oVaBK0xMI0d3la3IZszTq+F9mrtMT4SXPpxtC3cUHMA+/wJxQn86O7K0?=
 =?us-ascii?Q?1LVDP8qCXRMRHFa2TnLfgcmCsVAJU3laAaPfE2iNKv5H5Qfl9RSNq1TrI7te?=
 =?us-ascii?Q?2jahwuRm4Zkywv0PuZ50ffL+E6e+dtmMhBFp3hoH+BggmoN4N8guL+xZt/yP?=
 =?us-ascii?Q?0Fuwj3KqZjBK7oaWhCkt7y3niOOXJZKbEhDJI6EO1gLVHgPES8yn4UD7j5Vm?=
 =?us-ascii?Q?IhhT7o2VblDiNTmpfSbiYHj3cXzJciKht4U8ETDBzfxfsqkBlgPYRnlnoWL0?=
 =?us-ascii?Q?n4AsfkDAyi25IdejHFGIYYG2umFzwy2sEledCvvb2VeH9d/tlGMY8h1MGZMr?=
 =?us-ascii?Q?17l5vcQKAaItbeJRy3+M9JUP3UT7kamgJS7uKxkdv7t7s4zLl19Rg5BcMQpJ?=
 =?us-ascii?Q?+qLCJSdDDHXQxe+Et13dl55ftzYWV+9BnIzBjwWIEyzqSn1IatUn6W34dM72?=
 =?us-ascii?Q?JRv2wrEj3QHsaIj/Eh0K53W93unm5Iwa0gloQXh3cgUGZAcjWG3fST+Uylwx?=
 =?us-ascii?Q?DcIn53D/iTIA6BlgalIDPCJqFjEBiW7VdHGqYLxiL7GFLCAqocxUtUuQHF7B?=
 =?us-ascii?Q?jNP6eIPP5NzpkqNu7OY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa5f0bd-231d-4a26-5555-08de290a1280
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:27:17.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sarc8OrRzy1xTf/pUuc7L6w72yS+QVkMdAIngHYjW1T76ipQDh1VVV/PscMXAoR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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

On Thu, Nov 20, 2025 at 07:55:04AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Saturday, November 8, 2025 12:50 AM
> > 
> > 
> > @@ -2031,7 +2155,10 @@ int iopt_pages_rw_access(struct iopt_pages
> > *pages, unsigned long start_byte,
> >  	if ((flags & IOMMUFD_ACCESS_RW_WRITE) && !pages->writable)
> >  		return -EPERM;
> > 
> > -	if (pages->type == IOPT_ADDRESS_FILE)
> > +	if (iopt_is_dmabuf(pages))
> > +		return -EINVAL;
> > +
> 
> probably also add helpers for other types, e.g.:
> 
>   iopt_is_user()
>   iopt_is_memfd()

The helper was to integrate the IS_ENABLED() check for DMABUF, there
are not so many others uses, I think leave it to not bloat the patch.

> > +	if (pages->type != IOPT_ADDRESS_USER)
> >  		return iopt_pages_rw_slow(pages, start_index, last_index,
> >  					  start_byte % PAGE_SIZE, data,
> > length,
> >  					  flags);
> > --
> 
> then the following WARN_ON() becomes useless:
> 
> 	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
> 	    WARN_ON(pages->type != IOPT_ADDRESS_USER))
> 		return -EINVAL;

Yep

Thanks,
Jason
