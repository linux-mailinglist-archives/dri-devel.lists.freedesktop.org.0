Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7194E8B4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320010E084;
	Mon, 12 Aug 2024 08:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wb5w7ZsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C2210E084
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723451600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJ8d8OgEOA0fkg4NJTf/zsYw0k58Jv8qYMf7Ezn/m+Y=;
 b=Wb5w7ZsXdZHCNbhtBnRkJV2S43rcu8cqCfuf3T1d9cMt2XtEHTh6sayQLEm3/DCSlVa51s
 9KExEOFuolWMM07/G7qLXcazEkXnivCGCVrSx4XfIF7EovrcPWOmiqSvj23VEAU8SpvkwO
 lDHn2xZnbCOE5AUzAgw127SaTGsNrMw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-My9mexiSOJaegwC9DJRrzA-1; Mon, 12 Aug 2024 04:33:18 -0400
X-MC-Unique: My9mexiSOJaegwC9DJRrzA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a7275e17256so368226566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 01:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723451597; x=1724056397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJ8d8OgEOA0fkg4NJTf/zsYw0k58Jv8qYMf7Ezn/m+Y=;
 b=BqxYcRGAvybCvRN43qNzb5FdIPWeHZfz9wZBFjXZmq0vtyiiqcQhMAaVLOIeTrzTcP
 YBJV3blXhmb0bTz2E/4ZaImRBSdHqj0dR4vqpYYbsuRAXSJ1q0lkQxU3ucYtz+lYSbHN
 ByWJ07EAobLTHyKDrifutUtbzv+21xM5OfEXcZVHAvr4QJRUIhUkzbrWJkZwyCUpYjod
 5yjpWZNXW8O+ZRwiYjGvqyZ7gyLcgdtLDG13RgHQbBpljqlFbBLu1pj88HHpS6kgJ7pm
 GOQPo9p3ryt4FCjSkj3DKWjX36RJ/gxrXFH5UqVFK2t+dhcoyS7BTdrW6F3nwOp+arna
 4uFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIblDi3G4k2hNSNqTXjJLabi8EPTCfKvDGftDdmWio0AAkK860x5CYc5IJz//1yW9is+48Bncd9PsWa24W2s48FS6/jFEziYUz1hWkuBiR
X-Gm-Message-State: AOJu0Yz38+2FGSGUyN7UotGjArg2AeuvJrLCL7yxDqXj5GshldiREAlw
 qQPZQtrP05iHthcUQKeZVcN+00oucW+Q4CQbEbmziW72uHHTLKMRW5zJPTE4nlTkTw6oCXXabU7
 X2NTZgrrr1xdemNvkVXmoZQSHz07p3LxnRmM3d0ttuNyrCz+kJHPv3j75MyIR1sDU7Q==
X-Received: by 2002:a17:907:c892:b0:a7a:aa35:4089 with SMTP id
 a640c23a62f3a-a80aa594542mr616823166b.24.1723451596688; 
 Mon, 12 Aug 2024 01:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK0nBLU/MVTNoXatVis/dgwbEc+SNmcfw5FHlEcSXydiaoBuSEPGo7FAfPhCfum9qOBh24qQ==
X-Received: by 2002:a17:907:c892:b0:a7a:aa35:4089 with SMTP id
 a640c23a62f3a-a80aa594542mr616821766b.24.1723451596152; 
 Mon, 12 Aug 2024 01:33:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb1cd3d2sm209575266b.132.2024.08.12.01.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 01:33:15 -0700 (PDT)
Message-ID: <8dfa02e3-a603-40a3-884a-72c7eeef6561@redhat.com>
Date: Mon, 12 Aug 2024 10:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/2] drm: panel-orientation-quirks: Add quirks for
 AYN loki zero/max
To: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>,
 maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, luke@ljones.dev, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240728124731.168452-1-boukehaarsma23@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240728124731.168452-1-boukehaarsma23@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/28/24 2:47 PM, Bouke Sybren Haarsma wrote:
> Add orientation quirks for AYN loki devices:
> - Ayn Loki Zero
> - Ayn Loki Max
> 
> The quirks have been tested by the JELOS team and ChimeraOS
> who have been patching their own kernel. This has been
> confirmed working by users in the ChimeraOS discord
> servers.
> 
> Since there are additional Ayn Loki devices I have
> made separate matches for the devices.
> 
> Bouke Sybren Haarsma (2):
>   drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
>   drm: panel-orientation-quirks: Add quirk for Ayn Loki Max
> 
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Thanks, both patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have pushed this to drm-misc-fixes now, sorry for being
a bit slow with picking these up.

Regards,

Hans



