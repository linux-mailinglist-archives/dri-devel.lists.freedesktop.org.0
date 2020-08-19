Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937C24AFC5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11406E8E1;
	Thu, 20 Aug 2020 07:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3026E5BD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1597862035;
 bh=tqWA2/IKwvkNaI8t6D4YE6QPBVs2o9dwiMN5D0Kkzsg=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=fNLNdR1Hh5Ni4rjykmdtRhrhR8sNXjFGrVQyyLBETLTF2SCnjA8STAoPj0QJZaY6k
 H2NwFibUpVao6QMH8MVSWT8ze63h8zhdI8/LyjBrMp22Wn6oCRp4A8Vq255Fn6Ga1R
 ABZO9azsezBXCGH6yVPy7Ewl4+VeqQ1Vzk5zHbko=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.132.88]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M2MUi-1kyEcA3CB2-00sAMT; Wed, 19
 Aug 2020 20:33:54 +0200
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference count
 imbalance on error
To: Lee Jones <lee.jones@linaro.org>, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f188b16c-7a21-8789-27f7-4abaf7685424@web.de>
Date: Wed, 19 Aug 2020 20:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819165702.GC3248864@dell>
Content-Language: en-GB
X-Provags-ID: V03:K1:4brXjB6iKDv1bcMhn1/MckUo2ec/g/tYezutWT8POdyJGvWWOas
 oxeMkd7CCg36ARPoq8EY2+kaUNvrPKCZqwnc/wV5GzCG/Qt0TU210uDMydZavgceupMWL3F
 q+Q/0iqO+r2NZmiwVgKsCXlI3WhjtntAK+xtBYbWX5QQzYJ8jUWp7j6E7y2mkwTWRd46bWg
 edq9TOOLUqI64lGab2zdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:77f2i9skiI8=:e9rOYwuNDhsCCqS5ax+MgC
 KwPsWxCaV49CgLiEjQkprUI/fpfat+ZBQaZTG/q5RIAiI+IKBeg8J6E3/aJnXleR3eU2N7Zx0
 kmniLDq3sQmCIWrmTB00qLZDObXplrbN2lrsEu+ThSrd+8EMwG1SuD1E/IYFhLVoIQDlqB02i
 U3C/H+Nmq9tEPqVnGLAzNBTfGAY9aD/Ex/CcszWGMknm5Irun03hA1atPn7XlN2900JsmA28I
 jYk3GaVYcr5ihUkz1P+/KJWxJFiBWxlnSs++jtxfC6dGcvl47DAcFzSvngq75EjVggzcc1rM4
 Ek8GCOBW5nlfG5FM4UrfRH2JqJIccryTlUEOvVlG6oAH0c+jVbddvuap4b+RaTmRpGAPiLGey
 HtNG9TggM116CYdvzperi1XR9QE5wKSeHuMqR3XGM5I8v0CFkOLuNgsbEBEzq/CJqtlP9Ws0+
 +aOpT7t+0B87wD0Mpa0OvtfT35yeFyT09Tki1bophtzE/obZw8gl2ji+m1rRcRZTaG9X2/iiq
 shfTqmqcPuZUjagZYDPden9PI8nCO5CWWgUwNUY+knXUgd9Tq5LYxfTi0WAnj9oZSG/l7raw6
 +tULBTrr783FxOkKc/xMt2SO4oe8opZ2di0pdTV5FE+r4jT0Fa1JKmIu8Hzt2GpOJfjLr6bBm
 HO6pZUt7Ddh856sUKpIA/PQ9hEoD/EqfAdU+/CHf3Wf+z7oVFBjyrXNaJr77TsGqtGdYjvwa1
 OC+nCDyBzxhiMpH0GdkakIqd1XuE7YAAHgLrLIeNpOixTpbpglJLEEOs7Wp4duA7oo9NTbV1/
 ONpKpwY7fWmij3EEQrJB67G93dqfUAIVDwd/VMAmQP+WLhSGNB3/ByoQsJIrAo36D4QUXsgWu
 VMBBLXJMQfxTKsiJp7WIzOrnIM65MjE+VMe51ouOuYC3dLdVc5ICR4pnMF37cEt3uOtArDSDy
 euaz27Zz628tMrp6kBkFLIVWkU/MFTikoHEF4rebj+SJxyDqWtXdczjhYaOxEaYp43TAXJKxx
 384pv9Lzewov1bV4EEMqmDfG04rwsAfcaFupsUSs0zyVQmxkKATiFR6lD06ywtHq7ydFlyXkb
 qEhRPrsrTKRu3g9XzG9Bulbu9uzei6CcRpWefkKFWzRhKFgJaDXbsbWMB/F8jfrMhuPUq1zv9
 oqxOhNxYcBJRajckmR8jBTHb6c0qq6SE2RGV+l/F4ccP6qk1caSrCQ8EaR1I/Px6mMk/gKaAD
 Y98do38rn4VPHd73f5BbzvkydS+4x5FPaXs/6KA==
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
 Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3NreTgxNDUyLWJhY2tsaWdodC5jCj4+
PiBAQCAtMjE3LDYgKzIxNyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2t5ODE0NTJfYmxfcGxhdGZvcm1f
ZGF0YSAqc2t5ODE0NTJfYmxfcGFyc2VfZHQoCj4+PiAgCQkJCQludW1fZW50cnkpOwo+Pj4gIAkJ
aWYgKHJldCA8IDApIHsKPj4+ICAJCQlkZXZfZXJyKGRldiwgImxlZC1zb3VyY2VzIG5vZGUgaXMg
aW52YWxpZC5cbiIpOwo+Pj4gKwkJCW9mX25vZGVfcHV0KG5wKTsKPj4+ICAJCQlyZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTsKPj4+ICAJCX0KPj4KPj4gSSBwcm9wb3NlIHRvIGFkZCB0aGUganVtcCB0
YXJnZXQg4oCccHV0X25vZGXigJ0gc28gdGhhdCBhIGJpdCBvZiBjb21tb24gZXhjZXB0aW9uCj4+
IGhhbmRsaW5nIGNvZGUgY2FuIGJlIGJldHRlciByZXVzZWQgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1
bmN0aW9uIGltcGxlbWVudGF0aW9uLgrigKYKPiBZb3UgY2FuIHNhZmVseSBpZ25vcmUgYW55IHJl
dmlldyBjb21tZW50cyBmcm9tIE1hcmt1cyEKCkhvdyBkb2VzIHRoaXMgZmVlZGJhY2sgZml0IHRv
IHRoZSBMaW51eCBjb2Rpbmcgc3R5bGU/Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJv
Y2Vzcy9jb2Rpbmctc3R5bGUucnN0P2lkPTE4NDQ1YmY0MDVjYjMzMTExN2JjOTg0MjdiMWJhNmYx
MjQxOGFkMTcjbjQ3NQoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
