Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29894C1C9F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06BF10E2E4;
	Wed, 23 Feb 2022 19:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85D810E730;
 Wed, 23 Feb 2022 19:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645645917; x=1677181917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hY0ef9GTkxrCbOg+/YUFYF4ZbTImRNvJHpspM6WQBlg=;
 b=neeeyWisZNnKorI/lekws7FhrvtbselhUDJTZyMRv7DNiIaVvTVclxeV
 KvDzF3tnjsRUFfDq8TZAssHuJKkG+3Ms77s+bkGi502CjL0cLTxtX2ehd
 9tLUtvtW9Qop/9ARLKs3XjEFzW3J4Ah+GAiuc0iVEwl5HoDxuWQ+aGAT7
 l2lTxSiS1+O9g94NRWErJxrKWi0ob8+kCpueoKCd8uLcAmWNlWCJpbRN/
 scahh75nVQm88olaTO2wi3MoH8BnaItHWEppJFjPdtTVe10o8TBGgZION
 11ka4va0MAFn9nAHMGC3Cm/yP2auiFdV26/xrhO5bdnfIWehISmKwvH53 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232688798"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="232688798"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 11:51:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="508576544"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 11:51:46 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] kernel/hung_task: Exporting sysctl_hung_task_timeout_secs
Date: Thu, 24 Feb 2022 01:22:02 +0530
Message-Id: <20220223195203.13708-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220223195203.13708-1-ramalingam.c@intel.com>
References: <20220223195203.13708-1-ramalingam.c@intel.com>
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
Cc: lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exporting sysctl_hung_task_timeout_secs, to make it available for other
kernel modules.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 kernel/hung_task.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index db59b6d4f0e7..01120265395d 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -43,6 +43,7 @@ int __read_mostly sysctl_hung_task_check_count = PID_MAX_LIMIT;
  * Zero means infinite timeout - no checking done:
  */
 unsigned long __read_mostly sysctl_hung_task_timeout_secs = CONFIG_DEFAULT_HUNG_TASK_TIMEOUT;
+EXPORT_SYMBOL(sysctl_hung_task_timeout_secs);
 
 /*
  * Zero (default value) means use sysctl_hung_task_timeout_secs:
-- 
2.20.1

