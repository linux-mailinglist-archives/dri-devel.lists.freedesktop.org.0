Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34ACFF929
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075F76E39B;
	Sun, 17 Nov 2019 11:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F156E169
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 15:44:26 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id h13so6838055plr.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 07:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WnvmRD6ZDU2PlgS2OgMDPMW99DMkDnT5Nicaq9xaRVQ=;
 b=S/WwumG1ymytBLBBBia605lP1YBMwG+7zozW40NY1NHkEDzwwv9L1r91y3Qdzt63Mu
 zFwlWYun6NJbMmZti4hB8cgLCSZofTryNAkLy+gNwZyOhXolU7rlo6jfNGwTxGJn4/Kp
 6ZCwVkJUmjed3LBL78fbuIbyb2RD7BLaCMLJcXhO1VMe0rsDkPXVyKtiSRnAO5PiLvJ2
 PB92ZtNzZ4o0FvUzJFsyViMn5n8oAQUwpP6a3Y+BP3P08bs9GLG07CANTje/WDh8+wX5
 MSvW5Jqlp94jplmGbdRN4o7B3xAg7moPbCr7kBiIfLNAhVtyxkULVHG5+PxD4Nh2UqJB
 WEMQ==
X-Gm-Message-State: APjAAAUZDmapEIfsseXCyC3zjjJs6a/uSbZY1drXXFRTf1c6fOGhxqlw
 7AiXnksXX7G9e8ybAwUdnG8=
X-Google-Smtp-Source: APXvYqxk3rWsL025XsJDd7R3JFwPwf78EUZFbORx+GvXHfQxAI3D8GG9l9evRVq16ywqnzyxDRPvOQ==
X-Received: by 2002:a17:902:5988:: with SMTP id
 p8mr20737410pli.131.1573919066482; 
 Sat, 16 Nov 2019 07:44:26 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id i2sm14306327pgt.34.2019.11.16.07.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2019 07:44:25 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] video: fbdev: arcfb: add missed free_irq
Date: Sat, 16 Nov 2019 23:44:16 +0800
Message-Id: <20191116154416.19390-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WnvmRD6ZDU2PlgS2OgMDPMW99DMkDnT5Nicaq9xaRVQ=;
 b=LpBNNZt3Jm05bbw8HoNK2SAm9Xpy31GRwHQQXSZ+v3eYIJAnw2O3albN2ikQKCYRoB
 zAl6lFR3Ok1VyDqRhV6FxUTdIWanQdEzO/UcfeT9FmJrPPIIOr137DcCUMHus1ot1kgx
 3iQ6TJQbCgHAsv7AiCHYpC5OPCoviKev0hhjOvAPdnTt8tN+8y/IDLNkTvoA5ljDRq/M
 OR5yPfz7oHn5okKYPKIgAPciL7L0aorvCzk0iQVDcADOumuD9qCX7AtfnzlDQlFLSS4Q
 TIdo0Qrh03y3Yn8X4QAWFXJal08aAu2UWi4RuTjtGJf6QecR+aICzyZmoqpm7ILnPl4n
 KSSA==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBmb3JnZXRzIHRvIGZyZWUgaXJxIGluIHJlbW92ZSB3aGljaCBpcyByZXF1ZXN0
ZWQgaW4KcHJvYmUuCkFkZCB0aGUgbWlzc2VkIGNhbGwgdG8gZml4IGl0LgoKU2lnbmVkLW9mZi1i
eTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2FyY2ZiLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXJjZmIuYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvYXJjZmIuYwppbmRleCBhNDg3NDFhYWIyNDAuLjdhZWQwMWYwMDFhNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy92aWRlby9mYmRldi9hcmNmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
YXJjZmIuYwpAQCAtNTkwLDggKzU5MCwxMSBAQCBzdGF0aWMgaW50IGFyY2ZiX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIHN0YXRpYyBpbnQgYXJjZmJfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKGRldik7CisJc3RydWN0IGFyY2ZiX3BhciAqcGFyID0gaW5mby0+cGFyOwog
CiAJaWYgKGluZm8pIHsKKwkJaWYgKGlycSkKKwkJCWZyZWVfaXJxKHBhci0+aXJxLCBpbmZvKTsK
IAkJdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihpbmZvKTsKIAkJdmZyZWUoKHZvaWQgX19mb3JjZSAq
KWluZm8tPnNjcmVlbl9iYXNlKTsKIAkJZnJhbWVidWZmZXJfcmVsZWFzZShpbmZvKTsKLS0gCjIu
MjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
