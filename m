Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1427251D3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 03:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EA610E07E;
	Wed,  7 Jun 2023 01:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E6210E07E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 01:54:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05129615F9;
 Wed,  7 Jun 2023 01:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B06EC433EF;
 Wed,  7 Jun 2023 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686102895;
 bh=L5++KAY1MZjlyXEgE62/aSSXjGPmyMxfne3vd2s3Qh0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mCWRdAv9G9mqhBqQL78XetAXwO85iy64XPDCYeMLzla2fz2hjB5WC6W++watZjd0s
 oaLdHFMuRkCtMN8Kuhq8OwNylmDR1p439v2jHKPaCmwerg/RNg/h8GmPHlonUjSRE9
 sgAfLkEhP/2C5uFWAg0e1Kfd+sihCI6EXlz8mp2x9xvkFRcIccQXLQYybbo+wuLxcs
 XHkx7gPJn+QqcQMpgdLj9yYAODmRwZknUfyZCN6DdQRAtgUWY4mUmX+jbi/1F9fS6O
 IdrfgStPm1AbFEOvapklC8HpviuJTVRt9pHfufo6OxwEEKqklpPuLBpKQpCTEKaW6m
 McbRq3mezKn1g==
Date: Tue, 6 Jun 2023 18:54:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v6 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230606185453.582d3831@kernel.org>
In-Reply-To: <8601be87-4bcb-8e6b-5124-1c63150c7c40@broadcom.com>
References: <1685657551-38291-1-git-send-email-justin.chen@broadcom.com>
 <1685657551-38291-4-git-send-email-justin.chen@broadcom.com>
 <20230602235859.79042ff0@kernel.org>
 <956dc20f-386c-f4fe-b827-1a749ee8af02@broadcom.com>
 <20230606171605.3c20ae79@kernel.org>
 <8601be87-4bcb-8e6b-5124-1c63150c7c40@broadcom.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Jun 2023 18:35:51 -0700 Justin Chen wrote:
> > Also - can you describe how you can have multiple netdevs for
> > the same MAC?  
> 
> Not netdevs per se, but packets can be redirected to an offload 
> co-processor.

How is the redirecting configured?

Could you split this patch into basic netdev datapath,
and then as separate patches support for ethtool configuration features,
each with its own patch? This will make it easier for area experts to
review.

The base patch can probably include these:

+	.get_drvinfo		= bcmasp_get_drvinfo,
+	.get_link		= ethtool_op_get_link,
+	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
+	.get_msglevel		= bcmasp_get_msglevel,
+	.set_msglevel		= bcmasp_set_msglevel,

WoL can be a separate patch:

+	.get_wol		= bcmasp_get_wol,
+	.set_wol		= bcmasp_set_wol,

Stats a separate patch:

+	.get_strings		= bcmasp_get_strings,
+	.get_ethtool_stats	= bcmasp_get_ethtool_stats,
+	.get_sset_count		= bcmasp_get_sset_count,
+	.nway_reset		= phy_ethtool_nway_reset,

Flow steering separate:

+	.get_rxnfc		= bcmasp_get_rxnfc,
+	.set_rxnfc		= bcmasp_set_rxnfc,

EEE separate:

+	.set_eee		= bcmasp_set_eee,
+	.get_eee		= bcmasp_get_eee,
