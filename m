Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195801169E3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16F989ECD;
	Mon,  9 Dec 2019 09:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C671D6E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 05:09:04 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d199so6570502pfd.11
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 21:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2OHqcwVDr9+5ezRjBZJc/vTDH46fty81Rw45NE7AE8=;
 b=YAhFMY//Cfsm7pCdOBsmaMQZn+yojdDRmqBuFzEVFH/AaomwXT7S9CQ0OX0Kgdj2a+
 2gYapSH1PfNVrXqxoim8T0AvzWOIgOJSBRsSUvseVpD3zGMMzNW/ppqUxP2eFoJfw0sn
 voSqIyTm2fLdMT587Mun0UlKmzOyV7/M2fq9Jyh6oElaT3pt17grcHFLCjS/gha0TZ/P
 /VAX4nMGtuHXoXYhykWZGhGkwaiE6LeZIsHDPj/P4ibz9USL1+yzZ010OPebxppuhAdu
 Zl9Of6RqJ77rrpVqrT/1pWUlt8iaDMKrdOGaLT0omqTU9L6RNk6/MsxW+7cN3/MkuQG4
 Tztw==
X-Gm-Message-State: APjAAAW/FwJySfChbrLuvZCfXu7FeHyLS8m3bqcSiNor2ovUp9qlqros
 sKRGxC2vrCqEcHw5A0hAvmmkNzDGX0c=
X-Google-Smtp-Source: APXvYqznSPSBRdPUtHXJID+lr6Go5PbSAOz5w3ewSHHSZGkKfkun066IEFBVJMejkW0Qwsh7paSIiw==
X-Received: by 2002:a62:e208:: with SMTP id a8mr27642069pfi.258.1575868144048; 
 Sun, 08 Dec 2019 21:09:04 -0800 (PST)
Received: from localhost.localdomain (c-67-165-113-11.hsd1.wa.comcast.net.
 [67.165.113.11])
 by smtp.gmail.com with ESMTPSA id k15sm25752119pfg.37.2019.12.08.21.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 21:09:03 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/bridge: tc358767: Introduce
 __tc_bridge_enable/disable()
Date: Sun,  8 Dec 2019 21:08:56 -0800
Message-Id: <20191209050857.31624-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209050857.31624-1-andrew.smirnov@gmail.com>
References: <20191209050857.31624-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2OHqcwVDr9+5ezRjBZJc/vTDH46fty81Rw45NE7AE8=;
 b=ZuFj1L/RTPD6b652FRkaqTT7gYm04h8zIBfLVNE8+FpZPgecaSyfVXv7nlYgtEMdUb
 aQ32CZ7r5xP/F8PJk2QBoamtwzMr5ObsKOvRuvugrY5OxcGMAq1LGGpgqYhYBdm1UNFA
 2Q38oQHG9uRw1PGq51xSbBTlRru53smE82OV6S3VU3ZQZtsgJZmA61CX1OjDL7/KDhqV
 YlXMkL/IYYLqaKFnea2+hm6y0fCVX5XMPcK6xquKSfSWAt5aF+WoM/Rkr39MwoYj+HBE
 r0SCCRnjgfp+TWXa6BMsnATFVzNayztlB7ZBW3dxJ4Haj1E3mRUgC9fFa4qfyoKBbN7T
 mNPg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhwb3NlIHVuZGVybHlpbmcgaW1wbGVtZW50YXRpb24gb2YgYnJpZGdlJ3MgZW5hYmxlL2Rpc2Fi
bGUgZnVuY3Rpb25zLApzbyBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byB1c2UgdGhlbSBpbiBvdGhl
ciBwYXJ0cyBvZiB0aGUgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFu
ZHJldy5zbWlybm92QGdtYWlsLmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+CkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQ29y
eSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdt
YWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDMyICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA4YThkNjA1
MDIxZjAuLjNjMjUyYWUwZWU2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTIy
MiwzOSArMTIyMiw0MyBAQCBzdGF0aWMgdm9pZCB0Y19icmlkZ2VfcHJlX2VuYWJsZShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlKQogCWRybV9wYW5lbF9wcmVwYXJlKHRjLT5wYW5lbCk7CiB9CiAK
LXN0YXRpYyB2b2lkIHRjX2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkK
K3N0YXRpYyBpbnQgX190Y19icmlkZ2VfZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIHsKLQlz
dHJ1Y3QgdGNfZGF0YSAqdGMgPSBicmlkZ2VfdG9fdGMoYnJpZGdlKTsKIAlpbnQgcmV0OwogCiAJ
cmV0ID0gdGNfZ2V0X2Rpc3BsYXlfcHJvcHModGMpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9l
cnIodGMtPmRldiwgImZhaWxlZCB0byByZWFkIGRpc3BsYXkgcHJvcHM6ICVkXG4iLCByZXQpOwot
CQlyZXR1cm47CisJCXJldHVybiByZXQ7CiAJfQogCiAJcmV0ID0gdGNfbWFpbl9saW5rX2VuYWJs
ZSh0Yyk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2Vycih0Yy0+ZGV2LCAibWFpbiBsaW5rIGVu
YWJsZSBlcnJvcjogJWRcbiIsIHJldCk7Ci0JCXJldHVybjsKKwkJcmV0dXJuIHJldDsKIAl9CiAK
IAlyZXQgPSB0Y19zdHJlYW1fZW5hYmxlKHRjKTsKIAlpZiAocmV0IDwgMCkgewogCQlkZXZfZXJy
KHRjLT5kZXYsICJtYWluIGxpbmsgc3RyZWFtIHN0YXJ0IGVycm9yOiAlZFxuIiwgcmV0KTsKIAkJ
dGNfbWFpbl9saW5rX2Rpc2FibGUodGMpOwotCQlyZXR1cm47CisJCXJldHVybiByZXQ7CiAJfQog
Ci0JZHJtX3BhbmVsX2VuYWJsZSh0Yy0+cGFuZWwpOworCXJldHVybiAwOwogfQogCi1zdGF0aWMg
dm9pZCB0Y19icmlkZ2VfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQorc3RhdGlj
IHZvaWQgdGNfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogewogCXN0
cnVjdCB0Y19kYXRhICp0YyA9IGJyaWRnZV90b190YyhicmlkZ2UpOwotCWludCByZXQ7CiAKLQlk
cm1fcGFuZWxfZGlzYWJsZSh0Yy0+cGFuZWwpOworCWlmICghX190Y19icmlkZ2VfZW5hYmxlKHRj
KSkKKwkJZHJtX3BhbmVsX2VuYWJsZSh0Yy0+cGFuZWwpOworfQorCitzdGF0aWMgaW50IF9fdGNf
YnJpZGdlX2Rpc2FibGUoc3RydWN0IHRjX2RhdGEgKnRjKQoreworCWludCByZXQ7CiAKIAlyZXQg
PSB0Y19zdHJlYW1fZGlzYWJsZSh0Yyk7CiAJaWYgKHJldCA8IDApCkBAIC0xMjYzLDYgKzEyNjcs
MTYgQEAgc3RhdGljIHZvaWQgdGNfYnJpZGdlX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKIAlyZXQgPSB0Y19tYWluX2xpbmtfZGlzYWJsZSh0Yyk7CiAJaWYgKHJldCA8IDApCiAJ
CWRldl9lcnIodGMtPmRldiwgIm1haW4gbGluayBkaXNhYmxlIGVycm9yOiAlZFxuIiwgcmV0KTsK
KworCXJldHVybiByZXQ7Cit9CisKK3N0YXRpYyB2b2lkIHRjX2JyaWRnZV9kaXNhYmxlKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UpCit7CisJc3RydWN0IHRjX2RhdGEgKnRjID0gYnJpZGdlX3Rv
X3RjKGJyaWRnZSk7CisKKwlkcm1fcGFuZWxfZGlzYWJsZSh0Yy0+cGFuZWwpOworCV9fdGNfYnJp
ZGdlX2Rpc2FibGUodGMpOwogfQogCiBzdGF0aWMgdm9pZCB0Y19icmlkZ2VfcG9zdF9kaXNhYmxl
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
