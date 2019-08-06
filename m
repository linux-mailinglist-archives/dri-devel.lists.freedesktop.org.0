Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EC182D68
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 10:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857E16E31D;
	Tue,  6 Aug 2019 08:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA22D6E323;
 Tue,  6 Aug 2019 08:05:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r1so86854873wrl.7;
 Tue, 06 Aug 2019 01:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XKqfzXT2xJValwsqxVd6VdfxkGoE2BrzHvpof+ywT1w=;
 b=jXz6flivweokLEpDkdecd1SjA/5LdWf1rUVLTGiEMSxJFCOdXJHPinX5dKU5lHJxt+
 tOe7KYupsja+KNqVdD+YlnhV/bKyh0CHlUXWw1Y+az7HZu+Z/rzpnnnPaszUl4hJiSsY
 /D08R1C4bnG0bHFfnX5+/zmWmXi8JEEnL1FisfzuAtp7m/UbFhz02ika2EJzBr6V2bSt
 HvBFRkrityXX1lU2vjXuQIfKY+Np1QNEmZLIvpwyChl8uUOS2ZkZrkYKFPxRoPtNwlVi
 VGgHTSGglj0HFuJZlVj7x+nYmJNPkyp72rZeDzKueiiMlAScmCwW8gMhXGh5mMXImxAg
 fUjA==
X-Gm-Message-State: APjAAAWRHP+9eoTYE2TTj4AooeKDUXF76X1EHZMJipaF7GAQYz+ishSn
 Tcj6kxheFefI4uypsmrO7bw=
X-Google-Smtp-Source: APXvYqweDAyTbj+ye3psaEHBnkM/WSx6A5TzuxNeHi+hqP9ViZ3xNTrAMrTPt1s4ggi8M4tJZVZJ5g==
X-Received: by 2002:a05:6000:1148:: with SMTP id
 d8mr2853448wrx.354.1565078715463; 
 Tue, 06 Aug 2019 01:05:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j189sm105606032wmb.48.2019.08.06.01.05.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 01:05:14 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
 <156502405985.28464.7514823669359337891@skylake-alporthouse-com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f8c213ea-a9ef-8ac1-39c0-0ea83ea2b118@gmail.com>
Date: Tue, 6 Aug 2019 10:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156502405985.28464.7514823669359337891@skylake-alporthouse-com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XKqfzXT2xJValwsqxVd6VdfxkGoE2BrzHvpof+ywT1w=;
 b=MZGWLaOZvy2+RRrTFqcirMggbGPqRj7IbuBjcYCwedRsVX2WSsMciRyapISdCUo3zc
 jP221YBH6WNoJt22Yrdwpj2Oy0JBFcQ0ObwfEKbW7D63Fkztb/7KWnZA+pbPfCUj2UI0
 pWaLJTasbLQxuOZGJwRFCeo8IGkU3v5mo1bTGaKa6mEV6xlfQKRdLRt5I5fHyHuJR4Bk
 0KIqFW6FTF78h3qxCEfjxMehCrSLhIa9CkIsJgSc+EI4OArnqrRDhHcKm/OW58YNC8Q3
 SICnCvoRkjrcuq3EcDAiXbFWzA39NwN1p6OL/iXX9y7sbcIQQAeaE27yJQtdKxk7Pvhn
 ihbA==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDguMTkgdW0gMTg6NTQgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
cyBXaWxzb24gKDIwMTktMDgtMDUgMTY6NTg6NTYpCj4+IFF1b3RpbmcgQ2hyaXN0aWFuIEvDtm5p
ZyAoMjAxOS0wOC0wNSAxNjo0NTo1MCkKPj4+IFRoZSByZXNlcnZhdGlvbiBvYmplY3Qgc2hvdWxk
IGJlIGNhcGFibGUgb2YgaGFuZGxpbmcgaXRzIGludGVybmFsIG1lbW9yeQo+Pj4gbWFuYWdlbWVu
dCBpdHNlbGYuIEFuZCBzaW5jZSB3ZSBzZWFyY2ggZm9yIGEgZnJlZSBzbG90IHRvIGFkZCB0aGUg
ZmVuY2UKPj4+IGZyb20gdGhlIGJlZ2lubmluZyB0aGlzIGlzIGFjdHVhbGx5IGEgd2FzdGUgb2Yg
dGltZSBhbmQgb25seSBtaW5pbWFsIGhlbHBmdWwuCj4+ICJGcm9tIHRoZSBiZWdpbm5pbmc/IiBB
dHRlbXB0aW5nIHRvIHBydW5lIHNpZ25hbGVkIGZlbmNlcyBvbiBpbnNlcnRpb24gaXMKPj4gcXVp
dGUgcmVjZW50LgoKV2hhdCBJIG1lYW50IHdhcyBmcm9tIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGFy
cmF5IDopIFNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLgoKPj4gSG93ZXZlciwgdGhhdCBkb2Vzbid0
IGhlbHAgdGhlIGNhc2VzIHdoZXJlIHJlc2VydmF0aW9uX29iamVjdCBrZWVwcyBvbgo+PiBob2xk
aW5nIGEgcmVmZXJlbmNlIHRvIHRoZSBmZW5jZXMgZm9yIGlkbGUgb2JqZWN0cy4gSXQncyBhbiBh
YnNvbHV0ZQo+PiBuaWdodG1hcmUgb2YgYSByZWZlcmVuY2UgdHJhcC4KCldlIG9ubHkgZnJlZSB1
cCB0aGUgZmVuY2Ugb2JqZWN0cywgYnV0IG5vdCB0aGUgYXJyYXkgaXRzZWxmLiBBbmQgCnVzZXJz
cGFjZSBhY3R1YWxseSBuZWVkcyB0byBjYWxsIHRoZSB3YWl0IGZ1bmN0aW9uLgoKU28gdG8gbWUg
dGhpcyBsb29rcyBsaWtlIGl0IGRvZXNuJ3QgcmVhbGx5IGhlbHBzIG11Y2guCgo+IEZ3aXcsIGl0
J3MgYSBwZXQgcGVldmUsIGFuZCBub3QgYSBmdW5kYW1lbnRhbCBvYmplY3QgdG8gcmVtb3Zpbmcg
c29tZQo+IGxvb3BzIGluc2lkZSByZXNlcnZhdGlvbl9vYmplY3QuIEhlcmUsIHRoZSBzZXFubyBp
cyBiZWluZyB1c2VkIGFzIGEKPiBndWlkZSB0byBhdm9pZCB0cnlpbmcgdG8gdGFrZSB0aGUgbG9j
ayBpZiBpdCdzIGJlZW4gZXh0ZXJuYWxseSBtb2RpZmllZCwKPiBidXQgaXQgd291bGQgZXF1YWxs
eSB3b3JrIHdpdGgganVzdCBhIHBsYWluIHRyeWxvY2sgKyB0ZXN0X3JjdS4KCk9rLCBnb2luZyB0
byBkbyB0aGlzIHRoZW4gZm9yIHRoZSBtZWFudGltZS4KCj4gQmV0dGVyIHlldCB3b3VsZCBiZSBh
dXRvcHJ1bmluZywgYnV0IHRoYXQgc3VnZ2VzdHMgYSBzbGlnaHRseSBkaWZmZXJlbnQKPiBkYXRh
IHN0cnVjdHVyZSBhbiByYnRyZWUgaW5zdGVhZCBvZiBhbiBhcnJheSBhbmQgc3BpbmxvY2tlZCBj
Yl9saXN0Cj4gbWFuaXB1bGF0aW9uIGluc3RlYWQgb2YgYSBwbGFpbiByZWZjb3VudC4KClllYWgs
IHRoYXQncyBleGFjdGx5IHdoYXQgSSdtIHdvcmtpbmcgb24gd2l0aCB0aGlzIHNlcmllcy4KClJl
Z2FyZHMsCkNocmlzdGlhbi4KCj4gLUNocmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
