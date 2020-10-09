Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB628845D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5E06EC7C;
	Fri,  9 Oct 2020 08:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8636EC7A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:00:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g12so9221530wrp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VnPfmIw9ZEJAdxqVy4AIvj5gzcDwS/bnZ7Vl10D80aI=;
 b=AmZWcTmTMY3aRt6Gxo6D+cFSlAKtbo7rzcAhKQblXce5J0bM+0jidwIuX1SJM78PW3
 a4CzgO4OyPIunTZ40M8qjiQpRIe+CXuCN2QeQz0Nq3eitwpnmxf1tCSrmdU7BFARQUrJ
 TsYEd08BMm8jvttMOB5N0WbB01Om3gekKiY/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VnPfmIw9ZEJAdxqVy4AIvj5gzcDwS/bnZ7Vl10D80aI=;
 b=f9ezqigvpn+qXUzrLn527ABAOBApu7FxyO/U82M6CpIwXKrb+EdGGZMJkOeXrdyg+b
 Ejq1Q7rID7W1shvopzHInSQ7zJnH9OMa5dv+TIB7JeEHSbRX8l2+sx9VjfDP3zQPHEam
 51bQ1Loqezin3boRkHcrLykkWcmb4ch/x/lApTC1qNUaa+5xNXw4NM5CQnfrOqJyNMMK
 +cDfResyQXhVYnYS1mf7GjlIIagc/sF0SRm37RwIk5w/KN5vThlnyLI83QJKMCbtb5sI
 8/gvyNGA/IzD7Xz99TdBRdC51L4tD+GMS2PMyD5vIcgRPo6qY7NTuB1OPqUV8mz1q7LD
 J17w==
X-Gm-Message-State: AOAM533j0joSoZI1rrYU18PJQ1AvK9OcESO8W7t3qAoMT8AwFFQSwj9b
 4pPjlUVw+/fusdLMqTHHkbpx/+q5qx42hD1e
X-Google-Smtp-Source: ABdhPJyIgZ0DKgvAk38zXma7Xw6CtJtdY0QGkVhgcnr9L1zZ08hj8no1NH+SgdXtl2+3a6urGujNzQ==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr13160452wrr.273.1602230416967; 
 Fri, 09 Oct 2020 01:00:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 01:00:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 17/17] drm/i915: Properly request PCI BARs
Date: Fri,  9 Oct 2020 09:59:34 +0200
Message-Id: <20201009075934.3509076-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-pci@vger.kernel.org,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB0cnlpbmcgdG8gdGVzdCBteSBDT05GSUdfSU9fU1RSSUNUX0RFVk1FTSBjaGFuZ2VzIEkg
cmVhbGl6ZWQgdGhleQpkbyBub3RoaW5nIGZvciBpOTE1LiBCZWNhdXNlIGk5MTUgZG9lc24ndCBy
ZXF1ZXN0IGFueSByZWdpb25zLCBsaWtlCnByZXR0eSBtdWNoIGFsbCBkcm0gcGNpIGRyaXZlcnMu
IEkgZ3Vlc3MgdGhpcyBpcyBzb21lIHZlcnkgb2xkCnJlbW5hbnRzIGZyb20gdGhlIHVzZXJzcGFj
ZSBtb2Rlc2V0dGluZyBkYXlzLCB3aGVuIHdlIHdhbnRlZCB0bwpjby1leGlzdCB3aXRoIHRoZSBm
YmRldiBkcml2ZXIuIFdoaWNoIHVzdWFsbHkgcmVxdWVzdGVkIHRoZXNlCnJlc291cmNlcy4KCkJ1
dCBtYWtlcyBtZSB3b25kZXIgd2h5IHRoZSBwY2kgc3Vic3lzdGVtIGRvZXNuJ3QganVzdCByZXF1
ZXN0CnJlc291cmNlIGF1dG9tYXRpY2FsbHkgd2hlbiB3ZSBtYXAgYSBiYXIgYW5kIGEgcGNpIGRy
aXZlciBpcyBib3VuZD8KCktub3dsZWRnZSBhYm91dCB3aGljaCBwY2kgYmFycyB3ZSBuZWVkIGts
dWRnZWQgdG9nZXRoZXIgZnJvbQppbnRlbF91bmNvcmUuYyBhbmQgaW50ZWxfZ3R0LmMgZnJvbSBp
OTE1IGFuZCBpbnRlbC1ndHQuYyBvdmVyIGluIHRoZQpmYWtlIGFncCBkcml2ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEphc29u
IEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFu
ZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQg
PGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0
LmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5q
LndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogQmpvcm4gSGVsZ2Fh
cyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF91bmNvcmUuYyB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfdW5jb3JlLmMKaW5kZXggNTRlMjAxZmRlYmE0Li5j
ZTM5MDQ5ZDg5MTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29y
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jCkBAIC0xNjkyLDEw
ICsxNjkyLDEzIEBAIHN0YXRpYyBpbnQgdW5jb3JlX21taW9fc2V0dXAoc3RydWN0IGludGVsX3Vu
Y29yZSAqdW5jb3JlKQogCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gaTkxNS0+ZHJtLnBkZXY7CiAJ
aW50IG1taW9fYmFyOwogCWludCBtbWlvX3NpemU7CisJaW50IGJhcl9zZWxlY3Rpb247CisJaW50
IHJldDsKIAogCW1taW9fYmFyID0gSVNfR0VOKGk5MTUsIDIpID8gMSA6IDA7CisJYmFyX3NlbGVj
dGlvbiA9IEJJVCAoMikgfCBCSVQobW1pb19iYXIpOwogCS8qCi0JICogQmVmb3JlIGdlbjQsIHRo
ZSByZWdpc3RlcnMgYW5kIHRoZSBHVFQgYXJlIGJlaGluZCBkaWZmZXJlbnQgQkFScy4KKwkgKiBP
biBnZW4zIHRoZSByZWdpc3RlcnMgYW5kIHRoZSBHVFQgYXJlIGJlaGluZCBkaWZmZXJlbnQgQkFS
cy4KIAkgKiBIb3dldmVyLCBmcm9tIGdlbjQgb253YXJkcywgdGhlIHJlZ2lzdGVycyBhbmQgdGhl
IEdUVCBhcmUgc2hhcmVkCiAJICogaW4gdGhlIHNhbWUgQkFSLCBzbyB3ZSB3YW50IHRvIHJlc3Ry
aWN0IHRoaXMgaW9yZW1hcCBmcm9tCiAJICogY2xvYmJlcmluZyB0aGUgR1RUIHdoaWNoIHdlIHdh
bnQgaW9yZW1hcF93YyBpbnN0ZWFkLiBGb3J0dW5hdGVseSwKQEAgLTE3MDMsNiArMTcwNiw4IEBA
IHN0YXRpYyBpbnQgdW5jb3JlX21taW9fc2V0dXAoc3RydWN0IGludGVsX3VuY29yZSAqdW5jb3Jl
KQogCSAqIGdlbmVyYXRpb25zIHVwIHRvIElyb25sYWtlLgogCSAqIEZvciBkZ2Z4IGNoaXBzIHJl
Z2lzdGVyIHJhbmdlIGlzIGV4cGFuZGVkIHRvIDRNQi4KIAkgKi8KKwlpZiAoSU5URUxfR0VOKGk5
MTUpID09IDMpCisJCWJhcl9zZWxlY3Rpb24gfD0gQklUKDMpOwogCWlmIChJTlRFTF9HRU4oaTkx
NSkgPCA1KQogCQltbWlvX3NpemUgPSA1MTIgKiAxMDI0OwogCWVsc2UgaWYgKElTX0RHRlgoaTkx
NSkpCkBAIC0xNzEwLDggKzE3MTUsMTUgQEAgc3RhdGljIGludCB1bmNvcmVfbW1pb19zZXR1cChz
dHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUpCiAJZWxzZQogCQltbWlvX3NpemUgPSAyICogMTAy
NCAqIDEwMjQ7CiAKKwlyZXQgPSBwY2lfcmVxdWVzdF9zZWxlY3RlZF9yZWdpb25zKHBkZXYsIGJh
cl9zZWxlY3Rpb24sICJpOTE1Iik7CisJaWYgKHJldCA8IDApIHsKKwkJZHJtX2VycigmaTkxNS0+
ZHJtLCAiZmFpbGVkIHRvIHJlcXVlc3QgcGNpIGJhcnNcbiIpOworCQlyZXR1cm4gcmV0OworCX0K
KwogCXVuY29yZS0+cmVncyA9IHBjaV9pb21hcChwZGV2LCBtbWlvX2JhciwgbW1pb19zaXplKTsK
IAlpZiAodW5jb3JlLT5yZWdzID09IE5VTEwpIHsKKwkJcGNpX3JlbGVhc2Vfc2VsZWN0ZWRfcmVn
aW9ucyhwZGV2LCBiYXJfc2VsZWN0aW9uKTsKIAkJZHJtX2VycigmaTkxNS0+ZHJtLCAiZmFpbGVk
IHRvIG1hcCByZWdpc3RlcnNcbiIpOwogCQlyZXR1cm4gLUVJTzsKIAl9CkBAIC0xNzIxLDkgKzE3
MzMsMTggQEAgc3RhdGljIGludCB1bmNvcmVfbW1pb19zZXR1cChzdHJ1Y3QgaW50ZWxfdW5jb3Jl
ICp1bmNvcmUpCiAKIHN0YXRpYyB2b2lkIHVuY29yZV9tbWlvX2NsZWFudXAoc3RydWN0IGludGVs
X3VuY29yZSAqdW5jb3JlKQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdW5jb3JlLT5pOTE1
LT5kcm0ucGRldjsKKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHVuY29yZS0+aTkx
NTsKKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGk5MTUtPmRybS5wZGV2OworCWludCBtbWlvX2Jh
cjsKKwlpbnQgYmFyX3NlbGVjdGlvbjsKKworCW1taW9fYmFyID0gSVNfR0VOKGk5MTUsIDIpID8g
MSA6IDA7CisJYmFyX3NlbGVjdGlvbiA9IEJJVCAoMikgfCBCSVQobW1pb19iYXIpOworCWlmIChJ
TlRFTF9HRU4oaTkxNSkgPT0gMykKKwkJYmFyX3NlbGVjdGlvbiB8PSBCSVQoMyk7CiAKIAlwY2lf
aW91bm1hcChwZGV2LCB1bmNvcmUtPnJlZ3MpOworCXBjaV9yZWxlYXNlX3NlbGVjdGVkX3JlZ2lv
bnMocGRldiwgYmFyX3NlbGVjdGlvbik7CiB9CiAKIHZvaWQgaW50ZWxfdW5jb3JlX2luaXRfZWFy
bHkoc3RydWN0IGludGVsX3VuY29yZSAqdW5jb3JlLAotLSAKMi4yOC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
