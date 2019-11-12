Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06D5F9DEB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 00:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A346EB86;
	Tue, 12 Nov 2019 23:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40ED6EB86
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 23:15:10 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id s71so16499220oih.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ahg4ogj/xxSIi3Tz2dndpoesa0PkRLQ36VHrjNwVguE=;
 b=bD9IOEaCgU2Yg0SVZGV5F3RATA/wwadok87Uv12NtEIAzlOlUPrgu3ZB8K4xtVp52V
 eED1k6oBdcZaykHXlRbK8x/igd1HHtKPN442r4XpVmXK1dNskntMLhBVr8vW95NLXiv5
 VWnjzPJuAXOW6RDVjRM8vpARIgIVHnrCLW+AqFoZ47I3USQwpgaenHwlvcXThPDK/VWu
 485df329cImXCOld1xtehqm7NX/mRLwYGVXcjGynCd22aqSlRrbRredAHD21ZEtgr7cv
 dw++3pe5hvwJqcnvpKhRjwBdjnjCeUIzyzndcO6k9O+1S/E9BmKUHVy2g2Vpw4USu+dP
 DdaA==
X-Gm-Message-State: APjAAAWN4Sm0+Ity1kp7vV7meGymsY+7UgGyYDWBUsHS+XCuBuS0iVbz
 pVVXpiY3QbbvmIMIyK1akOh8Cz4F5/+PeCSTNIp54A==
X-Google-Smtp-Source: APXvYqw0y1/AL1ibfnKpdRZPCFvNtcNTDnagWkblsIboSxBlSGgp0qhR7HkhIvJGPGFUg8U4pz3vKkN+eKromPrOJOY=
X-Received: by 2002:aca:ad52:: with SMTP id w79mr178668oie.149.1573600509804; 
 Tue, 12 Nov 2019 15:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
 <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
 <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
 <729a16cb-3947-c7cb-c57f-6c917d240665@nvidia.com>
In-Reply-To: <729a16cb-3947-c7cb-c57f-6c917d240665@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 15:14:58 -0800
Message-ID: <CAPcyv4gUe__09cnAh3jeFogJH=sGm9U+8axRq_kCASkdbLfNbQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ahg4ogj/xxSIi3Tz2dndpoesa0PkRLQ36VHrjNwVguE=;
 b=xlO/3o/FAhmPzmX5yHbU6ZNuHn4V9nHbloPGHpZqsb+DPkTsTeMinCTT3P2xrA0A3t
 XjX5crvs+XLSDSgcai6PZWx41nUjrksNl4jkRdGfTQpb6e1yLtFehh/VkrzYDg6mpqa6
 nIua0PamDKkJ2o4Dp1t2Oe3HiXMlIx7Jxg8UopWGV46jcBHLtzfhKxYanb2GfMvC3xgc
 V252jaKpAjhpDskcu/pPNVnV9ekVH+4FC/dXONxMnvQ71JXMw8m5ltg2SL6haNirS3nS
 2zfdpmAUDtoGxjGX0JdEV3chYwlXK5G60EaIDM8oX92yL7sroQqX5o/Sf8CBMjZV3ums
 ZwPA==
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMzowOCBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gMTEvMTIvMTkgMjo0MyBQTSwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IC4uLgo+ID4gQWgsIHNvcnJ5LiBUaGlzIHdhcyB0aGUgZmlyc3QgdGltZSBJIGhhZCBs
b29rZWQgYXQgdGhpcyBzZXJpZXMgYW5kCj4gPiBqdW1wZWQgaW4gd2l0aG91dCByZWFkaW5nIHRo
ZSBiYWNrZ3JvdW5kLgo+ID4KPiA+IFlvdXIgcGF0Y2ggYXMgaXMgbG9va3Mgb2ssIEkgYXNzdW1l
IHlvdSd2ZSByZW1vdmVkIHRoZSBGT0xMX0xPTkdURVJNCj4gPiB3YXJuaW5nIGluIGdldF91c2Vy
X3BhZ2VzX3JlbW90ZSBpbiBhbm90aGVyIHBhdGNoPwo+ID4KPgo+IEFjdHVhbGx5LCBJIGhhdmVu
J3QgZ29uZSBxdWl0ZSB0aGF0IGZhci4gQWN0dWFsbHkgdGhpcyBwYXRjaCBpcyB0aGUgbGFzdAo+
IGNoYW5nZSB0byB0aGF0IGZ1bmN0aW9uLiBUaGVyZWZvcmUsIGF0IHRoZSBlbmQgb2YgdGhpcyBw
YXRjaHNldCwKPiBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBlbmRzIHVwIHdpdGggdGhpcyBjaGVj
ayBpbiBpdCB3aGljaAo+IGlzIGEgbGVzcy1yZXN0cmljdGl2ZSB2ZXJzaW9uIG9mIHRoZSB3YXJu
aW5nOgo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogQ3VycmVudCBGT0xMX0xPTkdURVJNIGJl
aGF2aW9yIGlzIGluY29tcGF0aWJsZSB3aXRoCj4gICAgICAgICAgKiBGQVVMVF9GTEFHX0FMTE9X
X1JFVFJZIGJlY2F1c2Ugb2YgdGhlIEZTIERBWCBjaGVjayByZXF1aXJlbWVudCBvbgo+ICAgICAg
ICAgICogdm1hcy4gSG93ZXZlciwgdGhpcyBvbmx5IGNvbWVzIHVwIGlmIGxvY2tlZCBpcyBzZXQs
IGFuZCB0aGVyZSBhcmUKPiAgICAgICAgICAqIGNhbGxlcnMgdGhhdCBkbyByZXF1ZXN0IEZPTExf
TE9OR1RFUk0sIGJ1dCBkbyBub3Qgc2V0IGxvY2tlZC4gU28sCj4gICAgICAgICAgKiBhbGxvdyB3
aGF0IHdlIGNhbi4KPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKGd1cF9mbGFncyAmIEZPTExf
TE9OR1RFUk0pIHsKPiAgICAgICAgICAgICAgICAgaWYgKFdBUk5fT05fT05DRShsb2NrZWQpKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgfQo+Cj4g
SXMgdGhhdCBPSywgb3IgZGlkIHlvdSB3YW50IHRvIGdvIGZ1cnRoZXIgKHBvc3NpYmx5IGluIGEg
Zm9sbG93LXVwCj4gcGF0Y2hzZXQsIGFzIEknbSBob3BpbmcgdG8gZ2V0IHRoaXMgb25lIGluIHNv
b24pPwoKVGhhdCBsb29rcyBvay4gU29tZXRoaW5nIHRvIG1heWJlIHB1c2ggZG93biBpbnRvIHRo
ZSBjb3JlIGluIGEgZnV0dXJlCmNsZWFudXAsIGJ1dCBub3Qgc29tZXRoaW5nIHRoYXQgbmVlZHMg
dG8gYmUgZG9uZSBub3cuCgo+IC4uLgo+ID4+PiBJIHRoaW5rIGNoZWNrX3ZtYV9mbGFncygpIHNo
b3VsZCBkbyB0aGUgKChGT0xMX0xPTkdURVJNIHwgRk9MTF9HRVQpICYmCj4gPj4+IHZtYV9pc19m
c2RheCgpKSBjaGVjayBhbmQgdGhhdCB3b3VsZCBhbHNvIHJlbW92ZSB0aGUgbmVlZCBmb3IKPiA+
Pj4gX19ndXBfbG9uZ3Rlcm1fbG9ja2VkLgo+ID4+Pgo+ID4+Cj4gPj4gR29vZCBpZGVhLCBidXQg
dGhlcmUgaXMgc3RpbGwgdGhlIGNhbGwgdG8gY2hlY2tfYW5kX21pZ3JhdGVfY21hX3BhZ2VzKCks
Cj4gPj4gaW5zaWRlIF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpLiAgU28gaXQncyBhIGxpdHRsZSBt
b3JlIGludm9sdmVkIGFuZAo+ID4+IHdlIGNhbid0IHRyaXZpYWxseSBkZWxldGUgX19ndXBfbG9u
Z3Rlcm1fbG9ja2VkKCkgeWV0LCByaWdodD8KPiA+Cj4gPiBbIGFkZCBBbmVlc2ggXQo+ID4KPiA+
IFllcywgeW91J3JlIHJpZ2h0LiBJIGhhZCBvdmVybG9va2VkIHRoYXQgaGFkIHNudWNrIGluIHRo
ZXJlLiBUaGF0IHRvCj4gPiBtZSBzaW1pbGFybHkgbmVlZHMgdG8gYmUgcHVzaGVkIGRvd24gaW50
byB0aGUgY29yZSB3aXRoIGl0cyBvd24gRk9MTAo+ID4gZmxhZywgb3IgaXQgbmVlZHMgdG8gYmUg
YW4gZXhwbGljaXQgZml4dXAgdGhhdCBlYWNoIGNhbGxlciBkb2VzIGFmdGVyCj4gPiBnZXRfdXNl
cl9wYWdlcy4gVGhlIGZhY3QgdGhhdCBtaWdyYXRpb24gc2lsZW50bHkgaGFwcGVucyBhcyBhIHNp
ZGUKPiA+IGVmZmVjdCBvZiBndXAgaXMgdG9vIG1hZ2ljYWwgZm9yIG15IHRhc3RlLgo+ID4KPgo+
IFllcy4gSXQncyBhbiBpbnRydXNpdmUgc2lkZSBlZmZlY3QgdGhhdCBpcyBzdXJwcmlzaW5nLCBh
bmQgbm90IGluIGEKPiAiaGFwcHkgc3VycHJpc2UiIHdheS4gOikgLiAgIEZpeGluZyB1cCB0aGUg
Q01BIHBhZ2VzIGJ5IHNwbGl0dGluZyB0aGF0Cj4gZnVuY3Rpb25hbGl0eSBpbnRvIHNlcGFyYXRl
IGZ1bmN0aW9uIGNhbGxzIHNvdW5kcyBsaWtlIGFuIGltcHJvdmVtZW50Cj4gd29ydGggZXhwbG9y
aW5nLgoKUmlnaHQsIGZ1dHVyZSB3b3JrLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
