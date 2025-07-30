Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA95B16871
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FD810E6EB;
	Wed, 30 Jul 2025 21:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=nicusor.huhulea@siemens.com header.b="KIrBxwcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Wed, 30 Jul 2025 16:23:16 UTC
Received: from mta-65-227.siemens.flowmailer.net
 (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E410C10E44D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 16:23:16 +0000 (UTC)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id
 20250730161312316ba9bb15482216e9
 for <dri-devel@lists.freedesktop.org>;
 Wed, 30 Jul 2025 18:13:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=nicusor.huhulea@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SM18kxHUwUOMwVIKh7FMbuWbiK+t9G6vHIfzFyWk3rk=;
 b=KIrBxwcqCMFleJ5qRPVb0wv3K58/GG0o58C4dCCy6FcUj+sNOYa/UVG8PCswiIMv9ZanP0
 +BgzxeMZqgMoYsXp3/wAyTJYVuwZ8pl/WqGh36F2wLg6Bu8Z15JW7otMKdjRayAtHGikUQqt
 r7KQaqsU/dkUvwM5JNjMNToG5Sx+vaZB6mindv/8EAkDJ4AfafMLenAZJkPVhlHj3qCNBWcT
 S7LX5340SuNBV/si9AWLB8hwvHZwB4mMjsAXKrD5Pe84I0x1blKP2DeARP9TBh+Ci2CmNeKL
 hErGA6pUytr3yevUp6odglx8BbZedmYV22HKQOLfANkfht8tGHh/J1Yw==;
From: Nicusor Huhulea <nicusor.huhulea@siemens.com>
To: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: cip-dev@lists.cip-project.org, imre.deak@intel.com,
 jouni.hogander@intel.com, neil.armstrong@linaro.org,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, laurentiu.palcu@oss.nxp.com,
 cedric.hombourger@siemens.com, shrikant.bobade@siemens.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nicusor Huhulea <nicusor.huhulea@siemens.com>
Subject: [PATCH 1/5] drm/i915: Fix HPD polling,
 reenabling the output poll work as needed
Date: Wed, 30 Jul 2025 19:11:02 +0300
Message-Id: <20250730161106.80725-2-nicusor.huhulea@siemens.com>
In-Reply-To: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1331196:519-21489:flowmailer
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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

From: Imre Deak <imre.deak@intel.com>

commit 50452f2f76852322620b63e62922b85e955abe94 upstream.

While this commit is not a direct cherry-pick, the critical fix(two lines)
was adapted and applied.

After the commit in the Fixes: line below, HPD polling stopped working
on i915, since after that change calling drm_kms_helper_poll_enable()
doesn't restart drm_mode_config::output_poll_work if the work was
stopped (no connectors needing polling) and enabling polling for a
connector (during runtime suspend or detecting an HPD IRQ storm).

After the above change calling drm_kms_helper_poll_enable() is a nop
after it's been called already and polling for some connectors was
disabled/re-enabled.

Fix this by calling drm_kms_helper_poll_reschedule() added in the
previous patch instead, which reschedules the work whenever expected.

Fixes: d33a54e3991d ("drm/probe_helper: sort out poll_running vs poll_enabled")
Cc: stable@vger.kernel.org # 6.4+
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230822113015.41224-2-imre.deak@intel.com
Signed-off-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>
---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index f7a2f485b177..6ba2d7b0cd1b 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -208,7 +208,7 @@ intel_hpd_irq_storm_switch_to_polling(struct drm_i915_private *dev_priv)
 
 	/* Enable polling and queue hotplug re-enabling. */
 	if (hpd_disabled) {
-		drm_kms_helper_poll_enable(dev);
+		drm_kms_helper_poll_reschedule(&dev_priv->drm);
 		mod_delayed_work(system_wq, &dev_priv->display.hotplug.reenable_work,
 				 msecs_to_jiffies(HPD_STORM_REENABLE_DELAY));
 	}
@@ -638,7 +638,7 @@ static void i915_hpd_poll_init_work(struct work_struct *work)
 	drm_connector_list_iter_end(&conn_iter);
 
 	if (enabled)
-		drm_kms_helper_poll_enable(dev);
+		drm_kms_helper_poll_reschedule(&dev_priv->drm);
 
 	mutex_unlock(&dev->mode_config.mutex);
 
-- 
2.39.2

