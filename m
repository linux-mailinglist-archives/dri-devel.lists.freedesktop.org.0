Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E935FEAC5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B5910E356;
	Fri, 14 Oct 2022 08:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE3910E0C7;
 Fri, 14 Oct 2022 08:46:46 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k2so9029017ejr.2;
 Fri, 14 Oct 2022 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+aN2A0ehhtkEtRocQpMzVuWcHBSBNsbH9tQ2EdbWrIA=;
 b=bEnCbiRVZAW6Hf0gEBhLzILmvGfRxPPb/PvbjQZqNoJPAaG5BjsiwCLTggIe9pzlCH
 /7hRhUyNsdP8vy3H4QDintYKOAAIsZ2X78v0rlSSgYFkr/sFNbzdohVG86M8atEjEuEG
 Ng6u8Zv97wU4rKIcV/Mz17ovWzdhKoadFz3YytxE3hLSZTxqvRPYOxg9poAYGeK9NwgC
 35FaQ2ua7VX9psAlYrRcdB4ClZ2Nd/v4nx5hYD8k72zhr9XtCGRqZQPRIrkU2zbb1FZh
 s3qLE3Y72FAqQEbC6ndZAfSCm066fRur3977VRPHup7Dn+W+03oerBaMUVYyxb2pbFC6
 AVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+aN2A0ehhtkEtRocQpMzVuWcHBSBNsbH9tQ2EdbWrIA=;
 b=v0WtLgmBxBDNGusZgag7PXvnquuvicodrIDzU1cbrSbB526rd1zB+sXI5DG9OZ3tOF
 4KFSuZD5QfRreWqMspzUjs21KsJ0iZdEvYbC88+G6hF/cbkKBa0ljns7LAND9ocstPcD
 us/RE2/h2RPrFsoyZID9a0y7o+NO9YI4LeBPwXfeGZIapWNfZwhj9EJa4CYrKCS0cB98
 g4/WDmGxEAxg0QCN+NzypkuTT1v/6Lyjhcvt7ii4bRMzJa2s5QU3QsRPbY7JCZOAph01
 SYmpCT8g/2Op6dk+y2p78d1awH0guWFzazJ8LAwgbluT+eTcdc3otOK1dKd2mKN3XSa1
 iXUw==
X-Gm-Message-State: ACrzQf2YgzZ9W4yHzuwA0SBk11tyTViC+s1432npvwSTN5E//OOfbMsA
 +kd3Y7vdb5higWRYyVyDc5M=
X-Google-Smtp-Source: AMsMyM6O9xTZMUD7OBdDIbWQ4SI3D6TiLUgEhkccIKgrNh9mc4DUjxLzy+yEl2NanPShR2KfjBESvA==
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr2665393ejc.555.1665737205003; 
 Fri, 14 Oct 2022 01:46:45 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Fixes for scheduler hang when killing a process
Date: Fri, 14 Oct 2022 10:46:28 +0200
Message-Id: <20221014084641.128280-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

rebased those patches on top of amd-staging-drm-next since the
amdgpu changes are quite substencial.

Please review and comment,
Christian.


