Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF37DF7F1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58C6E29D;
	Mon, 21 Oct 2019 22:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8021895E7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 18:05:38 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id b128so8921346pfa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 11:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tcCpwL0onfR06sWsqvX6mF6jQdr+eQVyW0yto6K7hG4=;
 b=RR4VMrEwjzHs++R8btw7WZW6eJ3aNnXLmuFV6HU7zazaJVIk8AEH9CDCz77kyN6ZrY
 eVFVa+lM8G2xr9WbZi9EfVpG8Xe7M7FoiRXWvzWtsmlajKB3A58ZQeZVMSKPVQCrnJSh
 1cnPf9C8Mk5pUAcZboSowMCiY3fuTcwEujhu48PYO2+vHkOVQ9DUG6N0u55Z4/sg8OS/
 2PQ2A1lYidY35crRKXLRT3vrJJnfDE0sJXq40h6HNnflt4KAlPC+reqfOW6TL/9r6upn
 sMJnPSnl77AsPAuUZh6HnwDgMknzOVUm7ADQnSAL1uxeB7d5jbP+yKMa/9pnVf5JxEbD
 R7Eg==
X-Gm-Message-State: APjAAAX5zi9nMam+Gpv2ENekoLycQuhQBwy7JWlrVRMrQuRmisMvD5hU
 aWrXKcfqn6ejomy8ZpEG78k=
X-Google-Smtp-Source: APXvYqwShECGrMgtkCZNkbBpxSyUczjEot2rIP9v1Pq9qwXKdamaT6TFjN9i9tI8xzvwNdYjP+hFIA==
X-Received: by 2002:a62:ae06:: with SMTP id q6mr24352444pff.96.1571681138284; 
 Mon, 21 Oct 2019 11:05:38 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id b4sm13929276pju.16.2019.10.21.11.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 11:05:37 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 bjorn.andersson@linaro.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Decouple DP output lanes from DSI
 input lanes
Date: Mon, 21 Oct 2019 11:05:32 -0700
Message-Id: <20191021180532.31210-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tcCpwL0onfR06sWsqvX6mF6jQdr+eQVyW0yto6K7hG4=;
 b=JYurzqC/VqEbhO/X3sS6Q14PnepMCPoiZ5ZXdzu6bk5bYu5tB0nwyEFf3Zya4K1jp5
 RqpNk7QJQQvThq3Utlro5P6uUs2R2uWwYRFPDlFmtgqmboFh9oo1noVBDxfk0vAjNLNC
 HsIAaGynDWSXQWeBRwtBQQaIJGc8TdmbzmFxNO867q5hrGPNUB6Of6PqbX1etW1fzW3L
 qojXAc9r70oZX68lQsvFBoS03JHH6WQBaMEl1IoPX2BhpyEX2+Uayv0gUbJc0iwWZkr0
 LZ4jDN6ChgAt29dhn7RVuetRAsNkEzSlYpgJfIrUpiCIee45Y4mvku80XdPSGOQKArr0
 w4aA==
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmFzZWQgb24gd29yayBieSBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8u
b3JnPgoKVGhlIGJyaWRnZSBjYW4gYmUgY29uZmlndXJlZCB0byB1c2UgMSwgMiwgb3IgNCBEUCBs
YW5lcy4gIFRoaXMKY29uZmlndXJhdGlvbiBpcyBpbmRlcGVuZGVudCBvZiB0aGUgaW5wdXQgRFNJ
IGxhbmVzLiAgUmlnaHQgbm93LCB0aGUKZHJpdmVyIGFzc3VtZXMgdGhhdCB0aGVyZSBpcyAxOjEg
bWFwcGluZyBvZiBpbnB1dCBsYW5lcyB0byBvdXRwdXQgbGFuZXMKd2hpY2ggaXMgbm90IGNvcnJl
Y3QgYW5kIGRvZXMgbm90IHdvcmsgZm9yIG1hbnUgZGV2aWNlcyBzdWNoIGFzIHRoZQpMZW5vdm8g
TWlpeCA2MzAgYW5kIExlbm92byBZb2dhIEM2MzAgbGFwdG9wcy4KCkluc3RlYWQsIGNvbmZpZ3Vy
ZSB0aGUgRFAgb3V0cHV0IGxhbmVzIGJhc2VkIG9uIHRoZSBjb25uZWN0aW9uIGluZm9ybWF0aW9u
CnRvIHRoZSBwYW5lbCwgaWYgYXZhaWxhYmxlLgoKU2lnbmVkLW9mZi1ieTogSmVmZnJleSBIdWdv
IDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aS1zbjY1ZHNpODYuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktc242NWRzaTg2LmMKaW5kZXggNDNhYmYwMWViZDRjLi4xYWZkYzNkNWQ1NDEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwpAQCAtMTAwLDYgKzEwMCw3IEBAIHN0cnVj
dCB0aV9zbl9icmlkZ2UgewogCXN0cnVjdCBkcm1fcGFuZWwJCSpwYW5lbDsKIAlzdHJ1Y3QgZ3Bp
b19kZXNjCQkqZW5hYmxlX2dwaW87CiAJc3RydWN0IHJlZ3VsYXRvcl9idWxrX2RhdGEJc3VwcGxp
ZXNbU05fUkVHVUxBVE9SX1NVUFBMWV9OVU1dOworCWludAkJCQlkcF9sYW5lczsKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX3JhbmdlIHRpX3NuX2JyaWRnZV92b2xhdGlsZV9yYW5n
ZXNbXSA9IHsKQEAgLTQ0NCw3ICs0NDUsNyBAQCBzdGF0aWMgdm9pZCB0aV9zbl9icmlkZ2Vfc2V0
X2RzaV9kcF9yYXRlKHN0cnVjdCB0aV9zbl9icmlkZ2UgKnBkYXRhKQogCXJlZ21hcF93cml0ZShw
ZGF0YS0+cmVnbWFwLCBTTl9EU0lBX0NMS19GUkVRX1JFRywgdmFsKTsKIAogCS8qIHNldCBEUCBk
YXRhIHJhdGUgKi8KLQlkcF9yYXRlX21oeiA9ICgoYml0X3JhdGVfbWh6IC8gcGRhdGEtPmRzaS0+
bGFuZXMpICogRFBfQ0xLX0ZVREdFX05VTSkgLworCWRwX3JhdGVfbWh6ID0gKChiaXRfcmF0ZV9t
aHogLyBwZGF0YS0+ZHBfbGFuZXMpICogRFBfQ0xLX0ZVREdFX05VTSkgLwogCQkJCQkJCURQX0NM
S19GVURHRV9ERU47CiAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUodGlfc25fYnJpZGdlX2Rw
X3JhdGVfbHV0KSAtIDE7IGkrKykKIAkJaWYgKHRpX3NuX2JyaWRnZV9kcF9yYXRlX2x1dFtpXSA+
IGRwX3JhdGVfbWh6KQpAQCAtNTA0LDggKzUwNSw4IEBAIHN0YXRpYyB2b2lkIHRpX3NuX2JyaWRn
ZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAlyZWdtYXBfdXBkYXRlX2JpdHMo
cGRhdGEtPnJlZ21hcCwgU05fRFNJX0xBTkVTX1JFRywKIAkJCSAgIENIQV9EU0lfTEFORVNfTUFT
SywgdmFsKTsKIAotCS8qIERQIGxhbmUgY29uZmlnICovCi0JdmFsID0gRFBfTlVNX0xBTkVTKHBk
YXRhLT5kc2ktPmxhbmVzIC0gMSk7CisJLyogRFAgbGFuZSBjb25maWcgLSA0IGxhbmVzIGFyZSBl
bmNvZGVkIHdpdGggdGhlIHZhbHVlICIzIiAqLworCXZhbCA9IERQX05VTV9MQU5FUyhwZGF0YS0+
ZHBfbGFuZXMgPT0gNCA/IDMgOiBwZGF0YS0+ZHBfbGFuZXMpOwogCXJlZ21hcF91cGRhdGVfYml0
cyhwZGF0YS0+cmVnbWFwLCBTTl9TU0NfQ09ORklHX1JFRywgRFBfTlVNX0xBTkVTX01BU0ssCiAJ
CQkgICB2YWwpOwogCkBAIC02OTksNyArNzAwLDEwIEBAIHN0YXRpYyBpbnQgdGlfc25fYnJpZGdl
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJCQkgICAgICBjb25zdCBzdHJ1Y3Qg
aTJjX2RldmljZV9pZCAqaWQpCiB7CiAJc3RydWN0IHRpX3NuX2JyaWRnZSAqcGRhdGE7Ci0JaW50
IHJldDsKKwlpbnQgcmV0LCBsZW47CisJc3RydWN0IGRldmljZV9ub2RlICplbmRwb2ludDsKKwlz
dHJ1Y3QgcHJvcGVydHkgKnByb3A7CisKIAogCWlmICghaTJjX2NoZWNrX2Z1bmN0aW9uYWxpdHko
Y2xpZW50LT5hZGFwdGVyLCBJMkNfRlVOQ19JMkMpKSB7CiAJCURSTV9FUlJPUigiZGV2aWNlIGRv
ZXNuJ3Qgc3VwcG9ydCBJMkNcbiIpOwpAQCAtNzI3LDYgKzczMSwyMSBAQCBzdGF0aWMgaW50IHRp
X3NuX2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCQlyZXR1cm4gcmV0
OwogCX0KIAorCWVuZHBvaW50ID0gb2ZfZ3JhcGhfZ2V0X2VuZHBvaW50X2J5X3JlZ3MocGRhdGEt
PmRldi0+b2Zfbm9kZSwgMSwgLTEpOworCXByb3AgPSBvZl9maW5kX3Byb3BlcnR5KGVuZHBvaW50
LCAiZGF0YS1sYW5lcyIsICZsZW4pOworCWlmICghcHJvcCkgeworCQlEUk1fREVCVUcoImZhaWxl
ZCB0byBmaW5kIGRwIGxhbmUgbWFwcGluZywgdXNpbmcgZGVmYXVsdFxuIik7CisJCXBkYXRhLT5k
cF9sYW5lcyA9IDE7CisJfSBlbHNlIHsKKwkJcGRhdGEtPmRwX2xhbmVzID0gbGVuIC8gc2l6ZW9m
KHUzMik7CisJCWlmIChwZGF0YS0+ZHBfbGFuZXMgPCAxIHx8IHBkYXRhLT5kcF9sYW5lcyA+IDQg
fHwKKwkJICAgIHBkYXRhLT5kcF9sYW5lcyA9PSAzKSB7CisJCQlEUk1fRVJST1IoImJhZCBudW1i
ZXIgb2YgZHAgbGFuZXM6ICVkXG4iLAorCQkJCSAgcGRhdGEtPmRwX2xhbmVzKTsKKwkJCXJldHVy
biAtRUlOVkFMOworCQl9CisJfQorCiAJZGV2X3NldF9kcnZkYXRhKCZjbGllbnQtPmRldiwgcGRh
dGEpOwogCiAJcGRhdGEtPmVuYWJsZV9ncGlvID0gZGV2bV9ncGlvZF9nZXQocGRhdGEtPmRldiwg
ImVuYWJsZSIsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
