Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D575EFFE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6410E2AA;
	Mon, 24 Jul 2023 09:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F49010E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:49:07 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b8c364ad3bso8860995ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192146; x=1690796946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CXd5cxT7BQDd98tt8oaC0MvbTuhoGV4WCiM7GrnKVE=;
 b=Om2j7Eq4b1zO3xdV6jpRgZNyxXUYFkRHVqkn+q5W951pJcNCyyCCfcFLMOexVrickD
 J4ocoN591zedkzE2l/xp9SKWxYNmVY9krcCZp1enxIDkg3AuGZslR02ZNhQ4EqRsU2HZ
 PP0+JI5GQi1EzLTs4k94q0v4nCvWQ/wpATlpWJHquPmCZ9F29qdBLMIvq7n3uMU0LBE+
 S5G8d6zEmU4sF3lI0zmYqBRm2zlIoJryhG+DWOUkdilD+QmzqjFCVIDjtSm2UD8IjhcW
 4f3Go/NoxA8FuaENkugEjSaXcGkVRUNsilnpPO5VZgwHu2urEIWQPvH/FMxPOeDNA9uj
 omeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192147; x=1690796947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CXd5cxT7BQDd98tt8oaC0MvbTuhoGV4WCiM7GrnKVE=;
 b=DE6DXDKjDWejaMy6h8lxOACvEPXrRrAblZ3x1EMXlkJwBxGR2IhfDLhSa9FMsWvR7U
 7bnpI+5eqFisUviQ72KLOLcyXz3GMo5+bShGfQ+5ZYUgx31L4uSrxEsyAmWBXaxtSPk/
 tqg2HKByZRW6/aPTXPqmEoLReLJtkvjcAXJj5F89te6Pk5mQ031hqXqehfrJsJO4kFnv
 Hjzh6fMhjb8PD/XSHaa08sR7tZsCauKIgLAe+nHPniHCua0IXZDDRZVmIvKiS1FRxMK8
 mdCbQdwYMxfjFC5IVJreJI2KhO3lNdGldS/op+l3lwpR3rvrdvADbyg+qsQCeppUMOWW
 hMXA==
X-Gm-Message-State: ABy/qLZCJhyi/1dl0xW7b/XZubSCGP9ucwWnclWE4rQHpN3ke1+i4VE5
 n93or/jZ19Uy8bqd1KJinmbCfg==
X-Google-Smtp-Source: APBJJlGIkgxKi3c8vlsRfvF8eC2AUaCtjB+PIQLMdMMArsufsHEWiltHfQyyqXBdYUy9SpebX4CtOg==
X-Received: by 2002:a17:902:e80a:b0:1b8:50a9:6874 with SMTP id
 u10-20020a170902e80a00b001b850a96874mr12324079plg.5.1690192146760; 
 Mon, 24 Jul 2023 02:49:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:49:06 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v2 20/47] sunrpc: dynamically allocate the sunrpc_cred shrinker
Date: Mon, 24 Jul 2023 17:43:27 +0800
Message-Id: <20230724094354.90817-21-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new APIs to dynamically allocate the sunrpc_cred shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 net/sunrpc/auth.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index 2f16f9d17966..74e40c8a512d 100644
--- a/net/sunrpc/auth.c
+++ b/net/sunrpc/auth.c
@@ -861,11 +861,7 @@ rpcauth_uptodatecred(struct rpc_task *task)
 		test_bit(RPCAUTH_CRED_UPTODATE, &cred->cr_flags) != 0;
 }
 
-static struct shrinker rpc_cred_shrinker = {
-	.count_objects = rpcauth_cache_shrink_count,
-	.scan_objects = rpcauth_cache_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *rpc_cred_shrinker;
 
 int __init rpcauth_init_module(void)
 {
@@ -874,9 +870,16 @@ int __init rpcauth_init_module(void)
 	err = rpc_init_authunix();
 	if (err < 0)
 		goto out1;
-	err = register_shrinker(&rpc_cred_shrinker, "sunrpc_cred");
-	if (err < 0)
+	rpc_cred_shrinker = shrinker_alloc(0, "sunrpc_cred");
+	if (!rpc_cred_shrinker)
 		goto out2;
+
+	rpc_cred_shrinker->count_objects = rpcauth_cache_shrink_count;
+	rpc_cred_shrinker->scan_objects = rpcauth_cache_shrink_scan;
+	rpc_cred_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(rpc_cred_shrinker);
+
 	return 0;
 out2:
 	rpc_destroy_authunix();
@@ -887,5 +890,5 @@ int __init rpcauth_init_module(void)
 void rpcauth_remove_module(void)
 {
 	rpc_destroy_authunix();
-	unregister_shrinker(&rpc_cred_shrinker);
+	shrinker_unregister(rpc_cred_shrinker);
 }
-- 
2.30.2

