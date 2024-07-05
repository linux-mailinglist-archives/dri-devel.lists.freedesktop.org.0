Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C90928B88
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5310E279;
	Fri,  5 Jul 2024 15:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oAIdPXs3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37910E279
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1720192868; x=1720797668; i=wahrenst@gmx.net;
 bh=hwXx7X/JWO629nMGozpbxOU/sJMCVJf7jb2Wh2OBaFo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oAIdPXs3mQlwtD2Kv6SVDhIT3WbZhYmmB7E8msKCEaeZzlnpofm5Vk0vBjiNOaqm
 C2zR7aS8SjSTTsnL4RLXYXy2eADdjqZXxiS2+SbS0NYnoDhSvUpQAQ9f6Z0wd9rjU
 NvP66HksPR13Q7yZO9bjhRDWVg1mBS3aX3Ys/tD7GcmnWRfu1+/NMSsVOykKhv74M
 jpHdbPg4MhSjIiKALFJUQRjeqt5HbW0VDN3YYfm4YBxMiohoiL/kUDABbEuWiEurT
 YB/StJdWzhnoLgh5mqhYSZ4sYTRypNBqwgZ1UCnj3aoF4nRNTX6pV2K0LwSrvYcYp
 3nUu/sZN1yll+Ar5SA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUj2-1s8uNq0H22-00rvkj; Fri, 05
 Jul 2024 17:21:08 +0200
Message-ID: <43fa421c-5e5b-40a6-a546-d80e753586e3@gmx.net>
Date: Fri, 5 Jul 2024 17:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] usb: dwc2: Skip clock gating on Broadcom SoCs
To: Lukas Wunner <lukas@wunner.de>, Jeremy Linton <jeremy.linton@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-10-wahrenst@gmx.net>
 <95762956-b46a-4dfa-b22f-bccbfa39558d@broadcom.com>
 <ZoezRpXBgB1B5WjB@wunner.de> <4502d826-d80c-4a98-a889-da7badfa698e@gmx.net>
 <ZogLXYopViQO11ta@wunner.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ZogLXYopViQO11ta@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:BJGrNpbHXbxVeXDB3xE978jxAJSmTOKF7NAPEoMIBFmnco1FxmF
 lZkHxE5fWXY5JkJWk7/VhhpCAfRjCJVJESnrVJW7aLJ2N/Y9dsXV1doNgYEoQbZ5ldT1+VO
 A+Odv1KyVh8vVPyj9xWw4ZAHA2xuIQBFiDmsU6sfpUVbOSZHbOhDRHD/vdoQlOIr+g4Wlg/
 3MsXndQrf3WTVS8vQxEsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JQQ/R1k87NA=;1b+BZxXnPVoIRZHBh9XctHJp4/x
 12Z+Wfgi0mUwKBUCAlQJYec5etl4ChEpvyoSWr9IdJvVqgJP73/Mo1p2P/xkZnENxTRSOrmTr
 TJDApa4d/H/D9tBsclA89E8TxrWgtiQUW3RMDSpIY2KRwVT6/op7ccJhWyj98kJlncJrCGQ1d
 Xsa8T0UwBxARN6B12ZrauAFPJ/2Z+4XFCDfP7cyrRrCEahas1/hsFXSCdMNnGNXsRzClc8Hev
 nksU5f3aTIN229lGXqrwXHfb4pFM+Ad3Amd/bNp9p+sB6Gizs3NotpbTuLYOK2pE33uwaaXK/
 u/l8hqcAHtgFCO2IpKQN1cKU+bdEoncl7sX6+wUPcw5dpeYtd/XaUxHWabQPn0a+Jovy6o07t
 GK5UY74mXa464sOPWQVFpXfr/rcu0uDTZSIi6Ve5DMtS/fi9TXT78F2cjbk9wL0xPSeYRq8lt
 gUErMLVfgAFdhBngda62lkwkqBH2+7fYVpPdTfYcKiwjD5ciLq+8zK2iC6HdGYil1j8ialKVn
 a9lrANOqqXVtHCVAcSmoKp18ACeOwk4qo/YQXN61+6vNOJcBlp2m65gh6ZjYGpC4Zzg5EIEbd
 Nh2gg/b9tO78dnmidxHClHQCgIFqnNij+Fznt7KDBF/ZjEpkwNXR9FaT5NQtRcc78q5Se78bx
 qEi8Ux7Zhs8CNU52QjUGZPzs7RD0Ka+g2uC1FLrLRME/1nJB8vUZl5H/Z6Hyi66lSKBCoRBzy
 oM+eTunrR3ZUXPWrM8JQLZUNICB9ZkPhBfsFQeKIIPtXZQc8CW3DntFK7EKS2Iw/OngDsxuVk
 pEt/rNuIZAXpu9a/DZoL24nQr9wxzll9arxysdXnuGdgY=
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

Hi Jeremy,

Am 05.07.24 um 17:03 schrieb Lukas Wunner:
> On Fri, Jul 05, 2024 at 12:22:33PM +0200, Stefan Wahren wrote:
>> Am 05.07.24 um 10:48 schrieb Lukas Wunner:
>>> The real question is whether BCM2848 platforms likewise cannot disable
>>> the clock of the dwc2 controller or whether this is specific to the
>>> BCM2835.  Right now dwc2_set_bcm_params() is applied to both the
>>> BCM2848 and BCM2835.  If the BCM2848 behaves differently in this
>>> regard, we'd have to duplicate dwc2_set_bcm_params() for the BCM2835.
>>  From my understand BCM2848 refers to the same SoC, but the ACPI
>> implementation uses a different ID [2]. So I think this is safe.
>> [2] -
>> https://patches.linaro.org/project/linux-usb/patch/20210413215834.3126447-2-jeremy.linton@arm.com/
> Careful there, the patch vaguely says...
>
>      With that added and identified as "BCM2848",
>      an id in use by other OSs for this device, the dw2
>      controller on the BCM2711 will work.
>
> ...which sounds like they copy-pasted the BCM2848 id from somewhere else.
> I would assume that BCM2848 is really a different SoC and not just
> a different name for the BCM2835, but hopefully BroadCom folks will
> be able to confirm or deny this (and thus the necessity of the quirk
> on BCM2848 and not just on BCM2835).
could you please clarify this situation?

Thanks
>
> Thanks,
>
> Lukas

