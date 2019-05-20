Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB9123D39
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 18:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925668926E;
	Mon, 20 May 2019 16:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D3B8926E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 16:28:11 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p27so24803532eda.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=3TAoLRVcknBAN1CDMLOgd0qpJGH55GX0voZSdrhkTTo=;
 b=Xux0UBN5YZVnvsvo+OrfBHgMyV7jH46ps00QhwiRkTtFiouthH6jeMr0h+lWGmdUkP
 6SQFpKsdhusVgvfQOeAQTJ1Dej+IotuOTifw2+cH9D6VTRw3DMYoyqQJlPU1QGMUg7eA
 i+yU+dsNkMw3nLvi9GvSRfD8qPiWblE2xj6ED2tJ4B4Q3EOU4OCEFoIwfqUD08JgIMDE
 u5Ifw6McRaCCOiwqaDX6P/RcyiislOuJ9UwvK2oSfFfw2MPxK8ceM27S7JK33cHfY80v
 QEwDpGOM2DuJs/nFlpPNKjfgozg5GehObgmklBo1lmp/sX3Yvy4dLqbrafBUEKfHYtaV
 99Kw==
X-Gm-Message-State: APjAAAUZZ5yEDZlPTlG1wBss95armXdTrkzw9NUAIkbgMbkmfYNDwsH5
 bjkFGvORCuo45EkmPvB7A03xQg==
X-Google-Smtp-Source: APXvYqwSZ6r6BI9og6hE6k63QBHcefsIwO3oA7gFXQ5dFWDya4tJWv1QMXuDvQ1VsBO2WLjw7BQJ5Q==
X-Received: by 2002:a17:906:af57:: with SMTP id
 ly23mr28429403ejb.98.1558369690157; 
 Mon, 20 May 2019 09:28:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u47sm5613329edm.86.2019.05.20.09.28.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 09:28:09 -0700 (PDT)
Date: Mon, 20 May 2019 18:28:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
Message-ID: <20190520162807.GE21222@phenom.ffwll.local>
Mail-Followup-To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 xiaolinkui <xiaolinkui@kylinos.cn>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
 <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=3TAoLRVcknBAN1CDMLOgd0qpJGH55GX0voZSdrhkTTo=;
 b=N2nmW2ws30FUiHTgoIIFpXZlTTKRRsCySLymCkEYYEFTN9Th0GQvagYaHPe7XaHWC/
 WysiWAiv4gRH+hAzjCKWKePUEOGGW5OsudN9iwQGugeG6GhPy/1OWu+gl3djhx6/PGy8
 ILLBKOFZEJo2LzLZxDGbHnJeE1VFbkRNwfwOU=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, xiaolinkui <xiaolinkui@kylinos.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NDQ6MzBQTSArMDAwMCwgUGFuLCBYaW5odWkgd3Jv
dGU6Cj4gSSBhbSBnb2luZyB0byBwdXQgbW9yZSBtZW1iZXJzIHdoaWNoIGFyZSBhbHNvIGFycmF5
IGFmdGVyIHRoaXMgc3RydWN0LAo+IG5vdCBvbmx5IG9ialtdLiAgTG9va3MgbGlrZSB0aGlzIHN0
cnVjdF9zaXplIGRpZCBub3QgaGVscCBvbiBtdWx0aXBsZQo+IGFycmF5IGNhc2UuIFRoYW5rcyBh
bnl3YXkuICBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKWW91IGNhbiB0aGVuIGFk
ZCB0aGVtIHVwLCBlLmcuIGttYWxsb2Moc3RydWN0X3NpemUoKStzdHJ1Y3Rfc2l6ZSgpLApHRlBf
S0VSTkVMKSwgc28gdGhpcyBwYXRjaCBoZXJlIHN0aWxsIGxvb2tzIGxpa2UgYSBnb29kIGlkZWEu
CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCkNo
ZWVycywgRGFuaWVsCgo+IEZyb206IHhpYW9saW5rdWkgPHhpYW9saW5rdWlAa3lsaW5vcy5jbj4K
PiBTZW50OiBGcmlkYXksIE1heSAxNywgMjAxOSA0OjQ2OjAwIFBNCj4gVG86IERldWNoZXIsIEFs
ZXhhbmRlcjsgS29lbmlnLCBDaHJpc3RpYW47IFpob3UsIERhdmlkKENodW5NaW5nKTsgYWlybGll
ZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBQYW4sIFhpbmh1aTsgUXVhbiwgRXZhbgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGlhb2xpbmt1aUBreWxpbm9z
LmNuCj4gU3ViamVjdDogW1BBVENIXSBncHU6IGRybTogdXNlIHN0cnVjdF9zaXplKCkgaW4ga21h
bGxvYygpCj4gCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+IAo+IFVzZSBzdHJ1Y3Rfc2l6
ZSgpIGhlbHBlciB0byBrZWVwIGNvZGUgc2ltcGxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IHhpYW9s
aW5rdWkgPHhpYW9saW5rdWlAa3lsaW5vcy5jbj4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMKPiBpbmRleCAyMmJkMjFlLi40NzE3YTY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IEBAIC0xMzc1LDggKzEzNzUsNyBAQCBpbnQgYW1kZ3B1
X3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgICAgICAgaWYgKGNvbikK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gCj4gLSAgICAgICBjb24gPSBrbWFsbG9jKHNp
emVvZihzdHJ1Y3QgYW1kZ3B1X3JhcykgKwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHNpemVv
ZihzdHJ1Y3QgcmFzX21hbmFnZXIpICogQU1ER1BVX1JBU19CTE9DS19DT1VOVCwKPiArICAgICAg
IGNvbiA9IGttYWxsb2Moc3RydWN0X3NpemUoY29uLCBvYmpzLCBBTURHUFVfUkFTX0JMT0NLX0NP
VU5UKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMfF9fR0ZQX1pFUk8pOwo+
ICAgICAgICAgaWYgKCFjb24pCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+IC0t
Cj4gMi43LjQKPiAKPiAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
