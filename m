Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C7B63E5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 14:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1A76EF31;
	Wed, 18 Sep 2019 12:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9296EF31
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 12:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id CAF1E3F869;
 Wed, 18 Sep 2019 14:59:28 +0200 (CEST)
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
 with ESMTP id tHoB48kMniVl; Wed, 18 Sep 2019 14:59:25 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 8C7A03F85E;
 Wed, 18 Sep 2019 14:59:24 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E06C236020A;
 Wed, 18 Sep 2019 14:59:23 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: [PATCH 0/7] Emulated coherent graphics memory take 2
Date: Wed, 18 Sep 2019 14:59:07 +0200
Message-Id: <20190918125914.38497-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568811564; bh=nHZ5nrGPkMFImxWZGWHwng2aQcVr1Cjrduddths8zV8=;
 h=From:To:Cc:Subject:Date:From;
 b=XVUzl5dDcqXwgp/9N8S33Dj/Zw+iZxamTyBGTvfwNYoDtCBZxacLKdPszdMZ82MTr
 Zm5DSQSrR7Ma9rJip6E08bAy/6dQdW3WWRnNWh+mxC6yJUp0Eda44lBzFHJz9uED7k
 TUVSxGL6qZs601VCYABY16qidqUwAvUhH/PRoGNA=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=XVUzl5dD; 
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thellstrom@vmware.com>,
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
 pv-drivers@vmware.com, Minchan Kim <minchan@kernel.org>,
 Will Deacon <will.deacon@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com, Souptick Joarder <jrdr.linux@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KCkdyYXBoaWNz
IEFQSXMgbGlrZSBPcGVuR0wgNC40IGFuZCBWdWxrYW4gcmVxdWlyZSB0aGUgZ3JhcGhpY3MgZHJp
dmVyCnRvIHByb3ZpZGUgY29oZXJlbnQgZ3JhcGhpY3MgbWVtb3J5LCBtZWFuaW5nIHRoYXQgdGhl
IEdQVSBzZWVzIGFueQpjb250ZW50IHdyaXR0ZW4gdG8gdGhlIGNvaGVyZW50IG1lbW9yeSBvbiB0
aGUgbmV4dCBHUFUgb3BlcmF0aW9uIHRoYXQKdG91Y2hlcyB0aGF0IG1lbW9yeSwgYW5kIHRoZSBD
UFUgc2VlcyBhbnkgY29udGVudCB3cml0dGVuIGJ5IHRoZSBHUFUKdG8gdGhhdCBtZW1vcnkgaW1t
ZWRpYXRlbHkgYWZ0ZXIgYW55IGZlbmNlIG9iamVjdCB0cmFpbGluZyB0aGUgR1BVCm9wZXJhdGlv
biBoYXMgc2lnbmFsZWQuCgpQYXJhdmlydHVhbCBkcml2ZXJzIHRoYXQgb3RoZXJ3aXNlIHJlcXVp
cmUgZXhwbGljaXQgc3luY2hyb25pemF0aW9uCm5lZWRzIHRvIGRvIHRoaXMgYnkgaG9va2luZyB1
cCBkaXJ0eSB0cmFja2luZyB0byBwYWdlZmF1bHQgaGFuZGxlcnMKYW5kIGJ1ZmZlciBvYmplY3Qg
dmFsaWRhdGlvbi4KClRoZSBtbSBwYXRjaCBwYWdlIHdhbGsgaW50ZXJmYWNlIGhhcyBiZWVuIHJl
d29ya2VkIHRvIGJlIHNpbWlsYXIgdG8gdGhlCnJld29ya2VkIHBhZ2Utd2FsayBjb2RlIChtbS9w
YWdld2Fsay5jKS4gVGhlcmUgaGF2ZSBiZWVuIHR3byBvdGhlciBzb2x1dGlvbnMKdG8gY29uc2lk
ZXI6CjEpIFVzaW5nIHRoZSBwYWdlLXdhbGsgY29kZS4gVGhhdCBpcyBjdXJyZW50bHkgbm90IHBv
c3NpYmxlIHNpbmNlIGl0IHJlcXVpcmVzCnRoZSBtbWFwLXNlbSB0byBiZSBoZWxkIGZvciB0aGUg
c3RydWN0IHZtX2FyZWFfc3RydWN0IHZtX2ZsYWdzIGFuZCBmb3IgaHVnZQpwYWdlIHNwbGl0dGlu
Zy4gVGhlIHBhZ2V3YWxrIGNvZGUgaW4gdGhpcyBwYXRjaHNldCBjYW4ndCBob2xkIHRoZSBtbWFw
IHNlbXMKc2luY2UgaXQgd2lsbCBsZWFkIHRvIGxvY2tpbmcgaW52ZXJzaW9uLiBXZSBoYXZlIGFu
IGVzdGFibGlzaGVkIGxvY2tpbmcgb3JkZXIKbW1hcF9zZW0gLT4gZG1hX3Jlc2VydmF0aW9uIC0+
IGlfbW1hcF9sb2NrLCB3aGVyZWFzIGhvbGRpbmcgdGhlIG1tYXBfc2VtIGluCnRoaXMgY2FzZSB3
b3VsZCByZXF1aXJlIGRtYV9yZXNlcnZhdGlvbiAtPiBpX21tYXBfbG9jayAtPiBtbWFwX3NlbS4K
SW5zdGVhZCBpdCB1c2VzIGFuIG9wZXJhdGlvbiBtb2RlIHNpbWlsYXIgdG8gdW5tYXBfbWFwcGlu
Z19yYW5nZSgpIHdoZXJlIHRoZQppX21tYXBfbG9jayBpcyBoZWxkLgoyKSBVc2luZyBhcHBseV90
b19wYWdlX3JhbmdlKCkuIFRoZSBwcmltYXJ5IHVzZSBvZiB0aGlzIGNvZGUgaXMgdG8gZmlsbApw
YWdlIHRhYmxlcy4gVGhlIG9wZXJhdGlvbiBtb2RlcyBhcmUgSU1PIHN1ZmZpY2llbnRseSBkaWZm
ZXJlbnQgdG8gbW90aXZhdGUKcmUtaW1wbGVtZW50aW5nIHRoZSBwYWdlLXdhbGsuCgpGb3IgdGhl
IFRUTSBjaGFuZ2VzIHRoZXkgYXJlIGhvcGVmdWxseSBpbiBsaW5lIHdpdGggdGhlIGxvbmctdGVy
bQpzdHJhdGVneSBvZiBtYWtpbmcgaGVscGVycyBvdXQgb2Ygd2hhdCdzIGxlZnQgb2YgVFRNLgoK
VGhlIGNvZGUgaGFzIGJlZW4gdGVzdGVkIGFuZCBleGVyY2lzZWQgYnkgYSB0YWlsb3JlZCB2ZXJz
aW9uIG9mIG1lc2EKd2hlcmUgd2UgZGlzYWJsZSBhbGwgZXhwbGljaXQgc3luY2hyb25pemF0aW9u
IGFuZCBhc3N1bWUgZ3JhcGhpY3MgbWVtb3J5CmlzIGNvaGVyZW50LiBUaGUgcGVyZm9ybWFuY2Ug
bG9zcyB2YXJpZXMgb2YgY291cnNlOyBhIHR5cGljYWwgbnVtYmVyIGlzCmFyb3VuZCA1JS4KCkkg
d291bGQgbGlrZSB0byBtZXJnZSB0aGlzIGNvZGUgdGhyb3VnaCB0aGUgRFJNIHRyZWUsIHNvIGFu
IGFjayB0byBpbmNsdWRlCnRoZSBuZXcgbW0gaGVscGVycyBpbiB0aGF0IG1lcmdlIHdvdWxkIGJl
IGdyZWF0bHkgYXBwcmVjaWF0ZWQuCgpDaGFuZ2VzIHNpbmNlIFJGQzoKLSBNZXJnZSBjb25mbGlj
dCBjaGFuZ2VzIG1vdmVkIHRvIHRoZSBjb3JyZWN0IHBhdGNoLiBGaXhlcyBpbnRyYS1wYXRjaHNl
dAogIGNvbXBpbGUgZXJyb3JzLgotIEJlIG1vcmUgYWdncmVzc2l2ZSB3aGVuIHR1cm5pbmcgdHRt
IHZtIGNvZGUgaW50byBoZWxwZXJzLiBUaGlzIG1ha2VzIHN1cmUKICB3ZSBjYW4gdXNlIGEgY29u
c3QgcXVhbGlmaWVyIG9uIHRoZSB2bXdnZnggdm1fb3BzLgotIFJlaW5zdGF0ZSBhIGxvc3QgY29t
bWVudCBhbiBmaXggYW4gZXJyb3IgcGF0aCB0aGF0IHdhcyBicm9rZW4gd2hlbiB0dXJuaW5nCiAg
dGhlIHR0bSB2bSBjb2RlIGludG8gaGVscGVycy4KLSBSZW1vdmUgZXhwbGljaXQgdHlwZS1jYXN0
cyBvZiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3ByaXZhdGVfZGF0YQotIENsYXJpZnkgdGhl
IGxvY2tpbmcgaW52ZXJzaW9uIHRoYXQgbWFrZXMgdXMgbm90IGJlaW5nIGFibGUgdG8gdXNlIHRo
ZSBtbQogIHBhZ2V3YWxrIGNvZGUuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4KQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzog
V2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0
ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBSaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+CkNj
OiBNaW5jaGFuIEtpbSA8bWluY2hhbkBrZXJuZWwub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9j
a29Ac3VzZS5jb20+CkNjOiBIdWFuZyBZaW5nIDx5aW5nLmh1YW5nQGludGVsLmNvbT4KQ2M6IFNv
dXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNz
ZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3Jn
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
