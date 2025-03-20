Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF0A6AD97
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68B010E6AA;
	Thu, 20 Mar 2025 18:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WcXvMH57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF07710E694;
 Thu, 20 Mar 2025 18:53:34 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-854a68f5a9cso86568339f.0; 
 Thu, 20 Mar 2025 11:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496814; x=1743101614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=noT9vSRMS6zrMZV/pKEC2dkjvVvkFYCSSlOoHQZH1zE=;
 b=WcXvMH57qxmob1T1R1SpBUr9c6s55dhcnPweP4Ox0NMU1HxMP9zxPF+jTrQv91AHwx
 ZinrG85956VBWraww3F+wEtNKfr17FE4BkS9ahAPqwfXRws4GluP7hPJv3fYCalVm5Ni
 edC88gQybQ6mDHbzp5d4AjQs60L34spo7lPp6j6eQamY77jkdm9Onq/qaOQBlCijQYGK
 DqICsCS3GrYwzVVTRddJNcObg5ebZIsjeZONPGjpaqeVdKVtNtquN9kTx6AZWLiBtXpl
 LNcEzAMvpeTyBXo+pNIz6sRAFLTn+/0PSFHq9oROBfSEDe6UJD6K+Ys5mhuFcc4pgaIf
 cTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496814; x=1743101614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=noT9vSRMS6zrMZV/pKEC2dkjvVvkFYCSSlOoHQZH1zE=;
 b=qmdhWmJBm9eMPihsvfJimHiJuFH0pYbQGMRPzOCBF1d6cxsHyNVKPBXRCBxl+Evckl
 JNmTi1piLCzx6VNxPcrHG3g7Q7zdjWWtQAJ35wmzVbRGoxWt+pcb+61FQvgA8kGMbT9Q
 Dh0yKMUCZe8YeQlaznC7/kXI9QIxCM5Z9xogDqVl6RvA/aq+sTBsDr7bavnVo/6+vtgs
 OGRRQzlkZoa3ziFw3ctyuHpxNC+/D9Oo/31tW27HpH7Vy/FMhWGylc98bHllItm2tSr9
 +turqZq0duzehjLecKwPTL4+nJBUyoxybqvUwUsMggVO6NPTzj7K+/Ue+Q9BjhE+VhH+
 3Qpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzwc3LNg9h5gHOxHf4KaJ+x5Gs29/gVS1WnbSRoyAm+M4myv6csSaVconJnvYDH4YD1JQu0mceKT+@lists.freedesktop.org,
 AJvYcCUgaTseR4rEQIpIjbQa8sSmSMwhCTZ/eCkypMlRPchVbIwv+xvAzU2BHnU6vTVEZ0IAlTWvRmXT+ejA8FjZuxhqLg==@lists.freedesktop.org,
 AJvYcCVy2Z3XgZognlg4FIC2pcGnNRffhpAMzoMfUJ8K09xGxIpgUfpdcwMhaNK2Umd3fnjY9OaJC9BSqn65quZEzA==@lists.freedesktop.org,
 AJvYcCWB7dzb/XuQV8W5JaWL4II7CJnv1c965i3ZDitj9/uZzFslEL8jStYH1ZHXGGeTJbQ46vIu735jM3de@lists.freedesktop.org,
 AJvYcCWEA/5hpxIHAMBVRSFUNRSlKLZUI9zXlt8CvKRalWLbcvxZmoCQjApI16Qk3jXgwS9bDncDVOKY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCA5lmpicsUBGk3KmYl7UWAIRK1uC5Bp6TfxHKp99OekwG59Im
 5QuhXNgcZTfXkyFm6ACkF/WTwQy3vyr7tHzV/R5xxO8r9I0Lfxtc
X-Gm-Gg: ASbGncvpcw1T+jzBnycX83s/Pixo3olgrspXV11sW2zwE+zm0Z5tyYBzgS04T6z60Hc
 JWNm+jg6r9HAvPPy/S2LcGj8aJLMVhDUllKzycw7B+lp/pqmI0Pxv2LSVnjn+UVrdvlvmJyOAWE
 Sm6SepLdodZEIuUh+TAOU47HiWBdi2gF7uUqi2Bkw8VEC1BQiLblaVbe3ImYnqot8EX37BZf1lQ
 UZMie+3eNIDuNDGho1I2Gs8l7qFsgJnqtRFcdlGVCrzDYTvP6GDUlokuRP3pbhl4NK9nNddEE1B
 vMQhz3wNdrt5y+IbK5ECWiO8bF5151EDTPThVjG/eP1NN9SetiCE96RjtRJlVtvAxQhDr/s62B7
 gnIenjMm0prjC
X-Google-Smtp-Source: AGHT+IE7BXJOLQ/Ch2HIew0cYtasFTxiOy98Pt2Smp2K+0XTe4H0Bm49hhGoWTZCYRcS5D1a7aVvHw==
X-Received: by 2002:a05:6602:399a:b0:85b:43a3:66b2 with SMTP id
 ca18e2360f4ac-85e2ca808ffmr55825739f.7.1742496814018; 
 Thu, 20 Mar 2025 11:53:34 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 27/59] selftests-dyndbg: test_percent_splitting
Date: Thu, 20 Mar 2025 12:52:05 -0600
Message-ID: <20250320185238.447458-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 368d10a691a0..c97c9391d0f4 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,29 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.49.0

