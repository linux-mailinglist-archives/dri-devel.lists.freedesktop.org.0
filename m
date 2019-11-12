Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94AFFAB85
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164A76EB20;
	Wed, 13 Nov 2019 07:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871156E13F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:43:40 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i17so9768341qtq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kGcjnenI+EnnAHWMcItB24mxm55INky4C94Ykv4geg4=;
 b=eYlGvY/uSU3xXBnydDreABxPk5AimWjnCNJnc/WJrmWIVaMXT71RyCMkDiZ2s8RvoI
 oJVByTmdmxOLiE0zbJhnXTw2H5lObKKfp+C1HGxZnY5kz8Edg7UJtAvGz92IroCgbeNa
 COkButnqnD0lGAVZMGTciX8ncaFnsoQGdp7p40DL3K3Tiomzgsh48a/nLAYcrApHF4s+
 30g+YipAbaLoAGUexGe2jpvzJC2Z+OF0Yda9dVaJF5DqttD7gLpZ8pi0DCm1hXbt5hn5
 ON5SxiHZCTCTlG/w5wGlyxi3CEMBttVTfZN3S/pLC76jAbL7ERw6kONE0D4VMQulRheC
 Lf7g==
X-Gm-Message-State: APjAAAVLfzIXgIG7Ed9cTCdqkbVz2FEMH9PF9IAGW1WglsalTXx3xV3y
 MGqvjWqOxW6r69T6xeZbtNEEeA==
X-Google-Smtp-Source: APXvYqyV99P4cYBxqwR0yk0Vl7NSO/G/hGYwr7orI5pSazTDzznvIwLj5yKe4F2N3m9e7NI6fV/HBQ==
X-Received: by 2002:ac8:1ba5:: with SMTP id z34mr33733259qtj.162.1573591419675; 
 Tue, 12 Nov 2019 12:43:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id u22sm10020470qtb.59.2019.11.12.12.43.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:43:39 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUd0k-00046s-Fb; Tue, 12 Nov 2019 16:43:38 -0400
Date: Tue, 12 Nov 2019 16:43:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191112204338.GE5584@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112000700.3455038-9-jhubbard@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kGcjnenI+EnnAHWMcItB24mxm55INky4C94Ykv4geg4=;
 b=Ia/Hl3Z1HOGYiq6KoluUd9uZCGKzwQBgBr5JQ7I5KyZEUZP07fiLx9egiGiglXV9yp
 zwduhp53vyEcd290QPaERf3wZ21mOf61BVNQbg6GVzWjLkWaYtjFFrAZ/kB/sX/TsV0O
 Cqh6vZK9nd1Vig8r0syQpzeADiWtdjhU8C1qoZqr93PSItmh35/j4piNjOHcIgDaKDz3
 2BaPDGhVa8atEOsvR55GHtOxdcr+RnZlO25xW0gJoiJutB0sYZDed0fX6gxPxoxhf5Zl
 1FXBtMQo3iHNaStug4eqwxrgV4Z4sqg89JFN5ijz+6oI5UdbjHNjva//V05ajuQKORqi
 pELA==
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDQ6MDY6NDVQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEFzIGl0IHNheXMgaW4gdGhlIHVwZGF0ZWQgY29tbWVudCBpbiBndXAuYzogY3VycmVu
dCBGT0xMX0xPTkdURVJNCj4gYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGggRkFVTFRfRkxB
R19BTExPV19SRVRSWSBiZWNhdXNlIG9mIHRoZQo+IEZTIERBWCBjaGVjayByZXF1aXJlbWVudCBv
biB2bWFzLgo+IAo+IEhvd2V2ZXIsIHRoZSBjb3JyZXNwb25kaW5nIHJlc3RyaWN0aW9uIGluIGdl
dF91c2VyX3BhZ2VzX3JlbW90ZSgpIHdhcwo+IHNsaWdodGx5IHN0cmljdGVyIHRoYW4gaXMgYWN0
dWFsbHkgcmVxdWlyZWQ6IGl0IGZvcmJhZGUgYWxsCj4gRk9MTF9MT05HVEVSTSBjYWxsZXJzLCBi
dXQgd2UgY2FuIGFjdHVhbGx5IGFsbG93IEZPTExfTE9OR1RFUk0gY2FsbGVycwo+IHRoYXQgZG8g
bm90IHNldCB0aGUgImxvY2tlZCIgYXJnLgo+IAo+IFVwZGF0ZSB0aGUgY29kZSBhbmQgY29tbWVu
dHMgYWNjb3JkaW5nbHksIGFuZCB1cGRhdGUgdGhlIFZGSU8gY2FsbGVyCj4gdG8gdGFrZSBhZHZh
bnRhZ2Ugb2YgdGhpcywgZml4aW5nIGEgYnVnIGFzIGEgcmVzdWx0OiB0aGUgVkZJTyBjYWxsZXIK
PiBpcyBsb2dpY2FsbHkgYSBGT0xMX0xPTkdURVJNIHVzZXIuCj4gCj4gVGhhbmtzIHRvIEphc29u
IEd1bnRob3JwZSBmb3IgcG9pbnRpbmcgb3V0IGEgY2xlYW4gd2F5IHRvIGZpeCB0aGlzLgo+IAo+
IFN1Z2dlc3RlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gQ2M6IEplcm9t
ZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogSXJhIFdlaW55IDxpcmEud2VpbnlA
aW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8IDMwICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ICBtbS9ndXAuYyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTMgKysrKysrKystLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KyksIDIyIGRlbGV0aW9ucygtKQoKVGhpcyBtYXRjaGVzIHdoYXQgSSB0aG91Z2h0LCBidXQgSSB0
aGluayBEYW5XIHNob3VsZCBjaGVjayBpdCB0b28sIGFuZAp0aGUgdmZpbyB1c2VycyBzaG91bGQg
dGVzdC4uCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIv
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+IGluZGV4IGQ4NjQyNzdlYTE2Zi4uMDE3
Njg5YjdjMzJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMK
PiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4gQEAgLTM0OCwyNCArMzQ4
LDIwIEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5z
aWduZWQgbG9uZyB2YWRkciwKPiAgCQlmbGFncyB8PSBGT0xMX1dSSVRFOwo+ICAKPiAgCWRvd25f
cmVhZCgmbW0tPm1tYXBfc2VtKTsKPiAtCWlmIChtbSA9PSBjdXJyZW50LT5tbSkgewo+IC0JCXJl
dCA9IGdldF91c2VyX3BhZ2VzKHZhZGRyLCAxLCBmbGFncyB8IEZPTExfTE9OR1RFUk0sIHBhZ2Us
Cj4gLQkJCQkgICAgIHZtYXMpOwo+IC0JfSBlbHNlIHsKPiAtCQlyZXQgPSBnZXRfdXNlcl9wYWdl
c19yZW1vdGUoTlVMTCwgbW0sIHZhZGRyLCAxLCBmbGFncywgcGFnZSwKPiAtCQkJCQkgICAgdm1h
cywgTlVMTCk7Cj4gLQkJLyoKPiAtCQkgKiBUaGUgbGlmZXRpbWUgb2YgYSB2YWRkcl9nZXRfcGZu
KCkgcGFnZSBwaW4gaXMKPiAtCQkgKiB1c2Vyc3BhY2UtY29udHJvbGxlZC4gSW4gdGhlIGZzLWRh
eCBjYXNlIHRoaXMgY291bGQKPiAtCQkgKiBsZWFkIHRvIGluZGVmaW5pdGUgc3RhbGxzIGluIGZp
bGVzeXN0ZW0gb3BlcmF0aW9ucy4KPiAtCQkgKiBEaXNhbGxvdyBhdHRlbXB0cyB0byBwaW4gZnMt
ZGF4IHBhZ2VzIHZpYSB0aGlzCj4gLQkJICogaW50ZXJmYWNlLgo+IC0JCSAqLwo+IC0JCWlmIChy
ZXQgPiAwICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkgewo+IC0JCQlyZXQgPSAtRU9QTk9UU1VQ
UDsKPiAtCQkJcHV0X3BhZ2UocGFnZVswXSk7Cj4gLQkJfQo+ICsJcmV0ID0gZ2V0X3VzZXJfcGFn
ZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MgfCBGT0xMX0xPTkdURVJNLAo+ICsJ
CQkJICAgIHBhZ2UsIHZtYXMsIE5VTEwpOwo+ICsJLyoKPiArCSAqIFRoZSBsaWZldGltZSBvZiBh
IHZhZGRyX2dldF9wZm4oKSBwYWdlIHBpbiBpcwo+ICsJICogdXNlcnNwYWNlLWNvbnRyb2xsZWQu
IEluIHRoZSBmcy1kYXggY2FzZSB0aGlzIGNvdWxkCj4gKwkgKiBsZWFkIHRvIGluZGVmaW5pdGUg
c3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KPiArCSAqIERpc2FsbG93IGF0dGVtcHRz
IHRvIHBpbiBmcy1kYXggcGFnZXMgdmlhIHRoaXMKPiArCSAqIGludGVyZmFjZS4KPiArCSAqLwo+
ICsJaWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7Cj4gKwkJcmV0ID0gLUVP
UE5PVFNVUFA7Cj4gKwkJcHV0X3BhZ2UocGFnZVswXSk7Cj4gIAl9CgpBRkFJSyB0aGlzIGNodW5r
IGlzIHJlZHVuZGFudCBub3cgYXMgaXQgaXMgc29tZSBoYWNrIHRvIGVtdWxhdGUKRk9MTF9MT05H
VEVSTT8gU28gdm1hcyBjYW4gYmUgZGVsZXRlZCB0b28uCgpBbHNvIHVuY2xlYXIgd2h5IHRoaXMg
ZnVuY3Rpb24gaGFzIHRoaXM6CgogICAgICAgIHVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7CgogICAg
ICAgIGlmIChyZXQgPT0gMSkgewogICAgICAgICAgICAgICAgKnBmbiA9IHBhZ2VfdG9fcGZuKHBh
Z2VbMF0pOwogICAgICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgfQoKICAgICAgICBkb3du
X3JlYWQoJm1tLT5tbWFwX3NlbSk7CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
