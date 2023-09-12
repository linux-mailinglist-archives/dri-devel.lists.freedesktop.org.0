Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBA79D425
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF42110E42B;
	Tue, 12 Sep 2023 14:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9E910E42A;
 Tue, 12 Sep 2023 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694530667; x=1726066667;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=omWpc8jUt2SD9MCrU0q4VsolbWWsI977nAPy8t8tdz4=;
 b=bleOu8fxJzNNF3IbGSzHoxZozJwTE8dfRya77tB32PP6IXAOO1gMaYXy
 vRETlEGJsfT8DCuXozZwqsL0Ief5WDlTm2Lf9GgTdsx+uE7L09Z2+C2ac
 2Joxgbxlf+5Cy0t4CjgNBHefVHhTOBNfj9AohJSjWKMBcFnR0F4lFbb/1
 qDFYMvluDvTDHTq8GcsLqOCBczotqT2+8KKzoxAp5t+pUYO/xxkIacoJ0
 41mKFQCrEkm/xWuI9dCQltY50+H6fCMIvJzJ6qrjiqmgiI5SVgDhUJ5HQ
 u+QIvf3pSI7/V9JeE46xHu9kAF2hmNtCRXDphSOnVZBGqvPEOAnlnglUN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357828683"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="357828683"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="833931761"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="833931761"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:57:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:57:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:57:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOjQNh2ESpjacAIgM4Pg/TJEgNoyYAUkANCVtq/PMNmSqOjr8raBUG9yPjDXUEHYDPC6QFQ6QaRdmPKOKJH8jHetig5CvqG6X4MvpN3RsavGVd7yeMMUV3uZmlIyqXzRU7VPx+DHSswJOrJgRDjImH08Sfyi2e5//ScJDd2fiPMXtEk8Zi0nsFCgUBcind+GWOyp4wmc5wGCivwHkQgRQXyX29foyII4OBHMjMmf2QxuwKD66/vzaowfPSf57d4O3GM6E5Q7A02jjvvpRKAbHIxBZAjCsT+0eFRGXzOUqojkTqnmM4I+5NeVS/y/Ku1z5CDzZBmaSIO9o2IHOjna4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH2hsGB7NaEqSl+mSELiyeFT7CRP7EowTRycaXqqz/Y=;
 b=CsZcSkAX3cu7ytUfVt5bON+GRX/lA6kUVa639IIQFhytiSWe7e43RKL96hbirVcZilEZN71SfZKJuZ0cf5vTZFXxQ0jKbs55cV02efD+4JlDm+aXbaZmdUIWqNu2Ywsg4YeHlUB21PVatnf3+x/8pIzlOUmybwJmfHZj98QS9J+Spr6rPXHpHeNpY8diFVWC9OUUkAkEz0qlayKDs1mSj7R+aUoIa9ezuyYe8Q08ab0ASFjhy1on0pcmS3EQEtN8AlM5kBaG02KPSqTNpvAV1nEuGIKhoU0xsmNS/lZft49ex7CMveaGAj548YRGW5MMH5Z9tPMlp4tnoQCUAQ8ZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM8PR11MB5669.namprd11.prod.outlook.com (2603:10b6:8:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.36; Tue, 12 Sep
 2023 14:57:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 14:57:17 +0000
Date: Tue, 12 Sep 2023 14:55:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 05/13] drm/sched: Split free_job into own work item
Message-ID: <ZQB75QcbUoMjuubJ@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-6-matthew.brost@intel.com>
 <20230912100833.792eacb6@collabora.com>
 <ZQB3xdWpukcxB4dh@DUT025-TGLU.fm.intel.com>
 <20230912165300.53c1a151@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912165300.53c1a151@collabora.com>
X-ClientProxiedBy: SJ0PR05CA0187.namprd05.prod.outlook.com
 (2603:10b6:a03:330::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM8PR11MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 11951de9-5fea-4968-670d-08dbb3a08ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDqOCejk4PcwT5g+tk87HnAS+hGkY4AzHqHNhqAgx/bscpm28A6rPvvASRrR//7j/SqUgvswU+HsILQBQ2npKeeh1ZNa/jJdilMEg20Bb8ClL6gH0AfMCu7mbZd4JUWl6RbRWDiv1M4b1Ois73sYq/Z4IL8ZmYhzd6d4ftzCk61CotXlQrR/1E/swEQOnATZ7EB472QX0nNX31TWONJclQsyafb9a2JkeM/db7Atbz1v8b0BTzxvdgOsN1+i2goYttQhy9OByKDMzQLI9nrLH4bYIpETcW+E+b6Kqapu2xlPJcmVjvpAwhXUs7LQAOLnXH1BNdJfU0p/hwa5Z5tA0LIMVHsdKqXrb3OcDoqm8F4yESJzBSjIo0YWVimNZppp1QVhjHgdZL0+u2+V830/DhDeKIOYp5UteulCcJqRpSh2EkdUCC8D0ydujSklNZbjeZNY4f/7NCOyHvJ49IIeyYit/TtI2bj+0kEuOlJo2KNL3jt815W1XwhnLQ3AWq7GNaksInu6jsvPfxfMo/g+ujGIrR6CdWOfcM1Ub3OBHrsB67ns8WhdP+DyaNSr9BEL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(186009)(451199024)(1800799009)(26005)(4744005)(83380400001)(2906002)(66476007)(478600001)(316002)(66556008)(6916009)(44832011)(66946007)(7416002)(41300700001)(6512007)(6506007)(6666004)(6486002)(82960400001)(86362001)(5660300002)(38100700002)(8676002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1wa9fZ7Au41ktKfEuUuqxV5jSXHXSSmAifJh4aCWIL5axTNzmz4Px59Gyx9A?=
 =?us-ascii?Q?AtqsASpJcK7v90/5bIDsLlgpwtRlK5b/wqaagHUUjc6KMybMhk3xVgq4hO3D?=
 =?us-ascii?Q?KXxQ1tsJ2w7HYd2m3BU3CkSHaBjAYP9pwTnE54kxV95i76sjfbcONfu9i12v?=
 =?us-ascii?Q?+WvExfxleLW0joTCm8E84PLUbToGmUiDBxVvYAgx36ggbP8dBUHZQIQe0a9S?=
 =?us-ascii?Q?Mzg8qxePY8bZI8TV2VuQnnWKeujat6VEwXwBhuIye6EBBUfTfGZfOkt/OYGu?=
 =?us-ascii?Q?A1sZS0YrLj4p1ga4F19C4m/qF1r3OawCVlwZbNQAgcVkH2gJvIqj5lDmlDhB?=
 =?us-ascii?Q?1XQGtCUcMDNEZcKURqKOPG2Tt8g3nbTHBLY/aayXjRHkbVqi/TR+7gl4Rqwj?=
 =?us-ascii?Q?3QmKkiSglgGgJvc7rXzcQC/NNF5m35udyNU8Dbr/OmhJYzMQzJNHHvnxziFi?=
 =?us-ascii?Q?MB/6FLPRz9gDebrRixU8RJBNgMBU+D8Q6/YCLciL1CnFt9ThICQkQF5z5pOP?=
 =?us-ascii?Q?+phfF+PuqjjdO9YoL+J4C2h8vf1uSLWwyc2tKGL2CdB+y+JWECBsKIrN4gbA?=
 =?us-ascii?Q?JNQIFLmPtNFKrdtm/esWHgtmW/dFWpq062SG/DGXXBQbqMtsdNpyqf3k7OBM?=
 =?us-ascii?Q?WuXSZe9A5DxMrNHTPfBX3udjXnrkaExM4CesoODyrTE0kEBNNWX5tsTU0/tc?=
 =?us-ascii?Q?X69lID0BYv4xk2YkmSeodkl2oOxHDJ54i521cn+p/XBgVwLqm8RN3f2/64Br?=
 =?us-ascii?Q?a6hR3XzJ89ofif5nyqavfr4yAbIjLwkRaQkiY+Sc6XGjaO+AgZoFtM4ttoOY?=
 =?us-ascii?Q?LPywdM1bFwwLZVcTzwpgurvlS98G7Rkkn+gZovTtDJsUx1/9E7FRAk8yBDsA?=
 =?us-ascii?Q?lSyvZOLLUljy1NNHPyr6GfKo7hQeM2DlYFrElnGn9zEtSL29HCLPCHjNaGEa?=
 =?us-ascii?Q?sZ85Ba1YfH8Yfc6PXIxNB3uJpe0ItBAVqxR8CXFcuMlIdC0yKX28syJHD+jv?=
 =?us-ascii?Q?ye9srKkvs/xk4GvjNpS5K0yY9kpDjvefxefUe10SULBRmv6fXbVyLLs75apa?=
 =?us-ascii?Q?g2Hl38T0ZBem+GrQYqXWi5zeiXng4uE7LwDvQmL8GfypoMYin+pIB83zfHWe?=
 =?us-ascii?Q?bAtkdYfVEnC7lb2V8Z52XYUdyQwRUrk7ByeTb+x9Hq0CjjodRXru6HVs6/qX?=
 =?us-ascii?Q?5lAB79c4CUHjA1QZpp1GF8fpLSq4In+SpLAPPKtHGT0rpgT+AreGFWcZfw0w?=
 =?us-ascii?Q?zYfJUNquu3N9PD5HKsAhkP9MKPRBFIYBLcOkMd8DcxeReZKwO5pcmpl/p24l?=
 =?us-ascii?Q?eNtvbpBbEvkwBQ2xrEhCgp6JYbksnpIZKkqHXhN8BTOwsWteQl14znetEM4s?=
 =?us-ascii?Q?hUsMUQ0+eXrgOuJyFUK0Vko6n3GDrg0XdnYYgv/2nzft2H306FDXm/SC4oGx?=
 =?us-ascii?Q?h8s3jqU3udYXW8iCzbBYuD87DtQsrnuH7fMPjXGn0HLEkFzEh3J13RhYJA9K?=
 =?us-ascii?Q?9295+CNAGO4GLVU++BtEmjEbIBdHo9oNy+C/JETv3cA4yb2ZSM72oSlg1fgj?=
 =?us-ascii?Q?W0YbyaXkPqtLRbxiooJ0rgqEz180W9KuA9JG8w9l0lhXkq3pyanavPl8+4SH?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11951de9-5fea-4968-670d-08dbb3a08ebd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:57:17.5270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X4R+TQ9xfZSPXKn8K2ucgcNnY56oHkx+NWs7gIQ8keXGgU9jRqNQxSRL/Qok4/a914ohg1aOJ9ZksN807o5AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5669
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 04:53:00PM +0200, Boris Brezillon wrote:
> On Tue, 12 Sep 2023 14:37:57 +0000
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > > Looks like you are changing the behavior here (unconditional ->
> > > conditional timestamp update)? Probably something that should go in a
> > > separate patch.
> > >   
> > 
> > This patch creates a race so this check isn't need before this patch.
> > With that I think it makes sense to have all in a single patch. If you
> > feel strongly about this, I can break this change out into a patch prior
> > to this one.
> 
> It's probably fine to keep it in this patch, but we should
> definitely have a comment explaining why this check is needed.

Sure, will add comment in next rev.

Matt
