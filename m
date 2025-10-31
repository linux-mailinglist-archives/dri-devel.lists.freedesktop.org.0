Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC8C264A8
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8577C10EBCD;
	Fri, 31 Oct 2025 17:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="ZD9av7sS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE7910EBD3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:49:06 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b95cdcacd95so97384a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1761922146; x=1762526946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x8KBeMeYUon6BQraYtudMUHNR0dTqRE5CF3A2DrTv9E=;
 b=ZD9av7sShBjssw/EcoFIGZb+JEvJBSJW497bTKQ5UQmh9BJA3YSmvGtehkhy5hjWWk
 Y6/JZNFjTR8IcTkovf0eGHD5e6NRxod2VK0jjAuNDWQ0saERiROt+HVpvhne2DkstKKR
 u+EBKVmvDuN9Zqma4rtj5YaqfTy/SCszJY8JWzmW00J3CQsJn0m0xqw2Hg8fDZGBATb/
 QeMBbD+yy3w+oUur4+FyvBACQZ0oYg9ITA6qX32da3HbS2amLn4zkaMyu7njXfhxUjn6
 +D3NdqVH89+2NfYRjHzeA8ndOw/4d1Hnda0aItOd8x/P/mGqO7jxhdMHPTlV4EmSbnDU
 QeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761922146; x=1762526946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x8KBeMeYUon6BQraYtudMUHNR0dTqRE5CF3A2DrTv9E=;
 b=IdvDo7ncsWUNFrUjcjiVAV+qThAxD5+PMc1Mcz5WOEcbTYsZyB67lkFbNgSx1oEL3q
 p21YVH472yj+M6Pp4lEMqBQesPqtDHMYzauYtvkePMqC2NfLREGabx3HE8Z9B50bLhGW
 nPnK7aWVIVk/DKTWlNAbkrS/5jhRI6WbvIUwv7r57POWzpPq65sWy/UOSaA9IbuIimov
 dIrwHhjSIKeQQjRjmmnz/wwr5A350r2LlEPAx0PPnQS8JoPDk3sZU1lTO6muNMlHrxgf
 9jUrQXQC/JhmkTluHIsXqeLpCeYnlHUsXZ3xJwtJKXSdrxgRsRmZrZZ+OSyq+uiLtYmF
 nN4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWOP/U4bSQ2Mdc5munPhr4Use9t1E/sSoSVN8PvGKQsdy3wCtt7FFf6+gGFQhF3OjGNI0q8sHGHK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWzTON1bs6CyDBW0JSVbrne08/t6VgjFQQovNQqf3EUYItX1J5
 DIQedrp3QN9RsQMpYSp3mLS81wpOlBFZVfczQ0dgl/xrnH0wTRKal6z6o95pqCgP8jg=
X-Gm-Gg: ASbGnctbl8xDADoMDLlD+kxp0Lx9Hgr4/0rzOcuPOxWEqUyp0ykGetxILbJmCJjxIo6
 fpXXWW744xggUuk9amMaL7UYnV3g/KWA8bv/Nngc5hG5XBxQxstZcKY6/xl6FMdBstbKU+NECMd
 hVxDELkwNKY9EgmGnXTf2znunLqp6MiVgkq5K1u2euE5RfANvsrBuK0jYioavEnLN/0mcyTBeJr
 6d2kQh4foNgZdm1meYQ63ZoK8S4/WD9lwtZVmXI6mEqMyI7pT7bx9kRjB9qpgebf3IWX5LrWAvs
 2umIxvI7FCSM5AORhohm8XTs9tWvD801pTcU02umPrSzB/MOqlmMbMWHgyq3SaJT5XzU9AeQktT
 DGbmrNcmqwsrxpHHoJhy2IkAW6zix1e07ceVzcVl2VeqzHAk7Fw8s9dN3PvSp4d+IjMjGv9glU0
 3elawIY2VE2Czj
X-Google-Smtp-Source: AGHT+IHPF2x0DGEn26EwYhqgvCtNpun32sTU7vWqgQS1gMXJpOJKN9HNTpNSlv3IlQSbO5TEaferpw==
X-Received: by 2002:a17:902:d487:b0:273:59ef:4c30 with SMTP id
 d9443c01a7336-2951a39e2eemr55702665ad.15.1761922146176; 
 Fri, 31 Oct 2025 07:49:06 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-295269bd2fesm26064835ad.105.2025.10.31.07.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 07:49:05 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 thomas.hellstrom@linux.intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe: Don't use absolute path in generated header comment
Date: Fri, 31 Oct 2025 07:48:53 -0700
Message-ID: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Oct 2025 17:10:51 +0000
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

Building the XE driver through Yocto throws this QA warning:

    WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
    WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]

...because the comment at the top of the generated header contains the
absolute path to the rules file at build time:

    * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules

Fix this minor annoyance by putting the basename of the rules file in
the generated comment instead of the absolute path, so the generated
header contents no longer depend on the location of the kernel source.

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 247e41c1c48d..e7a50b1348b7 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
 		}
 	}
 
-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
+	fprintf(args[ARGS_CHEADER].f, HEADER, xbasename(args[ARGS_INPUT].fn),
+		prefix, prefix);
 
 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
 		    args[ARGS_CHEADER].f, prefix);
-- 
2.47.3

