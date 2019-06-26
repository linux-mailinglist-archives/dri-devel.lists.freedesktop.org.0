Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67557CE5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295226E5C4;
	Thu, 27 Jun 2019 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0736E4B5;
 Wed, 26 Jun 2019 18:00:24 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id p10so1574081pgn.1;
 Wed, 26 Jun 2019 11:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FTgn6r6fcSmHF8w98dfXXuAN9IuTef3VgDyLMVSYVPY=;
 b=YQFSoYaHFt2ZtGGp7cpXTB/A4BiIMP6v+NqLoiDoN6TzRL2yPJreiN4MWSqG5e4Nr/
 bZWxwmkw5znbBZTjPdmmDzwhHHQRGH0i7dVCoASXUicrjj7xYQWD6UilufrzB2iizbof
 vCP/g2wgrTTlelNLNWAvKhzIBOGubyKhdimwjjOjkVfWxM70L81hzU6L6bXM6JX08Mgf
 qacuWYJmXaYhuFkTsjIRK2R9XeCb8zdFt86HfQGbFTg4ZsXVkgZLcOe0N+AQDC2eU14G
 Qei2K/iGDh3uasiQbQdmTNfQpvoCbOnHu7i8JOOCj5I6wbX869jWjeArocdPAKkzDAmG
 DZyg==
X-Gm-Message-State: APjAAAWrgFZtDAZhB0aLOM+b3CQCGM4KzT/2xzIpHnutu29xzGclh0e2
 joZsto9q+ugMk32dFfSxIKg=
X-Google-Smtp-Source: APXvYqxblxs8elOmJc/hGTQslan92I5J9OvEgxlBKcw95tBWYgQr9RXJHq6hIrs4/GYP2+H0OBX3IQ==
X-Received: by 2002:a17:90a:9503:: with SMTP id t3mr370826pjo.47.1561572024205; 
 Wed, 26 Jun 2019 11:00:24 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id v4sm20106391pff.45.2019.06.26.11.00.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 11:00:23 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: msm: Fix add_gpu_components
Date: Wed, 26 Jun 2019 11:00:15 -0700
Message-Id: <20190626180015.45242-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FTgn6r6fcSmHF8w98dfXXuAN9IuTef3VgDyLMVSYVPY=;
 b=VGr5ZXAJt+EIRsczuWIzhQbJHSaDJO4BnpDAA2L+zSr9WZQ67LAlB5Q7t8XI1Fe2CS
 O7lTk/jAw4mS/C69rYPzGuWh4IjkbRyjA5rcG0WAfbOgQRW/vLQLw8KBW8g3YHnjXYv0
 pQPmTeQyE4gRy8vXmpJ4JUWY0BRmmey+G61TPTyDU8qJSEUVuVQp08i3JOg7QTRPhMv9
 vqWbe2Q2A+TqXNrzKaUc8mPdBC8a1xE3/4n5zXNHNfMR1W3OhMUozMED4V29h2Eos7vU
 zI4/3w2G8mwYhx5MTg2bBL+wdBCXnbIbvhwnnW4Mz3cdPFEmW2FDep2Ee9TsjE+q5BAd
 JUZA==
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YWRkX2dwdV9jb21wb25lbnRzKCkgYWRkcyBmb3VuZCBHUFUgbm9kZXMgZnJvbSB0aGUgRFQgdG8g
dGhlIG1hdGNoIGxpc3QsCnJlZ2FyZGxlc3Mgb2YgdGhlIHN0YXR1cyBvZiB0aGUgbm9kZXMuICBU
aGlzIGlzIGEgcHJvYmxlbSwgYmVjYXVzZSBpZiB0aGUKbm9kZXMgYXJlIGRpc2FibGVkLCB0aGV5
IHNob3VsZCBub3QgYmUgb24gdGhlIG1hdGNoIGxpc3QgYmVjYXVzZSB0aGV5IHdpbGwKbm90IGJl
IG1hdGNoZWQuICBUaGlzIHByZXZlbnRzIGRpc3BsYXkgZnJvbSBpbml0aW5nIGlmIGEgR1BVIG5v
ZGUgaXMKZGVmaW5lZCwgYnV0IGl0J3Mgc3RhdHVzIGlzIGRpc2FibGVkLgoKRml4IHRoaXMgYnkg
Y2hlY2tpbmcgdGhlIG5vZGUncyBzdGF0dXMgYmVmb3JlIGFkZGluZyBpdCB0byB0aGUgbWF0Y2gg
bGlzdC4KCkZpeGVzOiBkYzNlYTI2NWI4NTYgKCJkcm0vbXNtOiBEcm9wIHRoZSBncHUgYmluZGlu
ZyIpClNpZ25lZC1vZmYtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIHwgMyArKy0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCmlu
ZGV4IGFiNjRhYjQ3MGRlNy4uNGFlYjg0ZjFkODc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwpAQCAt
MTI3OSw3ICsxMjc5LDggQEAgc3RhdGljIGludCBhZGRfZ3B1X2NvbXBvbmVudHMoc3RydWN0IGRl
dmljZSAqZGV2LAogCWlmICghbnApCiAJCXJldHVybiAwOwogCi0JZHJtX29mX2NvbXBvbmVudF9t
YXRjaF9hZGQoZGV2LCBtYXRjaHB0ciwgY29tcGFyZV9vZiwgbnApOworCWlmIChvZl9kZXZpY2Vf
aXNfYXZhaWxhYmxlKG5wKSkKKwkJZHJtX29mX2NvbXBvbmVudF9tYXRjaF9hZGQoZGV2LCBtYXRj
aHB0ciwgY29tcGFyZV9vZiwgbnApOwogCiAJb2Zfbm9kZV9wdXQobnApOwogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
