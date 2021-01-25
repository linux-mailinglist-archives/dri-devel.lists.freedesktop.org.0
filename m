Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B1303825
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9B06E454;
	Tue, 26 Jan 2021 08:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8773899FF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 20:26:04 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id g15so346647pjd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 12:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Kq5gT7mxggPfi7e9b5vgYqHvxswxUEITmOo503bNPRM=;
 b=l8fldT7NjqGsjK8e94mViVElU78aFxacWv4iHmvj1C3Ick6Lhj1+EsgWrpghrCeHWi
 JsIV2m2zChqQE0GBl535HOJULKdZKUINIZR0VX/EwakawxvZAgXmZDmDwnJqiAGWvfRS
 xohl0yNNwGWrr0UvyECHMsm2FZkHmr9fDb4N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Kq5gT7mxggPfi7e9b5vgYqHvxswxUEITmOo503bNPRM=;
 b=fGqBvTuvSYkOqSNwRcq4Lr96oZTxNX2MWzkSK7Owe+3eaf+DnaUxaitLCULmfkekY1
 4eWLS7XMD23x/6lqUEybKLKSYB37kiwsePxQkzEwpxfg50JkyTN1Ocp+7/Z+NC0NNY/c
 KHtmvu3JvGtc4UYGHVuYaFFKiPak29FgYYtoYBpwf9t+vX0UIAa1pnHykvDEnS5XITGk
 GKfa7Ih9C999RubJYLJkcAszxRtPtvEuIFBygehgkkE9JeUXB3dVxAxYm9kTH8N96SuH
 h9H2QpYvgY9Ru3KLvJA+92vm27QX6HVeN/zyGeJKst1GXHwWTs+eFCsFwxU4wcGn3f9T
 3tGA==
X-Gm-Message-State: AOAM532d6zk2CvounGhwZXk6ZwqIwGtOxzacV30HpVrN5WtV3KeIDyz8
 Ejc2UQQEtT+knI620qWxIJxE+w==
X-Google-Smtp-Source: ABdhPJzqwYZ812WkWyypqLpJnXmYbS5oyt36jko1D4jMQ5RuHYxVmUdhXcCRuhSBCyLyeK/rHupRGw==
X-Received: by 2002:a17:902:9883:b029:df:fc41:38e1 with SMTP id
 s3-20020a1709029883b02900dffc4138e1mr2160391plp.68.1611606364411; 
 Mon, 25 Jan 2021 12:26:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:1066:b437:97cd:2278])
 by smtp.gmail.com with ESMTPSA id t8sm183396pjm.45.2021.01.25.12.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 12:26:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210115144345.v2.2.I183b1817610d7a82fdd3bc852e96d2985df9623f@changeid>
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.2.I183b1817610d7a82fdd3bc852e96d2985df9623f@changeid>
Subject: Re: [PATCH v2 2/5] drm/panel-simple: Don't wait longer for HPD than
 hpd_absent_delay
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 25 Jan 2021 12:26:02 -0800
Message-ID: <161160636226.76967.16862386814744159828@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-01-15 14:44:17)
> If a panel has an hpd_absent_delay specified then we know exactly how
> long the maximum time is before HPD must be asserted.  That means we
> can use it as a timeout for polling the HPD pin instead of using an
> arbitrary timeout.  This is especially useful for dealing with panels
> that periodically fail to power on and need to be retried.  We can
> detect the problem sooner.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
