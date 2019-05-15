Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29B1E8E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4642B895CA;
	Wed, 15 May 2019 07:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13E78914F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 01:05:32 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id f12so438015plt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 18:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OigDY7C0dmgiXTDGvrusCma83AIE7G7GBT96nHD0zbM=;
 b=JIFI1gwZNb3Z97UfNliUoQZZQRdzBNSKjaLvWTos+nSoNK3CKWZ77JAOkvEgAFC3Ex
 foRshZE5JmLX/WHH28xW08yuuSA3P/xxE1kMjDr0VUXyABBxJDDaChLEleQFxdQGbXbf
 RaCR79dS35+YLgfJ8uRWxS2yIkb9jMK5B5VGrBP+JmPqtrdVehziMns3TuMAl+Jow8Vk
 LCimhAfV2yT7DlcgpWh25B+wJtj9EdpVHYUfk63N3CJ3xJlw0jIHz7BwvpSNYCU9RnJS
 Gjj9hKi0zPTXQDe09WOB8EziJXsy4ncb6h5YDZv5C5VV0mdN55bSxv69YofnXFMUM2Sb
 FmVA==
X-Gm-Message-State: APjAAAUZakqZmmolZZqtyRjiwasbegfWWeLhkOwQpSWWrlXEu0XnMgm7
 NXB/9LHc6q4/IVuLCgPV7hU=
X-Google-Smtp-Source: APXvYqzyXdx1JAKc9EQBG8NQoamrnNm65978YnQJMX+DqpSV+jegTFpztDsoZNa4XUv/kmajV5xtmA==
X-Received: by 2002:a17:902:5e1:: with SMTP id
 f88mr39973784plf.226.1557882332614; 
 Tue, 14 May 2019 18:05:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r64sm450148pfa.25.2019.05.14.18.05.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 18:05:31 -0700 (PDT)
Subject: Re: [PATCH] drm/pl111: Initialize clock spinlock early
To: Linus Walleij <linus.walleij@linaro.org>
References: <1557758781-23586-1-git-send-email-linux@roeck-us.net>
 <CACRpkdb6EEchXBSnO5SckGq7MY0z26Fq-=y+uJR=2_SCMC0q+Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9d4fde45-be92-f2e2-0571-f2316d036853@roeck-us.net>
Date: Tue, 14 May 2019 18:05:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdb6EEchXBSnO5SckGq7MY0z26Fq-=y+uJR=2_SCMC0q+Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OigDY7C0dmgiXTDGvrusCma83AIE7G7GBT96nHD0zbM=;
 b=GWFDE4osS2bEzj1o7ShUnbslcK1xslARZnhZzfRZh7jSVI7phnABFz9jFlBejziQS6
 o1ObcqmOoNtPB3LuKJuSHwFsxPuab+LpwhgRN7oU/aw+v6NJo9YAIkc7K5OZfF1tA8KF
 BqcVnYQ8aBHxMSgTTQ0w+v9aGmWe05ZSVmocLTL33t5UfrDnmZulDE8cz6LY3qcldYQ1
 GuaCxx6A//0qbApOxaeRSTE93tA7qlxxVwEqYUKP0xlwEtecAi2BXe003LwZl2iZZNia
 rjckM/fvGbwjONwU7S2s3XlGSUzim51CRjyIN/6jdXPZaYJBBluwscH3pxhM1aaYX8+m
 i2eQ==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xNC8xOSAzOjIwIFBNLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDEz
LCAyMDE5IGF0IDQ6NDYgUE0gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90
ZToKPiAKPj4gVGhlIGZvbGxvd2luZyB3YXJuaW5nIGlzIHNlZW4gb24gc3lzdGVtcyB3aXRoIGJy
b2tlbiBjbG9jayBkaXZpZGVyLgo+Pgo+PiBJTkZPOiB0cnlpbmcgdG8gcmVnaXN0ZXIgbm9uLXN0
YXRpYyBrZXkuCj4+IHRoZSBjb2RlIGlzIGZpbmUgYnV0IG5lZWRzIGxvY2tkZXAgYW5ub3RhdGlv
bi4KPj4gdHVybmluZyBvZmYgdGhlIGxvY2tpbmcgY29ycmVjdG5lc3MgdmFsaWRhdG9yLgo+PiBD
UFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNS4xLjAtMDk2OTgtZzFmYjNi
NTIgIzEKPj4gSGFyZHdhcmUgbmFtZTogQVJNIEludGVncmF0b3IvQ1AgKERldmljZSBUcmVlKQo+
PiBbPGMwMDExYmU4Pl0gKHVud2luZF9iYWNrdHJhY2UpIGZyb20gWzxjMDAwZWJiOD5dIChzaG93
X3N0YWNrKzB4MTAvMHgxOCkKPj4gWzxjMDAwZWJiOD5dIChzaG93X3N0YWNrKSBmcm9tIFs8YzA3
ZDNmZDA+XSAoZHVtcF9zdGFjaysweDE4LzB4MjQpCj4+IFs8YzA3ZDNmZDA+XSAoZHVtcF9zdGFj
aykgZnJvbSBbPGMwMDYwZDQ4Pl0gKHJlZ2lzdGVyX2xvY2tfY2xhc3MrMHg2NzQvMHg2ZjgpCj4+
IFs8YzAwNjBkNDg+XSAocmVnaXN0ZXJfbG9ja19jbGFzcykgZnJvbSBbPGMwMDVkZTJjPl0KPj4g
ICAgICAgICAgKF9fbG9ja19hY3F1aXJlKzB4NjgvMHgyMTI4KQo+PiBbPGMwMDVkZTJjPl0gKF9f
bG9ja19hY3F1aXJlKSBmcm9tIFs8YzAwNjA0MDg+XSAobG9ja19hY3F1aXJlKzB4MTEwLzB4MjFj
KQo+PiBbPGMwMDYwNDA4Pl0gKGxvY2tfYWNxdWlyZSkgZnJvbSBbPGMwN2Y3NTVjPl0gKF9yYXdf
c3Bpbl9sb2NrKzB4MzQvMHg0OCkKPj4gWzxjMDdmNzU1Yz5dIChfcmF3X3NwaW5fbG9jaykgZnJv
bSBbPGMwNTM2YzhjPl0KPj4gICAgICAgICAgKHBsMTExX2Rpc3BsYXlfZW5hYmxlKzB4ZjgvMHg1
ZmMpCj4+IFs8YzA1MzZjOGM+XSAocGwxMTFfZGlzcGxheV9lbmFibGUpIGZyb20gWzxjMDUwMmY1
ND5dCj4+ICAgICAgICAgIChkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfbW9kZXNldF9lbmFibGVz
KzB4MWVjLzB4MjQ0KQo+Pgo+PiBTaW5jZSBjb21taXQgZWVkZDYwMzNiNGM4ICgiZHJtL3BsMTEx
OiBTdXBwb3J0IHZhcmlhbnRzIHdpdGggYnJva2VuIGNsb2NrCj4+IGRpdmlkZXIiKSwgdGhlIHNw
aW5sb2NrIGlzIG5vdCBpbml0aWFsaXplZCBpZiB0aGUgY2xvY2sgZGl2aWRlciBpcyBicm9rZW4u
Cj4+IEluaXRpYWxpemUgaXQgZWFybGllciB0byBmaXggdGhlIHByb2JsZW0uCj4+Cj4+IEZpeGVz
OiBlZWRkNjAzM2I0YzggKCJkcm0vcGwxMTE6IFN1cHBvcnQgdmFyaWFudHMgd2l0aCBicm9rZW4g
Y2xvY2sgZGl2aWRlciIpCj4+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5l
dD4KPiAKPiBBcHBsaWVkIHRvIGRybS1taXNjLW5leHQtZml4ZXMgYW5kIHB1c2hlZC4KPiAKPiBP
dXQgb2YgY3VyaW9zaXR5OiBkbyB5b3UgaGF2ZSBhICJyZWFsIiBJbnRlZ3JhdG9yL0NQIG9yIGlz
IHRoaXMKPiBRRU1VPwo+IAoKVGhpcyBpcyB3aXRoIHFlbXUuCgpHdWVudGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
