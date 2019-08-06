Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DB834A1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493576E3BB;
	Tue,  6 Aug 2019 15:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D76E3BB;
 Tue,  6 Aug 2019 15:01:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p17so88224964wrf.11;
 Tue, 06 Aug 2019 08:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e09g/esR6Gc/6veKI4tptZ2siOvKJFGhd59QLPFyqW4=;
 b=ajsnRlvkyF5Ek7/ckfgBOPNEd9NDNJAOcehfPHQtok2TqIVvYRAdLVLAQoasIxCvFY
 XiZdihXMdW5+QQbYUIsaxb5LGDtG5405Rei0NjfaYzWHGCoONUq0ioYggX37KJLrUDkg
 Cy5zsF617kR4DGY4xdl6SFbA3sazbjIUfZfkFtHenC+td2DrDeBJtxe74RE3Bf2UdWRf
 atKbV0qxCVB3kgspB8ccXnl4H1U08RBcHeYF9IWhIFCdEwXvsv16gBPmDMIY0n35MvVL
 UTmFojCQyxXdEVZBjlq+V5AqQdw+srRGm88JnME8/UkBrmpF9kKMEdze8H8SjvVDhdaP
 sdXA==
X-Gm-Message-State: APjAAAXAYTskv1ud1xeCUbPNbrGOapMrSNUvYvC5y3QqBN3Lxf070gsH
 20WB5g0Jlno1/+tzKJegWUMV0ZGm
X-Google-Smtp-Source: APXvYqxKVmwwaUkn9/+Ffdy8aAG3yGbikgU2djIIvoaLAmTQLo3pQr2c0LuucLBpvEKnEuOoSutCEw==
X-Received: by 2002:a05:6000:112:: with SMTP id
 o18mr5520412wrx.153.1565103699969; 
 Tue, 06 Aug 2019 08:01:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d1e0:fffc:b0e3:c66d])
 by smtp.gmail.com with ESMTPSA id g2sm78766828wmh.0.2019.08.06.08.01.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 08:01:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Subject: [PATCH 5/8] dma-buf: further relax reservation_object_add_shared_fence
Date: Tue,  6 Aug 2019 17:01:31 +0200
Message-Id: <20190806150134.104222-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806150134.104222-1-christian.koenig@amd.com>
References: <20190806150134.104222-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e09g/esR6Gc/6veKI4tptZ2siOvKJFGhd59QLPFyqW4=;
 b=fpcKxPtS0XqaSscchhZzfKShzEYp2CXEXkpNM3xgvfd0gYScSfd1ebPFxlAZ8n00an
 JEOf5YYhrMtgIMiS8uQY1IY6bQZF0SKw77BpdcSK5sPC7iz8QZ+6po6sOL2tHfz7zVgi
 rQ4c7u+/m8Dlnym45AfqwQ2r5uU1mM9KLpfQT+qdyNVYxpXvpNhsuXrP2R/oaJYM49to
 ytR0v24YUPxTsc1U1nK1M7y/+gFzRrtF6aBBk/fx+zoOMiG9iAxgnH5m+UKWjgd7HWKT
 dxgLpgZrM+d2t4jGyxURXtS2Z3ghOlOPKOTHwHSYmhB0TM6jSAftcGhvb3JmAwHUoE+Y
 IsxQ==
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

T3RoZXIgY29yZXMgZG9uJ3QgYnVzeSB3YWl0IGFueSBtb3JlIGFuZCB3ZSByZW1vdmVkIHRoZSBs
YXN0IHVzZXIgb2YgY2hlY2tpbmcKdGhlIHNlcW5vIGZvciBjaGFuZ2VzLiBEcm9wIHVwZGF0aW5n
IHRoZSBudW1iZXIgZm9yIHNoYXJlZCBmZW5jZXMgYWx0b2dldGhlci4KClNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2RtYS1idWYvcmVzZXJ2YXRpb24uYyAgICAgICAgICAgICAgICAgICAgfCA2IC0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgNyArLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9y
ZXNlcnZhdGlvbi5jCmluZGV4IGMwYmEwNTkzNmFiNi4uOTQ0ZDk2MmRkZGRmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYworKysgYi9kcml2ZXJzL2RtYS1idWYvcmVz
ZXJ2YXRpb24uYwpAQCAtMjM3LDkgKzIzNyw2IEBAIHZvaWQgcmVzZXJ2YXRpb25fb2JqZWN0X2Fk
ZF9zaGFyZWRfZmVuY2Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCWZvYmogPSBy
ZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2xpc3Qob2JqKTsKIAljb3VudCA9IGZvYmotPnNoYXJlZF9j
b3VudDsKIAotCXByZWVtcHRfZGlzYWJsZSgpOwotCXdyaXRlX3NlcWNvdW50X2JlZ2luKCZvYmot
PnNlcSk7Ci0KIAlmb3IgKGkgPSAwOyBpIDwgY291bnQ7ICsraSkgewogCiAJCW9sZCA9IHJjdV9k
ZXJlZmVyZW5jZV9wcm90ZWN0ZWQoZm9iai0+c2hhcmVkW2ldLApAQCAtMjU3LDkgKzI1NCw2IEBA
IHZvaWQgcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2Uoc3RydWN0IHJlc2VydmF0
aW9uX29iamVjdCAqb2JqLAogCVJDVV9JTklUX1BPSU5URVIoZm9iai0+c2hhcmVkW2ldLCBmZW5j
ZSk7CiAJLyogcG9pbnRlciB1cGRhdGUgbXVzdCBiZSB2aXNpYmxlIGJlZm9yZSB3ZSBleHRlbmQg
dGhlIHNoYXJlZF9jb3VudCAqLwogCXNtcF9zdG9yZV9tYihmb2JqLT5zaGFyZWRfY291bnQsIGNv
dW50KTsKLQotCXdyaXRlX3NlcWNvdW50X2VuZCgmb2JqLT5zZXEpOwotCXByZWVtcHRfZW5hYmxl
KCk7CiAJZG1hX2ZlbmNlX3B1dChvbGQpOwogfQogRVhQT1JUX1NZTUJPTChyZXNlcnZhdGlvbl9v
YmplY3RfYWRkX3NoYXJlZF9mZW5jZSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5kZXggZmUwNjJiNzZlYzkxLi5hNDY0MGRkYzI0ZDEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1
dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKQEAgLTI1MSwxMiArMjUxLDcgQEAgc3RhdGljIGludCBhbWRncHVfYW1ka2ZkX3JlbW92ZV9l
dmljdGlvbl9mZW5jZShzdHJ1Y3QgYW1kZ3B1X2JvICpibywKIAluZXctPnNoYXJlZF9tYXggPSBv
bGQtPnNoYXJlZF9tYXg7CiAJbmV3LT5zaGFyZWRfY291bnQgPSBrOwogCi0JLyogSW5zdGFsbCB0
aGUgbmV3IGZlbmNlIGxpc3QsIHNlcWNvdW50IHByb3ZpZGVzIHRoZSBiYXJyaWVycyAqLwotCXBy
ZWVtcHRfZGlzYWJsZSgpOwotCXdyaXRlX3NlcWNvdW50X2JlZ2luKCZyZXN2LT5zZXEpOwotCVJD
VV9JTklUX1BPSU5URVIocmVzdi0+ZmVuY2UsIG5ldyk7Ci0Jd3JpdGVfc2VxY291bnRfZW5kKCZy
ZXN2LT5zZXEpOwotCXByZWVtcHRfZW5hYmxlKCk7CisJcmN1X2Fzc2lnbl9wb2ludGVyKHJlc3Yt
PmZlbmNlLCBuZXcpOwogCiAJLyogRHJvcCB0aGUgcmVmZXJlbmNlcyB0byB0aGUgcmVtb3ZlZCBm
ZW5jZXMgb3IgbW92ZSB0aGVtIHRvIGVmX2xpc3QgKi8KIAlmb3IgKGkgPSBqLCBrID0gMDsgaSA8
IG9sZC0+c2hhcmVkX2NvdW50OyArK2kpIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
