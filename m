Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F53DC49F
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 09:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69376E5C3;
	Sat, 31 Jul 2021 07:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0757A6E5C3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 07:52:05 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so17859106pjd.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNinOfUJINPcfdOxhYvsgsalnU1GKLpLDBpG0mAohAc=;
 b=TL/nDTwV7Ph7kC1oZk66wjgapAmGIuuvxKdZnyb2id6PMHXk3i4RURbvV6vN+GabZ0
 5nKC4XMdjCnAQdmdM1bcAxlR9PIybYesEm8AYOmglzQijYZkBb2VyLlLvLH9yYsbTsxK
 0yYvZVJMCN63zzu8VGgeKdHRVKCL470JVoFALEkpn7OJZaMW/ahykXkU4zwNGT5k8Tv0
 6/S0ja07q4MoAw3FheqVo8DTllRy/nT4EoMa9q6VINztElQPFRVb29cccLjZbzjSJsZR
 eRQmfcJ/n+nCYCVe9b+BWYBJ1LgV2iHr85HIMojw7mv+BhnuuR98JOlFkfqah5ZiBbA8
 idkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNinOfUJINPcfdOxhYvsgsalnU1GKLpLDBpG0mAohAc=;
 b=FA8Rd2TqZFGKMkh2y+ylFzknxbU8Dm2AFrN8HcOF2a7rgodiaqIn//8ZsSEUOcRn5U
 KJd3jL3oIkJif3KEJ9ByWTfeIKPU644H0GJhtFy14MZi4lBXuBTd6IctyctbvSKa4c+F
 Xgh7v793D5YXMtmq8LYT/btvj1GgOm/+Lnbhz12aNH1cafiM553FAnNvMEDMDEV2T0hp
 l8/hTcLnNUJ/1PMS0GRlv64fuZky3Z9h4oBCwm0h+MAh+JD6nV842Ekg+uV7re6ImUqk
 gnrq3eZ4ifqrzjrwxcgGi/06Br4iE3NlL77R0+nng3pUlgJDwJLHGW0ox2Y2zBmPPYd6
 Eg2w==
X-Gm-Message-State: AOAM531a+kegmxLnaEliwu9U7l8GW3LM4755aYkV5sVkwhxZy5jSuBnV
 21lAb80dBx57AYshMzodTIU=
X-Google-Smtp-Source: ABdhPJxEmyd/fVeOUjyk7iQ/WLxWnrDrhtacIwVjgE+LHn4GCwVnNtolqtkZfzUNk0y77xteCo9kSQ==
X-Received: by 2002:a63:e405:: with SMTP id a5mr5864785pgi.150.1627717924655; 
 Sat, 31 Jul 2021 00:52:04 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.29])
 by smtp.gmail.com with ESMTPSA id y15sm5470504pga.34.2021.07.31.00.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 00:52:04 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, colin.king@canonical.com,
 jiapeng.chong@linux.alibaba.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
 Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] scsi: csiostor: fix possible null-pointer dereference in
 csio_eh_lun_reset_handler()
Date: Sat, 31 Jul 2021 00:51:48 -0700
Message-Id: <20210731075148.72494-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable rn is checked in:
  if (!rn)

If rn is NULL, the program goes to the label fail:
  fail:
    CSIO_INC_STATS(rn, n_lun_rst_fail);

However, rn is dereferenced in this macro:
  #define CSIO_INC_STATS(elem, val) ((elem)->stats.val++)

To fix this possible null-pointer dereference, the function returns
FAILED directly if rn is NULL.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/scsi/csiostor/csio_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/csiostor/csio_scsi.c b/drivers/scsi/csiostor/csio_scsi.c
index 56b9ad0a1ca0..df0bf8348860 100644
--- a/drivers/scsi/csiostor/csio_scsi.c
+++ b/drivers/scsi/csiostor/csio_scsi.c
@@ -2070,7 +2070,7 @@ csio_eh_lun_reset_handler(struct scsi_cmnd *cmnd)
 	struct csio_scsi_level_data sld;
 
 	if (!rn)
-		goto fail;
+		return FAILED;
 
 	csio_dbg(hw, "Request to reset LUN:%llu (ssni:0x%x tgtid:%d)\n",
 		      cmnd->device->lun, rn->flowid, rn->scsi_id);
-- 
2.25.1

