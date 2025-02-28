Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC131A4934B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BE810EC17;
	Fri, 28 Feb 2025 08:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jeU5cj7S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CE10EC19
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:20:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2574761F42;
 Fri, 28 Feb 2025 08:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59394C4CED6;
 Fri, 28 Feb 2025 08:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740730844;
 bh=Hh6xAuD3HXXAX7xVHgeSLNoZ820BDLmImelYuFIHamc=;
 h=From:To:Cc:Subject:Date:From;
 b=jeU5cj7SvHEomQXTyTZfgDIc3J/9qALS6mkywPEvgStfFYzyV7/7hu3lmKtQtLuI9
 gG2omLRMU4XKSo8zhkZXseDaoVK8jFFrNHDrIpDqDsbXsRVz2aqjrRUHCq2D7foWvq
 0sratA8YQPu2hdazJzhUanUP8Wa/jRdB6rqH+y1UqqrE+b5/6oqxafK8yBW4WWZWjU
 c1qQSzdFSWO7XQyHlCm96onGtt+UGoXVzNKrpDV0O1SzmMaQ1bEY6k0hycWggRRi+U
 MTY1DlG0YRFETfyv7ko1R/rc2NH4HYNiy9YV0u/ETUYmsOYWY//FYhyS3RyNrBpdxO
 lDHZarQHi4lxQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1tnvcA-000000001G7-2I9n;
 Fri, 28 Feb 2025 09:20:58 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki " <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] component: do not try to unbind unbound components
Date: Fri, 28 Feb 2025 09:18:24 +0100
Message-ID: <20250228081824.4640-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Error handling is apparently hard and driver authors often get it wrong.

Continue to warn but do not try to unbind components that have never
been bound in order to avoid crashing systems where such a buggy
teardown path is hit.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

I've been sitting on this one for too long now after I ran into such an
issue while fixing up the MDM DRM driver which triggered all sorts
problems on probe deferral.

Here's a recent example of where a return here would have a avoided a
double free:

	https://lore.kernel.org/lkml/6089322f3d5f2e56f4d7a5899d70da2bc45978f7.1702509741.git.soyer@irl.hu/

Arguably, crashing the system is more noticeable, but not very nice for
users.

Johan


 drivers/base/component.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 741497324d78..3faa92d26be3 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -572,7 +572,8 @@ EXPORT_SYMBOL_GPL(component_master_del);
 static void component_unbind(struct component *component,
 	struct aggregate_device *adev, void *data)
 {
-	WARN_ON(!component->bound);
+	if (WARN_ON(!component->bound))
+		return;
 
 	if (component->ops && component->ops->unbind)
 		component->ops->unbind(component->dev, adev->parent, data);
-- 
2.45.3

