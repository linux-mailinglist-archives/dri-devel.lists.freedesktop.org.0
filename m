Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B686C77CA85
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 11:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AA210E246;
	Tue, 15 Aug 2023 09:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4582F10E246
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 09:34:25 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d64f0c2bc95so4368259276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692092064; x=1692696864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+aqCbCTG3SX610WFzHfhqf3xPqj9uNEUpVVBMJW8z0I=;
 b=XZGntxvNC+CEc2MXkWduVwxQi/ZuEzk3rFernd2f4QjilSsrdJmUghl+FHjvuNQzC8
 ivqd7dhBa9J/B/4/jrx3sxY2Du+fT/+GuhwAgRbKXs8SkKr67v8yeviWAxaertP00iW1
 4DvodqdlEQ1BPwQUYnIYiaz4zpvDov0HyFQVmUIzmd+t62iP5DbMEsj8HmFjAGEtQ2S/
 0X75oWuQx0UijmbqrDZbquibpVg+6BQ6iVmSEMU68CPeKd9yj3fJQ6hoDVZUJ1roOhdb
 yup0nHP2wifPqQ+nuSoKVHxW8EpkzO+G3FqG+T5EJHX+WPfHnpGaoMySAzDEkGSOLx82
 M1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692092064; x=1692696864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+aqCbCTG3SX610WFzHfhqf3xPqj9uNEUpVVBMJW8z0I=;
 b=NTb6+fT424M+oSC14DKPYL0GtCsZiujAiduJkGjEUitpX4rIwdbru98FGSelgXZqMb
 ehznfSctfgsHTZ+YociMJxG2r9tJwMVMK7wDK0qfaR/PiEQ2CSrr7pqyiTRQsm7gl4C0
 zJ6wY682hCKJnnc+F8Y+zmMXe/QsNUxNMMYW008EdvdgXppl370RPHG6QxOAXjVGOR+z
 gTnOuPE0ylK2vmmtYpc2G73oOc4O4qO4r/ogspSKPXoG7iQhp7izmVuVLPmzAO7nRypw
 yeTTO5YDiawdG6fNzqd90fM62I6ujAh9Ry1Ps9PDPe3k4I0PGWu/H92GljPNIkWssa0f
 rQCw==
X-Gm-Message-State: AOJu0YyzfHPm5QA+owEOZ/wESKcBFAQD0ExHUAeB1Y1+mNLc1/rFf8Y+
 /OinVNJUq1BKsDJvvhAesXyjMA+fe2WWFfcdSc3uKA==
X-Google-Smtp-Source: AGHT+IEfXX/MlO8c55xxd4nYTkR0pVOGbMSAvB3eqL1ZoAPyv0aSzyNCevnKIi/joAb+59pUky5etVEa0uWfeiJJaYs=
X-Received: by 2002:a5b:951:0:b0:d4c:82ff:7bde with SMTP id
 x17-20020a5b0951000000b00d4c82ff7bdemr11623030ybq.63.1692092064397; Tue, 15
 Aug 2023 02:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230720125418.236140-1-imre.deak@intel.com>
 <20230720125418.236140-3-imre.deak@intel.com>
In-Reply-To: <20230720125418.236140-3-imre.deak@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 15 Aug 2023 12:34:13 +0300
Message-ID: <CAA8EJposiCUaC5xixiYU_awKy=B8tW9ptn3fSpesSVephAg99g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm: Add an HPD poll helper to reschedule the poll
 work
To: Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jul 2023 at 15:54, Imre Deak <imre.deak@intel.com> wrote:
>
> Add a helper to reschedule drm_mode_config::output_poll_work after
> polling has been enabled for a connector (and needing a reschedule,
> since previously polling was disabled for all connectors and hence
> output_poll_work was not running).
>
> This is needed by the next patch fixing HPD polling on i915.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/drm_probe_helper.c | 68 ++++++++++++++++++++----------
>  include/drm/drm_probe_helper.h     |  1 +
>  2 files changed, 47 insertions(+), 22 deletions(-)

I support merging these patches through drm-intel rather than drm-misc.

-- 
With best wishes
Dmitry
