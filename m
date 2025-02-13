Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3055DA3406C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACB510E00A;
	Thu, 13 Feb 2025 13:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LzT9+CY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3A110E00A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739453631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cC/vFoQ+yE0eoh/p5tg7XGgr8J4eWOR1b/RiNoMzMD0=;
 b=LzT9+CY3qFD3pflTWBh1SAt450OPRmBAqnTe0sBZ8GXCrSTBYTD82F+VXxDBLE4vXiLV2l
 8ZYDyYPsWrw9DoRbkLWpZnFNofsPo/vc0A3zcnREgecrpo31i5AevxznOWCaXGzKfUC+oK
 4xVzu9PntpEUJLgk92yhy0YAgsWqarY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-qSVsNfLTMoy_9SwHM9LHEw-1; Thu, 13 Feb 2025 08:33:50 -0500
X-MC-Unique: qSVsNfLTMoy_9SwHM9LHEw-1
X-Mimecast-MFC-AGG-ID: qSVsNfLTMoy_9SwHM9LHEw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-438e180821aso4671455e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 05:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739453629; x=1740058429;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cC/vFoQ+yE0eoh/p5tg7XGgr8J4eWOR1b/RiNoMzMD0=;
 b=B7G0vR8vnwCs/ul+SZANdTbKsyO1tppKANhPhADtnsiOaW1MtwAA4cdRdwrcH1uoRE
 EiRPVCmO1w3dBxyvD61TrQ51oTdXFG96xb9kagCactpATbDEx6k7ECpICkN6Btkz7ns9
 vuRO1Ya1qFK7jYgHSkS32W/UzxmK+Rf271BbFb5p3yF+KJmmtfosRj1+Tks//DdJ704d
 u7H5zepoU5JY+APW4K8pQBMEVaWtgJVUmBFqzta3hkMpCHQP1RvsiPDUBvLRPVhETgzT
 umMJNxS5gqQvZqPlCQ9al9bY4g2VVcp5YZbYmUKXsJ0fZoFuQkgCq0Sw6pnV5WEd2Pww
 zK6w==
X-Gm-Message-State: AOJu0YxmrpGP5upspDZwz8m5k047Tei5ODSgr+YRhq2fVnin2WJWT1e6
 pMWiu9ra2bL4/bQl3aVHi602RLQmCB3Wo4WrN00rScFhH1cHoHpEuX18k4fagzgf/Sq3L9EyQ6k
 jHz9BYxQ+enbiGxT5Bsq4ycCwOJX6orT44GF3LpxCiCzRFoei8Wcr4yx4q7pOBHzWqLEVkp1FKQ
 ==
X-Gm-Gg: ASbGncuCqEOmdxa9e5NpAqjFgqEYe/4Vgu0MFRBAcNjykav6uB/gtE8OaK2RVxc0xKP
 sUHVVtyYP7bA2w8zUaWKOHx/2PBkFQK1QKqrXo8XC5v3KE2P+Me+I300AJ/q7ZfTDcMTl7q3sLQ
 ikOUrmEickrmI+o+Bmb7XOSLuOMm/stqcHlY/FT83r8TwiH5BF1NEcILemsYV1gRD6cD3e5Wqt+
 VO9Q0A84moKcaBe2OHZ95S3URD4AUxFlZaVRTg/tTC3t5Nhp/fnHE+MC94SBMf3dYHj/Mc9sumc
 /x6hwmbuic8LPRtqYRcDXRLBqA2JGBtOoFQ8U6/C9Cz4
X-Received: by 2002:a05:600c:1c15:b0:434:a525:7257 with SMTP id
 5b1f17b1804b1-439601a116bmr33909685e9.21.1739453628845; 
 Thu, 13 Feb 2025 05:33:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVBRb6zZgmg1CNze/NeqPq0I7Oap4KBMUTa8jyt8/f52fK3jr+WMDdL0SspvvNyd/5wsFSNA==
X-Received: by 2002:a05:600c:1c15:b0:434:a525:7257 with SMTP id
 5b1f17b1804b1-439601a116bmr33909415e9.21.1739453628425; 
 Thu, 13 Feb 2025 05:33:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395f0451ffsm33278535e9.15.2025.02.13.05.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 05:33:47 -0800 (PST)
Message-ID: <17831399-4442-433d-a525-723871cbf15c@redhat.com>
Date: Thu, 13 Feb 2025 14:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jammy Huang <jammy_huang@aspeedtech.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: drm/ast regression, when upgrading from v6.3 to v6.6
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4l2ISdWXZzvbMdTJSFRzqGIM2HP8d7pEVGKZMygVsXI_1739453629
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

Hi Thomas and Jammy,

I've got a regression report, and it's caused by 
https://patchwork.freedesktop.org/patch/540015/
On this ast2600 server, the firmware says it has a DP output, but 
physically, there is only one VGA output.
Before this commit, "ast->tx_chip_types |= BIT(AST_TX_ASTDP)" means it 
will have both VGA and DP configured, but after this changed to 
"ast->tx_chip_types = AST_TX_ASTDP_BIT" and the VGA connector disappear.
The EDID of the VGA monitor is not read anymore, and a wrong resolution 
is setup causing a blank screen.

Of course fixing the firmware would be the best solution, it's not 
always possible.

I'm considering different options:
- Add a kernel module parameter to override the tx_chip_types, something 
like "ast.output=vga"
- Add a DMI quirk, to force vga on this particular motherboard.

What do you think?

Best regards,

-- 

Jocelyn

