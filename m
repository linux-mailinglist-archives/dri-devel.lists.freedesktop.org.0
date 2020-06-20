Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D901203019
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB9C6E146;
	Mon, 22 Jun 2020 07:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595506E2C4;
 Sat, 20 Jun 2020 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592656651;
 bh=ITHlY66gl0MgNokIXLyjMVP7wGUV88CZWdzeFYFNWDg=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=OfgsR1c2Gf5nYREMdL+d5DG0NZyZ5cMfCJIfTWEng3TSedgUUQrhEHeHGNRT6b1Sy
 Fiz38wEQa2ya+tVbuPmoFaiWBs6Ipdj9VDIHkLpC6VMMPlmGARzSAA9Pxsyxx1UkCj
 shgnG7GXFNyMpFvcAMXlzzUAZ/lpCdppiBvhgL4U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.139.185]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MLy84-1jnkoQ4B4O-007kJV; Sat, 20
 Jun 2020 14:37:31 +0200
To: Bernard Zhao <bernard@vivo.com>, opensource.kernel@vivo.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/amd: Fix memory leak according to error branch
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <119b7d8c-b164-ef23-84cc-4904d34ac023@web.de>
Date: Sat, 20 Jun 2020 14:37:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:oXT06f42Q4s3s5cHYlyLWk4f54E74Wz+v/0QbzrhsHP/Fc3tgeP
 fhd7SZn4LgB+mYnBaOc4XleQyNGPw6lOhXzRcmHP4YzVXiCKG+0Ic4RSSxQcZPkI6B/svyp
 fLqoBPQC1lumHbcor85v41D5yphQ/Y2SWDe/4DO0242OjAfULRm10Pu8utW+FgoAJwKA3dH
 u0g6eRBnmES2U9Z1CYxVQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W3WUjaFUM4I=:+uEKHLiyIy9oBO/whHk1kq
 /6pNth6kxQ6Vrhd67ncOvX8c5Er4m4i0X1MWNXmwYcoggxq8DFL8Ln9uAufeVWKVrcFnNjBcd
 HnD/H1l8sdQw3BSVjVuY0ySa2NoPFUH4OXOioijgAIJwyYBPu12sR7TswBDf4NSfysm4bvIru
 l/7dZXR0lNKgqhbUgvQw0U39y29Y4HYqfLAx9/KOixFGpisSEWxT81coCLLFnGg+Q66s9s+J6
 A73E6GjbA76QsY6mq7uINUDM191wd0C8bRfwFyJ9sdqNRchg3ZLkPCg4AeVO0ujNm7Hf6IhL4
 2T5tTJc8nZFpl737rx3jkOomUzsFWEcser1j/ZnEf4O1jcN9ZqbTymL84EeiOaMFcF26t4hbB
 xpTFrxmD5XhQlc+gyKP+yGBXlPS69cOPzB6lx5uQZ3BOR1OxammVngO/5pg7U7fQ5cEQpd8N0
 C9BkxgFfQUEbjeKLBMWHWx1vjggZoDw8Xb4hCJcmtkipkQxX0zELYgSUlcK5YlqkaRsEg8WXI
 MjgauNLTF3W6otSlU6g7B2cmLtwG/BzCEGFFcnxvrUgI150aasI1wKmi+mol6J+mYqvR5VWPu
 uQuqv8I3KUQq0W5i1FcqiKgNHg+EO8AX+5/gUhEmR8E2spvsDjY5qWLREPRW0JTPEp/dd62uz
 9/pF96BO8PrjE4uteARArPgSfADaVj8Tn6A9ywZLNZ1imKzQCHnEhyoHfaLU5/Bz5iE6isKAN
 S3QtLr0WCoaWF9LmieegPoI3cIinCrO6FtcFLgF80PC9ngYv+sKqVP5fWoDPnX+lYXI8YId5N
 E842DmfUDtjXTmzOzXlZf0RsiJI/NnQDKHz+6roHDb9Ww/PoEWcvx3doOXFyfWBWwGB6CIEex
 uIfEW40xrBtrOJdJTtiQ9fXE9XZ0cLBt1gftIVhC/fYXd48RicuQyMlgKLkYokhBbfQkHoT+R
 WXFeKvb1LMn5QYj5Tc1BNV9cX77kcxTijbJZ9fE6HgRVCxElaIYbDCgIe5EBK/xdtk6MJa9p7
 NbWapq6wAURvv6Z5p3R/FkqOX8X3f34uLRqVB0ki0ngrapVhzl9+XFKedpgH4oavYqYhalxOZ
 qjV3Izdvbwu8F83KRmsjS7XZ2Zw4f5PT6B8qjgCKJntdl2Aff69a2yfcgkFsQgw875CzZZSkC
 6BMAEBp76Ot4AQb7BhZiQtwrtx1w2pgyIxM3pUm6HHgYbL2IvGmy/KMjX73G+snbWfo7Q36y1
 hRy7Cdyhf2fxp1PhR
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgZnVuY3Rpb24ga29iamVjdF9pbml0X2FuZF9hZGQgYWxsb2MgbWVtb3J5IGxpa2U6Cj4g
a29iamVjdF9pbml0X2FuZF9hZGQtPmtvYmplY3RfYWRkX3ZhcmctPmtvYmplY3Rfc2V0X25hbWVf
dmFyZ3MKPiAtPmt2YXNwcmludGZfY29uc3QtPmtzdHJkdXBfY29uc3QtPmtzdHJkdXAtPmttYWxs
b2NfdHJhY2tfY2FsbGVyCj4gLT5rbWFsbG9jX3NsYWIsIGluIGVyciBicmFuY2ggdGhpcyBtZW1v
cnkgbm90IGZyZWUuIElmIHVzZQo+IGttZW1sZWFrLCB0aGlzIHBhdGggbWF5YmUgY2F0Y2hlZC4K
PiBUaGVzZSBjaGFuZ2VzIGFyZSB0byBhZGQga29iamVjdF9wdXQgaW4ga29iamVjdF9pbml0X2Fu
ZF9hZGQKPiBmYWlsZWQgYnJhbmNoLCBmaXggcG90ZW50aWFsIG1lbWxlYWsuCuKApgo+IENoYW5n
ZXMgc2luY2UgVjI6Cj4gKnJlbW92ZSBkdXBsaWNhdGUga29iamVjdF9wdXQgaW4ga2ZkX3Byb2Nm
c19pbml0LgoKVW5kZXIgd2hpY2ggY2lyY3Vtc3RhbmNlcyBhcmUgZ29pbmcgdG8gaW1wcm92ZSB0
aGlzIGNoYW5nZSBkZXNjcmlwdGlvbiBhY2NvcmRpbmdseT8KCldvdWxkIHlvdSBsaWtlIHRvIGFk
ZCB0aGUgdGFnIOKAnEZpeGVz4oCdIHRvIHRoZSBjb21taXQgbWVzc2FnZT8KClJlZ2FyZHMsCk1h
cmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
