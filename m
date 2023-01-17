Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2E66E386
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6F510E1AA;
	Tue, 17 Jan 2023 16:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9F010E1B3;
 Tue, 17 Jan 2023 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673972737; x=1705508737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HxFIc/F4tODmGWHQvVFrU/McHRhB0/99ZlsYIwoeLug=;
 b=Zm7qUylfsx5griY8YzThxM32K11zvvoDEfu2azG7QY3Oj+w2QyLhKitp
 ejIeaPNpiggmYVXpQ5mySVVgGOYg1fFPkytHNU4oVfPqVj9vQgK8x2NtX
 JT3XBVrohK0pBbOQ9x3+vIka73CL+G+yP5HI5EpkNjgs961Pl5bSRHYUK
 0v6WSuNKAFc7u1kTvTXWpka6zFjvKerGI/8RxveBN/k/xcQ2/nUN0O+4l
 YLtYbZkZClndfk6v/WLe3a8Z6DGgeax1okNE2zXKzbsUL7D3b3AP3BCxE
 WlZo+Yp4G1VfdZ4vNBkY6YF5LE/3V8LTkYC6zQl5fioPjck0DY+nCmX0m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="410977287"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="410977287"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 08:25:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="833230009"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="833230009"
Received: from rdaly-mobl.ger.corp.intel.com (HELO [10.213.212.83])
 ([10.213.212.83])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 08:25:11 -0800
Message-ID: <db60bb1d-51b6-6830-5a4c-100ba38a2dbc@linux.intel.com>
Date: Tue, 17 Jan 2023 16:25:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 04/12] drm/cgroup: Track clients per owning process
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230112165609.1083270-5-tvrtko.ursulin@linux.intel.com>
 <20230117160311.GA15842@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230117160311.GA15842@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, cgroups@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenny.Ho@amd.com, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "T . J . Mercier" <tjmercier@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/01/2023 16:03, Stanislaw Gruszka wrote:
> Hi
> 
> On Thu, Jan 12, 2023 at 04:56:01PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> To enable propagation of settings from the cgroup drm controller to drm we
>> need to start tracking which processes own which drm clients.
>>
>> Implement that by tracking the struct pid pointer of the owning process in
>> a new XArray, pointing to a structure containing a list of associated
>> struct drm_file pointers.
>>
>> Clients are added and removed under the filelist mutex and RCU list
>> operations are used below it to allow for lockless lookup.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> <snip>
> 
>> +int drm_clients_open(struct drm_file *file_priv)
>> +{
>> +	struct drm_device *dev = file_priv->minor->dev;
>> +	struct drm_pid_clients *clients;
>> +	bool new_client = false;
>> +	unsigned long pid;
>> +
>> +	lockdep_assert_held(&dev->filelist_mutex);
>> +
>> +	pid = (unsigned long)rcu_access_pointer(file_priv->pid);
>> +	clients = xa_load(&drm_pid_clients, pid);
>> +	if (!clients) {
>> +		clients = __alloc_clients();
>> +		if (!clients)
>> +			return -ENOMEM;
>> +		new_client = true;
>> +	}
>> +	atomic_inc(&clients->num);
>> +	list_add_tail_rcu(&file_priv->clink, &clients->file_list);
>> +	if (new_client) {
>> +		void *xret;
>> +
>> +		xret = xa_store(&drm_pid_clients, pid, clients, GFP_KERNEL);
>> +		if (xa_err(xret)) {
>> +			list_del_init(&file_priv->clink);
>> +			kfree(clients);
>> +			return PTR_ERR(clients);
> 
> This looks incorrect, rather xa_err(xret) should be returned.

Thanks, looks like a copy & paste error. Noted to correct before next 
public post.

Regards,

Tvrtko
