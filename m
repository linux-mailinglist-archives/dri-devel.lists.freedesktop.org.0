Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B09423DD
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 02:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D24F10E5AF;
	Wed, 31 Jul 2024 00:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g5+eKgC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060C810E5AC;
 Wed, 31 Jul 2024 00:36:16 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2cb4c584029so3399484a91.3; 
 Tue, 30 Jul 2024 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722386175; x=1722990975; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=fbphnlhavq5cSuDvU9XbuNpAKWiecL5M2ABEBD8iQJ8=;
 b=g5+eKgC1qh99qceiuLNJ5oKtTYhYOf7M/STskAwtkXD94U6ZlHTb1vAJtWIvcKAf9A
 Z5vPgBP86A1Kqosr0cI9C1jtugPN6ygpk9qvvYbH4Dl0lmHSGZR+c3ms2FyWHYVgcEwN
 9AKqi4l4vHA6oFANrwnZLq0ESuxegzLwSwAIbL0Ag7Ap4dT35WFOHBBTcfz59LhEtueG
 O0l+dAoFKPOcGfnHpyQzSF1o+DZMvW3oGlAKgtanyWpMxSn0WINLDOdEa/eqUCJZF3G/
 07uTMJCV3c9zWzAbQJIUSxqDbmZKohuhC4e78aZfWDvS9CjO/MF7MEcsxPIp+XjiczpV
 d3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722386175; x=1722990975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbphnlhavq5cSuDvU9XbuNpAKWiecL5M2ABEBD8iQJ8=;
 b=fH7M4g8sVcLJMPb6PzDOgvX4joX5ZFbPf2DZQBXr0v/IaqULLJB3v349gx0Q729tMK
 hBDVagfkHs5vEk+H4MfIJtPla7zyRSfHks+YaX9xdRXRAm9SlsWV4Kk0CyUSte3C7Pco
 rw4/HdraHugH6Dmg4F7IxLDTAfAWIqPCUqM6dkyhlKjnCw9fiGUmLPNFg+f7NShEst0j
 eNFBK6BO1RtVAI/CEITu4llLhggdTSSIT4yl+yuUcaw899DweouN6QHKN7ZdnIMIY94F
 soCNXGaO4BDsHjrnzBAuBeeUQXQK3RPknU9S1Spn6Zw8dkTgcpgyJKg4Jyglgw2HINrW
 F79Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVXL9pqnWiWI+Az/KBDXD0oSAc/vdKKlltcT7FsZ8eh2mJUmQsFqQRLHbF4CcODs7ESUab+VOlUIMWlHvHTHByHjspsujIstj+hBXAwpxG
X-Gm-Message-State: AOJu0YzMz2SYRI4w/vcQ6tI3v6MTVtR/RaY+v3rqgawbMdirAKRivef6
 IWAXjiUIze9l9BQdNe/108bYyoTUKMVXW/DhZC7LjDSG9vB/mtDJ
X-Google-Smtp-Source: AGHT+IFCrqsBHFIFrlJDXHKp9UtwqpJ7XQ7v7u+LOGT2ozY+Tg1Y+819VdHY0UnwCVPax6fXKVxmpg==
X-Received: by 2002:a17:90b:191:b0:2c9:96fc:ac54 with SMTP id
 98e67ed59e1d1-2cf7e1a1f08mr10524587a91.2.1722386175362; 
 Tue, 30 Jul 2024 17:36:15 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net.
 [141.239.149.160]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cfdc42596bsm27763a91.3.2024.07.30.17.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 17:36:14 -0700 (PDT)
Date: Tue, 30 Jul 2024 14:36:13 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 christian.koenig@amd.com, ltuikov89@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH v2 3/5] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZqmG_c2tjKNAJWfh@slm.duckdns.org>
References: <20240731003119.2422940-1-matthew.brost@intel.com>
 <20240731003119.2422940-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731003119.2422940-4-matthew.brost@intel.com>
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

Hello,

On Tue, Jul 30, 2024 at 05:31:17PM -0700, Matthew Brost wrote:
> +#define alloc_ordered_workqueue_lockdep_map(fmt, flags, lockdep_map, args...)	\
> +	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, lockdep_map, ##args)
> +#endif

alloc_ordered_workqueue() is a macro too but would you mind making this an
inline function?

> @@ -4795,11 +4795,17 @@ static void wq_init_lockdep(struct workqueue_struct *wq)
>  
>  static void wq_unregister_lockdep(struct workqueue_struct *wq)
>  {
> +	if (wq->flags & __WQ_USER_OWNED_LOCKDEP)
> +		return;

Do you still need the flag? Can't you test wq->lockdep_map !=
&wq->__lockdep_map instead?

Thanks.

-- 
tejun
