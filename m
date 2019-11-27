Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB910C4EE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA746E602;
	Thu, 28 Nov 2019 08:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E895689B46
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:04:27 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y206so2116098pfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 02:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fla0mLE3kPARMpuw52rBb145CpRIcrUfv5y6FZzfYow=;
 b=gffyKiKaL1cX+TNIcUwmhciMrys3qad7wjZ6fuGn2CkWSk+GCikG0qu7Jqu/vkPd59
 fgbVDhZ9PZTsWD1VLESOHfeAdJAPgLPA6pFH98v5+fcEmPVov9bTecJLa28JitfeNpoN
 BiFaP7SvSvKJudw0l7aP38Jxy4DGJlPBkB3PQHxuqOaLpTY8enGeM8JLAwVFB3DRzp57
 GMElaC9SRqWFkCgCes7zgi+rSRaLOSpVHVFhmoLLTSeDyL6EmgrsNILaorIGYPRwac4H
 5qrMmh7sCJLqXJG+VXTM71VNJFZTxLzURT6InRE0RnWbE0o16GODXzX9OpdpwFuMetje
 oxBQ==
X-Gm-Message-State: APjAAAXa5C2EWXZqAc5Y6E/eF09xsB5Ow02QNRs43sVZT2ielzibRqa5
 WI0m7H0ldCoDbDzHI1+a1omDow==
X-Google-Smtp-Source: APXvYqzXspCMDcVbYgH/6lgSpThq/u782otjCOXgjkwhYm6xw8BQ13uACOi72z9Q3T6FJKzNAto7hg==
X-Received: by 2002:a65:4809:: with SMTP id h9mr3814513pgs.265.1574849067339; 
 Wed, 27 Nov 2019 02:04:27 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7889:7a43:f899:134c])
 by smtp.googlemail.com with ESMTPSA id
 n18sm16063907pff.152.2019.11.27.02.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 02:04:26 -0800 (PST)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] drm/mediatek: Fix can't get component for external display
 plane.
Date: Wed, 27 Nov 2019 18:04:19 +0800
Message-Id: <20191127100419.130300-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fla0mLE3kPARMpuw52rBb145CpRIcrUfv5y6FZzfYow=;
 b=RwOyeu/bPVGltW59qJ4ylCblmR5cOGkzUq9UNiaKHpWvfQPMChAxhON+4bSUJovU8n
 zUPQsv3tpq+x4Lwhx4KaW+DIEzK+DzY9Kc7Cg5Lh4sj0Tgu9zIi8ibZ8YPn58QTJuUO+
 G4lekg7BfIooWsOH7uQR0q7Y9LKF4gHyFwK9A=
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGUgb3Jp
Z2luYWwgbG9naWMgaXMgb2sgZm9yIHByaW1hcnkgZGlzcGxheSwgYnV0IHdpbGwgbm90IGZpbmQg
b3V0CmNvbXBvbmVudCBmb3IgZXh0ZXJuYWwgZGlzcGxheS4KCkZvciBleGFtcGxlLCBwbGFuZS0+
aW5kZXggaXMgNiBmb3IgZXh0ZXJuYWwgZGlzcGxheSwgYnV0IHRoZXJlIGFyZSBvbmx5CjIgbGF5
ZXIgbnIgaW4gZXh0ZXJuYWwgZGlzcGxheSwgYW5kIHRoaXMgY29uZGl0aW9uIHdpbGwgbmV2ZXIg
aGFwcGVuOgppZiAocGxhbmUtPmluZGV4IDwgKGNvdW50ICsgbXRrX2RkcF9jb21wX2xheWVyX25y
KGNvbXApKSkKCkZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBvZmZzZXQgb2YgdGhlIHBsYW5lIHRvIG10
a19jcnRjLT5wbGFuZXMgYXMgaW5kZXgsCmluc3RlYWQgb2YgcGxhbmUtPmluZGV4LgoKRml4ZXM6
IGQ2YjUzZjY4MzU2ZiAoImRybS9tZWRpYXRlazogQWRkIGhlbHBlciB0byBnZXQgY29tcG9uZW50
IGZvciBhIHBsYW5lIikKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5p
dUBtZWRpYXRlay5jb20+ClNpZ25lZC1vZmYtYnk6IFBpLUhzdW4gU2hpaCA8cGloc3VuQGNocm9t
aXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCA1
ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwppbmRleCBmODBhOGJhNzU5Nzcu
LmIzNGU3ZDcwNzAyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwpA
QCAtMjE1LDExICsyMTUsMTIgQEAgc3RydWN0IG10a19kZHBfY29tcCAqbXRrX2RybV9kZHBfY29t
cF9mb3JfcGxhbmUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXN0cnVjdCBtdGtfZHJtX2NydGMg
Km10a19jcnRjID0gdG9fbXRrX2NydGMoY3J0Yyk7CiAJc3RydWN0IG10a19kZHBfY29tcCAqY29t
cDsKIAlpbnQgaSwgY291bnQgPSAwOworCXVuc2lnbmVkIGludCBsb2NhbF9pbmRleCA9IHBsYW5l
IC0gbXRrX2NydGMtPnBsYW5lczsKIAogCWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2Nv
bXBfbnI7IGkrKykgewogCQljb21wID0gbXRrX2NydGMtPmRkcF9jb21wW2ldOwotCQlpZiAocGxh
bmUtPmluZGV4IDwgKGNvdW50ICsgbXRrX2RkcF9jb21wX2xheWVyX25yKGNvbXApKSkgewotCQkJ
KmxvY2FsX2xheWVyID0gcGxhbmUtPmluZGV4IC0gY291bnQ7CisJCWlmIChsb2NhbF9pbmRleCA8
IChjb3VudCArIG10a19kZHBfY29tcF9sYXllcl9ucihjb21wKSkpIHsKKwkJCSpsb2NhbF9sYXll
ciA9IGxvY2FsX2luZGV4IC0gY291bnQ7CiAJCQlyZXR1cm4gY29tcDsKIAkJfQogCQljb3VudCAr
PSBtdGtfZGRwX2NvbXBfbGF5ZXJfbnIoY29tcCk7CgpiYXNlLWNvbW1pdDogMTg3NWZmMzIwZjE0
YWZlMjE3MzFhNmU0YzdiNDZkZDMzZTQ1ZGZhYQotLSAKMi4yNC4wLjM5My5nMzRkYzM0OGVhZi1n
b29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
