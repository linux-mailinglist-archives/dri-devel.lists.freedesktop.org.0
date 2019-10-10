Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6243ED2A9F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594A56EB34;
	Thu, 10 Oct 2019 13:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C226EB31;
 Thu, 10 Oct 2019 13:14:38 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id w6so4365284lfl.2;
 Thu, 10 Oct 2019 06:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YiNIRjj0pudykJaz7uCOQvjxph1wvoZUlYbTUR43Ji8=;
 b=bb52yX8YwGl9jj2OkVPsUY4Fg2BcI79cF0Zj91vWReJs8Sqhs4FYhgieS+JFRgRJ21
 uvUkh58v8T4sBAbc126VlZS3AcDiiiV2i1TlbwlmSjykCz7Bp0Lx8ysUnDB4M1xy21EG
 GVoYoTJ0Os2bAFO81xwEagWUbWyAPOBhqj0l0QgBHzPEImc6ts4Jjnw+bWFSuoZ/x2B+
 yBarfLDYwTyH6L0/u0jjwFwyictj9vmC8XlGrLNCf5/P0dhYIb6+bGGwU3LmwujXXgaQ
 krcH6IgD4vDWKkwsugE9uKuT+Ly0tGe+b5W0Lm0dOQDZIuS7wxCaZ3curuosF7V+MqTa
 224A==
X-Gm-Message-State: APjAAAUj3D4MytFrn4wALDbsQVaztmWVtXbH21zkauyfy0Dxy8SvSVQR
 7PM6gRoTT14fGppSd/6JxBM=
X-Google-Smtp-Source: APXvYqyCmQVkR/2FdzzVJEX6PjL3GNGbTAsSSuxU3ZMwE47t/9gz7cSpM9BywTnZ/2vtXS5zoQXYCg==
X-Received: by 2002:a19:c392:: with SMTP id t140mr6140469lff.156.1570713276646; 
 Thu, 10 Oct 2019 06:14:36 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id f22sm1255270lfk.56.2019.10.10.06.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:14:34 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@xi.terra>)
 id 1iIYHF-0006Au-Ju; Thu, 10 Oct 2019 15:14:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>
Subject: [PATCH 3/4] media: radio: wl1273: fix interrupt masking on release
Date: Thu, 10 Oct 2019 15:13:32 +0200
Message-Id: <20191010131333.23635-4-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131333.23635-1-johan@kernel.org>
References: <20191010131333.23635-1-johan@kernel.org>
MIME-Version: 1.0
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
Cc: linux-s390@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Matti Aaltonen <matti.j.aaltonen@nokia.com>, stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYSBwcm9jZXNzIGlzIGludGVycnVwdGVkIHdoaWxlIGFjY2Vzc2luZyB0aGUgcmFkaW8gZGV2
aWNlIGFuZCB0aGUKY29yZSBsb2NrIGlzIGNvbnRlbmRlZCwgcmVsZWFzZSgpIGNvdWxkIHJldHVy
biBlYXJseSBhbmQgZmFpbCB0byB1cGRhdGUKdGhlIGludGVycnVwdCBtYXNrLgoKTm90ZSB0aGF0
IHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIHY0bDIgcmVsZWFzZSBmaWxlIG9wZXJhdGlvbiBpcwpp
Z25vcmVkLgoKRml4ZXM6IDg3ZDFhNTBjZTQ1MSAoIlttZWRpYV0gVjRMMjogV0wxMjczIEZNIFJh
ZGlvOiBUSSBXTDEyNzMgRk0gcmFkaW8gZHJpdmVyIikKQ2M6IHN0YWJsZSA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4gICAgICMgMi42LjM4CkNjOiBNYXR0aSBBYWx0b25lbiA8bWF0dGkuai5hYWx0
b25lbkBub2tpYS5jb20+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvbWVkaWEvcmFkaW8vcmFkaW8td2wxMjczLmMgfCAzICstLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcmFkaW8vcmFkaW8td2wxMjczLmMgYi9kcml2ZXJzL21lZGlhL3JhZGlvL3JhZGlvLXds
MTI3My5jCmluZGV4IDEwNGFjNDFjNmY5Ni4uMTEyMzc2ODczMTY3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL21lZGlhL3JhZGlvL3JhZGlvLXdsMTI3My5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcmFkaW8v
cmFkaW8td2wxMjczLmMKQEAgLTExNDgsOCArMTE0OCw3IEBAIHN0YXRpYyBpbnQgd2wxMjczX2Zt
X2ZvcHNfcmVsZWFzZShzdHJ1Y3QgZmlsZSAqZmlsZSkKIAlpZiAocmFkaW8tPnJkc191c2VycyA+
IDApIHsKIAkJcmFkaW8tPnJkc191c2Vycy0tOwogCQlpZiAocmFkaW8tPnJkc191c2VycyA9PSAw
KSB7Ci0JCQlpZiAobXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZjb3JlLT5sb2NrKSkKLQkJCQly
ZXR1cm4gLUVJTlRSOworCQkJbXV0ZXhfbG9jaygmY29yZS0+bG9jayk7CiAKIAkJCXJhZGlvLT5p
cnFfZmxhZ3MgJj0gfldMMTI3M19SRFNfRVZFTlQ7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
