Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C93447BD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40536E4CA;
	Mon, 22 Mar 2021 14:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3D56E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:48:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x28so21714252lfu.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/fZAw+4NiDFcgCHrlrGbQDPrYTTv6kbwUEtQSv61zqs=;
 b=uWXu5sM6j9p6UAdXDmXHXNods3NAIXQo6QRBvok8FlIH2o0IlS5LnfqMrHqe7Q2BmI
 fAIBh1+Na57dou/HqlvXReLw19EPtpVqzNPBfSdT8+Gu/dc1FgUMkMlTiQhTH9h3PRCm
 ptbTZ9kf/ocg3YA2aLgmQiu60FBdaeDoIBB+naU/WNrcLxv3c7Y8FOAc17MsYq4yrLmM
 D3fApXpJkI1MaHaosCT9+/1nx6ySJZ6n8l6FWnWjoxC/o96vUP8qk0IhqZ9glMzXlYo6
 OtiRr4DGpUq2wGeVO8r7mEoIBO5JENPaqZ30ujvMd+DqouZV9+iYH6gTbH7DUpFgoP3g
 a9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/fZAw+4NiDFcgCHrlrGbQDPrYTTv6kbwUEtQSv61zqs=;
 b=A/eJFgrOzkgxrlhlRY6PkYA/Mj5Q6vbATmHC5P7Vn9W7uJ8pbRitFOYhaI8ulH7i8t
 SQhfh3hXPgKpO8kZST53WPPJSPxyOY6MPHpAjzQYHwX42Zly25l9OVTAgWpgOCuNPtpI
 iCE/lcHkMTdqkV1IPFUd60S8iM84xDr80v62mH4GEuIte+qW39JbKVFfrxbQjYP6Qa86
 ePiwKxSurqz/YArtLeCd19fYSImY2AXsCuy8ibR+VsVMrNLtwMBX8mWudyxPPQS5I/FH
 oeJCV80os2I0SPioOfuxKvw1ONXXUyuzm+lBaCKc4zhZC/w/fBZJa3HvDIaUf6YNmNY1
 Hr2A==
X-Gm-Message-State: AOAM530RVvxObPIEzgi+Xfs2nb6s7fEhEarXhIZVuIJMPXsCxd26cHxl
 dpUHvWIJ4APi0oFEvejCHY62Bnfok4A=
X-Google-Smtp-Source: ABdhPJysSCaiPo03sO9bykrRBdDLruy+482nEDsgN0vR2QWZdV2ZWoP7ivyB6E2B88FT/fhsUx1Jaw==
X-Received: by 2002:ac2:4e82:: with SMTP id o2mr9206984lfr.489.1616424527005; 
 Mon, 22 Mar 2021 07:48:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-47.dynamic.spd-mgts.ru.
 [109.252.193.47])
 by smtp.googlemail.com with ESMTPSA id x7sm1955517ljc.118.2021.03.22.07.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:48:46 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
Date: Mon, 22 Mar 2021 17:48:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFitsk3I2l7IBnLR@orome.fritz.box>
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

MjIuMDMuMjAyMSAxNzo0NiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIEph
biAxMSwgMjAyMSBhdCAwMjo1OTo1OVBNICswMjAwLCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6Cj4+
IFRvIGF2b2lkIGZhbHNlIGxvY2tkZXAgd2FybmluZ3MsIGdpdmUgZWFjaCBjbGllbnQgbG9jayBh
IGRpZmZlcmVudAo+PiBsb2NrIGNsYXNzLCBwYXNzZWQgZnJvbSB0aGUgaW5pdGlhbGl6YXRpb24g
c2l0ZSBieSBtYWNyby4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWlra28gUGVydHR1bmVuIDxtcGVy
dHR1bmVuQG52aWRpYS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIHwg
NyArKysrLS0tCj4+ICBpbmNsdWRlL2xpbnV4L2hvc3QxeC5oICAgfCA5ICsrKysrKysrLQo+PiAg
MiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIGIvZHJpdmVycy9ncHUvaG9zdDF4
L2J1cy5jCj4+IGluZGV4IDM0N2ZiOTYyYjZjOS4uOGZjNzllOWNiNjUyIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2J1
cy5jCj4+IEBAIC03MTUsMTMgKzcxNSwxNCBAQCBFWFBPUlRfU1lNQk9MKGhvc3QxeF9kcml2ZXJf
dW5yZWdpc3Rlcik7Cj4+ICAgKiBkZXZpY2UgYW5kIGNhbGwgaG9zdDF4X2RldmljZV9pbml0KCks
IHdoaWNoIHdpbGwgaW4gdHVybiBjYWxsIGVhY2ggY2xpZW50J3MKPj4gICAqICZob3N0MXhfY2xp
ZW50X29wcy5pbml0IGltcGxlbWVudGF0aW9uLgo+PiAgICovCj4+IC1pbnQgaG9zdDF4X2NsaWVu
dF9yZWdpc3RlcihzdHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50KQo+PiAraW50IF9faG9zdDF4
X2NsaWVudF9yZWdpc3RlcihzdHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50LAo+PiArCQkJICAg
c3RydWN0IGxvY2tfY2xhc3Nfa2V5ICprZXkpCj4gCj4gSSd2ZSBzZWVuIHRoZSBrYnVpbGQgcm9i
b3Qgd2FybiBhYm91dCB0aGlzIGJlY2F1c2UgdGhlIGtlcm5lbGRvYyBpcyBub3cKPiBvdXQgb2Yg
ZGF0ZS4KPiAKPj4gIHsKPj4gIAlzdHJ1Y3QgaG9zdDF4ICpob3N0MXg7Cj4+ICAJaW50IGVycjsK
Pj4gIAo+PiAgCUlOSVRfTElTVF9IRUFEKCZjbGllbnQtPmxpc3QpOwo+PiAtCW11dGV4X2luaXQo
JmNsaWVudC0+bG9jayk7Cj4+ICsJX19tdXRleF9pbml0KCZjbGllbnQtPmxvY2ssICJob3N0MXgg
Y2xpZW50IGxvY2siLCBrZXkpOwo+IAo+IFNob3VsZCB3ZSBtYXliZSBhdHRlbXB0IHRvIG1ha2Ug
dGhpcyB1bmlxdWU/IENvdWxkIHdlIHVzZSBzb21ldGhpbmcgbGlrZQo+IGRldl9uYW1lKGNsaWVu
dC0+ZGV2KSBmb3IgdGhpcz8KCkknbSBjdXJpb3VzIHdobyB0aGUgbG9ja2RlcCB3YXJuaW5nIGNv
dWxkIGJlIHRyaWdnZXJlZCBhdCBhbGwsIEkgZG9uJ3QKcmVjYWxsIGV2ZXIgc2VlaW5nIGl0LiBN
aWtrbywgY291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IGhvdyB0byByZXByb2R1Y2UKdGhlIHdhcm5p
bmc/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
