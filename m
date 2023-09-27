Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E57AF74C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 02:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8766410E44E;
	Wed, 27 Sep 2023 00:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AFF10E456
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 00:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695773916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfUoRGmtmsURMuZ/ZaWqNBwx4yTWCRZeeYiles99YKA=;
 b=Kp6uqSi5E1bRz0EDYx2q4hoM0RJKjz+RmeyG2B2l2yuV/pA+FIh+qVfjpInyculMhMq6dl
 EwhZK5Npsn/YCp0mZKMk2BMxi8DZvvPfcHLiWqmV2QNm/jyrXc32LWY+U4D8L4dl7A2sHo
 rYgzCw1CcPca78lMqJGWeEjVCchPtlo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-N2tASe95Mqm5i0vaSS9P5Q-1; Tue, 26 Sep 2023 20:18:34 -0400
X-MC-Unique: N2tASe95Mqm5i0vaSS9P5Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9a681c3470fso803831166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 17:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695773913; x=1696378713;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZfUoRGmtmsURMuZ/ZaWqNBwx4yTWCRZeeYiles99YKA=;
 b=wpoAgX/130WlQS+++UrUkYZ+LYQl9rvD1FxbyLtWqwX6F1Z59tpNb9P+lQQ5tSD+Xt
 jGxZvj/tr2zWU8PbwUB5m9jRe+JPHnbvEJEczglgwK8m+g2uYDXQkUbyP6nTGntl/XMp
 R0GJenPLoY3rEHfM3IBiqLKSOld9iR/FOaynZrN4b5+B9icJgsJut/2GrGBHaOkIPzpU
 Rb0Fa6VTmiCIPzaCE4NamFxRsXOEW6XZVT+45p2oW3Hkyd+vdzZwY8Yri63sEWkUe7lG
 5hkY4MbV7N85PJ8mkeEqRPutChxchhCcQ9oyK9oWSDh6dkLRh84iAIriuNVRW2nUv2i5
 U1ew==
X-Gm-Message-State: AOJu0YwMp/ppNEsLpWEA+6EHqupIWzd6fRp0V3fkmCcAPT8BND0TlA/A
 tG9GBF+RTguCYAq1D3RozItanx3t3Fq6UMw1e6dAUp6pOe5J97z/YjSjTEZxP/Pe9i0PVYq3xCv
 nPoTelELBBqUvIjmNhvqG+8O3c1jv
X-Received: by 2002:a17:906:18aa:b0:9a1:e758:fc73 with SMTP id
 c10-20020a17090618aa00b009a1e758fc73mr198555ejf.67.1695773913373; 
 Tue, 26 Sep 2023 17:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+wIMu+OJK6/VompfluO9KYwsYp0o7+KpOhz1siwgDos3xBjAIZ2dWHdrm0YJEKFaJIu47TA==
X-Received: by 2002:a17:906:18aa:b0:9a1:e758:fc73 with SMTP id
 c10-20020a17090618aa00b009a1e758fc73mr198539ejf.67.1695773913005; 
 Tue, 26 Sep 2023 17:18:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a17090671d600b0099bcdfff7cbsm8369150ejk.160.2023.09.26.17.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 17:18:32 -0700 (PDT)
Message-ID: <2b062434-fcbd-de2b-decd-5000b63c2e6f@redhat.com>
Date: Wed, 27 Sep 2023 02:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
To: Luben Tuikov <luben.tuikov@amd.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
References: <20230924224555.15595-1-dakr@redhat.com>
 <312983ee-ba4c-477e-8846-072c815df862@amd.com>
 <f6294659-042d-46eb-ae6e-716a6c51872d@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f6294659-042d-46eb-ae6e-716a6c51872d@amd.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/27/23 01:48, Luben Tuikov wrote:
> Hi,
> 
> Please also CC me to the whole set, as opposed to just one patch of the set.
> And so in the future.

There is no series. I created a series in the first place, but finally decided to
send this one and a few driver patches separately. However, I just accidentally
sent out the wrong one still containing the "1/3" addition.

- Danilo

> 
> Thanks!

