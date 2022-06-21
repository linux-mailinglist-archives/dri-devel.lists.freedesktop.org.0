Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74E553960
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 20:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4238710EC4D;
	Tue, 21 Jun 2022 18:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DAF10EC4D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655834858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5cG3kia8odkjBcTZLKuQl7AOybzGyl/9gRLK0isGMAI=;
 b=YvqTVHdi1b4mwzjtFzNnN4CUDujiGHcaqnE1xCqdv55evRMQ0LmzhxMQpoIzNL1ghouNHL
 pVsZYbjfsMBrkK7H2wvRVALP3HS0whhwSY18dtlaeJTT8EzdPLbK263EYM/5AsFrEGQUkH
 d0fnZmUIxdDDeE465eVBrsx+Ts1+s+8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-u1XvewXyOJ2x3y5UE5q7Yw-1; Tue, 21 Jun 2022 14:07:37 -0400
X-MC-Unique: u1XvewXyOJ2x3y5UE5q7Yw-1
Received: by mail-qv1-f70.google.com with SMTP id
 lx15-20020a0562145f0f00b0047052731d81so2507113qvb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=5cG3kia8odkjBcTZLKuQl7AOybzGyl/9gRLK0isGMAI=;
 b=VyuStax4ZvHmErwCBT82KrTHKYVtEfhozrgjllqYW4icmFBztsBqgHIzsYTEJdne/p
 evEfYwepPeXhHlkSpNAa0ZphxynoSKfXlcom5Slb2FVuwxWoCkMhtLyMtZIDwPqjtT/I
 uPTYXtPpRTSFjdDR0m0epW4h8Ecu5vcpt4Q8hYh6hilx7UH21oW6Yr0UuQSF7r6VTBR9
 fB2nFHFg/rivkKU/lKHbTOS4eryzT0Hut/UH9XCCc8XQ+PGe2aVPkU46Pqi1sfLdmtNW
 HJiIQvaCgwpN6x9SgObH3j/tboDPH2sZkd/m2kccTm5ENvq4COlP0HT7RQRqzgiFthbd
 Cwcg==
X-Gm-Message-State: AJIora9jIzU3K3LsyIE2utUh5giDqp0eFWR2cQI7wlROYM3bBOzVd2qo
 rKE1yAYiswbFtUcn6nBy4O79vc0+7cAH/cWSkJcN4htuY7WjgrWe6nz5veMC33T2pgfFU5ORBC3
 v8bNMSu5NQh1bSip6Cg8RuH/izdFj
X-Received: by 2002:a05:6214:27cc:b0:46b:bc28:7d4f with SMTP id
 ge12-20020a05621427cc00b0046bbc287d4fmr24583818qvb.80.1655834856806; 
 Tue, 21 Jun 2022 11:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sJh6CMMcPe8ZNnL91aAC2G9gWqasAgfRD8kaUJj366io2XkPR2slZLQWFlSpnAemSm8lZ2OA==
X-Received: by 2002:a05:6214:27cc:b0:46b:bc28:7d4f with SMTP id
 ge12-20020a05621427cc00b0046bbc287d4fmr24583794qvb.80.1655834856463; 
 Tue, 21 Jun 2022 11:07:36 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05622a198700b002f90a33c78csm13488992qtc.67.2022.06.21.11.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 11:07:35 -0700 (PDT)
Message-ID: <026999e88cabd9bd4923e3c14271a94f5d264fa3.camel@redhat.com>
Subject: Re: [PATCH] drm/display: drop unexpected word "the" in the comments
From: Lyude Paul <lyude@redhat.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 21 Jun 2022 14:07:34 -0400
In-Reply-To: <4e772a9219177f548378ecac62e03be6c9928ead.camel@redhat.com>
References: <20220621131440.1512-1-jiangjian@cdjrlc.com>
 <4e772a9219177f548378ecac62e03be6c9928ead.camel@redhat.com>
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
Cc: jani.nikula@intel.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Actually I hate to ask but could you resend this and the other patch that you
sent and make sure that dri-devel@ is explicitly in the to: list? For some
reason these patches don't seem to be coming up on patchwork

On Tue, 2022-06-21 at 13:54 -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Will push to the appropriate branch in a moment
> 
> On Tue, 2022-06-21 at 21:14 +0800, Jiang Jian wrote:
> > there is an unexpected word "the" in the comments that need to be dropped
> > 
> > file: drivers/gpu/drm/display/drm_dp_helper.c
> > line: 1600
> >   * Doesn't account the the "MOT" bit, and instead assumes each
> > changed to
> >   * Doesn't account the "MOT" bit, and instead assumes each
> > 
> > Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index e7c22c2ca90c..499f75768523 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct
> > drm_dp_aux_msg *msg)
> >   * Calculate the length of the i2c transfer in usec, assuming
> >   * the i2c bus speed is as specified. Gives the the "worst"
> >   * case estimate, ie. successful while as long as possible.
> > - * Doesn't account the the "MOT" bit, and instead assumes each
> > + * Doesn't account the "MOT" bit, and instead assumes each
> >   * message includes a START, ADDRESS and STOP. Neither does it
> >   * account for additional random variables such as clock stretching.
> >   */
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

