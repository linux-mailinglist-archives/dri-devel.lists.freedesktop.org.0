Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAF36D6EA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 14:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE3E6EB11;
	Wed, 28 Apr 2021 12:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1DF6EB0A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:01:17 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:fc4d:ab2d:afcb:a61c] (unknown
 [IPv6:2a02:810a:880:f54:fc4d:ab2d:afcb:a61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ACE881F41DBB;
 Wed, 28 Apr 2021 13:01:15 +0100 (BST)
Subject: Re: [PATCH v6 0/2] Add support for ANX7688
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <503fc44c-10e4-d4f4-a746-3fe3e6066b80@collabora.com>
Date: Wed, 28 Apr 2021 14:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
Content-Language: en-US
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
Cc: megous@megous.com, chunkuang.hu@kernel.org, jernej.skrabec@siol.net,
 drinkcat@chromium.org, jonas@kwiboo.se, airlied@linux.ie, dafna3@gmail.com,
 linux-usb@vger.kernel.org, narmstrong@baylibre.com, a.hajda@samsung.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org,
 enric.balletbo@collabora.com, kernel@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, pinging here, can one of the kernel bridge maintainers review this patchset?

Thanks,
Dafna

On 09.04.21 18:19, Dafna Hirschfeld wrote:
> ANX7688 is a typec port controller that also converts HDMI to DP.
> ANX7688 is found on Acer Chromebook R13 (elm) and on Pine64 PinePhone.
> 
> On Acer Chromebook R13 (elm), the device is powered-up and controller by the
> Embedded Controller. Therefore its operation is transparent
> to the SoC. It is used in elm only as a display bridge driver.
> The bridge driver only reads some values using i2c and use them to
> implement the mode_fixup cb.
> 
> On v5 we added the full dt-binding of the generic Analogix anx7688 device.
> The problem is that for elm, most of the fields are not needed since
> the anx7688 sits behind the EC. After a discussion on v5 (see [1])
> we decided to go back to the original approach and send the dt binding
> as specific to the elm. So in this version we rename the device to cros_ec_anx7688
> and use the compatible 'google,cros-ec-anx7688'.
> 
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20210305124351.15079-3-dafna.hirschfeld@collabora.com/
> 
> Changes since v5:
> * treat the device as a specific combination of an ANX7688 behind the EC and
> call it 'cros-ec-anx7688'
> 
> Changes since v4:
> In v4 of this set, the device was added as an 'mfd' device
> and an additional 'bridge' device for the HDMI-DP conversion, see [2].
> 
> [2] https://lkml.org/lkml/2020/3/18/64
> 
> Dafna Hirschfeld (1):
>    dt-bindings: display: add google,cros-ec-anx7688.yaml
> 
> Enric Balletbo i Serra (1):
>    drm/bridge: Add ChromeOS EC ANX7688 bridge driver support
> 
>   .../bridge/google,cros-ec-anx7688.yaml        |  82 ++++++++
>   drivers/gpu/drm/bridge/Kconfig                |  12 ++
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   drivers/gpu/drm/bridge/cros-ec-anx7688.c      | 191 ++++++++++++++++++
>   4 files changed, 286 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
>   create mode 100644 drivers/gpu/drm/bridge/cros-ec-anx7688.c
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
