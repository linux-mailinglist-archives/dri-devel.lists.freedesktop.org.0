Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF615AF78A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 23:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B03810EB1A;
	Tue,  6 Sep 2022 21:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8438510EB1A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 21:59:02 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lx1so26227888ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=hh7LaPU8a1vcLx+5bfACRKRtlHLDhwyWxh4s+EOrhn4=;
 b=J1krxmR2L8JHMLmugi+C8hOPAfczq5LMW/3D9q95TqoCqlaxHY6Qg/+G2OsJt4aFd9
 KFzT/QH+qT5trhUCyLBOtrBvz5z2IQETb4clxbp6QYLommoqCAvFiNaUD69yEEB3c6VH
 E+AYiEJ2Ke3Fz5RA6vG9tbbXE91Kn3Nu/ix+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=hh7LaPU8a1vcLx+5bfACRKRtlHLDhwyWxh4s+EOrhn4=;
 b=A9kkXHik2Z7D8+VlN7gzgfo5xz6CE1+wCB3kXlfGYyGHbhoXYhpKFPVLI4EWXJPAeV
 nBPqWlKI+eSpBZD1SH6sTEBAqYWA0xJ2ahwidaJBFFX8ZMfCI990wFxzNcr1cFHZyFJD
 Zmhjqdp6niWf52EnSUVbpUzOGjK2GIGnop4IOdGN0tBw76HP6k4Y/SIDJfFoh8OwzGrQ
 YJkYdIm2BxhGsp0kMfR/SNPIdsSDx5RP8oykdmOct3PyrG6ATnChq07MxCg76J1sRJpL
 cIy0syOekM/f6JWhrkC+CqDxJaHroJ7AWx29FhWsKWhLM2xa68CARNoh9Kddey8vTwY1
 Gg4Q==
X-Gm-Message-State: ACgBeo3yGPUjBrWXBuGiEGgcZXQBIZIc+mNAqXp4ifhtXbmiGBzQqphA
 GgbBuH/NzdlztQJFQgwXAW/gvg==
X-Google-Smtp-Source: AA6agR7EAa/l16WdrqNf22KWyDRDe8LKmiQNVFPK6R6rFcNzgtkMFv2GJWnTP2VQkswiqL36a2psfQ==
X-Received: by 2002:a17:906:4d8c:b0:741:6194:e5b6 with SMTP id
 s12-20020a1709064d8c00b007416194e5b6mr364450eju.252.1662501541069; 
 Tue, 06 Sep 2022 14:59:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 cn18-20020a0564020cb200b0044e1b4bca41sm6046209edb.79.2022.09.06.14.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 14:59:00 -0700 (PDT)
Date: Tue, 6 Sep 2022 23:58:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
Subject: Re: [PATCH 2/2] drm: get lock before accessing vblank refcount
Message-ID: <YxfCoj096m97QtQv@phenom.ffwll.local>
References: <20220722215234.129793-1-Yunxiang.Li@amd.com>
 <20220722215234.129793-2-Yunxiang.Li@amd.com>
 <YxedadEMAfWHON8P@phenom.ffwll.local>
 <BL0PR12MB2532B9036E590FDAB14755DAED7E9@BL0PR12MB2532.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR12MB2532B9036E590FDAB14755DAED7E9@BL0PR12MB2532.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 08:18:30PM +0000, Li, Yunxiang (Teddy) wrote:
> [Public]
> 
> Hi Daniel,
> 
> I added the check because I saw that the refcount was always
> updated/read with lock held elsewhere, and the pattern looked very
> similar to in the put e.g. drm_crtc_vblank_reset. This patchset is
> outdated by now and I've sent a fix to amd-gfx for the specific issue in
> amdgpu.
> 
> However, I think the way drm_crtc_vblank_on/off functions increments the
> refcount without enabling the vblank is still a bit risky given how many
> unchecked calls to drm_vblank_get there is elsewhere. Maybe it's more
> appropriate to simply add an WARN to drm_vblank_get when it's called
> with inmodeset set? This way the WARN happens right at the problematic
> point, instead of far into the future when the put is called.

drm_crtc_vblank_get failing when the crtc is off is how this is supposed
to work, calling WARN_ON or similar in there would upset everything.

What might be an option is adding __must_check or similar annotations, but
the problem is that in many cases the driver knows that it cannot fail, so
this isn't great either.

Another option would be to split this up into drm_crtc_vblank_get with
void return value (and a WARN_ON when it fails), and
drm_crtc_vblank_try_get, which can fail. And then go through _all_ the
callers and audit them.

Imo not really worth the work, but we could do that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
