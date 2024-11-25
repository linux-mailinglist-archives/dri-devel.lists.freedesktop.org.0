Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C049E9D87D4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 15:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4196610E66B;
	Mon, 25 Nov 2024 14:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.b="fLZCQyIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6737410E66B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 47E7B3FB17;
 Mon, 25 Nov 2024 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1732544668; bh=UOUHyrClhYT8RMtkXeGlDQvph3N1LZNwe8gDlfAlzfE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fLZCQyIusdh8e3SDTyI7LVc9rrmfiYWSfLv9s4zriOfmK4DmNv28JPSPDsFupZtce
 6ZszlADBdGrZQtZylk5LMQwlNqhQep3WDSIkRQpOs8AePl9hEjo1XZ9AfO/pTyJIc5
 sbvS+3IqCZ/w+BRUu58iIGk0n5KFs1DZseO97HwvrNm4KCt+HGjADIJgbB+AGnNPlr
 2u8j6YfRNeYYwntaCe/CmFBM7A0OCib9Dxz/JryeBK9jXCR6QNDb73NSwrJX8HbGG3
 fKv9aTxY41oEg970X1MluDPuMTjCzgZzWeV83pV9Un/mllsYKboYyPTa+YhVQ825Tq
 MGJSvWD4BUnKA==
Message-ID: <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
Date: Mon, 25 Nov 2024 23:24:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, neil.armstrong@linaro.org
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
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



On 2024/11/25 20:24, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> So this controller only supports a single mode ???????
>>
> Most likely. On all devices it is connected to a single built-in display.

More specifically, the controller obviously supports multiple modes but
it is pre-initialized by the bootloader for the single hardwired
display's only mode. So as far as the driver is concerned, there is a
single possible mode, and there's no point in trying to be more generic
if there is no hardware that would use that.

In general, it is not possible/practical to be generic for reverse
engineered hardware with no specs documenting how to drive it
generically. You just can't know how to implement the options that are
never used in practice. I spent a lot of time on exceptions to this rule
for the GPIO and SPI controllers, and that's not going to happen for
more complex hardware like MIPI DSI.

- Hector

