Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC58455D7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5BA89791;
	Fri, 14 Jun 2019 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C520B892F2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g18so639054qkl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqqjfqwYsPO/UoPKKcnblUG+sfS41bCL5Aovzlt5Fak=;
 b=BrzbW2YseuY65QA/weSh49O0ckkADy/aJP3dIeCihlIwfHrxyZTf1me9KWj66hWCJ6
 fX7TLERA/4K0Poohd730xyjkfAERCOlrIK3DU32CzcIJ4PT9yUDl5kz1pnKK4LnYUg0R
 DkUaaSa7DbDlEAVOkiqHXuBlKoBPIE7toatJ+upYLn6WNXwC32vjOLRbH4WZ3lXOQ2mu
 k1gsFHCFRHpmXcAUGJ1kN/9MpoogMe++9C+tgHwPjxK+pArLTldLecTr3abyNdJwS1oa
 etzSQ/eoT9foPwQbA9kZOrnnxyBRlAJwP1gTSHCmUdPXALNRdD9HM4IOz1XsWXK4p7FE
 8X4w==
X-Gm-Message-State: APjAAAUErMMSFxsqnB9MtrYQLzKDLoIgeI1IvSbQA/cjZNma1Vmi/mKk
 Rn8CWeSmUgoZTVxulziYRduzHw==
X-Google-Smtp-Source: APXvYqw4a4tKkG03NQONcZyCSERYSMaSwwsyoSMJBpDffae71sBOEyhn8TO2i7nXdfVHe4fh2n7xcw==
X-Received: by 2002:a37:be41:: with SMTP id o62mr62770902qkf.356.1560473095934; 
 Thu, 13 Jun 2019 17:44:55 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id b203sm657058qkg.29.2019.06.13.17.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKr-0005Jk-MM; Thu, 13 Jun 2019 21:44:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 03/12] mm/hmm: Hold a mmgrab from hmm to mm
Date: Thu, 13 Jun 2019 21:44:41 -0300
Message-Id: <20190614004450.20252-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqqjfqwYsPO/UoPKKcnblUG+sfS41bCL5Aovzlt5Fak=;
 b=nqSoFbcl84tRTGM0WJXSa71SkzhvazEOiTJYeTLGJQq74mfUC1lqiEvr2Cco4L/nEy
 +weOauOt2ZTDcB4618svO7UVbc6fH2ldmdAwFFTugHFlngHnhlI1EIp+5Pb4DZ+cU9DH
 nCFbS0OWzHmOdR7HoiKIJusLGSKZAhdQlbxUq/KvAcwi16XKsKuEurWf26yqrEIaa3Vl
 RR10h9G3VhLECokaJc79c/MVxgdr2FpTEz0w1U1aSeyvMQnIU2P999ygE45IVDHnmpyJ
 uyVIkUfl3punGaCvwfhde1GHKE3NYN65JghNbdZrKyPDAkr38tiYFJFciWM5POtH84K2
 Ahcw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKU28gbG9uZyBhcyBhIHN0
cnVjdCBobW0gcG9pbnRlciBleGlzdHMsIHNvIHNob3VsZCB0aGUgc3RydWN0IG1tIGl0IGlzCmxp
bmtlZCB0b28uIEhvbGQgdGhlIG1tZ3JhYigpIGFzIHNvb24gYXMgYSBobW0gaXMgY3JlYXRlZCwg
YW5kIG1tZHJvcCgpIGl0Cm9uY2UgdGhlIGhtbSByZWZjb3VudCBnb2VzIHRvIHplcm8uCgpTaW5j
ZSBtbWRyb3AoKSAoaWUgYSAwIGtyZWYgb24gc3RydWN0IG1tKSBpcyBub3cgaW1wb3NzaWJsZSB3
aXRoIGEgIU5VTEwKbW0tPmhtbSBkZWxldGUgdGhlIGhtbV9obW1fZGVzdHJveSgpLgoKU2lnbmVk
LW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZpZXdlZC1ieTog
SsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8
cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBp
bnRlbC5jb20+ClRlc3RlZC1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0t
LQp2MjoKIC0gRml4IGVycm9yIHVud2luZCBwYXRocyBpbiBobW1fZ2V0X29yX2NyZWF0ZSAoSmVy
b21lL0phc29uKQotLS0KIGluY2x1ZGUvbGludXgvaG1tLmggfCAgMyAtLS0KIGtlcm5lbC9mb3Jr
LmMgICAgICAgfCAgMSAtCiBtbS9obW0uYyAgICAgICAgICAgIHwgMjIgKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5o
CmluZGV4IDFmYmE2OTc5YWRmNDYwLi4xZDk3YjZkNjJjNWJjZiAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9obW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC01NzcsMTQgKzU3Nywx
MSBAQCBzdGF0aWMgaW5saW5lIGludCBobW1fdm1hX2ZhdWx0KHN0cnVjdCBobW1fbWlycm9yICpt
aXJyb3IsCiB9CiAKIC8qIEJlbG93IGFyZSBmb3IgSE1NIGludGVybmFsIHVzZSBvbmx5ISBOb3Qg
dG8gYmUgdXNlZCBieSBkZXZpY2UgZHJpdmVyISAqLwotdm9pZCBobW1fbW1fZGVzdHJveShzdHJ1
Y3QgbW1fc3RydWN0ICptbSk7Ci0KIHN0YXRpYyBpbmxpbmUgdm9pZCBobW1fbW1faW5pdChzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKIHsKIAltbS0+aG1tID0gTlVMTDsKIH0KICNlbHNlIC8qIElTX0VO
QUJMRUQoQ09ORklHX0hNTV9NSVJST1IpICovCi1zdGF0aWMgaW5saW5lIHZvaWQgaG1tX21tX2Rl
c3Ryb3koc3RydWN0IG1tX3N0cnVjdCAqbW0pIHt9CiBzdGF0aWMgaW5saW5lIHZvaWQgaG1tX21t
X2luaXQoc3RydWN0IG1tX3N0cnVjdCAqbW0pIHt9CiAjZW5kaWYgLyogSVNfRU5BQkxFRChDT05G
SUdfSE1NX01JUlJPUikgKi8KIApkaWZmIC0tZ2l0IGEva2VybmVsL2ZvcmsuYyBiL2tlcm5lbC9m
b3JrLmMKaW5kZXggNzU2NzViOWJmNmRmZDMuLmM3MDRjM2NlZGVlNzhkIDEwMDY0NAotLS0gYS9r
ZXJuZWwvZm9yay5jCisrKyBiL2tlcm5lbC9mb3JrLmMKQEAgLTY3Myw3ICs2NzMsNiBAQCB2b2lk
IF9fbW1kcm9wKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogCVdBUk5fT05fT05DRShtbSA9PSBjdXJy
ZW50LT5hY3RpdmVfbW0pOwogCW1tX2ZyZWVfcGdkKG1tKTsKIAlkZXN0cm95X2NvbnRleHQobW0p
OwotCWhtbV9tbV9kZXN0cm95KG1tKTsKIAltbXVfbm90aWZpZXJfbW1fZGVzdHJveShtbSk7CiAJ
Y2hlY2tfbW0obW0pOwogCXB1dF91c2VyX25zKG1tLT51c2VyX25zKTsKZGlmZiAtLWdpdCBhL21t
L2htbS5jIGIvbW0vaG1tLmMKaW5kZXggMjJhOTdhZGExMDhiNGUuLjA4MGIxN2EyZTg3ZTJkIDEw
MDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtMjAsNiArMjAsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L3N3YXBvcHMuaD4KICNpbmNsdWRlIDxsaW51eC9odWdldGxiLmg+CiAjaW5j
bHVkZSA8bGludXgvbWVtcmVtYXAuaD4KKyNpbmNsdWRlIDxsaW51eC9zY2hlZC9tbS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5o
PgogI2luY2x1ZGUgPGxpbnV4L21tdV9ub3RpZmllci5oPgpAQCAtNzMsNiArNzQsNyBAQCBzdGF0
aWMgc3RydWN0IGhtbSAqaG1tX2dldF9vcl9jcmVhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJ
aG1tLT5ub3RpZmllcnMgPSAwOwogCWhtbS0+ZGVhZCA9IGZhbHNlOwogCWhtbS0+bW0gPSBtbTsK
KwltbWdyYWIoaG1tLT5tbSk7CiAKIAlzcGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwog
CWlmICghbW0tPmhtbSkKQEAgLTEwMCw2ICsxMDIsNyBAQCBzdGF0aWMgc3RydWN0IGhtbSAqaG1t
X2dldF9vcl9jcmVhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJCW1tLT5obW0gPSBOVUxMOwog
CXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKIGVycm9yOgorCW1tZHJvcChobW0t
Pm1tKTsKIAlrZnJlZShobW0pOwogCXJldHVybiBOVUxMOwogfQpAQCAtMTIxLDYgKzEyNCw3IEBA
IHN0YXRpYyB2b2lkIGhtbV9mcmVlKHN0cnVjdCBrcmVmICprcmVmKQogCQltbS0+aG1tID0gTlVM
TDsKIAlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7CiAKKwltbWRyb3AoaG1tLT5t
bSk7CiAJbW11X25vdGlmaWVyX2NhbGxfc3JjdSgmaG1tLT5yY3UsIGhtbV9mcmVlX3JjdSk7CiB9
CiAKQEAgLTEyOSwyNCArMTMzLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGhtbV9wdXQoc3RydWN0
IGhtbSAqaG1tKQogCWtyZWZfcHV0KCZobW0tPmtyZWYsIGhtbV9mcmVlKTsKIH0KIAotdm9pZCBo
bW1fbW1fZGVzdHJveShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKLXsKLQlzdHJ1Y3QgaG1tICpobW07
Ci0KLQlzcGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwotCWhtbSA9IG1tX2dldF9obW0o
bW0pOwotCW1tLT5obW0gPSBOVUxMOwotCWlmIChobW0pIHsKLQkJaG1tLT5tbSA9IE5VTEw7Ci0J
CWhtbS0+ZGVhZCA9IHRydWU7Ci0JCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsK
LQkJaG1tX3B1dChobW0pOwotCQlyZXR1cm47Ci0JfQotCi0Jc3Bpbl91bmxvY2soJm1tLT5wYWdl
X3RhYmxlX2xvY2spOwotfQotCiBzdGF0aWMgdm9pZCBobW1fcmVsZWFzZShzdHJ1Y3QgbW11X25v
dGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB7CiAJc3RydWN0IGhtbSAqaG1tID0g
Y29udGFpbmVyX29mKG1uLCBzdHJ1Y3QgaG1tLCBtbXVfbm90aWZpZXIpOwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
