Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CDFA75E7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CBB89A14;
	Tue,  3 Sep 2019 21:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D100489A14
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 30F0C3F3EF;
 Tue,  3 Sep 2019 23:05:31 +0200 (CEST)
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
 with ESMTP id XIBw9yZbCl08; Tue,  3 Sep 2019 23:05:30 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 350063F333;
 Tue,  3 Sep 2019 23:05:26 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6380C360160;
 Tue,  3 Sep 2019 23:05:26 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: Dave Hansen <dave.hansen@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
Date: Tue, 3 Sep 2019 23:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567544726; bh=/li7YegAhw6RYebLGGt/o3WJvHeG1ytUqRCNCZ9yHwo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NpihaS584vAezzYGEJFzcCqhRmOPFt5+xrYeQK5B9B2tNMdEtQQufvDy2twLS8/Lr
 +V1hvYJ9E3E+XhWlmlOQ8pnECLnM3I0Js1Zpog+5Cv/TNXfjxsNpvQLHiloHigHe8c
 RCbL+v7L5SnK7SFv5+0MrTxSTs78rki5TArr4mNM=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=NpihaS58; 
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8zLzE5IDEwOjUxIFBNLCBEYXZlIEhhbnNlbiB3cm90ZToKPiBPbiA5LzMvMTkgMTozNiBQ
TSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4+IFNvIHRoZSBxdWVzdGlvbiBo
ZXJlIHNob3VsZCByZWFsbHkgYmUsIGNhbiB3ZSBkZXRlcm1pbmUgYWxyZWFkeSBhdCBtbWFwCj4+
IHRpbWUgd2hldGhlciBiYWNraW5nIG1lbW9yeSB3aWxsIGJlIHVuZW5jcnlwdGVkIGFuZCBhZGp1
c3QgdGhlICpyZWFsKgo+PiB2bWEtPnZtX3BhZ2VfcHJvdCB1bmRlciB0aGUgbW1hcF9zZW0/Cj4+
Cj4+IFBvc3NpYmx5LCBidXQgdGhhdCByZXF1aXJlcyBwb3B1bGF0aW5nIHRoZSBidWZmZXIgd2l0
aCBtZW1vcnkgYXQgbW1hcAo+PiB0aW1lIHJhdGhlciB0aGFuIGF0IGZpcnN0IGZhdWx0IHRpbWUu
Cj4gSSdtIG5vdCBjb25uZWN0aW5nIHRoZSBkb3RzLgo+Cj4gdm1hLT52bV9wYWdlX3Byb3QgaXMg
dXNlZCB0byBjcmVhdGUgYSBWTUEncyBQVEVzIHJlZ2FyZGxlc3Mgb2YgaWYgdGhleQo+IGFyZSBj
cmVhdGVkIGF0IG1tYXAoKSBvciBmYXVsdCB0aW1lLiAgSWYgd2UgZXN0YWJsaXNoIGEgZ29vZAo+
IHZtYS0+dm1fcGFnZV9wcm90LCBjYW4ndCB3ZSBqdXN0IHVzZSBpdCBmb3JldmVyIGZvciBkZW1h
bmQgZmF1bHRzPwoKV2l0aCBTRVYgSSB0aGluayB0aGF0IHdlIGNvdWxkIHBvc3NpYmx5IGVzdGFi
bGlzaCB0aGUgZW5jcnlwdGlvbiBmbGFncyAKYXQgdm1hIGNyZWF0aW9uIHRpbWUuIEJ1dCB0aGlu
a2luZyBvZiBpdCwgaXQgd291bGQgYWN0dWFsbHkgYnJlYWsgd2l0aCAKU01FIHdoZXJlIGJ1ZmZl
ciBjb250ZW50IGNhbiBiZSBtb3ZlZCBiZXR3ZWVuIGVuY3J5cHRlZCBzeXN0ZW0gbWVtb3J5IAph
bmQgdW5lbmNyeXB0ZWQgZ3JhcGhpY3MgY2FyZCBQQ0kgbWVtb3J5IGJlaGluZCB1c2VyLXNwYWNl
J3MgYmFjay4gVGhhdCAKd291bGQgaW1wbHkga2lsbGluZyBhbGwgdXNlci1zcGFjZSBlbmNyeXB0
ZWQgUFRFcyBhbmQgYXQgZmF1bHQgdGltZSBzZXQgCnVwIG5ldyBvbmVzIHBvaW50aW5nIHRvIHVu
ZW5jcnlwdGVkIFBDSSBtZW1vcnkuLgoKPgo+IE9yLCBhcmUgeW91IGNvbmNlcm5lZCB0aGF0IGlm
IGFuIGF0dGVtcHQgaXMgbWFkZSB0byBkZW1hbmQtZmF1bHQgcGFnZQo+IHRoYXQncyBpbmNvbXBh
dGlibGUgd2l0aCB2bWEtPnZtX3BhZ2VfcHJvdCB0aGF0IHdlIGhhdmUgdG8gU0VHVj8KPgo+PiBB
bmQgaXQgc3RpbGwgcmVxdWlyZXMga25vd2xlZGdlIHdoZXRoZXIgdGhlIGRldmljZSBETUEgaXMg
YWx3YXlzCj4+IHVuZW5jcnlwdGVkIChvciBpZiBTRVYgaXMgYWN0aXZlKS4KPiBJIG1heSBiZSBn
ZXR0aW5nIG1peGVkIHVwIG9uIE1LVE1FICh0aGUgSW50ZWwgbWVtb3J5IGVuY3J5cHRpb24pIGFu
ZAo+IFNFVi4gIElzIFNFViBzdXBwb3J0ZWQgb24gYWxsIG1lbW9yeSB0eXBlcz8gIFBhZ2UgY2Fj
aGUsIGh1Z2V0bGJmcywKPiBhbm9ueW1vdXM/ICBPciBqdXN0IGFub255bW91cz8KClNFViBBRkFJ
SyBlbmNyeXB0cyAqYWxsKiBtZW1vcnkgZXhjZXB0IERNQSBtZW1vcnkuIFRvIGRvIHRoYXQgaXQg
dXNlcyBhIApTV0lPVExCIGJhY2tlZCBieSB1bmVuY3J5cHRlZCBtZW1vcnksIGFuZCBpdCBhbHNv
IGZsaXBzIGNvaGVyZW50IERNQSAKbWVtb3J5IHRvIHVuZW5jcnlwdGVkICh3aGljaCBpcyBhIHZl
cnkgc2xvdyBvcGVyYXRpb24gYW5kIHBhdGNoIDQgZGVhbHMgCndpdGggY2FjaGluZyBzdWNoIG1l
bW9yeSkuCgovVGhvbWFzCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
