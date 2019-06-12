Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39B941C6A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6025789249;
	Wed, 12 Jun 2019 06:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692F689232
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A81053F4D4;
 Wed, 12 Jun 2019 08:43:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GIepRt2s3xa6; Wed, 12 Jun 2019 08:42:56 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5499A3F38D;
 Wed, 12 Jun 2019 08:42:55 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BA7783619AF;
 Wed, 12 Jun 2019 08:42:54 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thellstrom@vmwopensource.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/9] Emulated coherent graphics memory
Date: Wed, 12 Jun 2019 08:42:34 +0200
Message-Id: <20190612064243.55340-1-thellstrom@vmwopensource.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=vmwopensource.org; s=mail; t=1560321774;
 bh=WByRYt5aLCsI5/JRo0mK5a2KNL8fi1jYGttv4dC9TWM=;
 h=From:To:Cc:Subject:Date:From;
 b=m3g04XUOi3+wmlV5q5yPo/679JErYTahFbyb9/TgMh9mwskbT6O4oJ6p58+JNehNT
 DCe+GRbQmmugO+pW/5d/5FgblMp3QWO8T4AmXg+D7na6lEtBx29/MmWP2kMlkRZM2O
 1Z/0ncxWla/yhVHlhUA7Tf3GHqh0IGZx2PLpxBOQ=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=vmwopensource.org header.i=@vmwopensource.org
 header.b=m3g04XUO; 
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
Cc: Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
 pv-drivers@vmware.com, Minchan Kim <minchan@kernel.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com, Souptick Joarder <jrdr.linux@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 nadav.amit@gmail.com,
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
IG9uIG11bHRpc2FtcGxlIGltYWdlcy4KQ2hhbmdlcyB2NToKLSBVcGRhdGVkIHVzYWdlIHdhcm5p
bmcgaW4gcGF0Y2ggMy85IGFmdGVyIHJldmlldyBjb21tZW50cyBmcm9tIE5hZGF2IEFtaXQuCiAg
CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWF0dGhl
dyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBXaWxsIERlYWNvbiA8d2lsbC5kZWFj
b25AYXJtLmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6
IFJpayB2YW4gUmllbCA8cmllbEBzdXJyaWVsLmNvbT4KQ2M6IE1pbmNoYW4gS2ltIDxtaW5jaGFu
QGtlcm5lbC5vcmc+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6IEh1YW5n
IFlpbmcgPHlpbmcuaHVhbmdAaW50ZWwuY29tPgpDYzogU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBs
aW51eC1tbUBrdmFjay5vcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
