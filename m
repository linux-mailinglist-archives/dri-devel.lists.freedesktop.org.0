Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87A51798C
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 23:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF48210E7BB;
	Mon,  2 May 2022 21:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01D410E7BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 21:56:19 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 607113F549;
 Mon,  2 May 2022 23:56:17 +0200 (CEST)
Date: Mon, 2 May 2022 23:56:16 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Message-ID: <20220502215616.jwpi3dr6ryembsfr@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
 <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
 <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
 <20220502083442.t365cfmivlga557g@SoMainline.org>
 <f8986d6d-2c2b-a0a0-d63c-d4670f6864ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8986d6d-2c2b-a0a0-d63c-d4670f6864ff@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-02 13:02:09, Dmitry Baryshkov wrote:
> [snip]
> > How would you represent this in XML?  I was hoping for a method that
> > allows to construct the value in a generic way, without register names,
> > and then simply have a "register macro" that moves (and perhaps masks)
> > the preconstructed value into the right place.  A bit like how `enum`s
> > are currently set up in XML, but with bit ranges for the values and
> > macros to set a value.
> > 
> > I think I've _partially_ found what I was looking for: a `<bitset>`.
> > However, I don't know if we can utilize this multiple times within a
> > single `reg32`, once with an offset for stream1.  Alas, it's just
> > bikeshedding at this point.
> 
> Unfortunately the following naïve patch doesn't work, stream1 bits are 
> still defined in the 0:15 bit space. One would have to modify rnn tool 
> to make sure that it takes into account the low/high parts of the 
> bitfield when generating offsets/masks.
> 
> diff --git a/src/freedreno/registers/dsi/dsi.xml 
> b/src/freedreno/registers/dsi/dsi.xml
> index f2eef4ff41ae..b0166628ad0a 100644
> --- a/src/freedreno/registers/dsi/dsi.xml
> +++ b/src/freedreno/registers/dsi/dsi.xml
> @@ -361,22 +361,19 @@ 
> xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
>                  <bitfield name="MAJOR" low="24" high="31" type="uint"/>
>          </reg32>
>          <reg32 offset="0x002d4" name="CPHY_MODE_CTRL"/>
> -       <reg32 offset="0x0029c" name="VIDEO_COMPRESSION_MODE_CTRL">
> -               <bitfield name="WC" low="16" high="31" type="uint"/>
> +       <bitset name="COMPRESSION_MODE_CTRL" inline="true">
>                  <bitfield name="DATATYPE" low="8" high="13" type="uint"/>
>                  <bitfield name="PKT_PER_LINE" low="6" high="7" 
> type="uint"/>
>                  <bitfield name="EOL_BYTE_NUM" low="4" high="5" 
> type="uint"/>
>                  <bitfield name="EN" pos="0" type="boolean"/>
> +       </bitset>
> +       <reg32 offset="0x0029c" name="VIDEO_COMPRESSION_MODE_CTRL">
> +               <bitfield name="WC" low="16" high="31" type="uint"/>
> +               <bitfield name="STREAM0" low="0" high="15" 
> type="COMPRESSION_MODE_CTRL"/>
>          </reg32>
>          <reg32 offset="0x002a4" name="COMMAND_COMPRESSION_MODE_CTRL">
> -               <bitfield name="STREAM1_DATATYPE" low="24" high="29" 
> type="uint"/>
> -               <bitfield name="STREAM1_PKT_PER_LINE" low="22" high="23" 
> type="uint"/>
> -               <bitfield name="STREAM1_EOL_BYTE_NUM" low="20" high="21" 
> type="uint"/>
> -               <bitfield name="STREAM1_EN" pos="16" type="boolean"/>
> -               <bitfield name="STREAM0_DATATYPE" low="8" high="13" 
> type="uint"/>
> -               <bitfield name="STREAM0_PKT_PER_LINE" low="6" high="7" 
> type="uint"/>
> -               <bitfield name="STREAM0_EOL_BYTE_NUM" low="4" high="5" 
> type="uint"/>
> -               <bitfield name="STREAM0_EN" pos="0" type="boolean"/>
> +               <bitfield name="STREAM1" low="16" high="31" 
> type="COMPRESSION_MODE_CTRL"/>
> +               <bitfield name="STREAM0" low="0" high="15" 
> type="COMPRESSION_MODE_CTRL"/>
>          </reg32>
>          <reg32 offset="0x002a8" name="COMMAND_COMPRESSION_MODE_CTRL2">
>                  <bitfield name="STREAM1_SLICE_WIDTH" low="16" high="31" 
> type="uint"/>

This is approximately what I was aiming for.  `inline="true"` does
"inline" all the individual bitfields so that they're prefixed with the
reg32+bitfield name again, right?  That's what I wanted to avoid :)

- Marijn
