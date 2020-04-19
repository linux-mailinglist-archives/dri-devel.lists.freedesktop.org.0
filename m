Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE11B01E6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16696E1BC;
	Mon, 20 Apr 2020 06:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4926C6E42D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 08:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587284137;
 bh=nbpEpWlUW5cjEh1Bv3rGfJegbOGcwEJbutmkmwuZLD4=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=NR+b7snKh2E/IXWwhTPo7o0EaNqH/eJLmLx8sRCDOpGpFun8RvA96KrPki+uP/eGv
 jjZ6F5jkXrdtfZGdWVY3XYcOSc8KMPtB2vlEHl3iW10gRMM4B3GYgLXFgZUEt4gTtR
 HkpaMwhGjerUWSfwXRl7gY++IRwcmH9G2jTrn5WM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.85.208]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfAoO-1itGOO45FY-00oo64; Sun, 19
 Apr 2020 10:15:37 +0200
To: Bernard Zhao <bernard@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, =?UTF-8?Q?Felix_K=c3=bchling?=
 <Felix.Kuehling@amd.com>, =?UTF-8?Q?Nicolai_H=c3=a4hnle?=
 <nicolai.haehnle@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Philip Yang <Philip.Yang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Remove an unnecessary null pointer check in
 amdgpu_cs_bo_handles_chunk()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1d0f1eb5-a26f-1739-9222-a39c92ba3024@web.de>
Date: Sun, 19 Apr 2020 10:15:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:wOtp743KJHdMhl10cI6KVRBvss4Fdnb4/BtUFoR9+59x1tK3riY
 mY6nRjszPurBY7UT9LC0WtAwprPBVPF43VElnd8IyX9/aHVMvsuW5B8VAct0H5cO1SH0ajN
 gPSE9DjWrmG19bN+HGYDFczDz44gBXB37NTTj2YHQXNcI7UeY8yANM4zSlvmFsdfSSXGevO
 XduzCkzdsNQO4jjmwBWCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H0vJH86n/Ek=:ZfbLufiwwWQhDor183GtVr
 G+BfaT3z6iB4ASMR78Ywbr4XRpOUuSxx0NN3GvndckjzrmSVNVNxWZuSF+pZiHec5q385tw6E
 23hhohC7h404kLRsGIGRrtlmapd1R03Mt4EPRt3emzTGWHBEt6E+AAX46grjCbD7+RRSWYtix
 GbVA5Wy5e1ZPO0Badk9+/nKssBrEbqEoGeIcCiUph3+YPsWYjWc6X6w6U4nYVOtNTUW4gKAan
 cl+xR6Fm0iusIgQtq/UW4fmlprSFU1wpk/w2lZd+DbFLdgLwboAG+0PUXSypK/fY2pimSfwDB
 VCuu8SvblgjmNPMZGC4rYQ1wKXae3gyAF9+a4W4oEl6SLGXalFZWUtbJvmGsDoPTyZEiTbBU8
 VWU3EcSei/qWgHeP0TCBbBHIZPTie7ukEQNPDY3hjJ5UnxfCJ5QnrianYuAKC+Z0+wzb/FlzE
 iL08cvODSeggwA7ToO8ZP2hJ1+78AvgipNKEscV5Fl1RmsgBu0DZzycWgOkx8nXFs7GkQ+zTD
 w77DTqi5qiGLTjLuKeehZ8/bfpGkARbAFzGGoMMmo+pGIjVHdv5b+5cj7eNMjOeLoC4z/+w4y
 EUmZjEU+Ghj/OoXdX62P6PtZZtJ0XNDtdCTWQSKcxVuJ1CNRm7CnJkFY4FkNeLHA3i2bAO9ta
 idDsFnjZnlb1atl3k1nzn+Pt51n5opyw+8sboWd2DBMZtzdy0Kcclw/4Bj+6DA7FXAF0ksEF7
 cTGxDQrfFjW1KFkqi3PYmyYEoUnHlVi33z8JsIxXq0B+Ua8+lU0KI9t5qdPbdgqXPUG0ThyCK
 KCPkdX6nybZf8zC2TiU50ckoIvmHT0Qu4DRVSN2BNi90BPVRXtBphD+e+MnHDjCied2HraJfq
 fE/lKZaUSSPGiqUxKt1uDzRSUbH1FgX+rPh5EkuZpzEERzr13UEV7qT4BFziRG/u7obHc8CJ/
 Be/Y5H2OBuGu2hFZ4b2eoY8ZfhzZ77SM+EbOYVEvd/yF8QTAMTLr4Ylvomnk+9mZfMHPKfuPF
 BNbW0IKOxuNi4mTGGXCkPfj/YEoIOl6u3bG7vN+X3frxbuJLX4OrZ8juDvbC1XgR3Mscu300G
 zVF5f+G65OkCi+aWxBI8kGJpNnaLB6tgeWYOICWLi34H9DWtq8gLhWVXMO4lON6lgf3BLWeJL
 VpL+Wtnt9J59+eBNIpOU6shaegL7TnrMKO+aFJMinavCmgPind4QPPEmCyd6KYsj8rVmTLfr7
 nqfmOmqkhGHXhJGMZ
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, opensource.kernel@vivo.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBrdmZyZWUgZW5zdXJlIHRoYXQgdGhlIG51bGwgcG9pbnRlciB3aWxsIGRvIG5vdGhpbmcuCgpJ
IHN1Z2dlc3QgdG8gaW1wcm92ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCldvdWxkIHlvdSBsaWtlIHRv
IGFkanVzdCB0aGUgcGF0Y2ggc3ViamVjdD8KCkFyZSB5b3UgbG9va2luZyBmb3IgZnVydGhlciBx
dWVzdGlvbmFibGUgY29uZGl0aW9uIGNoZWNrcz8KCgrigKYKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+IEBAIC05OCw4ICs5OCw3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2NzX2JvX2hhbmRsZXNfY2h1bmsoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCuKA
pgo+ICsJa3ZmcmVlKGluZm8pOwo+Cj4gIAlyZXR1cm4gcjsKPiAgfQoKSG93IGRvIHlvdSB0aGlu
ayBhYm91dCB0byBvbWl0IGEgYmxhbmsgbGluZSBiZWhpbmQgdGhlIGZ1bmN0aW9uIGNhbGwKYXQg
dGhpcyBzb3VyY2UgY29kZSBwbGFjZT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
