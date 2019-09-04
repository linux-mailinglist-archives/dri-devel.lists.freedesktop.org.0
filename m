Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4EA8274
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F272892B8;
	Wed,  4 Sep 2019 12:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D79892B8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 58A723F77F;
 Wed,  4 Sep 2019 14:35:15 +0200 (CEST)
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
 with ESMTP id 3i3BzrVFK044; Wed,  4 Sep 2019 14:35:14 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8FD2F3F73E;
 Wed,  4 Sep 2019 14:35:12 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 22A4A360160;
 Wed,  4 Sep 2019 14:35:12 +0200 (CEST)
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
 <94113acc-1f99-2386-1d42-4b9930b04f73@shipmail.org>
 <7eec2c11-d0d4-4c81-6ed2-d0932bf5af33@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <9ca29de8-0c9b-65b2-52e8-8668a1517ac5@shipmail.org>
Date: Wed, 4 Sep 2019 14:35:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7eec2c11-d0d4-4c81-6ed2-d0932bf5af33@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567600512; bh=pK5b7yS9C1/xG6gv0GQcM1GFQgwTOHxSWdUhligApBw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qNbx1UJSV4EI8nxOrOXumaK0I328MaM+uBIrNusdqeabZXKCERZfPTk1P6jL7m4ab
 C0pib5CDDYth9dO4ab+YLmCvIalOtlsKoRDUI81JSaMSOrwGm98nR/r7cz+D0/2k6g
 NIIRcNFe9IWHjC+CW1wxbyaUItmT4Txls1f9lRoU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=qNbx1UJS; 
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

T24gOS80LzE5IDE6MTAgUE0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+IEFtIDA0LjA5LjE5
IHVtIDEwOjE5IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+IEhpLCBDaHJp
c3RpYW4sCj4+Cj4+IE9uIDkvNC8xOSA5OjMzIEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToK
Pj4+IEFtIDAzLjA5LjE5IHVtIDIzOjA1IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2Fy
ZSk6Cj4+Pj4gT24gOS8zLzE5IDEwOjUxIFBNLCBEYXZlIEhhbnNlbiB3cm90ZToKPj4+Pj4gT24g
OS8zLzE5IDE6MzYgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+Pj4g
U28gdGhlIHF1ZXN0aW9uIGhlcmUgc2hvdWxkIHJlYWxseSBiZSwgY2FuIHdlIGRldGVybWluZSBh
bHJlYWR5IGF0Cj4+Pj4+PiBtbWFwCj4+Pj4+PiB0aW1lIHdoZXRoZXIgYmFja2luZyBtZW1vcnkg
d2lsbCBiZSB1bmVuY3J5cHRlZCBhbmQgYWRqdXN0IHRoZSAqcmVhbCoKPj4+Pj4+IHZtYS0+dm1f
cGFnZV9wcm90IHVuZGVyIHRoZSBtbWFwX3NlbT8KPj4+Pj4+Cj4+Pj4+PiBQb3NzaWJseSwgYnV0
IHRoYXQgcmVxdWlyZXMgcG9wdWxhdGluZyB0aGUgYnVmZmVyIHdpdGggbWVtb3J5IGF0IG1tYXAK
Pj4+Pj4+IHRpbWUgcmF0aGVyIHRoYW4gYXQgZmlyc3QgZmF1bHQgdGltZS4KPj4+Pj4gSSdtIG5v
dCBjb25uZWN0aW5nIHRoZSBkb3RzLgo+Pj4+Pgo+Pj4+PiB2bWEtPnZtX3BhZ2VfcHJvdCBpcyB1
c2VkIHRvIGNyZWF0ZSBhIFZNQSdzIFBURXMgcmVnYXJkbGVzcyBvZiBpZiB0aGV5Cj4+Pj4+IGFy
ZSBjcmVhdGVkIGF0IG1tYXAoKSBvciBmYXVsdCB0aW1lLsKgIElmIHdlIGVzdGFibGlzaCBhIGdv
b2QKPj4+Pj4gdm1hLT52bV9wYWdlX3Byb3QsIGNhbid0IHdlIGp1c3QgdXNlIGl0IGZvcmV2ZXIg
Zm9yIGRlbWFuZCBmYXVsdHM/Cj4+Pj4gV2l0aCBTRVYgSSB0aGluayB0aGF0IHdlIGNvdWxkIHBv
c3NpYmx5IGVzdGFibGlzaCB0aGUgZW5jcnlwdGlvbiBmbGFncwo+Pj4+IGF0IHZtYSBjcmVhdGlv
biB0aW1lLiBCdXQgdGhpbmtpbmcgb2YgaXQsIGl0IHdvdWxkIGFjdHVhbGx5IGJyZWFrIHdpdGgK
Pj4+PiBTTUUgd2hlcmUgYnVmZmVyIGNvbnRlbnQgY2FuIGJlIG1vdmVkIGJldHdlZW4gZW5jcnlw
dGVkIHN5c3RlbSBtZW1vcnkKPj4+PiBhbmQgdW5lbmNyeXB0ZWQgZ3JhcGhpY3MgY2FyZCBQQ0kg
bWVtb3J5IGJlaGluZCB1c2VyLXNwYWNlJ3MgYmFjay4KPj4+PiBUaGF0IHdvdWxkIGltcGx5IGtp
bGxpbmcgYWxsIHVzZXItc3BhY2UgZW5jcnlwdGVkIFBURXMgYW5kIGF0IGZhdWx0Cj4+Pj4gdGlt
ZSBzZXQgdXAgbmV3IG9uZXMgcG9pbnRpbmcgdG8gdW5lbmNyeXB0ZWQgUENJIG1lbW9yeS4uCj4+
PiBXZWxsIG15IHByb2JsZW0gaXMgd2hlcmUgZG8geW91IHNlZSBlbmNyeXB0ZWQgc3lzdGVtIG1l
bW9yeSBoZXJlPwo+Pj4KPj4+IEF0IGxlYXN0IGZvciBBTUQgR1BVcyBhbGwgbWVtb3J5IGFjY2Vz
c2VkIG11c3QgYmUgdW5lbmNyeXB0ZWQgYW5kIHRoYXQKPj4+IGNvdW50cyBmb3IgYm90aCBzeXN0
ZW0gYXMgd2VsbCBhcyBQQ0kgbWVtb3J5Lgo+PiBXZSdyZSB0YWxraW5nIFNNRSBub3cgcmlnaHQ/
Cj4+Cj4+IFRoZSBjdXJyZW50IFNNRSBzZXR1cCBpcyB0aGF0IGlmIGEgZGV2aWNlJ3MgRE1BIG1h
c2sgc2F5cyBpdCdzIGNhcGFibGUKPj4gb2YgYWRkcmVzc2luZyB0aGUgZW5jcnlwdGlvbiBiaXQs
IGNvaGVyZW50IG1lbW9yeSB3aWxsIGJlIGVuY3J5cHRlZC4KPj4gVGhlIG1lbW9yeSBjb250cm9s
bGVycyB3aWxsIGRlY3J5cHQgZm9yIHRoZSBkZXZpY2Ugb24gdGhlIGZseS4KPj4gT3RoZXJ3aXNl
IGNvaGVyZW50IG1lbW9yeSB3aWxsIGJlIGRlY3J5cHRlZC4KPj4KPj4+IFNvIEkgZG9uJ3QgZ2V0
IHdoeSB3ZSBjYW4ndCBhc3N1bWUgYWx3YXlzIHVuZW5jcnlwdGVkIGFuZCBrZWVwIGl0Cj4+PiBs
aWtlIHRoYXQuCj4+IEkgc2VlIHR3byByZWFzb25zLiBGaXJzdCwgaXQgd291bGQgYnJlYWsgd2l0
aCBhIHJlYWwgZGV2aWNlIHRoYXQKPj4gc2lnbmFscyBpdCdzIGNhcGFibGUgb2YgYWRkcmVzc2lu
ZyB0aGUgZW5jcnlwdGlvbiBiaXQuCj4gV2h5PyBCZWNhdXNlIHdlIGRvbid0IHVzZSBkbWFfbW1h
cF9jb2hlcmVudCgpPwoKV2VsbCwgYXNzdW1pbmcgYWx3YXlzIHVuZW5jcnlwdGVkIHdvdWxkIG9i
dmlvdXNseSBicmVhayBvbiBhIHJlYWwgZGV2aWNlIAp3aXRoIGVuY3J5cHRlZCBjb2hlcmVudCBt
ZW1vcnk/CgpkbWFfbW1hcF9jb2hlcmVudCgpIHdvdWxkIHdvcmsgZnJvbSB0aGUgZW5jcnlwdGlv
biBwb2ludCBvZiB2aWV3IAooYWx0aG91Z2ggSSB0aGluayBpdCdzIGN1cnJlbnRseSBidWdneSBh
bmQgd2lsbCBzZW5kIG91dCBhbiBSRkMgZm9yIHdoYXQgCkkgYmVsaWV2ZSBpcyBhIGZpeCBmb3Ig
dGhhdCkuCgo+Cj4gSSd2ZSBhbHJlYWR5IHRhbGtlZCB3aXRoIENocmlzdG9waCB0aGF0IHdlIHBy
b2JhYmx5IHdhbnQgdG8gc3dpdGNoIFRUTQo+IG92ZXIgdG8gdXNpbmcgdGhhdCBpbnN0ZWFkIHRv
IGFsc28gZ2V0IHJpZCBvZiB0aGUgdHRtX2lvX3Byb3QoKSBoYWNrLgoKT0ssIHdvdWxkIHRoYXQg
bWVhbiB1cyBkaXRjaGluZyBvdGhlciBtZW1vcnkgbW9kZXMgY29tcGxldGVseT8gQW5kIApvbi10
aGUtZmx5IGNhY2hpbmcgdHJhbnNpdGlvbnM/IG9yIGlzIGl0IGp1c3QgZm9yIHRoZSBzcGVjaWFs
IGNhc2Ugb2YgCmNhY2hlZCBjb2hlcmVudCBtZW1vcnk/IERvIHdlIG5lZWQgdG8gY2FjaGUgdGhl
IGNvaGVyZW50IGtlcm5lbCBtYXBwaW5ncyAKaW4gVFRNIGFzIHdlbGwsIGZvciB0dG1fYm9fa21h
cCgpPwoKL1Rob21hcwoKPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4+IFNlY29uZCBJIGNh
biBpbWFnaW5lIHVuYWNjZWxlcmF0ZWQgc2V0dXBzIChzb21ldGhpbmcgbGlrZSB2a21zIHVzaW5n
Cj4+IHByaW1lIGZlZWRpbmcgYSBWTkMgY29ubmVjdGlvbikgd2hlcmUgd2UgYWN0dWFsbHkgd2Fu
dCB0aGUgVFRNIGJ1ZmZlcnMKPj4gZW5jcnlwdGVkIHRvIHByb3RlY3QgZGF0YS4KPj4KPj4gQnV0
IGF0IGxlYXN0IHRoZSBsYXR0ZXIgcmVhc29uIGlzIHdheSBmYXIgb3V0IGluIHRoZSBmdXR1cmUu
Cj4+Cj4+IFNvIGZvciBtZSBJJ20gb2sgd2l0aCB0aGF0IGlmIHRoYXQgd29ya3MgZm9yIHlvdT8K
Pj4KPj4gL1Rob21hcwo+Pgo+Pgo+Pj4gUmVnYXJkcywKPj4+IENocmlzdGlhbi4KPj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
