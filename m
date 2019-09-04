Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B9A7DF2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28E48924C;
	Wed,  4 Sep 2019 08:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A178924C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 08:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 51B553F5F0;
 Wed,  4 Sep 2019 10:34:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TF6Qxe2YrX2F; Wed,  4 Sep 2019 10:34:27 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 109A53F346;
 Wed,  4 Sep 2019 10:34:25 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 25C2136117F;
 Wed,  4 Sep 2019 10:34:25 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>
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
 <2759de53-123f-5972-a246-bbf959439c5d@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <e02e18e9-662e-e4bd-dee5-2dde673278ea@shipmail.org>
Date: Wed, 4 Sep 2019 10:34:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2759de53-123f-5972-a246-bbf959439c5d@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567586065; bh=MbtBfVZaBumDkBlAtpFFrFhKmgiWkoQ1b1+zCTqFcPk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=J1VY4NLk8W4zmUOI/PrVpikNX2CTceCnda/zQbfYcicCF3vdBOuNsDCJA92eFp5ht
 3lD12c2pd8Zfdi7N5HHMYy89RLMKOp4gwBPCXMmdA/a6GjY6jA2yivh93n/ObwJ+L3
 Bnjg6fVWttF9EPPWca+yjsxjPyKFv0Igx7Tf3A8c=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=J1VY4NLk; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhdmUsCgpPbiA5LzQvMTkgMToxMCBBTSwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4gVGhvbWFz
LCB0aGlzIHNlcmllcyBoYXMgZ2FybmVyZWQgYSBuYWsgYW5kIGEgd2hvbGUgcGlsZSBvZiB0aG9y
b3VnaGx5Cj4gY29uZnVzZWQgcmV2aWV3ZXJzLgo+Cj4gQ291bGQgeW91IHRha2UgYW5vdGhlciBz
dGFiIGF0IHRoaXMgYWxvbmcgd2l0aCBhIG1vcmUgYW1wbGUgY2hhbmdlbG9nCj4gZXhwbGFpbmlu
ZyB0aGUgY29udGV4dCBvZiB0aGUgcHJvYmxlbT8gIEkgc3VzcGVjdCB0aGF0J3MgYSBiZXR0ZXIg
cGxhY2UKPiB0byBzdGFydCB0aGFuIGhhdmluZyB1cyBhbGwgcGllY2UgdG9nZXRoZXIgdGhlIGRp
c3BhcmF0ZSBwYXJ0cyBvZiB0aGUKPiB0aHJlYWQuCgpTdXJlLgoKSSB3YXMganVzdCB0cnlpbmcg
dG8gZm9sbG93IHVwIG9uIHRoZSBlbWFpbHPCoCB0byBnZXQgYSBiZXR0ZXIgCnVuZGVyc3RhbmRp
bmcgd2hhdCBnb3QgcGVvcGxlIGNvbmZ1c2VkIGluIHRoZSBmaXJzdCBwbGFjZS4KClRoYW5rcywK
ClRob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
