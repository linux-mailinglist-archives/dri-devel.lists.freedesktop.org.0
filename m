Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D3554267
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065F611384E;
	Wed, 22 Jun 2022 05:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542210E108
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 20:39:27 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id
 j10-20020aa783ca000000b00518265c7cacso5885841pfn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=TBTJUKxXl6/CoGemYB3REqJFiIeblmjK8L2EWRNC3hI=;
 b=JkQhyN+x8xO9p13An8lNUc3EIJj4b6DAyE7xZpJ7T7EpKBDtW2fZkVhM7DfjEQtJ7p
 6DI2hX0snVjQiA0cxY+7w2K5CTkr1lE3ImkqKi/WeJg/2eU2RAl8vDaQsC0iRPCfzc6j
 dlM/IwEY/mGrodbwRYQ7PCbIAARUeEMGzqkUlBnGmfAk0fTq+Uvm2QhpJjNQOJBhcqyW
 ucYnMt380S0hDSbNup1QcqxPAAZYvor5zrk7qQToX1oy754i1V3nPdifsyF+w3/bW7+1
 pf8oBBosJG04k2+FrshmyenC1ATMgUdchPUs2TRnmHb907CjwN2ckgEoG60OSv3zc/9z
 mI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=TBTJUKxXl6/CoGemYB3REqJFiIeblmjK8L2EWRNC3hI=;
 b=5mSlr1TXGPNXIbaJ4YguUOuPQE85YUqdx7NTLJWVpgPATYP+w7cTUNnFLH+tdQaLUn
 rgc/tYg4PnYVL3ZEUeJA5yD1GRZb8JtFjoZ+N/RQz6Yr0Ae2CJrHS1OJglgD3kLaqCRk
 q0Zkk0SKX0QDfGxvlWWsFiZMrjIWL20VVPVwwnTF20ouq3UbuRlwz7pVvRPEFflhvxt9
 7PnGHFHDG8aIl37qe5n5sTvZLGR3J62bO3pky9C1sf0Zhw/5d5ZMt8u9gTLz0n1adH4W
 mZOI0EJj0JlTVKQM05HCkPGnRhMPjcep0SD4YRkTEfvv8UCBAPy0eZxOk7dcSgpxge17
 uVdg==
X-Gm-Message-State: AJIora+TXmsa1muPEbaWMsPT/1Wo/nC4lWkQsrD8QXclg/lpMCoGkDwW
 4RxZdx2hDyPEBIFRXrOkulJlUn65Q019rg==
X-Google-Smtp-Source: AGRyM1ssb1j9pdEhTyuXhD8tWoHrkikkmhIQybOMDN7v+xBmjMvp9r+GQEe+ZTCmcx6n2GR7vd6pM9Lx6nqQHg==
X-Received: from zllamas.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:4c])
 (user=cmllamas job=sendgmr) by 2002:a17:902:d5c3:b0:168:f037:98d7
 with SMTP
 id g3-20020a170902d5c300b00168f03798d7mr30454468plh.117.1655843967320; Tue,
 21 Jun 2022 13:39:27 -0700 (PDT)
Date: Tue, 21 Jun 2022 20:39:21 +0000
Message-Id: <20220621203921.3594920-1-cmllamas@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH] drm/fourcc: fix integer type usage in uapi header
From: Carlos Llamas <cmllamas@google.com>
To: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel uapi headers are supposed to use __[us]{8,16,32,64} types defined
by <linux/types.h> as opposed to 'uint32_t' and similar. See [1] for the
relevant discussion about this topic. In this particular case, the usage
of 'uint64_t' escaped headers_check as these macros are not being called
here. However, the following program triggers a compilation error:

  #include <drm/drm_fourcc.h>

  int main()
  {
  	unsigned long x =3D AMD_FMT_MOD_CLEAR(RB);
  	return 0;
  }

gcc error:
  drm.c:5:27: error: =E2=80=98uint64_t=E2=80=99 undeclared (first use in th=
is function)
      5 |         unsigned long x =3D AMD_FMT_MOD_CLEAR(RB);
        |                           ^~~~~~~~~~~~~~~~~

This patch changes AMD_FMT_MOD_{SET,CLEAR} macros to use the correct
integer types, which fixes the above issue.

  [1] https://lkml.org/lkml/2019/6/5/18

Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 include/uapi/drm/drm_fourcc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f1972154a594..0980678d502d 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1444,11 +1444,11 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 mod=
ifier)
 #define AMD_FMT_MOD_PIPE_MASK 0x7
=20
 #define AMD_FMT_MOD_SET(field, value) \
-	((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT)
+	((__u64)(value) << AMD_FMT_MOD_##field##_SHIFT)
 #define AMD_FMT_MOD_GET(field, value) \
 	(((value) >> AMD_FMT_MOD_##field##_SHIFT) & AMD_FMT_MOD_##field##_MASK)
 #define AMD_FMT_MOD_CLEAR(field) \
-	(~((uint64_t)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
+	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
=20
 #if defined(__cplusplus)
 }
--=20
2.37.0.rc0.104.g0611611a94-goog

