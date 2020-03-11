Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6C181A3B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A6A6E430;
	Wed, 11 Mar 2020 13:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4EC8915A;
 Wed, 11 Mar 2020 13:52:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s5so2733684wrg.3;
 Wed, 11 Mar 2020 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zTmN9DEXOaBKxy4tMmFv7mOnUJY2ke5/2F4me6DvZxM=;
 b=BAeSTC9mAbQYlziodp36mbOGFsKH7iH3q092S9yg/JaB8KzrHSjHA75LCPhnkgOXWy
 rPq1mMbAkhv99dEpTtwdyRxvT//fEPGoOr3FpSxAMwwwylFdYazU+S7qE/k1/U6wcO9z
 rz6YxqI9KOs+KRS1WDGs8DZ754b1KUsvXZKEAImad7Ypui1EcXCKy9znmi2UU7FuSeKB
 lYVXVtZv1d9TvemNGvwTHI0wCloJ5sMwnlJlPCAPR1miGRgCl7H8B8x2uU55VdQLeF8w
 /JsODq5PKPptAVb+jR60P0gpPWcmz2aU1zALeQ+st8NSe/g3pzYf2jkOUdf6vkSFZ1YP
 R0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zTmN9DEXOaBKxy4tMmFv7mOnUJY2ke5/2F4me6DvZxM=;
 b=llu5VtsBmZIGUOCfat9RhJqLEIKbDoc++nlnC2l1Paxjn5l+03Y7vgKuqtCSgZ+d4H
 Ief79eky5/A30qBAuEQYwLki4MibDbYFthUNIADAOdTqYebUdEACtGyQYzZUG22HUIKN
 8jcQguFio3mclyAG5OVVnxds9Jo29qYrKGQkVUI4VhRAjr2bMbrFlKzhPHWixkM5rzsd
 OkAbM6QzFoCx//72NyU2iaSdElDtbbWJcMHykHf9UepeHELlySd6IroRH0CE88TtlHkD
 yXT59WbiqOz2tW2eATPpi3bQdpqL9tdEzkgyS96Vw00M175dnEvKySw7vIBpa/BmQCgK
 0bBw==
X-Gm-Message-State: ANhLgQ1pFEmsBJSlJ8Nj8beQlExRToUWnQkorRJM8Yhc4JlLfLAKMdt6
 yxMgu/UoUIwps4P0Wi3zW+vNuLDo
X-Google-Smtp-Source: ADFU+vsOOz12ce5eYJpqK2qbmEnKZS+AmEeu/Oz2KmbCkMjsmBPhswTyMx1kwU26TJkE3M/mMkmkIQ==
X-Received: by 2002:a5d:6208:: with SMTP id y8mr4791359wru.64.1583934721964;
 Wed, 11 Mar 2020 06:52:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
 by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 06:52:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Date: Wed, 11 Mar 2020 14:51:53 +0100
Message-Id: <20200311135158.3310-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjYW4gYmUgdXNlZCBieSBkcml2ZXJzIHRvIHNldHVwIFAyUCBETUEgYmV0d2VlbiBkZXZp
Y2UKbWVtb3J5IHdoaWNoIGlzIG5vdCBiYWNrZWQgYnkgc3RydWN0IHBhZ2VzLgoKVGhlIGRyaXZl
cnMgb2YgdGhlIGludm9sdmVkIGRldmljZXMgYXJlIHJlc3BvbnNpYmxlIGZvcgpzZXR0aW5nIHVw
IGFuZCB0ZWFyaW5nIGRvd24gRE1BIGFkZHJlc3NlcyBhcyBuZWNlc3NhcnkKdXNpbmcgZG1hX21h
cF9yZXNvdXJjZSgpLgoKVGhlIHBhZ2UgcG9pbnRlciBpcyBzZXQgdG8gTlVMTCBhbmQgb25seSB0
aGUgRE1BIGFkZHJlc3MsCmxlbmd0aCBhbmQgb2Zmc2V0IHZhbHVlcyBhcmUgdmFsaWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogaW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oIHwgMjMgKysrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9zY2F0dGVybGlzdC5oIGIvaW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oCmluZGV4
IDZlZWM1MGZiMzZjOC4uMjhhNDc3YmYwYmRmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3Nj
YXR0ZXJsaXN0LmgKKysrIGIvaW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oCkBAIC0xNDUsNiAr
MTQ1LDI5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzZ19zZXRfYnVmKHN0cnVjdCBzY2F0dGVybGlz
dCAqc2csIGNvbnN0IHZvaWQgKmJ1ZiwKIAlzZ19zZXRfcGFnZShzZywgdmlydF90b19wYWdlKGJ1
ZiksIGJ1Zmxlbiwgb2Zmc2V0X2luX3BhZ2UoYnVmKSk7CiB9CiAKKy8qKgorICogc2dfc2V0X2Rt
YV9hZGRyIC0gU2V0IHNnIGVudHJ5IHRvIHBvaW50IGF0IHNwZWNpZmllZCBkbWEgYWRkcmVzcwor
ICogQHNnOgkJIFNHIGVudHJ5CisgKiBAYWRkcmVzczoJIERNQSBhZGRyZXNzIHRvIHNldAorICog
QGxlbjoJIExlbmd0aCBvZiBkYXRhCisgKiBAb2Zmc2V0OgkgT2Zmc2V0IGludG8gcGFnZQorICoK
KyAqIERlc2NyaXB0aW9uOgorICogICBVc2UgdGhpcyBmdW5jdGlvbiB0byBzZXQgYW4gc2cgZW50
cnkgdG8gcG9pbnQgdG8gZGV2aWNlIHJlc291cmNlcyBtYXBwZWQKKyAqICAgdXNpbmcgZG1hX21h
cF9yZXNvdXJjZSgpLiBUaGUgcGFnZSBwb2ludGVyIGlzIHNldCB0byBOVUxMIGFuZCBvbmx5IHRo
ZSBETUEKKyAqICAgYWRkcmVzcywgbGVuZ3RoIGFuZCBvZmZzZXQgdmFsdWVzIGFyZSB2YWxpZC4K
KyAqCisgKiovCitzdGF0aWMgaW5saW5lIHZvaWQgc2dfc2V0X2RtYV9hZGRyKHN0cnVjdCBzY2F0
dGVybGlzdCAqc2csIGRtYV9hZGRyX3QgYWRkcmVzcywKKwkJCQkgICB1bnNpZ25lZCBpbnQgbGVu
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQoreworCXNnX3NldF9wYWdlKHNnLCBOVUxMLCBsZW4sIG9m
ZnNldCk7CisJc2ctPmRtYV9hZGRyZXNzID0gYWRkcmVzczsKKyNpZmRlZiBDT05GSUdfTkVFRF9T
R19ETUFfTEVOR1RICisJc2ctPmRtYV9sZW5ndGggPSBsZW47CisjZW5kaWYKK30KKwogLyoKICAq
IExvb3Agb3ZlciBlYWNoIHNnIGVsZW1lbnQsIGZvbGxvd2luZyB0aGUgcG9pbnRlciB0byBhIG5l
dyBsaXN0IGlmIG5lY2Vzc2FyeQogICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
