Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA69A694D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAE410E4E3;
	Mon, 21 Oct 2024 12:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NUFZXjjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EE210E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:59:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-431548bd1b4so43355125e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515544; x=1730120344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cd7/pLYdEIk02a5YA0EypwGvSVgaUSYxbjpovDPFTI8=;
 b=NUFZXjjDl7pXnUoR747VbTKlQDjE0sRGsVRc3q8mwItCK6Y9p4aecpFUp1PYs6Fd8j
 ocNzTF27t8ir/+mDC9P2/LIKNuvheRBH6gWlTCEEdMRE6HEbzx657xd2yFSa3r9Ql4Nl
 fSJL0Y3PBjMldThhUgf2gtNKNnJf2IeqIOlkdbzY3pfLyQ/1WZdlCtFFS/do4o+xTs0D
 lG7SA4kgzeYLKG98KICLR+BYotsDkgU9SJmVjI9EizdTuEfJY1JvLXYz1scFuq/ldVmj
 YUXl5btEUgKc9zkxNch93auI69Gkgwin5ehVKTG1aZvsMUHpkxdZCOg8xM0dKQxTt2/r
 jZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515544; x=1730120344;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cd7/pLYdEIk02a5YA0EypwGvSVgaUSYxbjpovDPFTI8=;
 b=E3HSp/bF2cp2RKH/RmAUehpN8tYNub0jOgINB12y/rydlarcSSharW6KG8/SMy8Zxb
 SRztACbF0lx17Ker98WnMju8yIxGW3H05Nv7YRqei3VppHzlP22s/ukdrlglYqO7YmVP
 6l3zzG4EMtUR7AAE/mXfW7RZ2+nT/Ky4tWnvYr6zVA/6LSpzdue+ql8SqWpyz82XmFqE
 tryReDvljb6nf43p/1O1T7Ij1hS23xdhvlFVcDljwjaPGUvGjXb2buxDaWkTSO6hKv51
 NOMCJSmuoti2y2FRmMSaWpsI7Fb37N64GqCUz9RC7bl4Dbm73zf5U8vI3cJC/YNtJApB
 5ysg==
X-Gm-Message-State: AOJu0Yxqf3tREvrkOGP+oLKGt//eGcrSIbbvk1B8nkuNHf5ZEA5XZ/ra
 KT9vCra8qpU+2kr2mn2ohrOKeGHoWfuykNXh8kTT0kzueSIq+zOpnJOS+A3dGno=
X-Google-Smtp-Source: AGHT+IF/OA0ZsLmf5IvgnydhzYx42zQz0S9kryQZSwGJzTd/oVTKmRf3DpJkNqtQaRd1P6fFtU6Sgw==
X-Received: by 2002:a05:600c:3849:b0:431:52a3:d9ea with SMTP id
 5b1f17b1804b1-431615b9cb1mr89143965e9.0.1729515543677; 
 Mon, 21 Oct 2024 05:59:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:59:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Liao Chen <liaochen4@huawei.com>
Cc: andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
 linus.walleij@linaro.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
 jonathanh@nvidia.com, Simona Vetter <simona.vetter@ffwll.ch>
In-Reply-To: <20240902113320.903147-1-liaochen4@huawei.com>
References: <20240902113320.903147-1-liaochen4@huawei.com>
Subject: Re: (subset) [PATCH -next 0/3] drm: Enable module autoloading
Message-Id: <172951554268.1240386.11009989976782146121.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 02 Sep 2024 11:33:17 +0000, Liao Chen wrote:
> This patch enables the autoloading feature of drm module. By registering
> MDT, the kernel is allowed to automatically bind modules to devices that
> match the specified compatible strings.
> 
> 
> Liao Chen (3):
>   drm/bridge: it6505: Enable module autoloading
>   drm/tegra: Enable module autoloading
>   drm/mcde: Enable module autoloading
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/bridge: it6505: Enable module autoloading
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d9c12481f980bdad9cf6fdb742e49c5b50622795

-- 
Neil

