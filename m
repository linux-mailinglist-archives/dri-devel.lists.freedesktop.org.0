Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA6998316
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 12:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1014210E8AB;
	Thu, 10 Oct 2024 10:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V2Q5PY1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7503010E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 10:02:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43118c9a955so3354785e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728554572; x=1729159372; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kcHzjc7RQkdaDki732vmbHCZytgfZBIAOdQqD7SywE=;
 b=V2Q5PY1en2QcyidNWQW1UdoRzzkgis9SxNKNYkhG5FytRFYF91UAC/UQIJvvSNyUd+
 wqezQm2BHo9z53nbTqbTTqM1Q/NOSm5lvJ5YIZNfIdIt2a2/gIckF24e3XiQVm5ub6KB
 wCgqkCx9GQDyoYnGv5kr3tPRaX1dXKT3aF98e10871HE4K3YmH3yb+qjC3op3Ix6iVx4
 4KQLKrRdAi2mq+4rglbyASLRefAQ0WFZwdOmZarVCICoG3abWZwcY3dOMV+mYug/wRzq
 xgHFccqPQ2t7HOEUIcG9j+iCj+z5C2/4XtNcpUyVQKqwN82TXhU5FLH9XNMaVx9w4B/o
 pV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728554572; x=1729159372;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kcHzjc7RQkdaDki732vmbHCZytgfZBIAOdQqD7SywE=;
 b=QLTTSvjJ1CBChBW9/q8nc4R6BZXG+fAyVk8IKQWBBOnKdy5pr4t8tY5Hk2hO6p/ar2
 1ndiLLhstXXAZvq1GgBCbtxit/3xa5PlZRSREJOapjF06KxrXCnkTwCWVDTKdGCZU7ux
 z+Ms6LLju7WU64qlXZneo4SDA6/PGYYehus72vevyOdNfxkDQ9c4eDVQsKkaUeHLAqzX
 9rMYpPRZshO/G/d5hUSqTPlAheHnWTXJDOSo2c+7l3ParHJ0MYvi5Pa+jJHV7Gqnap0j
 2HSgxqxvpsDJQ7AQeFzEaVwsJk2bZSDshPzYWbCWazOlMTW82rhdlebhtiYEZ4Yc3MNE
 oMXg==
X-Gm-Message-State: AOJu0YxXmpvT/1p6IV9VDDuCu5dtJN3FT5EQ3OvPGcQlbTK0BsUX/+Gz
 lHlUuLLcrgyyoTSXEH5A+UhFziC+ZBc0xzVkOAAZQ7qCEYvAaDOxkvZzuAKl8AusNe9aon+lb0D
 r
X-Google-Smtp-Source: AGHT+IHIkTEhdiY3xZpAyB/JkL/XvnYip5gPEWQ9NiFCnacCjaJ5Oe1T0gg7AW4f+UQ2xzXUMUE+ew==
X-Received: by 2002:a05:600c:a015:b0:42c:b4f1:f2ad with SMTP id
 5b1f17b1804b1-430d70b40d3mr47910045e9.33.1728554571661; 
 Thu, 10 Oct 2024 03:02:51 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182ffeb9sm11314315e9.11.2024.10.10.03.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 03:02:51 -0700 (PDT)
Date: Thu, 10 Oct 2024 13:02:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm: add DRM_SET_CLIENT_NAME ioctl
Message-ID: <d3f0d4ff-f14a-45f8-bd51-2d57159d919a@stanley.mountain>
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

Hello Pierre-Eric Pelloux-Prayer,

Commit 56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl") from Oct
3, 2024 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/drm_debugfs.c:104 drm_clients_info()
	warn: was precision intended? '64'

drivers/gpu/drm/drm_debugfs.c
    73 static int drm_clients_info(struct seq_file *m, void *data)
    74 {
    75         struct drm_debugfs_entry *entry = m->private;
    76         struct drm_device *dev = entry->dev;
    77         struct drm_file *priv;
    78         kuid_t uid;
    79 
    80         seq_printf(m,
    81                    "%20s %5s %3s master a %5s %10s %*s\n",
                                                          ^^^
this was probably intended to be %.*s

    82                    "command",
    83                    "tgid",
    84                    "dev",
    85                    "uid",
    86                    "magic",
    87                    DRM_CLIENT_NAME_MAX_LEN,
    88                    "name");
    89 
    90         /* dev->filelist is sorted youngest first, but we want to present
    91          * oldest first (i.e. kernel, servers, clients), so walk backwardss.
    92          */
    93         mutex_lock(&dev->filelist_mutex);
    94         list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
    95                 bool is_current_master = drm_is_current_master(priv);
    96                 struct task_struct *task;
    97                 struct pid *pid;
    98 
    99                 mutex_lock(&priv->client_name_lock);
    100                 rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
    101                 pid = rcu_dereference(priv->pid);
    102                 task = pid_task(pid, PIDTYPE_TGID);
    103                 uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
--> 104                 seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
                                                                         ^^
And this as well.  But why bother?  We know these strings are NUL terminated.

    105                            task ? task->comm : "<unknown>",
    106                            pid_vnr(pid),
    107                            priv->minor->index,
    108                            is_current_master ? 'y' : 'n',
    109                            priv->authenticated ? 'y' : 'n',
    110                            from_kuid_munged(seq_user_ns(m), uid),
    111                            priv->magic,
    112                            DRM_CLIENT_NAME_MAX_LEN,
    113                            priv->client_name ? priv->client_name : "<unset>");
    114                 rcu_read_unlock();
    115                 mutex_unlock(&priv->client_name_lock);
    116         }
    117         mutex_unlock(&dev->filelist_mutex);
    118         return 0;
    119 }

regards,
dan carpenter
