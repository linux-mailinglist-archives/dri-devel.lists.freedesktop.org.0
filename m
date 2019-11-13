Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDBCFA03B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 02:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668CA6E52E;
	Wed, 13 Nov 2019 01:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DD26E52E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 01:35:57 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id c19so181708otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 17:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tA9TOCxBga9LLC7wRjd3ONed6e5UCLIuIdqzN/pcWuk=;
 b=q/8Wdms97WNpWMrrMt1xb+FGFEJwAPzVFPD86ctj0LaO4AB+L5AO6nfUkTGx2AZVfn
 9K36OBUqsJB0k4i1mNtQY8G0Rpd4YuYSfhPwV/N/ozZE1CHbWqhXO5ehigOZFR+xD8gt
 AKNHbR2HDKPwxKazDFoU/KVz9bUklAyyaWS7C7Kk42qrYVKx52o/z5It7Pm8cJkwfHL7
 oGg0aRdR3DvfdvtINATcHwql6yhlvWISanhUGEx39gYNpVomi0WVORrEuVAo+CGg+TFn
 R2WawybJhDd14ljiVuxI62d/UF7rfinH7MNF45dXx9VSZ3XsX6HjcVcuHAweVExfe6BX
 E1mQ==
X-Gm-Message-State: APjAAAWjTpgh+ePVfAMbIzSUK2UR722pVvX8tuaY+Wl5sKVA9xQVcGgG
 pMiXOo4p4f6O9EGyzD6cLxBrfvdgAPCzbp1gkq6XTw==
X-Google-Smtp-Source: APXvYqzyV061KEXPKPAkyAkGRgXJ6fWU+P7KwNCWCXXtSomJ5IUaejCErE/o1rH0NBMapixozrDCWZBdHagrZr75cJE=
X-Received: by 2002:a05:6830:1b70:: with SMTP id
 d16mr411248ote.71.1573608957281; 
 Tue, 12 Nov 2019 17:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
 <20191112234250.GA19615@ziepe.ca>
 <CAPcyv4hwFKmsQpp04rS6diCmZwGtbnriCjfY2ofWV485qT9kzg@mail.gmail.com>
 <28355eb0-4ee5-3418-b430-59302d15b478@nvidia.com>
In-Reply-To: <28355eb0-4ee5-3418-b430-59302d15b478@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 17:35:46 -0800
Message-ID: <CAPcyv4hdYZ__3+KJHh+0uX--f-U=pLiZfdO0JDhyBE-nZ=i4FQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tA9TOCxBga9LLC7wRjd3ONed6e5UCLIuIdqzN/pcWuk=;
 b=pgvm7B7MKRNHPnnm+UXqpNAxEKn59mgIkjpVIugT59Mu8TwvXIAzzyQhvDiVCxIl0p
 vI+Yj+13Wusmq5tADceFQlsKUjuwgmmDrjkNeYGEIUHh9w8tZNldmP6Q5WtjVpISdJ0i
 r3oVh4apWhwsDdj9Nw0bWAyVdq8zxIhXTRj/8PmhzFCoHQ/9X/Dg5B4Hj6Y0ruPyQaaR
 rEPfI8qEDLrnHlL1idX+oRviz/9wQZUiz6o40remYNFeKqLceiYDgbAXk1ppNt84zSqw
 zf+6WmCRWk7Wod/xBPOURyhyWoKZqScoLNTr5ASvgI3i5qH5c+mNJETCAbPrPmJU7Yqj
 fNKw==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNTowOCBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gMTEvMTIvMTkgNDo1OCBQTSwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IC4uLgo+ID4+PiBJdCdzIG5vdCByZWR1bmRhbnQgcmVsYXRpdmUgdG8gdXBzdHJlYW0g
d2hpY2ggZG9lcyBub3QgZG8gYW55dGhpbmcgdGhlCj4gPj4+IEZPTExfTE9OR1RFUk0gaW4gdGhl
IGd1cC1zbG93IHBhdGguLi4gYnV0IEkgaGF2ZSBub3QgbG9va2VkIGF0IHBhdGNoZXMKPiA+Pj4g
MS03IHRvIHNlZSBpZiBzb21ldGhpbmcgdGhlcmUgbWFkZSBpdCByZWR1bmRhbnQuCj4gPj4KPiA+
PiBPaCwgdGhlIGh1bmsgSm9obiBoYWQgYmVsb3cgZm9yIGdldF91c2VyX3BhZ2VzX3JlbW90ZSgp
IGFsc28gbmVlZHMgdG8KPiA+PiBjYWxsIF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpIHdoZW4gRk9M
TF9MT05HVEVSTSBpcyBzcGVjaWZpZWQsIHRoZW4KPiA+PiB0aGF0IGNhbGxzIGNoZWNrX2RheF92
bWFzKCkgd2hpY2ggZHVwbGljYXRlcyB0aGUgdm1hX2lzX2ZzZGF4KCkgY2hlY2sKPiA+PiBhYm92
ZS4KPiA+Cj4gPiBPaCB0cnVlLCBnb29kIGV5ZS4gSXQgaXMgcmVkdW5kYW50IGlmIGl0IGRvZXMg
YWRkaXRpb25hbGx5IGNhbGwKPiA+IF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpLCBhbmQgaXQgbmVl
ZHMgdG8gZG8gdGhhdCBvdGhlcndpc2VzIGl0IHVuZG9lcwo+ID4gdGhlIENNQSBtaWdyYXRpb24g
bWFnaWMgdGhhdCBBbmVlc2ggYWRkZWQuCj4gPgo+Cj4gT0suIFNvIGp1c3QgdG8gYmUgY2xlYXIs
IEknbGwgYmUgcmVtb3ZpbmcgdGhpcyBmcm9tIHRoZSBwYXRjaDoKPgo+ICAgICAgICAgLyoKPiAg
ICAgICAgICAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBwYWdlIHBpbiBpcwo+
ICAgICAgICAgICogdXNlcnNwYWNlLWNvbnRyb2xsZWQuIEluIHRoZSBmcy1kYXggY2FzZSB0aGlz
IGNvdWxkCj4gICAgICAgICAgKiBsZWFkIHRvIGluZGVmaW5pdGUgc3RhbGxzIGluIGZpbGVzeXN0
ZW0gb3BlcmF0aW9ucy4KPiAgICAgICAgICAqIERpc2FsbG93IGF0dGVtcHRzIHRvIHBpbiBmcy1k
YXggcGFnZXMgdmlhIHRoaXMKPiAgICAgICAgICAqIGludGVyZmFjZS4KPiAgICAgICAgICAqLwo+
ICAgICAgICAgaWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7Cj4gICAgICAg
ICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOwo+ICAgICAgICAgICAgICAgICBwdXRfcGFnZShw
YWdlWzBdKTsKPiAgICAgICAgIH0KPgo+IChhbmQgdGhlIGRlY2xhcmF0aW9uIG9mICJ2bWFzIiwg
YXMgd2VsbCkuCgouLi5hbmQgYWRkIGEgY2FsbCB0byBfX2d1cF9sb25ndGVybV9sb2NrZWQgaW50
ZXJuYWwgdG8KZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCksIHJpZ2h0PwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
