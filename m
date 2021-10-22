Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4C437615
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 13:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED09F6ED72;
	Fri, 22 Oct 2021 11:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C0A6ED42;
 Fri, 22 Oct 2021 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634898358; bh=qXTIz9NUZOX9AJLI0EfpCFCuPKutlkzQauklWJ1ZdII=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=CDMwG+cYraiCkOvqWNoXRIOQdd1SKnLC6HrdHC95WxmidMkx+VnAsy2hnJqIKzTzu
 FEtdjZUf6XU2V9+66nVczdfj8AX/zERhEb1ooKV1f1ToGqd9ubuQgXMALLiCPlSACK
 XGc2B/eNeFQHv6UGVfpbYVPnwzAUmBX65vye7TSQ=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 22 Oct 2021 12:25:37 +0200 (CEST)
X-EA-Auth: ZUkw32usS9GpQ95qw4isUA4Qn5D5k42ZU4ER4OtDUnr2ExZFz+AjbHpLkWo4vIllva24n6AgDPqBGMsl893/BqHzRs7jwkE6
Date: Fri, 22 Oct 2021 12:25:33 +0200
From: Claudio Suarez <cssk@net-c.es>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 13/13] drm/i915: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YXKRnUHWuboQKBF1@zorro.micasa>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es> <YW8QYsmkm3ZrBAx3@intel.com>
 <YW9L6d7e+RO29VJu@gineta.localdomain> <YXFwB7rN4bvR0Z+m@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXFwB7rN4bvR0Z+m@intel.com>
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

On Thu, Oct 21, 2021 at 04:49:59PM +0300, Ville Syrjälä wrote:
> On Wed, Oct 20, 2021 at 12:51:21AM +0200, Claudio Suarez wrote:
> > drm_get_edid() internally calls to drm_connector_update_edid_property()
> > and then drm_add_display_info(), which parses the EDID.
> > This happens in the function intel_hdmi_set_edid() and
> > intel_sdvo_tmds_sink_detect() (via intel_sdvo_get_edid()).
> > 
> > Once EDID is parsed, the monitor HDMI support information is available
> > through drm_display_info.is_hdmi. Retriving the same information with
> > drm_detect_hdmi_monitor() is less efficient. Change to
> > drm_display_info.is_hdmi
> 
> I meant we need to examine all call chains that can lead to
> .detect() to make sure all of them do in fact update the
> display_info beforehand.

Well, I studied it carefully and, yes, all call chains that can lead to
drm_display_info.is_hdmi / drm_detect_hdmi_monitor() update display_info
beforehand. In the case that this doesn't happen, the code is unchanged.

Do you want I explain the changes in the code here again ? Or do you want
to me change the commit message to be more clear ? In the first case, I can
write here a detailed explanation. In the second case I can make a longer commit
message.

Or both?

Best Regards,
Claudio Suarez.


