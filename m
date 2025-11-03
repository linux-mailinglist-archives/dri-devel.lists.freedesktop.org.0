Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB3C29C4F
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 02:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBADC10E2E9;
	Mon,  3 Nov 2025 01:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Xf2GCOog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 03 Nov 2025 01:17:08 UTC
Received: from mail-m82144.xmail.ntesmail.com (mail-m82144.xmail.ntesmail.com
 [156.224.82.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4A610E2E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 01:17:08 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2818c2243;
 Mon, 3 Nov 2025 09:11:59 +0800 (GMT+08:00)
Message-ID: <39c21e9f-4958-4007-bb09-3ef40ff30d2a@rock-chips.com>
Date: Mon, 3 Nov 2025 09:11:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-2-kernel@airkyi.com> <aQS8IatWiAUzBUxd@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aQS8IatWiAUzBUxd@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a47455e0103abkunm8b2c313f943871
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5MTVYYQk0YGR1KQ0kfTx1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Xf2GCOogE5JU9VFai8bfqqPO4EwB1WJ7U798BYDMShF5yADbVIRdoEeXupnhnUlWCWamERfBB8hOvuY9KC55ljPx2XdO0aSSZ4aN/YVRrfNdwUmKid0Rkhyi8liJDc6hPFcv+WVwWCoRwFPiFILAWI0NSARBI9pcgXmLDxUm+VA=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=kGpL6uycvY2W1UtRJCq/id+/GMXz5vHEcP9JtnFabFA=;
 h=date:mime-version:subject:message-id:from;
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

On 10/31/2025 9:39 PM, Heikki Krogerus wrote:

> Hi,
>
>> diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
>> new file mode 100644
>> index 000000000000..f3a7b5f5b05b
>> --- /dev/null
>> +++ b/include/linux/usb/typec_notify.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __USB_TYPEC_NOTIFY
>> +#define __USB_TYPEC_NOTIFY
>> +
>> +#include <linux/notifier.h>
> Replace that include with a forward declaration:
>
> struct notifier_block;
>
>> +enum usb_typec_event {
>> +	TYPEC_ALTMODE_REGISTERED,
>> +	TYPEC_ALTMODE_UNREGISTERED,
>> +};
>> +
>> +int typec_altmode_register_notify(struct notifier_block *nb);
>> +int typec_altmode_unregister_notify(struct notifier_block *nb);
>> +
>> +#endif /* __USB_TYPEC_NOTIFY */
> I don't see any need for a separate header file for this. Intoduce
> those in typec_altmode.h.

Will fix these in v9. Thank you.


>
> thanks,
>
-- 
Best,
Chaoyi

