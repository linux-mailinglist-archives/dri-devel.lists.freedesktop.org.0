Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675712C9E7B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1146E4F8;
	Tue,  1 Dec 2020 09:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E8D6E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:59:37 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D17CC2001E;
 Tue,  1 Dec 2020 10:59:31 +0100 (CET)
Date: Tue, 1 Dec 2020 10:59:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v5] drm/bridge: add it6505 driver
Message-ID: <20201201095930.GA1981628@ravnborg.org>
References: <20201201054454.51240-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201054454.51240-1-allen.chen@ite.com.tw>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Ns9eNvu6AAAA:8 a=mpaa-ttXAAAA:8 a=cm27Pg_UAAAA:8
 a=1XWaLZrsAAAA:8 a=qw3Jv0Z29LwRxbBwalcA:9 a=CjuIK1q_8ugA:10
 a=LZLx1i01EnjtqRv10NxV:22 a=6heAxKwa5pAsJatQ0mat:22
 a=xmb-EsYY8bH0VWELuYED:22
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Jitao Shi <jitao.shi@mediatek.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Yilun Lin <yllin@google.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Hermes Wu <hermes.wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen.
On Tue, Dec 01, 2020 at 01:44:41PM +0800, allen wrote:
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
> 
> From: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Yilun Lin <yllin@google.com>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>

I recall I provided the same comment as last time, but may remember
wrong.

New bridge drivers shall support that connector creation is optional.
This driver does not do that - see following code snippet:

+       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+               DRM_ERROR("Fix bridge driver to make connector optional!");
+               return -EINVAL;
+       }
+

I did not check, but likely the drive needs to implment some of the
connector hooks too. (detect, get_edid, etc).

Please include a changelog too - it can be very hard to remember what
feedback was provided when one reviews several patches/week.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
