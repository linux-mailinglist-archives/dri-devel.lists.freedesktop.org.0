Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466EF6CD968
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 14:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA71110E0CE;
	Wed, 29 Mar 2023 12:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB08610E530;
 Wed, 29 Mar 2023 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680093364; x=1711629364;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FpWoRE35I2ZTLQ2/dkg0MkmNNfID58WTvJw6X4novL8=;
 b=gHzJqG7G55GXBMaFbSwTI9J8KgNec/V1G25HbpVykUL+B9TAJ4ZhRL/g
 PrjpIFmhUqbmIwkJuzyWMNNBC39D6yjXoNWqvUaFofXTtpKMPM23gFP18
 cQK/B/avgKVgXwDMe/pWI+bgFB39J2lSQs8R7054bvXDALqHxDWEZSkCV
 qVvRS91ZOQBhHwEy/6tVzffQARH9lQkW9yzbrUEipAknnDEJnx/Ka0Qhh
 KeZhp7qnVoRJjEdldExSEnZGkjTGvLjP8cZ750FqiuNYhH/pC9PCQHun1
 YGKkL9PMmQms4TB16XLUJsgsM2icVYKmuUwcDHKmbyv0xXQZRLN+c3Gt6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="329330746"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="329330746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 05:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="684249702"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="684249702"
Received: from ostermam-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.144])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 05:35:57 -0700
Date: Wed, 29 Mar 2023 14:35:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v6 1/8] lib/ref_tracker: add unlocked leak print helper
Message-ID: <ZCQwlAkAUrtCimj4@ashyti-mobl2.lan>
References: <20230224-track_gt-v6-0-0dc8601fd02f@intel.com>
 <20230224-track_gt-v6-1-0dc8601fd02f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v6-1-0dc8601fd02f@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Wed, Mar 29, 2023 at 09:24:12AM +0200, Andrzej Hajda wrote:
> To have reliable detection of leaks, caller must be able to check under the same
> lock both: tracked counter and the leaks. dir.lock is natural candidate for such
> lock and unlocked print helper can be called with this lock taken.
> As a bonus we can reuse this helper in ref_tracker_dir_exit.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
