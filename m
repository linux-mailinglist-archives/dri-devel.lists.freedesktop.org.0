Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138AB1674
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 00:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1766EE50;
	Thu, 12 Sep 2019 22:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D582D6EE50;
 Thu, 12 Sep 2019 22:50:49 +0000 (UTC)
Received: from localhost (unknown [62.28.240.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99850206CD;
 Thu, 12 Sep 2019 22:50:47 +0000 (UTC)
Date: Thu, 12 Sep 2019 18:50:43 -0400
From: Sasha Levin <sashal@kernel.org>
To: Thomas Backlund <tmb@mageia.org>
Subject: Re: [PATCH AUTOSEL 5.2 13/23] drm/i915/userptr: Acquire the page
 lock around set_page_dirty()
Message-ID: <20190912225043.GE1546@sasha-vm>
References: <20190903162424.6877-1-sashal@kernel.org>
 <20190903162424.6877-13-sashal@kernel.org>
 <36993214-6ce7-260f-68c7-6fbb0630143f@mageia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36993214-6ce7-260f-68c7-6fbb0630143f@mageia.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568328649;
 bh=owY8tPeH3sQTQ1Of9qzuZcG6Wih+amHz+jK7tLWasOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8wu/A+5V8cKq3un2s3rZj0jka7IbZijhnVYw3T6vO1MqXQT/DT2joHrd/L8gGBby
 xojrTGXctns42qnURxBOc2fQN2i24Si8GDhDFl3MX0uBtR70O4Y42mb7TN8pDE5IGC
 OqW7SaJdbaekzEY8lo32m0pv3IyFhjqq8WQPNH5o=
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTE6NTE6MzNQTSArMDMwMCwgVGhvbWFzIEJhY2tsdW5k
IHdyb3RlOgo+RGVuIDAzLTA5LTIwMTkga2wuIDE5OjI0LCBza3JldiBTYXNoYSBMZXZpbjoKPj5G
cm9tOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4KPj5bIFVwc3Ry
ZWFtIGNvbW1pdCBhYTU2YTI5MmNlNjIzNzM0ZGRkMzBmNTJkNzNmNTI3ZDFmMzUyOWI1IF0KPj4K
Pj5zZXRfcGFnZV9kaXJ0eSBzYXlzOgo+Pgo+PglGb3IgcGFnZXMgd2l0aCBhIG1hcHBpbmcgdGhp
cyBzaG91bGQgYmUgZG9uZSB1bmRlciB0aGUgcGFnZSBsb2NrCj4+CWZvciB0aGUgYmVuZWZpdCBv
ZiBhc3luY2hyb25vdXMgbWVtb3J5IGVycm9ycyB3aG8gcHJlZmVyIGEKPj4JY29uc2lzdGVudCBk
aXJ0eSBzdGF0ZS4gVGhpcyBydWxlIGNhbiBiZSBicm9rZW4gaW4gc29tZSBzcGVjaWFsCj4+CWNh
c2VzLCBidXQgc2hvdWxkIGJlIGJldHRlciBub3QgdG8uCj4+Cj4+VW5kZXIgdGhvc2UgcnVsZXMs
IGl0IGlzIG9ubHkgc2FmZSBmb3IgdXMgdG8gdXNlIHRoZSBwbGFpbiBzZXRfcGFnZV9kaXJ0eQo+
PmNhbGxzIGZvciBzaG1lbWZzL2Fub255bW91cyBtZW1vcnkuIFVzZXJwdHIgbWF5IGJlIHVzZWQg
d2l0aCByZWFsCj4+bWFwcGluZ3MgYW5kIHNvIG5lZWRzIHRvIHVzZSB0aGUgbG9ja2VkIHZlcnNp
b24gKHNldF9wYWdlX2RpcnR5X2xvY2spLgo+Pgo+PkJ1Z3ppbGxhOiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwMzMxNwo+PkZpeGVzOiA1Y2M5ZWQ0YjlhN2Eg
KCJkcm0vaTkxNTogSW50cm9kdWNlIG1hcHBpbmcgb2YgdXNlciBwYWdlcyBpbnRvIHZpZGVvIG1l
bW9yeSAodXNlcnB0cikgaW9jdGwiKQo+PlJlZmVyZW5jZXM6IDZkY2M2OTNiYzU3ZiAoImV4dDQ6
IHdhcm4gd2hlbiBwYWdlIGlzIGRpcnRpZWQgd2l0aG91dCBidWZmZXJzIikKPj5TaWduZWQtb2Zm
LWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj5DYzogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPj5DYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+PlJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50
ZWwuY29tPgo+Pkxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9t
c2dpZC8yMDE5MDcwODE0MDMyNy4yNjgyNS0xLWNocmlzQGNocmlzLXdpbHNvbi5jby51awo+Pihj
aGVycnkgcGlja2VkIGZyb20gY29tbWl0IGNiNmQ3YzdkYzdmZjhjYWNlNjY2ZGRlYzY2MzM0MTE3
YTYwNjhjZTIpCj4+U2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4KPj5TaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Cj4+
LS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV91c2VycHRyLmMgfCAxMCArKysr
KysrKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Cj4+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3VzZXJwdHIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3VzZXJwdHIuYwo+PmluZGV4IDgwNzll
YTNhZjEwMzkuLmIxZmMxNWM3ZjU5OTcgMTAwNjQ0Cj4+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9nZW1fdXNlcnB0ci5jCj4+KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9n
ZW1fdXNlcnB0ci5jCj4+QEAgLTY3OCw3ICs2NzgsMTUgQEAgaTkxNV9nZW1fdXNlcnB0cl9wdXRf
cGFnZXMoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKPj4gIAlmb3JfZWFjaF9zZ3Rf
cGFnZShwYWdlLCBzZ3RfaXRlciwgcGFnZXMpIHsKPj4gIAkJaWYgKG9iai0+bW0uZGlydHkpCj4+
LQkJCXNldF9wYWdlX2RpcnR5KHBhZ2UpOwo+PisJCQkvKgo+PisJCQkgKiBBcyB0aGlzIG1heSBu
b3QgYmUgYW5vbnltb3VzIG1lbW9yeSAoZS5nLiBzaG1lbSkKPj4rCQkJICogYnV0IGV4aXN0IG9u
IGEgcmVhbCBtYXBwaW5nLCB3ZSBoYXZlIHRvIGxvY2sKPj4rCQkJICogdGhlIHBhZ2UgaW4gb3Jk
ZXIgdG8gZGlydHkgaXQgLS0gaG9sZGluZwo+PisJCQkgKiB0aGUgcGFnZSByZWZlcmVuY2UgaXMg
bm90IHN1ZmZpY2llbnQgdG8KPj4rCQkJICogcHJldmVudCB0aGUgaW5vZGUgZnJvbSBiZWluZyB0
cnVuY2F0ZWQuCj4+KwkJCSAqIFBsYXkgc2FmZSBhbmQgdGFrZSB0aGUgbG9jay4KPj4rCQkJICov
Cj4+KwkJCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7Cj4+ICAJCW1hcmtfcGFnZV9hY2Nlc3Nl
ZChwYWdlKTsKPj4gIAkJcHV0X3BhZ2UocGFnZSk7Cj4+Cj4KPgo+UGxlYXNlIGRyb3AgdGhpcyBv
bmUgZnJvbSBhbGwgNS4yIGFuZCA0LjE5IHN0YWJsZSBxdWV1ZXMKPgo+SXQgaGFzIG5vdyBiZWVu
IHJldmVydGVkIGluIExpbnVzIHRyZWU6Cj5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD01MDVhOGVjN2Ux
MWFlNTIzNmM0YTE1NGExZTI0ZWY0OWE4MzQ5NjAwCgpOb3cgZHJvcHBlZCwgdGhhbmsgeW91LgoK
LS0KVGhhbmtzLApTYXNoYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
