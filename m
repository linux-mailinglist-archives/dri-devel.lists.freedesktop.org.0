Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D11CD55A
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C0D6E420;
	Mon, 11 May 2020 09:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBCC6E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:36:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h4so17293225wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2cjd039my7SPkC8EPqo5VDZ4m3B+J5XsHlv9Dpzoesg=;
 b=Qna7Z2CigyjThsCHuZ/X3cRbURDuDQpqImnSRo6nIzmW8iaexs5F5iK4B/2Fzm5CAC
 mNcgoPNwbfhkCykh5/lQt3GhiJyHDLdWssZt4oQsoV3Ipv/FYkWGq9xXAFZUShCQqJL7
 8KXUXhEWtOWrE2OPwrsc1BFTa4DWsVRRP5HVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2cjd039my7SPkC8EPqo5VDZ4m3B+J5XsHlv9Dpzoesg=;
 b=SfTUy2XY1RGoNnSWOho7GyP5xn1ji+EOHehKG70r1i3zkFE6WgUBf0wf5HBxPMdp2a
 3hVUgElqzP/ABNvtAagl2vq78PH7f46yJ/cC1b5Cywl1H/os9AsB3mC3I+yewQxoiyMK
 eg0Iq/6SdDiDcd4er7NbBYWJJGAXAeL6dimlVW2DLPQT1FcLYPFuIcHz6tTelIRXjZSl
 eLRKbWf5dHJetrk3vWSY3ZCjV1qZiaX832dDyAjvGidtjAtNvHH0hPinuZhAuDLO1ecZ
 jKKpmdTb5LRcbP2eKFsAbBTUctUlLqlDzGnDCseuXfEjYjn3QRWybGnM/eE+IXvM80Me
 +RDg==
X-Gm-Message-State: AGi0PuaintneDAZX1bpS1tNP3pTPYaBp5XONVs5/fvMRwNS1RsXn0el3
 HpM6BRAamUmoYCtpClKQuaCjZIqO/PA=
X-Google-Smtp-Source: APiQypKJePbl+7tEgq6xud45uZ8qJrAJXUQHVS2aS6RjMTWfZ3J+Iapb0rNYPqFZfpdBUG2iZtcX3w==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr15666940wmz.29.1589189767537; 
 Mon, 11 May 2020 02:36:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:36:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/9] drm/shmem-helpers: Redirect mmap for imported dma-buf
Date: Mon, 11 May 2020 11:35:52 +0200
Message-Id: <20200511093554.211493-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHRoaXMgc2VlbXMgdG8gd29yayBieSBjb252ZXJ0aW5nIHRoZSBzZ3QgaW50byBh
IHBhZ2VzIGFycmF5LAphbmQgdGhlbiB0cmVhdGluZyBpdCBsaWtlIGEgbmF0aXZlIG9iamVjdC4g
RG8gdGhlIHJpZ2h0IHRoaW5nIGFuZApyZWRpcmVjdCBtbWFwIHRvIHRoZSBleHBvcnRlci4KCldp
dGggdGhpcyBub3RoaW5nIGlzIGNhbGxpbmcgZ2V0X3BhZ2VzIGFueW1vcmUgb24gaW1wb3J0ZWQg
ZG1hLWJ1ZiwKYW5kIHdlIGNhbiBzdGFydCB0byByZW1vdmUgdGhlIHVzZSBvZiB0aGUgLT5wYWdl
cyBhcnJheSBmb3IgdGhhdCBjYXNlLgoKdjI6IFJlYmFzZQoKQ2M6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6IE5v
cmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9zaG1lbV9oZWxwZXIuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwppbmRleCBiOWNiYTVjYzYx
YzMuLjExN2E3ODQxZTI4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMK
QEAgLTU1MSw2ICs1NTEsOSBAQCBpbnQgZHJtX2dlbV9zaG1lbV9tbWFwKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAkvKiBSZW1vdmUgdGhl
IGZha2Ugb2Zmc2V0ICovCiAJdm1hLT52bV9wZ29mZiAtPSBkcm1fdm1hX25vZGVfc3RhcnQoJm9i
ai0+dm1hX25vZGUpOwogCisJaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkKKwkJcmV0dXJuIGRtYV9i
dWZfbW1hcChvYmotPmRtYV9idWYsIHZtYSwgMCk7CisKIAlzaG1lbSA9IHRvX2RybV9nZW1fc2ht
ZW1fb2JqKG9iaik7CiAKIAlyZXQgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcyhzaG1lbSk7Ci0t
IAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
