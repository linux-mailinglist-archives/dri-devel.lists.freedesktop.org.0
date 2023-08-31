Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E64078F32C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFC410E6C7;
	Thu, 31 Aug 2023 19:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E8E10E6C6;
 Thu, 31 Aug 2023 19:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693509462; x=1725045462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xDgK84qKpMt53S++jlaoMjj+8Wtz3g8TKRhQCoEFh90=;
 b=aFi517EnrVaN/Bv9a9uyUWTXVXEXHoHSpNQgUyG+56y7hLTjeBCGfGb0
 Gopu8DfqbF+pHrL8V+7QSK7FztOTKXWGJHeFlsh7r8AjJ8as2BGfbRI2F
 IC3kMPpi82Qq401q6SwKQ7gUSqlqbDj+U8tqSx0gOfFcEh0DPnWaKPX6r
 JOayZtD/9miqjZxpikm3Alt9n9SgRq9jdiiUR408Nxk3s738fmab0YUfK
 8jh61o294eGk5VuAh2edbEEkpwFtZUVFV5g6aWqbBgZk7aGEi8FrGcSWn
 mQ91FNOpAG/r12nSlDIuNtIyo/QeKfmb0oDgmI+Pq6KDjGTFLQgcO6yGR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378774910"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="378774910"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854395303"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="854395303"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:17:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:17:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:17:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:17:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8ZOFaFWTvN8sN6kcdsSTAqDqGehB5zqgM1DIRAbuuKZ7r8DSq5LhjqQ+mqnhobqxbYaJncFxm8uZoOeqzBHN1jBqKjXD8KaSIEkRVfti9gz2mBAWjv4cXMrIwKuaM5iUFzSCLvcyQVX+V/h8ADJlJoZEk+Xlm9gb68lcR4ZgWYivcvCv5Mj2JOAJZ2r4wGu1vtsb2bgh2TrSYAtW82Qcn305tXtoh9ckhZa//XVJh2d3fX2Fbk+Otz4g1y5sDz30hUIbnSaBUKLa/hlzmxR9J/kvlA0BQxpNHSF8ECCsma17AkqbM7EdH6J8n7N/2MaK3kRInkl3hwQtuDWpuAcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5apbohxVHSvi2fpxKgm2xVU8iq8dgfli4E7guOj6kE=;
 b=jCRLFnEF0faDJswQ6BWpE7KKmkkdPghsljID+w28QO1jKN2HUXbBBMlUD1bL5+XB8GAAxmapji9L3h6AuUHLzXeCa7uzlWX/5lnb94+nlBvG09WhhIBCnEqOTQt7aKkgr39bRjn5c8dchqD3N1/LJy8067icryb6LZ/pYXmUaz6X3OECrmJCSZrceT/Vkr/Oa9VE1y2w+889lUXTGi30Gkp1KVb3T0FMRCOd0tEspJYLKzPXlxcHE3o2D0BXvj1hhbItuZB+5LfbiXzx9ewzrM3o648td+XVofmM6MsumKlsZB4D2/AUVWr8JkCOm5YNDir/afGsQtCVVy+T0WiY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Thu, 31 Aug
 2023 19:17:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:17:39 +0000
Date: Thu, 31 Aug 2023 15:17:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 4/4] drm/doc/rfc: Mark GPU VA as complete.
Message-ID: <ZPDnT72UCgOyY/YC@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230829163005.54067-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR11CA0079.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 923a2808-dec2-47ad-8e1c-08dbaa56f0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GoZr4fd5Tiy9cR1p8t5M8Rvv3r/KcQnzuDRSIzrTWgy7WrciLnA7ITv6BGKDYKwlwvkFRCkQ2wAlRpEVwUw9Vvxlxqm1HSBX4MAc5sHGOzulYFqJi9XCKPVu+h2ncug/GBIqRcldZKggwc2jShYHgPkK/ui91vnYYuzH/qkLEeLIxfWK8BTDZiUQAFVIgh220erWzAACiqgW5KfaOBhyEFyJWmAT+FqiJEWuwARFNamsYWDpmpS2guYCxfCVjIWGk2hiQCa9h3Xd1ry3Ir+/P1UxS0DF+mlf1fdjb2NVrnqxxgHkppYNq2S8C6a6ucol4ApGWwSFM6f+ytnKLRfa/6avrvroPfl36y6Xhl87d1ojaOGP+z66jU1YBVuYhyFTHvxu4UnffAX08YaY5kOrt1jlDdMNB+YUWNr488wsx8gTMbMyti4+24+YX8iOVaGY9mqiy4uJA3uBYB008VcjGda5o251RmbLUcKylWP6fHS0zxudaig5enhoTwO1EwLrzPpacexbnVMgqQDSLZKhwjiY/yWDhg2EjXsrTprv8vGbRo2fdnPJsp4VYQ4V0aGp6qEGJ4DvT7TgdQh/SaV9TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199024)(1800799009)(186009)(2906002)(6506007)(6512007)(6666004)(6486002)(478600001)(6916009)(966005)(26005)(2616005)(5660300002)(66946007)(8676002)(316002)(41300700001)(4326008)(66556008)(44832011)(83380400001)(66476007)(36756003)(82960400001)(38100700002)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JCHJEl6lbIkDJC0jvm0tSyHLK38aE34kIunfU9sLehdnMQvgCv2p9sYHe2eH?=
 =?us-ascii?Q?57lMjmXy/mY9zjsWqkx8v76iyULH/5cHL6NcjLrM2yYnQIfEpXgCGrODhQdU?=
 =?us-ascii?Q?6Wgl+1yEUlgTpZQ0ImTYsUKbx0yh4FB0LIs8IsrtwJG1f+6894Hv+yc+iDb3?=
 =?us-ascii?Q?8PaMUgXHiA+d+/T26pve4CwMC1SN3W3/9S+hOgoVAxDcs7A6ODrarxyF99mZ?=
 =?us-ascii?Q?Ye9L1PBcC46EZyrdFn85NXlkCU0BDAl6s+Z0pzCj+6+qkZabqZFY8U5jFUU6?=
 =?us-ascii?Q?j+ioOcWKWl8awl8uJy8UDzOmYgzXD19qprdMppnfqUbqoeTyYrliyP6T0QBU?=
 =?us-ascii?Q?WpkEqIZWTt13GMuHs6+EsNcNSrtW3F/r4WhcxQrBcSQYqwJ7s5NVOdco+WEF?=
 =?us-ascii?Q?FjVRmcues66XHwh4wFs+EFIjY3Bn60S3sCMkrMlTPQqsvNQyEX0tj3lSFpq/?=
 =?us-ascii?Q?HlCH89y91yZWuYn8Yt4OozGAGmfSxEnmNJSr/RR60R+YruhpT0gwEGr8JIXZ?=
 =?us-ascii?Q?o5W7CGJI41yAJNl5hh8M/5pN/ZXw1AfRe3CCk5r+uAPmHQJzm4nVz01wCZwP?=
 =?us-ascii?Q?JymT896f7zTIq4GA3+lmIYFEZKHECrvr0407eSj+gVMIONeKGhmpzMtIMa3S?=
 =?us-ascii?Q?ZV+5n/mvBh2z6iJAxJ28lh+sWvc4O0NVgRCIc+4GUUwpDqOygu/FYgUWgX43?=
 =?us-ascii?Q?+5HjucFD0pHc3E711sF1ov6K+Xft5QcyEP/pwlFbYJUTeag3TqpZER+F4CSb?=
 =?us-ascii?Q?pmNNbvjM+fctqjZixVjkX74KDJRe8MbemhlldQ/0l7gaD5LqOHy+/7FckItf?=
 =?us-ascii?Q?S9ZZjInzkEwhOPF7RnsyFipAn/KXlmOqjPO4onhxNsnKkwTi4o+76gtAOwl0?=
 =?us-ascii?Q?HdxvqXjLXBr8cH4DeGX8yhh9lxBuKtlH4D0+eMqfrfle0APNpPROO9qZO3ou?=
 =?us-ascii?Q?iKkiyUNbyBFxAVYCBfcYava8Ln10xoVxLh5/HipBX2+861cGDKfK88/fM4SJ?=
 =?us-ascii?Q?Lja39YA1ZZ+UnbrBTpMCnEHxUSngDJEXHqpie7uvkz/4XmeLngudH8wthZMv?=
 =?us-ascii?Q?4nDQ+aX4T+LqbCf2MDm4Pa8EAJcGGUolML/FN7HqCyGI+yjV+tvfwI/N2wS3?=
 =?us-ascii?Q?wzjyEImY11fU+51Hc2nP8XBuj1VNwCifowexhZkTNQsO1c3RDBX2hwnSUyIQ?=
 =?us-ascii?Q?rRvQTSDS/78jCWesykZsjr+W1M1uA76XyzsWvrpZyq85wpQhwYU1k4rJXzK+?=
 =?us-ascii?Q?UOjwNUiJKE+lI3JwpVu8SnKddk/P6BJDxIK3SHhzlF6Zg3FMhsE6VJWfg47i?=
 =?us-ascii?Q?n59MhhQbNBQ+8wULsVVetbQc9JN1pCts8oGBxJyprwrAxYW7RWIR7eS9ELur?=
 =?us-ascii?Q?W6Y/zhj8gIm7osNY8PkwX3JihSYqQsSDnmvwW2yDjKPcaBTIS6ukdGmJ2Lm8?=
 =?us-ascii?Q?MBwzK6Cw7K5zWU6UZ7GCIZ1J8vtzwQGKK9CzdBhrCmFFhoSz7W2QfG9HefE6?=
 =?us-ascii?Q?Xmjv2/1L5qJ38CbewWZqIF0tgznqg5xgCwOS2SFV6wiuBqhiRSqx74z5yXc+?=
 =?us-ascii?Q?/IMORB5xOXh3x1zqgKQh7zQkChNcxhlwyItV9lQ9ku8EXDq3IY9WLGwq+uN7?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 923a2808-dec2-47ad-8e1c-08dbaa56f0ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:17:39.1138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD5J9RU/OPb0sa7uvwQIdC1ez44vgo/hTavTZOqMbJ87xCKw9l/koWmKK0YNCZ3WHHqY+HeIk/pgDfRoDqQUQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 12:30:04PM -0400, Rodrigo Vivi wrote:
> Nouveau has landed the GPU VA helpers, support and documentation
> already and Xe is already using the upstream GPU VA.

Danilo, although this is more on the Xe side and I wouldn't ask you
to review our code entirely, I'd like to get your ack here as Daniel
recommended. Meaning that we are aligned there and not creating any
change on top of GPU VA. Xe is currently using GPU VA directly without
any customization.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/ea4ae69e66b2940107e74f240ecb9dae87bf1ff1
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commits/drm-xe-next?ref_type=heads

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/rfc/xe.rst | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index a115526c03e0..b67f8e6a1825 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -88,24 +88,6 @@ depend on any other patch touching drm_scheduler itself that was not yet merged
>  through drm-misc. This, by itself, already includes the reach of an agreement for
>  uniform 1 to 1 relationship implementation / usage across drivers.
>  
> -GPU VA
> -------
> -Two main goals of Xe are meeting together here:
> -
> -1) Have an uAPI that aligns with modern UMD needs.
> -
> -2) Early upstream engagement.
> -
> -RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
> -track of GPU virtual address mappings. This is still not merged upstream, but
> -this aligns very well with our goals and with our VM_BIND. The engagement with
> -upstream and the port of Xe towards GPUVA is already ongoing.
> -
> -As a key measurable result, Xe needs to be aligned with the GPU VA and working in
> -our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
> -related patch should be independent and present on dri-devel or acked by
> -maintainers to go along with the first Xe pull request towards drm-next.
> -
>  ASYNC VM_BIND
>  -------------
>  Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> @@ -230,3 +212,21 @@ Xe merged, it is mandatory to enforce the overall locking scheme for all major
>  structs and list (so vm and vma). So, a consensus is needed, and possibly some
>  common helpers. If helpers are needed, they should be also documented in this
>  document.
> +
> +GPU VA
> +------
> +Two main goals of Xe are meeting together here:
> +
> +1) Have an uAPI that aligns with modern UMD needs.
> +
> +2) Early upstream engagement.
> +
> +RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
> +track of GPU virtual address mappings. This is still not merged upstream, but
> +this aligns very well with our goals and with our VM_BIND. The engagement with
> +upstream and the port of Xe towards GPUVA is already ongoing.
> +
> +As a key measurable result, Xe needs to be aligned with the GPU VA and working in
> +our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
> +related patch should be independent and present on dri-devel or acked by
> +maintainers to go along with the first Xe pull request towards drm-next.
> -- 
> 2.41.0
> 
