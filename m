Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A66F13AE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AB010EC86;
	Fri, 28 Apr 2023 08:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDA210EC80;
 Fri, 28 Apr 2023 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682672160; x=1714208160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9pexECH/mgIvrvJ2poPTW606fGUoKNk4Fi15axrvXsU=;
 b=gV6XuRfSvGm5aDW7EhePDDGcBSwcjQZdnZH73PqGRa6S3mvbe6Lsrp0U
 stFGuslJiInpbk0glqpMAX273TlgdBipryFKQz2XyIt26PTdUXO3+Mute
 mCvsFWTfAcW2MXgA/TjDeF4McqO62RwwOTtdiQnUx4/lrcvSG+X3OiAQi
 uN0ZvQVD5cK2idoFDaixCi2OPVuErVhTvBkX0dPKgTvgeFPLwHhpecZAr
 ACICNK9jzHJboCNmc/FfInP4weAfCfQ9DHgG4+GCzEe2Xj07troA2LoXD
 kgN2Aux2ZFlsiy/yZXMJDXNwXvWUsrq1gq4IRicUOd0ODom+NfgBiBkia g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="375681425"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="375681425"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="784131306"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="784131306"
Received: from ahermans-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.35.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:55:54 -0700
Date: Fri, 28 Apr 2023 10:55:52 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v8 7/7] drm/i915: Track gt pm wakerefs
Message-ID: <ZEuKGN7S7L/FfYRV@ashyti-mobl2.lan>
References: <20230224-track_gt-v8-0-4b6517e61be6@intel.com>
 <20230224-track_gt-v8-7-4b6517e61be6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v8-7-4b6517e61be6@intel.com>
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

On Tue, Apr 25, 2023 at 12:05:44AM +0200, Andrzej Hajda wrote:
> Track every intel_gt_pm_get() until its corresponding release in
> intel_gt_pm_put() by returning a cookie to the caller for acquire that
> must be passed by on released. When there is an imbalance, we can see who
> either tried to free a stale wakeref, or who forgot to free theirs.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
