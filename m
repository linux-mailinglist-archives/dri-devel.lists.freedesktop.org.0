Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A42416AA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C506E187;
	Tue, 11 Aug 2020 06:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 488 seconds by postgrey-1.36 at gabe;
 Mon, 10 Aug 2020 17:20:02 UTC
Received: from cmta16.telus.net (cmta16.telus.net [209.171.16.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23D989BA1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 17:20:02 +0000 (UTC)
Received: from montezuma.home ([154.5.226.127]) by cmsmtp with SMTP
 id 5BKwkkXSG5b7l5BKykm83N; Mon, 10 Aug 2020 11:11:53 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=YPHhNiOx c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10
 a=bG9gDjmhPuXUG-eiuMMA:9 a=CjuIK1q_8ugA:10
Date: Mon, 10 Aug 2020 10:11:50 -0700 (PDT)
From: Zwane Mwaikambo <zwanem@gmail.com>
To: tcamuso@redhat.com
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
Message-ID: <alpine.DEB.2.21.2008101004110.27032@montezuma.home>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLXLrG61H3IewWgL14PAlsxl0Y3rkOFoECheosPcZUUND7JWnN8rPKnbtQKPrkOXCu1aPejTgwQ+X7R90J+w6fD9IdyUBsRp14+2pRNZx/kNWYggJTdX
 0xLa2pgKJOC23iLr8VbAmtdlcXp7oCl9+cr4ZWuCC5EQUMDbBt8V0rmF1448y9Q6MKlDSh7QNFCoPzAZAgrUHqhl+APfxkN1I6+iktMRThGoW689FGKKUnsC
 hvLSjM46j66W8Oh7ifli8AEYTmDmtKv58sakJbGgDH3mCHUKafvaPsOcpDWN9xrS
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: dkwon@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Folks,
	I know this thread eventually dropped off due to not identifying 
the underlying issue. It's still occuring on 5.8 and in my case it 
happened because the udev device nodes for the DP aux devices were not 
cleaned up whereas the kernel had no association with them. I can 
reproduce the bug just by creating a device node for a non-existent minor 
device and calling open().

To me it still makes sense to just check aux_dev because the chardev has 
no way to check before calling.

(gdb) list *drm_dp_aux_dev_get_by_minor+0x29
0x17b39 is in drm_dp_aux_dev_get_by_minor (drivers/gpu/drm/drm_dp_aux_dev.c:65).
60      static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned index)
61      {
62              struct drm_dp_aux_dev *aux_dev = NULL;
63
64              mutex_lock(&aux_idr_mutex);
65              aux_dev = idr_find(&aux_idr, index);
66              if (!kref_get_unless_zero(&aux_dev->refcount))
67                      aux_dev = NULL;
68              mutex_unlock(&aux_idr_mutex);
69
(gdb) p/x &((struct drm_dp_aux_dev *)(0x0))->refcount
$8 = 0x18

static int auxdev_open(struct inode *inode, struct file *file)
{
    unsigned int minor = iminor(inode);
    struct drm_dp_aux_dev *aux_dev;

    aux_dev = drm_dp_aux_dev_get_by_minor(minor);
    if (!aux_dev)
        return -ENODEV;

    file->private_data = aux_dev;
    return 0;
}


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
