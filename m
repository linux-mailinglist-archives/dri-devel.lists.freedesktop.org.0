Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73009A25CD9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 15:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6E910E523;
	Mon,  3 Feb 2025 14:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aaVnec0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0ED10E523
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 14:38:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4361e82e3c3so6885645e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 06:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593519; x=1739198319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yf+n0TinYo89AREfkQSwcLctOI7KSOhc0INb01KNBSU=;
 b=aaVnec0+m4snG67KqDPUkiufuBSroeHKgfavra/2dOlo94Pr6W47w6apvb9x2gue9X
 7mrChdhedrhNjlyJbvknWbI0EoEBPvptTISDfwUIcj7+DPN3aC38SEAqQO1e90RLVMSz
 pgbLZEjBFZAqxG60T629xH6/NAZ02P5l7FKn+7eel/QiwGNYSFmaPUjmXjWuAuH5SzNi
 4FH+fhPCk86vYmz43CD/fo1mF/zE0AFYpZS+eTM8Qpk/pPwHXoCGN+BXAlkSkyX+q+ht
 KbOB3ZDI8VYGDUFW93t/680fJ9TygCAyilNkgjg8Aj7520qTcYRsD5og0DXJchlIED/0
 pOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593519; x=1739198319;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yf+n0TinYo89AREfkQSwcLctOI7KSOhc0INb01KNBSU=;
 b=Mv6/Basprz19YA4DrcUczStpHHG5rIRQwijaCqUhzffdHng3FhXGZIXbXYCgdcEY9H
 uhvhU+1/itdVU4oIVEuFMmsc8A5dsqC6dMw/OSOTIqRLoyWu5uYTSqlK2RZKrQP4aMTY
 3pBggNO4qogZydWyoRFaXj2c5ZyjE5OEECW4bIsdLzbnj0OjkzH4e4cXNFRMJmG2MAVG
 gQ4nXBCk2duYH0jK/FAbbhkDNi5CvsRROuugV+41x9XqHxQdeSWgGmgFRbMEJBFn83N+
 4LReWLubiC/qkf+R8dpEtz4hejXN5u3CvnlVkONlrDvKMbAeQnpZZGTjfCR0vy4eBKGs
 2qog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKepOGtKF1mDOP+OnOJ4hOB0+epTpPT71LghkO3N+Tl94Zr3CPvsqAL2KpE9kQrdoanzRh2wjYmOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIdvppW6yHzkMfYIkvWi8h8heWR2GLQErCsXNnyrXE7+MQPCxD
 5i2aIRlEBBONRJ0aobnEz9/tWXgXaTqi2PwEnZ9555KYvqz+4uWQqC0MwSmJ5ZM=
X-Gm-Gg: ASbGncvx2pUOKFktdJhwjhH2H9NUJ53aInMAUhJiWbV92eaY0rH7IM3ZlRYYYIX81DO
 N3E/c+l8+HMh+hoTm37sxijFbCL6PkngYt7tjrvCNaFTpXU0BCwdWkUhJNMkH7e9U7f5doGF7C4
 X9RWM4Kn03GtHfbUaB2de2EdgIBWOG5oyt0wtrH0OjGZtaIT6GvmiiutFVQefHHFJVwo+Sf4xU+
 70EYQkxWmn8v+M61+nwdc8BQggdOqdKl0f9d3oszRHFYwja/aeinOdbXUDLdOfo2HhGtMFGcL9B
 aBrK8qzJrf0+Nx+lxlpAXavsLEEEwDa41hk=
X-Google-Smtp-Source: AGHT+IGK+lz6AfjsW3TZZnmmZja5p2ItZdreBVS47rvFsrGMtPtPEHmSE5JsQCcwCGgyAD+WQEsqnA==
X-Received: by 2002:a05:600c:4f01:b0:436:fb10:d583 with SMTP id
 5b1f17b1804b1-438dc3a3ee6mr75991205e9.2.1738593519079; 
 Mon, 03 Feb 2025 06:38:39 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c11b851sm12770955f8f.43.2025.02.03.06.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 06:38:38 -0800 (PST)
Message-ID: <b2bcd64e-274e-4b51-9d9f-68bf7c8244ee@linaro.org>
Date: Mon, 3 Feb 2025 15:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
 <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
 <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
 <7srflbpb72amuky33bv2etyuo2wcmrcmrlc6sknx37gzp6v6s2@qpxelvzoo6gd>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7srflbpb72amuky33bv2etyuo2wcmrcmrlc6sknx37gzp6v6s2@qpxelvzoo6gd>
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

On 03/02/2025 15:35, Dmitry Baryshkov wrote:
>>>
>>> PLease add these bits to the corresponding XML file (here and later on)
>>
>>
>> I need some more input from you - I don't know which XML you talk about.
>> Do you think about:
>> drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> 
> Yes
> 
>> and others alike? But doesn't it have only register offsets, not field
>> offsets?
> 
> It can, see for example the mdp5.xml, you can add <bitfield> under the
> <reg> node. Be sure to install python3-lxml and enable
> CONFIG_DRM_MSM_VALIDATE_XML if you are modifying those files.

Ack

Best regards,
Krzysztof
