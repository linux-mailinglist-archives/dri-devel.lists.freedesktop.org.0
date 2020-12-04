Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC52D0C39
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5C89FF7;
	Mon,  7 Dec 2020 08:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Fri, 04 Dec 2020 17:12:06 UTC
Received: from latitanza.investici.org (latitanza.investici.org
 [82.94.249.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A85F6E17F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 17:12:06 +0000 (UTC)
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 4CnfFV5fzTz8sj0;
 Fri,  4 Dec 2020 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1607101470;
 bh=jj3P5WJKhBjJXjhj2nHnA+LqEglKEW8VWsBVAqfeHU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CVBq28eY5y/E2J5T940HENRNiWellXmut36E2S7zrKL3j1znsGIp/BvXNEmGDtTA8
 BBIbiUr9fi11xUOSnuleSemZEzRk+l2xTEit9mXUZf9hNK5mR+D1xlcM+e3Fn3az40
 BBx2JHh8BXcMlP0aiMZbc+2/vBoU6tLXV/of2Fgg=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id 4CnfFV0sRNz8sfb; 
 Fri,  4 Dec 2020 17:04:30 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH v1 06/12] omap: Replace strstarts() by str_has_prefix().
Date: Fri,  4 Dec 2020 18:03:12 +0100
Message-Id: <20201204170319.20383-7-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
References: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: Francis Laniel <laniel_francis@privacyrequired.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francis Laniel <laniel_francis@privacyrequired.com>

The two functions indicates if a string begins with a given prefix.
The only difference is that strstarts() returns a bool while str_has_prefix()
returns the length of the prefix if the string begins with it or 0 otherwise.

Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index c7650a7c155d..dd3d466293d1 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -350,7 +350,7 @@ static bool omapdss_component_is_loaded(struct omapdss_comp_node *comp)
 {
 	if (comp->dss_core_component)
 		return true;
-	if (!strstarts(comp->compat, "omapdss,"))
+	if (!str_has_prefix(comp->compat, "omapdss,"))
 		return true;
 	if (omapdss_device_is_registered(comp->node))
 		return true;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
