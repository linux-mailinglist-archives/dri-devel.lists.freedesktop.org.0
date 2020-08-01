Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36223516C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 11:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D546EB69;
	Sat,  1 Aug 2020 09:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7430D6EB69
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 09:26:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a14so29975433wra.5
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YLCP8wVSVqxGYamKuMAhb4NgrNqZuvLwDDnSltj2vg=;
 b=IBlDbmo6i5/yA3gM7oMn8j/KbJ/yrAZIE9zs0yot1xEtTipgLQlqtjkPq7TRZoojYt
 HXTf+jSJnTZxt/t/mMu5SrRk/fRT/tD+K7TV5eXWOQU3MOME3QAmb7dPNipdOuhrH2OV
 oI0jNbXdAg8BM5Z4Cu6HDEfWt6dm/iVmnr5TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YLCP8wVSVqxGYamKuMAhb4NgrNqZuvLwDDnSltj2vg=;
 b=b8gP+bzubEVt8Fkxgk6mfIcTRaW+HQbaMn8A0U+TBxaCCrKuDIP9qmHWtmgj7IDLfZ
 grmyuGlS8BU7bkiT+F/k2+Y4QHYNNpqd4mhcA2ufCX3i67gvjClCGsPXOLv8bPNp536W
 WifwIBmxEVLJ0IbO1Wd1giH8zE0qilvDmD0DFAMZeuBKwMaQ0oXTPPjz+ZgcNxaSnSyh
 goxvlZqbx1qLO5IcOLgaVtpMU9zUVrOQcRJhc/qh9To2mckI/UuiMOqW+xtczpfkYK4W
 FsCmgsimlZLh4MQb7JvAMpWoh+Q3c8q9wIQ+4+r2Z7nIbFw3lWU6M6CQoiD1xX4uk/yL
 hILg==
X-Gm-Message-State: AOAM532PVVR7MtHq6QF6ST94Eykl1Elbc6AwtqVGGHfHugVszTic3QKf
 qIJ+82OYPtY6f8xSx+nYQXABapsopws=
X-Google-Smtp-Source: ABdhPJxGjsr8G3Xjac1E7hbR07w4oMMgBwQSTZgeC55/BUmuJd4QwTBeDXuS7MuqzKf6XMWBxMS0Ww==
X-Received: by 2002:adf:b34a:: with SMTP id k10mr6708220wrd.402.1596273995858; 
 Sat, 01 Aug 2020 02:26:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n18sm17037889wrw.45.2020.08.01.02.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 02:26:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/syncobj: Tune down unordered timeline DRM_ERROR
Date: Sat,  1 Aug 2020 11:26:25 +0200
Message-Id: <20200801092625.1107609-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
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
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlcnNwYWNlIGNhbiBwcm92b2tlIHRoaXMsIHdlIGdlbmVyYWxseSBkb24ndCBhbGxvdyB1c2Vy
c3BhY2UgdG8gc3BhbQpkbWVzZy4gVHVuZSBpdCBkb3duIHRvIGRlYnVnLiBVbmZvcnR1bmF0ZWx5
IHdlIGRvbid0IGhhdmUgZWFzeSBhY2Nlc3MKdG8gdGhlIGRybV9kZXZpY2UgaGVyZSAobm90IGF0
IGFsbCB3aXRob3V0IGNoYW5naW5nIGEgZmV3IHRoaW5ncyksIHNvCmxlYXZlIGl0IGFzIG9sZCBz
dHlsZSBkbWVzZyBvdXRwdXQgZm9yIG5vdy4KClJlZmVyZW5jZXM6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODAxNDYvClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+CkNjOiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxp
bkBpbnRlbC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMK
aW5kZXggM2JmNzM5NzFkYWYzLi42ZTc0ZTY3NDVlY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCkBA
IC0yOTcsNyArMjk3LDcgQEAgdm9pZCBkcm1fc3luY29ial9hZGRfcG9pbnQoc3RydWN0IGRybV9z
eW5jb2JqICpzeW5jb2JqLAogCXByZXYgPSBkcm1fc3luY29ial9mZW5jZV9nZXQoc3luY29iaik7
CiAJLyogWW91IGFyZSBhZGRpbmcgYW4gdW5vcmRlciBwb2ludCB0byB0aW1lbGluZSwgd2hpY2gg
Y291bGQgY2F1c2UgcGF5bG9hZCByZXR1cm5lZCBmcm9tIHF1ZXJ5X2lvY3RsIGlzIDAhICovCiAJ
aWYgKHByZXYgJiYgcHJldi0+c2Vxbm8gPj0gcG9pbnQpCi0JCURSTV9FUlJPUigiWW91IGFyZSBh
ZGRpbmcgYW4gdW5vcmRlciBwb2ludCB0byB0aW1lbGluZSFcbiIpOworCQlEUk1fREVCVUcoIllv
dSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUhXG4iKTsKIAlkbWFfZmVu
Y2VfY2hhaW5faW5pdChjaGFpbiwgcHJldiwgZmVuY2UsIHBvaW50KTsKIAlyY3VfYXNzaWduX3Bv
aW50ZXIoc3luY29iai0+ZmVuY2UsICZjaGFpbi0+YmFzZSk7CiAKLS0gCjIuMjcuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
