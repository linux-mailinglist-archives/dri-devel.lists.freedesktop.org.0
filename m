Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF961AE6D5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D714891A8;
	Tue, 10 Sep 2019 09:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C9F89070;
 Tue, 10 Sep 2019 09:24:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t16so18645541wra.6;
 Tue, 10 Sep 2019 02:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXnobve3V1U6c58SlpIgPY0iaAr3nO9qvd1Dy4vYYZA=;
 b=NmmdqsJFvbogJXuL83RQS97H9RdTDvd9dXDF9mF4WLXEClWkZyC4bAiA6adYNB8+aD
 dy+vs0EqK2sYs5RIj1CyFlHJz4X/MAV7pqpTuhpK1j8JcEIQzIh8Imq4d9pQsGbS9Aw3
 DYf2QstV8N5sIsvPh5jx8UBTe1Jl1EH+eRerqo354vn/xtF8L5/aUdw0VhT3Dxo/uinm
 6HfTPMaQq5Gz7CYbRDAegIddeTsFg9hdP0RDUWSplwQy1HFzFw0Gvp1ed1JQNSWmssOa
 y1s2Q17mycwMupxcZkHtvSeb4fBo+345/EnJdyWtYLUEVXD4jRYOOJyPJWtUUuhY5BY/
 40wQ==
X-Gm-Message-State: APjAAAX5ZFI2ZUtgqgtzCRBHKDaq0Z0xQp52zYcoFemtTtTFAuvwM5NQ
 cqt5x13Ik/8WzRruBqEYjJIQp1sd
X-Google-Smtp-Source: APXvYqzKpAB2eo39tbfWEMCyWamBaZODVyB46BD29flA/RwMecyFTraFv7wkLPLdunlAlfpZq8bXaw==
X-Received: by 2002:adf:e488:: with SMTP id i8mr23932107wrm.20.1568107478146; 
 Tue, 10 Sep 2019 02:24:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1cd:7d57:6942:ab1b])
 by smtp.gmail.com with ESMTPSA id e12sm6107036wrw.37.2019.09.10.02.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:24:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/9] drm/amdgpu: reserve the root PD while freeing PASIDs
Date: Tue, 10 Sep 2019 11:24:30 +0200
Message-Id: <20190910092431.37471-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910092431.37471-1-christian.koenig@amd.com>
References: <20190910092431.37471-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zXnobve3V1U6c58SlpIgPY0iaAr3nO9qvd1Dy4vYYZA=;
 b=ZTUVLU0gGy1RmZGg92p2jRs8SBtPjBTU6R2h5PBYkRn4HeuuYqi90Zd/NS4WeywAyA
 F4/wFQ1ABYJS50M080NP52RVWyofJ6AcZwzQtrmbdL1utmn5lLYGVRmlfMletK2WBbp+
 RLZhTliwmUFXyWXlY44ji+dhcIeh+yVlE3VwJH7jpw8mypmv9LXLaYZVW1AQB7oju1x4
 fhhOohCZ5z4kLyWAK5YVhfZMKuEMbFpvXkoWqwrjqYwUBZDciBeBaoBHgaeNSlUjsBw9
 zAe1XV4i+nMM7WUieNWXAprL/nd0aeRWVzNHQJbuDGmHjw09TU419T7QFf7kfvVuKJX2
 AZZQ==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJlZSB0aGUgcGFzaWQgb25seSB3aGlsZSB0aGUgcm9vdCBQRCBpcyByZXNlcnZlZC4gVGhpcyBw
cmV2ZW50cyB1c2UgYWZ0ZXIKZnJlZSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGluZy4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMjAgKysrKysrKysrLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXggM2I5NTRiNTNhNDUwLi5k
YjEzZGRkNzBhOGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0y
OTQ0LDE4ICsyOTQ0LDI2IEBAIHZvaWQgYW1kZ3B1X3ZtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtKQogCXN0cnVjdCBhbWRncHVfYm9fdmFfbWFw
cGluZyAqbWFwcGluZywgKnRtcDsKIAlib29sIHBydF9maW5pX25lZWRlZCA9ICEhYWRldi0+Z21j
LmdtY19mdW5jcy0+c2V0X3BydDsKIAlzdHJ1Y3QgYW1kZ3B1X2JvICpyb290OwotCWludCBpLCBy
OworCWludCBpOwogCiAJYW1kZ3B1X2FtZGtmZF9ncHV2bV9kZXN0cm95X2NiKGFkZXYsIHZtKTsK
IAorCXJvb3QgPSBhbWRncHVfYm9fcmVmKHZtLT5yb290LmJhc2UuYm8pOworCWFtZGdwdV9ib19y
ZXNlcnZlKHJvb3QsIHRydWUpOwogCWlmICh2bS0+cGFzaWQpIHsKIAkJdW5zaWduZWQgbG9uZyBm
bGFnczsKIAogCQlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2Nr
LCBmbGFncyk7CiAJCWlkcl9yZW1vdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCB2bS0+
cGFzaWQpOwogCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lk
X2xvY2ssIGZsYWdzKTsKKwkJdm0tPnBhc2lkID0gMDsKIAl9CiAKKwlhbWRncHVfdm1fZnJlZV9w
dHMoYWRldiwgdm0sIE5VTEwpOworCWFtZGdwdV9ib191bnJlc2VydmUocm9vdCk7CisJYW1kZ3B1
X2JvX3VucmVmKCZyb290KTsKKwlXQVJOX09OKHZtLT5yb290LmJhc2UuYm8pOworCiAJZHJtX3Nj
aGVkX2VudGl0eV9kZXN0cm95KCZ2bS0+ZGlyZWN0KTsKIAlkcm1fc2NoZWRfZW50aXR5X2Rlc3Ry
b3koJnZtLT5kZWxheWVkKTsKIApAQCAtMjk4MCwxNiArMjk4OCw2IEBAIHZvaWQgYW1kZ3B1X3Zt
X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtKQog
CQlhbWRncHVfdm1fZnJlZV9tYXBwaW5nKGFkZXYsIHZtLCBtYXBwaW5nLCBOVUxMKTsKIAl9CiAK
LQlyb290ID0gYW1kZ3B1X2JvX3JlZih2bS0+cm9vdC5iYXNlLmJvKTsKLQlyID0gYW1kZ3B1X2Jv
X3Jlc2VydmUocm9vdCwgdHJ1ZSk7Ci0JaWYgKHIpIHsKLQkJZGV2X2VycihhZGV2LT5kZXYsICJM
ZWFraW5nIHBhZ2UgdGFibGVzIGJlY2F1c2UgQk8gcmVzZXJ2YXRpb24gZmFpbGVkXG4iKTsKLQl9
IGVsc2UgewotCQlhbWRncHVfdm1fZnJlZV9wdHMoYWRldiwgdm0sIE5VTEwpOwotCQlhbWRncHVf
Ym9fdW5yZXNlcnZlKHJvb3QpOwotCX0KLQlhbWRncHVfYm9fdW5yZWYoJnJvb3QpOwotCVdBUk5f
T04odm0tPnJvb3QuYmFzZS5ibyk7CiAJZG1hX2ZlbmNlX3B1dCh2bS0+bGFzdF91cGRhdGUpOwog
CWZvciAoaSA9IDA7IGkgPCBBTURHUFVfTUFYX1ZNSFVCUzsgaSsrKQogCQlhbWRncHVfdm1pZF9m
cmVlX3Jlc2VydmVkKGFkZXYsIHZtLCBpKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
