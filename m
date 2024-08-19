Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FE95740C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 20:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035510E2AA;
	Mon, 19 Aug 2024 18:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nz/mWHlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2975010E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 18:59:03 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a7a975fb47eso540679466b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724093941; x=1724698741; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZhXaD4TmAYPGJmmjQn+4I4Uac9SX5K7718COKYqQjHs=;
 b=nz/mWHlECrCml9KptJm7THmAl293T196XMzT4YQ64Rm1jeaJEqj6Bwhah2cFyrU85D
 PovDLkjWACP+2FIu07GDZFSQuLqM7a46Kowp2+cLXqMuMqmvCcksFOGCmqePDuegfkxV
 aPS94mGIHYoLAx7NofAHSaM7PZf+f4omRS4ZOj/5qtDZAQRUBENO12Hg/ncTLbbZEX0n
 FrcqP5ZR9qZ45Dm1xLsqru8X6TMSlyAgtdGKd2dLo6jRT/pEwPISjkuu6WDUqSmswZUQ
 U0VM5PI7yh+igkzQ6SYP/KlTksSbplQXPsKLQR7jPkgr3vXUDbsAPaX4Gfhze4883Pj7
 HcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724093941; x=1724698741;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhXaD4TmAYPGJmmjQn+4I4Uac9SX5K7718COKYqQjHs=;
 b=NHqsc9WfUB0qqC/BTCV1+fLhFPiIAzZiXxOC0JkPr4SFn9Cykga/7SYLZPF3FN7In+
 JQONnijxP/CdNmXNXKpLPzh++d8pInNitB7uLAxNT0Uj7LjSKKwzQpMtzm5bo/KuSF0t
 v+oOoEWOlFCI+i/WUM2t1ZGOQrBdP/PV8kdSs/j5bWz6esJqrccnc4bbK5lp/TBkfbEc
 XITHe880hMCZ2VpT3m9c5PUI9jh1eUywrrXbOs1q1AftCmlZ1I+3KHiC3bzAyPL1yIk6
 o2MrgZtblEB1AFer1Aajkba2yA0vxat6vrvwk+hPNc9lI9HgESsmNrrtjtTuJs6KHEUm
 ECdA==
X-Gm-Message-State: AOJu0YypElFyBXk+xuUAs2owKkTgDP9DZX4EIrgbvZgGzKqKWLnROK1/
 kiOyeXId7lQuxap7wkfaXVf04tiudH9HzEcmBFacXGoJP59W6Yy1SX2T3GnC1yI=
X-Google-Smtp-Source: AGHT+IEJRGxbatmrLjd5LVKHSQycRAjwqUJEEY5fMV9vnlrMXeeU158H4xsRX/uxs3GdId5S/YxVtg==
X-Received: by 2002:a17:907:2cc2:b0:a80:bf0f:2256 with SMTP id
 a640c23a62f3a-a83928a5fc3mr912478766b.8.1724093941348; 
 Mon, 19 Aug 2024 11:59:01 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947151sm663359066b.161.2024.08.19.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 11:59:01 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:58:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] accel/ivpu: Add GEM buffer object management
Message-ID: <35bdf086-adc6-408c-9cc8-a342eeebf313@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Jacek Lawrynowicz,

This is a semi-automatic email about new static checker warnings.

Commit 647371a6609d ("accel/ivpu: Add GEM buffer object management")
from Jan 17, 2023, leads to the following Smatch complaint:

    ./drivers/accel/ivpu/ivpu_drv.c:119 ivpu_file_priv_put()
    warn: variable dereferenced before check 'file_priv' (see line 117)

./drivers/accel/ivpu/ivpu_drv.c
   116		struct ivpu_file_priv *file_priv = *link;
   117		struct ivpu_device *vdev = file_priv->vdev;
                                           ^^^^^^^^^^^^^^^
Dereference

   118	
   119		drm_WARN_ON(&vdev->drm, !file_priv);
                                         ^^^^^^^^^
Pointless check.  If there is a NULL dereference it already prints a stack
trace.  Also it's really unlikely that we're going to predict which pointer is
going to lead to a NULL dereference ahead of time.

   120	
   121		ivpu_dbg(vdev, KREF, "file_priv put: ctx %u refcount %u\n",

regards,
dan carpenter
