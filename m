Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F139448EBB5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 15:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8CE10E530;
	Fri, 14 Jan 2022 14:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17B910E530
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 14:33:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8EC3883311;
 Fri, 14 Jan 2022 15:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642170790;
 bh=kggVLQQepRZ5SRD6pRr9X4uZX7fNamf01m2b8BA8vy4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ppxX8hYkWFYHntt8GB8gj94baiDozhOkLdgqd4Pp2qJporFmmacvrXfmHWPCuwwZQ
 M/y9zipe8uY8MFkGvj2oNIXKUIoKUevUZmQ7YjBPemzdTMxtEQd7M0g8UQ8CWrFatU
 8nRfiZfGriV8srV7GkCGTugj6rMdK7vVXW7RoD8itnML62LyR5prPNcm/1kMVZDuNe
 DJk/vsoZJcrIqEaoq5bUZ4MRQh4zhy+4DMqdFvmILXnN/Nx2ioj2by7LwhybTn8JEj
 uHRTj6fXnkp/zATfLFSus9pFyyNhYWR0vO9IuL0oium6u5m8+SyUO6+K75i2vxM+1E
 hOZEFCahp609Q==
Message-ID: <f12cf454-8579-1094-865e-4293389fee24@denx.de>
Date: Fri, 14 Jan 2022 15:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 01/14] drm: bridge: icn6211: Fix register layout
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20220114034838.546267-1-marex@denx.de>
 <CAMty3ZBN3qLEieJ3YQ_jZDXYRpQ-gGn48_hRZm1-jsco0rkJsw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBN3qLEieJ3YQ_jZDXYRpQ-gGn48_hRZm1-jsco0rkJsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/14/22 09:16, Jagan Teki wrote:

Hi

[...]

>> Fill in the actual register names and bits from [1] and [2] and add the
>> entire register layout, since the documentation for this chip is hard to
>> come by.
>>
>> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
>> [2] https://github.com/tdjastrzebski/ICN6211-Configurator

[...]

>>          /* icn6211 specific sequence */
>> -       ICN6211_DSI(icn, 0xb6, 0x20);
>> -       ICN6211_DSI(icn, 0x51, 0x20);
>> -       ICN6211_DSI(icn, 0x09, 0x10);
>> +       ICN6211_DSI(icn, MIPI_FORCE_0, 0x20);
>> +       ICN6211_DSI(icn, PLL_CTRL(1), 0x20);
>> +       ICN6211_DSI(icn, CONFIG_FINISH, 0x10);
> 
> All these fixes and few of features support are valid only for
> I2C-based ICN6211.

No, they are valid for both DSI command mode configuration as well as 
I2C configuration. They are also tested in both configurations, see patch

[PATCH 12/14] drm: bridge: icn6211: Add I2C configuration support

The register layout is exactly the same for DSI command mode and I2C 
configuration mode too.

> If possible please confirm with the vendor.

See the commit message, the datasheet is difficult to come by, however 
there are FOSS driver(s) and tooling source which confirms the above.

> The
> driver I've written based on non-I2C-based ICN6211 chip, which is
> present in BananaPi Panel.
> 
> Chip part: ICN6211 A59058 1634.
> 
> Not sure, may be we can have separated bridge driver for I2C-based
> ICN6211 that I don't have in my design for testing.

There is only one ICN6211 chip variant, you can configure it either via 
DSI command mode or I2C mode, both were tested with this series which 
adds support for the later mode.

[...]
