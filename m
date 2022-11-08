Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50E5620C1C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECD789A77;
	Tue,  8 Nov 2022 09:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B416A89A77
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667899452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ev1LtHLql4VhpqjPl5w1VOGAGx4Tbyl8//+3ivWpfko=;
 b=JkfMy6QdHaqAsZMG1ue/oKUjGewbmGyAGEvxpXiaaToIk9au5VehIapXUjlT2v/6EdFHgw
 mm5K9bKwbhtmCuL4OUjiTdb7jsYwHSXfI/iuzJonJ47af/CB1+xOw+/wXqo1wiWfVijRMk
 cUVvct+uTn4GwcbPyE7OiiMnpw/KIT4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-So2SUPwNPNOcEVwmA12QhA-1; Tue, 08 Nov 2022 04:24:11 -0500
X-MC-Unique: So2SUPwNPNOcEVwmA12QhA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z11-20020a056402274b00b00461dba91468so9936791edd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 01:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ev1LtHLql4VhpqjPl5w1VOGAGx4Tbyl8//+3ivWpfko=;
 b=m2Xx0AxW3Ie4L2ACxjO81lK/T52negmAnx4V9NN/4rXcKxBYHs0j8LsKRJH6L1WOdt
 qsMny3l/uRajOXu2jhhrQ9jfB0gi0o5u5UVZD8yzmRwHeWqlWTPbr9+pxb80tNj5q/MV
 gTpJAVZbztIN7GdhdagCg8aCP5ES4m7FAGkhnDmrp7x1GL9dE+wztpUON4Rueh03hczj
 OYYr+trIaYP3um/25nm3qLI1CiL+XorQUKjUdxVaqJJZONr+CfLw3aWGqM23ktWBDpS0
 ZEoUKY/cEvl0WFa1Yirpt3dMKFo1NX7UCnJ+IJxYn9/gS+Co6s+dTAOeG38MtVC7b6A7
 BSiA==
X-Gm-Message-State: ACrzQf1o3H894w5TW6ansmZKJgwSUg8zSwgdvBdVN2+cxiT2VSzZXcSm
 BJaXpdkTCM/QrWuvwTME1lSLRa0OjIwoSrKSF0vRIe2KyX8b9/+ZbwJyXVHsKrtB7oDM5AQbHq/
 pG8DOGJtFIESsptfx7rO/49KDWlgL
X-Received: by 2002:a05:6402:204d:b0:463:153d:6790 with SMTP id
 bc13-20020a056402204d00b00463153d6790mr52362078edb.293.1667899450094; 
 Tue, 08 Nov 2022 01:24:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM72IGBEDbKKcVsaEFnn3qDLIezlF9deIqObpuekPa/nKiDGjxeVLEETRpcoR5ocxO4cctLsBw==
X-Received: by 2002:a05:6402:204d:b0:463:153d:6790 with SMTP id
 bc13-20020a056402204d00b00463153d6790mr52362061edb.293.1667899449797; 
 Tue, 08 Nov 2022 01:24:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 ky26-20020a170907779a00b0073cd7cc2c81sm4366879ejc.181.2022.11.08.01.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 01:24:09 -0800 (PST)
Message-ID: <1b0aa084-45ec-32e0-e425-94df04d32ba3@redhat.com>
Date: Tue, 8 Nov 2022 10:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Alex Deucher <alexander.deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: drm-tip merge conflict caused by recent merge of amd-drm-next into
 drm-next
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex, et al.,

I just pushed 2 simple DMI quirk patches
(for drivers/gpu/drm/drm_panel_orientation_quirks.c)
to drm-misc-fixes.

At the end of the dim push-branch I noticed that
rebuilding drm-tip failed due to a merge error
when merging in drm-next .

Looking at the 3-way diff of the conflict, this seems
to be caused by amd-drm-next-6.2-2022-11-04 landing
in drm-next.

I'm not familiar with the code causing the conflict
and I believe this is best resolved by someone who
is more familiar with the code.

Regards,

Hans

