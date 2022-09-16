Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED15B5BA7B7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544F010ECAD;
	Fri, 16 Sep 2022 08:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C3A10ECA7;
 Fri, 16 Sep 2022 08:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663315392; x=1694851392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TBp/Z1hevjQHqjX8i3bF2oY8hzEZem18KCqslp9DnVU=;
 b=T8KJrjhN7ybnrCNNTiVjbtx4xEzzQmyrN4qyIqgRRxWiP09JM7GWFG5l
 C7wNg4XqE8BXTtHDoQOGoEuiinxtJS1ZN3rzcVRXYaS+66OdD53iAnbrJ
 D7smOO/SmBfFF+f7jXcL4mz8iFAnNGbBgyKYvHjdy0F9np8SY3qqyE8tf
 torDaRAhgkksR3J+9YdQGwf1hrYC7goRJezZtDXq4vwwFBxu1nuesD4c5
 G3uKqH2AiHod2U1WCr1XjouaOSosqUgeJhmmI+SeqkpYYWRCYGhNEGqou
 B1HLvZjTMGLSUQw9jccokR5s/Ee19iFhbq9cOo3jee8pB13fvsFKEm++s w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299763574"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="299763574"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 01:03:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="759964288"
Received: from mkozlian-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.ger.corp.intel.com) ([10.213.11.6])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 01:03:09 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/4] drm/i915/gt: Cleanup partial engine discovery
 failures
Date: Fri, 16 Sep 2022 10:03:06 +0200
Message-ID: <3144646.fEcJ0Lxnt5@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220915232654.3283095-2-matthew.d.roper@intel.com>
References: <20220915232654.3283095-1-matthew.d.roper@intel.com>
 <20220915232654.3283095-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, 16 September 2022 01:26:51 CEST Matt Roper wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> If we abort driver initialisation in the middle of gt/engine discovery,
> some engines will be fully setup and some not. Those incompletely setup
> engines only have 'engine->release == NULL' and so will leak any of the
> common objects allocated.
> 
> v2:
>  - Drop the destroy_pinned_context() helper for now.  It's not really
>    worth it with just a single callsite at the moment.  (Janusz)
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 1f7188129cd1..2ddcad497fa3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1274,8 +1274,13 @@ int intel_engines_init(struct intel_gt *gt)
>  			return err;
>  
>  		err = setup(engine);
> -		if (err)
> +		if (err) {
> +			intel_engine_cleanup_common(engine);
>  			return err;
> +		}
> +
> +		/* The backend should now be responsible for cleanup */
> +		GEM_BUG_ON(engine->release == NULL);
>  
>  		err = engine_init_common(engine);
>  		if (err)
> 




