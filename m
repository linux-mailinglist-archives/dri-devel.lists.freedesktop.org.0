Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E1323A4
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0F189356;
	Sun,  2 Jun 2019 15:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3EB8987A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 21:03:34 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so2635598qtk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 14:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EVoBy70val96iyRWUzgEGMhxa62G1pkCrgxgHlubNtk=;
 b=SmgVBFW6HGmZB8Cr4XNcmNdAKwchnPYgD3kLobIrST5Ra6d9yBk5lK3iiwL8aKe4UI
 OLeAsxmK16WlJmk+dRGDlzxLgiHCuXlFeE364NyvsSF80v/vnNv6CWS8OkEEexcSDiVc
 TiMmHEha8H49ZBYL0MMg+LG2PZJfMdaAdOCDirzaFzejioG+wYptjTbkj/+aZF8cT7r2
 s0AUqqzCtiUHYm0cYG3ezK+Z4vtY5uohKZ4eOrUgJvNLMMDWukANPpJhCRpqLZhCaLK7
 ADC+S+gQKGmTyVERtKepi3ZcL58duLWxzTx/+qhGM25bt+Tq7EvKQnLk9oK1sceoOTPC
 GCtg==
X-Gm-Message-State: APjAAAXwyjzRLK1l1ohgTfZ52wXrxD13MYeKpj+dCyXpB/kRn5EWk7DY
 j6UOm67orVCVQ8P/ADewj38lXPaxt1E=
X-Google-Smtp-Source: APXvYqwehGm14n5LI8yz9G+/yLlBWZ5MFCuhFETeSWsGFtJcEV1cpT/R5ISgD96cYJX85xiqaSm7jA==
X-Received: by 2002:ac8:3861:: with SMTP id r30mr11442271qtb.341.1559336613921; 
 Fri, 31 May 2019 14:03:33 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id d18sm862293qkj.61.2019.05.31.14.03.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 14:03:33 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] gpu/drm_memory: fix a few warnings
Date: Fri, 31 May 2019 17:03:05 -0400
Message-Id: <1559336585-4708-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=EVoBy70val96iyRWUzgEGMhxa62G1pkCrgxgHlubNtk=;
 b=GBVdZeNpg4mBcK7MRP/Ey/Rd7KLoJSTk52Ko+aLDV94wYz+jOZUZKPppkU3b/yUX9m
 SohBmPhBlq7AU6D6tt/AQSbODHhrJxBlqhjtjYROqiQ/ZFiYyOr1wpFvy87Ny/uS1x8I
 EFtUGbi8zUSDI9BbyZ2a5lTJbHiRI6FbbH882kG4lsvRh/jUcRG5vSWJRn6rwVYgKzCs
 0/V1DZ3DCJhGUC2v1EraDMexzUlLfrrBk4vUC5o90ykYDw5sgbZZH1NwJAJBOz0vHdaR
 FCDZt+YSOikU5FIjpPT+rlaZq+A4zHc6wAXbPFfZHp/Q7WqRm+6M1v3l6+bEqrse8R8e
 rtew==
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
Cc: Qian Cai <cai@lca.pw>, sean@poorly.run, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9wZW5pbmcgY29tbWVudCBtYXJrICIvKioiIGlzIHJlc2VydmVkIGZvciBrZXJuZWwtZG9j
IGNvbW1lbnRzLCBzbwppdCB3aWxsIGdlbmVyYXRlIGEgd2FybmluZyB3aXRoICJtYWtlIFc9MSIu
Cgpkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjI6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0
YW5kICAqIFxmaWxlCmRybV9tZW1vcnkuYwoKQWxzbywgc2lsZW5jZSBhIGNoZWNrcGF0Y2ggd2Fy
bmluZywKCldBUk5JTkc6IE1pc3Npbmcgb3IgbWFsZm9ybWVkIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyIHRhZyBpbiBsaW5lIDEKClNpZ25lZC1vZmYtYnk6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3Pgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbWVtb3J5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCmluZGV4IDEz
MmZlZjhmZjFiNi4uNjgzMDQyYzhlZTJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X21lbW9yeS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKQEAgLTEsNCArMSw1
IEBACi0vKioKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQKKy8qCiAgKiBcZmlsZSBk
cm1fbWVtb3J5LmMKICAqIE1lbW9yeSBtYW5hZ2VtZW50IHdyYXBwZXJzIGZvciBEUk0KICAqCi0t
IAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
