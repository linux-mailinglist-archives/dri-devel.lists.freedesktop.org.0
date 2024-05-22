Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD358CC318
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 16:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C720310F5AF;
	Wed, 22 May 2024 14:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WgxO2u9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4174910F5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 14:20:56 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-628a551d10cso2084726a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716387655; x=1716992455;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFMr3MMlN9ccj6zDjuA2RuE2zH4kKscYyAKXBqfTffU=;
 b=WgxO2u9hsQ3SqHlHgIvGwzv/9py4pcYAda4YpNBp7KPEy4SANxDlYhxbkDuYjup8sG
 5N+hOjZcZn3D40atzhRr3a49dbr6rpDmqlEta57l8LBIBlJFQL1Kt2UcpeGWecjz2DTe
 H4uv7UvlV3K4+MHdb0izZmB996n5+p1fSjXXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716387655; x=1716992455;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFMr3MMlN9ccj6zDjuA2RuE2zH4kKscYyAKXBqfTffU=;
 b=Wac84CR4FiVdQKicEX84DiGi51tYOGPMtGuCzGt3mCSC2jx0EZbX7z9nNAXSrHFG4Q
 JuEkqLlQGw7bo0xQ1GIrBilDfV+/wyUKJbACARtDSPUvHHAVE9ARX8rcVlbMFLn70s0J
 Or/Uiuw2gxhke5MjcwisC/dc9K9xz+/N0G5e9eaBCOLoFXTstxJnH7eyJQ8ITEYMlWp7
 50WNxyJZtk3FcdAiuTrHla9URE0MEHBuv/DGtbzU+Ox0BaULBadC5FZ0rXM1RgqI5Sg+
 O2/i5RyrLRIcJa7YbP2JeJPJSwq7YPtY1EztZDHnK7wffYhvoC7nxaFQaBaDZZTF3l9X
 DuFg==
X-Gm-Message-State: AOJu0YytjT7brtD7FKkitYAzHIWYXQmqctbmpJrUxje4gOo0gJvbWVn+
 1dFpDBNgFgFzLJGZhudbANdxkZMKivNfDaTcwvHPmQ11/MefW7Jb4pUld8nPFQ==
X-Google-Smtp-Source: AGHT+IGHIinTCDwt/PEgWlkID0Una1sqCjW4DV4H213H9PaTp4eMUvMwciKgrPBvbyKEA415+UyAmA==
X-Received: by 2002:a17:90a:ea81:b0:2b9:7afc:e7be with SMTP id
 98e67ed59e1d1-2bd9f5b96ecmr2046384a91.46.1716387655532; 
 Wed, 22 May 2024 07:20:55 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f9bb:ebce:f86b:d551])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2bd74309db7sm6244367a91.33.2024.05.22.07.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 07:20:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 daniel@ffwll.ch, airlied@gmail.com
In-Reply-To: <20240522113924.1261683-1-zhouhaikun5@huaqin.corp-partner.google.com>
References: <20240522113924.1261683-1-zhouhaikun5@huaqin.corp-partner.google.com>
Subject: Re: [PATCH] drm/panel-edp: Add CMN N116BCJ-EAK
Message-Id: <171638765427.3003190.5451039339852663119.b4-ty@chromium.org>
Date: Wed, 22 May 2024 07:20:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 22 May 2024 19:39:24 +0800, Haikun Zhou wrote:
> Add support for the CMN N116BCJ-EAK, place the raw EDID here for
> subsequent reference.
> 00 ff ff ff ff ff ff 00 0d ae 60 11 00 00 00 00
> 04 22 01 04 95 1a 0e 78 02 67 75 98 59 53 90 27
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
> a6 00 00 90 10 00 00 18 00 00 00 fe 00 4e 31 31
> 36 42 43 4a 2d 45 41 4b 0a 20 00 00 00 fe 00 43
> 4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 31 36 42 43 4a 2d 45 41 4b 0a 20 00 98
> 
> [...]

Applied, thanks!

[1/1] drm/panel-edp: Add CMN N116BCJ-EAK
      commit: 7acacca1b157fcb258cfd781603425f73bc7370b

Best regards,
-- 
Douglas Anderson <dianders@chromium.org>

