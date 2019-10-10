Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5952AD2A9B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7522F6EB32;
	Thu, 10 Oct 2019 13:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22676EB2B;
 Thu, 10 Oct 2019 13:14:36 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 7so6153368ljw.7;
 Thu, 10 Oct 2019 06:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7uV6DWb+5d+72lobYH9RlUHuo93UKxieqoJDmd2AkLE=;
 b=HWnpNNcSnogfiX0bECF/ibjJ4yQ+n11S8Y7WvLbsdqccZ1oOYH58wwsdHigxfbacJi
 BfNFgmSOEEe5YxuvDWaY0MuKqkbWU+j9HGAncNfZvixW1GvE6WYtwoPd22mWdlNQO/wH
 HtIFJ+PSmLrLZFezwb/F86nDqHH7MoAbXBXO4Ut24ZEt1u6NizGTTCtrINIjbXPnHq3U
 Hksl3As3UIK6juBrXWQhJyPUtOiuhnc9xflpKnaxLmHVuH1OMZutJU+2DoZmsS2oiu8W
 v7KL61SFCE3ZwHxpDhgJFOy8XXEzULJ6vcJuEHX3aKkt3+s/ooKFF7f+HHNrmc1Qub/1
 Xd+g==
X-Gm-Message-State: APjAAAUouiiHrNtORtCN/0rgZiRkCeACl83GXiT/tLrmAHDbFnwV1CpO
 Nkb/65t3XfQGPTa8IGl2r0Y=
X-Google-Smtp-Source: APXvYqzFKhC+O0enYQEtd6+xCyXriydLhbwo0jiMAK6X/4MJHrEhzIRCF056ErjC0uEfoKkbTLxJHw==
X-Received: by 2002:a2e:8ec2:: with SMTP id e2mr5820909ljl.126.1570713275165; 
 Thu, 10 Oct 2019 06:14:35 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id k7sm1184634lja.19.2019.10.10.06.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:14:34 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@xi.terra>)
 id 1iIYHF-0006Ak-Dh; Thu, 10 Oct 2019 15:14:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>
Subject: [PATCH 1/4] drm/msm: fix memleak on release
Date: Thu, 10 Oct 2019 15:13:30 +0200
Message-Id: <20191010131333.23635-2-johan@kernel.org>
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
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYSBwcm9jZXNzIGlzIGludGVycnVwdGVkIHdoaWxlIGFjY2Vzc2luZyB0aGUgImdwdSIgZGVi
dWdmcyBmaWxlIGFuZAp0aGUgZHJtIGRldmljZSBzdHJ1Y3RfbXV0ZXggaXMgY29udGVuZGVkLCBy
ZWxlYXNlKCkgY291bGQgcmV0dXJuIGVhcmx5CmFuZCBmYWlsIHRvIGZyZWUgcmVsYXRlZCByZXNv
dXJjZXMuCgpOb3RlIHRoYXQgdGhlIHJldHVybiB2YWx1ZSBmcm9tIHJlbGVhc2UoKSBpcyBpZ25v
cmVkLgoKRml4ZXM6IDRmNzc2ZjQ1MTFjNyAoImRybS9tc20vZ3B1OiBDb252ZXJ0IHRoZSBHUFUg
c2hvdyBmdW5jdGlvbiB0byB1c2UgdGhlIEdQVSBzdGF0ZSIpCkNjOiBzdGFibGUgPHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmc+ICAgICAjIDQuMTgKQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29k
ZWF1cm9yYS5vcmc+CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kZWJ1Z2ZzLmMgfCA2ICstLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2RlYnVnZnMuYwppbmRleCA2
YmU4Nzk1NzgxNDAuLjFjNzQzODFhNGZjOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2RlYnVnZnMuYwpA
QCAtNDcsMTIgKzQ3LDggQEAgc3RhdGljIGludCBtc21fZ3B1X3JlbGVhc2Uoc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpCiAJc3RydWN0IG1zbV9ncHVfc2hvd19wcml2ICpz
aG93X3ByaXYgPSBtLT5wcml2YXRlOwogCXN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPSBz
aG93X3ByaXYtPmRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IG1zbV9ncHUgKmdwdSA9IHByaXYt
PmdwdTsKLQlpbnQgcmV0OwotCi0JcmV0ID0gbXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZzaG93
X3ByaXYtPmRldi0+c3RydWN0X211dGV4KTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwogCisJ
bXV0ZXhfbG9jaygmc2hvd19wcml2LT5kZXYtPnN0cnVjdF9tdXRleCk7CiAJZ3B1LT5mdW5jcy0+
Z3B1X3N0YXRlX3B1dChzaG93X3ByaXYtPnN0YXRlKTsKIAltdXRleF91bmxvY2soJnNob3dfcHJp
di0+ZGV2LT5zdHJ1Y3RfbXV0ZXgpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
