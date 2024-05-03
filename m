Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428458BABD1
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 13:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C97810E1AF;
	Fri,  3 May 2024 11:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F89F10E1AF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 11:47:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C09D139F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 04:48:07 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6AEB3F793
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 04:47:41 -0700 (PDT)
Date: Fri, 3 May 2024 12:47:36 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 3/4] drm/panthor: Reset the FW VM to NULL on unplug
Message-ID: <ZjTO2OpDr9WKqgS4@e110455-lin.cambridge.arm.com>
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
 <20240502183813.1612017-4-boris.brezillon@collabora.com>
 <eba9c75d-ad1f-4c73-86de-624cb54e20a7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eba9c75d-ad1f-4c73-86de-624cb54e20a7@arm.com>
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

On Fri, May 03, 2024 at 10:22:13AM +0100, Steven Price wrote:
> On 02/05/2024 19:38, Boris Brezillon wrote:
> > This way get NULL derefs instead of use-after-free if the FW VM is
> > referenced after the device has been unplugged.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index b41685304a83..93165961a6b5 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1141,6 +1141,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
> >  	 * state to keep the active_refcnt balanced.
> >  	 */
> >  	panthor_vm_put(ptdev->fw->vm);
> > +	ptdev->fw->vm = NULL;
> >  
> >  	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
> >  }
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
