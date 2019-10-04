Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDCCCCB4A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453106E3B8;
	Sat,  5 Oct 2019 16:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9496EB11
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 10:17:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so5198722wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 03:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Vcf+UVY2rqjJRPiANDeBRpXqOSdb6/jb+sfnhdp7MM=;
 b=Mle9y9IDAehfGFtey9dsdluxGZIFEWlqAJIhl9yNXQOd8ajReTScVDH221bRUjJMZP
 bFBcRCW52MPwgKz6LItUxGiwvA3Hbl9JijgviYcwQBvneOJlIME1rLGVAz55UpCF4TPH
 EqysPefu1D6Akaq/IkOrT8ElVEebep1QxFLlfIItL/Ajn00sy03Be2lo2vFbku9BKQrD
 xGQcR4fi3o0e2xHjLcVgUgB6Sh7zfzJUPL5Wy5mVheuHdAHZnVcjZ2anok1aU8s1/CeC
 MM4K8a2rRPRMNms9llUulP2AcYX0oRDGAI3NBQD5ZRBTl6r6iplso2uU77vR/KieHy+6
 jdEg==
X-Gm-Message-State: APjAAAXQuknR/0QntDMzxSmhmbKO2tlSHbaBR3TPJ6CTjcmjDu0/h41W
 2pbCzmIqzl+UsDLQUaWtP31idI/a/go7Fw==
X-Google-Smtp-Source: APXvYqyOe3FXbS45/9CxnBvy82+J1R+6Ye4lJbdrFwXRJC0rYLNRsJ1HE34LHIbyZYreSgkDWSBc+A==
X-Received: by 2002:a7b:caaa:: with SMTP id r10mr10829469wml.100.1570184274042; 
 Fri, 04 Oct 2019 03:17:54 -0700 (PDT)
Received: from brihaspati.fritz.box (p5DE53CC9.dip0.t-ipconnect.de.
 [93.229.60.201])
 by smtp.gmail.com with ESMTPSA id t18sm5278823wmi.44.2019.10.04.03.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 03:17:53 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: fix memory leak
Date: Fri,  4 Oct 2019 12:17:46 +0200
Message-Id: <20191004101746.19574-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Vcf+UVY2rqjJRPiANDeBRpXqOSdb6/jb+sfnhdp7MM=;
 b=vJpW+xhTbLcgoLYjISojp3oyFM70IqtJPOBBYFcbZkhWynU5Z8bYhxHuN7YednMisa
 64/5PGDK2NwVv58w7wEsVJGBRp8laLhuJYKH2nt+XqCq3wUhz2H/OLJndPRKfsSQuPDd
 UcntM3z55GL+5uq6zUXU8jJoSpiE30YqO0ZKM7OqWmjjUAeaPM1NDym8yrA7sDqV5iPW
 FwjWE5AXVOY96r7uZiBk2d++9CiPErENN8vW7L7HEb9z30mUzpJ4lgSaBoj5Kb0a5g1u
 KxccvAuu0IsMCrV55yKKERr53DTtwpTgijWlFx/ViRu+WKjMyjgJMTrtRYOCrqVDRRxT
 ORew==
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
Cc: airlied@linux.ie, nirmoy.das@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gYW1kZ3B1X2JvX2xpc3RfaW9jdGwgd2hlbiBpZHJfYWxsb2MgZmFpbHMKZG9uJ3QgcmV0dXJu
IHdpdGhvdXQgZnJlZWluZyBibyBsaXN0IGVudHJ5LgoKRml4ZXM6IDk2NGQwZmJmNjMwMWQgKCJk
cm0vYW1kZ3B1OiBBbGxvdyB0byBjcmVhdGUgQk8gbGlzdHMgaW4gQ1MgaW9jdGwgdjMiKQoKU2ln
bmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2JvX2xpc3QuYwppbmRleCA3YmNmODZjNjE5OTkuLmMzZTVlYTU0NDg1NyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jCkBAIC0yODQs
NyArMjg0LDcgQEAgaW50IGFtZGdwdV9ib19saXN0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmRhdGEsCiAJCW11dGV4X3VubG9jaygmZnByaXYtPmJvX2xpc3RfbG9jayk7CiAJ
CWlmIChyIDwgMCkgewogCQkJYW1kZ3B1X2JvX2xpc3RfcHV0KGxpc3QpOwotCQkJcmV0dXJuIHI7
CisJCQlnb3RvIGVycm9yX2ZyZWU7CiAJCX0KIAogCQloYW5kbGUgPSByOwotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
