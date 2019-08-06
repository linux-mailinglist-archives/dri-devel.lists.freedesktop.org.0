Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B7834A0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF37E6E3C4;
	Tue,  6 Aug 2019 15:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BDB6E3C4;
 Tue,  6 Aug 2019 15:01:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a15so78545049wmj.5;
 Tue, 06 Aug 2019 08:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQ9oFDS/I3lsIGSETmAE0qxXzfKIwv2YeSX45z+1rwU=;
 b=fQVuM/A64JTGGcNOsoZ2kPEo/0ARoMoNO3jN6rijXilF0BcmyfVogqFXf6X/CAeF2m
 Lgdpn/ZWTF6+KTdGy/kLUKKsNO4zNbkYiGCEctaRoHR1xNuJ9Kp6T27KZzPBE0nMARMR
 BxVIKGNbDvBd4NMSPPMR+ADxBKw3c7/k/dwICdXpmBmyqo2wfX+se0H1C2l8rKCFs7Sn
 FJVdwbOXKcDvUb+x03Cho0fM+6JgG0yVSeZtjdSq2My3gWDNrnhVZyXMmD4sHj/YH0G6
 9PWKAfvoJTPxQBp32/8i0Jd7Rw9wwxgKRU9RCR7HTHnHMNghJiCX20+hAXtPDC+XAVs7
 iIow==
X-Gm-Message-State: APjAAAUdrfmAil9K9eWAR2kowDB6JbAma5g8r1R8Dd4R/F3Yklua3GDR
 9HvP8bwFfB0cNwcciyy9Bxk0kMp/
X-Google-Smtp-Source: APXvYqwFCBO5hyfet3W1WHFKzyIH4Ndd/neVuTx3uu0wvJrvR5qA7G120GL5TnfpgpjOWpp47xu6aA==
X-Received: by 2002:a1c:7fc3:: with SMTP id a186mr5558656wmd.151.1565103700841; 
 Tue, 06 Aug 2019 08:01:40 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d1e0:fffc:b0e3:c66d])
 by smtp.gmail.com with ESMTPSA id g2sm78766828wmh.0.2019.08.06.08.01.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 08:01:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Subject: [PATCH 6/8] dma-buf: simplify reservation_object_get_fences_rcu a bit
Date: Tue,  6 Aug 2019 17:01:32 +0200
Message-Id: <20190806150134.104222-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806150134.104222-1-christian.koenig@amd.com>
References: <20190806150134.104222-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kQ9oFDS/I3lsIGSETmAE0qxXzfKIwv2YeSX45z+1rwU=;
 b=i1cBb1BQCN0p4oigi/iL1jY9Ho82kwhliVr37bv5pVNV4lGHfgGAO5e2tp5LGhYirK
 GvjTL6iApeucBvKG2kg9ztQn5mKyjAw6BbGw6+gAadNS1A2mI4ni4s71DWfo3KQMNk85
 CKVlnqevx663JQodzTby2c5zziquL5r6oRgVQI+HL7tzMidOg2OVWIq6G4ISmVO9zPS1
 Yx+VET6ZJjOI7ICsip6/V1CYpAFrluAZEHvZq9HqFlni9TFeFVKQGcuXzTLOljSxvkJa
 IePV1EXoXoaPQXBfzhknFWitwHOMID+06JCPJMA6VmlYLMgEj5dBrjUWjsxI4jwBoT7P
 HLEw==
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

V2UgY2FuIGFkZCB0aGUgZXhjbHVzaXZlIGZlbmNlIHRvIHRoZSBsaXN0IGFmdGVyIG1ha2luZyBz
dXJlIHdlIGdvdAphIGNvbnNpc3RlbnQgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL3Jl
c2VydmF0aW9uLmMgfCAxNSArKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9y
ZXNlcnZhdGlvbi5jIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMKaW5kZXggOTQ0ZDk2
MmRkZGRmLi43NTA1ZWIyODkwMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZh
dGlvbi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jCkBAIC00NTMsMTMgKzQ1
Myw2IEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2ZlbmNlc19yY3Uoc3RydWN0IHJlc2Vy
dmF0aW9uX29iamVjdCAqb2JqLAogCQkJCWlmICghZG1hX2ZlbmNlX2dldF9yY3Uoc2hhcmVkW2ld
KSkKIAkJCQkJYnJlYWs7CiAJCQl9Ci0KLQkJCWlmICghcGZlbmNlX2V4Y2wgJiYgZmVuY2VfZXhj
bCkgewotCQkJCXNoYXJlZFtpXSA9IGZlbmNlX2V4Y2w7Ci0JCQkJZmVuY2VfZXhjbCA9IE5VTEw7
Ci0JCQkJKytpOwotCQkJCSsrc2hhcmVkX2NvdW50OwotCQkJfQogCQl9CiAKIAkJaWYgKGkgIT0g
c2hhcmVkX2NvdW50IHx8IHJlYWRfc2VxY291bnRfcmV0cnkoJm9iai0+c2VxLCBzZXEpKSB7CkBA
IC00NzQsNiArNDY3LDExIEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2ZlbmNlc19yY3Uo
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCQlyY3VfcmVhZF91bmxvY2soKTsKIAl9
IHdoaWxlIChyZXQpOwogCisJaWYgKHBmZW5jZV9leGNsKQorCQkqcGZlbmNlX2V4Y2wgPSBmZW5j
ZV9leGNsOworCWVsc2UgaWYgKGZlbmNlX2V4Y2wpCisJCXNoYXJlZFsrK3NoYXJlZF9jb3VudF0g
PSBmZW5jZV9leGNsOworCiAJaWYgKCFzaGFyZWRfY291bnQpIHsKIAkJa2ZyZWUoc2hhcmVkKTsK
IAkJc2hhcmVkID0gTlVMTDsKQEAgLTQ4MSw5ICs0NzksNiBAQCBpbnQgcmVzZXJ2YXRpb25fb2Jq
ZWN0X2dldF9mZW5jZXNfcmN1KHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwKIAogCSpw
c2hhcmVkX2NvdW50ID0gc2hhcmVkX2NvdW50OwogCSpwc2hhcmVkID0gc2hhcmVkOwotCWlmIChw
ZmVuY2VfZXhjbCkKLQkJKnBmZW5jZV9leGNsID0gZmVuY2VfZXhjbDsKLQogCXJldHVybiByZXQ7
CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChyZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2ZlbmNlc19yY3Up
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
