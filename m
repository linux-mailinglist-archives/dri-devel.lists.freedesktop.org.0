Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C31E6F69
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01C96E83A;
	Thu, 28 May 2020 22:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328BF6E4AE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 07:57:17 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id 18so26733213iln.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=p7OtJu9SWRWuWAZugiOQ/GtMAUzRk2XxEkhbAZOgWvo=;
 b=o6fJBmajAzy3r+vnagGOQJAH5jdc0wu66ADhRQN62wlJM7L5T00Rtm1RBmUhP4+JHE
 m0QPm+olnfarBILKM3/LldtMJDE8LTSXWjX1vjcJf+X3S4IIBNFtCgqtqruEGOP+pToU
 bcPlxK8x/xISiRbuhKxFG09JQb/Oi7WibW7tQQ7hlTa55Xri7wuJgx8AgDQ50d9DNWgT
 8xCiriwd1VtXgLYuuaP+vxvI/bGQpuGmo29DVKHttO5n/11zClFRMIXY3lbNuMHoafuS
 cW9qTtL9QLCVZ90jRYhOCp7So+2xSz6JR3utwdRj1gonXgzBNiqwGk1je826yad9xjXu
 aqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=p7OtJu9SWRWuWAZugiOQ/GtMAUzRk2XxEkhbAZOgWvo=;
 b=Uyo03ACquqB0gXiEv3pQe5oXXbmRxGUfD5hHzwA4wq3PH1fbh9nyEewgGGAWGTie6v
 +v8f755oQuyks8FWvJjFgpSWIC8ctSGB0g5ZoXV+2dcP8nzn8y3MMd7MmMuteyUPoY0b
 iGjpUv0Gjq51Uux/FsiJ+fGoLfJcxSU/uXKikEcyLvnU0z9P/By0ghLmIvWI8Unf6EtN
 pGnoi5BcQIg25WcMzGRf+3wFdSiliJdXdV/BDd8Mo/gZIAWLzkck25spRZzTRFv28et0
 jpLFxDCAy+ZV6/7YmYEza/T3yOQ/04CJq3Me6T9CptmRgkLrHl1KPIzqVPVWh0UCrEwI
 EDnw==
X-Gm-Message-State: AOAM533W3si6p/X1KvBoA7anT9zhPpb/gOlhNKp/habm7M6P3aTn9SiD
 pHdx7uh/nvuIMFqXEErCM+iyrI5LdmdSB2y8MFs=
X-Google-Smtp-Source: ABdhPJwmsucw+Kusy0NcdD8R6zOVjM9QWGKmz2O4vzA9lapn8uhrR7QppgOvVOySMSlwmaVg67d8J8Sj5chmHxpnUYQ=
X-Received: by 2002:a92:5e4a:: with SMTP id s71mr654738ilb.119.1590652636533; 
 Thu, 28 May 2020 00:57:16 -0700 (PDT)
MIME-Version: 1.0
From: Dongyang Zhan <zdyzztq@gmail.com>
Date: Thu, 28 May 2020 15:57:05 +0800
Message-ID: <CAFSR4ctYjWc8LSqb96Suwprv9=Gd0+vVPZ5pLn+5u1CV7wTq9Q@mail.gmail.com>
Subject: Potential Memory Leak Bugs in drivers/gpu/drm/virtio/virtgpu_vq.c
 (Linux 5.6).
To: airlied@linux.ie, kraxel@redhat.com
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
My name is Dongyang Zhan, I am a security researcher.
Currently, I found two possible memory bugs in
drivers/gpu/drm/virtio/virtgpu_vq.c (Linux 5.6).
I hope you can help me to confirm them. Thank you.

The first one is resp_buf will not be release in
virtio_gpu_cmd_get_display_info() with the condition
(resp_size <= MAX_INLINE_RESP_SIZE) in virtio_gpu_alloc_cmd_resp().

int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
{
struct virtio_gpu_ctrl_hdr *cmd_p;
struct virtio_gpu_vbuffer *vbuf;
void *resp_buf;
...
resp_buf = kzalloc(sizeof(struct virtio_gpu_resp_display_info), GFP_KERNEL);
if (!resp_buf)
     return -ENOMEM;
cmd_p =virtio_gpu_alloc_cmd_resp(vgdev,&virtio_gpu_cmd_get_display_info_cb,
&vbuf,
sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_display_info),resp_buf); //
memset(cmd_p, 0, sizeof(*cmd_p));
...
return 0;
}

virtio_gpu_get_vbuf(struct virtio_gpu_device *vgdev,
   int size, int resp_size, void *resp_buf,
   virtio_gpu_resp_cb resp_cb)
{
struct virtio_gpu_vbuffer *vbuf;

vbuf = kmem_cache_zalloc(vgdev->vbufs, GFP_KERNEL);
if (!vbuf)
return ERR_PTR(-ENOMEM);

BUG_ON(size > MAX_INLINE_CMD_SIZE);
vbuf->buf = (void *)vbuf + sizeof(*vbuf);
vbuf->size = size;

vbuf->resp_cb = resp_cb;
vbuf->resp_size = resp_size;
if (resp_size <= MAX_INLINE_RESP_SIZE)
vbuf->resp_buf = (void *)vbuf->buf + size; // resp_buf will never be released.
else
vbuf->resp_buf = resp_buf;
BUG_ON(!vbuf->resp_buf);
return vbuf;
}

The second one is in virtio_gpu_cmd_get_edids(), which is similar with
the last one. resp_buf will not be released.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
