Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E71F9D4A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 23:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9AC6EC1D;
	Tue, 12 Nov 2019 22:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D1C6EC1D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 22:43:25 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id y194so16447843oie.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SwaaHNLQ6Cwcgbew071VEYLmiCBwwXoXuuoAi+2uA2o=;
 b=f3F781Dy++k+1cue0zcuukmQ9V0PauwLLcyU3JETewhCSTWkBfJBOIRzDvmDr8AyOj
 zgNY/mLAc5JMjF5HUw6Dga/7M0CpubUEZaB/j4RhteWHWqecK7Hov8qnd6znwRpOFd1+
 1kYqBU8sXITBwJRg9rvORk6zH3fEQZ3WUVP2UkrbWM02im+qozx/3WkZifbbGNhsNiQ+
 KA97y75cfHraVqkky+32QaBvP4hfZo97klrg87MG8O7Roi5wJ1BLvtcDEIJaDz6mnFiB
 0VfxiUhWOYWq8cArAsxuEu5gMjEPCGk9pG8a2WVlQ3rzPEueluKJYhHvq/Y/q+NpON7R
 QETA==
X-Gm-Message-State: APjAAAW+v4+k8o06oUcJyX1LVD+bHcAKVZTpDachg7Be5HsSX6miCM0e
 6I/C2n26sfkY/MPKLkNu/5m7HPm9lUUuC/s1E0I7xg==
X-Google-Smtp-Source: APXvYqxLBopeTTnZkVho8CVk6N+hGkn5uHiE62zpra+sAfITZV3BdLQKTEc55Ljq6ZrLX2Tr24PR9eCQkyGplH1DN48=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr135827oih.0.1573598604957;
 Tue, 12 Nov 2019 14:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
 <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
In-Reply-To: <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 14:43:14 -0800
Message-ID: <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SwaaHNLQ6Cwcgbew071VEYLmiCBwwXoXuuoAi+2uA2o=;
 b=Jq7Ptqpebw7UGAIdEQ/unEBsB7QbaXVZNTWXCanS5nvK3elyglZtGcUaQ89X7Thh8h
 IAM86ORfnzN6917rhUVFsUy3UD57DPR+XlrbhhZ/NXNnmHMPvg4XpzzSKBe4NqErKRUy
 bZxd+tm9M+MwB7qsXrtdhh4D3/L98cHAZWd0Ns8kuwxv1QWg3yEpu0lT5cnjJPtGKrYR
 anyG20BRg0b0DeF7mLr0STZrxT4BCOm+zZEBDW3gpHBI3V/JOgKkFou2F3URCWxql04L
 MQNOT/7KMRt8tV9Ump9WAqJ7q3xqWRAJd3iDm6wl8QcfVduDF9h8k23QxQ9DnzN60j3u
 /xqQ==
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMjoyNCBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gMTEvMTIvMTkgMTo1NyBQTSwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IC4uLgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBl
MS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+ID4+IGluZGV4IGQ4NjQyNzdl
YTE2Zi4uMDE3Njg5YjdjMzJiIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvdmZpby92ZmlvX2lv
bW11X3R5cGUxLmMKPiA+PiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4g
Pj4gQEAgLTM0OCwyNCArMzQ4LDIwIEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKPiA+PiAgICAgICAgICAgICAgICAg
ZmxhZ3MgfD0gRk9MTF9XUklURTsKPiA+Pgo+ID4+ICAgICAgICAgZG93bl9yZWFkKCZtbS0+bW1h
cF9zZW0pOwo+ID4+IC0gICAgICAgaWYgKG1tID09IGN1cnJlbnQtPm1tKSB7Cj4gPj4gLSAgICAg
ICAgICAgICAgIHJldCA9IGdldF91c2VyX3BhZ2VzKHZhZGRyLCAxLCBmbGFncyB8IEZPTExfTE9O
R1RFUk0sIHBhZ2UsCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZt
YXMpOwo+ID4+IC0gICAgICAgfSBlbHNlIHsKPiA+PiAtICAgICAgICAgICAgICAgcmV0ID0gZ2V0
X3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MsIHBhZ2UsCj4gPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bWFzLCBOVUxMKTsK
PiA+PiAtICAgICAgICAgICAgICAgLyoKPiA+PiAtICAgICAgICAgICAgICAgICogVGhlIGxpZmV0
aW1lIG9mIGEgdmFkZHJfZ2V0X3BmbigpIHBhZ2UgcGluIGlzCj4gPj4gLSAgICAgICAgICAgICAg
ICAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAo+
ID4+IC0gICAgICAgICAgICAgICAgKiBsZWFkIHRvIGluZGVmaW5pdGUgc3RhbGxzIGluIGZpbGVz
eXN0ZW0gb3BlcmF0aW9ucy4KPiA+PiAtICAgICAgICAgICAgICAgICogRGlzYWxsb3cgYXR0ZW1w
dHMgdG8gcGluIGZzLWRheCBwYWdlcyB2aWEgdGhpcwo+ID4+IC0gICAgICAgICAgICAgICAgKiBp
bnRlcmZhY2UuCj4gPj4gLSAgICAgICAgICAgICAgICAqLwo+ID4+IC0gICAgICAgICAgICAgICBp
ZiAocmV0ID4gMCAmJiB2bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKPiA+PiAtICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsKPiA+PiAtICAgICAgICAgICAgICAgICAgICAg
ICBwdXRfcGFnZShwYWdlWzBdKTsKPiA+PiAtICAgICAgICAgICAgICAgfQo+ID4+ICsgICAgICAg
cmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MgfCBG
T0xMX0xPTkdURVJNLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
Z2UsIHZtYXMsIE5VTEwpOwo+ID4KPiA+IEhtbSwgd2hhdCdzIHRoZSBwb2ludCBvZiBwYXNzaW5n
IEZPTExfTE9OR1RFUk0gdG8KPiA+IGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIGlmIGdldF91c2Vy
X3BhZ2VzX3JlbW90ZSgpIGlzIG5vdCBnb2luZyB0bwo+ID4gY2hlY2sgdGhlIHZtYT8gSSB0aGlu
ayB3ZSBnb3QgdG8gdGhpcyBjb2RlIHN0YXRlIGJlY2F1c2UgdGhlCj4KPiBGT0xMX0xPTkdURVJN
IGlzIHNob3J0LWxpdmVkIGluIHRoaXMgbG9jYXRpb24sIGJlY2F1c2UgcGF0Y2ggMjMKPiAoIm1t
L2d1cDogcmVtb3ZlIHN1cHBvcnQgZm9yIGd1cChGT0xMX0xPTkdURVJNKSIpIHJlbW92ZXMgaXQs
IGFmdGVyCj4gY2FsbGVycyBhcmUgY2hhbmdlZCBvdmVyIHRvIHBpbl9sb25ndGVybV9wYWdlcyoo
KS4KPgo+IFNvIEZPTExfTE9OR1RFUk0gaXMgbm90IGRvaW5nIG11Y2ggbm93LCBidXQgaXQgaXMg
YmFzaWNhbGx5IGEgbWFya2VyIGZvcgo+ICJjaGFuZ2UgZ3VwKEZPTExfTE9OR1RFUk0pIHRvIHBp
bl9sb25ndGVybV9wYWdlcygpIiwgYW5kIHBhdGNoIDE4Cj4gYWN0dWFsbHkgbWFrZXMgdGhhdCBj
aGFuZ2UuCj4KPiBBbmQgdGhlbiBwaW5fbG9uZ3Rlcm1fcGFnZXMqKCkgaXMsIGluIHR1cm4sIGEg
d2F5IHRvIG1hcmsgYWxsIHRoZQo+IHBsYWNlcyB0aGF0IG5lZWQgZmlsZSBzeXN0ZW0gYW5kL29y
IHVzZXIgc3BhY2UgaW50ZXJhY3Rpb25zIChsYXlvdXQKPiBsZWFzZXMsIGV0YyksIGFzIHBlciAi
Q2FzZSAyOiBSRE1BIiBpbiB0aGUgbmV3Cj4gRG9jdW1lbnRhdGlvbi92bS9waW5fdXNlcl9wYWdl
cy5yc3QuCgpBaCwgc29ycnkuIFRoaXMgd2FzIHRoZSBmaXJzdCB0aW1lIEkgaGFkIGxvb2tlZCBh
dCB0aGlzIHNlcmllcyBhbmQKanVtcGVkIGluIHdpdGhvdXQgcmVhZGluZyB0aGUgYmFja2dyb3Vu
ZC4KCllvdXIgcGF0Y2ggYXMgaXMgbG9va3Mgb2ssIEkgYXNzdW1lIHlvdSd2ZSByZW1vdmVkIHRo
ZSBGT0xMX0xPTkdURVJNCndhcm5pbmcgaW4gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlIGluIGFub3Ro
ZXIgcGF0Y2g/Cgo+Cj4gPiBnZXRfdXNlcl9wYWdlcygpIHZzIGdldF91c2VyX3BhZ2VzX3JlbW90
ZSgpIHNwbGl0IHByZWRhdGVkIHRoZQo+ID4gaW50cm9kdWN0aW9uIG9mIEZPTExfTE9OR1RFUk0u
Cj4KPiBZZXMuIEFuZCBJIGRvIHdhbnQgY2xlYW4gdGhpcyB1cCBhcyBJIGdvLCBzbyB3ZSBkb24n
dCBlbmQgdXAgd2l0aAo+IHN0YWxlIGNvbmNlcHRzIGxpbmdlcmluZyBpbiBndXAuYy4uLgo+Cj4g
Pgo+ID4gSSB0aGluayBjaGVja192bWFfZmxhZ3MoKSBzaG91bGQgZG8gdGhlICgoRk9MTF9MT05H
VEVSTSB8IEZPTExfR0VUKSAmJgo+ID4gdm1hX2lzX2ZzZGF4KCkpIGNoZWNrIGFuZCB0aGF0IHdv
dWxkIGFsc28gcmVtb3ZlIHRoZSBuZWVkIGZvcgo+ID4gX19ndXBfbG9uZ3Rlcm1fbG9ja2VkLgo+
ID4KPgo+IEdvb2QgaWRlYSwgYnV0IHRoZXJlIGlzIHN0aWxsIHRoZSBjYWxsIHRvIGNoZWNrX2Fu
ZF9taWdyYXRlX2NtYV9wYWdlcygpLAo+IGluc2lkZSBfX2d1cF9sb25ndGVybV9sb2NrZWQoKS4g
IFNvIGl0J3MgYSBsaXR0bGUgbW9yZSBpbnZvbHZlZCBhbmQKPiB3ZSBjYW4ndCB0cml2aWFsbHkg
ZGVsZXRlIF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpIHlldCwgcmlnaHQ/CgpbIGFkZCBBbmVlc2gg
XQoKWWVzLCB5b3UncmUgcmlnaHQuIEkgaGFkIG92ZXJsb29rZWQgdGhhdCBoYWQgc251Y2sgaW4g
dGhlcmUuIFRoYXQgdG8KbWUgc2ltaWxhcmx5IG5lZWRzIHRvIGJlIHB1c2hlZCBkb3duIGludG8g
dGhlIGNvcmUgd2l0aCBpdHMgb3duIEZPTEwKZmxhZywgb3IgaXQgbmVlZHMgdG8gYmUgYW4gZXhw
bGljaXQgZml4dXAgdGhhdCBlYWNoIGNhbGxlciBkb2VzIGFmdGVyCmdldF91c2VyX3BhZ2VzLiBU
aGUgZmFjdCB0aGF0IG1pZ3JhdGlvbiBzaWxlbnRseSBoYXBwZW5zIGFzIGEgc2lkZQplZmZlY3Qg
b2YgZ3VwIGlzIHRvbyBtYWdpY2FsIGZvciBteSB0YXN0ZS4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
