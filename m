Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC48B58AD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DF9112C2C;
	Mon, 29 Apr 2024 12:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvSrZM98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B78F112C3F;
 Mon, 29 Apr 2024 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714394128; x=1745930128;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ncPkaKunyHVuwrmQzsKqF/duyPOCL3upgdJ1tGzdwUw=;
 b=bvSrZM98fSACqID465y6Infp8hirfC9xmWSZwIlMPzYW5l7+KOJIZCOP
 RlUP39f0KvYyHDOfCb687ypjAL7dCPib+GO5W5rodeBr7qq1NX+FMKzIf
 13no4IyLgxaYensEf8q+dcmYp3jTzXJF/MBaZDkspCPi1ZmPCiJra5oj3
 O+tIgMxKe/hvDrg+7i4lISOLMVI1PtimXf4Lhtw0xPBOGds64ZRXyQUni
 wfSaw0H+UVxh9T/eSlXAqitDuuQzPWqAYl/PNsQkiJdU/kXvH5DSN3SkW
 vxghIiZy0mOaEyVpoZORf7V/mQ1IBfbXvhHkk+sHsvnO4Q0syMK1/DvWK Q==;
X-CSE-ConnectionGUID: xv+AEd9QSMSFlT0l2d3Ndg==
X-CSE-MsgGUID: cHgqUfAORsG7bFh4LHE3/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10160844"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10160844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:35:28 -0700
X-CSE-ConnectionGUID: uN9AZvzESGW9QiJgjiHEOQ==
X-CSE-MsgGUID: UbYhOj/qQLGRImQhcH1Atw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26061308"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 05:35:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 05:35:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 05:35:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 05:35:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 05:35:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgmJQx1G4iESz1mUaVnaw4aBVThkGUUd2JsQ88Z4V8Cl3UGqj3T8Xt3f+O2L/6MYoOxRsf8qxMf527IPjrX7+Pd80prgEZkQKPajYsMuo5RCR/Di1+V63DftXcgO0bs5JSjmKKIuEEl6HUdTvWAkP9tTYgHVMSfnVf9J1GpRVDuC0UYUyPBTBRaHqTipFKqMbKaD0q+m2yW1AkECVoRqm4v3jdvHtC9Ekv3rmQQGc6I5W0vl173UkkGdgZBiGfN/t2AW3hd9r2Qgy0qIOLcf9Vh0iDBofOk2Ja8O6BFv0RapPvco6rQX2qs3dhIOecJ9OjDmvmsb0ehLqXUzPf80lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTjv8u69mHQ6l5iU5Kya541YU4hx6Lt/VTcuiFhLwUI=;
 b=G8jvVZP41WFKSS4dO8nQspTOtI+DNmMq0nmmaYMfW/vFUT6kNcZaaQS3NOFEzWxH0wkvlPBRl3qNoKm16phNxEnsneFD78RLHQ1+VnGTte79xmnPsXJDP9GWzfQ1K0mXTRtpNZakmumqCXyPXPVJiQhKqGpOBsMSdcXwhJoE3Eyfq60n9bc73JiKbt31fik+21SbAGykej0H7g6UIwRgAA1Jib3WSnMoWfvfTgkRum5Rctl6rTw1JRz8sDgg2fKHB2mCVwYpICmZM7pHxMjcckmRo0ObjBYtMSGHAkLWRrXw0+VodKFdhFvrnjSaC5P/4OehRbkiHLw5SifrkDPexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 12:35:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 12:35:24 +0000
Date: Mon, 29 Apr 2024 08:35:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Move the drm-intel repo location to fd.o
 GitLab
Message-ID: <Zi-UB59C4tjhhp5z@intel.com>
References: <20240424114159.38719-1-ryszard.knop@intel.com>
 <bq7u2v4mtkxyjnjeu2ijgh2jzw5iorkrlagva7eazir4i6kbes@2vvesiqaujpi>
 <f45e7438-ee34-4f45-b537-aca2fa63e40b@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f45e7438-ee34-4f45-b537-aca2fa63e40b@ursulin.net>
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd6cb8a-a8f6-4c23-8d44-08dc6848d757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mcE8xo/dEXUmv/kyIc54ER1BGfb7wLtoe+zqfrbuP2RWTJIfMLEqfObBZP?=
 =?iso-8859-1?Q?V4ZD67jFtufvfeZHpuAwq2YyMkr9ihE/Es6yEI9hAUD2Vkc02pPrGZByow?=
 =?iso-8859-1?Q?sxdWA1kXxprkLSjyL1GHui7c4W0w13KNjItSfEPVSoJmVa7CSYKHOU9578?=
 =?iso-8859-1?Q?+AH3SHZ9cjyKuxaEs/3J0TqzV3vdHWOACrpnBF1Vh/S3Lnh5dkPOv6+g0v?=
 =?iso-8859-1?Q?9Oq35gMmp0gNO4EK199ckgCJ57OZoHi+l1NNZwWFBlkGynEYfYur9OE9id?=
 =?iso-8859-1?Q?RhTetQOcyik6zATHWIBGq3m2bkIUou+v4+hLR50Mcsbx1p+oo/27yzReAP?=
 =?iso-8859-1?Q?T4wSxgp6n8CPATxrMYjko0uLgE+9qMFRyMHFqfuK50DcpFIUAWWYhJesTP?=
 =?iso-8859-1?Q?LNFiqGZ7dICL4GbMnpf/LczC+3cLDUuKYGLSNw2eMdlb+HyAImT3nUh+8O?=
 =?iso-8859-1?Q?Tn0Hn5IAmYRrw8KUqFy9rYV97s1lDZFam7JpqSzEcR5vlxyK+3mgwUH5sJ?=
 =?iso-8859-1?Q?HOC68TSbrf+uN1R0utxEuUlhs8NMYtsyYx6AYO09VeFkLFoehft8pFf42h?=
 =?iso-8859-1?Q?qMr+zMgf6evQWQ8yA6/u9vIN/7ThsODjpqz8+XZg/ofOM/QLwSRLQiXEKk?=
 =?iso-8859-1?Q?ePbHdKOT2WnceQiPkSzFOnNhd8eeMqcPm0fEQ3BZXBTHVP3EaTRLKGXg/m?=
 =?iso-8859-1?Q?DZhTGvycMvrz7rB7gRDQjSrKo9EIESzQA1zcm50q2Jrggb+v0JHpoh2Etn?=
 =?iso-8859-1?Q?JL+q8dI7+IeRN1nC1/JheoxgH8O6WkNsGhuat34SuQSg/hpzd4XIdJfY/O?=
 =?iso-8859-1?Q?Uq7QfpHY9gKRSm8hpnZmWsYeBvXujAx54pxQyvr/8jcXN6zWqdtmq1+txJ?=
 =?iso-8859-1?Q?Ll0N98lOHT373qJKPZtb90iFXJu2TkWnxb4mHWX2JTEMnnsjR2fz1xL+Nz?=
 =?iso-8859-1?Q?m0Pm1o60KTefqU/YzOd0VkIv99nA0zbE2Erq9lkh621tNlgDVNIUSqHwfp?=
 =?iso-8859-1?Q?q9VPmuo9a7NSoofL9/y3FdHFO12rZfysfxyL+afRmC5HIJgH5H9FkPeiBT?=
 =?iso-8859-1?Q?4gQgXzG4JBUYEc8obbyQWc1Vkd6rO7mTdsSB5BjWPW5xRMrJVEMD8lBxqh?=
 =?iso-8859-1?Q?LwfMPIqkPdEwAjD1j5/QcVDZ2qq39v1iSFael7wUr4zv04pHw6OnrYIqRS?=
 =?iso-8859-1?Q?gaoHADu9Az2cbr2J+XnLGdR6g/cGxABSze0NfIMoKvKEZPfgcSOVNZxhxh?=
 =?iso-8859-1?Q?j05jDxX12QCNcriB79ESMXZYy+kSIVjvh6n/gvI6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aQcNzJTNxgwV+5Xw0OkjiF7VfHkhnXHaNQyABhl0MMXb9iAHyT6ZUlZ5AS?=
 =?iso-8859-1?Q?kIN2J56rtc6TN3YW/Czkb2ks5VO4fwdP5zMYtz0ZGurICCAduBTAxXrIr+?=
 =?iso-8859-1?Q?RG2vWstE5NDsjOMzZzrKpoZCPrRyuXMCnvh0hr0gClnAwxaQR60bGPSUf/?=
 =?iso-8859-1?Q?KSQNQxMAhip2TnkR3wTOi78CF+xQNdz93stRA0TYALTrsuvrklMdSNHRb7?=
 =?iso-8859-1?Q?/TQV8OtTsYRcfLk9fWrFACjBddumocdrrz2H4SQVDqmOxnkC78OlrSIZHL?=
 =?iso-8859-1?Q?tmeBWXQe/PfTmKlW4roPX9NCxE8/t0mvj9ZfKzOE7UHIGm1g0DRUYJePjt?=
 =?iso-8859-1?Q?9sbjyEGYPlh7FwDua3KeGSpROXqVe4yDRaISv3GCj5tmCg6A2rtoixsXUq?=
 =?iso-8859-1?Q?pQDqauEQtrsd2ZXoqi3gYQWGbYlu+qnxOCjLmBah0IS9dtdzT0lJ+aBE6K?=
 =?iso-8859-1?Q?DtnzfxSdwB5ZQ8byQdrQ1wqJ6g1XyGZ/n4WVNeYfWz90aB7HVMOh2AA8qL?=
 =?iso-8859-1?Q?BH+6Y4xTHaLw6nXQTVQoEeT0L4+cTSKvUzvrHecWiU1kkHli6nUp+Zfy/p?=
 =?iso-8859-1?Q?RZ/7Lg7OdnTl5mkHRdwyb00hGzXyxUV1v3o8isqG9M/gAKSMK8gsLNRa8V?=
 =?iso-8859-1?Q?mymKJLW1NAt59p2l5HJ4FwZSV97DOFHsQl+Jr3oNe/y2J/xwtbN1Ak0EHc?=
 =?iso-8859-1?Q?Nm6ioITUG582HmQCV8Y6+JxHV0FzNRDgnOcaouSG86850kMV8kiN8SK4BE?=
 =?iso-8859-1?Q?uKpaeyhaok+uL/qfRKEGaBsEEv1vQiTK5kcYUptvipGUmDu06zzZ9oEoCL?=
 =?iso-8859-1?Q?OpzpvNqCajgRwMouDloV1yDPuWaACdaD4MyaBJcTAXlVrwaZVKUUo2gxko?=
 =?iso-8859-1?Q?w3FkJKuogpv4T/j5s2AQGy/w3yo7kHWhWkItQztHLEcjCQylsv1P2jZx1w?=
 =?iso-8859-1?Q?8y8wu9lPukjt71Ltt8Ar9HKaYXP4kY7AB+8t6CfQNXbxhyOdkfUu5Ehcab?=
 =?iso-8859-1?Q?HhIGhwIMAUvF3+odaF5J1aL8km8Q2jESmi1yEblceRRw1rptHfrnV//VFz?=
 =?iso-8859-1?Q?02UGkvU73cYr4U+UHfOHwOwb6zH9FYNcDPEVzcnsIx+/O7crHK/WAZnYX2?=
 =?iso-8859-1?Q?deszlR+DIYhErtExAb7rjfJoyy5JCrJAu4TylLrBR7WbFmGrHaQqj6Euoy?=
 =?iso-8859-1?Q?j1q8hRqKfKbEuCQ5+SsSkxNcZG8N5aTPTGXlyYE9+X1nt9y4vncECsTyNV?=
 =?iso-8859-1?Q?tcs6ScPvNKk720UbPH8C9qHy5ZmKMhnd69McJRgaKMbwANiPm60v3JqFEq?=
 =?iso-8859-1?Q?3DKkDsJTbDIVFnJpKbpUXImSw+8AZNCKUCpzqLk31ezTdmZ4nC5ZyE4cv2?=
 =?iso-8859-1?Q?40DeWLR6BQm3tIfCcB/2Mvi1CcmlN0DA4ZlUhMTOssTlHHhlKxw3KRTd2Y?=
 =?iso-8859-1?Q?3FLlzL+O53a3+r6VXUB4/d3uRx2v4r4aQtXeM1s4vCRsH9lRBmlDT7NrEF?=
 =?iso-8859-1?Q?+7MjTQlq+n4A36PAO+s52AC36znOku9wJYHiucO8j7CcNgOi/28sTaiIKr?=
 =?iso-8859-1?Q?gjm100lXH8F0dHvz03XwgDM3qsiRT1EyM07YWm2qWixc5JWwOq+cyuJa9D?=
 =?iso-8859-1?Q?L6aaq+KC2AA5CXVGQsj9uhkxHV4/eP+6W5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd6cb8a-a8f6-4c23-8d44-08dc6848d757
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 12:35:24.2078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3NB2Mw8PI6vNpKv/CcGNfxmtqWblyEZFAaXf0i/Q1uO5qnCpZklhKCG/sPGCbM1t6MXrQwFAlDusSxmdrcnBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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

On Fri, Apr 26, 2024 at 05:02:54PM +0100, Tvrtko Ursulin wrote:
> 
> 
> On 26/04/2024 16:47, Lucas De Marchi wrote:
> > On Wed, Apr 24, 2024 at 01:41:59PM GMT, Ryszard Knop wrote:
> > > The drm-intel repo is moving from the classic fd.o git host to GitLab.
> > > Update its location with a URL matching other fd.o GitLab kernel trees.
> > > 
> > > Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> > 
> > Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > Also Cc'ing maintainers
> 
> Thanks,
> 
> Acked-by: Tvrtko Ursulin <tursulin@ursulin.net>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Regards,
> 
> Tvrtko
> 
> > > ---
> > > MAINTAINERS | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index d6327dc12cb1..fbf7371a0bb0 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10854,7 +10854,7 @@ W:
> > > https://drm.pages.freedesktop.org/intel-docs/
> > > Q:    http://patchwork.freedesktop.org/project/intel-gfx/
> > > B:
> > > https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
> > > C:    irc://irc.oftc.net/intel-gfx
> > > -T:    git git://anongit.freedesktop.org/drm-intel
> > > +T:    git https://gitlab.freedesktop.org/drm/i915/kernel.git
> > > F:    Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > F:    Documentation/gpu/i915.rst
> > > F:    drivers/gpu/drm/ci/xfails/i915*
> > > -- 
> > > 2.44.0
> > > 
