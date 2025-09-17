Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55BB7CBFC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567AA10E41C;
	Wed, 17 Sep 2025 07:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOmwErMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0B910E175;
 Wed, 17 Sep 2025 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758093798; x=1789629798;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4hQ+mpeCJ8DOteiwqmho3Rl2rSlte6e1plRMV5LvIB0=;
 b=eOmwErMmj/w9bRi0yFRxRANwlFx6unScrdGpSk7e4MJdpli2l7fv3Jhq
 kn8D2mkdkp9o2AB/EZZPFtHRrKCuyx6j8IrsL20w+7TtDZ85sD/48uKFE
 IC7Qbbi6DIzN5520Rcb8p1g2x7uTbYE1EsOXEA73RLtRz0fdE17BFhr/U
 wWBdvJ+YchBLe9PZ0ePlN7RQBTqqzTCyqR1Gd6G5dV6/0xnkvag+VCTBw
 mqdWmR4AmYF3xliqL0ZnSbiUZRCH9Wh47llUfRllnR36gGxtmH4vDnOmX
 nsBDg/JUaOgFPQR9qIv2FHQABUKtO7Ld4sRUQ3vTvns/9gmxVr1Jco76I w==;
X-CSE-ConnectionGUID: moi/OZvsSwyN0LoSRSr9Nw==
X-CSE-MsgGUID: ++yW+24hSNKsODKlj4+qSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="63024793"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="63024793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:23:17 -0700
X-CSE-ConnectionGUID: 4x0ad1k1Q16stt/AubXU6g==
X-CSE-MsgGUID: ka254H5OSG+CgA07h9gV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="174458158"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:23:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Sebinraj, S" <s.sebinraj@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Subject: RE: [PATCH v3 3/3] drm/xe: Refactoring the code as per review comment
In-Reply-To: <CH0PR11MB542770B0F746BE12B3E8461E9817A@CH0PR11MB5427.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250916072704.2351591-1-s.sebinraj@intel.com>
 <20250916072704.2351591-4-s.sebinraj@intel.com>
 <4f495d7ee43a7ddc7ada573f8ab6f69c6e0011f4@intel.com>
 <CH0PR11MB542770B0F746BE12B3E8461E9817A@CH0PR11MB5427.namprd11.prod.outlook.com>
Date: Wed, 17 Sep 2025 10:23:11 +0300
Message-ID: <0c44364d65dc0155fd2c2da1d413160241cca767@intel.com>
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

On Wed, 17 Sep 2025, "Sebinraj, S" <s.sebinraj@intel.com> wrote:
> On Tue, 16 Sep 2025, S Sebinraj <s.sebinraj@intel.com> wrote:
>> Moved the trace file header to appropriate path "include/drm" and 
>> updated the code as per the same.
>
>> You're not supposed to address code review in independent patches but rather modify the original patches. This is kernel development basics.
>
>> BR,
>> Jani.
>
> Okay got it, so now do I need to go back and make the changes in original patch and then raise again or this would be fine for now ?
> Please let me know.

You need to post the revised patches. 'git rebase -i' is your friend
here.

BR,
Jani.


-- 
Jani Nikula, Intel
