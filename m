Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D0FA87087
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 06:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B70F10E074;
	Sun, 13 Apr 2025 03:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G+WNbTV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3819A10E074
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 03:58:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso3146667b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744516728; x=1745121528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9FPY3HTHIj03IKmszQnH75Kpen2MmUTFxMzTsDMW6M=;
 b=G+WNbTV29V04h106Q6aDyh6wep3tEvZdrn+EECFx7Uzwx26cw8v6pOSDxnYHMPg3nO
 xDaBvxxgq4KTnyNx1rwRBbcjHQOLtC/bmj5ygYCTxMXULnnAIKjxETW7e/UGRYmvLoK1
 KTvNUyC2cozqdgSmFDTr752t18gu4M2Ak0dO9XpCNvPP0Z4xfisl8mz9cwp6yykmw9gM
 9V5s8qLtegl1l4h7fY/QXN9GVLuLopPClxKHuWHgOybhHuBsFr3h3li8t/b7ThwF7MU7
 18whWA60t4iiKCFACvuNVjYeG7lLiOq5VTrCJmVbOGfJjdWhorYtvSCwT9wymEIK9dSL
 Yw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744516728; x=1745121528;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9FPY3HTHIj03IKmszQnH75Kpen2MmUTFxMzTsDMW6M=;
 b=RvZN/aGXjkls77HNT6YgDyn60nd4TNoCed/0cI5AnGDydnbmlqmOr7odVs1FKjyzIB
 44zIFPlYgvSePV0ms3+E4R5f4eIov2EyJfslZfMFifQUT+tEgXa5gW48DMpx2cvpXJe+
 snkppoyA0ttJZnGcJgWQb+68TFZ0ewVMYAiOxIpuRgFi/0vMyhcvfGf7PjmlV5fMK4Sm
 019nHn2SEpgFYv0MmX9Iq5KBBuHNH7k4D+UM2Zwi6DlPfPckXqMQ/Td9iDC/grFl3Ery
 L/8QC4F2Xthfu0BW0Bj+i0qfrM8VivFocAG4hdE3SlQ1RgLkhZ5/BrnyWZlkb7Hro7rR
 0J0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPeWZ8kT34rwR1SdMF1FVqlfE8t+q691/gJJTA1yuq4Gtj4J6fPxXJ5oFASyghOeWeWEU1WV+bDSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQbvQWL7+NujasNMFBUW363vUSlG3x8Brskezmy9sWhn9t2dmC
 xiVae/ajvnsNcTemstu2Uh13G/waVkKLsqPci4u1mqGuepoSbDnA
X-Gm-Gg: ASbGncvpANiAOXtXA1gK4ka1I0kWbTSU++m630kXASJlPBKxM2hjLA3ExBUxeuZllEX
 uu1igSg6Dxnc3KK2IqFw2lMrDP+QjYDChfTcb7n3618rCVMjRnopFhpFJLb/D8X+SMNWcfxJzvM
 IeEscRPObzEu+R7QEdwx02XvsnznAhGud6mV08EHRIXE5VGkz+FPxs5IVJT+LBslK1jG0mB8w7v
 kJvjkORPm5AtM4XjYxr0j/L4yvF1893dBjZAJerpwIPB+gat2+eUvIdNVG5dA/nfOVczIGN+fhl
 /dP4gJqcxFhLxqAs/eLOwZthQWXW4lW0ycz84DqXlAgbfg==
X-Google-Smtp-Source: AGHT+IFNzYO6C6UkOWocKUJGaWpoXone2hlK/AtqRsIyacUkJS/m4YkRgzqmHVENHyTnTLM4yXuMAA==
X-Received: by 2002:a05:6a20:e608:b0:1f5:7eb5:72c7 with SMTP id
 adf61e73a8af0-2017996fb78mr10954396637.29.1744516727543; 
 Sat, 12 Apr 2025 20:58:47 -0700 (PDT)
Received: from [10.3.176.134] ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a11d2bbfsm7217487a12.41.2025.04.12.20.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Apr 2025 20:58:47 -0700 (PDT)
Message-ID: <931e9119-4dc0-4241-843d-78241dea92a1@gmail.com>
Date: Sun, 13 Apr 2025 09:28:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asrivats@redhat.com
References: <20250412043006.188641-1-tejasvipin76@gmail.com>
 <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 4/13/25 3:40 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 11, 2025 at 9:30 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
>> improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
>> after the off commands are run in boe_bf060y8m_aj0_off regardless of any
>> failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
>> boe_bf060y8m_aj0_prepare fails.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>> Changes in v3:
>>     - Disable regulators in boe_bf060y8m_aj0_prepare if
>>       boe_bf060y8m_aj0_on fails.
>> Changes in v2:
>>     - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off
>>
>> Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipin76@gmail.com/
>> Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipin76@gmail.com/
>> ---
>>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 109 +++++++-----------
>>  1 file changed, 41 insertions(+), 68 deletions(-)
> 
> As far as I can tell, your v2 and v3 are totally identical. Either I
> messed up, or maybe you forgot to commit your changes?
>

You're right, I'd forgotten to commit my changes. Sorry about that. I'll
send it again.
> -Doug

-- 
Tejas Vipin
