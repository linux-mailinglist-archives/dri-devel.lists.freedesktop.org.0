Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4AC5A63AE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EAD10E0CA;
	Tue, 30 Aug 2022 12:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BB510E0A9;
 Tue, 30 Aug 2022 12:40:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4932616B3;
 Tue, 30 Aug 2022 12:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820DCC433D6;
 Tue, 30 Aug 2022 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661863237;
 bh=t8U5J96q76hll8fwIHsLi3w7JfANN/JKd9/p9ZRTFoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MXUXVmUJqlXbVkVBL9QUxwUBEBL0sXZGetfWReG71xVpIAKzVRGheFwjB0wuCzA08
 gr/o4o4/l2rjvdri/WPPyCAZPluJpi5FAWlg024WkJx8VH67IRkbTxJESvqD7raWey
 ctASO0JBeqQOTyOM0NQQzAiA4ehDEyg4JaOoNJliqHSeTV6d1ZGcfyW6cmU/XVW63L
 NaWrQKJAF61xCfzBXCFIfQH8rYKGCo0b+K8KvXs6e/gdnZxbcp6BZ5297Ew1FA6nmq
 5f1ZtYOGO1QGQDNnKZPYB5kLXgrS9fncE4/wjsYoN4Q/o/9FKFCny7z9Fl/MUTcRW5
 J5cXH3EZHTnxw==
Date: Tue, 30 Aug 2022 05:40:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Subject: Re: build failure of next-20220830 due to 5f8cdece42ff
 ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
Message-ID: <Yw4FQm6V7d3MuMKG@dev-arch.thelio-3990X>
References: <Yw3V8yJgAnPD8o6P@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yw3V8yJgAnPD8o6P@debian>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sudip,

On Tue, Aug 30, 2022 at 10:18:43AM +0100, Sudip Mukherjee (Codethink) wrote:
> Hi All,
> 
> The builds of arm64 allmodconfig with clang have failed to build
> next-20220830 with the error:
> 
> drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
>         of_node_put(device_node);
>                     ^~~~~~~~~~~
> drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
>         struct device_node *endpoint, *device_node;
>                                                   ^
>                                                    = NULL
> 
> git bisect pointed to 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> 
> I will be happy to test any patch or provide any extra log if needed.

Thanks for the report. I noticed this yesterday and sent a patch:

https://lore.kernel.org/20220829165450.217628-1-nathan@kernel.org/
https://github.com/ClangBuiltLinux/linux/issues/1700

Cheers,
Nathan
