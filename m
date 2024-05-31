Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06548D58EA
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 05:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83D812BABB;
	Fri, 31 May 2024 03:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATeChw88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D0E12BABB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 03:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717125136; x=1748661136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nhkPlR9DShOxrmmWwCwry75bOL8tTksg6eANaX9YINo=;
 b=ATeChw88A8G7NXZMW3PN3kR+oh1hDlm0DJDPKQ/vL/0mLFDVJ3hffx7b
 gO7aAFQLj4oGyYacpuB4IIn2nIGsvkjgW5BeT1JND8gRTj8x4Fq74FxNX
 H+R9tCCltYwv9tYk0IPwkytzJyxlzsq3Q+R/AHaYBBNNWQt6rpqGQx+MH
 EA2E1QjisqP4j99VtD6IHwXRTtAm0YHSWGwZSM9oV2YXIbz9aw0orxo0U
 gHFcjS4iShp9zKaz7wrwL8zOuIrMdRHXvrb8pRTFuMFNbTd/v/W6VyNPz
 QN5SqjgUhAkdXB5kh9mPC3irLUooMkfmQcNNZJ97V81jfbbZepJeG9NW6 A==;
X-CSE-ConnectionGUID: XKMTS4gxTf+0kd9goM4/WQ==
X-CSE-MsgGUID: Q592DtW5R/aXA/R7BoWdGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="39042946"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="39042946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 20:12:15 -0700
X-CSE-ConnectionGUID: G71MrCQlT9StRqQM7qWrQA==
X-CSE-MsgGUID: q+TVWP7FSh6nLaXpXJ+tJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36119325"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 20:12:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 20:12:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 20:12:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 20:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVa+BqhYWKuwNl3BughFpaJ8DupM6G/Chdfssr009txajkHajsOuCifh8r1wXWp+XVycZxJwy1xsyj/ZELkL8JMNlaF4/VP7/Cw6dqGsfgEgCc7g4b5N/7bJS4hcW2CXaOfF+Agtlj5BPdNPL6Oy5dcLmXoaz7oifG8aWlKOpVgSckDLswjTZaK+5ImyUCLP2GBcVcfp+KJK2BPOFMkAUZqetwEFXregUfEOixtHOzaUAwUJ0KpIL8W9bNq7aumLVgv2ZV+A/89D5nN/VGdd+mW6sqxcn4dRxd46fyYzEnvTktwuEOiIThGra+BX78tIpQNBGAltulobwEeC6umY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzlVK+Eh15Hoky86ZxNSmlxVZACNhu7VxALT1QhEbwI=;
 b=QVDR6L2y2q/Ra8/UHEs9PRj4oqNajcX78Bw4OWkLs1DkkRVvT1DGNC6fTFO9xInzH9xGP9je3GGbU3QEolUe/mkjxKeTvKEagDHumNPPh5EtQBf/ZQ3AV8dhh3cL0dcCAlSDxx2soumGomYElnuqTyXx1BJSCG3nI5htYg9hWe2WcXf/kxHZjLlkX/Z0nzOE2KCBd0HefetRG8sxCSRpi4JdgEqt6HJIumrlPMPHn2U9pV8cmT9/0un0AFWliFG66gk9kFR1rvfT54xNn3cahFKA4KH5YE7RluWKw3baX3BKtQ/qBtYEeilHnx9O2VFvoPxxu62sjf2Nkupt/pY8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 03:12:11 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%7]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 03:12:11 +0000
Message-ID: <7af4fee2-1b37-4eb8-9d03-8b1a402ec00b@intel.com>
Date: Fri, 31 May 2024 11:16:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] iommu: Refactoring domain allocation interface
To: Baolu Lu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Kalle
 Valo" <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 <iommu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <efd902f6-eafc-4a26-8057-bdd9d7d6e535@intel.com>
 <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: de6afb29-1830-4270-1539-08dc811f76b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnJORzZ0YnJDejNyMzRHMk1IOVlyeVFtRmR0b3BDeTRQeEJiWEkrZGVxSmwz?=
 =?utf-8?B?SWo0QUJlSHAvV0pUWlM3V0ExZy9FcTlyRERZS2RCc2EvQTRndTY3YktFcmtY?=
 =?utf-8?B?WkI3TGlrajBGMHlzMkxBSFZLNW5UYStwU3Z5clpGMEwyZVovNWxQUHVxUll4?=
 =?utf-8?B?dTZXNTMrcElXUTdmQmpTWlU1ZXVrQU9EdG9kTEpFVDlUODB6RHpCSnFhZnBI?=
 =?utf-8?B?N2Z3a1VPakZqSEYybXdHdnlvQU5LamdYMFRvS3F6cFFkYW12RkNuYzBseG8r?=
 =?utf-8?B?R2ZRQzB6RHUrY3p4UXZmaUZFZHNqUG5mQlJWNitDTUZjUHR5YkpvTFJXVGZk?=
 =?utf-8?B?MFFOa0VWTVR3T1Q1VC9SZkk2SnJuQndnaHVPcytzOHFWZ0dTNFFmNk4yNXV2?=
 =?utf-8?B?Sk8vdjZTY2hYSHJlaFR3TUZnTzhmd1ljWXlhRTZKK21yUTA3blZ3YWFnaDVr?=
 =?utf-8?B?Q09JcE43V0FnZG5rNFNVWjAyQjhac2dsdDlVM29vbzlKTUtCMEVNWEJBbzNi?=
 =?utf-8?B?dDVwMXNQRkJqMDBMYnd3Z0xTYWt5RkdDWGlWNlZSYmtjWStJT01nVUJXTW9F?=
 =?utf-8?B?TVU4OXRIWWU1a3hYcnc5ZVgwNndIN1Y4VlI2bGJacjE1K3hQVW1DZmJSQkIx?=
 =?utf-8?B?cUFTNmRObDFBUFoyOGh2Z0V6NFBUbFR3MEVUUUMyZWtBb0tqZGc2cmUzWmRu?=
 =?utf-8?B?cXYxdjhqQ1EvTUVleE1EVDZYYzJ3enNUcDJpWXRIY1BoOFZ0ZVo0NXY0MDlH?=
 =?utf-8?B?a3NFeGVPOCs3OHByS1F3Y0R4OHpvUnJXd1IxdXY2ZVRCSG95cHFKQi9MTmts?=
 =?utf-8?B?WkpHRFZqaE5ER2V1cWgzNTJtU1VNT080bzdrVWxuYkZuQnZ2VUF5Z3ozWFl3?=
 =?utf-8?B?WEcvTHZSMHp2Y2lzU0xiTzBBMkVGbGJCbTFjMGk3TEk4L2VDVnduRGJRb1Rr?=
 =?utf-8?B?NXc3MVIra1pMSG9DVE1WN1I2ZmdqU0VBSllYT2ZhN3pZQ0VhVEVMTEZLT0RW?=
 =?utf-8?B?bXRNU0F0YTFLTDBTL3dnM1d5YWdPQloxR0ZDa1ZEbEs0amtRVWtUZTQwdVg4?=
 =?utf-8?B?YVlKNE4rSXovQk96TVNwWS9EbUNtQS8zeDk4ZlhBcXFqSUIwSzE1WkxHUEtR?=
 =?utf-8?B?Z1VrdTY1ak9KREdLa2FQZGN4dnVpakhDQnF1K2ZOa0w1VzR5NHAwWUoyMEdi?=
 =?utf-8?B?cHRldVJGRmd1eUcvazE0UWduSWJYTklGdmRwa2c3NkQ1SUNhSElhMmFhcHNN?=
 =?utf-8?B?ektLUUtJSkM3OHh6K3pkM3FCZk1LenhDUzVhL0VScTNlZS9SVkFpM2NHYWFF?=
 =?utf-8?B?QUJzTlltMnE4RXlSWE5UcGo0eUJSWTJXclZ6dWJHeHJRRGdFSFp2MWdDQlc5?=
 =?utf-8?B?R0g4M3BNb1ZUNnk3d3lSSzI3VGlMNXF1YlQxYndvaEJVU1M0dkh3cGQ0MjJv?=
 =?utf-8?B?TS9VQnp0b1kvU0J5SWJLVC9ubG96Z04wRExsZjhaKzBQTTlmZk0wV0RIQ2gz?=
 =?utf-8?B?cFFxWjZVcjA2b1VaSGRFNW5qSTEyeG1QNUh0R2djdk5ic0J1akRNdmRGc2Jl?=
 =?utf-8?B?K3BvNzVNaE1UOFRHWm1PK3lRa2c4a2xkM3dCanlrYWdhYlNRVGxHRmdyWjFn?=
 =?utf-8?B?WFJsNnNOaTB3TTYzZlRHQmFwNzNwcW4xUDQwM0Q5MEFjSmQ3ajNGa3dCQmNx?=
 =?utf-8?B?TFA4akN4VXVncFNOVnlLUDRGRTh5WmQ0RlZHNHNEWWVTeE1jVFUwSFRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akdKeHpRZVRBOTBzVG90bzBTWEdsV2FHUWJicnVqQTBlekp4WWppbmlncDRE?=
 =?utf-8?B?SU83QlhuUldSNUtmdkVWTnlDVVh2d2VqUDJkYmp0a3ZwU29KMCtJRk10K0JB?=
 =?utf-8?B?YWdPcERsejR2UzN0T3NBcVd2Q0lscGJ6cUZ6STkrMDZQdm1ZdEJaQzVPamVD?=
 =?utf-8?B?bUMyUkpGcnRheUdRZkFUeWRQT3dkZlZWczNlSXNJdTNqS3NBNFkyckNNNkxo?=
 =?utf-8?B?Y0U2dXRHZGp6dUJlY1JsbG9rZFM3U0x5aGd6MjM5Y01yZldZcTZmdmZGMHFs?=
 =?utf-8?B?aHhWZ2N1SWV1cFNGSGQ1aUFtQVZrY1N3dlZxNGZ1bGtpdDVaVHllWVBGRnNm?=
 =?utf-8?B?Zi9uQWx2anBhMkNIY1d6VTc5VVJPbjRnQ3g1cHJzY2dWNVc3OEhuRDl0Vi84?=
 =?utf-8?B?dGJKSDZFakUxK0p2RDlNTllxZktvYVFScFNwbUJxeXpWU1RRK3JlbWxtL21G?=
 =?utf-8?B?akNEaXhXekZBQlV2UCtXQnk2QnZLa2dMaGI5NGcyVEMva3Q2ZXZ0aWJhNVNL?=
 =?utf-8?B?RTdYSU9kM3JQYURpM1pvQWtaNm40Tlk3WHRSRWJac05oV3Fxc3c1cU9NVW5p?=
 =?utf-8?B?QjMvQ3FCN3hNbU13bGxCNTQwWk0wOWhFV0tpUlloWk1FQ3grS2gra2tjWEJG?=
 =?utf-8?B?Q2hCL0NVR2xQem45YndGRFRtenhVWEU3eXE0QTFlTU1WbkdMaGlxWHpYL2Rp?=
 =?utf-8?B?dUtScE5leEIwUmtydEIyT0ZwdGhkNFBrZXJaSTFEQXlhU1lFV0lKZ1BjdGhW?=
 =?utf-8?B?YStvMkxTM1A3WU1vSExyWEczVDNIUk03TVhtdEd3dm5ScS9sQUZaNk5kcjBH?=
 =?utf-8?B?OXVoSHk5Z2N4VWxaY05QeStRbENSaWU4MVJ1ZkxoQVJjb0k5eXhHSktLK2lG?=
 =?utf-8?B?eXNwelV1dDNHNG1ETXpyQ2JLd0JuZ1J3T1RBM1Zod2luT0JITFVRbTh6QXZP?=
 =?utf-8?B?VlBtTkx3TWNGajhIN2tEeWN1Y1RYQnhVMmhUMGRBeEVpV1g3cXpoQ3psSzIr?=
 =?utf-8?B?ZExkWXQ0bExvQ0swVXhnamVDTHZBSFEyVmwwbUxlT0hpUmU3UGpwbFBzamlC?=
 =?utf-8?B?cnJjWENQVXY5cTZHSTh1WE5OS0xwVTREQjJCTUZSUGN2MVIrVzJ6ejZGakpo?=
 =?utf-8?B?NUJzSmd5QUdWQXlWZjdDams4STE0V2pkeFJDc0FIYVFtaVBsQWZjL1JXYWpY?=
 =?utf-8?B?Y21ETXdXTzRONG9sbDkvYzFYU2NYdFROampsK2tVNVdBa0VjVkoxaWY3SWxI?=
 =?utf-8?B?STBPekJRY3VnREpRTXlUcGVUeks0NXdJVlFXVUJ1K1V2U05maG9vc0dvaS9G?=
 =?utf-8?B?bHF1L2FGSTJMUkJSaDRzWGk0aTV2R0N6RDNZNkRLYTFCWWl4Tk1mUmVSalVF?=
 =?utf-8?B?WEJiSjBIeWJpUXNhQjZ0UFdPUm4rYVljOEo3dDUrQzd0WHMrSEp4dFRFT3I0?=
 =?utf-8?B?aGtTZjlTSmVKQ3ZCOW1sc3lFRmZ6WXEwOFNXMlhxcVJldE90R0dNSW9NbTFv?=
 =?utf-8?B?U2FLODZ3MG42VFdtdmQ4bUVFbmJFbEtQNnBEc0dWTE80K21iY1BKaGliVHlZ?=
 =?utf-8?B?Z2l0V0xZOEh2dUJnSkJUbjdyZFpxcjRlSnptSVcyUjd5RExDc0N4bXQ4R2wr?=
 =?utf-8?B?UC9kdUExN3NPajBuNmpiQnZlcG80ZHlOYVZaUmJsTmtyazV2RnEvaHVOUUJK?=
 =?utf-8?B?WTI1bmRwSU1xaXQwaEloVDJuVmthVEJ4dG5uaHJYZjczelJSYXZrV1hkNHJk?=
 =?utf-8?B?SDFYZkNIejk4WVpPSm95VkduTjdLYVRCa29tMkp2bkR3MXJTZEtxSkVaR3Zk?=
 =?utf-8?B?WmZVRkdiTWlhRmw2OUJIR0NlVi9ZbEdwd0JQOUxQSUYydXcrOVNxa2hsZHZw?=
 =?utf-8?B?NE5iODNMSnFqT0ZINVh0dW5QRng5SVRRVGw3d2hXVWg1R2I2d2h0WmlYbFk2?=
 =?utf-8?B?OHZEaTlsd1BDa1VyQWhxb0d0ZEw2REtQdVBIYkNyNXNRUHlndGw4K1NhUDBs?=
 =?utf-8?B?UUNCeUNkZHFvYStscG1IaGtFS0Y2QndrTjA5VENLazlCdDVPTWtkRmliZlZM?=
 =?utf-8?B?d3lvNDBEVVRZVDZXTXNtelNkL0ZRdWc2MlNQY0VENVVrSitzdFJSTEFlTk85?=
 =?utf-8?Q?lADGNcMBAUZUIZ2vNYC2tn+Q7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de6afb29-1830-4270-1539-08dc811f76b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 03:12:11.8215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1l+ldtEHiUkIs1bU4nEXCYpQJRk5p9arsgljm/Fd3J5H02CnDHu4mUUbPmpmgneB7vdbAHXhRGtmKVPfOxDUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
X-OriginatorOrg: intel.com
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

On 2024/5/29 20:02, Baolu Lu wrote:
> On 2024/5/29 17:03, Yi Liu wrote:
>> On 2024/5/29 13:32, Lu Baolu wrote:
>>> The IOMMU subsystem has undergone some changes, including the removal
>>> of iommu_ops from the bus structure. Consequently, the existing domain
>>> allocation interface, which relies on a bus type argument, is no longer
>>> relevant:
>>>
>>>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>>>
>>> This series is designed to refactor the use of this interface. It
>>> proposes two new interfaces to replace iommu_domain_alloc():
>>>
>>> - iommu_user_domain_alloc(): This interface is intended for allocating
>>>    iommu domains managed by userspace for device passthrough scenarios,
>>>    such as those used by iommufd, vfio, and vdpa. It clearly indicates
>>>    that the domain is for user-managed device DMA.
>>
>> user paging domain? It looks to me user domain includes the nested domains
>> as well.
> 
> Yes, nested domain is a user domain. The iommu driver should implement
> iommu_ops->domain_alloc_user for nested domain allocation.

will it be more clear to name iommu_user_domain_alloc() be
iommu_user_paging_domain_alloc() as it is mainly for paging domain
allocation?

>>
>>>    If an IOMMU driver does not implement iommu_ops->domain_alloc_user,
>>>    this interface will rollback to the generic paging domain allocation.
>>>
>>> - iommu_paging_domain_alloc(): This interface is for allocating iommu
>>>    domains managed by kernel drivers for kernel DMA purposes. It takes a
>>>    device pointer as a parameter, which better reflects the current
>>>    design of the IOMMU subsystem.
>>>
>>> The majority of device drivers currently using iommu_domain_alloc() do
>>> so to allocate a domain for a specific device and then attach that
>>> domain to the device. These cases can be straightforwardly migrated to
>>> the new interfaces.
>>>
>>> However, there are some drivers with more complex use cases that do
>>> not fit neatly into this new scheme. For example:
>>>
>>> $ git grep "= iommu_domain_alloc"
>>> arch/arm/mm/dma-mapping.c:      mapping->domain = iommu_domain_alloc(bus);
>>> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = 
>>> iommu_domain_alloc(private->iommu_dev->bus);
>>> drivers/gpu/drm/tegra/drm.c:            tegra->domain = 
>>> iommu_domain_alloc(&platform_bus_type);
>>> drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain = 
>>> iommu_domain_alloc(dev->bus);
>>>
>>> This series leave those cases unchanged and keep iommu_domain_alloc()
>>> for their usage. But new drivers should not use it anymore.
>>
>> does it mean there is still domains allocated via iommu_domain_alloc()
>> on VT-d platform?
> 
> I think the drivers mentioned above do not run on x86 platforms, or do
> they?

cool. BTW. I know out-of-tree drivers are not counted in upstream review.
Just out of curious, is there a formal way to let such drivers know it is
no longer allowed to use iommu_domain_alloc() on VT-d?

-- 
Regards,
Yi Liu
