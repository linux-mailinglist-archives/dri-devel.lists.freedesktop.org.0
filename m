Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C39F963B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 17:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CFC6EB78;
	Tue, 12 Nov 2019 16:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F77689804;
 Tue, 12 Nov 2019 16:55:54 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 670CF60F40; Tue, 12 Nov 2019 16:55:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FE5960A1D;
 Tue, 12 Nov 2019 16:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FE5960A1D
Date: Tue, 12 Nov 2019 09:55:48 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 14/16] drm/msm: avoid using 'timespec'
Message-ID: <20191112165548.GB14014@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>,
 Jonathan Marek <jonathan@marek.ca>,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20191108213257.3097633-1-arnd@arndb.de>
 <20191108213257.3097633-15-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108213257.3097633-15-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573577753;
 bh=2qpw0n4O5/VIIorasibWq8jjTR8oYNzI+JNmPHLt2pY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iGmZdbQY66/bgutJyGZVBGTaKUuS8gepGQsU64940awZpY2+X1sD5qNEOW+V0ZAoH
 vxhd/0kI4Ht1oDTdl1EULXWaN3AIvSf0EjKZ+3SFn0y8nsHK/+IMc18lS9zE+HZM80
 4BGB687GMhlzpInsbZe4bgMJw1IFmc5306zA4P+0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573577751;
 bh=2qpw0n4O5/VIIorasibWq8jjTR8oYNzI+JNmPHLt2pY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aiEuMyLFE2BX5DhMR98stwoqCmSOxUKjan2nekilbOoz+9b5qK92E9833VzN9ojXj
 KMdgeU+3XtXJHGLB2w9+waQSniDtc1F2JUjdFxUFw+XJDdUhJVyoCqE+JVmkAGmOjp
 iEWRPErsxAAyWyAmlqe1R3DNZ0weD+LIl63yueoo=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 y2038@lists.linaro.org, Sam Ravnborg <sam@ravnborg.org>,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Joe Perches <joe@perches.com>,
 Sean Paul <sean@poorly.run>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTA6MzI6NTJQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBUaGUgdGltZXNwZWMgc3RydWN0dXJlIGFuZCBhc3NvY2lhdGVkIGludGVyZmFjZXMg
YXJlIGRlcHJlY2F0ZWQgYW5kIHdpbGwKPiBiZSByZW1vdmVkIGluIHRoZSBmdXR1cmUgYmVjYXVz
ZSBvZiB0aGUgeTIwMzggb3ZlcmZsb3cuCj4gCj4gVGhlIHVzZSBvZiBrdGltZV90b190aW1lc3Bl
YygpIGluIHRpbWVvdXRfdG9famlmZmllcygpIGRvZXMgbm90Cj4gc3VmZmVyIGZyb20gdGhhdCBv
dmVyZmxvdywgYnV0IGlzIGVhc3kgdG8gYXZvaWQgYnkganVzdCBjb252ZXJ0aW5nCj4gdGhlIGt0
aW1lX3QgaW50byBqaWZmaWVzIGRpcmVjdGx5LgoKVGhpcyBzZWVtcyBnb29kIHRvIG1lLiB5MjAz
OCBjaGFuZ2VzIGFyZSB0aGUgYmVzdCBjaGFuZ2VzLgoKUmV2aWV3ZWQtYnk6IEpvcmRhbiBDcm91
c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5o
IHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oCj4gaW5kZXggNzE1NDdlNzU2ZTI5Li43NDBiZjdjNzBk
OGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaAo+IEBAIC00NTQsOCArNDU0LDcgQEAgc3RhdGlj
IGlubGluZSB1bnNpZ25lZCBsb25nIHRpbWVvdXRfdG9famlmZmllcyhjb25zdCBrdGltZV90ICp0
aW1lb3V0KQo+ICAJCXJlbWFpbmluZ19qaWZmaWVzID0gMDsKPiAgCX0gZWxzZSB7Cj4gIAkJa3Rp
bWVfdCByZW0gPSBrdGltZV9zdWIoKnRpbWVvdXQsIG5vdyk7Cj4gLQkJc3RydWN0IHRpbWVzcGVj
IHRzID0ga3RpbWVfdG9fdGltZXNwZWMocmVtKTsKPiAtCQlyZW1haW5pbmdfamlmZmllcyA9IHRp
bWVzcGVjX3RvX2ppZmZpZXMoJnRzKTsKPiArCQlyZW1haW5pbmdfamlmZmllcyA9IGt0aW1lX2Rp
dm5zKHJlbSwgTlNFQ19QRVJfU0VDIC8gSFopOwo+ICAJfQo+ICAKPiAgCXJldHVybiByZW1haW5p
bmdfamlmZmllczsKPiAtLSAKPiAyLjIwLjAKPiAKCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXgg
Rm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
