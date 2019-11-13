Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9AFB8B0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 20:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00236EE20;
	Wed, 13 Nov 2019 19:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2BB6EE20
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 19:23:31 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l202so2892023oig.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 11:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4HKVOkxUXCqQFAssnrt5HN+d13KJzjRJ1pFFkgydGzo=;
 b=gz4zeW0XqgB/Y+dAg8+ZgB9QYZUmBzwxiN3mcicaIwTbIYBugdHkaKlujfckEDQaWO
 mZpKrxEvXTcjbUiY26EEsCtC7GY/KPKR88t8Wbe/6cuFD5+umrNcTd5KT7zlqm0nVF9G
 ysc7OL75WGj1wnwF9QWDzxJH6H2wn56g7ZFjDKO+2kA+4cP1YVQTgHjRc2cCguXvilnC
 VzXBcDKh8BoflmLEQhs6DNh+E+3cToLhFhinZ0izXXuSWK6UOGETKCdRk8AGs6NdctIY
 GIMgN+F9/QdE7MitIRLmfHkANd7nAz2Wqie3i+fj9OtSdWvk+7QXAH+09dxv3Oa7KPCE
 8PYg==
X-Gm-Message-State: APjAAAVpgP8KLzZGlDGfRG0Nh5ccmmVQAYL6ZCahLCF+zRJS2qqIcQfo
 /71Tt7ea/tmWcjPMVyu8ia0J2QPAKeL/XMgkzMyQfw==
X-Google-Smtp-Source: APXvYqw/J/xJikM9Sn2uJoSKIkSXprx6L2hjLUq/51PEKKOZdQDk8LIwVzxcWXUccXtFtayP/c8+SilHtOvsl5tzGrQ=
X-Received: by 2002:aca:ea57:: with SMTP id i84mr174326oih.73.1573673011067;
 Wed, 13 Nov 2019 11:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-5-jhubbard@nvidia.com>
In-Reply-To: <20191113042710.3997854-5-jhubbard@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 Nov 2019 11:23:19 -0800
Message-ID: <CAPcyv4gGu=G-c1czSAYJ3joTYS_ZYOJ6i9umKzCQEFzpwZMiiA@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4HKVOkxUXCqQFAssnrt5HN+d13KJzjRJ1pFFkgydGzo=;
 b=bb6122LJyN4TYG5IK7mHh5xygfwPeVWP6I4JnFmlEb2IzPnSXePzt9c7h6VlwCNKNf
 6iTeoCZ+WCekF2UjJKYypJ3VDkp2bZI1sBd8OZia/73qpNgBlVpDNRkT98ztqaV4Pdpl
 ZVL0JboDgCGP8I4MHVFtdYs0p8UDQrSyipyLboTogqOsqYbQVAZcsnUwAJG32rUPMPmj
 ssxQ90TSW2CRqTDYyVFKczonUtqdX4nXBKSakXhSzcp3X5BqgSICBAOxp0Q1Cy1lQWwq
 g444805boKvN2nKVTBF8Zd13UMFnq8mUuIPok109u72I0derPDbhoGvKrYVRikRhE4Pc
 Y6hQ==
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgODoyNyBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gQW4gdXBjb21pbmcgcGF0Y2ggY2hhbmdlcyBhbmQgY29tcGxp
Y2F0ZXMgdGhlIHJlZmNvdW50aW5nIGFuZAo+IGVzcGVjaWFsbHkgdGhlICJwdXQgcGFnZSIgYXNw
ZWN0cyBvZiBpdC4gSW4gb3JkZXIgdG8ga2VlcAo+IGV2ZXJ5dGhpbmcgY2xlYW4sIHJlZmFjdG9y
IHRoZSBkZXZtYXAgcGFnZSByZWxlYXNlIHJvdXRpbmVzOgo+Cj4gKiBSZW5hbWUgcHV0X2Rldm1h
cF9tYW5hZ2VkX3BhZ2UoKSB0byBwYWdlX2lzX2Rldm1hcF9tYW5hZ2VkKCksCj4gICBhbmQgbGlt
aXQgdGhlIGZ1bmN0aW9uYWxpdHkgdG8gInJlYWQgb25seSI6IHJldHVybiBhIGJvb2wsCj4gICB3
aXRoIG5vIHNpZGUgZWZmZWN0cy4KPgo+ICogQWRkIGEgbmV3IHJvdXRpbmUsIHB1dF9kZXZtYXBf
bWFuYWdlZF9wYWdlKCksIHRvIGhhbmRsZSBjaGVja2luZwo+ICAgd2hhdCBraW5kIG9mIHBhZ2Ug
aXQgaXMsIGFuZCB3aGF0IGtpbmQgb2YgcmVmY291bnQgaGFuZGxpbmcgaXQKPiAgIHJlcXVpcmVz
Lgo+Cj4gKiBSZW5hbWUgX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZSgpIHRvIGZyZWVfZGV2bWFw
X21hbmFnZWRfcGFnZSgpLAo+ICAgYW5kIGxpbWl0IHRoZSBmdW5jdGlvbmFsaXR5IHRvIHVuY29u
ZGl0aW9uYWxseSBmcmVlaW5nIGEgZGV2bWFwCj4gICBwYWdlLgo+Cj4gVGhpcyBpcyBvcmlnaW5h
bGx5IGJhc2VkIG9uIGEgc2VwYXJhdGUgcGF0Y2ggYnkgSXJhIFdlaW55LCB3aGljaAo+IGFwcGxp
ZWQgdG8gYW4gZWFybHkgdmVyc2lvbiBvZiB0aGUgcHV0X3VzZXJfcGFnZSgpIGV4cGVyaW1lbnRz
Lgo+IFNpbmNlIHRoZW4sIErDqXLDtG1lIEdsaXNzZSBzdWdnZXN0ZWQgdGhlIHJlZmFjdG9yaW5n
IGRlc2NyaWJlZCBhYm92ZS4KPgo+IFN1Z2dlc3RlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xp
c3NlQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50
ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNv
bT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbS5oIHwgMjcgKysrKysrKysrKysrKysrKy0tLQo+
ICBtbS9tZW1yZW1hcC5jICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgNDEg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVk
ZS9saW51eC9tbS5oCj4gaW5kZXggYTJhZGY5NWIzZjljLi45NjIyODM3NjEzOWMgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gQEAg
LTk2Nyw5ICs5NjcsMTAgQEAgc3RhdGljIGlubGluZSBib29sIGlzX3pvbmVfZGV2aWNlX3BhZ2Uo
Y29uc3Qgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gICNlbmRpZgo+Cj4gICNpZmRlZiBDT05GSUdfREVW
X1BBR0VNQVBfT1BTCj4gLXZvaWQgX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFn
ZSAqcGFnZSk7Cj4gK3ZvaWQgZnJlZV9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpw
YWdlKTsKPiAgREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGRldm1hcF9tYW5hZ2VkX2tleSk7Cj4g
LXN0YXRpYyBpbmxpbmUgYm9vbCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAq
cGFnZSkKPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwYWdlX2lzX2Rldm1hcF9tYW5hZ2VkKHN0
cnVjdCBwYWdlICpwYWdlKQo+ICB7Cj4gICAgICAgICBpZiAoIXN0YXRpY19icmFuY2hfdW5saWtl
bHkoJmRldm1hcF9tYW5hZ2VkX2tleSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsK
PiBAQCAtOTc4LDcgKzk3OSw2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwdXRfZGV2bWFwX21hbmFn
ZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgICAgICAgIHN3aXRjaCAocGFnZS0+cGdtYXAt
PnR5cGUpIHsKPiAgICAgICAgIGNhc2UgTUVNT1JZX0RFVklDRV9QUklWQVRFOgo+ICAgICAgICAg
Y2FzZSBNRU1PUllfREVWSUNFX0ZTX0RBWDoKPiAtICAgICAgICAgICAgICAgX19wdXRfZGV2bWFw
X21hbmFnZWRfcGFnZShwYWdlKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gICAg
ICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICBicmVhazsKPiBAQCAtOTg2LDYgKzk4Niwy
NyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBh
Z2UgKnBhZ2UpCj4gICAgICAgICByZXR1cm4gZmFsc2U7Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5l
IGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gK3sKPiAr
ICAgICAgIGJvb2wgaXNfZGV2bWFwID0gcGFnZV9pc19kZXZtYXBfbWFuYWdlZChwYWdlKTsKPiAr
Cj4gKyAgICAgICBpZiAoaXNfZGV2bWFwKSB7Cj4gKyAgICAgICAgICAgICAgIGludCBjb3VudCA9
IHBhZ2VfcmVmX2RlY19yZXR1cm4ocGFnZSk7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKgo+ICsg
ICAgICAgICAgICAgICAgKiBkZXZtYXAgcGFnZSByZWZjb3VudHMgYXJlIDEtYmFzZWQsIHJhdGhl
ciB0aGFuIDAtYmFzZWQ6IGlmCj4gKyAgICAgICAgICAgICAgICAqIHJlZmNvdW50IGlzIDEsIHRo
ZW4gdGhlIHBhZ2UgaXMgZnJlZSBhbmQgdGhlIHJlZmNvdW50IGlzCj4gKyAgICAgICAgICAgICAg
ICAqIHN0YWJsZSBiZWNhdXNlIG5vYm9keSBob2xkcyBhIHJlZmVyZW5jZSBvbiB0aGUgcGFnZS4K
PiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGlmIChjb3VudCA9PSAxKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGZyZWVfZGV2bWFwX21hbmFnZWRfcGFnZShwYWdlKTsK
PiArICAgICAgICAgICAgICAgZWxzZSBpZiAoIWNvdW50KQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIF9fcHV0X3BhZ2UocGFnZSk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGlz
X2Rldm1hcDsKPiArfQo+ICsKPiAgI2Vsc2UgLyogQ09ORklHX0RFVl9QQUdFTUFQX09QUyAqLwo+
ICBzdGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvbW0vbWVtcmVtYXAuYyBiL21tL21lbXJlbWFwLmMK
PiBpbmRleCAwM2NjYmRmZWI2OTcuLmJjN2UyYTI3ZDAyNSAxMDA2NDQKPiAtLS0gYS9tbS9tZW1y
ZW1hcC5jCj4gKysrIGIvbW0vbWVtcmVtYXAuYwo+IEBAIC00MTAsNDggKzQxMCwzOSBAQCBzdHJ1
Y3QgZGV2X3BhZ2VtYXAgKmdldF9kZXZfcGFnZW1hcCh1bnNpZ25lZCBsb25nIHBmbiwKPiAgRVhQ
T1JUX1NZTUJPTF9HUEwoZ2V0X2Rldl9wYWdlbWFwKTsKPgo+ICAjaWZkZWYgQ09ORklHX0RFVl9Q
QUdFTUFQX09QUwo+IC12b2lkIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpCj4gK3ZvaWQgZnJlZV9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdl
KQo+ICB7Cj4gLSAgICAgICBpbnQgY291bnQgPSBwYWdlX3JlZl9kZWNfcmV0dXJuKHBhZ2UpOwo+
ICsgICAgICAgLyogQ2xlYXIgQWN0aXZlIGJpdCBpbiBjYXNlIG9mIHBhcmFsbGVsIG1hcmtfcGFn
ZV9hY2Nlc3NlZCAqLwo+ICsgICAgICAgX19DbGVhclBhZ2VBY3RpdmUocGFnZSk7Cj4gKyAgICAg
ICBfX0NsZWFyUGFnZVdhaXRlcnMocGFnZSk7Cj4gKwo+ICsgICAgICAgbWVtX2Nncm91cF91bmNo
YXJnZShwYWdlKTsKClVnaCwgd2hlbiBkaWQgYWxsIHRoaXMgSE1NIHNwZWNpZmljIG1hbmlwdWxh
dGlvbiBzbmVhayBpbnRvIHRoZQpnZW5lcmljIFpPTkVfREVWSUNFIHBhdGg/IEl0IHVzZWQgdG8g
YmUgZ2F0ZWQgYnkgcGdtYXAgdHlwZSB3aXRoIGl0cwpvd24gcHV0X3pvbmVfZGV2aWNlX3ByaXZh
dGVfcGFnZSgpLiBGb3IgZXhhbXBsZSBpdCdzIGNlcnRhaW5seQp1bm5lY2Vzc2FyeSBhbmQgbWln
aHQgYmUgYnJva2VuICh3b3VsZCBuZWVkIHRvIGNoZWNrKSB0byBjYWxsCm1lbV9jZ3JvdXBfdW5j
aGFyZ2UoKSBvbiBhIERBWCBwYWdlLiBaT05FX0RFVklDRSB1c2VycyBhcmUgbm90IGEKbW9ub2xp
dGggYW5kIHRoZSBITU0gdXNlIGNhc2UgbGVha3MgcGFnZXMgaW50byBjb2RlIHBhdGhzIHRoYXQg
REFYCmV4cGxpY2l0bHkgYXZvaWRzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
