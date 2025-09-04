Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E0B442A5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 18:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5127E10EA95;
	Thu,  4 Sep 2025 16:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j9/dJnO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4457310EA95
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 16:26:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45dd16c484dso6200055e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757003204; x=1757608004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7Zmn33NQED22wCKZ1Y3FA6Co5AVovjnCCeYLb4pKYh0=;
 b=j9/dJnO/rMT5HZO8yNlxqmpnswELuoQ10sLQdBolTqTTpxHlZKXvz0dG9o9ILLMlUz
 hDj6Aryu8Bp0vRHx8DIfDI7omfNT5UtMRHoORpDCjR3PNri5HQGJORaesSkgWDRetN6J
 novOvsxrtXU2k2XjPBNRMOH5/sfZDUpHhwcIGpTkNxkG3FCh3V4YRHmPiEyFzcqkt857
 E8o+/v0uDQLSptHygPhchGeTwROjVVx9tbdRo4g6x+xADzD2mZa4wi+/czZOF5w8cKns
 5M39EGKBeAXJudi0a2ArK2Oa8V3fVCC8VajAgGQxuEK/OeFrKjWXxuGEYfnWnk8Uhqub
 4GPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757003204; x=1757608004;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Zmn33NQED22wCKZ1Y3FA6Co5AVovjnCCeYLb4pKYh0=;
 b=ZvmE2I6JVnEf6x8PCYGK8afeClEMisFrJxax75FJxF8Mi8tuHlIvbxsL3SICuQjLpE
 TNTcLBkPRI+dxYNqOr/l5tuILiKcf2JEEdQJND9y7rq1uutksa5RY2JM5JSCuhMdvBDK
 4/7/6OGfC5Og5ULoRmbG7dB/inj9GBz3/DYSlP6i8+OVfrj1ya89eixF1o1QKZg0daRN
 NciAibIoNUxE3FxFmcMXPyk8+4CECqEGJxyJGgxeolmWe54zR9QBWP0C7bWqE37/Bzfl
 pcW4sYa0i5ze93zrJOvngaeyS++IvgVTSQtQ3YhOBtE5WC05pUaXVLzuu4/al78g2uAf
 qxjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc2xdd+ndnYKo2cqvjVek97+3LKBwSvqsKCYXLFjC2NRkfCqJ2yU1YGdR0hAJ8L1AlZj3ShCf3Mw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/3Sy8JpQSm+878ib2Pt9z1WWfJl2GZt6g23PjA8q3T1tkSUIk
 eASTaMeJEV9VmU5xNdOxpVQQL6ftAy/0WA7HvNqD5X1bZSsq9pSBC/Wx
X-Gm-Gg: ASbGncs1xvCzdDwxmRNxe6GVJeTrq/iAJEutfml0kRrwuq50fHvfY5TX+AgssMs+2ve
 eN6wPg/AboE6nHl+IQxy+r9GytQVIR6BA8zcOChvGfog/3e2bmq9bUj0NzI9KtnuekY9MQTx8dm
 OiyX2A0csUomnrTzm3408uxRjuM3yJ34tXba9Ebj5hfQ7XVHjxEVJi+WzHMC0SLh/CQYN1CNOgJ
 II4Po6m9fCgew/vX62V1tuUHDTmV2ShE3dHxSdYxGmM28j+luh6/6PIs3XrMLkpoF3y9XLQE0a/
 KrCxjGuvl05V/x66/OIJa5d/JlLMvmshkRidAs6ICEGrlD3764wPWDaHAl8owCgE8Pr8x+MHsZm
 BV3oJLm20ObU1PDxkVdNSea0q+fDYBPjPafVKgvwC9fytwjES7wrdQLNdzcP6+pTlaQ6gHdfIlZ
 qZkKA=
X-Google-Smtp-Source: AGHT+IGqRoVDL/YvIJCa0D9yyjvv5hQCjZTKHgi7GaUWRGYH3wr2Fe9WEMFB2BkUiphy8qATn7bWNg==
X-Received: by 2002:a05:600c:1389:b0:45b:47e1:ef71 with SMTP id
 5b1f17b1804b1-45b85599151mr139128775e9.36.1757003203459; 
 Thu, 04 Sep 2025 09:26:43 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45cb687fe4esm68126895e9.23.2025.09.04.09.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 09:26:42 -0700 (PDT)
Message-ID: <b9433a38-f948-4e16-b7e5-0c2537f7fe0e@gmail.com>
Date: Thu, 4 Sep 2025 18:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sti: Remove redundant ternary operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS FOR STI" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250904112738.350652-1-liaoyuanhong@vivo.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20250904112738.350652-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 04/09/2025 à 13:27, Liao Yuanhong a écrit :
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---

Hi,

Acked-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Best regards,
Raphaël
