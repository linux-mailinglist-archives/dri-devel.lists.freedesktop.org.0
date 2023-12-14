Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9741813611
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 17:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1556710E1B0;
	Thu, 14 Dec 2023 16:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C24A10E9C5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 16:20:51 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-28b06be7cf6so597448a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702570850; x=1703175650;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=79GfLUa0xMatqK9z0JePPS7PR/6+NWr/zvH936PUut4=;
 b=VNr3pwKkBcn9WStP2aFOKms2eDT8Di3iGKe7Cl/VTdxVQ1c+7tTeHfCurpbzfoVupW
 1+xG50iHjophYdL11HTGg/jUCTYoopg7gvzY9bd4Q/LZhVYTF41tR/x9ypLsPb1J01c2
 PoRPb2kwQ1SQA91hAPR2ZL7VZw612OlAIc8xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702570850; x=1703175650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=79GfLUa0xMatqK9z0JePPS7PR/6+NWr/zvH936PUut4=;
 b=PDw3OQKYLgIAi4/+Pk9NWbaEiSb7+Egz0FzxvPgz5Ql2KLOrKh+VT6KA39E54O9+D8
 BqgBuBGtXk85f8X3ofXozIuZcLJozUzjiXGuOcdqhnqYZXuGKsAjyDy120sfKypPItrQ
 2nLQ+AnX9/qntdno9S29YJ41ARGw2krYTMN8fTyqbWQclMs2uJIUPzMO1R4S3ztCA6uJ
 dNI68xOV7z3Xwsrziu4XuQBamtm91E4aqtjVmN/PYsjT3OkUZettx6i4E4FZLwMJMv3j
 k1sGsWcZM+X2BgvaD7pQRzNP9PDcjNconBQlPvYwk1BAU7E1enDf91tA9Tx0UrgTwFPy
 9zoA==
X-Gm-Message-State: AOJu0Yy9PfpLs89SS1+MZjWXhByYbAX8EQ1E1dh/GHEuWdEJgQkRJEhS
 Cj17yH2uyNdwZ428wclciMWZyw==
X-Google-Smtp-Source: AGHT+IEhI+QDxAaic/CLBtw+Zk3ZLQbTienw7Lr5nTBHffs68v9bR0Iv7kinrPvub6G8TOnFIQ6ZgQ==
X-Received: by 2002:a17:90a:fb4d:b0:28b:2519:4764 with SMTP id
 iq13-20020a17090afb4d00b0028b25194764mr42334pjb.44.1702570850749; 
 Thu, 14 Dec 2023 08:20:50 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 8-20020a17090a018800b0028b07d1f63csm1833557pjc.50.2023.12.14.08.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:20:50 -0800 (PST)
Date: Thu, 14 Dec 2023 08:20:49 -0800
From: Kees Cook <keescook@chromium.org>
To: yang.guang5@zte.com.cn
Subject: Re: [PATCH linux-next] drm/nouveau/disp: switch to use kmemdup()
 helper
Message-ID: <202312140820.EC1C6079F@keescook>
References: <202312142003220684160@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312142003220684160@zte.com.cn>
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
Cc: kherbst@redhat.com, cgel.zte@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chen.haonan2@zte.com.cn, dakr@redhat.com,
 bskeggs@redhat.com, jiang.xuexin@zte.com.cn, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 08:03:22PM +0800, yang.guang5@zte.com.cn wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> Use kmemdup() helper instead of open-coding to
> simplify the code.
> 
> Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>

Sure, good cleanup.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
