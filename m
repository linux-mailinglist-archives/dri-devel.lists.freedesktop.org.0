Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EE74E6D4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D611210E308;
	Tue, 11 Jul 2023 06:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2634D10E308
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:08:45 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3159d75606dso1617832f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689055723; x=1691647723;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8werb2SBWZr7v/sXzjx6gnxExhvkujqij807vJmKy30=;
 b=pwQgrr3VfqsIgF/yJ9EbzF2OfgeC6Kk4wADko02rM0LorUIA27+Ha3kMJunYExsAHp
 /4lsB08oS/IAr8GtrR+eZcR6LuS7x6a7s8KSxXB+1JKNhPeT068p58oK/dY6rqN3zHJ3
 CReWuhFXLVqk8UBZODqoGHRgLsAu51i+i12gHkSJI0pAKmHX9nyd2KRNrH17ter1e5Mp
 qpKrfP+jE43bNmqtEJKVNZ/xCqTIHlz86unr9juLo6T/ECDGE/YsbM3YiTs5KQDxY/Ir
 qguM3gjnEzREAeoYzQ5AUmN2ShnmdcTEaOUPhBmoKh7WL6A5EYZzCPV7Bx8pPjm5S7wA
 NHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689055723; x=1691647723;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8werb2SBWZr7v/sXzjx6gnxExhvkujqij807vJmKy30=;
 b=QqqiJR1xAG6E60qHfxUkheey67JfyjslpBMNUehwzpSo6gfVw+hsLaoR7hwU9E+mKg
 2T9Tw5QS7NdOarU5JiOMgcinKgUUduU6loRjxPLeyzMpFZmD7oNtDlDeU1tlWoRhZAnR
 evn5j1D2/QgK7J+WF0Kqhtnr3P4wZwpPhYCyLLtJEuFFny4+LQF5jYewQt0rX7hsUPIj
 MUbvMAFMJHvi4L33ALSxaoqfGXUIoetUw1cc0YORafoDJCjvpNRAwRsMxr2S/PP/IoBT
 hg2Vfvht402s3674p3UPRlgQ9CLSVs8H42YUl0+1zVTvixnkgsNpSlSvkv0Nq3P81QVl
 ASJQ==
X-Gm-Message-State: ABy/qLbKhhhPBuLxjlPaqtWYunlJJDt3YZ3B7Pt6SXUIYO/GuEBlhfdl
 ptruz8mHYOpiEfyGeHeul6sTlA==
X-Google-Smtp-Source: APBJJlFnfJolRPMMeoYKAGfu5dCjeSnPio4DalzndKJ3lrBfZ4HJWeBfTMi4c1ww8WbLyIRRzLI9iw==
X-Received: by 2002:a5d:4b87:0:b0:313:e3a8:b47c with SMTP id
 b7-20020a5d4b87000000b00313e3a8b47cmr12330315wrt.8.1689055723407; 
 Mon, 10 Jul 2023 23:08:43 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 b2-20020a5d4b82000000b0031432c2fb95sm1251399wrt.88.2023.07.10.23.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:08:41 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:08:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/5 v3] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <ZKzx5nA6Z/0yhBJj@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed in v3: Redo messed up threading

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
