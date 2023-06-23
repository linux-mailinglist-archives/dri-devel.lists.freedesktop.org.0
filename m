Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D389D73AFC4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 07:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ACC10E5D2;
	Fri, 23 Jun 2023 05:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2B410E5D2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 05:26:01 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b6824141b4so10167935ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 22:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687497961; x=1690089961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I74A3FzNlMiWSwenHJ0qW6K9Kk3RrnXa52gDQFbNI94=;
 b=FE8O7Vw+I3Rj3/ymdkfv8Bc+lpDZ080s6kF+VZ6KYuJ8IcvSDzEvJHrYtehbevzDKJ
 k39KSog3mD45RBSDswKQweqzUA8WL0SL0uOXty3tY4QBaCgZzpYfPiVwVN0bS3NDj5Wp
 Vlnc7que1gB/FOXny+Xqd3OrpA8296BqQ44lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687497961; x=1690089961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I74A3FzNlMiWSwenHJ0qW6K9Kk3RrnXa52gDQFbNI94=;
 b=TZjozVpkdPCbu7ldR4Z7JgUqJF8xGTYupFaGZ5PAilDffHTmE27tyBjA8Eqt7nDQg6
 s/NVwPpzbX6cbljvDMiaGONgPcdQMBY0QfPnMy8nYSRXl9VbO0+xYfsFg8osvnyTM6oz
 rvcA/Fm1Hzx8fK9CBuOLl8ud608CXc5p/lmypg8Mlvu8QpVPEE5bI7Ig6HU54aMtO/0g
 fJyrsQAjW/uOJ8/CRVpQ6YW0cX7SZjJ9h8SVVsYpTu8r2RYZ7TH49BFy/vZkOBPpn+a/
 rCQqwSyeUjtsRYOtOf+SFbeHancdQD8CLiIPdU//EYkqOMWzb+0/h2QX1wI+2is/sPdg
 I56A==
X-Gm-Message-State: AC+VfDxuuTwXvT2Vk5R303gqhiYuhJOMJYewoYLaetSQFWx6fdOBTo3h
 ISr92+5QOTDqOSFcprTrXusnog==
X-Google-Smtp-Source: ACHHUZ5sPbLx4vVXAJjIGembGjCJJyMTydKicDo1snyQX4c1P9pglVj/z3vqORh1yZ2I9l32bGJbWQ==
X-Received: by 2002:a17:902:ecc6:b0:1ae:8fa:cd4c with SMTP id
 a6-20020a170902ecc600b001ae08facd4cmr41235916plh.7.1687497961344; 
 Thu, 22 Jun 2023 22:26:01 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:3383:b451:fa2:1538])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b00192aa53a7d5sm6288753plg.8.2023.06.22.22.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 22:26:00 -0700 (PDT)
Date: Fri, 23 Jun 2023 14:25:54 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH 29/29] mm: shrinker: move shrinker-related code into a
 separate file
Message-ID: <20230623052554.GA11471@google.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-30-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622085335.77010-30-zhengqi.arch@bytedance.com>
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
Cc: djwong@kernel.org, roman.gushchin@linux.dev, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-ext4@vger.kernel.org,
 paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, vbabka@suse.cz,
 brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (23/06/22 16:53), Qi Zheng wrote:
> +/*
> + * Remove one
> + */
> +void unregister_shrinker(struct shrinker *shrinker)
> +{
> +	struct dentry *debugfs_entry;
> +	int debugfs_id;
> +
> +	if (!(shrinker->flags & SHRINKER_REGISTERED))
> +		return;
> +
> +	shrinker_put(shrinker);
> +	wait_for_completion(&shrinker->completion_wait);
> +
> +	mutex_lock(&shrinker_mutex);
> +	list_del_rcu(&shrinker->list);

Should this function wait for RCU grace period(s) before it goes
touching shrinker fields?

> +	shrinker->flags &= ~SHRINKER_REGISTERED;
> +	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
> +		unregister_memcg_shrinker(shrinker);
> +	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
> +	mutex_unlock(&shrinker_mutex);
> +
> +	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
> +
> +	kfree(shrinker->nr_deferred);
> +	shrinker->nr_deferred = NULL;
> +}
> +EXPORT_SYMBOL(unregister_shrinker);

[..]

> +void shrinker_free(struct shrinker *shrinker)
> +{
> +	kfree(shrinker);
> +}
> +EXPORT_SYMBOL(shrinker_free);
> +
> +void unregister_and_free_shrinker(struct shrinker *shrinker)
> +{
> +	unregister_shrinker(shrinker);
> +	kfree_rcu(shrinker, rcu);
> +}

Seems like this

	unregister_shrinker();
	shrinker_free();

is not exact equivalent of this

	unregister_and_free_shrinker();
