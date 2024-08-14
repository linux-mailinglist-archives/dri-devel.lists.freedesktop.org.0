Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E29525B3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 00:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C686110E2DC;
	Wed, 14 Aug 2024 22:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="E19Jb+xA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDA710E2DC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 22:30:22 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fd640a6454so4135165ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723674622; x=1724279422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CYU6CxH2Uz2B/FnYGmoLWU4ESLYRFSEUwvofd3Trumc=;
 b=E19Jb+xADlGl8eSq9DPDOvAi9o7FCkzOcxjV6FeRM1KKkClVYbolARMDoaNF2NyBpp
 f8/nuuhDrRwM+ntv8Bdiu3axMR+WXUROF77tmYHzvc6IUT8EwudYYnEriDXtAm33+/16
 33/h9UoWCax6kFpmeKkpp8+pAwirl1o1aGyDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723674622; x=1724279422;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYU6CxH2Uz2B/FnYGmoLWU4ESLYRFSEUwvofd3Trumc=;
 b=BNMtkHXDVSm/lkUEh6uaDaDHwwPz9mFracu10Op8ylH60KwVnGIhAIopFayKP9RFZv
 ioi6/yTifLG+2Nvwt85WrWXcHzxsy9esVDw1NI43+BPP19+HRBBp7vB7vrK75JkjUBQu
 WakPvT/EZyLS5GTx38tG3Xe1Ebdgu+zE4zJ5LZ8bQt9mDmijRfxJ86X2kWT9wdbTQopk
 zjcFfsMM3jhKn05XU2f8OVarqtdMmotE7pnGPH+gekVPSfCz7ZNHewvmxsbi2SEahtgN
 cmBqF4WVvp+lU7ty79HDqdTvT4qD507i2op6lfoLBwbYiUyIn8J3DyJAdfutmS7+s2AH
 puUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhllqQ1ztTX/e1Sq5Sq40FW7VqB5fhJEfwu0ozB8GxMaz66/njCIXD+DlY730tiV/WBtN8z+tBSXKpXTnhnA8Ac9s5/tjTWI0YMuc7Oy4z
X-Gm-Message-State: AOJu0YxnAJcE5w037Pv2Aa1zJleeuJ+P80T6rbv4R14W4voKd76scmIC
 GmdotBalcrD+S3KwsZehiVGjRnFkIaD2Z2sxuLS31pxeTus/x/iwwhe7KdCNvg==
X-Google-Smtp-Source: AGHT+IEMxr3zez02t+9RoMEBcsBOwW5JyM2yv6F4Th7Xc3ZptqlzM6/Ic9lOR9fLBY5UTNn7trkoiw==
X-Received: by 2002:a17:902:e743:b0:1fd:7097:af58 with SMTP id
 d9443c01a7336-201d638df2cmr49857855ad.11.1723674621766; 
 Wed, 14 Aug 2024 15:30:21 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f03a3607sm1162755ad.250.2024.08.14.15.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 15:30:21 -0700 (PDT)
Message-ID: <d9f35bfc-e0e8-4470-aea6-33cb29b06e84@broadcom.com>
Date: Wed, 14 Aug 2024 15:30:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/vmwgfx: Prevent unmapping active read buffers
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, stable@vger.kernel.org
References: <20240814192824.56750-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240814192824.56750-1-zack.rusin@broadcom.com>
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

LGTM.

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
