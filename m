Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55690689A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1C710E9C5;
	Thu, 13 Jun 2024 09:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k0wi33/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878A210E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:35 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f6a837e9a3so3691165ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245895; x=1718850695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7QH8g7nY2INvVrL4NU75ftNhN6FL7HL04IiCAjwJmE=;
 b=k0wi33/IvQ6Ogl6coTEfiLbKddo1L7hBeFs33Mw7XaqyfIghjMfd/zy2oFNkOgJARx
 GrvNBtxGoRehySfYg07gJN1qVmVHDLi450zI2qbqSGYezsrahFDm9qY8f1WzQzKerGwX
 u+4eJLa/uhwKhsOWN/4ndRaH22ZQcYt7jybHvwCsZ3oMghdxtyEWKvGO/rFbA8fn4GqR
 3ZfiY3jRbOD+yIRIpYvOt7PlslJDQFChkeZFbLiRQ4dFlL/ZVlUFRvKJ8jdvGiT/JTqj
 TwgSaOaoOpaji6LDJtAIhspnlBBCJ9raZPtOlT+j1VAGVqTPsG8QUeS/3QKgPkYkI36L
 o4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245895; x=1718850695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7QH8g7nY2INvVrL4NU75ftNhN6FL7HL04IiCAjwJmE=;
 b=msi2rUdu7osfWR5xAHRL9ykI2TditUBtGYx7Hmx6grx2BZyvVIJHqNB6W7PBww5TbJ
 O1UQlilYk8qclxUURBGLsayfW2ny/3f1el3Npg03F4KyU2WCBxJDbao2sewkBIADYYpf
 jHFXOtFlFfdO8gu+hkbK0iWvQ8ERIny4Ecwjzk1lMS84yidamMfhQEkeMrbFrlIanIN1
 ImWPKy7HWxM9PhsDr8yFB4gQTP0top/A7L3e/SIiB2H2V1gQcEhbgofexIhsPmvZaL42
 oX48zm/jTBVGcUmPgqTxjH1IK8Q1DN7tHkXQdeJn8s6x3HxWPhv9XiLCcY3il9lw3HHp
 ve9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeTu+IT5Iko5HtTwjOdRAC0FcGyX0mwt0nRLZf4yfjP2hpnWwg60qJwfyQNZPOYQnoocQ+tLKN7jAAUkqJG+SKfoejZ6jDsghDflrDCZkz
X-Gm-Message-State: AOJu0YwIt7IlgNspv6/HHuLgIBXHv8GZkfaghxKMXKzGwmu56FPgwIK7
 g64Soh8N2liRnB/U5KzxwhHDtrahGhv2i8zJDVIRa/tH27jHfN6X
X-Google-Smtp-Source: AGHT+IFO0RiQEuS+ZZx5NhUKFkro4pSWALq4fQpBCAuUBHe6UDJpEGOEOlucSptFPDnQxh/E7HkfRA==
X-Received: by 2002:a17:903:2283:b0:1f7:2051:18ba with SMTP id
 d9443c01a7336-1f83b565dbbmr48444305ad.14.1718245894762; 
 Wed, 12 Jun 2024 19:31:34 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:34 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Quentin Monnet <qmo@kernel.org>
Subject: [PATCH v2 04/10] bpftool: Ensure task comm is always NUL-terminated
Date: Thu, 13 Jun 2024 10:30:38 +0800
Message-Id: <20240613023044.45873-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:30 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's explicitly ensure the destination string is NUL-terminated. This way,
it won't be affected by changes to the source string.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Quentin Monnet <qmo@kernel.org>
---
 tools/bpf/bpftool/pids.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/bpf/bpftool/pids.c b/tools/bpf/bpftool/pids.c
index 9b898571b49e..23f488cf1740 100644
--- a/tools/bpf/bpftool/pids.c
+++ b/tools/bpf/bpftool/pids.c
@@ -54,6 +54,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
 		ref = &refs->refs[refs->ref_cnt];
 		ref->pid = e->pid;
 		memcpy(ref->comm, e->comm, sizeof(ref->comm));
+		ref->comm[sizeof(ref->comm) - 1] = '\0';
 		refs->ref_cnt++;
 
 		return;
@@ -77,6 +78,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
 	ref = &refs->refs[0];
 	ref->pid = e->pid;
 	memcpy(ref->comm, e->comm, sizeof(ref->comm));
+	ref->comm[sizeof(ref->comm) - 1] = '\0';
 	refs->ref_cnt = 1;
 	refs->has_bpf_cookie = e->has_bpf_cookie;
 	refs->bpf_cookie = e->bpf_cookie;
-- 
2.39.1

