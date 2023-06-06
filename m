Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373F724FA6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B6210E3E9;
	Tue,  6 Jun 2023 22:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AEB10E3EA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TgaMBAQqmFIKSof0UPPW7FVba5nvGkZRXtKURLuSZuM=;
 b=G+TYc4Nh6XgDiUrsXSsgdzByneYm3jNX5V9ixquwn7PzsGjf3kbrnhTOv8r92DdCK1z5xN
 Q9XbE5xAmba0aC+bPzo6/YsBLwxSdatwSdoVuLOMYM5M4hb0h1VwMh1iMIGI6spYnFQb3M
 UrnYB2BZ2CxdXEmxvcKXtEG3MZE455Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-SDxAQyf4N5SCazR6w1pSBA-1; Tue, 06 Jun 2023 18:31:46 -0400
X-MC-Unique: SDxAQyf4N5SCazR6w1pSBA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-97467e06580so486569066b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 15:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090705; x=1688682705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgaMBAQqmFIKSof0UPPW7FVba5nvGkZRXtKURLuSZuM=;
 b=aLa7zJc7mjdSC3OOPY4NBIvNsSb7ptCgI0RxHAVvZnWdLzNymCOlP6/lwCi0mBAKJ0
 QcEOTMqSCmlZMOZI6ylvz8nTNUXFzwNhOuxCfl2TNtW7tCjjHzakHJ+Iv4THanKhtYjj
 Eo23rIZ7W6iqgNLLy/omZMTRglwFLyY/hqZ0/26DcXY5TMwTKV24zzygLW3Az3Y05/SO
 ZSVlIu015QEHIfMWbmPjFPWEAfKgw+pDidxkkcnm6wi1kBh2UR2S5z/rF0nToj6IB3VU
 B9YeuKs0IzrkdKr1FAxE26Ib8E+pSilbL1mJMW2gdQqv6AsBFngWrUKRw/RKCqNqC6NQ
 IXEA==
X-Gm-Message-State: AC+VfDzpyyQnou2mhhjNPOZHzA1lPTa4k3aXIXsj/xOfqxeR2KmJcTUm
 gohvZ9TFjrnaUZKLd4PxWXsjE+hDRLNOG5GmYyKyMyzOfCsLRuR8knY09G0f8TvYSSvvK78YbQu
 8FOaNSkr9eErPIpy88/cnq67aSxMf
X-Received: by 2002:a17:907:7f1f:b0:974:55ea:1ad8 with SMTP id
 qf31-20020a1709077f1f00b0097455ea1ad8mr4182394ejc.63.1686090705430; 
 Tue, 06 Jun 2023 15:31:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7k+gI0czoVmC921zhzIqzKXOHylci9OpwOhdlMHjnqE4m4dX7VavWWqZ5q7J8PkPFhDWIb4g==
X-Received: by 2002:a17:907:7f1f:b0:974:55ea:1ad8 with SMTP id
 qf31-20020a1709077f1f00b0097455ea1ad8mr4182384ejc.63.1686090705309; 
 Tue, 06 Jun 2023 15:31:45 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 rh19-20020a17090720f300b0094edbe5c7ddsm6162646ejb.38.2023.06.06.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:31:44 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v4 02/14] maple_tree: split up MA_STATE() macro
Date: Wed,  7 Jun 2023 00:31:18 +0200
Message-Id: <20230606223130.6132-3-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
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

