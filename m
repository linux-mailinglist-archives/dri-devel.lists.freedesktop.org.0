Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B46AA6977
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 15:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021389533;
	Tue,  3 Sep 2019 13:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78306891AC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 13:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9C5F93F54E;
 Tue,  3 Sep 2019 15:15:22 +0200 (CEST)
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
 with ESMTP id l1oVibWZcKHx; Tue,  3 Sep 2019 15:15:21 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 46A523F51E;
 Tue,  3 Sep 2019 15:15:17 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 708593601AA;
 Tue,  3 Sep 2019 15:15:17 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, pv-drivers@vmware.com,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] x86/mm: Export force_dma_unencrypted
Date: Tue,  3 Sep 2019 15:15:01 +0200
Message-Id: <20190903131504.18935-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903131504.18935-1-thomas_os@shipmail.org>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567516517; bh=CwPlWMqNIoHpvpaCS2RkGsqHLRvDXKYi/D3e4ugVZs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=azHWWWLhzcGVMpwIpn2R/eBcDN0Ef6jjXNgEGall+tE6cCdq6Tguyji/m+c/0gU6v
 mNJNNjafFM/JZ2XbxP0ZTClY9R/w1hXcU3bBbQyPSPohOOHAfnTW97vChGHgt7LM7w
 Tkv78TlxhetEHwHAAFp+hjsYmxUMYwzgND7YJ0IQ=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="azHWWWLh";
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIGZvcmNl
X2RtYV91bmVuY3J5cHRlZCBzeW1ib2wgaXMgbmVlZGVkIGJ5IFRUTSB0byBzZXQgdXAgdGhlIGNv
cnJlY3QKcGFnZSBwcm90ZWN0aW9uIHdoZW4gbWVtb3J5IGVuY3J5cHRpb24gaXMgYWN0aXZlLiBF
eHBvcnQgaXQuCgpDYzogRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT4K
Q2M6IEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPgpDYzogUGV0ZXIgWmlqbHN0cmEg
PHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBl
dGtvdiA8YnBAYWxpZW44LmRlPgpDYzogIkguIFBldGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4K
Q2M6IEhlaWtvIENhcnN0ZW5zIDxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPgpDYzogQ2hyaXN0
aWFuIEJvcm50cmFlZ2VyIDxib3JudHJhZWdlckBkZS5pYm0uY29tPgpDYzogVG9tIExlbmRhY2t5
IDx0aG9tYXMubGVuZGFja3lAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxz
dHJvbUB2bXdhcmUuY29tPgotLS0KIGFyY2gveDg2L21tL21lbV9lbmNyeXB0LmMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL21l
bV9lbmNyeXB0LmMgYi9hcmNoL3g4Ni9tbS9tZW1fZW5jcnlwdC5jCmluZGV4IGZlY2UzMGNhOGIw
Yy4uYmJmZTg4MDJkNjNhIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9tZW1fZW5jcnlwdC5jCisr
KyBiL2FyY2gveDg2L21tL21lbV9lbmNyeXB0LmMKQEAgLTM3Nyw2ICszNzcsNyBAQCBib29sIGZv
cmNlX2RtYV91bmVuY3J5cHRlZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAlyZXR1cm4gZmFsc2U7
CiB9CitFWFBPUlRfU1lNQk9MKGZvcmNlX2RtYV91bmVuY3J5cHRlZCk7CiAKIC8qIEFyY2hpdGVj
dHVyZSBfX3dlYWsgcmVwbGFjZW1lbnQgZnVuY3Rpb25zICovCiB2b2lkIF9faW5pdCBtZW1fZW5j
cnlwdF9mcmVlX2RlY3J5cHRlZF9tZW0odm9pZCkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
