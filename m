Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461C5E589
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 15:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DE16E138;
	Wed,  3 Jul 2019 13:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B5A6E138
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 13:30:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p11so2838765wro.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 06:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WLXf/VCXC4rlq9YhY4PmzJ42e/EBWSBPmZlwxVdmWQ=;
 b=a+7F6ufKu07CJfDM11ctA7n7CT/8dbJ/UJ519soIqVhadNc0nMGnkyrgSEnEf1F/8v
 oEiSRkQh/CDVRwNs9ttirQf+g8nBfdjX4UuQimibxTCJlJB2iBh0JHBhKKqu5f9yIN59
 sCyyLN+v0iPpx+/K2LpNszAAgroA9wkTNZZKPZ3HcV5Wdmt52dQYIYND/TeMSiYz/EKL
 HFvz4XpTAF6Kr9s9+awPJBjUwx2Txy2K85tB9t79SzZB/GK6/K25QcUd1sTWnV2CFKOK
 lAHmrUleUN958BNmpmAbDt54mHUpPBaIWjWB+zXDUaxJgpHywC8VtVCppUEEIDo8W0eS
 f6Ug==
X-Gm-Message-State: APjAAAVtpqT/++pYzXANNg0JHOsWF1ozsAyn6n5W+3X5oxu1/NoMGHU9
 MaQXlu6zQwTSZXE3mutcNV9Xsd8m
X-Google-Smtp-Source: APXvYqyUCkd/LThAkGGf1z1VJKcVBrKl4qrWywB3lYQMQ86qrn5JWnKCNY2F6yPpbI9yUTgpgNUbYQ==
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr15266716wrw.323.1562160652105; 
 Wed, 03 Jul 2019 06:30:52 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id g10sm2353263wrw.60.2019.07.03.06.30.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 06:30:51 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/vmwgfx: check master authentication in surface_ref
 ioctls
Date: Wed,  3 Jul 2019 14:31:02 +0100
Message-Id: <20190703133104.3211-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WLXf/VCXC4rlq9YhY4PmzJ42e/EBWSBPmZlwxVdmWQ=;
 b=MWo+k8bzDd7sEhOcDIGJEA0eRhKjmBFSeevzjgU3leq1MxtV6rkzWICSNIJYuyWXPx
 6+k0VaK7vfd2zsds+AL4tU0o3q0+DQ68jg+zXsUZN/3f3eWkRD/vqvdjPNZpvAoRbZuu
 k/nibHBROOeFZFRj2JWr4jn65Mz12H5jCqNzb8lfJar9swIWoHY0+73ZMJBELDMiQhlF
 lAfHJ1NWpMAgvTnltz14Um2ZH/KWGmxHvbg6RS5b+7j4Q1bO1aCYcLq1YcEuN23PW/TQ
 7n7SKETSuRjRyj0LkzOQVbpqsaWDbXFJTGUFIQK1olGlWt8ryOoF+1dJ+BIqt+HtA3HG
 KXVw==
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
