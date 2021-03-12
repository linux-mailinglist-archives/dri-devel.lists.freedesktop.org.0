Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC0338FFF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E642A6F5FA;
	Fri, 12 Mar 2021 14:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986F56F5FA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:28:02 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id m186so7750041qke.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NvxnhFRG1KOP0bkORJQ+PRpsWEaWA2s89QOEkjbnwOc=;
 b=A35jp1HD4H+rGS4qjw2KZ8/iYXcJP3xuugXgPokBjbPf4wQQRrqbGNsb8CxDC8zsY/
 Uza2NfIT9U+sKoX/OMj4025kxZTce0DKYn86RQsqcBR3fdjmHcSCwX1sr7tcwI3niA2F
 ItrWJhFkbrPc1HFEbJ6JVed1BYs+5UwxE3vUiKSdBRvpI1G6sh3BShW0IWwxAxp37Ppi
 2P/2cl/9bYN3cls+PlfisyTh0FxshlMLD12j+tLIOxMHzYqHgeVefWB5fN31ZH9ST94w
 ZloE85P4qm/QkHI/1DC3eyzWATwZga4BsRY3y4Ce25QwIuDY3rZx1JgUHDhQyh9VH6v/
 bugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NvxnhFRG1KOP0bkORJQ+PRpsWEaWA2s89QOEkjbnwOc=;
 b=dJ6kowVl87wOzJHSoIzfj+bXw5izA+8O6e14pw3OgRd+3iHMnNnaqAaVRWJMj/DIcB
 SpCiTGaWlF0aZ10c0Qd5QaD3AWVHCbjyEG8wuSkLyCUL/UiBL0zImUYMaa4QzHoBZjtV
 aHfXG0DJA8QJpBfLN7x5wMgtEUZNGHLVsPSwqgI6UcXNWO6O316Q+NMlbCzl4lzeHZ9Z
 KKwnMK6M0QKepSJPOSZlGtpCH2k6P0GjaXNYJmrQBk/D3CACPEcjO0WXdsewlI+Hq00A
 sudRqnSWQeNV0n1ZMsCW8fbSD3h610gvZ7e4awWWJX2dpGakRXEQUzNwL1ZEiLUexSts
 zkhw==
X-Gm-Message-State: AOAM5332C8/y3hNlJUr1ifMCL7IHZPCgCy1pKnL+a2dltZ7F8/xusw5E
 PTipfJA0zp0xgZBBrMsRd+vSf6Ikqqk=
X-Google-Smtp-Source: ABdhPJyt29Bb2J0GTxbdSW1TYJWvx+xSW8xW1Uhb1DgHB4q5+f7AMc2DkkzLQAYQQYfjt7LsS+EAuA==
X-Received: by 2002:a37:2cc3:: with SMTP id s186mr6983532qkh.270.1615559281682; 
 Fri, 12 Mar 2021 06:28:01 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:8238:34c0:2ed9:a97?
 ([2a02:908:1252:fb60:8238:34c0:2ed9:a97])
 by smtp.gmail.com with ESMTPSA id 90sm4014702qtc.86.2021.03.12.06.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 06:28:01 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: nuke the ih reentrant lock
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210312135906.3262-1-christian.koenig@amd.com>
 <YEt08RhEI23VPS4g@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e5ed96e2-8252-4a3a-593a-24551edaa1e8@gmail.com>
Date: Fri, 12 Mar 2021 15:27:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEt08RhEI23VPS4g@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMi4wMy4yMSB1bSAxNTowNCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gRnJpLCBN
YXIgMTIsIDIwMjEgYXQgMDI6NTk6MDZQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gSW50ZXJydXB0cyBvbiBhcmUgbm9uLXJlZW50cmFudCBvbiBsaW51eC4gVGhpcyBpcyBqdXN0
IGFuIGFuY2llbnQKPj4gbGVmdG92ZXIgZnJvbSByYWRlb24gd2hlcmUgaXJxIHByb2Nlc3Npbmcg
d2FzIGtpY2tlZCBvZiBmcm9tIGRpZmZlcmVudAo+PiBwbGFjZXMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBNYW4geW91
IHRyaWNrZWQgbWUgaW50byBncmVwcGluZyB0aGlzIG9uIHJhZGVvbiBhbmQgaXQgbG9va3MgaG9y
cmlibGUuCj4gYXRvbWljX3QgaXMgdW5vcmRlcmVkIGluIGxpbnV4LCBzbyB3aGF0ZXZlciB3YXMg
YnVpbHQgdGhlcmUgZm9yIHJhZGVvbgo+IGRvZXMgbm90IHdva3IgbGlrZSBhIGxvY2suIEl0J3Mg
bWlzc2luZyBhbGwgdGhlIGJhcnJpZXJzIGFmaXVpLiBHb29kCj4gcmlkZGFuY2UgYXQgbGVhc3Qg
Zm9yIGFtZGdwdS4KCkh1aT8gYXRvbWljX3hjaGcoKSBpcyBwZXJmZWN0bHkgb3JkZXJlZCBhcyBm
YXIgYXMgSSBrbm93LgoKSUlSQyBBbGV4IGFkZGVkIHRoaXMgZm9yIFI2MDAgYmVjYXVzZSB3ZSBo
YWQgYm9hcmRzIHdoZXJlIGludGVycnVwdHMgCndoZXJlIHNwb3JhZGljYWxseSBzd2FsbG93ZWQg
ZHVyaW5nIGRyaXZlciBzdGFydHVwIGFuZCB3ZSBoYWQgdG8ga2ljayBvZiAKcmluZyBidWZmZXIg
cHJvY2Vzc2luZyBtYW51YWxseS4KCkFueXdheSB3ZSBoYXZlIGEgZmVuY2UgcHJvY2Vzc2luZyBm
YWxsYmFjayB0aW1lciBpbiBhbWRncHUgaW5zdGVhZCBhbmQgCnRoYXQgc3R1ZmYgaXMgcHJvYmFi
bHkgdW51c2VkIG9uIGFueSBtb2Rlcm4gaGFyZHdhcmUuCgo+IFJldmlld2VkLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEg
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jICAgICB8IDUgLS0t
LS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWguaCAgICAgfCAxIC0K
Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4gaW5kZXggYTE1ZjFiNjA0NzMzLi44ODY2
MjVmYjQ2NGIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKPj4gQEAgLTMyODQsNyArMzI4NCw2IEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICAgCj4+ICAgCS8qIG11dGV4IGluaXRpYWxpemF0
aW9uIGFyZSBhbGwgZG9uZSBoZXJlIHNvIHdlCj4+ICAgCSAqIGNhbiByZWNhbGwgZnVuY3Rpb24g
d2l0aG91dCBoYXZpbmcgbG9ja2luZyBpc3N1ZXMgKi8KPj4gLQlhdG9taWNfc2V0KCZhZGV2LT5p
cnEuaWgubG9jaywgMCk7Cj4+ICAgCW11dGV4X2luaXQoJmFkZXYtPmZpcm13YXJlLm11dGV4KTsK
Pj4gICAJbXV0ZXhfaW5pdCgmYWRldi0+cG0ubXV0ZXgpOwo+PiAgIAltdXRleF9pbml0KCZhZGV2
LT5nZnguZ3B1X2Nsb2NrX211dGV4KTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9paC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2loLmMKPj4gaW5kZXggMTAyNDA2NWYxZjAzLi5mYWFhNmFhMmZhYWYgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCj4+IEBAIC0yMjgsMTAgKzIyOCw2IEBAIGlu
dCBhbWRncHVfaWhfcHJvY2VzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFt
ZGdwdV9paF9yaW5nICppaCkKPj4gICAJd3B0ciA9IGFtZGdwdV9paF9nZXRfd3B0cihhZGV2LCBp
aCk7Cj4+ICAgCj4+ICAgcmVzdGFydF9paDoKPj4gLQkvKiBpcyBzb21lYm9keSBlbHNlIGFscmVh
ZHkgcHJvY2Vzc2luZyBpcnFzPyAqLwo+PiAtCWlmIChhdG9taWNfeGNoZygmaWgtPmxvY2ssIDEp
KQo+PiAtCQlyZXR1cm4gSVJRX05PTkU7Cj4+IC0KPj4gICAJRFJNX0RFQlVHKCIlczogcnB0ciAl
ZCwgd3B0ciAlZFxuIiwgX19mdW5jX18sIGloLT5ycHRyLCB3cHRyKTsKPj4gICAKPj4gICAJLyog
T3JkZXIgcmVhZGluZyBvZiB3cHRyIHZzLiByZWFkaW5nIG9mIElIIHJpbmcgZGF0YSAqLwo+PiBA
QCAtMjQ0LDcgKzI0MCw2IEBAIGludCBhbWRncHVfaWhfcHJvY2VzcyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9paF9yaW5nICppaCkKPj4gICAKPj4gICAJYW1kZ3B1
X2loX3NldF9ycHRyKGFkZXYsIGloKTsKPj4gICAJd2FrZV91cF9hbGwoJmloLT53YWl0X3Byb2Nl
c3MpOwo+PiAtCWF0b21pY19zZXQoJmloLT5sb2NrLCAwKTsKPj4gICAKPj4gICAJLyogbWFrZSBz
dXJlIHdwdHIgaGFzbid0IGNoYW5nZWQgd2hpbGUgcHJvY2Vzc2luZyAqLwo+PiAgIAl3cHRyID0g
YW1kZ3B1X2loX2dldF93cHRyKGFkZXYsIGloKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2loLmgKPj4gaW5kZXggODdlYzZkMjBkYmUwLi4wNjQ5YjU5ODMwYTUgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5oCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5oCj4+IEBAIC02NCw3ICs2NCw2IEBA
IHN0cnVjdCBhbWRncHVfaWhfcmluZyB7Cj4+ICAgCj4+ICAgCWJvb2wgICAgICAgICAgICAgICAg
ICAgIGVuYWJsZWQ7Cj4+ICAgCXVuc2lnbmVkCQlycHRyOwo+PiAtCWF0b21pY190CQlsb2NrOwo+
PiAgIAlzdHJ1Y3QgYW1kZ3B1X2loX3JlZ3MJaWhfcmVnczsKPj4gICAKPj4gICAJLyogRm9yIHdh
aXRpbmcgb24gSUggcHJvY2Vzc2luZyBhdCBjaGVja3BvaW50LiAqLwo+PiAtLSAKPj4gMi4yNS4x
Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
