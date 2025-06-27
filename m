Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6935AEB04D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DC110E973;
	Fri, 27 Jun 2025 07:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SwFPy6mF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF9210E973
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751010070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
 b=SwFPy6mFUwg1KaaippoRG6fCfJjL70lqzyfBlJSyXoWfUjriOhFk6vxr1N8Vnp3oGAV27j
 raA1YCRDL0Sfm0tK8i5y5/NF6PoeUWpshK/ABLIEq8MNRrLkf5kTK08Y4mdK9eM+RAa5z0
 WfGVwK+XuyDBCTTqzDnMrbhCTur9QCs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-uSOKg-qTN4i_u2e5vSJD4Q-1; Fri, 27 Jun 2025 03:41:06 -0400
X-MC-Unique: uSOKg-qTN4i_u2e5vSJD4Q-1
X-Mimecast-MFC-AGG-ID: uSOKg-qTN4i_u2e5vSJD4Q_1751010065
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso881072f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751010065; x=1751614865;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
 b=JA2lQKqwFjDNgVD2Jhv+9/7I6Bg6NeDDQvp5zpoUxmiF2yq9o2btOzBF2edWPFntS+
 2XJDY6R0afQsLO6WDW+m6z8EMC21BIt0v0GfdS+mo3KfRD18wYkx8vWnORGdIPMqXYFX
 LIMaovKQp4C9yzSxBj97HXf0YoEzdgItXIyiHMwaAKIgNeO5BzjhcsIq/fwBGrIto+3I
 XLXhG6gTeA15LGqBCCh/sCUKchIYGDGH/pi6Nlc8E9FXoiwaQc4EEPpPI37p+5FGylbw
 MjxVXPWHDDCuvYTb5zhpboyWznNwjj8FxUajghGI3hWy7BjaP5/msl1wnNMt/VCyfRQW
 hYHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmTZitm981fxkTKqHrxtUUV7SJddlVQ/yHYz5FxsNJEL7oXjKaBe5LJtPRPmBNnGHq6EJXRbDP1eU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4E8PR/wB15EepOLO21LkXV4jjg0r/JnDxSuXa8TE0CjS7izgK
 TBogrYTEPxKhuH8Nlv23ej0FpqCByeX0X3SBkTmT5Bqn7bkCi2QeTtms3Oo/8GEcdgjNo1ebhYQ
 R6MZvpCQkRpvHd2gCywIIn2/Hj/NVPa3Wuc5JNbX2Qo3mtSXEcBLpEgThUfMLMAN46U09Bg==
X-Gm-Gg: ASbGncu7c/vChxh7VgYbbHJAX/l4uOFQ3SiLr+IaZbkgb+dI+sZla3+G7htHjzzSy3a
 2u6SHqVBe7R/QA1wHvY90HLxlOuAf67QXibchm3MriUnynOEVNo8NzlGVbJpe6/02m3cSpu2PJM
 M3on87UdfB1yb37YQNknbrhhgCTZ+i54V+3IBI1gkWttyE3DpryJNKFqObUz9phyTsbZkkKZWMB
 LvUzgsTc7jZJ4QXR0VFEPfpputk3urIK28USMLqm0zjMTgT1bgF6SH4YGrkw3TCIdm/IR6aq3Ko
 06q0K973DeYff4TNcEpxpy/o3pfIlioz68NfXtSoZ6VSGu12JJseD4RGtzGsYrItBXhiScFqJke
 Wl/dK
X-Received: by 2002:a05:6000:23c2:b0:3a3:6991:dcbb with SMTP id
 ffacd0b85a97d-3a8fdb2abe0mr1344029f8f.12.1751010064956; 
 Fri, 27 Jun 2025 00:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETMdv3eRrEgFX+6vBwltJ/r+6ntnIOfFnB39tunb/PTwDz2TLiyLlcS2Z8MbRYWj+B7lKx0g==
X-Received: by 2002:a05:6000:23c2:b0:3a3:6991:dcbb with SMTP id
 ffacd0b85a97d-3a8fdb2abe0mr1344015f8f.12.1751010064572; 
 Fri, 27 Jun 2025 00:41:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7ec69dsm1911505f8f.6.2025.06.27.00.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 00:41:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge
 Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Weiss
 <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 2/5] drm/sysfb: simpledrm: Sort headers correctly
In-Reply-To: <20250623-simple-drm-fb-icc-v2-2-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-2-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:41:02 +0200
Message-ID: <87tt41d435.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HLRmrhO9FQXQwI8PfzFqE09OQGN6BbsD4huqYhxZqEU_1751010065
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Luca Weiss <luca.weiss@fairphone.com> writes:

> Make sure the headers are sorted alphabetically to ensure consistent
> code.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

