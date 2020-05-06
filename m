Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94E1C69B3
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E726E834;
	Wed,  6 May 2020 07:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD96589D40
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 06:37:23 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id v63so499144pfb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 23:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rIPn6skz9+CHSHwUFC2MWOYr0F1v/VhKVMihvs/Yn2I=;
 b=myJHeLrNnuX96MEy+Ht1sxEO3nat0eNyp43GrBz1UV9or6MePLmuXspff6fNrPOJli
 uaK7UDE9CELgO8T/n5hweWcOYGQlVJ2W1VjGpdfHBkXxBe/hhMFvP3b9brncj9jg66QT
 vgfvN6ZqDxY0+/eEuZbi+pAEU9tK091NnoRaafqNwVwLRefKGtImCAbehEmqeV0oUXha
 5CDa6BnJFZ/GVtthtpc18kqa2XdMM7r9yL2Avgmev8hhJSobCgjMFvE/yeLyiN9hF4UP
 ucCDWVEECvfkpCKsmuI+dD5okt+9dWJUGmcsFAf/wE6/Lh02xbg5XdDDxmNIz5JWbA0B
 fDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rIPn6skz9+CHSHwUFC2MWOYr0F1v/VhKVMihvs/Yn2I=;
 b=oVyvGtE4GMqerlGV6RTHwBuk7G0ASW31HBSKuvCp6lpFTuPPw9oeUUCtuRyxUKIkyv
 FGID2K/M5yAZch1cVcxI3qAuNaEZ31HWOQxC1TZWMxHvoyILE8RHhA+sErIo17Jvlzsn
 bxM+qSoona64biG5AipKA5K/QAz14RbEUI45UWkb8lS12R6yL9sSekLlocYzPKukhn04
 vLRaZpbHPCdJOrLqFmW4vEyyKUZxvb6X263yMWS16lgVWrDVSi/iXpuo/H7M/fi8pVo6
 DwchxU9dYJh9RX8u9pD89bThg83YRVqUdL/ZAaA2eta5zeWJ3tmod4IOpXA7WTBFlk4D
 GyOw==
X-Gm-Message-State: AGi0PuYL58/RgGe/T5dcBYB6Fo91IwNYXxLOw6JGGG3Jsw8REysRDxpz
 uEyZ0oI7RJSToUE/JM05yYY=
X-Google-Smtp-Source: APiQypJEf/R2iKSuVCdwxeAuyZgpQKI7r0/Np98az14Yv13VQZPHyObMBygThGu1TSCu5L7uaNH+3A==
X-Received: by 2002:aa7:9811:: with SMTP id e17mr6476248pfl.70.1588747043563; 
 Tue, 05 May 2020 23:37:23 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id y63sm773289pfg.138.2020.05.05.23.37.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 23:37:23 -0700 (PDT)
From: dillon.minfei@gmail.com
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, alexandre.torgue@st.com
Subject: [PATCH 3/4] drm/panel: Add Ilitek ILI9341 driver 
Date: Wed,  6 May 2020 14:37:16 +0800
Message-Id: <1588747037-31198-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Add drm panel driver ilitek ili9341 , based on panel/panel-ilitek-ili9322.c
currently just support rgb input only
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
