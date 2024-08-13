Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55967950CCD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4EA10E3DE;
	Tue, 13 Aug 2024 19:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O++16lHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B4010E3DE;
 Tue, 13 Aug 2024 19:06:27 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70d25b5b6b0so4465888b3a.2; 
 Tue, 13 Aug 2024 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723575987; x=1724180787; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=q915GEeCcSuSt6ziTlUhp6/SFWCWlOkiSyA5qmWeTt8=;
 b=O++16lHw5ubwZ+pI1nLx/nhZIqFd5OJ39BcwRgcpoZTSsCTwvOlEGW2hdbmltiJOTU
 9lecya0A78JCBUQnavXPI+WquAp1qMiDvSklSLNvAxb0uw5g6qslMyk9i4mnDS2/ozTX
 TwkXjRpMPEDuwJQpge2r8pvLMXvu2GLe9eAT2tTW0wgxmNo1vGSBh6nwM8R4U8e+1dRW
 KeHS+e/KdOwSLHXVKK5DTi1xBGgvafJ6Q7XGvlVQeVYdykVQZseK8jtjs/3JY39UOXhN
 e37ZZcF6wnHvxs9fyeDTpHsl6rlX2S3XzThVD6Dtc+O1JRPQjP9Kqmnfq7rKs1lJWzJo
 jHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723575987; x=1724180787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q915GEeCcSuSt6ziTlUhp6/SFWCWlOkiSyA5qmWeTt8=;
 b=ldeq/jOI3FzRF+BvxOsXNCpFhspaAUc/8LrhlPD9AL14WMrRSc+boeHLKf7K1VZ/RF
 IMbDa3Vp7Tj8E6NycSrWZOuXmQ6ieRXFRYjwPMMi28GLXLcDhMy1XNU3FvDeV86XnQI6
 v+bBpHMCpJl3D0ZM9QeorkBIgRxiufQUfD4nouGjDqtyXRt3hLXWklZ6xpkoOdAvG/R/
 fb0+iO44k5S0hodEwU9LbHvilpRmhcBdnGPXcKrMkCCe4FFg162vRTAPa3aUX9gLAVAW
 wj0De39+fHaFs4e/9T5dEUCadFmKsPDsU3BoGEnMe2WCjhd5S9AINzcTyw1LsFRn+yNY
 JtmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjzamwqQc04QIG1SXtjxIothi89PxGrjB2O9otwT6dAvcrNwdXEkybxQNVPo8k+s771+Xhrm5PPTOeg+U6IcvRLFr8nSEws5OWPRRyKzQB
X-Gm-Message-State: AOJu0YxEF6354dX4IXtAqiO0jGGHB1LcU1dcH3QuE4AHO/HegMFJuqtZ
 W5cx4MMvtKQwaiPBlBxxSiNjqXWBq//ILz1nlOVxb+bLmWiD00G4
X-Google-Smtp-Source: AGHT+IFhYITFfi4gSb2h4Ht43ZMadC3xuRgU7/gYCRCkeLcissOAUoS91bw8bOC+oVQNaMObfrjjmA==
X-Received: by 2002:a05:6a20:c88a:b0:1c6:ac08:8dd2 with SMTP id
 adf61e73a8af0-1c8eae81393mr820403637.15.1723575987169; 
 Tue, 13 Aug 2024 12:06:27 -0700 (PDT)
Received: from localhost (dhcp-72-235-129-167.hawaiiantel.net.
 [72.235.129.167]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1cfd6dsm16760925ad.289.2024.08.13.12.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 12:06:26 -0700 (PDT)
Date: Tue, 13 Aug 2024 09:06:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 christian.koenig@amd.com, ltuikov89@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH v3 3/5] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZruusVfdGISuRggn@slm.duckdns.org>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809222827.3211998-4-matthew.brost@intel.com>
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

On Fri, Aug 09, 2024 at 03:28:25PM -0700, Matthew Brost wrote:
> Add an interface for a user-defined workqueue lockdep map, which is
> helpful when multiple workqueues are created for the same purpose. This
> also helps avoid leaking lockdep maps on each workqueue creation.
> 
> v2:
>  - Add alloc_workqueue_lockdep_map (Tejun)
> v3:
>  - Drop __WQ_USER_OWNED_LOCKDEP (Tejun)
>  - static inline alloc_ordered_workqueue_lockdep_map (Tejun)
> 
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Applied 1-3 to wq/for-6.12.

Thanks.

-- 
tejun
