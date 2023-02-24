Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0D6A1FEE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 17:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F6089C83;
	Fri, 24 Feb 2023 16:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3607989C83
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677257125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=13svcAbhKsbNR6lcnWL8PecfM86J5HXpB/wTf6k/HJg=;
 b=f+DR6jFhaf67jhNig1RYv+Bq/sbFKD/Chy8vdUgbfD0y3DB+uoKs5KlqbFpwp6gjsc/g2T
 Jqe6mW6IOtzyj69UGag6+RJvEFNGMMhqgaIVbFw8qrOBDN8Qd4sA/l0ckwL4HG83DuxTG3
 JaObMBOrDiPeg7xGpXnAXRo3j5DrBms=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-UICiMAR1McCRS9N1MoxxdA-1; Fri, 24 Feb 2023 11:45:23 -0500
X-MC-Unique: UICiMAR1McCRS9N1MoxxdA-1
Received: by mail-qt1-f197.google.com with SMTP id
 k17-20020ac84751000000b003b9b4ec27c4so7017218qtp.19
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 08:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13svcAbhKsbNR6lcnWL8PecfM86J5HXpB/wTf6k/HJg=;
 b=ZDywxrIkrNSY4rSFR1B9osJg6IMIgn+JMGfTMDZlBte1/X6uVLw1rVCsIA2cnXIHAV
 xSaeu49G5sP7jLaNfYp2D2UE8Ve/fXAoiY0KG0wzqVQS4ZLPHiNK/EnhCZwCt28njE17
 Q0KsoTiVINpY5KcTOGeS/I0Rnl/oNAGXuF59/YzfH/zkrNXjXj2bI/5YQKBvaacvOeKD
 eQDoBiHSxZrz9fv8HOKpNC/9jWJAhrcJpbU6IdkhM8OidKTQzFnQ05odmSQCLfTh/UFl
 6/nQC/ptKI8MlKdpE41M29OjN7w8mP/IiNKvVzjpULaMq0XT6ucNXuQt++RXIr2t2tdV
 +W4w==
X-Gm-Message-State: AO0yUKXnF3QxdXbQsypItxVYhK8xiFY89dsdd20GXOzYR6CB0eGuRakO
 MjgI/7GQK+8rdUqhq82kW8UykIMYuBUAEGNgo5mqR8CiHi/w53juQV+q2MqZEVPRpfiJr6qzWtU
 D2DSDkl+crym9QR/IVLHaMtAhraiz
X-Received: by 2002:ac8:5744:0:b0:3bd:dfe:9c1d with SMTP id
 4-20020ac85744000000b003bd0dfe9c1dmr24611377qtx.59.1677257123552; 
 Fri, 24 Feb 2023 08:45:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9ab3tb8sJ9dHB9BnRpA5KhvlL1jf3eeYsfFKZ/ZRG9txC27LuVJrseS7PPvfb60RIOXh+Tbw==
X-Received: by 2002:ac8:5744:0:b0:3bd:dfe:9c1d with SMTP id
 4-20020ac85744000000b003bd0dfe9c1dmr24611334qtx.59.1677257123231; 
 Fri, 24 Feb 2023 08:45:23 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 oq21-20020a05620a611500b0074235fc7a69sm5506113qkn.68.2023.02.24.08.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:45:22 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, ruijing.dong@amd.com,
 Jane.Jian@amd.com, James.Zhu@amd.com, tao.zhou1@amd.com,
 sonny.jiang@amd.com, leo.liu@amd.com
Subject: [PATCH] drm/amdgpu: remove unused variable ring
Date: Fri, 24 Feb 2023 11:45:19 -0500
Message-Id: <20230224164519.2757173-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

building with gcc and W=1 reports
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:81:29: error: variable
  ‘ring’ set but not used [-Werror=unused-but-set-variable]
   81 |         struct amdgpu_ring *ring;
      |                             ^~~~

ring is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 213b43670f23..023a1fffa6a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -78,12 +78,10 @@ static void vcn_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 static int vcn_v4_0_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct amdgpu_ring *ring;
 
 	if (amdgpu_sriov_vf(adev)) {
 		adev->vcn.harvest_config = VCN_HARVEST_MMSCH;
 		for (int i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-			ring = &adev->vcn.inst[i].ring_enc[0];
 			if (amdgpu_vcn_is_disabled_vcn(adev, VCN_ENCODE_RING, i)) {
 				adev->vcn.harvest_config |= 1 << i;
 				dev_info(adev->dev, "VCN%d is disabled by hypervisor\n", i);
-- 
2.27.0

