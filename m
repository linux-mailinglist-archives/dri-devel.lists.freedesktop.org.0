Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHKlOdCKdmkxRwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 22:27:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B608280A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 22:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D5810E1A2;
	Sun, 25 Jan 2026 21:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6RODWlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C067310E184
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 21:27:39 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b8849dc12f6so571619066b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 13:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769376458; x=1769981258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YW+707/LYVsvMoW4gkqX/ApdK27pGLRe7MQshHwusJw=;
 b=e6RODWlCByl0Jcjnog+knrAoqjsmWE3JZkzUE1sgmMEtnIaNNqj9kItACfN/tXWjI6
 DlkVf3O4URdxCsnjWgvCvjfjAix19MrIqnRygID4a6iSvHKFJX+cDK+I6isG8roqG9sW
 7iV0gWBsoIJeKm78mprOTZsza4AggU00MS8g3DCJXMV+xTPkzTJPd4wCcjMp0/GvFvtG
 dLy8WrHR/nICvGK6itiRyGxHDZ25VtYwoDfWnJmRws3QrLQbDE0pJEri0TVrRR+3yXrF
 s3PYObXgLoC2d0NNjN4vH9/5yMSiGlPyEEXbMkvdztXBlwwNbfTl7dgoOfa0BEiBtSOj
 XkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769376458; x=1769981258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YW+707/LYVsvMoW4gkqX/ApdK27pGLRe7MQshHwusJw=;
 b=xSD60A0169OitlY3CRlR7yGgeewliIzeD+4X1D5zMl74m5s5rYWB7u/ig/WTiXCk0k
 Roo+kOTgfJyK6Ex1rVWqBx+kPLRb9ExBSMuSesBdpce+uYDKJaIql2PqFifhLAAR1tdd
 C72ro6kriuL5lRcAR60h+ItsrgyuzaiHRrXS7kyeQvTC+P0ATVbq7ynu6Ax2GEZhkMkP
 O1Bz2dsv+sQrf1Ly3Q5MnNikD6Dz1dcLOBb/40/z/1dD7yoGOWwSK1Be6+fNbqegwgfy
 59jOghlsgVz4wBelAJWmcQ8X+y107mglQmYTCnlFRwWtqNKx2imwX1boQWYJpEmbyru+
 uc/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuNUfkZSy+hRZ/rgqncU7GxhC+5zPAZcfJoZ9UiNYl0PQ82gBbSlLGgnNyQuma91niw9Wd83kCOXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJtsZkc1bANOrBKzQw7/gC4n9AnXg0AaSjnba4nNApHss16bbD
 2eJob/KW0FTlyH0c0OJeS0hlxxXbFkMz4HFkJXoQPzyLgG8/Sju9Moj9ZAyDkzqHCVc=
X-Gm-Gg: AZuq6aL5EzKtRVLthXYQkkZMw0HKFgOkjdWO2Q2suws7O5dYVVWo2WZcDh81Op3vA4U
 eqANwIuITDWzbY0AOXM92BtkWVEobNK1PAPOHacuv7owihmKKRV4SQqQZORR//Zq7/Exd8Ls3gh
 k9IpAlYdIjT8M11cWC8qcE0eesseZ6L8MFAisq72GJhwH2d3BBEftCupvLg87bOGbUlyx4HE3Gr
 HUlUcca5uxXXb3dF7VzwFm7wttD05zFeTAZOVAzUZSQDLxzL0J4shC5C7hh54Pq97aZWHuJ7xiI
 qXAPmYTUzgezyVMentzzrZTFQXFKg3FQPIHrF+l6/PNAShUs8aIz5rSzo5Ml1ncnLS0aguvUFtw
 cbMZ0LuvsB6wfCNuWAPcOjmQtvSfUdLXmFeRuwmcNPIUhX1oH2b68WhZuz8vnUL8TObebttbRjB
 1wnx2CP6BdBlPkicxjo7509pp7A2GEstaVanuCXTQBBXsNLmFfH6elIUqganqVerVOUB9kIohu5
 g==
X-Received: by 2002:a17:907:86a6:b0:b87:695f:d2a8 with SMTP id
 a640c23a62f3a-b8d2e5f6840mr156740366b.55.1769370139323; 
 Sun, 25 Jan 2026 11:42:19 -0800 (PST)
Received: from ?IPV6:2a02:8010:6606:0:fd30:74ec:a5b0:107a?
 ([2a02:8010:6606:0:fd30:74ec:a5b0:107a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm506560566b.12.2026.01.25.11.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jan 2026 11:42:18 -0800 (PST)
Message-ID: <c9dd365b-ad8f-410e-96f8-f914f03634b2@gmail.com>
Date: Sun, 25 Jan 2026 19:42:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/9] Add Type-C DP support for RK3399 EVB IND board
To: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20260119073100.143-1-kernel@airkyi.com>
Content-Language: en-GB
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kernel@airkyi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:hzpeterchen@gmail.com,m:luca.ceresoli@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:heiko@sntech.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:yubing.zhang@rock-chips.com,m:frank.wang@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:amitsd@google.com,m:chaoyi.chen@rock-chips.com,m:dsimic@manjaro.org,m:jbx6244@gmail.com,m:didi.debian@cknow.org,m:pbrobinson@gmail.com,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rock
 chip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sigmaris@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[airkyi.com,linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sigmaris@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email]
X-Rspamd-Queue-Id: 45B608280A
X-Rspamd-Action: no action

On 19/01/2026 07:30, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This series focuses on adding Type-C DP support for USBDP PHY and DP
> driver. The USBDP PHY and DP will perceive the changes in cable status
> based on the USB PD and Type-C state machines provided by TCPM. Before
> this, the USBDP PHY and DP controller of RK3399 sensed cable state
> changes through extcon, and devices such as the RK3399 Gru-Chromebook
> rely on them. This series should not break them.
> 
> ====
> 1. DisplayPort HPD status notify
> 
> Before v7, I implemented a variety of DP HPD status notify. However,
> they all had various problems and it was difficult to become a generic
> solution.
> 
> Under the guidance of Heikki and Dmitry, a decoupled notification
> method between the TypeC and DRM subsystems was introduced in v7.
> First, a notification is sent when TypeC registers a new altmode.
> Then, a generic DP AUX HPD bridge is implemented on the DRM side.
> 
> During v7-v10, we added a new notifier in typec to notify the altmode
> device register event. With the help of Greg and Heikki, we implemented
> the reuse of notifiers for the type bus itself in patch1 of v11.
> 
> The USB subsystem related parts have already been merged into the
> usb-next branch in v13 [0][1]. Therefore, this series no longer includes
> these patches starting from v14. Thanks to Greg and Heikki!
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=67ab45426215c7fdccb65aecd4cac15bbe4dfcbb
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=4dee13db29de6dd869af9b3827e1ff569644e838
> 
> That makes it redundant for each Type-C controller driver to implement
> a similar DP AUX HPD bridge in embedded scenarios.
> 
> ====
> 2. Altmode switching and orientation switching for USBDP PHY
> 
> For USB Type-C interfaces, an external Type-C controller chip assists
> by detecting cable attachment, determining plug orientation, and
> reporting USB PD message. The USB/DP combo PHY supports software
> configurable pin mapping and DisplayPort lane assignment. Based on
> these message, the combo PHY can perform both altmode switching and
> orientation switching via software.
> 
> The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
> fusb302 chip as Type-C controller. The connection diagram is shown below:
> 
> fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
>              |
>              +---> USB/DP PHY0 +--> CDN-DP controller
>                                |
>                                +--> DWC3 USB controller
> 
> ====
> 3. Multiple bridge model for RK3399 CDN-DP
> 
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs.
> 
> USB/DP PHY0 ---+
>                | <----> CDN-DP controller
> USB/DP PHY1 ---+
> 
> In previous versions, if both PHY ports were connected to DP,
> the CDN-DP driver would select the first PHY port for output.
> 
> On Dmitry's suggestion, we introduced a multi-bridge model to support
> flexible selection of the output PHY port. For each PHY port, a
> separate encoder and bridge are registered.
> 
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the first bridge in bridge chain and DP
> controller. And Once the first bridge is obtained, we can get the
> last bridge corresponding to the USB-C connector, and then set the
> DRM connector's fwnode to the corresponding one to enable HPD
> notification.

With a similar dts patch [1] on top of this series I tested a type-C to
DP adapter/cable for display output on the ROCKPro64 board, which also
pairs a FUSB302 with RK3399. Booting it up with the cable plugged in
works, as does hotplugging the cable after booting in both orientations.
The correct mode for the display is detected. I wasn't able to test
audio, only video output, as this display doesn't have speakers.

I did once, after unplugging and reconnecting the cable a few times,
see it get into a state where it didn't detect the attached display.
Logs from that unplug/reconnect attempt are here [2] if of interest.
Nevertheless, hotplug seems to work the majority of the time, so

Tested-by: Hugh Cole-Baker <sigmaris@gmail.com>

[1]: https://github.com/sigmaris/linux/commit/91724088b19bee7d248946442a801423e8cd0634
[2]: https://gist.github.com/sigmaris/fa107384a7492583ceee1c2962f5030a

> ====
> Patch1 add generic USB Type-C DP HPD bridge (Dmitry, Heikki).
> Patch2 add new API drm_aux_bridge_register_from_node() (Neil).
> Patch3 add new Type-C mode switch for RK3399 USBDP phy binding (Krzysztof).
> Patch4 add typec_mux and typec_switch for RK3399 USBDP PHY.
> Patch5 add DRM AUX bridge support for RK3399 USBDP PHY (Neil).
> Patch6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
> Patch7 add multiple bridges to support PHY port selection (Dmitry, Luca).
> Patch8 add missing dp_out port for RK3399 CDN-DP.
> Patch9 add Type-C DP support for RK3399 EVB IND board (Diederik, Peter).
> 
> Changes in v14:
> - Link to V13: https://lore.kernel.org/all/20251208015500.94-1-kernel@airkyi.com/
> - Drop the patches for the USB Type-C subsusytem part, as they have
>   already been merged into usb-next.
> 
> Changes in v13:
> - Link to V12: https://lore.kernel.org/all/20251204063109.104-1-kernel@airkyi.com/
> - Only register drm dp hpd bridge for typec port altmode device.
> 
> Changes in v12:
> - Link to V11: https://lore.kernel.org/all/20251128020405.90-1-kernel@airkyi.com/
> - Add missing Signed-off-by line.
> 
> Changes in v11:
> - Link to V10: https://lore.kernel.org/all/20251120022343.250-1-kernel@airkyi.com/
> - Switch to using typec bus notifiers.
> 
> Changes in v10:
> - Link to V9: https://lore.kernel.org/all/20251111105040.94-1-kernel@airkyi.com/
> - Notify TYPEC_ALTMODE_UNREGISTERED when altmode removed. 
> - Add drm_aux_bridge_register_from_node().
> - Fix refcount usage of drm_bridge.
> 
> Changes in v9:
> - Link to V8: https://lore.kernel.org/all/20251029071435.88-1-kernel@airkyi.com/
> - Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
> DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
> - Add usb role switch for Type-C.
> - Remove USB2 PHY in Type-C connection.
> - ...
> 
> Changes in v8:
> - Link to V7: https://lore.kernel.org/all/20251023033009.90-1-kernel@airkyi.com/
> - Export all typec device types for identification.
> - Merge generic DP HPD bridge into one module.
> - Fix coding style.
> 
> Changes in v7:
> - Link to V6: https://lore.kernel.org/all/20251016022741.91-1-kernel@airkyi.com/
> - Add notifier functions for Type-C core.
> - Add generic USB Type-C DP HPD bridge.
> 
> Changes in v6:
> - Link to V5: https://lore.kernel.org/all/20251011033233.97-1-kernel@airkyi.com/
> - Fix depend in Kconfig.
> - Check DP svid in tcphy_typec_mux_set().
> - Remove mode setting in tcphy_orien_sw_set().
> - Rename some variable names.
> - Attach the DP bridge to the next bridge.
> 
> Changes in v5:
> - Link to V4: https://lore.kernel.org/all/20250922012039.323-1-kernel@airkyi.com/
> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> - Place the helper functions in the same compilation unit.
> - Add more comments about parent device.
> - Add DRM AUX bridge support for RK3399 USBDP PHY
> - By parsing the HPD bridge chain, set the connector's of_node to the
> of_node corresponding to the USB-C connector.
> - Return EDID cache when other port is already enabled.
> 
> Changes in v4:
> - Link to V3: https://lore.kernel.org/all/20250729090032.97-1-kernel@airkyi.com/
> - Add default HPD device for DisplayPort altmode.
> - Introduce multiple bridges for CDN-DP.
> - ...
> 
> Changes in v3:
> - Link to V2: https://lore.kernel.org/all/20250718062619.99-1-kernel@airkyi.com/
> - Add more descriptions to clarify the role of the PHY in switching.
> - Fix wrong vdo value.
> - Fix port node in usb-c-connector.
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> - Fix compile error when CONFIG_TYPEC is not enabled.
> - Notify DP HPD state by USB/DP PHY.
> - Ignore duplicate HPD events.
> - Add endpoint to link DP PHY and DP controller.
> - Fix devicetree coding style.
> 
> Chaoyi Chen (9):
>   drm/bridge: Implement generic USB Type-C DP HPD bridge
>   drm/bridge: aux: Add drm_aux_bridge_register_from_node()
>   dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
>   phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
>   phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
>   drm/rockchip: cdn-dp: Support handle lane info without extcon
>   drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
>     selection
>   arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
>   arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
> 
>  .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
>  arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 147 +++++++
>  drivers/gpu/drm/bridge/Kconfig                |  10 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/aux-bridge.c           |  24 +-
>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  49 +++
>  drivers/gpu/drm/rockchip/Kconfig              |   1 +
>  drivers/gpu/drm/rockchip/cdn-dp-core.c        | 350 +++++++++++++---
>  drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
>  drivers/phy/rockchip/Kconfig                  |   3 +
>  drivers/phy/rockchip/phy-rockchip-typec.c     | 373 +++++++++++++++++-
>  include/drm/bridge/aux-bridge.h               |   6 +
>  13 files changed, 914 insertions(+), 84 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> 
