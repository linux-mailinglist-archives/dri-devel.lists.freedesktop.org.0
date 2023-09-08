Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC623799303
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 02:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C089F10E01F;
	Sat,  9 Sep 2023 00:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7633 seconds by postgrey-1.36 at gabe;
 Fri, 08 Sep 2023 13:49:27 UTC
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
 [67.231.157.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C8F10E8B4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 13:49:27 +0000 (UTC)
Received: from pps.filterd (m0048206.ppops.net [127.0.0.1])
 by m0048206.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 3883tXHK039622
 for <dri-devel@lists.freedesktop.org>; Fri, 8 Sep 2023 07:42:13 -0400
Date: Fri, 8 Sep 2023 12:13:50 +0300
From: Ian Ray <ian.ray@ge.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: EXT: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 switch to drm_do_get_edid()
Message-ID: <20230908091350.GA37562@zoo6.em.health.ge.com>
References: <20230901102400.552254-1-jani.nikula@intel.com>
 <87jztahrot.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jztahrot.fsf@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: nObYOXtHDaLRYUddnQGdT5DmbAfFBPV_
X-Proofpoint-ORIG-GUID: nObYOXtHDaLRYUddnQGdT5DmbAfFBPV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080108
X-Mailman-Approved-At: Sat, 09 Sep 2023 00:13:12 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zheyu Ma <zheyuma97@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@gmail.com>, Yuan Can <yuancan@huawei.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 05:52:02PM +0300, Jani Nikula wrote:
> 
> On Fri, 01 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > The driver was originally added in commit fcfa0ddc18ed ("drm/bridge:
> > Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)"). I tried to
> > look up the discussion, but didn't find anyone questioning the EDID
> > reading part.
> >
> > Why does it not use drm_get_edid() or drm_do_get_edid()?
> >
> > I don't know where client->addr comes from, so I guess it could be
> > different from DDC_ADDR, rendering drm_get_edid() unusable.
> >
> > There's also the comment:
> >
> > 	/* Yes, read the entire buffer, and do not skip the first
> > 	 * EDID_LENGTH bytes.
> > 	 */
> >
> > But again, there's not a word on *why*.
> >
> > Maybe we could just use drm_do_get_edid()? I'd like drivers to migrate
> > away from their own EDID parsing and validity checks, including stop
> > using drm_edid_block_valid(). (And long term switch to drm_edid_read(),
> > struct drm_edid, and friends, but this is the first step.)
> >
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Ian Ray <ian.ray@ge.com>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Martin Donnelly <martin.donnelly@ge.com>
> > Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Cc: Yuan Can <yuancan@huawei.com>
> > Cc: Zheyu Ma <zheyuma97@gmail.com>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
> >
> > I haven't even tried to compile this, and I have no way to test
> > this. Apologies for the long Cc list; I'm hoping someone could explain
> > the existing code, and perhaps give this approach a spin.
> > ---
> >  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 57 +++----------------
> >  1 file changed, 9 insertions(+), 48 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > index 460db3c8a08c..0d9eacf3d9b7 100644
> > --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > @@ -65,12 +65,11 @@ struct ge_b850v3_lvds {
> >  
> >  static struct ge_b850v3_lvds *ge_b850v3_lvds_ptr;
> >  
> > -static u8 *stdp2690_get_edid(struct i2c_client *client)
> > +static int stdp2690_read_block(void *context, u8 *buf, unsigned int block, size_t len)
> >  {
> > +	struct i2c_client *client = context;
> >  	struct i2c_adapter *adapter = client->adapter;
> > -	unsigned char start = 0x00;
> > -	unsigned int total_size;
> > -	u8 *block = kmalloc(EDID_LENGTH, GFP_KERNEL);
> > +	unsigned char start = block * EDID_LENGTH;
> >  
> >  	struct i2c_msg msgs[] = {
> >  		{
> > @@ -81,53 +80,15 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
> >  		}, {
> >  			.addr	= client->addr,
> >  			.flags	= I2C_M_RD,
> > -			.len	= EDID_LENGTH,
> > -			.buf	= block,
> > +			.len	= len,
> > +			.buf	= buf,
> >  		}
> >  	};
> >  
> > -	if (!block)
> > -		return NULL;
> > +	if (i2c_transfer(adapter, msgs, 2) != 2)
> > +		return -1;
> >  
> > -	if (i2c_transfer(adapter, msgs, 2) != 2) {
> > -		DRM_ERROR("Unable to read EDID.\n");
> > -		goto err;
> > -	}
> > -
> > -	if (!drm_edid_block_valid(block, 0, false, NULL)) {
> > -		DRM_ERROR("Invalid EDID data\n");
> > -		goto err;
> > -	}
> > -
> > -	total_size = (block[EDID_EXT_BLOCK_CNT] + 1) * EDID_LENGTH;
> > -	if (total_size > EDID_LENGTH) {
> > -		kfree(block);
> > -		block = kmalloc(total_size, GFP_KERNEL);
> > -		if (!block)
> > -			return NULL;
> > -
> > -		/* Yes, read the entire buffer, and do not skip the first
> > -		 * EDID_LENGTH bytes.
> > -		 */
> > -		start = 0x00;
> > -		msgs[1].len = total_size;
> > -		msgs[1].buf = block;
> > -
> > -		if (i2c_transfer(adapter, msgs, 2) != 2) {
> > -			DRM_ERROR("Unable to read EDID extension blocks.\n");
> > -			goto err;
> > -		}
> > -		if (!drm_edid_block_valid(block, 1, false, NULL)) {
> > -			DRM_ERROR("Invalid EDID data\n");
> > -			goto err;
> > -		}
> > -	}
> > -
> > -	return block;
> > -
> > -err:
> > -	kfree(block);
> > -	return NULL;
> > +	return 0;
> >  }
> >  
> >  static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
> > @@ -137,7 +98,7 @@ static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
> >  
> >  	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
> >  
> > -	return (struct edid *)stdp2690_get_edid(client);
> > +	return drm_do_get_edid(connector, stdp2690_read_block, client, NULL);
> 
> The last NULL param should be dropped, as noted by the build bot.

Tested with various displays, including displays that have one block of
EDID (DELL P2417H) and a second EDID extension block (VES/55UHD_LCD_TV).

Tested-by: Ian Ray <ian.ray@ge.com>

Would you like me to submit the patch Jani?


> 
> BR,
> Jani.
> 
> 
> >  }
> >  
> >  static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
> 
