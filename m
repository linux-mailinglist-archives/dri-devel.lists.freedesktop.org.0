Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE12FB7E2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 19:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A8E6EDFE;
	Wed, 13 Nov 2019 18:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65226EDFE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 18:46:01 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id n23so2516594otr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cT4Ynp7AABnbetkKbYtY9L84HJMiir4x9aUvgO3qIkA=;
 b=FutouLTuNcam28mtp0rMQG0qPLeEsb2ljmET1cq4/oUrl5atkVg4v8//QZoZ2hZR9t
 uq7KaR+8uwv/ep5crYOIWlR2nspKgr9FeNhDOZKKN8v01nGrPSxc2fJgPNje5ntSb0YZ
 0aP1148IY72afXBOkgs+RYIcAE2dkUVCtL1Z4TQDyAmoH8GhR+5R+GYlb+zrGMdHpsLg
 8Z6dzFbCUSOuf6f/0ccn7HijRGu9BzXoyiQaCt53vr2zhkxm6lfiemcpEREEaYfzqLrW
 Dd8UlLBzvs5FZUeFxZPM2zt4lvABiL5rsWrK0dZZrBFkCmWZgF9hSjyrbCAAW2h8c7IG
 C19g==
X-Gm-Message-State: APjAAAWs8WyyaiuHJc1jhnGPq0rNboVN6L4hJ3ZQkPKbm9NQ5ykNfeh8
 VUFy+3PhNnfathq5Ql3SDLIn3Y8EA4RiQtQnyIWt+A==
X-Google-Smtp-Source: APXvYqyPn+rDZrNle0VfTIMlvvY+/KynBCjFHBDHqyFwY/x5q0B2O33H3JfKZdicH8PxUo9GG3nCazg6kogrLq1IvZ4=
X-Received: by 2002:a05:6830:1af7:: with SMTP id
 c23mr4066831otd.247.1573670761142; 
 Wed, 13 Nov 2019 10:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113104308.GE6367@quack2.suse.cz>
In-Reply-To: <20191113104308.GE6367@quack2.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 Nov 2019 10:45:49 -0800
Message-ID: <CAPcyv4gJbmf9aRU_5_umiE7GvTWG1D+zkCMNxrU=LYn-n0arNA@mail.gmail.com>
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jan Kara <jack@suse.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cT4Ynp7AABnbetkKbYtY9L84HJMiir4x9aUvgO3qIkA=;
 b=a7A+dcs4qLyRwykFz5P8aF/5gHL9KK36xtIfXVr/kBk3uPlOEckoeys38y+nnoealE
 xzZU97hBkbVqSDW3gJxcm8meBZzrkQaKb0fOpplJk89VtBOEN/d/rvjF/p1FfJJqTTXv
 4RFlHCPjmONBQGpTT3WPud0MHuI1arLibsaS9qkCPzQA4NQZsJVxDT/hq2PSgxZUbK6j
 hmavUnr3qxAC5dpB11ue+Kc8RjftT0go7LTB3CRWT06X6W6/Vr35u8YiRNHJv46YGe1d
 7YKSAbhOh/ee5b8uqRA8DDWS3/IOwVUmAGMREeaTodHgoCOvb7Na9VVd6Z5oKT3OMDr8
 TTJg==
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
Cc: Michal Hocko <mhocko@suse.com>, KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
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

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMjo0MyBBTSBKYW4gS2FyYSA8amFja0BzdXNlLmN6PiB3
cm90ZToKPgo+IE9uIFR1ZSAxMi0xMS0xOSAyMDoyNjo1NiwgSm9obiBIdWJiYXJkIHdyb3RlOgo+
ID4gSW50cm9kdWNlIHBpbl91c2VyX3BhZ2VzKigpIHZhcmlhdGlvbnMgb2YgZ2V0X3VzZXJfcGFn
ZXMqKCkgY2FsbHMsCj4gPiBhbmQgYWxzbyBwaW5fbG9uZ3Rlcm1fcGFnZXMqKCkgdmFyaWF0aW9u
cy4KPiA+Cj4gPiBUaGVzZSB2YXJpYW50cyBhbGwgc2V0IEZPTExfUElOLCB3aGljaCBpcyBhbHNv
IGludHJvZHVjZWQsIGFuZAo+ID4gdGhvcm91Z2hseSBkb2N1bWVudGVkLgo+ID4KPiA+IFRoZSBw
aW5fbG9uZ3Rlcm0qKCkgdmFyaWFudHMgYWxzbyBzZXQgRk9MTF9MT05HVEVSTSwgaW4gYWRkaXRp
b24KPiA+IHRvIEZPTExfUElOOgo+ID4KPiA+ICAgICBwaW5fdXNlcl9wYWdlcygpCj4gPiAgICAg
cGluX3VzZXJfcGFnZXNfcmVtb3RlKCkKPiA+ICAgICBwaW5fdXNlcl9wYWdlc19mYXN0KCkKPiA+
Cj4gPiAgICAgcGluX2xvbmd0ZXJtX3BhZ2VzKCkKPiA+ICAgICBwaW5fbG9uZ3Rlcm1fcGFnZXNf
cmVtb3RlKCkKPiA+ICAgICBwaW5fbG9uZ3Rlcm1fcGFnZXNfZmFzdCgpCj4gPgo+ID4gQWxsIHBh
Z2VzIHRoYXQgYXJlIHBpbm5lZCB2aWEgdGhlIGFib3ZlIGNhbGxzLCBtdXN0IGJlIHVucGlubmVk
IHZpYQo+ID4gcHV0X3VzZXJfcGFnZSgpLgo+ID4KPiA+IFRoZSB1bmRlcmx5aW5nIHJ1bGVzIGFy
ZToKPiA+Cj4gPiAqIFRoZXNlIGFyZSBndXAtaW50ZXJuYWwgZmxhZ3MsIHNvIHRoZSBjYWxsIHNp
dGVzIHNob3VsZCBub3QgZGlyZWN0bHkKPiA+IHNldCBGT0xMX1BJTiBub3IgRk9MTF9MT05HVEVS
TS4gVGhhdCBiZWhhdmlvciBpcyBlbmZvcmNlZCB3aXRoCj4gPiBhc3NlcnRpb25zLCBmb3IgdGhl
IG5ldyBGT0xMX1BJTiBmbGFnLiBIb3dldmVyLCBmb3IgdGhlIHByZS1leGlzdGluZwo+ID4gRk9M
TF9MT05HVEVSTSBmbGFnLCB3aGljaCBoYXMgc29tZSBjYWxsIHNpdGVzIHRoYXQgc3RpbGwgZGly
ZWN0bHkKPiA+IHNldCBGT0xMX0xPTkdURVJNLCB0aGVyZSBpcyBubyBhc3NlcnRpb24geWV0Lgo+
ID4KPiA+ICogQ2FsbCBzaXRlcyB0aGF0IHdhbnQgdG8gaW5kaWNhdGUgdGhhdCB0aGV5IGFyZSBn
b2luZyB0byBkbyBEaXJlY3RJTwo+ID4gICAoIkRJTyIpIG9yIHNvbWV0aGluZyB3aXRoIHNpbWls
YXIgY2hhcmFjdGVyaXN0aWNzLCBzaG91bGQgY2FsbCBhCj4gPiAgIGdldF91c2VyX3BhZ2VzKCkt
bGlrZSB3cmFwcGVyIGNhbGwgdGhhdCBzZXRzIEZPTExfUElOLiBUaGVzZSB3cmFwcGVycwo+ID4g
ICB3aWxsOgo+ID4gICAgICAgICAqIFN0YXJ0IHdpdGggInBpbl91c2VyX3BhZ2VzIiBpbnN0ZWFk
IG9mICJnZXRfdXNlcl9wYWdlcyIuIFRoYXQKPiA+ICAgICAgICAgICBtYWtlcyBpdCBlYXN5IHRv
IGZpbmQgYW5kIGF1ZGl0IHRoZSBjYWxsIHNpdGVzLgo+ID4gICAgICAgICAqIFNldCBGT0xMX1BJ
Tgo+ID4KPiA+ICogRm9yIHBhZ2VzIHRoYXQgYXJlIHJlY2VpdmVkIHZpYSBGT0xMX1BJTiwgdGhv
c2UgcGFnZXMgbXVzdCBiZSByZXR1cm5lZAo+ID4gICB2aWEgcHV0X3VzZXJfcGFnZSgpLgo+ID4K
PiA+IFRoYW5rcyB0byBKYW4gS2FyYSBhbmQgVmxhc3RpbWlsIEJhYmthIGZvciBleHBsYWluaW5n
IHRoZSA0IGNhc2VzCj4gPiBpbiB0aGlzIGRvY3VtZW50YXRpb24uIChJJ3ZlIHJld29yZGVkIGl0
IGFuZCBleHBhbmRlZCB1cG9uIGl0LikKPiA+Cj4gPiBSZXZpZXdlZC1ieTogTWlrZSBSYXBvcG9y
dCA8cnBwdEBsaW51eC5pYm0uY29tPiAgIyBEb2N1bWVudGF0aW9uCj4gPiBSZXZpZXdlZC1ieTog
SsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiBDYzogSm9uYXRoYW4gQ29y
YmV0IDxjb3JiZXRAbHduLm5ldD4KPiA+IENjOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Cj4KPiBUaGFua3MgZm9yIHRoZSBkb2N1bWVudGF0aW9uLiBJdCBsb29rcyBncmVhdCEKPgo+ID4g
ZGlmZiAtLWdpdCBhL21tL2d1cC5jIGIvbW0vZ3VwLmMKPiA+IGluZGV4IDgzNzAyYjJlODZjOC4u
NDQwOWU4NGRmZjUxIDEwMDY0NAo+ID4gLS0tIGEvbW0vZ3VwLmMKPiA+ICsrKyBiL21tL2d1cC5j
Cj4gPiBAQCAtMjAxLDYgKzIwMSwxMCBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKmZvbGxvd19wYWdl
X3B0ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiA+ICAgICAgIHNwaW5sb2NrX3QgKnB0
bDsKPiA+ICAgICAgIHB0ZV90ICpwdGVwLCBwdGU7Cj4gPgo+ID4gKyAgICAgLyogRk9MTF9HRVQg
YW5kIEZPTExfUElOIGFyZSBtdXR1YWxseSBleGNsdXNpdmUuICovCj4gPiArICAgICBpZiAoV0FS
Tl9PTl9PTkNFKChmbGFncyAmIChGT0xMX1BJTiB8IEZPTExfR0VUKSkgPT0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgKEZPTExfUElOIHwgRk9MTF9HRVQpKSkKPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4gPiAgcmV0cnk6Cj4gPiAgICAgICBpZiAodW5saWtl
bHkocG1kX2JhZCgqcG1kKSkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBub19wYWdlX3RhYmxl
KHZtYSwgZmxhZ3MpOwo+Cj4gSG93IGRvZXMgRk9MTF9QSU4gcmVzdWx0IGluIGdyYWJiaW5nIChh
dCBsZWFzdCBub3JtYWwsIGZvciBub3cpIHBhZ2UgcmVmZXJlbmNlPwo+IEkgZGlkbid0IGZpbmQg
dGhhdCBhbnl3aGVyZSBpbiB0aGlzIHBhdGNoIGJ1dCBpdCBpcyBhIHByZXJlcXVpc2l0ZSB0bwo+
IGNvbnZlcnRpbmcgYW55IHVzZXIgdG8gcGluX3VzZXJfcGFnZXMoKSBpbnRlcmZhY2UsIHJpZ2h0
Pwo+Cj4gPiArLyoqCj4gPiArICogcGluX3VzZXJfcGFnZXNfZmFzdCgpIC0gcGluIHVzZXIgcGFn
ZXMgaW4gbWVtb3J5IHdpdGhvdXQgdGFraW5nIGxvY2tzCj4gPiArICoKPiA+ICsgKiBOZWFybHkg
dGhlIHNhbWUgYXMgZ2V0X3VzZXJfcGFnZXNfZmFzdCgpLCBleGNlcHQgdGhhdCBGT0xMX1BJTiBp
cyBzZXQuIFNlZQo+ID4gKyAqIGdldF91c2VyX3BhZ2VzX2Zhc3QoKSBmb3IgZG9jdW1lbnRhdGlv
biBvbiB0aGUgZnVuY3Rpb24gYXJndW1lbnRzLCBiZWNhdXNlCj4gPiArICogdGhlIGFyZ3VtZW50
cyBoZXJlIGFyZSBpZGVudGljYWwuCj4gPiArICoKPiA+ICsgKiBGT0xMX1BJTiBtZWFucyB0aGF0
IHRoZSBwYWdlcyBtdXN0IGJlIHJlbGVhc2VkIHZpYSBwdXRfdXNlcl9wYWdlKCkuIFBsZWFzZQo+
ID4gKyAqIHNlZSBEb2N1bWVudGF0aW9uL3ZtL3Bpbl91c2VyX3BhZ2VzLnJzdCBmb3IgZnVydGhl
ciBkZXRhaWxzLgo+ID4gKyAqCj4gPiArICogVGhpcyBpcyBpbnRlbmRlZCBmb3IgQ2FzZSAxIChE
SU8pIGluIERvY3VtZW50YXRpb24vdm0vcGluX3VzZXJfcGFnZXMucnN0LiBJdAo+ID4gKyAqIGlz
IE5PVCBpbnRlbmRlZCBmb3IgQ2FzZSAyIChSRE1BOiBsb25nLXRlcm0gcGlucykuCj4gPiArICov
Cj4gPiAraW50IHBpbl91c2VyX3BhZ2VzX2Zhc3QodW5zaWduZWQgbG9uZyBzdGFydCwgaW50IG5y
X3BhZ2VzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBndXBfZmxhZ3Ms
IHN0cnVjdCBwYWdlICoqcGFnZXMpCj4gPiArewo+ID4gKyAgICAgLyogRk9MTF9HRVQgYW5kIEZP
TExfUElOIGFyZSBtdXR1YWxseSBleGNsdXNpdmUuICovCj4gPiArICAgICBpZiAoV0FSTl9PTl9P
TkNFKGd1cF9mbGFncyAmIEZPTExfR0VUKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gPiArCj4gPiArICAgICBndXBfZmxhZ3MgfD0gRk9MTF9QSU47Cj4gPiArICAgICByZXR1
cm4gaW50ZXJuYWxfZ2V0X3VzZXJfcGFnZXNfZmFzdChzdGFydCwgbnJfcGFnZXMsIGd1cF9mbGFn
cywgcGFnZXMpOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChwaW5fdXNlcl9wYWdlc19m
YXN0KTsKPgo+IEkgd2FzIHNvbWV3aGF0IHdvbmRlcmluZyBhYm91dCB0aGUgbnVtYmVyIG9mIGZ1
bmN0aW9ucyB5b3UgYWRkIGhlcmUuIFNvIHdlCj4gaGF2ZToKPgo+IHBpbl91c2VyX3BhZ2VzKCkK
PiBwaW5fdXNlcl9wYWdlc19mYXN0KCkKPiBwaW5fdXNlcl9wYWdlc19yZW1vdGUoKQo+Cj4gYW5k
IHRoZW4gbG9uZ3Rlcm0gdmFyaWFudHM6Cj4KPiBwaW5fbG9uZ3Rlcm1fcGFnZXMoKQo+IHBpbl9s
b25ndGVybV9wYWdlc19mYXN0KCkKPiBwaW5fbG9uZ3Rlcm1fcGFnZXNfcmVtb3RlKCkKPgo+IGFu
ZCBvYnZpb3VzbHkgd2UgaGF2ZSBndXAgbGlrZToKPiBnZXRfdXNlcl9wYWdlcygpCj4gZ2V0X3Vz
ZXJfcGFnZXNfZmFzdCgpCj4gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkKPiAuLi4gYW5kIHNvbWUg
b3RoZXIgZ3VwIHZhcmlhbnRzIC4uLgo+Cj4gSSB0aGluayB3ZSByZWFsbHkgc2hvdWxkIGhhdmUg
cGluXyogdnMgZ2V0XyogdmFyaWFudHMgYXMgdGhleSBhcmUgdmVyeQo+IGRpZmZlcmVudCBpbiB0
ZXJtcyBvZiBndWFyYW50ZWVzIGFuZCBhZnRlciBjb252ZXJzaW9uLCBhbnkgdXNlIG9mIGdldF8q
Cj4gdmFyaWFudCBpbiBub24tbW0gY29kZSBzaG91bGQgYmUgY2xvc2VseSBzY3J1dGluaXplZC4g
T1RPSCBwaW5fbG9uZ3Rlcm1fKgo+IGRvbid0IGxvb2sgKnRoYXQqIHVzZWZ1bCB0byBtZSBhbmQg
anVzdCB1c2luZyBwaW5fKiBpbnN0ZWFkIHdpdGgKPiBGT0xMX0xPTkdURVJNIGZsYWcgd291bGQg
bG9vayBPSyB0byBtZSBhbmQgc29tZXdoYXQgcmVkdWNlIHRoZSBudW1iZXIgb2YKPiBmdW5jdGlv
bnMgd2hpY2ggaXMgYWxyZWFkeSBsYXJnZSBlbm91Z2g/IFdoYXQgZG8gcGVvcGxlIHRoaW5rPyBJ
IGRvbid0IGZlZWwKPiB0b28gc3Ryb25nbHkgYWJvdXQgdGhpcyBidXQgd2FudGVkIHRvIGJyaW5n
IHRoaXMgdXAuCgpJJ2Qgdm90ZSBmb3IgRk9MTF9MT05HVEVSTSBzaG91bGQgb2J2aWF0ZSB0aGUg
bmVlZCBmb3IKe2dldCxwaW59X3VzZXJfcGFnZXNfbG9uZ3Rlcm0oKS4gSXQncyBhIHByb3BlcnR5
IHRoYXQgaXMgcGFzc2VkIGJ5IHRoZQpjYWxsIHNpdGUsIG5vdCBhbiBpbnRlcm5hbCBmbGFnLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
