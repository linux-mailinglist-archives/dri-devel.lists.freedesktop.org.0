Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6341CB9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5536789261;
	Wed, 12 Jun 2019 06:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49B1891DA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 12:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 497503F4C0;
 Tue, 11 Jun 2019 14:25:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yb0vNCNrCl76; Tue, 11 Jun 2019 14:25:09 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 9CE893F5EC;
 Tue, 11 Jun 2019 14:25:08 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EB08D3619AA;
 Tue, 11 Jun 2019 14:25:07 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thellstrom@vmwopensource.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/9] Emulated coherent graphics memory
Date: Tue, 11 Jun 2019 14:24:45 +0200
Message-Id: <20190611122454.3075-1-thellstrom@vmwopensource.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=vmwopensource.org; s=mail; t=1560255908;
 bh=8SSMjg5S87UIXKzzTPf2fASPtyT5YDoyHJlCuHXj464=;
 h=From:To:Cc:Subject:Date:From;
 b=gMRzw4i46y1oAfDZUJ2LywkUYfekmuoX6aqewJklfhU9nCUbA6MDcbNuaRtcft1Qc
 tHI4tnrN0IyvR0CuFY7JKYiUdP13sYQdzDiSFEOcU3r2unZGMNjUCMuLEF44Gsr51R
 CXXDFm6S1cPfQjHgAkRWT+8OCA+uRA2m0QJNJaGo=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=vmwopensource.org header.i=@vmwopensource.org
 header.b=gMRzw4i4; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=vmwopensource.org
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
Cc: Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
 pv-drivers@vmware.com, Minchan Kim <minchan@kernel.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com, Souptick Joarder <jrdr.linux@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxhbm5pbmcgdG8gbWVyZ2UgdGhpcyB0aHJvdWdoIHRoZSBkcm0vdm13Z2Z4IHRyZWUgc29vbiwg
c28gaWYgdGhlcmUKYXJlIGFueSBvYmplY3Rpb25zLCBwbGVhc2Ugc3BlYWsgdXAuCgpHcmFwaGlj
cyBBUElzIGxpa2UgT3BlbkdMIDQuNCBhbmQgVnVsa2FuIHJlcXVpcmUgdGhlIGdyYXBoaWNzIGRy
aXZlcgp0byBwcm92aWRlIGNvaGVyZW50IGdyYXBoaWNzIG1lbW9yeSwgbWVhbmluZyB0aGF0IHRo
ZSBHUFUgc2VlcyBhbnkKY29udGVudCB3cml0dGVuIHRvIHRoZSBjb2hlcmVudCBtZW1vcnkgb24g
dGhlIG5leHQgR1BVIG9wZXJhdGlvbiB0aGF0CnRvdWNoZXMgdGhhdCBtZW1vcnksIGFuZCB0aGUg
Q1BVIHNlZXMgYW55IGNvbnRlbnQgd3JpdHRlbiBieSB0aGUgR1BVCnRvIHRoYXQgbWVtb3J5IGlt
bWVkaWF0ZWx5IGFmdGVyIGFueSBmZW5jZSBvYmplY3QgdHJhaWxpbmcgdGhlIEdQVQpvcGVyYXRp
b24gaGFzIHNpZ25hbGVkLgoKUGFyYXZpcnR1YWwgZHJpdmVycyB0aGF0IG90aGVyd2lzZSByZXF1
aXJlIGV4cGxpY2l0IHN5bmNocm9uaXphdGlvbgpuZWVkcyB0byBkbyB0aGlzIGJ5IGhvb2tpbmcg
dXAgZGlydHkgdHJhY2tpbmcgdG8gcGFnZWZhdWx0IGhhbmRsZXJzCmFuZCBidWZmZXIgb2JqZWN0
IHZhbGlkYXRpb24uIFRoaXMgaXMgYSBmaXJzdCBhdHRlbXB0IHRvIGRvIHRoYXQgZm9yCnRoZSB2
bXdnZnggZHJpdmVyLgoKVGhlIG1tIHBhdGNoZXMgaGFzIGJlZW4gb3V0IGZvciBSRkMuIEkgdGhp
bmsgSSBoYXZlIGFkZHJlc3NlZCBhbGwgdGhlCmZlZWRiYWNrIEkgZ290LCBleGNlcHQgYSBwb3Nz
aWJsZSBzb2Z0ZGlydHkgYnJlYWthZ2UuIEJ1dCBhbHRob3VnaCB0aGUKZGlydHktdHJhY2tpbmcg
YW5kIHNvZnRkaXJ0eSBtYXkgd3JpdGUtcHJvdGVjdCBQVEVzIGJvdGggY2FyZSBhYm91dCwKdGhh
dCBzaG91bGRuJ3QgcmVhbGx5IGNhdXNlIGFueSBvcGVyYXRpb24gaW50ZXJmZXJlbmNlLiBJbiBw
YXJ0aWN1bGFyCnNpbmNlIHdlIHVzZSB0aGUgaGFyZHdhcmUgZGlydHkgUFRFIGJpdHMgYW5kIHNv
ZnRkaXJ0eSB1c2VzIG90aGVyIFBURSBiaXRzLgoKRm9yIHRoZSBUVE0gY2hhbmdlcyB0aGV5IGFy
ZSBob3BlZnVsbHkgaW4gbGluZSB3aXRoIHRoZSBsb25nLXRlcm0Kc3RyYXRlZ3kgb2YgbWFraW5n
IGhlbHBlcnMgb3V0IG9mIHdoYXQncyBsZWZ0IG9mIFRUTS4KClRoZSBjb2RlIGhhcyBiZWVuIHRl
c3RlZCBhbmQgZXhjZXJjaXNlZCBieSBhIHRhaWxvcmVkIHZlcnNpb24gb2YgbWVzYQp3aGVyZSB3
ZSBkaXNhYmxlIGFsbCBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24gYW5kIGFzc3VtZSBncmFwaGlj
cyBtZW1vcnkKaXMgY29oZXJlbnQuIFRoZSBwZXJmb3JtYW5jZSBsb3NzIHZhcmllcyBvZiBjb3Vy
c2U7IGEgdHlwaWNhbCBudW1iZXIgaXMKYXJvdW5kIDUlLgoKQ2hhbmdlcyB2MS12MjoKLSBBZGRy
ZXNzZWQgYSBudW1iZXIgb2YgdHlwb3MgYW5kIGZvcm1hdHRpbmcgaXNzdWVzLgotIEFkZGVkIGEg
dXNhZ2Ugd2FybmluZyBmb3IgYXBwbHlfdG9fcGZuX3JhbmdlKCkgYW5kIGFwcGx5X3RvX3BhZ2Vf
cmFuZ2UoKQotIFJlLWV2YWx1YXRlZCB0aGUgZGVjaXNpb24gdG8gdXNlIGFwcGx5X3RvX3Bmbl9y
YW5nZSgpIHJhdGhlciB0aGFuCiAgbW9kaWZ5aW5nIHRoZSBwYWdld2Fsay5jLiBJdCBzdGlsbCBs
b29rcyBsaWtlIGdlbmVyaWNhbGx5IGhhbmRsaW5nIHRoZQogIHRyYW5zcGFyZW50IGh1Z2UgcGFn
ZSBjYXNlcyByZXF1aXJlcyB0aGUgbW1hcF9zZW0gdG8gYmUgaGVsZCBhdCBsZWFzdAogIGluIHJl
YWQgbW9kZSwgc28gc3RpY2tpbmcgd2l0aCBhcHBseV90b19wZm5fcmFuZ2UoKSBmb3Igbm93Lgot
IFRoZSBUVE0gcGFnZS1mYXVsdCBoZWxwZXIgdm1hIGNvcHkgYXJndW1lbnQgd2FzIHNjcmF0Y2hl
ZCBpbiBmYXZvdXIgb2YKICBhIHBhZ2Vwcm90X3QgYXJndW1lbnQuCkNoYW5nZXMgdjM6Ci0gQWRh
cHRlZCB0byB1cHN0cmVhbSBBUEkgY2hhbmdlcy4KQ2hhbmdlcyB2NDoKLSBBZGFwdGVkIHRvIHVw
c3RyZWFtIG1tdV9ub3RpZmllciBjaGFuZ2VzLiAoSmVyb21lPykKLSBGaXhlZCBhIGNvdXBsZSBv
ZiB3YXJuaW5ncyBvbiAzMi1iaXQgeDg2Ci0gRml4ZWQgaW1hZ2Ugb2Zmc2V0IGNvbXB1dGF0aW9u
IG9uIG11bHRpc2FtcGxlIGltYWdlcy4KICAKQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+CkNjOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4K
Q2M6IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNvbkBhcm0uY29tPgpDYzogUGV0ZXIgWmlqbHN0cmEg
PHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogUmlrIHZhbiBSaWVsIDxyaWVsQHN1cnJpZWwuY29t
PgpDYzogTWluY2hhbiBLaW0gPG1pbmNoYW5Aa2VybmVsLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8
bWhvY2tvQHN1c2UuY29tPgpDYzogSHVhbmcgWWluZyA8eWluZy5odWFuZ0BpbnRlbC5jb20+CkNj
OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KQ2M6ICJKw6lyw7RtZSBH
bGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
