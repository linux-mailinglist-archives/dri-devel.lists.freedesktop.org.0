Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A44BEAD16
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572DB10E175;
	Fri, 17 Oct 2025 16:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jqNze8U5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899C510E175
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:43:03 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42701aa714aso1312021f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760719382; x=1761324182; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G6gCBpn1xaSdsDN3kuu/6RChT6cW/pr078XU7axphUc=;
 b=jqNze8U5gIDLIVBU9OkjwvGzhFxRf3pWMa6SYOw0tsfp+Uh1ei8Ipjb4VWk5tzQ0ES
 oMsAgsGXH0ipcFqR3CD6rTcRf3b0PhINbM6juW+8deJcfpNzXjtA/g1OxpLjScS5Iumf
 JpT1RbhsmpvgNT0MLLWX4/mqj7sWxednLkoOGmlt+g9QpsJCV7j27ribgwIigMl9lWuW
 PQ8ZBViQBbdz9z/arkF1U+yGud612QaXTUTdaJcRk7lOtkDTqVW01j9sU9Wx0AnpjHdY
 tKAQtVtCWObrN+O+Izrn0yj+t/qXBxrj2hkXyerZ4YZqN46DPkaZRMn9tkneGlEMT5FB
 5QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760719382; x=1761324182;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G6gCBpn1xaSdsDN3kuu/6RChT6cW/pr078XU7axphUc=;
 b=QZBlnJMmHF1M4iKb8s3qHIhcXejoX9V9tJFvsjjLsXnvkrUpnCSAtPBGQqtnt7jTDM
 1kF98fmtRXYciFDwwQzj/MOOHmsQGTdzZTSL6Ip0xorG1MmzbCfJ++BpFiI3wdt3R0J0
 sH4D2BUOz1D3Nt1MFYuPGhdDzTH2+iZaBZjc4oXS0Gf/2bq/KL9Wt4fMQ/0NQxwaicK1
 tZwNt7qFk377ehI5fhcLPAs0pIWPS7riwdv1HWuNyMjzWDIF4+7TpOMVw58iuCZUTaCR
 TM12RObsriCB5fiwSTbtqKgfHeHJIPns89ObwMW+o56pEy+zO1O7i5PnUfBos7qSB2B/
 mgDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOTlNHgKT7dHuhd+KliC66yQF4vA1jt6C4edl+KWi44qoIkR4S9GY/s65ajN8sQAEw9FZLEwftses=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB/kbWFZqDBLD+F/1+vyH+CbYZRiHrL/EyS6K4iD4ID29ecKBS
 gjUlaGoODMZfiMgdCWiQu7lAKJKYpFWoAZdcskSF7rf1/oUBnWmml/dPEKJZdXHn7nc=
X-Gm-Gg: ASbGncupJTzyft0/5bb1ervdQfTY3s5pZywudHOzLDXcPfZ7yNEaCj99dq9fvpj0JYc
 EiFnMJS2wCWc7xrM6JP9lmQ7s08BoJbx3t/hhPw0PiiIiD53OFJIrUwJVYcMcB1Sc/xGg/s6vXw
 stMB4G+eIPkup1nOSldrq0XuvOaIYid9n4jcY1wcvJN/NXZgeh6Ua22LhxD775RtHWoEpcSQdKN
 p7aNcDODYbJP7UUpMcuFDpCrf6WVZduVs6Ofsz+lgXKeNX+j722/O+Sumq62DAdWbuskpsbIWtI
 vNMnt7nPbzXFQtsS53OoYLCWGfva29+37nJeXRmD7cU7YhnFB4bGN7N2hmPlk+uJSEKr0KMgcmz
 8chhCga4ZgUaLR17LxdHzvaIv9Sr5L1c9iTax5L89B4Xoy45sDoZ/2a31Ro7RyY9294DwWS9QJd
 nlcEpuyefC8NowxU47
X-Google-Smtp-Source: AGHT+IGMBA0qJ4gxpjjM3xG9IuatY3oWeNvAk3ViyCHo+q3HrYjHTp52+8ZLn0SPVSWIlQ60ex3wqw==
X-Received: by 2002:a5d:5d08:0:b0:427:a34:648c with SMTP id
 ffacd0b85a97d-4270a34652cmr1088821f8f.58.1760719381734; 
 Fri, 17 Oct 2025 09:43:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-427f00ce06bsm76237f8f.45.2025.10.17.09.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 09:43:01 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:42:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/sysfb: Fix a NULL vs IS_ERR() bug
Message-ID: <aPJyEMWmWpWkcQvE@stanley.mountain>
References: <aPJo1W5Dl4rmGX_P@stanley.mountain>
 <aPJrs7_u8KcalNsC@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPJrs7_u8KcalNsC@intel.com>
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

On Fri, Oct 17, 2025 at 07:15:47PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 17, 2025 at 07:03:33PM +0300, Dan Carpenter wrote:
> > The drm_atomic_get_crtc_state() function never returns NULL, it returns
> > error pointers.  Update the error checking to match.
> > 
> > Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic check")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> > index 8517c490e815..d2c4d8f3d4d0 100644
> > --- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> > +++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> > @@ -259,7 +259,7 @@ int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
> >  	ret = -EINVAL;
> >  
> >  	crtc_state = drm_atomic_get_crtc_state(plane_state->state, plane_state->crtc);
> 
> Looking at where this gets called, that should be
> drm_atomic_get_new_crtc_state(). Either that or the
> code is more seriously borked.
> 

I can't comment on that.  Let's drop this patch and instead (probably
I guess?) change it to drm_atomic_get_new_crtc_state().

regards,
dan carpenter

