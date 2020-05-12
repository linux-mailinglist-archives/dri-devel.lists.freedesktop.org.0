Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5461CEFEB
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74D86E8A0;
	Tue, 12 May 2020 08:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26376E89D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:59:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n5so7455202wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kLx974NIZMqcTtktEjSZjvXzGFT/sN3zaOFqis6ynJ4=;
 b=XMONIu5DP+HMrApNuuxLBjrSt037rXZt2ZOk8MGJnrPXZwZxjQNgepQNY5FaUlHKzp
 NnpLCK27EuKk1i4zc5dJBZgXUUO+sBRUwyP2QJzh8l+TxbAyY+2UG2eYiOM+AqnUuE2h
 cBEWsoEqk///Vn/WtO2wLLNhQxn15H9TRBZ1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kLx974NIZMqcTtktEjSZjvXzGFT/sN3zaOFqis6ynJ4=;
 b=G65u+D6w7VErrPTitwDqpvxhMGd0cQkZXZi+pziLihv53bZd9Oq/XE68gUfF7xOmHG
 iy4zGwzvcfwTjEleYyJj6PfDssjGl26UIYbgX2lO7OAaJO5dGNcqk7qUZufRUEW8ihe/
 YQ5Q8vf/2bhJiBPh8gVIluDQ84a+vcKpaLJYEtEtUXZXp9eO3y8q3495mDtk35bOnXHd
 P8a0UFcqp3wi1AQOs5d25pBzvPcD7L+Munp2h9u+3H0+kKK/BoLean5dKMaMKapIuqAK
 WV6NZppMLgUZW5QjHeUwugN6676NSVhtkuZqZaNFdyphx3U1YQhKP0lK3V7efRIFvOuA
 QaWQ==
X-Gm-Message-State: AGi0PuYRwYJhhdEYuWlVTjjnXj2cxTAwDaeWe2A2S5m9qmNB9gNhj0wM
 yjSd/gydzc+SM3PnjuQwtEuSuIP2l0k=
X-Google-Smtp-Source: APiQypLaGju2WZXVsNW4k3kb0cNDedDZi8kpgkf+bDmSvA+Y9bm9G0CROCbMCdeWzLKRHchbjRrBkQ==
X-Received: by 2002:a05:600c:2dda:: with SMTP id
 e26mr27240272wmh.42.1589273997304; 
 Tue, 12 May 2020 01:59:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.01.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 01:59:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC 01/17] dma-fence: add might_sleep annotation to _wait()
Date: Tue, 12 May 2020 10:59:28 +0200
Message-Id: <20200512085944.222637-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnV0IG9ubHkgZm9yIG5vbi16ZXJvIHRpbWVvdXQsIHRvIGF2b2lkIGZhbHNlIHBvc2l0aXZlcy4K
Ck9uZSBxdWVzdGlvbiBoZXJlIGlzIHdoZXRoZXIgdGhlIG1pZ2h0X3NsZWVwIHNob3VsZCBiZSB1
bmNvbmRpdGlvbmFsLApvciBvbmx5IGZvciByZWFsIHRpbWVvdXRzLiBJJ20gbm90IHN1cmUsIHNv
IHdlbnQgd2l0aCB0aGUgbW9yZQpkZWZlbnNpdmUgb3B0aW9uLiBCdXQgaW4gdGhlIGludGVyZXN0
IG9mIGxvY2tpbmcgZG93biB0aGUgY3Jvc3MtZHJpdmVyCmRtYV9mZW5jZSBydWxlcyB3ZSBtaWdo
dCB3YW50IHRvIGJlIG1vcmUgYWdncmVzc2l2ZS4KCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtcmRtYUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1m
ZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jCmluZGV4IDA1MmE0MWUyNDUxYy4u
NjgwMjEyNTM0OWZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKKysr
IGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jCkBAIC0yMDgsNiArMjA4LDkgQEAgZG1hX2Zl
bmNlX3dhaXRfdGltZW91dChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgYm9vbCBpbnRyLCBzaWdu
ZWQgbG9uZyB0aW1lb3V0KQogCWlmIChXQVJOX09OKHRpbWVvdXQgPCAwKSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKKwlpZiAodGltZW91dCA+IDApCisJCW1pZ2h0X3NsZWVwKCk7CisKIAl0cmFjZV9k
bWFfZmVuY2Vfd2FpdF9zdGFydChmZW5jZSk7CiAJaWYgKGZlbmNlLT5vcHMtPndhaXQpCiAJCXJl
dCA9IGZlbmNlLT5vcHMtPndhaXQoZmVuY2UsIGludHIsIHRpbWVvdXQpOwotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
