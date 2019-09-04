Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D7FA835A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 15:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC98894DD;
	Wed,  4 Sep 2019 13:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902E1894DD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 13:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id B46D23F9C0;
 Wed,  4 Sep 2019 15:06:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeLhbXyEuEdk; Wed,  4 Sep 2019 15:05:59 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 746973F54E;
 Wed,  4 Sep 2019 15:05:53 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8F26E360160;
 Wed,  4 Sep 2019 15:05:53 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
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
 <9ca29de8-0c9b-65b2-52e8-8668a1517ac5@shipmail.org>
Organization: VMware Inc.
Message-ID: <e13accfc-cde8-754c-1730-0f2db4e2dd2e@shipmail.org>
Date: Wed, 4 Sep 2019 15:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9ca29de8-0c9b-65b2-52e8-8668a1517ac5@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567602353; bh=rscDBECHNl0CXKODIklLg5/3/ptNV8FCth57CkJf9VI=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=JXsQcDc898Uc90ArEPBLYz3yNnWhJDj0ppW4tgz92O7uS2UUd7RFH5AMPSwri9Zh/
 OeCGJr+V1oNeBOv/2nF7E0NAx3y5IdZC6UVYSdQceC9k4nij0GxDwcL5/Js2ivJYNR
 MDVrK0X2SVKRTBE1ieGdl56nbwfyQ1/zz03BaIl0=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="JXsQcDc8";
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

T24gOS80LzE5IDI6MzUgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Cj4+
Cj4+IEkndmUgYWxyZWFkeSB0YWxrZWQgd2l0aCBDaHJpc3RvcGggdGhhdCB3ZSBwcm9iYWJseSB3
YW50IHRvIHN3aXRjaCBUVE0KPj4gb3ZlciB0byB1c2luZyB0aGF0IGluc3RlYWQgdG8gYWxzbyBn
ZXQgcmlkIG9mIHRoZSB0dG1faW9fcHJvdCgpIGhhY2suCj4KPiBPSywgd291bGQgdGhhdCBtZWFu
IHVzIGRpdGNoaW5nIG90aGVyIG1lbW9yeSBtb2RlcyBjb21wbGV0ZWx5PyBBbmQgCj4gb24tdGhl
LWZseSBjYWNoaW5nIHRyYW5zaXRpb25zPyBvciBpcyBpdCBqdXN0IGZvciB0aGUgc3BlY2lhbCBj
YXNlIG9mIAo+IGNhY2hlZCBjb2hlcmVudCBtZW1vcnk/IERvIHdlIG5lZWQgdG8gY2FjaGUgdGhl
IGNvaGVyZW50IGtlcm5lbCAKPiBtYXBwaW5ncyBpbiBUVE0gYXMgd2VsbCwgZm9yIHR0bV9ib19r
bWFwKCk/CgpSZWFkaW5nIHRoaXMgYWdhaW4sIEkgd2FudGVkIHRvIHBvaW50IG91dCB0aGF0IEkn
bSBub3QgYWdhaW5zdCB0aGlzLiAKSnVzdCBjdXJpb3VzLgoKL1Rob21hcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
