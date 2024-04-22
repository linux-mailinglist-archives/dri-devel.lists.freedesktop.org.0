Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7F8AC66D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 10:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC21810F221;
	Mon, 22 Apr 2024 08:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hurEpUjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8D10F221
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 08:13:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41a4f291f9dso4630465e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713773605; x=1714378405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SS3mxjJZGylPMQWrV6fjHJvytyShfSYEN+VKk+SCWTk=;
 b=hurEpUjrYSWE35CbjFv3TcDuPbxmdVaJHYWY5cv/ELFnMxyuRn2Amufjl4d65ZeCwF
 FokgxiwOCE60FwkEJYGE+QxmtGmVGBCWlffl07t58F5PIzdqSYdCadwdKrF79WFGqJyV
 eCdZCEni0yMVw/OdU5kp7ozxPdtPOa86K+9VmsymvXMDZQ0CcTw5tm1XoaBrb6LUZ4ua
 UzP4gswhFZ8dDyXS5OWoUDvyGxA4gw2xgIEMY+LJGKKwBUJoFhmitvF00kc/z/gBgZ/+
 aC63DJCtS2TBDgwn0LZmB4Kqfg/XOOcESNXXrSQQVYdsRL2AWO3HGk5M8WG+ciyI3vTP
 07GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713773605; x=1714378405;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SS3mxjJZGylPMQWrV6fjHJvytyShfSYEN+VKk+SCWTk=;
 b=i8Nzt1RzyhCnt2acmEqOaAJVHCw/Xm1vp9VI+6urz7lYxMgIoJx9rt+SIiuiy2Vi0j
 wmobOXwSr3clFjPfVgtTsW89T4VoHvnaGHiwz+fGvwOqo8wL+R30GQ0vel7iNVDDzIu+
 TCDgH5LIuxbW3akmjnJAcclqiIYaURHm9Ur07P/Zzs5wts3Z4rCWGs18TkwwJ8WUG3q3
 3LB90GO2M/I2LbeqdM6POlERnGjn2g3wd0nBX72MIE9ghkP6VQYTIWusV6siOchf6FSV
 Xh4Bgi/14EHtu5/7ovsdBsydw5DGkm6fyrL1KZdIZWtO4vvCIhKcWYMhnxoUMoJCsWAc
 qipQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpVlB9n0GTmlxgcy4ntAahECHN+73wjgLvxa9U3dRTOa/Plc8NxCMHubtKTzCXe27Y2BWqbmsnd3mFynYy0wKUfNv24JWLMc0vC8SsFQw+
X-Gm-Message-State: AOJu0YzgshKx23vzA0W/p4iwH6ZzFMoxlpg8bzttAoRU0AR5ykNKdWMB
 peJ9VeUTZnT5hWEezedbtwO3KjyoOGmL8jFDzCOdFLw6WXYX5cKvmqrfHjnZWFc=
X-Google-Smtp-Source: AGHT+IGPrO7v5/lKn4DROPvyQytV03lXmW3pR62NbGJT8AmgPph9yPGqucSHM/Ijoe+qpMFYe5TATA==
X-Received: by 2002:a05:600c:1394:b0:418:e6a1:c0e8 with SMTP id
 u20-20020a05600c139400b00418e6a1c0e8mr5978703wmf.7.1713773604900; 
 Mon, 22 Apr 2024 01:13:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041638a085d3sm19437504wmq.15.2024.04.22.01.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 01:13:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Jacobe Zang <jacobe.zang@wesion.com>
Cc: nick@khadas.com, linux-amlogic@lists.infradead.org, 
 quic_jesszhan@quicinc.com, sam@ravnborg.org, thierry.reding@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240415031408.8150-1-jacobe.zang@wesion.com>
References: <20240415031408.8150-1-jacobe.zang@wesion.com>
Subject: Re: [PATCH v2 0/2] drm/panel: add Khadas TS050 V2 panel support
Message-Id: <171377360401.3418456.5122435310463743780.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 10:13:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

Hi,

On Mon, 15 Apr 2024 11:14:06 +0800, Jacobe Zang wrote:
> Changes from v1 at [1]:
> - Fix name from "newts050" to "ts050v2"
> - Add specific description about controller change
> 
> [1]https://patchwork.kernel.org/project/linux-amlogic/list/?series=842707
> 
> Jacobe Zang (2):
>   dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel bindings
>   drm/panel: add Khadas TS050 V2 panel support
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel bindings
      (no commit info)
[2/2] drm/panel: add Khadas TS050 V2 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26f9339212db569310d4b0ef4284efcbb462a86f

-- 
Neil

