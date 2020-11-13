Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D7A2B1E0F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 16:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7B06E4DD;
	Fri, 13 Nov 2020 15:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FE56E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:04:36 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kdacs-0003QC-Qr; Fri, 13 Nov 2020 15:04:34 +0000
Subject: Re: [PATCH][next] drm/kmb: fix array out-of-bounds writes to
 kmb->plane_status[]
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201113120121.33212-1-colin.king@canonical.com>
 <20201113145557.GB3647624@ravnborg.org>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <8dd5b960-d6c4-73cc-703e-349dc66f2937@canonical.com>
Date: Fri, 13 Nov 2020 15:04:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201113145557.GB3647624@ravnborg.org>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/11/2020 14:55, Sam Ravnborg wrote:
> Hi Colin.
> 
> On Fri, Nov 13, 2020 at 12:01:21PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Writes to elements in the kmb->plane_status array in function
>> kmb_plane_atomic_disable are overrunning the array when plane_id is
>> more than 1 because currently the array is KMB_MAX_PLANES elements
>> in size and this is currently #defined as 1.  Fix this by defining
>> KMB_MAX_PLANES to 4.
> 
> I fail to follow you here.
> In kmb_plane_init() only one plane is allocated - with id set to 0.
> So for now only one plane is allocated thus kmb_plane_atomic_disable()
> is only called for this plane.
> 
> With your change we will start allocating four planes, something that is
> not tested.
> 
> Do I miss something?
> 
> 	Sam
> 

The static analysis from coverity on linux-next suggested that there was
an array overflow as follows:

108 static void kmb_plane_atomic_disable(struct drm_plane *plane,
109                                     struct drm_plane_state *state)
110 {

   1. Condition 0 /* !!(!__builtin_types_compatible_p() &&
!__builtin_types_compatible_p()) */, taking false branch.

111        struct kmb_plane *kmb_plane = to_kmb_plane(plane);

   2. assignment: Assigning: plane_id = kmb_plane->id.

112        int plane_id = kmb_plane->id;
113        struct kmb_drm_private *kmb;
114
115        kmb = to_kmb(plane->dev);
116

   3. Switch case value LAYER_3.

117        switch (plane_id) {
118        case LAYER_0:
119                kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
120                break;
121        case LAYER_1:

   (#2 of 4): Out-of-bounds write (OVERRUN)

122                kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
123                break;
124        case LAYER_2:

   (#3 of 4): Out-of-bounds write (OVERRUN)

125                kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
126                break;

   4. equality_cond: Jumping to case LAYER_3.

127        case LAYER_3:

   (#1 of 4): Out-of-bounds write (OVERRUN)
   5. overrun-local: Overrunning array kmb->plane_status of 1 8-byte
elements at element index 3 (byte offset 31) using index plane_id (which
evaluates to 3).

128                kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
129                break;
130        }
131

   (#4 of 4): Out-of-bounds write (OVERRUN)

132        kmb->plane_status[plane_id].disable = true;
133 }
134

So it seems the assignments to  kmb->plane_status[plane_id] are
overrunning the array since plane_status is allocated as 1 element and
yet plane_id can be 0..3

I could be misunderstanding this, or it may be a false positive.

Colin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
