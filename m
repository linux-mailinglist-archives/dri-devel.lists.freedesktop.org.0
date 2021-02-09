Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF855315042
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93626EB1A;
	Tue,  9 Feb 2021 13:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774E56EB19
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:34:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s3so23580776edi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6S9TuXuju4IHVWMtpEUOBazmP7ow4VFWVuBpQNE9jvQ=;
 b=gQRsL/st8sxB9tinHt9M8dEWZJjFp3gnlUGen2QNnLVcthF7DR6nRQH2RBTmj9iIJo
 Fa/T32/VwaZqxGw1P8zJ141/3ns3WzIcVIQmBEk3cZ15YFriwqCh21vczsbOqVVfxs5+
 EMm+GaES9mz7enlFri6m83nsXGZMV4F4qbw64UQINbLL1i+l7TmbrVZa4WDpamFiIrAN
 c2ceYmhrOAVKr86YBTXNsXpXWDk6S8cO7aT4oeVEhpUEogq1ZJceL0GEzk0cawRcpYPq
 uJlBny5qsGoRzrtz5cuwv9eNxgu8TUaqYDUc3gsUqpC3cyDcIJCN3hHysktVagL95Mf1
 vbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6S9TuXuju4IHVWMtpEUOBazmP7ow4VFWVuBpQNE9jvQ=;
 b=jbqsiNLy7F3Vz1W3T4KNtRja/Khrr8RDvcxJHkRx0FGLbx787RIObJhL2rMmncSYyR
 d1ZFTRpMU9YlXdHRTPTEq/LPbCJLvBkfJYH3qLzcEmcXHkt2dr0C9MZbF6WhwKFiz1eK
 GbPF18OUtfcJAJhsvL37UNSxBooi5robhcfv3QbSNUR+qXrWdPx2lbBBDJaafa8OWFr/
 WmBdpf70X28vrTRBtM+ItiJ0rBoPks4Nj77spA/HRWuCnmflYTM4RObmxRxpANf3r8FB
 4YvDxJ4aDe4muz5NLAGin6CToxLnqScnS2OEz0UZSmEbYzTE9GdbYh2NXrSYhk6yJIGn
 6tcA==
X-Gm-Message-State: AOAM533Aj51zljGdvXp0dGawnwXMrmNV2+6y8Uz0xgQfAcnYqqesvgjh
 bwmSVwiNugVmdtS0w0tK44GXg1U+K0zrFQ==
X-Google-Smtp-Source: ABdhPJxAlcgAOwKmy9BONYG3hpi84PttMEdkv0M4KPuNz6gSf0KVSDqfW3ouWWkkdyKCU1yS063KNg==
X-Received: by 2002:a50:d90a:: with SMTP id t10mr23648234edj.162.1612877674084; 
 Tue, 09 Feb 2021 05:34:34 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493?
 ([2a02:908:1252:fb60:444c:9a67:948b:2493])
 by smtp.gmail.com with ESMTPSA id u27sm7341193edi.79.2021.02.09.05.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 05:34:33 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: fix removal of bo_count sysfs file
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210209131756.24650-1-christian.koenig@amd.com>
 <CAKMK7uFfRsjEXgsobocJvYE7iPqLLKtiyyCFk749t2=8s2vrCw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <81a4da3e-00dc-9340-018c-1bfb87744b3c@gmail.com>
Date: Tue, 9 Feb 2021 14:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFfRsjEXgsobocJvYE7iPqLLKtiyyCFk749t2=8s2vrCw@mail.gmail.com>
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
Cc: Nirmoy <nirmodas@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwOS4wMi4yMSB1bSAxNDozMiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gVHVlLCBG
ZWIgOSwgMjAyMSBhdCAyOjE4IFBNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBPbmx5IGEgem9tYmllIGxlZnRvdmVyIGZyb20g
cmViYXNpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPj4gRml4ZXM6IDM3NjNkNjM1ZGVhYSAoImRybS90dG06IGFkZCBk
ZWJ1Z2ZzIGRpcmVjdG9yeSB2MiIpCj4gTXkgZHJtLW1pc2MtbmV4dCBzdGlsbCB1c2VzIHRoaXMg
aW4gcGxhY2VzLAoKSHVpPyBXaGVyZT8KCj4gICBpcyB0aGlzIGp1c3QgZmFsbG91dCBmcm9tCj4g
dGhlIG1vdmUgb2YgdGhlIHN5c2ZzIGZpbGVzIGludG8gdm13Z2Z4PyBZb3VyIEZpeGVzOiBsaW5l
IGhlcmUKPiBjb25mdXNlcyBtZSBhIGxvdCwgYW5kIG9uIHRoZSBjdXJyZW50IGJhc2VsaW5lIEkg
ZG9uJ3QgdGhpbmsgdGhpcwo+IGFwcGxpZXMgLi4uCgpBcyBmYXIgYXMgSSBjYW4gc2VlIHRoaXMg
d2FzIGp1c3QgYW4gZXJyb3IgZHVyaW5nIHJlYmFzaW5nLgoKQ29tbWl0IDM3NjNkNjM1ZGVhYSAo
ImRybS90dG06IGFkZCBkZWJ1Z2ZzIGRpcmVjdG9yeSB2MiIpIHJlbW92ZWQgdGhlIAprb2JqLCBi
dXQgd2hpbGUgcmViYXNpbmcgdGhlIHR0bV9kZXZpY2UgcmVuYW1lIEkgYWNjaWRlbnRhbGx5IGJy
b3VnaHQgaXQgCmJhY2suCgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKPgo+PiAtLS0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYyB8IDIgLS0KPj4gICBpbmNsdWRlL2RybS90dG0v
dHRtX2RldmljZS5oICAgICB8IDEgLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMKPj4gaW5kZXggYWMwOTAzYzllNjBhLi44
YmI2MWRkMjY0MzcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Rldmlj
ZS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5jCj4+IEBAIC00OSw4
ICs0OSw2IEBAIHN0YXRpYyB2b2lkIHR0bV9nbG9iYWxfcmVsZWFzZSh2b2lkKQo+PiAgICAgICAg
ICBpZiAoLS10dG1fZ2xvYl91c2VfY291bnQgPiAwKQo+PiAgICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+Pgo+PiAtICAgICAgIGtvYmplY3RfZGVsKCZnbG9iLT5rb2JqKTsKPj4gLSAgICAgICBr
b2JqZWN0X3B1dCgmZ2xvYi0+a29iaik7Cj4+ICAgICAgICAgIHR0bV9tZW1fZ2xvYmFsX3JlbGVh
c2UoJnR0bV9tZW1fZ2xvYik7Cj4+ICAgICAgICAgIF9fZnJlZV9wYWdlKGdsb2ItPmR1bW15X3Jl
YWRfcGFnZSk7Cj4+ICAgICAgICAgIG1lbXNldChnbG9iLCAwLCBzaXplb2YoKmdsb2IpKTsKPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmggYi9pbmNsdWRlL2RybS90
dG0vdHRtX2RldmljZS5oCj4+IGluZGV4IDdiYzhiYjc5NzE2MS4uMDM1YmJjMDQ0YTNiIDEwMDY0
NAo+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oCj4+ICsrKyBiL2luY2x1ZGUv
ZHJtL3R0bS90dG1fZGV2aWNlLmgKPj4gQEAgLTU1LDcgKzU1LDYgQEAgZXh0ZXJuIHN0cnVjdCB0
dG1fZ2xvYmFsIHsKPj4gICAgICAgICAgICogQ29uc3RhbnQgYWZ0ZXIgaW5pdC4KPj4gICAgICAg
ICAgICovCj4+Cj4+IC0gICAgICAgc3RydWN0IGtvYmplY3Qga29iajsKPj4gICAgICAgICAgc3Ry
dWN0IHBhZ2UgKmR1bW15X3JlYWRfcGFnZTsKPj4gICAgICAgICAgc3BpbmxvY2tfdCBscnVfbG9j
azsKPj4KPj4gLS0KPj4gMi4yNS4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
