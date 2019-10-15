Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94903D8984
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8C26E8DE;
	Wed, 16 Oct 2019 07:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AAC6E88A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 18:16:34 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id p1so12625736pgi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2P8/bWutEEexpXtgY3Ri54G2hYwzd51MYRSkoxVUFY=;
 b=l4/ie6JH0s2PAuxNjJ54EaOH4cUk0TEQ7FIcE1PVjYsY7SvtZqqoU4bKRpSUwkYIP5
 9sMp6wAgOR9KVH4zSrgAFQ7Jnw3XBQdrSD2jfM3I7SEAvLo+i8PPrXERmnALYRJDq6VJ
 6Fm7OEW+qDJ84/4azWH2zcZYE4Vkw6rjr1ukm7kwE1tUz4FjhgfxdyfRs66BlzgeKZcA
 qJeDT2JGVIAF7XesMHEOSB7JKKJhQJfo7zlpIdHyZm8Pf75HD688PTDU1uuHwplalKou
 LqUldtannJ4ItYHGQ8eRNoSzEeInwg2NAhD99TlKCsZKbMYjdTztvXhQX78YNF9b4UHZ
 mSfw==
X-Gm-Message-State: APjAAAVWyKcTgpZyetcunDzBolHFbABse2MKRc+VT6s1/gN3TgPyhOve
 zhBG5Fw9cTnfGKx2czDKNMYjow==
X-Google-Smtp-Source: APXvYqwvtUQJH3GpUYBytG2xLT5sSPQT5rLCc3Ie8xi2zPK4TIkuo6wjteJGwDYGFUM1QCJsNVRHNQ==
X-Received: by 2002:a62:5ec6:: with SMTP id
 s189mr39679838pfb.169.1571163394083; 
 Tue, 15 Oct 2019 11:16:34 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id o15sm14016pjs.14.2019.10.15.11.16.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:33 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002Cf-NJ; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH hmm 12/15] drm/amdgpu: Call find_vma under mmap_sem
Date: Tue, 15 Oct 2019 15:12:39 -0300
Message-Id: <20191015181242.8343-13-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2P8/bWutEEexpXtgY3Ri54G2hYwzd51MYRSkoxVUFY=;
 b=AaI6zcoXb9y8wHRXAkK1VS7bCrbUdWouuVyY6gjZrKTtcQT1f9NTbxZoCGV2igOt58
 Hoknkm4WnIkfuQk9Rp9K15Dz/ZC1/p916c32tuqr/CGeXCXN4z8DPNSjznQTdigjjDl3
 gatSw9oqkyrSqTGQ3r3g6s47kZTtPeEnB3akei3bsWFCnbAKc65GcpRB8NGeBsGmst80
 TNz3kgeYGq0EAH8hHALVUUXDSXUCc7+/icuPT8zmQDmwvqR37fPXC3iFYLqPPzHYJLWr
 IRmCNEVjik9lbYHEDBdg+ayNFKX79wsrhJv+tgs3ucEqbgNZP4YTOzO2R9UKFWjGbCVL
 mxNQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKZmluZF92bWEoKSBtdXN0
IGJlIGNhbGxlZCB1bmRlciB0aGUgbW1hcF9zZW0sIHJlb3JnYW5pemUgdGhpcyBjb2RlIHRvCmRv
IHRoZSB2bWEgY2hlY2sgYWZ0ZXIgZW50ZXJpbmcgdGhlIGxvY2suCgpGdXJ0aGVyLCBmaXggdGhl
IHVubG9ja2VkIHVzZSBvZiBzdHJ1Y3QgdGFza19zdHJ1Y3QncyBtbSwgaW5zdGVhZCB1c2UKdGhl
IG1tIGZyb20gaG1tX21pcnJvciB3aGljaCBoYXMgYW4gYWN0aXZlIG1tX2dyYWIuIEFsc28gdGhl
IG1tX2dyYWIKbXVzdCBiZSBjb252ZXJ0ZWQgdG8gYSBtbV9nZXQgYmVmb3JlIGFjcXVpcmluZyBt
bWFwX3NlbSBvciBjYWxsaW5nCmZpbmRfdm1hKCkuCgpGaXhlczogNjZjNDU1MDBiZmRjICgiZHJt
L2FtZGdwdTogdXNlIG5ldyBITU0gQVBJcyBhbmQgaGVscGVycyIpCkZpeGVzOiAwOTE5MTk1ZjJi
MGQgKCJkcm0vYW1kZ3B1OiBFbmFibGUgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyBpbiB3
b3JrZXIgdGhyZWFkcyIpCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IHwgMzcgKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwppbmRleCBkZmY0MWQwYTg1ZmU5Ni4uYzBlNDFmMWYwYzIzNjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTM1LDYgKzM1LDcgQEAKICNpbmNsdWRl
IDxsaW51eC9obW0uaD4KICNpbmNsdWRlIDxsaW51eC9wYWdlbWFwLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc2NoZWQvdGFzay5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+CiAjaW5jbHVkZSA8
bGludXgvc2VxX2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc3dhcC5oPgpAQCAtNzg4LDcgKzc4OSw3IEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2Vy
X3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQogCXN0cnVj
dCBobW1fbWlycm9yICptaXJyb3IgPSBiby0+bW4gPyAmYm8tPm1uLT5taXJyb3IgOiBOVUxMOwog
CXN0cnVjdCB0dG1fdHQgKnR0bSA9IGJvLT50Ym8udHRtOwogCXN0cnVjdCBhbWRncHVfdHRtX3R0
ICpndHQgPSAodm9pZCAqKXR0bTsKLQlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGd0dC0+dXNlcnRh
c2stPm1tOworCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwogCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBn
dHQtPnVzZXJwdHI7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAJc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2U7CkBAIC03OTYsMjUgKzc5NywxNCBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRf
dXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKIAl1
aW50NjRfdCAqcGZuczsKIAlpbnQgciA9IDA7CiAKLQlpZiAoIW1tKSAvKiBIYXBwZW5zIGR1cmlu
ZyBwcm9jZXNzIHNodXRkb3duICovCi0JCXJldHVybiAtRVNSQ0g7Ci0KIAlpZiAodW5saWtlbHko
IW1pcnJvcikpIHsKIAkJRFJNX0RFQlVHX0RSSVZFUigiRmFpbGVkIHRvIGdldCBobW1fbWlycm9y
XG4iKTsKLQkJciA9IC1FRkFVTFQ7Ci0JCWdvdG8gb3V0OworCQlyZXR1cm4gLUVGQVVMVDsKIAl9
CiAKLQl2bWEgPSBmaW5kX3ZtYShtbSwgc3RhcnQpOwotCWlmICh1bmxpa2VseSghdm1hIHx8IHN0
YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsKLQkJciA9IC1FRkFVTFQ7Ci0JCWdvdG8gb3V0OwotCX0K
LQlpZiAodW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX0FOT05P
TkxZKSAmJgotCQl2bWEtPnZtX2ZpbGUpKSB7Ci0JCXIgPSAtRVBFUk07Ci0JCWdvdG8gb3V0Owot
CX0KKwltbSA9IG1pcnJvci0+aG1tLT5tbXVfbm90aWZpZXIubW07CisJaWYgKCFtbWdldF9ub3Rf
emVybyhtbSkpIC8qIEhhcHBlbnMgZHVyaW5nIHByb2Nlc3Mgc2h1dGRvd24gKi8KKwkJcmV0dXJu
IC1FU1JDSDsKIAogCXJhbmdlID0ga3phbGxvYyhzaXplb2YoKnJhbmdlKSwgR0ZQX0tFUk5FTCk7
CiAJaWYgKHVubGlrZWx5KCFyYW5nZSkpIHsKQEAgLTg0Nyw2ICs4MzcsMTcgQEAgaW50IGFtZGdw
dV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdl
ICoqcGFnZXMpCiAJaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2UsIEhNTV9SQU5HRV9E
RUZBVUxUX1RJTUVPVVQpOwogCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOworCXZtYSA9IGZp
bmRfdm1hKG1tLCBzdGFydCk7CisJaWYgKHVubGlrZWx5KCF2bWEgfHwgc3RhcnQgPCB2bWEtPnZt
X3N0YXJ0KSkgeworCQlyID0gLUVGQVVMVDsKKwkJZ290byBvdXRfdW5sb2NrOworCX0KKwlpZiAo
dW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX0FOT05PTkxZKSAm
JgorCQl2bWEtPnZtX2ZpbGUpKSB7CisJCXIgPSAtRVBFUk07CisJCWdvdG8gb3V0X3VubG9jazsK
Kwl9CisKIAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCAwKTsKIAl1cF9yZWFkKCZtbS0+bW1h
cF9zZW0pOwogCkBAIC04NjUsMTUgKzg2NiwxOSBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNl
cl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKIAl9CiAK
IAlndHQtPnJhbmdlID0gcmFuZ2U7CisJbW1wdXQobW0pOwogCiAJcmV0dXJuIDA7CiAKK291dF91
bmxvY2s6CisJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKIG91dF9mcmVlX3BmbnM6CiAJaG1tX3Jh
bmdlX3VucmVnaXN0ZXIocmFuZ2UpOwogCWt2ZnJlZShwZm5zKTsKIG91dF9mcmVlX3JhbmdlczoK
IAlrZnJlZShyYW5nZSk7CiBvdXQ6CisJbW1wdXQobW0pOwogCXJldHVybiByOwogfQogCi0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
