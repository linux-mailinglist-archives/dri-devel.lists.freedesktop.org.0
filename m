Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CFC03B65
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 00:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BF010E97D;
	Thu, 23 Oct 2025 22:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CfYy5aS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381BB10E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:52:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso10086275e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761259925; x=1761864725; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XvICiLCYjVIzxqwfMbpW7cUOHCHB4n9EBKEB8bcdLHM=;
 b=CfYy5aS6H/yPxoFbHWd9oAkrd2FQrLydHjjUC2IfNJES0MiU/s/rhPdoEm+SxCvUj6
 oYFtJybqP06hXIILBqPaneJVOmJQkDDCtmX3VdMV5XBn/D3B583oDhL+IfruCYlboUR7
 Rz/Js6ZLC61Ks/lhW2Jwl/7JzIteuMwAppglpNJeMAV5DmPXIx0xew8BLtFRG/0TG5Us
 oOFwzkortjNlCVN6+pYgC4Nsgg4qo0u9x9kS0+y6aUxvoFkiCEzyYiJP2z7rIBz/BUi4
 KbTFlMCQEgu/DYjdGuM6o89CqeCdbL6vR+zqX67Oazae3BlyG6fCt/kbz//W+fpDgm5z
 dJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761259925; x=1761864725;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XvICiLCYjVIzxqwfMbpW7cUOHCHB4n9EBKEB8bcdLHM=;
 b=FUh8IqDG9rYQLzbBw43Jl393ThnR71kVwZ9AuB/CHjKBUAfNc00SrKht0gqI/kZue1
 x4ptWX6WhGBeJFqaGDREFRT/XPrwK/B0ovdGw4dzml39yAhYZnKDLFcoRArqQS6qLlOX
 +NaX+W72TM/cdh+0jdvUUgLfDl8WmoR/nKl9f6kRkp3MLENYUdUbarUpqhhnzrJWdOGo
 iGjB8d8l40/XU9GEE3NoYZ0h7RbFzCvdM12qtzOEltdbwg37/XMcRF0ySz2n/JkYbLLN
 edVC1YIHa+bPyT/7PeVUN1zYOxzyrHmBN1rR1W1dztyq5PZQb/xrKTs48HT6nvqbE0BI
 zCww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9ydN0xDig6RPXbKiE7A4Grfer4YHeeQENV8pTwEbybu/s01xH/uFXMfVxMp0xIjek0QGRHU+vHH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI3Hz0+gFRJ4h29WqMPDZquYfvigQxPjU/sxibbgiS+4Tj/bak
 MO+cE3T7Z59T6hIOGHXGUuKWktqarg4qa84gaKxgfBKuAqubId/XOyeq
X-Gm-Gg: ASbGncuSMHEUNlZWHYdMVrffUZQaaxfzYb9Br+QPesAn6XlGjidsv6JrPzuCURpA9/l
 O4n/zBL+rUej6c2b3BG6FnKc/oA0fhLBG4GI6EcbR6SW7fXcO/8LsvpRJhPBmqmRO1B/FVGqDam
 +Qf3XW9aQGKIgw6AGmcFZc0afajcUoegPI6u31r5IuEpkZwpy+Y/j0VKgwP92JS1O/EQJHEYWm9
 RRqnTA0xXIVfmGKMrW7qsKPcUR5rJUNICdF2KiZ+JPfXRjsH2SC2SZykhKNSGm0qfPiFtCk7DwI
 uI1fxoh5knDnuA9RkqGtcNQthIpHF6ocsX5/GDeBSXO2xcWtMYau4oM+KNyGMmFTrJCt13G2yc3
 LsnYPooiJ4s951/Xb2ZQZY8kFb0r6FYNx2o55wPvZsKKV6glOAWQTkapxrKZL/+tR0Jf470qlK+
 gdfWWicQ99w6EU
X-Google-Smtp-Source: AGHT+IFDN9CDEai0nHIXHDamVFDpcG3qN9fKmbfWLZ3vs/6A8JkpllKtcK/66U+4vz++r10f35OkLw==
X-Received: by 2002:a05:600c:4ed0:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-475d2426e58mr3285645e9.11.1761259924490; 
 Thu, 23 Oct 2025 15:52:04 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494b365adsm70379265e9.6.2025.10.23.15.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 15:52:03 -0700 (PDT)
Date: Fri, 24 Oct 2025 00:51:57 +0200
From: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chu Guangqing <chuguangqing@inspur.com>, alain.volmat@foss.st.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/sti: hdmi: call drm_edid_connector_update
 when edid is NULL
Message-ID: <aPqxjUh91I4G4bOm@thinkstation>
References: <20251020013039.1800-1-chuguangqing@inspur.com>
 <20251020013039.1800-2-chuguangqing@inspur.com>
 <4cf3050675a7090a87c80d525601b226e5e70f06@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cf3050675a7090a87c80d525601b226e5e70f06@intel.com>
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

Le Tue, Oct 21, 2025 at 11:55:01AM +0300, Jani Nikula a écrit :
> On Mon, 20 Oct 2025, Chu Guangqing <chuguangqing@inspur.com> wrote:
> > call drm_edid_connector_update to reset the information when edid is NULL.
> > We can see the following comments in drm_edid.c
> > If EDID is NULL, reset the information.
> >
> > Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> > ---
> >  drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> > index 4e7c3d78b2b9..e0be1be8bcdd 100644
> > --- a/drivers/gpu/drm/sti/sti_hdmi.c
> > +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> > @@ -1008,7 +1008,7 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
> >  	return count;
> >  
> >  fail:
> > -	DRM_ERROR("Can't read HDMI EDID\n");
> > +	drm_edid_connector_update(connector, NULL);
> 
> The context above has:
> 
> 	drm_edid = drm_edid_read(connector);
> 
> 	drm_edid_connector_update(connector, drm_edid);
> 
> 	cec_notifier_set_phys_addr(hdmi->notifier,
> 				   connector->display_info.source_physical_address);
> 
> 	if (!drm_edid)
> 		goto fail;
> 
> i.e. drm_edid_connector_update() already gets called regardless of
> whether drm_edid is NULL or not. Precisely as intended in commit
> f7945d9fa8b7 ("drm/sti/sti_hdmi: convert to struct drm_edid").

Woops indeed you are right.  Looks like I was distracted during the
review.

Sorry but looking at it again this patch has no mean to be.  Regarding
the noisy message, I'll send one removing it, but it is not pressing
IMHO.  It only appears if the driver probe with connector plugged.

Thanks for your reply Jani,

Best regards,
Raphaël
> 
> 
> BR,
> Jani.
> 
> 
> >  	return 0;
> >  }
> 
> -- 
> Jani Nikula, Intel
