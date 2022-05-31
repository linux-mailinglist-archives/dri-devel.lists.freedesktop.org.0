Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB95538F23
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 12:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1429112848;
	Tue, 31 May 2022 10:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8E7112848
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653993678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R2UNEO31uIDnS+eg1ooOmtQNs+LHI85CW8KUuf0ZqU=;
 b=UHylVSi7x/VGaVcKvBa1fo9H2RCGViMg4vgqYu6A+HcLMnrYIT5qNnIVHEjvb7Uese8J2h
 dWTNV4wXVEIAfec55B8Jv8eKSbVd4pnpA0s0SMMOC0jGkUfnifxwjkOU0qNoJpomcDUXvK
 4XVvZo0hVKy3Yp3b+5KJMZbOEFaoKzA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-NlM6p-YTNwm6u3BLihdhrg-1; Tue, 31 May 2022 06:41:17 -0400
X-MC-Unique: NlM6p-YTNwm6u3BLihdhrg-1
Received: by mail-lj1-f198.google.com with SMTP id
 n11-20020a2ebd0b000000b0025567eefd27so5536ljq.22
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 03:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8R2UNEO31uIDnS+eg1ooOmtQNs+LHI85CW8KUuf0ZqU=;
 b=Pks0yDRrCzSrcn51e2DWPPrmA4/VN7UiamVcjPjOzXgDvmkcTkwPJa5clu6UtkvgDq
 FLHZ89TM5NLQFAyF/jyCMOq4YFFlNIDHkqefdJNYYDC6cWiOG9BwoU1ui/YbX7SuITpj
 qsfC2UhZ9c/k9BEg78LXjPx7IgGxEAVpxaC7jZU7wbyymQq6Yr/PMMLMRm0Pc8L/aj9F
 grltasjkHqYv6beLea+yR3gCblxMMnWgRKX95SX8YxGob3wWRPMVLpfrqLryV/1svRgB
 0bAvWna6RlZ45W3xOn30JYw0oWvPQEMijkXR9Ubl7ltt/fKFBhVjULm+p7ZtuQfBCuEg
 RvHg==
X-Gm-Message-State: AOAM531IaYqi+HGW0SrUcSOHlUH7ln27TiqLbk1pNJzagzLL6KyftRRo
 dOeuSN+3a0AmgHhk4yjF2JBEQCrOG+X+/wZxO33TGHm5kllSlWDrzmayhbHQXdeGLj87KzJ7P7d
 rEwsIVmy6UYAHqKmxsmMULzDBrcJ7
X-Received: by 2002:a05:651c:244:b0:255:32c8:dd42 with SMTP id
 x4-20020a05651c024400b0025532c8dd42mr13463308ljn.101.1653993675569; 
 Tue, 31 May 2022 03:41:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbC9Nps+I+h/84ccttRbB9ZLmDjLpYcB/e947O7taO6TGhDjIMxyCewlBNYeBdPXfiV+un6Q==
X-Received: by 2002:a05:651c:244:b0:255:32c8:dd42 with SMTP id
 x4-20020a05651c024400b0025532c8dd42mr13463288ljn.101.1653993675212; 
 Tue, 31 May 2022 03:41:15 -0700 (PDT)
Received: from [10.101.1.23] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 a15-20020ac25e6f000000b004788c118ddbsm2880298lfr.210.2022.05.31.03.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 03:41:14 -0700 (PDT)
Message-ID: <e80a72bb-df79-3538-0895-481a6b66849f@redhat.com>
Date: Tue, 31 May 2022 12:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <87pmljerpi.fsf@intel.com> <5423103a-3707-ba99-f45e-8608bc594bbd@redhat.com>
 <8735h6ex7b.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8735h6ex7b.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/18/22 16:23, Jani Nikula wrote:
> On Wed, 18 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> So how about: display_brightness or panel_brightness ?
> 
> This is a prime opportunity to look at all the existing properties, and
> come up with a new combination of capitalization, spacing, hyphens,
> underscores, etc. to accompany the total lack of unification we
> currently have. DisPLay_brIgh7ne55. :p
> 
> I think "display_brightness" is probably fine.

Interesting remark about the use of space/_/- I checked drm_connector.c
and most properties use all lower case with spaces so to try and be consistent,
I'll replace the _ with a space.

I guess it is time for me to create a v2 of this proposal.

Regards,

Hans

