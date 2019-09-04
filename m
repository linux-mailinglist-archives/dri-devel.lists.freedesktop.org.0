Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26846A8071
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 12:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ABA89A62;
	Wed,  4 Sep 2019 10:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A3C89A62
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 10:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 8A1353F6E5;
 Wed,  4 Sep 2019 12:37:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OXVNpQKvjjO; Wed,  4 Sep 2019 12:37:48 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 194913F538;
 Wed,  4 Sep 2019 12:37:46 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4A1BB36117F;
 Wed,  4 Sep 2019 12:37:46 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
 <CALCETrVnNpPwmRddGLku9hobE7wG30_3j+QfcYxk09hZgtaYww@mail.gmail.com>
 <44b094c8-63fe-d9e5-1bf4-7da0788caccf@shipmail.org>
 <6d122d62-9c96-4c29-8d06-02f7134e5e2a@shipmail.org>
 <B3C5DD1B-A33C-417F-BDDC-73120A035EA5@amacapital.net>
 <3393108b-c7e3-c9be-b65b-5860c15ca228@shipmail.org>
 <CAKMK7uH0jxaWJLxfXfGLyN-Rb=0ZKUFTkrEPdFCuGCh4ORCv9w@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <0fd10438-5da4-fb69-f40c-c9b4beea1977@shipmail.org>
Date: Wed, 4 Sep 2019 12:37:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH0jxaWJLxfXfGLyN-Rb=0ZKUFTkrEPdFCuGCh4ORCv9w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567593466; bh=akRBTXxMLQXPdPRml7vfcwvBwbf56SVhUOk6CAVkC7g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jmqI5tggrRqyalYT5qgVmkGv5E8PK0uoJAGge7hKl4hbNkmvoLq77PsUgXGd2drhA
 I/iSZLiecT2/xY1eWKLfVOepEryYzy3tLTAVvISoPgU2jKW+HJTBb3A32vn9GWQ6yV
 pCPMJEf5h0JyBbBhEIyiOqKdJBtPPg2R2PR6gDBc=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=jmqI5tgg; 
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
 Andy Lutomirski <luto@amacapital.net>, Dave Hansen <dave.hansen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS80LzE5IDk6NTMgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBTZXAgNCwg
MjAxOSBhdCA4OjQ5IEFNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpCj4gPHRob21hc19vc0Bz
aGlwbWFpbC5vcmc+IHdyb3RlOgo+PiBPbiA5LzQvMTkgMToxNSBBTSwgQW5keSBMdXRvbWlyc2tp
IHdyb3RlOgo+Pj4gQnV0LCByZWFkaW5nIHRoaXMsIEkgaGF2ZSBtb3JlIHF1ZXN0aW9uczoKPj4+
Cj4+PiBDYW7igJl0IHlvdSBnZXQgcmlkIG9mIGN2bWEgYnkgdXNpbmcgdm1mX2luc2VydF9wZm5f
cHJvdCgpPwo+PiBJdCBsb29rcyBsaWtlIHRoYXQsIGFsdGhvdWdoIHRoZXJlIGFyZSBjb21tZW50
cyBpbiB0aGUgY29kZSBhYm91dAo+PiBzZXJpb3VzIHBlcmZvcm1hbmNlIHByb2JsZW1zIHVzaW5n
IFZNX1BGTk1BUCAvIHZtZl9pbnNlcnRfcGZuKCkgd2l0aAo+PiB3cml0ZS1jb21iaW5pbmcgYW5k
IFBBVCwgc28gdGhhdCB3b3VsZCByZXF1aXJlIHNvbWUgc2VyaW91cyB0ZXN0aW5nIHdpdGgKPj4g
aGFyZHdhcmUgSSBkb24ndCBoYXZlLiBCdXQgSSBndWVzcyB0aGVyZSBpcyBkZWZpbml0ZWx5IHJv
b20gZm9yCj4+IGltcHJvdmVtZW50IGhlcmUuIElkZWFsbHkgd2UnZCBsaWtlIHRvIGJlIGFibGUg
dG8gY2hhbmdlIHRoZQo+PiB2bWEtPnZtX3BhZ2VfcHJvdCB3aXRoaW4gZmF1bHQoKS4gQnV0IHdl
IGNhbgo+IEp1c3QgYSBxdWljayBjb21tZW50IG9uIHRoaXM6IEl0J3MgdGhlIHJlcGVhdGVkIChw
ZXItcGZuL3B0ZSkgbG9va3VwCj4gb2YgdGhlIFBBVCB0YWJsZXMsIHdoaWNoIGFyZSBkZWFkIHNs
b3cuIElmIHlvdSBoYXZlIGEgc3RydWN0Cj4gaW9fbWFwcGluZyB0aGVuIHRoYXQgY2FuIGJlIGRv
bmUgb25jZSwgYW5kIHRoZW4ganVzdCBibGluZGx5IGluc2VydGVkLgo+IFNlZSByZW1hcF9pb19t
YXBwaW5nIGluIGk5MTUuCj4gLURhbmllbAoKVGhhbmtzLCBEYW5pZWwuCgpJbmRlZWQgbG9va3Mg
YSBsb3QgbGlrZSByZW1hcF9wZm5fcmFuZ2UoKSwgYnV0IHVzYWJsZSBhdCBmYXVsdCB0aW1lPwoK
L1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
