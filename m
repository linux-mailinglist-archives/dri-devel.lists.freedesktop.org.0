Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A002F5D81
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37FF6E157;
	Thu, 14 Jan 2021 09:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ED26EC46
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:25:56 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id b5so1907626pjk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=gcin89rV0I7IqOVbv9QUmTeBAufbW/EP7UVT7uECDZc=;
 b=W3/hfnVx1RKsL4BcMpubo4sIVkeHPQNvBiKClmnTGfqiZIKSQNo4mDZfx0kJQnXQm7
 D6jatbyMCWCHJMfpg2HfYmnwgMGkzs5HYGM0kgMjpRA0wpvjZq/pIqVf6PJsRt+Kx6XW
 r/YcVR2l5+N25gm2DaDM+Ap+SK+7GQuvK7rx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=gcin89rV0I7IqOVbv9QUmTeBAufbW/EP7UVT7uECDZc=;
 b=K+xn5rqIYBf7I/NT6npP1opKE7DI98OHx5W5ZKv0cWFrIBOLcblVnotK4OD7NHYJak
 rNf0/9YG7v52TFRBEk0eT04MnqvXo8aGIPfAJ0tkIVadPV7kJ9C8c32uKbVbraMmxeeD
 Gqx0xF36PEsHyDdGFJ4ch71C36nRuzYVcZOoclryQB8byblm/QHvf1d5kPxs2xxhD+ub
 SYo7c3rTvRrzNZO2ixgK9g6Wvytj2AzqjEn6M/j9qGvY+3OekgQz0vvqwGqWAKYXn7UJ
 SHIaey/1OCOlQ0WNZc3GB3d6NlBeG+CZ3ALtjLrYjnDP4UMpjG9xMNS1S9C+JeF65Sqo
 Eh1w==
X-Gm-Message-State: AOAM533ExzyoB2U3VNABTVBLcYgx5SsfQtnUU4roASufWjSkpy64yDDm
 CgXwPOCJliESx1jDfvCFD8b+Sw==
X-Google-Smtp-Source: ABdhPJycCWJ3lRjFwltpCDQVyM6m4HdsDCiUKkLSp4ACw4lxoBY0IFDGY9PSQ9YLIGnXpVCrdx04ug==
X-Received: by 2002:a17:902:9009:b029:dc:52a6:575 with SMTP id
 a9-20020a1709029009b02900dc52a60575mr3869284plp.57.1610569556468; 
 Wed, 13 Jan 2021 12:25:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id 36sm3511232pgr.56.2021.01.13.12.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:25:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
References: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 0/2]  fix missing unplug interrupt problem
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run
Date: Wed, 13 Jan 2021 12:25:54 -0800
Message-ID: <161056955435.3661239.1548841852585636847@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-01-13 10:59:58)
> Both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts.
> Therefore irq_hpd handler should not issues either aux or sw reset
> to avoid following unplug interrupt be cleared accidentally.
> 
> Kuogee Hsieh (2):
>   drm/msm/dp: return fail when both link lane and rate are 0 at dpcd
>     read
>   drm/msm/dp: unplug interrupt missed after irq_hpd handler

It won't apply to the drm msm tree. Please rebase and resend.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
