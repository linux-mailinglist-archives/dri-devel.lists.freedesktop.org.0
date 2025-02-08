Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697ECA2DE2C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C942110E484;
	Sun,  9 Feb 2025 13:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HSmJdhvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806A910E087;
 Sat,  8 Feb 2025 19:34:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so20818565e9.1; 
 Sat, 08 Feb 2025 11:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739043246; x=1739648046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7zTCFimJ1vopwwf/s9XZ/VAGKYCECaIBDkzBMbYiPnc=;
 b=HSmJdhvFBXdtPOydXbfXUUQdOHWylRtdifmE4mFZ311sTdJ43OXp5T87N3nYnNRWnH
 e8NakDtIhNJeqCse+MSGzNdE3S/dFHE1gSINrtNzTTrrbdc0Iq0WqrcvKPYRUDDn48f7
 kvwuih6iertEAZz/AdSPynDus9jKwH/tRDee8RRNJPLqmCzLod1W4PVJLlIMGEb2c7Kj
 MQGUW+oyv1glA4j9DIlJP070h9Hl+e3dXqJupfHfvJbvrHFnP/WaZfrrBOpliS4kpeiA
 gS9rMYdfh4fO9staCYoWBh4boAifMyNfdzwy018AMGNECVl78G3ek0Pd56NxIb7EqH14
 riLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739043246; x=1739648046;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7zTCFimJ1vopwwf/s9XZ/VAGKYCECaIBDkzBMbYiPnc=;
 b=arUb/kgIXNjU5AmIEszUcye6hocnuJFxMI0HHHuKC90FlW6iRUOY/Ksu2h47FXFK3y
 C9vfVDaku1PtARE+21Pe1tupqHTrhQR9cy81nJtYFbvWFpUwmcejQfaoFAj8a6lFHElX
 6JSyF7SNRP/3OAmIz0pBa4aWiU+xMSQl9LEIcUvspy4gVeaoXFpqDrFdSsbZwvSMKkl4
 DCfwk+fwrVFIJylwjg/oX8ITGpHaX3D2TFQGPmAY6h4h7kyf9/j6kGXwOGWZtQG40JVU
 k68diJ3LErttNTTf0wPKqwxtBXDq7Y/2KU52UtoBuhTVfUVGdqgACtHqC9hJ9JIzgzM3
 bkqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfBo9xJVjMW1oVCM3OoazEb71CH99LH1U5zeFfx5LqzLwdI8vcEy1OSl0BPbkxAqbbnAR834eGqvbT@lists.freedesktop.org,
 AJvYcCXqaMYUjsSaMHWqlcBVsnn1GboUHk/oJvRqaRMYbStmsmyqeWZv2RA4Y+JNodOY55m8LPdgjFCpSzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSThbN/XqmZ2u6rfIk2LM5srHcYgPnEb7wZirWG7OIdlxJB4SN
 nCUD/wXZvGM8qshiHDH+zwK0oS4Jd5mUqo9DzTyjJPShc2wr0FHN
X-Gm-Gg: ASbGnctcWP+DhC8frWqmoGJJIecysfT6AyFfQx7prJtJgBCoW3YWk/ePaH2tl7gdDGk
 SjMWyUd7ZdQyP8bWzQslS+C+5Ixlc6/bXcvVK1G7+Sko/dn9TLTWEDa6H9Tvq/gNMR64ZisZsVc
 DJelpL5l8l012YuwInFkLHrPWAG19UodoeTB4biYVCBK2ctuUs6r2GW7eg+KLYIJxNQoxfkkWC7
 fJIQCAErGoKOt9xzbnPKxuxHiBaX/BPK0VHoX3zBmUYB6/uV10ldDevsOI7IHzU8iQcOduqxqbI
 0FpukYdGnOrgDlCN0d4Ll+OoOQ==
X-Google-Smtp-Source: AGHT+IF6K1aGzMQrmgg2BtmlzUAKpwYvdiG4gcqs0vFrqKcS/fziiZZl1Tg4aL3qUHceV0U8RBg6Jw==
X-Received: by 2002:a05:600c:a085:b0:434:e2ea:fc94 with SMTP id
 5b1f17b1804b1-439249843b8mr78920775e9.11.1739043245270; 
 Sat, 08 Feb 2025 11:34:05 -0800 (PST)
Received: from [192.168.1.117] ([90.248.169.16])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43936bcc04fsm19994775e9.20.2025.02.08.11.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 11:34:04 -0800 (PST)
Message-ID: <7a370271-1372-4588-8be9-ea7ea93d7a79@gmail.com>
Date: Sat, 8 Feb 2025 19:34:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dp: account for widebus and yuv420 during mode
 validation
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
Content-Language: en-US
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 09 Feb 2025 13:55:44 +0000
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

On 06/02/2025 19:46, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - move msm_dp_wide_bus_available() to the next line
> - Link to v1: https://lore.kernel.org/r/20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
>   2 files changed, 10 insertions(+), 6 deletions(-)

This patch fixes a CLOCK_HIGH mode rejection error on the Microsoft 
Surface Pro 11 (OLED panel) which I had previously been working-around 
by raising DP_MAX_PIXEL_CLK_KHZ.

Tested-by: Dale Whinham <daleyo@gmail.com>

-- 
Best regards,
Dale
