Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B40112D53
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8C66F4EB;
	Wed,  4 Dec 2019 14:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA4E6F4EB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 404F63F47A;
 Wed,  4 Dec 2019 15:16:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Km9YbJabySxh; Wed,  4 Dec 2019 15:16:15 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id B12EC3F435;
 Wed,  4 Dec 2019 15:16:10 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id CC96A360608;
 Wed,  4 Dec 2019 15:16:09 +0100 (CET)
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
To: Michal Hocko <mhocko@kernel.org>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
 <20191204135219.GH25242@dhcp22.suse.cz>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
Date: Wed, 4 Dec 2019 15:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191204135219.GH25242@dhcp22.suse.cz>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575468969; bh=6lPiouUhoiffGwUD7wWb3htpX7yUG7AcztUp9kFYLLI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rZAHpK0eBRbwsu388vybVwAbkZPQbHLOKHyty+7r1UkSH/04RpXI227bMqMFVxlRP
 UrWX6Ijp3UQj9Wj1JrcokDlB6PmEsywz/A8GWJ0k+N90X8OolmzmVQX97MzB97QuBG
 Cuz7tDkgVF3SLv9OwcbU14195XaWJKO0qK8uDafY=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=rZAHpK0e; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8xOSAyOjUyIFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gT24gVHVlIDAzLTEyLTE5
IDExOjQ4OjUzLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4gRnJvbTogVGhv
bWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pgo+PiBUVE0gZ3JhcGhpY3Mg
YnVmZmVyIG9iamVjdHMgbWF5LCB0cmFuc3BhcmVudGx5IHRvIHVzZXItc3BhY2UsICBtb3ZlCj4+
IGJldHdlZW4gSU8gYW5kIHN5c3RlbSBtZW1vcnkuIFdoZW4gdGhhdCBoYXBwZW5zLCBhbGwgUFRF
cyBwb2ludGluZyB0byB0aGUKPj4gb2xkIGxvY2F0aW9uIGFyZSB6YXBwZWQgYmVmb3JlIHRoZSBt
b3ZlIGFuZCB0aGVuIGZhdWx0ZWQgaW4gYWdhaW4gaWYKPj4gbmVlZGVkLiBXaGVuIHRoYXQgaGFw
cGVucywgdGhlIHBhZ2UgcHJvdGVjdGlvbiBjYWNoaW5nIG1vZGUtIGFuZAo+PiBlbmNyeXB0aW9u
IGJpdHMgbWF5IGNoYW5nZSBhbmQgYmUgZGlmZmVyZW50IGZyb20gdGhvc2Ugb2YKPj4gc3RydWN0
IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QuCj4+Cj4+IFdlIHdlcmUgdXNpbmcgYW4gdWds
eSBoYWNrIHRvIHNldCB0aGUgcGFnZSBwcm90ZWN0aW9uIGNvcnJlY3RseS4KPj4gRml4IHRoYXQg
YW5kIGluc3RlYWQgdXNlIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGFuZCAvIG9yCj4+IHZtZl9p
bnNlcnRfcGZuX3Byb3QoKS4KPj4gQWxzbyBnZXQgdGhlIGRlZmF1bHQgcGFnZSBwcm90ZWN0aW9u
IGZyb20KPj4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QgcmF0aGVyIHRoYW4g
dXNpbmcgdm1fZ2V0X3BhZ2VfcHJvdCgpLgo+PiBUaGlzIHdheSB3ZSBjYXRjaCBtb2RpZmljYXRp
b25zIGRvbmUgYnkgdGhlIHZtIHN5c3RlbSBmb3IgZHJpdmVycyB0aGF0Cj4+IHdhbnQgd3JpdGUt
bm90aWZpY2F0aW9uLgo+IFNvIGVzc2VudGlhbGx5IHRoaXMgc2hvdWxkIGhhdmUgYW55IG5ldyBz
aWRlIGVmZmVjdCBvbiBmdW5jdGlvbmFsaXR5IGl0Cj4gaXMganVzdCBtYWtpbmcgYSBoYWNreS91
Z2x5IGNvZGUgbGVzcyBzbz8KCkZ1bmN0aW9uYWxpdHkgaXMgdW5jaGFuZ2VkLiBUaGUgdXNlIG9m
IGEgb24tc3RhY2sgdm1hIGNvcHkgd2FzIHNldmVyZWx5IApmcm93bmVkIHVwb24gaW4gYW4gZWFy
bGllciB0aHJlYWQsIHdoaWNoIGFsc28gcG9pbnRzIHRvIGFub3RoZXIgc2ltaWxhciAKZXhhbXBs
ZSB1c2luZyB2bWZfaW5zZXJ0X3Bmbl9wcm90KCkuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMTkwOTA1MTAzNTQxLjQxNjEtMi10aG9tYXNfb3NAc2hpcG1haWwub3JnLwoKPiBJbiBv
dGhlciB3b3JkcyB3aGF0IGFyZSB0aGUKPiBjb25zZXF1ZW5jZXMgb2YgaGF2aW5nIHBhZ2UgcHJv
dGVjdGlvbiBpbmNvbnNpc3RlbnQgZnJvbSB2bWEncz8KCkR1cmluZyB0aGUgeWVhcnMsIGl0IGxv
b2tzIGxpa2UgdGhlIGNhY2hpbmctIGFuZCBlbmNyeXB0aW9uIGZsYWdzIG9mIAp2bWE6OnZtX3Bh
Z2VfcHJvdCBoYXZlIGJlZW4gbGFyZ2VseSByZW1vdmVkIGZyb20gdXNhZ2UuIEZyb20gd2hhdCBJ
IGNhbiAKdGVsbCwgdGhlcmUgYXJlIG5vIG1vcmUgcGxhY2VzIGxlZnQgdGhhdCBjYW4gYWZmZWN0
IFRUTS4gV2UgZGlzY3Vzc2VkIApfX3NwbGl0X2h1Z2VfcG1kX2xvY2tlZCgpIHRvd2FyZHMgdGhl
IGVuZCBvZiB0aGF0IHRocmVhZCwgYnV0IHRoYXQgCmRvZXNuJ3QgYWZmZWN0IFRUTSBldmVuIHdp
dGggaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMuCgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
