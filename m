Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7525847E2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 23:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D553D11AF90;
	Thu, 28 Jul 2022 21:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA76211AF75
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 21:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659045331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIWeWSIHbaSNSMAb2yWKIz7iDZYjMxUouhnVaDr6X20=;
 b=eXoNxnDGrUgdoqoCkQD2tiZNtR78eDL9Rj4g2EmgP9Xu9Zug0nGOZb/cEHGL0EMIMP3jAC
 OwdY+Qwa57SVevXZRDkg7VfhjW4Kmmr2B5u+wpcwUnIDT7RoR/KKn0c+mwJIyDg5cxgDCs
 fEIGXR80ivEL8ZArKsM9/7sKwhEhmz8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-P9cKRSRAPdWv3K9rJ8BM1Q-1; Thu, 28 Jul 2022 17:55:27 -0400
X-MC-Unique: P9cKRSRAPdWv3K9rJ8BM1Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 y11-20020a05622a004b00b0031f22fc45fcso1829786qtw.17
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RIWeWSIHbaSNSMAb2yWKIz7iDZYjMxUouhnVaDr6X20=;
 b=gKYLiQNQYmeG5iKGIFrR6Oqg7buXzg8hALKiEJkoDKx5qlWx0oieJCaODSSQ6yxqNK
 MKPVlqPTie67r/BD1IBT7rctZpZ1ehSCn4n2D3HNFgAWstLu0yuAbTzL+hIOZKMq2mQo
 Ypd2LEZ/R8JR96UuySDz6/UK71Nq6n4JkPvOpdlrAb/5wovmd598Cu7A+FDyvU3b2LST
 xEnMo/IA93fiOy+xj9tZ06X53XuaUYWjQL0bL57b0XzpoSobpxGqHDeegkEBKg9dnqS5
 HJYUKKaH8pXHCEUFQut6KsuKcAvqAqvgHWBLbrGPjHz2NoNDKgBVd5DUgvANkxUIFa9+
 YaUw==
X-Gm-Message-State: ACgBeo0qEEvyNP5otaNLLdhLIaq2Ib62hApRwLuT99tpNiAM/wBs1n00
 mKBl4xTuRoYdaBxOQdTiaQ4aZ3MDyPB1zpYVR8/74Z0QkWMQsXSX9nVzoaBc5UsFq6i9/7NdQSk
 kY/uaUhXoXOw/dHaqBGkxqQ1ddjb8
X-Received: by 2002:a0c:dd8e:0:b0:474:28c1:e1ce with SMTP id
 v14-20020a0cdd8e000000b0047428c1e1cemr961747qvk.108.1659045326609; 
 Thu, 28 Jul 2022 14:55:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5M+e3+QltkMzgg6R697JLzo9/vXryZlIizbzenoKnI77y4RBNg5Jr+sjBKxEhcd25fwDY8Xw==
X-Received: by 2002:a0c:dd8e:0:b0:474:28c1:e1ce with SMTP id
 v14-20020a0cdd8e000000b0047428c1e1cemr961734qvk.108.1659045326371; 
 Thu, 28 Jul 2022 14:55:26 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 t17-20020ac87611000000b003051f450049sm1129389qtq.8.2022.07.28.14.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 14:55:25 -0700 (PDT)
Message-ID: <f48b1d3ac72fa50f04a148d00977a61dc78d283d.camel@redhat.com>
Subject: Re: susetting the remaining swioltb couplin in DRM
From: Lyude Paul <lyude@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>
Date: Thu, 28 Jul 2022 17:55:23 -0400
In-Reply-To: <6988c4ad3e230b8d252a2edff190502a0b17f4f2.camel@redhat.com>
References: <20220711082614.GA29487@lst.de>
 <6988c4ad3e230b8d252a2edff190502a0b17f4f2.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Actually, seems like I do have a question. I see that you mention that we
could stop passing use_dma_alloc=true to ttm_device_init() or use
dma_alloc_noncoherent(). I'm not an expert on this nouveau's mm, but after
skimming it seems like if we can simply check whether or not we need all
noncoherent allocations without getting is_swiotlb_active() involved - which
should be easy. Does this seem like a workable solution, or is there something
I'm missing here?

On Thu, 2022-07-28 at 17:17 -0400, Lyude Paul wrote:
> Hi! Sorry about the slow reply to this, been busy with a bunch of other
> pressing nouveau work lately.
> 
> Anyway, the steps look pretty simple here so I can see if I can write up a
> patch shortly :)
> 
> On Mon, 2022-07-11 at 10:26 +0200, Christoph Hellwig wrote:
> > Hi i915 and nouveau maintainers,
> > 
> > any chance I could get some help to remove the remaining direct
> > driver calls into swiotlb, namely swiotlb_max_segment and
> > is_swiotlb_active.  Either should not matter to a driver as they
> > should be written to the DMA API.
> > 
> > In the i915 case it seems like the driver should use
> > dma_alloc_noncontiguous and/or dma_alloc_noncoherent to allocate
> > DMAable memory instead of using alloc_page and the streaming
> > dma mapping helpers.
> > 
> > For the latter it seems like it should just stop passing
> > use_dma_alloc == true to ttm_device_init and/or that function
> > should switch to use dma_alloc_noncoherent.
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

