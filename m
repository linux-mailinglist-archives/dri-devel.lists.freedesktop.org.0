Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C999E96FA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5239C10E73C;
	Mon,  9 Dec 2024 13:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W84HmVpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A69D10E73A;
 Mon,  9 Dec 2024 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751181; x=1765287181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVQZnPZQN0kBtWeOaQJmx0P/Q5d+rwbyumCvJqbkGcI=;
 b=W84HmVpJLL+4girkPsQAcwz/fSsIcXajj5LxCrE8LwdcL2LVqCjmZd0Z
 CSwlTeeyo3PDEvguoHZTYwx0mHBFXWBWP/DVyXroc9YH5j19N6bb8OzTR
 MEhKsXxCqd+1Va5Mjwal1PVGAbY77wFwIy/+Tzl4ewq7HGvLN5p2P4jkG
 uPozBTY9nyzDE0Vn9lTSSIO7kyigksWb9MKq5CjsAoSKqYeOT2oyAb0kj
 A/RQKp9bTUNW6qcNRZ2MZGUuC0x0e/kfa4OZ+2SigZhhJ4yS65euBCFlM
 GCMhgeGQxncuK9Eu53M5lTfMa4ku3mcuuyK0TvvRZJVUSWKT9dr9kgh4h A==;
X-CSE-ConnectionGUID: eBBxC9bCTZWa5DxjXV7I8w==
X-CSE-MsgGUID: i8o+IeAAR0OCva2bpO4Jiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34191891"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34191891"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:01 -0800
X-CSE-ConnectionGUID: oIWXo/SSSn27cBE95jrq0g==
X-CSE-MsgGUID: +w6WQHGOTZWY+f3GxU1VSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531232"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:32:57 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Andi Shyti <andi.shyti@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 01/26] ptrace: export ptrace_may_access
Date: Mon,  9 Dec 2024 15:32:52 +0200
Message-ID: <20241209133318.1806472-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

xe driver would like to allow fine grained access control
for GDB debugger using ptrace. Without this export, the only
option would be to check for CAP_SYS_ADMIN.

The check intended for an ioctl to attach a GPU debugger
is similar to the ptrace use case: allow a calling process
to manipulate a target process if it has the necessary
capabilities or the same permissions, as described in
Documentation/process/adding-syscalls.rst.

Export ptrace_may_access function to allow GPU debugger to
have identical access control for debugger(s)
as a CPU debugger.

v2: proper commit message (Lucas)

Cc: Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
CC: Andi Shyti <andi.shyti@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 kernel/ptrace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index d5f89f9ef29f..86be1805ebd8 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -354,6 +354,7 @@ bool ptrace_may_access(struct task_struct *task, unsigned int mode)
 	task_unlock(task);
 	return !err;
 }
+EXPORT_SYMBOL_GPL(ptrace_may_access);
 
 static int check_ptrace_options(unsigned long data)
 {
-- 
2.43.0

