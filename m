Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796EDFAB87
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1590F6EC85;
	Wed, 13 Nov 2019 07:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52FB6E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:22:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o11so21202822qtr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LnkAv+iMLBMvlxFpCUEV0XkR28K5MHEmxHckti3wqpM=;
 b=aT0jvfePucuvUYt/5s/Asi7qRvpcR7I4HEXtnBDcR4021W7fVlkkDeu20lQm8UQBmY
 E06ABjA6MYRIBcCvinUiVOxndJbPIAHiQ2HZShHQZ94Hitd9H70hPT5zTaCOCxZKy2Zk
 vhI1oKZrQqUB4P8ZICsrg5sFcrIayumBocVcNus2iu8+893wTth7fd+zJ+A6J9lCFyaa
 EHJRs9UPUQ9OQBJdC5d7q5H6tQpdkAFtKyL3QNFyNSw68xZC1G+cwbrnWdSMgjBMjJmR
 CUmHpCBXZ6GZj3ZWDpH5nO61fNV43QFGhbqLYN2dQhdC6PP7Ax4H8Yl9Sronq8RCuach
 moyg==
X-Gm-Message-State: APjAAAXtJEVa+jccx72kDy8QmVEsj1ov9aozeRPr/g8lxMZfxtxj28q0
 feKoRNNYKYMkBZOarEk3L0gN8Q==
X-Google-Smtp-Source: APXvYqw6qliK2wZJ/FUk7ArzuqacA0YzehJQI0koFeIUELWZpshcb9zAxOBz88vcUQ7sqd+EHHHmrw==
X-Received: by 2002:ac8:60da:: with SMTP id i26mr34434892qtm.43.1573590173007; 
 Tue, 12 Nov 2019 12:22:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id a70sm4290549qkg.1.2019.11.12.12.22.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003kT-JQ; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v3 10/14] drm/amdgpu: Call find_vma under mmap_sem
Date: Tue, 12 Nov 2019 16:22:27 -0400
Message-Id: <20191112202231.3856-11-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112202231.3856-1-jgg@ziepe.ca>
References: <20191112202231.3856-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LnkAv+iMLBMvlxFpCUEV0XkR28K5MHEmxHckti3wqpM=;
 b=j2l7IUJdqB5K/eDQVUavlGzX7aJ/ZiPkS1yEN2IJtHVZrrCehSLhfQr7M+8cMjxgCr
 ZscponRTH+KICL748W2mp4Sqz3kyUnHh62I2CS0yQvwd24pGk5OnQ3+I/QxcyS7voy6J
 GvhBrTWztilOuY+S2RfoGj+IE1GYk7niaam0rTVWWRk2c/xKYBa3LSRGpsqijaidDvht
 qXeYOwWb+eFndzehMcQtUDxSnuQAzllrqQMMQa/pIhD5iEHz9mX5deTKSKMKCEXrTIFD
 ZjwFpobxsN/NtOgIGZiooNAHBZUyhl3c/c1AvOqey8/ZP0YvuN7STvUkXVmoCwyCq0j3
 iOJg==
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
Cc: Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
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
b3JrZXIgdGhyZWFkcyIpCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgpU
ZXN0ZWQtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMzcgKysrKysrKysrKysrKystLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCBkZmY0MWQwYTg1ZmU5Ni4uYzBl
NDFmMWYwYzIzNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAg
LTM1LDYgKzM1LDcgQEAKICNpbmNsdWRlIDxsaW51eC9obW0uaD4KICNpbmNsdWRlIDxsaW51eC9w
YWdlbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgorI2luY2x1ZGUgPGxpbnV4
L3NjaGVkL21tLmg+CiAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvc3dhcC5oPgpAQCAtNzg4LDcgKzc4OSw3IEBAIGlu
dCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzKQogCXN0cnVjdCBobW1fbWlycm9yICptaXJyb3IgPSBiby0+bW4gPyAm
Ym8tPm1uLT5taXJyb3IgOiBOVUxMOwogCXN0cnVjdCB0dG1fdHQgKnR0bSA9IGJvLT50Ym8udHRt
OwogCXN0cnVjdCBhbWRncHVfdHRtX3R0ICpndHQgPSAodm9pZCAqKXR0bTsKLQlzdHJ1Y3QgbW1f
c3RydWN0ICptbSA9IGd0dC0+dXNlcnRhc2stPm1tOworCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwog
CXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBndHQtPnVzZXJwdHI7CiAJc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWE7CiAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2U7CkBAIC03OTYsMjUgKzc5NywxNCBA
QCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywg
c3RydWN0IHBhZ2UgKipwYWdlcykKIAl1aW50NjRfdCAqcGZuczsKIAlpbnQgciA9IDA7CiAKLQlp
ZiAoIW1tKSAvKiBIYXBwZW5zIGR1cmluZyBwcm9jZXNzIHNodXRkb3duICovCi0JCXJldHVybiAt
RVNSQ0g7Ci0KIAlpZiAodW5saWtlbHkoIW1pcnJvcikpIHsKIAkJRFJNX0RFQlVHX0RSSVZFUigi
RmFpbGVkIHRvIGdldCBobW1fbWlycm9yXG4iKTsKLQkJciA9IC1FRkFVTFQ7Ci0JCWdvdG8gb3V0
OworCQlyZXR1cm4gLUVGQVVMVDsKIAl9CiAKLQl2bWEgPSBmaW5kX3ZtYShtbSwgc3RhcnQpOwot
CWlmICh1bmxpa2VseSghdm1hIHx8IHN0YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsKLQkJciA9IC1F
RkFVTFQ7Ci0JCWdvdG8gb3V0OwotCX0KLQlpZiAodW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYg
QU1ER1BVX0dFTV9VU0VSUFRSX0FOT05PTkxZKSAmJgotCQl2bWEtPnZtX2ZpbGUpKSB7Ci0JCXIg
PSAtRVBFUk07Ci0JCWdvdG8gb3V0OwotCX0KKwltbSA9IG1pcnJvci0+aG1tLT5tbXVfbm90aWZp
ZXIubW07CisJaWYgKCFtbWdldF9ub3RfemVybyhtbSkpIC8qIEhhcHBlbnMgZHVyaW5nIHByb2Nl
c3Mgc2h1dGRvd24gKi8KKwkJcmV0dXJuIC1FU1JDSDsKIAogCXJhbmdlID0ga3phbGxvYyhzaXpl
b2YoKnJhbmdlKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKHVubGlrZWx5KCFyYW5nZSkpIHsKQEAgLTg0
Nyw2ICs4MzcsMTcgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFt
ZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMpCiAJaG1tX3JhbmdlX3dhaXRfdW50aWxf
dmFsaWQocmFuZ2UsIEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQpOwogCiAJZG93bl9yZWFkKCZt
bS0+bW1hcF9zZW0pOworCXZtYSA9IGZpbmRfdm1hKG1tLCBzdGFydCk7CisJaWYgKHVubGlrZWx5
KCF2bWEgfHwgc3RhcnQgPCB2bWEtPnZtX3N0YXJ0KSkgeworCQlyID0gLUVGQVVMVDsKKwkJZ290
byBvdXRfdW5sb2NrOworCX0KKwlpZiAodW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BV
X0dFTV9VU0VSUFRSX0FOT05PTkxZKSAmJgorCQl2bWEtPnZtX2ZpbGUpKSB7CisJCXIgPSAtRVBF
Uk07CisJCWdvdG8gb3V0X3VubG9jazsKKwl9CisKIAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdl
LCAwKTsKIAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwogCkBAIC04NjUsMTUgKzg2NiwxOSBAQCBp
bnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3Ry
dWN0IHBhZ2UgKipwYWdlcykKIAl9CiAKIAlndHQtPnJhbmdlID0gcmFuZ2U7CisJbW1wdXQobW0p
OwogCiAJcmV0dXJuIDA7CiAKK291dF91bmxvY2s6CisJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsK
IG91dF9mcmVlX3BmbnM6CiAJaG1tX3JhbmdlX3VucmVnaXN0ZXIocmFuZ2UpOwogCWt2ZnJlZShw
Zm5zKTsKIG91dF9mcmVlX3JhbmdlczoKIAlrZnJlZShyYW5nZSk7CiBvdXQ6CisJbW1wdXQobW0p
OwogCXJldHVybiByOwogfQogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
