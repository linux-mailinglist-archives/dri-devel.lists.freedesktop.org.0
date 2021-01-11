Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D72F217F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 22:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014EF89DA3;
	Mon, 11 Jan 2021 21:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B656F89DA3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610399158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkwN5vYCUrXN1gSw+5AUEXR+ndNOEnKeN2JIlRxKH3E=;
 b=LAWWSbpwpvmTGVbQPp7Nz/pvfHfrHemoCacI9SsKONZulqxLMB73HzM71uydd8ZvwM/Ceo
 yfDM0LJIAXwVmgh7wDQ172Da8xL4GGjRTgMNY/pJg+L2VDmmr555MyaWGmp6ucvyl9+GXw
 CSD0v8ntd0bwaWFeeKOOMvy4VTB2xxg=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-F0YG36qfPGqpa6pSwtHY6w-1; Mon, 11 Jan 2021 16:05:55 -0500
X-MC-Unique: F0YG36qfPGqpa6pSwtHY6w-1
Received: by mail-il1-f197.google.com with SMTP id z8so494267ilq.21
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OkwN5vYCUrXN1gSw+5AUEXR+ndNOEnKeN2JIlRxKH3E=;
 b=NwFmW5j8wEoA57iLk/1uXJ/SVM4dlRmbj+eC0+Kwqz851+CoGnA9Z51BxEDSZu5+kS
 kytvL1np1ULTJbYD6ERU7qjjJdhQ9LSEPxTC/6Malm1KEOXJhwcF1yqCVB6N+7qpnjmD
 S55tnXw/wvAtZMttf6KRfRzfcF6mlwnYjwGkI2P5cUy6VJsPeKf/Kbp/oSxAo8ZqbWqJ
 oRXtnpAFNX6skDUBQBjoZHDHigRfGa5g8k5qycUI5y4wGiltpcAOkyl8dunZtbNe9qJa
 jMNjSTeZ8gp6MiBWuCpbFe0aqZRcs6EWkVbFhz+BMHMVi0pn/Ct9PEkglTq/3EFOUgGR
 LXow==
X-Gm-Message-State: AOAM531kdO8mkzdBD+/yxaPUb6V11RDDIGr4qwmLDxFoHrpjI4iAp5tQ
 nTABHr/dWebbf2hXoUZV9d2TOOLjqVbemc96bCzheZeLa8ob17JrBAsDBDYCqmHYgA/O0h/EEZw
 mk0lJ5h3+U4L4VfZEk6QT7AljwgE6
X-Received: by 2002:a05:6e02:10c3:: with SMTP id
 s3mr973999ilj.269.1610399154546; 
 Mon, 11 Jan 2021 13:05:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6Ev4z4M7iiQ4IWIhPmz+JCzu3mpjfTGAREfYqUmeQmNUT4RarijTDgpFFHOnVLiRQw5uChA==
X-Received: by 2002:a05:6e02:10c3:: with SMTP id
 s3mr973984ilj.269.1610399154354; 
 Mon, 11 Jan 2021 13:05:54 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a63a:4d01:c440:5c61:43ba:350c])
 by smtp.gmail.com with ESMTPSA id k15sm711468ilp.10.2021.01.11.13.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 13:05:53 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] drm/amdkfd: Fix out-of-bounds read in
 kdf_create_vcrat_image_cpu()
Date: Mon, 11 Jan 2021 16:05:28 -0500
Message-Id: <20210111210528.734483-1-jcline@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108163104.411442-1-jcline@redhat.com>
References: <20210108163104.411442-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>,
 amd-gfx@lists.freedesktop.org, Kent Russell <kent.russell@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KASAN reported a slab-out-of-bounds read of size 1 in
kdf_create_vcrat_image_cpu().

This occurs when, for example, when on an x86_64 with a single NUMA node
because kfd_fill_iolink_info_for_cpu() is a no-op, but afterwards the
sub_type_hdr->length, which is out-of-bounds, is read and multiplied by
entries. Fortunately, entries is 0 in this case so the overall
crat_table->length is still correct.

Check if there were any entries before de-referencing sub_type_hdr which
may be pointing to out-of-bounds memory.

Fixes: b7b6c38529c9 ("drm/amdkfd: Calculate CPU VCRAT size dynamically (v2)")
Suggested-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 8cac497c2c45..a5640a6138cf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -1040,11 +1040,14 @@ static int kfd_create_vcrat_image_cpu(void *pcrat_image, size_t *size)
 				(struct crat_subtype_iolink *)sub_type_hdr);
 		if (ret < 0)
 			return ret;
-		crat_table->length += (sub_type_hdr->length * entries);
-		crat_table->total_entries += entries;
 
-		sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
-				sub_type_hdr->length * entries);
+		if (entries) {
+			crat_table->length += (sub_type_hdr->length * entries);
+			crat_table->total_entries += entries;
+
+			sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
+					sub_type_hdr->length * entries);
+		}
 #else
 		pr_info("IO link not available for non x86 platforms\n");
 #endif
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
