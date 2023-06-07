Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37472592C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8A410E479;
	Wed,  7 Jun 2023 09:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BE810E479
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
 b=iKuQH0GxWKxPxLT/YxKA14uhApMeDKzJIE9ei2uyunvBG8imqFlt9EJbxC+3eH9R9puzf9
 vPza+nZfGqvppbIy0d/sAWLFkO97cJOT0hewS3nBEAKzhDw2Us1Up1Lpqd8gWpG572csOp
 8DOVeLvrFaODbYCRuRjmDKIQVBXVJ4Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-R8dAOW1XML2vyC6ia8FMMQ-1; Wed, 07 Jun 2023 05:02:09 -0400
X-MC-Unique: R8dAOW1XML2vyC6ia8FMMQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30ae7bd987dso3033516f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128527; x=1688720527;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
 b=ixpb3dy5Ikl+0go2oA1R0P0UhGC4OCOQ1dDhbg30cIdb3hyBtYEAndsxzBeZ+E8x82
 hebP9l64cLJnKtjddi4GmugujLorNJdKiywEdNjxkFaFhNLORJ6+k6FWNX1l6TU+qjJR
 WTCfd3bbggVR0iCpPRPFhxSnD0qnlzx1exhTWhY8uadMoruhUy2zYitKrj2nXWSliUmX
 vO7e7qZ/8tyLbsj2QqwN0O65p48NEzrQePHuixvyhC3Q7nGncIUXFGJla43LyFPyIQPR
 dov+VYD8xDmvEcv6bfc6MMr05+izQgCS4H1M0PbXxI65AAwAafmUCnYqaxS9B/vhrL7Y
 VRyw==
X-Gm-Message-State: AC+VfDygN+IrSTYErrwZl7THkAzUlsPp4tqG0sMCOgGm2PvZLqkxwaXk
 71BWthkir/vmzdr5RdKLYxJLGGvXLyjHIddE3RlYsXxK8WO/ST+kF31WvcyJdyvEQzIhMOIJQak
 549AYBEHdFJtYvVQyZs54DpZaZasa
X-Received: by 2002:a5d:5642:0:b0:307:bd64:f5a4 with SMTP id
 j2-20020a5d5642000000b00307bd64f5a4mr4077057wrw.52.1686128527752; 
 Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+RtLt6z9BsPsahZF3tzNThAhq9O2T1soohVRASzXnOQHusHmP/yNJTyZBUwoEWLT/tzAX+w==
X-Received: by 2002:a5d:5642:0:b0:307:bd64:f5a4 with SMTP id
 j2-20020a5d5642000000b00307bd64f5a4mr4077038wrw.52.1686128527482; 
 Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d4b0a000000b0030789698eebsm14921477wrq.89.2023.06.07.02.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 14/30] fbdev/nvidiafb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-15-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-15-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:02:06 +0200
Message-ID: <87a5xbfxwx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

