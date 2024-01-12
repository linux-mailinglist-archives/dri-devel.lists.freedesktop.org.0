Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B962F82BD57
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CADC10E101;
	Fri, 12 Jan 2024 09:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34E710E101
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:36:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e613b6afbso14908685e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705052190; x=1705656990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qgz5LyPiFVmgCE1Sf1kAN8+Rh5MO+/KEzBX/qgkA63Y=;
 b=XDS/4VIk8rYVYJuqjZ0KcTNPMJ8A6xcMJsbqKiGcr4YaQbqNJ0sMuabnVeMCqckd57
 OtQ0+rzOy4qgwK0+9unK9XrP0WdOtvfcW6rWHNnDuLQqe4twnVsLBqgD0xHY2JdLustd
 +v/gnHqJgDecLCLSagZcqjNd/yuQVWoH+rcPfHTVy2V9cxouYi41s4khOcnkmQklKEm0
 gbUOdbJJtmuHUqxeZbNOj4+4r1WQAqsB+7PebRS55OLHncF350RyYZMlxW6fs/cjNeFu
 DcxrP3rBplJTY4nNjU8vD9CGDHfeKNcnnJuzWGvcZH/7JmZa9CzJJKVCrJ9Rh0Ysb2sZ
 rFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705052190; x=1705656990;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qgz5LyPiFVmgCE1Sf1kAN8+Rh5MO+/KEzBX/qgkA63Y=;
 b=eSCi9be9mw0+sSLMS1GlnOvt6fHe5ZXj38K1wTSeAqgiBbO9BjINz9cfdxMpOf0jn1
 2P0d/+vaJXdIYrVnN7Av2gDjWWpiys71oPHVfWjO9zdg1mb//CBtZM8QSSrHzXf2/Wu0
 dl+encjJ/y3B78sGKR7QXHTmvBJeB8vGGfy59okicCzjnbYCMvAMtThUTjvHj5rLB48Y
 SBtZlxFZohyzgpWY11a9Uz7fkv6rYWzfIwcd7eDDuouull1HO+gAgZi918T2pZKcWjpt
 Hb+FjlcWnBYeQRyN2NIvl8zu6J6DNTQD5BjMtLkm9KmOMb1btAk5AgMPfBzkJZzIs5mi
 e5JQ==
X-Gm-Message-State: AOJu0YzfPOfMUTgxTxjnpFQmARbmAQX3WH59B+R4T4/bIzb96n7qDHtS
 S3KmggHGU5yiZeTFEN6xL9615df4RGOm6w==
X-Google-Smtp-Source: AGHT+IE9hMSKYuNwGOMj8HRgn3+LdsUoy/a7XvjYTTlp0a9D0GB2cY+25GwRfXaBbeHxcQtDsNr4IQ==
X-Received: by 2002:a05:600c:130f:b0:40e:68aa:8b6d with SMTP id
 j15-20020a05600c130f00b0040e68aa8b6dmr52256wmf.33.1705052190120; 
 Fri, 12 Jan 2024 01:36:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 fl13-20020a05600c0b8d00b0040d8cd116e4sm9009008wmb.37.2024.01.12.01.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:36:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: hanxu5@huaqin.corp-partner.google.com, yang.guang5@zte.com.cn
In-Reply-To: <202312201048538333616@zte.com.cn>
References: <202312201048538333616@zte.com.cn>
Subject: Re: [PATCH linux-next] drm/panel: Simplify with dev_err_probe()
Message-Id: <170505218910.999327.5319629323020953122.b4-ty@linaro.org>
Date: Fri, 12 Jan 2024 10:36:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: tzimmermann@suse.de, cgel.zte@gmail.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, chen.haonan2@zte.com.cn, dri-devel@lists.freedesktop.org,
 jiang.xuexin@zte.com.cn, quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 20 Dec 2023 10:48:53 +0800, yang.guang5@zte.com.cn wrote:
> dev_err_probe() can check if the error code is -EPROBE_DEFER
> and can return the error code, replacing dev_err() with it
> simplifies the code.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: Simplify with dev_err_probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9f78b3ae051d9eeeed9658cf54b3f0ea6920097b

-- 
Neil

