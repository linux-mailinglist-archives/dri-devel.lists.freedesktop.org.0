Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874E567F86
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2941C11206B;
	Wed,  6 Jul 2022 07:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA48F112076
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 07:07:15 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A5C86601824;
 Wed,  6 Jul 2022 08:07:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657091234;
 bh=0YdJ2gWsY0ZKgJLpgGZZh4iqKCvXwTSzHoNHWahC+bg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=HTVU6mBi/XarWgxOS80hXcOFgbYnpKH5D/DzJu9AvwTI2H5pkgYCtegRA/1pKPR+B
 McupPR8GomMOswkid/GENcItpavW5ZHHYpaxY7kiYspbjGjAE61eb94/TxThaWy+87
 UdlsQDi5tJWV41FEuzNq46daTofPfMzxjK9FnPwgvSCy+fCzZJqbIsMj/UO6QUARNI
 P2WT4GWabmK9LUyJIKHGKEK0o8/Y9nCOZCIRV0uwDL2yJLWTLm10IwK1ghRx0ImEqX
 LdkJx07uyfUiaVNea11IPi+Wjx6YyeS69SUbjsVHl2LTd9BjWUOb+g9YHr+/C3twA+
 nmlgXK/scelnQ==
Message-ID: <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
Date: Wed, 6 Jul 2022 10:07:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Erico Nunes <nunes.erico@gmail.com>, Steven Price <steven.price@arm.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
 <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
In-Reply-To: <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andrey,

On 5/17/22 17:48, Dmitry Osipenko wrote:
> On 5/17/22 17:13, Andrey Grodzovsky wrote:
>> Done.
>>
>> Andrey
> 
> Awesome, thank you!
> 

Given that this drm-scheduler issue needs to be fixed in the 5.19-RC and
earlier, shouldn't it be in the drm-fixes and not in drm-next?

-- 
Best regards,
Dmitry
