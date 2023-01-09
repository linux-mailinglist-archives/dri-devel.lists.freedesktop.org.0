Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A53662297
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5670910E3A8;
	Mon,  9 Jan 2023 10:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07EE10E3A7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:11:45 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id a64so8053994vsc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nl5gtLkelHYob0yvxLrGJZ0WToOte9ATFrvdQKICgVE=;
 b=QNMyZmEv6uPuj/qm5nlVIOi9oLDwVoh7ki5s2SwsVlxB8Qa7tRd3oTaIfeHbBD+Dd0
 a0R6oWjAg772gZCDdeUZDLbwtzO1YittETMC244DFqNxDyLX+C4+Xktl9Qt7T64NE5Xi
 grJsVq7rhsC/EGWaUlY5lp6ayREbcqt4h6wMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nl5gtLkelHYob0yvxLrGJZ0WToOte9ATFrvdQKICgVE=;
 b=MafCAlRMQrCpewbFqxoG0srGuD7RDD4gVF5IQlH/xz1V0kk9vtKBI3SPNQj+34Uwj8
 h1qvf9pegQWnwV37s3a7HLwD7g+6GzmS7lc6bAeQepTTNs6PDl8dXuP9eE9t8DCj5WG9
 FbbzCCDYJREx8N2De2yvLhVdzTixz3o/5KW9QcTxrlhkGYj2+SlVY0B//TYVhooQwp60
 KaEDEGu+z6t4HXhCU2TusAxwfiXlE50k08I2mRH6f5rbOBpBpPyHIJXz/755mqBLVD4P
 pOPMzNAAf0vqujphqRIjEfrHOnLjq/GkIsMO1Pw5TntFTmoJZrJs+GgU5uQNhAnKJq55
 1LgQ==
X-Gm-Message-State: AFqh2kqyc83CMVDghLunsLSdkazQORRhPWSCLKqshh2bWesGk/tHIJuf
 Sb8s9qT12xGY4YWsv9mvm6aIereH+oaECTkO3vV15A==
X-Google-Smtp-Source: AMrXdXtcNn1bVy1ULhiaYChXgRMGkSnSLx4444KzFv+N7rK2lYGkipv1i04e7jLkrmz585HPK6nXmJX0twUwXvIgfVY=
X-Received: by 2002:a05:6102:374d:b0:3d0:af13:3b6 with SMTP id
 u13-20020a056102374d00b003d0af1303b6mr141886vst.65.1673259105126; Mon, 09 Jan
 2023 02:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-6-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-6-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 18:11:34 +0800
Message-ID: <CAGXv+5GnLhUfdDzDQ2Y1Hb7gb+rjZzMhLU+38MYR+VHRdUCtkQ@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] drm/bridge: anx7625: Check for Type-C during panel
 registration
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> The output port endpoints can be connected to USB-C connectors.
> Running drm_of_find_panel_or_bridge() with such endpoints leads to
> a continuous return value of -EPROBE_DEFER, even though there is
> no panel present.
>
> To avoid this, check for the existence of a "mode-switch" property in
> the port endpoint, and skip panel registration completely if so.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).
