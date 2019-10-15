Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3890DD78AB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B706E825;
	Tue, 15 Oct 2019 14:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB596E823
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y21so20534130wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMktrKxkm8fFb4FHC/LWbavGpA4bcLuBn62IAdf8rHc=;
 b=cA+892PVq9GX7dXc5NrrthD0Tkxr95P53kicFiFpbXYTLQpKQCMBMdBEEnjLI/HKEL
 kUFHYcYO5aJF5tMPgX9lkj67+lcwIn2FAuje7P/4XwK7qcoMt7Az5KhQuBUqE2TFjiex
 oBajT/pByVgGhu4zQVCX9Xqr7uKVbw8vhHLcVBwBiTtaYrZKDWGQ61+vgOzXx8e1TUow
 6A9pp2CWkSXPyUeIk3dZ/tVOWdkfdN40UH5KpVLO36v2hsx7wvHRB+5yB/6VRzR9qOzf
 Q59w1o9w4NhsFkWb49Iy/P+a8vKtR+rv5b/GtPGgkg17hkz/fmt7C/n3u0y5fz8QTBfQ
 HAcA==
X-Gm-Message-State: APjAAAVETB6OOIWaet3H8XmQ9l05HEwEVueCkylUrt0TSE9NAMISItZz
 TIorxVJcbhtspUWjguTb+mrKd/Fy
X-Google-Smtp-Source: APXvYqw1Y//A7QgmiBex5F4/uag6LU9qDl+eKJAMOC34mAAsyVJBL9+lYu68ZTndGxbSiKPgEWAyIA==
X-Received: by 2002:a05:600c:2388:: with SMTP id
 m8mr18611681wma.173.1571150124713; 
 Tue, 15 Oct 2019 07:35:24 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id o4sm52850650wre.91.2019.10.15.07.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/15] drm/dp: Add drm_dp_alternate_scrambler_reset_cap()
 helper
Date: Tue, 15 Oct 2019 16:34:59 +0200
Message-Id: <20191015143509.1104985-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMktrKxkm8fFb4FHC/LWbavGpA4bcLuBn62IAdf8rHc=;
 b=t7g8cHd5T6MgEsQIOXGfWsepy7UfvS6L1yMQsDcaB1nZSjf6GEBepR4QLWqV545EMo
 OAuoaqIpO6I5g1fbhIUwROpdcKLn6dotEHeC9qcveWrZpcOU2VCCPO/rpYz3ScZeEhju
 ezDjgK6uxk9tndNOzvFDCwsCWvMrakb5SCxn7uMs7O1pJoCFxm2PzXJ/hzkceTn72Hc9
 YHmFNDVp+bBf2hX1EQ3tSXB8BzB+uCDEgxKfB4J4XcLsHE3Ukviz7P5d0Ir5X8HYKe9f
 C5VXWpXp+DAE1l/FyeNCvp+f+DXnYEp3NtBMj3xUcTuODDDMEwzO8kIv0znzlo5K4eOJ
 /Biw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBhIGhlbHBlciB0
byBjaGVjayBpZiB0aGUgc2luayBzdXBwb3J0cyB0aGUgZURQIGFsdGVybmF0ZSBzY3JhbWJsZXIK
cmVzZXQgdmFsdWUgb2YgMHhmZmZlLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRy
ZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5k
ZXggN2ZmN2JmMGU3NDJkLi43YTUzN2ZmYzJmYjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTEyOTAs
NiArMTI5MCwxMyBAQCBkcm1fZHBfY2hhbm5lbF9jb2Rpbmdfc3VwcG9ydGVkKGNvbnN0IHU4IGRw
Y2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQogCXJldHVybiBkcGNkW0RQX01BSU5fTElOS19DSEFO
TkVMX0NPRElOR10gJiBEUF9DQVBfQU5TSV84QjEwQjsKIH0KIAorc3RhdGljIGlubGluZSBib29s
Citkcm1fZHBfYWx0ZXJuYXRlX3NjcmFtYmxlcl9yZXNldF9jYXAoY29uc3QgdTggZHBjZFtEUF9S
RUNFSVZFUl9DQVBfU0laRV0pCit7CisJcmV0dXJuIGRwY2RbRFBfRURQX0NPTkZJR1VSQVRJT05f
Q0FQXSAmCisJCQlEUF9BTFRFUk5BVEVfU0NSQU1CTEVSX1JFU0VUX0NBUDsKK30KKwogLyoKICAq
IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCiAgKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
