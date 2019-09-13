Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0538CB1E9B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C566F3AB;
	Fri, 13 Sep 2019 13:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D676F3AB;
 Fri, 13 Sep 2019 13:16:27 +0000 (UTC)
Received: from localhost (unknown [104.132.45.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1886B20CC7;
 Fri, 13 Sep 2019 13:16:26 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Date: Fri, 13 Sep 2019 14:05:47 +0100
Message-Id: <20190913130606.981926197@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913130559.669563815@linuxfoundation.org>
References: <20190913130559.669563815@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568380587;
 bh=zOG44NvZII34L1rJxUscROwjCbvLnAhsBzplt5zW7gE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rMGbEDQaIgJqotn8TtEeOZBstFJiWMDoNjzJtw9PyzKt3xBDCGT7V2l3gC92EYdmb
 JDGWcQ813/S2+3fbHX89DcHoAvPndziK9jr/JCM3KkAVhmBDVFXF4OHtMyqM2kzCws
 qaZHNKSEf664DVjsmgZ4pJwiucfImCJ4XB4DvfIY=
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WyBVcHN0cmVhbSBjb21taXQgYjUxM2ExOGNmMWQ3MDViZDA0ZWZkOTFjNDE3ZTc5ZTQ5MzhiZTA5
MyBdCgpUaGlzIGlzIG11Y2ggbG91ZGVyIHRoZW4gd2Ugd2FudC4gVkNQSSBhbGxvY2F0aW9uIGZh
aWx1cmVzIGFyZSBxdWl0ZQpub3JtYWwsIHNpbmNlIHRoZXkgd2lsbCBoYXBwZW4gaWYgYW55IHBh
cnQgb2YgdGhlIG1vZGVzZXR0aW5nIHByb2Nlc3MgaXMKaW50ZXJydXB0ZWQgYnkgcmVtb3Zpbmcg
dGhlIERQIE1TVCB0b3BvbG9neSBpbiBxdWVzdGlvbi4gU28ganVzdCBwcmludCBhCmRlYnVnZ2lu
ZyBtZXNzYWdlIG9uIFZDUEkgZmFpbHVyZXMgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IEx5dWRl
IFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkZpeGVzOiBmNDc5YzBiYTRhMTcgKCJkcm0vbm91dmVh
dS9rbXMvbnY1MDogaW5pdGlhbCBzdXBwb3J0IGZvciBEUCAxLjIgbXVsdGktc3RyZWFtIikKQ2M6
IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyB2NC4xMCsKU2lnbmVkLW9mZi1ieTogQmVuIFNrZWdncyA8YnNr
ZWdnc0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggZjg4OWQ0MWEyODFmYS4uNWUw
MWJmYjY5ZDdhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAt
NzU5LDcgKzc1OSw4IEBAIG52NTBfbXN0b19lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyKQogCiAJc2xvdHMgPSBkcm1fZHBfZmluZF92Y3BpX3Nsb3RzKCZtc3RtLT5tZ3IsIG1zdGMt
PnBibik7CiAJciA9IGRybV9kcF9tc3RfYWxsb2NhdGVfdmNwaSgmbXN0bS0+bWdyLCBtc3RjLT5w
b3J0LCBtc3RjLT5wYm4sIHNsb3RzKTsKLQlXQVJOX09OKCFyKTsKKwlpZiAoIXIpCisJCURSTV9E
RUJVR19LTVMoIkZhaWxlZCB0byBhbGxvY2F0ZSBWQ1BJXG4iKTsKIAogCWlmICghbXN0bS0+bGlu
a3MrKykKIAkJbnY1MF9vdXRwX2FjcXVpcmUobXN0bS0+b3V0cCk7Ci0tIAoyLjIwLjEKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
