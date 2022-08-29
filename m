Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256DF5A403D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 02:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2371810EFED;
	Mon, 29 Aug 2022 00:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E1710EFE6;
 Mon, 29 Aug 2022 00:09:53 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MG9mc3tjkzDq8c;
 Mon, 29 Aug 2022 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661731793; bh=nw1YRmqcdBzZBVcFj0rpWQgfxBxuosXOsCCFJ9smdJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P4+1NdJrI/tzqJERKOBbSfbtER0u2uaKNniyGZh+pWeMHagb2SitqDujW+B+e/Awx
 1XF+qQpe5yl/hM336jCbX3MtBQQYEBcFgeSoGbPW3tEix+c++PWbfMkHfqJCrnQczS
 NO4tf0xZsMPqugacs7jGUkHO/N+a0BeBzmL2ZPJ4=
X-Riseup-User-ID: 2860CEA6AFDDFE6C5BAA18060787332CF5114A24920F5EDA57C2A10ED7FDC7E1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MG9mV5cVfz5vkC;
 Mon, 29 Aug 2022 00:09:46 +0000 (UTC)
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/4] lib/igt_kmod.c: check if module is builtin
 before attempting to unload it
Date: Sun, 28 Aug 2022 21:09:18 -0300
Message-Id: <20220829000920.38185-3-isabbasso@riseup.net>
In-Reply-To: <20220829000920.38185-1-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
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
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 magalilemes00@gmail.com, maira.canal@usp.br, dlatypov@google.com,
 n@nfraprado.net, rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, davidgow@google.com,
 tales.aparecida@gmail.com, skhan@linuxfoundation.org, andrealmeid@riseup.net,
 Isabella Basso <isabbasso@riseup.net>, brendanhiggins@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change makes `igt_module_unload_r` safer as it checks whether the
module can be unloaded before attempting it.

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
---
 lib/igt_kmod.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index bb6cb7bb..97cac7f5 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -256,6 +256,9 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 	struct kmod_list *holders, *pos;
 	int err = 0;
 
+	if (kmod_module_get_initstate(kmod) == KMOD_MODULE_BUILTIN)
+		return err;
+
 	holders = kmod_module_get_holders(kmod);
 	kmod_list_foreach(pos, holders) {
 		struct kmod_module *it = kmod_module_get_module(pos);
-- 
2.37.2

