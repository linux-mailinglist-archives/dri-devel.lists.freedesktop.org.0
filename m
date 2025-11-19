Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02AC70351
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E4610E66F;
	Wed, 19 Nov 2025 16:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nWP/RJXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB7110E670
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:49:08 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42b32a3e78bso5652271f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763570947; x=1764175747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAVeFoaswclHa0AcFUTcFiWRrdY0VmDg5ArpLD6CciA=;
 b=nWP/RJXXQtZxZZ+exPkI7kImJuR0HMyXhDvJU7RGRUfCOl4Ala2j6hLyOCOi7thsGC
 R0tAffEATnKiGEiF8muy3UsfU7JFlkUWSH4nZxV+sYFedBx9O5e4qqUQShTi+lvCkgSf
 kYkpgG93baCUm7sJY6PkFokYSLrZzr8NLazaYC0Vf3NvR7EGgGnOPF/0tJWnEQ/tS/N9
 1AgruYRho0EY1WHQhpTmFLOW+IBWrpWbICy4Gp9FpmC1/UOlFrTFbFOiVAy9eT+sWZSd
 BOrPrKFBwZmBlui3EtlAzc7erpTogPDA5w0FlN4d9zwMiIKP+OAIB1bPxpKCa/Guw7JX
 FiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763570947; x=1764175747;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MAVeFoaswclHa0AcFUTcFiWRrdY0VmDg5ArpLD6CciA=;
 b=fsOxkIucm9MCjNSVr0EVkHT3skhgBKAM+LuN8BQ/DMDqlkUOrbrc9RgUPDrDr23855
 d21OPhB1L+dO+VyW0yrnP8ap9lR8UQ33m4/Y8bkf7oFfq4unLfSD9/hA4fXZgnJx9ELx
 x9QEAJt10yOnqOfkD1/Bolt8+QFGs6rONLzjrgylXTgLKRwz5PEQKP+1o2Qm+xueCYaD
 PlNkWchGOx+XnldhNlo4By/CcfYAk4CfAHVvCFSCDM1yEfdpY42nA6R+LoFxd+T92pvz
 KWDvS2uTLw09WevxHFQ/mM8K2FTwsVfcYM7yOsRTdQz/4NFp4UHkC8jSAudegZ3Tsdw9
 VJYA==
X-Gm-Message-State: AOJu0YyBkkya32eZK+szfgF6K43eDcFezAxyc7Ac2jQuoxWIbhypPWQf
 mEKgtVmv/dt5759q3sMFMcxcVg+CbL9/bycShdug06G3lBU7aTmrkDs0iornwIL1w3JQRfd5mWU
 2GgoL
X-Gm-Gg: ASbGncumeL7DbYmGR9j6qnGRrbcq4k5yZ5g+FtxFF0Ur8DnhRzm72VszGru6S2XNd2d
 ZGvDPIUXcFVcgV7CJx53my79wzPowjXAjID4Osm1HKaGXJ+GrbuInf2Gp7LloXRD9OJHCzso1IR
 xyRmCzxUgMcNLKCa08GHpxptsyRrXzwQsXTWLHLAyg7w1lpCx//HdQ8qReHUlBaJd4CKx39wddf
 PmVrI2+Bl/32ZBFghQf7lRxjjROAzrWQedqGlnwFX5jFEqgid8y9qM9X23piL40t4qHS0+vt7zT
 4W6fEkmE+cOLK6lc+p8Lp9XUXtQ56eBsdBeuSAhZWlWgADdh6J9IExE3s93jPnFxKMRBMuGcQEY
 Mo3/vdAgh9z1dY9jWfH3LOI7yCxrWhE+Nf/fGmG8nyOeKVHybLXIrskHK7I90uvEujczPQEjfBN
 8AYSi8kX2rRbfrNbW9U+/T+Y8+pyLpbfsTnBGxpLXfhw==
X-Google-Smtp-Source: AGHT+IG9qhpyv4WB6t6znXPIaFDtapZBfxWk8sGKUKqmefbXNbi1fqM47cho8l+8wzgsOUvP7ppYDg==
X-Received: by 2002:a05:6000:2310:b0:42b:3131:5435 with SMTP id
 ffacd0b85a97d-42b5933e378mr21281006f8f.2.1763570946937; 
 Wed, 19 Nov 2025 08:49:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 08:49:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jagan@edgeble.ai, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, 
 Abhishek Rajput <abhiraj21put@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251117064702.222424-1-abhiraj21put@gmail.com>
References: <20251117064702.222424-1-abhiraj21put@gmail.com>
Subject: Re: [PATCH] drm/panel: jadard-jd9365da-h3: Use dev_err_probe()
 instead of DRM_DEV_ERROR() during probing
Message-Id: <176357094628.280640.13903619645198145123.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Mon, 17 Nov 2025 12:17:02 +0530, Abhishek Rajput wrote:
> The DRM_DEV_ERROR() has been deprecated, and use dev_err_probe()
> can be better. The other reason is that dev_err_probe() help avoid
> unexpected repeated err logs during defered probing.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: jadard-jd9365da-h3: Use dev_err_probe() instead of DRM_DEV_ERROR() during probing
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c8fd04c0e73370486fcb9203a1c90c244b7fa1ed

-- 
Neil

