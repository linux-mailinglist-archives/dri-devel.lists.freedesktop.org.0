Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1744B8211B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67B6E4E6;
	Mon,  5 Aug 2019 16:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E756E4D4;
 Mon,  5 Aug 2019 16:03:32 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t132so39970546pgb.9;
 Mon, 05 Aug 2019 09:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uf5Kyvl6R4lvAs7V00xNhAh6oE9OoqQ2lgWGLPKa4ak=;
 b=UCyqJoFSKUYfRn1uR6h1IL5hriTIDLOhtZWV9ojG925ctd1NzPysK5Z4LesW8Syhdd
 Pkrztb2Not10GTB7dXAMuN5Dsg9gVA1tXe7TdWKQHDgkCCF6k0r+qFNdMMP+eFOWg+lI
 7omX12049spUaV2Uz6F+qLvvTEHLl0O9pccl8mjONRGjOe7NIK6r/zpoN33usKyLbWDY
 mzB5p211nzlQyah7d4vFWQWg7pDuRXAsEzlmhTpxx6FNKFY26T0/Jz3v4KKbx6mylKm3
 fh8HcnvkcK61X2ZyNzA27ShEUAW0C7FPPoXoCxck6cXzkhDhU4nvZ3GV9Os0mIAHULh8
 K9xQ==
X-Gm-Message-State: APjAAAXe0KBWBg9IFis83QPsAcUTfkp2fSrhG+T2UCl4hJAyWW8QwlMu
 fSg66cQlSMyDW6qYjzkqYwQ=
X-Google-Smtp-Source: APXvYqzmK66clykxtZ78Ka6IqlAt4/WQeHtxxjbA/5hlZMyFLmWILOUpzY50fw+Q9jF2knizmG/7EA==
X-Received: by 2002:a17:90a:6546:: with SMTP id
 f6mr18661240pjs.11.1565021012059; 
 Mon, 05 Aug 2019 09:03:32 -0700 (PDT)
Received: from localhost.localdomain ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id n98sm17061262pjc.26.2019.08.05.09.03.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:03:31 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCHv2 2/3] i915: convert to new mount API
Date: Tue,  6 Aug 2019 01:03:06 +0900
Message-Id: <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uf5Kyvl6R4lvAs7V00xNhAh6oE9OoqQ2lgWGLPKa4ak=;
 b=N7oQ2Fn2fvq2ydxLF1VKczaQ5uUjRaOuqMtZ6/QWeyh41ouymsleO6JjMZQ2q7Nr1W
 UyA78UP+MMsAwnnjsv21+XJkkefs9BgeSZhkSbo+Y3tl1VO/R/YtO9IcVZP/h5fDcdKD
 hUBoy2dT55bow0DfAeI4gGx2cmVGXeysRyA8XuNnjcNMlg4SKkq3GP6Cy/UW0uGXnSLd
 c9oVC785Crw82Gd90ecSV1B/jasl4o+smnQhv+Nb7RXikO7ImFMLW3KxTcaYvIu+6rnM
 aCgsxqi8TI/8/AISjgJfzV01QbaSRz4rzb8gyqO+sTqcQBTQjftuTeFPJHTpwB9hKGLR
 KUdg==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dG1wZnMgZG9lcyBub3Qgc2V0IC0+cmVtb3VudF9mcygpIGFueW1vcmUgYW5kIGl0cyB1c2VycyBu
ZWVkCnRvIGJlIGNvbnZlcnRlZCB0byBuZXcgbW91bnQgQVBJLgoKIEJVRzoga2VybmVsIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAwMAogUEY6IHN1cGVy
dmlzb3IgaW5zdHJ1Y3Rpb24gZmV0Y2ggaW4ga2VybmVsIG1vZGUKIFBGOiBlcnJvcl9jb2RlKDB4
MDAxMCkgLSBub3QtcHJlc2VudCBwYWdlCiBSSVA6IDAwMTA6MHgwCiBDb2RlOiBCYWQgUklQIHZh
bHVlLgogQ2FsbCBUcmFjZToKICBpOTE1X2dlbWZzX2luaXQrMHg2ZS8weGEwIFtpOTE1XQogIGk5
MTVfZ2VtX2luaXRfZWFybHkrMHg3Ni8weDkwIFtpOTE1XQogIGk5MTVfZHJpdmVyX3Byb2JlKzB4
MzBhLzB4MTY0MCBbaTkxNV0KICA/IGtlcm5mc19hY3RpdmF0ZSsweDVhLzB4ODAKICA/IGtlcm5m
c19hZGRfb25lKzB4ZGQvMHgxMzAKICBwY2lfZGV2aWNlX3Byb2JlKzB4OWUvMHgxMTAKICByZWFs
bHlfcHJvYmUrMHhjZS8weDIzMAogIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg0Yi8weGMwCiAgZGV2
aWNlX2RyaXZlcl9hdHRhY2grMHg0ZS8weDYwCiAgX19kcml2ZXJfYXR0YWNoKzB4NDcvMHhiMAog
ID8gZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg2MC8weDYwCiAgYnVzX2Zvcl9lYWNoX2RldisweDYx
LzB4OTAKICBidXNfYWRkX2RyaXZlcisweDE2Ny8weDFiMAogIGRyaXZlcl9yZWdpc3RlcisweDY3
LzB4YWEKClNpZ25lZC1vZmYtYnk6IFNlcmdleSBTZW5vemhhdHNreSA8c2VyZ2V5LnNlbm96aGF0
c2t5QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMgfCAz
MiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbWZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5j
CmluZGV4IDA5OWYzMzk3YWFkYS4uZmVlZGM5MjQyMDcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbWZzLmMKQEAgLTcsMTQgKzcsMTcgQEAKICNpbmNsdWRlIDxsaW51eC9mcy5oPgog
I2luY2x1ZGUgPGxpbnV4L21vdW50Lmg+CiAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgorI2lu
Y2x1ZGUgPGxpbnV4L2ZzX2NvbnRleHQuaD4KIAogI2luY2x1ZGUgImk5MTVfZHJ2LmgiCiAjaW5j
bHVkZSAiaTkxNV9nZW1mcy5oIgogCiBpbnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICppOTE1KQogeworCXN0cnVjdCBmc19jb250ZXh0ICpmYyA9IE5VTEw7CiAJc3Ry
dWN0IGZpbGVfc3lzdGVtX3R5cGUgKnR5cGU7CiAJc3RydWN0IHZmc21vdW50ICpnZW1mczsKKwli
b29sIG9rID0gdHJ1ZTsKIAogCXR5cGUgPSBnZXRfZnNfdHlwZSgidG1wZnMiKTsKIAlpZiAoIXR5
cGUpCkBAIC0zNiwxOCArMzksMjkgQEAgaW50IGk5MTVfZ2VtZnNfaW5pdChzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqaTkxNSkKIAkJc3RydWN0IHN1cGVyX2Jsb2NrICpzYiA9IGdlbWZzLT5tbnRf
c2I7CiAJCS8qIEZJWE1FOiBEaXNhYmxlZCB1bnRpbCB3ZSBnZXQgVy9BIGZvciByZWFkIEJXIGlz
c3VlLiAqLwogCQljaGFyIG9wdGlvbnNbXSA9ICJodWdlPW5ldmVyIjsKLQkJaW50IGZsYWdzID0g
MDsKLQkJaW50IGVycjsKLQotCQllcnIgPSBzYi0+c19vcC0+cmVtb3VudF9mcyhzYiwgJmZsYWdz
LCBvcHRpb25zKTsKLQkJaWYgKGVycikgewotCQkJa2Vybl91bm1vdW50KGdlbWZzKTsKLQkJCXJl
dHVybiBlcnI7Ci0JCX0KKworCQlvayA9IGZhbHNlOworCQlmYyA9IGZzX2NvbnRleHRfZm9yX3Jl
Y29uZmlndXJlKHNiLT5zX3Jvb3QsIDAsIDApOworCQlpZiAoSVNfRVJSKGZjKSkKKwkJCWdvdG8g
b3V0OworCisJCWlmICghZmMtPm9wcy0+cGFyc2VfbW9ub2xpdGhpYyB8fAorCQkJCWZjLT5vcHMt
PnBhcnNlX21vbm9saXRoaWMoZmMsIG9wdGlvbnMpKQorCQkJZ290byBvdXQ7CisKKwkJaWYgKGZj
LT5vcHMtPnJlY29uZmlndXJlICYmICFmYy0+b3BzLT5yZWNvbmZpZ3VyZShmYykpCisJCQlvayA9
IHRydWU7CiAJfQogCitvdXQ6CisJaWYgKCFvaykKKwkJZGV2X2VycihpOTE1LT5kcm0uZGV2LAor
CQkJIlVuYWJsZSB0byByZWNvbmZpZ3VyZSAlcy4gJXNcbiIsCisJCQkic2htZW1mcyBmb3IgcHJl
ZmVycmVkIGFsbG9jYXRpb24gc3RyYXRlZ3kiLAorCQkJIkNvbnRpbnVpbmcsIGJ1dCBwZXJmb3Jt
YW5jZSBtYXkgc3VmZmVyIik7CisJaWYgKCFJU19FUlJfT1JfTlVMTChmYykpCisJCXB1dF9mc19j
b250ZXh0KGZjKTsKIAlpOTE1LT5tbS5nZW1mcyA9IGdlbWZzOwotCiAJcmV0dXJuIDA7CiB9CiAK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
