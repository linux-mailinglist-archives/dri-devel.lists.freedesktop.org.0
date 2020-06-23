Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC82052E6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 14:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275106E3BC;
	Tue, 23 Jun 2020 12:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253D76E3BC;
 Tue, 23 Jun 2020 12:55:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so20431728wru.0;
 Tue, 23 Jun 2020 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rR1IBoPSSiuXgf6u6n+6G7s0w7sEUX31EZ8zjE+iPww=;
 b=g2dV11gnCDGO5gwnNJl4dE55nTerxQuvjULjEW20qfxNjV/BaanHAZz/9kPl/z2BwG
 aRB6eQjdPL/wCLUeYfq3t2/TDX1dlCpVMxzqqcXB89w+6rSw/2dRtI2AgR4eED5Vrrig
 iSgN/4ixAiLpTpvqHCDG7XnxcEoksY5ViQ6lGfYxbNGaWNRKUGgFz+nYigUyrqjlorbn
 pTP0rwKzr2bmGvdxKkCP96l+tofVjSmrufencGFXGBB2AjmtPg/Of/UuwTnmH1mZl/r6
 tm3RyqkR/ADyMAViFwaECN3FVji/xAJIKh1AwvmnxpcFrztsruVwhsPv8xkL0f9XtZ9J
 ZKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rR1IBoPSSiuXgf6u6n+6G7s0w7sEUX31EZ8zjE+iPww=;
 b=CSLGoi6derfjq/5B8fzaszOKqKLeoh+oroM0CeygjMgkQ+E9fSkefTIVngnI1wqteP
 18LeXEcT76pKg5N2AzpXajoEmfFm0x3VEkzNwYw7fqsMIsiiahhnYRGn8US41Bklz5NT
 FdxJ4rYXS4tCKMPbU2ynVdZakHRVvPw3ZKaoNixMqDnB81ATSaS6Jwj1fQD6epOISoBi
 LWt1fMlj5ViJva/Nve1KSjeEUhjtEXBpAn4GoCnGWliFYy4T4ppYIpDKzJT5P4X7VZ14
 t03BVP85C/AmIIxbM12L2Y7+isrYuDg+YT+VruaHGsfTtyaLip/Mq2k7IEdf4gjgdNde
 pCfQ==
X-Gm-Message-State: AOAM5338JC6rVJUJ0Wr/drYhhPLS4t7Y/n3OP2xCgerP6lQTAv6/UtNy
 zZsFIuhI6yyGLFlYG5o9Q8s=
X-Google-Smtp-Source: ABdhPJxLlGLBgzpvcduNeKtoNfjRwm1aXuQ5t7Tr2U6hN3BhI17YZJZwWSz5sxVDIAAfYUzl2pag/A==
X-Received: by 2002:a5d:6b83:: with SMTP id n3mr25263657wrx.395.1592916953770; 
 Tue, 23 Jun 2020 05:55:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a4sm13896591wrg.80.2020.06.23.05.55.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jun 2020 05:55:53 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] drm/ttm: Add unampping of the entire device
 address space
To: Daniel Vetter <daniel@ffwll.ch>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094502.GB20149@phenom.ffwll.local>
 <3a365581-0f00-32de-6656-77348dcd0ea2@amd.com>
 <20200623102551.GL20149@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <60bbb42a-8153-eaca-07f4-95bf3bb779f1@gmail.com>
Date: Tue, 23 Jun 2020 14:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200623102551.GL20149@phenom.ffwll.local>
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDYuMjAgdW0gMTI6MjUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgSnVu
IDIzLCAyMDIwIGF0IDAxOjAwOjAyQU0gLTA0MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+
PiBPbiA2LzIyLzIwIDU6NDUgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+PiBPbiBTdW4sIEp1
biAyMSwgMjAyMCBhdCAwMjowMzowM0FNIC0wNDAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToK
Pj4+PiBIZWxwZXIgZnVuY3Rpb24gdG8gYmUgdXNlZCB0byBpbnZhbGlkYXRlIGFsbCBCT3MgQ1BV
IG1hcHBpbmdzCj4+Pj4gb25jZSBkZXZpY2UgaXMgcmVtb3ZlZC4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4g
VGhpcyBzZWVtcyB0byBiZSBtaXNzaW5nIHRoZSBjb2RlIHRvIGludmFsaWRhdGUgYWxsIHRoZSBk
bWEtYnVmIG1tYXBzPwo+Pj4KPj4+IFByb2JhYmx5IG5lZWRzIG1vcmUgdGVzdGNhc2VzIGlmIHlv
dSdyZSBub3QgeWV0IGNhdGNoaW5nIHRoaXMuIE9yIGFtIEkKPj4+IG1pc3Npbmcgc29tZXRoaW5n
LCBhbmQgd2UncmUgZXhjaGFuZ2luZyB0aGUgdGhlIGFkZHJlc3Mgc3BhY2UgYWxzbyBmb3IKPj4+
IGRtYS1idWY/Cj4+PiAtRGFuaWVsCj4+Cj4+IElNSE8gdGhlIGRldmljZSBhZGRyZXNzIHNwYWNl
IGluY2x1ZGVzIGFsbCB1c2VyIGNsaWVudHMgaGF2aW5nIGEgQ1BVIHZpZXcgb2YKPj4gdGhlIEJP
IGVpdGhlciBmcm9tIGRpcmVjdCBtYXBwaW5nIHRob3VnaCBkcm0gZmlsZSBvciBiecKgIG1hcHBp
bmcgdGhyb3VnaAo+PiBpbXBvcnRlZCBCTydzIEZELgo+IFVoIHRoaXMgaXMgYWxsIHZlcnkgY29u
ZnVzaW5nIGFuZCB2ZXJ5IG11Y2ggbWlkbGF5ZXIteSB0aGFua3MgdG8gdHRtLgo+Cj4gSSB0aGlu
ayBhIG11Y2ggYmV0dGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGhhdmUgYSBjb3JlIGdlbSBoZWxw
ZXIgZm9yCj4gdGhpcyAod2VsbCBub3QgZXZlbiBnZW0gcmVhbGx5LCB0aGlzIGlzIGNvcmUgZHJt
KSwgd2hpY2ggZGlyZWN0bHkgdXNlcwo+IGRybV9kZXZpY2UtPmFub25faW5vZGUtPmlfbWFwcGlu
Zy4KPgo+IFRoZW4KPiBhKSBpdCBjbGVhcmx5IG1hdGNoZXMgd2hhdCBkcm1fcHJpbWUuYyBkb2Vz
IG9uIGV4cG9ydAo+IGIpIGNhbiBiZSByZXVzZWQgYWNyb3NzIGFsbCBkcml2ZXJzLCBub3QganVz
dCB0dG0KPgo+IFNvIG11Y2ggYmV0dGVyLgo+Cj4gV2hhdCdzIG1vcmUsIHdlIGNvdWxkIHRoZW4g
dmVyeSBlYXNpbHkgbWFrZSB0aGUgZ2VuZXJpYwo+IGRybV9kZXZfdW5wbHVnX2FuZF91bm1hcCBo
ZWxwZXIgSSd2ZSB0YWxrZWQgYWJvdXQgZm9yIHRoZSBhbWRncHUgcGF0Y2gsCj4gd2hpY2ggSSB0
aGluayB3b3VsZCBiZSByZWFsbHkgbmVhdCZwcmV0dHkuCgpHb29kIHBvaW50LCB0aGF0IGlzIGlu
ZGVlZCBhIHJhdGhlciBuaWNlIGlkZWEuCgpDaHJpc3RpYW4uCgo+Cj4gVGhvdWdodHM/Cj4gLURh
bmllbAo+Cj4+IEFuZHJleQo+Pgo+Pgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMgICAgfCA4ICsrKysrKy0tCj4+Pj4gICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaCB8IDcgKysrKysrKwo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+IGlu
ZGV4IGM1YjUxNmYuLjkyNmEzNjUgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+PiBA
QCAtMTc1MCwxMCArMTc1MCwxNCBAQCB2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8pCj4+Pj4gICAgCXR0bV9ib191bm1hcF92aXJ0dWFsX2xvY2tl
ZChibyk7Cj4+Pj4gICAgCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7Cj4+Pj4gICAgfQo+Pj4+IC0K
Pj4+PiAtCj4+Pj4gICAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fdW5tYXBfdmlydHVhbCk7Cj4+Pj4g
K3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZShzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldikKPj4+PiArewo+Pj4+ICsJdW5tYXBfbWFwcGluZ19yYW5nZShiZGV2LT5kZXZf
bWFwcGluZywgMCwgMCwgMSk7Cj4+Pj4gK30KPj4+PiArRVhQT1JUX1NZTUJPTCh0dG1fYm9fdW5t
YXBfdmlydHVhbF9hZGRyZXNzX3NwYWNlKTsKPj4+PiArCj4+Pj4gICAgaW50IHR0bV9ib193YWl0
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+Pj4gICAgCQlib29sIGludGVycnVwdGli
bGUsIGJvb2wgbm9fd2FpdCkKPj4+PiAgICB7Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+
Pj4gaW5kZXggYzllMGZkMC4uMzllYTQ0ZiAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oCj4+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2
ZXIuaAo+Pj4+IEBAIC02MDEsNiArNjAxLDEzIEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4+Pj4gICAgdm9pZCB0dG1fYm9fdW5tYXBfdmlydHVh
bChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsKPj4+PiAgICAvKioKPj4+PiArICogdHRt
X2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZQo+Pj4+ICsgKgo+Pj4+ICsgKiBAYmRldjog
dGVhciBkb3duIGFsbCB0aGUgdmlydHVhbCBtYXBwaW5ncyBmb3IgdGhpcyBkZXZpY2UKPj4+PiAr
ICovCj4+Pj4gK3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldik7Cj4+Pj4gKwo+Pj4+ICsvKioKPj4+PiAgICAgKiB0dG1fYm9f
dW5tYXBfdmlydHVhbAo+Pj4+ICAgICAqCj4+Pj4gICAgICogQGJvOiB0ZWFyIGRvd24gdGhlIHZp
cnR1YWwgbWFwcGluZ3MgZm9yIHRoaXMgQk8KPj4+PiAtLSAKPj4+PiAyLjcuNAo+Pj4+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
