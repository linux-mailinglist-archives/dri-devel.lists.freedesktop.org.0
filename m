Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B66A56395B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2057818ACA9;
	Fri,  1 Jul 2022 18:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AFC18ACA8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TjW1zw6H6jOinbMWrIYyLw5n+NTsf3iSoa3+A/bO+5g=;
 b=FAIjlqWB/sDRW0umhGBcIOvvASjknmk1LTbycxO3bIZKkykT+bK4ZOmefiKXv6qFWSUjS0
 5ed6zX1RAdbdoCdMlOYHkrj8tOsbFDA8He08Pqj+YdutiCFQPLKqKExAnGsj+j3wfxtdSe
 +nEhVypumMh0Jb6s0m4ODPI+egMMF9g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-bKT43RjQNg6Mde6QvClrLA-1; Fri, 01 Jul 2022 14:53:10 -0400
X-MC-Unique: bKT43RjQNg6Mde6QvClrLA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hd35-20020a17090796a300b0072a707cfac4so1074131ejc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TjW1zw6H6jOinbMWrIYyLw5n+NTsf3iSoa3+A/bO+5g=;
 b=4GYgNU+eIVpVwRq6AsOhS+XSyh6Eq/mx3AoKvSelLZ3ms20tnAVE86S9BTvpTtFZZC
 f4Lz7b7JVORV62WkzmpAS12EYXjp6P9thdEAh/fx6fy1hw1kP+M8KZijt05KvILhd8oR
 J9bsKHHw9oe9zVk3HII3DjpmqMGIa95ebddVDDOcAG/mocJASQjW/RJC/ZCnplZkyIho
 7fd3xr3bRciTW16/TFI17Ybor2v+jVlW6Gip+cMnPXQodQvEecKf1lYwSTlMpYDzeemS
 51FXz8S3e8CmdpIU1zDAeKcA/hOd2r6iGEM9JreACsTLWsek3unBlqtWEM9rlHqWcvWp
 EtMw==
X-Gm-Message-State: AJIora8xV5ZyI8YALaoWtFHOWsaMNMM10RbIxmDbMaLUGl/D0qEcxLn/
 mzZCYaC3tj0XOq6ulM2CV7cClgNUCQTk/jWQLIF/T2th10tRl3TscIRKCVnEt3kdVt6HIb43NaA
 +Qcdoyh6r9u27s6ifB1sKuOfMLmVj
X-Received: by 2002:a17:907:94cf:b0:726:c81a:f30e with SMTP id
 dn15-20020a17090794cf00b00726c81af30emr15508806ejc.451.1656701589574; 
 Fri, 01 Jul 2022 11:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uCFTdcknI/LBb46OKwHmmwto0OOxNT9KHI001+nWTLFNj1eQ2gou+pJdNe+XnTE2Hskb7Yhg==
X-Received: by 2002:a17:907:94cf:b0:726:c81a:f30e with SMTP id
 dn15-20020a17090794cf00b00726c81af30emr15508787ejc.451.1656701589424; 
 Fri, 01 Jul 2022 11:53:09 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:09 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 00/10] drm: use idr_init_base() over idr_init() if applicable
Date: Fri,  1 Jul 2022 20:52:53 +0200
Message-Id: <20220701185303.284082-1-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

This patch series initializes IDRs with idr_init_base(&idr, 1) rather than
idr_init(&idr) in case for the particular IDR no IDs < 1 are ever requested -
this avoids unnecessary tree walks.

Danilo Krummrich (10):
  drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
  drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
  drm: use idr_init_base() to initialize master->magic_map
  drm: use idr_init_base() to initialize master->lessee_idr
  drm: use idr_init_base() to initialize mode_config.object_idr
  drm: use idr_init_base() to initialize mode_config.tile_idr
  drm/sis: use idr_init_base() to initialize dev_priv->object_idr
  drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
  drm/via: use idr_init_base() to initialize dev_priv->object_idr
  drm/todo: remove task for idr_init_base()

 Documentation/gpu/todo.rst              | 12 ------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 drivers/gpu/drm/drm_auth.c              |  4 ++--
 drivers/gpu/drm/drm_mode_config.c       |  4 ++--
 drivers/gpu/drm/sis/sis_drv.c           |  2 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c       |  2 +-
 drivers/gpu/drm/via/via_map.c           |  2 +-
 8 files changed, 9 insertions(+), 21 deletions(-)

-- 
2.36.1

