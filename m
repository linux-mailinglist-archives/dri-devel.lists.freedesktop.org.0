Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294EA7D88
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24218910B;
	Wed,  4 Sep 2019 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E988910B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 08:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9AFA03F670;
 Wed,  4 Sep 2019 10:19:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0xEnIk568vo; Wed,  4 Sep 2019 10:19:58 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 9B82A3F367;
 Wed,  4 Sep 2019 10:19:50 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DBCBD36117F;
 Wed,  4 Sep 2019 10:19:49 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Dave Hansen <dave.hansen@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
 <cfe46eda-66b5-b40d-6721-84e6e0e1f5de@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <94113acc-1f99-2386-1d42-4b9930b04f73@shipmail.org>
Date: Wed, 4 Sep 2019 10:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cfe46eda-66b5-b40d-6721-84e6e0e1f5de@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567585190; bh=aAKUc1d8so5bVj7uOzEQsEKgmHbL9Y6J7AB2rLBUQOQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NnMLvqmSERGsQWz4m9ga766nvuJfd3Ow/tZkPs7cy9NTLSwGSJ9Wc/1sfOr4X6++X
 QPalbhsqNYj7w1RLw+cA4mM5kbKtJKagoVpQGFebCup77Vhz25DH1GvlnT5ZXDamG3
 +Y1AFe4mTpNoTVc9G14umlpmJw8cAPkKgvpczc1E=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=NnMLvqmS; 
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
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENocmlzdGlhbiwKCk9uIDkvNC8xOSA5OjMzIEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90
ZToKPiBBbSAwMy4wOS4xOSB1bSAyMzowNSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdh
cmUpOgo+PiBPbiA5LzMvMTkgMTA6NTEgUE0sIERhdmUgSGFuc2VuIHdyb3RlOgo+Pj4gT24gOS8z
LzE5IDE6MzYgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+IFNvIHRo
ZSBxdWVzdGlvbiBoZXJlIHNob3VsZCByZWFsbHkgYmUsIGNhbiB3ZSBkZXRlcm1pbmUgYWxyZWFk
eSBhdCBtbWFwCj4+Pj4gdGltZSB3aGV0aGVyIGJhY2tpbmcgbWVtb3J5IHdpbGwgYmUgdW5lbmNy
eXB0ZWQgYW5kIGFkanVzdCB0aGUgKnJlYWwqCj4+Pj4gdm1hLT52bV9wYWdlX3Byb3QgdW5kZXIg
dGhlIG1tYXBfc2VtPwo+Pj4+Cj4+Pj4gUG9zc2libHksIGJ1dCB0aGF0IHJlcXVpcmVzIHBvcHVs
YXRpbmcgdGhlIGJ1ZmZlciB3aXRoIG1lbW9yeSBhdCBtbWFwCj4+Pj4gdGltZSByYXRoZXIgdGhh
biBhdCBmaXJzdCBmYXVsdCB0aW1lLgo+Pj4gSSdtIG5vdCBjb25uZWN0aW5nIHRoZSBkb3RzLgo+
Pj4KPj4+IHZtYS0+dm1fcGFnZV9wcm90IGlzIHVzZWQgdG8gY3JlYXRlIGEgVk1BJ3MgUFRFcyBy
ZWdhcmRsZXNzIG9mIGlmIHRoZXkKPj4+IGFyZSBjcmVhdGVkIGF0IG1tYXAoKSBvciBmYXVsdCB0
aW1lLsKgIElmIHdlIGVzdGFibGlzaCBhIGdvb2QKPj4+IHZtYS0+dm1fcGFnZV9wcm90LCBjYW4n
dCB3ZSBqdXN0IHVzZSBpdCBmb3JldmVyIGZvciBkZW1hbmQgZmF1bHRzPwo+PiBXaXRoIFNFViBJ
IHRoaW5rIHRoYXQgd2UgY291bGQgcG9zc2libHkgZXN0YWJsaXNoIHRoZSBlbmNyeXB0aW9uIGZs
YWdzCj4+IGF0IHZtYSBjcmVhdGlvbiB0aW1lLiBCdXQgdGhpbmtpbmcgb2YgaXQsIGl0IHdvdWxk
IGFjdHVhbGx5IGJyZWFrIHdpdGgKPj4gU01FIHdoZXJlIGJ1ZmZlciBjb250ZW50IGNhbiBiZSBt
b3ZlZCBiZXR3ZWVuIGVuY3J5cHRlZCBzeXN0ZW0gbWVtb3J5Cj4+IGFuZCB1bmVuY3J5cHRlZCBn
cmFwaGljcyBjYXJkIFBDSSBtZW1vcnkgYmVoaW5kIHVzZXItc3BhY2UncyBiYWNrLgo+PiBUaGF0
IHdvdWxkIGltcGx5IGtpbGxpbmcgYWxsIHVzZXItc3BhY2UgZW5jcnlwdGVkIFBURXMgYW5kIGF0
IGZhdWx0Cj4+IHRpbWUgc2V0IHVwIG5ldyBvbmVzIHBvaW50aW5nIHRvIHVuZW5jcnlwdGVkIFBD
SSBtZW1vcnkuLgo+IFdlbGwgbXkgcHJvYmxlbSBpcyB3aGVyZSBkbyB5b3Ugc2VlIGVuY3J5cHRl
ZCBzeXN0ZW0gbWVtb3J5IGhlcmU/Cj4KPiBBdCBsZWFzdCBmb3IgQU1EIEdQVXMgYWxsIG1lbW9y
eSBhY2Nlc3NlZCBtdXN0IGJlIHVuZW5jcnlwdGVkIGFuZCB0aGF0Cj4gY291bnRzIGZvciBib3Ro
IHN5c3RlbSBhcyB3ZWxsIGFzIFBDSSBtZW1vcnkuCgpXZSdyZSB0YWxraW5nIFNNRSBub3cgcmln
aHQ/CgpUaGUgY3VycmVudCBTTUUgc2V0dXAgaXMgdGhhdCBpZiBhIGRldmljZSdzIERNQSBtYXNr
IHNheXMgaXQncyBjYXBhYmxlIApvZiBhZGRyZXNzaW5nIHRoZSBlbmNyeXB0aW9uIGJpdCwgY29o
ZXJlbnQgbWVtb3J5IHdpbGwgYmUgZW5jcnlwdGVkLiBUaGUgCm1lbW9yeSBjb250cm9sbGVycyB3
aWxsIGRlY3J5cHQgZm9yIHRoZSBkZXZpY2Ugb24gdGhlIGZseS4gT3RoZXJ3aXNlIApjb2hlcmVu
dCBtZW1vcnkgd2lsbCBiZSBkZWNyeXB0ZWQuCgo+Cj4gU28gSSBkb24ndCBnZXQgd2h5IHdlIGNh
bid0IGFzc3VtZSBhbHdheXMgdW5lbmNyeXB0ZWQgYW5kIGtlZXAgaXQgbGlrZSB0aGF0LgoKSSBz
ZWUgdHdvIHJlYXNvbnMuIEZpcnN0LCBpdCB3b3VsZCBicmVhayB3aXRoIGEgcmVhbCBkZXZpY2Ug
dGhhdCBzaWduYWxzIAppdCdzIGNhcGFibGUgb2YgYWRkcmVzc2luZyB0aGUgZW5jcnlwdGlvbiBi
aXQuCgpTZWNvbmQgSSBjYW4gaW1hZ2luZSB1bmFjY2VsZXJhdGVkIHNldHVwcyAoc29tZXRoaW5n
IGxpa2UgdmttcyB1c2luZyAKcHJpbWUgZmVlZGluZyBhIFZOQyBjb25uZWN0aW9uKSB3aGVyZSB3
ZSBhY3R1YWxseSB3YW50IHRoZSBUVE0gYnVmZmVycyAKZW5jcnlwdGVkIHRvIHByb3RlY3QgZGF0
YS4KCkJ1dCBhdCBsZWFzdCB0aGUgbGF0dGVyIHJlYXNvbiBpcyB3YXkgZmFyIG91dCBpbiB0aGUg
ZnV0dXJlLgoKU28gZm9yIG1lIEknbSBvayB3aXRoIHRoYXQgaWYgdGhhdCB3b3JrcyBmb3IgeW91
PwoKL1Rob21hcwoKCj4KPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
