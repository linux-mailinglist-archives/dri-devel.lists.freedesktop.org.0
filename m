Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B942ABF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 17:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA95389622;
	Wed, 12 Jun 2019 15:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9267896E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 080E73FFD7;
 Wed, 12 Jun 2019 17:20:26 +0200 (CEST)
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
 with ESMTP id w-DfZwpwH_gn; Wed, 12 Jun 2019 17:20:11 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E0D1C3FFCB;
 Wed, 12 Jun 2019 17:20:09 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 40B773619A3;
 Wed, 12 Jun 2019 17:20:09 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thellstrom@vmwopensource.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/9] Emulated coherent graphics memory
Date: Wed, 12 Jun 2019 17:19:41 +0200
Message-Id: <20190612151950.2870-1-thellstrom@vmwopensource.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=vmwopensource.org; s=mail; t=1560352809;
 bh=pGEJYdtLLWrJMrg31kW9zdSgU0dUJ0reBVE+9VgZv4k=;
 h=From:To:Cc:Subject:Date:From;
 b=yhEIAnylogNBfOeQi28R3TPU+54yU+KzrqncZ4dKWRwtzqT3vcepmyK9JPg59dNNq
 TklWWzrc9GdJZgU8rWqqSwNXO9qfyJoRzo1p/qiOJrk5zM1xNwxnWA7En2+vgYylNS
 4D6JVBxC7b/4AnVvTe+a/3cnFP6yituWBR3ITlcI=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=vmwopensource.org header.i=@vmwopensource.org
 header.b=yhEIAnyl; 
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
 Matthew Wilcox <willy@infradead.org>, hch@infradead.org,
 Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, linux-mm@kvack.org,
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
c3RlZCBhbmQgZXhlcmNpc2VkIGJ5IGEgdGFpbG9yZWQgdmVyc2lvbiBvZiBtZXNhCndoZXJlIHdl
IGRpc2FibGUgYWxsIGV4cGxpY2l0IHN5bmNocm9uaXphdGlvbiBhbmQgYXNzdW1lIGdyYXBoaWNz
IG1lbW9yeQppcyBjb2hlcmVudC4gVGhlIHBlcmZvcm1hbmNlIGxvc3MgdmFyaWVzIG9mIGNvdXJz
ZTsgYSB0eXBpY2FsIG51bWJlciBpcwphcm91bmQgNSUuCgpDaGFuZ2VzIHYxLXYyOgotIEFkZHJl
c3NlZCBhIG51bWJlciBvZiB0eXBvcyBhbmQgZm9ybWF0dGluZyBpc3N1ZXMuCi0gQWRkZWQgYSB1
c2FnZSB3YXJuaW5nIGZvciBhcHBseV90b19wZm5fcmFuZ2UoKSBhbmQgYXBwbHlfdG9fcGFnZV9y
YW5nZSgpCi0gUmUtZXZhbHVhdGVkIHRoZSBkZWNpc2lvbiB0byB1c2UgYXBwbHlfdG9fcGZuX3Jh
bmdlKCkgcmF0aGVyIHRoYW4KICBtb2RpZnlpbmcgdGhlIHBhZ2V3YWxrLmMuIEl0IHN0aWxsIGxv
b2tzIGxpa2UgZ2VuZXJpY2FsbHkgaGFuZGxpbmcgdGhlCiAgdHJhbnNwYXJlbnQgaHVnZSBwYWdl
IGNhc2VzIHJlcXVpcmVzIHRoZSBtbWFwX3NlbSB0byBiZSBoZWxkIGF0IGxlYXN0CiAgaW4gcmVh
ZCBtb2RlLCBzbyBzdGlja2luZyB3aXRoIGFwcGx5X3RvX3Bmbl9yYW5nZSgpIGZvciBub3cuCi0g
VGhlIFRUTSBwYWdlLWZhdWx0IGhlbHBlciB2bWEgY29weSBhcmd1bWVudCB3YXMgc2NyYXRjaGVk
IGluIGZhdm91ciBvZgogIGEgcGFnZXByb3RfdCBhcmd1bWVudC4KQ2hhbmdlcyB2MzoKLSBBZGFw
dGVkIHRvIHVwc3RyZWFtIEFQSSBjaGFuZ2VzLgpDaGFuZ2VzIHY0OgotIEFkYXB0ZWQgdG8gdXBz
dHJlYW0gbW11X25vdGlmaWVyIGNoYW5nZXMuIChKZXJvbWU/KQotIEZpeGVkIGEgY291cGxlIG9m
IHdhcm5pbmdzIG9uIDMyLWJpdCB4ODYKLSBGaXhlZCBpbWFnZSBvZmZzZXQgY29tcHV0YXRpb24g
b24gbXVsdGlzYW1wbGUgaW1hZ2VzLgpDaGFuZ2VzIHY1OgotIFVwZGF0ZWQgdXNhZ2Ugd2Fybmlu
ZyBpbiBwYXRjaCAzLzkgYWZ0ZXIgcmV2aWV3IGNvbW1lbnRzIGZyb20gTmFkYXYgQW1pdC4KQ2hh
bmdlcyB2NjoKLSBVcGRhdGVkIGV4cG9ydHMgb2YgbmV3IGZ1bmN0aW9uYWxpdHkgaW4gcGF0Y2gg
My85IHRvIEVYUE9SVF9TWU1CT0xfR1BMCiAgYWZ0ZXIgcmV2aWV3IGNvbW1lbnRzIGZyb20gQ2hy
aXN0b3BoIEhlbGx3aWcuCiAgCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBXaWxs
IERlYWNvbiA8d2lsbC5kZWFjb25AYXJtLmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4KQ2M6IFJpayB2YW4gUmllbCA8cmllbEBzdXJyaWVsLmNvbT4KQ2M6IE1p
bmNoYW4gS2ltIDxtaW5jaGFuQGtlcm5lbC5vcmc+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0Bz
dXNlLmNvbT4KQ2M6IEh1YW5nIFlpbmcgPHlpbmcuaHVhbmdAaW50ZWwuY29tPgpDYzogU291cHRp
Y2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8
amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
