Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEDA7EDE7A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A581E10E5C1;
	Thu, 16 Nov 2023 10:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84010E5B2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:29:49 +0000 (UTC)
Message-ID: <50006160-f82b-4ec1-91a4-2ebbd7752e1d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700130588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9Tiz4ZqcvP9PVbA0QUZ7/XAmQaSaESa8alpLYKuTXs=;
 b=gN0djCjFpM84zH6NfgBbkC3hSOihpNiLmCzdaRDiimhppbOM/E9yIbtA4YpVMSGcYtmbly
 Sf2YUGzE1sQelfoBBm9AcQBrB1WuHRsVdO8fG23ata6R0a82V5wlzuqapNRre7wvd1v0kr
 uD/cxYL9mvGHwIQ5KRfKPVqFEu7s+50=
Date: Thu, 16 Nov 2023 18:29:39 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/15 00:30, Dmitry Baryshkov wrote:
>> @@ -703,14 +704,32 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
>>                                   enum drm_bridge_attach_flags flags)
>>   {
>>          struct it66121_ctx *ctx = bridge_to_it66121(bridge);
>> +       struct drm_bridge *next_bridge = ctx->next_bridge;
>> +       struct drm_encoder *encoder = bridge->encoder;
>>          int ret;
>>
>> -       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>> -               return -EINVAL;
>> +       if (next_bridge) {
>> +               if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>> +                       WARN_ON(1);
> Why? At least use WARN() instead

If (next_bridge) is true, it says that the driver *already* known that
it66121 have a next bridges attached. Then it66121 driver should certainly
attach it, no matter what it is. Either a connector or another display bridge.
It also says that this is a DT-based system on such a case. CallingWARN_ON(1) here helps to see(print) which DC driver is doing the wired 
things. Ok, I will remove the WARN_ON(1)  on the next version.

