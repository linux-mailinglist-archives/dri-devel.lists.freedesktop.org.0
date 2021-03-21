Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B1343322
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 16:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BCB89D46;
	Sun, 21 Mar 2021 15:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936CE89D46;
 Sun, 21 Mar 2021 15:19:28 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id c6so10565451qtc.1;
 Sun, 21 Mar 2021 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=au6yAq/994byN5B0Bwhkok5fWOyRbkNX7zhhajSq4Aw=;
 b=ns/uAHPvUjy2iZEKZoWbTS1sMcHu1FX5sa2+Z8yxjXxcwinwoh1oyHO4mBzFoz+fpP
 t9AdkaaVSj7Eu1xya6LHJaVIUcqswAx5v08y5I3BTb63tMUuXPyS3K84hMb0T+/eeKmc
 KaILdnSQt58/asDO3bjCrWZKNH5Mzbq3fDfqxwI+NkV3hn8wE3dPl0S/DJMWPcbTe4Tu
 uD5keox3ZMAS2sxZHl/Up9oKtEb10DorYYXPFnzVIjrNqccO+E1qLWfQKSBbfZdjt6Ap
 Ub4nMpKgmMjAYI1tXWC60AfBnDUUfg36l+ZcbzeesjUYFx4iHaOJjHSQ7KrEw/wRAW0h
 7RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=au6yAq/994byN5B0Bwhkok5fWOyRbkNX7zhhajSq4Aw=;
 b=X7Xnmnr5oWl7E822qGwbNvYRV2+qLZzGRIov2dl8EOMDFQYO596uLeIvC4zxtib2KA
 iirEAUAYTr0hlHtU574VIlbeU6y6daLCH9E0h6cLHFBrt2iuQ06yJKuphLOPjLfD3xab
 lllRC8ppsPHihjQxXyANUA5Qu+Mm/D71PYRR0a8AAdiYwut+E2aZ0CJgZM4n8hzdsr9i
 lplMiPvFC3NivKolJ4fX+fmjxxYIpR5c+/puMVz6lHWfne6fZsPUHB0RUlxFhr/d9qk4
 QefahM9zyV88qSiUFEY2nMELS397pfCXarOIrD1VIJKKB9fm7IaFJa6b4kqduw8UsLMR
 jqMw==
X-Gm-Message-State: AOAM532SzVu5aERtnx+F4UihP9ClRmf5qdWolE80F1IElIoskKRaKMQ4
 VtQn04DT072C4B7n9Ry1jswQaix+YdoasQ==
X-Google-Smtp-Source: ABdhPJwXT1ZITQY67+/yUvJVHD5s+98+2llrDVCVzJ7MdJbYm/lFiBOlr2ncZVUhSRoWxxr7oUHCsA==
X-Received: by 2002:ac8:1094:: with SMTP id a20mr6296117qtj.248.1616339967589; 
 Sun, 21 Mar 2021 08:19:27 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id 84sm9302704qkg.8.2021.03.21.08.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 08:19:26 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/radeon: don't evict if not initialized
Date: Sun, 21 Mar 2021 11:19:07 -0400
Message-Id: <20210321151907.367586-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Tong Zhang <ztong0001@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VFRNX1BMX1ZSQU0gbWF5IG5vdCBpbml0aWFsaXplZCBhdCBhbGwgd2hlbiBjYWxsaW5nCnJhZGVv
bl9ib19ldmljdF92cmFtKCkuIFdlIG5lZWQgdG8gY2hlY2sgYmVmb3JlIGRvaW5nIGV2aWN0aW9u
LgoKWyAgICAyLjE2MDgzN10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBh
ZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDIwClsgICAgMi4xNjEyMTJdICNQRjogc3VwZXJ2aXNvciBy
ZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQpbICAgIDIuMTYxNDkwXSAjUEY6IGVycm9yX2NvZGUo
MHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKWyAgICAyLjE2MTc2N10gUEdEIDAgUDREIDAKWyAg
ICAyLjE2MzA4OF0gUklQOiAwMDEwOnR0bV9yZXNvdXJjZV9tYW5hZ2VyX2V2aWN0X2FsbCsweDcw
LzB4MWMwIFt0dG1dClsgICAgMi4xNjg1MDZdIENhbGwgVHJhY2U6ClsgICAgMi4xNjg2NDFdICBy
YWRlb25fYm9fZXZpY3RfdnJhbSsweDFjLzB4MjAgW3JhZGVvbl0KWyAgICAyLjE2ODkzNl0gIHJh
ZGVvbl9kZXZpY2VfZmluaSsweDI4LzB4ZjkgW3JhZGVvbl0KWyAgICAyLjE2OTIyNF0gIHJhZGVv
bl9kcml2ZXJfdW5sb2FkX2ttcysweDQ0LzB4YTAgW3JhZGVvbl0KWyAgICAyLjE2OTUzNF0gIHJh
ZGVvbl9kcml2ZXJfbG9hZF9rbXMrMHgxNzQvMHgyMTAgW3JhZGVvbl0KWyAgICAyLjE2OTg0M10g
IGRybV9kZXZfcmVnaXN0ZXIrMHhkOS8weDFjMCBbZHJtXQpbICAgIDIuMTcwMTA0XSAgcmFkZW9u
X3BjaV9wcm9iZSsweDExNy8weDFhMCBbcmFkZW9uXQoKU3VnZ2VzdGVkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRvbmcgWmhh
bmcgPHp0b25nMDAwMUBnbWFpbC5jb20+Ci0tLQp2MjogY29kaW5nIHN0eWxlIGZpeAoKIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMKaW5k
ZXggOWI4MTc4Njc4MmRlLi40OTljZTU1ZTM0Y2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX29iamVjdC5jCkBAIC0zODQsNiArMzg0LDggQEAgaW50IHJhZGVvbl9ib19ldmljdF92cmFt
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCX0KICNlbmRpZgogCW1hbiA9IHR0bV9tYW5h
Z2VyX3R5cGUoYmRldiwgVFRNX1BMX1ZSQU0pOworCWlmICghbWFuKQorCQlyZXR1cm4gMDsKIAly
ZXR1cm4gdHRtX3Jlc291cmNlX21hbmFnZXJfZXZpY3RfYWxsKGJkZXYsIG1hbik7CiB9CiAKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
