Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47C525707
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 23:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9E210F9BC;
	Thu, 12 May 2022 21:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93A510F9F5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 21:30:19 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 137so5715143pgb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 14:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=BIPrJxqbXAd+295s29/rrMW5CvpwBx6wdUxINV63DAg=;
 b=Zg5truXSUHQKziPjOTc4E2O6KDJH+6qHbxL+9Law57qzVH6SVKpT2voeDHzzyvzj5b
 uggFLFxEqgtXYEb9pQplsYNKt0VUIvBSB/e/jlS+B4YlmJCuXVMoilgQjYogEfO1ShEk
 8oRI17+p6b147utmqg5HMg+CqdgII9RBkSRNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=BIPrJxqbXAd+295s29/rrMW5CvpwBx6wdUxINV63DAg=;
 b=WK99wiKWr2ooZvhe/5QgV2t480RfJv5jwWKfTgA4d2g7PGWDWJWyCDC+7+DqK2aaOF
 I8vWlBoD6q2l8u0Mz/HHqEou2HJQLGA7CiWwbILj1nwYZlyihhnKpWd8g9kneRqF+VLQ
 L0Td5HiiV1nZf9cJtrj1QPJsGUgLfkQgEcDfJ7XF85e2m5OnsCiQWSkXRNuqxElaDJjc
 +1WWY0EgxO18nSDh0NEOCDZY6U2Z2RXRpPWlDkmpMRtHickeIFgRy3RrPJQF6GarTVDd
 8VD8SlXXjwjwAQmDlFkvieVf5vmUOXim+aROu/i44TrXfPzh+ZuxedWWkWt98mo/RbG3
 Y4fw==
X-Gm-Message-State: AOAM531/DSVl/45t8jVUT+HSkyP8NVWS0ht4PrA51Q3+ojeHoTqqZIOs
 oKf5ttWXIe9xEDrjCdFlvqQRtA==
X-Google-Smtp-Source: ABdhPJzDDlG5ka/o2WcllRfswJSM7NjDXKFvt55zHZ+GNjiCVBiiEna26O0pZFz3O+Zji3jW2c7Ibw==
X-Received: by 2002:a05:6a00:c8f:b0:510:60cf:55fa with SMTP id
 a15-20020a056a000c8f00b0051060cf55famr1314141pfv.37.1652391019468; 
 Thu, 12 May 2022 14:30:19 -0700 (PDT)
Received: from [127.0.0.1] (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 q16-20020a170902edd000b0015f3d8759e4sm350899plk.167.2022.05.12.14.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 14:30:19 -0700 (PDT)
Date: Thu, 12 May 2022 14:30:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix CFI violation with show_dynamic_id()
User-Agent: K-9 Mail for Android
In-Reply-To: <20220512211704.3158759-1-nathan@kernel.org>
References: <20220512211704.3158759-1-nathan@kernel.org>
Message-ID: <DEB6A9AC-845E-4656-A596-E6341D3C287F@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On May 12, 2022 2:17:04 PM PDT, Nathan Chancellor <nathan@kernel=2Eorg> wr=
ote:
>When an attribute group is created with sysfs_create_group(), the
>->sysfs_ops() callback is set to kobj_sysfs_ops, which sets the ->show()
>callback to kobj_attr_show()=2E kobj_attr_show() uses container_of() to
>get the ->show() callback from the attribute it was passed, meaning the
>->show() callback needs to be the same type as the ->show() callback in
>'struct kobj_attribute'=2E
>
>However, show_dynamic_id() has the type of the ->show() callback in
>'struct device_attribute', which causes a CFI violation when opening the
>'id' sysfs node under drm/card0/metrics=2E This happens to work because
>the layout of 'struct kobj_attribute' and 'struct device_attribute' are
>the same, so the container_of() cast happens to allow the ->show()
>callback to still work=2E
>
>Change the type of show_dynamic_id() to match the ->show() callback in
>'struct kobj_attributes' and update the type of sysfs_metric_id to
>match, which resolves the CFI violation=2E
>
>Fixes: f89823c21224 ("drm/i915/perf: Implement I915_PERF_ADD/REMOVE_CONFI=
G interface")
>Signed-off-by: Nathan Chancellor <nathan@kernel=2Eorg>

This matches my own investigation into the error=2E Thanks for putting the=
 patch together! :)

Reviewed-by: Kees Cook <keescook@chromium=2Eorg>


--=20
Kees Cook
