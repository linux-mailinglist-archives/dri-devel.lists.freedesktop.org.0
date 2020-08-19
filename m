Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22C24AFA5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEA16E8DD;
	Thu, 20 Aug 2020 07:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Wed, 19 Aug 2020 16:23:45 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3E26E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1597854223;
 bh=ePXxSHBGEFyDf1se6+3rpGyGIplFqbsLrAhXaGgdhTw=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=R9NG3CBiN+U5emygTP8h/vlJXxnNUqxMLxbwjXz9yqvGkxrCUjGOAEK6p8aSgU+I4
 k+c5FDvfp4wrqBVbpfXR64iE/g9owyDXoum1W1N5sR9rFRhfj6LGyAfS9iYaa9aebS
 oVQpjnr3z1REiF4dq76zRUuPnKrYE+Rhlkqz+MjI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.132.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeDMb-1kgwrL00lb-00b1ms; Wed, 19
 Aug 2020 18:18:12 +0200
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference count
 imbalance on error
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
Date: Wed, 19 Aug 2020 18:18:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:8fkHmc20/qLYsJdWKU3b95DjoUB1fP5lRpnvgjJoZ9iVEYT8/am
 OHcYTBrqcYpGJ3zeZBc7xbpOk1zfazulxQJZAtcxBPUVJvyttl7WMqTNwCk+EosvnbHlhzV
 utfiQDuBy4vccacfOj/Xyx+mUz0SoFTJjsz4U2daZS6WEGbfPDevkv+HPT8MOngNGBd0CRk
 7qOVEzQZNUiiUWr8pHsiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:v//dPqE8TcU=:jp2tXQ/8XsnG/gVcCAfy1K
 etR3Sgze1Lp+M//OQWWwECXtHERZRC42n++4K9RWk6oGWEynhhw7TAJKyyHdzRD3Ye9dbggOc
 YqOWn5t5FM7weuus/uyKfa2KwlZPS9kp2dwgkL2fkFbu54PHIVgJksO/c5AsjLPRA9ssLbBM/
 F5tqe+Gpy1WLefQiCEWksyK8rcr0W4aT9oVGwOZDTKN8zwwGmak3mX+eOeZ5NBgxJE3xp+nTk
 RCuHFrA9TfRa6g24TIcyQKvX0QEvAHN9bGgVYN0HegqJFWqVyO8Cbkao+haMqKlroE81XJNgF
 O7ev28nIHJ4pyXSiNfBZe8O4xAPYqoAWptXA+ihEL3Gi6GkoyhdPZs/8MZcZs5My1sCAu6tHa
 n4mvsrqlWN5XyWKVl19k4TgkRfN6r8wIV0HeRrqBIEk/3TgGZhmO94tuX2hg1fHzRbrHCH/DC
 EcgWEYJZxFzkWyVZ9HE6idd7gjxkQ604lL6yIS+YRGop/kWsn+3MhN5Mvh1O+Z2MJ2MCM3ukV
 0PB/Aowl4qQGG4WktciUY7I3asFXK28ganBjpTAW72fGRhXjqpZMBAialwZB1A4IB2c3NrpKN
 6yQ2GHPu5t9L+mwgjhlIofixTkhe2M34bwVTk6twIWEOyjaRPK0Z4fcEjQ2SI4hvqo72Dr8U7
 jfcQ1RMwdDvlGMR4jYmiqoOgyV9CUzleWj/P6GTOwvF+pGDlpN+MDBMZVcbvAE2QVY2UhbNye
 jLS3XQtBJt4xQuoPCqqnfThSZ5AXTpAUc0/0eoFRUVMaBXrBF1ZduXTWTMJJquNkNTFpaNtXh
 7Dqb1n3xxFbl06WliSajR0p3iY+P4Jq/Ozq202o+FgaDZBL+i9Urcj0rbsisGcnspcQDVYjaf
 Zdjqr19Kx/3Tr/Ai4wjCgQvZsqfKzVJIF81Ev1i0KKU1nlI/rBGcv5MUdlaQLM7tvcsx6IqO+
 K+3TpWjBbP4hXaeH1ETO9yxQecYZYLrcczTOjakn60DbjEakErDWpjyYWX0/yu4djW1WhGLE6
 vT5HwBL+b9uYbY9mbb2IG/a0lmZVE9glyxm7Ez21Rva4oNbJh7DxJNNPOuhaXEjR99p8OkxpE
 qT1Fycsw41yasJuezRhPbkAUcze/Pmss/qyPpXtVdrf3rhylEDgwR7s8TRxAsKgZIyoGa1Xlo
 Klf7ppGYo2SekzysMnkfCQZyvZ6LYh4EsNZsAySlb3xd779J+jQuXFjEwpNJLPxovotc7VeZj
 EJpn0moKD61boVFYZFkt9uYMEYvVa2jjmsxt3ag==
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Bryan Wu <cooloney@gmail.com>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, linux-kernel@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBXaGVuIG9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KCkgcmV0dXJucyBhbiBlcnJvciBjb2Rl
LAo+IGEgcGFpcmluZyByZWZjb3VudCBkZWNyZW1lbnQgaXMgbmVlZGVkIHRvIGtlZXAgbnAncyBy
ZWZjb3VudCBiYWxhbmNlZC4KCkNhbiBhbm90aGVyIGltcGVyYXRpdmUgd29yZGluZyBiZSBoZWxw
ZnVsIGZvciB0aGUgY2hhbmdlIGRlc2NyaXB0aW9uPwpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0
aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9pZD0xODQ0NWJmNDA1Y2IzMzExMTdi
Yzk4NDI3YjFiYTZmMTI0MThhZDE3I24xNTEKCldvdWxkIGFuIG90aGVyIGNvbW1pdCBtZXNzYWdl
IGJlIGEgYml0IG5pY2VyPwoKCuKApgo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Nr
eTgxNDUyLWJhY2tsaWdodC5jCj4gQEAgLTIxNyw2ICsyMTcsNyBAQCBzdGF0aWMgc3RydWN0IHNr
eTgxNDUyX2JsX3BsYXRmb3JtX2RhdGEgKnNreTgxNDUyX2JsX3BhcnNlX2R0KAo+ICAJCQkJCW51
bV9lbnRyeSk7Cj4gIAkJaWYgKHJldCA8IDApIHsKPiAgCQkJZGV2X2VycihkZXYsICJsZWQtc291
cmNlcyBub2RlIGlzIGludmFsaWQuXG4iKTsKPiArCQkJb2Zfbm9kZV9wdXQobnApOwo+ICAJCQly
ZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiAgCQl9CgpJIHByb3Bvc2UgdG8gYWRkIHRoZSBqdW1w
IHRhcmdldCDigJxwdXRfbm9kZeKAnSBzbyB0aGF0IGEgYml0IG9mIGNvbW1vbiBleGNlcHRpb24K
aGFuZGxpbmcgY29kZSBjYW4gYmUgYmV0dGVyIHJldXNlZCBhdCB0aGUgZW5kIG9mIHRoaXMgZnVu
Y3Rpb24gaW1wbGVtZW50YXRpb24uCgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
