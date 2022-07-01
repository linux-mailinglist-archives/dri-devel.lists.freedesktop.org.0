Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140856395D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1139E18ACC4;
	Fri,  1 Jul 2022 18:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CEE18ACB4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lD0UgE3dxvQIzw1sirJUBY/8o36UmN7hqjArgRHfL+E=;
 b=fvDIgO9fzccydrxYH1fmjcQuwU97JbiXUShqAzB02LxO7GBWUG5DASI4NIx3LJFe6MnDJJ
 FGhSU4ObnwVUt1Dnf8IEtbpZLzFw7plXi9s5r1/Fd9qQYKTGxTj91Ei7OdeeXj0tYN0grt
 2qNYD6TGp2NrBQErJqgiMYG8LRwFOnc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-71smLnfHOH-_aaJmZOlPAA-1; Fri, 01 Jul 2022 14:53:15 -0400
X-MC-Unique: 71smLnfHOH-_aaJmZOlPAA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b7-20020a056402350700b00435bd1c4523so2304902edd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lD0UgE3dxvQIzw1sirJUBY/8o36UmN7hqjArgRHfL+E=;
 b=cCyBhp4SUb1azKCVdP9OsoUAf5Ux+yOnw9loHRUDGQJQUt0EoFRR1PMi4Xev+d/5mF
 Ta4Swm14aWsCCf/5TOApDsnO5rWHIij5U/joCbRtlpSVOcX10Zb+OBhaMjOksDFIFDEE
 nsVdbXnVZaaFUq2g2dc2jPHtjGl73IDdcsNzlryGwP0BgfQcBPuj7RyumlnnYF/YlwHM
 VFfsNhhwMaAk/2RAdIDYkB5p4E9Y47kqHXyOwuryVq4Wl4as8JGe1MR8Xfjl4kY5qV+9
 XMFA3xIaL4ipWiZq/e0EiGymPVT/R5hpSsmrCtlfJE18/vFbpFdUeV6fn5KRJjKdQTvw
 ejqw==
X-Gm-Message-State: AJIora/klpmaiz4pyhQWqz5a4UwBlqh3yANoK+5llbxNnbQ5dbDoGVsJ
 gH/zJxxg6DiFRU2ZKvcIPED/9rvlRAgdp6gyumbAps8R4jnQ/guFBsP2MpmpiTxqgfoySAAWSWt
 BmFyRlWVPLYjgzRohNuLax+bv6ubX
X-Received: by 2002:a17:906:1b01:b0:726:be5e:7125 with SMTP id
 o1-20020a1709061b0100b00726be5e7125mr15735027ejg.678.1656701594156; 
 Fri, 01 Jul 2022 11:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpE4potQHDaod4k+BwhozruburD50UmURvnLAMEsNDMRIJU1naqj6jrZJomh6q2+TomW/yPg==
X-Received: by 2002:a17:906:1b01:b0:726:be5e:7125 with SMTP id
 o1-20020a1709061b0100b00726be5e7125mr15735005ejg.678.1656701593960; 
 Fri, 01 Jul 2022 11:53:13 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:13 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 04/10] drm: use idr_init_base() to initialize
 master->lessee_idr
Date: Fri,  1 Jul 2022 20:52:57 +0200
Message-Id: <20220701185303.284082-5-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701185303.284082-1-dakr@redhat.com>
References: <20220701185303.284082-1-dakr@redhat.com>
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

idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
IDRs more efficient"), let us set an arbitrary base other than
idr_init(), which uses base 0.

Since, for this IDR, no ID < 1 is ever requested/allocated, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 63395bebaa6b..cf92a9ae8034 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -147,7 +147,7 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 	INIT_LIST_HEAD(&master->lessees);
 	INIT_LIST_HEAD(&master->lessee_list);
 	idr_init(&master->leases);
-	idr_init(&master->lessee_idr);
+	idr_init_base(&master->lessee_idr, 1);
 
 	return master;
 }
-- 
2.36.1

