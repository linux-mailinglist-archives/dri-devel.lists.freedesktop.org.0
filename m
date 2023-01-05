Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515265F44A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 20:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227F10E087;
	Thu,  5 Jan 2023 19:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1498610E087
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 19:20:41 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id h192so20331909pgc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 11:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=97sxfhjaB8PxBR7URrYCExoGnpeZKnrOyMFs+deDqoA=;
 b=IFFFns4mTLHYiYPOdpH3k/Z6BfSYt1T8o7KcJMEOb7uldcq+iWk0U8tofOlIyAkpKx
 Zm2YjpnCHTIqDwutAyZ/t+YGUhFLuddGsBcIAIPJyosjV4qRzQJLBfboku0pRLxE3rwg
 E92VlWkAp8E1qj7r+WM0hJV4a+/SrUMEFxVSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=97sxfhjaB8PxBR7URrYCExoGnpeZKnrOyMFs+deDqoA=;
 b=YJaiKMmpKDlsJEuBqHSVyYbADnyZxHWgWMs0Qe+8WE6GbSYZLYzc28i/PaEB382rPQ
 FhLC7u0hc6ivbXZf6eMig0UIhgjDhdG3ewaBVFGfNv08+oDRuOv5Vgd7pMwuz0Kv+YdP
 OYTdExZiz0SOCTgEn2mC2iVETPR66Mal4AOoxmLQl2b31PwBszSZldmGoKHC0IYMIZUj
 c4z0gHgY/yvYEjaQnGHUbfS9c2v1pRfy6yckx1gpOV7QsgEzCGKQQGAlkBKp8uMk4ebQ
 fR120l3iPa1Pk+5rXrtpWzSZsUj0deyJPJlLGTt9esUweu6PACym32J7STEK8Q3j9zjy
 Goag==
X-Gm-Message-State: AFqh2kpUBLk6aN7UilwrMBTyjAyZ1bg5T6nvVd+q5bRQSVhoE5b0CNzA
 BHaM0bzr9/lZisNQCRSUP/keqw==
X-Google-Smtp-Source: AMrXdXtusMz0bppoL5uIlyajN4gT+TrhL1MIdwcwHem6NamVhADBBImbslU9eAUU89LaXsDyEkiXYA==
X-Received: by 2002:a62:4e8e:0:b0:583:3d70:3661 with SMTP id
 c136-20020a624e8e000000b005833d703661mr473651pfb.9.1672946440663; 
 Thu, 05 Jan 2023 11:20:40 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 h11-20020aa79f4b000000b00582bdaab584sm5868470pfr.81.2023.01.05.11.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 11:20:40 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: Replace 0-length array with flexible array
Date: Thu,  5 Jan 2023 11:20:38 -0800
Message-Id: <20230105192034.never.249-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; h=from:subject:message-id;
 bh=eBudshCogBtu2xin7cq/2EcDLuR1Ha1dnf+jDA9WM7A=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjtyMFUMFrIl5nzBw/rrohurWWx677rm+9jnFO2OEH
 EHsCmCCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY7cjBQAKCRCJcvTf3G3AJh39D/
 9JXSePQkOSG9y/c/7C77a7sNLOH6tRaBYFyxy0DqaiEqTL/wMEaWTJIe/TCr3eh5BcFRGkvE9aIydJ
 k0rjqKkxDAuT1SXy1IBz60cx2VutSvE62Wg6uN3jeM3wPgOHq+ccnA71nY8P8nAsDE0iC/5YR4s0tO
 e1YWFmLBF8TiWofavtjiQzRN5JArRGAdoSseCu9rM4Agl2OI1Z99fhdxq3LrYJXFVDdZLIlMW8n1DO
 egCycrggYzOaG114EndKmY7TBCBUfZkAxDU0O/t/YRLEBYqVlpZTGugD+LL0Odn8sgVNk5qwzCabkA
 A6v2Azd+H1iC5u5tFAoJD01fRv6ehdA4UZP+Alp0cSfooDCbJ8gHvwkVaktKC6pwKotnrI9de/3zpO
 46+EcziPobYfUE/n+MG406Cr5/DbX8EH9RPVHvhxCN4tY5nHwpnIrHnelwe0RJOypvREb+N9DWq3hk
 QV+e8YP2rpKcIn25nevZZYExlnnxRWg+81Eo2n4xhAAtGY0ixR7hSYBOTp3jD1BuSfucmRBNiCuXRL
 qAMcw3Ygfp9kKDBDxcXrVBF21hRPN0cv45Odmb5Ee2GoQKhWYwpTAqHsctn4r3fhnQU7DNTWYzTjXp
 EU6fBQVzpe+v4o+gD7iVUj1EdwkxfMj9MlKVTgdtSKn+PDYo58UfpL2zyUyw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zero-length arrays are deprecated[1]. Replace struct aperture's "ranges"
0-length array with a flexible array. (How is the size of this array
verified?) Detected with GCC 13, using -fstrict-flex-arrays=3:

samples/vfio-mdev/mdpy-fb.c: In function 'mdpy_fb_probe':
samples/vfio-mdev/mdpy-fb.c:169:32: warning: array subscript 0 is outside array bounds of 'struct aperture[0]' [-Warray-bounds=]
  169 |         info->apertures->ranges[0].base = info->fix.smem_start;
      |         ~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from samples/vfio-mdev/mdpy-fb.c:21:
include/linux/fb.h:510:19: note: while referencing 'ranges'
  510 |                 } ranges[0];
      |                   ^~~~~~

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays

Cc: Helge Deller <deller@gmx.de>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 96b96323e9cb..bf59d6a3590f 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -507,7 +507,7 @@ struct fb_info {
 		struct aperture {
 			resource_size_t base;
 			resource_size_t size;
-		} ranges[0];
+		} ranges[];
 	} *apertures;
 
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
-- 
2.34.1

