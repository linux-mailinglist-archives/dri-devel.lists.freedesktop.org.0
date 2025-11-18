Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B85CC6915A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19A110E348;
	Tue, 18 Nov 2025 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T15GzIIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0893A89CC1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 27A7660624;
 Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E780C2BCAF;
 Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763465443;
 bh=Jvy04bdhFOpSrKWmAa/V6bG2TAo9p+ugcVVOIX7cwWk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=T15GzIINkWnScGjazf0hVjQZhF6lksdFd2EzM+PiD1zhO/8Xpo6gC6cV54P9dCSdy
 GnAaSC8mw6xMdUs7sAW8pcgwYrQyrw3hyrHwmSkBLIai8l2iCYYyzJoiMgWDSkchib
 fYUQGnZHhhfUDHEbGbCxI+e1VJG992jUl6gAeUDXjQn/lWxRtYPu/UKWu1Gn65pjRq
 tCpxxnpNqk9aEpYw95C5jocZdPQvLFLj7kUdtDLsVWv0FG7iw/xj6HrXgqaYrr8CiV
 8NTMJ4w3FFqaupMMcQpyf7W/yXrOxwc4xyYZBo+54FigtgOJ2ZM7xTI7RaDd7JZ9A5
 ud2ykUW+9WyFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C4E22CED617;
 Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:38 +0100
Subject: [PATCH v3 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-3-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zdnKJDIMeMRyO+SWDYgfxVtOGiWokm8aDgNXOD3aXMY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjgWqFBlPThDTkfgTV3N4jMym0YwB4V2B+dW
 6PDa8UbHRCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 cqXbD/0RNQIrlcYy/v35U2jD3fu+nnPV67tqnJajTOoTXZLZ/mcaqg/MnDG95MkVC29lhXajD5D
 6E+a28DGo0YtIlZpYxLq2AcrkcVO3zfbN4WLu2eRjjZ42sgE+kQtHOnL+kWX0FnNbf0ZVoiTMnY
 E6Mmn+A/2nBM4BL71ZzqWQZHmD2kt1DYLle17JQAcY3EQWN8Su2sNW6ctvuB5o0yOSnJmRY5uLl
 3O5NIcdDlzk9N+h8ViMTlPLLv5zzcP8t+1ozTyocz/FiY9NjxG9PBTsuoiKUCd3hW+OKVaggGFW
 5307ZvWd3yI+aQD5UY05hNgif72k38Vl8Sk/CfAQIPe0lXpTzWCJ6EC9frJxyeEhnuPefGFhX+9
 d/SyJE0RWM6j+klvEnZvytF44qhCXufuuaXrVReAEu6ylOC3eoyeYI20fAyBoRJPLKXnOeGxrhU
 OPhkXgHmVzcW4PTmaW8p8f3EKF2jhtn6RCkJ4cMQ+R8f5T7NP3wr/dI3D01Fn2A+m3r39CexR0r
 Gj60/U3YiSsbQMKXdc0RSZZ3OYKqiRSe81BYwNX/0rIjrZqtXvAfYPVvppybagDEmeSXUP6Do9z
 JlXL7jks19LwWxzmmgWsLPshA3Bl7osN5AhEYCPnuGBYQI3fzVsRqWpYd8joqBj9uKeGAL5F4zS
 AC8geMn3XdtDJfg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

The supported panel is LH546WF1-ED01, add compatible and adjust the
struct name to reflect that.

The standalone compatible lg,sw43408 will continue to work, even thou
there are no users yet.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 46a56ea92ad9f..bd55f6d8f2771 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -149,7 +149,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode sw43408_mode = {
+static const struct drm_display_mode lh546wf1_ed01_mode = {
 	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
 
 	.hdisplay = 1080,
@@ -171,7 +171,7 @@ static const struct drm_display_mode sw43408_mode = {
 static int sw43408_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
-	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
+	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
 }
 
 static int sw43408_backlight_update_status(struct backlight_device *bl)
@@ -214,7 +214,9 @@ static const struct drm_panel_funcs sw43408_funcs = {
 };
 
 static const struct of_device_id sw43408_of_match[] = {
+	/* legacy */
 	{ .compatible = "lg,sw43408", },
+	{ .compatible = "lg,sw43408-lh546wf1-ed01", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sw43408_of_match);

-- 
2.51.0


