Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AEBC047B3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 08:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D236D10E15E;
	Fri, 24 Oct 2025 06:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HDajX2H2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C599C10E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:19:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-475c696ab23so9384185e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 23:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761286777; x=1761891577; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5IwxJGJ7DzTiw2mNsXiAqLEK3EPJP5A3SJ9dPAxbmRk=;
 b=HDajX2H21utgQ9PJ2VL3xlkvNkNi9CNQbnzBOlvHvrjhvP3NhORbxP2sQTw8LuvSgF
 KZoW38DE6QcN3/ydFICLFsCqauXB0kCve3e+zJROntHdMcp8PvCV2Th7dsUp5iO66TZ1
 ld7Qgzz+NqdocO6xIqv4ls1TSpSnL5q4J6eqnmn7HLVF5V7lrAS/RGj8EA22C4XafNMd
 6SbAHIUjg8RNXHkdaHE5+vkvIeVZm8O+lcfcLITLJ+IDU/REjS8NGgrKfDJx9UH8xQNb
 HERZtAvYUVZVkpz7YgIGcl4o1WKxwSMksGSEMkMrsNfXnwfKv+3Sb/dLAEkb4kKAtkTl
 p9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761286777; x=1761891577;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5IwxJGJ7DzTiw2mNsXiAqLEK3EPJP5A3SJ9dPAxbmRk=;
 b=TYem6qvjr5PVHu/ne8+TT10IAs8azcgvzjUishydpPS+gxD6V9952Vi3tO1Slfe7h+
 g3IhAqBfplDHsHtcnlVlPxBdMLXLYyiBHQ8vCBgGPm5nH88+ee1HKMVb+rb84G9tBln+
 iXiYvYsehSLSVBxB8dXVQ65InKRu1/Zd/f8d0EJvNR39gqCOlvjcn0a1Y59IQkL3MHQ9
 V8JlCdJTf+rH+jN1dfHYKxZ2fquAjsL8lTdBmRW+dgP/a3Ln2++2R4vNatrcRGdN9Uhb
 9OiI+M28pnxWTRV7c8/qmbVviE8kc/To0UV9ll8Ef4TlRXFSWgxHQNXBFi/99nVuxbjF
 u9GQ==
X-Gm-Message-State: AOJu0YzVYbrOxGSUL0QJehT6zD5F479gxDHnZfvD2MAkHVcJ+OAs5YkN
 n6oaUnhiBlN14QQNTycVZAZLtQnH5oHpUIyNYzT9r4wBMmvDInmIlwG+tWs8msd1GHE=
X-Gm-Gg: ASbGncub5GFIax795ZaUqNZZeED/jnz5Y3Zkk1iWHxPV+T5HnolsWFw7UpoLa0Ie9HN
 EYQMR5QVgzzBVeCXZIjAyOU6WBD9CtvGmx7D+stMkm3cfE051vKaWwCmIvMpB1D/xRlJz2+ElUy
 sBDtT2TCzRYzgd4ZM4tw9RzHyn3pxHsV1glwkIYlU4SFapt2ssO0yUFmqorMGuYbt+/kegn6OGv
 VpCf5bfE7CaZejqQbegEkM9y8yQ1LjR6bWu2UGBBbCoChA3+FKe0g4F2IJgrAwEdobppaWn9HIi
 TXqQ6X4ZnqdpANtMoV+wGjEhPqOsYjuO67+mNwLuC4CN0j92tMqSmGHA/LVlJyIQBQlrrG0DKHL
 eBM2SmQeUK0fLZyb81fyfZQzNhme2KRzD/dBjqpHEVIQrW7W7idFXHv6cTcAwcmemJEWr5p3sSK
 0aHBZvWA==
X-Google-Smtp-Source: AGHT+IGTR0iChRXA7+VWUfaHWzrEuGmw/yV2B/q9gMtt/YAlqllzO+F3bXq5nxYcZt/bQaPx6Ft+Hg==
X-Received: by 2002:a05:600c:3496:b0:471:1702:f41a with SMTP id
 5b1f17b1804b1-475d2edacffmr8122145e9.33.1761286777154; 
 Thu, 23 Oct 2025 23:19:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-475c428f709sm134899805e9.8.2025.10.23.23.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:19:36 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:19:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] accel/amdxdna: Support firmware debug buffer
Message-ID: <aPsadTBXunUSBByV@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Lizhi Hou,

Commit 7ea046838021 ("accel/amdxdna: Support firmware debug buffer")
from Oct 16, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/accel/amdxdna/aie2_ctx.c:882 aie2_hwctx_sync_debug_bo()
	warn: missing error code? 'ret'

drivers/accel/amdxdna/aie2_ctx.c
    863 int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
    864 {
    865         struct amdxdna_client *client = hwctx->client;
    866         struct amdxdna_dev *xdna = client->xdna;
    867         struct amdxdna_drv_cmd cmd = { 0 };
    868         u64 seq;
    869         int ret;
    870 
    871         cmd.opcode = SYNC_DEBUG_BO;
    872         ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
    873                                  &debug_bo_hdl, 1, hwctx->id, &seq);
    874         if (ret) {
    875                 XDNA_ERR(xdna, "Submit command failed");
    876                 return ret;
    877         }
    878 
    879         aie2_cmd_wait(hwctx, seq);
    880         if (cmd.result) {
    881                 XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
--> 882                 return ret;

ret is zero.  return -EINVAL or something?

    883         }
    884 
    885         return 0;
    886 }

regards,
dan carpenter
