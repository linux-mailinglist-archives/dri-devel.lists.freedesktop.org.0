Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB29E18C156
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B626EA7F;
	Thu, 19 Mar 2020 20:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FB96EA75
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:25:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z22so2753833lfd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bejRUz6aVap7OQPHSpDWUo9Icqy8lrhLwZI/ynq8pc=;
 b=lwi2zvAMdIJuJDOZzWep4pxtdbv4CG2t1R+mIEVIAOY8Zb7SChXTbP1vNtj8vR8djQ
 h7LgWyxhvVMwqmTUjgVLc9YyA9W7iTqSl6QTr7dlmICVN0GSx7uP+Q6MCA7ovODrVhf4
 Udw1bJS2JjGv4ooSqO+cCRYkpqrdST9HNlcqIwBG/hVXibiURVKzMu5McfrC4gK1JB8Q
 tPPwtJLZ2Y0OIvab0l8+bX0v4iVIV3SWNm/JNHL3enQA0/CyivgUTsJxYW9CKy0HXDbA
 WN1bnj88BTD4AVtEgg2acUvxLfdS6e6jBl1FtGTqf3XoE3Uk8pbyUvNC9+X4j/r7lhSD
 ucpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bejRUz6aVap7OQPHSpDWUo9Icqy8lrhLwZI/ynq8pc=;
 b=roAI3WGZh3yRN+RaYhgYY8bE0XloSPXZuWcMyWSAhcupPIl3o4ezRsfu2WJIC3Kx8p
 3/lkWW71p10dV/ry9HekcIGz9FDzJ/SSjrMENAiKfoRpvjPyO9epR0mgnTuqUu+OWDbM
 eFsM7M9RBFGTGluBAOXcbKXIqesUK84uLmghFJFvY5HaHkGxWWX7REVDDMiOEVonKthG
 tE91eQkA6iByLvKsHEfJh81EDgZI7D9y4P83/2mq8fhGWMk4y7cpsryKwsJjus78lwgG
 P8vvzPohHUtMb/ONUwIE29J/24VwXRNUAujzbvnVbhPzOv8XoV2mWcUXp4TzV0/g30wy
 JNHQ==
X-Gm-Message-State: ANhLgQ273TXhFN1HVDINXW2wiuy4aaWwhlv9hDiVUSfsTeymjn3+lp67
 1/OIScIW0Pql0sRceoV/PQLg0r7CoSQ=
X-Google-Smtp-Source: ADFU+vuOiyJSu/lo4qbFRtDIpLzFY/07DMdYMB+pPyg/lHiDK3k7fEwtRsR/NDfPe0zvd3EJN8BoWw==
X-Received: by 2002:a05:6512:3195:: with SMTP id
 i21mr3200739lfe.186.1584649507007; 
 Thu, 19 Mar 2020 13:25:07 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v3sm2074372lfp.8.2020.03.19.13.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:25:06 -0700 (PDT)
From: rscheidegger.oss@gmail.com
X-Google-Original-From: sroland@vmware.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/17] drm/vmwgfx: Add SM5 param for userspace
Date: Thu, 19 Mar 2020 21:24:13 +0100
Message-Id: <20200319202414.9296-17-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319202414.9296-1-sroland@vmware.com>
References: <20200319202414.9296-1-sroland@vmware.com>
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwuY29tPgoKQWRkIGEgbmV3IHBh
cmFtIGZvciB1c2VyLXNwYWNlIHRvIGRldGVybWluZSBpZiBrZXJuZWwgbW9kdWxlIGlzIFNNNQpj
YXBhYmxlLgoKU2lnbmVkLW9mZi1ieTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwu
Y29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0Bz
aGlwbWFpbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJvbGFuZCBTY2hlaWRlZ2dlciAoVk13YXJlKSA8
cnNjaGVpZGVnZ2VyLm9zc0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfaW9jdGwuYyB8IDMgKysrCiBpbmNsdWRlL3VhcGkvZHJtL3Ztd2dmeF9kcm0uaCAgICAg
ICAgIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9pb2N0bC5jCmluZGV4IDBhZjQyODc1YmE0ZS4uZjY4MWI3YjRkZjFi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9pb2N0bC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2lvY3RsLmMKQEAgLTExOSw2ICsxMTksOSBA
QCBpbnQgdm13X2dldHBhcmFtX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsCiAJY2FzZSBEUk1fVk1XX1BBUkFNX1NNNF8xOgogCQlwYXJhbS0+dmFsdWUgPSBoYXNfc200
XzFfY29udGV4dChkZXZfcHJpdik7CiAJCWJyZWFrOworCWNhc2UgRFJNX1ZNV19QQVJBTV9TTTU6
CisJCXBhcmFtLT52YWx1ZSA9IGhhc19zbTVfY29udGV4dChkZXZfcHJpdik7CisJCWJyZWFrOwog
CWRlZmF1bHQ6CiAJCXJldHVybiAtRUlOVkFMOwogCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9kcm0vdm13Z2Z4X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmgKaW5kZXgg
OGNkNGIzMjE1OTdjLi4wMmU5MTc1MDc0NzkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0v
dm13Z2Z4X2RybS5oCisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCkBAIC04Niw2
ICs4Niw5IEBAIGV4dGVybiAiQyIgewogICoKICAqIERSTV9WTVdfUEFSQU1fU000XzEKICAqIFNN
NF8xIHN1cHBvcnQgaXMgZW5hYmxlZC4KKyAqCisgKiBEUk1fVk1XX1BBUkFNX1NNNQorICogU001
IHN1cHBvcnQgaXMgZW5hYmxlZC4KICAqLwogCiAjZGVmaW5lIERSTV9WTVdfUEFSQU1fTlVNX1NU
UkVBTVMgICAgICAwCkBAIC0xMDMsNiArMTA2LDcgQEAgZXh0ZXJuICJDIiB7CiAjZGVmaW5lIERS
TV9WTVdfUEFSQU1fRFggICAgICAgICAgICAgICAxMgogI2RlZmluZSBEUk1fVk1XX1BBUkFNX0hX
X0NBUFMyICAgICAgICAgMTMKICNkZWZpbmUgRFJNX1ZNV19QQVJBTV9TTTRfMSAgICAgICAgICAg
IDE0CisjZGVmaW5lIERSTV9WTVdfUEFSQU1fU001ICAgICAgICAgICAgICAxNQogCiAvKioKICAq
IGVudW0gZHJtX3Ztd19oYW5kbGVfdHlwZSAtIGhhbmRsZSB0eXBlIGZvciByZWYgaW9jdGxzCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
