Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9A760B72
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC510E39D;
	Tue, 25 Jul 2023 07:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 538 seconds by postgrey-1.36 at gabe;
 Tue, 25 Jul 2023 03:27:16 UTC
Received: from out-20.mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73F310E150
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 03:27:16 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690255094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=keHNwQXyGxB+2fa9SqrEE3DvQ5TME2b5TMHAzSBP2pw=;
 b=HAeGJ99i5xFhmj3CijzGTxYLYsS22+UCkxr4poXrv7YrVuJ+ys1PsTwIPg8xpWVSxn9zir
 H57AkKYqiD1vOZNVzVNI7GcU+WBHpxaXuuBnNpw5g5o1ZYYgFiQKUmRNmm30EbXVxytcjf
 W5muscH4uShV5wnAUhi90ZLbjVnLzlo=
MIME-Version: 1.0
Subject: Re: [PATCH v2 02/47] mm: shrinker: remove redundant shrinker_rwsem in
 debugfs operations
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-3-zhengqi.arch@bytedance.com>
Date: Tue, 25 Jul 2023 11:17:24 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <210C013C-AB14-45BC-AB2E-199FF7F5E523@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-3-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 25 Jul 2023 07:19:08 +0000
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> The debugfs_remove_recursive() will wait for debugfs_file_put() to return,
> so the shrinker will not be freed when doing debugfs operations (such as
> shrinker_debugfs_count_show() and shrinker_debugfs_scan_write()), so there
> is no need to hold shrinker_rwsem during debugfs operations.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.


