Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84F8DFE5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 23:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182966E857;
	Wed, 14 Aug 2019 21:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124F76E856
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u16so481308wrr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+R7LV1MxNrT9xguc00MGuS05JmkrEhR9rX0ez6LOs84=;
 b=qursCXLtu3XDtN+gKQNugPn3VcbtyUbEVohWYSCK9E2XF/A282jKhnbyXj++2wkZ9k
 p8wxJK+k6OzdVDzGslkkrBihSW8GxkOfOKxR3NKBJVd7YDw9dhWvKN+fVhtYckUeo8HG
 yPgfqFmDNv9P7FfMBJrGNdzKX+sAaPQRd9aLCyoM42gzw8ovbHdnu2yuSsXIJ9YJJAJ0
 ud8AAm4NfIL9byrLCrZ92AL7sZ9npZ2zstKpb7b+xiLbvMuyblRNJY+usZjW5Oud9QyR
 10xxvR7Y84CNyF4yo+lWAGNKpUe24yb5jrNq+xS8gzk/OEjha969cbevvhjvhsb/dF41
 0h5g==
X-Gm-Message-State: APjAAAW/+9RtAv9PjmRV6kZzBaHfmpZAAneDKFxD6jgc+SC/G+q8iqbH
 pswKBXMUEsbrYGRJ792mRPske/3oaWQ=
X-Google-Smtp-Source: APXvYqy6Bct927d1tcxDlG3Bau1plPbpmZhGaupy99LmABC4eq6mo/7HS+c9vx5OHhIXxUPcYDgtMQ==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr1624418wro.268.1565818297742; 
 Wed, 14 Aug 2019 14:31:37 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:37 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 5/7] drm/nouveau/pci: add nvkm_pcie_get_speed
Date: Wed, 14 Aug 2019 23:31:16 +0200
Message-Id: <20190814213118.28473-6-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6IGZpeGVkIGNvbXBpbGF0aW9uIGVycm9yCgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3Qg
PGtoZXJic3RAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+CkNDOiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgpDQzogUmFmYWVs
IEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgpDQzogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkND
OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyAgICB8IDggKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2lu
Y2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKaW5kZXggNDgwM2E0ZmFkNGEyLi5iMjkxMDFlNDg1Zjkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYv
cGNpLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9w
Y2kuaApAQCAtNTMsNCArNTMsNSBAQCBpbnQgZ3AxMDBfcGNpX25ldyhzdHJ1Y3QgbnZrbV9kZXZp
Y2UgKiwgaW50LCBzdHJ1Y3QgbnZrbV9wY2kgKiopOwogCiAvKiBwY2llIGZ1bmN0aW9ucyAqLwog
aW50IG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVf
c3BlZWQsIHU4IHdpZHRoKTsKK2VudW0gbnZrbV9wY2llX3NwZWVkIG52a21fcGNpZV9nZXRfc3Bl
ZWQoc3RydWN0IG52a21fcGNpICopOwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYwppbmRleCBkNzFlNWRiNTAyOGEuLjAzYmUyNDkzMGMw
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3Bj
aWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5j
CkBAIC0xNjMsMyArMTYzLDExIEBAIG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kg
KnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCiAJcmV0dXJuIHJl
dDsKIH0KKworZW51bSBudmttX3BjaWVfc3BlZWQKK252a21fcGNpZV9nZXRfc3BlZWQoc3RydWN0
IG52a21fcGNpICpwY2kpCit7CisJaWYgKCFwY2kgfHwgIXBjaV9pc19wY2llKHBjaS0+cGRldikg
fHwgIXBjaS0+ZnVuYy0+cGNpZS5jdXJfc3BlZWQpCisJCXJldHVybiAtRU5PREVWOworCXJldHVy
biBwY2ktPmZ1bmMtPnBjaWUuY3VyX3NwZWVkKHBjaSk7Cit9Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
