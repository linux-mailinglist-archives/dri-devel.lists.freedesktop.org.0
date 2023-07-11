Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E658974E6BD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F1510E300;
	Tue, 11 Jul 2023 06:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FD610E300
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:06:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3141c3a7547so5455995f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689055558; x=1691647558;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aesAxzayxM+SEzglJ/Ypflh+S53bG0sURfwQo/p3I3U=;
 b=t2Yr+QWSR/YsSFFbia2YGAW7i8T8cWbZ/PRnB7BOcF91pQBS1Pv4nH0lk1C4uN5zNP
 q8pxUAMP/bKvbPykAlCZ+oyTKVG8/fXcT1fgemVTvp2NSJSS1nUxSNNdIZjuEiTqTrZq
 +9448VhPoeUmKcQ/lyxrNpUZH80KVThUiOPLs5gXk+/sILsgj+CFfQayWEzCs76AQ+ST
 b4gIzo9zbw6BuQurVJzvqcltiICv2ZDNDpFafKXClPQ3QDeLWbtatdys0U5XKTFC9Lnp
 8sQUWAhNd1XS6nxFpIlRIX/ENya9QRZD6LoIWrihNstyeRBO/TkhJWy2awk4qy3g8Ku3
 3tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689055558; x=1691647558;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aesAxzayxM+SEzglJ/Ypflh+S53bG0sURfwQo/p3I3U=;
 b=XeS3xxv04W7YbyabGPJnB35y4R5vcUU6OuvbzCBs8dvJe4omXd+3i2c+V4l9atasFo
 /KhCA4djFeUhVJgP8U9aeMOdUd1P7y9ibYsEde+rI/JXF0roFDW6YmrglwuZlxwtEGqn
 uKw/lKgxIswqPw7U8xECqBBR9E8ZpSHIXgo5HG6HAB5JJ2X2KYYILRvNnyLX7TL9IB0I
 jvl4qVXXZ1QT0mEskyI++O+8yuihBdSc3hTBdUhROSQcBmFW2+ZA5fJRubQpEQ2LMsVX
 YIXvOFnlYg4YNOWQKhuNKW7ogYm+HWPlB0c7BX6a5fMlNsyeyvSwC7XEZ5XB924wXT8z
 Nybg==
X-Gm-Message-State: ABy/qLYbBvzDwGHvpLv9UbxRdlrjRjXdc2JAd1MXmm49q6SYiDsl8iqP
 yhzPbM8CGiljrlzJSl9V2WwWXA==
X-Google-Smtp-Source: APBJJlFfvQKMGo1BcUF/1jUzDWo/C/kzCrN7OGJnmLUAWv27PZ4FeGr3LtF0Y+Pi9vx5yglpnCDqMQ==
X-Received: by 2002:a5d:56cd:0:b0:314:1a2e:1af5 with SMTP id
 m13-20020a5d56cd000000b003141a2e1af5mr13831401wrw.25.1689055558077; 
 Mon, 10 Jul 2023 23:05:58 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 b16-20020a5d5510000000b0031417b0d338sm1247851wrv.87.2023.07.10.23.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:05:56 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:05:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/5 v2] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <ZKzxP8iX8Op0lYvh@moroto>
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

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
