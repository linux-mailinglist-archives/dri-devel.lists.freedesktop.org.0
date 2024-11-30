Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C69DF56B
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 12:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA51110E038;
	Sun,  1 Dec 2024 11:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2208610E3F4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 18:57:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
 id 89B9418709; Sat, 30 Nov 2024 19:57:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id 86CC23C30;
 Sat, 30 Nov 2024 19:57:17 +0100 (CET)
Date: Sat, 30 Nov 2024 19:57:17 +0100 (CET)
From: Nikolaus Voss <nv@vosn.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, nikolaus.voss@haag-streit.com
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
In-Reply-To: <lio6natmz5d5hdmdxwuj5ghfbpl4medb2orhw2m27m6g3rvaga@tanmydgbufg2>
Message-ID: <c05e762f-a9c3-4655-7b21-8490d91fd858@vosn.de>
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <lio6natmz5d5hdmdxwuj5ghfbpl4medb2orhw2m27m6g3rvaga@tanmydgbufg2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Mailman-Approved-At: Sun, 01 Dec 2024 11:50:01 +0000
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

Hi Dmitry,

On Sat, 30 Nov 2024, Dmitry Baryshkov wrote:
> On Tue, Nov 26, 2024 at 04:45:54PM +0100, Nikolaus Voss wrote:
>> LDB clock has to be a fixed multiple of the pixel clock.
>> As LDB and pixel clock are derived from different clock sources
>> (at least on imx8mp), this constraint cannot be satisfied for
>> any pixel clock, which leads to flickering and incomplete
>> lines on the attached display.
>>
>> To overcome this, check this condition in mode_fixup() and
>> adapt the pixel clock accordingly.
>>
>> Cc: <stable@vger.kernel.org>
>>
>> Signed-off-by: Nikolaus Voss <nv@vosn.de>
>> ---
>>  drivers/gpu/drm/bridge/fsl-ldb.c | 40 ++++++++++++++++++++++++++++----
>>  1 file changed, 36 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>> index 0e4bac7dd04ff..e341341b8c600 100644
>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -104,12 +104,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
>>  	return container_of(bridge, struct fsl_ldb, bridge);
>>  }
>>
>> +static unsigned int fsl_ldb_link_freq_factor(const struct fsl_ldb *fsl_ldb)
>> +{
>> +	return fsl_ldb_is_dual(fsl_ldb) ? 3500 : 7000;
>> +}
>> +
>>  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
>>  {
>> -	if (fsl_ldb_is_dual(fsl_ldb))
>> -		return clock * 3500;
>> -	else
>> -		return clock * 7000;
>> +	return clock * fsl_ldb_link_freq_factor(fsl_ldb);
>>  }
>>
>>  static int fsl_ldb_attach(struct drm_bridge *bridge,
>> @@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>>  				 bridge, flags);
>>  }
>>
>> +static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
>> +				const struct drm_display_mode *mode,
>> +				struct drm_display_mode *adjusted_mode)
>
> The driver uses atomic callbacks. Please use .atomic_check() instead.

So it is okay to modify drm_crtc_state->adjusted_mode in .atomic_check()? 
I chose .mode_fixup() because the function name and args make it more 
obvious what is done there. Btw, the API reference doesn't say this call 
is deprecated.

A second thought:
Maybe it would be a good idea to reject modes which result in an adjusted 
mode pclk that is not within certain boundaries, even if this patch 
doesn't do it yet. As I see it, that would be only possible in 
mode_fixup().

>
>> +{
>> +	const struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>> +	unsigned long requested_link_freq =
>> +		mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);
>> +	unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_link_freq);
>> +
>> +	if (freq != requested_link_freq) {
>> +		/*
>> +		 * this will lead to flicker and incomplete lines on
>> +		 * the attached display, adjust the CRTC clock
>> +		 * accordingly.
>> +		 */
>> +		int pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb);
>> +
>> +		if (adjusted_mode->clock != pclk) {
>> +			dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d kHz -> %d kHz)!\n",
>> +				 adjusted_mode->clock, pclk);
>> +
>> +			adjusted_mode->clock = pclk;
>> +			adjusted_mode->crtc_clock = pclk;
>> +		}
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>>  				  struct drm_bridge_state *old_bridge_state)
>>  {
>> @@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>
>>  static const struct drm_bridge_funcs funcs = {
>>  	.attach = fsl_ldb_attach,
>> +	.mode_fixup = fsl_ldb_mode_fixup,
>>  	.atomic_enable = fsl_ldb_atomic_enable,
>>  	.atomic_disable = fsl_ldb_atomic_disable,
>>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>> --
>> 2.43.0
>>
>
>

-- 
Nikolaus Voss

