Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28963707A1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8384789D66;
	Mon, 22 Jul 2019 17:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0099089D66
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:40:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u25so25788159wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WLXf/VCXC4rlq9YhY4PmzJ42e/EBWSBPmZlwxVdmWQ=;
 b=O6zWc+qtpfK3HmYe41czfRjZwy2r8hIKE79IIn1sh+S+RWK2f1nTsJ5Kv2+n0ywWJF
 tq+l4CcSYuhKVatnVQit3axAZbWPxFhNcEAmH0PmEntCnXre8q5uBQoi6qLUjgTKQTCV
 prLHo6N83WKnNquiQ37P2jZmXEKNTVDhaCx5LDkxY/2NJUobyhGRz6ObhR19Ywhybnul
 aXmhB02hnmxUEaK4ZfcdokQszYx5yOGKwdaBUir+viD/K+b6xHVinBYc2ll57Sjj+ZB5
 Xmfrob4oOB8PXskjuD0PXkpUHmQ8V5zMBFFSCXkyrg67n6v6UYsX7JIrBLBMd1eqJhqT
 EzGA==
X-Gm-Message-State: APjAAAU036xD+RC7LzZvQmBiGT+E0jRxMbLRNUyg/zK8zFePgeq+CHsg
 zwFuP6jrK3bLo587Wso7byvVA7S+
X-Google-Smtp-Source: APXvYqxBUemj0LfPW0SuEbZhAVOevBPBvt4wWKQu9tsovyvWhb9M5FC7amw9aXU4d/PzPA+m8jFJUg==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr61458994wmk.36.1563817244249; 
 Mon, 22 Jul 2019 10:40:44 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b2sm51844663wrp.72.2019.07.22.10.40.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:40:43 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/vmwgfx: check master authentication in surface_ref
 ioctls
Date: Mon, 22 Jul 2019 18:40:23 +0100
Message-Id: <20190722174025.9830-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WLXf/VCXC4rlq9YhY4PmzJ42e/EBWSBPmZlwxVdmWQ=;
 b=Q+dES5Pmm2j56Y+dHXJC0nMRCyVvY5BK8u8+qr9pXVgNGJ3jMH/BMsEiSKRTWsymr1
 8DBSvIKkHZlah+zjf4eWx/xe+pYrWZPWBZ0AX3lyt2ImciDpFW8pWQ29sRugnvN5BAh/
 k/cjYltD3pWJBk9n6/K7wNQk8D+4VUQ7DOpMdS9b6PnZH9P2cthSfq02GBIHi99qWOG9
 /Ka9cf41LKbdJ8c/SAP6SZOJl9Xhkb8uCUKG3KUMEsF3Lz6K/Jts1bm3O9Fdrn0DJtDD
 l4n+Cq6McvMhVcX5bAYDfdFTfOuzQLexXXrvF7G/3W2Fgi7z0aaPNhcj+qZaR8qcRsUO
 EG6w==
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
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCldpdGggbGF0
ZXIgY29tbWl0IHdlJ2xsIHJld29yayBEUk0gY29yZSBhdXRoZW50aWNhdGlvbiBoYW5kbGluZy4K
Ck5hbWVseSB1bmF1dGhlbnRpY2F0ZWQgbWFzdGVyIHdpbGwgYmUgYWxsb3dlZCB3aXRoLCBEUk1f
QVVUSCBpb2N0bHMuClNpbmNlIHZtd2dmeCBkb2VzIGFkZGl0aW9uYWwgbWFzdGVyIGxvY2tpbmcg
YW5kIERSTV9BVVRIIGhhbmRsaW5nLCB0aGlzCndpbGwgbm90IG1hdHRlciBhbG1vc3QgYWxsIGNh
c2VzLgoKVGhlIG9ubHkgZXhjZXB0aW9uIGJlaW5nIHVzaW5nIHRoZSBsZWdhY3kgaGFuZGxlIHR5
cGUgaW4gdGhlIGZhbWlseSBvZgpzdXJmYWNlX3JlZmVyZW5jZSBpb2N0cyAtIGFsbCBoYW5kbGVk
IGJ5IHZtd19zdXJmYWNlX2hhbmRsZV9yZWZlcmVuY2UoKS4KQWRkIHRoZSBjaGVjayB0byBlbnN1
cmUgc3VjaCBjbGllbnRzIGRvIG5vdCBhY2Nlc3MgbW9yZSB0aGFuIHRoZXkgc2hvdWxkCgpDYzog
Vk13YXJlIEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+CkNj
OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+ClNpZ25lZC1vZmYtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQpJJ2QgbGlrZSB0
byBtZXJnZSB0aGlzIHRocm91Z2ggdGhlIGRybS1taXNjIHRyZWUuIEFjayBhbmQgcmIgYXJlCmFw
cHJlY2lhdGVkLgoKVGhhbmtzCkVtaWwKClVucmVsYXRlZDogd29ydGggbW92aW5nIHRoZSBpc19y
ZW5kZXJfY2xpZW50IGNoZWNrIGFsb25nc2lkZSB0aGUKaXNfcHJpbWFyeV9jbGllbnQgb25lLgot
LS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyB8IDcgKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3N1cmZhY2UuYwppbmRleCAyMTk0NzE5MDNiYzEuLjFmNTE0NmM5NTc4NSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwpAQCAtOTQwLDYgKzk0MCwxMyBAQCB2bXdf
c3VyZmFjZV9oYW5kbGVfcmVmZXJlbmNlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJ
CXVzZXJfc3JmID0gY29udGFpbmVyX29mKGJhc2UsIHN0cnVjdCB2bXdfdXNlcl9zdXJmYWNlLAog
CQkJCQlwcmltZS5iYXNlKTsKIAorCQkvKiBFcnJvciBvdXQgaWYgd2UgYXJlIHVuYXV0aGVudGlj
YXRlZCBtYXN0ZXIgKi8KKwkJaWYgKGRybV9pc19wcmltYXJ5X2NsaWVudChmaWxlX3ByaXYpICYm
CisJCSAgICAhZmlsZV9wcml2LT5hdXRoZW50aWNhdGVkKSB7CisJCQlyZXQgPSAtRUFDQ0VTOwor
CQkJZ290byBvdXRfYmFkX3Jlc291cmNlOworCQl9CisKIAkJLyoKIAkJICogTWFrZSBzdXJlIHRo
ZSBzdXJmYWNlIGNyZWF0b3IgaGFzIHRoZSBzYW1lCiAJCSAqIGF1dGhlbnRpY2F0aW5nIG1hc3Rl
ciwgb3IgaXMgYWxyZWFkeSByZWdpc3RlcmVkIHdpdGggdXMuCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
