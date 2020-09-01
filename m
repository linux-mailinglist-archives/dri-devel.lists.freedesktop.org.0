Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6880B25898A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865186E830;
	Tue,  1 Sep 2020 07:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830206E830
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 07:46:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z4so360781wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=PwQyVWZl+pjxYNMWlO8oMdi7CeKbQA1YxnOGda70p8o=;
 b=NZBA6I4vsaC4evG0xqeywNYAPVsFAA8nLITRO9maS80cuyhhhQ7vEPrnEHsZt1J9Q9
 Sd9EfZ+RaTWDZQEXDd7QTz3tqQm+F9rWLI5Cux5hj/YF6jUiBb/NI8hUfSbKl94N60hA
 R8NaFaIff/RdhvsRy7bQ3QRUO7UPcKehcQ0hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=PwQyVWZl+pjxYNMWlO8oMdi7CeKbQA1YxnOGda70p8o=;
 b=sds8zxG886PexehKU2CdUgceOmssREH96meZolMo0e353RTB5aKRGvSfmjnCUa4RWc
 6Yl6kYi98316NM+q2Z2cOzXN2FFn/jhJXcSg8E0MBzZVcITbuqPFnwvvW1wW2yp9od2L
 VnIJO5jS+wUgVxfyXjWtYrbRpGKrEgXqNZbNmFR+ip4jPIZgtCmYVOPhBNpujD52i72d
 h+zp657xjNS4kxw033Tja+c8lJZH0eMAioTHb1a5jEMKOFaZSoTWx6pPt4MDcp/cvnS9
 8hPSpMD5OF1uL9j98BsIwTEB5nLamGBKLdWMdwO4y/0FuhOb7qFbnvtBrCPF/R13os5h
 FVRQ==
X-Gm-Message-State: AOAM530efw0aArEN3ccNMbfsq/EFJ/PB15EaZKDybJQioidA/y2TAXHr
 ETpEJlX10E1Jd6kaKvLdk9jkDQ==
X-Google-Smtp-Source: ABdhPJwXcZYKUmnn0gz7E6TMaWDu4PAiWtFSM5sFr11pDA242xsELwRqTqSLHqCs1QGWqYCF5oDXRw==
X-Received: by 2002:a5d:56c1:: with SMTP id m1mr405147wrw.87.1598946401270;
 Tue, 01 Sep 2020 00:46:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u126sm817933wmu.9.2020.09.01.00.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:46:40 -0700 (PDT)
Date: Tue, 1 Sep 2020 09:46:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/crc-debugfs: Fix memleak in crc_control_write
Message-ID: <20200901074638.GV2352366@phenom.ffwll.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Leo Li <sunpeng.li@amd.com>,
 Mahesh Kumar <mahesh1.kumar@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200819082228.26847-1-dinghao.liu@zju.edu.cn>
 <20200819115515.GC6049@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819115515.GC6049@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, Mahesh Kumar <mahesh1.kumar@intel.com>,
 linux-kernel@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 02:55:15PM +0300, Laurent Pinchart wrote:
> Hi Dinghao,
> 
> Thank you for the patch.
> 
> On Wed, Aug 19, 2020 at 04:22:28PM +0800, Dinghao Liu wrote:
> > When verify_crc_source() fails, source needs to be freed.
> > However, current code is returning directly and ends up
> > leaking memory.
> > 
> > Fixes: c0811a7d5befe ("drm/crc: Cleanup crtc_crc_open function")
> 
> I think the issue was introduced in d5cc15a0c66e ("drm: crc: Introduce
> verify_crc_source callback"). Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Pushed to drm-misc-next.
-Daniel

> 
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/gpu/drm/drm_debugfs_crc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
> > index 5d67a41f7c3a..3dd70d813f69 100644
> > --- a/drivers/gpu/drm/drm_debugfs_crc.c
> > +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> > @@ -144,8 +144,10 @@ static ssize_t crc_control_write(struct file *file, const char __user *ubuf,
> >  		source[len - 1] = '\0';
> >  
> >  	ret = crtc->funcs->verify_crc_source(crtc, source, &values_cnt);
> > -	if (ret)
> > +	if (ret) {
> > +		kfree(source);
> >  		return ret;
> > +	}
> >  
> >  	spin_lock_irq(&crc->lock);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
