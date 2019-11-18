Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEE100299
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BCF6E30E;
	Mon, 18 Nov 2019 10:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDAB6E092
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:36:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t1so18788044wrv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6snPj4zRF7PnmdnvOs9XQoZqp3Knhprhwo6jIsI7pk=;
 b=SeUcrV7GEcvKJpCG1lpq+iRmCGSYWa1ChMX1yuFYGZ58Bzc58pf40bXnmx62lEkQC6
 8b+taDHRT1iraV1moaWuXHCdSVuILV4ymW2EHyIYFb/52yigO/WL7fL3qk7YY7Hh57BF
 RE+lVpyS8gsSS9wRQD7jZmlpYNixD5U7ED3GxM3JFyomfv2msYCVF6KYcwChVBkhUzh2
 9SnB5+hQI6/+XpW92f8/rOXdAFVfmEL9Y7QRB0lbOGyulCn9fk9t5mN1IMMIr3G7AuV5
 Zy6bzQ0Rtr6VWigjsToX0jajDFL+pc6TdYdrNoKwArOvRYFTTEp8RbAa12g6knGW635n
 3g1A==
X-Gm-Message-State: APjAAAWOQQ7JrZxKCpEKS/dJAQiw9QBudBpJZ4E1vu+oRzmE8LI5fQQw
 j7ox+1b4ykBlSoY7f49OH8cZY377Uw0=
X-Google-Smtp-Source: APXvYqxwliWhIEUAO9jqkKlsD9SR6F/Gar8dxbJUUc2j0kGt2YK8h8lt3xuihOzMEA3CN5LZFOMWFw==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr15988758wrn.32.1574073359659; 
 Mon, 18 Nov 2019 02:35:59 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:58 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/15] sample/vfio-mdev/mbocs: Remove dma_buf_k(un)map support
Date: Mon, 18 Nov 2019 11:35:35 +0100
Message-Id: <20191118103536.17675-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6snPj4zRF7PnmdnvOs9XQoZqp3Knhprhwo6jIsI7pk=;
 b=EDk8Fod4KYVy3Ku3JKZWOBfrr3rK7aA/YCCASUklWuJkEwjDeojA2EuQOaogcy1Ce4
 91VzGpCS11mVTlMh97BzYznrWt0ZB0pWImcJc1CMhWmZWbJJK7kBQS/ukmqK7LhSRM+k
 FuxXis9+tN4+RJ/2LWZVcQL+JLlu725EEPJ/k=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gaW4tdHJlZSB1c2VycyBsZWZ0LgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBLaXJ0aSBXYW5raGVkZSA8a3dhbmtoZWRlQG52aWRp
YS5jb20+CkNjOiBrdm1Admdlci5rZXJuZWwub3JnCi0tCkFjayBmb3IgbWVyZ2luZyB0aGlzIHRo
cm91Z2ggZHJtIHRyZWVzIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4KLURhbmllbAotLS0KIHNhbXBs
ZXMvdmZpby1tZGV2L21ib2Nocy5jIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L21ib2No
cy5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKaW5kZXggYWM1YzhjMTdiMWZmLi4zY2M1
ZTU5MjE2ODIgMTAwNjQ0Ci0tLSBhL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCisrKyBiL3Nh
bXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCkBAIC04OTEsMjYgKzg5MSwxMCBAQCBzdGF0aWMgdm9p
ZCBtYm9jaHNfcmVsZWFzZV9kbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZikKIAltdXRleF91bmxv
Y2soJm1kZXZfc3RhdGUtPm9wc19sb2NrKTsKIH0KIAotc3RhdGljIHZvaWQgKm1ib2Noc19rbWFw
X2RtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAqYnVmLCB1bnNpZ25lZCBsb25nIHBhZ2VfbnVtKQotewot
CXN0cnVjdCBtYm9jaHNfZG1hYnVmICpkbWFidWYgPSBidWYtPnByaXY7Ci0Jc3RydWN0IHBhZ2Ug
KnBhZ2UgPSBkbWFidWYtPnBhZ2VzW3BhZ2VfbnVtXTsKLQotCXJldHVybiBrbWFwKHBhZ2UpOwot
fQotCi1zdGF0aWMgdm9pZCBtYm9jaHNfa3VubWFwX2RtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAqYnVm
LCB1bnNpZ25lZCBsb25nIHBhZ2VfbnVtLAotCQkJCSB2b2lkICp2YWRkcikKLXsKLQlrdW5tYXAo
dmFkZHIpOwotfQotCiBzdGF0aWMgc3RydWN0IGRtYV9idWZfb3BzIG1ib2Noc19kbWFidWZfb3Bz
ID0gewogCS5tYXBfZG1hX2J1ZgkgID0gbWJvY2hzX21hcF9kbWFidWYsCiAJLnVubWFwX2RtYV9i
dWYJICA9IG1ib2Noc191bm1hcF9kbWFidWYsCiAJLnJlbGVhc2UJICA9IG1ib2Noc19yZWxlYXNl
X2RtYWJ1ZiwKLQkubWFwCQkgID0gbWJvY2hzX2ttYXBfZG1hYnVmLAotCS51bm1hcAkJICA9IG1i
b2Noc19rdW5tYXBfZG1hYnVmLAogCS5tbWFwCQkgID0gbWJvY2hzX21tYXBfZG1hYnVmLAogfTsK
IAotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
