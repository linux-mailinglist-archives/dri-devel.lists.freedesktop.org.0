Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B583DB84
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278EF10FAB9;
	Fri, 26 Jan 2024 14:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5710FAA1;
 Fri, 26 Jan 2024 14:10:45 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-55a6833c21eso260111a12.2; 
 Fri, 26 Jan 2024 06:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706278183; x=1706882983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=SeELkD+ed1YeuurTRcsNoRMC9Atg/OsLtc3Rwqt2hPg=;
 b=g2sES3suZ+MdN1GtF2Rhntsdq5/BuO6YRqonZvakK6CdLKA+sxVNsqW/srvdvrZY7p
 g2FvZkwuz2H280HLtnTDNIS0pFtx7DIbFsZv6QYO1anLmsszYT/NftxEv5soi6URSOye
 Fdn6BxPG9Dwo822tLl/LTFnUL6c0a8h3sLvYc2QHG0gpRXo+RahLVufFi3eIVaPIUDoR
 sMQzRqzsrhg55h2xO8rwYC3iMgqI9yl+RLZT5Qpd28JaeQKZegtf/wiwA/elWBNXQJTe
 XK9+F7YwFcW/BsVwI7lAQy0xI8hEAAHtSTL9zA/FKGE3MRMxzZ6JdHMx5ILP/v+1yhhf
 NP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706278183; x=1706882983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SeELkD+ed1YeuurTRcsNoRMC9Atg/OsLtc3Rwqt2hPg=;
 b=ppq/pPrC6aw/lCgjyoOYYwcGZ4LNKYvv1ziKdSgZNaoV8VSZsFrGmdhxO6VBpZ6F4D
 VW91u8C8aKzui0kc7gDe8xlQQXlWH/CXCtglOrH8cfa4THc8GSQjNcw4bm1lisPcspdG
 ilgGHH7nSByCGl9x2PCTNDTvVPqkOus2r4OScQfPMGwrbhr9Yl3WGJmUvgawBuN0SwYq
 xv4R2iwnkigY6Dr4Tx87kKwL0RDv5j2zZhkLI5CtcqOQV+xgc33PRV5IdPtlbJmYVdEY
 Btbam8+Zjk2SXlZkuGmuQbMn/hnd8wS0RBpkVo7qSXvfFBT45Q9K0vn0G/C6yaOOaIbf
 PN/Q==
X-Gm-Message-State: AOJu0YwvgnUvwp+LJzRkwNmW7CMf9qC3w0ivbRTDB4cudkUNX7Qyzk3/
 OaOPKKh0G9/afoHrEuUVvM500gtxWtBSHz2keutYf4UOC8JL8Da3
X-Google-Smtp-Source: AGHT+IEFsmLEzG9c0fzzMGG2i2TxYbIY4GwnkhQD/VK4QBURfGDJ4PMFSPcxb6sBl0DuL/ytFROJow==
X-Received: by 2002:aa7:cb8f:0:b0:559:7dd9:a5b2 with SMTP id
 r15-20020aa7cb8f000000b005597dd9a5b2mr895018edt.16.1706278182504; 
 Fri, 26 Jan 2024 06:09:42 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1528:de00:74a1:34a:f78c:7883])
 by smtp.gmail.com with ESMTPSA id
 m23-20020aa7c497000000b0055c76eebbdbsm636427edq.30.2024.01.26.06.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 06:09:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Rework TTMs busy handling
Date: Fri, 26 Jan 2024 15:09:14 +0100
Message-Id: <20240126140916.1577-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

Hi guys,

so pushed the first few patches from this series. I hope that I
correctly managed to resolve the silent Xe merge conflict in drm-tip,
but would be nice if somebody could double check.

Then for the two remaining patches I've implemented most of what
Thomas suggest, e.g. the existing functionality sticks around for
eviction and hobs, but ttm_bo_validate will now try to always move
things into the non-fallback placements on validation first.

What I haven't done yet is to split up the preferred placement since
I couldn't immediately see an use case for this, but it's really
something we might do in the future as well.

Please review and comment,
Christian.


