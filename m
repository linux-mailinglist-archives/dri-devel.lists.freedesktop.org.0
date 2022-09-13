Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9975B7D69
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 01:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EF610E63A;
	Tue, 13 Sep 2022 23:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645D310E63A;
 Tue, 13 Sep 2022 23:19:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7B9E6164C;
 Tue, 13 Sep 2022 23:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D78CC433D6;
 Tue, 13 Sep 2022 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663111188;
 bh=b1pLnmMuioHkgk4pVnIfvX2/f7TD1waJQ9v/QDIjOjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TkUT19HGca46QnU2aOU1Zp5C2QLtJmMsxr83BGu9yOV1VKUgBB0pRf378XAqds40a
 pPGO5iXzOjHPOQtwuVEYXslUcRYN/gtVivAK3YIDBN5JTYSNaqS+6c90EtKLe+uzcr
 v/vykjRE+P7UreElkm/j0EUexMdpn7aBKsYNGP//oL905bxSiwMxpoML5YdLAT0uuX
 yBSBLQk755/KaPw9VoERzsgvUX+ILiDBM+Aam+gneYHRJgajKkfvZ92bEQ03cAj496
 nWAvrlEe+X62dVCPi7n+aOuY3HBI41avAiNW5QdXi7YhacW2An45kwzdx0Nzv9b1c6
 /wPjo8IkDG0rA==
Date: Tue, 13 Sep 2022 16:19:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Subject: Re: [PATCH] drm/msm: Fix return type of mdp4_lvds_connector_mode_valid
Message-ID: <YyEQEdSJLz3MR0/K@dev-arch.thelio-3990X>
References: <20220913205551.155128-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913205551.155128-1-nhuck@google.com>
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 01:55:48PM -0700, Nathan Huckleberry wrote:
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
>                                      struct drm_display_mode *mode);
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of mdp4_lvds_connector_mode_valid should be changed from
> int to enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index 7288041dd86a..7444b75c4215 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -56,8 +56,9 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
>  	return ret;
>  }
>  
> -static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +static enum drm_mode_status
> +mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
> +			       struct drm_display_mode *mode)
>  {
>  	struct mdp4_lvds_connector *mdp4_lvds_connector =
>  			to_mdp4_lvds_connector(connector);
> -- 
> 2.37.2.789.g6183377224-goog
> 
