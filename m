Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C320622647
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD2710E592;
	Wed,  9 Nov 2022 09:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CCFB10E592
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=81/8R
 8PcYCv+ukfNKa28dNL3ycXqZdDh0QLRoeoGJbY=; b=dL8ofh5ZIyA3k2FBRsQU+
 VAQwdLhQlK9GQGXOo84sSqXzmAw0O+i9TRO2Vo2hunQcqJrY5g5WUtdVgQ50FDjq
 dnrufnE22WlrhMqfCD4F3rK+QzvSvrazKmY4mlTfdny6NiR77ChlzwF6j3f5zPAm
 Q99ALiKKzD0h6ySW1GenpM=
Received: from localhost (unknown [114.221.197.143])
 by smtp7 (Coremail) with SMTP id C8CowACXz_HhbWtjzkYoQw--.41182S2;
 Wed, 09 Nov 2022 17:07:46 +0800 (CST)
Date: Wed, 9 Nov 2022 17:07:45 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
Message-ID: <20221109170745.0000039b@163.com>
In-Reply-To: <d4534f8e-d4b5-8484-dde5-34ce671972af@suse.de>
References: <20221108020321.911-1-tangchunyou@163.com>
 <d4534f8e-d4b5-8484-dde5-34ce671972af@suse.de>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowACXz_HhbWtjzkYoQw--.41182S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4rAFyDXr18uF15ZrW5KFg_yoW8ZF1rpr
 sxJFW2yFWvqa9rtrZ7Z3WkAa45Cw4kKr48Ca45Aw43Cr10yF1DJFWYkrWDZFW7Ar4xXF1Y
 vw1qkryfAFyUAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBa0QUUUUU=
X-Originating-IP: [114.221.197.143]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiZQK0UV8ZVbHaDgAAs0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

drm_gem_object_init() will do these before failed:

void drm_gem_private_object_init(struct drm_device *dev,
                                 struct drm_gem_object *obj, size_t
size) {
        BUG_ON((size & (PAGE_SIZE - 1)) != 0);

        obj->dev = dev;
        obj->filp = NULL;

        kref_init(&obj->refcount);
        obj->handle_count = 0;
        obj->size = size;
        dma_resv_init(&obj->_resv);
        if (!obj->resv)
                obj->resv = &obj->_resv;

        drm_vma_node_reset(&obj->vma_node);
        INIT_LIST_HEAD(&obj->lru_node);
}

so I think when it failed, should use drm_gem_object_release()
to do dma_resv_fini() and others.

another, if drm_gem_object_init() fails, the drm_gem_handle_create()
can not be called.

ÓÚ Tue, 8 Nov 2022 09:28:34 +0100
Thomas Zimmermann <tzimmermann@suse.de> Ð´µÀ:

> Hi
> 
> Am 08.11.22 um 03:03 schrieb ChunyouTang:
> > when goto err_free, the object had init, so it should be release
> > when fail.
> 
> If the call to drm_gem_object_init() fails, the object is still 
> uninitialized. Admittedly, the call to gem_create_object could need 
> additional cleanup, but it appears as if no one has had a need for
> this so far.
> 
> Is there anything that might leak?
> 
> > 
> > Signed-off-by: ChunyouTang <tangchunyou@163.com>
> > ---
> >   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > b/drivers/gpu/drm/drm_gem_shmem_helper.c index
> > 35138f8a375c..2e5e3207355f 100644 ---
> > a/drivers/gpu/drm/drm_gem_shmem_helper.c +++
> > b/drivers/gpu/drm/drm_gem_shmem_helper.c @@ -104,10 +104,10 @@
> > __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool
> > private) return shmem;
> >   
> > -err_release:
> > -	drm_gem_object_release(obj);
> >   err_free:
> >   	kfree(obj);
> > +err_release:
> > +	drm_gem_object_release(obj);
> 
> You have now freed the object's memory before releasing it. Not going
> to work.
> 
> Best regards
> Thomas
> 
> >   
> >   	return ERR_PTR(ret);
> >   }
> 

