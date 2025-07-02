Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60166AF6622
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 01:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C451610E0AC;
	Wed,  2 Jul 2025 23:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="SKOPTOtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2476D10E0AC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 23:19:14 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e05bb6efe0so4840615ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 16:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751498354; x=1752103154;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0l/N30YfYOnzNVPk9e9LC8H0KdFEXlOJ5r3jt1u/SPs=;
 b=SKOPTOtPxnoyXKOefXtqv3AiYF9LLG2wpJCq5ETtkTspbZOwUWjrAERAeNGmjuYzf0
 Jtr9eFJCSlvuj7vTidmxIcG6vcawlzfusTujWkCIVsnrpgkLvlNeeICokAy9NBLXKBx9
 TZZQdiT/ICYmjTuWXEVeAnsH7gw3+bpsPsSHYmh0VoR+CGwaZcfhoBYiCcg+gOC0o66e
 JUUyG6MJWkYa/VNjSREhPzAv+vLft1rfBv6BJjU9EXQZHLJ72yS64//zn041o08F9v5t
 oJx+ycFlXwarsbl3wK4s3rcAGKn7qfV+dqNqS5Kz/pql3DKPVIcbtD6J7Iynxe+XPNG6
 1v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751498354; x=1752103154;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0l/N30YfYOnzNVPk9e9LC8H0KdFEXlOJ5r3jt1u/SPs=;
 b=Nmu2a3pCYjyZpYWA/LUUaL5HcjNSpAocRL8SSiVXrq09OaRGbqL45mOXVbelSmekK4
 HKP2OmgU0yeR+dpBlhrQ3DhZErX0X5hh/QBQ6B7xmyg6d0cooopELhMUEFHDz8oNPUc7
 SWVdGV+c2unR3tikw+fddYhFtErWN2Z4ctH5Lz1ox5aNh0LVwo9dWITfzsmi5kGz0tUD
 2uc0IvlMR90l6bBkXmpcq7hOP9uri9TVhDutdpiE7Y1I7SzltIr721QyMNzu+fzgwRlE
 xI2GYH0rr+zcL5mbqsIaW8PXT+gRQbKQJtpSGTthJCDft+rGldcLUJsly+zm/qsrtgqK
 Es0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhpGCPAbQCqpolinXb0H+IfZ39USdvsIjEBgBhdzqReUdkHeUroYajnawgEb+VpZeFBme7KQc3dCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylirfnTTn7ktK3n+wdUYiyJX5ZlE08da+CgcmZ7WvUTdsXiahb
 ownPF5KEpEhwg/n850JMyVdOUcllR3aS8yUBB7bGfdpvjsX/mDJ/RYDcoyL7JlMFlUo=
X-Gm-Gg: ASbGncuw9TyIBvvyVZjZCKlmb+MPbu4I1+vjXpCJysTG+TWOJXwHV0YVHW9c1/PQ624
 UzFUgSaPT3cPbuHczZ9OzQwBsZNK2ijnu47Iqaqq3yBjFGP4RJSzi7NYGMOKyYho2m77fgt38u7
 v47IKabRV0mCUDqNVshelp0dJkx5BO7mmRHkMHY4K5dN9V6qNM/QxCiFq4xT88PYRrWyLaAVcEv
 pHLGcSd+fbqwp1YEyQA7w6LHLkjWHovTTXh93TSISX9tva66jBXaXP+LDMJTS/zB4J+VBsm+n3x
 8TNjywIUl0O3vKN4zTxYPiOGWh+EtHLOiq5Y1Y5kXp9IOB4tfSERkw==
X-Google-Smtp-Source: AGHT+IHMH7E5jXmc85tpF2ZmfhX9o8LwIpGAXUuM2IRAjJ7JFybYjfZFdD948UlZ9MRk58ULXnrHNQ==
X-Received: by 2002:a05:6e02:380a:b0:3dd:f813:64c5 with SMTP id
 e9e14a558f8ab-3e05c9d5573mr12171415ab.22.1751498353991; 
 Wed, 02 Jul 2025 16:19:13 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3df4a09165dsm38313005ab.43.2025.07.02.16.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 16:19:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20250702211408.GA3406663@ZenIV>
References: <20250702211305.GE1880847@ZenIV> <20250702211408.GA3406663@ZenIV>
Subject: Re: (subset) [PATCH 01/11] zynqmp: don't bother with
 debugfs_file_{get,put}() in proxied fops
Message-Id: <175149835231.467027.7368105747282893229.b4-ty@kernel.dk>
Date: Wed, 02 Jul 2025 17:19:12 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
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


On Wed, 02 Jul 2025 22:14:08 +0100, Al Viro wrote:
> When debugfs file has been created by debugfs_create_file_unsafe(),
> we do need the file_operations methods to use debugfs_file_{get,put}()
> to prevent concurrent removal; for files created by debugfs_create_file()
> that is done in the wrappers that call underlying methods, so there's
> no point whatsoever duplicating that in the underlying methods themselves.
> 
> 
> [...]

Applied, thanks!

[10/11] blk-mq-debugfs: use debugfs_get_aux()
        commit: c25885fc939f29200cccb58ffdb920a91ec62647

Best regards,
-- 
Jens Axboe



