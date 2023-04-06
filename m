Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8426DA022
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 20:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED35C10E06D;
	Thu,  6 Apr 2023 18:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD3F10EA1F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680806684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LOzVIpJJM6v7k5No2ia8gTr6fhScQxv4U9oi5fa7u4c=;
 b=ToWgKrAL7WvZBCuvVwZ2XZmaVM7vkkx7si4tS+gQR9R/fafMq0ye38lXmTcPddG9seMwe+
 CoClHHSSgqJE/4EULmMmlZ/1PSyxfdNMlpHSg8hW77Ask1EyRS+j2CYBhk2dMRIv+IYTnv
 8sR2G9feByQUNelHlknPsNH8Sn09dSA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-127qZ5c-PrWxrTBfwDGPXA-1; Thu, 06 Apr 2023 14:44:41 -0400
X-MC-Unique: 127qZ5c-PrWxrTBfwDGPXA-1
Received: by mail-qk1-f200.google.com with SMTP id
 n129-20020a374087000000b0074a2ff16363so6929342qka.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 11:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680806680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LOzVIpJJM6v7k5No2ia8gTr6fhScQxv4U9oi5fa7u4c=;
 b=gfq9uLt7zyYbCz8p68kU0gR/6CBuieoDsmDT+d7f0QGZT7dgiIwDA4PDkguz5CVC6R
 cu9HJYArBlIDUg+LmPh62xpXSlKvpIuzY1SXnatrQwWyoVsnHx+fVTubZQY62B3Un008
 WWaeXl5sJlH+AYkjUHLvevKFqW2vel6c1BNTuZZzLs9YuUQjVRQaJzRLSZHZGdv2T2FH
 EQ0iii+rABiO2RWy2/54vlb2EsLvVkZa/xz5cBlukS7KUA1ILsAESoZATM7fZCicRotx
 YScOwGScihTztBzGAm7/9DlEXlgGUJhLcF9gWtYPF2GNULLvWuygXG+iJ97Vx1i52t9P
 Srwg==
X-Gm-Message-State: AAQBX9eetstFXI3yD/ErSvgyVl+8pwVcVunFL4PnB8IuP6MS6+Yb9Hn+
 /pWjOANDOvX1vvckU/JSPBDVh1D01QBY7c8ubPcoeOQITSXPn+4M/VYIvvmnzZ4D+ExJT+xctTU
 EgHQkqCDwlfP9vkkv0R66otXSw0ap
X-Received: by 2002:a05:6214:21ea:b0:5e6:8e03:994e with SMTP id
 p10-20020a05621421ea00b005e68e03994emr271456qvj.38.1680806680521; 
 Thu, 06 Apr 2023 11:44:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350b2esvOM7SNf3mflCNYsRvsqb30rSrGo0KeUq5T2D+bFM8buWpXaMGtXaXNEy28BM83L3uLMQ==
X-Received: by 2002:a05:6214:21ea:b0:5e6:8e03:994e with SMTP id
 p10-20020a05621421ea00b005e68e03994emr271427qvj.38.1680806680099; 
 Thu, 06 Apr 2023 11:44:40 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 lb30-20020a056214319e00b005dd8b93458esm708436qvb.38.2023.04.06.11.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:44:39 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, nicholas.kazlauskas@amd.com,
 Jun.Lei@amd.com, Pavle.Kotarac@amd.com, chiahsuan.chung@amd.com,
 duncan.ma@amd.com, Charlene.Liu@amd.com, muansari@amd.com
Subject: [PATCH] drm/amd/display: set variable dcn3_14_soc
 storage-class-specifier to static
Date: Thu,  6 Apr 2023 14:44:34 -0400
Message-Id: <20230406184434.1956813-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c:100:37: warning: symbol
  'dcn3_14_soc' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
index c52b76610bd2..44082f65de1f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
@@ -97,7 +97,7 @@ struct _vcs_dpi_ip_params_st dcn3_14_ip = {
 	.dcc_supported = true,
 };
 
-struct _vcs_dpi_soc_bounding_box_st dcn3_14_soc = {
+static struct _vcs_dpi_soc_bounding_box_st dcn3_14_soc = {
 		/*TODO: correct dispclk/dppclk voltage level determination*/
 	.clock_limits = {
 		{
-- 
2.27.0

