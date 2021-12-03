Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3E466E7F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 01:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05706E045;
	Fri,  3 Dec 2021 00:33:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064756E045;
 Fri,  3 Dec 2021 00:33:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="236691509"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="236691509"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 16:33:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="460682319"
Received: from huymcao-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.4.213])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 16:33:08 -0800
Date: Thu, 2 Dec 2021 16:33:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH 4/4] drm/i915/guc: Don't go bang in GuC log if no GuC
Message-ID: <20211203003307.ju75hmimn6sfhfmk@ldmartin-desk2>
References: <20211203000623.3086309-1-John.C.Harrison@Intel.com>
 <20211203000623.3086309-5-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211203000623.3086309-5-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 04:06:23PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>If the GuC has failed to load for any reason and then the user pokes
>the debugfs GuC log interface, a BUG and/or null pointer deref can
>occur. Don't let that happen.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>index 46026c2c1722..8fd068049376 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>@@ -31,7 +31,7 @@ static int guc_log_level_get(void *data, u64 *val)
> {
> 	struct intel_guc_log *log = data;
>
>-	if (!intel_guc_is_used(log_to_guc(log)))
>+	if (!log->vma)
> 		return -ENODEV;
>
> 	*val = intel_guc_log_get_level(log);
>@@ -43,7 +43,7 @@ static int guc_log_level_set(void *data, u64 val)
> {
> 	struct intel_guc_log *log = data;
>
>-	if (!intel_guc_is_used(log_to_guc(log)))
>+	if (!log->vma)
> 		return -ENODEV;
>
> 	return intel_guc_log_set_level(log, val);
>-- 
>2.25.1
>
