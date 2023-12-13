Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E4811535
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8809810E07D;
	Wed, 13 Dec 2023 14:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E65F10E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:48:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33642ab735dso295989f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702478934; x=1703083734; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2BHTj3zjVDU2vao7sN8K8tyFhdcU9khY6wPC0ZJAzdU=;
 b=GnMfExVbR4QbZThrJeFJEZ3Q264ug+bZGBgL9CyBkn8tv14OyhwcjfaUYXR4MiX2IC
 f83uyp2glga+3IVv/u2eWOSk58JT549QnqufHs3wKbRo4GXl8wPUmc8TxG2sfn3j37kA
 VO7ymC93f3iPs5+0UWIqKaGXtCYaiyGYNCqn127bstjFGTB7QkZuM2JhTuUdFl00J6Cu
 Sya7HWjfNb1t7pEj4VKxOrexfzpdXUckwfW3M2587iGWN4sLGFJtzboUwGelviAV6Iug
 xiFezpp3QM4EFd2EiHlDMBy0CPfV8fqs4UJzhHa4gvNx6IAn3iHBOZNclQoBNFiyU1hV
 BvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702478934; x=1703083734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2BHTj3zjVDU2vao7sN8K8tyFhdcU9khY6wPC0ZJAzdU=;
 b=HV+y4qO3BzkowHeX+2V6v897g1ObC9E4L+l0uM2a8nh6ZH+QnrgQ3eRajs/e2rAQPR
 kC4b9s5dOe3k3uzfuL6NViWMQDX9eVX3qyXhByh3AjXPfo7TWTlCcNIMLVyI6bBJGfxI
 NtlqeYT/4sVewi8MXf9FCm4LYB0dm8LnNZtYBmWhKUZf/yfWJY7GPTG2zTZ7tChMcxUu
 eJbkImCw2Kc+TqqLvoAgLW3Zl9aijfDJyq0xm9kYPwHDXjl3VhiSJyICyKjfleQUUR1w
 ybiaOTi7ZKH3Fc8s5b2WtK1WMLjEvORyI3yiaEg4QuKkT15FoHIjV4O6KAdVc2ulNqvn
 kzYA==
X-Gm-Message-State: AOJu0YzZlm92Iv6qOtAgHqkEV6mKhkFEfghEyV9f7aWPxxjCJiO8uShE
 nVkIjyLH6YL+hpYsLpoKZ5doyg==
X-Google-Smtp-Source: AGHT+IEWyg1ONlrYW63c9yfbqDYnALY+KU6gFCYYWgu6wCzEuBDLyEg8on9oRc9RDyY/1IiuNWcBSQ==
X-Received: by 2002:adf:f34f:0:b0:336:360e:b32a with SMTP id
 e15-20020adff34f000000b00336360eb32amr718600wrp.239.1702478934355; 
 Wed, 13 Dec 2023 06:48:54 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6a03000000b003363fd83503sm1347100wru.42.2023.12.13.06.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 06:48:53 -0800 (PST)
Date: Wed, 13 Dec 2023 17:48:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH 2/2] drm/imagination: Fix error path in
 pvr_vm_create_context
Message-ID: <e29bd273-543a-459b-9aca-9eb612ffa2fb@suswa.mountain>
References: <20231213144431.94956-1-donald.robson@imgtec.com>
 <20231213144431.94956-2-donald.robson@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213144431.94956-2-donald.robson@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, matt.coster@imgtec.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks so much.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

