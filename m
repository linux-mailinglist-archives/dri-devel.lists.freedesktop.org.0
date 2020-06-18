Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D631FDBFB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 03:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D7D6EA3A;
	Thu, 18 Jun 2020 01:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D93F6EA3B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 01:16:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51AAD21D90;
 Thu, 18 Jun 2020 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442969;
 bh=fJMm2CCg7ywDeZmYVWPz791fm+yCXV3WCNJuxeWjzDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PfBJzXv0jYKeEItW0gkGuWe4b3dwoQBBw4aiRgHVWLnhL7z+olw+eDZIj8Ek5CxWQ
 fEeVhsjN4fgaIS5wrqY5Xhh5OdMa3rD5Mi5HvFsRsBgmjvFVKJWwCiwM1SSs4e7pBl
 4EZf9FY2Z+1m+LLV6ahXDLBgqs4u4IxWSKgfXbq4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 373/388] drm/ast: fix missing break in switch
 statement for format->cpp[0] case 4
Date: Wed, 17 Jun 2020 21:07:50 -0400
Message-Id: <20200618010805.600873-373-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Colin Ian King <colin.king@canonical.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 291ddeb621e4a9f1ced8302a777fbd7fbda058c6 ]

Currently the switch statement for format->cpp[0] value 4 assigns
color_index which is never read again and then falls through to the
default case and returns. This looks like a missing break statement
bug. Fix this by adding a break statement.

Addresses-Coverity: ("Unused value")
Fixes: 259d14a76a27 ("drm/ast: Split ast_set_vbios_mode_info()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20200610115804.1132338-1-colin.king@canonical.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_mode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cdd6c46d6557..479fc60b6c93 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -226,6 +226,7 @@ static void ast_set_vbios_color_reg(struct ast_private *ast,
 	case 3:
 	case 4:
 		color_index = TrueCModeIndex;
+		break;
 	default:
 		return;
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
