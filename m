Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485581B6725
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098B06EA18;
	Thu, 23 Apr 2020 22:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCB86E0AF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587663786;
 bh=5CS6mwIZjRjBxUNh2R/rPaXe4i7Aioa+M5Ac8XDywq0=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=XTV69jVyEuNtUHznOKB2txtL2F2bCGg4TssU1OwRZ6zegPljGIBm89x+aT5MW7zpO
 V0Pwl7AfB+J3GTM4+XWAm+Tz2HRd00CjGmv6Z31bUuZITvlOCKlex113Tv8+YjQj0i
 iox/lT6NDgE40oq38kt/D0fx34/1ugh+Kysd2SS8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.69.235]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Ls9JH-1j4gje3kx5-013yge; Thu, 23
 Apr 2020 19:43:06 +0200
Subject: Re: console: Complete exception handling in newport_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Coccinelle <cocci@systeme.lip6.fr>
References: <c62ec54f-348b-2eae-59eb-374dde4d49ad@web.de>
 <20200423142909.GB1562@nuc8i5> <f054f00c-b813-e0c2-fe2e-30ccdec1ff46@web.de>
 <20200423170245.GA3417@nuc8i5> <20200423173226.GA75304@kroah.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <11026835-83d0-16eb-f0ea-d779d1de0762@web.de>
Date: Thu, 23 Apr 2020 19:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423173226.GA75304@kroah.com>
Content-Language: en-US
X-Provags-ID: V03:K1:uddePNRZJKD1jNrdz9Z2ORJruUTuZdpVUJYgRiBOppNxa9japOT
 9g+hlOr6L2OUURvMbgHadAxKHPcPNfMpnvY+bF3wHMRAEUEgxf989ydV7v+YJT3D+UUV8ET
 52yae/56m0QDQi2rAReYQzG/VkWYjKDFWVkOm326C40jPO6Z4OqZp+JJyQ9w+FoGL7iv3TU
 pX5Iw5isC+MqQUAD8nSuw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:36Yjj3+D77E=:fS5FMBcW8R651HxcT1944/
 S54IyP/fiiUanCJtXu+vINnDyNeBUWmzkbt8QMDAT2sdlAuta5ArDxbapUg2MBrtl0/WVptSK
 nC269vWtmkWJehdRMqdyrc0kymrTDKgZ88wUqi0rXIQ3CXZboR0g3RO16B9BYahhpb2Lhhqb3
 QGE1ZfT8ij4zYPNXmleCw9EKYeOtgKFKOxIWCz4a6McKsyQe1M44bDRRW1ylYzR9Brvio+d7W
 64SUDk5T5zUQOLTlexKrroZwv09vKRfdDkyhSgjrM89Nzhxom7TOOiwVoZHKFFn62oDXOcq+Z
 5ApGfCkIBLR6OW+MZmkzTvoQRMrKud8aVWuDbtrgiT56PqMt+0ObTIbaXrwrvZGAsEJ0XJFn4
 2U06RKNuhLmKfx/GRx4YDTlTU+YImS8+Qfs6V2IXCOO9v0fXHMS3LRTxxzFj9JKKEDZozDMlO
 B9Dqb2pkK6qoHwtksAcRwb6usS/NUN5crgbqsvSo7ieW5eL/hpg4xRHwjJVu08Q2+3haPx6z4
 PjTpy1TYE+pefEFqMyacbvNAmex/OvSwTnKr9YTOwTC1RCgqBl+cdecBzu2l1WVMLm571zo7S
 KZYeqqZVUCYyh7jY9Ub15fzGj4/bIFBHa3yjsalWZN8Bh8sYXhVGnh7uovIC66CDzlS67lg8N
 BIQQcOIOjiVaz+pBeORJbvWSRd+r6BrgcmGwcKkSuIT8IQAWyT9XF4GaieJqAriSi6HFryPjD
 cXf7dLblX0oZZFDeAGNMXkVf3hUuZXPRP2O93+kZGrwmIKdtQX91sV+2s7ZaNbDFdg2IIprtB
 TpVSWrhPPvOrmYHl9O7cv3qYWKG8rz8GmotHOMeIsAqlia5JSruzir7rBARrtG+ZoAAVTg/sa
 fVzriP0qOr+VzjTHgPXuwrgeR/yTcRn0oPXT4TfrhViz5scmP5OlB1oglHFpCJQqskncPStbu
 5rnEJkrsG1HPXyc46NSrnySWHndVQuB2G1NhNePdkO718Di1BXTNfutW2Raidb2fc859l9Wb2
 39oARJ3iRRwKZi6aMMtdHJiYOYTHyFZhMSTQExYe/OTKtGdAwOFhxab2dX5wo8GjHs87emMM1
 ZgZOgkkIrIqw8njts0F5AjfH5WeIwzLXUbeLh25ceF4fYfZE38FD6OnEyXcAMrmZChAIV7Vfi
 AVK1sCfjg8J8jqW9gUioXYdEuH8LDRhPGBSktJ17IPKWewB8i0QUqitXJ9j/Cbgs5mliqB4fk
 R1Grv/dB0pWa3Z9Xu
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: =?UTF-8?Q?Thomas_Bogend=c3=b6rfer?= <tsbogend@alpha.franken.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Dejin Zheng <zhengdejin5@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Please note you are responding to someone who many kernel maintainers,
> myself included, have on their blacklist

You configured your communication filters for some reasons in this way.


> as they are totally unhelpful.

The development views can vary also around my software contributions.
It seems to happen often enough that specific suggestions get accepted
from my selection of change possibilities.


> Please feel free to ignore them like the rest of us do.

This is generally also possible.

But I hope still that our discussions can become more constructive again.

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
