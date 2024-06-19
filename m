Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A713A90E442
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 09:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0F10E9C6;
	Wed, 19 Jun 2024 07:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XXBMET56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B8110EA87
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:23:02 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-70df2135426so1266487a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718781782; x=1719386582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+FveVfxPudO0I6HFCr6cHBBWBZ89yS/VFWEzd7gyK5w=;
 b=XXBMET56bAaaBjTVrvMm+YnXQpJvJuQkYASowjdod6wSOO151TVBSEFFy8IPUyzeRJ
 4acrYl0/ytOZqqmU7s/hmgUp0g5kLDb2+ETgvNqRO1Ws+Y7pgukRF7svnduh6mLI3DQn
 gd4FY5wRQgUWsDGKYSJnhO7z4DotSfS+VhkDVQ1GwhV/pZu1nwMztlADc8P+W0zxdBqy
 ee6DQBPYcGKcrUdRvVC/MTkchm7984JSeDweFFAne9CZVNjito+Emw5/0mr9kKpc75gd
 SqeIgz0Pt89VUCav1a4Se0l/TIH0u/UIu4/gQDxwNtEwU3aoeAR3D5wxTp0e2axLp515
 uV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718781782; x=1719386582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FveVfxPudO0I6HFCr6cHBBWBZ89yS/VFWEzd7gyK5w=;
 b=SMVLfGfAYOlaC+nuWJcCN0FeuoeG+jLv6GDT7ZQuw0MI9scrd0W7VqcRnjZDlpYHlQ
 cK7rNq9L+YZ1r28HZW0oWkNJp4Y2/Ao2zKIMJ5L/KgNHMs/prUQU3tEmlovWEcEOChF/
 42u3pAchRK2cMCh4SwzprulM3lvE54PuMYHDBggITPwxsSgMdLDysVkkYcOPmn8J2BxI
 z2pnGUeT0XG6sUqsJgrUO5u417TsKnnhtzvoqg1fp7RnRwMWAcQHsTmmZg0DkaI8M8zu
 wyF82ouaEJlHa3hsrtHpbHEbYvhmzGQA+0nqw/MzN9H4PdV2fJG83g9vpMNqRVhU6iGQ
 BN3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQbO4XmEj6KX/PfktUNhJOPRfE1RMgQuO+1AnsCu94eiD4lFZCBNjYpwOQRpu6JhgtsZwfllSMGZpJW+/A0+vFzhJ3U6QSmzbEOQg1+e/Q
X-Gm-Message-State: AOJu0YxKT8PiYP7NNsbEffvotABAcUm7AZkJgTA5eJgU6rh4GeYTKP1s
 SQsF3C3sDAmrBx+pqHz8dSIgvVFC3Spc9V3XJFLTuayHaS/7/++iKYnYVuhJ
X-Google-Smtp-Source: AGHT+IFktMVASJzQCiDMim5aegxCPE0SwjlCRAhAZzOnDGvYTZRFtUSmGK2jeUmrQXz/C8k/0mlWag==
X-Received: by 2002:a17:90b:1107:b0:2c2:f26a:59d4 with SMTP id
 98e67ed59e1d1-2c7b5d57cf7mr1753675a91.32.1718781781989; 
 Wed, 19 Jun 2024 00:23:01 -0700 (PDT)
Received: from [10.0.0.19] ([122.172.85.149]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4c466bf5fsm12085934a91.35.2024.06.19.00.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 00:23:01 -0700 (PDT)
Message-ID: <a9312102-44c1-4529-b3ef-a7831392c42f@gmail.com>
Date: Wed, 19 Jun 2024 12:52:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dianders@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240619033351.230929-1-tejasvipin76@gmail.com>
 <mozxxkpqlboh2w7bf55bezgcy5b2jfgepmgullgd24dtmwfva2@mghwg3c5an5y>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <mozxxkpqlboh2w7bf55bezgcy5b2jfgepmgullgd24dtmwfva2@mghwg3c5an5y>
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



On 6/19/24 12:06 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 19, 2024 at 09:03:49AM GMT, Tejas Vipin wrote:
>> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
>> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
>> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
>> raydium rm692e5 panel.
>>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>> Changes in v2:
>>     - Change rm692e5_on to return void and take mipi_dsi_multi_context
>>       as an argument.
>>     - Remove unnecessary warnings.
>>     - More efficient error handling in rm692e5_prepare
>>
>> v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@gmail.com/
>> ---
>>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 237 ++++++++----------
>>  1 file changed, 99 insertions(+), 138 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
>> index 21d97f6b8a2f..9936bda61af2 100644
>> --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
>> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> 
>>  static int rm692e5_prepare(struct drm_panel *panel)
>>  {
>>  	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
>>  	struct drm_dsc_picture_parameter_set pps;
>> -	struct device *dev = &ctx->dsi->dev;
>> -	int ret;
>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>>  
>> -	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to enable regulators: %d\n", ret);
>> -		return ret;
>> -	}
>> +	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> +	if (dsi_ctx.accum_err)
>> +		return dsi_ctx.accum_err;
> 
> int ret, please. Let's leave dsi_ctx.accum_err for DSI errors only.
> LGTM otherwise.

Is this really necessary seeing how regulator_bulk_enable returns
0 on success anyways? It saves creating a new variable for a single
check. In case you do think its necessary, should it be changed in
himax_hx83102 too?

> 
>>  
>>  	rm692e5_reset(ctx);
>>  
>> -	ret = rm692e5_on(ctx);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to initialize panel: %d\n", ret);
>> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> -		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> -		return ret;
>> -	}
>> +	rm692e5_on(&dsi_ctx);
>>  
> 
> 

-- 
---
Tejas Vipin
