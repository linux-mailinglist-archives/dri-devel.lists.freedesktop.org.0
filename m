Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5071227A59
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F886E430;
	Tue, 21 Jul 2020 08:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB41189AB2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1595245698;
 bh=B9YFGKXCwbpCJaQ7rDkbGRRvr272ma/yhkp2sjxpSeo=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=LgfaTu3lVPIlzmS5JPiviQcuIglycwKxzcEgvfA1je3siuYEbOMbGcZ6Ivz4/fOMd
 4th7IaAnAgDU9GPgaknJ5WS1DkHsvHczpYq3rZzO/1QTCupk43weFFB/5eqISKxBts
 FpqOXdhnh4DSEverjurGdzYgKr4DeKyPD7bBN0qE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.85.87]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MN43c-1jvJUY1toe-006bma; Mon, 20
 Jul 2020 13:48:18 +0200
To: hexin.op@bytedance.com, Liu Qi <liuqi.16@bytedance.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/virtio: Fix memory leak in
 virtio_gpu_execbuffer_ioctl()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <17aea294-f51c-f2b0-bfe3-a47261e2039b@web.de>
Date: Mon, 20 Jul 2020 13:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:8UASvadiCjLpcNDtHhCbZpI6TcIU0yEkxWb0gWTZnrImQFoq3dd
 MNWueY1Eu4wlcxbeM9O8Mv3yfuAePAa9+HFnccnBnuY60sz9Ymn3ndfNhvu08Qf9lO8JPpO
 /CmqgPJ0Q0qt4oG5DIfruTDRYRqjsJSUWisIjhCu/TSXDeCfc0W4yO4KGaBTnLM5HzScxJg
 60RzpOKDDifuB8hS8Sm2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xM55sP9bbik=:bbsFmXYbgmZwbrLmx6n3pX
 gsmvrKoJyheKqtK1yL2VSTygH5GqfPFLzOg3jMRKeuP1W7urJ04FpvPtTmWwOU2kGWztgAdBw
 YwhSwaPW4jkG5rvtkrS/zKRuZfGIwiWXBBNY1wwuxMn+Vf9TnjRYjY5mrwR5TXblKnwTqgnkw
 1xuG4ei4iMpjfWSSNBDHQ+GqceZmhBHSEkJDy/HssuWKbuFbVXNTFtJpVJokin1E1J5TbPINc
 QoelQkAhO7VDO1r3AeMkRpEXfUCE4kUshJmRsdq6ol7rhnmwG4/57kBEwQ46pOAwJRUfk/qfj
 I2BOa4AiHPmqr/BD+4+nQyb+wLj8krBBwhMQmts0Pf+u2+wbxp3nAyPubltiBKkUM3Sj5V4Jj
 KCIhiB+3cXbhqT6HMyDxYrso2KzYHPo7GEItBtQZtdG2gnKmrvRXBrnO+VjroridB8kjyaOsm
 TzxqOSJNfwbsxX64Jp85fFXVCU/vP1xKgmrQV9rJ2URBGKu4vzTzhdeNvG8R6TEuUsY6gijsQ
 zpkSLxwnPjR2RpowzV2fRmG+D/xZdaPJ3+5bHNAI6aop9LV3zG5C/CwDsM/xLWJyaUDShVe+j
 zDs0bh0lQetNULMvqk1Cyo400KrSUK0504eMEzL4njruM98lbmU+pahb0fo8XXSSTQ4OLWq1q
 pLlDr1ErcGs/rUMgLLAQR54Up5irSCaIBHc1j9tk8bTJZX6Upkz+iABYeXae0X0yvclzlwGkh
 RjTf+QWvuzUMn7o1xE53oVoPHVb+ikNUYud2sfSPyxC0XC2pg+kyBr1XNTwluyfkPwG3mpyFl
 tzhAkf1bmcPrx7r58xTPdteWu9FUQrjPSzDn7QuVceD1llP8yk3zMHPdfSQHa5qiKiMKsUAsb
 eRmqtcp2R43IepUkwpfnFrzUtsNNbja+O0hseQSpjadYmv+LByU67fnkouiGT1PYyO51iBwYC
 pTghpVMvOucJdMguRm+mjqIBPEf9z6R0nnerfN7EhvtWgd13TMfncgIZH/+AayusEAcNsX/Fo
 FAeewdJ742Vg9hvTKEUl6JZQ1OPMsnveyDYWHlnEW6Wme0dGJYE8o9bIPw8MTUZjeImeGd1zd
 kUO0rDEUAmStD0hMGgurwmE8hdm619Y5xBg9dmi0rN8tSGbt8koI44frT5Hqi67HUce+LJ8Yp
 hAMs6F1p0Ayc63r9wtZ2ggKrPFmObPnh1+yIM/wx7uN2ilN6y1s0WR5dJBN9R3SvbD+gph99r
 YDtmAOoGzFm9RfxCndEIlaGeH2gWfRN8iLfEEWQ==
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBJIHN1Z2dlc3QgdG8gYWRkIGEgY2hhbmdlIGRlc2NyaXB0aW9uLgoKKiBJcyDigJxoZXhpbi5v
cOKAnSBhIHJlYWwgbmFtZT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
