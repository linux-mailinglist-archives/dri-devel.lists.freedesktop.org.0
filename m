Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8615515916
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 01:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CBE10E0D5;
	Fri, 29 Apr 2022 23:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C9810E0D5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 23:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651275255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ar7bv9Ds/mGpliWhlGg7SQ2ekS3zcsAZNZU6PdnuDmw=;
 b=N0ABbmwn3aCdc6GUX7nD37wrBuqHoPW+62N49QasXolA8TxxlTmqiUNhf7wgJRNPnypU1m
 s6v8Qf+YL+Wf6NKMzvSu26Se4hJG5C8qGSBuRvoW1HAukwDCMkcVGlZzby7YU1DOoBubQ1
 O3LacJicZ/rdr/2TjCP3SI1wioNUWd4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-whMN2X-rM36FgEVsQY772Q-1; Fri, 29 Apr 2022 19:34:14 -0400
X-MC-Unique: whMN2X-rM36FgEVsQY772Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 p3-20020a05621421e300b004562c4a6b08so7050097qvj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 16:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ar7bv9Ds/mGpliWhlGg7SQ2ekS3zcsAZNZU6PdnuDmw=;
 b=xgsIjbDuCPkgu6w+DHpYWHOkJStMyeOYidOSWYblWdJWxU+Zipcqv29D0NUEiyUvPC
 edoTUd4QzzkHbTxV28mg3+hXR5sYmPzmrDHfSDzydfcoooSdBS/okIfXjp66qrTlly0J
 CqXjnJ9nmFsBU4L0FrhMDofTZbY579pYvdVmh6cJ52bSIWxPnpTuJq0xuqnLdS9jSoIx
 KNWsj2a0TAJRksPNV84gzW+Q5ee+YyWq2OVHVNdty/BDugtlhjDgo+qw3u0xq/1SrC0r
 VqSS/orekt0quzobmlZTJcacp0WKVC6KmN7UOdqd+MKaf3zs0hb2Y7RRXzKnCssJHTd2
 m4vA==
X-Gm-Message-State: AOAM530dIj2jTOBT0oFHaiaDux7IrPnvRVOazEjBEdUU2bGPqwuBxUft
 /EJI9C/3FCtRZqTud5bJzXBm8KI8WCoip1ZAOdeHpvO2m7N6w2cQ3WQujgnWsJDccYazkQB2ATX
 TFSB/VnNm+MwlbAs5WKq/lnC5ZmE5
X-Received: by 2002:ac8:7d8e:0:b0:2f1:e909:7a1 with SMTP id
 c14-20020ac87d8e000000b002f1e90907a1mr1661744qtd.385.1651275253944; 
 Fri, 29 Apr 2022 16:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv1TxrZ5KpYRhFdGoRK2qJPMaRJPy/bi7ZrHm429iJA0C8uCsr28ut0P8esRA+87kLXtTYJg==
X-Received: by 2002:ac8:7d8e:0:b0:2f1:e909:7a1 with SMTP id
 c14-20020ac87d8e000000b002f1e90907a1mr1661729qtd.385.1651275253738; 
 Fri, 29 Apr 2022 16:34:13 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 i13-20020a05620a144d00b0069fc13ce253sm307715qkl.132.2022.04.29.16.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 16:34:13 -0700 (PDT)
Message-ID: <5615f5c31fda5e9faaa9d3e4cab7fb23271ec745.camel@redhat.com>
Subject: Re: [PATCH 0/3] HDR aux backlight range calculation
From: Lyude Paul <lyude@redhat.com>
To: Jouni =?ISO-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 29 Apr 2022 19:34:11 -0400
In-Reply-To: <20220426123044.320415-1-jouni.hogander@intel.com>
References: <20220426123044.320415-1-jouni.hogander@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cool! Tested this on three different laptops, and it seems to work great on
all of them. so, this series is:

Tested-by: Lyude Paul <lyude@redhat.com>

Would review, but I basically have the same comments as jani

On Tue, 2022-04-26 at 15:30 +0300, Jouni Högander wrote:
> This patch set splits out static hdr metadata backlight range parsing
> from gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c into gpu/drm/drm-edid.c as
> a new function. This new function is then used in admgpu_dm.c and
> intel_dp_aux_backlight.c
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> Jouni Högander (3):
>   drm: New function to get luminance range based on static hdr metadata
>   drm/amdgpu_dm: Use split out luminance calculation function
>   drm/i915: Use luminance range from static hdr metadata
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 ++----------
>  drivers/gpu/drm/drm_edid.c                    | 55 +++++++++++++++++++
>  .../drm/i915/display/intel_dp_aux_backlight.c |  9 ++-
>  include/drm/drm_edid.h                        |  4 ++
>  4 files changed, 70 insertions(+), 33 deletions(-)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

