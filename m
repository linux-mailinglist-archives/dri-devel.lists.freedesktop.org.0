Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD27451E33
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 00:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF42989E5F;
	Mon, 24 Jun 2019 22:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA1989E5B;
 Mon, 24 Jun 2019 22:26:08 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 825AB607CA; Mon, 24 Jun 2019 22:26:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id D1040602DD;
 Mon, 24 Jun 2019 22:26:07 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 24 Jun 2019 15:26:07 -0700
From: Jeykumar Sankaran <jsanka@codeaurora.org>
To: Shubhashree Dhar <dhar@codeaurora.org>
Subject: Re: drm/msm/dpu: Correct dpu encoder spinlock initialization
In-Reply-To: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
References: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
Message-ID: <efade579f7ba59585b88ecb367422e5c@codeaurora.org>
X-Sender: jsanka@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561415168;
 bh=xXLrVZUW84vLiT46gepdIB2NIgD+nbn9CbrTZViA3W8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xa4GSngO0qeinbV+h+75FQ7AbcQs6yPjXQ/18SQpVHWUMTB1TRSleAk2D1y2eYvuD
 cMJYf+P0Bb+XQUy7mEwWwWowIN3pTO6rI2hOSZ44AyEZCCdWcavLAGCboa8XKzrPLN
 lqNT2KQBFepU04E1BEjxmTXyoNY2NqGQ7lVA8Ugo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561415167;
 bh=xXLrVZUW84vLiT46gepdIB2NIgD+nbn9CbrTZViA3W8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UWoOJ7XMfNsrY7pS8bihXfs4tRnzpW+Mh5erh4GLvw26vjqJBMqNEySBJRYTSj3cb
 mqixmffSuUq0LPsk1NbtRjHZ/is4+QSkCpOFAtH+32VZXdnFDim3pLXF6HR5SLCpyJ
 79bbY7Kt5yByj7uRnEArstz7DDqBI/CyQW8pGwYc=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jshekhar@codeaurora.org, seanpaul@chromium.org, abhinavk@codeaurora.org,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org,
 chandanu@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMyAyMzoyNywgU2h1Ymhhc2hyZWUgRGhhciB3cm90ZToKPiBkcHUgZW5jb2Rl
ciBzcGlubG9jayBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgZHVyaW5nIGRwdSBlbmNvZGVyCj4gaW5p
dCBpbnN0ZWFkIG9mIGRwdSBlbmNvZGVyIHNldHVwIHdoaWNoIGlzIHBhcnQgb2YgY29tbWl0Lgo+
IFRoZXJlIGFyZSBjaGFuY2VzIHRoYXQgdmJsYW5rIGNvbnRyb2wgdXNlcyB0aGUgdW5pbml0aWFs
aXplZAo+IHNwaW5sb2NrIGlmIG5vdCBpbml0aWFsaXplZCBkdXJpbmcgZW5jb2RlciBpbml0LgpO
b3QgbXVjaCBjYW4gYmUgZG9uZSBpZiBzb21lb25lIGlzIHBlcmZvcm1pbmcgYSB2Ymxhbmsgb3Bl
cmF0aW9uCmJlZm9yZSBlbmNvZGVyX3NldHVwIGlzIGRvbmUuCkNhbiB5b3UgcG9pbnQgdG8gdGhl
IHBhdGggd2hlcmUgdGhpcyBsb2NrIGlzIGFjcXVpcmVkIGJlZm9yZQp0aGUgZW5jb2Rlcl9zZXR1
cD8KClRoYW5rcwpKZXlrdW1hciBTLgo+IAo+IENoYW5nZS1JZDogSTVhMThiOTVmYTQ3Mzk3Yzgz
NGEyNjZiMjJhYmYzM2E1MTdiMDNhNGUKPiBTaWduZWQtb2ZmLWJ5OiBTaHViaGFzaHJlZSBEaGFy
IDxkaGFyQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfZW5jb2Rlci5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlci5jCj4gaW5kZXggNWYwODViNS4uMjI5MzhjNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+IEBAIC0yMTk1LDggKzIxOTUs
NiBAQCBpbnQgZHB1X2VuY29kZXJfc2V0dXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgCj4gc3Ry
dWN0Cj4gZHJtX2VuY29kZXIgKmVuYywKPiAgCWlmIChyZXQpCj4gIAkJZ290byBmYWlsOwo+IAo+
IC0Jc3Bpbl9sb2NrX2luaXQoJmRwdV9lbmMtPmVuY19zcGlubG9jayk7Cj4gLQo+ICAJYXRvbWlj
X3NldCgmZHB1X2VuYy0+ZnJhbWVfZG9uZV90aW1lb3V0LCAwKTsKPiAgCXRpbWVyX3NldHVwKCZk
cHVfZW5jLT5mcmFtZV9kb25lX3RpbWVyLAo+ICAJCQlkcHVfZW5jb2Rlcl9mcmFtZV9kb25lX3Rp
bWVvdXQsIDApOwo+IEBAIC0yMjUwLDYgKzIyNDgsNyBAQCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmRw
dV9lbmNvZGVyX2luaXQoc3RydWN0Cj4gZHJtX2RldmljZSAqZGV2LAo+IAo+ICAJZHJtX2VuY29k
ZXJfaGVscGVyX2FkZCgmZHB1X2VuYy0+YmFzZSwgJmRwdV9lbmNvZGVyX2hlbHBlcl9mdW5jcyk7
Cj4gCj4gKwlzcGluX2xvY2tfaW5pdCgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrKTsKPiAgCWRwdV9l
bmMtPmVuYWJsZWQgPSBmYWxzZTsKPiAKPiAgCXJldHVybiAmZHB1X2VuYy0+YmFzZTsKCi0tIApK
ZXlrdW1hciBTCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
