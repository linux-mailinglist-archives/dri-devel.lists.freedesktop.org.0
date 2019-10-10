Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC4D2A9E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0BC6EB31;
	Thu, 10 Oct 2019 13:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB296EB36;
 Thu, 10 Oct 2019 13:14:39 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v24so6178744ljj.3;
 Thu, 10 Oct 2019 06:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1+YBubYAy3yg+TIRBWGGXrMgcLsTM12YLsh849J2aI=;
 b=Hc4BUbVAJvpxCgPsl2SKlk2UXzfLYFVIr2ATS65WZft3mP5VinSEJZf2kLDNuMIJBJ
 9zHcbaqP0OsMRRKP1QuabSlB6z+3ICQpj1Wl18eqg2WoWwV7eu+qx+lKcWy3sYZqKu2J
 RxqDp5H/Zj3FO5P67tG/KrUISc7wbHDzbx+uS3A2WqUgfuqJv9QUc/uJRH1OqoOAN7jf
 wa03PaWU7hylrbRQeC8uU1q+6x0oPtRc2C31Pse1A77lyGbBVn1WkUPYg+ITY8QRnW8m
 tJrNMFzVN0tjIVoxs/XlSAdnP2LEaGcFuO8Ev325Pcukf4nNJn+o63myug47eePq3q6H
 ljrw==
X-Gm-Message-State: APjAAAVVmg/xUSJAVceIjy7Rk3TIjsI+6vVu6/MIyRc8CF7Gq8Ob+ZDs
 rNUxT5rSR5d1gqNSTQStdH8=
X-Google-Smtp-Source: APXvYqyGy/J5HJ8vBpZO6LgQKgo1ma21ffDHecTu24LtFMjl2KdmKbxfJ1wNcSxoN50D6wfsye9EWA==
X-Received: by 2002:a2e:964c:: with SMTP id z12mr6158807ljh.79.1570713277523; 
 Thu, 10 Oct 2019 06:14:37 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id h3sm1238457lfc.26.2019.10.10.06.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:14:35 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@xi.terra>)
 id 1iIYHF-0006Az-Mh; Thu, 10 Oct 2019 15:14:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>
Subject: [PATCH 4/4] s390/zcrypt: fix memleak at release
Date: Thu, 10 Oct 2019 15:13:33 +0200
Message-Id: <20191010131333.23635-5-johan@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYSBwcm9jZXNzIGlzIGludGVycnVwdGVkIHdoaWxlIGFjY2Vzc2luZyB0aGUgY3J5cHRvIGRl
dmljZSBhbmQgdGhlCmdsb2JhbCBhcF9wZXJtc19tdXRleCBpcyBjb250ZW50ZWQsIHJlbGVhc2Uo
KSBjb3VsZCByZXR1cm4gZWFybHkgYW5kCmZhaWwgdG8gZnJlZSByZWxhdGVkIHJlc291cmNlcy4K
CkZpeGVzOiAwMGZhYjIzNTBlNmIgKCJzMzkwL3pjcnlwdDogbXVsdGlwbGUgemNyeXB0IGRldmlj
ZSBub2RlcyBzdXBwb3J0IikKQ2M6IHN0YWJsZSA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gICAg
ICMgNC4xOQpDYzogSGFyYWxkIEZyZXVkZW5iZXJnZXIgPGZyZXVkZUBsaW51eC5pYm0uY29tPgpD
YzogTWFydGluIFNjaHdpZGVmc2t5IDxzY2h3aWRlZnNreUBkZS5pYm0uY29tPgpTaWduZWQtb2Zm
LWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9zMzkwL2Ny
eXB0by96Y3J5cHRfYXBpLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9jcnlwdG8vemNyeXB0
X2FwaS5jIGIvZHJpdmVycy9zMzkwL2NyeXB0by96Y3J5cHRfYXBpLmMKaW5kZXggNDViZGI0N2Y4
NGMxLi45MTU3ZTcyOGEzNjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jcnlwdG8vemNyeXB0
X2FwaS5jCisrKyBiL2RyaXZlcnMvczM5MC9jcnlwdG8vemNyeXB0X2FwaS5jCkBAIC01MjIsOCAr
NTIyLDcgQEAgc3RhdGljIGludCB6Y3J5cHRfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBz
dHJ1Y3QgZmlsZSAqZmlscCkKIAlpZiAoZmlscC0+Zl9pbm9kZS0+aV9jZGV2ID09ICZ6Y3J5cHRf
Y2RldikgewogCQlzdHJ1Y3QgemNkbl9kZXZpY2UgKnpjZG5kZXY7CiAKLQkJaWYgKG11dGV4X2xv
Y2tfaW50ZXJydXB0aWJsZSgmYXBfcGVybXNfbXV0ZXgpKQotCQkJcmV0dXJuIC1FUkVTVEFSVFNZ
UzsKKwkJbXV0ZXhfbG9jaygmYXBfcGVybXNfbXV0ZXgpOwogCQl6Y2RuZGV2ID0gZmluZF96Y2Ru
ZGV2X2J5X2RldnQoZmlscC0+Zl9pbm9kZS0+aV9yZGV2KTsKIAkJbXV0ZXhfdW5sb2NrKCZhcF9w
ZXJtc19tdXRleCk7CiAJCWlmICh6Y2RuZGV2KSB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
