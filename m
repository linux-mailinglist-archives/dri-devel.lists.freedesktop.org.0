Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E239E37BB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E6610E1BC;
	Wed,  4 Dec 2024 10:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0792910E1BC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:40:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: from mail.steuer-voss.de (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id DD917267;
 Wed,  4 Dec 2024 11:40:37 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 04 Dec 2024 11:40:37 +0100
From: Nikolaus Voss <nv@vosn.de>
To: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Liu Ying
 <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Fabio
 Estevam <festevam@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 miquel.raynal@bootlin.com, nikolaus.voss@haag-streit.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
In-Reply-To: <2d7f8afc-119a-4080-93be-bf3daf017e5e@denx.de>
References: <20241203191111.47B56F7@mail.steuer-voss.de>
 <2d7f8afc-119a-4080-93be-bf3daf017e5e@denx.de>
User-Agent: Roundcube Webmail/1.5.0
Message-ID: <abcc89936f44fd884b9c5da65ea64c42@vosn.de>
X-Sender: nv@vosn.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Marek,

On 03.12.2024 21:15, Marek Vasut wrote:
> On 12/3/24 8:09 PM, Nikolaus Voss wrote:
>> LDB clock has to be a fixed multiple of the pixel clock.
>> As LDB and pixel clock are derived from different clock sources
> 
> Can you please share the content of /sys/kernel/debug/clk/clk_summary ?

Sure. Without my patch:

     video_pll1_ref_sel               1       1        0        24000000  
   0          0     50000      Y      deviceless                      
no_connection_id
        video_pll1                    1       1        0        
1039500000  0          0     50000      Y         deviceless             
          no_connection_id
           video_pll1_bypass          1       1        0        
1039500000  0          0     50000      Y            deviceless          
             no_connection_id
              video_pll1_out          2       2        0        
1039500000  0          0     50000      Y               deviceless       
                no_connection_id
                 media_ldb            1       1        0        346500000 
   0          0     50000      Y                  
32ec0000.blk-ctrl:bridge@5c     ldb
                                                                          
                                                  deviceless              
         no_connection_id
                    media_ldb_root_clk 0       0        0        
346500000   0          0     50000      Y                     deviceless 
                      no_connection_id
                 media_disp2_pix      1       1        0        51975000  
   0          0     50000      Y                  deviceless              
         no_connection_id
                    media_disp2_pix_root_clk 1       1        0        
51975000    0          0     50000      Y                     
32e90000.display-controller     pix

Here 346500000 (media_ldb) != 7 * 51975000 (media_disp2_pix)
   -> distorted panel image (if any).
The requested panel pixel clock from EDID is 51200000.

This is the same with my patch:

     video_pll1_ref_sel               1       1        0        24000000  
   0          0     50000      Y      deviceless                      
no_connection_id
        video_pll1                    1       1        0        
1039500000  0          0     50000      Y         deviceless             
          no_connection_id
           video_pll1_bypass          1       1        0        
1039500000  0          0     50000      Y            deviceless          
             no_connection_id
              video_pll1_out          2       2        0        
1039500000  0          0     50000      Y               deviceless       
                no_connection_id
                 media_ldb            1       1        0        346500000 
   0          0     50000      Y                  
32ec0000.blk-ctrl:bridge@5c     ldb
                                                                          
                                                  deviceless              
         no_connection_id
                    media_ldb_root_clk 0       0        0        
346500000   0          0     50000      Y                     deviceless 
                      no_connection_id
                 media_disp2_pix      1       1        0        49500000  
   0          0     50000      Y                  deviceless              
         no_connection_id
                    media_disp2_pix_root_clk 1       1        0        
49500000    0          0     50000      Y                     
32e90000.display-controller     pix

So, here 346500000 (media_ldb) = 7 * 49500000 (media_disp2_pix).
   -> stable panel image, but pixel clock reduced to 49.5 MHz from 
requested 51.2 MHz.

My conclusion: The clock source is the same, nevertheless the
ldb/pixel clock constraint cannot be satisfied without either
modifying the pll clock or the pixel clock.

-- 
Nikolaus Voss
