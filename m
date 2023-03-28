Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AA46CCD8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FEE10EA16;
	Tue, 28 Mar 2023 22:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDFC10E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:15 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id y35so11666077ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8uJ+dREdoTJrUO/jV2t+HGD1km8rKwGduSmzZBjBU7g=;
 b=D2ECxZSeCKcuEvhongZrmzkPveDQF4kcPot17cg0PKP8Oe9v1TXMjkysUxXvirw58E
 Y4z0vwOZXFHlRZHvvHSDEBK2bnpGDJ1qXxrCzHPan0WXYcyqnolNZPnfGcVVBO3QYRaV
 XD9Q/53oyXNoABLaeYxBuvz+Q+gpOUDpzOggu205Uomy8DzbkAYtb0pkpM2NmxsXyzxR
 4Du3UYAdVMVfZWLUHtelQ25Ia0Dyueu65pfTZNVWgXJbRoRLkLsVSfTiIvCBH3Fbl80M
 8Y4arARf6kFczQFSBihSefxDoB0HXdGj70Y+fZ6/9g1FHbIPO6Y/RMk5s8Z9QIv4noYI
 UMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8uJ+dREdoTJrUO/jV2t+HGD1km8rKwGduSmzZBjBU7g=;
 b=s5L106mqnqirTSY7FvDLb9sUCDcUspBMlDvhdxDvDh/KBGCyc/vg3smjGX7wKypl3I
 oIsD+8+KRfsDcuKSCfb4GDVw4Ir6xSEXYZBhDTKTBEFDdEtwTgrC3XmN+51/EvxTIfU8
 Hse/MHkAT5l1yDhiRVpOQTX/TsIrjx0hUJPq5gesi7X/5/N4bQHeFklB8S2KRbXpPDK7
 r0KC9LV0XJ8W8tJSOz8nSSZd+uAwJuq/Y/SVxHLSlFqPjj3YsBLHbLPElUxZtu2fUUKY
 2l+UFzrxWITXRqGOAIHkZzRRiTTo/DRq+htQXNd9p8Fg3SWoqbaIF+8HT8lrCqkgek7R
 gO/A==
X-Gm-Message-State: AAQBX9eS7TbFb5iCBoTbaB1YN8JV3UHchLdf5Di04hZBfmdn+ieia0OS
 gI4XtA2dZYyXNar6MbJvQDjBBDNE71+l58WpAGk=
X-Google-Smtp-Source: AKy350YFBAq4dymHWHmkybxynzGNIcJh1mPRco8Jz4A0vFkG6OeccjLzq8XYc0Dwn8j6VAfFKQptBw==
X-Received: by 2002:a05:651c:d0:b0:29b:b01e:aa68 with SMTP id
 16-20020a05651c00d000b0029bb01eaa68mr5645839ljr.40.1680043094640; 
 Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: Avoid rounding down to zero jiffies
Date: Wed, 29 Mar 2023 01:38:01 +0300
Message-Id: <168004255459.1060915.15692339879242886666.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324220013.191795-1-robdclark@gmail.com>
References: <20230324220013.191795-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 24 Mar 2023 15:00:13 -0700, Rob Clark wrote:
> If userspace asked for a timeout greater than zero, but less than a
> jiffy, they clearly weren't planning on spinning.  So it is better
> to round up to one.
> 
> This fixes an issue with supertuxkart that was (for some reason)
> spinning on a gl sync with 1ms timeout.  CPU time for a demo lap
> drops from:
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Avoid rounding down to zero jiffies
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5c5593477b0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
