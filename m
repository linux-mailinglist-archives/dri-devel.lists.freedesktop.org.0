Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EFC3EF38D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 22:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6B06E28B;
	Tue, 17 Aug 2021 20:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6036E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629232355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHdS9ueOmb69jsJrcy2jnmQ7X1KObHEiLTLTlPALuPw=;
 b=guolb07ggMrskdybk3wUxukW2OKya/4zv0sVNhvM+nFXr/ARf3zVCgdfKXHuUGgfJn6KW2
 LNioo3O0txmIg9Fp+nBV4fKMsgo3qGZRzOP/B8iXbqomh9+JUKb11LoCViWENOPLQrRe7E
 44rflxvgOn/Ut7dv42+CxnliLv7va+Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-vdUjADkzOxSGxLy6PDYgGg-1; Tue, 17 Aug 2021 16:32:34 -0400
X-MC-Unique: vdUjADkzOxSGxLy6PDYgGg-1
Received: by mail-qv1-f71.google.com with SMTP id
 e17-20020a0562141511b029034f8146604fso434108qvy.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 13:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=QHdS9ueOmb69jsJrcy2jnmQ7X1KObHEiLTLTlPALuPw=;
 b=KpvooiMFwz5RFCowrsKXE7Al4VjrnLG54h8ia8covHlZknKRFHqFepIJre/3YPShsQ
 yqorg1xYqt3iVyEMAEBWFp85Wr+Ow+PC8x00NqbX6SmKfVbqSp6iCEezfEEf6pUexfYc
 gw0GYkC+rl0xtEKJypv48G28pJMIqJ7/hQHstjsSlrCe9lb+p2adu4jsU5s33dxl5hdH
 VQw2UlKz3DkKpbGWh6dz8jEeZj3PbRZHaGUmaX0F2H335boMsqDPm62cjR9uohdPtcAe
 BmLLh5a2wxGLGx5tEGlqWRD4DoOb4oGixRY8qZpsNxIg5+zy156zh437my2lNYRt0cld
 QSFg==
X-Gm-Message-State: AOAM532ub9HBPaVUjTVlxnpBZsdWEptIFeIkaRsdu2WefSnARXWiwVKs
 UITbCUuYG04DZl3mXTXZX2W+XoSPaYVvfJOKKf+5j6jmbLfXE4x+2u+BeDQs9CLd5N2v5x8BqTr
 dtRWfbwKe3+ol2Fwy0a6c2dRmJYmf
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr5275130qvp.12.1629232353972; 
 Tue, 17 Aug 2021 13:32:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygDhxEIqY4Za1qslzDIgx56HQC6qEhIHk2i9Emxojd0+6VzuJVx7K1EP9WMmefEySmnxy/Cg==
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr5275092qvp.12.1629232353464; 
 Tue, 17 Aug 2021 13:32:33 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id n124sm2175109qkf.119.2021.08.17.13.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:32:32 -0700 (PDT)
Message-ID: <418fdcbcf554d34cc6423a88974f916b64b3664c.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] drm/nouveau: fix a use-after-free in postclose()
From: Lyude Paul <lyude@redhat.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Aug 2021 16:32:31 -0400
In-Reply-To: <YRoN0vWFN6Lw22ej@eldamar.lan>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
 <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
 <YRoN0vWFN6Lw22ej@eldamar.lan>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

It may have been, we're in the process of trying to change around how we
currently accept nouveau patches to stop this from happening in the future.

Ben, whenever you get a moment can you take a look at this?

On Mon, 2021-08-16 at 09:03 +0200, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Fri, Mar 26, 2021 at 06:00:51PM -0400, Lyude Paul wrote:
> > This patch series is:
> > 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Btw - in the future if you need to send a respin of multiple patches, you
> > need
> > to send it as it's own separate series instead of replying to the previous
> > one
> > (one-off respins can just be posted as replies though), otherwise
> > patchwork
> > won't pick it up
> 
> Did this patch series somehow fall through the cracks or got lost?
> 
> Regards,
> Salvatore
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

