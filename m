Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7407780661
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF92C10E472;
	Fri, 18 Aug 2023 07:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E7710E471
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:35:05 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-53482b44007so483046a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692344105; x=1692948905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MJDQ0Q6umiB4bUJMycjG5tKNxnue/UQEaetlxWpI1pk=;
 b=Hxmj74KRaUDHF6LcLmGBbtwzqB6lmN9RiLrwyIIHVZxt4WwLQaLKfeFIloQ8hMirNn
 nzz5oY0Wl4d1vzj1IqM8ahl/SeVuHdH6C70QIsQNzNtTNPomp+qYbbsUri/0jmH2ZipL
 b5T6sUoTf/Rx/+zYgsKbUe/X/t3zzJchDhCVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692344105; x=1692948905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJDQ0Q6umiB4bUJMycjG5tKNxnue/UQEaetlxWpI1pk=;
 b=IETrvIUBUlf0PVnvmDz5LKRDlqdFTI+ssNx/inMiuB1sse29EG0Ha8CvCbgE6szVTN
 Wo2RqAlGlCdPDj8w9w05K57lgqtuYmrzgBNQ0cDBQKpvI3naAxmP2v9VZ2GF643m4Q1b
 0HEWlaE959d3IGp2rMP2PH4W4E6PsprfsqlE1R88kr6+23iDr8FnOI+nEvvsMdSBNkxO
 2EDDCsI7hvKktLHBhUvoVnLU3izPySDNz5jvHo1AEkoeF4/AcSe8psFKv0ZfDoyxkISi
 pEXHWPFF9YF5vNjRtCnvvLszWwtVWvDdjX1U2ULSWKpv1gLlh0UYXyNGHoQIpCeX8mnJ
 nvsQ==
X-Gm-Message-State: AOJu0Yyj9qRjaM46Y5bM0CFG5/rs8oe3p7nhZIj2s/KmdKiQHBb5DDjj
 4XjF9fB5hXTroYE+5Co+/4CnNA==
X-Google-Smtp-Source: AGHT+IGvdG/gnXY9RxmZ0hYWbOFJy3DD5ZavoDeTknPRN2tPGgKeLAEbYTLh5AMwXXhkdHOTuFLcLQ==
X-Received: by 2002:a05:6a21:338e:b0:13a:bed2:948b with SMTP id
 yy14-20020a056a21338e00b0013abed2948bmr2317093pzb.43.1692344105258; 
 Fri, 18 Aug 2023 00:35:05 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a62e802000000b00686fe7b7b48sm906041pfi.121.2023.08.18.00.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 00:35:04 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	jshargo@chromium.org
Subject: Adds support for ConfigFS to VKMS!
Date: Fri, 18 Aug 2023 07:29:25 +0000
Message-ID: <20230818073411.3414628-2-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, mduggan@chromium.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since Jim is busy with other work and I'm working on some things that
rely on this, I've taken up the task of doing the iterations.  I've
addressed the comments as best I can (those replies are to each
individual change) and here is the patch set to go with those.

I added my own signoff to each commit, but I've left jshargo@ as the
author of all the commits he wrote.  I'm sure there is still more to
address and the ICT tests that were writtein parallel to this may also
need some additions, but I'm hoping we're in a good enough state to get
this in and iterate from there soon.

Since V3:
I've added hotplug support in the latest patch.  This has been reviewed some
and the notes from that review are addressed here as well.

Original Message:

Usage
=====

After installing these patches, you can create a VKMS device with two
displays and a movable overlay like so (this is documented in the
patches):

  $ modprobe vkms enable_overlay=1 enable_cursor=1 enable_writeback=1
  $ mkdir -p /config/
  $ mount -t configfs none /config

  $ export DRM_PLANE_TYPE_PRIMARY=1
  $ export DRM_PLANE_TYPE_CURSOR=2
  $ export DRM_PLANE_TYPE_OVERLAY=0

  $ mkdir /config/vkms/test

  $ mkdir /config/vkms/test/planes/primary
  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type

  $ mkdir /config/vkms/test/planes/other_primary
  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type

  $ mkdir /config/vkms/test/planes/cursor
  $ echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type

  $ mkdir /config/vkms/test/planes/overlay
  $ echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type

  $ mkdir /config/vkms/test/crtcs/crtc
  $ mkdir /config/vkms/test/crtcs/crtc_other
  $ mkdir /config/vkms/test/encoders/encoder
  $ mkdir /config/vkms/test/connectors/connector

  $ ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/

  $ echo 1 > /config/vkms/test/enabled

Changes within core VKMS
========================

This introduces a few important changes to the overall structure of
VKMS:

  - Devices are now memory managed!
  - Support for multiple CRTCs and other objects has been added

Since v1
========

  - Added DRMM memory management to automatically clean up resources
  - Added a param to disable the default device
  - Renamed "cards" to "devices" to improve legibility
  - Added a lock for the configfs setup handler
  - Moved all the new docs into the relevant .c file
  - Addressed as many of sean@poorly.run as possible

Testing
=======

  - New IGT tests (see
    gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/merge_requests/1)
  - Existing IGT tests (excluding .*suspend.*, including .*kms_flip.*
    .*kms_writeback.* .*kms_cursor_crc.*, .*kms_plane.*)

Outro
=====

I'm excited to share these changes, it's my still my first kernel patch
and I've been putting a lot of love into these.


