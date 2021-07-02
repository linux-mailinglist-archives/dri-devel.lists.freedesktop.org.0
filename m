Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D83B9F98
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9AF6E105;
	Fri,  2 Jul 2021 11:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BC76E105
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:16:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id h2so12758830edt.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 04:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5G5lFbix6KHAeM9ieIwkzxcIOcvtjEUyMgHlwGnJ1xM=;
 b=sxhVXvpNqYjxwfr1K5L4ycS+t3JmKCRSyHnE+H091BpwGvr8Ll2jwH/nF/W2aPzZ2F
 kc2PWEC0nTTCUFvs2jKkEYPqIbvNaLkHY8PvXjo+Y+2atM7VYCNacJtnlaq9G9RYIc+M
 MDV/9r6KhfY9Spjm8TSmDoi7jYF5f9f91RdT1xbO7xgVWwzIZrejypJLifyWUVTcvYaT
 2V3rD954t1FNRm9zfZNrUwRQLQstB9G7WogObfeUmew34/k3aAMas78eI0tKzLD76KUb
 5bPU47rdmbxMkRu7H9qpuUuI0kjpjO2CQKeUsSFw2yVJZYUP0RpUz4cTE1qJZEHTrdAK
 x5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5G5lFbix6KHAeM9ieIwkzxcIOcvtjEUyMgHlwGnJ1xM=;
 b=lwfOmHJPJTh1lKp8zq0frlwEoqfwMuQyKb6AebIjA+hmvrkcQJ0QwVfsDSYEtm4R+4
 vrjCorF1o8ESe+ia/lKxWD0ogcr2CmPBS8qxWolFSYPeYOHhkI9aMnLt920SHmQsQq5Z
 EQdJqtRscYZpjGQBQo2sQBaesu9rSEXNuv5Fl9ZPR7tIq/XkDurib15UhkKj+BrkK+sn
 AfuTUmWlxOOA4jmngymNUoQ7Aw9BSdPcCGSMEWU7xHv5SAbFzDaVlT5L3lDf4sO8Eoq9
 WCXLZ2FksXxHcRLdGAMkgiVvOSxEeJ7ZQgJJbG3TpQzPV7Hjt90e9oXj04h6Mn1zDOoR
 tT8w==
X-Gm-Message-State: AOAM531ONQj8Qf/4RwggVz1t2OLIuj2rOsZNwjM4gQ6f4P12pC3ZHiPv
 cwXU+sa2Z3fc92Dei0ay21uxjFLR5Yg=
X-Google-Smtp-Source: ABdhPJyWmYGS1uLgLm8V9oD/Ikvcur2axX+sju9hY8IUcBtXnLu2zE4xF6lgF4yqRc9NaGwgZYnTmw==
X-Received: by 2002:a05:6402:28b2:: with SMTP id
 eg50mr6034546edb.320.1625224604619; 
 Fri, 02 Jul 2021 04:16:44 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9bc7:a922:a595:15bd])
 by smtp.gmail.com with ESMTPSA id g21sm937286ejf.25.2021.07.02.04.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 04:16:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: Start fixing the shared to exclusive fence dependencies.
Date: Fri,  2 Jul 2021 13:16:38 +0200
Message-Id: <20210702111642.17259-1-christian.koenig@amd.com>
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

Hey Daniel,

even when you are not 100% done with the driver audit I think we should push that patch set here to drm-misc-next now so that it can end up in 5.15.

Not having any dependency between the exclusive and the shared fence signaling order is just way more defensive than the current model.

As discussed I'm holding back any amdgpu and TTM workarounds which could be removed for now.

Thoughts?

Thanks,
Christian.


