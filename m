Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066AC2A467
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB27910E366;
	Mon,  3 Nov 2025 07:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kTkZBgrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D4B10E366
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:19:24 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-27d67abd215so382145ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 23:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762154364; x=1762759164;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o0HFTQsa219SiFwfMSsmBPJDLvHU+B5q0B3I9fdpwts=;
 b=kTkZBgrXOExamALigQwF8CYC7HRjQlIsOIrqsQZTk1wQYatilSsh3phNRALDbDwCn+
 UUtx79w7dK70svVbJKh3I29/0B4qcVWHnxzIUstjlkZyLFIfIqGpJruH+bqaAgSYm5nK
 wzANhXYIfbC+TeurUoWlo/CUeylPCvFrUew6qCdfYmTqg8jp/RZwgPKPDrbVD4q6MyFk
 ClsvAjrmTogcBa4diLoLkS+ZiYtkHQKY0fxl98UHN0rz4XP9ku1J6NhWlocbhR+M0Lxy
 0uGC2wolNISrNFJ4gq1ry6HwXcbkPJ2e7M3OvrkM3hkVLYUUnFiQIRURs6JKhOQdvcta
 ESWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762154364; x=1762759164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0HFTQsa219SiFwfMSsmBPJDLvHU+B5q0B3I9fdpwts=;
 b=q8Vrj9Qvnlc9AeMOQB1mSH/6K06JbCrEpEf+seoKfnFYdP2vafkFSBRu0j+lBHX/q/
 1xecUGL7OMhdIxGWbkTxIa5IWkKJwAlHYiFP9hSU8PboTxvx8wA7fLAIigsoENw6I7Ls
 BtU4Fk5grkzAqjoD1voR+0488++hTtThdRESpWjqTSAtSxpXmc81Ry0BLsF5dx4+tGkL
 QTJCWBGeYTPGEIm2GJLDnars3qk9x7JsKhHxSGDO0mhD1/RP9N1g+OVs7LySE4ac0KHM
 Ung6H6WStnhJqBY39KoDMYOZixYJa2rkJpMa02uNykoFixEnFJ0zyg1tMhvU5ixjufHS
 l/hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSFEGNLUVqYamgGz++V92YGwqKndswKYCBIeBIM6AMz41nmkXmOlP2YZOCTzWEpCNQwHXBnW7lrNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7BZhkmtEG0AEuJFkByUD/kswdGGGpdcjWDd021/9u2AwIhrPI
 QecPpWpXG9RGk05PJNAo6P7IMtr0QaO9CL1NncnZiaHt6oek2niJDmVxPOJGRGtCGw==
X-Gm-Gg: ASbGncsAUYie4PkulkB9nbhbKvTOjmas7dg7UpCxROY04NBGEVspHJq6KoPppD1ih3P
 JEvCYJfAFgT+548UNpayhr6i0AhC7KfamOj44EOPCRK2lqEcNHp7xaLWc3u/tfvKKNCM6WwLePJ
 hX8AS6ePy/PtY+quPJcRrvQnIantiZLf/Fm/LSFh0go6LPFePHz0JOWYjWS7hrg4Zwy3yGhUjIi
 hAZD9qfZD3cUSyd/SdcSN8hvOQTpZ19zMQX+Mr+Lk+M2jNUvZnUhc0EJ1V53jYFkZkYFxYlrGfg
 20Bg0G/RdwcvSVnmbPvQLq7DA3GYl00kWuNoRkRW5GVZrOmSwZCIX95eLESM3cPv5IAmVBG2gjz
 7+EW6edC+eVl7BrqYU9DjwAQzJuLFN6KJNAciy2SDIEO9d9eHSS6qUIZkrRHufN+jwo5dWfbHTH
 UfGt0spBOkqo+ohaBiD4t3cPoguYw5HF+zRHN1mgcxfPR2G5Q0
X-Google-Smtp-Source: AGHT+IHBQG+HPW97p+DH7DuUW/9lAGzWwwSGGkvrgXSHhhLN9zwUvIOn1ehyN1vXIvTruEG3QceI6g==
X-Received: by 2002:a17:903:228e:b0:295:1351:f63e with SMTP id
 d9443c01a7336-29554b86336mr7219425ad.10.1762154363599; 
 Sun, 02 Nov 2025 23:19:23 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34050992e91sm13497150a91.7.2025.11.02.23.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 23:19:23 -0800 (PST)
Date: Mon, 3 Nov 2025 07:19:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 08/22] vfio/mbochs: Provide a get_region_info op
Message-ID: <aQhXcaRDSXkmPuCb@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <8-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:22PM -0300, Jason Gunthorpe wrote:
> Move it out of mbochs_ioctl() and re-indent it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  samples/vfio-mdev/mbochs.c | 56 +++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
> 

Acked-by: Pranjal Shrivastava <praan@google.com>

- Praan
