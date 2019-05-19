Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF740228A4
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 21:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7113F8919C;
	Sun, 19 May 2019 19:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6E18919C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 19:55:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h11so9172882ljb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 12:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tSDY8qCfN3tlT6t+R2GiMImeFNXG9SWQiFQPA4hdzSc=;
 b=Hx2aey9y/18u6W8K96oQ+YpX/0hgp2blSxLh8za8XMFnQ8Rgu2ydn/fnSZ6CQb79Lh
 lnCXkCkV7E+Xk+mTxz0X+l4v1akTjGG0dTV+py+lSmL36yvQx8XujZmMSpRaDllH//yS
 1p2JASjFquWD5QBhU1k8t6fzt8XzJVK74xOTmpUC9ZGCEuFrhODMIn1fVkPKiANKctsc
 yopkabZC5zz2AQhoKE8bx/aaiCAJpzsiDr7HGY3uaDhpqq5y1TWdg4rMoQtBzHF4bXfw
 4/pw57eyO18WQJSCXQoKpP3Pt5T8D1xMRlluU6qZDXErLW6ptUM2kbXi6N4LpQhwQXcC
 L3+Q==
X-Gm-Message-State: APjAAAW/+k9FLDTaz3dtAg87w4ozog/iBsTA5i+uNi7jNs6hxpBjsurU
 +017zHkXEOI0EzrwmCY8fXlokXze
X-Google-Smtp-Source: APXvYqwX81fa2N0V9ka/AWfSPrYXsSdr7STHi9hu6PdNBrYHbH1WkzOibulk0U6uzXpBSZmb5wRHZQ==
X-Received: by 2002:a2e:2b58:: with SMTP id q85mr35368247lje.179.1558295740483; 
 Sun, 19 May 2019 12:55:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 f16sm1631013lfk.75.2019.05.19.12.55.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 12:55:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/gma500: drop use of DRM_UDELAY wrapper
Date: Sun, 19 May 2019 21:55:25 +0200
Message-Id: <20190519195526.3422-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519195526.3422-1-sam@ravnborg.org>
References: <20190519195526.3422-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSDY8qCfN3tlT6t+R2GiMImeFNXG9SWQiFQPA4hdzSc=;
 b=V3920hOvmcsM795SMzfQqvAHElam4pzngJ0uyfPDGJYIy+CWUZIsJS2fegNZj+rwo9
 oREAuCRl34SpaI2oLoWbUTMXjF9451DeMSM6N0ACAAEzsSLMMbIGCLWJ8yUmiAnxd/h0
 y2S6YyLHn96YYlNy5TEmUI5GZZGge+uxYn9iGWkkCv+ueKWAvx6Z/QdraX/6VLQ95lSM
 822fKIUHh462AMUgE6QoWiQ7bS3YPJqQtv+shBGu70PYevInQJ7KauYcsP0Zkr2a1ZsF
 pSZtpK5CNow++d/3hJUzHh5YE8bjBM2fIVsY86DHk8Aq2jDqRJTT7hT2UgOFIKZSzssq
 utFg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTV9VREVMQVkgd3JhcHBlciBmcm9tIGRybV9vc19saW51eC5oIGlzIHVzZWQgaW4gYSBm
ZXcgcGxhY2VzLAphbGwgb3RoZXIgcGxhY2VzIGNhbGxzIHVkZWxheSgpIHdpdGggbm8gd3JhcHBl
ci4KClRoZXJlIGlzIG5vIHJlYXNvbiB0byBjb250aW51ZSB0byB1c2UgdGhpcyB3cmFwcGVyIC0g
c28gZHJvcCBpdAphbmQgZGlyZWN0IGNhbGwgdWRlbGF5KCkuCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsu
ci5qYWtvYnNzb25AZ21haWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvbWRmbGRfZGV2aWNlLmMgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvb2FrdHJhaWxfZGV2aWNlLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3Ry
YWlsX2hkbWkuYyAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9k
ZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZGV2aWNlLmMKaW5kZXggNTg1
ZWMyZTQ2MTY2Li5lZGI5YjFiYmQ2YzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvbWRmbGRfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kZXZp
Y2UuYwpAQCAtMzQ0LDcgKzM0NCw3IEBAIHN0YXRpYyBpbnQgbWRmbGRfcmVzdG9yZV9kaXNwbGF5
X3JlZ2lzdGVycyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgcGlwZW51bSkKIAogCWlmIChw
aXBlbnVtID09IDEpIHsKIAkJLyogcmVzdG9yZSBwYWxldHRlIChnYW1tYSkgKi8KLQkJLypEUk1f
VURFTEFZKDUwMDAwKTsgKi8KKwkJLyogdWRlbGF5KDUwMDAwKTsgKi8KIAkJZm9yIChpID0gMDsg
aSA8IDI1NjsgaSsrKQogCQkJUFNCX1dWREMzMihwaXBlLT5wYWxldHRlW2ldLCBtYXAtPnBhbGV0
dGUgKyAoaSA8PCAyKSk7CiAKQEAgLTQwNiw3ICs0MDYsNyBAQCBzdGF0aWMgaW50IG1kZmxkX3Jl
c3RvcmVfZGlzcGxheV9yZWdpc3RlcnMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IHBpcGVu
dW0pCiAJUFNCX1dWREMzMihwaXBlLT5jb25mLCBtYXAtPmNvbmYpOwogCiAJLyogcmVzdG9yZSBw
YWxldHRlIChnYW1tYSkgKi8KLQkvKkRSTV9VREVMQVkoNTAwMDApOyAqLworCS8qIHVkZWxheSg1
MDAwMCk7ICovCiAJZm9yIChpID0gMDsgaSA8IDI1NjsgaSsrKQogCQlQU0JfV1ZEQzMyKHBpcGUt
PnBhbGV0dGVbaV0sIG1hcC0+cGFsZXR0ZSArIChpIDw8IDIpKTsKIApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvb2FrdHJhaWxfZGV2aWNlLmMKaW5kZXggZjA4NzJlMmMyMmQ1Li4yZDhhZmJiNTFhNzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfZGV2aWNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9kZXZpY2UuYwpAQCAtMzI3LDcgKzMy
Nyw3IEBAIHN0YXRpYyBpbnQgb2FrdHJhaWxfcmVzdG9yZV9kaXNwbGF5X3JlZ2lzdGVycyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJLyogQWN0dWFsbHkgZW5hYmxlIGl0ICovCiAJUFNCX1dW
REMzMihwLT5kcGxsLCBNUlNUX0RQTExfQSk7Ci0JRFJNX1VERUxBWSgxNTApOworCXVkZWxheSgx
NTApOwogCiAJLyogUmVzdG9yZSBtb2RlICovCiAJUFNCX1dWREMzMihwLT5odG90YWwsIEhUT1RB
TF9BKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5j
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmMKaW5kZXggYzZkNzJkZTFj
MDU0Li43OTczMjkwMjg0MzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2Fr
dHJhaWxfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5j
CkBAIC04MTUsNyArODE1LDcgQEAgdm9pZCBvYWt0cmFpbF9oZG1pX3Jlc3RvcmUoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikKIAlQU0JfV1ZEQzMyKGhkbWlfZGV2LT5zYXZlRFBMTF9BREpVU1QsIERQ
TExfQURKVVNUKTsKIAlQU0JfV1ZEQzMyKGhkbWlfZGV2LT5zYXZlRFBMTF9VUERBVEUsIERQTExf
VVBEQVRFKTsKIAlQU0JfV1ZEQzMyKGhkbWlfZGV2LT5zYXZlRFBMTF9DTEtfRU5BQkxFLCBEUExM
X0NMS19FTkFCTEUpOwotCURSTV9VREVMQVkoMTUwKTsKKwl1ZGVsYXkoMTUwKTsKIAogCS8qIHBp
cGUgKi8KIAlQU0JfV1ZEQzMyKHBpcGViLT5zcmMsIFBJUEVCU1JDKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
