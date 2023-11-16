Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D058E7EE1BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E310E02C;
	Thu, 16 Nov 2023 13:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5388610E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700142188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKySi+nTZnvhuJkFIal8zoJxCKY65UchF53uvgGL9d4=;
 b=QKgnNtiNN1WxxYF/wjzvfzyjlFivow17mZlXMhTRG7gm+J6R6x/phHi+niO/XzNqcI15s6
 gKv9cN8310OFN6qGT+z4OnEshmM3ZlrqhSp+7p+AHQbfoFK8/i/b+dVMppIK1dP9hTmcib
 o5r48VFjlUjGeKpqP2VxTnUPrGw72o0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-8tvzTaSrOUe3FlNPkcjfzA-1; Thu, 16 Nov 2023 08:43:07 -0500
X-MC-Unique: 8tvzTaSrOUe3FlNPkcjfzA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-50a73178b1aso837645e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 05:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700142185; x=1700746985;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mKySi+nTZnvhuJkFIal8zoJxCKY65UchF53uvgGL9d4=;
 b=cne46pJRvpNSdmvjogzUdS99jL9wFT1CbDEhDihBz2zXdc8NCPTwWomzkn7OMkrXa9
 /7ZS95CNDtrj+TFG5cA3+yoK9jKR45gGi7bUsmNOcYkcPkFM++CmhZAAAS4HqGbJot1J
 9VARglwt/p267w4fPKQTvyca7EIToIvQAtbPWAUdFeZQDerkdojMQ9rF2JlZVUPG1liq
 zf7D4dHfbKEIL1gQN7n5hIBiTvZYEAB8SuyH3LuZVHePaLfiibtyJawbJ91423RaEDVj
 LR6JNUQbSC0wPFf6CtnpsiXum2yEHPEZTTKg38EdtoHr6DkwprGw3y6UIGpEk/xRF1FS
 e+2A==
X-Gm-Message-State: AOJu0Yw380KE7eqqS6MoBKddRxaNcjxEo1DRUoqypQxLG38RIrzlqoWW
 Bhxdgg8XpirjRZyGx2z5401W64+ApSjSaZCy80GdvqIYCr+W40glU/TAYBOFcbBmXiVezX7XJ1h
 jZrEKOt990Lh62FqXL0vp1EZKSey3I8iqGB5h
X-Received: by 2002:ac2:504d:0:b0:509:455c:9e3d with SMTP id
 a13-20020ac2504d000000b00509455c9e3dmr1630662lfm.18.1700142185245; 
 Thu, 16 Nov 2023 05:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgwYDce6+ONyQc/rFN0SurC2BdO7q/zyBZwu8nGypsPiTmuW5s5HnzjQ3t8EEOx2OUC8bWDA==
X-Received: by 2002:ac2:504d:0:b0:509:455c:9e3d with SMTP id
 a13-20020ac2504d000000b00509455c9e3dmr1630644lfm.18.1700142184931; 
 Thu, 16 Nov 2023 05:43:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adff90f000000b0031fd849e797sm13679166wrr.105.2023.11.16.05.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 05:43:04 -0800 (PST)
Message-ID: <f5780fd6-ebfd-4fa9-afa0-412775c820c7@redhat.com>
Date: Thu, 16 Nov 2023 14:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Disconnect BMC if physical connector is connected
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch
References: <20231116130217.22931-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20231116130217.22931-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2023 14:02, Thomas Zimmermann wrote:
> Many user-space compositors fail with mode setting if a CRTC has
> more than one connected connector. This is the case with the BMC
> on Aspeed systems. Work around this problem by setting the BMC's
> connector status to disconnected when the physical connector has
> a display attached. This way compositors will only see one connected
> connector at a time; either the physical one or the BMC.


Thanks for the patch.
I can't test it because I don't have physical access to a machine with 
aspeed GPU, but it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

