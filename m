Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF66DF01C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 11:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F294910E0B4;
	Wed, 12 Apr 2023 09:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E073110E0B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 09:16:23 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5709A20010;
 Wed, 12 Apr 2023 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681290976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yu4VI5tu+VJnGQshuaF5A3h9LoTgJ1TFgqR+sIDIKMU=;
 b=W7hdKL/Zd26EZLEDZarnsoarc6O3jhppN9xx3AGtCkU73+//W1zTReWuI1PZA5g+O/kA4s
 vUm6UQq/btxMrhKsCpKTvPcNY19QPerl67DxziES9GrvWFoQkuAz0wlhiANGxY295gJHqi
 Yu/l9N1gvwYbqrL6IFhIW4QVRT0vw/rNom8p2NMfJe1s0EtDCO6BeJEPe6FryI5WTHIzQ9
 u9veYgC/mDBB7eHa50lq9jzaiq/lEXJU/3HH2HpS7BCSdh+otQ57mXRdmaQ3ejHHF9QN3B
 tqPWW95kkfuEcPVxECWWwVGur5+qat0HY5YBQdoc4I3jwSXGp4Y/O8WcyH8QTQ==
Date: Wed, 12 Apr 2023 11:16:10 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 00/20] Add Tegra20 parallel video input capture
Message-ID: <20230412111610.2fbfdf7b@booty>
In-Reply-To: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On Fri,  7 Apr 2023 15:38:32 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> New in v5: dropped the patch that was removing lots of the logic behind
> enum_format, after discussion with Hans. The rest is unmodified except for
> rebasing and fixing a couple typos in comments.
> 
> Full details follow.
> 
> Tegra20 and other Tegra SoCs have a video input (VI) peripheral that can
> receive from either MIPI CSI-2 or parallel video (called respectively "CSI"
> and "VIP" in the documentation). The kernel currently has a staging driver
> for Tegra210 CSI capture. This patch set adds support for Tegra20 VIP
> capture.
> 
> Unfortunately I had no real documentation available to base this work on.
> I only had a working downstream 3.1 kernel, so I started with the driver
> found there and heavily reworked it to fit into the mainline tegra-video
> driver structure. The existing code appears written with the intent of
> being modular and allow adding new input mechanisms and new SoCs while
> keeping a unique VI core module. However its modularity and extensibility
> was not enough to add Tegra20 VIP support, so I added some hooks to turn
> hard-coded behaviour into per-SoC or per-bus customizable code. There are
> also a fix, some generic cleanups and DT bindings.
> 
> Quick tour of the patches:
> 
>  * Device tree bindings
> 
>    01. dt-bindings: display: tegra: add Tegra20 VIP
>    02. dt-bindings: display: tegra: vi: add 'vip' property and example
> 
>  * Minor improvements to logging, comments, cleanups
> 
>    03. staging: media: tegra-video: improve documentation of tegra_video_format fields
>    04. staging: media: tegra-video: document tegra_channel_get_remote_source_subdev
>    05. staging: media: tegra-video: fix typos in comment
>    06. staging: media: tegra-video: improve error messages
>    07. staging: media: tegra-video: slightly simplify cleanup on errors
>    08. staging: media: tegra-video: move private struct declaration to C file
>    09. staging: media: tegra-video: move tegra210_csi_soc to C file
>    10. staging: media: tegra-video: remove unneeded include
> 
>  * Preparation to make the VI module generic enough to host Tegra20 and VIP
> 
>    11. staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
>    12. staging: media: tegra-video: move tegra_channel_fmt_align to a per-soc op
>    13. staging: media: tegra-video: move default format to soc-specific data
>    14. staging: media: tegra-video: move MIPI calibration calls from VI to CSI
>    15. staging: media: tegra-video: add a per-soc enable/disable op
>    16. staging: media: tegra-video: move syncpt init/free to a per-soc op
>    17. staging: media: tegra-video: add syncpts for Tegra20 to struct tegra_vi
>    18. staging: media: tegra-video: add hooks for planar YUV and H/V flip
>    19. staging: media: tegra-video: add H/V flip controls
> 
>  * Implementation of VIP and Tegra20
> 
>    20. staging: media: tegra-video: add support for Tegra20 parallel input
> 
> Enjoy!
> 
> Changed in v5:
> - removed patch 3 as requested by Hans Verkuil; now the driver is kept
>   video-node-centric and the enum_format logic is unchanged
> - rebased on top of that
> - trivial fixes (typos)

According to your review of v4, removing patch 3 was the only change
required, and I didn't do anything else, and there have been no big
changes since v1 anyway, so I was wondering whether this series has any
hope to make it for 6.4...

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
