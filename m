Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE3IKnb1ommG8QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:02:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3B1C36D9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C8210E2B2;
	Sat, 28 Feb 2026 14:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="novUDjXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994D310E2B2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:02:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so34474935e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1772287345; x=1772892145; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sE4wHOtl4QFDYLaI8Z+N6cuSjBv02ee9bfXFs7o+Rlg=;
 b=novUDjXNin9+pEK1L6fiQpkc4mh3zwHswuhTtmHAP4q45kpHkw6tN+MXQz65s582cK
 SUk7GvFqEZyeInP25ptVLHEpN6ZZC5pTUDRhxUc2Nh7en+pgsHUYb834UZ3CuQmiDts2
 8R9dinDtNl1KhVZ4S5Dtu5y71l0L8Na6vjhprE3/sSAyKzezGr/vgNX0WMMhNRQiXEIZ
 ydLg+p7VKeZPiliRqqeDJNEWxVjzl84rUOeSgceSJlV0nSWebG6a4GLxRRHmUWR2rhb+
 acigOEMYkvbgteCvCX3awykIO+v8ugO5mU5t9OwK3rF/plSqzl3COI0m+wiUXOW8PsBt
 F40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772287345; x=1772892145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sE4wHOtl4QFDYLaI8Z+N6cuSjBv02ee9bfXFs7o+Rlg=;
 b=YHnYSltQ2ZDHsLUJmanZYSdwzuBLmilYdwaB6mxy8bSbc6YvW4yPXFdm8mcDuZC8wq
 eJMA5zjgCRiHOubRycSoHRxbaI/sF0JVQkT/ngtdKzrj2rITmZcmiLoGAn0rb/1fBHCo
 wGEsiuV3wWUKF9lTWNrKHSrUt7uYyKQjFUIDJzlE7jkOXfihfYW5Vd6gWavPynufw9i5
 0ydCuM247vIq15CuOaDo3fbD6E2ckAwdIgQodHWJkcr9p2DSNdBhn9ymrLbhAYdS2HJ7
 vS7qpT5c+WibdlC33Hi0abCsPyRp+Qq7GpvNihMGraSG9m/uVEd4c6Z9jZgmzaEAnans
 X3bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVVOynPgKgjiCHKP17UXIdCZtU5R4LawEPsDzZsRaZmWwnDgQWEGNwde01HcynmgkU0vkppFAJZug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc4Ft3mAB3KfetXzbvwcekEwwBsB/a2XVvoU+1DIJvAaSvtRqM
 nJv9xmDiWcupDtlWtO2oA1eJOz8DK0ui5EhUrNCS+p2bv7C+8XQakek0CUYf9kFz3Ow=
X-Gm-Gg: ATEYQzxeFS1Lv+hf0dWldKSI4cl0aSmqZdw/+U2slNQkc/QWOIeg7k3VJ2TOELtqBHD
 dhWwlV4/VsbUG5bY8/a8XsAR1DlQZJaajXsRbtKPbMCR21OpgcGRIHc9Vjriz9LdjYzLCDkyw8p
 j/jaiaCs5LxshLeGj3kZG5qP6rCDDkhtGcULGEiXM6Z6eivbO2ECDuLoZ+Ufp8SfB6tylyshOJ8
 PXCsOb1LKswKxnP6KWv40I+ew722q0K8ERAN9GyMijUCnIRP1PF2zfNuo8s82pEDmWqT90OCQS1
 pVd9pfp4+X8/+QM9Ne6G+1kZhNdU1DWLsB0NIp5Pn7PAipJA3n0ThXtjLFBbw2ETqs8Sc2JOQrw
 tt/FTpMZEnKW7GFvliaCJGBcqnqAjjuzDnwWj7J5mzcPq10CTg3/Soc7H5Pm909XE8CsTk0gzj4
 tO9HRrGhEO2pVPfKgWTAsre/b5TRCBwQ==
X-Received: by 2002:a05:600c:4e94:b0:483:6fc6:1e20 with SMTP id
 5b1f17b1804b1-483c9bc0291mr95806085e9.9.1772287345117; 
 Sat, 28 Feb 2026 06:02:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb789efsm144734705e9.2.2026.02.28.06.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Feb 2026 06:02:24 -0800 (PST)
Message-ID: <9b88e1e8-bb9e-4b79-b722-72eb66a9309c@tuxon.dev>
Date: Sat, 28 Feb 2026 16:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ARM: configs: at91: sama7: enable LVDS serializer
 support
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
Cc: Aubin Constans <aubin.constans@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-7-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-7-manikandan.m@microchip.com>
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
	FORGED_RECIPIENTS(0.00)[m:manikandan.m@microchip.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:linux@armlinux.org.uk,m:ebiggers@google.com,m:martin.petersen@oracle.com,m:ardb@kernel.org,m:tytso@mit.edu,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:aubin.constans@microchip.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 0AA3B1C36D9
X-Rspamd-Action: no action



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Aubin Constans <aubin.constans@microchip.com>
> 
> Add config support to enable LVDS serializer
> 
> Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

