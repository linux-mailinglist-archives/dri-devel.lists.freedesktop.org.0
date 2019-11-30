Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47E10E396
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 22:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578E889CD9;
	Sun,  1 Dec 2019 21:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5B46E9AF
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 22:26:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q10so3140569wrm.11
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 14:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bupTiDGvcydZYN2Rnj/bXhOvQ014P8Ct3uBt5NbJKS8=;
 b=hJUO3ZRfAtVvBqUVK5Vcs9eprj0vX5VhjqITS8tVjh6Lnk8UPSZGul0/WU5467i/Rl
 mu5DFjLoJ3w7RoIu8IVJfDpyvWbXQSZ3lQaOFWyQvnSnu7a6VUvuYtS4TrgCcroTLtn6
 Xcchw90oKSA7f8qNaobgoLubiXAUfDL2TL2DRwUX3s91f3YNhgG1RGFhkpNjhBkNsMpL
 0nhaULKJyH0OlzR9IMGTBqZLGCGVdfORGE0d0xHaIbyEWQo6xxuR88x1JjRvPmC31UjT
 k2hjMZinHQQ9lJsoKR5lawu11Dzsr8aAF1Y2BIAZXVJhw6repL5FxQ18qdkLuHSnrrt+
 PHug==
X-Gm-Message-State: APjAAAVcP5H6B8XfQ2OoiQPv/bQyiNPTJsUzN4tagJfZCFmhQ/6LwYas
 2DraHhbNE2LvHDViS9BSFeE=
X-Google-Smtp-Source: APXvYqwjN3lyPniHb9sLZ4uyBqG1FGZjCFKXKddgkyxV/pen1ugXXLKQtr2k6+big4hC461LRG5JBw==
X-Received: by 2002:adf:f5c2:: with SMTP id k2mr60867770wrp.118.1575152762350; 
 Sat, 30 Nov 2019 14:26:02 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id i71sm36265650wri.68.2019.11.30.14.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 14:26:01 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH] drm: meson: venc: cvbs: fix CVBS mode matching
Date: Sat, 30 Nov 2019 23:25:55 +0100
Message-Id: <20191130222555.2005375-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Dec 2019 21:16:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bupTiDGvcydZYN2Rnj/bXhOvQ014P8Ct3uBt5NbJKS8=;
 b=fi6nj6EVbWIV/2fhXGOQgkkRptg3mNzbFfVm4h7Lx3k31Gd/rdMvatqedH2AHz+fTI
 JA/tugb+Ci5XR+WmopY5bNT3Kyc/wh4bp+rlLoxlfqmtdV7Pnnj5aaoixosAp7mmvaqy
 jippza5lpblGhOfDmzNUK+vsBOeBoY0cQoW5dTGXBO4cOrf5mlZ3yiMxbScXD0aLIWt5
 Aes9ebuA77Em4dDWQ+DshvhfptHrVRohoWlsTXL6zRv+W32H2/MH5XIFvTcKQeXuUTR2
 Aij4/EWbitIheNds46i9dsiG36YypcQcwmsV80mFsBv7rxHKQsOZ2ptDJ247SzPm9uYC
 WDwA==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB0aGUgcGljdHVyZV9hc3BlY3RfcmF0aW8gZnJvbSB0aGUgZHJtX2Rpc3BsYXlfbW9kZXMg
d2hpY2ggYXJlIHZhbGlkCmZvciB0aGUgQW1sb2dpYyBNZXNvbiBDVkJTIGVuY29kZXIuIG1lc29u
X3ZlbmNfY3Zic19lbmNvZGVyX2F0b21pY19jaGVjawphbmQgbWVzb25fdmVuY19jdmJzX2VuY29k
ZXJfbW9kZV9zZXQgb25seSBzdXBwb3J0IHR3byB2ZXJ5IHNwZWNpZmljCmRybV9kaXNwbGF5X21v
ZGVzLgoKV2l0aCBjb21taXQgMjIyZWMxNjE4YzNhY2UgKCJkcm06IEFkZCBhc3BlY3QgcmF0aW8g
cGFyc2luZyBpbiBEUk0KbGF5ZXIiKSB0aGUgZHJtIGNvcmUgc3RhcnRlZCBob25vcmluZyB0aGUg
cGljdHVyZV9hc3BlY3RfcmF0aW8gZmllbGQKd2hlbiBjb21wYXJpbmcgdHdvIGRybV9kaXNwbGF5
X21vZGVzLiBQcmlvciB0byB0aGF0IGl0IHdhcyBpZ25vcmVkLgpXaGVuIHRoZSBDVkJTIGVuY29k
ZXIgZHJpdmVyIHdhcyBpbml0aWFsbHkgc3VibWl0dGVkIHRoZXJlIHdhcyBubyBhc3BlY3QKcmF0
aW8gY2hlY2suCgpUaGlzIHBhdGNoIGZpeGVzICJrbXNjdWJlIiBhbmQgWC5vcmcgb3V0cHV0IHVz
aW5nIHRoZSBDVkJTIGNvbm5lY3Rvcgp3aXRoIHRoZSBBbWxvZ2ljIE1lc29uIFZQVSBkcml2ZXIu
IFByaW9yIHRvIHRoaXMgcGF0Y2gga21zY3ViZSByZXBvcnRlZDoKICBmYWlsZWQgdG8gc2V0IG1v
ZGU6IEludmFsaWQgYXJndW1lbnQKQWRkaXRpb25hbGx5IGl0IG1ha2VzIHRoZSBDVkJTIG1vZGUg
Y2hlY2tpbmcgYmVoYXZlIGlkZW50aWNhbCB0byB0aGUKc3VuNGkgKGRyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW40aV90di5jIHN1bjRpX3R2X21vZGVfdG9fZHJtX21vZGUpIGFuZApaVEUgKGRyaXZl
cnMvZ3B1L2RybS96dGUvenhfdHZlbmMuYyB0dmVuY19tb2RlX3twYWwsbnRzY30pIHdoaWNoIGFy
ZQpib3RoIG5vdCBzZXR0aW5nICJwaWN0dXJlX2FzcGVjdF9yYXRpbyIgZWl0aGVyLgoKRml4ZXM6
IDIyMmVjMTYxOGMzYWNlICgiZHJtOiBBZGQgYXNwZWN0IHJhdGlvIHBhcnNpbmcgaW4gRFJNIGxh
eWVyIikKRml4ZXM6IGJiYmU3NzVlYzViNWRhICgiZHJtOiBBZGQgc3VwcG9ydCBmb3IgQW1sb2dp
YyBNZXNvbiBHcmFwaGljIENvbnRyb2xsZXIiKQpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92
ZW5jX2N2YnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYwppbmRl
eCA5YWIyN2FlY2ZjZjMuLjJkZGNkYThmYTViMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX3ZlbmNfY3Zicy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl92ZW5jX2N2YnMuYwpAQCAtNDksNyArNDksNiBAQCBzdHJ1Y3QgbWVzb25fY3Zic19tb2RlIG1l
c29uX2N2YnNfbW9kZXNbTUVTT05fQ1ZCU19NT0RFU19DT1VOVF0gPSB7CiAJCQkJIDcyMCwgNzMy
LCA3OTUsIDg2NCwgMCwgNTc2LCA1ODAsIDU4NiwgNjI1LCAwLAogCQkJCSBEUk1fTU9ERV9GTEFH
X0lOVEVSTEFDRSksCiAJCQkudnJlZnJlc2ggPSA1MCwKLQkJCS5waWN0dXJlX2FzcGVjdF9yYXRp
byA9IEhETUlfUElDVFVSRV9BU1BFQ1RfNF8zLAogCQl9LAogCX0sCiAJeyAvKiBOVFNDICovCkBA
IC01OSw3ICs1OCw2IEBAIHN0cnVjdCBtZXNvbl9jdmJzX21vZGUgbWVzb25fY3Zic19tb2Rlc1tN
RVNPTl9DVkJTX01PREVTX0NPVU5UXSA9IHsKIAkJCQk3MjAsIDczOSwgODAxLCA4NTgsIDAsIDQ4
MCwgNDg4LCA0OTQsIDUyNSwgMCwKIAkJCQlEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSksCiAJCQku
dnJlZnJlc2ggPSA2MCwKLQkJCS5waWN0dXJlX2FzcGVjdF9yYXRpbyA9IEhETUlfUElDVFVSRV9B
U1BFQ1RfNF8zLAogCQl9LAogCX0sCiB9OwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
