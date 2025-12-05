Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76351CA6383
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 07:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCBB10E235;
	Fri,  5 Dec 2025 06:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KoZVnhr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983F810E235
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 06:24:08 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42e2e47be25so922622f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 22:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764915847; x=1765520647; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m+ej5+wE1Ajr3sib/dbFOmGytgkoVPV55nLX07WvgTs=;
 b=KoZVnhr5itSyEW4w6ony9dnUKVIQI/Uh/EdmgqOKgYLpQCzhGIgWSpAS4gMYc+byax
 D8G37Wh5zwQJWlng1cKMvHWzhBzoOGwPad+uFWDCsWCPpOlVuLxe96pINb6grU7cIbhA
 78a2HpIsngkZjRTDZP7Vo4zcvnjyWxsbHzUeari7WUHC/TUweugXRyLfd9qYziFWtOc4
 Ra2cYRYIY1S1Gii3a+8rYhRqlUsmzLx2BkaSWMKRN82riChleZPzTsH4jEKBtEfLkLFw
 WEHqJ15gsi0Aw5FBV3zm6sVY6LSZeEkLhZpv4C/rJhe4sDU3NR0pXEUe6oFWJbGkUIiU
 Z1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764915847; x=1765520647;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m+ej5+wE1Ajr3sib/dbFOmGytgkoVPV55nLX07WvgTs=;
 b=gZBB4+n56/L/OE6APN5EMWraicTIR9FVXpTkPWT/mBPRsmO9Qw5pR4gCIRBHOhJ4nI
 MA3jPw/ybKU2CC26BAM+nL0v7rtJBZSlQdpxci5kT/JzbDAB4LQ7n77B9J0k7gQhKKIw
 kXMM6rGeiVrVfIclUJtwhOVFsdGou4hRBQuayqxTK+rd72+R5P6M74qs0JFZrf/2UFwk
 8espdihTy6n2Z0XsOKjZOz/QjYtqgXZD7STLz3OPmRr/d0VgGNMZRSctYjU5E6cJDl1m
 4vlp2b6zLFlSs63qr8efRyeVcjymIq88ccc36dx0R57Z7Ky3cRs1xsvz9gwMZP8ODx8j
 b6mg==
X-Gm-Message-State: AOJu0Ywre+CNx9uem8MrKQxrI/0nQIhSkLBX06e8/eonWgpQi1Q33L/K
 8gsl05PfX/pTE8JI70RVj9Y+a1oJ2I9e/X2YekpnTg70/TVeNAakyNn8QiP4rrZYYRQ=
X-Gm-Gg: ASbGncubUWxwgm0h3eXKTvI8Pvv0MsiMq8h+7zL7sr1eOe1/kguBZru3hkCxzjKOHiu
 jw27Nl8Jbt1maQi5IM3gQO4BgHXOprERD/z2RraEcBzTEKjSHmjMghH98/rRo2eitEehRdh8LRZ
 gIIiO9WrB/8DdAsrRhQWQRhNRQKvdbSD1eKk+N8AWT0o5flGNW2y4ECV7+8HhXvlynVUFnLWava
 /BZwTqASPaqdREIG2E7k5w2PmBggBS3cB5bcDEhLpy5Shb68IPSOZlUyO8gCOflUJXj65RTizb5
 TTeCbII3Xi0OzEzYe0CW8/sDV/MbvjFt0yTv4/4d1qF/2zFIfU6iULG+ZHCvykiZcBlun55PWga
 jgzA6kGs7NdCSPEXFWlXMkZlO0FbXlaVZvwzcVF+zMjpkxf80PRMhDS+NWUNFaJvsIa50mg60D3
 4eeVQOnp0Du57Hk0AyBI7xJ1lEdj0=
X-Google-Smtp-Source: AGHT+IE5dQqnLKqWEiL7De7Gm0Pglxsn4dFIjoT761AWpdcwPoGjLTq5SQ4iRD6ipSXzBF4kslirtA==
X-Received: by 2002:a05:6000:18a9:b0:425:73c9:7159 with SMTP id
 ffacd0b85a97d-42f7984155bmr6081076f8f.33.1764915846872; 
 Thu, 04 Dec 2025 22:24:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7d3319ccsm6741716f8f.34.2025.12.04.22.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 22:24:06 -0800 (PST)
Date: Fri, 5 Dec 2025 09:24:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/colorop: Add 1D Curve subtype
Message-ID: <aTJ6gtiSoltXTFY3@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Harry Wentland,

Commit 41651f9d42eb ("drm/colorop: Add 1D Curve subtype") from Nov
14, 2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/drm_colorop.c:489 __drm_colorop_state_reset()
	error: uninitialized symbol 'val'.

drivers/gpu/drm/drm_colorop.c
    477 static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
    478                                       struct drm_colorop *colorop)
    479 {
    480         u64 val;
    481 
    482         colorop_state->colorop = colorop;
    483         colorop_state->bypass = true;
    484 
    485         if (colorop->curve_1d_type_property) {
    486                 drm_object_property_get_default_value(&colorop->base,
    487                                                       colorop->curve_1d_type_property,
    488                                                       &val);

Smatch wants error checking on the drm_object_property_get_default_value()
function.  We could just ignore this warning or I could add
drm_object_property_get_default_value() to the list of functions
which never actually fail.

--> 489                 colorop_state->curve_1d_type = val;
    490         }
    491 }

regards,
dan carpenter
