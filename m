Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3074EC2E9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA35D10E9BC;
	Wed, 30 Mar 2022 12:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23E310E9BC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:03:16 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id p8so18506746pfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v0/H3G2XFiR4LVmAPedHiWgw4TnVBjO8kBG30Rx6UL8=;
 b=mL8TYadv8FwnRuRKoTITRg23I+zj3YpjUkS/HxsO1mXhazrpiNa/gQ9ZhqpLDQUrqI
 Y4H2jEfLUG4ejF2Bhyey9dkFvUs/W7aQIxqRp7nhurrbYn5LEk8qic5kstmJh4wXg7BW
 Vdk2mKx1nPOwuwOvdqhVdNM5wUN1AsyMVOeIItxhTubGPYT2Q8biMXZkuzyQGVRcL8TD
 vLAWHCkbUHL5ygmf5oFmiadYdSKWECmwoPmeze/QJEwdiUr0+MG7BhrV7gvPojJCLQft
 q9izu8XueDRFAoQOtCX/qStvq7xqphJMDjzgUjUwfkywmVU/2xgyEbSfGahUW3czat4F
 z9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v0/H3G2XFiR4LVmAPedHiWgw4TnVBjO8kBG30Rx6UL8=;
 b=yUCxb4vSB5SQyo5vAUVmpyIRmBC7c+/J+VclyBs9eNPNVLcB+T6hsDmsPDw5QCwMh9
 nUyOrCHIY3hJeg+m3Ws0IJ7rglpQwEuGzq4HgvrK0Q+S/3o72u3xiSwfKA5J9RQLYLAG
 rr8drZw3QKcCTA3TP+FUybdv6vyy6ImaZaUbm6s9jdxYmQWBRU28CuqZ/HykSAHowHF3
 PcoHybjR4Sp5p73M7FYbIDs9mSHDcJ0+q01SvyteWrdAoeorwXQwYAhi45rW5VyRGEtf
 Sxyq7pJUwGPosDAOkPoM+4oJV2jVOIZcfHZ/pJQlwxEJrethx3s3ZQce2HOTQNa5pBtj
 MQGQ==
X-Gm-Message-State: AOAM530hdrw01aRMwve6bpdWBLmY7sTnmRqw1Qn2/+hWevwoihkh1cgy
 Ly0OLO9WmV78YvxiBpibCOU=
X-Google-Smtp-Source: ABdhPJyR8BQ3qxaZE8/z/Z4rWYLqKvWludsfxnyPd4gxVs9v0cM5heIjKQAvYMUgNX8NERHX+rcSSw==
X-Received: by 2002:a05:6a00:194e:b0:4fb:32b9:dfd2 with SMTP id
 s14-20020a056a00194e00b004fb32b9dfd2mr19805610pfk.10.1648641796180; 
 Wed, 30 Mar 2022 05:03:16 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm23142978pfu.82.2022.03.30.05.03.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Mar 2022 05:03:15 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/5] gma500: fix a missing break in oaktrail_crtc_mode_set
Date: Wed, 30 Mar 2022 20:02:42 +0800
Message-Id: <20220330120246.25580-2-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yakui.zhao@intel.com, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 airlied@redhat.com, rob@ti.com, alan@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete. It
will certainly lead to a invalid reference to list itereator variable
'connector' after the loop pointing an bogus address at an offset
from the list head, and could lead to multiple 'is_*' flags being set
with true mistakely too.

The invalid reference to list itereator is here:
	drm_object_property_get_value(&connector->base,

To fix this, when found the entry, add a break after the switch
statement.

Fixes: a69ac9ea85d87 ("drm/gma500: drm_connector_property -> drm_object_property")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/oaktrail_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index 36c7c2686c90..eb2d79872bd5 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -409,6 +409,8 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 			is_mipi = true;
 			break;
 		}
+
+		break;
 	}
 
 	/* Disable the VGA plane that we never use */
-- 
2.17.1

