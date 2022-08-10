Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3733358F366
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 22:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038DB11A3B1;
	Wed, 10 Aug 2022 20:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC8C11A715
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 20:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660161731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1hlp0Gyv2ZIJfyrBMXG6uXCKrB0JJ1FvUhL509Xp2w=;
 b=AnxhVjhdKe7RFdFprcajCF/BnkQ+THksACTsYOiPCARAu5CRYHcS28J+CMOPixK04Mkv93
 5e+fYvEB4UTtwQW9KxZqQ+KqMfrZYDFWNQNlBWJtfLzEhnneuF/Y+MHXK8BKz04XH4XxFD
 fFIc1BvxEfH/zdwwGYu/Cfl7Ks21YP4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-vHwelahAONCsEpgvvbAtGg-1; Wed, 10 Aug 2022 16:02:10 -0400
X-MC-Unique: vHwelahAONCsEpgvvbAtGg-1
Received: by mail-qk1-f200.google.com with SMTP id
 i15-20020a05620a404f00b006b55998179bso13282768qko.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 13:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=/1hlp0Gyv2ZIJfyrBMXG6uXCKrB0JJ1FvUhL509Xp2w=;
 b=t2S9t4psYMDqPQvQ36BYKpsfj7fHkjh8axJG4bn8V1Ml7WMnoZb0X++jsYmv/+vWum
 aKzGxoZFE+UmPuARrtiBDy3MnE2lTf81x9Zcl4fWFu8Tu0t4AWyXshczfRXX7RzqufqH
 9qZkxznj0//aZNrDhGNAUUVQT5FrORbCiRtELk/jibVNI0gtzX6y6qQ3VOblTHUh+tVz
 /pnhIK4B6j3TieNGId4difrG3TAJLV9IbVxOKhqniM0+rUvNbIKgMfLEAUUAT8ydpJnG
 HQHBiglwyiyXh91dfGpEzVvVars/KiOaJgMLVykiafbfAEqRo8E9wf1wxVBQco5NUiXL
 72rQ==
X-Gm-Message-State: ACgBeo3QKUPue3LhWDHBwyH5Xo2yUiUZHpJrOsJgF7WbLr+6t4GiPS5y
 CawP/wZiJsErIs3GCJ7fwlFKJ7sc6B2bXMANdSPIO9bBmWA0Yu5yGB4mFeznA83kkqPFsPIU4Xp
 Bewq+r91/bji7VYqF58tID0H2o89I
X-Received: by 2002:a05:6214:2a84:b0:476:feb2:f436 with SMTP id
 jr4-20020a0562142a8400b00476feb2f436mr25395632qvb.43.1660161730300; 
 Wed, 10 Aug 2022 13:02:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5fLIKOJAg5QWHbIOrCO42lGfzKwOwhsxqZ3bG+OI9NXMLIj2uLfoC8Tbet2oyccfjlaAbKGQ==
X-Received: by 2002:a05:6214:2a84:b0:476:feb2:f436 with SMTP id
 jr4-20020a0562142a8400b00476feb2f436mr25395612qvb.43.1660161730114; 
 Wed, 10 Aug 2022 13:02:10 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 i21-20020a05620a405500b006b89b9024ddsm530880qko.24.2022.08.10.13.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 13:02:09 -0700 (PDT)
Message-ID: <419bcc405fa4b298acb3f167316217bcca9f7c07.camel@redhat.com>
Subject: Re: [PATCH 0/2] Add DP MST DSC support to i915
From: Lyude Paul <lyude@redhat.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Wed, 10 Aug 2022 16:02:08 -0400
In-Reply-To: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
References: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com, jani.saarinen@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Btw, what's the plan for this? Figured I'd ask since I noticed this on the ML,
nd I'm now finishing up getting the atomic only MST patches I've been working
on merged :)

On Wed, 2022-08-10 at 11:17 +0300, Stanislav Lisovskiy wrote:
> Currently we have only DSC support for DP SST.
> 
> Stanislav Lisovskiy (2):
>   drm: Add missing DP DSC extended capability definitions.
>   drm/i915: Add DSC support to MST path
> 
>  drivers/gpu/drm/i915/display/intel_dp.c     |  76 +++++-----
>  drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 145 ++++++++++++++++++++
>  include/drm/display/drm_dp.h                |  10 +-
>  4 files changed, 203 insertions(+), 45 deletions(-)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

