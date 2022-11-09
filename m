Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C462214B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 02:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1478610E552;
	Wed,  9 Nov 2022 01:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7570910E552
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 01:22:04 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id h14so15351121pjv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 17:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X/7LWEJz0+L5ZmpQmdaQTLywAe07bO1jBNMRgwCToFg=;
 b=JC3ABDrxqqlvCMQDvshcXI7nRZ2IAs+p1gg9FcQkt4gMOI9VtHZp/D/ggc8GJnMbX3
 57F+7cto25IxlIv67TdOLlFXUpyGUJ8+EOqmQqRAtQvOBoQi58h9QNCO775JiLmnaA/P
 pQLrbKtIGYQLLa//xuwYo1MAQiTjan98e3oRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/7LWEJz0+L5ZmpQmdaQTLywAe07bO1jBNMRgwCToFg=;
 b=vha+hLrbtQtoWg8k2Po4VZA8ICgKqrHFUSKxKgdeQi1XLMe17LHvcX58wCMzNMK0Ku
 N2qRlcvY8sQxpqY7b4xiHnafWZ2WpUIGin+SBfVhjjxjrWwhrijbNV5KMcpbKyW77X+D
 1v/aKs3oFaQVGyOgqPMVjibnCnZF+CHZ/xD8bt0fpwexKu1SG5amB9pCN5hh2ecNmSdk
 HNk2uw962cC33V9R1K6hLmYcJf3c16aADDzG8ARYUh/ndQZsaLxc+zvZlfHqY6kEW9uF
 ftB4M4hq0VYhx0LwAkZkLN5WO9tvcCjDD9/9reAvuBX134k66pvZGQj90JFSalSiyy8Z
 jOnQ==
X-Gm-Message-State: ACrzQf2fVFAA+FvbweK1CsczbLlvzOwWEhaS+knGhCWs1f5vxQtYDT5Q
 ATJh7OP9e7JPpJSzZpBtAE16eA==
X-Google-Smtp-Source: AMsMyM79wV03PeOCgAWiXl4AktoLEnB0mGs99UWHXE5f72dWr3bJFMGh0MaQKuBmpYynGlRLpU9/BQ==
X-Received: by 2002:a17:90b:2393:b0:213:ecb2:2e04 with SMTP id
 mr19-20020a17090b239300b00213ecb22e04mr47944640pjb.100.1667956924038; 
 Tue, 08 Nov 2022 17:22:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:953c:d63a:4da6:1064])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b00174c1855cd9sm7545805pli.267.2022.11.08.17.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 17:22:03 -0800 (PST)
Date: Tue, 8 Nov 2022 17:22:01 -0800
From: Brian Norris <briannorris@chromium.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Move racy global PMU list into device
Message-ID: <Y2sAucYLR4FsGIfc@google.com>
References: <20221028224813.1466450-1-briannorris@chromium.org>
 <6e237301-9c30-a463-0f28-5279e655646a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e237301-9c30-a463-0f28-5279e655646a@amd.com>
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
Cc: Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 11:50:04AM -0500, Felix Kuehling wrote:
> While you're making the pmu list per-device, I'd suggest removing adev from
> the pmu entry because it is now redundant. The device is implied by the list
> that the entry is on. Instead, add an adev parameter to
> init_pmu_entry_by_type_and_add. Or you could move the list_add_tail to
> amdgpu_pmu_init and remove "_and_add" from the function name.

Sorry if I'm being naive here, but does that mean trying to navigate the
list pointers to move from a 'pmu_entry' to an 'adev'
(list_first_entry(), etc.)? There are quite a few cases where we're
trying to go between 'pmu_entry' and 'adev'. I guess I could turn that
into a mini helper.

I'll also need to scrounge around a bit to see if I have an amdgpu
system around that actually supports PMU. I realized the one I tested on
doesn't actually hit this code path... and this would be getting a
little less obvious/trivial.

> Other than that, the patch looks good to me.

Thanks for looking!

Brian
