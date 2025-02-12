Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60CA33067
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9510E97F;
	Wed, 12 Feb 2025 20:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ou0Q1D5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866DC10E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739390768; x=1770926768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=asPsjfJ93s8xZX8uMGYNQdUgRg6kPjTaMYqujLFIiio=;
 b=Ou0Q1D5EYe0Waif+KBW5CwG7nHP3KRiu4TJ/G1QTqgWstQA7iR9V0Bhh
 yAZl5s6FW9l6V8ZgfmRAqhPoJqDpGgvYbycnUGfSwQ1yGXK2lRf/6Zz73
 2wMdaEPgEG+HfbX+WIaqQ1kxoIPcZ+viHXc1qmeNvjKl62qklJA1o2CMT
 krKIA90dNku8fRvB1AKeFDrhDXYexrS+vmMNWE4KCC21v1x8DOsuBwaSA
 worl7K4Lj4ClCE2ijah0NGmLyyrx+Cxfb5pWSRvDLsWg3OJG90G+8KNW6
 UEeO6uXC138HIGGZm+dP2AsLIR/73k6ojSmLaZU0hEUbZsYf7TOBNXUFE w==;
X-CSE-ConnectionGUID: QxDt8XuWS2yjQegM6AgU8A==
X-CSE-MsgGUID: Apkhn7lVRReMtnN4e26eUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50718498"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50718498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
X-CSE-ConnectionGUID: mziKP4TcTWyd52lsoa6x3g==
X-CSE-MsgGUID: e+SHg10+Sh+ngqOWmjOKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="118010760"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/6] drivers: base: component: Add debug message for unbind
Date: Wed, 12 Feb 2025 12:05:39 -0800
Message-ID: <20250212200542.515493-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212200542.515493-1-lucas.demarchi@intel.com>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
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

Like when binding component, add a debug message to the unbinding case
to make it easy to track the lifecycle. This also includes the component
pointer since that is used to open a group in devres, making it easier
to track the resources.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/base/component.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 741497324d78a..5d10600bbc25e 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -574,6 +574,9 @@ static void component_unbind(struct component *component,
 {
 	WARN_ON(!component->bound);
 
+	dev_dbg(adev->parent, "unbinding %s component %p (ops %ps)\n",
+		dev_name(component->dev), component, component->ops);
+
 	if (component->ops && component->ops->unbind)
 		component->ops->unbind(component->dev, adev->parent, data);
 	component->bound = false;
-- 
2.48.1

