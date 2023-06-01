Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1F71FAEC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 09:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DA410E627;
	Fri,  2 Jun 2023 07:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 480 seconds by postgrey-1.36 at gabe;
 Thu, 01 Jun 2023 14:48:37 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF6D10E568
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 14:48:37 +0000 (UTC)
Received: from fpc.intra.ispras.ru (unknown [10.10.165.6])
 by mail.ispras.ru (Postfix) with ESMTPSA id B1CC140755C8;
 Thu,  1 Jun 2023 14:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru B1CC140755C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1685630433;
 bh=GxW32c51FDQOWKAHzqGDiyIkv54N+ouCAs5FBgOSLqE=;
 h=From:To:Cc:Subject:Date:From;
 b=tDQl3UfydlHbSkSB6A+CgkWBOh5Ferb+YBq/xZ0QBgQnn/ULZ5p8OaWb66gUciIz5
 WCkxwN9RZN1RPaizEIJFG1Ot9b3eqNGHf7X3GDrrTWdQ9iFnYqAxuz2aH8ftfRLXCS
 rHjtSGm9eQx0yGslaqoKe6TrqXS2X1oP/ARyr/1s=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: [PATCH 5.4/5.10 0/1] drm/atomic: Don't pollute crtc_state->mode_blob
 with error pointers
Date: Thu,  1 Jun 2023 17:40:15 +0300
Message-Id: <20230601144016.475176-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Jun 2023 07:26:38 +0000
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 fuyufan <fuyufan@huawei.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

general protection fault in drm_mode_object_put() is hit on 5.4/5.10 if
drm_property_create_blob() fails for some reason and state->mode_blob is
assigned an error pointer which is not treated correctly in some places as
mentioned in patch description.

The following patch fixes the issue and can be cleanly applied to 5.4/5.10
stable branches.

Seems the patch could not be initially backported due to DRM_DEBUG_ATOMIC
-> drm_dbg_atomic() change.
