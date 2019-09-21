Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72BBAE18
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55486E104;
	Mon, 23 Sep 2019 06:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987EB6E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 19:09:19 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LmLoU-1hc90U0WKg-00a0LR; Sat, 21
 Sep 2019 21:04:00 +0200
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Arto Merilainen <amerilainen@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/tegra: vic: Use devm_platform_ioremap_resource() in
 vic_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <50adb1d3-93fc-44c1-9988-02036911ee46@web.de>
Date: Sat, 21 Sep 2019 21:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:Ear2+ZWGYZCCOHo5WiDNX1An9lw8SlgPmVPGUU67jagu+Q6vgqo
 LST35OMQIlbcoByW4YRUhS2CUCe6GDvw54vJWWmxNqza7W0tfrHudq5o8w6gRuEI0if8eW+
 p5nT1++FD7YT0CLbacTWCUeGJp8+2IPtGDEWz3kaDytZvkJ/E9vWPquD8aUlJX4E0TejUSS
 ITdVgBF3ICrXzoyhCOBTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Etac968zyjU=:EnDu48gq2dXkEdukMh5sIz
 8V/RAA027p4nP6vYBfdpNK1C+hdi51u3WHdQWDuSpshotp66J0AzZIRN/izBD471AXMkLhXKr
 vdu+RgIv19RSXTdalfv8TMTS//Hb6jEZ1ud9Lh77Nu/whxyL+hcB650OUBRCWaI7Pbq3z8teQ
 w+D75q5djr8fJEhihh4G0gfiUOxaA1keHArAtgx+qV8D13I6PCSIfMsJLnJUq3yILdOZcxv5t
 yv01wsdrkYcTRE/MDyBgHwTZVlEfzRzARWQtsPG6q5BY4oxJjHFVHNcXR90pJ7cny5mXalxR/
 2fuSA2odyDTo2c3+CDgGB3VUUkrHtdX95BX5RJLydocNflHP0YWO0yNCU4kNHUR2V9KqMNlIv
 2OeseuUki+wGYEoX8VE8+PsbJibJBL2/7O6xhaHRnt+h2AekKg8D//JSyfPxpabTab20cNDoW
 japL6yr7NSsNRtNlZ8QxYw4MvgKAfo0JsfKK2BASbiyL3Z3vCk1QaLyRs8mIpFDYv/Kxndnyp
 628KS7257/cpjgjvOgb1RFGo8HqAKYH3sxfCLV9H2XChFf3IMq8YwUFNM5JJD+LZjLUy4m7xs
 nM9yTL2OqTqF7TYdo1xNObim8aLlYFDz5QvqG90BEEqfGayEviW/Sd4+OMO1n9WVVJJPSw0XB
 M+zWVSrmycpCAFx6jjR7RF5EadKUo1+fIrGkQwL+BUhLNOVMqEz1iQvCp4iqijQjfqCxXBv33
 SubSKJ5ZaqB1zSNpVHvZl0BN5FWr52Dt8tPrzeeH9yzRfls1Mgu2ElD8hH42boXZpDirUIJVJ
 n/v+uIYkMP4a3uBMckM2XSn8rp8H0Mf0wkdUMPm97StrzWPU0PLshd5yZmn8f19yAvSGipZNs
 r/EfMv1Hc6YNFzNoHQmRq/pvfv3NUf+EWYLzDVPmcJR94/NsyjCXJbOqfHuR1YQd9/4Whtva/
 On2kDzJvTMirRQ8t84XskHqEib6CzueoPv7JbRy+eKiEww0lQQaymvglTuwy/kIhv+07/EQjF
 MW0sETUPIckFsMqz1jf8LVSKh9E4MqfCArS4EiA/RZfGXT4FlauMEA26C/YSt9yhWEfzedjle
 DqpE/JDscyy/vD76og+XHvThZzKCVNWBR2t57Lk16awZEhDKz7fVsptAxqq6sDecilXy53PQ9
 74yHzC6f7Hvubkuj83wv0fABHufyJvO2l2TVNEsOpk1W3md265yxwGR+iWJ5ZxW3Hxe9U99AR
 wiBO0v5e7KHx9lU/Z0qFEbyij0baPumfw7u56HgH16j4fHnMKf9X/8hDiQTY=
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1569092957;
 bh=7Tg1Yc39xzenqYSWdGNeeQlOnwRtZ7+BVwsmOwCoArU=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=DjGrP1jhPHZotF8ASq/nJlwSfbSMGBlPSlZyc6E3jyxHQW5ufAF/jV6rgWFNcXW+0
 6MMu8thwRX1egL6XNXylD2RVcHvaeb8ZOmwsO9CskM/qdX+HA5RRV/F56J3MFyd4cW
 Nu8Us8qKocj+Ip/eiUaj1krK0QFZEenSS+1MTZyw=
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
Cc: Andrew Chew <achew@nvidia.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDIxIFNlcCAyMDE5IDIwOjUxOjUyICswMjAwCgpTaW1wbGlmeSB0aGlzIGZ1bmN0aW9u
IGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3JhcHBlciBmdW5jdGlvbi4KClRoaXMg
aXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgoKU2ln
bmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyB8IDkgKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jCmlu
ZGV4IGNkMDM5OWZkOGM2My4uYmM3MmQzMjY1ODhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvdmljLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jCkBAIC0zNzAs
NyArMzcwLDYgQEAgc3RhdGljIGludCB2aWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVjdCBob3N0
MXhfc3luY3B0ICoqc3luY3B0czsKLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlZ3M7CiAJc3RydWN0IHZp
YyAqdmljOwogCWludCBlcnI7CgpAQCAtMzg0LDEzICszODMsNyBAQCBzdGF0aWMgaW50IHZpY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmICghc3luY3B0cykKIAkJcmV0
dXJuIC1FTk9NRU07CgotCXJlZ3MgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNP
VVJDRV9NRU0sIDApOwotCWlmICghcmVncykgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWls
ZWQgdG8gZ2V0IHJlZ2lzdGVyc1xuIik7Ci0JCXJldHVybiAtRU5YSU87Ci0JfQotCi0JdmljLT5y
ZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVncyk7CisJdmljLT5yZWdzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwogCWlmIChJU19FUlIodmljLT5y
ZWdzKSkKIAkJcmV0dXJuIFBUUl9FUlIodmljLT5yZWdzKTsKCi0tCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
