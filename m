Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3B2FC105
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 21:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EA46E030;
	Tue, 19 Jan 2021 20:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D374C6E030
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 20:31:32 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id o10so30917462lfl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nJcXNoH8E3aokPgO4BKfYF5qohGlAlcDu7kLVa0nBA=;
 b=DYUO2d4yCSIx4re3VOc4/ejR4WqTUcf27k5UZ6RV9JxY36OFGaixYjqS4nz3+0SSqE
 L9CJf326BCDrmNptAHBfZl73wCmr87tEeElAp1V7MadlglUZY/yI/GwyhY96izF8BrGj
 ETe6diBX9DQJLKINfEQyfHQDTJD3Z9bNz2rhIM/l6LAIyqEDoGY4Oz7YvgIoPgOUg95I
 qEr2O8r1hNa8OknyZkdRtmPfFSO5W+s1Kj7b4QfxYEdOudnAutghQqr84srwWazErzDk
 n7iJJILsOHRPIcRdSPdSncqlOgkRx9n2xVjB0k3cpyvWYKgKSo8PHH8WYXBOqS+zMg/7
 1xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nJcXNoH8E3aokPgO4BKfYF5qohGlAlcDu7kLVa0nBA=;
 b=OOvA1rxVa18Vlwsj7EUeUCvsjAX6fWrALb3Wp51pM358/ze/dE9xkMcyAta0qjoa1L
 HrzuGD6LeZep8oP4pwVgd1jktKlrokP+HX2bburaqMnRjC0R93lBsx48WbAp1L92PpnY
 W3dlTj/jJzduQdaNITOo+4NnMWwjwBn6GpKrv00Q9O1vYVz9cX3++0BAGliQxVNOc2b4
 LQlAe1tChxrNAL3YB//mDVym16j9NlgNEtMj/hHXU+q1Qo6DN2hwH2K2cEAaWC7ERjeg
 SKs+5iWC1A7n+YNhjVOzl2fJDm/KHBcbef8kXS5tZTam/qSFiIGQGi9bQKrNJh2M/EW9
 YUAg==
X-Gm-Message-State: AOAM530zKdr0gQlOf2x/rj3DmEzUQfLhWIfxVU8IPZstg+6cRwMbrpMK
 VWmGrKF1AeG+BR1ETTz34jbwrWjjmWGxye/0P57LPg==
X-Google-Smtp-Source: ABdhPJzn6b8f4IdmLW+Jc4y/BacRK4n5UWsqai7H2T3iKIHKBVAXQ9I/doUhxxJ2NE90WdVGTsbugI4YcP/KGNlmhM4=
X-Received: by 2002:a19:8357:: with SMTP id f84mr2538481lfd.567.1611088291224; 
 Tue, 19 Jan 2021 12:31:31 -0800 (PST)
MIME-Version: 1.0
References: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
 <1610757107-11892-2-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610757107-11892-2-git-send-email-veeras@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 19 Jan 2021 12:31:19 -0800
Message-ID: <CALAqxLX9Jh8NpXQwQ5ssBYuypbzzNg2OF+hPxxYfCnvzmzNOWg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/drm_vblank: set the dma-fence timestamp during
 send_vblank_event
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 4:31 PM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> The explicit out-fences in crtc are signaled as part of vblank event,
> indicating all framebuffers present on the Atomic Commit request are
> scanned out on the screen. Though the fence signal and the vblank event
> notification happens at the same time, triggered by the same hardware
> vsync event, the timestamp set in both are different. With drivers
> supporting precise vblank timestamp the difference between the two
> timestamps would be even higher. This might have an impact on use-mode
> frameworks using these fence timestamps for purposes other than simple
> buffer usage. For instance, the Android framework [1] uses the
> retire-fences as an alternative to vblank when frame-updates are in
> progress. Set the fence timestamp during send vblank event using a new
> drm_send_event_timestamp_locked variant to avoid discrepancies.
>
> [1] https://android.googlesource.com/platform/frameworks/native/+/master/
> services/surfaceflinger/Scheduler/Scheduler.cpp#397
>
> Changes in v2:
> - Use drm_send_event_timestamp_locked to update fence timestamp
> - add more information to commit text
>
> Changes in v3:
> - use same backend helper function for variants of drm_send_event to
> avoid code duplications
>
> Changes in v4:
> - remove WARN_ON from drm_send_event_timestamp_locked
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---

Looks good, as expected no longer seeing the warning.

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
