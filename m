Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0E100078
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3366E062;
	Mon, 18 Nov 2019 08:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF2589E63
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 06:18:36 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o9so9163010plk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 22:18:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=In3dXboSGxSDc4571/sMxtCG8no6hvyudyiC85O5ndo=;
 b=tA9WBQdrg2vdQUOliCBtil6FDx/7l6sfhrmLFytlHn4grFUo+dVqCuu9V0ecQfUUwP
 1lQrDiTs2qt8fnDv9+wzCe4kjJixx0b640PnKZRZkaElvIdpX63x6q3QKXwNelMPvEo/
 hdWARmwqdiA9SefUzTZYVzE88upT3Nmjc01llQiEsyIjM9H5RW/7mWKBSp4zIk0YKjY8
 8F8qiwwCCxyrbMa/hDBv4lKZlcxdakln4qu6f8W+4SeezMyn68MdOLduRAsIZTXqp5rS
 XAey1z+CcLqelZN1oe8jeP8UGImm1PUS3RGE/0FR8c7Zp+OYQdVydqPUk8PpQKD8JckM
 ZlDA==
X-Gm-Message-State: APjAAAW3aaKd0A2wZgzCF4k3rlrHPYgKIZEa+JnTCtxu2uwKOj5jvyl9
 3l8OGDb+mRaL5BKhZe325RF/Gw==
X-Google-Smtp-Source: APXvYqxnGeAgTQrGlxhEM7cTtw/taIbeaI+NICqi0AiVOjf/RFlGTltFPJg8umDnYkhUrvkNVqGXOw==
X-Received: by 2002:a17:902:8f98:: with SMTP id
 z24mr21453839plo.35.1574057915737; 
 Sun, 17 Nov 2019 22:18:35 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7889:7a43:f899:134c])
 by smtp.googlemail.com with ESMTPSA id g4sm18589682pfh.172.2019.11.17.22.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 22:18:35 -0800 (PST)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] drm/mediatek: Check return value of
 mtk_drm_ddp_comp_for_plane.
Date: Mon, 18 Nov 2019 14:18:05 +0800
Message-Id: <20191118061806.52781-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=In3dXboSGxSDc4571/sMxtCG8no6hvyudyiC85O5ndo=;
 b=BXpHZhA/xlBopIauk0uUtCcrKTLJpeohwqpkdx+pyeB6cHC23OkMv5szao3WoFQgWG
 bpGQhs8COapoRUFUUwCikZIhzDyoPIVni7BgFnJxCR8+nXcXKRftiZoiC0dq8IG2LBaL
 aXBBWuLKQw+ZwkDv48ctSYKopX322s7+2kZLY=
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
Cc: David Airlie <airlied@linux.ie>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG10a19kcm1fZGRwX2NvbXBfZm9yX3BsYW5lIGNhbiByZXR1cm4gTlVMTCwgYnV0IHRoZSB1
c2FnZSBkb2Vzbid0CmNoZWNrIGZvciBpdC4gQWRkIGNoZWNrIGZvciBpdC4KCkZpeGVzOiBkNmI1
M2Y2ODM1NmYgKCJkcm0vbWVkaWF0ZWs6IEFkZCBoZWxwZXIgdG8gZ2V0IGNvbXBvbmVudCBmb3Ig
YSBwbGFuZSIpClNpZ25lZC1vZmYtYnk6IFBpLUhzdW4gU2hpaCA8cGloc3VuQGNocm9taXVtLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAxMyArKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwppbmRleCBmODBhOGJhNzU5
NzcuLjRjNGY5NzZjOTk0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
YwpAQCAtMzEwLDcgKzMxMCw5IEBAIHN0YXRpYyBpbnQgbXRrX2NydGNfZGRwX2h3X2luaXQoc3Ry
dWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCiAKIAkJcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxh
bmVfc3RhdGUocGxhbmUtPnN0YXRlKTsKIAkJY29tcCA9IG10a19kcm1fZGRwX2NvbXBfZm9yX3Bs
YW5lKGNydGMsIHBsYW5lLCAmbG9jYWxfbGF5ZXIpOwotCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29u
ZmlnKGNvbXAsIGxvY2FsX2xheWVyLCBwbGFuZV9zdGF0ZSk7CisJCWlmIChjb21wKQorCQkJbXRr
X2RkcF9jb21wX2xheWVyX2NvbmZpZyhjb21wLCBsb2NhbF9sYXllciwKKwkJCQkJCSAgcGxhbmVf
c3RhdGUpOwogCX0KIAogCXJldHVybiAwOwpAQCAtMzg2LDggKzM4OCw5IEBAIHN0YXRpYyB2b2lk
IG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjKQogCQkJY29tcCA9IG10
a19kcm1fZGRwX2NvbXBfZm9yX3BsYW5lKGNydGMsIHBsYW5lLAogCQkJCQkJCSAgJmxvY2FsX2xh
eWVyKTsKIAotCQkJbXRrX2RkcF9jb21wX2xheWVyX2NvbmZpZyhjb21wLCBsb2NhbF9sYXllciwK
LQkJCQkJCSAgcGxhbmVfc3RhdGUpOworCQkJaWYgKGNvbXApCisJCQkJbXRrX2RkcF9jb21wX2xh
eWVyX2NvbmZpZyhjb21wLCBsb2NhbF9sYXllciwKKwkJCQkJCQkgIHBsYW5lX3N0YXRlKTsKIAkJ
CXBsYW5lX3N0YXRlLT5wZW5kaW5nLmNvbmZpZyA9IGZhbHNlOwogCQl9CiAJCW10a19jcnRjLT5w
ZW5kaW5nX3BsYW5lcyA9IGZhbHNlOwpAQCAtNDAxLDcgKzQwNCw5IEBAIGludCBtdGtfZHJtX2Ny
dGNfcGxhbmVfY2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZSwKIAlzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wOwogCiAJY29tcCA9IG10a19kcm1fZGRw
X2NvbXBfZm9yX3BsYW5lKGNydGMsIHBsYW5lLCAmbG9jYWxfbGF5ZXIpOwotCXJldHVybiBtdGtf
ZGRwX2NvbXBfbGF5ZXJfY2hlY2soY29tcCwgbG9jYWxfbGF5ZXIsIHN0YXRlKTsKKwlpZiAoY29t
cCkKKwkJcmV0dXJuIG10a19kZHBfY29tcF9sYXllcl9jaGVjayhjb21wLCBsb2NhbF9sYXllciwg
c3RhdGUpOworCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfYXRvbWlj
X2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCgpiYXNlLWNvbW1pdDogNWE2ZmNiZWFiZTNl
MjA0NTllZDg1MDQ2OTBiMjUxNWRhY2M1MjQ2ZgotLSAKMi4yNC4wLjQzMi5nOWQzZjVmNWI2My1n
b29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
