Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eifNHrOVk2kd6wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 23:09:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC0147DA9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 23:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0140E10E13A;
	Mon, 16 Feb 2026 22:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qpNKsgy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4B010E13A;
 Mon, 16 Feb 2026 22:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E4A142ACE;
 Mon, 16 Feb 2026 22:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5502C116C6;
 Mon, 16 Feb 2026 22:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771279790;
 bh=zOzp8N4OurZfP7u7Ty54SkroNFz43EvcoD2XN1P6v8k=;
 h=From:To:Cc:Subject:Date:From;
 b=qpNKsgy3KWYdCDG8dyzgHCMB/ON8MYPfSYabGQyPdWqZDwXaN+yyhRQzOgYXHEp+V
 gSu/Cw7fZhK/URC7W+ZlUPmD0cuAf5OHoNbi24H2Xw/I3WGUsLDCKG/CsN8rfCzsid
 TQLxEvOTLph0LDuRH9Jt5QFMec2ba/IRYm1FsYLlek1gSg2JQY5MyxIl3a+MSi1whV
 uHqR4slP18DEW3UZvx73vT8AtqlZfm75iiDTKiUw5UgsCDLqFtJ6ZA9RZ0/tinfOvc
 j4HIfZU55zR8scGAVxwn6iHZB7M8D9lVUHTWzLmfzAEk8TxIXZhH7nYZS/3PZ7WfDz
 EdUVKySVv7Ehw==
From: Danilo Krummrich <dakr@kernel.org>
To: lyude@redhat.com,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH] nouveau/gsp: fix memory leak in r535_gsp_acpi_dod() unwind
 paths
Date: Mon, 16 Feb 2026 23:09:42 +0100
Message-ID: <20260216220944.19633-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E3AC0147DA9
X-Rspamd-Action: no action

acpi_evaluate_object() allocates the output buffer when called with
ACPI_ALLOCATE_BUFFER.

Subsequent unwind path do not free the ACPI object however, hence fix
it.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Fixes: a9b9b42b54b2 ("nouveau/gsp: free acpi object after use")
Cc: stable@vger.kernel.org
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index a575a8dbf727..214ce78b0645 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -863,17 +863,18 @@ r535_gsp_acpi_dod(acpi_handle handle, DOD_METHOD_DATA *dod)
 
 	if (_DOD->type != ACPI_TYPE_PACKAGE ||
 	    _DOD->package.count > ARRAY_SIZE(dod->acpiIdList))
-		return;
+		goto out_free;
 
 	for (int i = 0; i < _DOD->package.count; i++) {
 		if (WARN_ON(_DOD->package.elements[i].type != ACPI_TYPE_INTEGER))
-			return;
+			goto out_free;
 
 		dod->acpiIdList[i] = _DOD->package.elements[i].integer.value;
 		dod->acpiIdListLen += sizeof(dod->acpiIdList[0]);
 	}
 
 	dod->status = 0;
+out_free:
 	kfree(output.pointer);
 }
 #endif

base-commit: 9478c166c46934160135e197b049b5a05753f2ad
-- 
2.53.0

