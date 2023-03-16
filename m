Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A56BC8D8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4658210EA70;
	Thu, 16 Mar 2023 08:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF1310EA55;
 Thu, 16 Mar 2023 08:20:39 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id cy23so4184870edb.12;
 Thu, 16 Mar 2023 01:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678954838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xFob/yDzDWT7/o4QLJJC+hfCtg8uhS861GP4gocKSVs=;
 b=BxPXGOn/Kc47dZmPHttBQg26ftlWH3WMKscTbiIirpHMQ09uLuPlC/GFjPTd4E91Rt
 eDvJKkpimZkZv9NfWMABmng4gJFCjStnruUJVXUlsD/pWHxMYtISNxhlI5gxNU37avWn
 88NnTvvoICF10huc1VGk1w7nLY5cV+/I1fnixP0OdAPTELpoG6aDqwrg6J+RfsnH0FM7
 SY4T2CxhYgtJBDlgPMLPzJLe4a+vTAQ+OzaPLmsK/x+Sm89drkAf6x7XCtxjLIuyPvPn
 6J078FNDaYHWaOGbILLG8EKYGSO+x3ICswD1Ltcq48Jr6mny5DqOKxE0Vb8/SXx9Vxtd
 mKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xFob/yDzDWT7/o4QLJJC+hfCtg8uhS861GP4gocKSVs=;
 b=HtxYhp3OsqwN/EvU6UCORlWvGh1yYf2LrzD3s3LxF70iH/nQp3QAlhAihdAlJFghXR
 u1GKnTZtXLSPxaVEH9lzY06HZACitvbMhtucW4j4/gHeX0dpYi8zoBQRi2m8vDTHYlfQ
 aHixLWheS972314UIW9l+IZXqZ/+C5rSMkSmA0qKSF7iVCdd6VcbsMYYTSwfEdoEw50W
 1m59SIFFHJ5ryVZp8z/WzrEXoOgMY4bdN5lu6FBiyTZPN4TyKLJKIKTHyGKpNVJJ4HQI
 jAVdU34Q1sKsLj3oqJ2Z9JSMo8W7OsEzJa/QUbPiUnx0Ns4WL/epDMYMIkQcfsDi18n9
 Y/5A==
X-Gm-Message-State: AO0yUKUYy1reH9yPWRiXbIiHQfIByiAAwnTQOCMNc6wbOrCOEYYZbvyB
 flO03okzElXpGMjEvFC7HYFTzb7aXEM=
X-Google-Smtp-Source: AK7set+XJoDmS8aSKX0oeSVslYrexJcQBYbSaRwZoL6NBAqfsm/ilv4aQ7pyWcOegTkcnN2udupddA==
X-Received: by 2002:a17:906:25c9:b0:8af:4120:63a8 with SMTP id
 n9-20020a17090625c900b008af412063a8mr8623895ejb.68.1678954838372; 
 Thu, 16 Mar 2023 01:20:38 -0700 (PDT)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170907989300b008cf8c6f5c43sm3519895ejc.83.2023.03.16.01.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:20:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: DRM debugfs cleanup take 3
Date: Thu, 16 Mar 2023 09:20:28 +0100
Message-Id: <20230316082035.567520-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

I've messed up the last send out. Cleanup up some issues reported by people with the accel drivers (duplicated files) and rebased the result.

Apart from that the same approach we already discussed previously.

Please review and comment,
Christian.


