Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC03E5A26
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 14:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A188981D;
	Tue, 10 Aug 2021 12:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFDE8981D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 12:41:45 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d1so20820568pll.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=jEv32BiVnu7fQqSnvPGcx5ruZj5V0HnF2prfpKqxjn4=;
 b=0mjhlmrZSBz51JqUD9OH0DhuZBRxI34vxDlxoSVsklAlLVx+DB4RYGu4wXSCPJo6bE
 0Rj1Ffse8Rzx2ep4AxTlkweNF25Z6t+4LZO9PAdFTLPcQXwbra9BkRNXLHiVKaTsNc0S
 +ixAQQ2i6aJthqyAUcHvnh8fjB5XaFTimMRxJcK8KBdSEvIxfGKjYcbv5RpgW2yA029b
 ZfALDvV0HR4/2en03DYTmB2UEgKkjXlvfeQd+NIYlDc4ILWvxdqWUoEG+deW7Q3HdAV6
 XilWTUU3kgXGlUtEyArDUU12hOt0M0ah1oK3apBp/eiU70CaaFA9B1cMk20hy53/fqj7
 I6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=jEv32BiVnu7fQqSnvPGcx5ruZj5V0HnF2prfpKqxjn4=;
 b=a6lpzOO5zgp7iXvt6ZmiFKK0iMr3IDd460c0dMg4BqhID5IcEkdTmO/iTK3fUTPzOn
 llxnM230FlovNhjE9S5CR5VSTtvFO6eP2gzlSBRloY9ULRaFw221cSTnbHnMrJn5ZYzY
 ZBkU3M9+YyDXBzLSCys+3f07hkMzSQQY7QujtBCp370t8Aq/SGQbhW0s+MP1KHmsDBOT
 XdlhJvphCbhVtrpxouLGW0l4RAY6gGtC20tehL9R5IcWQHrBJLaiaDhJNgdSPctKY4bi
 hnQld/CsbQHoMxUtAAwQZQjBz1TYQ6l0uqyBwIz+wzSb18/BGAma3Oz2A9dxcsAJflSn
 Bb7A==
X-Gm-Message-State: AOAM5329vFLh9i+gMCK6ses84A+4oz6Kc9QWAUEjSXoCycY1lFfvrvEb
 MeD2U3MUnZpCOreT5939jsvoFA==
X-Google-Smtp-Source: ABdhPJxAEsdQRashpCRGsGTtR9hGQpKEX2bQMXc4GZMfve1VZFx9ipQvlCg0rOzK62MK+kdtLSnIMw==
X-Received: by 2002:a65:55c6:: with SMTP id k6mr188593pgs.129.1628599305051;
 Tue, 10 Aug 2021 05:41:45 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id y12sm23851561pfr.68.2021.08.10.05.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:41:44 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: pihsun@chromium.org, drinkcat@google.com, marcheu@chromium.org,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: Add inx Himax8279d MIPI-DSI LCD panel driver
Date: Tue, 10 Aug 2021 20:41:40 +0800
Message-Id: <20210810124140.16937-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412080134.24598-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20210412080134.24598-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

could you help to review this patch? This patch has been applied to our devices which use

INX 2081101qfh032011-53g 1200x1920 video panel and it works well.

thanks.
