Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9865AB2D3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202A6E179;
	Fri,  6 Sep 2019 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693986E044
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:22 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 205so2082569pfw.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hTEru9Lo54OU309HOwpQ2LAFUsKEGLtu5GnynJbae0I=;
 b=P7TyK9DPBuaIXJdDijQJFTbsBrQUYlA5OXqxwVxpIyo4CSvrUgiwXdUZbo9p7Caai0
 Q/0bOUAvDlo1HWWRT2Cc/YR+bAjQQQWHvFnja+gUe8WF6OidVFd8cwKZcooy0CB2UmB9
 pQIKnpESuwUKYFW+zrbi0SbpHkfSqh+IjvocDeGtE0SSNHhxj5FCL6FWrFNwPUW0hOl1
 lErp34N0FawIVfkcGnPGG6VAAbmZsHHf5GvSL/u6HJQRgf/uEh+zr7CGbJQIgqvnGeyl
 bhS+QhFB8WLuqPZhR/YFHHjfmfnn32NC+Ybqrnd5a69L8zMrt5jgGCYeceMfWd0v6l1i
 fVIQ==
X-Gm-Message-State: APjAAAU6M1ItlMW+dG5B+ZdTp+lAKtAg9MqjSwNm/MECVUZJiEQIGJn4
 5xajaSzFq2bqnW0n9MgoLLOkjw==
X-Google-Smtp-Source: APXvYqw5OdtGz9h32B1utEihP+LRew80y2W8OC4yKoEUMG1OkpNOOTrJlR12V0LXuIQ89YtUTd464w==
X-Received: by 2002:a63:a35c:: with SMTP id v28mr3980810pgn.144.1567700301882; 
 Thu, 05 Sep 2019 09:18:21 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:21 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 17/18] i2c: omap: Trigger bus recovery in lockup case
Date: Thu,  5 Sep 2019 10:17:58 -0600
Message-Id: <20190905161759.28036-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hTEru9Lo54OU309HOwpQ2LAFUsKEGLtu5GnynJbae0I=;
 b=UXrdRBNRv4eBFBI2US9eb56BJw2QFySRmdCdiI/+LAIvG/m2c60c9K3NqHc9JzTcvb
 d8dwqHteqwZIJwmYizpsubVkvO7TeVXDOVTe6aX5zdW2UD3IAtqJ/uiyS9Lx2SPK8Tif
 Ec3qJAS3tr4mZ7bec9KhbwJfgkz2i4i8m38SHu1mvaoBC5wPzGtmlDymSmvre0XS7bbB
 i4Ro8UZZSf2iDGafbRHglF0mzarE9YVWxA+kdHTx/AktvE3YQZ90hkW58NANUCfMxmkq
 vIUoM/uekP6tFp8QDwySUHFho1wZKNrREHBB6M0EcCmSSQ1TR8BMwXKfB/JtNSwWr7kI
 o+bw==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2xhdWRpbyBGb2VsbG1pIDxjbGF1ZGlvLmZvZWxsbWlAZXJnb24uY2g+Cgpjb21taXQg
OTMzNjdiZmNhOThmMzZjZWNlNTdjMDFkYmNlNmVhMWI0YWM1ODI0NSB1cHN0cmVhbQoKQSB2ZXJ5
IGNvbnNlcnZhdGl2ZSBjaGVjayBmb3IgYnVzIGFjdGl2aXR5ICh0byBwcmV2ZW50IGludGVyZmVy
ZW5jZQppbiBtdWx0aW1hc3RlciBzZXR1cHMpIHByZXZlbnRlZCB0aGUgYnVzIHJlY292ZXJ5IG1l
dGhvZHMgZnJvbSBiZWluZwp0cmlnZ2VyZWQgaW4gdGhlIGNhc2UgdGhhdCBTREEgb3IgU0NMIHdh
cyBzdHVjayBsb3cuClRoaXMgZGVmZWF0cyB0aGUgcHVycG9zZSBvZiB0aGUgcmVjb3ZlcnkgbWVj
aGFuaXNtLCB3aGljaCB3YXMgaW50cm9kdWNlZApmb3IgZXhhY3RseSB0aGlzIHNpdHVhdGlvbiAo
YSBzbGF2ZSBkZXZpY2Uga2VlcGluZyBTREEgcHVsbGVkIGRvd24pLgoKQWxzbyBhZGRlZCBhIGNo
ZWNrIHRvIG1ha2Ugc3VyZSBTREEgaXMgbG93IGJlZm9yZSBhdHRlbXB0aW5nIHJlY292ZXJ5LgpJ
ZiBTREEgaXMgbm90IHN0dWNrIGxvdywgcmVjb3Zlcnkgd2lsbCBub3QgaGVscCwgc28gd2UgY2Fu
IHNraXAgaXQuCgpOb3RlIHRoYXQgYnVzIGxvY2t1cHMgY2FuIHBlcnNpc3QgYWNyb3NzIHJlYm9v
dHMuIFRoZSBvbmx5IG90aGVyIG9wdGlvbnMKYXJlIHRvIHJlc2V0IG9yIHBvd2VyIGN5Y2xlIHRo
ZSBvZmZlbmRpbmcgc2xhdmUgZGV2aWNlLCBhbmQgbWFueSBpMmMKc2xhdmVzIGRvIG5vdCBldmVu
IGhhdmUgYSByZXNldCBwaW4uCgpJZiB3ZSBzZWUgdGhhdCBvbmUgb2YgdGhlIGxpbmVzIGlzIGxv
dyBmb3IgdGhlIGVudGlyZSB0aW1lb3V0IGR1cmF0aW9uLAp3ZSBjYW4gYWN0dWFsbHkgYmUgc3Vy
ZSB0aGF0IHRoZXJlIGlzIG5vIG90aGVyIG1hc3RlciBkcml2aW5nIHRoZSBidXMuCkl0IGlzIHRo
ZXJlZm9yZSBzYXZlIGZvciB1cyB0byBhdHRlbXB0IGEgYnVzIHJlY292ZXJ5LgoKU2lnbmVkLW9m
Zi1ieTogQ2xhdWRpbyBGb2VsbG1pIDxjbGF1ZGlvLmZvZWxsbWlAZXJnb24uY2g+ClRlc3RlZC1i
eTogVmlnbmVzaCBSIDx2aWduZXNockB0aS5jb20+ClJldmlld2VkLWJ5OiBHcnlnb3JpaSBTdHJh
c2hrbyA8Z3J5Z29yaWkuc3RyYXNoa29AdGkuY29tPgpbd3NhOiBmaXhlZCBvbmUgcmV0dXJuIGNv
ZGUgdG8gLUVCVVNZXQpTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYUB0aGUtZHJlYW1z
LmRlPgpTaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtb21hcC5jIHwgMjUgKysrKysrKysr
KysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1vbWFwLmMgYi9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW9tYXAuYwppbmRleCAxMmJhMTgzNjkzZDYuLmEwMzU2NGY0
MWFkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1vbWFwLmMKKysrIGIvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1vbWFwLmMKQEAgLTQ4Niw2ICs0ODYsMjIgQEAgc3RhdGljIGlu
dCBvbWFwX2kyY19pbml0KHN0cnVjdCBvbWFwX2kyY19kZXYgKm9tYXApCiAJcmV0dXJuIDA7CiB9
CiAKKy8qCisgKiBUcnkgYnVzIHJlY292ZXJ5LCBidXQgb25seSBpZiBTREEgaXMgYWN0dWFsbHkg
bG93LgorICovCitzdGF0aWMgaW50IG9tYXBfaTJjX3JlY292ZXJfYnVzKHN0cnVjdCBvbWFwX2ky
Y19kZXYgKm9tYXApCit7CisJdTE2IHN5c3Rlc3Q7CisKKwlzeXN0ZXN0ID0gb21hcF9pMmNfcmVh
ZF9yZWcob21hcCwgT01BUF9JMkNfU1lTVEVTVF9SRUcpOworCWlmICgoc3lzdGVzdCAmIE9NQVBf
STJDX1NZU1RFU1RfU0NMX0lfRlVOQykgJiYKKwkgICAgKHN5c3Rlc3QgJiBPTUFQX0kyQ19TWVNU
RVNUX1NEQV9JX0ZVTkMpKQorCQlyZXR1cm4gMDsgLyogYnVzIHNlZW1zIHRvIGFscmVhZHkgYmUg
ZmluZSAqLworCWlmICghKHN5c3Rlc3QgJiBPTUFQX0kyQ19TWVNURVNUX1NDTF9JX0ZVTkMpKQor
CQlyZXR1cm4gLUVCVVNZOyAvKiByZWNvdmVyeSB3b3VsZCBub3QgZml4IFNDTCAqLworCXJldHVy
biBpMmNfcmVjb3Zlcl9idXMoJm9tYXAtPmFkYXB0ZXIpOworfQorCiAvKgogICogV2FpdGluZyBv
biBCdXMgQnVzeQogICovCkBAIC00OTYsNyArNTEyLDcgQEAgc3RhdGljIGludCBvbWFwX2kyY193
YWl0X2Zvcl9iYihzdHJ1Y3Qgb21hcF9pMmNfZGV2ICpvbWFwKQogCXRpbWVvdXQgPSBqaWZmaWVz
ICsgT01BUF9JMkNfVElNRU9VVDsKIAl3aGlsZSAob21hcF9pMmNfcmVhZF9yZWcob21hcCwgT01B
UF9JMkNfU1RBVF9SRUcpICYgT01BUF9JMkNfU1RBVF9CQikgewogCQlpZiAodGltZV9hZnRlcihq
aWZmaWVzLCB0aW1lb3V0KSkKLQkJCXJldHVybiBpMmNfcmVjb3Zlcl9idXMoJm9tYXAtPmFkYXB0
ZXIpOworCQkJcmV0dXJuIG9tYXBfaTJjX3JlY292ZXJfYnVzKG9tYXApOwogCQltc2xlZXAoMSk7
CiAJfQogCkBAIC01NzcsOCArNTkzLDEzIEBAIHN0YXRpYyBpbnQgb21hcF9pMmNfd2FpdF9mb3Jf
YmJfdmFsaWQoc3RydWN0IG9tYXBfaTJjX2RldiAqb21hcCkKIAkJfQogCiAJCWlmICh0aW1lX2Fm
dGVyKGppZmZpZXMsIHRpbWVvdXQpKSB7CisJCQkvKgorCQkJICogU0RBIG9yIFNDTCB3ZXJlIGxv
dyBmb3IgdGhlIGVudGlyZSB0aW1lb3V0IHdpdGhvdXQKKwkJCSAqIGFueSBhY3Rpdml0eSBkZXRl
Y3RlZC4gTW9zdCBsaWtlbHksIGEgc2xhdmUgaXMKKwkJCSAqIGxvY2tpbmcgdXAgdGhlIGJ1cyB3
aXRoIG5vIG1hc3RlciBkcml2aW5nIHRoZSBjbG9jay4KKwkJCSAqLwogCQkJZGV2X3dhcm4ob21h
cC0+ZGV2LCAidGltZW91dCB3YWl0aW5nIGZvciBidXMgcmVhZHlcbiIpOwotCQkJcmV0dXJuIC1F
VElNRURPVVQ7CisJCQlyZXR1cm4gb21hcF9pMmNfcmVjb3Zlcl9idXMob21hcCk7CiAJCX0KIAog
CQltc2xlZXAoMSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
