Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015091C4E95
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6743A6E51D;
	Tue,  5 May 2020 06:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902096E434
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1588611486;
 bh=9yu6Koqp5kh2GqpJE2jIEtvtR3k1ocsgVchyI/5xi/0=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=k933aCWE9/HQwymsAt5vN7QOhkcRBVCyhXlN+iD1wpiu8p+T+PYALfQwCicSS27R2
 tcYJNlA4W6wjRN989pKyAzbt5Ngrqzu5v+Gxu8xo9QkDEGM97CoQKDma3htrEjSUMP
 EjI2PG6WXlQzzV+rxpqN9+wWCd4SpjZkPQcsLJQk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.152.69]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LylnX-1j2u3l1mTv-01644E; Mon, 04
 May 2020 18:58:06 +0200
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gem: Fix inconsistent IS_ERR and PTR_ERR
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <dfe752dc-6833-2b08-7e7c-6c52ffc81626@web.de>
Date: Mon, 4 May 2020 18:58:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:V7ZLoki0zw30xXuJHbKuYRHN/r2pN25QK+eWkWFJY1gkCecft4S
 jirT2hs4ZPfMjaM0OmDtx4LX5iOHPotiZWDC1rEKehRp8iFDK5aw7gN5aQT9kI6oz3fkZ8g
 HsLybDzSuEQhHVVEd/YXO0BKC7XPPphK1bll8ql10XO0VYUfM9bSPjIRI/wAouoAdTZss8h
 M0QbR9dLi0VoQEoijvv9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tRrN58lWQu0=:A4u/Tu+sMvbhE7L5nBiE79
 zvtjBRFNOTtJOJgE7TQ28EbEdu/2tUpK0X6BBv/CUq2BmyIckrRGh2qYzHCSh74NeToj87sAF
 LZnfADB3e/q3u36XaOrFli7/PK8aKjOKWNcZne6e+lsgBBI6C6IucM04trkhp0z08ChgVu71h
 hHISpbhlP9hV6HnhLQY1Zs0DDIpq2nwCPyZ2yfoiwZCtHUJcNhWEmZR71q8Erm1tnTQ3I+3S5
 62LAdg19BLgVV3WSljBSjtJmEmUoGJLvpzqMwZDvtedRo+LgPIGU3D2wqTYNCDsgQXct8vJ5E
 MVRR8xMYdVtWWpg4ZehELxnTo48lU85y9jxCdNtdbsacrSCBX9f8qw7RLnPGJkEBr0/Xy+fYX
 1mpIiZOSxVj6678lWPP7O+Aqz7Xj8XQxZzRkN/5UeUWpGbMFJ3yTFi+6dqtTffZofIxpBn1lA
 Lr6S5f8N8Ki+7F43ZdCfWDxLPZYc3VAhoxz8m/OrIWINK14L9dovLLRvFesmsg5vr3PIOrUTS
 JMlal8hQ33/v4EEvyVC/n6vg/H57BJy6K2qJxw3J8iqZf7h86IwYdpZkcHBzyQTIYmuC2nFg0
 1kqZ508lviGRHJhbGCkqHjWj54vA+S8LzyDGG/knfp2yHDpnOnB1i3W/0fDXF1jcEvA9zTcA8
 sv2bSiyDxJgxGaAbWkKl4Lr15t4oaWWr2d50HBxiz7P+qHaswXU03R0pxzXgKu3l2vBRe875n
 K7zx1Qld5kYB2dfpFWo7YzGYrDlQMaOBTed4wDLdHeaS/n6M3tlrhNBazFhsfH6sBOhehdbO7
 Yt1vhA35BVWo2py8o3p236JRc217QmzqnkYkt8CdDt2pos9boP0S4P4Ea39L9UG+KRLGnhve5
 VhM1LAa4IPsEGw63GYQsN8dcXBURlOPrtSXanBKiBYdImA5pgfpul9+lZYZjj7Lw2YW4HhNV0
 neJSRRkAkVzqrKH+fg7OkMrokUFyOYI+Zi1W6zwH2JTFZ7keT15TWjSL4IywWCSwuUlkY7TS0
 yiqJSE5v1uJk5E7VtxnhTNT25BsftfLPYRrM/KH7IGBlQjFTdBGYuuTbtiFTiD5QlII1i329v
 P5qnWMnvMBXzxI5UVeTWWMNJW1l0zhJQnEU3cxLYTFWpgg96d/jXLMSj31D3gIBMFWILLQv9T
 4LGGJNTUlMqCATiqupWESPwHXAQ6RWtlZDfpg8bx/mUG7HZmMFDTkOnG0w6YmS2himOHaQ+TW
 jG7eEp3VKLOkhhLV3
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4oCmCj4gVGhlIHByb3BlciBwb2ludGVyIHRvIGJlIHBhc3NlZCBhcyBhcmd1bWVudCBpcyBjZS4K
Pgo+IFRoaXMgYnVnIHdhcyBkZXRlY3RlZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUuCgpN
eSBzb2Z0d2FyZSBkZXZlbG9wbWVudCBhdHRlbnRpb24gd2FzIGNhdWdodCBhbHNvIGJ5IHlvdXIg
Y29tbWl0IG1lc3NhZ2UuCgoK4oCmCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2V4ZWNidWZmZXIuYwo+IEBAIC0xMzI1LDcgKzEzMjUsNyBAQCBzdGF0aWMgaW50IF9f
cmVsb2NfZ3B1X2FsbG9jKHN0cnVjdCBpOTE1X2V4ZWNidWZmZXIgKmViLAo+Cj4gIAkJY2UgPSBp
bnRlbF9jb250ZXh0X2NyZWF0ZShlbmdpbmUpOwo+ICAJCWlmIChJU19FUlIoY2UpKSB7Cj4gLQkJ
CWVyciA9IFBUUl9FUlIocnEpOwo+ICsJCQllcnIgPSBQVFJfRVJSKGNlKTsKPiAgCQkJZ290byBl
cnJfdW5waW47Cj4gIAkJfQo+CgpBcmUgeW91IGxvb2tpbmcgZm9yIGFueSBtb3JlIHF1ZXN0aW9u
YWJsZSBpZGVudGlmaWVyIChvciBleHByZXNzaW9uKSBjb21iaW5hdGlvbnMKYWxzbyBhdCBvdGhl
ciBwbGFjZXMgYnkgdGhlIG1lYW5zIG9mIGFkdmFuY2VkIHNvdXJjZSBjb2RlIGFuYWx5c2lzPwoK
UmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
