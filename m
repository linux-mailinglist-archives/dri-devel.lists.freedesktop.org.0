Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EC90C8E0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B7D10E629;
	Tue, 18 Jun 2024 11:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l9O6gl2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A8510E629
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:17:31 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52cc1528c83so1066688e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709450; x=1719314250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RQ+i+yUylzc0vNZND2yRwe4IaOpgkA3NphEu3B2GdDM=;
 b=l9O6gl2Ilkg19M9TSDKu5KdpB6hrwzuPCDtx+ilFchoYB0FohF+pVL2i+8fg5P/a65
 bzTarn/Vk35gBX7HMwTichLtG8efHVsqavhj+0ZUJPxW8qFuS7RsMZqH69Vg7urFWPXM
 UQyzBJ/DtoAFjjNUmI6qD44u8tYV659nvgx3hY1xmSmK6TZUseI6Lce7JibVJBEb/vz6
 4N+FHzkhuXenvGWIBblK53tj09w8yRgUlhWvbqTEW5+nZcoR5ERUVRdQIm9G94EbnN71
 r2MCQeNDvdfyL1532Q2NpXTp9m2BOMqflJRFDwmOvxNrJVFYENksV5tLfRgl/GLCNFql
 QnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709450; x=1719314250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQ+i+yUylzc0vNZND2yRwe4IaOpgkA3NphEu3B2GdDM=;
 b=YF+LHMojvzwhDUaKKWb87o2EZkWjrAr4o+rwwKBRUJn/GPKEIAmrDR6aMauom8f5TE
 WLUYS9+jJTJrTx5i3SgX15g7/BhxxxB/AgpqAYbVIPfW7zMZSuYawikdx+0WqHMS/pSq
 xy8fJ/XuTWHsi4qWSGJ4c8uw/tc5ad77Ost3W1OY//1YzYZO4T+GjpvH0jsBnH/KbQ6s
 P3M+h45+4uDdHCs3t+hAu8LERr5MICygeX6YlZeyQRWeiMtr/2bKmQyQjXhyskCi/URS
 Jy/x2MpNzmvYlA61QHCv0KGKZZ5pKmKAQleR6wnUqkXUCL60cXUFdg9De9KkqI+2WVvz
 kwGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYl9TTUt5SyFiemi7jIJ41xNYlE4JBW/cqRFohRn3qHL4fjEwaTEXfuiqRigTcQWxPAEzKgLNR3xN3UNeZJX/l0BrkDZIv7LOcfNjDTgfy
X-Gm-Message-State: AOJu0YwLVzGyrImRF3DYmMqHokNk52Ke4eGPwRMx8Xs8dQmpFYQYG+bS
 dohCciePSWKgZ9tc8LGi4hem1eEEQTekWwrOV4E5KkIf/NeH8YWU/S67kuRYWFQ=
X-Google-Smtp-Source: AGHT+IHHBBxjqquwzsz10R7mhJV/FLoBeBD8boOTDbExy+3KWVhzVyEG734oQ2FbmXMY1nRFQiofEw==
X-Received: by 2002:ac2:43dc:0:b0:52c:82cf:b80 with SMTP id
 2adb3069b0e04-52ca6e9a0dfmr6058474e87.63.1718709450007; 
 Tue, 18 Jun 2024 04:17:30 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2872480sm1474922e87.157.2024.06.18.04.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:17:29 -0700 (PDT)
Message-ID: <290fb9e0-64ea-45ca-87e6-70c0e6edd6a1@linaro.org>
Date: Tue, 18 Jun 2024 13:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-6-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

I think a702 was skipped over

Konrad
