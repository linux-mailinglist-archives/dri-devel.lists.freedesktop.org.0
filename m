Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3DC6B8D9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D04B10E518;
	Tue, 18 Nov 2025 20:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="em76a7ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAD410E516
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:09 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-9486d008fdbso8772139f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497148; x=1764101948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M25T8tvP10BpQGqTu5Zj5kHgkTLLNAK2ADT59hdkhbg=;
 b=em76a7exS5+iNnP3Thi0lp43tZYMbL+SUwS/bIFjRoIfPActd83bhYjFhwZbeYmYyt
 AJ/7RfHuHRfVHOg/mEhF18GES2979jyHsmwhQJw28CwqyFjNFSxh7C9XUNKY6unOBNxO
 /GcsSFwICBIw/S6bIVffP6iPJ0AMvFDzcEaw48r7YVag7y4xCZoU2BhoLy7qPpfIjGhK
 mhTdKQHEMikg7WEg1ywh/sOE9fThYkMEAB5k0LkX1Ms19TpPEqTIZtvb/jOynciFYVvO
 3XMpTyOwrsy66bm1IG4PUsIM4iJKIZYPY6VOPkLP3ZM/UkwzrU5OFp96juH0zDnHnolz
 GSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497148; x=1764101948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M25T8tvP10BpQGqTu5Zj5kHgkTLLNAK2ADT59hdkhbg=;
 b=kBoqipyTcP9/sTZP784N64bsjbmCA2pBdTsmTZS5PWfxuHKzP3S+n0z88wgJtMySyU
 8wwthGgykNWcrBld9ITqluTmt2uB0VQqTGCuKxeNY+caI66QhHdBC2+RNxwJR8fRXdgN
 sFYYjaLFR64kThBiXa0olgjVzmGocIWpEg59owxiSa3iDwfrlND5MKAPf8WeA1hwddZS
 Vfj4wWaGydv6px27cqC2aZbNa9P3UvY/Fv33W0m5DkItqXJKxXiWGaWhgq1KvEsWMxzb
 RMPU3YCJO2Qz7jIcPQ6NRsc0UqpzrPLIfPBpLpkc66WOKlQ/3JZJI9MDPsehqbv5X9vT
 eCjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh8XLd2sQ//pripGM4ve15WTGM4nE3z8M1WUBFx8ggciJC+ceNsr1VNha7D5I5YN51y4NJyNd8y7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywub4fKH3RpxBrnW7gSuY7Er6GFrqfpIbG3/Lc7ADbDfc69ITsu
 RuiyEb2saAVNlKO2l7Ym2AM4lq2Go3nwSLr7njK8eomTYvw2Iwnv8bPi
X-Gm-Gg: ASbGncva6lK4uhLGOfbVUnfq9c3jS5WgCAdLhUu3DxjqQNNq0x+qXmEBS1wiL1gfSP4
 KZrypcFOWIe0TiWmJdVIngCyItczuXgKe7IJ/ltJ6RQiQDSaHDG8UEy6RrBuH1ZIJSMCxwEjhhV
 eMx2eERePF47dVS/Jk8GEbM/Y6b7t0hiW5naq6DWxiD3qx4syCVEv4S0U0zVYNa8A0JAzbEZPFQ
 SF1FIMdlzWgyW6CgpqoyIXengvgLVGR0DV9bHSWPhcKeN2Sbof7Dz2mkMIOgSSLsKqFSGhwm1az
 JCYWZ3LjiIUBQLl0ryxiOG4zaSAaLnlqzMAamUT1Gwz6k60tpDObzYHJddIiuMABMaOh40dTwiq
 1DZ0qatpD6bsRf6DG3uyoKaKK2URlxWabzBTAjKfZsgiYknGMmN1v9VA178Qh9fBUXdVxlzxkPL
 XLqsHuLRQ/DQuHOTD4qszPEbSgHxzqcnzwFtDnerfu/ThyT1fTlu2JJmnzFthf8s3ZU2Y=
X-Google-Smtp-Source: AGHT+IGW4D0lXSlWs3TmDsGRLwaEvoluKtRmCX47T4Nwd4L5+oUFwNMTUyue7S+to7ix3wowc8R8jQ==
X-Received: by 2002:a05:6602:2ccb:b0:948:7255:e2b5 with SMTP id
 ca18e2360f4ac-9492b85c431mr17183639f.4.1763497148452; 
 Tue, 18 Nov 2025 12:19:08 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:07 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 07/31] dyndbg: make ddebug_class_param union members same
 size
Date: Tue, 18 Nov 2025 13:18:17 -0700
Message-ID: <20251118201842.1447666-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 98a36e2f94b6..4b7c3b997657 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -103,7 +103,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb171088850c..d2ff203d0873 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -810,7 +810,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.51.1

