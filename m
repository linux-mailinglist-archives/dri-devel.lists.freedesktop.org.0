Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432A47A88
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658389198;
	Mon, 17 Jun 2019 07:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4DF88E9D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 03:51:03 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id t16so4869852pfe.11
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 20:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=57FOpX8q6OFc6W9+7flDD5a/Z9hlA87d2qLRqS0QYaA=;
 b=kSuS/D7cZv9zSGA2ENxB9/XC6vkegdAg2ZAYHlMV5MxWvguHAjZV55Gnpq0Ap5a5nT
 8nA7JY34bAjKbjIFgrd+g85zKbp4dbPBouuqzdZkvLtKth3157G3yS+uOa+SY0e3X+HZ
 omkQNwmyJMJ1EtilLEfZviyM+PzH36QOMw3eX52sl+ACuBwlDFh9h/T52ahXYIWZ6Cib
 JWKMc5y4ZaiCRwoIBZ8kQqxxYdqulGOdAD5We3Qnt/iYw5ay+foJwa0gyW6fQXu7yb1l
 fzDOTflEdBidYU6ZdCfjRWEL6OkazxEtuyCYVBQ1yjZM6WgKlFQMKVuvjgir0MmYxBnS
 PpcQ==
X-Gm-Message-State: APjAAAUo+qUR/A+Hjj6ukdR7Q09xYwSX1w6iZF+dNSMHADPfqkVq8m6K
 ddvOKFNUp5PMgsDwBSru9z8L2g==
X-Google-Smtp-Source: APXvYqw7hr8o8WapiyfCJVNaq9F8LVepSPGUar/mLLidClzHNbV4xV6Ezzi7xspIP+K/WxmqHTt6oA==
X-Received: by 2002:aa7:956d:: with SMTP id x13mr72685522pfq.132.1560743462982; 
 Sun, 16 Jun 2019 20:51:02 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id l44sm11566082pje.29.2019.06.16.20.51.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Jun 2019 20:51:01 -0700 (PDT)
Date: Mon, 17 Jun 2019 09:20:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
 vincent.guittot@linaro.org, mturquette@baylibre.com
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
Message-ID: <20190617035058.veo7uwqjrpa6kykt@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
 <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
 <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
 <20190614052732.4w6vvwwich2h4cgu@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614052732.4w6vvwwich2h4cgu@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=57FOpX8q6OFc6W9+7flDD5a/Z9hlA87d2qLRqS0QYaA=;
 b=e68ppl05KRRtZIc1up7uMbJ/HjhMgh58+UwxNJKYKlaAGtXco05wfaqv7IgnA1jbKc
 lHnO0U8yljUgdWHpuTfTN/cXV04X3CiRTk1Isbrt43ve37Fb3maMQSD5/n/280jzVolS
 usDQMVtEvfq+0+Fg6mFwdaKgLifFV2xhY3NEjpN+I8Lx+4MwBYpUas/Ve1oA5XQrxilD
 dVXlSp/l/jjHqYcf2x5HbmkVD7fXKOL++1687ZoxfGGLT9kozygpxW38FXdTKU2cdCm/
 Qz15Gc9On/OD28FLeKrmF7JJm8nvC4SwGeURaguzhcHNqaaAMZM5TylX2hnB2ggrwMmu
 v10w==
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

T24gMTQtMDYtMTksIDEwOjU3LCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gSG1tLCBzbyB0aGlzIHBh
dGNoIHdvbid0IGJyZWFrIGFueXRoaW5nIGFuZCBJIGFtIGluY2xpbmVkIHRvIGFwcGx5IGl0IGFn
YWluIDopCj4gCj4gRG9lcyBhbnlvbmUgc2VlIGFueSBvdGhlciBpc3N1ZXMgd2l0aCBpdCwgd2hp
Y2ggSSBtaWdodCBiZSBtaXNzaW5nID8KCkkgaGF2ZSB1cGRhdGVkIHRoZSBjb21taXQgbG9nIGEg
Yml0IG1vcmUgdG8gY2xhcmlmeSBvbiB0aGluZ3MsIHBsZWFzZSBsZXQgbWUKa25vdyBpZiBpdCBs
b29rcyBva2F5LgoKICAgIG9wcDogRG9uJ3Qgb3ZlcndyaXRlIHJvdW5kZWQgY2xrIHJhdGUKICAg
IAogICAgVGhlIE9QUCB0YWJsZSBub3JtYWxseSBjb250YWlucyAnZm1heCcgdmFsdWVzIGNvcnJl
c3BvbmRpbmcgdG8gdGhlCiAgICB2b2x0YWdlIG9yIHBlcmZvcm1hbmNlIGxldmVscyBvZiBlYWNo
IE9QUCwgYnV0IHdlIGRvbid0IG5lY2Vzc2FyaWx5IHdhbnQKICAgIGFsbCB0aGUgZGV2aWNlcyB0
byBydW4gYXQgZm1heCBhbGwgdGhlIHRpbWUuIFJ1bm5pbmcgYXQgZm1heCBtYWtlcyBzZW5zZQog
ICAgZm9yIGRldmljZXMgbGlrZSBDUFUvR1BVLCB3aGljaCBoYXZlIGEgZmluaXRlIGFtb3VudCBv
ZiB3b3JrIHRvIGRvIGFuZAogICAgc2luY2UgYSBzcGVjaWZpYyBhbW91bnQgb2YgZW5lcmd5IGlz
IGNvbnN1bWVkIGF0IGFuIE9QUCwgaXRzIGJldHRlciB0bwogICAgcnVuIGF0IHRoZSBoaWdoZXN0
IHBvc3NpYmxlIGZyZXF1ZW5jeSBmb3IgdGhhdCB2b2x0YWdlIHZhbHVlLgogICAgCiAgICBPbiB0
aGUgb3RoZXIgaGFuZCwgd2UgaGF2ZSBJTyBkZXZpY2VzIHdoaWNoIG5lZWQgdG8gcnVuIGF0IHNw
ZWNpZmljCiAgICBmcmVxdWVuY2llcyBvbmx5IGZvciB0aGVpciBwcm9wZXIgZnVuY3Rpb25pbmcs
IGluc3RlYWQgb2YgbWF4aW11bQogICAgcG9zc2libGUgZnJlcXVlbmN5LgogICAgCiAgICBUaGUg
T1BQIGNvcmUgY3VycmVudGx5IHJvdW5kdXAgdG8gdGhlIG5leHQgcG9zc2libGUgT1BQIGZvciBh
IGZyZXF1ZW5jeQogICAgYW5kIHNlbGVjdCB0aGUgZm1heCB2YWx1ZS4gVG8gc3VwcG9ydCB0aGUg
SU8gZGV2aWNlcyBieSB0aGUgT1BQIGNvcmUsCiAgICBsZXRzIGRvIHRoZSByb3VuZHVwIHRvIGZl
dGNoIHRoZSB2b2x0YWdlIG9yIHBlcmZvcm1hbmNlIHN0YXRlIHZhbHVlcywKICAgIGJ1dCBub3Qg
dXNlIHRoZSBPUFAgZnJlcXVlbmN5IHZhbHVlLiBSYXRoZXIgdXNlIHRoZSB2YWx1ZSByZXR1cm5l
ZCBieQogICAgY2xrX3JvdW5kX3JhdGUoKS4KICAgIAogICAgVGhlIGN1cnJlbnQgdXNlciwgY3B1
ZnJlcSwgb2YgZGV2X3BtX29wcF9zZXRfcmF0ZSgpIGFscmVhZHkgZG9lcyB0aGUKICAgIHJvdW5k
aW5nIHRvIHRoZSBuZXh0IE9QUCBiZWZvcmUgY2FsbGluZyB0aGlzIHJvdXRpbmUgYW5kIGl0IHdv
bid0CiAgICBoYXZlIGFueSBzaWRlIGFmZmVjdHMgYmVjYXVzZSBvZiB0aGlzIGNoYW5nZS4KICAg
IAogICAgU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgog
ICAgU2lnbmVkLW9mZi1ieTogUmFqZW5kcmEgTmF5YWsgPHJuYXlha0Bjb2RlYXVyb3JhLm9yZz4K
ICAgIFsgVmlyZXNoOiBNYXNzYWdlZCBjaGFuZ2Vsb2cgYW5kIHVzZSB0ZW1wX29wcCB2YXJpYWJs
ZSBpbnN0ZWFkIF0KICAgIFNpZ25lZC1vZmYtYnk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFy
QGxpbmFyby5vcmc+CgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
