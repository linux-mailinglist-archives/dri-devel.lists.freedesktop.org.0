Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4B63F549
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 17:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4EA10E64D;
	Thu,  1 Dec 2022 16:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E957710E64D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 16:28:57 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b21so2117936plc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NULJjkkDDbdSsERAnRzT9LcMntrNe+itV9GHWWcAHGQ=;
 b=jHxe8o7IqQYicrtapYsO4cQW0mO4p2391gxBZl79pyoKMM5DkCLDBcMBIqq7V7eIte
 yw1fU1+7VSM5hqSJtlvMobcTOFS0Top53OEUigrrXa5P9LLf7GleFino7JevqufDR8Tr
 ZlYt+5q6f2mQdwiInOoUj/IfvYXLOi2oRrNnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NULJjkkDDbdSsERAnRzT9LcMntrNe+itV9GHWWcAHGQ=;
 b=VwIr9yPHg/XoLpnxqKDBkmwfOtbG+xr6za14Ak8//iFqsRGKrJoqSn/lJdDcyuRBKe
 DKS1o3ViBmfggV/APO3wJbTz6ZLkuW1/hIjdGCYdv5pfVi7APxkxbf8f8gSuAu99Iw1L
 nNCS/n2Cpcr4k3VQWwBJCO7cX/yYDt21jQQHLNPoP/2AMaKLmuq5mkl6dgSfpU2xYvqN
 AGf6LgrOSi5KBnFEflKJMpHs0zSv/aUtSGjH1S3PRa4xddXhNNXcDXrOJvIG35QI3oZ0
 h0Xm+y6lfloEf81zf1dLsqfxLbn+zd1SpFJa5UePkKIwxRdjmhpkRiBxu62xqh+QdSWA
 LvsQ==
X-Gm-Message-State: ANoB5pmLoDeiaOLUhA2axO5LuHHj/C8Xms9MPkVxyxZifSGAobz+aihx
 BxeJa7vMs2Ekj9uZScJL2PbzRA==
X-Google-Smtp-Source: AA0mqf4TLkw8RXvISjBOYP98PMb+ndRd0Outhscrt55nV9R+iQT82xnY2zvdTWJuRyWLu8XZkppRqw==
X-Received: by 2002:a17:903:452:b0:189:65c5:4508 with SMTP id
 iw18-20020a170903045200b0018965c54508mr34400927plb.66.1669912137469; 
 Thu, 01 Dec 2022 08:28:57 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a63e417000000b00476c9df11fesm2719089pgi.68.2022.12.01.08.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 08:28:56 -0800 (PST)
Date: Thu, 1 Dec 2022 08:28:55 -0800
From: Kees Cook <keescook@chromium.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/3] drm/modes: Use strscpy() to copy command-line mode
 name
Message-ID: <202212010828.CB164AA700@keescook>
References: <20221128081938.742410-1-maxime@cerno.tech>
 <20221128081938.742410-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128081938.742410-2-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 09:19:37AM +0100, Maxime Ripard wrote:
> The mode name in struct drm_cmdline_mode can hold 32 characters at most,
> which can easily get overrun. Switch to strscpy() to prevent such a
> thing.
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527354 ("Security best practices violations")
> Fixes: a7ab155397dd ("drm/modes: Switch to named mode descriptors")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
