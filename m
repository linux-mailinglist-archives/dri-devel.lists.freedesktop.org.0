Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130FC285968
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3C76E8AE;
	Wed,  7 Oct 2020 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5370E6E053
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 19:56:08 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n9so1147948pgf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=S8eSQwblG7magE2M9UvC+xcdzDuh3S8sxyEB62q5+1g=;
 b=le2hYmKsGwWNwVqNSwcjcTPzO5cuY3xEgiwXqiqs192Il24k51QSXPpXRaiTi9YzF7
 2rBNS7UVXRPw2mq8UkJlXkVOvAku8ULLpb07fQ1mR+Fwur0ESSIQ9O+PH5yKC5ribbg3
 v4wUZBgjAY/3AoLBWgI0Q8yNTwQiYsny962Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=S8eSQwblG7magE2M9UvC+xcdzDuh3S8sxyEB62q5+1g=;
 b=PzIYEMyc08PZZ578l5iTyymKQhzvFDTk4iwK5sSEasoFz2tF0g9imuogKOgxfGu3hW
 0EfItxxpU6Ovc8eGZoWr5nt84DHvnh2tFcnA/SmoAV/hB4wBt+3PmXZSTm6Y3NsqezPW
 O7Bm2NV8sNYm9BcuAB+ILFER0F7tSfuKBo9tEPDLcn+MRLfDGPccL1lp7wakW5z4yBGt
 tAUYbuBfJJ0HKeDsrB6BtOeKVXRX5nGeqjQiNA6KimmvbauuL9j4iim2uS4m8ONABO5x
 ziaBFqs/jQCPZu7sV98bZWEZPN9P1l2d48VIAsb7Q/TZuC6+0uug2BVlbNTdPUd3Mst5
 cmMw==
X-Gm-Message-State: AOAM533scnrrpIHs5IeVg496N/bMUUftg2hlc+Yr0HpQ0p92ROAr2uag
 8mPUU2n4lfDTriKUEDh2/jbJrw==
X-Google-Smtp-Source: ABdhPJwLqp/q9FllU9TkkqAftGyryDVyYi90GLXXKp/ilS3muE/yICdKxs6V2hpbi0Ht/CoKeIQ94g==
X-Received: by 2002:a63:dc04:: with SMTP id s4mr3793212pgg.123.1602014167858; 
 Tue, 06 Oct 2020 12:56:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id j19sm4524361pfi.51.2020.10.06.12.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 12:56:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
References: <20201003222652.32671-1-khsieh@codeaurora.org>
 <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: add opp_table corner voting support base
 on dp_ink_clk rate
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 06 Oct 2020 12:56:05 -0700
Message-ID: <160201416564.310579.6502664088674731743@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rajendra Nayak (2020-10-06 00:31:41)
> 
> On 10/4/2020 3:56 AM, Kuogee Hsieh wrote:
> > Set link rate by using OPP set rate api so that CX level will be set
> > accordingly based on the link rate.
> > 
> > Changes in v2:
> > -- remove dev from dp_ctrl_put() parameters
> > -- address review comments
> 
> This needs to go below '---' and should not be part of the
> change log.

In drm tree they put this above the triple dash.

> > diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> > index 76743d755833..7d0327bbc0d5 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_power.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> > @@ -102,6 +102,6 @@ void dp_power_client_deinit(struct dp_power *power);
> >    * methods to be called by the client to configure the power related
> >    * modueles.
> >    */
> > -struct dp_power *dp_power_get(struct dp_parser *parser);
> > +struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);
> >   
> >   #endif /* _DP_POWER_H_ */
> > 
> > base-commit: d1ea914925856d397b0b3241428f20b945e31434
> 
> ??
> 

This commit is in linux-next as d1ea91492585 ("drm/msm/dp: fix incorrect
function prototype of dp_debug_get()"). Seems fine.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
