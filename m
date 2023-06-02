Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D071FEBF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 12:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC6C10E03E;
	Fri,  2 Jun 2023 10:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B38210E03E;
 Fri,  2 Jun 2023 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685700986; x=1717236986;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ftEVzCPwXlOpHFlbuxtBzSP6ezuevWbLxQH31RC6g+c=;
 b=M3x/OVYskyF+QN1Iifyqc3892yJ+yaJJirbQNRMbh7X8PpdjMrs8gPF/
 ipDUPQEQlipv0sUyioGfk8SNfO9UiiYOr5UF4Q11qGvMI62UG/yA8yx/H
 6ewAVY9oJab+lbFBCP+VTK6r6Lh7UEsu9gIHp9t8cqn2gdvNiOoTpA6mQ
 nzMTmTpTSIneY9T7OJKw7iC5Ha3nnbVyJj3yKiHiS5lO3zfGF4HR0NLGr
 OmqNKw45nyvBqkaE9q9IQNMtEVQQ0OwRl5pz21W8l491RBFiVpmXdet9Z
 rEHwA2k4UaeKghXX5ci7QMOD1B/NZyDPn3LsG/lkzQqtLBSNOW7iRDNZS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421653353"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="421653353"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772855502"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="772855502"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:16:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dim: Disallow remote branch deletions with 'dim push'
In-Reply-To: <20230602035010.1517899-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230602035010.1517899-1-ashutosh.dixit@intel.com>
Date: Fri, 02 Jun 2023 13:16:20 +0300
Message-ID: <878rd2f9u3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 01 Jun 2023, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> An inadvertent 'dim push -d' can delete remote branches. Disallow such
> remote branch deletions.

Please see https://drm.pages.freedesktop.org/maintainer-tools/CONTRIBUTING.html

>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  dim | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/dim b/dim
> index 126568e..e5899e6 100755
> --- a/dim
> +++ b/dim
> @@ -1029,6 +1029,12 @@ function dim_push_branch
>  		fi
>  	fi
>  
> +	# Disallow remote branch deletions, say with 'dim push -d'
> +	if [[ "$@" == *"-d"* ]]; then
> +		echoerr "Attempt to delete remote branch, aborting."
> +		return 1
> +	fi

I'm working on adding a server side git pre-receive hook to tackle this
too, but I guess there's no harm in adding this. The choice of -d for
dry run was unfortunate, and this helps with the 'dim -d foo' vs 'dim
foo -d' mistake.

BR,
Jani.


> +
>  	git_push $remote $branch "$@"
>  
>  	update_linux_next $branch drm-intel-next drm-intel-next-fixes drm-intel-fixes

-- 
Jani Nikula, Intel Open Source Graphics Center
