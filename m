Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677AA54E7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5A89B18;
	Mon,  2 Sep 2019 11:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBDD89B11
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so4834497wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4ruOAToiXpCU08bJrG8nExsBOMrBoTzi+fzNHaPKDo=;
 b=cvRh6S9QM0tMoDZRHpu78XdNXA9S1kVBlyk7mxKcsGjGAg4zWbiM8OYV2FMKTSlbfq
 tRIQKiKq/YoZYB90zX02+g20DHDNmO81yUvJOPofkgvZPIFoFvADdCWePXqE00ZT8gLM
 I6lr2dr9DsK4dMgzLvRR+TJ3KLQnQ/xExT6BQEv4jwVDOViv0HmbT7+HIth6jLACuVuy
 jpf3MIhkEcJsGMf3t5L9/9QmZeZYOiRIW5AosOXm7RBMXw+RuzWQU+FXpB481igup+f6
 nBR4a9AvW5yzcszsMdpqSaaJy+Hpe/0iZI3fuLv8nHUET1w+DJ3FK44LEp0tNT0xhOqO
 4VqQ==
X-Gm-Message-State: APjAAAVibB6xEFoN2KQuJVk6+6ZUd0RHvTAZp1pkZassdta8AYm7ikhJ
 6kJfykFdxZPYa31nKQ0GIKZkXrYU
X-Google-Smtp-Source: APXvYqyTQoBSxfCHHMjpd1LCt9c4czqXUCOrPsRM2UbpPl3UphcSjBBZPRe+8YG4xGukhlS8P9jtgQ==
X-Received: by 2002:adf:c508:: with SMTP id q8mr35193985wrf.287.1567423904860; 
 Mon, 02 Sep 2019 04:31:44 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id u186sm37367050wmu.26.2019.09.02.04.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/21] drm/dp: Read alternate scrambler reset capability
 from sink
Date: Mon,  2 Sep 2019 13:31:10 +0200
Message-Id: <20190902113121.31323-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L4ruOAToiXpCU08bJrG8nExsBOMrBoTzi+fzNHaPKDo=;
 b=uew4Cb/U9ps/9yWvFN5zYfSnSttPgPkccdwN8RAVlak2qLsuiarDd7iXl5H45peVfz
 mTj3r+VKAWbTdTkGaMezyj51nsmjmzFqpxbFfErE5IAFBEwaW5deC9eFkiMMg1U+myDz
 1OXG81whCYZVIV+JFD3Opd1JUmvhQD7ZtzqGuoNHkpL5pagG3Wnixn6Ks8njZDGWD8Ri
 RS0U15CDsYkGuH7iqFHb+kbehPvoYy8OTS+AHW72eZzcRpkrWudf8L4fMvK23duqagPw
 gbzmCAS/qeBAfWZOnitWq0QwhEcz1RDVAMhyAG9by1tt5z6h3giGk2Y21aMP1ykUYoDy
 +3fA==
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
