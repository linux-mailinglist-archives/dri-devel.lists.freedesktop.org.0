Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C760664D987
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EB810E514;
	Thu, 15 Dec 2022 10:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A39010E514
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:26:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z92so26415329ede.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=asgpSUX6LyiRFZtSEAHAKhPF0T2KdzBQAin+Qp7x+js=;
 b=EM2QBbE4O8GJHLTgP8L7ZVce2CBowpgQGBKAFUsgug71cPEZitEoMhMcEMyFgGRvmJ
 krvuAEi0j8CYG3UHj7pY+kXllxjYpQSvme5dJ/XNI0LwoHJcg2kM9lUKiNmoE3d19o7L
 XGQ52hLM57kHi890RMIlrJiC2X49zCdvKfisoYm/BRpHgibcWLbb9g5P4HaFION/G9MJ
 THIJDJ9V6ayM/+wzphgCVjIpG0zq6lPVuJGLLNUDFzbyc5uCwivbveZK5Ssw8vR3FyG4
 2pua5XjSRGMTJ21hrMqBvN6Jrb5l/CYGx3uB+uTHybPbaJrRBumg7SMKUWDUKAjQ0TqG
 AfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asgpSUX6LyiRFZtSEAHAKhPF0T2KdzBQAin+Qp7x+js=;
 b=KKe6Vum3o1afTkX3nr390ETzRNv/+Npq1UBgJPKrEkhPkn438E63oA6TKkS4ziZzF4
 jCE32q8NP0tTDwlMpm+oviIJvITPhYWCXDwJKDnBHkAoyq5u+0/Rhc4Or+gpLzX9lCVL
 BpW6Ct+DO/XuKVV9BNTmb5dkDElpfqOYmA+BscvdHQxWi4C65Vs0zwUwzk/DVc1uQy+s
 aKRrury/90/qyl4xf3P88CD33ZcEUHgC+gjzgpEfnvhJ1Z5DjV64FlzhGonVLKQUCv2a
 t88WCQxiNOP7sArC8A9rJ447QQN4F6gwLlc5FqDRVXvR0GfWN3KlnfyJEUEiUXoF1qzF
 +gTA==
X-Gm-Message-State: AFqh2kpChd+GCncHyXNf+UO0/GxO6oVJhv830m043LMKa+8H+xaSMc+A
 RJXbPoO5/q3U9CJbsuLuvcW/EoerM9vPcwdE
X-Google-Smtp-Source: AMrXdXvdpZnmpaP26++xeN7CVZElmcnN3H2kASYSBNlYRUKRd3pl+JXlDHAysiHbubPvU0MrT6TE1A==
X-Received: by 2002:a50:d71d:0:b0:473:bd4:84ba with SMTP id
 t29-20020a50d71d000000b004730bd484bamr3210116edi.23.1671100013721; 
 Thu, 15 Dec 2022 02:26:53 -0800 (PST)
Received: from prec5560.. ([2001:bf7:830:a7a8:7e6a:e951:1d52:a2ae])
 by smtp.gmail.com with ESMTPSA id
 p4-20020aa7d304000000b00461cdda400esm7326226edq.4.2022.12.15.02.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 02:26:53 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 Robert Foss <robert.foss@linaro.org>, daniel@ffwll.ch,
 jernej.skrabec@gmail.com, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v1] drm/bridge: lt9611: Fix PLL being unable to lock
Date: Thu, 15 Dec 2022 11:26:46 +0100
Message-Id: <167109999520.488696.7695301244949222536.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213150304.4189760-1-robert.foss@linaro.org>
References: <20221213150304.4189760-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Dec 2022 16:03:04 +0100, Robert Foss wrote:
> This fixes PLL being unable to lock, and is derived from an equivalent
> downstream commit.
> 
> Available LT9611 documentation does not list this register, neither does
> LT9611UXC (which is a different chip).
> 
> This commit has been confirmed to fix HDMI output on DragonBoard 845c.
> 
> [...]

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] drm/bridge: lt9611: Fix PLL being unable to lock
      commit: 2a9df204be0bbb896e087f00b9ee3fc559d5a608



rob

