Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53ECAF7AD2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFE110E877;
	Thu,  3 Jul 2025 15:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nq6RqYZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DA210E877
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751555889; x=1783091889;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BF2CXUvAzcCX2W6p5YQnkv16vt8NDS6HftZAKK167rs=;
 b=nq6RqYZgOIvzxsTAmtFKemaHzu7sbN9eGCJZkKL3kCuSZz8e6HhAaP+Q
 2Lshry0ctwcY6N/Jt96SIGtPmve5OmmjWRLNvMzxYSHS0pZFk0QhH/fDQ
 28tDS6VycEadHSjtP0HFDAW1msmbvjzhvpBmZcefy8JhViw39juPzPg0n
 /LjsA+9g596N4CyyhNB/fbw9BS332Q/NK9M7Np0kfd/pGalvM00wqwmCY
 TibRPlQ9rdZ8HO6K167FdK+sJyQcmxWvB+oPzBJJsimwRUWYOB1aBswxM
 Hy4NMfv+G7jMDndSH5p7fOysSBVTP0cxlMng287h/22ROo0wFvmS0UqsG A==;
X-CSE-ConnectionGUID: vrHkqjxNRa6SR3/aDq/wyQ==
X-CSE-MsgGUID: Jfy5rhCBTd6YijWQJfAAXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64938080"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="64938080"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:18:08 -0700
X-CSE-ConnectionGUID: oFdTAM+iTXi2QCmbDsGNzA==
X-CSE-MsgGUID: vefUgP9PSuydDU2SXj1NJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154166451"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:18:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:18:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 08:18:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7S0a3I1dy29aLubgr3iptOnEHlhpDNk5WH5+QqVR18/OD9uSlpWA+sxiAz3wblySmGFEPRBVeV7YdArgCwITlYZ0mNdcUFsSJqNG1aJO58NUgF1R+ZgvGHYk7Y7Qd5byut6IvQ4RnhcaM5J6JIyHW6Q4ld3XLg2v7N7XOkjx7xGDv/XeHj9tgRjI7eM5b9KyYlOHHIJqo8sex2R6FaPWit/B6VlwAO+wSjDFHfAmSijRUuS9e6qP+RCTFzzz4pmAMVc2+axWyvbb6GEOyGrdPpzjb7xdgssepr/EoRLE4VrWiXwBsAR4RBGDh042LKmhZVluMpP4ZFsbFxyBY/y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT1Eu+e5jiFxV8/IpZBlGC6fuVBiJ0//YLMKrZ4q1iI=;
 b=Tirz+GzNOzHsQcc6INtSfrYzloD6rAxeN3tG4dsstmdpMHd8MAQR39+FKlZpighf83FixN6yDtlVtwbHWQGfswvVAaHql4TU9jGfYUgDMErycpf5V7Nu67P20yoM+Aq4aIilY6YfeVOlbl+B1meEHub2B6m6g0CXIgOk5cNpElxDJP+CoCibvIn0JBA6QvZZixZF1iY3rDkfKAv0p8/UgSn6TfnEaVecU6X9jAJ0STp7Zeb++T5jv1wW8Bs+FDFEIQ10WlHcOQuU4jJWMIoXEV4Gybai6iqt0yNsLP8aG06dw2eDAgiLfGQMrGE5WnMsOVmeCduHTXzbAdHVyJFH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 3 Jul
 2025 15:17:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 15:17:32 +0000
Date: Thu, 3 Jul 2025 08:19:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
CC: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm: Simplify drmm_alloc_ordered_workqueue return
Message-ID: <aGafctOUPml/ejB0@lstrano-desk.jf.intel.com>
References: <20250702232831.3271328-1-matthew.brost@intel.com>
 <20250702232831.3271328-2-matthew.brost@intel.com>
 <f97bf2f5-4958-4b65-83ed-bd0eb8a4ca64@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f97bf2f5-4958-4b65-83ed-bd0eb8a4ca64@bootlin.com>
X-ClientProxiedBy: MW4PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:303:b9::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: d16452c3-e120-41c8-6d9b-08ddba44bbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BAUCGzGIFOYCxqEs5JUzvKjKB9nXW5/teoY4dHUYBJoDIVaDwt4OZcQRSC?=
 =?iso-8859-1?Q?RkFtPET16pLdRovMiHVSaHGx5YgFPffdQjQbVmozzq9c6dZiyjDkihFn5B?=
 =?iso-8859-1?Q?E9z/33mvYAG2FfcsNmZyUDIfgUFv7TRjp7JYidPAY3jWkl80vAIvaVMdY4?=
 =?iso-8859-1?Q?J4bJcqz+lrZ82mYuM+CXQN1qbKA7kDs/XgH5Cb+WDFaXB07xs3pFfd+FAv?=
 =?iso-8859-1?Q?odA5fofpwJmh8CDEZ0+1RdEr0GqrUR80+y2jBW6JJ2WKARnWkVnLIfskpF?=
 =?iso-8859-1?Q?8VMywHpZh3ATDCpywjDMawcEk8EUsg9eFnhZVRx2hb7GBkqzRWdIJWZfVG?=
 =?iso-8859-1?Q?4CvsCTsyu9s3HBDn5l2EaSoVhcEnLTP4C0jSOPMeuyWd5LtP7IUW0CVWpB?=
 =?iso-8859-1?Q?n5dGikU0kHj7WmgKhQFuwcIs6nGOMrzmZKXgtIi5kgWxBROXaU9vhw7DW5?=
 =?iso-8859-1?Q?tyEbyxxmZEM285sDmaJnrJ3bPWsrt2WdcFWl6JtqvBPmWMQNhK3AEvo+KM?=
 =?iso-8859-1?Q?kiL78cj0MQQu7uyKnKGNndzGVivy5mf6WQywfrulULix6pKl38ezBijAbG?=
 =?iso-8859-1?Q?ctD1s3vGd5X/o9r8YP95gqOE+K9vPjsS7ZIcjhS7Li4f76IfLoEKcwJdGP?=
 =?iso-8859-1?Q?J1vnh0bXxjlMRQ9YrGqt7wz5/FhDmH5rGewEawqJqRsW5Z26caevKAe+O5?=
 =?iso-8859-1?Q?KcO+eus7f3txpWD3yy+x6sf+uow4+7EH5BZSw27dWweuADsVYDveORB8BZ?=
 =?iso-8859-1?Q?Vmsp4GS8OqfAPJhFBWjIwEqqlRUIFZRTcYdlAlcmGxm3+/wTvD0xXTjHtO?=
 =?iso-8859-1?Q?6lXR193Tb5y+voTZUrTqkZZAGiuwGXXLOT5wHjvyl8iqyXne5q+CMZKxYV?=
 =?iso-8859-1?Q?KFpjFhZQKD4j/k9KAlIcY58nIXM07kdIp0SRS6r8SFShohUnp8v8V7RuOH?=
 =?iso-8859-1?Q?F8akBovsXLLjdi61lqliqiWTXgjn1OeUKZ/pGGcqGOD0iCWBJ0tc+W8qci?=
 =?iso-8859-1?Q?XeYXpYSSmFa4yeyrS2aUrRdV2z8LRoOe1u9gN/mS+kBVIWLiThp8mRnTuW?=
 =?iso-8859-1?Q?uSPapqFpyQ/MeBYhOboBo6isCfIyq7wOcEXSAt9ruQ2myKQca1U71VIAIz?=
 =?iso-8859-1?Q?nek61j1I9wZCY+O9NoynmD2dA9jEHje1TY7APjdwWP36Yb/r0vBxgP40RB?=
 =?iso-8859-1?Q?2e3+V+ozF237iKV0eSlUiD4OoxHewhXe6TYFLsSCqjWecG+ehiLEqx8vIT?=
 =?iso-8859-1?Q?Vv5Iane+sLI8PgdW0mVvCqiYSiy6S6343lfsPHR5Vez2MbLPNOUVFySFt9?=
 =?iso-8859-1?Q?KCHZPqmUDIA76kLz2FWfbhYMd/9DurG6Tn6jw4383uvp7JQ1dAm0EawGHV?=
 =?iso-8859-1?Q?YPzKJrzBSE8RlwSe7pAIfheup2kek6JKPZXKXOby6SUCtvJoLeOJw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Chs413aelI5uBzIB3TVjNaUoXt0iru5LzHYmEgwu3XKvINQ8Nah81O+DEE?=
 =?iso-8859-1?Q?UWugxdkobpz3aTPXUQ4MzHkj5ob21DqnUErPP9qDqBDDJC1uH/ACSxo7ja?=
 =?iso-8859-1?Q?yvwluGyxKZT5X/nWxbPVzsWyBoJSz/S1IKN5ljCT21FTVuz+TWr9HyaL7/?=
 =?iso-8859-1?Q?skm07/Cjj9LvkIGZXtZelRzxkIfFtOZJQ8G5s4m4pRa1lnm9GLs1DvQmcV?=
 =?iso-8859-1?Q?stNgxG3wR7KHK08h7F1jg1dzEoHCWWnhB7bgD595+KjamcQaeLlPk+iXaB?=
 =?iso-8859-1?Q?2wdHjTY8mp+WA6b2n4e01yQ+K3A28aqNgCPCVoQfp389OaGA7T+kZteQ9G?=
 =?iso-8859-1?Q?gZKwl92ysYkOPbgfKBbHoKEUUf4luWh3wZiUuSG22nhFC3wjHj5zBavT5G?=
 =?iso-8859-1?Q?Bt3AT7gcjmzZlxVQhIXcbfYR8go5DQ1F1qh0GWOgAaKF4gdz05lr3kaMFG?=
 =?iso-8859-1?Q?jGythnh/QtdnpyJUl+jpIoROZcG1lQzJ+Fr/cH0n8682S+rjbchACpLiMm?=
 =?iso-8859-1?Q?lIEfj8zvXfgcyFNA7EePFHsERYm6H+n05hGpKUC5a2lXIskBGoR0Fn0lzD?=
 =?iso-8859-1?Q?w7OrLp8oH4lI0b6KkVc1ffkzXHiouZf1ZVBbXhue/n3fRoUXjPN7Yo/GTW?=
 =?iso-8859-1?Q?UfwbH4X4ozzq1AlHhrXSe8Kqp2fN7XqV00yJ1izAcJhCk7gRSgLQ6C2W8A?=
 =?iso-8859-1?Q?8SrUcOWXmy4t7S5HVAnaXQPPIrtn9iKNfJ/rQzwi0NnzADDdr2qUGvPcIc?=
 =?iso-8859-1?Q?92HJL1ELEci/psSMuL47Cg5V1mcopTdt0CdotXzKtR2e0y2f2tnvRqWco0?=
 =?iso-8859-1?Q?Neuubl3yqJfaBkRVhx6jdRAcTdOL1dA4gPDZwZdzBhEqm6O54qbNkULH1B?=
 =?iso-8859-1?Q?L9IZQbTwfq/yMtDhkFdYuATYpWYOU7VcsEjFTv+Hj+IZvmNWBxCwjSDmqc?=
 =?iso-8859-1?Q?967HfIAMKWFYJXkqs/e8G0fOlFlfmcqn1DnYSDwc3v08g8ay+87VMZED6Y?=
 =?iso-8859-1?Q?2R0ymCR0szCxIHa8V6XFZU5EjsR4A60KRUY78xstoQTyiQ38283MN3Ctp+?=
 =?iso-8859-1?Q?E9xoM4GAZUM6lY8B3rks4tIhb8Mg1LCo4bEXpWyl0m3QY467A+o+AxYiYQ?=
 =?iso-8859-1?Q?3dmuxbgIFjPcNJEBB2i3D3/a0jDyzCv43DahvdRuhqih2ZyldZIu8r2S+D?=
 =?iso-8859-1?Q?g4lFVwtKLBaolVLSW03uffgUtaCYpl8mEpq5BqZBWuBBchNLZoPEjhdfcn?=
 =?iso-8859-1?Q?z0dcJRWWs1eYP2TAQwCzC6w/jreHIamwJgNIrxPuGYuu63FzAe34Doot3e?=
 =?iso-8859-1?Q?IJURmPRXEuHgsKMQfcVSJ76ME0btaAnT26qDkcxoQMBmozCbmNjjgFLhCI?=
 =?iso-8859-1?Q?XZrS6Oy7n2vVtPlly8YeKrn5GXtltCQdha/cTBDlmndKCQoc/3Y2eeyy9D?=
 =?iso-8859-1?Q?Ex84N13MyrMYlcAigur5sfoi6DZSOr5wapFEuprSlAeh4QUzwn8u2R3bA6?=
 =?iso-8859-1?Q?+fiv5La9TyBNaExV/f27ak8ULgUSqWQVkCaJg8TTXOSvT6x1VhUph6+iW/?=
 =?iso-8859-1?Q?VZ+/TPMiqcsdQZ9JP4sSa8wUP8qXU13DIp4elbg01yDJcTsMLgfersliiS?=
 =?iso-8859-1?Q?QbJBfmXuxD++rEt440oasgS8X29fGVE7Ak+1uLVFDNxY4vlqYdHe4Aug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d16452c3-e120-41c8-6d9b-08ddba44bbb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:17:32.8461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A85zmSQkPxh2tt5PajzNqwoam2mdvOxuF6Hn4UH4zDJFBdQd8jR728R8yDt5R9Paa2B8HHVKhTC+dkni3cIwYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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

On Thu, Jul 03, 2025 at 10:12:41AM +0200, Louis Chauvet wrote:
> 
> 
> Le 03/07/2025 à 01:28, Matthew Brost a écrit :
> > Rather than returning ERR_PTR or NULL on failure, replace the NULL
> > return with ERR_PTR(-ENOMEM). This simplifies error handling at the
> > caller. While here, add kernel documentation for
> > drmm_alloc_ordered_workqueue.
> > 
> > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> As you need it in xe, I don't know the process to apply the patch. Should I
> apply it on drm-misc-next?
> 

I think we can apply it to drm-misc-next then cherry pick into the
needed Xe branches. I'll confirm with my maintainers and apply this to
drm-misc-next.

Thanks,
Matt

> Thanks,
> Louis Chauvet
> 
> > ---
> >   drivers/gpu/drm/vkms/vkms_crtc.c |  2 --
> >   include/drm/drm_managed.h        | 15 +++++++++++++--
> >   2 files changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index 8c9898b9055d..e60573e0f3e9 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -302,8 +302,6 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
> >   	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
> >   	if (IS_ERR(vkms_out->composer_workq))
> >   		return ERR_CAST(vkms_out->composer_workq);
> > -	if (!vkms_out->composer_workq)
> > -		return ERR_PTR(-ENOMEM);
> >   	return vkms_out;
> >   }
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > index 53017cc609ac..72bfac002c06 100644
> > --- a/include/drm/drm_managed.h
> > +++ b/include/drm/drm_managed.h
> > @@ -129,14 +129,25 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
> >   void __drmm_workqueue_release(struct drm_device *device, void *wq);
> > +/**
> > + * drmm_alloc_ordered_workqueue - &drm_device managed alloc_ordered_workqueue()
> > + * @dev: DRM device
> > + * @fmt: printf format for the name of the workqueue
> > + * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
> > + * @args: args for @fmt
> > + *
> > + * This is a &drm_device-managed version of alloc_ordered_workqueue(). The
> > + * allocated workqueue is automatically destroyed on the final drm_dev_put().
> > + *
> > + * Returns: workqueue on success, negative ERR_PTR otherwise.
> > + */
> >   #define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
> >   	({											\
> >   		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
> >   		wq ? ({										\
> >   			int ret = drmm_add_action_or_reset(dev, __drmm_workqueue_release, wq);	\
> >   			ret ? ERR_PTR(ret) : wq;						\
> > -		}) :										\
> > -			wq;									\
> > +		}) : ERR_PTR(-ENOMEM);								\
> >   	})
> >   #endif
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
