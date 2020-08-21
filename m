Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367724D93F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 18:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEEA6E857;
	Fri, 21 Aug 2020 16:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7E96E228;
 Fri, 21 Aug 2020 16:00:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id 88so2424042wrh.3;
 Fri, 21 Aug 2020 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rwjX50GleyzQyIhSonmB7vfE/OdQqM/k7YPTPNxrrkU=;
 b=hLVl0vS7BenVtBugFudiJ/5kDvRG5K/+XzO7ktb1ylLcet2Yhd+FzDHBv4JZso8VZO
 M33Hi35QLCI45X3YUqwbbO2Tgg2InfbqSI556gj4P2HxgJbirEOnwH+sozkwn2/y8mbX
 zv4YLKjBV8Hk1N6RulIMcRIXCe36eiqlO3nNkfBGXrFiCV3tonV3RTF+86DLqORgDPOh
 15JlkZ4ibXszmU79oGHMavknIqiZLZ0WawubpMnQJ61x3o8N2mEmPLgvuy66zoWW03VM
 M0MQZ4wCwAPIuPjfw7k1LsZGaKVHpbO7M1FgZY0atd/HJ8VZQ2ZTU6QLunFKmCq1ZSQi
 l1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rwjX50GleyzQyIhSonmB7vfE/OdQqM/k7YPTPNxrrkU=;
 b=Yf6BwN3WhcdBScZloxmFlN+HSVqsiPy7Z9EwdNVjHIAMfP0LX3LNyWhhGW4gKduI4B
 wNGk4ENh6Pkq3wQ23BKbjqJurTTz1YUpcHCo+XscjEkpP2TheTruEZl4JOu6qWAISqYr
 0sTMtwtku+C2LD4va+FGuxXzXZAVw+mQWkq5p5RhRinDbq5eySt+8qgTbssIxtpnWv5e
 qiObVp4Qtf9zDcQ28IU3bsaf53EOPFSK1tWQQofXVZdpacyAdW6GLfnhBJ3bM30UWwG9
 uY8L3Iro14AJ5TEnmwXl5UcQTZ/iSXA2tV8rfObK/pye1XWX0F5zOj8QiJ8YSnAfA/vi
 TXKQ==
X-Gm-Message-State: AOAM532+I6wDng5rDUCLBn3RDSTieFpw0jZ/CZbV4pzS5kh2ouGF+Shf
 w7M/TTiYkWAxOyvLQQ6fD/I=
X-Google-Smtp-Source: ABdhPJxzoKZM5r2cpoOepbU/qhVYMv2M6dwjrqS6xodZznUkFFpJx0BECR8BdoTypgA7p0xH5KxuhA==
X-Received: by 2002:a5d:5588:: with SMTP id i8mr3314826wrv.177.1598025656215; 
 Fri, 21 Aug 2020 09:00:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f174:75c9:ca38:873f])
 by smtp.gmail.com with ESMTPSA id l81sm6554993wmf.4.2020.08.21.09.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:00:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com, skeggsb@gmail.com, dri-devel@lists.freedesktop.org,
 Nouveau@lists.freedesktop.org
Subject: Moving LRU handling into Nouveau v3
Date: Fri, 21 Aug 2020 18:00:47 +0200
Message-Id: <20200821160050.1368-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

so I got some hardware and tested this and after hammering out tons of typos it now seems to work fine.

Could you give it more testing?

Thanks in advance,
Christian


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
