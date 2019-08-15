Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8CB8E6C0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7C66E932;
	Thu, 15 Aug 2019 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2F06E879
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 00:11:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id u34so680521qte.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=sa+zQVwF/Kg2yH2R3qjmRo+nBMZgWEgWy9VtHzhObIQ=;
 b=dd3TWJAFbRS6cw8UJxW+lSvakVShrxN+1fZlIzSECwOaqooXSsqDu5LOqFJUiHqTKZ
 CuhKjk79IN5G44P7xe03ddxsOQBjHHgs1fQ2h6+oO4HAaaj46h87yBCAOccVGF2mVtGy
 HwX7ONt2o5UDPZngaH2uPythU76qv/3+wBCk5YB5T1pC57iy9lJTbzPBmemcIF+VGM6T
 JJSAt1wt7U2vPBxEDqS4sKM33Px8j7w7PMbkqITbRXQkKglXDmNmNXGa/U1ch9XyeFd4
 BQ2/TQviMY7HUDqa4VLSW/mbsSEqHZGbA/cWpA07WyKKhTFXP9EA0QN9nnP+tKXIfR9z
 NV/A==
X-Gm-Message-State: APjAAAUpehw/gDg3STJnLFKWrg1HK/KFQL+ZUoiQIXoHGEc82jDngs8Y
 pu6JSvdjQQLlvr2IPf6pDZkqxQ==
X-Google-Smtp-Source: APXvYqycoMish4JR7Yhk7POc91EfS5nVJ1Ns5md0NOId7Ywyc7vJCJUYwUMZE0JVH6XYbdhlVPx8eg==
X-Received: by 2002:ad4:45e3:: with SMTP id q3mr1591887qvu.140.1565827898756; 
 Wed, 14 Aug 2019 17:11:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f20sm939480qtf.68.2019.08.14.17.11.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 17:11:38 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hy3Mf-0003aK-TC; Wed, 14 Aug 2019 21:11:37 -0300
Date: Wed, 14 Aug 2019 21:11:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 5/5] mm/hmm: WARN on illegal ->sync_cpu_device_pagetables
 errors
Message-ID: <20190815001137.GE11200@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814202027.18735-6-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=sa+zQVwF/Kg2yH2R3qjmRo+nBMZgWEgWy9VtHzhObIQ=;
 b=g0iXAp9GLKjmJUCykogXNEfQUbyHV9nCucIjUntdM1KKe6wGTXBPlF2UOoTWZOGfJl
 AmajYGKP63nxK6g4uAQuCBhnJ9E6JBx7+PoQJl4H925pXAjlhGkj572kQrS2NActiipP
 kxwRxIXOfJDm8mccWD6WHhV9xJyTZoODJcRJWpuRBg9qbQQk4EiIxDhaFEh+gSkvInRl
 wmPRmh/bNa5dNbX8qh2MmqKpcoUwYdco5Q1f/jvTQoW1q8UlyeXxKNaG6oETdo4lI4Kt
 Lzy3yHCgAJpdYNwrpVyOegXvj1unwKdFwN8pNkz4YjlDTDEUIixQQUpKRN+VZGMEPnlq
 qHLw==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Balbir Singh <bsingharora@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MjA6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBTaW1pbGFyIHRvIHRoZSB3YXJuaW5nIGluIHRoZSBtbXUgbm90aWZlciwgd2Fybmlu
ZyBpZiBhbiBobW0gbWlycm9yCj4gY2FsbGJhY2sgZ2V0cyBpdCdzIGJsb2NraW5nIHZzLiBub25i
bG9ja2luZyBoYW5kbGluZyB3cm9uZywgb3IgaWYgaXQKPiBmYWlscyB3aXRoIGFueXRoaW5nIGVs
c2UgdGhhbiAtRUFHQUlOLgo+IAo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4K
PiBDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+IENjOiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2ls
bGlhbXNAaW50ZWwuY29tPgo+IENjOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNs
ZS5jb20+Cj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+IENjOiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IENjOiBCYWxiaXIgU2luZ2ggPGJzaW5naGFy
b3JhQGdtYWlsLmNvbT4KPiBDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IENj
OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPiBDYzogQW5kcmV3IE1v
cnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogIkrDqXLDtG1lIEdsaXNzZSIg
PGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gIG1tL2htbS5j
IHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggMTZiNjczMWEzNGRiLi41MmFjNTkzODQy
NjggMTAwNjQ0Cj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtMjA1LDYgKzIwNSw5IEBAIHN0YXRpYyBp
bnQgaG1tX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4g
IAkJCXJldCA9IC1FQUdBSU47Cj4gIAkJCWJyZWFrOwo+ICAJCX0KPiArCQlXQVJOKHJldCwgIiVw
UyBjYWxsYmFjayBmYWlsZWQgd2l0aCAlZCBpbiAlc2Jsb2NrYWJsZSBjb250ZXh0XG4iLAo+ICsJ
CSAgICAgbWlycm9yLT5vcHMtPnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzLCByZXQsCj4gKwkJ
ICAgICB1cGRhdGUuYmxvY2thYmxlID8gIiIgOiAibm9uLSIpOwo+ICAJfQo+ICAJdXBfcmVhZCgm
aG1tLT5taXJyb3JzX3NlbSk7CgpEaWRuJ3QgSSBiZWF0IHlvdSB0byB0aGlzPwoKCWxpc3RfZm9y
X2VhY2hfZW50cnkobWlycm9yLCAmaG1tLT5taXJyb3JzLCBsaXN0KSB7CgkJaW50IHJjOwoKCQly
YyA9IG1pcnJvci0+b3BzLT5zeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcyhtaXJyb3IsICZ1cGRh
dGUpOwoJCWlmIChyYykgewoJCQlpZiAoV0FSTl9PTih1cGRhdGUuYmxvY2thYmxlIHx8IHJjICE9
IC1FQUdBSU4pKQoJCQkJY29udGludWU7CgkJCXJldCA9IC1FQUdBSU47CgkJCWJyZWFrOwoJCX0K
CX0KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
