Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334D14B2EA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 11:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5CF6EDA6;
	Tue, 28 Jan 2020 10:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0026EDA4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 10:46:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so750623wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 02:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=baki1vCJvM2v3crbwdgabrMZmLroFbPipGWf/F9DPkM=;
 b=BAiWCTEObaKIuh8+JWUrK2bwBptK1jX1Hmq/PW8QpijKcpspYFPUcIqSxqK4Jti6Ht
 cjec6tEU+lVj5RaQnIjMbG/VrKcqBnHtj9C7tzkPb6EFIrUPnlSqRkNS1cvOvD1mtoO8
 nBu6AtkYF5olIksg+IFSYtKIh90uxF+0b7AnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=baki1vCJvM2v3crbwdgabrMZmLroFbPipGWf/F9DPkM=;
 b=hk17KNQBHxQHaH4Y8N2azcC0WxM0MswpgciWMzt9TWdMwXMcfuB+h0W1wkp03kR55f
 85+oYowMs0X2VHHr2TaHoJL1d3f65YmmWUj/iarPzibrAtOEhmJDWipnpxadOTIe9N7J
 56T1WDxhSviIbkpFwN9GHYuDNdCPMJl1Lvbwz//uYwTDaZ5COjgBgYPBiwOl+Fh29oP/
 8YZ14L8zbkXTN/MOyLl2iK6qJMccIBnItj8pcw6n1OAolWNvGpIcTui3rFK0FIy//N2b
 hgbYk7r/hTo9LDamr79Umlb0ruHEC23VrMJ0/hhznVHopX1wDsxCu+SgSnCqTjago0YW
 JeXg==
X-Gm-Message-State: APjAAAUSicQFQlZe9ynBxVLByurcpwa8ikR/3uzAxUm7JSPj/khNMSYM
 mRsb+BjWSHuCop1/Tfy6Q9VOoZFRk0bpYA==
X-Google-Smtp-Source: APXvYqwVDH5D6FAHnolZbExqwIdEDjZiV8ek5G727CsRCIQQiJdWe7XEjZK76ClzxtaqRGxXrT6unw==
X-Received: by 2002:adf:9144:: with SMTP id j62mr28136380wrj.168.1580208368491; 
 Tue, 28 Jan 2020 02:46:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o1sm24998733wrn.84.2020.01.28.02.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 02:46:07 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/fbdev-helper: don't force restores
Date: Tue, 28 Jan 2020 11:45:59 +0100
Message-Id: <20200128104602.1459802-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBjaGVjayBmb3IgbWFzdGVyIHN0YXR1cywgaW4gY2FzZSB3ZSd2ZSByYWNlZC4KClRo
aXMgaXMgdGhlIGxhc3QgZXhjZXB0aW9uIHRvIHRoZSBnZW5lcmFsIHJ1bGUgdGhhdCB3ZSByZXN0
b3JlIGZiY29uCm9ubHkgd2hlbiB0aGVyZSdzIG5vIG1hc3RlciBhY3RpdmUuIENvbXBvc2l0b3Jz
IGFyZSBzdXBwb3NlZCB0byBkcm9wCnRoZWlyIG1hc3RlciBzdGF0dXMgYmVmb3JlIHRoZXkgc3dp
dGNoIHRvIGEgZGlmZmVyZW50IGNvbnNvbGUgYmFjayB0bwp0ZXh0IG1vZGUgKG9yIGp1c3Qgc3dp
dGNoIHRvIHRleHQgbW9kZSBkaXJlY3RseSwgd2l0aG91dCBhIHZ0IHN3aXRjaCkuCgpUaGlzIGlz
IGtub3duIHRvIGJyZWFrIHNvbWUgc3VidGVzdHMgb2Yga21zX2ZiY29uX2ZidCBpbiBpZ3QsIGJ1
dCB0aGV5J3JlCmp1c3Qgd3JvbmcgLSBpdCBkb2VzIGEgZ3JhcGhpY3MvdGV4dCBtb2RlIHN3aXRj
aCBmb3IgdGhlIHZ0IHdpdGhvdXQKdXBkYXRpbmcgdGhlIG1hc3RlciBzdGF0dXMuCgpBbHNvIGFk
ZCBhIGNvbW1lbnQgdG8gdGhlIGRybV9jbGllbnQtPnJlc3RvcmUgaG9vayB0aGF0IHRoaXMgaXMg
ZXhwZWN0ZWQKZ29pbmcgZm9yd2FyZCBmcm9tIGFsbCBjbGllbnRzICh0aGVyZSdzIGN1cnJlbnRs
eSBqdXN0IG9uZSkuCgp2MjogQWxzbyBkcm9wIHRoZSBmb3JjZSBpbiBwYW5fZGlzcGxheQoKQ2M6
IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jIHwgMTQgKystLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9jbGll
bnQuaCAgICAgICAgfCAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCmluZGV4IDRjN2NiY2U3YmFl
Ny4uOTI2MTg3YTgyMjU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKQEAgLTI1MCwxNyArMjUw
LDcgQEAgaW50IGRybV9mYl9oZWxwZXJfcmVzdG9yZV9mYmRldl9tb2RlX3VubG9ja2VkKHN0cnVj
dCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCiAJCXJldHVybiAwOwogCiAJbXV0ZXhfbG9jaygm
ZmJfaGVscGVyLT5sb2NrKTsKLQkvKgotCSAqIFRPRE86Ci0JICogV2Ugc2hvdWxkIGJhaWwgb3V0
IGhlcmUgaWYgdGhlcmUgaXMgYSBtYXN0ZXIgYnkgZHJvcHBpbmcgX2ZvcmNlLgotCSAqIEN1cnJl
bnRseSB0aGVzZSBpZ3QgdGVzdHMgZmFpbCBpZiB3ZSBkbyB0aGF0OgotCSAqIC0ga21zX2ZiY29u
X2ZidEBwc3IKLQkgKiAtIGttc19mYmNvbl9mYnRAcHNyLXN1c3BlbmQKLQkgKgotCSAqIFNvIGZp
cnN0IHRoZXNlIHRlc3RzIG5lZWQgdG8gYmUgZml4ZWQgc28gdGhleSBkcm9wIG1hc3RlciBvciBk
b24ndAotCSAqIGhhdmUgYW4gZmQgb3Blbi4KLQkgKi8KLQlyZXQgPSBkcm1fY2xpZW50X21vZGVz
ZXRfY29tbWl0X2ZvcmNlKCZmYl9oZWxwZXItPmNsaWVudCk7CisJcmV0ID0gZHJtX2NsaWVudF9t
b2Rlc2V0X2NvbW1pdCgmZmJfaGVscGVyLT5jbGllbnQpOwogCiAJZG9fZGVsYXllZCA9IGZiX2hl
bHBlci0+ZGVsYXllZF9ob3RwbHVnOwogCWlmIChkb19kZWxheWVkKQpAQCAtMTM1Nyw3ICsxMzQ3
LDcgQEAgc3RhdGljIGludCBwYW5fZGlzcGxheV9hdG9taWMoc3RydWN0IGZiX3Zhcl9zY3JlZW5p
bmZvICp2YXIsCiAKIAlwYW5fc2V0KGZiX2hlbHBlciwgdmFyLT54b2Zmc2V0LCB2YXItPnlvZmZz
ZXQpOwogCi0JcmV0ID0gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9mb3JjZSgmZmJfaGVscGVy
LT5jbGllbnQpOworCXJldCA9IGRybV9jbGllbnRfbW9kZXNldF9jb21taXQoJmZiX2hlbHBlci0+
Y2xpZW50KTsKIAlpZiAoIXJldCkgewogCQlpbmZvLT52YXIueG9mZnNldCA9IHZhci0+eG9mZnNl
dDsKIAkJaW5mby0+dmFyLnlvZmZzZXQgPSB2YXItPnlvZmZzZXQ7CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fY2xpZW50LmggYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKaW5kZXggNWNm
MmM1ZGQ4YjFlLi5kMDFkMzExMDIzYWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jbGll
bnQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKQEAgLTQ0LDYgKzQ0LDExIEBAIHN0
cnVjdCBkcm1fY2xpZW50X2Z1bmNzIHsKIAkgKiByZXR1cm5zIHplcm8gZ2V0cyB0aGUgcHJpdmls
ZWdlIHRvIHJlc3RvcmUgYW5kIG5vIG1vcmUgY2xpZW50cyBhcmUKIAkgKiBjYWxsZWQuIFRoaXMg
Y2FsbGJhY2sgaXMgbm90IGNhbGxlZCBhZnRlciBAdW5yZWdpc3RlciBoYXMgYmVlbiBjYWxsZWQu
CiAJICoKKwkgKiBOb3RlIHRoYXQgdGhlIGNvcmUgZG9lcyBub3QgZ3VhcmFudGVlIGV4Y2x1c2lv
biBhZ2FpbnN0IGNvbmN1cnJlbnQKKwkgKiBkcm1fb3BlbigpLiBDbGllbnRzIG5lZWQgdG8gZW5z
dXJlIHRoaXMgdGhlbXNlbHZlcywgZm9yIGV4YW1wbGUgYnkKKwkgKiB1c2luZyBkcm1fbWFzdGVy
X2ludGVybmFsX2FjcXVpcmUoKSBhbmQKKwkgKiBkcm1fbWFzdGVyX2ludGVybmFsX3JlbGVhc2Uo
KS4KKwkgKgogCSAqIFRoaXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCiAJICovCiAJaW50ICgqcmVz
dG9yZSkoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQpOwotLSAKMi4yNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
