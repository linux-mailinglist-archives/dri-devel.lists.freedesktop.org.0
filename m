Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FC57CE9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA7D6E7EC;
	Thu, 27 Jun 2019 07:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F236E591
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 03:33:45 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h6so1599012ioh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 20:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XF+G4LWc6yTM0hyPsvbwF5/LSakqPeCeR1RaSYQ/rMM=;
 b=hCzeH7f5VRDkHZlHRKwG9kQ0/eVPj3TQm4iCSVikvgCVy1yqkL8WG0NFsAwq0dbfof
 FLxIJ5Zht9TzL8PFOcURy++Q+1qLaOtqVNt/1c5zFc5w9epdUgUizPwVLrrd8c1Ogrmu
 J4LQT56oG943SSlcNbC2beNIzf5lqaOvT8D/VwSRmHWHKb9BU7+euyuFbb5M35aSwpCw
 Jgs1n5+5NOUrbjWuYfLGcuLyiW74lLRxjAiMr38o0HdO7vbBQMhoALmk+MkbEb/++xp3
 IrkFStu3gl83EdgJOxRjEh4+dMoKVQ5vWz87Bqg8CACBCTq9WA0Zbh999/MCk507P45h
 zfGg==
X-Gm-Message-State: APjAAAWVPvaoI5gLXUAjZV1JSADe+xTfDDAdVlI5dKX47cBejFZZRRMx
 s4dEPms3aBTP8auXego9xROpaA==
X-Google-Smtp-Source: APXvYqzAo6yx8WGJzDGlrEkLktFBWHOfEKaDWfKHRUoRoNvEvVme1VLQk7Pg6XOU4F7VA7sj7lFcgA==
X-Received: by 2002:a5d:968b:: with SMTP id m11mr2069612ion.16.1561606424694; 
 Wed, 26 Jun 2019 20:33:44 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id c17sm778788ioo.82.2019.06.26.20.33.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 20:33:44 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees][PATCH v2] drm/amdkfd: Fix undefined
 behavior in bit shift
To: Jiunn Chang <c0d1n61at3@gmail.com>
References: <20190627010137.5612-3-c0d1n61at3@gmail.com>
 <20190627032532.18374-3-c0d1n61at3@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <59d3169d-4c74-4e75-7a48-93c0e99ae1f2@linuxfoundation.org>
Date: Wed, 26 Jun 2019 21:33:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627032532.18374-3-c0d1n61at3@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XF+G4LWc6yTM0hyPsvbwF5/LSakqPeCeR1RaSYQ/rMM=;
 b=Gtk/s27Nxe/bxqfxezqklb5PLo4t4BYzFBlEZXxwx5hLrBG8QMBJwhXV2kuiXyBl4G
 EPCP12KLE805t0XFmIbOyGfB8KAL0T0thPeyBaseCHIaQA4XpZ4EgVrkMrlHhDRMBihx
 SZeFnEfbuAlYUB1+NtR91+lfPpWqbXcxxeX/4=
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "skh >> Shuah Khan" <skhan@linuxfoundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNi8xOSA5OjI1IFBNLCBKaXVubiBDaGFuZyB3cm90ZToKPiBTaGlmdGluZyBzaWduZWQg
MzItYml0IHZhbHVlIGJ5IDMxIGJpdHMgaXMgdW5kZWZpbmVkLiAgQ2hhbmdpbmcgbW9zdAo+IHNp
Z25pZmljYW50IGJpdCB0byB1bnNpZ25lZC4KPiAKPiBDaGFuZ2VzIGluY2x1ZGVkIGluIHYyOgo+
ICAgIC0gdXNlIHN1YnN5c3RlbSBzcGVjaWZpYyBzdWJqZWN0IGxpbmVzCj4gICAgLSBDQyByZXF1
aXJlZCBtYWlsaW5nIGxpc3RzCj4gCj4gU2lnbmVkLW9mZi1ieTogSml1bm4gQ2hhbmcgPGMwZDFu
NjFhdDNAZ21haWwuY29tPgo+IC0tLQoKTW92ZSB2ZXJzaW9uIGNoYW5nZSBsaW5lcyBoZXJlLgoK
PiAgIGluY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmggYi9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3Rs
LmgKPiBpbmRleCBkYzA2N2VkMGI3MmQuLmFlNTY2OTI3MjMwMyAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgva2Zk
X2lvY3RsLmgKPiBAQCAtMzM5LDcgKzMzOSw3IEBAIHN0cnVjdCBrZmRfaW9jdGxfYWNxdWlyZV92
bV9hcmdzIHsKPiAgICNkZWZpbmUgS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfVVNFUlBUUgkJKDEg
PDwgMikKPiAgICNkZWZpbmUgS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfRE9PUkJFTEwJKDEgPDwg
MykKPiAgIC8qIEFsbG9jYXRpb24gZmxhZ3M6IGF0dHJpYnV0ZXMvYWNjZXNzIG9wdGlvbnMgKi8K
PiAtI2RlZmluZSBLRkRfSU9DX0FMTE9DX01FTV9GTEFHU19XUklUQUJMRQkoMSA8PCAzMSkKPiAr
I2RlZmluZSBLRkRfSU9DX0FMTE9DX01FTV9GTEFHU19XUklUQUJMRQkoMVUgPDwgMzEpCj4gICAj
ZGVmaW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFCTEUJKDEgPDwgMzApCj4gICAj
ZGVmaW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX1BVQkxJQwkJKDEgPDwgMjkpCj4gICAjZGVm
aW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX05PX1NVQlNUSVRVVEUJKDEgPDwgMjgpCj4gCgp0
aGFua3MsCi0tIFNodWFoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
