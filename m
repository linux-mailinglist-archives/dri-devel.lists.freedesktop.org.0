Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847413C27B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 14:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671B36E9D0;
	Wed, 15 Jan 2020 13:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49BD6E9D0;
 Wed, 15 Jan 2020 13:19:21 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id w9so2285186ybs.3;
 Wed, 15 Jan 2020 05:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=INCOtpe95Ws8JrYlw5UXXXuxsmjC1tIEmoEcKivXLvo=;
 b=IlWOO4FgjOZnmo2ei2RS7xnRxkLir4q4A36gh0fTihPxSoVR4AoNKAJ6t/Ep+H3PpN
 Hqcd7xEydzOf8PvkQ174Ehn/D5XkVj+nLxIYDN+6vupOuMrO9mY+6HolfgXbJl2Mbx75
 pMELxpmLpxFJ2rfJe0AbOdvx2HfOPg4KfWqhOixFrn3L+pmykUeFxq+X7zuidP3euh4H
 rKJ2b551iNX2gqXSOflk81Uqjw3CYtxAnKt+qpZrH/f0Oq/KFtDd5KlfWH3Ow8i+JUks
 cbD0WAEONXyxdYMT8fJyChp/4mmJsxsEx5FimuaIbkRoN3mOXHAjymbmLAQE2I/rHC/R
 Cnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=INCOtpe95Ws8JrYlw5UXXXuxsmjC1tIEmoEcKivXLvo=;
 b=DKJK3vDhauO7p4XRTcxZMMAMzl6NEoEb+dLwGn56m7iEbiGnjM6X8eTV7eZPFyU9rA
 SAvoMfhBiAAcjEqDVipKp2ZcbWhQdqQZpaG7plAFeEEq+6QZgaa1VXInt3kMZs45NPfX
 gxN1tMwywZpjKrSkJQxOYt5oiortJ4Q2UdjSWkRnzUmxVUjk2fIyHDcS529QLODnxxmJ
 E+en29ily//nJsedYHl9xGjJZErK1W0wS9gAL7z1x2RTzSs6nIi3OrW6wf7LPHYwneHj
 YWt0iIvOCW1o8jUB1H5At5D3IbXkxClk5ITRWpwpM0R56HGON10KANz46rI3YRbzjir+
 INOA==
X-Gm-Message-State: APjAAAVz9GApAxetbC/wwZGkX1rZmUVb5WtHCM0/FyVlUvqDP5JJJBvr
 tZ8ZCUVEs7LbAxYBlvZopRns/AUQ
X-Google-Smtp-Source: APXvYqwbKdSj7SJC122wz4HT/2jdFqmX96EGOOtkZk0QgMYoTjbq1HUmvGyoLsI7qaEQ+vyBsHI7FA==
X-Received: by 2002:a25:9888:: with SMTP id l8mr17982836ybo.204.1579094360843; 
 Wed, 15 Jan 2020 05:19:20 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y17sm8039760ywd.23.2020.01.15.05.19.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jan 2020 05:19:20 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: flush the fence on the bo after we
 individualize
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <SN6PR12MB2800D9829487F03471B416C787370@SN6PR12MB2800.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3df4af2c-aced-bb33-a485-7eb8cb7adcb1@gmail.com>
Date: Wed, 15 Jan 2020 14:19:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <SN6PR12MB2800D9829487F03471B416C787370@SN6PR12MB2800.namprd12.prod.outlook.com>
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDEuMjAgdW0gMDc6MjYgc2NocmllYiBQYW4sIFhpbmh1aToKPiBBcyB3ZSBtb3ZlIHRo
ZSB0dG1fYm9faW5kaXZpZHVhbGl6ZV9yZXN2KCkgdXB3YXJkcywgd2UgbmVlZCBmbHVzaCB0aGUK
PiBjb3BpZWQgZmVuY2UgdG9vLiBPdGhlcndpc2UgdGhlIGRyaXZlciBrZWVwcyB3YWl0aW5nIGZv
ciBmZW5jZS4KPgo+IHJ1biZLaWxsIGtmZHRlc3QsIHRoZW4gcGVyZiB0b3AuCj4KPiAgICAyNS41
MyUgIFt0dG1dICAgICAgICAgICAgICAgICAgICAgW2tdIHR0bV9ib19kZWxheWVkX2RlbGV0ZQo+
ICAgIDI0LjI5JSAgW2tlcm5lbF0gICAgICAgICAgICAgICAgICBba10gZG1hX3Jlc3ZfdGVzdF9z
aWduYWxlZF9yY3UKPiAgICAxOS43MiUgIFtrZXJuZWxdICAgICAgICAgICAgICAgICAgW2tdIHd3
X211dGV4X2xvY2sKPgo+IEZpeDogMzc4ZTJkNWIoImRybS90dG06IGZpeCB0dG1fYm9fY2xlYW51
cF9yZWZzX29yX3F1ZXVlIG9uY2UgbW9yZSIpCj4gU2lnbmVkLW9mZi1ieTogeGluaHVpIHBhbiA8
eGluaHVpLnBhbkBhbWQuY29tPgoKVGhhdCdzIGluZGVlZCBhIHJhdGhlciBuaWNlIGlkZWEuIFJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
SSdtIGdvaW5nIHRvIHBpY2sgdGhhdCB1cCBmb3IgaW5jbHVzaW9uIGluIGRybS1taXNjLW5leHQu
IFBsZWFzZSBzZW5kIApUVE0gcGF0Y2hlcyBhbHNvIHRvIHRoZSBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0IGluIHRoZSBmdXR1cmUuCgpDaHJpc3RpYW4uCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYyB8IDQgKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggOGQ5MWIwNDI4YWYx
Li4xNDk0YWViYjgxMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtNDk5LDggKzQ5OSwx
MCBAQCBzdGF0aWMgdm9pZCB0dG1fYm9fY2xlYW51cF9yZWZzX29yX3F1ZXVlKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8pCj4gICAKPiAgIAkJZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJl
c3YpOwo+ICAgCX0KPiAtCWlmIChiby0+YmFzZS5yZXN2ICE9ICZiby0+YmFzZS5fcmVzdikKPiAr
CWlmIChiby0+YmFzZS5yZXN2ICE9ICZiby0+YmFzZS5fcmVzdikgewo+ICsJCXR0bV9ib19mbHVz
aF9hbGxfZmVuY2VzKGJvKTsKPiAgIAkJZG1hX3Jlc3ZfdW5sb2NrKCZiby0+YmFzZS5fcmVzdik7
Cj4gKwl9Cj4gICAKPiAgIGVycm9yOgo+ICAgCWtyZWZfZ2V0KCZiby0+bGlzdF9rcmVmKTsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
