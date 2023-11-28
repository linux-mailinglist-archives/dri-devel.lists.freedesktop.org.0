Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC77FBE15
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0550110E56D;
	Tue, 28 Nov 2023 15:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8441410E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701185157; x=1732721157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d168n8zWh0HllQmMYOVdN/NLrpY/UHDXaJIOeUe2dkU=;
 b=d2I1nyYw7a2yYe6iokAJI4cu6BzkfacHpkZrt2krDG2TSzZPdHf9Ck4V
 JIbZ7QoBfZUro3tF6yFhc+86czjSLsZpedj+n1Ylo+H+pGiLSDDUjnyjE
 4KdjvgLApcOFgzwujoh3BrL3dA6Q9O85qab/sZSzqLi/lG5Z7PCWh6tML
 phCSXNTqjY1eXXmyKNUc4CPWgYRh002Mn5BPumjwYOlXfHCIYsfW19vGN
 0dyqsJdKuSugBet6IG/eUycaiZkyhJrRjsp35r7H+iaqwOODmJQNnpIQc
 35BQ3ZqhhKv+Kt380H4wToZ5/wNS7iQiOTdfhlQ5eRTqkAC+NpqZxLwDq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="377969261"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="377969261"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="718412782"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="718412782"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.59.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:25:55 -0800
Date: Tue, 28 Nov 2023 16:25:52 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Subject: Re: [PATCH v7 3/8] drm/ttm/tests: Add tests for ttm_bo functions
Message-ID: <ZWYGU2EynFBAqNBK@ashyti-mobl2.lan>
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <61e723d67ebf8eaec226eea176fa19da1994a3b7.1700207346.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61e723d67ebf8eaec226eea176fa19da1994a3b7.1700207346.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

> +/*
> + * A test case heavily inspired by ww_test_edeadlk_normal(). Checks
> + * if -EDEADLK is properly propagated by ttm_bo_reserve()
> + */
> +static void ttm_bo_reserve_deadlock(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo1, *bo2;
> +	struct ww_acquire_ctx ctx1, ctx2;
> +	bool interruptible = false;
> +	bool no_wait = false;
> +	int err;
> +
> +	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	ww_acquire_init(&ctx1, &reservation_ww_class);
> +	mutex_lock(&bo2->base.resv->lock.base);
> +
> +	/* The deadlock will be caught by WW mutex, don't warn about it */
> +	lock_release(&bo2->base.resv->lock.base.dep_map, 1);

OK... by motidfying the lock map, you avoid lockdep to complain.

> +	bo2->base.resv->lock.ctx = &ctx2;
> +	ctx2 = ctx1;
> +	ctx2.stamp--; /* Make the context holding the lock younger */
> +	err = ttm_bo_reserve(bo1, interruptible, no_wait, &ctx1);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	err = ttm_bo_reserve(bo2, interruptible, no_wait, &ctx1);
> +	KUNIT_ASSERT_EQ(test, err, -EDEADLK);
> +
> +	dma_resv_unlock(bo1->base.resv);
> +	ww_acquire_fini(&ctx1);
> +}

so... what you're doing here is swapping the lock timing and
catch and report the deadlock... Could you please add some more
comment to better explain the idea behind this test and its
implementation?

Anyway, looks good to me and you can add my:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
