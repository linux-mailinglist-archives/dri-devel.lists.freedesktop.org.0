Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3698441F7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2609610FA56;
	Wed, 31 Jan 2024 14:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F5F10FA54
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 14:35:06 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40e9101b5f9so54619525e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706711645; x=1707316445; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pw+U8iahJ0CmhuCN4ZbIgl2mTW7ZjtW2xezbf/dgrRE=;
 b=RqHH1016sfSO3HLshsLl5ksFfg2bcra7Mwj0MGFKGST0ztZT+0bZ8SUZnbCZMHLloR
 yHXKIf4JK4D6qQNVzmDO/l8SIdPlPFWLIbxHemDvs6pCHC5K/c+Ts9s7dkPhsWLA22aq
 hpkThw2cN8njNjUIllsMdLPo3wuwyC4z/57rBWCcqZzXviT0J9sOeon0o8NXse1Q47B2
 HnmB4IxF0rG2f3v+Khq8Rgot+lKKEFgU2/3JnVj7tMjEMOk2DZxYrpJZrGfbKy0yd6Y8
 Rv1GhETKl9JcJ585ACnU1M1TC4e/wADs9Z9sVYyzje4Qoju/DxecIaxWkMdixFh70rIj
 f9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706711645; x=1707316445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pw+U8iahJ0CmhuCN4ZbIgl2mTW7ZjtW2xezbf/dgrRE=;
 b=mUTW/CO6jWHb3uj5V8pzBidrFuPzesGruuha/G/GS0hMM0pV0mTbjFJlQRdFjZ6SMs
 HCcJlZEX1u3YtgY0dK41xPhBh1dzdmFPMwylFxEt0Xkw5O1IszQQyiaP41tRmeGG2b7D
 HIBfVRrLcUJU6hyeYQWxaiUCmSdTue5wTU/jYiy69R5Mov8EcmQE75jXtqO4dw2D5XJB
 mg7LumcN5S7/yjtYifV1OOuuRSZVLiJyQSt9OVyWHvDkovwifp1BlpZLLf9/Qo/jLOjD
 I1biA2Z4wSi5avmLPDopI3l1YtO6DocQ+iN/fjMPibGy94xkTSAb76uJWLdXO6k0Y0Jj
 EWGA==
X-Gm-Message-State: AOJu0Yz2ktZi+YODjXK/q5n2RSZulOEqWXKQu2nInjSCuiBtO1IA22dl
 oOdFaRW+bIuOEryFGNAeIGO1SKcUATo38a/lgi4nUv0X4uwYSfHD8JoudZp8MQE=
X-Google-Smtp-Source: AGHT+IGxibPRLhmvYBASqTzPoOPDIA2DlXiwWGSJOIVvDa/pebaIEuqr9bjfmEhnBIEEMlPlSKnUWw==
X-Received: by 2002:a05:6000:1379:b0:33a:ee08:7541 with SMTP id
 q25-20020a056000137900b0033aee087541mr1386289wrz.35.1706711644956; 
 Wed, 31 Jan 2024 06:34:04 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe790000000b0033afed6e9desm2888638wrm.98.2024.01.31.06.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 06:34:04 -0800 (PST)
Date: Wed, 31 Jan 2024 14:34:02 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] backlight: ktz8866: Correct the check for
 of_property_read_u32
Message-ID: <20240131143402.GA5929@aspen.lan>
References: <20240129122829.16248-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129122829.16248-1-lujianhua000@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 08:28:29PM +0800, Jianhua Lu wrote:
> of_property_read_u32 returns 0 when success, so reverse the
> return value to get the true value.
>
> Fixes: f8449c8f7355 ("backlight: ktz8866: Add support for Kinetic KTZ8866 backlight")
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
