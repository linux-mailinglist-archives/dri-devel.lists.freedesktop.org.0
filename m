Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E06931567
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2C310E3AD;
	Mon, 15 Jul 2024 13:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F5g220E2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAA610E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:10:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A31060F57;
 Mon, 15 Jul 2024 13:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37555C32782;
 Mon, 15 Jul 2024 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721049037;
 bh=oZ7yq0qh7vuJ0B7mSghU33Yp+qarQERf6HfWn5bKrl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5g220E2tY/zMdt2XZGDCjRSpBFRfMuqu/8qXp/uJMyGhkhURLOwn3MaYaqS+hstK
 ToPZBiUQrwGyPrSEpGy0Jb+4N9u/KUdLRfUYKizJPxsUScXsgivodER7liFIMnojiY
 jEjK5qZCpssP9aOboi4666Cs/nmdVSSygwGuRRowAxv7wSg2KG1O+GnzSjNHKouZWL
 lDo5KFa270CCyxXcGYLTsh7+u1KuYXp8npW4cQhY3iQ0YflM/CVWiAxh/IeZMpvMi9
 0wzcEFlDYbYzkynKdSLAmStD1MzjZceJsR/kXNApHtk4Ow01JXj8fmvTVaik1C2KX3
 vsOMNPrNDfsnQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1sTLTP-000000001Hm-1sax;
 Mon, 15 Jul 2024 15:10:35 +0200
Date: Mon, 15 Jul 2024 15:10:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
Message-ID: <ZpUfy9YiZSRva-g3@hovoldconsulting.com>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
 <ZpUcI3KkIa58zC55@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpUcI3KkIa58zC55@linaro.org>
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

On Mon, Jul 15, 2024 at 02:54:59PM +0200, Stephan Gerhold wrote:
> On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:

> > How will we handle current/old crd DT with new kernels ?
> 
> I think this is answered in the commit message:
> 
> > > We have existing users of this panel through the generic "edp-panel"
> > > compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
> > > partially in that configuration: It works after boot but once the screen
> > > gets disabled it does not turn on again until after reboot. It behaves the
> > > same way with the default "conservative" timings, so we might as well drop
> > > the configuration from the panel-edp driver. That way, users with old DTBs
> > > will get a warning and can move to the new driver.
> 
> Basically with the entry removed, the panel-edp driver will fallback to
> default "conservative" timings when using old DTBs. There will be a
> warning in dmesg, but otherwise the panel will somewhat work just as
> before. I think this is a good way to remind users to upgrade.
> 
> > Same question for patch 3, thie serie introduces a bindings that won't be valid
> > if we backport patch 3. I don't think patch should be backported, and this patch
> > should be dropped.
> 
> There would be a dtbs_check warning, yeah. Functionally, it would work
> just fine. Is that reason enough to keep display partially broken for
> 6.11? We could also apply the minor binding change for 6.11 if needed.
> 
> I'm also fine if this just goes into 6.12 though.

No, we should definitely fix this for 6.11. This machine is not very
useable without it. Whether to backport is a separate question, but note
that patch 3 is not even marked for backport currently.

Fixing the backlight at the cost of a dtb checker warning should not be
an issue, but backporting would break existing setups unless people have
the new panel driver enabled and this may be a valid concern. On the
other hand, support for this platform is in a bit of flux already and it
looks like most fixes aren't even tagged for stable (presumably for that
reason).

Johan
