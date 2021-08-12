Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4723EAB24
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 21:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2DD88310;
	Thu, 12 Aug 2021 19:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F251989D64
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 19:41:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q11so9857236wrr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xkCjZXOmaAcw2hH8Mr6PXR8Ud93ZZOLolVO9155GgOQ=;
 b=PRpOBmjoP+nbrPHAXA66GGiKdt4DTvqpPU87iPuXNv3iWY8ifsLInQFkMziA5jeUsJ
 mJGrWLijflchwLPf7d7azIbMzsUAa51p4b6tR90x8dnlV52KHXt0/q2AO/+cOAJphYsf
 zY7fiTuBoUDyrL0qfXfEPd1U3rXRKhR1u+jN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xkCjZXOmaAcw2hH8Mr6PXR8Ud93ZZOLolVO9155GgOQ=;
 b=FoHcQr0O61w+Fx/diO/SRczSvyoPkmIaDNwWo5so8cSn8FmsCaqPLhoYrhD3uSjPOh
 Q7z2APnLM4Nz1hAXRRkPtLSsOCpPq11BOLa/RM2+8gzsuWh9Y3qA52GtUQA9C20V3JjW
 Vuzdy7EnjIDRbgUHyfbS3InP2rSgKTxq+3e+ndosgqDlOICXUaNo2x7TpIZJNBGyASNP
 p9mh2IELD3LGZMbj9OzbGGzdqyp/KUuuAGtf3qB7Fa88gZEGFx1ahOYWk63OT+rr/9DQ
 bbvf8w39qgrJQ4fEzC5yTDp+qFZ7ZmN2TGZbQN2TsQltT2ytnTu6Q3fZagYtiQjej4TJ
 nSdQ==
X-Gm-Message-State: AOAM53275ce2/VmQrmbQoawKOICaI5mRlJuJS1iOeL0db6dj9QTXWYn2
 pf2Ls3uE8hb85qvIpwwFttQaOg==
X-Google-Smtp-Source: ABdhPJzgit64Q/Q+24HXSXQZvq8GH1k6inNYNKst9clgmOJZNr3rAXf8z4Y4sCxeK/VTKhg91zMNNw==
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr5812947wrr.356.1628797287532; 
 Thu, 12 Aug 2021 12:41:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d15sm4592220wri.96.2021.08.12.12.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 12:41:26 -0700 (PDT)
Date: Thu, 12 Aug 2021 21:41:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Stultz <john.stultz@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 4/4] drm/vgem: use shmem helpers
Message-ID: <YRV5ZUJ3v3sSm1/R@phenom.ffwll.local>
References: <20210812131412.2487363-1-daniel.vetter@ffwll.ch>
 <20210812131412.2487363-4-daniel.vetter@ffwll.ch>
 <YRVT+B69l74Lk4+A@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRVT+B69l74Lk4+A@ravnborg.org>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 12, 2021 at 07:01:44PM +0200, Sam Ravnborg wrote:
> Hi Daniel,
> 
> On Thu, Aug 12, 2021 at 03:14:12PM +0200, Daniel Vetter wrote:
> > Aside from deleting lots of code the real motivation here is to switch
> > the mmap over to VM_PFNMAP, to be more consistent with what real gpu
> > drivers do. They're all VM_PFNMP, which means get_user_pages doesn't
> > work, and even if you try and there's a struct page behind that,
> > touching it and mucking around with its refcount can upset drivers
> > real bad.
> The only thing I understood of all this complicated stuff was "deleting
> lots of code" which is a good thing.
> You may want to s/VM_PFNMP/VM_PFNMAP/ before you push this.

Fixed and patches 2-4 from this series pushed.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
