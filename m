Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4946CBCA74A
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B39810EAD4;
	Thu,  9 Oct 2025 17:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BSnAPg4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2257D10EAD9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:58:54 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-42486ed0706so7396725ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032733; x=1760637533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFKSLN6BiOw7bUnN4PQUQFUZxRNUkszMTNMdPxBofl8=;
 b=BSnAPg4y3FbHu7LGYkZQnNA5KbAuOIMHsNwWGMgmJi/cTdzfaZicoo2h/Y0coDO2ey
 DmbdiyjEythU9uqxMtxyrWJgOEuySrgZMrYAXqrVOUw9EYl5xIZ04yeEjuDnfQObNXhJ
 szGWz5MuMjT/pYV5ama0lw6NGZ5UvteNFVCnSBaqUsTFPXSOXULIuw1cTZIy8fIrZq3R
 Mz+WLZt/GbBhMWzfxf8bnOwQeWSXFnMTYcJIUAAmY4On7+pj6eyrNz5Sxqxej+9D1vNL
 pKN7YU5BCS6Jw2ULXwkwFjPkN6ZVpr9Ej6PJe+Hm6dQyIdAPBLbiRbi4oWJVfM6tL+4O
 zIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032733; x=1760637533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFKSLN6BiOw7bUnN4PQUQFUZxRNUkszMTNMdPxBofl8=;
 b=Tn7EfN4TylbBgMSIFv5GD4ixFLvhONhrsrEG6Ff9HXQOId7VTfNiSRaqgvITVSoWmO
 6aIDKcUeuc7eqjTD0wSOfBkQ+Vw3ku1SqiEA0G64aNbvXqHCNXQrvtMDOxdiXqVfyTUW
 PvkYXdjquVAzKha1DnY987WJEtKicZbCm2whL4L08wGKqoXLOEPAGWAn6tOrtGTf36lb
 3I1zWK7UQn4N3Cxkf5w+QnM00h8n2ZY3MkYEM8OWaqSWiAOTlNM6hLSSTuG20C+dYkL+
 A53ofSshmCZPBDGS4Dw5Syr5gvAhTmjCUw99AwFmMsd0op/c3FD9Ch9U+MgEVQsNFNXJ
 wo4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMdPM9JM1QUfWoV6pWwvMSKJv13GcPHpqbf1I5v6eS8czbnRGV7nL2vsOEFMjjd0fgNoSpJYkmF30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNXaXmvS78htjbqF0qwIULx9ra/nHZrgww29MQvK8Y2eAy02vY
 TIiG1LjP8Vllfxkdz4PhUgh5TsszlPvMgY+yUTEeJN/ckRci6nXvGheU
X-Gm-Gg: ASbGnctE3AeGbuOkBoiwYL73IgSIiusvE2LMBOTWYYbRmjd9qz/F7ikbSAw6wx2dbBZ
 lvG3SlRBXOpp8XMuuBbvO1gQcSZVd2GR9tHhXIYhvkBXhZGKawrSRmy+H1xGB01hMUGWCq7zNgv
 qL/4aXppIzDJld9DCdTOClh4MkN9VR4voqymM7QkgvR8D0RJ62IEOzzyj1BS7v9D5AEwNH++qL5
 AGMRX1tsCb97y8c9K9eQl2oKVSxjf8Ktc1zfAtX1DCiuz3ZV4q1/a7rD1MkttXYXh2F4hlxjpOy
 zo0QrUDC0OZUswG4Y4nVjEgQ/7S9g699UUokXbPVwXYAP7o7YgyO2SI8XgHu+mOpkFfrP2zbw4O
 oOcIqNzAdcKJGVSSw/ei2T+F0aXfuvJ4KythLuuuoeDDIgn4UVf9p9wQq6lXZS5c3xF/BmN0Ail
 3C0EN3Ex14HSC9+UE9GCoypGb+7Nr1PZrC4zrcOg==
X-Google-Smtp-Source: AGHT+IEFgHidntDfvFhDlZruUCJmrkaroGW1qP4eIEz2kkTaQPPkZf7Zvr9cHn+uTBEE/+gwDo4uRw==
X-Received: by 2002:a05:6e02:1a89:b0:42e:72ee:cde6 with SMTP id
 e9e14a558f8ab-42f8736aa0bmr82269925ab.12.1760032733126; 
 Thu, 09 Oct 2025 10:58:53 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 06/30] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu,  9 Oct 2025 11:58:10 -0600
Message-ID: <20251009175834.1024308-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7c..ac199293d203 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.51.0

