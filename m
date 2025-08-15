Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96342B279E5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 09:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C8010E243;
	Fri, 15 Aug 2025 07:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DAI+7a0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370CC10E237;
 Fri, 15 Aug 2025 03:44:13 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7e8706df76bso227225885a.3; 
 Thu, 14 Aug 2025 20:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755229452; x=1755834252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CbV50UlUgsDMAydMhI9fr0dDw1OdFhDvioJbc7w73qE=;
 b=DAI+7a0webGAXoSwgzC5mOhmT3tfK1P2OHzsNFqdVzEXUybbUCUoPcJdn9ULlKMzKv
 AJf//+Gsi/JuM8S1oVwjQk5whcuxh/SqCqZG5iN3Xlmg1fDjUhN5HMPcBOi1NoMeMFSd
 v/1kSEys7ZE97cUBnA5mRNYbTf0Oef+WLvgGue7Uo3ETstgiszKIvk2Q3RuTPZEyzlNU
 oEvmWI7+RIL93nHvjyy7Lj+LtW9IGwDl6f+wmIwigZ5oo5biOYHtRT8t5qpVmhfLmTPF
 7J/WGs9g2bPLVQI9pq/cnMlAapLiOO/bXOTW41xKwhlnP1rBID9O+9b1jZaepNViDe5m
 5Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755229452; x=1755834252;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CbV50UlUgsDMAydMhI9fr0dDw1OdFhDvioJbc7w73qE=;
 b=pSw0SJchHLr5vLQ24FEKF9yoxo9rGfTSs9u4OBZq+KrAfvkGQn189lJ/Q3zpCILg/p
 O0g7VJ+4nGIpLzar9xrPwghEIi5OOIqTs83uh98r76z/P//YEB2WzDs4oauR7WtPv7fT
 ClbV1o9x34kcq9v24f2dPqIqOP7aXuOL3Ge76/M03BHYxec8QebrRJh6am1CIVLmm5p7
 JReePtwkYF9j1ifWB4BfdmDkyWr3K3LgQyPjBFiiu9mm0uozvmvur2FwNooyvX/ZWTlJ
 L32ATQKDLqfR2HPSmV+cWPUDcTWfxSIYBzKZKWsxFng/SwmnVzp5mkx4nWoE8iNNHAZG
 q3NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMMLEfTQUWBl20KXnQqW5pxHLnHQJJ1M0SfVjf6jk6/coMmqtwqsbusyQsGuIbEQPa18+MbpFqWV6U@lists.freedesktop.org,
 AJvYcCXTewbKeJhktBxZcXAEOEMe5jbC87lK6l2oM10qtJ4SS4E2r2zPj7INGIIl3+cM7/IFfpgRUb+Lh3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbbkgaI2ZsBjPr7iyhl9haHEclbHb0az/jGVD+/El63GeUiqIj
 POOV/4UKfS6ivxiKRUYTNyGACjdJV3Mf8mjWvhhBaCqE7l/L5CBR5453
X-Gm-Gg: ASbGncs0dS9L76MkdtTpf9rycVwCK6eJ2DU/InaGPo1hnjO4AH8TiztGDiFEUDlfzgA
 96dAsZhHQ7agnJO8DK28ebk9zM6AHA26po/4yt31oHG0y/LxKiTBrC7HilmqZ6DbQ/8s12Mno2t
 niDDt2kttWifDw1GL1mYhQsoX6Lerm7W1o10u724TfweNW9CN2uTqd8LM7kk+rznglTNXCL9vDP
 2sU1WEeSJJZluHOQo9zaVJVzHG47oEkMG6bbA5eYlbnwrG1CHJzPqo0ftiI/62J053gMUnj55xB
 rhPiyHUFOvgpG8/2VdqIOyc8u8y7Ac0RmQAR6qrqw2feUGI/GTBcp+rwI+KGXdNLjdrTWzqS6NY
 F/JzJYGhkw1c1rt88pKJfDIvnsyoygNfDqRw6B93I7DMCfqV4QySdXSW7CS5s+fFe
X-Google-Smtp-Source: AGHT+IGIGnDL5nu1a/uGIVA0/0RYDDU2j1ihE4igtwRQmfr93oe7iQrgSnBxskK5UThAEoo6WS7kew==
X-Received: by 2002:a05:620a:4001:b0:7e8:5aaf:700 with SMTP id
 af79cd13be357-7e87e023fe4mr63156185a.21.1755229452174; 
 Thu, 14 Aug 2025 20:44:12 -0700 (PDT)
Received: from [192.168.1.105] (c-73-176-204-61.hsd1.il.comcast.net.
 [73.176.204.61]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e87e1c9b91sm35794685a.66.2025.08.14.20.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 20:44:11 -0700 (PDT)
Message-ID: <2c238b60-39b3-4dbb-84f6-747769bd67a3@gmail.com>
Date: Thu, 14 Aug 2025 22:44:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
From: Eric Salem <ericsalem@gmail.com>
Subject: Converting logging dev_* functions to drm_*
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 15 Aug 2025 07:17:25 +0000
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

Hi all,

The TODO list[1] for the DRM subsystem has a task for converting the dev_*
functions to their drm_* equivalents. It mentions contacting the relevant
maintainers before starting to ensure your changes will be merged.

I want to update the drivers under drivers/gpu/drm/msm/adreno. There are
seven files that need updating:

a2xx_gpu.c
a5xx_gpu.c
a6xx_gmu.c
a6xx_gpu.c
a6xx_preempt.c
adreno_device.c
adreno_gpu.c

Is there any opposition to this?

Thanks,

Eric

[1] https://www.kernel.org/doc/html/latest/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter
