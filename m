Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89369ACF8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BDD10EFFA;
	Fri, 17 Feb 2023 13:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A2C10EFE5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ysk0aOdzp2igGOtHeZoTd2E71aY9qQ/NU2yUGbV3q7I=;
 b=ANKtewFx3+0ZDdkRZU15nps/EZcWE8ctnZh1y9h86Aq4ZeT2krQ+z8cn2CZrkF7zR3WOvZ
 P4FNmFjBnwFxaQIUCjMf0DkoBH4DK9fZX2/b0zPRHmSt5iXF9mmqiJwYxU4nOOLb9COoYY
 bnRB4UKNtLbbiA+gN71DckoB+8PgjTc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-l1E7XJrOO8Ke_VvVAyailA-1; Fri, 17 Feb 2023 08:44:42 -0500
X-MC-Unique: l1E7XJrOO8Ke_VvVAyailA-1
Received: by mail-ed1-f70.google.com with SMTP id
 bd13-20020a056402206d00b004acd97105ffso2016657edb.19
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysk0aOdzp2igGOtHeZoTd2E71aY9qQ/NU2yUGbV3q7I=;
 b=qgaHJ7AWylCzy2Hs3O3F2o9mu4Kb7yWplqwOFbkeHOzMZgk1k+VncUZ0twJSl2HkUw
 K8Kze4Mx+bXae7XfcfhQVAdJQms1/qbedG1RibqFv5wMkdE5DoocneHR/FHDhACn10vK
 xlAgXGfnnmnmJiU+4qfN2fLqjuwdmF8lQekAq2XqT9/jbXxaMgFLYwoAp3ox+gPsCfxn
 INGbJNf9mGW5Xv5vQwboC4eOkLRiDPzJtnPuBCUp6CS9gr48heDvDVbn542Iv2ulkIHr
 49+UWtLixFVH8uIEAwnwf2/4lw3Yv/dSKimZ1lOxNg+9o5b4mn3e0Tu8BFZoI5h0OTd6
 LnWw==
X-Gm-Message-State: AO0yUKUJAzb7y77jShhBlzNsvjEshR5e2WvR1pRCevMPR5yqMDq9Ngpz
 /tNVEolZYSAytXHvaneJt81suHHPDtJQEhQfkImc8qKct2nD8PuSHT6MC6mkbiznzs9EKa3cSPo
 1wWJIt8sgXZr7tfi0HZjI/Yrw3DzB
X-Received: by 2002:a17:907:d309:b0:8b1:2dda:b60d with SMTP id
 vg9-20020a170907d30900b008b12ddab60dmr5401612ejc.20.1676641481150; 
 Fri, 17 Feb 2023 05:44:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+xPQs4iBYRE3EkYeswx89ncoFpP13u/wl+vaRpLe0EqlVsAKT/Yi78czFv33gb2ohWXHgOKA==
X-Received: by 2002:a17:907:d309:b0:8b1:2dda:b60d with SMTP id
 vg9-20020a170907d30900b008b12ddab60dmr5401592ejc.20.1676641481019; 
 Fri, 17 Feb 2023 05:44:41 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a1709063d6a00b00882f9130eafsm2167138ejf.26.2023.02.17.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:44:40 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
Date: Fri, 17 Feb 2023 14:44:09 +0100
Message-Id: <20230217134422.14116-4-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split up the MA_STATE() macro such that components using the maple tree
can easily inherit from struct ma_state and build custom tree walk
macros to hide their internals from users.

Example:

struct sample_iter {
	struct ma_state mas;
	struct sample_mgr *mgr;
	struct sample_entry *entry;
};

\#define SAMPLE_ITER(name, __mgr) \
	struct sample_iter name = { \
		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
		.mgr = __mgr,
		.entry = NULL,
	}

\#define sample_iter_for_each_range(it__, start__, end__) \
	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index e594db58a0f1..ca04c900e51a 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -424,8 +424,8 @@ struct ma_wr_state {
 #define MA_ERROR(err) \
 		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
 
-#define MA_STATE(name, mt, first, end)					\
-	struct ma_state name = {					\
+#define __MA_STATE(mt, first, end)					\
+	{								\
 		.tree = mt,						\
 		.index = first,						\
 		.last = end,						\
@@ -435,6 +435,9 @@ struct ma_wr_state {
 		.alloc = NULL,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = __MA_STATE(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.39.1

