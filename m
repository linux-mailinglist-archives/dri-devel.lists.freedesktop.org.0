Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A75323B2FD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9336E3D3;
	Tue,  4 Aug 2020 02:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25B6E3D0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-tYCNyn_HMmiTRGuKGbzY-w-1; Mon, 03 Aug 2020 22:57:59 -0400
X-MC-Unique: tYCNyn_HMmiTRGuKGbzY-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC8DB8005B0;
 Tue,  4 Aug 2020 02:57:58 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF078AD1C;
 Tue,  4 Aug 2020 02:57:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 31/59] drm/radeon/ttm: use new takedown paths
Date: Tue,  4 Aug 2020 12:56:04 +1000
Message-Id: <20200804025632.3868079-32-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCA4NGMw
MmI0NTI5YzAuLjc2YjQwOWFmOTQ3NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMK
QEAgLTgyNSw4ICs4MjUsOCBAQCB2b2lkIHJhZGVvbl90dG1fZmluaShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldikKIAkJfQogCQlyYWRlb25fYm9fdW5yZWYoJnJkZXYtPnN0b2xlbl92Z2FfbWVt
b3J5KTsKIAl9Ci0JdHRtX2JvX2NsZWFuX21tKCZyZGV2LT5tbWFuLmJkZXYsIFRUTV9QTF9WUkFN
KTsKLQl0dG1fYm9fY2xlYW5fbW0oJnJkZXYtPm1tYW4uYmRldiwgVFRNX1BMX1RUKTsKKwl0dG1f
cmFuZ2VfbWFuX2ZpbmkoJnJkZXYtPm1tYW4uYmRldiwgJnJkZXYtPm1tYW4uYmRldi5tYW5bVFRN
X1BMX1ZSQU1dKTsKKwl0dG1fcmFuZ2VfbWFuX2ZpbmkoJnJkZXYtPm1tYW4uYmRldiwgJnJkZXYt
Pm1tYW4uYmRldi5tYW5bVFRNX1BMX1RUXSk7CiAJdHRtX2JvX2RldmljZV9yZWxlYXNlKCZyZGV2
LT5tbWFuLmJkZXYpOwogCXJhZGVvbl9nYXJ0X2ZpbmkocmRldik7CiAJcmRldi0+bW1hbi5pbml0
aWFsaXplZCA9IGZhbHNlOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
