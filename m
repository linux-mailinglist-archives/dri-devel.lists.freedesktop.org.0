Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B688A6AC0F9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 14:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1673210E22F;
	Mon,  6 Mar 2023 13:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BDA10E22F;
 Mon,  6 Mar 2023 13:31:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 09E5BB80E1A;
 Mon,  6 Mar 2023 13:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3B0C433EF;
 Mon,  6 Mar 2023 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678109464;
 bh=PDxyfh9GHMbzLUrz8oTviZIgmt7uMmsCk/rf8ALQYc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=upOM5hJF7UWkvjo7vYwexQOjCdV0rEZ2b+EF6JqmhjVnmQs1N0Oswfxb9fRsWczZd
 yTRhNbbO9d56vIpIEtSvTS2KyJLqZMnwF8bL2uBal36UoebQK5i4ywwSXCE9U2NcbX
 hNIExKqj9a4N5MdFIKWW+QTrzUywgyLpV4vfS3AKggppPsB2azyZ24FemR15ANH9Su
 +EeIzLQWFb9NtmVs2idMOvVfMvGnl4gw1DVQsvnFczPzC2xKzf7yFauzNNns/wo+Az
 bS6e8dgDY5hk6pB+BJoWMh5aW2WEeC6CZ7D0VLoAZwCATO1WZBK9VqP6A4GsBdwtRo
 6QYUpPRA02nZg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pZAwK-00031b-Jh; Mon, 06 Mar 2023 14:31:45 +0100
Date: Mon, 6 Mar 2023 14:31:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 09/10] drm/msm: use drmm_mode_config_init()
Message-ID: <ZAXrQF5l+Uu0iJ3M@hovoldconsulting.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-10-johan+linaro@kernel.org>
 <26986caf-1245-88f2-60d0-5930c86ea31b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26986caf-1245-88f2-60d0-5930c86ea31b@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 02:38:37PM +0200, Dmitry Baryshkov wrote:
> On 06/03/2023 12:07, Johan Hovold wrote:
> > Switch to using drmm_mode_config_init() so that the mode config is
> > released when the last reference to the DRM device is dropped rather
> > than unconditionally at unbind() (which may be too soon).
> 
> This also means that drm_bridge_detach() might be called at some point 
> after unbind(), which might be too late.

Indeed.

Please disregard this patch. It's not needed to fix the bind error paths
anyway.

Johan
