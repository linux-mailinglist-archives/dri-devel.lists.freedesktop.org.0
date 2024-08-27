Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA49614F9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC77C10E3C2;
	Tue, 27 Aug 2024 17:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KtPPo0if";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2E010E3C0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:05:10 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-429da8b5feaso63881735e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724778308; x=1725383108; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GQR44Lvdm4M5lDsfV8OFufSMU5cu75uyMnnMCPbbJho=;
 b=KtPPo0ifSyBTI/v5d4XhJOLQTzO7PCL1rezCbgQS5PSk9OZQyIM84UsB0AOqAHXL7K
 LgC2aoHVZSyt3QiAClkyk+GFX1+LYtCMKm4xI9c8Q/L/WYYg87jqORl9Uta47eVrZyWf
 wAgbvD4ZSTXZ5psJdgemaMm05Jx2yFbrl8+VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724778308; x=1725383108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQR44Lvdm4M5lDsfV8OFufSMU5cu75uyMnnMCPbbJho=;
 b=ki1Xdv6HN54DP1I57kzXU8wIEW+TcqKFXzNwq0zEFFi6qkE7k0gr/0nvIUdbvdpf1d
 DtZl2Ypzu3ZZ6KP3HLQ2b294P1eNOJ7tix6oVOBThvc2qKM76wJyxaeNipEh4rGGhLgK
 GNhigphMrDHZjBDiCPvpACXMBQCBYzG9gUzlVtJiWlB6XVO93fyiBl05IV86KJOJ3FtG
 AhOCrJzhzDosNNXb8cWu8XORogxMroADX2HM3IqZjOzOJWBEDCSE2c9thTyiiP34lV1S
 S0Y7eDyWTNyXTHJ6Q33Om0V5Wy2SY5NHCuy2sFPnoAkTmBM1CpTrI2nSOHd7tbna4CRF
 ILWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzSmWQJQzBVgOg8GQ1UmluhPD52w1q09CPWG68GKco+n51tMBDmL3Ocp+W2z1qkC4nNsBpU1PkIks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWH3PT9iivuSIwXZ5RsaI9EPJEvhyX0vYxWxT7AD4YyltkESy1
 n/uKQ8wfSXK4GtSzDelO2uADZPE6lFnOItru1PwiMcGvPD8Mo5rMVrsAMul32Tg=
X-Google-Smtp-Source: AGHT+IFJWrxTC6qWy1ttYsLW3HADP/hdtt+slNiPe09MJKbZuWH3y9lAZk0ETvvxuuobPOc7jT0FaQ==
X-Received: by 2002:a05:600c:3493:b0:426:6f87:65fc with SMTP id
 5b1f17b1804b1-42acd57b91cmr120891825e9.17.1724778308098; 
 Tue, 27 Aug 2024 10:05:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730826196bsm13555932f8f.102.2024.08.27.10.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 10:05:07 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:05:05 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819113140.325235-1-andi.shyti@linux.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
> The i915 driver generates sysfs entries for each engine of the
> GPU in /sys/class/drm/cardX/engines/.
> 
> The process is straightforward: we loop over the UABI engines and
> for each one, we:
> 
>  - Create the object.
>  - Create basic files.
>  - If the engine supports timeslicing, create timeslice duration files.
>  - If the engine supports preemption, create preemption-related files.
>  - Create default value files.
> 
> Currently, if any of these steps fail, the process stops, and no
> further sysfs files are created.
> 
> However, it's not necessary to stop the process on failure.
> Instead, we can continue creating the remaining sysfs files for
> the other engines. Even if some files fail to be created, the
> list of engines can still be retrieved by querying i915.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Uh, sysfs is uapi. Either we need it, and it _must_ be there, or it's not
needed, and we should delete those files probably.

This is different from debugfs, where failures are consistently ignored
because that's the conscious design choice Greg made and wants supported.
Because debugfs is optional.

So please make sure we correctly fail driver load if these don't register.
Even better would be if sysfs files are registered atomically as attribute
blocks, but that's an entire different can of worms. But that would really
clean up this code and essentially put any failure handling onto core
driver model and sysfs code.
-Sima

> ---
> Hi,
> 
> It might make sense to create an "inv-<engine_name>" if something
> goes wrong, so that the user is aware that the engine exists, but
> the sysfs file is not present.
> 
> One further improvement would be to provide more information
> about thei failure reason the dev_warn() message.
> 
> Andi
> 
>  drivers/gpu/drm/i915/gt/sysfs_engines.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 021f51d9b456..aab2759067d2 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -530,9 +530,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
>  err_object:
>  			kobject_put(kobj);
>  err_engine:
> -			dev_err(kdev, "Failed to add sysfs engine '%s'\n",
> -				engine->name);
> -			break;
> +			dev_warn(kdev, "Failed to add sysfs engine '%s'\n",
> +				 engine->name);
>  		}
>  	}
>  }
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
