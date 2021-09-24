Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A0417974
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 19:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F2A6E1F7;
	Fri, 24 Sep 2021 17:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270DE6E1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 17:10:24 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 47eb2b84-1d5a-11ec-a02a-0050568c148b;
 Fri, 24 Sep 2021 17:10:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0BE1E194C15;
 Fri, 24 Sep 2021 19:10:14 +0200 (CEST)
Date: Fri, 24 Sep 2021 19:10:19 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 smyakam@microsoft.com, jani.nikula@linux.intel.com,
 linus.walleij@linaro.org, stanislav.lisovskiy@intel.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: Fix EDID quirk compile error on older compilers
Message-ID: <YU4Ge0vpwaibXEY2@ravnborg.org>
References: <20210924075317.1.I1e58d74d501613f1fe7585958f451160d11b8a98@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924075317.1.I1e58d74d501613f1fe7585958f451160d11b8a98@changeid>
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

On Fri, Sep 24, 2021 at 07:53:21AM -0700, Douglas Anderson wrote:
> Apparently some compilers [1] cannot handle doing math on dereferenced
> string constants at compile time. This has led to reports [2] of
> compile errors like:
> 
>   In file included from drivers/gpu/drm/drm_edid.c:42:0:
>   ./include/drm/drm_edid.h:525:2: error: initializer element is not constant
>     ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
> 
> Go back to the syntax I used in v4 of the patch series [3] that added
> this code instead of what landed (v5). This syntax is slightly uglier
> but should be much more compatible with varied compilers.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18
> [2] https://lore.kernel.org/r/874kaabdt5.fsf@intel.com/
> [3] https://lore.kernel.org/r/20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid/
> 
> Fixes: d9f91a10c3e8 ("drm/edid: Allow querying/working with the panel ID from the EDID")
> Reported-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Reported-by: Srikanth Myakam <smyakam@microsoft.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Not so nice, but apparently needed.
Acked-by: Sam Ravnborg <sam@ravnborg.org>
