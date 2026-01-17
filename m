Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB77D38ABD
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4009B10E27C;
	Sat, 17 Jan 2026 00:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CiXjx6gN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD5710E285
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:31:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso4973375e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768609900; x=1769214700; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
 b=CiXjx6gNCl9T8sTSMbJZf07aK8qRAjxC9mVtVPHNHOSEjFeLugS54wMHeMtEldb36A
 pf57H905VgXYPp6n/gwMZmvHuqcPWUJy6rty6lkFW4jrIhZG9Gh/YDjxJiStC7IyoS3R
 /DAyl1zFeis44GcvHRqGxcJ09HSIO2C7WZweTzbbuJKM4Fr7eqy1KfIiQgmMELCPDahF
 mSlWLgIanlmBRDxG4kly0DdKwMI+yPWM49+WlxFUWhsQo9GN8NRTJCZbwkwaVP32afAw
 wHKZlWQ+8+JzxtpOsLa2rl4/oKn4qtWQumh4MxZJLJnqrEiaHL6rl6hUak0BJJRCiz+5
 jlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768609900; x=1769214700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
 b=Jxy/mQC3wUJa23QwwzDcMehUwqFf7cZeT3GoiElJsBMaAutJQrV/Bni2e9Ei76v5kC
 4wx42XPyXMACz9mtAd+df33Y2lLks3yLvB0G3dP5aSU2f2kYfiYyX+AkYa3FXsE3zWJp
 87TVdaU0kWhvBhZ6wpNCuZJRiooooBWrm8sJIFdEVd6nrotLf9+rP32PKLfYBGzcMeQB
 J2XF72a/LBYAwcDPPZxaO9ONYmbC0WGNJfN2wnVQH50PBuBtfdyau6gGq/IDH3A81BVZ
 fhgns5HOszpQ+Xd2f2DbsmGbXKVQXynR4m2GsLvh8O11nKjdC3VmCgK2C/04SLNqKQuH
 Mjfg==
X-Gm-Message-State: AOJu0Ywb06sLguhVznto3Zrr7q5Lnh8UvzObewvV3SBfR9Um8ziVqAGN
 TuUt6Wx0OTGdD1+dS9Ko1Ov9jaodkoIz6BeB+bZ4OakIphe0h24LkclN
X-Gm-Gg: AY/fxX6IagMBWJfQ3/VE+8l28G08q4fdFCjrzVrPgmzlWGUZf7A53Zp5M57dLUXiErb
 QjS+VRRqc7uPpDS4a4l3mEvXKgfNsqlb1vxmX+wsUAv0vsPYpFBK6ozJW1+naOu8NmwT/0k4ty8
 QFdDRuq36mSfHEFuWUQ9K1Kyz3TrtXpKK6BgxmBv96hkFdUBWJvOZtqyC1M8ejGxAoOPhQD7qDa
 wFPD5uuaqpCCNYZ5mbHbP5qMX/HbyH6UNP64nKDKv7A7AXZu3ae76EIeeLF3P/jNBCJiUOTirgk
 Qe0QnJcPw0IhCeABk4l6idQIeom/40GI+9JZdqUXLHC/+3m7mqh2SYLv7SDmA4qxK0kE1BHiWBH
 lAYeM5Q0LYISiYro5hmjvltdlCq7cTBI4LVIdpKRKGuilthwepegNrbLjVuVqGt6uBZXVrdn9Qu
 FWOsA405XBOJrOOq0Xb8kiXHwROpfpytjiEp0rl9sxXJmoaJAe868gg5zU75CJaPIa104A5124D
 hfBmvM=
X-Received: by 2002:a05:600c:3b9e:b0:477:9a28:b09a with SMTP id
 5b1f17b1804b1-4801e2a5861mr63784045e9.0.1768609900200; 
 Fri, 16 Jan 2026 16:31:40 -0800 (PST)
Received: from localhost
 (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e9fb193sm27730315e9.6.2026.01.16.16.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 16:31:38 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:31:35 +0100
Message-ID: <176860988748.1688420.11717122647073678.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
        commit: d262d030baef287da33344a932639aab5f913c3a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
