Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1237A6EEE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 01:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25410E417;
	Tue, 19 Sep 2023 23:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59F810E417
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 23:03:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AADFB817C7;
 Tue, 19 Sep 2023 23:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAF6C433CD;
 Tue, 19 Sep 2023 23:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695164618;
 bh=AVm/wivqgdaYPeb2TV3gnjnCGczTQW2Knav2WIIU+3o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pHeNS/agG4PS6WxON62G7QizekGP+u5vmPP2ipBG9P8uwxjXW73vH9UdVrn6WwsUX
 6vj/DYrQ14u7MCBDHmt/PNYf/5QogI4s9Q2qDAIQ8RjmUqJGtZMa+/HHPdILKcUTqv
 rKRZ+FtjEEs4ZwWdnVA0nEaS/9sZE8ZHWaoqlI8ODh5wUUZvmQqni6a58P8HUUhy/m
 A/0zyE9i5u1D34c4aqUkTYtJoSDelOi2ug+TUJ7Ekydhbq0qGuJataqmS+wOvtY+9Q
 SJrCq78hKb8rM0ph9DeRyYaYa0fbPU9Vm7NbbIdjoUYfBUFW3Z+o2Yzm9O7aftsWMG
 BdLPieoZMA90g==
From: Bjorn Andersson <andersson@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>
Subject: Re: (subset) [PATCH v4 00/11] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
Date: Tue, 19 Sep 2023 16:07:29 -0700
Message-ID: <169516486001.787935.12322857337806445764.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 27 Jul 2023 10:16:27 -0700, Douglas Anderson wrote:
> The big motivation for this patch series is mostly described in the patch
> ("drm/panel: Add a way for other devices to follow panel state"), but to
> quickly summarize here: for touchscreens that are connected to a panel we
> need the ability to power sequence the two device together. This is not a
> new need, but so far we've managed to get by through a combination of
> inefficiency, added costs, or perhaps just a little bit of brokenness.
> It's time to do better. This patch series allows us to do better.
> 
> [...]

Applied, thanks!

[11/11] arm64: dts: qcom: sc7180: Link trogdor touchscreens to the panels
        commit: 989aac9dea7fcfc33b5eedc4ae44abbf71460a4d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
