Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2C48E985
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 12:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B43510E15D;
	Fri, 14 Jan 2022 11:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D645510E15D;
 Fri, 14 Jan 2022 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1642161442;
 x=1673697442; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GxYdK86AwVncAjnPJuoy99CKiKtTmvQPJrbjyinZXo0=;
 b=K6Bb66TgHSLe9Eto1TTvmIMMX4fWSEGiwArKscNhF9ON0+Nhc1arpw6v
 oRAgoWkGLAI74zVOy9IXsW8doj6CiDJNxQ1l67gpJqTec5qvpIyYT4k84
 ZxDdpqy/yO6CBxFPPb2zyCB6Ay7eBGWFXhOv+Glht2WOSpqBS9d0fAIju
 bouTMq2Ig4C/kPAC5c/C2PBSpy3z6gXBxA7Qu3BGdRtA1a8ucy582WxVA
 X6K87uPn7WIBe9a+/FKAzTbtnPBEb7MYCuGB56noEVvDXbAmTzPG956VR
 LLAnS0LBjQX2Gtb/KpIOdzDmpft530ZhE8hwOhmUlDkYL0IH/tmKBG5J9 g==;
Date: Fri, 14 Jan 2022 12:57:18 +0100
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v11 01/19] dyndbg: add _DPRINTK_FLAGS_ENABLED
Message-ID: <20220114115718.GB23983@axis.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
 <20220107052942.1349447-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220107052942.1349447-2-jim.cromie@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "quic_saipraka@quicinc.com" <quic_saipraka@quicinc.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "will@kernel.org" <will@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jbaron@akamai.com" <jbaron@akamai.com>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "quic_psodagud@quicinc.com" <quic_psodagud@quicinc.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 07, 2022 at 06:29:24AM +0100, Jim Cromie wrote:
>  #ifdef CONFIG_JUMP_LABEL
> -			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
> -				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
> +			if (dp->flags & _DPRINTK_FLAGS_ENABLED) {
> +				if (!(modifiers->flags & _DPRINTK_FLAGS_ENABLED))
>  					static_branch_disable(&dp->key.dd_key_true);
> -			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
> +			} else if (modifiers->flags & _DPRINTK_FLAGS_ENABLED)
>  				static_branch_enable(&dp->key.dd_key_true);
>  #endif
>  			dp->flags = newflags;
> -- 
> 2.33.1
> 

I haven't tested it so I could be mistaken, but when
_DPRINTK_FLAGS_ENABLED gets two flags in the next patch, it looks like
this code still has the problem which I mentioned in
https://lore.kernel.org/lkml/20211209150910.GA23668@axis.com/?

| I noticed a bug inside the CONFIG_JUMP_LABEL handling (also present
| in the last version I posted) which should be fixed as part of the
| diff below (I've added a comment).
| [...] 
|  #ifdef CONFIG_JUMP_LABEL
| -			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
| -				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
| +			if (dp->flags & _DPRINTK_FLAGS_ENABLE) {
| +				/*
| +				 * The newflags check is to ensure that the
| +				 * static branch doesn't get disabled in step
| +				 * 3:
| +				 *
| +				 * (1) +pf
| +				 * (2) +x
| +				 * (3) -pf
| +				 */
| +				if (!(modifiers->flags & _DPRINTK_FLAGS_ENABLE) &&
| +				    !(newflags & _DPRINTK_FLAGS_ENABLE)) {
|  					static_branch_disable(&dp->key.dd_key_true);
| -			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
| +				}
| +			} else if (modifiers->flags & _DPRINTK_FLAGS_ENABLE) {
|  				static_branch_enable(&dp->key.dd_key_true);
| +			}
|  #endif
