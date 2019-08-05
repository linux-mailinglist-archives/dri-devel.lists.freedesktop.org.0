Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465381927
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C88D6E429;
	Mon,  5 Aug 2019 12:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFC46E428
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:07 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p15so78420122eds.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4ruOAToiXpCU08bJrG8nExsBOMrBoTzi+fzNHaPKDo=;
 b=tBuzzqv8mXSmjIy626amRX71GRaHX08VO7KHVTtOmVVmYtj+2HU1zyecrp3r+NDHbc
 1+3WvC4AIfb8e6m/D9kD+Kj8MuguzCwv3lZ4nciLKbPp1j+C6Shq+bv7epWABXkN9hrA
 8uzpGHJeCGRBbxkwC7VcfaOK9flJI8QSVCd0NX1JE80RTBuEzQSS8+ycLv2+/V9SJNCf
 DYy1FOsrYTj4llEKihgYFAiGCZ0vcdO+R6rpOQ11+R6VpQWsj9ClGMhvL2FevlCsm4dR
 ONCYcVPVid5eSKYKO+9/xF9J4kq6zF+TZwWM85YSFacuVShgrYqTD3V6YP7+S/4GAkZa
 pNtA==
X-Gm-Message-State: APjAAAUzAM6WzlIg3pBAAUslHIlukixFUD0V4uHj/YTRCyzrLlLulJQ1
 JT2gRNdTD4Z60VSGDpS2k+lY+TWE
X-Google-Smtp-Source: APXvYqxfydhqQHoEhE2mTChk/Gt7x527oy2Ho8pl3QkLtan+g1nZuOzllJdtVXQ+Uy7lvyYONYJifA==
X-Received: by 2002:a17:906:6a54:: with SMTP id
 n20mr119692943ejs.232.1565007845281; 
 Mon, 05 Aug 2019 05:24:05 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id u6sm7901899ejb.58.2019.08.05.05.24.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/21] drm/dp: Read alternate scrambler reset capability from
 sink
Date: Mon,  5 Aug 2019 14:23:39 +0200
Message-Id: <20190805122350.8838-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L4ruOAToiXpCU08bJrG8nExsBOMrBoTzi+fzNHaPKDo=;
 b=pp5/a8YVWqxXKMJ7gY5rkfbVarX2mP+PT5Ec50x4grYBHPAKqLKyMpsGlhlWCs20/C
 QX9sncBqbLrBMRyRD/xDPsE7ntM7oUTeS9OjJerDsH5jpK5LydHM2Jq4CC2owAQ6dXGr
 YCx0e12X5QC5V0oj0gv7d2SlfYLJ/iGOzvs3XXph6d2ZWXQ7yqGTAJ9+t2mDOcfBofWI
 Rk5Z0wo2M1V0GXHrebc6lzZO/n8RA/G3WEqdQg2kZt8mk7FwBzohyi5LV4NS/tXOUjlD
 qlVzfZLJPJ0vVEjmppCaYse0sVvlQmKFr+KzR/Q7Ke9qVMbTzv7XJcvvswoeE2Z0JGCd
 fyFA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClBhcnNlIGZyb20gdGhl
IHNpbmsgY2FwYWJpbGl0aWVzIHdoZXRoZXIgb3Igbm90IHRoZSBlRFAgYWx0ZXJuYXRlCnNjcmFt
YmxlciByZXNldCB2YWx1ZSBvZiAweGZmZmUgaXMgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1ieTog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jIHwgNSArKysrKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAg
ICB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9oZWxwZXIuYwppbmRleCAxYzIzODE5NmM4YjQuLmFjYWI4ZGM0OGUyYyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jCkBAIC0zNTgsNiArMzU4LDcgQEAgc3RhdGljIHZvaWQgZHJtX2Rw
X2xpbmtfY2Fwc19yZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqY2FwcykKIAljYXBzLT50
cHMzX3N1cHBvcnRlZCA9IGZhbHNlOwogCWNhcHMtPmZhc3RfdHJhaW5pbmcgPSBmYWxzZTsKIAlj
YXBzLT5jaGFubmVsX2NvZGluZyA9IGZhbHNlOworCWNhcHMtPmFsdGVybmF0ZV9zY3JhbWJsZXJf
cmVzZXQgPSBmYWxzZTsKIH0KIAogdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRy
bV9kcF9saW5rX2NhcHMgKmRlc3QsCkBAIC0zNjcsNiArMzY4LDcgQEAgdm9pZCBkcm1fZHBfbGlu
a19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9saW5rX2NhcHMgKmRlc3QsCiAJZGVzdC0+dHBzM19z
dXBwb3J0ZWQgPSBzcmMtPnRwczNfc3VwcG9ydGVkOwogCWRlc3QtPmZhc3RfdHJhaW5pbmcgPSBz
cmMtPmZhc3RfdHJhaW5pbmc7CiAJZGVzdC0+Y2hhbm5lbF9jb2RpbmcgPSBzcmMtPmNoYW5uZWxf
Y29kaW5nOworCWRlc3QtPmFsdGVybmF0ZV9zY3JhbWJsZXJfcmVzZXQgPSBzcmMtPmFsdGVybmF0
ZV9zY3JhbWJsZXJfcmVzZXQ7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX2NhcHNfY29w
eSk7CiAKQEAgLTQxNiw2ICs0MTgsOSBAQCBpbnQgZHJtX2RwX2xpbmtfcHJvYmUoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQogCWxpbmstPmNhcHMuZmFz
dF90cmFpbmluZyA9IGRybV9kcF9mYXN0X3RyYWluaW5nX2NhcCh2YWx1ZXMpOwogCWxpbmstPmNh
cHMuY2hhbm5lbF9jb2RpbmcgPSBkcm1fZHBfY2hhbm5lbF9jb2Rpbmdfc3VwcG9ydGVkKHZhbHVl
cyk7CiAKKwlpZiAoZHJtX2RwX2FsdGVybmF0ZV9zY3JhbWJsZXJfcmVzZXRfY2FwKHZhbHVlcykp
CisJCWxpbmstPmNhcHMuYWx0ZXJuYXRlX3NjcmFtYmxlcl9yZXNldCA9IHRydWU7CisKIAlsaW5r
LT5yYXRlID0gbGluay0+bWF4X3JhdGU7CiAJbGluay0+bGFuZXMgPSBsaW5rLT5tYXhfbGFuZXM7
CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaAppbmRleCBkMTQ0ZDNhNTRkYmMuLmY5ZjY1YmMxM2RmNSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaApAQCAtMTIyMiw2ICsxMjIyLDEzIEBAIGRybV9kcF9jaGFubmVsX2NvZGluZ19z
dXBwb3J0ZWQoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCiAJcmV0dXJuIGRw
Y2RbRFBfTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HXSAmIERQX0NBUF9BTlNJXzhCMTBCOwogfQog
CitzdGF0aWMgaW5saW5lIGJvb2wKK2RybV9kcF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0X2Nh
cChjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwlyZXR1cm4gZHBjZFtE
UF9FRFBfQ09ORklHVVJBVElPTl9DQVBdICYKKwkJCURQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVT
RVRfQ0FQOworfQorCiAvKgogICogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKICAqLwpAQCAtMTM3
OSwxMiArMTM4NiwxNCBAQCBpbnQgZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0YXR1cyhzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqYXV4LAogICogQHRwczNfc3VwcG9ydGVkOiB0cmFpbmluZyBwYXR0ZXJuIHNl
cXVlbmNlIDMgc3VwcG9ydGVkIGZvciBlcXVhbGl6YXRpb24KICAqIEBmYXN0X3RyYWluaW5nOiBB
VVggQ0ggaGFuZHNoYWtlIG5vdCByZXF1aXJlZCBmb3IgbGluayB0cmFpbmluZwogICogQGNoYW5u
ZWxfY29kaW5nOiBBTlNJIDhCLzEwQiBjaGFubmVsIGNvZGluZyBjYXBhYmlsaXR5CisgKiBAYWx0
ZXJuYXRlX3NjcmFtYmxlcl9yZXNldDogZURQIGFsdGVybmF0ZSBzY3JhbWJsZXIgcmVzZXQgY2Fw
YWJpbGl0eQogICovCiBzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyB7CiAJYm9vbCBlbmhhbmNlZF9m
cmFtaW5nOwogCWJvb2wgdHBzM19zdXBwb3J0ZWQ7CiAJYm9vbCBmYXN0X3RyYWluaW5nOwogCWJv
b2wgY2hhbm5lbF9jb2Rpbmc7CisJYm9vbCBhbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0OwogfTsK
IAogdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9saW5rX2NhcHMgKmRl
c3QsCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
