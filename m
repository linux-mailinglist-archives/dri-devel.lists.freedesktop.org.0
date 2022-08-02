Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586FA5887E1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3E311248A;
	Wed,  3 Aug 2022 07:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5223 seconds by postgrey-1.36 at gabe;
 Tue, 02 Aug 2022 13:38:24 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
 [67.231.149.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB56C11217B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 13:38:24 +0000 (UTC)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
 by m0048274.ppops.net-00176a03. (8.17.1.5/8.17.1.5) with ESMTP id
 272406lr032006
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Aug 2022 08:11:20 -0400
Date: Tue, 2 Aug 2022 15:04:04 +0300
From: Ian Ray <ian.ray@ge.com>
To: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH] drm/bridge: megachips: Fix a null pointer dereference bug
Message-ID: <20220802120403.GA26182@zoo6.em.health.ge.com>
References: <20220716081304.2762135-1-zheyuma97@gmail.com>
 <946c008942f4ef4ca642818b23e9941c162383e3.camel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <946c008942f4ef4ca642818b23e9941c162383e3.camel@collabora.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: oB53lIvuJdspmys9C-hLSCAmkgl5lnz3
X-Proofpoint-GUID: oB53lIvuJdspmys9C-hLSCAmkgl5lnz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_07,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208020057
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:28 +0000
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
Cc: Zheyu Ma <zheyuma97@gmail.com>, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, peter.senna@gmail.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 jernej.skrabec@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 19, 2022 at 09:38:16AM +0100, Martyn Welch wrote:
> On Sat, 2022-07-16 at 16:13 +0800, Zheyu Ma wrote:
> > When removing the module we will get the following warning:
> > 
> > [   31.911505] i2c-core: driver [stdp2690-ge-b850v3-fw] unregistered
> > [   31.912484] general protection fault, probably for non-canonical
> > address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
> > [   31.913338] KASAN: null-ptr-deref in range [0x0000000000000008-
> > 0x000000000000000f]
> > [   31.915280] RIP: 0010:drm_bridge_remove+0x97/0x130
> > [   31.921825] Call Trace:
> > [   31.922533]  stdp4028_ge_b850v3_fw_remove+0x34/0x60
> > [megachips_stdpxxxx_ge_b850v3_fw]
> > [   31.923139]  i2c_device_remove+0x181/0x1f0
> > 
> > The two bridges (stdp2690, stdp4028) do not probe at the same time,
> > so
> > the driver does not call ge_b850v3_resgiter() when probing, causing
> > the
> > driver to try to remove the object that has not been initialized.
> > 
> > Fix this by checking whether both the bridges are probed.
> > 
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> 
> Good catch!
> 
> Acked-by: Martyn Welch <martyn.welch@collabora.com>

Tested-by: Ian Ray <ian.ray@ge.com>


> 
> Would be worth adding:
> 
> Fixes: 11632d4aa2b3 ("drm/bridge: megachips: Ensure both bridges are
> probed before registration")
> 
> > ---
> >  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > index cce98bf2a4e7..c68a4cdf4625 100644
> > --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > @@ -296,7 +296,9 @@ static void ge_b850v3_lvds_remove(void)
> >          * This check is to avoid both the drivers
> >          * removing the bridge in their remove() function
> >          */
> > -       if (!ge_b850v3_lvds_ptr)
> > +       if (!ge_b850v3_lvds_ptr ||
> > +               !ge_b850v3_lvds_ptr->stdp2690_i2c ||
> > +               !ge_b850v3_lvds_ptr->stdp4028_i2c)
> >                 goto out;
> >  
> >         drm_bridge_remove(&ge_b850v3_lvds_ptr->bridge);
> 
