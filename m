Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D8419D99
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 19:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA8189826;
	Mon, 27 Sep 2021 17:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503BA897C8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632765228;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=w//vFYEZnxTum3oiC96KTe2k9/YaQVGD+Not1CPpUgQ=;
 b=L0SdEDxbo5agL6Fy09vB6MOldp4Mjs98+LPBizamqg8+6JNKqLxygF+0RB7Q5LO2Ei
 3wapHPd0mvxB50ntV+iRGEXkX1o1Z3dDqORxyc/mQBKRivl79uPR9OJl+Q3rivL9Q361
 YY+QgnINPL2a6yd/wfDgAbriDcNUgi/PXEmYhAWyLVpSDvoJ1WjMYZxy/wVHRUNcaRbw
 gZtOTDzIYnRlZue/Z5USLxxUArSuAjZ0snqmAf22qvNDuDWVeDKqcAjDzoWswUAQwjtk
 VJMwr4PO7BZTx4dk54cslg9L8Fd7QSvjdnDTw+ds5JWBmrWNqEw37K1Zt7jVYbBSToAr
 1I1Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8QW3w=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8RHrjb3c
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 27 Sep 2021 19:53:45 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 05/10] drm/bridge: synopsis: Fix to properly handle HPD
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210927170034.mhv5r2r5gcojc7yn@gilmour>
Date: Mon, 27 Sep 2021 19:53:45 +0200
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBF48545-3509-42AA-AED5-A89BB5B1D9CD@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <dd2356790b774c7885afecc9d29783cb51a26e6d.1632761068.git.hns@goldelico.com>
 <20210927170034.mhv5r2r5gcojc7yn@gilmour>
To: Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3445.104.21)
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



> Am 27.09.2021 um 19:00 schrieb Maxime Ripard <maxime@cerno.tech>:
>=20
> Hi,
>=20
> On Mon, Sep 27, 2021 at 06:44:23PM +0200, H. Nikolaus Schaller wrote:
>> It appears that dw-hdmi plugin detection is not properly
>> propagated unless we call drm_kms_helper_hotplug_event().
>>=20
>> Maybe drm_bridge_hpd_notify should have been setup to
>> call this.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index f082e14320e1..edea04f80576 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -3018,6 +3018,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void =
*dev_id)
>> 		if (hdmi->bridge.dev) {
>> 			drm_helper_hpd_irq_event(hdmi->bridge.dev);
>> 			drm_bridge_hpd_notify(&hdmi->bridge, status);
>> +
>> +			drm_kms_helper_hotplug_event(hdmi->bridge.dev);
>=20
> drm_kms_helper_hotplug_event is already called from =
drm_helper_hpd_irq_event

Ah, now I see. It should be called but is not for some unkown
condition (poll disabled? changed =3D false?).

It may also be a leftover from the attempt to make it work with
the builtin dw-hdmi connector.

Will check for v5.

BR and thanks,
Nikolaus

