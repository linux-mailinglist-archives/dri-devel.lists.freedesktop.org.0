Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFFDA45FC9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753510E8E0;
	Wed, 26 Feb 2025 12:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="bE010mBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64B110E8E0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:53:21 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-390df942558so111585f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1740574399; x=1741179199;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FChbZi7hEyRH3sPEKkWNAf3ZipzQfOfQ78UqxR3608A=;
 b=bE010mBCqC1wgbOdeGaMJBiC16wOACSGj+7RMK4/a4w0Vn87f6QPjHMUJs04CO7gOt
 sF2QR7akR2QFP3jVMKboeIt6LApZK1fdlrIVGwbgReMpVe7dgZlrcYKpx/pBGXqg4hPm
 TJMg1urDyvBIgBc5CFtN9BG+MRHB4b89BWc5YLMxCu6k03kqeM9XjMyYR+4uQt+d+V1Z
 JgspIqVRW+8GV+wOn2Z1FqElkNJE+qGEzMYbaZIYS1ou8xNwmbI04ShJzMo2AKy8eQIX
 Ns8WbcfZswh8O30+e1FequGWG0onUbpK4Rhu6VHqWhELPweomCNJ50axVBh0DuMGuWPR
 1YYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740574399; x=1741179199;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FChbZi7hEyRH3sPEKkWNAf3ZipzQfOfQ78UqxR3608A=;
 b=RJd8XgCeFaXaBXD1reyoa7CGbjJXA6WvL8BAuYa9ZfkolVmrX1oc2c5MeV9f1A/Syy
 ALp0H+iIVmh8Gzbg+Qm59ucVaQHbKp0ftx0ipdXeKch9RfuM6PlcRW7x1U+J7+bDDPNA
 DSEAgjQ1w/SwbphAYJZ4oiXAnUXX9U91RoVZ4iHQTREW65dlvBrKb6jr3IVWF8QmzRNd
 ci7ppAWAxE6CGZsouHtdIswDk1r/fA+25Ar8A/c+gd1Dzy8XlDkMMp6+2ldOSliUxdKF
 WbyU6+EQ0TE4+uNRfeZw7D2RHyf/f8wMe0FSjBDD2laFW2Ae0Z8pJEmhy8u2vQSWQEpH
 4+rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxIw8noL46pwdoGY/6B8q9fuZ9Erlc90bzjfEQHjy7dBzySqvvl/zzLAI7ASChCHhNdcVmqdq/5lg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy58zwcOCeSpHKXOFvWvE0pFDxCQIgaM7rI3NCg4zaLAtFh3GWD
 CAkN/Sltdh/66NLqIFLWgc8ItZBtQh4mxu31SDuX/mG4h9iRyQGGpiVt41AaFTY=
X-Gm-Gg: ASbGncteO7FkutVFENFnlVBnC+vV6n+7V8lKh1+qeLrZmzP4K5n6gR5CU/qwiBVce0R
 7WcsrBs7KcrbrUx7fBCUebDCD2K29kLkvWK0r/xgTDEY01ODphXAPS7JsEVV10BCmvKFBXBg5wr
 9pXcjXvkQR7QLEciXH5JOqBSAkNu1COaK28HR/UbIHHAuJB9T9Gk5FCCziqj93+egwR+yqZWiPr
 UQ2flEVkQeNIQaDbUp0ydQ7qBQfdObdy96ceE6ELuMSNkz1m0PeY8HT2LIaxEPcxo5GFu5SLiNh
 80PV9SmPiGkf5FxF7mi7rAFGowTGMIOf1RmsTkzbfw==
X-Google-Smtp-Source: AGHT+IHupyv+JmfiSEbikU1CSpfUFR3pjv3R2U3p5qZGCSq+GKwCsSUNTPX8qBXwf0oFbKPICgsFWw==
X-Received: by 2002:a5d:5f8b:0:b0:38f:2856:7d9a with SMTP id
 ffacd0b85a97d-390d4f377c9mr2884499f8f.3.1740574398411; 
 Wed, 26 Feb 2025 04:53:18 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba549d6asm20206105e9.36.2025.02.26.04.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:53:17 -0800 (PST)
Message-ID: <25dc8423-0cdf-4f8e-964b-45d7ef0212a5@ursulin.net>
Date: Wed, 26 Feb 2025 12:53:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: Document KUnit expectations
To: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
References: <20250113101100.1373856-1-mripard@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250113101100.1373856-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/01/2025 10:11, Maxime Ripard wrote:
> The DRM and KMS frameworks and helpers gain more and more kunit
> coverage, so let's document what our expectations are.
> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> I'm not too sure where those guidelines should be placed. Is it the best
> place?
> ---
>   Documentation/gpu/drm-internals.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index cb9ae282771c..94f93fd3b8a0 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -206,10 +206,17 @@ follows:
>   	The configuration included in ``.kunitconfig`` should be as generic as
>   	possible.
>   	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
>   	included in it because they are only required for User Mode Linux.
>   
> +KUnit Coverage Rules
> +~~~~~~~~~~~~~~~~~~~~
> +
> +KUnit support is gradually added to the DRM framework and helpers. There's no
> +general requirement for the framework and helpers to have KUnit tests at the
> +moment. However, patches that are affecting a function or helper already
> +covered by KUnit tests must provide tests if the change calls for one.
>   
>   Legacy Support Code
>   ===================
>   
>   The section very briefly covers some of the old legacy support code

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

