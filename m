Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9082624282
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 23:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C98789247;
	Mon, 20 May 2019 21:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDEF8921C;
 Mon, 20 May 2019 21:07:37 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id CC64B60E3E; Mon, 20 May 2019 21:07:36 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A6EF6087F;
 Mon, 20 May 2019 21:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A6EF6087F
Date: Mon, 20 May 2019 15:07:32 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: [PATCH 1/4] drm/msm: Fix improper uses of
 smp_mb__{before,after}_atomic()
Message-ID: <20190520210732.GF24137@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Andrea Parri <andrea.parri@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <1558373038-5611-1-git-send-email-andrea.parri@amarulasolutions.com>
 <1558373038-5611-2-git-send-email-andrea.parri@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558373038-5611-2-git-send-email-andrea.parri@amarulasolutions.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558386456;
 bh=sWncJZuhv8jI+fIBFRSxi31uAvCtEl1i4p1lxELRFRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CS4ZaWgkuC62AEkndP5Cg0vReacRxuyKO8rizDePHLexECksul8TzjxKZl70id2JA
 TWNW6HYJXlJZ2uL3GF9/Bdred/l2RR+tsfxm//zfGnRyp0GMZF1WSbm3Kn0S8OQjra
 0vDPjNdSQQfnbnYitfEaHfqHmWJHYjltVTJdaVIk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558386455;
 bh=sWncJZuhv8jI+fIBFRSxi31uAvCtEl1i4p1lxELRFRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofhwcs4UV5Eiw/8Yh2sbqC5v5RszTv9UDRERtPCyHv57GGfii7jR7FIpsvYfSI3ix
 7jVVXO5LMVHUH3yFV1a9VAI0JM6M2qONikDtYrsbXg6mGqh2iLCBpBkFpu4r/iCpgb
 /vwVtw1JbtNGZAEDezrF4QMBKcOmKSbWzsZDeUyY=
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDc6MjM6NTVQTSArMDIwMCwgQW5kcmVhIFBhcnJpIHdy
b3RlOgo+IFRoZXNlIGJhcnJpZXJzIG9ubHkgYXBwbHkgdG8gdGhlIHJlYWQtbW9kaWZ5LXdyaXRl
IG9wZXJhdGlvbnM7IGluCj4gcGFydGljdWxhciwgdGhleSBkbyBub3QgYXBwbHkgdG8gdGhlIGF0
b21pY19zZXQoKSBwcmltaXRpdmUuCj4gCj4gUmVwbGFjZSB0aGUgYmFycmllcnMgd2l0aCBzbXBf
bWIoKXMuCj4gCj4gRml4ZXM6IGIxZmMyODM5ZDJmOTIgKCJkcm0vbXNtOiBJbXBsZW1lbnQgcHJl
ZW1wdGlvbiBmb3IgQTVYWCB0YXJnZXRzIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IFJlcG9ydGVkLWJ5OiAiUGF1bCBFLiBNY0tlbm5leSIgPHBhdWxtY2tAbGludXguaWJtLmNvbT4K
PiBSZXBvcnRlZC1ieTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJlYSBQYXJyaSA8YW5kcmVhLnBhcnJpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1
bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogSm9yZGFuIENyb3Vz
ZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBmcmVlZHJl
bm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6ICJQYXVsIEUuIE1jS2VubmV5IiA8cGF1bG1j
a0BsaW51eC5pYm0uY29tPgo+IENjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5v
cmc+CgpJJ2xsIGdvIGFoZWFkIGFuZCBhY2sgdGhpcyAtIEknbSBub3Qgc3VwZXIgY2x1ZWQgaW4g
b24gYXRvbWljIGJhcnJpZXJzLCBidXQgdGhpcwpzZWVtcyB0byBiZSBpbiB0aGUgc3Bpcml0IG9m
IHdoYXQgd2UgYXJlIHRyeWluZyB0byBkbyB0byBwcm90ZWN0IHRoZSBhdG9taWMKdmFsdWUuIFJv
YiBjYW4gZGlzYWdyZWUsIG9mIGNvdXJzZS4KCkFja2VkLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3Jv
dXNlQGNvZGVhdXJvcmEub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTV4eF9wcmVlbXB0LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTV4eF9wcmVlbXB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X3By
ZWVtcHQuYwo+IGluZGV4IDNkNjIzMTBhNTM1ZmIuLmVlMDgyMGVlMGM2NjQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X3ByZWVtcHQuYwo+IEBAIC0zOSwxMCArMzksMTAg
QEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9wcmVlbXB0X3N0YXRlKHN0cnVjdCBhNXh4X2dwdSAq
Z3B1LAo+ICAJICogcHJlZW1wdGlvbiBvciBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgc28gYmFy
cmllcnMgYXJlIG5lZWRlZAo+ICAJICogYmVmb3JlLi4uCj4gIAkgKi8KPiAtCXNtcF9tYl9fYmVm
b3JlX2F0b21pYygpOwo+ICsJc21wX21iKCk7Cj4gIAlhdG9taWNfc2V0KCZncHUtPnByZWVtcHRf
c3RhdGUsIG5ldyk7Cj4gIAkvKiAuLi4gYW5kIGFmdGVyKi8KPiAtCXNtcF9tYl9fYWZ0ZXJfYXRv
bWljKCk7Cj4gKwlzbXBfbWIoKTsKPiAgfQo+ICAKPiAgLyogV3JpdGUgdGhlIG1vc3QgcmVjZW50
IHdwdHIgZm9yIHRoZSBnaXZlbiByaW5nIGludG8gdGhlIGhhcmR3YXJlICovCj4gLS0gCj4gMi43
LjQKPiAKCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1i
ZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZl
IFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
