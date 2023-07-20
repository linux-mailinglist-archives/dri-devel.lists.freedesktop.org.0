Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280F75A7E5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7DE10E570;
	Thu, 20 Jul 2023 07:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00DB10E570
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:35:23 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R64Gb3hPZzBRDsM
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:35:19 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689838519; x=1692430520; bh=1iZb7zRA8PkkBk45qpdnV0JsWhC
 I8t4li5D97yw5kxA=; b=H+z2ERjQlyQONBYnelCkdUXHQJDLKNgXAcnVQ4O0m7A
 d9U42ufB7dgcbtp2txb4hOfpB/O6APt0vdq9ZFuqktN0+whBcpsUtW1mUXdcc+7G
 hGFBgf4Mf32MBGteMAcxVhgN8r+odFfoLZhineG31hXTW2vafMpvw5XMVxnxtKYj
 u/2jEYkY3/R875tg8S27DsAbeO/isxuqJ8vY3CbXeJh5mSAT/Wm+H42CkgPWhbBl
 HBcZcStePOSVnYlzHcpqri0BqsEY4KUe6E+I1xEMyO5IrbnunRriQSrVKzBmEowY
 FQlW7nc2ayrQcYnS739WW3zzUcgAnphSRGTpy5iXFxQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cwgusandYDTK for <dri-devel@lists.freedesktop.org>;
 Thu, 20 Jul 2023 15:35:19 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R64Gb2794zBRDs1;
 Thu, 20 Jul 2023 15:35:19 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 15:35:19 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/i915: fix application of sizeof to pointer
In-Reply-To: <20230720073355.3196-1-xujianghui@cdjrlc.com>
References: <20230720073355.3196-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <442918910b90b9a8e2e5f8a3874fdb44@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The coccinelle check report:
./drivers/scsi/csiostor/csio_mb.c:1554:46-52: ERROR: application
of sizeof to pointer

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/i915/i915_syncmap.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_syncmap.c 
b/drivers/gpu/drm/i915/i915_syncmap.c
index 60404dbb2e9f..4eeaf12be72d 100644
--- a/drivers/gpu/drm/i915/i915_syncmap.c
+++ b/drivers/gpu/drm/i915/i915_syncmap.c
@@ -282,7 +282,7 @@ static noinline int __sync_set(struct i915_syncmap 
**root, u64 id, u32 seqno)
  			unsigned int above;

  			/* Insert a join above the current layer */
-			next = kzalloc(sizeof(*next) + KSYNCMAP * sizeof(next),
+			next = kzalloc(sizeof(*next) + KSYNCMAP * sizeof(*next),
  				       GFP_KERNEL);
  			if (unlikely(!next))
  				return -ENOMEM;
