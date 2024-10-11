Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4935999EDA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C30810E2F3;
	Fri, 11 Oct 2024 08:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="qSLPE3lu";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="pJuK/znh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622BF10E2F3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728634803;
 bh=SANqCSpV7C1Ttt6C/eUmBtG
 yksDGlRh3Asc6ARJSSR8=; b=qSLPE3luBkKW/OzUulQBjhImM3P3+NACeaKfWI1z+e5X0Ad7jl
 JFwU9uZugNtm0/lq5zKV33J/WE+t2MKbJwZuSmBKqBhXZhPdDOdBuxKW6u3YKZdWxFcCDiIcp0w
 FYC/d/hRf6WoRpK84sIpx8VlnYpbhTQgMttVV0HDruPc77Mt68naS4lqOTIlEmG27GVdfKGM0o5
 K3MH2xi+qJ/MURpGBgEIdk9q95xoGP3m/Lm1QAItTwOXDsWeIQamDAKAuhLVg9QggHCI16UTf+3
 TZ7ZKQwGR7TNBjdA7YwTg9jJXlStIusZu6ux3Biqcp/jfX2BuE+wXDAH6GLDqmN7Q5Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728634803; bh=SANqCSpV7C1Ttt6C/eUmBtG
 yksDGlRh3Asc6ARJSSR8=; b=pJuK/znh0n4RiAshVZL1XVrpvboLL9rBew8+LeMc3+MWFgOBOF
 ziPPE4euFASDj29xXCKRCI/RVJ0eLg54sCAA==;
Message-ID: <0c91f3be-4d9a-4c78-be2f-a43e1c6f1b10@damsy.net>
Date: Fri, 11 Oct 2024 10:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm: add DRM_SET_CLIENT_NAME ioctl
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org
References: <d3f0d4ff-f14a-45f8-bd51-2d57159d919a@stanley.mountain>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <d3f0d4ff-f14a-45f8-bd51-2d57159d919a@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Hi,

Le 10/10/2024 à 12:02, Dan Carpenter a écrit :
> Hello Pierre-Eric Pelloux-Prayer,
> 
> Commit 56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl") from Oct
> 3, 2024 (linux-next), leads to the following Smatch static checker
> warning:
> 
> 	drivers/gpu/drm/drm_debugfs.c:104 drm_clients_info()
> 	warn: was precision intended? '64'
> 
> drivers/gpu/drm/drm_debugfs.c
>      73 static int drm_clients_info(struct seq_file *m, void *data)
>      74 {
>      75         struct drm_debugfs_entry *entry = m->private;
>      76         struct drm_device *dev = entry->dev;
>      77         struct drm_file *priv;
>      78         kuid_t uid;
>      79
>      80         seq_printf(m,
>      81                    "%20s %5s %3s master a %5s %10s %*s\n",
>                                                            ^^^
> this was probably intended to be %.*s

No. The intent is to right-align the string, similar to what is done for the other
string fields.
It could have been written %64s, but since DRM_CLIENT_NAME_MAX_LEN exist, I've used
the %*s syntax.

Pierre-Eric


> 
>      82                    "command",
>      83                    "tgid",
>      84                    "dev",
>      85                    "uid",
>      86                    "magic",
>      87                    DRM_CLIENT_NAME_MAX_LEN,
>      88                    "name");
>      89
>      90         /* dev->filelist is sorted youngest first, but we want to present
>      91          * oldest first (i.e. kernel, servers, clients), so walk backwardss.
>      92          */
>      93         mutex_lock(&dev->filelist_mutex);
>      94         list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
>      95                 bool is_current_master = drm_is_current_master(priv);
>      96                 struct task_struct *task;
>      97                 struct pid *pid;
>      98
>      99                 mutex_lock(&priv->client_name_lock);
>      100                 rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>      101                 pid = rcu_dereference(priv->pid);
>      102                 task = pid_task(pid, PIDTYPE_TGID);
>      103                 uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
> --> 104                 seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
>                                                                           ^^
> And this as well.  But why bother?  We know these strings are NUL terminated.
> 
>      105                            task ? task->comm : "<unknown>",
>      106                            pid_vnr(pid),
>      107                            priv->minor->index,
>      108                            is_current_master ? 'y' : 'n',
>      109                            priv->authenticated ? 'y' : 'n',
>      110                            from_kuid_munged(seq_user_ns(m), uid),
>      111                            priv->magic,
>      112                            DRM_CLIENT_NAME_MAX_LEN,
>      113                            priv->client_name ? priv->client_name : "<unset>");
>      114                 rcu_read_unlock();
>      115                 mutex_unlock(&priv->client_name_lock);
>      116         }
>      117         mutex_unlock(&dev->filelist_mutex);
>      118         return 0;
>      119 }
> 
> regards,
> dan carpenter
