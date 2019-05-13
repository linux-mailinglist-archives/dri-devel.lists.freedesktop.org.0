Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D91C40B
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949C58922B;
	Tue, 14 May 2019 07:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930ED89EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:46:26 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id h17so6913808pgv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=hDlLp8gwqnQ16UXEzX9Fg7JeC4W1dA1vA7VjX4loo84=;
 b=RB5hy88KnkusvtzUKfsIfZqa/o2X2Qg25gUpvNP0iZCGi5PDaSf1DiHFgG4+wJUbhS
 p9n4VonlOh073xU3cexiD6mnrXIVUfb3MHUheR/9EkF3tOiOn99ToWvUQjA+bGgkvABK
 /eoEtqRdDNak88uIuEvKfkbZHwB3fMTRMW3lOJzKbHvqKBgJBqDEHLWyOVhab94B8E3x
 RRxeICi/uNqzPq/8FHdTiID+ePvoMY7lfZOhpZ8YkPYgw5j3IQwT3vxYVOwkFNO3+xzc
 cYerRR8aaheC9/6snQvS+Hvjha7vIUzgxvtegyC2WtNVlLiBimGFRjE+oXRgX8pX1ffo
 OSKg==
X-Gm-Message-State: APjAAAXJWyJuJIsxXgFzdc1vImQKmej7x+FVGLsgF+FuWFT0lUwAdL6D
 KgU0p06qZJcj4O6n9n9lJVO8bFzb
X-Google-Smtp-Source: APXvYqzzzKQrUcOIQAOnu8TxTyv4WlQpQe+3fg6rcjWThxHbMUApW44a0tOe/dwk7j4A3kW8QMGZ+A==
X-Received: by 2002:a63:e645:: with SMTP id p5mr31283713pgj.4.1557758785882;
 Mon, 13 May 2019 07:46:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e62sm17928873pfa.50.2019.05.13.07.46.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 07:46:24 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/pl111: Initialize clock spinlock early
Date: Mon, 13 May 2019 07:46:21 -0700
Message-Id: <1557758781-23586-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=hDlLp8gwqnQ16UXEzX9Fg7JeC4W1dA1vA7VjX4loo84=;
 b=nTvATzP8y/LakwhSQ2DIU1KrlhMsKpIwBwryGeJMQIrmAnjalB6jhX7fO2R02kh8jg
 X/RdM0CtJ6rLAUfW9nMloT9NuWt6b+i609Cj8+5iHOo8pysmnrYf52+YjAqrfjUmZiyg
 /ZJK52Vi5J2nE34G3SURY8GBFUE2k5vMbrro3L1ARN9pplHxP62PaXelCyBq3xakOSf7
 2+tsUFTS3lo6D9JO7JD2vAXJ9DTL7SCmYPvCfc/M/EowNnxu3lOyIaco6JDXo3al3mFM
 r741hMrA4DcsGNtXK6ot4kHwBcLjmmjj8Z90rAJKnogexEO9DQbBRbDsnIZCWQqVKT3o
 j/iw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyB3YXJuaW5nIGlzIHNlZW4gb24gc3lzdGVtcyB3aXRoIGJyb2tlbiBjbG9j
ayBkaXZpZGVyLgoKSU5GTzogdHJ5aW5nIHRvIHJlZ2lzdGVyIG5vbi1zdGF0aWMga2V5Lgp0aGUg
Y29kZSBpcyBmaW5lIGJ1dCBuZWVkcyBsb2NrZGVwIGFubm90YXRpb24uCnR1cm5pbmcgb2ZmIHRo
ZSBsb2NraW5nIGNvcnJlY3RuZXNzIHZhbGlkYXRvci4KQ1BVOiAwIFBJRDogMSBDb21tOiBzd2Fw
cGVyIE5vdCB0YWludGVkIDUuMS4wLTA5Njk4LWcxZmIzYjUyICMxCkhhcmR3YXJlIG5hbWU6IEFS
TSBJbnRlZ3JhdG9yL0NQIChEZXZpY2UgVHJlZSkKWzxjMDAxMWJlOD5dICh1bndpbmRfYmFja3Ry
YWNlKSBmcm9tIFs8YzAwMGViYjg+XSAoc2hvd19zdGFjaysweDEwLzB4MTgpCls8YzAwMGViYjg+
XSAoc2hvd19zdGFjaykgZnJvbSBbPGMwN2QzZmQwPl0gKGR1bXBfc3RhY2srMHgxOC8weDI0KQpb
PGMwN2QzZmQwPl0gKGR1bXBfc3RhY2spIGZyb20gWzxjMDA2MGQ0OD5dIChyZWdpc3Rlcl9sb2Nr
X2NsYXNzKzB4Njc0LzB4NmY4KQpbPGMwMDYwZDQ4Pl0gKHJlZ2lzdGVyX2xvY2tfY2xhc3MpIGZy
b20gWzxjMDA1ZGUyYz5dCgkoX19sb2NrX2FjcXVpcmUrMHg2OC8weDIxMjgpCls8YzAwNWRlMmM+
XSAoX19sb2NrX2FjcXVpcmUpIGZyb20gWzxjMDA2MDQwOD5dIChsb2NrX2FjcXVpcmUrMHgxMTAv
MHgyMWMpCls8YzAwNjA0MDg+XSAobG9ja19hY3F1aXJlKSBmcm9tIFs8YzA3Zjc1NWM+XSAoX3Jh
d19zcGluX2xvY2srMHgzNC8weDQ4KQpbPGMwN2Y3NTVjPl0gKF9yYXdfc3Bpbl9sb2NrKSBmcm9t
IFs8YzA1MzZjOGM+XQoJKHBsMTExX2Rpc3BsYXlfZW5hYmxlKzB4ZjgvMHg1ZmMpCls8YzA1MzZj
OGM+XSAocGwxMTFfZGlzcGxheV9lbmFibGUpIGZyb20gWzxjMDUwMmY1ND5dCgkoZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0X21vZGVzZXRfZW5hYmxlcysweDFlYy8weDI0NCkKClNpbmNlIGNvbW1p
dCBlZWRkNjAzM2I0YzggKCJkcm0vcGwxMTE6IFN1cHBvcnQgdmFyaWFudHMgd2l0aCBicm9rZW4g
Y2xvY2sKZGl2aWRlciIpLCB0aGUgc3BpbmxvY2sgaXMgbm90IGluaXRpYWxpemVkIGlmIHRoZSBj
bG9jayBkaXZpZGVyIGlzIGJyb2tlbi4KSW5pdGlhbGl6ZSBpdCBlYXJsaWVyIHRvIGZpeCB0aGUg
cHJvYmxlbS4KCkZpeGVzOiBlZWRkNjAzM2I0YzggKCJkcm0vcGwxMTE6IFN1cHBvcnQgdmFyaWFu
dHMgd2l0aCBicm9rZW4gY2xvY2sgZGl2aWRlciIpCkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jIHwg
NSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYwppbmRleCAwYzVkMzkxZjBhOGYuLjQ1
MDE1OTdmMzBhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3Bs
YXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jCkBAIC01MzEs
MTQgKzUzMSwxNSBAQCBwbDExMV9pbml0X2Nsb2NrX2RpdmlkZXIoc3RydWN0IGRybV9kZXZpY2Ug
KmRybSkKIAkJZGV2X2Vycihkcm0tPmRldiwgIkNMQ0Q6IHVuYWJsZSB0byBnZXQgY2xjZGNsay5c
biIpOwogCQlyZXR1cm4gUFRSX0VSUihwYXJlbnQpOwogCX0KKworCXNwaW5fbG9ja19pbml0KCZw
cml2LT50aW0yX2xvY2spOworCiAJLyogSWYgdGhlIGNsb2NrIGRpdmlkZXIgaXMgYnJva2VuLCB1
c2UgdGhlIHBhcmVudCBkaXJlY3RseSAqLwogCWlmIChwcml2LT52YXJpYW50LT5icm9rZW5fY2xv
Y2tkaXZpZGVyKSB7CiAJCXByaXYtPmNsayA9IHBhcmVudDsKIAkJcmV0dXJuIDA7CiAJfQogCXBh
cmVudF9uYW1lID0gX19jbGtfZ2V0X25hbWUocGFyZW50KTsKLQotCXNwaW5fbG9ja19pbml0KCZw
cml2LT50aW0yX2xvY2spOwogCWRpdi0+aW5pdCA9ICZpbml0OwogCiAJcmV0ID0gZGV2bV9jbGtf
aHdfcmVnaXN0ZXIoZHJtLT5kZXYsIGRpdik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
