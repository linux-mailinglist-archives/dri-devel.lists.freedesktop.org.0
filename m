Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF9A77727
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44D10E2BF;
	Tue,  1 Apr 2025 09:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="oHyCcoX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD0610E523
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1743498191; x=1744102991; i=deller@gmx.de;
 bh=h3dSMXaTeJKtGlT/Nws1deNztR+SGogPFABHrZhLMQI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oHyCcoX4zCKYkmtbKaz0TnX7AXNIIDqUZLtQZQJDsXAuestVxmjmYBLbM5vTKOj6
 Z+5sj8GrbOY0z9DcdZ9xC/1tjqPaHJCpnjdHY/+YXId7DfRV0ROt2WkJBZshHAM69
 fn1nIvpZX2I+GLjNUKzmlibSuJdmhuipXUQxq9Wl9t9leb/WfnjKfW6LdSdpl/9qq
 EgvckOAaRXOiFP0ASo8ijomTOM+yeTa5yyfkQUGOjY0X+xVSAWpvFmlW8Tm/F+XR3
 cz6syqFsLHfxs0hRQCXsal5ROBlAn2+i5x8CWNejiuIR/AOJEm998/heeyovimiB9
 vNU5Hz5mdx4q84VTSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DNt-1ty9wY0z0P-003m1W; Tue, 01
 Apr 2025 11:03:11 +0200
Message-ID: <e04f012b-cf10-4a84-8fbe-ece1a06f0f66@gmx.de>
Date: Tue, 1 Apr 2025 11:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] fbdev: atyfb: Fix buffer overflow
To: Denis Arefev <arefev@swemel.ru>, ville.syrjala@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, tzimmermann@suse.de
References: <Z-rzIfUMmOq1UZY1@intel.com>
 <20250401084010.5886-1-arefev@swemel.ru>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250401084010.5886-1-arefev@swemel.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HAcr17Y00TZU2Y2AXipi5xInURiSR0TZBvLx9HMjSh3qtMm4J1q
 DJIS8BU8xSRxXAmpFEaAOmtYzmUaTphKfRazS3KhRhbKe0G0e5Ezar7PPeP12iJ5HqycuJy
 T6t2pxetTHwtpROHPdK5zvf2IJvOYbcPKy3COw6MI6gVXFmuZAhU7YZABjfCGSXhGOn9NbJ
 s/j/xwre+dLwSnwfL28rA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/JuH8Ii531o=;2DZGGIhAsDr1zahERlYNpGzwnnp
 sJMbqG/komepMdlWi0kvFmGCtOEmNiqO8wzqZ13EAUTA/WHYFfO62vCz4BMzWF1F5zU7A0wh6
 iva/+LlW4LALby1Zq7TF134F22DVTRH1FhuE37pFck90K6Gw8ACJr2JGyP5CPq4JRBPV2ePTx
 4oK6mkjtTQh77woRpJpovFNV/zl40T2MuQlauF8w003IIy4f9orGy3BAK+ve/cOWI35PFrFQC
 xqDBBwZD0tNwnk03LO6kzMZgEGi4tOCM8J3kD9zjHLHXvMUSbe2jlhNm+tOvuCCQ13PHfVRF1
 AI0zF8nlc2siRPArTaJtHlnZcZgsYeOrIZsn+ehIjuBvap6+SlAGx9k6UbKQ+kwBO0mlE1nr8
 xuVL+GzeJ3c0CdgUyCGnpmhBnJwwU6wHPYlKcuZ9TOZste7oh+jQLmzWJ4Ig1BG0OMnI6Ub4B
 LQ3gnhb1zhWsYg/i5svjeci/zGPEvGxXerxdeuZ1oyHYOXp9ZgOVDrdQc4UiPHEQMsDGdgSu3
 sKmtgj6UnNeJroJkVKCm7Kn4i0SZ85AkJdm6ka4m5NIO17EQjGRq5475E6FcHhCojOQtB4D/H
 VgFLm3FDhSM/zdegbo/FuDV7uFHfLHpSN38GDXypONycRVvlbb6LBj6xUMEwfQlq2SEYD4IJe
 iRTtSsVJtzNpIsc6QyyEyUEepqCJP8kDKxAvEa8cgYzoPTmi2/iy77rdJCx34WV6MRLO7Cz7P
 1jwRKYfP/FN1qBNTM07/X7z0QbEfJiajMN7WChZ1bdphQ0YoYi7vUqjdTdj99hxJlnGLTvUDe
 sPWKTv5cSMbHQrFZ+E0bskYcVUGbpupLscmIzyvQMvnVVGW5L706YpwEFkpvPUpw+SdkaO8Jh
 qCm5xuonM2jht66302AJem2miDmY3YZU/NWi1Lghmvwuhj76S21gldArxnPxV25UFlTRxIQMJ
 TiwNwbU1Bdv+xQc6IWKT3Gvn1nJkyTUEa4XgYhZZJIUXieNkjREGEvNk2xZMy6GAtbB3ECHza
 MrEUproM6GwgkqEicY+5gVO90S/gbmByKWBMhJZUSBlwKSSeGPPz6sZoC/KHrdtmFpuukqtmW
 tvUAz2Y7okN14IiVd3dCBbXGuDb5gJuc6+BMGloWicHE6X0dJAKsUSCJzHeW60CFXrzAjVHn3
 tzJxUn7HS6Cd/fmXWv2QyPH24+WrZhccNC//IDnx7VzmKqjrUyRyd/eGpSxnxyYqpWp0Qu/8x
 arKaDSRg1tMt4csiHpbJi00ri3etSR6nZJ2+JTBVZHz87/2x0aB6q86MUkRX2yQUDGWjtCI2P
 eblpZjBZYxdISjf8asF2HB63ozWvpzMdoDKrMUHtTTzz4fU0h5Pxav7dMfg2HfzSFnX7/uTPe
 DEtW7ecDr2tTG+izmZlE8AKOGDnLDGVOdLbxz6+DO8dQDNxtcz+eQh2l1Y0KtTB/f22+6k8aZ
 MDgOH27YrdvTsgx/ysoXe7zlFZYa5O8lkJBnck92Vvv67T6Jo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/25 10:40, Denis Arefev wrote:
> One small question.
> This chip (3D RAGE LT (Mach64 LG)) is very old it is 25 or
> maybe 30 years old, why is it not removed from the core?

It's old, but still runs in some configurations and people
still (although probably not on daily bases) use it.
Also don't forget about the various old non-x86 hardware machines
which often used ATI cards too, and those machines are still
supported by Linux as well.

Helge
