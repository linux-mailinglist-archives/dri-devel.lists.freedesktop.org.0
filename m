Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A250FEC5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0010F127;
	Tue, 26 Apr 2022 13:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5638710F127;
 Tue, 26 Apr 2022 13:22:12 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m20so15309933ejj.10;
 Tue, 26 Apr 2022 06:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1KRrAvUHtWqCbci+1kggznPLZmodpkw3cORPlN6NxAk=;
 b=ORNzmh3Avg27YBdlfP0CeDbOsgIQqfcwWLkDSlByVdgJjnO4A5xiRqnZPmmxT+foUk
 odZdVdTv6j4qqSu/imCR0FMSXeccJHJttEcY+sReFlQGLmeEQTnFjAP3sa1efkKMt4nj
 ViMKZXwNBh3bB6krRoTqPGy8kTGvqedcEoRVxXy7eylzYpZmBOjNyuVPE2T53DPMWoUq
 YUO3oQjU4qt5eu/Q53seIzsPYCdrkINrvaaNKsRitDPhb3fQvKvrRF7zTMBYmjTjEVE/
 20jPfDRTs1UzHIAMDL8xKYV1meENnRukb4qwBNb+qd6bXMExnATpMSW7Lhv5Jf7Zq5tI
 y/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1KRrAvUHtWqCbci+1kggznPLZmodpkw3cORPlN6NxAk=;
 b=hrXISOPpDRRUteoSsAkojeAB33qb+IrdL2CpdKfzavUggrtY8n1Ug0TSgzhA1Q8HhP
 OgE1QG8StzqjmZ22wpiRVmpMBxvv4NsbQsskuu75CYiOBfE7CW6Y5XJhA5qMcbCtveKp
 fnigOYR06O1J7ww9Q5wNiPk7yU7Yn2X0nvvisBS1RqTdP+tyrh04Q9I2zGWl17XSQSiM
 rMhckjWPRLYoOAS9tUZOLcEpEgAEfpJCIVfz1h7N371rG+DY13uzL3C71jIRPXFCQQRK
 lljSl5Apt3w0wOFUYYxZfRakaT8B+70sAQM3JLt12Uw1FQOvaSpSDcPNxpBMie8QhqSS
 weTA==
X-Gm-Message-State: AOAM531YIdj4lnoeAOe23J0EMgSHggDHNM+nmEXafNxySJYdcGfPGTIS
 blutZjdRfVgh1+YPZLN6wfNnPA2ILeU=
X-Google-Smtp-Source: ABdhPJxMFqnGqgGJE/SWDcREKSSe6Sh6Wz6YnkqkvEC7lFzDH1pf1Ze/+zgv73vHW5HB65yshb1W/Q==
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr21191396ejc.631.1650979330850; 
 Tue, 26 Apr 2022 06:22:10 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a1709060ee100b006e8a49f215dsm4889914eji.73.2022.04.26.06.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:22:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [RFC] Common DRM execution context
Date: Tue, 26 Apr 2022 15:22:03 +0200
Message-Id: <20220426132208.20801-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hello everyone,

as mentioned a couple of times in various discussions it would be rather helpful if DRM has an execution context component similar to TTMs execbuf util.

In contrast to the TTM component this implementation works on the GEM level instead and also doesn't use a double linked list but rather an xarray to track all prepared GEM objects.

Additionally to that an object oriented approach is used to describe the state which makes initializing and cleaning up the object much easier to handle (no external state, just use init/fini and that's it).

Since we now doesn't have nor need a linked list of all the objects to lock a bunch of macros are provided to aid driver developers to correctly prepare all the buffer objects. See the documentation in drm_exec.c for further details.

As prove of concept the new component is then used inside amdgpu to replace TTMs execbuf util.

Please comment and/or review,
Christian.


