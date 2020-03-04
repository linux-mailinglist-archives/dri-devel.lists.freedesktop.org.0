Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926E178E5E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227B16EB08;
	Wed,  4 Mar 2020 10:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0EF6EB08
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 5670B3F6D0;
 Wed,  4 Mar 2020 11:28:55 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="QHjO1csv";
 dkim-atps=neutral
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
 with ESMTP id neqJkKEP4O_K; Wed,  4 Mar 2020 11:28:54 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 613173F6C5;
 Wed,  4 Mar 2020 11:28:48 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B38913602F7;
 Wed,  4 Mar 2020 11:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583317727; bh=8QpzQ2ublJJs8/27qDaTvHB44L3rciEGT/yi+WqQA20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QHjO1csvivWThNGKB74IK9JcfLAR5J1YxsnXZUifpHo6+9dK7yplAhCKcc7N9BvYV
 DlK7qfzQa0kqwYYIiwNmlokdd12gnHMimcVGZuPgDEwxXVhZUhlnGvdd7i7jH8YnyN
 6z+wateliLyBG30/VQHnGm2zVPpyV7uU2D8y8d+g=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/9] fs: Constify vma argument to vma_is_dax
Date: Wed,  4 Mar 2020 11:28:32 +0100
Message-Id: <20200304102840.2801-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200304102840.2801-1-thomas_os@shipmail.org>
References: <20200304102840.2801-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIGZ1bmN0
aW9uIGlzIHVzZWQgYnkgdXBjb21pbmcgdm1hX2lzX3NwZWNpYWxfaHVnZSgpIHdpdGggd2hpY2gg
d2Ugd2FudAp0byB1c2UgYSBjb25zdCB2bWEgYXJndW1lbnQuIFNpbmNlIGZvciB2bWFfaXNfZGF4
KCkgdGhlIHZtYSBhcmd1bWVudCBpcwpvbmx5IGRlcmVmZXJlbmNlZCBmb3IgcmVhZGluZywgY29u
c3RpZnkgaXQuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4K
Q2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294IChP
cmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxr
aXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1w
YmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNv
bT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
RGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KUmV2aWV3ZWQtYnk6IFJvbGFu
ZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvbGludXgvZnMuaCB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZnMuaCBiL2luY2x1ZGUvbGludXgvZnMuaAppbmRleCAz
Y2Q0ZmU2Yjg0NWUuLjJiMzhjZTViNzNhZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9mcy5o
CisrKyBiL2luY2x1ZGUvbGludXgvZnMuaApAQCAtMzM5MSw3ICszMzkxLDcgQEAgc3RhdGljIGlu
bGluZSBib29sIGlvX2lzX2RpcmVjdChzdHJ1Y3QgZmlsZSAqZmlscCkKIAlyZXR1cm4gKGZpbHAt
PmZfZmxhZ3MgJiBPX0RJUkVDVCkgfHwgSVNfREFYKGZpbHAtPmZfbWFwcGluZy0+aG9zdCk7CiB9
CiAKLXN0YXRpYyBpbmxpbmUgYm9vbCB2bWFfaXNfZGF4KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKQorc3RhdGljIGlubGluZSBib29sIHZtYV9pc19kYXgoY29uc3Qgc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEpCiB7CiAJcmV0dXJuIHZtYS0+dm1fZmlsZSAmJiBJU19EQVgodm1hLT52bV9m
aWxlLT5mX21hcHBpbmctPmhvc3QpOwogfQotLSAKMi4yMS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
