Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D613A91BACA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DA710EBE5;
	Fri, 28 Jun 2024 09:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JGAoNL+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1E10EBE5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:06:08 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f9aeb96b93so2005795ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565568; x=1720170368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/nz1JHR4z8p+ajw1D912vGA5V6XqUcGmzMFKN4JA2M=;
 b=JGAoNL+iLG88iga2MnXhU/Sb9h2/Gba7urXhuSEtu6hIqQzh56Ac455L9NLy99wXpK
 UFGSYxsonYqnZykq8wJq3Rg+X48PPQ5BYpE2GTdB1c1JsPC56F8yR7eKA4S/4aQljVcW
 7FxoRc66/aTmosjiUuU7oUWqgGPUS0vPy6sfpDQYcFnCj6ulqbN+WvBwlNqSPrebWy4T
 6TcjU1MngYyFkoELzfZFPeD8CMmRXh2+mIOJNbJUS+eqFj5tdotoLDY8WrrYPd9yN8rv
 z6fLsHcQJ+2jqo/TYswLOkAadzpe+JfUfLzDFh66LJAkxXSVLLMvFfenG6kJEFJPk5et
 SHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565568; x=1720170368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/nz1JHR4z8p+ajw1D912vGA5V6XqUcGmzMFKN4JA2M=;
 b=Vx5qDSjx90/SYUXPM4dgrdNItqULyxrL/oBcSJa7eU3TEadKA5G+5FwHh1loAlV4W6
 xiHQneofftKSo+nIwafz1CYHrYf7wbbS0kwdwntvUhJ6sUjXSXZN376butwnvqiJYw4f
 Ky3/dxrrVzjfNEh4S2X3tl6dMNXo/XZ53Gzvsqd7Ge0mKLIUpAEzRxXDFesJFdRUxu05
 fiXuL2n3Jjo4ARvPTZ7/Gox0zEF5oOPDk6HCwAqIvwa6ttS7ru3aFCqKLXZVWh6qgxU+
 aiMiKRtvOAK5kXfCfCFnsQOM2Foz1MPodqyPSuO1cKQUcORCiu7ABawUSN4lIqAcgvP4
 kpdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIKvO3FynngbC+f0g67xZY/mjvbumxILJja1sfMyPZmsGDi9xatt1WFRlqdhPr9Sb0AktaghoxXeWcMnL1cYtPhRo74VdDoao7quJF6JVN
X-Gm-Message-State: AOJu0YzzS8kmhziCCtsbxs2RMqvtR5QZc+gf5iJ0gN2pIbFDU0I5cTOh
 29VLpUEmcKrwHvjewNlcsWo3XtBIXJKlAr3mbf7+qh/YIC1Cv3ZD
X-Google-Smtp-Source: AGHT+IHdHlMsiSxDneCpl0Z+k+h/q/UIRrZYdoSU24sjr9+9ved5pPcYJylJrzwg3G+ZaraRZ/+k4g==
X-Received: by 2002:a17:902:eccb:b0:1fa:ab7c:a483 with SMTP id
 d9443c01a7336-1faab7ca748mr37580565ad.5.1719565567694; 
 Fri, 28 Jun 2024 02:06:07 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.06.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:06:07 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org
Subject: [PATCH v4 07/11] mm/kmemleak: Replace strncpy() with __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:13 +0800
Message-Id: <20240628090517.17994-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628090517.17994-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
 <20240628090517.17994-1-laoar.shao@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since task lock was dropped from __get_task_comm(), it's safe to call it
from kmemleak.

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/kmemleak.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index d5b6fba44fc9..ef29aaab88a0 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -663,13 +663,7 @@ static struct kmemleak_object *__alloc_object(gfp_t gfp)
 		strncpy(object->comm, "softirq", sizeof(object->comm));
 	} else {
 		object->pid = current->pid;
-		/*
-		 * There is a small chance of a race with set_task_comm(),
-		 * however using get_task_comm() here may cause locking
-		 * dependency issues with current->alloc_lock. In the worst
-		 * case, the command line is not correct.
-		 */
-		strncpy(object->comm, current->comm, sizeof(object->comm));
+		__get_task_comm(object->comm, sizeof(object->comm), current);
 	}
 
 	/* kernel backtrace */
-- 
2.43.5

