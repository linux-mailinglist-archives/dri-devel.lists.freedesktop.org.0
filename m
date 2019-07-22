Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26466F9F5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D6289B30;
	Mon, 22 Jul 2019 07:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAE289A83
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 04:30:19 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q10so16729356pff.9
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 21:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Buo/x1ku3lZhKwc/x7LZHJLCV0/VJfVJkEd+jUfSemQ=;
 b=Gx15j3TtrOCx2wffa9uP9I2HSLBnYeaIDxMnl+FBITDBsH3AsWr99dDjldyacc5v3d
 6vKb0CUVcrAEwJHJGbccv3dLR7cyGtIqWxTuoyttCZbLZjTWRK7UUw79ThaaGarAwCim
 8P0yp1heJaeP+B7lzGsZxh+7dXCtqibo4+IzsiZyVjU13CmTeFEjo6Cl7lS6PjsdnGnW
 fc1uiuRUgonKITyGPvJqWu4nHlBZQML+8j+pe2TO6gI1fbWv7O9Jc1NHHqTGzGsQWnbF
 8CCGX+XMvDV3Zc4K89lQBLp/xFSwsvg1rhaDDs7z7xUjYuae5MT01W6Gu7jl+67oQCqH
 CEcg==
X-Gm-Message-State: APjAAAUhXcG4rl6BhUM7tm11NVu9PR74vboIQvmls18+uZ8UXXeRrCK2
 WUDcXQR7TVxyWavnNI4H6q0=
X-Google-Smtp-Source: APXvYqz665JUdaZ8/qhWBT5//AwERdP9iGLvt+InEi3nlWem4n0SFx0hcOfAG8MfqjlewAESAxZqZQ==
X-Received: by 2002:a17:90a:9488:: with SMTP id
 s8mr76721358pjo.2.1563769819486; 
 Sun, 21 Jul 2019 21:30:19 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 t96sm34285690pjb.1.2019.07.21.21.30.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 21:30:19 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] gup: new put_user_page_dirty*() helpers
Date: Sun, 21 Jul 2019 21:30:12 -0700
Message-Id: <20190722043012.22945-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722043012.22945-1-jhubbard@nvidia.com>
References: <20190722043012.22945-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Buo/x1ku3lZhKwc/x7LZHJLCV0/VJfVJkEd+jUfSemQ=;
 b=t+zktHb7vIG4ts5I2ltkQHV48J0ZrgypJDZXuh8Drmfq8ZU2ILeEdq1vHcQdIM9gdw
 V6T9AQozh+PvM/HqMIqy5Tm11lI/PpLyTVp0Vd74SuF5mClFEjFXDGjMIfpge1xQoCsm
 IhnhiaeU9cdQMTgVUWSOM6j8abtFujQkLro/ZEGxc5vfgAlJ/A2fXKxi+6ua/RqGJsAJ
 aF9WRDRmvUFsceuLPU8ZX2StoJI42RECfxqG70NX1cGm7d70CaK3aiDy2ueHCoMs6WN3
 fMhhkyT7kmlOi6Ja/WZU2mwWlGLAtDglCCekSpcUu5Vy9dQccxZDeZv6fJknPIHGCBXz
 Jv+w==
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Johannes Thumshirn <jthumshirn@suse.de>, Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKV2hpbGUgY29udmVydGlu
ZyBjYWxsIHNpdGVzIHRvIHVzZSBwdXRfdXNlcl9wYWdlKigpIFsxXSwgcXVpdGUgYSBmZXcKcGxh
Y2VzIGVuZGVkIHVwIG5lZWRpbmcgYSBzaW5nbGUtcGFnZSByb3V0aW5lIHRvIHB1dCBhbmQgZGly
dHkgYQpwYWdlLgoKUHJvdmlkZSBwdXRfdXNlcl9wYWdlX2RpcnR5KCkgYW5kIHB1dF91c2VyX3Bh
Z2VfZGlydHlfbG9jaygpLAphbmQgdXNlIHRoZW0gaW4gYSBmZXcgcGxhY2VzOiBuZXQveGRwLCBk
cm0vdmlhLywgZHJpdmVycy9pbmZpbmliYW5kLgoKQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KU2lnbmVkLW9mZi1ieTogSm9obiBI
dWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlh
X2RtYWJsaXQuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5j
ICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2luZmluaWJhbmQvaHcvdXNuaWMvdXNuaWNfdWlv
bS5jIHwgIDIgKy0KIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAgICAgICAgICAgfCAx
MCArKysrKysrKysrCiBuZXQveGRwL3hkcF91bWVtLmMgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKaW5kZXggMjE5ODI3YWUxMTRmLi5kMzBiMmQ3NTU5
OWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKQEAgLTE4OSw3ICsxODksNyBAQCB2aWFf
ZnJlZV9zZ19pbmZvKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBkcm1fdmlhX3NnX2luZm9fdCAqdnNn
KQogCQlmb3IgKGkgPSAwOyBpIDwgdnNnLT5udW1fcGFnZXM7ICsraSkgewogCQkJaWYgKE5VTEwg
IT0gKHBhZ2UgPSB2c2ctPnBhZ2VzW2ldKSkgewogCQkJCWlmICghUGFnZVJlc2VydmVkKHBhZ2Up
ICYmIChETUFfRlJPTV9ERVZJQ0UgPT0gdnNnLT5kaXJlY3Rpb24pKQotCQkJCQlwdXRfdXNlcl9w
YWdlc19kaXJ0eSgmcGFnZSwgMSk7CisJCQkJCXB1dF91c2VyX3BhZ2VfZGlydHkocGFnZSk7CiAJ
CQkJZWxzZQogCQkJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCQkJfQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1l
bS5jCmluZGV4IDA4ZGE4NDBlZDdlZS4uYTczMzdjYzNjYTIwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2luZmluaWJhbmQvY29yZS91bWVtLmMKKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1l
bS5jCkBAIC01NSw3ICs1NSw3IEBAIHN0YXRpYyB2b2lkIF9faWJfdW1lbV9yZWxlYXNlKHN0cnVj
dCBpYl9kZXZpY2UgKmRldiwgc3RydWN0IGliX3VtZW0gKnVtZW0sIGludCBkCiAJZm9yX2VhY2hf
c2dfcGFnZSh1bWVtLT5zZ19oZWFkLnNnbCwgJnNnX2l0ZXIsIHVtZW0tPnNnX25lbnRzLCAwKSB7
CiAJCXBhZ2UgPSBzZ19wYWdlX2l0ZXJfcGFnZSgmc2dfaXRlcik7CiAJCWlmICh1bWVtLT53cml0
YWJsZSAmJiBkaXJ0eSkKLQkJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEpOwor
CQkJcHV0X3VzZXJfcGFnZV9kaXJ0eV9sb2NrKHBhZ2UpOwogCQllbHNlCiAJCQlwdXRfdXNlcl9w
YWdlKHBhZ2UpOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody91c25pYy91
c25pY191aW9tLmMgYi9kcml2ZXJzL2luZmluaWJhbmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5jCmlu
ZGV4IDBiMDIzN2Q0MTYxMy4uZDJkZWQ2MjRmYjJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2luZmlu
aWJhbmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5jCisrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody91
c25pYy91c25pY191aW9tLmMKQEAgLTc2LDcgKzc2LDcgQEAgc3RhdGljIHZvaWQgdXNuaWNfdWlv
bV9wdXRfcGFnZXMoc3RydWN0IGxpc3RfaGVhZCAqY2h1bmtfbGlzdCwgaW50IGRpcnR5KQogCQkJ
cGFnZSA9IHNnX3BhZ2Uoc2cpOwogCQkJcGEgPSBzZ19waHlzKHNnKTsKIAkJCWlmIChkaXJ0eSkK
LQkJCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZwYWdlLCAxKTsKKwkJCQlwdXRfdXNlcl9w
YWdlX2RpcnR5X2xvY2socGFnZSk7CiAJCQllbHNlCiAJCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsK
IAkJCXVzbmljX2RiZygicGE6ICVwYVxuIiwgJnBhKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAppbmRleCAwMzM0Y2E5N2M1ODQuLmMwNTg0YzZk
OWQ3OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgv
bW0uaApAQCAtMTA2MSw2ICsxMDYxLDE2IEBAIHZvaWQgcHV0X3VzZXJfcGFnZXNfZGlydHkoc3Ry
dWN0IHBhZ2UgKipwYWdlcywgdW5zaWduZWQgbG9uZyBucGFnZXMpOwogdm9pZCBwdXRfdXNlcl9w
YWdlc19kaXJ0eV9sb2NrKHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnBhZ2Vz
KTsKIHZvaWQgcHV0X3VzZXJfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywgdW5zaWduZWQgbG9u
ZyBucGFnZXMpOwogCitzdGF0aWMgaW5saW5lIHZvaWQgcHV0X3VzZXJfcGFnZV9kaXJ0eShzdHJ1
Y3QgcGFnZSAqcGFnZSkKK3sKKwlwdXRfdXNlcl9wYWdlc19kaXJ0eSgmcGFnZSwgMSk7Cit9CisK
K3N0YXRpYyBpbmxpbmUgdm9pZCBwdXRfdXNlcl9wYWdlX2RpcnR5X2xvY2soc3RydWN0IHBhZ2Ug
KnBhZ2UpCit7CisJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygmcGFnZSwgMSk7Cit9CisKICNp
ZiBkZWZpbmVkKENPTkZJR19TUEFSU0VNRU0pICYmICFkZWZpbmVkKENPTkZJR19TUEFSU0VNRU1f
Vk1FTU1BUCkKICNkZWZpbmUgU0VDVElPTl9JTl9QQUdFX0ZMQUdTCiAjZW5kaWYKZGlmZiAtLWdp
dCBhL25ldC94ZHAveGRwX3VtZW0uYyBiL25ldC94ZHAveGRwX3VtZW0uYwppbmRleCA5Y2JiYjk2
YzJhMzIuLjFkMTIyZTUyYzZkZSAxMDA2NDQKLS0tIGEvbmV0L3hkcC94ZHBfdW1lbS5jCisrKyBi
L25ldC94ZHAveGRwX3VtZW0uYwpAQCAtMTcxLDcgKzE3MSw3IEBAIHN0YXRpYyB2b2lkIHhkcF91
bWVtX3VucGluX3BhZ2VzKHN0cnVjdCB4ZHBfdW1lbSAqdW1lbSkKIAlmb3IgKGkgPSAwOyBpIDwg
dW1lbS0+bnBnczsgaSsrKSB7CiAJCXN0cnVjdCBwYWdlICpwYWdlID0gdW1lbS0+cGdzW2ldOwog
Ci0JCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEpOworCQlwdXRfdXNlcl9wYWdl
X2RpcnR5X2xvY2socGFnZSk7CiAJfQogCiAJa2ZyZWUodW1lbS0+cGdzKTsKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
