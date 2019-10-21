Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19ADF059
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4826E135;
	Mon, 21 Oct 2019 14:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82EF6E140
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:50:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so13121926wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFgIZJg0qD7xL/sTNg6c6IkqHgDSAfaSE3LB/HJNtZk=;
 b=it9Q3PKnblxAZ5MpCBlGWfhFfGyAMjCIGhx5vfFdc4oNF5UpFaCnY9f6CaKLvWCwi7
 vBG7Wctos4m8xgqGrDwg01wCupcus93QCKl2jmai1tZRQTwJkTBu/Mg3NmeJSGo5fcrP
 7gmUp7HBD3NNdTZgw4W6Cj55Goku8JgX8REvfJsfZkIbGwzoftC57FEXsqOsR1F9ZCEW
 6nJfQmwIjNKci8Zj8fhSno8UP2TR7wSlbrCdrUAQMJWzKjVoZ85HdmiYkfAiPZopDJke
 DiEX4BZ2Rq/OGswPRs2MgI7p36lu+4OsC5gmMQO0UE5c+tBKSTn4QMZXxhM1mvdqH52B
 lVnA==
X-Gm-Message-State: APjAAAWaAVUP5Ani9mdhfCY9aooFfLgVQPJtOIqRKOwmMdD7W9ioMFTc
 WWt3xtExIdH3Evo+HRYsFNAI0rqP2qI=
X-Google-Smtp-Source: APXvYqw6wHiABU/9ZGV8jTCxoo1N2f1tMcoLUXHH589joghLChOjar8Q9qAdsgxUP4KhIQUlgDznEA==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr20170753wmk.145.1571669423047; 
 Mon, 21 Oct 2019 07:50:23 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u7sm7712053wre.59.2019.10.21.07.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:50:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] dma_resv lockdep annotations/priming
Date: Mon, 21 Oct 2019 16:50:14 +0200
Message-Id: <20191021145017.17384-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFgIZJg0qD7xL/sTNg6c6IkqHgDSAfaSE3LB/HJNtZk=;
 b=JvrX1U2LPho9X8Gzfk0omaJQzoP4cwf1quiNU+tV330rJ6VDHoysZPlNW4itN2STHx
 cqPG3ojh+Mk/wZT5Ht2iWLvUZVHgl2trusUFucopIeB3V0rUv3s+V00KkFMrt3u3BebG
 aa+iIW7nfCm2qCuC8w7Nb+aneSui7Hn247R9w=
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

SGkgYWxsLAoKRXNzZW50aWFsbHkganVzdCBhIHJlc2VuZCBvZiB0aGUgbGF0ZXN0IHJldmlzaW9u
LCBzaW5jZSB0aGUgc2VyaWVzIGlzCnN0dWNrIG9uIHRoZSBub3V2ZWF1IHBhdGNoLiBJbGlhIHRy
aWVkIGl0IG9uIGFuIG52NSBhbmQgaXQgZGlkbid0IGV4cGxvZGUsCmJ1dCBoZSBub3RpY2VkIHNv
bWUgaW5zdGFiaWxpdHkuIE5vIGNhbGwgeWV0IG9uIHdoZXRoZXIgdGhhdCB3YXMganVzdCB0aGUK
a2VybmVsIHVwZ3JhZGUgb2YgYSBmZXcgdmVyc2lvbnMsIG9yIG15IHBhdGNoLgoKU28geWVhaCBJ
IG5lZWQgdG8gZ2V0IHNvbWUgcmV2aWV3L3Rlc3Rpbmcgb24gdGhhdCBwYXRjaCB0byBsYW5kIHRo
ZSBvdGhlcgp0d28sIGFuZCBJJ2QgcmVhbGx5IGxpa2UgdG8gbGFuZCB0aGVzZSB0byBtYWtlIHN1
cmUgYWxsIHRoZSBsb2NraW5nIHJld29yawppbiBpOTE1IGRvZXNuJ3QgbWlzcyBvbmUgb2YgdGhl
c2UgZGV0YWlscy4KClRoYW5rcywgRGFuaWVsCgpEYW5pZWwgVmV0dGVyICgzKToKICBkbWFfcmVz
djogcHJpbWUgbG9ja2RlcCBhbm5vdGF0aW9ucwogIGRybS9ub3V2ZWF1OiBzbG93cGF0aCBmb3Ig
cHVzaGJ1ZiBpb2N0bAogIGRybS90dG06IHJlbW92ZSB0dG1fYm9fd2FpdF91bnJlc2VydmVkCgog
ZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jIHwgNTcgKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgIHwgMzYg
LS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyAgICAg
fCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAgIHwgMTggKysrLS0t
LS0tCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgIHwgIDQgLS0KIDYgZmls
ZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
