Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED029CEC9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5706E4A1;
	Wed, 28 Oct 2020 08:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC786EB44
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:35:36 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id az3so628954pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 04:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c/Krm+1ZA4YmJhqWJ5tHTEQyF/AowEQIIYGwFZByT4c=;
 b=FLaTxPcUU3hFifx6tDWFaoRvcbFb8B/WI7a7VEHPZOo+6oMv9ZOb1XJfYyusUicGEg
 odNKEQCDwKXwD0l1ozWWGExUaH/P4WJ/fX2QFzplnuuxvORVKo70uRy8/gOoXnxi4nCi
 8Yp+9m6Q7Wi7r2v8kCSrqTwtL8PJEDB6FRxCo/CV0nDMt8wEZjRb8cLpa4bOuBeoZMOf
 07OINL0JGqkB+MozyPRHLzJzc5mxbwTq53cv21Dg60tNU4dPfdGd0GjY25Vcl0vvv0if
 JZy35vCNcXTDByOivJYn4Ga2PZZbMie8UOlhcBzioTXu53vyqJnkw68GP86DYD2QaI9+
 6jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c/Krm+1ZA4YmJhqWJ5tHTEQyF/AowEQIIYGwFZByT4c=;
 b=AWp5c3qgUH7tksdBhaxoESSHV/TZJ2zl1WtdHXUn/f2eP7uabmcjzHgPdhxUMDxFYP
 9a3Nom4KHdHzt0jWrPmzNE2ZAKzKDB8IQ8u/GJi1BZ4nyUssJW4vbjW1jA/rPNwJxiZC
 XoIIeg6kpXzH1Rgwo3GEAwo0u22pljZe8XDlnP1xToKZ9x3d8v0MYE/+8WSJweYQ9f+h
 Mzfwy4GJCa2a+EgWGRXHhq6KxNk4ROgXKbZmM3fN0WtbxiPNWaR5/FCkUC4u8rboEUgb
 IRrdH6aEmHPD1KmSmDIP3MP1SWXHuU3kAXLq2FYYeP3KCd5Oz+KiZGWLi7IyoAaPIgJJ
 Q9oA==
X-Gm-Message-State: AOAM530K+z22+FaDrTRuFouSchajzPIe+cc1Y+jqGsZZDftB+ZfFDJsC
 OhSibWJn81Fp/LzU+s/A9kWXe28slfYl3A==
X-Google-Smtp-Source: ABdhPJxGGMygDZQtzR6z3or/TovlYieo+JjvlwmM9R7c9+byU3/uH1Knz7hakWSZ7zadUc0tCVk4iA==
X-Received: by 2002:a17:90a:ed87:: with SMTP id
 k7mr1613912pjy.127.1603798536231; 
 Tue, 27 Oct 2020 04:35:36 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id gm14sm1827382pjb.2.2020.10.27.04.35.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 04:35:35 -0700 (PDT)
Date: Tue, 27 Oct 2020 17:05:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25-10-20, 10:39, Rob Clark wrote:
> Nope, I suspect any creation of debugfs files will be problematic.

Yeah, so it only fixed part of the problem.

> (btw, _add_opp_dev_unlocked() looks like it should be called
> _add_opp_dev_locked()?)
> 
> It does look like 'struct opp_table' is already refcnt'd, so I suspect
> you could replace holding opp_table_lock while calling into debugfs
> with holding a reference to the opp_table instead?

It isn't that straight forward unfortunately, we need to make sure the
table doesn't get allocated for the same device twice, so
find+allocate needs to happen within a locked region.

I have taken, not so straight forward, approach to fixing this issue,
lets see if this fixes it or not.

-------------------------8<-------------------------

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 4ac4e7ce6b8b..6f4a73a6391f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -29,6 +29,8 @@
 LIST_HEAD(opp_tables);
 /* Lock to allow exclusive modification to the device and opp lists */
 DEFINE_MUTEX(opp_table_lock);
+/* Flag indicating that opp_tables list is being updated at the moment */
+static bool opp_tables_busy;
 
 static struct opp_device *_find_opp_dev(const struct device *dev,
 					struct opp_table *opp_table)
@@ -1036,8 +1038,8 @@ static void _remove_opp_dev(struct opp_device *opp_dev,
 	kfree(opp_dev);
 }
 
-static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
-						struct opp_table *opp_table)
+struct opp_device *_add_opp_dev(const struct device *dev,
+				struct opp_table *opp_table)
 {
 	struct opp_device *opp_dev;
 
@@ -1048,7 +1050,9 @@ static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
 	/* Initialize opp-dev */
 	opp_dev->dev = dev;
 
+	mutex_lock(&opp_table->lock);
 	list_add(&opp_dev->node, &opp_table->dev_list);
+	mutex_unlock(&opp_table->lock);
 
 	/* Create debugfs entries for the opp_table */
 	opp_debug_register(opp_dev, opp_table);
@@ -1056,18 +1060,6 @@ static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
 	return opp_dev;
 }
 
-struct opp_device *_add_opp_dev(const struct device *dev,
-				struct opp_table *opp_table)
-{
-	struct opp_device *opp_dev;
-
-	mutex_lock(&opp_table->lock);
-	opp_dev = _add_opp_dev_unlocked(dev, opp_table);
-	mutex_unlock(&opp_table->lock);
-
-	return opp_dev;
-}
-
 static struct opp_table *_allocate_opp_table(struct device *dev, int index)
 {
 	struct opp_table *opp_table;
@@ -1121,8 +1113,6 @@ static struct opp_table *_allocate_opp_table(struct device *dev, int index)
 	INIT_LIST_HEAD(&opp_table->opp_list);
 	kref_init(&opp_table->kref);
 
-	/* Secure the device table modification */
-	list_add(&opp_table->node, &opp_tables);
 	return opp_table;
 
 err:
@@ -1135,27 +1125,64 @@ void _get_opp_table_kref(struct opp_table *opp_table)
 	kref_get(&opp_table->kref);
 }
 
+/*
+ * We need to make sure that the OPP table for a device doesn't get added twice,
+ * if this routine gets called in parallel with the same device pointer.
+ *
+ * The simplest way to enforce that is to perform everything (find existing
+ * table and if not found, create a new one) under the opp_table_lock, so only
+ * one creator gets access to the same. But that expands the critical section
+ * under the lock and may end up causing circular dependencies with frameworks
+ * like debugfs, interconnect or clock framework as they may be direct or
+ * indirect users of OPP core.
+ *
+ * And for that reason we have to go for a bit tricky implementation here, which
+ * uses the opp_tables_busy flag to indicate if another creator is in the middle
+ * of adding an OPP table and others should wait for it to finish.
+ */
 static struct opp_table *_opp_get_opp_table(struct device *dev, int index)
 {
 	struct opp_table *opp_table;
 
-	/* Hold our table modification lock here */
+again:
 	mutex_lock(&opp_table_lock);
 
 	opp_table = _find_opp_table_unlocked(dev);
 	if (!IS_ERR(opp_table))
 		goto unlock;
 
+	/*
+	 * The opp_tables list or an OPP table's dev_list is getting updated by
+	 * another user, wait for it to finish.
+	 */
+	if (unlikely(opp_tables_busy)) {
+		mutex_unlock(&opp_table_lock);
+		cpu_relax();
+		goto again;
+	}
+
+	opp_tables_busy = true;
 	opp_table = _managed_opp(dev, index);
+
+	/* Drop the lock to reduce the size of critical section */
+	mutex_unlock(&opp_table_lock);
+
 	if (opp_table) {
-		if (!_add_opp_dev_unlocked(dev, opp_table)) {
+		if (!_add_opp_dev(dev, opp_table)) {
 			dev_pm_opp_put_opp_table(opp_table);
 			opp_table = ERR_PTR(-ENOMEM);
 		}
-		goto unlock;
+
+		mutex_lock(&opp_table_lock);
+	} else {
+		opp_table = _allocate_opp_table(dev, index);
+
+		mutex_lock(&opp_table_lock);
+		if (!IS_ERR(opp_table))
+			list_add(&opp_table->node, &opp_tables);
 	}
 
-	opp_table = _allocate_opp_table(dev, index);
+	opp_tables_busy = false;
 
 unlock:
 	mutex_unlock(&opp_table_lock);
@@ -1181,6 +1208,10 @@ static void _opp_table_kref_release(struct kref *kref)
 	struct opp_device *opp_dev, *temp;
 	int i;
 
+	/* Drop the lock as soon as we can */
+	list_del(&opp_table->node);
+	mutex_unlock(&opp_table_lock);
+
 	_of_clear_opp_table(opp_table);
 
 	/* Release clk */
@@ -1208,10 +1239,7 @@ static void _opp_table_kref_release(struct kref *kref)
 
 	mutex_destroy(&opp_table->genpd_virt_dev_lock);
 	mutex_destroy(&opp_table->lock);
-	list_del(&opp_table->node);
 	kfree(opp_table);
-
-	mutex_unlock(&opp_table_lock);
 }
 
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table)

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
