Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D040956FA0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E113A10E2FC;
	Mon, 19 Aug 2024 16:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uCVUZlqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955D10E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:03:04 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-371afae614aso1393526f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724083383; x=1724688183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MygLjWxd/cuymlBwTrUlqtMUCrnCHV/7Hdz0OscdB14=;
 b=uCVUZlqqu7UrD7Cm6dlj9hJ+bs4RcNxZ3wkh+kkkC5Z1puTfD+U03gLZUbF46z6cjQ
 hk62PcNW1F8EdGLriYRPP4i6YDRm9TqIBA/wogf1svqpPsWrPv12ccYRbFQWX2Zh+kc+
 e5MuRpZaIMY+/9lm/a98JdEmP4H3y/kbE2M6G4XCIJOKmu9oSMVymA7j5JwqnsFCy8dV
 ye68C0VYUjwMR91ccLu+PMnDjW+akytqc3pvufmRjH1BoSXV/SFoyALZdvzigmy+eb0S
 PYtN1f1f5Is10hD8C8jzQHJrvFSDDZO9oGuUyV5gXaTfSNty1YoVQmpNK0uWwzuoBZ3m
 T9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083383; x=1724688183;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MygLjWxd/cuymlBwTrUlqtMUCrnCHV/7Hdz0OscdB14=;
 b=gUroahqmOwlEkrhW9yj5jBszL99qbGCl5ZrFlhGH/gygK+UyjvJEow5Ii6s53e+w/T
 rIv/seT3YQbxd6zyX5jTyEkL6hKTZdxKa/WXhYNnEGkdFpZzmwbf+/fcOCGV7QMrL1r6
 t8PKtraLD08NWxJiWllIEISepM2kE5JO6aAlTm5skCq8snDK3tLFOAornWzMuSSYa4a2
 xj4xFASJw7BEDl/djo1aINKWX7kXaKFRm3Dp15s0uRHkO/2ZMWoPFd1uWhwT+hvAqFQg
 E9Bpxy2GAoZrjaD0qO5rv3o5IKPPbR6haQOyv/NxSAFjmQ1ndKvtspBynMyur++B953j
 rdUA==
X-Gm-Message-State: AOJu0Yx9kjNGD4OePTGBZh1W8fgGlu47p3AqwdNzAOqLTsgs2JM3XnCw
 XsOTSy9InlTryJmKkDBaYRU9LqJIqPsRKYUN2802ZU5H7e0//+xI8zcRIhfrwAw=
X-Google-Smtp-Source: AGHT+IGDL1BghlbSzux3yJZeahaJWCA9neTeVGdK794uq57vTBevwaiQ6Y3pvsnu4kDp2NGOiX5ylQ==
X-Received: by 2002:a05:6000:1006:b0:371:890c:3157 with SMTP id
 ffacd0b85a97d-371946a4611mr8314976f8f.38.1724083382820; 
 Mon, 19 Aug 2024 09:03:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898aabe9sm10907638f8f.92.2024.08.19.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:03:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, dianders@chromium.org, 
 hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, jagan@edgeble.ai, 
 dmitry.baryshkov@linaro.org, jani.nikula@linux.intel.com, 
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v3 0/2] Modify the method of sending "exit sleep
Message-Id: <172408338165.1748689.14599426466774624687.b4-ty@linaro.org>
Date: Mon, 19 Aug 2024 18:03:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Wed, 07 Aug 2024 18:04:27 +0800, Zhaoxiong Lv wrote:
> This "exit sleep mode" and "set display on" command needs to
> be sent in LP mode, so move "exit sleep mode" and "set display
> on" command to the init() function.
> 
> Modify the Melfas panel init code to satisfy the gamma value of 2.2.
> 
> Changes between V3 and V2:
> - PATCH 1/2: Modify the commit message and subject.
> - PATCH 2/2: No changes.
> - Link to v2: https://lore.kernel.org/all/20240806034015.11884-1-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: jd9365da: Move "exit sleep mode" and "set display on" cmds
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/97d1f449c359207b2fb5bc62eaefb7e21ad619ae
[2/2] drm/panel: jd9365da: Modify the init code of Melfas
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/64ddf5123eff2edf47202e08744c3c14a9d28f59

-- 
Neil

