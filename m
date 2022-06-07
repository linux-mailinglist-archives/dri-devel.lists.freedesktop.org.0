Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E576353FEBE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 14:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B6F10E8DF;
	Tue,  7 Jun 2022 12:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FB110E8DC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 12:27:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q15so15907930wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnS9eZBppnZjRJEyPEWcwbc8qEUGNcbl9p3ctix2mdQ=;
 b=Jszx/Wi26USE9TtJWbMiiHrtAozvWbXe9c3sHzU7LSgZNED7VOPVQmXwkicOV9u6RT
 /wX0EMV6B19rD42E+0GzJ6YUnQgc9DtniJ9Ixff4M5oRQaw6rRM51B98kwscnMTjT45H
 T1ip3clG3PHk1wh/HVieVEzlNf6lvK/ZJLhgGgXinrM8DG/lLmsccix1OgrMV7rpbjwj
 9VHRhqjYrBRaihvRnR4fRqqZJ5YakE5G5kG9N6vKLWiVfRzcqowm9zISNFFko0nLesv5
 IHNF5f+8hQyLleVlNdc/9rHU0RCoZco/GincvPZJbvVltgITdRm2u2ts7cIL1ePL5QJT
 CopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnS9eZBppnZjRJEyPEWcwbc8qEUGNcbl9p3ctix2mdQ=;
 b=1TY3uowL5n4BvjWg4qauGtd73QGznfJrH+HWDW9Ox64smSV8kydEnShE7adZ1cpgQI
 i4hpDj2rItCVCD4o4lEAkbP5Dus5MSJk6jedoOFdZ2hyAqywhQfNFw5IWGmkNYDYI1K/
 3bxmGF0dnfj9nSKZUY5BOI977ggAs9JkGfANOMp2LZ99fW377ayIalfOKWIk8WT4+b7O
 w8+krYlImndWIMOOItv899V5Zl0/6ATtvVpTUJE/pwLIKs2Kjq5JJZnqmOB5ODaDACL/
 NVFXpk2aE+OkfnALHkKLwLSUCOa+gCBQNMxU4UIN/pdODH+Co9bsPtog/h3iXX6FdK8o
 hb0A==
X-Gm-Message-State: AOAM533no+9OfLwc3mEqufsxZcVWQDp8V5C7CRbjprtX5oeX7BI7XLVN
 Qu+3WtuPYI1pk7bY1Q5cZqFcKg==
X-Google-Smtp-Source: ABdhPJz39mrIrz65dmQlmcX3m/aOeY5/aTHzZPbMkd34nx5R2i8IAXjv1ymugad1I8spt3xpgUJJcQ==
X-Received: by 2002:a5d:6483:0:b0:20f:d046:6382 with SMTP id
 o3-20020a5d6483000000b0020fd0466382mr27123834wri.342.1654604834197; 
 Tue, 07 Jun 2022 05:27:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:87c5:1f51:1550:2ebc])
 by smtp.gmail.com with ESMTPSA id
 186-20020a1c19c3000000b0039c4ec6fdacsm6553533wmz.40.2022.06.07.05.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 05:27:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 dri-devel@lists.freedesktop.org, Miaoqian Lin <linmq006@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/2] drm/meson: Fix refcount leak
Date: Tue,  7 Jun 2022 14:27:11 +0200
Message-Id: <165460481589.1168988.17623464252935400226.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601033927.47814-1-linmq006@gmail.com>
References: <20220601033927.47814-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 1 Jun 2022 07:39:25 +0400, Miaoqian Lin wrote:
> The following patchset fix two refcount leak bugs.
> The cause of the bugs are missing of_node_put()
> after of_graph_get_remote_node().
> 
> changes in v2:
> - patch#2:Fixed patch in meson_encoder_hdmi_init, call of_node_put()
>   after of_find_device_by_node() and error paths before that.
>   noted by Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7d255ddbbf679aa47e041cbf68520fd985ed2279
[2/2] drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d82a5a4aae9d0203234737caed1bf470aa317568

-- 
Neil
