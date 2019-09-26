Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54016BF23B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 13:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097506ECCF;
	Thu, 26 Sep 2019 11:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD4A6ECDC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 11:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A8D263F715;
 Thu, 26 Sep 2019 13:56:02 +0200 (CEST)
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
 with ESMTP id WDsAyHNrQ3C6; Thu, 26 Sep 2019 13:56:01 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B2F303F6F6;
 Thu, 26 Sep 2019 13:55:56 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DD602360311;
 Thu, 26 Sep 2019 13:55:55 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: [PATCH v2 0/5] Emulated coherent graphics memory take 2
Date: Thu, 26 Sep 2019 13:55:43 +0200
Message-Id: <20190926115548.44000-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569498956; bh=sSyG1uzep6Io+55nV8hhwYEwrrW+pXAnmhIE4329T4s=;
 h=From:To:Cc:Subject:Date:From;
 b=I3LkGRaLhcuaKFJs3wQ/Ifyy+mgUG1d6eQUd1f+JgFOlmoZowj1oHWzReXYhiT/yJ
 XrUHyb8jp+8t+/vNHwz95vUyUN6OHFyVLz3Pt8O8idMK6yK7NAngaupy2kxaTPvSUe
 Xw0vxEj9DkrNdum02gtR69pWj4ig+4RiOv9eAO04=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="I3LkGRaL";
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
ZXJlbnQgdG8gbW90aXZhdGUKcmUtaW1wbGVtZW50aW5nIHRoZSBwYWdlLXdhbGsuCgpUaGUgY29k
ZSBoYXMgYmVlbiB0ZXN0ZWQgYW5kIGV4ZXJjaXNlZCBieSBhIHRhaWxvcmVkIHZlcnNpb24gb2Yg
bWVzYQp3aGVyZSB3ZSBkaXNhYmxlIGFsbCBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24gYW5kIGFz
c3VtZSBncmFwaGljcyBtZW1vcnkKaXMgY29oZXJlbnQuIFRoZSBwZXJmb3JtYW5jZSBsb3NzIHZh
cmllcyBvZiBjb3Vyc2U7IGEgdHlwaWNhbCBudW1iZXIgaXMKYXJvdW5kIDUlLgoKSSB3b3VsZCBs
aWtlIHRvIG1lcmdlIHRoaXMgY29kZSB0aHJvdWdoIHRoZSBEUk0gdHJlZSwgc28gYW4gYWNrIHRv
IGluY2x1ZGUKdGhlIG5ldyBtbSBoZWxwZXJzIGluIHRoYXQgbWVyZ2Ugd291bGQgYmUgZ3JlYXRs
eSBhcHByZWNpYXRlZC4KCkNoYW5nZXMgc2luY2UgUkZDOgotIE1lcmdlIGNvbmZsaWN0IGNoYW5n
ZXMgbW92ZWQgdG8gdGhlIGNvcnJlY3QgcGF0Y2guIEZpeGVzIGludHJhLXBhdGNoc2V0CiAgY29t
cGlsZSBlcnJvcnMuCi0gQmUgbW9yZSBhZ2dyZXNzaXZlIHdoZW4gdHVybmluZyB0dG0gdm0gY29k
ZSBpbnRvIGhlbHBlcnMuIFRoaXMgbWFrZXMgc3VyZQogIHdlIGNhbiB1c2UgYSBjb25zdCBxdWFs
aWZpZXIgb24gdGhlIHZtd2dmeCB2bV9vcHMuCi0gUmVpbnN0YXRlIGEgbG9zdCBjb21tZW50IGFu
IGZpeCBhbiBlcnJvciBwYXRoIHRoYXQgd2FzIGJyb2tlbiB3aGVuIHR1cm5pbmcKICB0aGUgdHRt
IHZtIGNvZGUgaW50byBoZWxwZXJzLgotIFJlbW92ZSBleHBsaWNpdCB0eXBlLWNhc3RzIG9mIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdDo6dm1fcHJpdmF0ZV9kYXRhCi0gQ2xhcmlmeSB0aGUgbG9ja2lu
ZyBpbnZlcnNpb24gdGhhdCBtYWtlcyB1cyBub3QgYmVpbmcgYWJsZSB0byB1c2UgdGhlIG1tCiAg
cGFnZXdhbGsgY29kZS4KCkNoYW5nZXMgc2luY2UgdjE6Ci0gUmVtb3ZlZCB0aGUgdm13Z2Z4IG1h
aW50YWluZXIgZW50cnkgZm9yIGFzX2RpcnR5X2hlbHBlcnMuYywgdXBkYXRlZAogIGNvbW1pdCBt
ZXNzYWdlIGFjY29yZGluZ2x5Ci0gUmVtb3ZlZCB0aGUgVFRNIHBhdGNoZXMgZnJvbSB0aGUgc2Vy
aWVzIGFzIHRoZXkgYXJlIG1lcmdlZCBzZXBhcmF0ZWx5CiAgdGhyb3VnaCBEUk0uCgpDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1hdHRoZXcgV2lsY294
IDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5j
b20+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBSaWsgdmFu
IFJpZWwgPHJpZWxAc3VycmllbC5jb20+CkNjOiBNaW5jaGFuIEtpbSA8bWluY2hhbkBrZXJuZWwu
b3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiBIdWFuZyBZaW5nIDx5
aW5nLmh1YW5nQGludGVsLmNvbT4KQ2M6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21h
aWwuY29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
