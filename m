Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEE58D6FD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82301CDA2A;
	Tue,  9 Aug 2022 10:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0A5CD9D2;
 Tue,  9 Aug 2022 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039199; x=1691575199;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k93SikZPvxMIlKN6YpyKMEsobZDu1IZszQzH27PhImw=;
 b=JK7T45+25UI+lr95LZOip16mPZzAPnJlLL3SqdOjc942bJvvIV/l8RLX
 bI9wVA3c6yjE7VCVJZbIcgu8DbWMVp0MoipJfF+Kk/amyMnGQxCkCLE0v
 H0E3B3NHBCgoYvsUO0yDsJQHctjLQ7/LHG5Emp4JcdQRTkPZWkFYYb6CJ
 9oGqwUTCb1MqfiyZz1DVp/GNLqB6D0zH+YRxZTfD2Ya/q+ExwqYvhkXYK
 iwBJluEhIl1ohhWUCzbCRMaB3/Z9zxEhcWAQ7c0aVJapCy2MherwcnbTk
 cUjGpBiKaFI5RNWDzS7/Fx9Zg/rz6iLxQEz89opPQqfyKJuLE2B2r5tfU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="352528888"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="352528888"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 02:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="608158960"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2022 02:59:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:59:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 02:59:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 02:59:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1jM8VrNPAW1FVqjPzAejbwU8dF7mcFVVBh9dqqyDdOzvGzpoyYfepQx4ReozSMncS09+7/XCEGbEiPQ38+1XNdn/pEtmUoxt0YZDg7ycaQCc4D0noZqaIjFADNhSkNKwqEPyy47OSLtJGBxibYSqsKdx8d+mViCJKruuJ8rkGaAqfsk6dmoDLEYDhF1eTUUycTJ64tjf0LjL1mwyMpUyp92AARA8qgQtLwWf7lAu12FYHe6c6MirQc1PNG4FjLxcY+UQTZdzdPZmK1sliLe1HsjUxtFvNIAtlJkIitMaWeN/ONcwIls/Us3bBEOW1uSXsc+ycYXtdyx1QojCT3ubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73rLQfrjDJlDCmL1lgkj0jrX32XtvJiJ7TNBeS3qlKo=;
 b=bY7SYVhQGWLvm2y5gwroi3WJitmlBAPnJVTN7GTzIg70Jvn3/K/8bqlDGfxyulMjZuY/mdDEmRZVfx1e7XPVVk48FkD/F+Q52kcBF6Nk4bGCm3LC/9VmK9QhuwPKlMp56skBoJXuxg6JjUybgNf48eSYyORl9ShzMPXfKFW3/D9zjgtnX3v4RW/U2+olI5gtZYOrRcVjMWMSpV3SGQIRQAkzA7MD6hLlhv0NXBxu8NlYYtIDGT0g7WtWEvBq2WUEaMnqHH4NPwtcCqDwgoXLAkv+vn2YF0GOZuKc4utJ+0dXQ+QrbGfURQMfUxcPSo9nFaZP+YwUbVcRK5Gp34BXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:59:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 09:59:49 +0000
Date: Tue, 9 Aug 2022 05:59:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 19/39] drm/i915: i915_gem_region.h: fix
 i915_gem_apply_to_region_ops doc
Message-ID: <YvIwEIfinUclVQN+@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <f197e0eccbde017dccbd31e72c892a102543cb90.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f197e0eccbde017dccbd31e72c892a102543cb90.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e32556d-581b-4bcd-79fd-08da79ede571
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4958:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDOAZQSU55NLGflhyrMtxef3SdJN6TJRiLWw6tHEsp+r+EvuAvJ/OsSflc/tKnbK8xnDlntkDJbydETHb+dEqOeqOarUnGmDBOJ+l3tghVjNiL6VV5NeNSJrxOTitKTyrbXvxZmVbGt4zydOBZwsDqyJd22Kv8xhHHEFPGuiW9qvfCDm3xp2mKkP0Bu9y4eXLUN/m0wyr39z4/cxxn5VnIx9eDU1oiwvyeGjNUsoiccXhwwvusWo5vhyaQ9CzV5gCY0unD5yiJIAozJ4HUNt7nCBuMfcwQ8SFPCA91e2cxUFLG/6bho46BLR2BLK8vR9oE0q8XCKx0lsVQwz0q8PdDJMcVjaMg+sNmLoCMEv8A0Wf8dX1namS/LO1yP2DWAlWbDoJEfnjzTlWvwguis06rTTkH4MArzsB7n9CzE4MsOI6wuO7ktHo3QiFzWC8MheZL+BC6rpaW7zGeiC5fkLZY1wU5dFONu5qN6Z6g7z6GsB7ihNPaTSzoHSt9OHYfJK1j0PddAr+jYvsDbUC6gnu6iXbeaPGMt95+wU8wUJZg4lllmZFhyDMXb6FfeEHoKvjYPf9aOkI9LMPvQg+i2vhTquJGvuyZkMtCSor6iVQ9y2idS2t01K161ikab2l5lH4I1JPRXi7JBL5cLARJGvzndAEXOYQa/0X0BgQyRDIjxGmJP3bb8C8fmNa6k0hbFe3Wupxqsl/ffpCZ1HnUUJTK5rX33uOpwnNLlLZbHEr+Qkz25pyF4M/aqPKBJHHHUBFFxmuT9GjB+MBElFbg0gsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(36756003)(26005)(6512007)(6506007)(41300700001)(38100700002)(6666004)(966005)(6486002)(478600001)(83380400001)(86362001)(186003)(2616005)(82960400001)(8936002)(8676002)(2906002)(4326008)(66476007)(44832011)(66946007)(316002)(5660300002)(66556008)(54906003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kdO5PSsyYtl+cWw+N1uX9v7r05kEFa8fbrpCnfAeGhsIA3YtK3n2LIaPjRc0?=
 =?us-ascii?Q?ngHjmDm0vtJ56fw1U0G9bLqJOHlvgN8MB3yz0XW6pNQjhHBqVglwfhpau4rQ?=
 =?us-ascii?Q?ciYWXEwmHfrTDnnvPRLuDGvWVYszEjwz3YB14KWy3ckrqY5qFm3MocQVugLK?=
 =?us-ascii?Q?3QtIc+8ckvc34glWf16NMY/lFQuM0PGCCPpYIAUNN5yBEiHo9JvT/pdcCgLD?=
 =?us-ascii?Q?FZ44+0P2L1h9aIGr0FoBIOdIxSsfNvbZE5qDcmmtR571isA/6C77uu6uqz+G?=
 =?us-ascii?Q?UAgS46S5hrwzGKHG1wj69e3A9dFBCc8CkjeGvnaY+LGm/wEcfSFPjhGny6wT?=
 =?us-ascii?Q?O2NrwI7cewei+Gi5NL9YLe02lMLOsWf/uWVdHu3KuzDVXKfYIPtznEWJXxw0?=
 =?us-ascii?Q?Fel3e+2ue4P5bTEweo6jLDt63cqKaRfd/v82EZ0t5XJnNlTIWr8urIqiLNEi?=
 =?us-ascii?Q?OxGrGCwOUIoVotNs+Q2vi6SvaC8exi4hnTM1ANy0cLKWH/RO9NmHIktUVbxy?=
 =?us-ascii?Q?OtJmiSvwtM1/iiPreubfyx9DRUJNksy3eC6GMvUsNpe8Z+1a8vu8qk3z0oyb?=
 =?us-ascii?Q?DOMVwgEWqNLaPyG0O2YrTp/yD+5aHvO1sssCxnqmJUTX75m17RF9ihrG4qNq?=
 =?us-ascii?Q?/qAGyQNavK8znh7p1yokFDsZuMnarYWiLHCGcxG5tGau6qqiCxEegfzI4spQ?=
 =?us-ascii?Q?HspeOTA9zZdHbFN3mZtbiBDoC5mEZUTmas2d6RKuJ+O9DJGC4d90ClOV5bJe?=
 =?us-ascii?Q?Bk2NTUvTtbaHUlUjNULs6mKwsyV47ldxI5ScoNqC/gvkWsQQN9mh62JiwGnD?=
 =?us-ascii?Q?urMikzKT4SuJp64GXLU8Wht0CXCpEwIQ0JR9FaapzgBlFfnzQQ4XZ6ofucco?=
 =?us-ascii?Q?iPVGbouH19b0k9GR+MnN/0ejWlBNWZ2KGXz23YXkvklLiFQE3dw3NHmEe7Go?=
 =?us-ascii?Q?OSLRRKj8faEdaAI7Bzz/VY7usDb+u1aJ86vjM1vvMLfae0w6q/tV2wdPOiyg?=
 =?us-ascii?Q?kdZyATDkYXPwPubwNMAIn3+w4FCvEtkj4kctd0hskTmgK+vuvJweq8+MYudH?=
 =?us-ascii?Q?WYwjr4Mk3ZZj6HmK+j5XhBPcsHWyz6q96ggabZYMrz0Q/cY0oPIjJ5+BdGUI?=
 =?us-ascii?Q?t1qMMKjv1MIksLwDbSOAwnj0916cSE/MY9yvjP5haZOlabshiU3k9NxbNOZM?=
 =?us-ascii?Q?eNweZ62+3wynZ3P7yG4Oixjg9afcZtWO0OZf/t4P0VqA3DX56XlTUYF5X/67?=
 =?us-ascii?Q?Rrpw1CtBVGZruRI7NSgyQ5WNPHLfOPxZxkEFIV73Py3TtQFW2iTsTCP9qWTy?=
 =?us-ascii?Q?WmzwTNlxPDz6ifZitSnI/F0P8e1KgbpbV8vQtpQK8apGsD9S8E+OVtp0yZNf?=
 =?us-ascii?Q?Bkoa6EHAVaHj0Jv2B6TV1Cj6Ojuidm0goOivW9/ccG/j5+tMBkIkj8+dE4tS?=
 =?us-ascii?Q?TH5s0+Rk/vblsyoG/jtHPHvg3siqitsYWcd6zPwWuPKsBvrjk7pJNgGSOwfy?=
 =?us-ascii?Q?hndMBOmvTBg8L3y9brzefL+V4BDeGB/Cv2mszmxi3UYfQyPvN02ezLI32hhJ?=
 =?us-ascii?Q?AyUmWKsdA3oE0E8PdcrB6JLU1wgjXjbxowgqqFXu2oN7rcbc5gQzE+Be8CWw?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e32556d-581b-4bcd-79fd-08da79ede571
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:59:49.2956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSAX1VN/W2WoBcOqKXrnpDcqcGDv+lxUcpRvRMaQmRqd4tbwNCgKcQG4IgY1jiomeio9iI8eTT8+HrdxvL+fdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:07AM +0100, Mauro Carvalho Chehab wrote:
> The kernel-doc markup for i915_gem_apply_to_region_ops() has some
> issues:
> 
> 1. The field should be marked as @process_obj;
> 2. The callback parameters aren't document properly, as sphinx
>    will consider them to be placed at the wrong place.
> 
> Fix (1) and change the way the parameters are described, using
> a list, in order for it to be properly parsed during documentation
> build time.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gem/i915_gem_region.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
> index 2dfcc41c0170..b0134bf4b1b7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
> @@ -22,9 +22,11 @@ struct i915_gem_apply_to_region;
>   */
>  struct i915_gem_apply_to_region_ops {
>  	/**
> -	 * process_obj - Process the current object
> -	 * @apply: Embed this for private data.
> -	 * @obj: The current object.
> +	 * @process_obj: Callback function to process the current object
> +	 * it requires two arguments:
> +	 *
> +	 * - @apply: Embed this for private data.
> +	 * - @obj: The current object.
>  	 *
>  	 * Note that if this function is part of a ww transaction, and
>  	 * if returns -EDEADLK for one of the objects, it may be
> -- 
> 2.36.1
> 
