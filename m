Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CDA46EDBF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685C510E244;
	Thu,  9 Dec 2021 16:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490A589739
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 05:54:22 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id q16so4111251pgq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 21:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VrQSge7TRWDKkJ/NvI+IySV465glHv+ZocrZlO0KKLc=;
 b=GwxsWc9TXhDApOFEL/JXhjsV9zSbjJeT0oLyTkyB6ZihumuUGdydtg8KBz0U/BPemU
 PjDBnSYoxW96WhtWCFQwAdCivrglko3agPb3OzbCtWAbWnKytB1JimtDtnP6iU+ujBL+
 LTT9w4xm2Xv0YXmzAgJZkFs6RDlsEZ3C7BHoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VrQSge7TRWDKkJ/NvI+IySV465glHv+ZocrZlO0KKLc=;
 b=bd6ZivQxnA0s2aVW6A8EdkM6Gx+H7UvFS9p2vzDRqN6z405cJlvtAFpKnA4B2CR4ay
 KsecA138pjjHwkRAni6jD+/DosMxWHL1yIIjHlWcBFnHUyZojIJwtItInP0hgfYcvZkt
 scs5dOueJ28OeUmEyEBPvtZ+FshIW4lNbFHcYc+Xpvv+86faII6ehAbK7b/sbx9tX4tZ
 YQkU+XvHL8gIrqp7rQ270hl65a1jv9p+rvDD2qEFmBZpt9g7YHBFiISMQiv5LtdFxFAG
 PQ+/XU1Db0Wuu5Jm/RutkqkFWq10DgzXF6xviud2EmdsIXt0QCz5+z8LlV5m43KzbdaK
 t+cQ==
X-Gm-Message-State: AOAM532xO97zx0YYOMeslcfVM1piD4xTyxO6XYXb9ixN7mzu2/tnU8B8
 6gdEvGWqPypNi6GB55DkPRKufw==
X-Google-Smtp-Source: ABdhPJw8fMNaqi867+Q0o7P8PwLjqLLz+a8UL0QwyJXwzAIkjkGfkpnsGWaw+UK72GiByB5F9hC9CQ==
X-Received: by 2002:a63:2212:: with SMTP id i18mr32303736pgi.586.1639029261855; 
 Wed, 08 Dec 2021 21:54:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i185sm5416946pfg.80.2021.12.08.21.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 21:54:21 -0800 (PST)
Date: Wed, 8 Dec 2021 21:54:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
Message-ID: <202112082143.3BE8ABAE@keescook>
References: <20211203084354.3105253-1-keescook@chromium.org>
 <87o85r4a4f.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o85r4a4f.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 01:19:28PM +0200, Jani Nikula wrote:
> On Fri, 03 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> > The link_status array was not large enough to read the Adjust Request
> > Post Cursor2 register. Adjust the size to include it. Found with a
> > -Warray-bounds build:
> >
> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> > drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
> >    59 |         return link_status[r - DP_LANE0_1_STATUS];
> >       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
> >   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> >       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Using DP_ADJUST_REQUEST_POST_CURSOR2 has been deprecated since DP 1.3
> published in 2014, and Tegra is the only user of
> drm_dp_get_adjust_request_post_cursor().
> 
> Instead of bumping the link status read size from 6 to 11 for all
> drivers I'd much rather see some other (maybe Tegra specific) solution
> to this.

Hmmm... Well given this is currently non-functional on Tegra (and is an
OOB memory read), how about just removing it entirely?

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 23f9073bc473..c9528aa62c9c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
 
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane)
-{
-	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
-	u8 value = dp_link_status(link_status, offset);
-
-	return (value >> (lane << 1)) & 0x3;
-}
-EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
-
 static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
 {
 	if (rd_interval > 4)
diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 70dfb7d1dec5..bb5bfa93950f 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -559,8 +559,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
 			drm_dp_get_adjust_request_pre_emphasis(status, i) >>
 				DP_TRAIN_PRE_EMPHASIS_SHIFT;
 
-		adjust->post_cursor[i] =
-			drm_dp_get_adjust_request_post_cursor(status, i);
+		adjust->post_cursor[i] = 0;
 	}
 }
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 30359e434c3f..28378db676c8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
 					  int lane);
 u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 				   int lane);
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane);
 
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf


Or maybe do a long link status read in Tegra only?

-- 
Kees Cook
