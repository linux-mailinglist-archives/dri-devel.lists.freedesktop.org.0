Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90D261940
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523F56E891;
	Tue,  8 Sep 2020 18:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A626C6E886
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:11:38 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id u21so390563eja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sior-be.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2jeAKbPcMYL3zKYHWUAD80qBl6LQnPeUqzL2ybjhdJg=;
 b=GRWuV3D+NPs+O8PhfljngvbH+/zdl1IG8s+i5wlKJNll0vYKQc3oEZmRBq2GPksBfB
 KZqDXGLyapYUntSwXu7zK1WBhKrrjsmYheZ21l9UPvc2kysM5F4IbTnkh/il6rSNqwoL
 EdCab1UyiUXvyGG2hYYrI867vxh2q3cIXvimK6XSZJgxiaFUvNOV4Mln6uGZ2yinOj01
 OpRJg968cPDL9fxOL2uFJCforjAmLjmTrsy4/frYWGR4IaBF8bCZ7fGBT6ABNkJ4qWa/
 8rXZp3U0TvvLv7/t94dXEBoHvAfxre9JV3R14nppWYwCg8WRqahVi/+t1FDgtIafF0Al
 PATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2jeAKbPcMYL3zKYHWUAD80qBl6LQnPeUqzL2ybjhdJg=;
 b=rXc6OYNsq9FeJu8r53/YnALaRBoOwUsJMWJCxdVgYOv9otR8fNCKgQeH/osLEp5J4J
 2s5P0DeDQm8r7HyhinB41ZH9I9KT14MNf7tAdqA8aYYNE/5t85afSQmlNm7rLIDc2sOT
 EK8JHe3HNxJkYI82Xps4GXNPlte7DkBPL8RgNKuC2NdWDSYiRJ0nqAuPOhy/rPmVJPmP
 ndFjbkqZsz1PTeN4elCtVf06bWyoYb5Q589aFS4bfpMzOGTRqGYJ5Z9MA8k77bxnAnqX
 +KS2sXBYzuH+/dkaAv1OPlYAazEhhgSlW4y0hJuhmPD9W/fTiwC7FkzLe67fn+0/yx2S
 H8mQ==
X-Gm-Message-State: AOAM533WScohNC37UGeQuv5Be9UZNHI8/9FEsOyxTcA8xhi/grWVqj1o
 8MK5bUB60Bv5hc6E643JGXLi2g==
X-Google-Smtp-Source: ABdhPJzXcxEi0aj0yBJLuuB4LmRVp2OUfbxb1m0J1V/0WroShEQJp8UGXqXJyJVSx6nGyPsh9AglWA==
X-Received: by 2002:a17:906:3552:: with SMTP id
 s18mr26864500eja.23.1599588697308; 
 Tue, 08 Sep 2020 11:11:37 -0700 (PDT)
Received: from aws.localdomain ([94.107.139.190])
 by smtp.gmail.com with ESMTPSA id g20sm16127ejx.12.2020.09.08.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 11:11:36 -0700 (PDT)
From: Alejandro Sior <aho@sior.be>
To: 
Subject: [Intel-gfx][PATCH v2] drm/i915/gvt: Prevent NULL pointer dereference
 in intel_vgpu_reg_rw_edid()
Date: Tue,  8 Sep 2020 20:11:21 +0200
Message-Id: <20200908181122.9100-1-aho@sior.be>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <743818af-fa38-e31a-1780-84a6a7e72e25@web.de>
References: <743818af-fa38-e31a-1780-84a6a7e72e25@web.de>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alejandro Sior <aho@sior.be>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function intel_vgpu_reg_rw_edid of kvmgt.c, pos can be equal
to NULL for GPUs that do not properly support EDID. In those cases, when
pos gets passed to the handle_edid functions, it gets added a short offset
then it's dereferenced in memcpy's, leading to NULL pointer
dereference kernel oops.

More concretely, that kernel oops renders some Broadwell GPUs users
unable to set up virtual machines with virtual GPU passthrough (virtual
machines hang indefinitely when trying to make use of the virtual GPU),
and make them unable to remove the virtual GPUs once the kernel oops has
happened (it hangs indefinitely, and notably too when the kernel tries to
shutdown). The issues that this causes and steps to reproduce are
discussed in more details in this github issue post:
https://github.com/intel/gvt-linux/issues/170#issuecomment-685806160

Check if pos is equal to NULL, and if it is, set ret to a negative
value, making the module simply indicate that the access to EDID region
has failed, without any fatal repercussion.

Signed-off-by: Alejandro Sior <aho@sior.be>

---
Changes in v2:
- removed middle name of author to comply with git name
- rephrased the patch description with imperative phrasing
- removed useless paragraph
- made a paragraph more concise
- fixed typos
- made individual lines shorter than 75 chars

 drivers/gpu/drm/i915/gvt/kvmgt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ad8a9df49f29..49163363ba4a 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -557,7 +557,9 @@ static size_t intel_vgpu_reg_rw_edid(struct intel_vgpu *vgpu, char *buf,
 		(struct vfio_edid_region *)kvmgt_vdev(vgpu)->region[i].data;
 	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
 
-	if (pos < region->vfio_edid_regs.edid_offset) {
+	if (pos == NULL) {
+		ret = -EINVAL;
+	} else if (pos < region->vfio_edid_regs.edid_offset) {
 		ret = handle_edid_regs(vgpu, region, buf, count, pos, iswrite);
 	} else {
 		pos -= EDID_BLOB_OFFSET;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
