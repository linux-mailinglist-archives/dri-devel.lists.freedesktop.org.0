Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329AEAC2C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBAE6EDDC;
	Thu, 31 Oct 2019 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359866EA62
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 15:05:53 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m7so3089952lji.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 08:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bGA7jzeI+WSL3DCOKTBSMk1Fh+Qqh8rfkLd96X7MeMU=;
 b=kL6Dmd9L7VbhhZ1mmPLCdATuAJzAVc7ww9hyjqRWKw5AcEG/dmoGNNVQ5rQmEZJD3K
 nBnlp3cLqkZANfZJm1cF7XxVnf8X1S0YAJdJ5w+AZhsWLzQAIflRoTqThrM50lSAXuIp
 qcuoshXEJWCu95UPFYdwwZM58GB4nE1b0tTJxAhX1TVhGDGpy9Hv+GtPlH1zOcL28Gsf
 sPGfKODzwGzYdDCOvtX/E7jqkX4LMjKR7PkmvPX8RRgLVX+HQyzdqiN11gnL2gZ5W7B9
 Snjv+PgduuY1rewi6M1kmmJJiMFkhoEXjKS8BburEzvX8gPv5Y9MGOsy7yaOQWXT+xVl
 JUfw==
X-Gm-Message-State: APjAAAXT/EK8bmQtZ2tEJ3dOmSCexJ8juySEsK8XCRV7x7hHZ8NXWIZQ
 MFQj7EPQFs0pmRXkdPhXi7ST6upj
X-Google-Smtp-Source: APXvYqyJVGoNBv8bRQWQgZ4x4zi0fegM6cCiPLIHIjDQJr2OozF3NumX0c0oe8JVZi+ZNJ/Yi3HiOQ==
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr147731ljk.17.1572447950958;
 Wed, 30 Oct 2019 08:05:50 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id 190sm105565ljj.72.2019.10.30.08.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2019 08:05:50 -0700 (PDT)
Subject: Re: [PATCH 01/12] memory: tegra: Add gr2d and gr3d to DRM IOMMU group
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
 <20191028123718.3890217-2-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ecafd917-bcf7-0f3e-2423-6b79793d56a2@gmail.com>
Date: Wed, 30 Oct 2019 18:05:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028123718.3890217-2-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bGA7jzeI+WSL3DCOKTBSMk1Fh+Qqh8rfkLd96X7MeMU=;
 b=U9ZLP+C04jV6AyiqKsohMJ11jXX+BFRc5cPf26fENiDOxBYVHAbTlHhT3kieBmO8/5
 iuwEYl6KgVUBNVEsBoc1yRKw7GNpwICas9vjpAHbJsFPoyf8pQAC7HeIDktipmUb4PwO
 y2STZ/4CEIcBxvVaYjLnz6iNoir220J9FWACwOHTy8fOgVHQvdt/jY6pxq0QWl5MLrkn
 pPgU6kUR4i7xKqBqUicK//Gy7QocPEsacF85FRNaiZUHVAZbFMIFy5miGOWHpxbpRxg1
 dEA38TYhShHQS6Dqf60PgzAQuV/we9qOKPkQ8itu3LZROTGPZIPGbUhPtXWvo7++mXf5
 4d5Q==
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
 Puneet Saxena <puneets@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjguMTAuMjAxOSAxNTozNywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IEFsbCBvZiB0aGUgZGV2aWNlcyBt
YWtpbmcgdXAgdGhlIFRlZ3JhIERSTSBkZXZpY2Ugd2FudCB0byBzaGFyZSBhIHNpbmdsZQo+IElP
TU1VIGRvbWFpbi4gUHV0IHRoZW0gaW50byBhIHNpbmdsZSBncm91cCB0byBhbGxvdyB0aGVtIHRv
IGRvIHRoYXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZp
ZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmExMTQuYyB8IDEwICsr
KysrKy0tLS0KPiAgZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmExMjQuYyB8ICA4ICsrKysrLS0t
Cj4gIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuYyAgfCAxMSArKysrKysrLS0tLQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTExNC5jIGIvZHJpdmVycy9tZW1v
cnkvdGVncmEvdGVncmExMTQuYwo+IGluZGV4IGFjODM1MWI1YmVlYi4uNDhlZjAxYzNmZjkwIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTE0LmMKPiArKysgYi9kcml2
ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTExNC5jCj4gQEAgLTkwOSwxNiArOTA5LDE4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgdGVncmFfc21tdV9zd2dyb3VwIHRlZ3JhMTE0X3N3Z3JvdXBzW10gPSB7
Cj4gIAl7IC5uYW1lID0gInRzZWMiLCAgICAgIC5zd2dyb3VwID0gVEVHUkFfU1dHUk9VUF9UU0VD
LCAgICAgIC5yZWcgPSAweDI5NCB9LAo+ICB9Owo+ICAKPiAtc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGludCB0ZWdyYTExNF9ncm91cF9kaXNwbGF5W10gPSB7Cj4gK3N0YXRpYyBjb25zdCB1bnNpZ25l
ZCBpbnQgdGVncmExMTRfZ3JvdXBfZHJtW10gPSB7Cj4gIAlURUdSQV9TV0dST1VQX0RDLAo+ICAJ
VEVHUkFfU1dHUk9VUF9EQ0IsCj4gKwlURUdSQV9TV0dST1VQX0cyLAo+ICsJVEVHUkFfU1dHUk9V
UF9OViwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFfc21tdV9ncm91cF9z
b2MgdGVncmExMTRfZ3JvdXBzW10gPSB7Cj4gIAl7Cj4gLQkJLm5hbWUgPSAiZGlzcGxheSIsCj4g
LQkJLnN3Z3JvdXBzID0gdGVncmExMTRfZ3JvdXBfZGlzcGxheSwKPiAtCQkubnVtX3N3Z3JvdXBz
ID0gQVJSQVlfU0laRSh0ZWdyYTExNF9ncm91cF9kaXNwbGF5KSwKPiArCQkubmFtZSA9ICJkcm0i
LAo+ICsJCS5zd2dyb3VwcyA9IHRlZ3JhMTE0X2dyb3VwX2RybSwKPiArCQkubnVtX3N3Z3JvdXBz
ID0gQVJSQVlfU0laRSh0ZWdyYTExNF9ncm91cF9kcm0pLAo+ICAJfSwKPiAgfTsKPiAgCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTI0LmMgYi9kcml2ZXJzL21lbW9y
eS90ZWdyYS90ZWdyYTEyNC5jCj4gaW5kZXggNWQwY2NiMmJlMjA2Li42MmIzMGIxYjk2NzcgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmExMjQuYwo+ICsrKyBiL2RyaXZl
cnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTI0LmMKPiBAQCAtOTc0LDE2ICs5NzQsMTggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB0ZWdyYV9zbW11X3N3Z3JvdXAgdGVncmExMjRfc3dncm91cHNbXSA9IHsK
PiAgCXsgLm5hbWUgPSAidmkiLCAgICAgICAgLnN3Z3JvdXAgPSBURUdSQV9TV0dST1VQX1ZJLCAg
ICAgICAgLnJlZyA9IDB4MjgwIH0sCj4gIH07Cj4gIAo+IC1zdGF0aWMgY29uc3QgdW5zaWduZWQg
aW50IHRlZ3JhMTI0X2dyb3VwX2Rpc3BsYXlbXSA9IHsKPiArc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGludCB0ZWdyYTEyNF9ncm91cF9kcm1bXSA9IHsKPiAgCVRFR1JBX1NXR1JPVVBfREMsCj4gIAlU
RUdSQV9TV0dST1VQX0RDQiwKPiArCVRFR1JBX1NXR1JPVVBfR1BVLAo+ICsJVEVHUkFfU1dHUk9V
UF9WSUMsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX3NtbXVfZ3JvdXBf
c29jIHRlZ3JhMTI0X2dyb3Vwc1tdID0gewo+ICAJewo+ICAJCS5uYW1lID0gImRpc3BsYXkiLAo+
IC0JCS5zd2dyb3VwcyA9IHRlZ3JhMTI0X2dyb3VwX2Rpc3BsYXksCj4gLQkJLm51bV9zd2dyb3Vw
cyA9IEFSUkFZX1NJWkUodGVncmExMjRfZ3JvdXBfZGlzcGxheSksCj4gKwkJLnN3Z3JvdXBzID0g
dGVncmExMjRfZ3JvdXBfZHJtLAo+ICsJCS5udW1fc3dncm91cHMgPSBBUlJBWV9TSVpFKHRlZ3Jh
MTI0X2dyb3VwX2RybSksCj4gIAl9LAoKVGhlICJkaXNwbGF5IiAtPiAiZHJtIiBncm91cCdzIHJl
bmFtaW5nIGlzIG1pc3NlZCBmb3IgVDEyNC4KCltzbmlwXQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
