Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF4820A1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE13E6E4B1;
	Mon,  5 Aug 2019 15:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905506E4A5;
 Mon,  5 Aug 2019 15:45:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x1so35006012wrr.9;
 Mon, 05 Aug 2019 08:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v306sfwUGIVnriTquF2KCh9r0qG80xENrZcYr3yv41A=;
 b=p3QdSqp/IZB3BssJZRJDeiseUIkbyEbmHVTChgu8eWbkqg131THLOU5N1osGb4cufE
 H+B9+t2BnfDCCA2prODnZdBe8C/6MPweeiVcTaMr0wmnBOFiK4XJN9YusWhViUIIbXvM
 3i1aMIWDdViu15fONie0+A0QmWi2RG8za6XSkMgLXlr6PJdsa4AxQUunmWSD/B7ESUPn
 Jk5K3tKoqpqN1tlXBvre3Wol4NvMmVCapBxV24cS2g5jM5JD5+W2zoMmElMZCImz2kld
 Q0+QgXsBJNnnnk19S9SlLSTZZOphx52Vz9zv4zD2Zfcu/p9JXAK9dIRUhjRvjhXV2Sal
 S08Q==
X-Gm-Message-State: APjAAAUp+7Vj6Me+dbGXQBZcdoG9hEcJrjiAur8dcJES1Yg3oexsNFNI
 xxcexLxHpjJbN5y3KHN0n4TcYUua
X-Google-Smtp-Source: APXvYqyiVh4JW9BAxeQmV7Ga2Y/xwkIkFOdeQDansqXZR5hzlhxtXw4izgVGV95M9bxc9zQCbGMijQ==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr6149082wrp.292.1565019958047; 
 Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
 by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 08:45:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk
Subject: [PATCH 3/5] dma-buf: further relax reservation_object_add_shared_fence
Date: Mon,  5 Aug 2019 17:45:52 +0200
Message-Id: <20190805154554.3476-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
References: <20190805154554.3476-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v306sfwUGIVnriTquF2KCh9r0qG80xENrZcYr3yv41A=;
 b=RPl/cWr4ICJ1bdX1iZkG7X25CTPpq5Ar/WW0HcJ9gh5rqtkdD6q+0gjm3pYy80LHB7
 ELw9Df1MB3ZM5DzXGQtjdAMPwyex8IiqdGKjuXDxFrQJJiog8knuUUCzGlQJkSJcylCN
 f6E625dTHPgYBXlqgrWGSayMZAOiXy9+KK4OP95Z7YdHJOXPvABdeursdLsGzp/xy5xx
 GN51bL/l/g3eajCja5cX2Mxp5mshzDQhFo/u1rKNq67lnuK0zeaPUW0EHObGBXr90fte
 cM1CkFfovDVjZ9WVP3wjmAgeQQhpPI9AXl0WHYSzW8KxOqc2Gwi+OhPu7VHmdfjfoovC
 YuMQ==
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
L2RtYS1idWYvcmVzZXJ2YXRpb24uYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jCmluZGV4IGQ1OTIwN2NhNzJkMi4uNmVhY2E0Njkw
MDVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYworKysgYi9kcml2
ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYwpAQCAtMjA2LDkgKzIwNiw2IEBAIHZvaWQgcmVzZXJ2
YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAq
b2JqLAogCWZvYmogPSByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2xpc3Qob2JqKTsKIAljb3VudCA9
IGZvYmotPnNoYXJlZF9jb3VudDsKIAotCXByZWVtcHRfZGlzYWJsZSgpOwotCXdyaXRlX3NlcWNv
dW50X2JlZ2luKCZvYmotPnNlcSk7Ci0KIAlmb3IgKGkgPSAwOyBpIDwgY291bnQ7ICsraSkgewog
CiAJCW9sZCA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQoZm9iai0+c2hhcmVkW2ldLApAQCAt
MjI2LDkgKzIyMyw2IEBAIHZvaWQgcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2Uo
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCVJDVV9JTklUX1BPSU5URVIoZm9iai0+
c2hhcmVkW2ldLCBmZW5jZSk7CiAJLyogcG9pbnRlciB1cGRhdGUgbXVzdCBiZSB2aXNpYmxlIGJl
Zm9yZSB3ZSBleHRlbmQgdGhlIHNoYXJlZF9jb3VudCAqLwogCXNtcF9zdG9yZV9tYihmb2JqLT5z
aGFyZWRfY291bnQsIGNvdW50KTsKLQotCXdyaXRlX3NlcWNvdW50X2VuZCgmb2JqLT5zZXEpOwot
CXByZWVtcHRfZW5hYmxlKCk7CiAJZG1hX2ZlbmNlX3B1dChvbGQpOwogfQogRVhQT1JUX1NZTUJP
TChyZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZSk7Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
