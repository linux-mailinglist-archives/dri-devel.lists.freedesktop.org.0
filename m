Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1815A5301
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF3510E903;
	Mon, 29 Aug 2022 17:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20B310E903
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 17:21:24 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0EA5483AD1;
 Mon, 29 Aug 2022 19:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1661793682;
 bh=/t9IPGi/RI1ZedJnT2roTytYov5WBNHMjNcRVVrKQU8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qcONwg9zsYXrBnlqyQTdPDJtNAwhSGKSnOEBvPxDNuQpK9HHaL4uAlfwXy9pV/cGi
 yFdgxW+faSQGdQS3jt1PFky1bxNKdvm+o2TbTd1cJ3MOu4eGp+qReWfuPTWTQPVFm4
 ygAtKSIG/pJrs5LeQVxmbJr6jdbNCr2MdQiXDie69qcNwKw5sv+CkuT/+QG/5Yg5PQ
 fwdVVAhn52c/KvIsYdScyCEnznrrTBA1Ug+JG8OU6ZsNSAVYIx+BSqdn4RYUSvmgps
 ZTLI4sf2v+VYrXjIWOsV1e+RQ4IMjepu7kriRThGowSjzO3vRmv+E1Cr00u8KxaVyI
 F5Dahss1HSEww==
Message-ID: <3c3665ff-6428-db9d-eec5-7643cbbd43aa@denx.de>
Date: Mon, 29 Aug 2022 19:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 2/2] drm: bridge: icn6211: Add support for external REFCLK
To: Robert Foss <robert.foss@linaro.org>
References: <20220801131747.183041-1-marex@denx.de>
 <20220801131747.183041-2-marex@denx.de>
 <CAG3jFysY96ocbVBadmNYh6G=CxxYg+fiEK3aeQ9XSVjdwm_oYQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAG3jFysY96ocbVBadmNYh6G=CxxYg+fiEK3aeQ9XSVjdwm_oYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/29/22 16:54, Robert Foss wrote:
> Hey Marek,

Hi,

> On Mon, 1 Aug 2022 at 15:18, Marek Vasut <marex@denx.de> wrote:
>>
>> The ICN6211 is capable of deriving its internal PLL clock from either
>> MIPI DSI HS clock, external REFCLK clock, or even internal oscillator.
>> Currently supported is only the first option. Add support for external
>> REFCLK clock input in addition to that.
>>
>> There is little difference between these options, except that in case
>> of MIPI DSI HS clock input, the HS clock are pre-divided by a fixed /4
>> divider before being fed to the PLL input, while in case of external
>> REFCLK, the RECLK clock are fed directly into the PLL input.
>>
>> Per exceptionally poor documentation, the REFCLK must be in range of
>> 10..154 MHz.

[...]

> This patch looks good to me, but it doesn't apply on drm-misc-next. Do
> you mind re-spinning it?

I already see this patch in drm-misc-next, so it was applied already:

378e0f9f0b3e0 ("drm: bridge: icn6211: Add support for external REFCLK")

I think all is good ?
