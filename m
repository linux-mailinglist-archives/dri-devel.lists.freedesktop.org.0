Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB21BD1117
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 03:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8706C10E02A;
	Mon, 13 Oct 2025 01:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Bxg8VLDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155106.qiye.163.com (mail-m155106.qiye.163.com
 [101.71.155.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D932510E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 01:15:24 +0000 (UTC)
Received: from [127.0.0.1] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 25a39ad8a;
 Mon, 13 Oct 2025 09:15:19 +0800 (GMT+08:00)
Message-ID: <83281501-8957-4ca1-8e0e-0b72ddd74b43@rock-chips.com>
Date: Mon, 13 Oct 2025 09:15:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-4-kernel@airkyi.com>
 <xbblw4jfte7re2pyroanvzqv4ddwhxbgcui5ubpnw7rwuo4s4d@gkph7jqzf33o>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <xbblw4jfte7re2pyroanvzqv4ddwhxbgcui5ubpnw7rwuo4s4d@gkph7jqzf33o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99db22dcf303abkunm0713f548f8facb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0dQ1YaGklOTEIaHR4YH0xWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Bxg8VLDz1S1QU32Fy2HDcfvislNrJJ0uqNay+meHZQFma6Tad3Sto7NFGOCh3TqmeUBj54gnStcWhE8/KozzYBg4GvmPcV4rMFPnEgs/h30WSTTKCT8WXZx4iN3GJGmO7W3qhPHRjXv3jiF2QOrzKOBxLX8bcko/TH9ZA5Yh5p8=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=cvq/ACMwX3OnpD71UH1+PwfyZlhDdznUFw1/2vndRWE=;
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

On 10/12/2025 12:57 AM, Dmitry Baryshkov wrote:

> On Sat, Oct 11, 2025 at 11:32:28AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This patch add support for Type-C Port Controller Manager. Each PHY
>> will register typec_mux and typec_switch when external Type-C
>> controller is present. Type-C events are handled by TCPM without
>> extcon.
>>
>> The extcon device should still be supported.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> (no changes since v5)
>>
>> Changes in v4:
>> - Remove notify DP HPD state by USB/DP PHY.
>>
>> (no changes since v3)
>>
>> Changes in v2:
>> - Fix compile error when CONFIG_TYPEC is not enabled.
>> - Notify DP HPD state by USB/DP PHY.
>>
>>   drivers/phy/rockchip/phy-rockchip-typec.c | 365 +++++++++++++++++++++-
>>   1 file changed, 349 insertions(+), 16 deletions(-)
>>
>> @@ -850,6 +998,72 @@ static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
>>   	return mode;
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_TYPEC)
>> +static int tcphy_orien_sw_set(struct typec_switch_dev *sw,
>> +			      enum typec_orientation orien)
>> +{
>> +	struct rockchip_typec_phy *tcphy = typec_switch_get_drvdata(sw);
>> +
>> +	mutex_lock(&tcphy->lock);
>> +
>> +	if (orien == TYPEC_ORIENTATION_NONE) {
>> +		tcphy->new_mode = MODE_DISCONNECT;
>> +		goto unlock_ret;
>> +	}
>> +
>> +	tcphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
>> +	tcphy->new_mode = MODE_DFP_USB;
> Carrying over unanswered(!) comment from the previous series:
>
> I don't think it is correct. Orientation defines only the cable (plug)
> orientation. You should be getting the mux events for the mode
> selection.

Sorry for that, I forgot to modify this part. Will fix in v6.


>
>> +
>> +unlock_ret:
>> +	mutex_unlock(&tcphy->lock);
>> +	return 0;
>> +}
>> +
>> +static void udphy_orien_switch_unregister(void *data)
>> +{
>> +	struct rockchip_typec_phy *tcphy = data;
>> +
>> +	typec_switch_unregister(tcphy->sw);
>> +}
>> +
>> @@ -1037,6 +1251,89 @@ static const struct phy_ops rockchip_dp_phy_ops = {
>>   	.owner		= THIS_MODULE,
>>   };
>>   
>> +#if IS_ENABLED(CONFIG_TYPEC)
>> +static int tcphy_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
>> +{
>> +	struct rockchip_typec_phy *tcphy = typec_mux_get_drvdata(mux);
>> +	struct typec_displayport_data *data;
>> +	int hpd = 0;
>> +
>> +	mutex_lock(&tcphy->lock);
>> +
>> +	switch (state->mode) {
>> +	case TYPEC_STATE_SAFE:
>> +		fallthrough;
>> +	case TYPEC_STATE_USB:
>> +		tcphy->new_mode = MODE_DFP_USB;
>> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], 0);
>> +		break;
>> +	case TYPEC_DP_STATE_C:
>> +	case TYPEC_DP_STATE_E:
> You need to check that altmode->svid is DP before checking for these
> modes.

Okay, will fix in v6.


>
>> +		tcphy->new_mode = MODE_DFP_DP;
>> +		data = state->data;
>> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
>> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 4 : 0);
>> +		break;
>> +	case TYPEC_DP_STATE_D:
>> +		tcphy->new_mode = MODE_DFP_DP | MODE_DFP_USB;
>> +		data = state->data;
>> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
>> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 2 : 0);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	mutex_unlock(&tcphy->lock);
>> +
>> +	return 0;
>> +}
>> +

-- 
Best,
Chaoyi

