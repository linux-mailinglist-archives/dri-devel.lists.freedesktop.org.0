Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C090D897C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1576E8CA;
	Wed, 16 Oct 2019 07:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E660D6E880
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 18:16:32 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d22so9983206pls.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cpXvWgqC++htg5t4tfaxCh8tm+v/06g7WiSmKM05mvw=;
 b=d3IQOjkGUgvFPgK77gep2cK1k11S1UoLXigJfdOpbSDoIa6/IywNHSO3Bk/ExFgKCk
 wGz13LMQncmagn0CCTcUlh49trM8zVW6w3QXeXZG0wKjPPSZEltvXqb570Cxmq8K5U2P
 IxqEmElJbuZzSVrNbNednUigpUPbR0D49q8VeESEJcJpGt0EF4w8UdkAZp+/b/zzc0Tj
 tAkG//teCRADrpRJY6cKGvkYE7ZRjCRYcS1wz2AdRa44fzKyFUHsftGWJDGER34RbuJS
 ayv3LpHIoF0NIUEEQ5iU1+wKk5XGEEaYUbcPzj0YNdX/GJsFV8E1k15b/15OhZo1R0I0
 7khg==
X-Gm-Message-State: APjAAAVtVuwGyXpU3JpsrYCt7T/8yiMrd80WjHiLGMVRgy/zDLUHZ0Db
 5EZPtZ+4PXCUSg8oxH4+I2mUbA==
X-Google-Smtp-Source: APXvYqylDFeyHP+orjZdFPigy5QgoSehDBF4HXwVxw56pNjg/wm3jT8eRKmoaCJljZuzzdfaqS/x2A==
X-Received: by 2002:a17:902:820f:: with SMTP id
 x15mr37595901pln.288.1571163392460; 
 Tue, 15 Oct 2019 11:16:32 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id u9sm19594pjb.4.2019.10.15.11.16.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:32 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002Bw-Ay; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH hmm 03/15] mm/hmm: allow hmm_range to be used with a
 mmu_range_notifier or hmm_mirror
Date: Tue, 15 Oct 2019 15:12:30 -0300
Message-Id: <20191015181242.8343-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cpXvWgqC++htg5t4tfaxCh8tm+v/06g7WiSmKM05mvw=;
 b=JuyClk7PKCaLwoQ+105chr3B4/YZVWePEMx44i+al/c0waHUPFVmcMJsk69iurM8xR
 TqIwh/dWh7/bezrzPA7KI4qy1RM9p4IWVXMg7fLRvoeynPIE47WqsqslPXSo0Nocyp8b
 S+/SYVDKWfxiXPCAFo7rRERONWIezL1LF4kOXzYqimZaG7E71vm9BsTxd6TJBsVwKqYW
 LBpwbsRaDkCFam+Aap+a3+qNpe/qW0b8h9rg7ONtiZhkEE9NnE0x3yb081fUXtFapyMg
 +2aW6MdXKqWTKPnnE77vavOkmbSBi9iBgcYZl0B6Q0XT/ieElII5zYsv38J1WN9BsZGN
 t/2w==
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
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKaG1tX21pcnJvcidzIGhh
bmRsaW5nIG9mIHJhbmdlcyBkb2VzIG5vdCB1c2UgYSBzZXF1ZW5jZSBjb3VudCB3aGljaApyZXN1
bHRzIGluIHRoaXMgYnVnOgoKICAgICAgICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQ1BVMQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaG1tX3Jh
bmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2UpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsaWQgPT0gdHJ1ZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaG1tX3JhbmdlX2ZhdWx0KHJhbmdlKQpobW1faW52YWxpZGF0ZV9yYW5nZV9zdGFydCgp
CiAgIHJhbmdlLT52YWxpZCA9IGZhbHNlCmhtbV9pbnZhbGlkYXRlX3JhbmdlX2VuZCgpCiAgIHJh
bmdlLT52YWxpZCA9IHRydWUKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGht
bV9yYW5nZV92YWxpZChyYW5nZSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdmFsaWQgPT0gdHJ1ZQoKV2hlcmUgdGhlIGhtbV9yYW5nZV92YWxpZCBzaG91bGQgbm90
IGhhdmUgc3VjY2VlZGVkLgoKQWRkaW5nIHRoZSByZXF1aXJlZCBzZXF1ZW5jZSBjb3VudCB3b3Vs
ZCBtYWtlIGl0IG5lYXJseSBpZGVudGljYWwgdG8gdGhlCm5ldyBtbXVfcmFuZ2Vfbm90aWZpZXIu
IEluc3RlYWQgcmVwbGFjZSB0aGUgaG1tX21pcnJvciBzdHVmZiB3aXRoCm1tdV9yYW5nZV9ub3Rp
Zmllci4KCkNvLWV4aXN0ZW5jZSBvZiB0aGUgdHdvIEFQSXMgaXMgdGhlIGZpcnN0IHN0ZXAuCgpT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogaW5j
bHVkZS9saW51eC9obW0uaCB8ICA1ICsrKysrCiBtbS9obW0uYyAgICAgICAgICAgIHwgMjUgKysr
KysrKysrKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNs
dWRlL2xpbnV4L2htbS5oCmluZGV4IDNmZWM1MTNiOWMwMGYxLi44YWMxZmQ2YTgxYWY4ZiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBA
IC0xNDUsNiArMTQ1LDkgQEAgZW51bSBobW1fcGZuX3ZhbHVlX2UgewogLyoKICAqIHN0cnVjdCBo
bW1fcmFuZ2UgLSB0cmFjayBpbnZhbGlkYXRpb24gbG9jayBvbiB2aXJ0dWFsIGFkZHJlc3MgcmFu
Z2UKICAqCisgKiBAbm90aWZpZXI6IGFuIG9wdGlvbmFsIG1tdV9yYW5nZV9ub3RpZmllcgorICog
QG5vdGlmaWVyX3NlcTogd2hlbiBub3RpZmllciBpcyB1c2VkIHRoaXMgaXMgdGhlIHJlc3VsdCBv
ZgorICogICAgICAgICAgICAgICAgbW11X3JhbmdlX3JlYWRfYmVnaW4oKQogICogQGhtbTogdGhl
IGNvcmUgSE1NIHN0cnVjdHVyZSB0aGlzIHJhbmdlIGlzIGFjdGl2ZSBhZ2FpbnN0CiAgKiBAdm1h
OiB0aGUgdm0gYXJlYSBzdHJ1Y3QgZm9yIHRoZSByYW5nZQogICogQGxpc3Q6IGFsbCByYW5nZSBs
b2NrIGFyZSBvbiBhIGxpc3QKQEAgLTE1OSw2ICsxNjIsOCBAQCBlbnVtIGhtbV9wZm5fdmFsdWVf
ZSB7CiAgKiBAdmFsaWQ6IHBmbnMgYXJyYXkgZGlkIG5vdCBjaGFuZ2Ugc2luY2UgaXQgaGFzIGJl
ZW4gZmlsbCBieSBhbiBITU0gZnVuY3Rpb24KICAqLwogc3RydWN0IGhtbV9yYW5nZSB7CisJc3Ry
dWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbm90aWZpZXI7CisJdW5zaWduZWQgbG9uZwkJbm90aWZp
ZXJfc2VxOwogCXN0cnVjdCBobW0JCSpobW07CiAJc3RydWN0IGxpc3RfaGVhZAlsaXN0OwogCXVu
c2lnbmVkIGxvbmcJCXN0YXJ0OwpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRl
eCA5MDJmNWZhNmJmOTNhZC4uMjJhYzM1OTU3NzFmZWIgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisr
KyBiL21tL2htbS5jCkBAIC04NTIsNiArODUyLDE0IEBAIHZvaWQgaG1tX3JhbmdlX3VucmVnaXN0
ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiB9CiBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV91
bnJlZ2lzdGVyKTsKIAorc3RhdGljIGJvb2wgbmVlZHNfcmV0cnkoc3RydWN0IGhtbV9yYW5nZSAq
cmFuZ2UpCit7CisJaWYgKHJhbmdlLT5ub3RpZmllcikKKwkJcmV0dXJuIG1tdV9yYW5nZV9jaGVj
a19yZXRyeShyYW5nZS0+bm90aWZpZXIsCisJCQkJCSAgICAgcmFuZ2UtPm5vdGlmaWVyX3NlcSk7
CisJcmV0dXJuICFyYW5nZS0+dmFsaWQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW1fd2Fs
a19vcHMgaG1tX3dhbGtfb3BzID0gewogCS5wdWRfZW50cnkJPSBobW1fdm1hX3dhbGtfcHVkLAog
CS5wbWRfZW50cnkJPSBobW1fdm1hX3dhbGtfcG1kLApAQCAtODkyLDE4ICs5MDAsMjMgQEAgbG9u
ZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHVuc2lnbmVkIGludCBm
bGFncykKIAljb25zdCB1bnNpZ25lZCBsb25nIGRldmljZV92bWEgPSBWTV9JTyB8IFZNX1BGTk1B
UCB8IFZNX01JWEVETUFQOwogCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSByYW5nZS0+c3RhcnQsIGVu
ZDsKIAlzdHJ1Y3QgaG1tX3ZtYV93YWxrIGhtbV92bWFfd2FsazsKLQlzdHJ1Y3QgaG1tICpobW0g
PSByYW5nZS0+aG1tOworCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwogCXN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hOwogCWludCByZXQ7CiAKLQlsb2NrZGVwX2Fzc2VydF9oZWxkKCZobW0tPm1tdV9u
b3RpZmllci5tbS0+bW1hcF9zZW0pOworCWlmIChyYW5nZS0+bm90aWZpZXIpCisJCW1tID0gcmFu
Z2UtPm5vdGlmaWVyLT5tbTsKKwllbHNlCisJCW1tID0gcmFuZ2UtPmhtbS0+bW11X25vdGlmaWVy
Lm1tOworCisJbG9ja2RlcF9hc3NlcnRfaGVsZCgmbW0tPm1tYXBfc2VtKTsKIAogCWRvIHsKIAkJ
LyogSWYgcmFuZ2UgaXMgbm8gbG9uZ2VyIHZhbGlkIGZvcmNlIHJldHJ5LiAqLwotCQlpZiAoIXJh
bmdlLT52YWxpZCkKKwkJaWYgKG5lZWRzX3JldHJ5KHJhbmdlKSkKIAkJCXJldHVybiAtRUJVU1k7
CiAKLQkJdm1hID0gZmluZF92bWEoaG1tLT5tbXVfbm90aWZpZXIubW0sIHN0YXJ0KTsKKwkJdm1h
ID0gZmluZF92bWEobW0sIHN0YXJ0KTsKIAkJaWYgKHZtYSA9PSBOVUxMIHx8ICh2bWEtPnZtX2Zs
YWdzICYgZGV2aWNlX3ZtYSkpCiAJCQlyZXR1cm4gLUVGQVVMVDsKIApAQCAtOTMzLDcgKzk0Niw3
IEBAIGxvbmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MpCiAJCQlzdGFydCA9IGhtbV92bWFfd2Fsay5sYXN0OwogCiAJCQkvKiBLZWVw
IHRyeWluZyB3aGlsZSB0aGUgcmFuZ2UgaXMgdmFsaWQuICovCi0JCX0gd2hpbGUgKHJldCA9PSAt
RUJVU1kgJiYgcmFuZ2UtPnZhbGlkKTsKKwkJfSB3aGlsZSAocmV0ID09IC1FQlVTWSAmJiAhbmVl
ZHNfcmV0cnkocmFuZ2UpKTsKIAogCQlpZiAocmV0KSB7CiAJCQl1bnNpZ25lZCBsb25nIGk7CkBA
IC05OTEsNyArMTAwNCw3IEBAIGxvbmcgaG1tX3JhbmdlX2RtYV9tYXAoc3RydWN0IGhtbV9yYW5n
ZSAqcmFuZ2UsIHN0cnVjdCBkZXZpY2UgKmRldmljZSwKIAkJCWNvbnRpbnVlOwogCiAJCS8qIENo
ZWNrIGlmIHJhbmdlIGlzIGJlaW5nIGludmFsaWRhdGVkICovCi0JCWlmICghcmFuZ2UtPnZhbGlk
KSB7CisJCWlmIChuZWVkc19yZXRyeShyYW5nZSkpIHsKIAkJCXJldCA9IC1FQlVTWTsKIAkJCWdv
dG8gdW5tYXA7CiAJCX0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
