Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C5966448
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 16:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363EC10E0A8;
	Fri, 30 Aug 2024 14:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZslqPMAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B0B10E0CE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 14:37:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2050b059357so15540685ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725028622; x=1725633422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hVGFtc4kbH/Z7yqtrPYtyKUgQC3PRuwLn6BIajvZoto=;
 b=ZslqPMAzpfdMDL2IO/vLkKBcUw7VEPAPHwxQGeiHxDujZFPphwjVWu1XOhLpM9bLzJ
 td69aV0hNVLibReJLCyRVT6xq5lG6+IqEArO8jxntvnc6XCvgD/XDaKUdW6I0cUFdoAj
 12BrUgDOeNhPQ3l2fsR+AYYDB6Ltq9k+bjtDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725028622; x=1725633422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hVGFtc4kbH/Z7yqtrPYtyKUgQC3PRuwLn6BIajvZoto=;
 b=D5hVKImIqw+ttDhVhdaO0I4fTplok3HjqkT8KLl8JFZlnAqw2/xixuXeZAWVp8v9jY
 hlJ9gLCWwXv7WNvSFmpdxQS8LsgBVAdoFxjGpQF696dFVOpOHjeUx80SmJLvTvAQvALj
 UdJFKoAFRuSh39X5HlBPNIGpK3GHd2KgLkW5u4OTdYngzIZcYwXftru8/d7A6+8uuMnB
 kGzhCmhvxmpzJEKA57BDeuwK4tImmsqqCPOocY7MRALZ0lDt894ZeyycYgW6S9zDjvbQ
 Dzsq1c7SqwxIYn4kaZxK0eTFMv5o6uM4DoFoibbTkbKHMwmnErPoOLpEVpGVRxjsKMpm
 LoKQ==
X-Gm-Message-State: AOJu0Ywf+DGXJ8yK+1Ko/buV7TTKom4Kq+y5VOPqMjdOPBNsuEtHAzyb
 LEPGPGvxNszGS2q/STNBB0YBrxu5TJw15GR7tWAG/oXFRmJ6kiYrym18uzwXRA==
X-Google-Smtp-Source: AGHT+IGP6SDvpMqfxS3K75/5XYUOBv7vIBL6yYiKATWxkoAlTdnFF/xsDDuA76lReR1HWMHHMH5SwQ==
X-Received: by 2002:a17:903:1c8:b0:201:f9c1:f543 with SMTP id
 d9443c01a7336-2050c3b979dmr87360535ad.18.1725028622087; 
 Fri, 30 Aug 2024 07:37:02 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:8144:c259:d49:bb8e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-205152b3117sm27628785ad.47.2024.08.30.07.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 07:37:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 kernel test robot <lkp@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: core: Stub devm_regulator_bulk_get_const() if
 !CONFIG_REGULATOR
Date: Fri, 30 Aug 2024 07:35:12 -0700
Message-ID: <20240830073511.1.Ib733229a8a19fad8179213c05e1af01b51e42328@changeid>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
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

When adding devm_regulator_bulk_get_const() I missed adding a stub for
when CONFIG_REGULATOR is not enabled. Under certain conditions (like
randconfig testing) this can cause the compiler to reports errors
like:

  error: implicit declaration of function 'devm_regulator_bulk_get_const';
  did you mean 'devm_regulator_bulk_get_enable'?

Add the stub.

Fixes: 1de452a0edda ("regulator: core: Allow drivers to define their init data as const")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408301813.TesFuSbh-lkp@intel.com/
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/regulator/consumer.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index d986ec13092e..b9ce521910a0 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -452,6 +452,14 @@ static inline int of_regulator_bulk_get_all(struct device *dev, struct device_no
 	return 0;
 }
 
+static inline int devm_regulator_bulk_get_const(
+	struct device *dev, int num_consumers,
+	const struct regulator_bulk_data *in_consumers,
+	struct regulator_bulk_data **out_consumers)
+{
+	return 0;
+}
+
 static inline int regulator_bulk_enable(int num_consumers,
 					struct regulator_bulk_data *consumers)
 {
-- 
2.46.0.469.g59c65b2a67-goog

