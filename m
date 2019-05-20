Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA824393
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 00:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257588924C;
	Mon, 20 May 2019 22:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF80989177;
 Mon, 20 May 2019 22:46:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d9so3373885wrx.0;
 Mon, 20 May 2019 15:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNXJeh+38omCS2t9Ne6sAZvH3oGVHeeF7OTS+sEGgJM=;
 b=D3wCxVdil/Ot7lM9ULQdq9gWZfnQVVvZzSJuKyCpb0Sc+ZsjWRGdpRU/Ay3W71cfRh
 0SQvh32G0ERISQsCOzFAQkLOpZF3+lTfkQeh0Sw4qTPbisFufuP2Is2Geq3uooqjLUi6
 ye3rJp8L67CENZrIhlyqvGBEiCw5MdWiEriMyQBEds1pajL7sJNVLJcTo3xSpnxYeAI+
 /KnDjLJNrplxAOoXWT456HztPUTNB13jBZKcma2eWQn4N/R0eq0ppOB4PNMH3Daw1XRs
 jNjSPqngeznNF6E3K58hnBK7O5Q/ipG1ui+l3AIHOepKzwBA8625VWb6paOhb9+rw1PO
 Hc1w==
X-Gm-Message-State: APjAAAX6LnuswnbxC1dIUeG5fhsjZTCkfuT3H1kGY6dcn5PPzp6OQEJh
 Q0Vw7zzKHFsPeS44uGC6x5M=
X-Google-Smtp-Source: APXvYqww8+4UbruB7Hhy9mS5jbE/ZjZuytTLSWBmi7w5SUDKZrpiQeU090vcpI/nsmw04CQoIlrqlQ==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr297366wrn.329.1558392386716; 
 Mon, 20 May 2019 15:46:26 -0700 (PDT)
Received: from localhost.localdomain (ip-94-112-137-51.net.upcbroadband.cz.
 [94.112.137.51])
 by smtp.gmail.com with ESMTPSA id 205sm139667wmd.43.2019.05.20.15.46.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 15:46:26 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH] drm/lima: add timeout to drm scheduler init
Date: Tue, 21 May 2019 00:42:29 +0200
Message-Id: <20190520224229.21111-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNXJeh+38omCS2t9Ne6sAZvH3oGVHeeF7OTS+sEGgJM=;
 b=dmB5G392fAffqM05W5OKZ2UfEz3UrXr8MheHyCyLaic/pv7qopv3tlTg6a2t5D3e3E
 Pwqdn/DCamlyoBEdoenw/0k5oM1yWSMU3NJgYrhh00bX9Y/NwQbTykjZXAcG3TYPctOM
 Sx5/RmxyTGzfLLYcvxNSH3Zdc89gMttn8M2Enj9WfqmSMrE5eLBqnj/28GSjNnnq88ih
 m9WMJ9kq32z+yg+ERhmZBXTj2sk84CIbKx0YPh0enA9NWhFkG/qHzm7GL61jxSlFYo8f
 4+eQnSdcGnrN8ttw8MK1ztBNZhb3o0S8XbMGRwgHv4SvGXLsV+gpqFPKQM6jvwfZzXce
 dWYA==
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
Cc: Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWZ0ZXIgIjU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9u
IiwgbGltYSBzdGFydGVkCnRvIGxlYWsgbWVtb3J5IGR1ZSB0byBidWZmZXJzIG5vdCBiZWluZyBk
ZXN0cm95ZWQgYWZ0ZXIgam9iIGV4ZWN1dGlvbiBpbgp0aGUgZHJtIHNjaGVkdWxlci4KVGhpcyBz
dGFydGVkIGhhcHBlbmluZyBiZWNhdXNlIHRoZSBkcm0gc2NoZWR1bGVyIG9ubHkgZGVzdHJveWVk
IGJ1ZmZlcnMKYWZ0ZXIgY2FuY2VsbGluZyB0aGUgam9iIHRpbWVvdXQgaGFuZGxlciwgYW5kIGZv
ciBsaW1hIHRoaXMgaGFuZGxlciB3YXMKbmV2ZXIgc3RhcnRlZCBhcyBsaW1hIHNwZWNpZmllZCBh
IE1BWF9TQ0hFRFVMRV9USU1FT1VUIHRpbWVvdXQuCkxpbWEgc2VlbXMgdG8gcnVuIHdlbGwgaW4g
aXRzIGN1cnJlbnQgc3RhdGUgd2l0aCBhIHJlYWwgdGltZW91dCwgc28gdG8KbWFrZSBpdCBtb3Jl
IGFsaWduZWQgd2l0aCB0aGUgb3RoZXIgZHJpdmVycyBmcm9tIG5vdyBvbiwgbGV0J3MgdXNlIGEK
cmVhbCBkZWZhdWx0IHRpbWVvdXQuClRoaXMgYWxzbyBmaXhlcyB0aGUgb2JzZXJ2ZWQgbWVtb3J5
IGxlYWtzLgpUaGUgNTAwbXMgdmFsdWUgd2FzIGNob3NlbiBhcyBpdCBpcyB0aGUgY3VycmVudCB2
YWx1ZSBmb3IgYWxsIG90aGVyCmVtYmVkZGVkIGdwdSBkcml2ZXJzIHVzaW5nIGRybSBzY2hlZC4K
ClNpZ25lZC1vZmYtYnk6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYyAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfc2NoZWQuYyB8IDExICsrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbGltYS9saW1hX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYwppbmRl
eCBmOWEyODFhNjIwODMuLmIyOWMyNmNkMTNiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2xpbWEvbGltYV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2Rydi5jCkBA
IC0xNyw3ICsxNyw3IEBACiAKIGludCBsaW1hX3NjaGVkX3RpbWVvdXRfbXM7CiAKLU1PRFVMRV9Q
QVJNX0RFU0Moc2NoZWRfdGltZW91dF9tcywgInRhc2sgcnVuIHRpbWVvdXQgaW4gbXMgKDAgPSBu
byB0aW1lb3V0IChkZWZhdWx0KSkiKTsKK01PRFVMRV9QQVJNX0RFU0Moc2NoZWRfdGltZW91dF9t
cywgInRhc2sgcnVuIHRpbWVvdXQgaW4gbXMiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChzY2hlZF90
aW1lb3V0X21zLCBsaW1hX3NjaGVkX3RpbWVvdXRfbXMsIGludCwgMDQ0NCk7CiAKIHN0YXRpYyBp
bnQgbGltYV9pb2N0bF9nZXRfcGFyYW0oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xp
bWEvbGltYV9zY2hlZC5jIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jCmluZGV4
IDU4YTE1NDc5ZDE3NS4uNDEyN2NhY2FjNDU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bGltYS9saW1hX3NjaGVkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5j
CkBAIC0zMjksMTkgKzMyOSwxNiBAQCBzdGF0aWMgdm9pZCBsaW1hX3NjaGVkX2Vycm9yX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCiBpbnQgbGltYV9zY2hlZF9waXBlX2luaXQoc3Ry
dWN0IGxpbWFfc2NoZWRfcGlwZSAqcGlwZSwgY29uc3QgY2hhciAqbmFtZSkKIHsKLQlsb25nIHRp
bWVvdXQ7Ci0KLQlpZiAobGltYV9zY2hlZF90aW1lb3V0X21zIDw9IDApCi0JCXRpbWVvdXQgPSBN
QVhfU0NIRURVTEVfVElNRU9VVDsKLQllbHNlCi0JCXRpbWVvdXQgPSBtc2Vjc190b19qaWZmaWVz
KGxpbWFfc2NoZWRfdGltZW91dF9tcyk7CisJdW5zaWduZWQgaW50IHRpbWVvdXQgPSBsaW1hX3Nj
aGVkX3RpbWVvdXRfbXMgPiAwID8KKwkJCSAgICAgICBsaW1hX3NjaGVkX3RpbWVvdXRfbXMgOiA1
MDA7CiAKIAlwaXBlLT5mZW5jZV9jb250ZXh0ID0gZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2MoMSk7
CiAJc3Bpbl9sb2NrX2luaXQoJnBpcGUtPmZlbmNlX2xvY2spOwogCiAJSU5JVF9XT1JLKCZwaXBl
LT5lcnJvcl93b3JrLCBsaW1hX3NjaGVkX2Vycm9yX3dvcmspOwogCi0JcmV0dXJuIGRybV9zY2hl
ZF9pbml0KCZwaXBlLT5iYXNlLCAmbGltYV9zY2hlZF9vcHMsIDEsIDAsIHRpbWVvdXQsIG5hbWUp
OworCXJldHVybiBkcm1fc2NoZWRfaW5pdCgmcGlwZS0+YmFzZSwgJmxpbWFfc2NoZWRfb3BzLCAx
LCAwLAorCQkJICAgICAgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KSwgbmFtZSk7CiB9CiAKIHZv
aWQgbGltYV9zY2hlZF9waXBlX2Zpbmkoc3RydWN0IGxpbWFfc2NoZWRfcGlwZSAqcGlwZSkKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
