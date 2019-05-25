Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2522B41D
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DFD89B8E;
	Mon, 27 May 2019 12:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E668A6E149;
 Sat, 25 May 2019 07:34:56 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w7so5052943plz.1;
 Sat, 25 May 2019 00:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=JvzE9AyV74L/dTo6OIidUVMz2Tg/YkysokYHJ1eyAEI=;
 b=JS4adlaswaDxoxIEXIGvulIZ+yAYrjQuTgAHp7TVDS44vmyTULwDfzTDMm6Xrg5Knk
 y+c67K9ZpyaAC45k4NTDlms1Jun2QutmrjdGs/mqtcGmqVLl3F8kO5EJzKx869kJub04
 Ibo2vjDkYKghGxEMsh6Nr9miYzpq2ordJ1f32sNDKXk+xuVe5gxuZMuUGC+LrQdUzawz
 IjfwuQlEtCAcZmjqd2pAsqzHJrcuDj/aki2D3FLYjfWc8mQooY4yoBLXzR7nrbZAV8fs
 OEHANjmMRl5vFMZ09Mja5UBsDPQhANiMA73nNufavpWkZx4TV5DIch4gsx8PjYULbJtx
 RmbQ==
X-Gm-Message-State: APjAAAXHQc6FirMx22rjL3WDwhVU9gDrfRP9+Jg3vl31VyI0KV7qhLvm
 6DxqZWAMan6++oxA79OmWIE=
X-Google-Smtp-Source: APXvYqzuwCZTB4XD4UxzRtNwZzdpVIiEv9uj7w5oO7kYYG8sg+hiUzQaOw5wFZIZoT7DFcvcOlrvdA==
X-Received: by 2002:a17:902:9a07:: with SMTP id
 v7mr112122498plp.180.1558769696584; 
 Sat, 25 May 2019 00:34:56 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id v93sm4512115pjb.6.2019.05.25.00.34.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 00:34:56 -0700 (PDT)
Date: Sat, 25 May 2019 13:04:49 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 hersen wu <hersenxs.wu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Francis <David.Francis@amd.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 kbuild test robot <fengguang.wu@intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: fix warning PTR_ERR_OR_ZERO can be used
Message-ID: <20190525073449.GA7278@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=JvzE9AyV74L/dTo6OIidUVMz2Tg/YkysokYHJ1eyAEI=;
 b=W1U98WMIUt2Y1NL0+hUD6ifWc5gAad3cySCvCzhQ4hereZF6+1LqJFJGAVKOVG60UI
 9jXSo7SC3PVFYkEeh7Rs5UXtH4GFFHc/841cpx3R0dnSILiIiWuKwJQ/MG63RvtGZa2R
 iTKPOYS+ozX3dyowPA10b/Hw2WrcOsbhX9QvGe1w3X3eGJtxUDHVgn+fYMEUwNHjV1QN
 Cd6Y1AHaTelpT8Xp+x9wxyKuD8cbq1+wOWtlARrWfdoCoWgA1ff6yY3YkEf5cG2s9r4S
 8SjwdmHPVxdqFaxlxDrnwPqV2D9+MlJtT4RLt5b6gVhpbYTvIYPCxmOm50bsVb2esdIK
 QA4w==
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

Zml4IGJlbG93IHdhcm5pbmdzIHJlcG9ydGVkIGJ5IGNvY2NpY2hlY2sKCi4vZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jOjEwNTc6MS0zOgpX
QVJOSU5HOiBQVFJfRVJSX09SX1pFUk8gY2FuIGJlIHVzZWQKClNpZ25lZC1vZmYtYnk6IEhhcmlw
cmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYyB8IDQgKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVn
ZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2Rl
YnVnZnMuYwppbmRleCAxZDVmYzVhLi4xYjFlYzEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCkBAIC0x
MDU0LDggKzEwNTQsNiBAQCBpbnQgZHRuX2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAogCWVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGVfdW5zYWZlKCJhbWRncHVfZG1f
dmlzdWFsX2NvbmZpcm0iLCAwNjQ0LCByb290LAogCQkJCQkgYWRldiwgJnZpc3VhbF9jb25maXJt
X2ZvcHMpOwotCWlmIChJU19FUlIoZW50KSkKLQkJcmV0dXJuIFBUUl9FUlIoZW50KTsKIAotCXJl
dHVybiAwOworCXJldHVybiBQVFJfRVJSX09SX1pFUk8oZW50KTsKIH0KLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
