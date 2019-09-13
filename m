Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF1B1AD3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C66EEF4;
	Fri, 13 Sep 2019 09:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF6C6EEF0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5AEFD3F478;
 Fri, 13 Sep 2019 11:32:32 +0200 (CEST)
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
 with ESMTP id nb4XqZG-u2Zu; Fri, 13 Sep 2019 11:32:29 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id CE2853F218;
 Fri, 13 Sep 2019 11:32:27 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2575F360195;
 Fri, 13 Sep 2019 11:32:27 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: [RFC PATCH 0/7] Emulated coherent graphics memory take 2
Date: Fri, 13 Sep 2019 11:32:06 +0200
Message-Id: <20190913093213.27254-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568367147; bh=AQOLmDnO0mrHB5UncaWVaavZGiTO0sudlEHqCbG4rDA=;
 h=From:To:Cc:Subject:Date:From;
 b=C8h0pnZjwksWBXQoCo18ZijBLNk8D0f0Btz9y5wKAmpYbCXTs9Hdg+Mt2tcALu75Q
 UHEGnYN+ejDSaj5QWqVNjZGWgQd292g7P9bnVA5WOg7vklzJWwqc+S+zlsSYb6xSn0
 2ijI86K8GufVXmKpETRWNRblr6BRqN2tijJGauJU=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=C8h0pnZj; 
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
IHNlbXMKc2luY2UgaXQgd2lsbCBsZWFkIHRvIGxvY2tpbmcgaW52ZXJzaW9uLiBJbnN0ZWFkIGl0
IHVzZXMgYW4gb3BlcmF0aW9uIG1vZGUKc2ltaWxhciB0byB1bm1hcF9tYXBwaW5nX3JhbmdlIHdo
ZXJlIHRoZSBpX21tYXBfbG9jayBpcyBoZWxkLgoyKSBVc2luZyBhcHBseV90b19wYWdlX3Jhbmdl
KCkuIFRoZSBwcmltYXJ5IHVzZSBvZiB0aGlzIGNvZGUgaXMgdG8gZmlsbApwYWdlIHRhYmxlcy4g
VGhlIG9wZXJhdGlvbiBtb2RlcyBhcmUgSU1PIHN1ZmZpY2llbnRseSBkaWZmZXJlbnQgdG8gbW90
aXZhdGUKcmUtaW1wbGVtZW50aW5nIHRoZSBwYWdlLXdhbGsuCgpGb3IgdGhlIFRUTSBjaGFuZ2Vz
IHRoZXkgYXJlIGhvcGVmdWxseSBpbiBsaW5lIHdpdGggdGhlIGxvbmctdGVybQpzdHJhdGVneSBv
ZiBtYWtpbmcgaGVscGVycyBvdXQgb2Ygd2hhdCdzIGxlZnQgb2YgVFRNLgoKVGhlIGNvZGUgaGFz
IGJlZW4gdGVzdGVkIGFuZCBleGVyY2lzZWQgYnkgYSB0YWlsb3JlZCB2ZXJzaW9uIG9mIG1lc2EK
d2hlcmUgd2UgZGlzYWJsZSBhbGwgZXhwbGljaXQgc3luY2hyb25pemF0aW9uIGFuZCBhc3N1bWUg
Z3JhcGhpY3MgbWVtb3J5CmlzIGNvaGVyZW50LiBUaGUgcGVyZm9ybWFuY2UgbG9zcyB2YXJpZXMg
b2YgY291cnNlOyBhIHR5cGljYWwgbnVtYmVyIGlzCmFyb3VuZCA1JS4KCkkgd291bGQgbGlrZSB0
byBtZXJnZSB0aGlzIGNvZGUgdGhyb3VnaCB0aGUgRFJNIHRyZWUsIHNvIGFuIGFjayB0byBkbyB0
aGF0CmZyb20gYW4gbW0gbWFpbnRhaW5lciB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLgoK
Q2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNYXR0aGV3
IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNv
bkBhcm0uY29tPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzog
UmlrIHZhbiBSaWVsIDxyaWVsQHN1cnJpZWwuY29tPgpDYzogTWluY2hhbiBLaW0gPG1pbmNoYW5A
a2VybmVsLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogSHVhbmcg
WWluZyA8eWluZy5odWFuZ0BpbnRlbC5jb20+CkNjOiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxp
bnV4QGdtYWlsLmNvbT4KQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+
CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
