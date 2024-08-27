Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975D1961604
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F9210E3F6;
	Tue, 27 Aug 2024 17:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FOCVvIpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6696C10E3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:53:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4280b3a7efaso50076115e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724781238; x=1725386038; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3YF7EgT5nZw0j8BCazHNQMxnmORgiIzugPZO1Gcodvs=;
 b=FOCVvIpCPBNRQuMPLGaWZB8zg5IhmRKjcJZiOcOBYeIGrKSPVxuon3SY0hr7BNJN5e
 2lLiJWH8WOoFGJBMu16yddz3RCEqTVaCcfcMSF9LzW88mYDzi1pJ6vuCJYQPGsQrBJYW
 WbnY0gaF5Sm3A6ksX2NmO8wc8zUWjaCPDGqGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724781238; x=1725386038;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YF7EgT5nZw0j8BCazHNQMxnmORgiIzugPZO1Gcodvs=;
 b=sMnc5v44aR9CvW9S5ktGigLVzeaYmyydlEOvM2aspzXcG3tO5aWeJhvy1b/nK7q17E
 5ZMceu4Op660DVhqAfr4wTLqooq0mNV1l6vXyMTLNQC29KNoCSGTScTfgTMts6jdt9LR
 iKdmvbhgo3PC0HvtEPx4hK3g7cvHnQ2I8XtlXbf/PYAZG3e9pLSqwD7OSQD/X2YzEkQQ
 +3W+2Bly52gwSQWI+2q38fisX0Vf4+pAM4ZWa2jvnz5sO/gHwxT8w+yB+supkf3iHmw3
 aHIOfuGSYRsHID4ewIfc4o13Io6CNk0hbW/vVJfh29Cwekg6tVwn2MU2jm+ET2CHI10p
 6sIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVts3Z1UMI1wKa/qp1/x1SwPDYPeU28XtdOfxXat5OOsVb6yMdym/JK2FfqYYNT/dDJdfy+a3c6bII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxca4nYGnGF3ChbN8ECCVXOvHM7fRnaQXlHXVGl8sDLbH0gQGZT
 VoypODY5ZqOBnbn3cRuYLZ9Y/6nKmuXQcFfkYehMA4kj+EdEXnYfvsbl8kEmAX0=
X-Google-Smtp-Source: AGHT+IE6HjwUs/o44Gx5IyoweD/mNYNinYWDy2KNULNWtiRULreZjSthfcHVLaT1ZVRMi4hUJ1L+9Q==
X-Received: by 2002:a05:600c:3b26:b0:428:f1b4:3473 with SMTP id
 5b1f17b1804b1-42b9ae1ee34mr24431405e9.26.1724781237304; 
 Tue, 27 Aug 2024 10:53:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abef81a5esm228948605e9.28.2024.08.27.10.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 10:53:56 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:53:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
References: <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zs4EPT1DR7OrE5X-@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König wrote:
> > Completely agree that this is complicated, but I still don't see the need
> > for it.
> > 
> > Drivers just need to use pm_runtime_get_if_in_use() inside the shrinker and
> > postpone all hw activity until resume.
> 
> Not good enough, at least long term I think. Also postponing hw activity
> to resume doesn't solve the deadlock issue, if you still need to grab ttm
> locks on resume.

Pondered this specific aspect some more, and I think you still have a race
here (even if you avoid the deadlock): If the condiditional rpm_get call
fails there's no guarantee that the device will suspend/resume and clean
up the GART mapping. The race gets a bit smaller if you use
pm_runtime_get_if_active(), but even then you might catch it right when
resume almost finished.

That means we'll have ttm bo hanging around with GART allocations/mappings
which aren't actually valid anymore (since they might escape the cleanup
upon resume due to the race). That doesn't feel like a solid design
either.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
