Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E116712AF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678FB10E679;
	Wed, 18 Jan 2023 04:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B37210E679;
 Wed, 18 Jan 2023 04:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1674016989; bh=si1LsRYnbEJsNMookhYnlZtc6eqAfpPgIkpncaYVBPo=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=INVDR/jq8kDGCekHgQI9trIdkP/WwA6x7r95+2aa49N/yaM5S6+h7tKC7xKvrMber
 Gym78egL31n8howVNiX2WvyNec+UdSlS26tTiOlASjNf3Otpo6xfP9cQrTDA6K0B/A
 vd9rzgJCxdZWK2Xt/XwQLxgbhHb4GZLdEOB3E5Lc=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 18 Jan 2023 05:43:09 +0100 (CET)
X-EA-Auth: vFD8zTbbIV/hmECFPYW4hYBUM21z7EpkSmJ2JPC7btWz3QNrs6+nbhTaK/tF+n8skb73Z9EQxzwZqbnedu6lxNsj+Yc/c1b4
Date: Wed, 18 Jan 2023 10:13:04 +0530
From: Deepak R Varma <drv@mailo.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/display: Convert i9xx_pipe_crc_auto_source to
 void
Message-ID: <Y8d42OYWpW03zdAi@ubun2204.myguest.virtualbox.org>
References: <Y8K2SS/zNiPAmLsS@ubun2204.myguest.virtualbox.org>
 <Y8b1V7TwesqmB4Hv@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8b1V7TwesqmB4Hv@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 02:21:59PM -0500, Rodrigo Vivi wrote:
> On Sat, Jan 14, 2023 at 07:33:53PM +0530, Deepak R Varma wrote:
> > Convert function i9xx_pipe_crc_auto_source() to return void instead
> > of int since the current implementation always returns 0 to the caller.
> > Issue identified using returnvar Coccinelle semantic patch.
> 
> could you please share the coccinelle commands and files you used here?

Hello Rodrigo,
I used following command to identify this change opportunity:

make coccicheck COCCI=scripts/coccinelle/misc/returnvar.cocci M=drivers/gpu/drm/

Let me know if you would like me to include the same in the commit message.

> 
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> > Please note: The change is compile tested only.
> 
> np, our CI liked it.
> 
> I liked the clean up as well:
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you for your review and the feedback.

Regards,
./drv

> 
> > 
> > 
> >  drivers/gpu/drm/i915/display/intel_pipe_crc.c | 23 ++++++-------------
> >  1 file changed, 7 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> > index e9774670e3f6..8d3ea8d7b737 100644
> > --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> > @@ -72,14 +72,13 @@ static int i8xx_pipe_crc_ctl_reg(enum intel_pipe_crc_source *source,
> >  	return 0;
> >  }
> >  
> > -static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> > -				     enum pipe pipe,
> > -				     enum intel_pipe_crc_source *source)
> > +static void i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> > +				      enum pipe pipe,
> > +				      enum intel_pipe_crc_source *source)
> >  {
> >  	struct intel_encoder *encoder;
> >  	struct intel_crtc *crtc;
> >  	struct intel_digital_port *dig_port;
> > -	int ret = 0;
> >  
> >  	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
> >  
> > @@ -121,8 +120,6 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> >  		}
> >  	}
> >  	drm_modeset_unlock_all(&dev_priv->drm);
> > -
> > -	return ret;
> >  }
> >  
> >  static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
> > @@ -132,11 +129,8 @@ static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
> >  {
> >  	bool need_stable_symbols = false;
> >  
> > -	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
> > -		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
> > +		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> >  
> >  	switch (*source) {
> >  	case INTEL_PIPE_CRC_SOURCE_PIPE:
> > @@ -200,11 +194,8 @@ static int i9xx_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
> >  				 enum intel_pipe_crc_source *source,
> >  				 u32 *val)
> >  {
> > -	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
> > -		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
> > +		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> >  
> >  	switch (*source) {
> >  	case INTEL_PIPE_CRC_SOURCE_PIPE:
> > -- 
> > 2.34.1
> > 
> > 
> > 


