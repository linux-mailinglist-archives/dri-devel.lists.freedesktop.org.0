Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCA7360A4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4AC10E187;
	Tue, 20 Jun 2023 00:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9610E0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687221756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9apoWPgHQ+HttjrVOmvMmvBAGzRpC/qILH8eE4EO5c=;
 b=EE//73RiU8vABuI6O23K55H8XD/8lksm0NaIZpQ9UM/v50QLbEY5+hCZtEMVo8Nkzua9gB
 57Eem8CMTax5hdAqzuTVUgDJtN5vrJQU+FQphDj1BCKlGvfYq/eIJenP3DLbEq5X3pHo4z
 GqT/OJf242G34eXQS9Zj99lZGo34LDY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-B3HPRJzcMKqFLhbEhKzRtw-1; Mon, 19 Jun 2023 20:42:35 -0400
X-MC-Unique: B3HPRJzcMKqFLhbEhKzRtw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9884f8f5bf3so196392666b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687221754; x=1689813754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C9apoWPgHQ+HttjrVOmvMmvBAGzRpC/qILH8eE4EO5c=;
 b=G06XJWkOz/DQ139sPvOqgAAUaIuN3T4g6TavrHhUyZ3vJDJJrOTffvbHoFukDPCTQ8
 CB/UAS0Tud2WgLrN9iDzSKawYCzUTxvKoQBrAKOa77w+vCPsfphWeAQ+wcyxPpIrYYoT
 LZrySs3hNDrNFLG0B3ks0Tz8swmUUbmaejA0y3BaoS65Q1OZhyjdyKnK1JMA6TArdqq3
 vXfv9u4ZiM6BRJjBwcm3RrVCkSM7VlpfP98A7ZYbjtNY1DBI6lJgHZjxaKAtbZ3HIofb
 IVWNQ/Br9oqBGAEBgFtXXJ65IGCdFRT5aR06TgzUdAlgQv3G8RcD0f4JkbGwjFYJHk7j
 /VAw==
X-Gm-Message-State: AC+VfDxyQWo/Pwqvuid9BUtq+V/ha+JfuTBNoxZ4adC5SSgUxeNZYvPC
 eYeocC8cCBLwUKuT8ZzZ2/XkcMPqs6EH+C8u8JCsTBoimpfP6+SMhAlTzJbqPln86zOGYNsE8aI
 VjAcx8REFUk8YeES0Ai6c5iJAFoVK
X-Received: by 2002:a17:907:3e0a:b0:8b1:7de3:cfaa with SMTP id
 hp10-20020a1709073e0a00b008b17de3cfaamr11230764ejc.3.1687221754046; 
 Mon, 19 Jun 2023 17:42:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CuI4jncrqThsJCOY9EL8v0SHvOVlwMCpxRyLtkLTLUI18H8CeggEpcXJgjnduPuXIFRYrhA==
X-Received: by 2002:a17:907:3e0a:b0:8b1:7de3:cfaa with SMTP id
 hp10-20020a1709073e0a00b008b17de3cfaamr11230750ejc.3.1687221753916; 
 Mon, 19 Jun 2023 17:42:33 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a17090603d000b00986e6a7d230sm377729eja.168.2023.06.19.17.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:42:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v5 02/14] maple_tree: split up MA_STATE() macro
Date: Tue, 20 Jun 2023 02:42:05 +0200
Message-Id: <20230620004217.4700-3-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
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

struct sample_iterator {
	struct ma_state mas;
	struct sample_mgr *mgr;
};

\#define SAMPLE_ITERATOR(name, __mgr, start)			\
	struct sample_iterator name = {				\
		.mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),	\
		.mgr = __mgr,					\
	}

\#define sample_iter_for_each_range(it__, entry__, end__) \
	mas_for_each(&(it__).mas, entry__, end__)

--

struct sample *sample;
SAMPLE_ITERATOR(si, min);

sample_iter_for_each_range(&si, sample, max) {
	frob(mgr, sample);
}

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 1fadb5f5978b..87d55334f1c2 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -423,8 +423,8 @@ struct ma_wr_state {
 #define MA_ERROR(err) \
 		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
 
-#define MA_STATE(name, mt, first, end)					\
-	struct ma_state name = {					\
+#define MA_STATE_INIT(mt, first, end)					\
+	{								\
 		.tree = mt,						\
 		.index = first,						\
 		.last = end,						\
@@ -435,6 +435,9 @@ struct ma_wr_state {
 		.mas_flags = 0,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = MA_STATE_INIT(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.40.1

