Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A975D4A9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 21:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F4F10E6F9;
	Fri, 21 Jul 2023 19:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D44F10E096
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 19:23:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6878461D6D;
 Fri, 21 Jul 2023 19:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796AAC433C8;
 Fri, 21 Jul 2023 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1689967414;
 bh=r/yunUah8Ljs3Y9mcKog0QBzxCbnsJ/eItw2VdlXAAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Efgs2/odu4IiQpv5Log3rsrA4kheLlZd52ZNz1SBBxNyrqMMaOMoRmPaB/GSKfnCY
 ORtfXIC+BMKepREDDfkZgBZI27UlJ8KBYwzy02EI3zvSo0CXyBRakrdoC5iF/w8N4H
 2mXJoVomuDGtm72Tc74zRzNkuYIuwaBqGFtivW6Y=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 155/223] drm/ttm: Dont leak a resource on swapout move
 error
Date: Fri, 21 Jul 2023 18:06:48 +0200
Message-ID: <20230721160527.479476521@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721160520.865493356@linuxfoundation.org>
References: <20230721160520.865493356@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit a590f03d8de7c4cb7ce4916dc7f2fd10711faabe upstream.

If moving the bo to system for swapout failed, we were leaking
a resource. Fix.

Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
Cc: Christian König <christian.koenig@amd.com>
Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.14+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230626091450.14757-5-thomas.hellstrom@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1165,6 +1165,7 @@ int ttm_bo_swapout(struct ttm_buffer_obj
 		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, &ctx, &hop);
 		if (unlikely(ret != 0)) {
 			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
+			ttm_resource_free(bo, &evict_mem);
 			goto out;
 		}
 	}


