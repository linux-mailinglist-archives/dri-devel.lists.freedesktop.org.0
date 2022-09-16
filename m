Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462C5BB00B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 17:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF3A10ED60;
	Fri, 16 Sep 2022 15:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FAB10ED60
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 15:15:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oZD3p-0003yT-JJ; Fri, 16 Sep 2022 17:15:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oZD3l-0016t6-EA; Fri, 16 Sep 2022 17:15:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oZD3i-001KHl-Nq; Fri, 16 Sep 2022 17:15:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] pwm/tracing: Also record trace events for failed apply
 calls
Date: Fri, 16 Sep 2022 17:15:05 +0200
Message-Id: <20220916151506.298488-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916151506.298488-1-u.kleine-koenig@pengutronix.de>
References: <20220916151506.298488-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3953;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=E3AG5YYUjxpilr4EcU0F6ojjwczwFoEye3EvPgGiZXA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjJJL0+nJpefslWpwi1jy221iYiRUnhwYMHQc0hZQg
 +05hOzCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYySS9AAKCRDB/BR4rcrsCb67B/
 4ijup1xrBCXE4uMcAUC/zac9L2dQhGtHBA83d1WLO9NCst9t1N3f3awu/ViFMY6Li/IrfwRg3YinAb
 mu0nvQBqYTGYIHL2Yb+tHQ1/UGMpdQCmQcAFaZRZsYgxBCIAI1tU7w8+49Aq69j0cIvaaU0tsQOegP
 G8RZrBIxKOIqNI2vmWg5pjocGyc7/Sl7an2uB86UkFOU22WFhyz/zezKTCVfQ7O0aXXI/EO5LSM0Xt
 PLBrMEQYPhCHIqRkltKCUdIi2HVw+b1eGQQKBZRfxz/nbXOSkHLJLpvs3VM8pwYQLJ0YPs+6Lc3bK3
 hQrkz6ipAyixvsp8m3CXj/xg8/yta2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-gpio@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Robert Foss <robert.foss@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-leds@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Record and report an error code for the events. This allows to report
about failed calls without ambiguity and so gives a more complete
picture.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/core.c         | 18 ++++++++----------
 include/trace/events/pwm.h | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 0e042410f6b9..381db04cfa00 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -108,8 +108,8 @@ static int pwm_device_request(struct pwm_device *pwm, const char *label)
 	}
 
 	if (pwm->chip->ops->get_state) {
-		pwm->chip->ops->get_state(pwm->chip, pwm, &pwm->state);
-		trace_pwm_get(pwm, &pwm->state);
+		err = pwm->chip->ops->get_state(pwm->chip, pwm, &pwm->state);
+		trace_pwm_get(pwm, &pwm->state, err);
 
 		if (IS_ENABLED(CONFIG_PWM_DEBUG))
 			pwm->last = pwm->state;
@@ -457,8 +457,8 @@ static void pwm_apply_state_debug(struct pwm_device *pwm,
 	 * checks.
 	 */
 
-	chip->ops->get_state(chip, pwm, &s1);
-	trace_pwm_get(pwm, &s1);
+	err = chip->ops->get_state(chip, pwm, &s1);
+	trace_pwm_get(pwm, &s1, err);
 
 	/*
 	 * The lowlevel driver either ignored .polarity (which is a bug) or as
@@ -514,16 +514,15 @@ static void pwm_apply_state_debug(struct pwm_device *pwm,
 
 	/* reapply the state that the driver reported being configured. */
 	err = chip->ops->apply(chip, pwm, &s1);
+	trace_pwm_apply(pwm, &s1, err);
 	if (err) {
 		*last = s1;
 		dev_err(chip->dev, "failed to reapply current setting\n");
 		return;
 	}
 
-	trace_pwm_apply(pwm, &s1);
-
-	chip->ops->get_state(chip, pwm, last);
-	trace_pwm_get(pwm, last);
+	err = chip->ops->get_state(chip, pwm, last);
+	trace_pwm_get(pwm, last, err);
 
 	/* reapplication of the current state should give an exact match */
 	if (s1.enabled != last->enabled ||
@@ -571,11 +570,10 @@ int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
 		return 0;
 
 	err = chip->ops->apply(chip, pwm, state);
+	trace_pwm_apply(pwm, state, err);
 	if (err)
 		return err;
 
-	trace_pwm_apply(pwm, state);
-
 	pwm->state = *state;
 
 	/*
diff --git a/include/trace/events/pwm.h b/include/trace/events/pwm.h
index cf243de41cc8..12b35e4ff917 100644
--- a/include/trace/events/pwm.h
+++ b/include/trace/events/pwm.h
@@ -10,9 +10,9 @@
 
 DECLARE_EVENT_CLASS(pwm,
 
-	TP_PROTO(struct pwm_device *pwm, const struct pwm_state *state),
+	TP_PROTO(struct pwm_device *pwm, const struct pwm_state *state, int err),
 
-	TP_ARGS(pwm, state),
+	TP_ARGS(pwm, state, err),
 
 	TP_STRUCT__entry(
 		__field(struct pwm_device *, pwm)
@@ -20,6 +20,7 @@ DECLARE_EVENT_CLASS(pwm,
 		__field(u64, duty_cycle)
 		__field(enum pwm_polarity, polarity)
 		__field(bool, enabled)
+		__field(int, err)
 	),
 
 	TP_fast_assign(
@@ -28,28 +29,27 @@ DECLARE_EVENT_CLASS(pwm,
 		__entry->duty_cycle = state->duty_cycle;
 		__entry->polarity = state->polarity;
 		__entry->enabled = state->enabled;
+		__entry->err = err;
 	),
 
-	TP_printk("%p: period=%llu duty_cycle=%llu polarity=%d enabled=%d",
+	TP_printk("%p: period=%llu duty_cycle=%llu polarity=%d enabled=%d err=%d",
 		  __entry->pwm, __entry->period, __entry->duty_cycle,
-		  __entry->polarity, __entry->enabled)
+		  __entry->polarity, __entry->enabled, __entry->err)
 
 );
 
 DEFINE_EVENT(pwm, pwm_apply,
 
-	TP_PROTO(struct pwm_device *pwm, const struct pwm_state *state),
-
-	TP_ARGS(pwm, state)
+	TP_PROTO(struct pwm_device *pwm, const struct pwm_state *state, int err),
 
+	TP_ARGS(pwm, state, err)
 );
 
 DEFINE_EVENT(pwm, pwm_get,
 
-	TP_PROTO(struct pwm_device *pwm, const struct pwm_state *state),
-
-	TP_ARGS(pwm, state)
+	TP_PROTO(struct pwm_device *pwm, const struct pwm_state *state, int err),
 
+	TP_ARGS(pwm, state, err)
 );
 
 #endif /* _TRACE_PWM_H */
-- 
2.37.2

