Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C972C2C6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456B310E216;
	Mon, 12 Jun 2023 11:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B46F10E206;
 Mon, 12 Jun 2023 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1686569439; x=1687174239; i=markus.elfring@web.de;
 bh=qW39qBqYL5rh7y7+SHOvtOy2E6fDNHB7OZ224peZEy4=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=wdBKVUYSdvY38VFIZUpZKdoUSQpe7nGNdofBOpnCvD6tABi3SabSTOpPAnah2QyLMzlt7rP
 m+kfg8lqH7G4X3PpVUM008KumGvI9Dky9o8KmbSj4qEOA4F4dh/0kkkz1DhNT6+1xpsbW8mMb
 oYpqPUmh0nSsg3kw+RxeIFtVQSxK32GSShlw4UsaJUUKiCiKV9BadJzmEpM+WzftDAfmqqnen
 Vy2QxU2dQRqBAW8mr13B3Aa/U2XCywxr9Q/1m/HCHrKb6UwJ0jNrhgbMf6nd7ipmzgVvZFUPo
 PNLUZDRG9iWOMYGHK67Q5B+vrClJ/AAOFOpP2Nn5Vo8SIFNmRxiw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkVwo-1pj0iX1R9S-00mCjd; Mon, 12
 Jun 2023 13:30:39 +0200
Message-ID: <48cc92a8-65af-440b-c94a-c0972012f18e@web.de>
Date: Mon, 12 Jun 2023 13:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Lu Hongfei <luhongfei@vivo.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 opensource.kernel@vivo.com
References: <20230612065954.24014-1-luhongfei@vivo.com>
Subject: Re: [PATCH] gpu: drm/amd: Fix the bug in list_for_each_entry() loops
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230612065954.24014-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EbYhRPPXRXE01p1Nn9DVyRAT5YOoHkWIQAWP01M9qj+pguJhRpa
 SnLxALodboD6pS55CHd1kID4QW1vIlP41Y3X23luTWVAN3Wdr01dzP5P+W0p371ifKQlYWE
 bMvFqH14Hg4pgVGgg0exnehoH6E0otvlxAVKNXeCmI6NPr9EXGZ13laO1rdkXvSf2XO2dl7
 peFaDXs3vr/3Qy8AiNWQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q3kTOB8t68k=;NDnXDAfj1cTmsuruxSWNOk3Rm1b
 ak5BAQnYhbawUgKSbGBSR0zzgGe8tINC4zqvQdf94UNaK6orZfSK9osYGE9cSMnKfbWT6oP3z
 X/RnRwvuTqw1C4DxdarURtoJBV9iikTvzDyWAJ3+tasc4AXKZPW0dorNa50l4bpSNwUekLkcJ
 aDh4A4flG9KZVcvEtrT/KWGsZ/ya9h40GpodaaxtO3l2kQUppbJbutIZVs2ss5kN7hYQ4iN8W
 AE2gNeHJWWwkdfyoT2fwke5PnlKxoQUN6hT37tCGoXxPeTB2wGH0fimphhFKF8JLUTb1zkp1o
 0V0EXYCaS5lnhrSa8v/WlJrHHZ2gjwTAT45Qzu5egiZpJkXjIuLIfbfZUhyuuWrfgrqAO00Lq
 7mPtMofpzi/QkZtTD6kq4fldC+RXNCXu2YUAWy7huYwTZzThcdyKPuDHToizKk7gNh9KZ0dJC
 i70Rj+i1GDPyhHf6YdH9Z4KBxcQj27r52TgQ72ULAbAQh1CNpBcJwE4zIywI7Hc8LA+umCIBA
 yIOAo0yhF+7SagM6Uz8CJjVH9uKQw3r91j0ZUwkqVUknPu0MPjFmH9bOhDVh9ilgnlavdApCL
 isn5VGoPsLuObVa0EHUYezmCe2L6Dh7o/qMba/fgJDpmcb8rRJqbiSKXamrLjUvmPoFREYaOR
 pNCWnOFGEQfdTaFIlGFc+f2QZkBkiVzHA6Py+bYNjpXx1Nmd0DiXAT3aAO1dJre4s3VsaYlIa
 abgy/INyzE31HQQlN++Ohbk0gopR9piSzeO/R5fWGWC3TUYWL9wT8wqWvxVQj6HbcX55jWCds
 TBttHyNDYRdw9YiFb6ggripIDfCokFFqPdOkLVzNElSIAW3TE9kt+gSXM/LwOgJzxQYCP7c7n
 6REmO3JZcqYz4LzAf2qEjJG3lVwJiPl5LtSOlnYs+wpvfKW0ynbtSQrkbBoZMx/OJB5XIYmqP
 NLc3KA==
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
Cc: Felix Kuehling <felix.kuehling@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> pqn bound in list_for_each_entry loop will not be null, so there is
> no need to check whether pqn is NULL or not.

Would it be more appropriate to use the wording =E2=80=9CDelete an unneces=
sary check
within a list_for_each_entry() loop=E2=80=9D instead of
=E2=80=9CFix the bug in list_for_each_entry() loops=E2=80=9D in the patch =
subject?


> We could remove this check.

I suggest to use the sentence =E2=80=9CThus remove a redundant null pointe=
r check.=E2=80=9D.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4-rc6#n94

Regards,
Markus
