Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FEB7E328
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD25310E81A;
	Tue, 16 Sep 2025 22:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AH+ahPDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C210E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:28:52 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b07c28f390eso762902666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758036531; x=1758641331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RF3WI9lwfvZNWeJ7kfn1lRX1BxBApCYMK3bTcDdRZGI=;
 b=AH+ahPDVvBnOsWlEqgfDb14VOVmICzTEo4P0B6Br3md1owhkE2SmzYFD9rHTDTByeK
 OPkIQ+CRFYcPh6aQ472haZwKer7qqAWEwx3zM3hjbpv/BtUcQr60BmtIKFpRiO/YWsxn
 Mm9XmpGBbDOaC00NdSi2u7R7pyk8oJlWwz1Zihf11tmSSFGc0W2iqEHZ7OX/B6HwYBB3
 uTwe2J9eKQLJq7lnaqd+e7Vup/2KBpEfo/Bhn0MfVqoJCPB5Bd8xauvHuC/NDTEwTFhd
 d7FYOj+10CxORlptwBYn3Kq8209ph4RkopN0L3gJ0NLkKH8nV8Phfc9lIScflurcqsOd
 PHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758036531; x=1758641331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RF3WI9lwfvZNWeJ7kfn1lRX1BxBApCYMK3bTcDdRZGI=;
 b=WoUmJ+G86Sv4F9q3TG4qE2MbiWksFBTQchgjzWaRnJbtDcYdJPOGoz46wsxIRRRd4e
 A/1WH3U3YM8kHvyE7koFipOWwc2MdXbY6hv1rMUqGB1vWiPPRM8E8hGs2Tx0nId2jgQG
 nch3tISM/BP6KeKO1ikh1aY6QVdldNHBGHzlCXSSGqGlR9nNF3sG2CNWFUem3AdFoHTH
 iPdBRRo9HUg+Hs6djolw6V3WS37eFfI7+PbF8PDIguCQl3lqgvcS8YHgMCWeukUzv9sh
 q7WBhI8EOlvkjBfKsjy76cgSsdhlAISczdG4s39UBtPKKjOHuJw4aylSs2lzLHaw+DCe
 q8kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHQjs4VmPUoxkCLTb7glFcl8B4qJMRtFkI/VAZwHiGGlugMPTj8RgFN9COeKrDVzQySfObXuRSyz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6CFXSwr10DqoYoTYDAuA2ZowxcU4Z02R1g2skvHq4ZRTPzGqD
 nh5ftrGGs6Vkh06Set92uRmDUa6m9kdJ+01nhRBx2n0bu0Arvd/vV0g7
X-Gm-Gg: ASbGncuz1VaI80ygkwuEfWLQnJKZSd9w4dK77kIeoUUVrnsT6MoYoiwOjwg5MH8Ap0J
 /FvDTFeBYNV3vXLYS+lESFUYCtkBgP9Kg0nq7ONmg2gvdRhJCGqXl4drJSObIHgyR49cIzDd+ui
 rJDcAicPJpp6LJOB3A7SiOydKpWEOCB8LBdel/3XbW7mgkxOQOt6N18wn/BuEgxlA65jgoIY1KY
 pVZ/ktBmkqKryM3PTOWfG5TPC7yHrZEBA3D90TE9NHbKFoxkbdPnWlavFx6HKOqd0UaHkfRkY0X
 4IgNq9dGwJGN/7r2nXJe0p6qXXC26LVF+CyrIe7B2Xa7rnAo5TFx0iJzDu3yV5LjC1Zv+iBsyb1
 wALSq1acGtzcfx9rvkLYnc/G03ldJA6VQ+gaX4kYQduoMjnX+zFZplLrtgsA6MQw1FQrVKlO918
 zQ8ssajKUb4yB0jnPq
X-Google-Smtp-Source: AGHT+IH6lZbtHxH/7gxxN1MDdzkJX12I6R0YroM7gEIo/uBKwFu86PByiOXZ3s0NICwjy+v5YWGGwg==
X-Received: by 2002:a17:906:fe0b:b0:b04:392e:7168 with SMTP id
 a640c23a62f3a-b07c37fd0f2mr1648080766b.42.1758036531087; 
 Tue, 16 Sep 2025 08:28:51 -0700 (PDT)
Received: from [10.0.0.176]
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da27esm1198473066b.6.2025.09.16.08.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 08:28:50 -0700 (PDT)
Message-ID: <6e886700-24a8-4127-9324-7245b6cbf6b7@gmail.com>
Date: Tue, 16 Sep 2025 17:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Transition to LP mode on
 every video line
To: Doug Anderson <dianders@chromium.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250916142047.3582018-1-ghidoliemanuele@gmail.com>
 <CAD=FV=Uftrv=x6CuG7edLCSAi16Kv=ka7qxPViuLM=BEG8pC3Q@mail.gmail.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <CAD=FV=Uftrv=x6CuG7edLCSAi16Kv=ka7qxPViuLM=BEG8pC3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Sep 2025 22:36:40 +0000
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



On 16/09/2025 16:45, Doug Anderson wrote:
> Hi,
> 
> On Tue, Sep 16, 2025 at 7:22 AM Emanuele Ghidoli
> <ghidoliemanuele@gmail.com> wrote:
>>
>> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>
>> The component datasheet recommends, to reduce power consumption,
>> transitioning to LP mode on every video line.
>>
>> Enable the MIPI_DSI_MODE_VIDEO_NO_HFP and MIPI_DSI_MODE_VIDEO_NO_HBP
>> flags so that the bridge can enter LP mode during the horizontal front
>> porch and back porch periods.
>>
>> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>> ---
>> Cc: Douglas Anderson <dianders@chromium.org>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Jayesh Choudhary <j-choudhary@ti.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Cc: <linux-kernel@vger.kernel.org>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> I put this on a sc7180-trogdor based Chromebook and the display no
> longer comes up. I don't personally know the MIPI side of the spec too
> well so I have no idea why that would be.
> 
> -Doug

Hi Doug,
thanks for the test.
According to the datasheet, LP is recommended for the front porch and optional
for the back porch.
Could you please run another test by keeping only MIPI_DSI_MODE_VIDEO_NO_HFP
and removing MIPI_DSI_MODE_VIDEO_NO_HBP?

dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_NO_HFP;

Kind regards,
Emanuele





