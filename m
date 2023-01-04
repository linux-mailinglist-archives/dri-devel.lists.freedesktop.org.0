Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2965CE00
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 09:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D74110E431;
	Wed,  4 Jan 2023 08:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E7F10E089;
 Wed,  4 Jan 2023 07:29:55 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BFD2108;
 Wed,  4 Jan 2023 08:29:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1672817393;
 bh=82pyUUf7pT/43ndvROF+ofhgFaSVX8TXD5BpYvrTqWQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BzOjKTVtnZiVl2irEaEBv8gP58/0VhKIey2Y5UxsL04+LgLkJz52MpgvtcEJEXusj
 JTpjxJ1MhD2VogxBE/Bh1/8Vd2F9tyDbomBRKNd9/VgorZufwyRGfFZBu9tQIB42Ed
 5ng03o56Tixj8izNubKzvw4OipOFP835K5nYs0U8=
Message-ID: <baa8df6b-ecd4-6df8-9fb5-6a3a39e1a04f@ideasonboard.com>
Date: Wed, 4 Jan 2023 09:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <362452c5-8858-9ac5-e0ca-8ff993e966b7@linaro.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <362452c5-8858-9ac5-e0ca-8ff993e966b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Jan 2023 08:05:38 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/12/2022 23:58, Dmitry Baryshkov wrote:
> On 02/11/2022 20:06, Dmitry Baryshkov wrote:
>>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
>> DRM driver do a proper work of calling
>> drm_bridge_connector_en/disable_hpd() in right places. Rather than
>> teaching each and every driver how to properly handle
>> drm_bridge_connector's HPD, make that automatic.
>>
>> Add two additional drm_connector helper funcs: enable_hpd() and
>> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
>> is the time where the drm_bridge_connector's functions are called by the
>> drivers too).
> 
> Since we are at the beginning of the development window, gracious ping 
> for this patchset.
> 
> It would be nice to finally handle the bridge_connector's hpd properly. 
> Calling drm_bridge_connector_enable_hpd() from 
> drm_bridge_connector_init() is not a proper way to do this. It results 
> in calling bridge->funcs->hpd_enable() before the rest of the pipeline 
> was set up properly.

For the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

I've been using this series in my local branch for quite a while to fix 
the HPD issues. Works for me.

I still think the "fix" aspect should be highlighted more here, as the 
current upstream triggers a WARN for "Hot plug detection already 
enabled" (at least) on OMAP.

  Tomi

