Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C78765DA8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 22:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1DE10E153;
	Thu, 27 Jul 2023 20:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E0710E153
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 20:58:57 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b9edef7993so1128198a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690491536; x=1691096336;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cgFwAswQmjO6RRJH8C8fVReymuExwqWsXP8PT504854=;
 b=YsU4iISueu4rbfXdQNbc4xgE322yahzAASiagBjMqU7CW1hDiZVoP6L7GKlWQ1IdhA
 4LGKIlk+yoh6+ua09qBiYJAJdkumn8HG2a82pM1S3rCk8KzZYaYvYyRox8MVyy50LBmW
 WHBu6RRotFuE4gvCag+/lc/OWYUPNZpfZPyvho4QUZoCMSSvaRaC4GI6Gm5jMVRNCtPB
 3PcM3c5kX+JNIjbzO48laxJUQi+bDbD2Od31CuOLQTI1qlYT4wN4x46nAJgmmmLc0T1e
 JDu6cwPSslnI7XQHz7sn9cte/CzKFQdOp2f0+zWj1z8e+M9TrVELSM4VOcOClCweOF1j
 sf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690491536; x=1691096336;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cgFwAswQmjO6RRJH8C8fVReymuExwqWsXP8PT504854=;
 b=CSfyMmwILzUlEcFbkPHudNsV0mNuCKYdkVJb38njP8LIItvT19EB6U3Fs95AYlQq5p
 pyOdPr4UXTxfSlqTg9hu+P+1bM6+Kta/AYA7WdX6zAEEiWX+Ipln3rrwdVtUq33Ok9GH
 XSxNdpmFD0cf2eH+moc8FFE3mFJBUzSHfwiIekHPSW1cwSN9Ey8LP9dEtOzXcz7dFjsY
 2rhRgRw+Ldm2Qm9eoVzvUqbR2bNMFgFgNdE2WG/5un400ZlCo5MM3lGb3LnNwywzot3t
 nTleLpuPAcOafuEoflpc6HcUP/59zUF6bmhyNTACAFFTMtRpWbQtH1DOyu6YL+xiJ8GB
 s67A==
X-Gm-Message-State: ABy/qLZqgDjYuptRIh2o5vd3rm37ba2u+RGXoRZfEESjbKpZET9DnVBN
 c/nU2stLkbvpHyRC3lRMQI9LQU2Cz04g7F3G8K2FQ7Qt
X-Google-Smtp-Source: APBJJlHxHwPLGn5g3UhlyNFvJ09TBUMQ2Pwft9qomcqpecI2mkUYflB82D9GvQh/uXrdSaPxXPYacYzNpvRpILCeJN4=
X-Received: by 2002:a05:6870:f69f:b0:1ba:f098:3278 with SMTP id
 el31-20020a056870f69f00b001baf0983278mr505281oab.38.1690491536485; Thu, 27
 Jul 2023 13:58:56 -0700 (PDT)
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Jul 2023 16:58:45 -0400
Message-ID: <CADnq5_Pr8Z=vNO3iEpHNqkV0mb8gNzN7Zvf9HSW0Sf3Q0yy=Pw@mail.gmail.com>
Subject: CPU overhead for drm fdinfo stats
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, Rob Clark <robdclark@gmail.com>, 
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

We have a number of customers using these stats, but the issue that
keeps coming up is the CPU overhead to gather them, particularly on
systems with hundreds of processes using the GPU.  Has anyone given
any thought to having a single interface to get this information for
the entire GPU in one place?

Thanks,

Alex
