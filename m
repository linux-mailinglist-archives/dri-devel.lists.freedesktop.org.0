Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8447F433DE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B3989760;
	Thu, 13 Jun 2019 07:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F9889760
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:51:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB62E20851;
 Thu, 13 Jun 2019 07:51:14 +0000 (UTC)
Date: Thu, 13 Jun 2019 09:51:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v5] drm/vc4: fix fb references in async update
Message-ID: <20190613075112.GE19685@kroah.com>
References: <156007492924468@kroah.com>
 <20190610131859.7616-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610131859.7616-1-helen.koike@collabora.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560412275;
 bh=07bkpKEzMR5J7jcewXkizrrcYdEWtLPi1MRpGfleZ6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zxrTPABW1S+WfcBg2HM87A7hR+EswsuArXO1S7J5FhTJdewwfg7Zt19tGJPhUmevv
 /TS4VgSYlBqPR+jQo5XHwtByyu2WiITcz1hUekXHyNudmSAM7LExXbfUFRikeztr2j
 9tb/SIKDVIZdozTkJewVDLE/wCdQFKAa+7xoLtp8=
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTA6MTg6NTlBTSAtMDMwMCwgSGVsZW4gS29pa2Ugd3Jv
dGU6Cj4gY29tbWl0IGMxNmI4NTU1OWRjZmI1YTM0OGNjMDg1YTdiNGM3NWVkNDliMDVlMmMgdXBz
dHJlYW0uCj4gCj4gQXN5bmMgdXBkYXRlIGNhbGxiYWNrcyBhcmUgZXhwZWN0ZWQgdG8gc2V0IHRo
ZSBvbGRfZmIgaW4gdGhlIG5ld19zdGF0ZQo+IHNvIHByZXBhcmUvY2xlYW51cCBmcmFtZWJ1ZmZl
cnMgYXJlIGJhbGFuY2VkLgo+IAo+IENhbGxpbmcgZHJtX2F0b21pY19zZXRfZmJfZm9yX3BsYW5l
KCkgKHdoaWNoIGdldHMgYSByZWZlcmVuY2Ugb2YgdGhlIG5ldwo+IGZiIGFuZCBwdXQgdGhlIG9s
ZCBmYikgaXMgbm90IHJlcXVpcmVkLCBhcyBpdCdzIHRha2VuIGNhcmUgYnkKPiBkcm1fbW9kZV9j
dXJzb3JfdW5pdmVyc2FsKCkgd2hlbiBjYWxsaW5nIGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9w
bGFuZSgpLgo+IAo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NC4xOSsKPiBGaXhl
czogNTM5YzMyMGJmYTk3ICgiZHJtL3ZjNDogdXBkYXRlIGN1cnNvcnMgYXN5bmNocm9ub3VzbHkg
dGhyb3VnaCBhdG9taWMiKQo+IFN1Z2dlc3RlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIZWxlbiBLb2lrZSA8aGVs
ZW4ua29pa2VAY29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IExpbms6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDYwMzE2NTYxMC4yNDYxNC01
LWhlbGVuLmtvaWtlQGNvbGxhYm9yYS5jb20KPiAtLS0KPiAKPiBIaSwKPiAKPiBUaGlzIHBhdGNo
IGZhaWxlZCB0byBhcHBseSBvbiBrZXJuZWwgc3RhYmxlIHY0LjE5LCBJJ20gcmUtc2VuZGluZyBp
dAo+IGZpeGluZyB0aGUgY29uZmxpY3QuCgpOb3cgYXBwbGllZCwgdGhhbmtzLgoKZ3JlZyBrLWgK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
