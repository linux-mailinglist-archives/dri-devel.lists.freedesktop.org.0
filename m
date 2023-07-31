Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7B769FF6
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 20:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EED10E2DD;
	Mon, 31 Jul 2023 18:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BE210E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 18:03:17 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EF808867C3;
 Mon, 31 Jul 2023 20:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690826595;
 bh=0Yb86X52QY/bwtMd1vI+ELoI+dO8kcLic5SJr4LfYxk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I7Ap3it/prB9qpVulIGxIqEaCSDDFdEuJ6mtzJK7tHWfK3lDMEjpLdDhxonizYyj9
 D2Eav/gjIr5dKjb6DMOd1Or1jednXRnp69rp8/PED01bnpnIBrj67mZ51X9VfnWn8S
 LLSFnNfUFwxXvD3ZZl0EvpVhDAql6LXY7zlE0APg3Awx3yf+8bgeGfOYuFhMrt/6Co
 uHhP4zQbppGzRJfqxPpGd3fFRpSUI24iuEfJjmYwWfteJXVUpxsLODGneJ7YROk2jB
 /rEAAMGdv8ya2JmpnYaPY2w2gxjay01haI8pXle72yOmtGYJFBb2mHf0aBQSTsV+B2
 O3XGJybJQO+HQ==
Message-ID: <2a6e338d-36ef-6836-bc9d-ef1f727463a4@denx.de>
Date: Mon, 31 Jul 2023 20:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
 <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
 <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
 <CAD=FV=XAk423Z34ebiooHO874GmUf5BgssyQm4_HieCGhs7E_A@mail.gmail.com>
 <594f8182-b74d-6ef2-0d90-74061b35bc50@denx.de>
 <CAD=FV=VXMsZ-kUOgd32LnjBP4eP-j0rbiDhF6O0wSAQsEB5mng@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAD=FV=VXMsZ-kUOgd32LnjBP4eP-j0rbiDhF6O0wSAQsEB5mng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/23 15:49, Doug Anderson wrote:

Hi,

[...]

>> Maybe the EPROBE_DEFER actually happens and triggers the failure ?
> 
> I could certainly believe that EPROBE_DEFER is involved.

So no, it is not. It is difficult to set this up and access the signals, 
but so I did.

What happens is this:
panel_simple_probe() calls devm_regulator_get()
   -> If the regulator was ENABLED, then it is now DISABLED
   -> For regulator-fixed, this means the regulator GPIO goes HIGH->LOW

panel_simple_prepare() triggers panel_simple_resume()
   -> If this occurs too soon after devm_regulator_get() turned the
      regulator OFF and thus regulator GPIO low, then unprepare time is
      not respected => FAIL

Since there is no way to find out in which state the regulator was when 
devm_regulator_get() was called, we have to wait the full unprepare time 
before re-enabling that regulator in panel_simple_resume().
