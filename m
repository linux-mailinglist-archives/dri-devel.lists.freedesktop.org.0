Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDF0B6649
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB7B6F3B5;
	Wed, 18 Sep 2019 14:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D43E6F3B5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:41:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v38so212198edm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 07:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WbdKZkVaqIeYXFAePQEUm0K6Q0pnIntJd0Ufr5WX588=;
 b=Kfv/LVIVd70NyFG8CXJVd0yoazpDOaLXvNsz/dJZLH+6epSZgQS0CGBzU8XQXOWkih
 31Kdx4BY51fOdaJYv1NI2VjtXTTPQFQVeZpgqMyqP1Wjs8dSa9p1lwkgzfmsNiPdrxrI
 Bp3x4qVxxDuIBJwARbW/w4LNtbzhQCHjaSbbUFaEJsDyH5qSlaFOLwsLLJMVAmJo55Nj
 tLRegCCFydtPstWFShahQ9IKbOZwFeAA8aOufofYtQ/WByiL9Idru7CoJazR7F1zc9pn
 LI/U50dT8RJ6ngUKjCAqSsebNu854EA8pjQG0SnvbYPDJg9HBbzdg9vAV9lwpK6EF2+f
 j/gA==
X-Gm-Message-State: APjAAAWZFgwjTqLX9hi1dAv2uJnr7nnCPp+yBqDmme+GGPcDqE1RKf/s
 nIuya3Uo0gfjENEF+tIYlRxjng==
X-Google-Smtp-Source: APXvYqxgmeVfhtDEtiJtgOKdVinAYjDvcBpPFWpBlvemIoPiWexeB0TF1pS1tIUsLeUKYzTg9rflAg==
X-Received: by 2002:a50:fd10:: with SMTP id i16mr8082111eds.239.1568817659723; 
 Wed, 18 Sep 2019 07:40:59 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id j1sm681317ejc.13.2019.09.18.07.40.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Sep 2019 07:40:59 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 55925101B27; Wed, 18 Sep 2019 17:41:02 +0300 (+03)
Date: Wed, 18 Sep 2019 17:41:02 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 1/7] mm: Add write-protect and clean utilities for
 address space ranges
Message-ID: <20190918144102.jkukmhifmweagmwt@box>
References: <20190918125914.38497-1-thomas_os@shipmail.org>
 <20190918125914.38497-2-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918125914.38497-2-thomas_os@shipmail.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=WbdKZkVaqIeYXFAePQEUm0K6Q0pnIntJd0Ufr5WX588=;
 b=fflVkpkGmtKJ99haJdbinaGgTE5566RU3Ym0c0y8xZgW/dkasHGT/Jm18khXW6sWj2
 JH7Lt2KLvkYOCBD02BJ7KKYBAK24/dZ90xwa9siV5DIpJKjgRDHtFezwPqi1WYOMesPT
 2c0IGzpi7BnmF+lFnm8npt+rD4ybvXsivPyksghyz07fYAWfeQyKWjrt3prFugMo+zb/
 F/Y61NpZ75Ji3+fCoK/L13w9dgTZRQgPIOEUOPjdxNmzxVvbZXsFPkucoY51nFizv044
 OK/99jaffqyHYTJmvF0gLWAJL0AMX7OTosCnFpiDtp4WfbUtvs4C/tuYjUOJBDIpycyY
 ZW9w==
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 linux-graphics-maintainer@vmware.com, Matthew Wilcox <willy@infradead.org>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDI6NTk6MDhQTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2
bXdhcmUuY29tPgo+IAo+IEFkZCB0d28gdXRpbGl0aWVzIHRvIGEpIHdyaXRlLXByb3RlY3QgYW5k
IGIpIGNsZWFuIGFsbCBwdGVzIHBvaW50aW5nIGludG8KPiBhIHJhbmdlIG9mIGFuIGFkZHJlc3Mg
c3BhY2UuCj4gVGhlIHV0aWxpdGllcyBhcmUgaW50ZW5kZWQgdG8gYWlkIGluIHRyYWNraW5nIGRp
cnR5IHBhZ2VzIChlaXRoZXIKPiBkcml2ZXItYWxsb2NhdGVkIHN5c3RlbSBtZW1vcnkgb3IgcGNp
IGRldmljZSBtZW1vcnkpLgo+IFRoZSB3cml0ZS1wcm90ZWN0IHV0aWxpdHkgc2hvdWxkIGJlIHVz
ZWQgaW4gY29uanVuY3Rpb24gd2l0aAo+IHBhZ2VfbWt3cml0ZSgpIGFuZCBwZm5fbWt3cml0ZSgp
IHRvIHRyaWdnZXIgd3JpdGUgcGFnZS1mYXVsdHMgb24gcGFnZQo+IGFjY2Vzc2VzLiBUeXBpY2Fs
bHkgb25lIHdvdWxkIHdhbnQgdG8gdXNlIHRoaXMgb24gc3BhcnNlIGFjY2Vzc2VzIGludG8KPiBs
YXJnZSBtZW1vcnkgcmVnaW9ucy4gVGhlIGNsZWFuIHV0aWxpdHkgc2hvdWxkIGJlIHVzZWQgdG8g
dXRpbGl6ZQo+IGhhcmR3YXJlIGRpcnR5aW5nIGZ1bmN0aW9uYWxpdHkgYW5kIGF2b2lkIHRoZSBv
dmVyaGVhZCBvZiBwYWdlLWZhdWx0cywKPiB0eXBpY2FsbHkgb24gbGFyZ2UgYWNjZXNzZXMgaW50
byBzbWFsbCBtZW1vcnkgcmVnaW9ucy4KPiAKPiBUaGUgYWRkZWQgZmlsZSAiYXNfZGlydHlfaGVs
cGVycy5jIiBpcyBpbml0aWFsbHkgbGlzdGVkIGFzIG1haW50YWluZWQgYnkKPiBWTXdhcmUgdW5k
ZXIgb3VyIERSTSBkcml2ZXIuIElmIHNvbWVib2R5IHdvdWxkIGxpa2UgaXQgZWxzZXdoZXJlLAo+
IHRoYXQncyBvZiBjb3Vyc2Ugbm8gcHJvYmxlbS4KCkFmdGVyIHF1aWNrIGdsYW5jZSwgaXQgbG9v
a3MgYSBsb3QgYXMgcm1hcCBjb2RlIGR1cGxpY2F0aW9uLiBXaHkgbm90CmV4dGVuZCBybWFwX3dh
bGsoKSBpbnRlcmZhY2UgaW5zdGVhZCB0byBjb3ZlciByYW5nZSBvZiBwYWdlcz8KCj4gCj4gQ2M6
IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IE1hdHRoZXcg
V2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+IENjOiBXaWxsIERlYWNvbiA8d2lsbC5kZWFj
b25AYXJtLmNvbT4KPiBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+
IENjOiBSaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+Cj4gQ2M6IE1pbmNoYW4gS2ltIDxt
aW5jaGFuQGtlcm5lbC5vcmc+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+
IENjOiBIdWFuZyBZaW5nIDx5aW5nLmh1YW5nQGludGVsLmNvbT4KPiBDYzogU291cHRpY2sgSm9h
cmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4gQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xp
c3NlQHJlZGhhdC5jb20+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8
dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+IFJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNh
bXBiZWxsQG52aWRpYS5jb20+ICN2MQo+IC0tLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgfCAg
IDEgKwo+ICBpbmNsdWRlL2xpbnV4L21tLmggICAgfCAgMTMgKy0KPiAgbW0vS2NvbmZpZyAgICAg
ICAgICAgIHwgICAzICsKPiAgbW0vTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAgbW0vYXNf
ZGlydHlfaGVscGVycy5jIHwgMzkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDQwOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtbS9hc19kaXJ0eV9oZWxwZXJzLmMKPiAKPiBkaWZm
IC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IGMyZDk3NWRhNTYxZi4u
YjU5NmM3Y2Y0YTg1IDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5F
UlMKPiBAQCAtNTI4Nyw2ICs1Mjg3LDcgQEAgVDoJZ2l0IGdpdDovL3Blb3BsZS5mcmVlZGVza3Rv
cC5vcmcvfnRob21hc2gvbGludXgKPiAgUzoJU3VwcG9ydGVkCj4gIEY6CWRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvCj4gIEY6CWluY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCj4gK0Y6CW1tL2Fz
X2RpcnR5X2hlbHBlcnMuYwoKRW1tLi4gTm8uIENvcmUgTU0gZnVuY3RpbmFsaXR5IGNhbm5vdCBi
ZWxvbmcgdG8gcmFuZG9tIGRyaXZlci4KCi0tIAogS2lyaWxsIEEuIFNodXRlbW92Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
