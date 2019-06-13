Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDA455A0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D3B893D0;
	Fri, 14 Jun 2019 07:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088608982E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:54:23 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i189so11501605pfg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 02:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hjw/27BiWyRsokNbznNmO94DEfRuOPMKzlIXgRI+H5k=;
 b=Eietid/ls7pZlcmOr2ZUkBKDP1QXqvgvwsDvjBnsi5IHE5tOSJqveiHtBULuesr61h
 SGmoB0tKuvbiyEzDJImTUGs4364jdY17dHSIJcucHPggw2BPExJotxgKepCwxQKUHeFn
 fCww4yEbyJYKVdWp0AVi9wjZTPf7nfKxObK11FSnzfzs61nlz3PXASy+2nVisFZ052qB
 9ZcZC2if0mZK+euP5y6+3JLnlY82IYHfF9QKwJV84Z6nQ6C1kAm37OXp7FoBRzZGioiC
 m2CPRONMpb3ZMxdkm0TLBvprlOQSviXUH84xOwauEfiZxYuYBbDV5cXXzI89kyPMUZKW
 3J6g==
X-Gm-Message-State: APjAAAX7kOc2Y0KC5NhCy1qVCuCANtPOg6nUQQK/Bfx2WUvAr9Ui+Uki
 yy4mit+dOhZJEB5DkmW/N9MIQw==
X-Google-Smtp-Source: APXvYqyRW+yesk5LbA1w8QMeFbdIKEhSaWce+1/TtkgKa+kMImAbjDmOqy9rTc27doz8KV05Ir4xXQ==
X-Received: by 2002:a17:90a:3225:: with SMTP id
 k34mr4393711pjb.31.1560419663353; 
 Thu, 13 Jun 2019 02:54:23 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id u97sm3965453pjb.26.2019.06.13.02.54.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 02:54:21 -0700 (PDT)
Date: Thu, 13 Jun 2019 15:24:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
 vincent.guittot@linaro.org, mturquette@baylibre.com
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
Message-ID: <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
 <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hjw/27BiWyRsokNbznNmO94DEfRuOPMKzlIXgRI+H5k=;
 b=WUhQgDpav09wCsvAut2BWW+R7sS7LtghDHpfI6v0bUGLZjzR+QUQRAULtuQ+dBOAS+
 5B9NTVliKzqPVgFAQafRgRYnR51hBF4bFPqnp+SsVxb/s1dw527gW4ZdAD71YLZdwcQ0
 kP0XOt6g2JH7P49I+eaVhp4nGWzzZa4kZC41fTHL4Dh4FeCF8y1xkbVGRNCVSFpZMYT1
 seXbQTfhtWg/Y2ZFYMhZdfSkXlmqGNBTcy0L6z6YZU0v3YRzsY93irO3uxYz27fLorQY
 xCaAv7PNE+Wc9gb1a0ZIBFgBoTFuvbNfAi4+vMKRTRmWIgoX9FjCYaWw5pHArsOCxWin
 Y5wA==
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

T24gMTItMDYtMTksIDEzOjU1LCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gT2theSwgSSBoYXZlIGFw
cGxpZWQgdGhpcyBwYXRjaCAoYWxvbmUpIHRvIHRoZSBPUFAgdHJlZSB3aXRoIG1pbm9yCj4gbW9k
aWZpY2F0aW9ucyBpbiBjb21taXQgbG9nIGFuZCBkaWZmLgoKQW5kIEkgaGF2ZSByZW1vdmVkIGl0
IG5vdyA6KQoKSSBhbSBjb25mdXNlZCBhcyBoZWxsIG9uIHdoYXQgd2Ugc2hvdWxkIGJlIGRvaW5n
IGFuZCB3aGF0IHdlIGFyZSBkb2luZwpyaWdodCBub3cuIEFuZCBpZiB3ZSBzaG91bGQgZG8gYmV0
dGVyLgoKTGV0IG1lIGV4cGxhaW4gd2l0aCBhbiBleGFtcGxlLgoKLSBUaGUgY2xvY2sgcHJvdmlk
ZXIgc3VwcG9ydHMgZm9sbG93aW5nIGZyZXF1ZW5jaWVzOiA1MDAsIDYwMCwgNzAwLAogIDgwMCwg
OTAwLCAxMDAwIE1Iei4KCi0gVGhlIE9QUCB0YWJsZSBjb250YWlucy9zdXBwb3J0cyBvbmx5IGEg
c3Vic2V0OiA1MDAsIDcwMCwgMTAwMCBNSHouCgpOb3csIHRoZSByZXF1ZXN0IHRvIGNoYW5nZSB0
aGUgZnJlcXVlbmN5IHN0YXJ0cyBmcm9tIGNwdWZyZXEKZ292ZXJub3JzLCBsaWtlIHNjaGVkdXRp
bCB3aGVuIHRoZXkgY2FsbHM6CgpfX2NwdWZyZXFfZHJpdmVyX3RhcmdldChwb2xpY3ksIDU5OSBN
SHosIENQVUZSRVFfUkVMQVRJT05fTCk7CgpDUFVGUkVRX1JFTEFUSU9OX0wgbWVhbnM6IGxvd2Vz
dCBmcmVxdWVuY3kgYXQgb3IgYWJvdmUgdGFyZ2V0LiBBbmQgc28KSSB3b3VsZCBleHBlY3QgdGhl
IGZyZXF1ZW5jeSB0byBnZXQgc2V0IHRvIDYwME1IeiAoaWYgd2UgbG9vayBhdCBjbG9jawpkcml2
ZXIpIG9yIDcwME1IeiAoaWYgd2UgbG9vayBhdCBPUFAgdGFibGUpLiBJIHRoaW5rIHdlIHNob3Vs
ZCBkZWNpZGUKdGhpcyB0aGluZyBmcm9tIHRoZSBPUFAgdGFibGUgb25seSBhcyB0aGF0J3Mgd2hh
dCB0aGUgcGxhdGZvcm0gZ3V5cwp3YW50IHVzIHRvIHVzZS4gU28sIHdlIHNob3VsZCBlbmQgdXAg
d2l0aCA3MDAgTUh6LgoKVGhlbiB3ZSBsYW5kIGludG8gZGV2X3BtX29wcF9zZXRfcmF0ZSgpLCB3
aGljaCBkb2VzIHRoaXMgKHdoaWNoIGlzCmNvZGUgY29waWVkIGZyb20gZWFybGllciB2ZXJzaW9u
IG9mIGNwdWZyZXEtZHQgZHJpdmVyKToKCi0gY2xrX3JvdW5kX3JhdGUoY2xrLCA1OTkgTUh6KS4K
CiAgY2xrX3JvdW5kX3JhdGUoKSByZXR1cm5zIHRoZSBoaWdoZXN0IGZyZXF1ZW5jeSBsb3dlciB0
aGFuIHRhcmdldC4gU28KICBpdCBtdXN0IHJldHVybiA1MDAgTUh6IChJIGhhdmVuJ3QgdGVzdGVk
IHRoaXMgeWV0LCBhbGwgdGhlb3JldGljYWwpLgoKLSBfZmluZF9mcmVxX2NlaWwob3BwX3RhYmxl
LCA1MDAgTUh6KS4KCiAgVGhpcyB3b3JrcyBsaWtlIENQVUZSRVFfUkVMQVRJT05fTCwgc28gd2Ug
ZmluZCBsb3dlc3QgZnJlcXVlbmN5ID49CiAgdGFyZ2V0IGZyZXEuIEFuZCBzbyB3ZSBzaG91bGQg
Z2V0OiA1MDAgTUh6IGl0c2VsZiBhcyBPUFAgdGFibGUgaGFzCiAgaXQuCgotIGNsa19zZXRfcmF0
ZShjbGssIDUwMCBNSHopLgoKICBUaGlzIG11c3QgYmUgZG9pbmcgcm91bmQtcmF0ZSBhZ2Fpbiwg
YnV0IEkgdGhpbmsgd2Ugd2lsbCBzZXR0bGUgd2l0aAogIDUwMCBNSHogZXZlbnR1YWxseS4KCgpO
b3cgdGhlIHF1ZXN0aW9ubmFpcmU6CgotIElzIHRoaXMgd2hvbGUgZXhlcmNpc2UgY29ycmVjdCA/
Ci0gV2Ugc2hvdWxkbid0IGhhdmUgbGFuZGVkIG9uIDUwMCBNSHosIHJpZ2h0ID8KLSBJcyB0aGVy
ZSBhbnl0aGluZyB3cm9uZyB3aXRoIHRoZSBhYm92ZSB0aGVvcnkgKEkgYW0gZ29pbmcgdG8gdGVz
dCBpdCBzb29uIHRob3VnaCkuCi0gV2h5IGRvIHdlIG5lZWQgdG8gZG8gdGhlIGZpcnN0IGNsb2Nr
X3JvdW5kX3JhdGUoKSA/IFNob3VsZCB3ZSByZW1vdmUKICBpdCA/CgoKCk5vdyBsZXRzIG1vdmUg
dG8gdGhpcyBwYXRjaCwgd2hpY2ggbWFrZXMgaXQgbW9yZSBjb25mdXNpbmcuCgpUaGUgT1BQIHRh
YmxlcyBmb3IgQ1BVcyBhbmQgR1BVcyBzaG91bGQgYWxyZWFkeSBiZSBzb21ld2hhdCBsaWtlIGZt
YXgKdGFibGVzIGZvciBwYXJ0aWN1bGFyIHZvbHRhZ2UgdmFsdWVzIGFuZCB0aGF0J3Mgd2h5IGJv
dGggY3B1ZnJlcSBhbmQKT1BQIGNvcmUgdHJ5IHRvIGZpbmQgYSBmcmVxdWVuY3kgaGlnaGVyIHRo
YW4gdGFyZ2V0IHNvIHdlIGNob29zZSB0aGUKbW9zdCBvcHRpbXVtIG9uZSBwb3dlci1lZmZpY2ll
bmN5IHdpc2UuCgpGb3IgY2FzZXMgd2hlcmUgdGhlIE9QUCB0YWJsZSBpcyBvbmx5IGEgc3Vic2V0
IG9mIHRoZSBjbGstcHJvdmlkZXJzCnRhYmxlIChhbG1vc3QgYWx3YXlzKSwgaWYgd2UgbGV0IHRo
ZSBjbG9jayBwcm92aWRlciB0byBmaW5kIHRoZQpuZWFyZXN0IGZyZXF1ZW5jeSAod2hpY2ggaXMg
bG93ZXIpIHdlIHdpbGwgcnVuIHRoZSBDUFUvR1BVIGF0IGEKbm90LXNvLW9wdGltYWwgZnJlcXVl
bmN5LiBpLmUuIGlmIDUwMCwgNjAwLCA3MDAgTUh6IGFsbCBuZWVkIHZvbHRhZ2UKdG8gYmUgMS4y
IFYsIHdlIHNob3VsZCBiZSBydW5uaW5nIGF0IDcwMCBhbHdheXMsIHdoaWxlIHdlIG1heSBlbmQg
dXAKcnVubmluZyBhdCA1MDAgTUh6LgoKVGhpcyBraW5kIG9mIGJlaGF2aW9yIChpbnRyb2R1Y2Vk
IGJ5IHRoaXMgcGF0Y2gpIGlzIGltcG9ydGFudCBmb3IKb3RoZXIgZGV2aWNlcyB3aGljaCB3YW50
IHRvIHJ1biBhdCB0aGUgbmVhcmVzdCBmcmVxdWVuY3kgdG8gdGFyZ2V0Cm9uZSwgYnV0IG5vdCBm
b3IgQ1BVcy9HUFVzLiBTbywgd2UgbmVlZCB0byB0YWcgdGhlc2UgSU8gZGV2aWNlcwpzZXBhcmF0
ZWx5LCBtYXliZSBmcm9tIERUID8gU28gd2Ugc2VsZWN0IHRoZSBjbG9zZXN0IG1hdGNoIGluc3Rl
YWQgb2YKbW9zdCBvcHRpbWFsIG9uZS4KCkJ1dCBsZXRzIGZpeCB0aGUgZXhpc3RpbmcgaXNzdWVz
IGZpcnN0IGFuZCB0aGVuIHRoaW5rIGFib3V0IHRoaXMKcGF0Y2guCgotLSAKdmlyZXNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
