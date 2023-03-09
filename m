Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF26B1D9F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE49189125;
	Thu,  9 Mar 2023 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361FC89125
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678349749; i=deller@gmx.de;
 bh=teLoVnBgle2kcDdO1/HLQJT15FQM+Xa5PD++pn9A3bw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=SRXX+jNqYVBejRVBE3x9EybvKmHGjC0Q98fkdJST7mNpLHd8LYK/tP2dKvc175Qo5
 1KNP1lu35FEUer9W0iwnSeFWzvWwFXc2x3jBZ4Jr1Zj0b209K/pvPCdv3+K8S4BY5Z
 hGhJQyMYZ+jwY6ITOiYTWAYUVVCVZs210TnWUO1sXntxfoLxvhWUI18yDJB68lSqqL
 Zryc88m2/ceIdTOxx0UGHgTCGbBuOJCzkXZdwhEfTfFCaOXIQj+IVJj4uGevdIjTmd
 /64rltq9msRRbg74bdvgx5/BfC0lCstb6KfWgSfiOGT9MnRm1ZY7QumPnyVaqW8Lq5
 1vZVtgk3PbY4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.49]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPXdC-1pwmn83RfG-00MeUj; Thu, 09
 Mar 2023 09:15:48 +0100
Message-ID: <92a9d8d4-17e8-6906-7640-e7b82787f74a@gmx.de>
Date: Thu, 9 Mar 2023 09:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: tgafb: Fix potential divide by zero
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 harperchen <harperchen1110@gmail.com>
References: <20230307130856.2295182-1-harperchen1110@gmail.com>
 <123a52d8-baf0-e32b-3262-1e8619b1c3ad@gmx.de> <87cz5ibbsb.fsf@intel.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <87cz5ibbsb.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qzXzx/qRVT7OJmz28j5n5zzXi6tmhEmtkTsP0w96viefW4iBo4A
 bq6AU9UI1DA2+j9HrcV/An+J9kDVyHiZ5c4EQnL4Q2ODh0rSSFq9/tBoooW/1oY0VnOhCZC
 M2ta26K4vDFo2fyMOqn5PSaEj8PLVDwrjls+8cFY628F2kj/211dQCWp9qJ42NkipHkbO18
 jIAFDHotkk7gi+qEb+oQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2VHdQPL2u6I=;Zz0nv2YwIpMpg2VExAg0Ek0dLaG
 X1yKox28FcOEv429jj6audC1B9abgYLOfP8Q9hN0yyr+zUdHSnv0kFMC0PwjytiQ8QUEWHGEt
 X4DfcW+wjOji86N0hW5uYUtcRcMoOundn2J2Reec2wYjAYm0DdEJzbRQ992sXN6sW+QtpV2aZ
 LMpPOAOsvhSq/XPmdLbAOYo5B7b9KK4bxW2MTilAhhZN0078HmhRNw+oZWIfZB6kYDUr4XGQH
 kj7RXYQmQfSe7hIixl6FdwnYOv3nf6Lt8gHfZn1+BMACEeTDgnNsBsMEoSzcSh4OggVUKQGqk
 y6TS1s9W1tW8Td4wEfNPCdt0d1808RPKYUs6J54pS8meiIVkSdXrxEuMp0FNwwNA11NyVHuMA
 EenUNgRW2uhUNrWQsvDWc3qDT+Swn6KpefIO5XgX9RDb0KmzDaTWC91cTxTNyXq76Quqjo6xq
 FECxyQTAIIcBKqY184bdUTuvcnaYVODq5SC72gmCepAoUI9Qi68V05B5wxJGqP+OTGf53XJq1
 sP7Vze+oo7ONaXMm5qIimf1UAkTei8y7LkY7VhC8abcBsQamt04Ybb6krQR5MVT3LmY8eX924
 Ecig3vqP0HQyeGnPzWXDtFT5nV+ffPR6yfKPVa7ZfC2uKgUZANfzeniTMgFHm1jcutsMMlr8W
 tQIpsbYs4qSIqyMDLBo9SwVffcogJ8qrdNQEE541U0VWvh0jDUFdmd24gMFe8rLkVoQ+5eihM
 PhHiaCoNdfXy8uB/GgPaVutqUdt21OU074TlsN31IosmH/hN6ookrUdEprhspeErZXs7ZFnIN
 3D8OTSDjAxPso2aDEqSV0bV3D0TrYbqDn8H2WCqTvitf8XGCI6900/Mh5QczLi6aK0Z2o3UIS
 2cYQLxl4VRL2hQ1E4fQEuArXOgbDWaaUrbfpIdUcZRlbpA0jIGOWjxVr28CyKWxcb96HZlxdX
 CKdozg==
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
Cc: linux-fbdev@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/23 08:53, Jani Nikula wrote:
> On Wed, 08 Mar 2023, Helge Deller <deller@gmx.de> wrote:
>> On 3/7/23 14:08, harperchen wrote:
>>> fb_set_var would by called when user invokes ioctl with cmd
>>> FBIOPUT_VSCREENINFO. User-provided data would finally reach
>>> tgafb_check_var. In case var->pixclock is assigned to zero,
>>> divide by zero would occur when checking whether reciprocal
>>> of var->pixclock is too high.
>>>
>>> Similar crashes have happened in other fbdev drivers. There
>>> is no check and modification on var->pixclock along the call
>>> chain to tgafb_check_var. We believe it could also be triggered
>>> in driver tgafb from user site.
>>>
>>> Signed-off-by: harperchen <harperchen1110@gmail.com>
>>
>> Could you provide a real name?
>> Otherwise applied to fbdev git tree.
>
> See commit d4563201f33a ("Documentation: simplify and clarify DCO
> contribution example language").

Nice. Thanks for that link!
Btw, I did applied that patch yesterday to my tree with just the nickname,
but of course I do prefer real names which is why I asked.

Helge
