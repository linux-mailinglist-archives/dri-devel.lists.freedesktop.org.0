Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6296EF68
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 14:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684946E8A9;
	Sat, 20 Jul 2019 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ED96E88B;
 Sat, 20 Jul 2019 09:41:47 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id b3so16801705plr.4;
 Sat, 20 Jul 2019 02:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=v9WJAAUd0FYraGl+snmlWnmJuO7F9Zl0Mgve+vMvnZA=;
 b=S7v/qZxGh5WAbnl0txeGXS8MRTjaDnQrVNnukLFwvGrNZ/BXKDXJ9hdHSGkvOfNT+o
 m3obOTyEafcdCIPaGbhOgIPCTnWiXAEPvEiuN9jamQRDxCTIcdMf/PJNTR2GW8Dtu4Lt
 fM1cx/92zrF1vNU1M9aIhxQ+4kxexqBwglaQw3bCrY6Y7ZWmmkL7G4J09ndIuH1wxdaY
 qU8qGUtHS9Q3jLYTUtI/xZT6HgVKkyzcEPSj7uAITmAxWJsYC/kr6UH/vuYuhVJcmLPt
 tJo/SNRyM5rtq7gk8/SG4r2bwKO/idvzPf61uQHM9wpel/GWgyFEY9VLwjBqIOBb4DjD
 RDVw==
X-Gm-Message-State: APjAAAVZuC3Mwlwfey9yEjexOl+kWGb6ZPqXSdopzrzdKxRdQ1dprDhP
 IPslAgLs6Aa4VKMgu5HBl5UNIpUm
X-Google-Smtp-Source: APXvYqw3UoZCQMxWk8eyzoHXCIxh7CTNleokJnNO+C/FPlZNpmnY1CrGqFOczaL/O2kl7U4dmn+wyw==
X-Received: by 2002:a17:902:112c:: with SMTP id
 d41mr52291700pla.33.1563615707072; 
 Sat, 20 Jul 2019 02:41:47 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id j5sm28233886pgp.59.2019.07.20.02.41.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Jul 2019 02:41:46 -0700 (PDT)
Date: Sat, 20 Jul 2019 15:11:38 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Chengming Gui <Jack.Gui@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: Remove multiple occurrence of asic_setup
Message-ID: <20190720094138.GA14101@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sat, 20 Jul 2019 12:51:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=v9WJAAUd0FYraGl+snmlWnmJuO7F9Zl0Mgve+vMvnZA=;
 b=hpOUYI75Ff0kT6f5LWZckHorQyUE/qBZQk05mz8fM9KFggOf0aX+0BotFS6YgyIVV1
 WkI3UVqsFE2v7UswouCjImkLB12z/GjYvCA3ytZ9ShybxPMcl3PFS/BZItRetj9IKitb
 xJCRzXYjc4J35MXy9LnLmzBu94cGYHYHadVZXJm2Jp5DL36Le7McpDmV2w53q+LFxggp
 N4Hcq88Zx35vUSA1vxwAGQKVBFRbJXpcheHBhRJTs2iCUaihWJ2E/jaRftkyBU/Nb/TQ
 g+Nu7UwIOa3tW6w6ffGZl8TbMKap+nPagwCjFjSaMoT5JGHZFhoUdKIllXQ9xGrNvOtV
 hPeg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zml4IGJlbG93IGlzc3VlIHJlcG9ydGVkIGJ5IGNvY2NpY2hlY2sKZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYzoxMzA2OjUyLTUzOgphc2ljX3NldHVwOiBm
aXJzdCBvY2N1cnJlbmNlIGxpbmUgMTMwOSwgc2Vjb25kIG9jY3VycmVuY2UgbGluZSAxMzM3CgpT
aWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoYXJpcHJhc2FkLmtlbGFtQGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5j
IHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCmluZGV4IGUzMmFlOWQuLmMy
OWY1MjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Nt
dTEwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211
MTBfaHdtZ3IuYwpAQCAtMTMwNiw3ICsxMzA2LDYgQEAgc3RhdGljIGludCBzbXUxMF9zZXRfcG93
ZXJfcHJvZmlsZV9tb2RlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGxvbmcgKmlucHV0LCB1aW4K
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHBfaHdtZ3JfZnVuYyBzbXUxMF9od21ncl9mdW5jcyA9IHsK
IAkuYmFja2VuZF9pbml0ID0gc211MTBfaHdtZ3JfYmFja2VuZF9pbml0LAogCS5iYWNrZW5kX2Zp
bmkgPSBzbXUxMF9od21ncl9iYWNrZW5kX2ZpbmksCi0JLmFzaWNfc2V0dXAgPSBOVUxMLAogCS5h
cHBseV9zdGF0ZV9hZGp1c3RfcnVsZXMgPSBzbXUxMF9hcHBseV9zdGF0ZV9hZGp1c3RfcnVsZXMs
CiAJLmZvcmNlX2RwbV9sZXZlbCA9IHNtdTEwX2RwbV9mb3JjZV9kcG1fbGV2ZWwsCiAJLmdldF9w
b3dlcl9zdGF0ZV9zaXplID0gc211MTBfZ2V0X3Bvd2VyX3N0YXRlX3NpemUsCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
