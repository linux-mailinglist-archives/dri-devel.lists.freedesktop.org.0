Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B75455E4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2934389804;
	Fri, 14 Jun 2019 07:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754D9892FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:27:37 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id s24so508113plr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 22:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gpmRrAai2U/u8FOxmf1mMEHtb8C5DvBiK/78zCxWoN8=;
 b=qaJzNKDjz3ej2orcVfhZ82LsJtQ208Wf5eE4lgkTyNvg2YnCFZWzCKpUd31TQDOw4T
 1H73Z/ly2rzP359A+fbUA3+eEinVepSptMXd9dW/c03V3cz/mqt839CNI2kHZTGB/8gs
 x7GJ95zL72GnJa0zE4/8969AlPNZwthPW7Z3N4wo1fukUEpawBo1Yc8EynYmr1bmxqp0
 RLaF95nRzrhP/JB1UyxoFwECcbMQTA6VELu6iuujLfn9u2C/EVgJ81huyXdTu1M+dKsW
 133wCor1XxXX1GeUqxW31iU72eEBnQp8RUEQqKj1tIJi73os9RYCf1nzv+a6vPBxm1E8
 kceQ==
X-Gm-Message-State: APjAAAVx5RfCscMth0LGibqR8fnXiguqTV7nBvmABg2dD93fsujWgZUA
 d8VJdRpDnW+MTCVAFcyuhZsRZw==
X-Google-Smtp-Source: APXvYqyzY+ZcDwS257e/DcRosvfsCUeYIQheDqeTIxEJrU3JUxKmTdM1JbGHllR8eOi2yEYOZ8KXFQ==
X-Received: by 2002:a17:902:7c90:: with SMTP id
 y16mr1583679pll.238.1560490056827; 
 Thu, 13 Jun 2019 22:27:36 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id f88sm2289322pjg.5.2019.06.13.22.27.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 22:27:34 -0700 (PDT)
Date: Fri, 14 Jun 2019 10:57:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
 vincent.guittot@linaro.org, mturquette@baylibre.com
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
Message-ID: <20190614052732.4w6vvwwich2h4cgu@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
 <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
 <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gpmRrAai2U/u8FOxmf1mMEHtb8C5DvBiK/78zCxWoN8=;
 b=FdtBwKkGrvc8PbkOh7IgHRgb+bO406Z3RgusnYcYmsIkqRO8qW5ggLC/SPBKMfBsK2
 PesYYhBmzjDv4oFUeFgNGNgrVn9OhG6mawN1KgvA5PRLbqEZ4r6b2BDd4mu+7LMJKEoC
 v3zMw08i6e4xTK71w47QkprUWXzQQe3AMsDDNfZ10xd3gFDUKOzG9z8e+mmrzznd3gME
 p8R3KCVWTAOEb0hwDzrOw0tpa2pEI7n7eVqcO+zZvOtCqlSoIh4M/i74FRgLRGoRwaMG
 M8uzUA+O3fsjv2HRPPyu8ZZVN8th2KR+5YcNfF+x7GMwHxgW03ayzewUvHxZTgiEOzWR
 b1GA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMtMDYtMTksIDE1OjI0LCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gSSBhbSBjb25mdXNlZCBh
cyBoZWxsIG9uIHdoYXQgd2Ugc2hvdWxkIGJlIGRvaW5nIGFuZCB3aGF0IHdlIGFyZSBkb2luZwo+
IHJpZ2h0IG5vdy4gQW5kIGlmIHdlIHNob3VsZCBkbyBiZXR0ZXIuCj4gCj4gTGV0IG1lIGV4cGxh
aW4gd2l0aCBhbiBleGFtcGxlLgo+IAo+IC0gVGhlIGNsb2NrIHByb3ZpZGVyIHN1cHBvcnRzIGZv
bGxvd2luZyBmcmVxdWVuY2llczogNTAwLCA2MDAsIDcwMCwKPiAgIDgwMCwgOTAwLCAxMDAwIE1I
ei4KPiAKPiAtIFRoZSBPUFAgdGFibGUgY29udGFpbnMvc3VwcG9ydHMgb25seSBhIHN1YnNldDog
NTAwLCA3MDAsIDEwMDAgTUh6Lgo+IAo+IE5vdywgdGhlIHJlcXVlc3QgdG8gY2hhbmdlIHRoZSBm
cmVxdWVuY3kgc3RhcnRzIGZyb20gY3B1ZnJlcQo+IGdvdmVybm9ycywgbGlrZSBzY2hlZHV0aWwg
d2hlbiB0aGV5IGNhbGxzOgo+IAo+IF9fY3B1ZnJlcV9kcml2ZXJfdGFyZ2V0KHBvbGljeSwgNTk5
IE1IeiwgQ1BVRlJFUV9SRUxBVElPTl9MKTsKPiAKPiBDUFVGUkVRX1JFTEFUSU9OX0wgbWVhbnM6
IGxvd2VzdCBmcmVxdWVuY3kgYXQgb3IgYWJvdmUgdGFyZ2V0LiBBbmQgc28KPiBJIHdvdWxkIGV4
cGVjdCB0aGUgZnJlcXVlbmN5IHRvIGdldCBzZXQgdG8gNjAwTUh6IChpZiB3ZSBsb29rIGF0IGNs
b2NrCj4gZHJpdmVyKSBvciA3MDBNSHogKGlmIHdlIGxvb2sgYXQgT1BQIHRhYmxlKS4gSSB0aGlu
ayB3ZSBzaG91bGQgZGVjaWRlCj4gdGhpcyB0aGluZyBmcm9tIHRoZSBPUFAgdGFibGUgb25seSBh
cyB0aGF0J3Mgd2hhdCB0aGUgcGxhdGZvcm0gZ3V5cwo+IHdhbnQgdXMgdG8gdXNlLiBTbywgd2Ug
c2hvdWxkIGVuZCB1cCB3aXRoIDcwMCBNSHouCj4gCj4gVGhlbiB3ZSBsYW5kIGludG8gZGV2X3Bt
X29wcF9zZXRfcmF0ZSgpLCB3aGljaCBkb2VzIHRoaXMgKHdoaWNoIGlzCj4gY29kZSBjb3BpZWQg
ZnJvbSBlYXJsaWVyIHZlcnNpb24gb2YgY3B1ZnJlcS1kdCBkcml2ZXIpOgo+IAo+IC0gY2xrX3Jv
dW5kX3JhdGUoY2xrLCA1OTkgTUh6KS4KPiAKPiAgIGNsa19yb3VuZF9yYXRlKCkgcmV0dXJucyB0
aGUgaGlnaGVzdCBmcmVxdWVuY3kgbG93ZXIgdGhhbiB0YXJnZXQuIFNvCj4gICBpdCBtdXN0IHJl
dHVybiA1MDAgTUh6IChJIGhhdmVuJ3QgdGVzdGVkIHRoaXMgeWV0LCBhbGwgdGhlb3JldGljYWwp
Lgo+IAo+IC0gX2ZpbmRfZnJlcV9jZWlsKG9wcF90YWJsZSwgNTAwIE1IeikuCj4gCj4gICBUaGlz
IHdvcmtzIGxpa2UgQ1BVRlJFUV9SRUxBVElPTl9MLCBzbyB3ZSBmaW5kIGxvd2VzdCBmcmVxdWVu
Y3kgPj0KPiAgIHRhcmdldCBmcmVxLiBBbmQgc28gd2Ugc2hvdWxkIGdldDogNTAwIE1IeiBpdHNl
bGYgYXMgT1BQIHRhYmxlIGhhcwo+ICAgaXQuCj4gCj4gLSBjbGtfc2V0X3JhdGUoY2xrLCA1MDAg
TUh6KS4KPiAKPiAgIFRoaXMgbXVzdCBiZSBkb2luZyByb3VuZC1yYXRlIGFnYWluLCBidXQgSSB0
aGluayB3ZSB3aWxsIHNldHRsZSB3aXRoCj4gICA1MDAgTUh6IGV2ZW50dWFsbHkuCj4gCj4gCj4g
Tm93IHRoZSBxdWVzdGlvbm5haXJlOgo+IAo+IC0gSXMgdGhpcyB3aG9sZSBleGVyY2lzZSBjb3Jy
ZWN0ID8KCk5vLCBJIG1pc3NlZCB0aGUgY2FsbCB0byBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZV90
YXJnZXQoKSBpbgpfX2NwdWZyZXFfZHJpdmVyX3RhcmdldCgpIHdoaWNoIGZpbmRzIHRoZSBleGFj
dCBmcmVxdWVuY3kgZnJvbSBjcHVmcmVxIHRhYmxlCih3aGljaCB3YXMgY3JlYXRlZCB1c2luZyBv
cHAgdGFibGUpIGFuZCBzbyB3ZSBuZXZlciBzY3JldyB1cCBoZXJlLiBTb3JyeSBmb3IKY29uZnVz
aW5nIGV2ZXJ5b25lIG9uIHRoaXMgOigKCj4gTm93IGxldHMgbW92ZSB0byB0aGlzIHBhdGNoLCB3
aGljaCBtYWtlcyBpdCBtb3JlIGNvbmZ1c2luZy4KPiAKPiBUaGUgT1BQIHRhYmxlcyBmb3IgQ1BV
cyBhbmQgR1BVcyBzaG91bGQgYWxyZWFkeSBiZSBzb21ld2hhdCBsaWtlIGZtYXgKPiB0YWJsZXMg
Zm9yIHBhcnRpY3VsYXIgdm9sdGFnZSB2YWx1ZXMgYW5kIHRoYXQncyB3aHkgYm90aCBjcHVmcmVx
IGFuZAo+IE9QUCBjb3JlIHRyeSB0byBmaW5kIGEgZnJlcXVlbmN5IGhpZ2hlciB0aGFuIHRhcmdl
dCBzbyB3ZSBjaG9vc2UgdGhlCj4gbW9zdCBvcHRpbXVtIG9uZSBwb3dlci1lZmZpY2llbmN5IHdp
c2UuCj4gCj4gRm9yIGNhc2VzIHdoZXJlIHRoZSBPUFAgdGFibGUgaXMgb25seSBhIHN1YnNldCBv
ZiB0aGUgY2xrLXByb3ZpZGVycwo+IHRhYmxlIChhbG1vc3QgYWx3YXlzKSwgaWYgd2UgbGV0IHRo
ZSBjbG9jayBwcm92aWRlciB0byBmaW5kIHRoZQo+IG5lYXJlc3QgZnJlcXVlbmN5ICh3aGljaCBp
cyBsb3dlcikgd2Ugd2lsbCBydW4gdGhlIENQVS9HUFUgYXQgYQo+IG5vdC1zby1vcHRpbWFsIGZy
ZXF1ZW5jeS4gaS5lLiBpZiA1MDAsIDYwMCwgNzAwIE1IeiBhbGwgbmVlZCB2b2x0YWdlCj4gdG8g
YmUgMS4yIFYsIHdlIHNob3VsZCBiZSBydW5uaW5nIGF0IDcwMCBhbHdheXMsIHdoaWxlIHdlIG1h
eSBlbmQgdXAKPiBydW5uaW5nIGF0IDUwMCBNSHouCgpUaGlzIHdvbid0IGhhcHBlbiBmb3IgQ1BV
cyBiZWNhdXNlIG9mIHRoZSByZWFzb24gSSBleHBsYWluZWQgZWFybGllci4gY3B1ZnJlcQpjb3Jl
IGRvZXMgdGhlIHJvdW5kaW5nIGJlZm9yZSBjYWxsaW5nIGRldl9wbV9vcHBfc2V0X3JhdGUoKS4g
QW5kIG5vIG90aGVyCmRldmljZXMgdXNlIGRldl9wbV9vcHBfc2V0X3JhdGUoKSByaWdodCBub3cg
YXBhcnQgZnJvbSBDUFVzLCBzbyB3ZSBhcmUgbm90IGdvaW5nCnRvIGJyZWFrIGFueXRoaW5nLgoK
PiBUaGlzIGtpbmQgb2YgYmVoYXZpb3IgKGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCkgaXMgaW1w
b3J0YW50IGZvcgo+IG90aGVyIGRldmljZXMgd2hpY2ggd2FudCB0byBydW4gYXQgdGhlIG5lYXJl
c3QgZnJlcXVlbmN5IHRvIHRhcmdldAo+IG9uZSwgYnV0IG5vdCBmb3IgQ1BVcy9HUFVzLiBTbywg
d2UgbmVlZCB0byB0YWcgdGhlc2UgSU8gZGV2aWNlcwo+IHNlcGFyYXRlbHksIG1heWJlIGZyb20g
RFQgPyBTbyB3ZSBzZWxlY3QgdGhlIGNsb3Nlc3QgbWF0Y2ggaW5zdGVhZCBvZgo+IG1vc3Qgb3B0
aW1hbCBvbmUuCgpIbW0sIHNvIHRoaXMgcGF0Y2ggd29uJ3QgYnJlYWsgYW55dGhpbmcgYW5kIEkg
YW0gaW5jbGluZWQgdG8gYXBwbHkgaXQgYWdhaW4gOikKCkRvZXMgYW55b25lIHNlZSBhbnkgb3Ro
ZXIgaXNzdWVzIHdpdGggaXQsIHdoaWNoIEkgbWlnaHQgYmUgbWlzc2luZyA/CgotLSAKdmlyZXNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
