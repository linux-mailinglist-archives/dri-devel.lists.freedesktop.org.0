Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A49D7BF0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D9A6E85B;
	Tue, 15 Oct 2019 16:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7666E849
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 16:23:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DACD6B63F;
 Tue, 15 Oct 2019 16:22:59 +0000 (UTC)
Date: Tue, 15 Oct 2019 09:21:44 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: robdclark@gmail.com
Subject: Re: [PATCH] drm/msm/a5xx: Fix barrier usage in set_preempt_state()
Message-ID: <20191015162144.fuyc25tdwvc6ddu3@linux-p48b>
References: <20191015011438.22184-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015011438.22184-1-dave@stgolabs.net>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
Cc: sean@poorly.run, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Davidlohr Bueso <dbueso@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yZ290IHRvIENjIGxrbWwuCgpPbiBNb24sIDE0IE9jdCAyMDE5LCBEYXZpZGxvaHIgQnVlc28g
d3JvdGU6Cgo+QmVjYXVzZSBpdCBpcyBub3QgYSBSbXcgb3BlcmF0aW9uLCBhdG9taWNfc2V0KCkg
aXMgbmV2ZXIgc2VyaWFsaXplZCwKPmFuZCB0aGVyZWZvcmUgdGhlICd1cGdyYWRhYmxlJyBzbXBf
bWJfX3tiZWZvcmUsYWZ0ZXJ9X2F0b21pYygpIGNhbGxzCj50aGF0IG9yZGVyIHRoZSB3cml0ZSB0
byBwcmVlbXB0X3N0YXRlIGFyZSBjb21wbGV0ZWx5IGJvZ3VzLgo+Cj5UaGlzIHBhdGNoIHJlcGxh
Y2VzIHRoZXNlIHdpdGggc21wX21iKCksIHdoaWNoIHNlZW1zIGxpa2UgdGhlCj5vcmlnaW5hbCBp
bnRlbnQgb2Ygd2hlbiB0aGUgY29kZSB3YXMgd3JpdHRlbi4KPgo+U2lnbmVkLW9mZi1ieTogRGF2
aWRsb2hyIEJ1ZXNvIDxkYnVlc29Ac3VzZS5kZT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E1eHhfcHJlZW1wdC5jIHwgNCArKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E1eHhfcHJlZW1wdC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4
eF9wcmVlbXB0LmMKPmluZGV4IDljZjkzNTNhN2ZmMS4uZDI3ZDhkMzIwOGM2IDEwMDY0NAo+LS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMKPisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfcHJlZW1wdC5jCj5AQCAtMzAsMTAgKzMwLDEwIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcHJlZW1wdF9zdGF0ZShzdHJ1Y3QgYTV4eF9ncHUgKmdw
dSwKPiAJICogcHJlZW1wdGlvbiBvciBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgc28gYmFycmll
cnMgYXJlIG5lZWRlZAo+IAkgKiBiZWZvcmUuLi4KPiAJICovCj4tCXNtcF9tYl9fYmVmb3JlX2F0
b21pYygpOwo+KwlzbXBfbWIoKTsKPiAJYXRvbWljX3NldCgmZ3B1LT5wcmVlbXB0X3N0YXRlLCBu
ZXcpOwo+IAkvKiAuLi4gYW5kIGFmdGVyKi8KPi0Jc21wX21iX19hZnRlcl9hdG9taWMoKTsKPisJ
c21wX21iKCk7Cj4gfQo+Cj4gLyogV3JpdGUgdGhlIG1vc3QgcmVjZW50IHdwdHIgZm9yIHRoZSBn
aXZlbiByaW5nIGludG8gdGhlIGhhcmR3YXJlICovCj4tLSAKPjIuMTYuNAo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
