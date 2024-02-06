Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC284B8EF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDD2112C7C;
	Tue,  6 Feb 2024 15:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bcncsDSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17899112C88
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:11:09 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-560a9738081so901850a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232267; x=1707837067;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BjQKrJiqto5Ob+/v96nV9FtvyMGmkQizdinJfF9BpvA=;
 b=bcncsDScxCTUCWS3SqVhDywiClsESYIBiUvn8J3+ncVMtht/j1S88H4Jzk1aeqtT7z
 phwFXc5le7MVTIvsHTtQoDKnLyjCEz2SIMm4boxNhKcTaNwtSpTwHRTMkNOHbfEiSQWZ
 d4Oq2KlPK6RmmFHCH/oMizALTMb2zd1LbggVuh3xmWOJ4eVralRsjdX61oNxbZ5L6zqk
 war54cNxIb+a1iB3Aw6eHO1fPOKvXvbr9D+WXV3Wig7FFmSBVpT1T1lTxUR0PP9IPEKv
 MW+ffRFvtzzCTTDzEhcx0p/dV9wpRHvQFp/obP+4v6qHY2LBTdIBiG8VuAesuhT3n8GA
 TGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707232267; x=1707837067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BjQKrJiqto5Ob+/v96nV9FtvyMGmkQizdinJfF9BpvA=;
 b=dUweBjoNw5lwQHSE74ygyotlJecCUF8eNpJazYFXupxKBxf4P8uJfZGpgjuIfG3FgL
 +Aq0Nu03m6sOW9tbKOWIRUHfo2/UkqRWAV7M5SyqiZb5JJlgp2jt0y0UWb/GIXCQnPi/
 jbYZWQ6Vkh0sAsIpVfBtLn7SvGmjXWDOsNE5qDNMlrGLZE/+iTq2FjXzonPTQXI1gJ0i
 6uA8S/nbKsV7n3WjkQWf7zxcDWCfBYtd+TKgq9+U09qAGZ9VlDDfFI7TCGyTeN78HQh1
 06HVIwqszZizZPzMzxM0MUcodMEJd8aqZEFDYw1Jekx0IrmVgxPt2WmcFNrnXzncdB+O
 /81A==
X-Gm-Message-State: AOJu0Yw/SK4gPEXyby8ndZR2CezBW0JiVRQhiY10dQjv7BJoREqUU+hC
 erCv9GvwRS2PXfnyTFy3rxs7dEb6nDYY7PBq86egBU+51b8TmG3deC4bmdVu/jc=
X-Google-Smtp-Source: AGHT+IEWuOCt8voz4u+MBpvA4hP3K9km7MbtGtHA6Mv+jBPk9rsHCMaPnCNkcUZWrixdQ7z0/q5ymA==
X-Received: by 2002:a17:906:6d6:b0:a37:e8fb:1649 with SMTP id
 v22-20020a17090606d600b00a37e8fb1649mr1637365ejb.56.1707232267526; 
 Tue, 06 Feb 2024 07:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUpfUWzNOin8Ev9feQsK28lEv8UY0ytQSJdQbrL0dFp3df/wU1rkIi0XWIR+aedXQuVIQ+IECaHKD3CF9ZI/qNZAqfN4Zf4BHDYckYLgx32eiSYvGe7YIk1fuuFSVizeqs7XgsZlVDMntB+zN0F1jtZVVgaYCdOVTviENfQlW4JMbuzm4iXFVqd8j/p98p+uTZWiUUUmPx+3sI+RySJ4tEDABdeq3H2ciFF4JAvcU6vmXN9YbRaTPAAwi2Lclnl9fgxtZhU61QLEBtclp2uGB85QDKPNL1CwAyUJTzFiCFXwO7e/2XpHKhsbqjtmb/yKrzL8qQNsYW6JS7VWBh5aoeW102u+H8B4WTJ2d6EfzI7+hFSdw1aLDw2Z+eBKdgP8sX04McHhz8ZNx39/2sG8carxkbv4HTmZQeD4Q==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a170906048e00b00a378377030csm1252795eja.41.2024.02.06.07.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 07:11:07 -0800 (PST)
Message-ID: <594a9b63-0e3d-4ab9-a1c4-bd25ee40d9c7@baylibre.com>
Date: Tue, 6 Feb 2024 16:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/mediatek: dsi: Replace open-coded instance of
 HZ_PER_MHZ
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-6-angelogioacchino.delregno@collabora.com>
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> In mtk_dsi_phy_timconfig(), we're dividing the `data_rate` variable,
> expressed in Hz to retrieve a value in MHz: instead of open-coding,
> use the HZ_PER_MHZ definition, available in linux/units.h.

-- 
Regards,
Alexandre
