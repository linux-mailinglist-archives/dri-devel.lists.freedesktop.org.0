Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C66605D2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED2B10E074;
	Fri,  6 Jan 2023 17:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3882110E074
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:42:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1585335wmp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SF53SQrAOIhnOIP9Z3ruAYaH2KIcIIShMI6E9kT1K18=;
 b=ac0gT5ApnB2FS4eP6E57gJEnGVCvVGmP/zlLrZw3s0r92f0q1+cq5wt7ZvyNBVHPin
 UyFFX9G9clxZjSLDBUEf8zq5fxob4lI2nF9snZdvuNzexWIYAzW6jaVCA+Y33aQ6G2MP
 UOs4Fu5mzju7Frr9cQD/hAmVbjj9c5yVw2WJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SF53SQrAOIhnOIP9Z3ruAYaH2KIcIIShMI6E9kT1K18=;
 b=kOEwohTES1LDNQ8Fd6iAiAxIWkG5HUMaHZpewLMZdCFxw1kpT5LVfB6IWyXmGnSoyD
 R1KRlo5qtXn2UnAsbpggR7PeebmK/OOjWBdd2/rzVtJ9T8N/wkkrgb2GzWdQajypwgqa
 nzgjoM4uU59JrAifl3JX9fqJLPq2exXUetZgKOk+HfwcPWCN2L9WhY6lBQV5KvcpBHzn
 R2r69qoWwFPLCCyn3y41a7tgMCNc92Owaak64oLexRDT9dYdM1VyHY7adgXTqdm3H1sX
 P5FZnb+T+sg9i4CyiVsSZogMdXglAesIK3w/SuupXKAnKjFDDrckAWaV/jX+MqN3ewZ8
 15YQ==
X-Gm-Message-State: AFqh2kpEKm2EqiH5o9/iCY9RZMYxZrLDA4j0Jz7wtVbcvHcNK+G2aUdr
 wdOFwttKt10IRdOBCPbcRZ8v1kjzGiQBIpQf
X-Google-Smtp-Source: AMrXdXtrgOjxv5E4d6wnv+BeDZQBC0BUCn5v+n8VJFdPfgjHt/pBaPdSy9T7ABOvZv406GKs2mB0mg==
X-Received: by 2002:a05:600c:5108:b0:3d1:ce35:4224 with SMTP id
 o8-20020a05600c510800b003d1ce354224mr39565048wms.11.1673026926752; 
 Fri, 06 Jan 2023 09:42:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a7bcc95000000b003c65c9a36dfsm2272477wma.48.2023.01.06.09.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:42:05 -0800 (PST)
Date: Fri, 6 Jan 2023 18:42:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <Y7hda7hjqI9SBC7G@phenom.ffwll.local>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
 <5d2ed13c-2317-bc77-68d1-ce3099382f68@igalia.com>
 <UBhD-Gmig3Df3ErqWGXZZ1hWkfdkPBywcckHxoKwwoc3N33Uf8rQumRw-nlsyrk9r8-KINUU8Evudytuu3lLcFnNZijSV3LbA0K8UVagpHc=@emersion.fr>
 <ccc74a8e-a7f9-7eb1-22b6-9bce60bdcdc7@igalia.com>
 <ukOECyKlhRh1kJyKRS31jhyXsjawb6urSVNYuLkOjRC15BbVEif1wANfPtHAjzLAirubEc8oGt56k6GsUjSSQYeDSbwq2uwYBFsvAAFMwXQ=@emersion.fr>
 <a958c1c9-680e-a85d-d373-57c7546c7fbe@igalia.com>
 <Zn2icOxZL4nAQSFhSBqEVhJyWT23ofYkl4NW4oIGs4JGMAT1GTfL6-K5QEGfEqRC9o2Ujg3zXGrAiLY7VRhS1OIqftCdUOXCPSd3wsS8CPE=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn2icOxZL4nAQSFhSBqEVhJyWT23ofYkl4NW4oIGs4JGMAT1GTfL6-K5QEGfEqRC9o2Ujg3zXGrAiLY7VRhS1OIqftCdUOXCPSd3wsS8CPE=@emersion.fr>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 08:04:13PM +0000, Simon Ser wrote:
> To be honest, your suggestion to put the check inside framebuffer_check()
> sounds like a better idea: we wouldn't even hit any driver-specific
> code-path when the check fails. Daniel, do you think there'd be an issue
> with this approach?

framebuffer_check probably even better, since it'll stop nonsense before a
driver potentially blows up. Which would be a CVE. So even better at
catching potential issues.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
