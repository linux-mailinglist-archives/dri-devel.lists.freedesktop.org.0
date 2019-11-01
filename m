Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C894EC37A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 14:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5A66E21F;
	Fri,  1 Nov 2019 13:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435D96E21E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 13:05:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 11so9299552wmk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 06:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ll9eeyCkfU/EMzR1UDcgIxHkDALIOtrpeq3qFTQ/A3g=;
 b=hnfGKIIKuDRMW9jabp7F3b1HSJcOHvcxFx7eLl14MBGgk07RjxbCICdLSaryaHRzjt
 XlLqWmS2me2ZGJpAHfHKwDPEK/hqBAmh7WhxpzCBt68lyjz5t9PKVuir9w/FqupC+ikg
 C0MBnO6aE1AIqaGSVodsrpoleSkVNteWw7B5rvkaYxGU7SEMH9aSvtIvzKYskoZMuwZd
 61GSkUQ9MqCkEHt2ToqgIw2t4/p1t2TThYGNfy+h48aoh8cOEe9T60p8OuMWamWicg3d
 E62Xhm2Api7lMCGb9frh2uQ/yRyj1zlHUzAmT+eEZ9TEQ9r0FuNTMHiU6XOcWXtgfPgB
 GzzA==
X-Gm-Message-State: APjAAAVKAN4697Rl7kHXcAY5MnaF77SpegkrJKGeOrHlvDMi0Kc0gWxW
 +RmcIsnFs5Vm9PwwZRfrmeKwUhWC
X-Google-Smtp-Source: APXvYqw9ZK4XM7bgq9LfycVRO4MO2UCIUO/mA3mwniyNaY/oO5tCz3U3jcF1s2XUnCgOcgEKVRkgdQ==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr8250573wmi.141.1572613508560; 
 Fri, 01 Nov 2019 06:05:08 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id a15sm2450562wmm.12.2019.11.01.06.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 06:05:07 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vmwgfx: check master authentication in surface_ref
 ioctls
Date: Fri,  1 Nov 2019 13:03:10 +0000
Message-Id: <20191101130313.8862-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101130313.8862-1-emil.l.velikov@gmail.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ll9eeyCkfU/EMzR1UDcgIxHkDALIOtrpeq3qFTQ/A3g=;
 b=YqJMzMQkn6Gci/rGM1NxNVkt6VenoqsAhC27NhEKC43F4CJ9Fo3EKnhfqpsHeHah/H
 W8bpTl4Wysl5b6LcxKHOT+SSxP3EtqbPsoPr+wAo8PM2L1Px/inxLY62k094Xf3uEMxZ
 c0V6STJmAYeeJfUykl9/npyUKyR9In5oLvTfPCXJHqNrGWAov+s+v5Ns18CRJrT1/ip/
 O/NVISvqyEJVmDXSd7qp7ObqylXnqc/yhYdndPQUBsIdKueiTrpxq4DO/Sx2J6CrhRSk
 pwUSMdqFI4FhjV7Vq3HEC/rHYKNQZPVvVVoV43ywxqF4/6Un6sRZumURr9erci579odo
 qUIg==
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
ZXIgY29tbWl0IHdlJ2xsIHJld29yayBEUk0gYXV0aGVudGljYXRpb24gaGFuZGxpbmcuIE5hbWVs
eQpEUk1fQVVUSCB3aWxsIG5vdCBiZSBhIHJlcXVpcmVtZW50IGZvciBEUk1fUkVOREVSX0FMTE9X
IGlvY3Rscy4KClNpbmNlIHZtd2dmeCBkb2VzIGlzb2xhdGlvbiBmb3IgcHJpbWFyeSBjbGllbnRz
IGluIGRpZmZlcmVudCBtYXN0ZXIKcmVhbG1zLCB0aGUgRFJNX0FVVEggY2FuIGJlIGRyb3BwZWQu
CgpUaGUgb25seSBwbGFjZSB3aGVyZSBhdXRoZW50aWNhdGlvbiBtYXR0ZXJzLCBpcyBzdXJmYWNl
X3JlZmVyZW5jZSBpb2N0bHMKd2hlbmV2ZXIgYSBsZWdhY3kgKG5vbi1wcmltZSkgaGFuZGxlIGlz
IHVzZWQuIEZvciB0aG9zZSBpb2N0bHMgd2UgY2FsbAp2bXdfc3VyZmFjZV9oYW5kbGVfcmVmZXJl
bmNlKCksIHdoZXJlIHdlIGV4cGxpY2l0bHkgY2hlY2sgaWYgdGhlIGNsaWVudAppcyBib3RoIGEp
IG1hc3RlciBhbmQgYikgdW5hdXRoZW50aWNhdGVkIC0gYmFpbGluZyBvdXQgYXMgcmVzdWx0LgoK
T3RoZXJ3aXNlIHRoZSB1c3VhbCBpc29sYXRpb24gcGF0aCBraWNrcyBpbiBhbmQgd2UncmUgYWxs
IGdvb2QuCgp2MjogUmV3b3JkIGNvbW1pdCBtZXNzYWdlLCBzaW5jZSB0aGUgaXNvbGF0aW9uIHdv
cmsgaGFzIGxhbmRlZC4KCkNjOiBWTXdhcmUgR3JhcGhpY3MgPGxpbnV4LWdyYXBoaWNzLW1haW50
YWluZXJAdm13YXJlLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJl
LmNvbT4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3Jh
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMKaW5kZXggMWY5ODlmMzYwNWM4Li41OTZlNWMxYmMyYzEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMKQEAgLTkzNiw2ICs5MzYsMTMg
QEAgdm13X3N1cmZhY2VfaGFuZGxlX3JlZmVyZW5jZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9w
cml2LAogCQl1c2VyX3NyZiA9IGNvbnRhaW5lcl9vZihiYXNlLCBzdHJ1Y3Qgdm13X3VzZXJfc3Vy
ZmFjZSwKIAkJCQkJcHJpbWUuYmFzZSk7CiAKKwkJLyogRXJyb3Igb3V0IGlmIHdlIGFyZSB1bmF1
dGhlbnRpY2F0ZWQgbWFzdGVyICovCisJCWlmIChkcm1faXNfcHJpbWFyeV9jbGllbnQoZmlsZV9w
cml2KSAmJgorCQkgICAgIWZpbGVfcHJpdi0+YXV0aGVudGljYXRlZCkgeworCQkJcmV0ID0gLUVB
Q0NFUzsKKwkJCWdvdG8gb3V0X2JhZF9yZXNvdXJjZTsKKwkJfQorCiAJCS8qCiAJCSAqIE1ha2Ug
c3VyZSB0aGUgc3VyZmFjZSBjcmVhdG9yIGhhcyB0aGUgc2FtZQogCQkgKiBhdXRoZW50aWNhdGlu
ZyBtYXN0ZXIsIG9yIGlzIGFscmVhZHkgcmVnaXN0ZXJlZCB3aXRoIHVzLgotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
