Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2BA82A515
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 00:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF93B10E674;
	Wed, 10 Jan 2024 23:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C16810E674
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 23:50:49 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dbed729a4f2so4027288276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 15:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704930648; x=1705535448; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IY2WHo656dlJft78J6VUeykbQH3OBUSeMuyIpTpTn1Y=;
 b=cqSUD1MHCU4P1ttNzAuPXZzJLy1FZdw8ogTzKKdIDe1mvrMCrWTVJKBOp2CpPqDySf
 3YMeWjnfNfW2uDUd/IGzEAt7Ak1BFZJBMQMDbzk8VaDYhqYhRIJi7yDVWOPnijZrICzA
 Kmo/j51trR0oK6c0WVu77+nlLoHLiz+OEJfDetkviDtDGJpsg9iaccuFLxfW6a0BRBMF
 GbIvzsnPTtkCYIbwHF2yPOmKYT0YOrxjS1VAYhcgyRQl3kJXvmPRmgTR9I8g7Hh9VGHT
 rUOYynKkuNUBf6+879V3EHnrIw/qPOYxHQJ3mtt95m1tdfjVkJ7YtmuWhH6AczYLTbvp
 2oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704930648; x=1705535448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IY2WHo656dlJft78J6VUeykbQH3OBUSeMuyIpTpTn1Y=;
 b=nhUX/+JQf/rWKYuAmZk+mKitOB7l6Ve4GpTI/tsfldt8hdfML+E4tgwTgzdycKo2FP
 rISwQ3jGJ/CKwsVPxlZIR5GGuHlfkX0OcC3z8VTy0TnI39hRoxHQv5lqJDuabPanl6TD
 B7lCTvYu1PoKjAb+stoIlxIJoFKdttxuOfBem4dYx+eQTtrk7QH1b5Xzam+qPftMO9aX
 6+UPRKazPU+nCPu3vpiAXkF3SVrfCbcwIreE6OAoHoposE685HpUTge4ZBr47QocSavO
 VHiJbSFHFF3SaIpVunssz6IVTH49NCpC0C+FFtq1wUOYFEEaUJEzOGCt8WH7fHyV5kvu
 gHDw==
X-Gm-Message-State: AOJu0Yy9Lp4zPZyzwzjo/74RqO+dt6MKewIDs+K2naRjRQFKx/7RzjYD
 asMlZXYryowqWkkVGxXnaEPSAPrjvsemOfOGR9CtDzVpdcXvOA==
X-Google-Smtp-Source: AGHT+IE0M9W/0P2Ae6mYe8PCrJ9dMKg+/Sc+SJ/3RpX4hnY2c5YNeNuY5R4SrTJIFAZOV6C8lq2rU9YH1tu7XsHEaA4=
X-Received: by 2002:a5b:651:0:b0:dbd:b17c:802 with SMTP id
 o17-20020a5b0651000000b00dbdb17c0802mr409911ybq.52.1704930648185; 
 Wed, 10 Jan 2024 15:50:48 -0800 (PST)
MIME-Version: 1.0
References: <1704917931-30133-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1704917931-30133-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 01:50:37 +0200
Message-ID: <CAA8EJppcsQtS7h4g+hK+sss7pDuvKjkJX1o7_DUO-rTg1BtWLQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msms/dp: fixed link clock divider bits be over
 written in BPC unknown case
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024 at 22:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Since the value of DP_TEST_BIT_DEPTH_8 is already left shifted, in the
> BPC unknown case, the additional shift causes spill over to the other
> bits of the [DP_CONFIGURATION_CTRL] register.
> Fix this by changing the return value of dp_link_get_test_bits_depth()
> in the BPC unknown case to (DP_TEST_BIT_DEPTH_8 >> DP_TEST_BIT_DEPTH_SHIFT).
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Additional note. Since this made me look at how DP_TEST_BIT_DEPTH is
handled in the driver, I stumbled upon dp_link_bit_depth_to_bpc() vs
dp_link_bit_depth_to_bpp(). These two functions look pretty redundant.
Since the former one is used only for the debugfs, please consider
sending a patch that removes it for the sake of using the latter one
and /3 in dp_test_data_show().


-- 
With best wishes
Dmitry
