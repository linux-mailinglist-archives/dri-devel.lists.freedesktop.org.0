Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B37977DFA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 12:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB8D10E254;
	Fri, 13 Sep 2024 10:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AWCxEV30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC23710E254
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726224589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NU5yajIQnEj2Q3QY94nvypc9ldUu/HEg3yPMnHJgODE=;
 b=AWCxEV30RWfzeI8J8wkJySEVrcybojkazzekJpUZskqgxjA3QDFSaj2vr005SoO5HLGuf7
 UwaRjWdQyTcQC3H+96RC/6QCVU580Cgih19EGuTH2fhJk7UqAe13kdToU/l9UT0F274lH/
 lgagxbunlrKfEacTk79tk8wRrAdcBlU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-K4Tx4SJZO2KMh0T3B-V4VQ-1; Fri, 13 Sep 2024 06:49:47 -0400
X-MC-Unique: K4Tx4SJZO2KMh0T3B-V4VQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cceb06940so14689625e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 03:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726224586; x=1726829386;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NU5yajIQnEj2Q3QY94nvypc9ldUu/HEg3yPMnHJgODE=;
 b=uCTE4e0aQ2/ILS0eHKJSIVWDPmPhudXubt+udAXo385Nk63C/1O4u/xuLWuyjeWx5d
 b1+4kaqD4vsaWis5JnM8bCMn72BEQr1l5/NtF/NTlYkyTeL/aJPNWqxgG3zUpzmB/2Xp
 JRmSdNdPZzhZUDQxqVnR6biA0TUdlKe0OVxQJvo5JbnTI+dWsfZii8BwoiKQm6JnUWPm
 CrvZdB3juL4qAn84ngMI43uIXVGfUU86z9ejE+87rIhcdRwnGjpqomVe/7ufGb7z/JzY
 tQaHeMrddVWROmdoL6idUwKW5ojwRdlyE6y+3UW+GFHl5UFLCRACbI96uGKNugT8c2V7
 5o1Q==
X-Gm-Message-State: AOJu0YxdVOkhGe8WbprMROz7QM89QiFjc0MgB0zX1x4gSG9lFmAVTeHg
 sbTyCKrej/OS6xnkEwAOJ/+TlLXsVR0meLmFoN+ovjQz+Gx6GuolUrYJ7gpEdj/j3nw99M38f67
 yPgDyLEj0UYrYQaf2dQTGRmknH04LL3+DeT+saQ7P6WTx/IuvQVzVSyDB7bPTRaf6Xg==
X-Received: by 2002:a05:600c:2058:b0:42c:de9b:a1b5 with SMTP id
 5b1f17b1804b1-42cde9ba226mr40795875e9.32.1726224586567; 
 Fri, 13 Sep 2024 03:49:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH5cYMdrSTsy8t6HWauQsjdPbUC5rTNIbFXKL9MBaGxN5qzAm6CN3kyfSQp/cdaJC+6iyp4g==
X-Received: by 2002:a05:600c:2058:b0:42c:de9b:a1b5 with SMTP id
 5b1f17b1804b1-42cde9ba226mr40795565e9.32.1726224586045; 
 Fri, 13 Sep 2024 03:49:46 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d2a:6400:5050:48a2:62f2:4d16])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b054d2dsm20864175e9.3.2024.09.13.03.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 03:49:45 -0700 (PDT)
Message-ID: <23b1d4e3dfdbd05501385cc2b67da8901693bbff.camel@redhat.com>
Subject: drm: GPU Scheduler maintainership
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Date: Fri, 13 Sep 2024 12:49:44 +0200
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi everyone,

it seemed to me in recent weeks that the GPU Scheduler is not that
actively maintained.

At least I haven't seen Luben posting that much, and a trivial patch of
mine [1] has been pending for a while now. We also didn't have that
much discussion yet about looking deeper into the scheduler teardown
[2].

@Luben, Matthew: How's it going, are you still passionate about the
scheduler? Can one help you with anything?

I certainly would be willing to help, but at this point would judge
that I understand it far too badly to do more than reviews.

*glances at Christian*
;)


P.


[1] https://lore.kernel.org/all/74a7e80ea893c2b7fefbd0ae3b53881ddf789c3f.ca=
mel@redhat.com/
[2] https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/

