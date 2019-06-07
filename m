Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647533A5C0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8958934B;
	Sun,  9 Jun 2019 12:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B5D89176;
 Fri,  7 Jun 2019 22:06:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k18so2984667ljc.11;
 Fri, 07 Jun 2019 15:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7UWYaKzZEtXuaxJwJzSC3OWehwEB/n9ql+PmX3iEbFc=;
 b=JeaAs2eFwf1y1+qEey+ykECQoQ2ABQazym1fJBAiGOV4+s0/UyDmTcNE1Dg+v6EAnh
 qioibyUaPNKy6XtHwO0K9VDY/escLJzf/fX5/5s7Kqaq9o9KuE896Pu3ZOMhkq99V/GW
 q0kO6YAWCAoMAr3Rgex7jQZU59rhQ7JPR7wROWuSoUzvQF4lIrwL/t9SBheyWcQ8FEc3
 r4cWnjepZxT0KILNs/1YWPp77EKHK9W10qiM++JU2TLadcJrndatZSr/ArCCaTRSm39z
 dYq5sQMCFHO60TxGkNnaMuQ8uHa1EnEI6ba9ZMEYV5C8xY/RoP/Mk020EI0SCy7snFsq
 ZIjw==
X-Gm-Message-State: APjAAAVutKteezVedGk8+uQxImlcwZbHSi03G04kkMtGTZskUFVVQ7G+
 WKLj7+UmzF7nkP3Q8egHcLyHw3QfivqmCMIorjM=
X-Google-Smtp-Source: APXvYqwBeEPN7kLgMnERE0EV7XcHl9B9PjKXKhgkNCm9ydhdQJSENk3Qi8H9gBVf130eoY4SU8M3FQfw0DAJrGoOB1o=
X-Received: by 2002:a2e:a311:: with SMTP id l17mr8533284lje.214.1559945182726; 
 Fri, 07 Jun 2019 15:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-11-jgg@ziepe.ca>
In-Reply-To: <20190606184438.31646-11-jgg@ziepe.ca>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sat, 8 Jun 2019 03:41:27 +0530
Message-ID: <CAFqt6zafAR3fqvKCTCLmGNVfbSP80KqqR8cT0bUj4CW4scgxpQ@mail.gmail.com>
Subject: Re: [PATCH v2 hmm 10/11] mm/hmm: Do not use list*_rcu() for
 hmm->ranges
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7UWYaKzZEtXuaxJwJzSC3OWehwEB/n9ql+PmX3iEbFc=;
 b=IXRXXYLjlXhkS7yvhzoYrp+YIYuNj8w+FKvrC2tbRiW0c/0o8dRW8aDCyUkwFWzE/z
 /YJtG4/7E6x8p7aeeTjHwUD+oOzcin26LtKwS/wxd0ElDf+AxtFBCcpbr3rFGlqL2QkO
 annY8RhMfQ/yEquJ2BJvQFemzB095m8iLIKkDZUB0xq71t8R9eVEu667+JgcYBTdImY+
 ubTPhYaxG8U+XvWiy1VeaxHA/JGMBDnE7er/xvmG9dGaM3hCKLub403mntSllA90kI0K
 yE/wisp+efrCTrhv8ade8ujVMfWOTLSWJqv6ftXcXNCZyqKsNqtBiWB4mj7QGdKBqH3H
 yZTQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, Linux-MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gNywgMjAxOSBhdCAxMjoxNSBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
Cj4KPiBUaGlzIGxpc3QgaXMgYWx3YXlzIHJlYWQgYW5kIHdyaXR0ZW4gd2hpbGUgaG9sZGluZyBo
bW0tPmxvY2sgc28gdGhlcmUgaXMKPiBubyBuZWVkIGZvciB0aGUgY29uZnVzaW5nIF9yY3UgYW5u
b3RhdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5v
eC5jb20+Cj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29t
PgoKQWNrZWQtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgoKPiAt
LS0KPiAgbW0vaG1tLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4g
aW5kZXggYzJmZWNiM2VjYjExZTEuLjcwOWQxMzhkZDQ5MDI3IDEwMDY0NAo+IC0tLSBhL21tL2ht
bS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtOTExLDcgKzkxMSw3IEBAIGludCBobW1fcmFuZ2Vf
cmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gICAgICAgICBtdXRleF9sb2NrKCZo
bW0tPmxvY2spOwo+Cj4gICAgICAgICByYW5nZS0+aG1tID0gaG1tOwo+IC0gICAgICAgbGlzdF9h
ZGRfcmN1KCZyYW5nZS0+bGlzdCwgJmhtbS0+cmFuZ2VzKTsKPiArICAgICAgIGxpc3RfYWRkKCZy
YW5nZS0+bGlzdCwgJmhtbS0+cmFuZ2VzKTsKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIElm
IHRoZXJlIGFyZSBhbnkgY29uY3VycmVudCBub3RpZmllcnMgd2UgaGF2ZSB0byB3YWl0IGZvciB0
aGVtIGZvcgo+IEBAIC05NDEsNyArOTQxLDcgQEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3Rlcihz
dHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICAg
ICAgICBtdXRleF9sb2NrKCZobW0tPmxvY2spOwo+IC0gICAgICAgbGlzdF9kZWxfcmN1KCZyYW5n
ZS0+bGlzdCk7Cj4gKyAgICAgICBsaXN0X2RlbCgmcmFuZ2UtPmxpc3QpOwo+ICAgICAgICAgbXV0
ZXhfdW5sb2NrKCZobW0tPmxvY2spOwo+Cj4gICAgICAgICAvKiBEcm9wIHJlZmVyZW5jZSB0YWtl
biBieSBobW1fcmFuZ2VfcmVnaXN0ZXIoKSAqLwo+IC0tCj4gMi4yMS4wCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
