Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5641C0E9D
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425906EA67;
	Fri,  1 May 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010C6E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1588239046;
 bh=Gowt2WfNNzEFY8LK5XA3ciQeDmvVC8xYBPqGGTuSPmo=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=E82S3s+Os6LU5No7X++XAxkzOmtMbLFcCMKYj5H9TJzRlwonLTXPAUbllHnGrXWcW
 TrgMqDkU0pefrv/QvV+v9wfeo1CWAiO+5PoaRAJWVl9WpesGObPgmPcvlSN+kRaApX
 nuqvDJf5fAgYODFy16Dgi81xFH0YdWEeexRZzk4U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.175.216]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MOAmi-1jZZi531oC-005b7b; Thu, 30
 Apr 2020 11:30:45 +0200
To: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vboxvideo: Fix a NULL vs IS_ERR() check in
 vbox_hw_init()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <32389e2b-50e8-8bd4-ee7c-5c6dfa273c00@web.de>
Date: Thu, 30 Apr 2020 11:30:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:OOmFH7OKkOD10VY8UurnxMCvjed6yhA7Qs2jPdBp3QW2dtWjyQG
 UVN9n6jPeeuotoUny8XgKsrDZHW8dPSZodQ83UHSjIxM3A8cpsyg2fQM2/Qu+nM+s5okSSW
 /N7iQiWy4DLjVPqgG0UrPCiXaar4h0Ep5g20o0GVKfZXonJmWC9iLoAmnS+fDgKIerZcIs2
 lcXOpjDsRPTqPmTxdNCqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e3c94EA2XWI=:LQLQ7wJ0u811Xi78nhZi1z
 rn1yaDE5IwiWaXdB/yqYJ0M/Qu51tuIQiRnamgM30WWYZFbjqOTYCkLPdDpHdgQfQ7V5V+EGi
 I7iN3MAORQyVV4LIkzmsxH2O6vZ2S+k5ov5SEFH07J4xHfYTvW9+LT4XfM18mOMyt7jkkQMfm
 dw3hNUXgZUyEDpmBZizG72Q5Tb8RxE/9GVZ0BMpBt0amM9GtJpUltznNovaqq/y+2TM0cF1WZ
 hWw4mM76Ur5fHWq5YRLrwWUyGVke2UyFtJ6Ty9T9TQzRoukCDK5jh/ho449yWJ8fIMo3yLrHL
 /FJHqPN6GYxgyZobFhL/SoCMHia0Pgvl58B82GTP27CRZIw44Ep9oIesYcKXlN7VaoW0MBSkc
 dcUtnCpd6irwBxGhdHefkpjMR5kfgc5TbMLNOVrUaeSHVzYKEAmd04fR5h1eePNzzMHtqRitB
 8dYqDHr/Lb6Q5SsILmYdcbVgRCvhBX2kvXZDjHtNDnnE1RLlymrMSfFOK+FZT+I5Bb0JfLmlC
 hNt1pS/1s3XSoTtdZksGeTy0ZGJv05iNsz8EA7McGHJLzCsPxNw8cYG2ATLbxquCNTptSoQz/
 B3z93SQ0SSrhekxkVhXxc6+jcSY8Hy4GDW0vn+8wuavlFqqaXHfK2xHbPY74vfp5f0DPGasZT
 GBQebAYUFXSRin4/2KkUE5GM2d4zbqPFkX/vl9ezw0VuGpvhAxxHJg0yW7NuRQAbusqVexjwx
 OWzOq/Xr74cCkIS8ePT5NCegw60RSmWMp0cAQsfvhdIcL20HQQBinJwQ13j8j8npRRGPyvu3o
 XqgEir1NUzvcpEqBbZxunwtOuKAWaqXmS3piPjCo9a6GItFS4b3ppsF5KRyl3tsTDbEThz/I9
 zjC9IRClXlnVaxZzdBF4kjxru++dw02Rc8Cpq35+s6b1I+u9nSh0ppkUhcAITb3QPxu77Ez/D
 MZX97Al4mYjwuHfp/t+IapHIL74hxVzkoOE7HKLylU+olgPCL1xqjXdGE1Ik+SopPH5lavIxP
 FQv33vfrcC7Vm6csYbXxDMRDp39YjqsJBzsxDFzCmwu72FZYbEH9U6HHnAEyqYnsDTVStj8L6
 3JID8m0KKE+exhRgmVQu2/aVIQBT7pNcPsG/NevDqIlXqtfe5/35XdifMd36oWKPtkWBnoKCG
 adZpkvBpaSVugBzwP0NujZVxAq/xA1AHD8pRzb9U8op+5XqVCKfPjopQF/M3I40tKenL3HwsM
 quBaCU5c8Ew7ZbIsA
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgZGV2bV9nZW5fcG9vbF9jcmVhdGUoKSBmdW5jdGlvbiByZXR1cm5zIEVSUl9QVFIoKSBv
biBlcnJvciwgaXQKPiBkb2Vzbid0IHJldHVybiBOVUxMIHNvIHRoaXMgY2hlY2sgZG9lc24ndCB3
b3JrLgoKSG93IGRvIHlvdSB0aGluayBhYm91dCBhIHdvcmRpbmcgdmFyaWFudCBsaWtlIHRoZSBm
b2xsb3dpbmc/CgogICBDaGFuZ2UgZGVzY3JpcHRpb246CiAgIEEgbnVsbCBwb2ludGVyIGNoZWNr
IHdhcyBwZXJmb3JtZWQgYWZ0ZXIgYSBjYWxsIG9mIHRoZQogICBmdW5jdGlvbiDigJxkZXZtX2dl
bl9wb29sX2NyZWF0ZeKAnSBkZXNwaXRlIG9mIHRoZSBkZXRhaWwKICAgdGhhdCBmYWlsdXJlcyBh
cmUgaW5kaWNhdGVkIGJ5IGVycm9yIHBvaW50ZXJzIGluc3RlYWQuCiAgIFRodXMgYWRqdXN0IGEg
Y2hlY2sgZm9yIHRoZSBmYWlsdXJlIHByZWRpY2F0ZQogICBhbmQgcmV0dXJuIHRoZSBjb3JyZXNw
b25kaW5nIGVycm9yIGNvZGUuCgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
