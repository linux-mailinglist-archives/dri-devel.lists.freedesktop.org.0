Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB0B444B5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C6E10EA9C;
	Thu,  4 Sep 2025 17:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+YvTld9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32F710EA9C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757008216; x=1788544216;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T6+W8DDs5z9fGrAv6mA0Ddo7TPY4EDW8ELjnvXB94Mw=;
 b=a+YvTld9/CWWQ4Gadw4t4oBy1mPtXU0iQnkTF4sYzeS4KKbg9yz8Z4XJ
 1WsKN3Dax9JQlh1WIQ5jEMDExEJELeioW4NTkinDp4ZrtM+xFj0LTV4xJ
 WfhlnYJDac0KuaTMfIP8pbaYiP0lfoUbRsNaBQHXg+X5MabOmyDVHqF89
 AMCGWNZmr1z9+GPgrmoucaqL4VpTKedFhjntKKUcbj/bCaidI2nt5w8bv
 h0PHsWSBU2Zo7aUuMNNMnAFDyUCa+XEToZtBgRX50TGwtPCxsNsjlYHrN
 p+eHhZdz39MgswSVtH2lzM14UFrdWPj/Kzwxu1Q8IRp8/HUZrHh95UzFF g==;
X-CSE-ConnectionGUID: sb5XZ8QgS6yXVIB1uUyvGg==
X-CSE-MsgGUID: 7hmmV34eRHmnyQkbCVZo6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="58393626"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="58393626"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 10:50:16 -0700
X-CSE-ConnectionGUID: EClP9f9SSMyXY+PKFDO7fA==
X-CSE-MsgGUID: IZCCbgSoSkCwlBHrllzzww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="176295431"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 10:50:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 10:50:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 10:50:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 10:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sl5Zgl0BwwkdGZVg2J8zsrfhv4o83rEx2Knz7g0Av6bcl8WRlOkPUwHgpo7FRHpu/OxvnEH/u8cUUXXS4DEeHcG3hJO009FYig+efC3nCK17+mvW7bmJOwCrxA5j5QCt2z2awudmQXJe3Ow33t041iplUtV9SUTA003lAuEkmyZo8ArfD4XZ3ygVh7r5wcv6Hersk3WfV969fKrOxvo1zbt8JmEteCU3jnvdah05wCQEG54RPqOioK5exERu3egXztN8PmPjhviO9MYjm4ESyaHZ/pPaDtOwnsHlqPLqzaSRA89h7A/VBpNhIz3QocAUDWb7CUDgQVSDnrPEol2MUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOErCDUv3Dyk21g+baLXshCl1zY6DFkbh5MmEQy7OmY=;
 b=Mnd2Nu3nNqVPgwjJugi4KSVVZy3WP/o3W6szsPs6acZxn7YgGXoxLXTYIrS9L/ktt6s9f1DhaBRLWuTsIqLDKYBLeDLOFEX9SJfl1zY0r4b0uM0A9SBpT0SNDkjrRY6ZXtoE83RzYAR+YqVjWQOge255yVxa1fKS87Mo0bhkFDCv8WPUnaR59vVaxmOs2MlH3y/ZYnlu7xI2Hglkfg5PjF85N0A5zv88IBjcSFiGyyWD4RnJ6GQERTwXhhLDOBEzNQZY06f5Q6S4wIhUsf+v9OZS7R0WyKFDazNyfvq9ITQOjYo1BrMWbF9Zsyl1CJCtRpp3UtiY8Qr2uE1Udw772Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 17:50:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 17:50:11 +0000
Date: Thu, 4 Sep 2025 12:50:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-kernel@vger.kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, Min Ma <mamin506@gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
Message-ID: <igd27jsm2nmdqm6z6mvdgbe4nx4j2xiv4ki43q4637mvx2an2d@6i4phi3cpx2r>
References: <dc0227cb-7e02-10c6-9790-2e2331ddfd6e@amd.com>
 <20250831001228.592-1-mamin506@gmail.com>
 <67138df3-115d-94cb-005f-84f6f56f5986@amd.com>
 <b2cb52b1-9bcc-b77a-ed9b-cf3dbaea1a71@amd.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2cb52b1-9bcc-b77a-ed9b-cf3dbaea1a71@amd.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5621b2-7062-4af0-a6a5-08ddebdb7eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nfGrhBPUL2nushYYgoEQ8aJwAgUClWKbt8+sbdWYQY5P2FovnP4JM+iovn?=
 =?iso-8859-1?Q?c1/G7QBb3ahHvxx4Q8ToceETIUBu+4VCalsn/JzXNFrS2QoOMu8/QcD4Mi?=
 =?iso-8859-1?Q?6QhBa5gpb+d7sOgpYhUCe1kynRbEvpfJ0ApTLLk9WJtWLCsV4RuCgJUvf4?=
 =?iso-8859-1?Q?qBxcyRPRKz/r8RoOgyxeIQ0tGwKgyUnVlbcx7XUL8cDRiefPdr7kVC3bNz?=
 =?iso-8859-1?Q?4v3cb1pD+Sw15NVtmGaioQJ98CGqD2mT/703vBtmU9IdBq9BEJ6Al+yyIX?=
 =?iso-8859-1?Q?4J/1yhbFXJ/u7AR9pJ84DF8VZNFj6Kh9fv8rJKr4/QFMvteLg6rNgGPGdE?=
 =?iso-8859-1?Q?JpeCze7x8Ng9pVZugYE3vRVaDjJondJ0roJitBMi5w7UnATDp+m4Zsi81k?=
 =?iso-8859-1?Q?fYw2hufel07yq8dzAUGi/s84r4EWMYdRPaZdXjhUGIp6VLlpWhwYLunuDh?=
 =?iso-8859-1?Q?qBCdkQvupH2NLsJti/cFo1hfzD+RczRI7TeEdkGe51uQDTkSQDRjRROsuh?=
 =?iso-8859-1?Q?rWI7fpm4Fwbzyd/yxCetugZDFv5aY39Mt1vs2m32VZ3EgjIl4qf/Fjofuc?=
 =?iso-8859-1?Q?e6ikADG3x/mO3/pipk9WEsl9Af8+/tLdnNCPHEsHsPW2ygNI0PYOmMQxdu?=
 =?iso-8859-1?Q?rhRVi/3HDttzNA6ZoO/6ge4OixQvO5PoP7PPDguQ2r7KYvFmt01DrHHJ/w?=
 =?iso-8859-1?Q?hDMG7VhfqSW0SG6cC8AamrnByl6DKoMf6SC02Xc/97bqJPHbauFQpbn6XY?=
 =?iso-8859-1?Q?mA3H/+gw9iiUrTRnAnOgIHhxcy992mJPK5JFCuGlLJ83VJt8Y4zkhW2yFh?=
 =?iso-8859-1?Q?vbPJrGP/IGbAmITsYD/TuECM749JvPMjxin8AY+5BWJ20fZ0u7+IgfTFGr?=
 =?iso-8859-1?Q?7Yhe0DY/NQ6miH0iE/0wRbbndSaoG1jYuN83yj7iX4m4zAAUoSB30eUahy?=
 =?iso-8859-1?Q?TMv6cL2UqIb84X9s+bniDcDWAGLVbgPM1gj5HD08D1h3Toa2G+ddkkiU7W?=
 =?iso-8859-1?Q?ZX1anQvqtlHn3cIV1Ra94Ef3UGMtTVf/gJY1UASw2aeYlD0hVnG39plSTj?=
 =?iso-8859-1?Q?ZtFIrYhEYFP1u8C2IHEh73g59XoxJJybrmpsrjqp6se4QKT+OAMYwkp9eZ?=
 =?iso-8859-1?Q?hmwmVCu36jqUFhChBNMAHlaB9qRkAoNFkfY4fgVMNdnX8j+9388wHHie2I?=
 =?iso-8859-1?Q?iFJkHGT5RbwrEPs9kaEhQpOCGmCp1bkDfjKNZ6t+zp0qbQLr4fxcyrUey9?=
 =?iso-8859-1?Q?1JtqGBm+lFREuepjzn+l+DuFSG3QpUjoEEn26XZBC3MPjNPXiuLlIGBQJD?=
 =?iso-8859-1?Q?3xk6TkD9B4yAFEkDayCbneWIpFBOKhrydV5hCbEvImTZk2XbCE4t9t42sa?=
 =?iso-8859-1?Q?Hz0FbdsSOTMTIZx0209zOPyex2IxgpLmZ8XyL3iLlEUqWkEcPfq2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YUHCw55FZzAh06x2vahq/htTcxHdFECnynobD/23TDmBHX1A24VYA0vubR?=
 =?iso-8859-1?Q?xJziBDQQAUQGsTIFRcPN5f49urqd1UDvQYQmJc3jkXFUyG5y6ofC1FXgYb?=
 =?iso-8859-1?Q?aJuruj9nIpshr+ovT09ECyIdJcX4CGK1ye50FUsxqiuXijxrPfe9oWPSoB?=
 =?iso-8859-1?Q?RrefV3ZC1zrHpbrh3HT1tG9/n+bGcWvju8pApf0ka5DO3uKn+oZSu+up0+?=
 =?iso-8859-1?Q?J17DTDpEo862vWv0942W/lCo+CSveWBDdUl/rVqYau1pWdpI7+7IsVBn4M?=
 =?iso-8859-1?Q?J7u89c14feZIav6igNKSLH0To7k+CnQ6Rkfz+xBJa+M13WljR+1Nz1qiMb?=
 =?iso-8859-1?Q?gG6R4gqlQCRNwrLYWie2VZasxOW3jGqMf5NpqPxp+b5v/ZEGxAUkG1dXYM?=
 =?iso-8859-1?Q?y9NAh8smIQmDtQn6Vy3rjVGk8Gek9N5W21Ppdl6liMOCjPMzQ/rWpYp5KN?=
 =?iso-8859-1?Q?fijIm7ERA5Ds/C4xKZi4CRAGluOCx249fwUpIkaeLKdam8qpajlu+rVUgU?=
 =?iso-8859-1?Q?oFLSC6iqMtRXYAtPecfUJ5Egcto9Lm1uKl9bMF0Owh2cOZiwtMssqIlh8K?=
 =?iso-8859-1?Q?/dtDd7lvM+wYGR+MLK+AXCwk88qSj9wuRHNg8pkyu7ANSdxWW6+/BoyBlH?=
 =?iso-8859-1?Q?9j0iDFuVZBu0BN7i3MyjKNrAqwIBRwT3fKEYWPGQLMwcm4DutEumvFOPHk?=
 =?iso-8859-1?Q?hs7QHmb8tDLXYKS3HFZRr5PQWbfYi47Ghl9taXDC2BNiBaUJ8LOJJa8aWJ?=
 =?iso-8859-1?Q?Fa2bEJD56CwuwsCz3NyDlTtWOojzVx14+94GPm9BpEzaWqKbvTD/E7W/jZ?=
 =?iso-8859-1?Q?BdUvJQ8eUp2dHgKHOvetTo9otOTrh++LrSy1bAQNDjxjLQKleUa3pJ/53K?=
 =?iso-8859-1?Q?cv2AWXwBukC8jFt9q3PYZCyugVYMZcC1w7gNN/ZJ+T393r1038ax4gprHi?=
 =?iso-8859-1?Q?N4ws+BGaUAtXzAYyZ8AZvTTTkDPHYgCF4An+sX37nRrNElL0G7n649XYKg?=
 =?iso-8859-1?Q?KIjfA9wnKkFw+7KX4XnYsUJrBHwyrWnxs9etxhv6cvsHlgOADS/XC0lBKa?=
 =?iso-8859-1?Q?Y/HdUaGKlhVN9bup3XqoBJd/zUL4aQNvqmNSPjw/Qds+sVRXGkjBYeaOcv?=
 =?iso-8859-1?Q?zoHNOfNprLjpQIKK8np9RwCh2ZLXQ688GBV6Oqm+GRhv6zBSqLL9gTbsse?=
 =?iso-8859-1?Q?BjFik0oQfeTj4HeGYHAWTs6Wr706tAXk/AdMdyteJzfw4M2RzD1M8HIhmr?=
 =?iso-8859-1?Q?x+EXmB6U5HRTLYavWn8rhg5u8VUEeTV7uSncz395N6nVezhNX4l+6OBYvm?=
 =?iso-8859-1?Q?ryt0DhsCj/NsbuBj4/KW6iCaCY7fckdfAl2iPYL2JKhRvck1XVPr5CbWtw?=
 =?iso-8859-1?Q?s0o75vw2pufKbf/OQG31z1q1eMPiX2IPp/oOPlgWzdBC7xUhhURlYgRdX6?=
 =?iso-8859-1?Q?Sme6mB1Ds9lT+3zf1Pi30Go4i5myVdU3ZnzGiZkVOJlJxGplsmK6xWuAGC?=
 =?iso-8859-1?Q?3mHCKhDDaohNotKBqfxT+yl/sCDMtA82S/2WY3kCYfarQtFSgdcsRr45Pc?=
 =?iso-8859-1?Q?DsweX45ttWGe+jDAdEDz489qOi9nJEpwiJnnlVlGZ4Vz8J/l1x4zXwctd5?=
 =?iso-8859-1?Q?mSh9o95N01WsYIAIH0P3n0kYcjZJHKhDzwb1hkoL75LKvUN2ZlBJvi3Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5621b2-7062-4af0-a6a5-08ddebdb7eb3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:50:11.4027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /e0cm/rVPoRe3cakuPRv0z5fSe531TpHNv6CYtaHwS0jsASg9VYcmrzBLE9eftzR2JOcXMHYK9kgZWeXuznl8vcQMQKY1lpJVdBEyWi+zYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
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

On Thu, Sep 04, 2025 at 10:15:42AM -0700, Lizhi Hou wrote:
>Hi Lucas
>
>I got a dim error when applying this patch. Could you take a look? 
>Maybe there is not a maintainer for MAINTAINERS? :)

Yes. A little bit worse than that:
https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/83

For now, please use `dim -f ...` to bypass this error.

Lucas De Marchi

>
>dim: ERROR: a12586e4e737 ("MAINTAINERS: Update Min Ma's email for AMD 
>XDNA driver"): Mandatory Maintainer Acked-by missing., aborting
>
>Thanks,
>
>Lizhi
>
>On 9/2/25 12:47, Lizhi Hou wrote:
>>Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>>
>>On 8/30/25 17:12, Min Ma wrote:
>>>I recently left AMD and would like to continue participating in
>>>the review and maintenance of the XDNA driver using my personal
>>>email address.
>>>
>>>Signed-off-by: Min Ma <mamin506@gmail.com>
>>>---
>>>  MAINTAINERS | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/MAINTAINERS b/MAINTAINERS
>>>index 10850512c118..6eefa494000c 100644
>>>--- a/MAINTAINERS
>>>+++ b/MAINTAINERS
>>>@@ -1231,7 +1231,7 @@ F:    drivers/spi/spi-amd.c
>>>  F:    drivers/spi/spi-amd.h
>>>    AMD XDNA DRIVER
>>>-M:    Min Ma <min.ma@amd.com>
>>>+M:    Min Ma <mamin506@gmail.com>
>>>  M:    Lizhi Hou <lizhi.hou@amd.com>
>>>  L:    dri-devel@lists.freedesktop.org
>>>  S:    Supported
