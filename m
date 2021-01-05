Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F382EAC18
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 14:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FFB6E10A;
	Tue,  5 Jan 2021 13:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF056E106;
 Tue,  5 Jan 2021 13:44:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i9so36232294wrc.4;
 Tue, 05 Jan 2021 05:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUhdkztHJYfj4ts/wyIOknJ7qzjcn2uJGVM5qK+3CQU=;
 b=iPVTSsBwwjGyoqIbexKl5FsgUy7kU3RFisePUjWeuWQ5FG3P8Vz+NsVvcmYTJXjHU/
 RQcVKc9txFoAp7pnMkg5//gYZpls2+JnOraibK6aVfaN4wC/AlK4IkdvbcvM+jjlORLu
 ycizsWQ40v6b7fBeaQD19xfRZEMWwJb0Enwl3gTVxiwPk3sgL0vGL2Z42nx3pbse5bSd
 rAEVItjgh/1pM6gsI3Ne5RaZyzhejiXHbp6wtBY2bwJ4QFGm3x+1kERe9i30GKtHI65I
 8NJvVpfLJXuqL4PDnGrs8TUt/c9IHQ7JvJ7l3bT/gw3hCwB7J3cbralNclOoj6NvxRRB
 jKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUhdkztHJYfj4ts/wyIOknJ7qzjcn2uJGVM5qK+3CQU=;
 b=BSQd+O1hbZemmi3LvDDgb2lMv/3zJw+4AtbsOY92TWZ30oh/Zfs9r2BJRCveIQFtCP
 yz/QlmNtXzMGYRC1nTn9xNOu40kmIfXt3wo+IvdrC/4gl1saEfXaH/pocEmWmvJifrrh
 4o2t9Mfk3CH0UO5wiJAAZA8llCtRckRLyH4I+uY8gpEwpfy8UuKRIaj9fUJ2e/5oIV0x
 1blrsezpMZ7rGbFCFp9W8VnZ5mB2dAADyy7jyK77CO/cz0BYVqjLMTx20dmm+QYDdxhT
 9UAOeC1wqbyw+y3RpEREiRje0UpVlWEP9FxMIekp35LyoB5UwYWDTX+eVNZbbVhYyzj8
 a7sQ==
X-Gm-Message-State: AOAM530IOrEtVBdZTVpxNm90d0urycB0HxzCFz+GjvtlZbkMROIVA2Pv
 leAoitNzaU4KlvSEoDzPfnA=
X-Google-Smtp-Source: ABdhPJy6xlAThV+5qXmAyY1HeEGVnLN3jEG+J3dPe2Hvce+eVmaFPsjIPhEtJb/Kb423IPcqjcCROg==
X-Received: by 2002:a05:6000:222:: with SMTP id
 l2mr73339059wrz.392.1609854248788; 
 Tue, 05 Jan 2021 05:44:08 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3137:60b9:8d8f:7f55])
 by smtp.gmail.com with ESMTPSA id l20sm102191243wrh.82.2021.01.05.05.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:44:08 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bhelgaas@google.com
Subject: A PCI quirk for resizeable BAR 0 on Navi10
Date: Tue,  5 Jan 2021 14:44:00 +0100
Message-Id: <20210105134404.1545-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devspam@moreofthesa.me.uk, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

Darren stumbled over an AMD GPU with nonsense in it's resizeable BAR capability dword.

This is most likely fixable with a VBIOS update, but we already sold quite a bunch of those boards with the problem.

The driver still loads without this, but the performance isn't the best.

Do you have any objection to merge this through the drm branch?

Thanks in advance,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
