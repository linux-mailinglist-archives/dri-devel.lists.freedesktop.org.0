Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PFHAEf1ommG8QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:01:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA81C36A3
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7209F10E2AE;
	Sat, 28 Feb 2026 14:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="hkRhXkbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68710E2AE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:01:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso25946265e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1772287298; x=1772892098; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4DsAsZ47Hy1YLfVUDttBLQyIVj8duDK0V23RicKiO8s=;
 b=hkRhXkbDD4fwCR8YIkEtR3MGSvDi1WIvxar7EwWMs5LEQMi7ZNMRlT5ZOJR7csbFoT
 7jWiUkIlDvh4hOULPp3LjmdGt0t4MfmjXzrtnFa4bnq+sEKjb3auuYbNH1lh3fuaShQL
 cbEIF2lrVG4He21Ktv9nBtwubw2R+B+dV4DkX6NYXdb5GEkgCfanreXDd7mrp0CXjgJl
 2PNKL50MOxFXHnQmLNCToyY/owtfAFp3RvWHO8j12TBvlQSgRqFVycYE7iqANrNPSTh1
 vXxvzD7L4vjBJNgocP7TVKx5zj9tH9ebv+YB7vUYXTQjtkxjUkNeIqeIPCuNm2X0kDIo
 /70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772287298; x=1772892098;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DsAsZ47Hy1YLfVUDttBLQyIVj8duDK0V23RicKiO8s=;
 b=uSkeo1+y8sAtXycX9DGKnkC7m2cm+LttJrlv/AnfJqwDZP/bXAyxvAJy2B0K+9SNUZ
 qZ4zoSPAuM3wGH70YOIWxyjK5Tr/Q2YW0IFz8/D4IbpfYSsAQrebZW12qvImintwe8Ar
 wabagd3O76lC27hkVSEDJkEJ+jAMqcKLI4NESYzG04eJoRnIF9tCJO++px/h/AQLwZm1
 sWxQdv1Y3OwYSbkwrDWnbVh1rClUi8V2K5hGb9FgFP3SsEjess3wz5N8PifwlMUh5x43
 7zhqL/KNu+Jn2wn+5N2K3QhMikOjZrPt5nxvv6frU6P2qPF4mbwcR4I/ugigYHl4ZYwp
 CE5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOtWLZQ/g6u8GZS0tjGAR+BJAicOuJBnMNzC4USVRVFe6waaRCd0ZIKCf/Jr3G0ODINPEepJbGUYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqWn59ke3BZksv5lwi+KFGDUomRaAbwsIt0u+O/n++aUCwI3Hf
 Q9Qnhot6YY3yny/GUH44y2Vup2445+XEYbAPBtnZfWvXUSHUHZG2UanlHHbvJFvMbMM=
X-Gm-Gg: ATEYQzw701ZWeazylZUdQ4Yvittset87SyGIxLbfVZKnzZXhlCtbuWZuRdJMFvvbMzT
 L6kDa2NtCKPIVdvduTS44Sm4cNABP9d6MEU1KYbDt3IthamGBmukzteRK7gooW2ucUU+qEyygUe
 +W6MqNvmEq2WavMofOurY1vvFnTgzxTNYncBoXqq9MgVCS2Ts7yqhiok5apYUOZc1zfDaOntdLq
 HqQIoQYpJsUcEyfeOYNYtjp68Wi+ywO7DA1bpjzLp2sxMf9TaPGWBp8/389EtG/aktwD35avQwU
 McYfgTOSv9JI4xyzLSgFdAbL8EZouXP9PrdMciFcB1z0xl5Ye2Pequ+d8sMuc9OyA2GHzeprPkf
 boMj6dSFcVeNHvgju9rAcREqTDPfLeHmGKxv8skWE/acLNRgz8GJlSftm3MSm0A2N8mGMm00PoJ
 3Kth26id0gYeBsO3l6WqWFNERD6Dygfkv4OJsuKDo1
X-Received: by 2002:a05:600c:3110:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-483c9c23ffbmr100960715e9.24.1772287297776; 
 Sat, 28 Feb 2026 06:01:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb84e4fsm81020975e9.8.2026.02.28.06.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Feb 2026 06:01:36 -0800 (PST)
Message-ID: <49e7865b-f1e4-4e7f-88a3-31f2b05c9072@tuxon.dev>
Date: Sat, 28 Feb 2026 16:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: configs: at91: sama7: enable DRM hlcdc support
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-5-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-5-manikandan.m@microchip.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:manikandan.m@microchip.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:linux@armlinux.org.uk,m:ebiggers@google.com,m:martin.petersen@oracle.com,m:ardb@kernel.org,m:tytso@mit.edu,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Ryan.Wanner@microchip.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[microchip.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,armlinux.org.uk,google.com,oracle.com,mit.edu,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,microchip.com:email,tuxon.dev:mid,tuxon.dev:dkim,tuxon.dev:email]
X-Rspamd-Queue-Id: 5AEA81C36A3
X-Rspamd-Action: no action



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Ryan Wanner<Ryan.Wanner@microchip.com>
> 
> Add configs for DRM Atmel LCD Controller, Backlight and Simple Panel
> 
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
