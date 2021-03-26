Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CCA34B246
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 23:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BAE6F4EA;
	Fri, 26 Mar 2021 22:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C482A6F4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 22:47:15 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o10so9906190lfb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 15:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W1RcGUH/uP3AV+xR5R8WnDD4dWL+fCI3DhAY9Sgy0wc=;
 b=grSyczPIYylTzXeOONjlfKqt282gKKiAu/eXyo0eiv09K6a8LGD0lc3V6rmQwpf6nz
 Yy6LD9UbdAQNyKX6iaR4dQhSxufJNSfGKw/u/gGX0ZPy0h1i+scZpe65xe7ZC0+IMB07
 ZKwHKno5TDAUOWAyXVEDesKUu5lkmb/UxvM/3v9GCHZxv5s20OXkbWusF2J4u+ePdOtM
 B4KUXSSzGF499J2jbKfeXlUXmiY+ISidHNr5BnPZN4ZopOi28aUzISLRbyIU206iTE5r
 WuXHyQMrHgo9yeMZhuC1dRzaLm9gguIqlPVeC/4Tj4sBxdDokTdDWXOYg+YQXe40o29B
 JWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W1RcGUH/uP3AV+xR5R8WnDD4dWL+fCI3DhAY9Sgy0wc=;
 b=sut+om3Il7FfUYPiABhaQher1Xv2vKVlakz5Vi/m9h0abYTmuFf9InN6LmVQsKVx2E
 2IfV2DZoIJR0zbfHQiIR3/90oyqk3heo5AaZy43NKIqY8YqhbzT45hQLVrFt+QWjjSpQ
 RalV1jfovSqC0lbT8Bm70m7Isks1GwbQqyxmW/c3u2UAuZs2LT6j3+x66VRVIFsuD5sA
 Ned8/2rV5a9jdQA6bwCxVDBz3XL7XROQMJ1vYHmWk0hBlGuqQPvbv1xP+RJXQ02+40Jo
 7bsSGsv1Lv+hxQVe13WmjZp3yjJtWNJFbciZdGdgUZY36lluMHy7ACjubiZU23LYpE51
 Rxlg==
X-Gm-Message-State: AOAM530H4Cah3CNJyMeJFXSjSRqpV99mkIdnKq/0Pe5lx0i+fH/IyqoH
 wxOuoGVxOX7npriCfZdI04w=
X-Google-Smtp-Source: ABdhPJyhGhr5e1IcWFEMSBlIsbuyHIwxtX2KhC3EJ2yE0S4ruHkCIufM20ofganuPru1KBeRN3CE5g==
X-Received: by 2002:a19:7d43:: with SMTP id y64mr9876595lfc.614.1616798834206; 
 Fri, 26 Mar 2021 15:47:14 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id x27sm1003125lfn.95.2021.03.26.15.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 15:47:13 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
 <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
 <48367008-1786-6cb6-15a0-03b526f53fe9@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d4e34746-3ea5-8413-e31e-d0a50d34eac9@gmail.com>
Date: Sat, 27 Mar 2021 01:47:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <48367008-1786-6cb6-15a0-03b526f53fe9@kapsi.fi>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMDMuMjAyMSAyMjoxMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gMy8yNi8y
MSA4OjMxIFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDI2LjAzLjIwMjEgMTc6NTQsIE1p
a2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4KPj4+IExvY2tkZXAgZG9lc24ndCBzZWVtIHRv
IGJlIGxpa2luZyBkZXZfbmFtZSgpIGZvciB0aGUgbmFtZSwgYW5kIEkgdGhpbmsKPj4+IGFsbG9j
YXRpbmcgYSBzdHJpbmcgZm9yIHRoaXMgcHVycG9zZSBzZWVtcyBhIGJpdCBvdmVya2lsbCwgc28g
SSdsbCBrZWVwCj4+PiB0aGUgbG9jayBuYW1lIGFzIGlzIGlmIHRoZXJlIGFyZSBubyBvYmplY3Rp
b25zLgo+Pgo+PiBXaGF0IGRvZXMgImxpa2luZyIgbWVhbj8KPj4KPiAKPiBrZXJuZWwvbG9ja2lu
Zy9sb2NrZGVwLmM6ODk0IChvbiBteSBsb2NhbCB0cmVlKToKPiAKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBXQVJOX09OX09OQ0UoY2xhc3MtPm5hbWUgIT0g
bG9jay0+bmFtZSAmJgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NrLT5rZXkgIT0KPiAmX19sb2NrZGVw
X25vX3ZhbGlkYXRlX18pOwoKQWxyaWdodCwgSSBzZWUgbm93IHRoYXQgbG9ja2RlcCByZXF1aXJl
cyB0byB1c2UgdGhlIHNhbWUgbmFtZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
