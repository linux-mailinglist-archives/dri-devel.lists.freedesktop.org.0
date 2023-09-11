Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128CB79AA22
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 18:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7CF10E33A;
	Mon, 11 Sep 2023 16:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F78B10E338
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694449817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RnHJHN5Cfj592B1txIAsnJFDj1FO7IjqCo2I3g3K4yE=;
 b=ezngypBowWy760Zgwu0HadayHLwXyAIfX+H7KwU+9Om0K+hWdhHVey27JbrgC01xPdee4m
 GUIfJlWW1AvWCzBts6945VR9CS8f4tSbSGbhGE9L2etnj0+BUvui4jT9wfshfof55iUNC5
 +gJdF5KtHVN0VJ/T8esLDi0lYyydOe8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-L1r4UcwXNXqQQDLNmLLhpg-1; Mon, 11 Sep 2023 12:30:14 -0400
X-MC-Unique: L1r4UcwXNXqQQDLNmLLhpg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9aa05c1934aso367833366b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694449813; x=1695054613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RnHJHN5Cfj592B1txIAsnJFDj1FO7IjqCo2I3g3K4yE=;
 b=wbsOHkvbPPewcAo6uUeMOaoNK25MyM0L7SQNHkkoQ9fDbpI4i+yTa1LC+mt4qYg6jG
 2V2QDb3U+r3J0FUntLi2Okjup/E7TVHjkad4Wl5B2ykiFnA7/fZobAQ5LWjfStLDTKWp
 pYnH6BgMrK23RekS/t1MKgTqXAR3oSS4gE4Id7JKoYOGJuQgFhhwtIsl3BCOhuwkRw2s
 ukacv0g3O3HT9yXmXhG7Uagi3EQfOTS1QG8dMt8hGTBZ/4lb7FnVh8CSSE8M1Mh8Jci1
 Xzm/o1KJQ/rnA95B2I4l7NiHuAGCBgqm1MOnzWugzb4zYdms7JEyzoWp2xnnFxy0tLAt
 ohmw==
X-Gm-Message-State: AOJu0Yw0uD+7pl8aDnTNiD4I+fcNTofhY9F1wy7QPe9dC3UnbLsKqQ3O
 XQiw3zPzXGcrlDrkFv7/u+YEB7yfHIjPrERZ1LEzhM4CME1yA4UYXUhzzHmFkkOSAqcPYXmY+Ky
 12YSmrVlUa+ER/T/28C0chsum72FC
X-Received: by 2002:a17:907:8a1c:b0:982:a022:a540 with SMTP id
 sc28-20020a1709078a1c00b00982a022a540mr206928ejc.11.1694449813782; 
 Mon, 11 Sep 2023 09:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNhPmNNStTZs5PE2OQ6KZzdKOTE5Av9U7Sptz++UFQy/HCfVuMVhM7hDiKm6FA6tPHtenKgA==
X-Received: by 2002:a17:907:8a1c:b0:982:a022:a540 with SMTP id
 sc28-20020a1709078a1c00b00982a022a540mr206903ejc.11.1694449813470; 
 Mon, 11 Sep 2023 09:30:13 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a170906138500b0099cb1a2cab0sm5590017ejc.28.2023.09.11.09.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:30:12 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:30:10 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <ZP9AkkJ1FruZGSVV@cassiopeiae>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <20230911164526.0192a686@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230911164526.0192a686@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 04:45:26PM +0200, Boris Brezillon wrote:
> On Sat,  9 Sep 2023 17:31:13 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > @@ -807,6 +1262,14 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >  
> >  	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
> >  
> > +	spin_lock(&gpuvm->extobj.lock);
> > +	list_del(&vm_bo->list.entry.extobj);
> > +	spin_unlock(&gpuvm->extobj.lock);
> > +
> > +	spin_lock(&gpuvm->evict.lock);
> > +	list_del(&vm_bo->list.entry.evict);
> > +	spin_unlock(&gpuvm->evict.lock);
> > +
> >  	list_del(&vm_bo->list.entry.gem);
> >  
> >  	drm_gem_object_put(obj);
> 
> I ran into a UAF situation when the drm_gpuvm_bo object is the last
> owner of obj, because the lock that's supposed to be held when calling
> this function (drm_gem_gpuva_assert_lock_held() call above), belongs to
> obj (either obj->resv, or a driver specific lock that's attached to the
> driver-specific GEM object). I worked around it by taking a ref to obj
> before calling lock()+drm_gpuvm_bo_put()+unlock(), and releasing it
> after I'm node with the lock, but that just feels wrong.
> 
As mentioned in a previous reply, I think we want to bring the dedicated GEM
gpuva list lock back instead of abusing the dma-resv lock. This way we can
handle locking internally and don't run into such issues.

There is also no reason for a driver to already hold the GEM gpuva list lock
when when calling drm_gpuvm_bo_put(). Drivers would only acquire the lock to
iterate the GEMs list of drm_gpuvm_bos or the drm_gpuvm_bos list of drm_gpuvas.
And dropping the drm_gpuvm_bo from within such a loop is forbidden anyways.

