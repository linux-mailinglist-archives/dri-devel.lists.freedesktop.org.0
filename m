Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7817BBA82
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 16:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AC910E509;
	Fri,  6 Oct 2023 14:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Fri, 06 Oct 2023 14:41:15 UTC
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id F250610E50B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 14:41:15 +0000 (UTC)
Received: from [192.168.1.3] (gsystem.sk [85.248.217.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id AEDAA7A025C;
 Fri,  6 Oct 2023 16:34:09 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] video: fbdev: arkfb: fix possible object reference leak
Date: Fri, 6 Oct 2023 16:34:01 +0200
User-Agent: KMail/1.9.10
References: <tencent_55C1A344A101B55762ECA6A6366D0B0F8C05@qq.com>
 <b9e51034-bc6c-81d8-39ef-9fc74fa09c62@gmx.de>
In-Reply-To: <b9e51034-bc6c-81d8-39ef-9fc74fa09c62@gmx.de>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202310061634.02110.linux@zary.sk>
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
Cc: jiapeng.chong@linux.alibaba.com, linux-fbdev@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 Zhang Shurong <zhang_shurong@foxmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday 06 October 2023, Helge Deller wrote:
> On 10/5/23 09:01, Zhang Shurong wrote:
> > Add missing pci_disable_device() in error path in ark_pci_probe().
> 
> Do you have this hardware and tested your patch?
> I'm sure there is a reason, why "pci_disable_device()" was commented
> out in the original submission in commit 681e14730c73c...

pci_disable_device() call is disabled in many fbdev drivers because calling it might prevent display from working.

> 
> Additionally I'm wondering why your patch doesn't show up in
> the fbdev patchwork, although you added linux-fbdev mailing list.
> Probably a vger issue.
> 
> Helge
> 
> 
> > Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> > ---
> >   drivers/video/fbdev/arkfb.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> > index 60a96fdb5dd8..6c4e5065646f 100644
> > --- a/drivers/video/fbdev/arkfb.c
> > +++ b/drivers/video/fbdev/arkfb.c
> > @@ -1064,7 +1064,7 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >   err_dac:
> >   	pci_release_regions(dev);
> >   err_request_regions:
> > -/*	pci_disable_device(dev); */
> > +	pci_disable_device(dev);
> >   err_enable_device:
> >   	framebuffer_release(info);
> >   	return rc;
> > @@ -1085,7 +1085,7 @@ static void ark_pci_remove(struct pci_dev *dev)
> >
> >   		pci_iounmap(dev, info->screen_base);
> >   		pci_release_regions(dev);
> > -/*		pci_disable_device(dev); */
> > +		pci_disable_device(dev);
> >
> >   		framebuffer_release(info);
> >   	}
> 
> 



-- 
Ondrej Zary
