Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB4796311
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 16:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E666E3F2;
	Tue, 20 Aug 2019 14:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264396E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 14:53:49 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f22so6639553edt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 07:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LsMJOd+Vr//gN++n1h4q4g+7EoS55VUTthL4UKw+YSU=;
 b=WuIKxX5d8bRQGLox7SfvpkCG740+DXKYKflnfhMYIrk+dGwtYldazuS9Zbu1l5eIOK
 ZC8E6WRmX/k92BqM+Q0nrrE+4FdQc/g1jItRSKPEDr7vbSNoJU58qXkJ7gYQrua4mHdA
 tSJ4yG4sNpNVzzSVBCiS3MuJZ17ZsW0CNdy4yRM3Rr34HpIZ8NZJa3JcnrOGITBka4pA
 cKHM09ob6tHDVNO1D8iMMrDmvkie8L35vEAVFmiFAgGB5zl0Kuv2rGMq/wZx/m4tFOWX
 YYC1ORAG/BUok8UF0WuzvLL1nicFwh2GYV1TcYEVdG9pKG+ML361TaUkMRxLuh3tYrvH
 GlQg==
X-Gm-Message-State: APjAAAV66F3PdxXRzWJE68qnFZIs2JEWYZMiI7FZA13MnxauPj3ACA4c
 020kqbuAC7mBeZmLa0cJY+NJRJTMBOq7qQ==
X-Google-Smtp-Source: APXvYqx39b8WQ8cjuikbb7ChkoPkPfrRCz+xbBXsy47esCFIewmw1A7ArYI1XI+tGWiwnjmYLEml1w==
X-Received: by 2002:a17:906:8481:: with SMTP id
 m1mr26391383ejx.43.1566312827412; 
 Tue, 20 Aug 2019 07:53:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a16sm2644744ejr.10.2019.08.20.07.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 07:53:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] RFC/T: dma_resv vs. mmap_sem
Date: Tue, 20 Aug 2019 16:53:33 +0200
Message-Id: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LsMJOd+Vr//gN++n1h4q4g+7EoS55VUTthL4UKw+YSU=;
 b=ewbGJKKLFczcRpgEtOveyeMJLcgNDVHu/iPkMNlEkfyqy2LMcT5eqBqGseN0ruEh7V
 OAvnNmDapPwyKgwgWtdq2iSsbsiwxS+xIkyZFGIPXn+2CNJEqJ0CHpN5zwS+SRf2oVGO
 Jhf6GXCnkZE1amRJiBGSRCqwiO/3UzCtcbr0w=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKQXMgcGFydCBvZiBhbGwgdGhlIHJlY2VudCBkaXNjdXNzaW9ucyBhcm91bmQgdHRt
IGFuZCBkbWFfcmVzdiBJIHN0YXJ0ZWQKbG9va2luZyBpbnRvIHRoaXMuIFRoZSBnb2FsIChhdCBs
ZWFzdCBzb21ld2hlbiBpbiB0aGUgbmVhciBmdXR1cmUpIGlzIHRvCmhhdmUgaXQgYWxsIGRvY3Vt
ZW50ZWQgYW5kIHRoZSBjcm9zcy1kcml2ZXIgc2VtYW50aWNzIGxvY2tlZCBkb3duIGFzIG11Y2gK
YXMgcG9zc2libGUuCgpPbmUgb2YgdGhlIGJpZ2dlc3QgaXNzdWVzIHRoZXJlIGlzIGhvdyB0aGUg
ZG1hX3Jlc3Ygd3dfbXV0ZXggZml0cyBpbnRvIHRoZQpvdmVyYWxsIGxvY2tpbmcgaGllcmFyY2h5
LCBlc3BlY2lhbGx5IHdydCBjb3JlIG1tIGxvY2tzLiBUaGlzIHBhdGNoIHNlcmllcwpzaG91bGQg
Zml4IHRoYXQuCgpDb21tZW50cywgcmV2aWV3IGFuZCBlc3BlY2lhbGx5IHRlc3RpbmcgKHRoZXJl
J3Mgb25seSBzbyBtdWNoIHlvdSBjYW4gZG8Kd2l0aCBhdWRpdGluZykgdmVyeSBtdWNoIGFwcHJl
Y2lhdGVkLgoKQ2hlZXJzLCBEYW5pZWwKCkRhbmllbCBWZXR0ZXIgKDMpOgogIGRtYV9yZXN2OiBw
cmltZSBsb2NrZGVwIGFubm90YXRpb25zCiAgZHJtL25vdXZlYXU6IHNsb3dwYXRoIGZvciBwdXNo
YnVmIGlvY3RsCiAgZHJtL3R0bTogcmVtb3ZlIHR0bV9ib193YWl0X3VucmVzZXJ2ZWQKCiBkcml2
ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyAgICAgICAgICAgIHwgMTIgKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jIHwgNTcgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgIHwgMzQgLS0tLS0tLS0t
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAgICAgICB8IDI2ICstLS0t
LS0tLS0tLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAgICB8ICAxIC0KIDUg
ZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNzkgZGVsZXRpb25zKC0pCgotLSAKMi4y
My4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
