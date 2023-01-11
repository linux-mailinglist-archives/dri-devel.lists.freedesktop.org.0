Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C701166617C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFAA10E7AD;
	Wed, 11 Jan 2023 17:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163E10E7AD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:13:27 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id jn22so17424517plb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 09:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xoqM2b4yU5Wgrth55wL+NVhuuSQRsysOAOffMfb2Zs=;
 b=UTHw9GP46gMj4w7BoWTjll73gGs6xDrYov0a9OBFb+A+fCEnj/lNlk/PdejnbXURqO
 Bjaa3RzcOfRgNZwW4y4wEquG1PiGvWa+mDFtnWW0uykLypatPgx5G7+4SERoq1k+dvQG
 xFFX2kzEYRvqMO5becq4T5XslALlZk0R4OFnPNGloW7hFS7+kr3EIBznbqo0ZIAm8A1H
 +p3Zp0frWYwjCW7td3rratlrAVtlk1S+6jOhrJ+M/+CWMO1tC4v7PVqrV9Thc4XztjhF
 1CE9QPZeiFYhJRLTxvImYXddOrBCNoD718EF13VjvKDTA1rmkfHp64GNv01N55tZjVL5
 n6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7xoqM2b4yU5Wgrth55wL+NVhuuSQRsysOAOffMfb2Zs=;
 b=OC02OoNWvfQE6dtBPyCJgHYugIFpKv2u8ZjVS4RBylxUIdBr7pNy6u6+hTkeL5a5Ls
 SKv46Ut6W0vsI9slJMu+hqK3zrE5FFhCDdK79RgqxUQYCryazzGYo5w/Vamrlpp2WWnP
 hgE/XTOFoTBU6hjNYH7AmQZSMe57SADc7am4gIjU1YE8geezp3n9/bQBrbSvY7qy4jdO
 NdiRr/gNTgbTeVEMhdoaBHwo3oZ0YIdCPBW+ly9r4C4k66W4neotl5Tf8aoFqTFpJHIl
 rAwrRCDRpV+m5NczYPJNjmcVxVACeA80pDPEByPZGA/DRdGkBSL5Co4PyMdheqb3r2Jr
 qtAA==
X-Gm-Message-State: AFqh2kot4ruGPmFZMrRSsm177Mb6oFSMD4qrf946DIylnqqrO/E3PmZz
 vaHGKjzXFe7rtRIZ1RTDzOiYsg==
X-Google-Smtp-Source: AMrXdXvZV+eSwBO+qB3Cyv97/dRNyiGborDMC+PfJG2AQCDQ93hQgMsB7NAdTQYHGQJUGIn+huvG/w==
X-Received: by 2002:a17:90a:9503:b0:227:679:17df with SMTP id
 t3-20020a17090a950300b00227067917dfmr499019pjo.0.1673457207330; 
 Wed, 11 Jan 2023 09:13:27 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 e13-20020a63e00d000000b00485cbedd34bsm8852733pgh.89.2023.01.11.09.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:13:26 -0800 (PST)
Date: Wed, 11 Jan 2023 17:13:23 +0000
From: Sean Christopherson <seanjc@google.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kvm@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Message-ID: <Y77uM/X94DtKXtK0@google.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <YxenK8xZHC6Q4Eu4@phenom.ffwll.local>
 <YxeoEr6xAtlZ+IrU@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxeoEr6xAtlZ+IrU@phenom.ffwll.local>
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

On Tue, Sep 06, 2022, Daniel Vetter wrote:
> On Tue, Sep 06, 2022 at 10:01:47PM +0200, Daniel Vetter wrote:
> > On Mon, Aug 15, 2022 at 12:05:19PM +0200, Christian König wrote:
> > > Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
> > > > Higher order pages allocated using alloc_pages() aren't refcounted and they
> > > > need to be refcounted, otherwise it's impossible to map them by KVM. This
> > > > patch sets the refcount of the tail pages and fixes the KVM memory mapping
> > > > faults.
> > > > 
> > > > Without this change guest virgl driver can't map host buffers into guest
> > > > and can't provide OpenGL 4.5 profile support to the guest. The host
> > > > mappings are also needed for enabling the Venus driver using host GPU
> > > > drivers that are utilizing TTM.
> > > > 
> > > > Based on a patch proposed by Trigger Huang.
> > > 
> > > Well I can't count how often I have repeated this: This is an absolutely
> > > clear NAK!
> > > 
> > > TTM pages are not reference counted in the first place and because of this
> > > giving them to virgl is illegal.
> > > 
> > > Please immediately stop this completely broken approach. We have discussed
> > > this multiple times now.
> > 
> > Yeah we need to get this stuff closed for real by tagging them all with
> > VM_IO or VM_PFNMAP asap.
> 
> For a bit more context: Anything mapping a bo should be VM_SPECIAL. And I
> think we should add the checks to the gem and dma-buf mmap functions to
> validate for that, and fix all the fallout.
> 
> Otherwise this dragon keeps resurrecting ...
> 
> VM_SPECIAL _will_ block get_user_pages, which will block everyone from
> even trying to refcount this stuff.

FWIW, IIUC that won't change the KVM story.  KVM acquires the PFN for these pages
via follow_pte(), not by gup().  Details are in a different strand of this thread[*].

If TTM pages aren't tied into mmu_notifiers, then I believe the only solution is
to not allow them to be mapped into user page tables.  If they are tied into
mmu_notifiers, then this is fully a KVM limitation that we are (slowly) resolving.

[*] https://lore.kernel.org/all/Y77sQZI0IfFVx7Jo@google.com
