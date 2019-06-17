Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB3478ED
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 06:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970089157;
	Mon, 17 Jun 2019 04:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD56E89157
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 04:07:07 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id C0C2560735; Mon, 17 Jun 2019 04:07:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.131.117.43]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rnayak@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 89D7360779;
 Mon, 17 Jun 2019 04:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89D7360779
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
To: Viresh Kumar <viresh.kumar@linaro.org>, swboyd@chromium.org,
 vincent.guittot@linaro.org, mturquette@baylibre.com
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
 <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
 <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
 <20190614052732.4w6vvwwich2h4cgu@vireshk-i7>
 <20190617035058.veo7uwqjrpa6kykt@vireshk-i7>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <a912c8b2-080d-7ab7-670b-b687ec3a2c92@codeaurora.org>
Date: Mon, 17 Jun 2019 09:37:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617035058.veo7uwqjrpa6kykt@vireshk-i7>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560744427;
 bh=fnXV3qMdXMwHiyNp+B4dIgHawcwKCfrjYzO+/aW82ms=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=N5zPEPhqz4s76LUp4qXdOb5ZhO7paU+yiHqIfbsXW1WLdYhdMbuKoLkv0wUwMKQXy
 lmHQsEo0utTl1a6oRB6bBUelYXlw4Zl0Sga05zYCKET/ouXcZwQtL+H/LPH9Sv7Opq
 1cwE2vnWm4pHKg8DVSMss1ueRo3N7pPFDtivHDe0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560744426;
 bh=fnXV3qMdXMwHiyNp+B4dIgHawcwKCfrjYzO+/aW82ms=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=k4ofmJu8qI7RpsRw+XS/AbEB5+R2R7P9AchQpn/sccKrjcFY2l5PYEmLLiTG4Hy9V
 XlIODHSfkxOoIXZv0OUmwI/pkEgP3TOKjBPQpX4YugWF5bd17aNlT04aJsIYCy6hl3
 8OqHQ7sdht6t3V+/X9QjXm3FI4HtAvc86U7spKtE=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=rnayak@codeaurora.org
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, linux-scsi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA2LzE3LzIwMTkgOToyMCBBTSwgVmlyZXNoIEt1bWFyIHdyb3RlOgo+IE9uIDE0LTA2LTE5
LCAxMDo1NywgVmlyZXNoIEt1bWFyIHdyb3RlOgo+PiBIbW0sIHNvIHRoaXMgcGF0Y2ggd29uJ3Qg
YnJlYWsgYW55dGhpbmcgYW5kIEkgYW0gaW5jbGluZWQgdG8gYXBwbHkgaXQgYWdhaW4gOikKPj4K
Pj4gRG9lcyBhbnlvbmUgc2VlIGFueSBvdGhlciBpc3N1ZXMgd2l0aCBpdCwgd2hpY2ggSSBtaWdo
dCBiZSBtaXNzaW5nID8KPiAKPiBJIGhhdmUgdXBkYXRlZCB0aGUgY29tbWl0IGxvZyBhIGJpdCBt
b3JlIHRvIGNsYXJpZnkgb24gdGhpbmdzLCBwbGVhc2UgbGV0IG1lCj4ga25vdyBpZiBpdCBsb29r
cyBva2F5Lgo+IAo+ICAgICAgb3BwOiBEb24ndCBvdmVyd3JpdGUgcm91bmRlZCBjbGsgcmF0ZQo+
ICAgICAgCj4gICAgICBUaGUgT1BQIHRhYmxlIG5vcm1hbGx5IGNvbnRhaW5zICdmbWF4JyB2YWx1
ZXMgY29ycmVzcG9uZGluZyB0byB0aGUKPiAgICAgIHZvbHRhZ2Ugb3IgcGVyZm9ybWFuY2UgbGV2
ZWxzIG9mIGVhY2ggT1BQLCBidXQgd2UgZG9uJ3QgbmVjZXNzYXJpbHkgd2FudAo+ICAgICAgYWxs
IHRoZSBkZXZpY2VzIHRvIHJ1biBhdCBmbWF4IGFsbCB0aGUgdGltZS4gUnVubmluZyBhdCBmbWF4
IG1ha2VzIHNlbnNlCj4gICAgICBmb3IgZGV2aWNlcyBsaWtlIENQVS9HUFUsIHdoaWNoIGhhdmUg
YSBmaW5pdGUgYW1vdW50IG9mIHdvcmsgdG8gZG8gYW5kCj4gICAgICBzaW5jZSBhIHNwZWNpZmlj
IGFtb3VudCBvZiBlbmVyZ3kgaXMgY29uc3VtZWQgYXQgYW4gT1BQLCBpdHMgYmV0dGVyIHRvCj4g
ICAgICBydW4gYXQgdGhlIGhpZ2hlc3QgcG9zc2libGUgZnJlcXVlbmN5IGZvciB0aGF0IHZvbHRh
Z2UgdmFsdWUuCj4gICAgICAKPiAgICAgIE9uIHRoZSBvdGhlciBoYW5kLCB3ZSBoYXZlIElPIGRl
dmljZXMgd2hpY2ggbmVlZCB0byBydW4gYXQgc3BlY2lmaWMKPiAgICAgIGZyZXF1ZW5jaWVzIG9u
bHkgZm9yIHRoZWlyIHByb3BlciBmdW5jdGlvbmluZywgaW5zdGVhZCBvZiBtYXhpbXVtCj4gICAg
ICBwb3NzaWJsZSBmcmVxdWVuY3kuCj4gICAgICAKPiAgICAgIFRoZSBPUFAgY29yZSBjdXJyZW50
bHkgcm91bmR1cCB0byB0aGUgbmV4dCBwb3NzaWJsZSBPUFAgZm9yIGEgZnJlcXVlbmN5Cj4gICAg
ICBhbmQgc2VsZWN0IHRoZSBmbWF4IHZhbHVlLiBUbyBzdXBwb3J0IHRoZSBJTyBkZXZpY2VzIGJ5
IHRoZSBPUFAgY29yZSwKPiAgICAgIGxldHMgZG8gdGhlIHJvdW5kdXAgdG8gZmV0Y2ggdGhlIHZv
bHRhZ2Ugb3IgcGVyZm9ybWFuY2Ugc3RhdGUgdmFsdWVzLAo+ICAgICAgYnV0IG5vdCB1c2UgdGhl
IE9QUCBmcmVxdWVuY3kgdmFsdWUuIFJhdGhlciB1c2UgdGhlIHZhbHVlIHJldHVybmVkIGJ5Cj4g
ICAgICBjbGtfcm91bmRfcmF0ZSgpLgo+ICAgICAgCj4gICAgICBUaGUgY3VycmVudCB1c2VyLCBj
cHVmcmVxLCBvZiBkZXZfcG1fb3BwX3NldF9yYXRlKCkgYWxyZWFkeSBkb2VzIHRoZQo+ICAgICAg
cm91bmRpbmcgdG8gdGhlIG5leHQgT1BQIGJlZm9yZSBjYWxsaW5nIHRoaXMgcm91dGluZSBhbmQg
aXQgd29uJ3QKPiAgICAgIGhhdmUgYW55IHNpZGUgYWZmZWN0cyBiZWNhdXNlIG9mIHRoaXMgY2hh
bmdlLgoKTG9va3MgZ29vZCB0byBtZS4gU2hvdWxkIHRoaXMgYWxzbyBiZSBkb2N1bWVudGVkIHNv
bWVwbGFjZSB0aGF0IGRldl9wbV9vcHBfc2V0X3JhdGUoKQp3b3VsZCBub3QgYmUgYWJsZSB0byBk
aXN0aW5ndWlzaCBiZXR3ZWVuIGl0cyB1c2VycyB0cnlpbmcgdG8gc2NhbGUgQ1BVL0dQVSdzIHZz
IElPCmRldmljZXMsIHNvIGl0cyB0aGUgY2FsbGVycyByZXNwb25zaWJpbGl0eSB0byByb3VuZCBp
dCBhY2NvcmRpbmdseSBiZWZvcmUgY2FsbGluZyB0aGUKQVBJPwoKPiAgICAgIAo+ICAgICAgU2ln
bmVkLW9mZi1ieTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgo+ICAgICAgU2ln
bmVkLW9mZi1ieTogUmFqZW5kcmEgTmF5YWsgPHJuYXlha0Bjb2RlYXVyb3JhLm9yZz4KPiAgICAg
IFsgVmlyZXNoOiBNYXNzYWdlZCBjaGFuZ2Vsb2cgYW5kIHVzZSB0ZW1wX29wcCB2YXJpYWJsZSBp
bnN0ZWFkIF0KPiAgICAgIFNpZ25lZC1vZmYtYnk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFy
QGxpbmFyby5vcmc+Cj4gCj4gCgotLSAKUVVBTENPTU0gSU5ESUEsIG9uIGJlaGFsZiBvZiBRdWFs
Y29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlcgpvZiBDb2RlIEF1cm9yYSBG
b3J1bSwgaG9zdGVkIGJ5IFRoZSBMaW51eCBGb3VuZGF0aW9uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
