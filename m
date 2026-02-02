Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEBdLaBhgGlj7AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:34:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E4C9B54
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AD810E24D;
	Mon,  2 Feb 2026 08:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D7A10E0EB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 00:50:13 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.198])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f47LR4BBmzKHMNp
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 08:49:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 05E1640576
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 08:50:11 +0800 (CST)
Received: from [10.67.111.176] (unknown [10.67.111.176])
 by APP4 (Coremail) with SMTP id gCh0CgCXQvO99H9pvgrJFw--.27306S2;
 Mon, 02 Feb 2026 08:50:06 +0800 (CST)
Message-ID: <9c7d1cc5-a462-4524-9e1c-f5d94575dc73@huaweicloud.com>
Date: Mon, 2 Feb 2026 08:50:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 1/3] cgroup/dmem: fix NULL pointer dereference when
 setting max
To: kernel test robot <lkp@intel.com>, dev@lankhorst.se, mripard@kernel.org,
 natalie.vock@gmx.de, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lujialin4@huawei.com
References: <20260131091202.344788-2-chenridong@huaweicloud.com>
 <202602010100.5CjcoPFh-lkp@intel.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <202602010100.5CjcoPFh-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgCXQvO99H9pvgrJFw--.27306S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr43XF4xGw13GF4xKFyxAFb_yoWrCF13pa
 yru3yYgryrWr10qw4qy340vr9Yyw1kJa17C3y8Jw4UWr4Iv3s0yF4xKr4agryakr97KrWY
 qF90vFnaq3yjvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
 wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1
 v3UUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-Mailman-Approved-At: Mon, 02 Feb 2026 08:34:36 +0000
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[huaweicloud.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:dev@lankhorst.se,m:mripard@kernel.org,m:natalie.vock@gmx.de,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:oe-kbuild-all@lists.linux.dev,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[intel.com,lankhorst.se,kernel.org,gmx.de,cmpxchg.org,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[chenridong@huaweicloud.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[chenridong@huaweicloud.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,huaweicloud.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1E5E4C9B54
X-Rspamd-Action: no action



On 2026/2/1 1:26, kernel test robot wrote:
> Hi Chen,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20260130]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/cgroup-dmem-fix-NULL-pointer-dereference-when-setting-max/20260131-173002
> base:   next-20260130
> patch link:    https://lore.kernel.org/r/20260131091202.344788-2-chenridong%40huaweicloud.com
> patch subject: [PATCH -next 1/3] cgroup/dmem: fix NULL pointer dereference when setting max
> config: x86_64-randconfig-161-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010100.5CjcoPFh-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> smatch version: v0.5.0-8994-gd50c5a4c
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010100.5CjcoPFh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602010100.5CjcoPFh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> kernel/cgroup/dmem.c:703:7: warning: variable 'region' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>      703 |                 if (!options || !*options) {
>          |                     ^~~~~~~~~~~~~~~~~~~~~
>    kernel/cgroup/dmem.c:729:13: note: uninitialized use occurs here
>      729 |                 kref_put(&region->ref, dmemcg_free_region);
>          |                           ^~~~~~
>    kernel/cgroup/dmem.c:703:3: note: remove the 'if' if its condition is always false
>      703 |                 if (!options || !*options) {
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      704 |                         err = -EINVAL;
>          |                         ~~~~~~~~~~~~~~
>      705 |                         goto out_put;
>          |                         ~~~~~~~~~~~~~
>      706 |                 }
>          |                 ~
>>> kernel/cgroup/dmem.c:703:7: warning: variable 'region' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
>      703 |                 if (!options || !*options) {
>          |                     ^~~~~~~~
>    kernel/cgroup/dmem.c:729:13: note: uninitialized use occurs here
>      729 |                 kref_put(&region->ref, dmemcg_free_region);
>          |                           ^~~~~~
>    kernel/cgroup/dmem.c:703:7: note: remove the '||' if its condition is always false
>      703 |                 if (!options || !*options) {
>          |                     ^~~~~~~~~~~
>    kernel/cgroup/dmem.c:685:36: note: initialize the variable 'region' to silence this warning
>      685 |                 struct dmem_cgroup_region *region;
>          |                                                  ^
>          |                                                   = NULL
>    2 warnings generated.
> 
> 
> vim +703 kernel/cgroup/dmem.c
> 
>    674	
>    675	static ssize_t dmemcg_limit_write(struct kernfs_open_file *of,
>    676					 char *buf, size_t nbytes, loff_t off,
>    677					 void (*apply)(struct dmem_cgroup_pool_state *, u64))
>    678	{
>    679		struct dmemcg_state *dmemcs = css_to_dmemcs(of_css(of));
>    680		int err = 0;
>    681	
>    682		while (buf && !err) {
>    683			struct dmem_cgroup_pool_state *pool = NULL;
>    684			char *options, *region_name;
>    685			struct dmem_cgroup_region *region;
>    686			u64 new_limit;
>    687	
>    688			options = buf;
>    689			buf = strchr(buf, '\n');
>    690			if (buf)
>    691				*buf++ = '\0';
>    692	
>    693			options = strstrip(options);
>    694	
>    695			/* eat empty lines */
>    696			if (!options[0])
>    697				continue;
>    698	
>    699			region_name = strsep(&options, " \t");
>    700			if (!region_name[0])
>    701				continue;
>    702	
>  > 703			if (!options || !*options) {
>    704				err = -EINVAL;
>    705				goto out_put;
>    706			}
>    707	

Thanks.

I missed that region is uninitialized. It could just return -EINVAL.
I'll fix it in the next version. If anyone has other opinions, I would like to
update together.

>    708			rcu_read_lock();
>    709			region = dmemcg_get_region_by_name(region_name);
>    710			rcu_read_unlock();
>    711	
>    712			if (!region)
>    713				return -EINVAL;
>    714	
>    715			err = dmemcg_parse_limit(options, region, &new_limit);
>    716			if (err < 0)
>    717				goto out_put;
>    718	
>    719			pool = get_cg_pool_unlocked(dmemcs, region);
>    720			if (IS_ERR(pool)) {
>    721				err = PTR_ERR(pool);
>    722				goto out_put;
>    723			}
>    724	
>    725			/* And commit */
>    726			apply(pool, new_limit);
>    727	
>    728	out_put:
>    729			kref_put(&region->ref, dmemcg_free_region);
>    730		}
>    731	
>    732	
>    733		return err ?: nbytes;
>    734	}
>    735	
> 

-- 
Best regards,
Ridong

