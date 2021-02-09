Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F9315715
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 20:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A336E103;
	Tue,  9 Feb 2021 19:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4AE6E103
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 19:48:27 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id m6so12586960pfk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 11:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
 b=AsJEwfacT50dzlHJesYHyvPMmGevTS+ag8BhYTlHlCJ+z3e0U27w5lWhFvWXNw7K8p
 zjYspoGmCqgQYQJwbFzTIIhNSHhbb5GUcYIAxQIAz1PYnBg+ZXtkZlhyChFBnWXgJxXH
 688qnGvDFa3ydexIBy6mU/hvuFDcrqljXxSyISZMOdRAlYG+dSio7eFkfQVYl34a2I+a
 yXJsmt1Esb3/IQ5Fl7WoidYkFMmEZNI7ozgOogtAlXgZ4bTjmV51W7t0QlKszQ2Sm3CS
 s3aT36pWaoZpeWiP7FYlxNQ/p8szINRxpSNZ045YUXExUAc6iM6vk99/GBEjfjkV1t1P
 9Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
 b=lIZZSAfFH+MRTC4MlHEgiUNPh9nrE7t4Plf4oPFM0Pyot+HuwFgnNQVSMWzNRBNG42
 CNozljzvgp32WrVVhJzJl8jaGv4mAg5slqCHf5oO4LP68mwZaWZpLZ4l3cgh2rp/Z3uJ
 cTE+RmPfCtRjdA+yuvSPi/SBa8J+U8B5lhyToUT0p3NdEXn5u2HSvbI5MiRZX63fnAoT
 AUjgOg+PshmA+/7NdhOp9XGYLoqKt9egv/aqWE5+dO8ceg8eMcCoMdaplKNB0O+V/v8z
 Oche8+eYTZ3EhXBD0TX5SrLChjLDMyfg8roemYFVQv7a7GNyxJTTyQvDC0YRjvql4sE+
 xciw==
X-Gm-Message-State: AOAM530QRg7MrrowGPNMAAZs59skW/Zlyp82+ByAaD94khaBLb8GV0WE
 ipZD/46Xig/H6Cie9zLjpzWriA==
X-Google-Smtp-Source: ABdhPJzbnY58mnNBjT7Di/zQColXsY24/57OAsMRe1ZHW4yoCGkME/b6oR4C3hpIJMQURcXm2cyODA==
X-Received: by 2002:a62:5ec5:0:b029:1ae:6847:fa02 with SMTP id
 s188-20020a625ec50000b02901ae6847fa02mr24453587pfb.61.1612900106860; 
 Tue, 09 Feb 2021 11:48:26 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j17sm22365836pfh.183.2021.02.09.11.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 11:48:26 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
Date: Tue,  9 Feb 2021 19:48:18 +0000
Message-Id: <20210209194818.2459062-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210209194818.2459062-1-john.stultz@linaro.org>
References: <20210209194818.2459062-1-john.stultz@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnkgZGVmYXVsdCBkbWFfYnVmX2V4cG9ydCgpIHNldHMgdGhlIGV4cG9ydGVyIG5hbWUgdG8gYmUK
S0JVSUxEX01PRE5BTUUuIFVuZm9ydHVuYXRlbHkgdGhpcyBtYXkgbm90IGJlIGlkZW50aWNhbCB0
byB0aGUKc3RyaW5nIHVzZWQgYXMgdGhlIGhlYXAgbmFtZSAoaWU6ICJzeXN0ZW0iIHZzICJzeXN0
ZW1faGVhcCIpLgoKVGhpcyBjYW4gY2F1c2Ugc29tZSBtaW5vciBjb25mdXNpb24gd2l0aCB0b29s
aW5nLCBhbmQgdGhlcmUgaXMKdGhlIGZ1dHVyZSBwb3RlbnRpYWwgd2hlcmUgbXVsdGlwbGUgaGVh
cCB0eXBlcyBtYXkgYmUgZXhwb3J0ZWQKYnkgdGhlIHNhbWUgbW9kdWxlIChidXQgd291bGQgYWxs
IGhhdmUgdGhlIHNhbWUgbmFtZSkuCgpTbyB0byBhdm9pZCBhbGwgdGhpcywgc2V0IHRoZSBleHBv
cnRlciBleHBfbmFtZSB0byB0aGUgaGVhcCBuYW1lLgoKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNj
OiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgpDYzogQ2hyaXMgR29sZHN3b3J0aHkg
PGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgpDYzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5l
bC5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBIcmlk
eWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8
c3VyZW5iQGdvb2dsZS5jb20+CkNjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+
CkNjOiBEYW5pZWwgTWVudHogPGRhbmllbG1lbnR6QGdvb2dsZS5jb20+CkNjOiDDmHJqYW4gRWlk
ZSA8b3JqYW4uZWlkZUBhcm0uY29tPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4KQ2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KQ2M6IFNp
bW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KQ2M6IEphbWVzIEpvbmVzIDxqYWpvbmVzQG52
aWRpYS5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1
bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAg
fCAxICsKIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKaW5kZXgg
MzY0ZmMyZjNlNDk5Li42MjQ2NWQ2MWNjYzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jCkBA
IC0zMzksNiArMzM5LDcgQEAgc3RhdGljIGludCBjbWFfaGVhcF9hbGxvY2F0ZShzdHJ1Y3QgZG1h
X2hlYXAgKmhlYXAsCiAJYnVmZmVyLT5wYWdlY291bnQgPSBwYWdlY291bnQ7CiAKIAkvKiBjcmVh
dGUgdGhlIGRtYWJ1ZiAqLworCWV4cF9pbmZvLmV4cF9uYW1lID0gZG1hX2hlYXBfZ2V0X25hbWUo
aGVhcCk7CiAJZXhwX2luZm8ub3BzID0gJmNtYV9oZWFwX2J1Zl9vcHM7CiAJZXhwX2luZm8uc2l6
ZSA9IGJ1ZmZlci0+bGVuOwogCWV4cF9pbmZvLmZsYWdzID0gZmRfZmxhZ3M7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9zeXN0ZW1faGVhcC5jCmluZGV4IDE3ZTBlOWE2OGJhZi4uMmQ0YWZjNzljNzAwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYworKysgYi9kcml2ZXJz
L2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwpAQCAtMzg4LDYgKzM4OCw3IEBAIHN0YXRpYyBp
bnQgc3lzdGVtX2hlYXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLAogCX0KIAogCS8q
IGNyZWF0ZSB0aGUgZG1hYnVmICovCisJZXhwX2luZm8uZXhwX25hbWUgPSBkbWFfaGVhcF9nZXRf
bmFtZShoZWFwKTsKIAlleHBfaW5mby5vcHMgPSAmc3lzdGVtX2hlYXBfYnVmX29wczsKIAlleHBf
aW5mby5zaXplID0gYnVmZmVyLT5sZW47CiAJZXhwX2luZm8uZmxhZ3MgPSBmZF9mbGFnczsKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
