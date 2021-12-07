Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F946B353
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 08:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4A8B698;
	Tue,  7 Dec 2021 07:01:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D248B697;
 Tue,  7 Dec 2021 07:01:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237322650"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="237322650"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 23:01:36 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="462191277"
Received: from gangshe-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.113.238])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 23:01:35 -0800
Date: Mon, 6 Dec 2021 23:01:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Don't go bang in GuC log
 if no GuC
Message-ID: <20211207070135.derxjanwwrxos6cw@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211203000623.3086309-1-John.C.Harrison@Intel.com>
 <20211203000623.3086309-5-John.C.Harrison@Intel.com>
 <20211203003307.ju75hmimn6sfhfmk@ldmartin-desk2>
 <d2ea5d3b-2b53-8aa8-8a6e-dec024f573ac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2ea5d3b-2b53-8aa8-8a6e-dec024f573ac@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 03, 2021 at 12:00:59PM -0800, Daniele Ceraolo Spurio wrote:
>
>
>On 12/2/2021 4:33 PM, Lucas De Marchi wrote:
>>On Thu, Dec 02, 2021 at 04:06:23PM -0800, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>If the GuC has failed to load for any reason and then the user pokes
>>>the debugfs GuC log interface, a BUG and/or null pointer deref can
>>>occur. Don't let that happen.
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Lucas De Marchi
>>
>
>Do we need a fixes tag? or is it ok to not have it for debugfs bugs?
>

for this file in debugfs, I don't think so, but I will let the
maintainers to chime in.

Lucas De Marchi

>Daniele
>
>>>---
>>>drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c | 4 ++--
>>>1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c 
>>>b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>>>index 46026c2c1722..8fd068049376 100644
>>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>>>@@ -31,7 +31,7 @@ static int guc_log_level_get(void *data, u64 *val)
>>>{
>>>    struct intel_guc_log *log = data;
>>>
>>>-    if (!intel_guc_is_used(log_to_guc(log)))
>>>+    if (!log->vma)
>>>        return -ENODEV;
>>>
>>>    *val = intel_guc_log_get_level(log);
>>>@@ -43,7 +43,7 @@ static int guc_log_level_set(void *data, u64 val)
>>>{
>>>    struct intel_guc_log *log = data;
>>>
>>>-    if (!intel_guc_is_used(log_to_guc(log)))
>>>+    if (!log->vma)
>>>        return -ENODEV;
>>>
>>>    return intel_guc_log_set_level(log, val);
>>>-- 
>>>2.25.1
>>>
>
