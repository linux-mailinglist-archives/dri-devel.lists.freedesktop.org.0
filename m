Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D12953D94
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 00:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E328610E54E;
	Thu, 15 Aug 2024 22:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="W/bQ9t+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6B710E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 22:52:10 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1fc60c3ead4so13628665ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723762330; x=1724367130;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CYU6CxH2Uz2B/FnYGmoLWU4ESLYRFSEUwvofd3Trumc=;
 b=W/bQ9t+b4AYB12cvI8sUI94lEr6VZAzawTL0INBBvfQMrie7zpo5Vj05aFLijwZFyv
 AFbLLwsL4yK+P4f3qoSvVPAKhnUo717hhBIPF8GgPCHnY8OhWxlUPqznhUALQkwadlPQ
 VmQ8qyZbWb9/GdP1t1aN1oS54eZ9z2esM0GZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723762330; x=1724367130;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYU6CxH2Uz2B/FnYGmoLWU4ESLYRFSEUwvofd3Trumc=;
 b=S7rVn5/0zG2Pjy5QhfJV7v5THh22APO7hcNTslxGBP/jNME7tcS3tkuvz/Y+RYQ5Fh
 9dc5t9DGZv+fKOLFjXbrdJBwHK9V3jbZG56PlQn92N2DTUaU3fzk1778H40P6smpOvy6
 kLxX3R/h/JGxXrxIzNQZIF02m8Xqg40+8WHwe8jvcJDjoiodSHJINj2bZOb5+vOEkHvB
 KdoifAJyal/YmHmrX0eNgHDT0L7yX0f0JpF3wNT8ePxk6zDA62rSy8mnkdLldXeTGxv/
 x0izWHXJ5fLqWYg4eQweopoNu4UR0LvlOF1H5zfWoWJP0/ltRZIouVC3/qPdr1PhRmTw
 KpLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmuw4yViyNdBQYFKfxTvBucqRofYTe2zQkDEppeCTCDR9tn8HGbtxcgz+2ptpN50G3BMxIlAi4egE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsTmhB3ev1XC9uka4Sif2HFD4rBtTjPbSq+J1nsI3y6w8rgn8e
 HgJnRYV7R1dx8DYXie9HlFeYVtbtOcwlAG4/2ZmqxLa1FLMZ4+N4kQODZvT/gg==
X-Google-Smtp-Source: AGHT+IFoXzdZ0LnPXw0CcmtZGwlL/hYChyGfUbp5CmzQ2zLtfbvysoQzI7hzeaFAGMMlFaW4C+dQIQ==
X-Received: by 2002:a17:902:ced2:b0:201:ffcb:bbcc with SMTP id
 d9443c01a7336-20203f082bamr17668265ad.39.1723762329798; 
 Thu, 15 Aug 2024 15:52:09 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f063ab6csm14750485ad.77.2024.08.15.15.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 15:52:09 -0700 (PDT)
Message-ID: <90fb16f3-f9f0-4541-926f-f4b620f3d5eb@broadcom.com>
Date: Thu, 15 Aug 2024 15:52:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/vmwgfx: Fix prime with external buffers
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, stable@vger.kernel.org
References: <20240815153404.630214-1-zack.rusin@broadcom.com>
 <20240815153404.630214-2-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240815153404.630214-2-zack.rusin@broadcom.com>
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
