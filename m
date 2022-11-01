Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2BC615608
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 00:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB69110E435;
	Tue,  1 Nov 2022 23:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD7B10E435;
 Tue,  1 Nov 2022 23:21:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso267765wma.1; 
 Tue, 01 Nov 2022 16:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxyxXUAbWcBHc9d21EGasKXnhPYfVJvAuFGJWn1enDs=;
 b=W4VJj2OxkzduLyb1JVdbRtO0v8jmkBqRu5rWTymTBs2xiND8ig1Kf6Dk6XCJ/2f9ep
 cQJzoRGlY6/DWX+5JYKcdKIHfr0JS0MdaBQyIDUhRd+FOJaZxF3pHcf2xbHChhlW4rty
 ILkUYe3cws4PsfmVl+bjjyCH5pdUl/TjK0Gb9vr9EHjpFN12YTCZePl8gviTuDyZCDK8
 0bez6hGXn81BQtpLrWRp/HB6XLFdulYs7Cg5evyxfNLJKpKuGR4tQyfTfrvvLO+6Uevh
 tYBaubwq+L0LF2LYlxCace4VZ7EeIJQm7yZYpxUbOkPwwXmHvp+E7J4lRV4blnxjtOVV
 JqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxyxXUAbWcBHc9d21EGasKXnhPYfVJvAuFGJWn1enDs=;
 b=5NkS54QtmgMnOEkyeJn501QNXMxxMaWSLduF56ZZeX67sd1orZcDWyt76hOBQdLMJw
 IKa2VeF/apN/pFUFypCvytbEl61fMKw7I5/n4s/Wg9u5CY0E7VuFRU8JpxsLwFQtNUd0
 fCAWl/ILrd6dcSW841t2yjuiJbX4BIzeVuEkw7Jx/iAJiKHu6687nN4rtWqf/gADVP93
 wB7IH56Eg3KbXm+/8sMhBheTh9zu60PSPNsPHj3fko7+7QnALrnc/dLqRjZNeC/fbUr0
 TxNTdExmrM7sQcBmzaXWp2yWlOdRMJRhQcoOxXBXp2omOqSBFXmXFMwBGIN1q9hA+2a6
 955Q==
X-Gm-Message-State: ACrzQf07C+HLir41rLf3IZKWU+Ux1NXzFdlzgVg0VS6Ps+4treguDtRt
 57mlNoxY+v9Bq5AyYsSDXg0=
X-Google-Smtp-Source: AMsMyM50e+QYw8SxGLXTQQSN/H4evMDT0wK2OPuH/ZtE+ylXd4szu1ziml/ktY5vD0j1TqS9pHNVkw==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id
 j13-20020a05600c1c0d00b003cf5fd21fd1mr15921329wms.8.1667344860058; 
 Tue, 01 Nov 2022 16:21:00 -0700 (PDT)
Received: from suse.localnet (host-79-43-11-206.retail.telecomitalia.it.
 [79.43.11.206]) by smtp.gmail.com with ESMTPSA id
 dn12-20020a05600c654c00b003cf537ec2efsm123480wmb.36.2022.11.01.16.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 16:20:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/radeon: Replace kmap() with kmap_local_page()
Date: Wed, 02 Nov 2022 00:11:53 +0100
Message-ID: <1942083.usQuhbGJ8B@suse>
In-Reply-To: <CADnq5_PP3VCXQ5rbC0-8Qsi5W7Ew87U_bRknz4=qxbrPxVQ+qA@mail.gmail.com>
References: <20221013210714.16320-1-fmdefrancesco@gmail.com>
 <fb0b7389-7121-04f8-176d-1ababe0ad8f2@amd.com>
 <CADnq5_PP3VCXQ5rbC0-8Qsi5W7Ew87U_bRknz4=qxbrPxVQ+qA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: linux-hwmon@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Kees Cook <keescook@chromium.org>,
 Ira Weiny <ira.weiny@intel.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, "Venkataramanan,
 Anirudh" <anirudh.venkataramanan@intel.com>, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bpf@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On luned=EC 17 ottobre 2022 18:52:10 CET Alex Deucher wrote:
> Applied.  Thanks!

Many thanks to you!

However, about a week ago, I received a report saying that this patch is "N=
ot=20
Applicable".=20

That email was also referring to another patch, for which I'll reply in its=
=20
own thread.

That report has a link to https://patchwork.linuxtv.org/project/linux-media/
patch/20221013210714.16320-1-fmdefrancesco@gmail.com/

Can you please let me understand why, despite it was applied, this patch la=
ter=20
shifted "State" to "Not Applicable"?

Thanks,

=46abio



