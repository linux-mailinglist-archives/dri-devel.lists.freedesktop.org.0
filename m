Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8986345C1E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000BE6E884;
	Tue, 23 Mar 2021 10:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0D16E884
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fIF3jWUgSkSbTznLFYdO6OZn/xVm/NOBKuar0sIutfg=; b=YVjo3IfikXNvOwlhh3PXNMoGD0
 lT27zTGWlpUtQc8zz6lOvSi9HNZjv8xxSItbGZsF5sj0vPTLlXQ7avGRO6xJFluyQtD7Erv/ecpi/
 4Xeu7496cVe8/l9eq8KE6d/xYkMeHTEwT52WxhZ0uv2yKBqI4BqH1NKXFsa20UKAd3A+qMJyQMH9y
 7nipk4iMYpx4l/MNk7k/f2fJ89Ei7jjiHlbHa2lOh7bu27GxJCRzpai1WimBbTKN3RKNbhTHLoJg1
 Px+dJ6vBST6t0E4DULxOFLNU/c0Oo+BqL12Bjim2fx3hXhS1MO57YWxJWDRvgou1IAc8qQoNAjUT2
 ywiOmg3A==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lOeWU-00079q-6z; Tue, 23 Mar 2021 12:44:30 +0200
Subject: Re: [PATCH v5 06/21] gpu: host1x: Cleanup and refcounting for
 syncpoints
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-7-mperttunen@nvidia.com>
 <YFnEpcHRDqhQPPom@orome.fritz.box>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6e4340b2-bde0-6811-866c-048997d434fe@kapsi.fi>
Date: Tue, 23 Mar 2021 12:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFnEpcHRDqhQPPom@orome.fritz.box>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/23/21 12:36 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:04PM +0200, Mikko Perttunen wrote:
>> Add reference counting for allocated syncpoints to allow keeping
>> them allocated while jobs are referencing them. Additionally,
>> clean up various places using syncpoint IDs to use host1x_syncpt
>> pointers instead.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v5:
>> - Remove host1x_syncpt_put in submit code, as job_put already
>>    puts the syncpoint.
>> - Changes due to rebase in VI driver.
>> v4:
>> - Update from _free to _put in VI driver as well
>> ---
>>   drivers/gpu/drm/tegra/dc.c             |  4 +-
>>   drivers/gpu/drm/tegra/drm.c            | 14 ++---
>>   drivers/gpu/drm/tegra/gr2d.c           |  4 +-
>>   drivers/gpu/drm/tegra/gr3d.c           |  4 +-
>>   drivers/gpu/drm/tegra/vic.c            |  4 +-
>>   drivers/gpu/host1x/cdma.c              | 11 ++--
>>   drivers/gpu/host1x/dev.h               |  7 ++-
>>   drivers/gpu/host1x/hw/cdma_hw.c        |  2 +-
>>   drivers/gpu/host1x/hw/channel_hw.c     | 10 ++--
>>   drivers/gpu/host1x/hw/debug_hw.c       |  2 +-
>>   drivers/gpu/host1x/job.c               |  5 +-
>>   drivers/gpu/host1x/syncpt.c            | 75 +++++++++++++++++++-------
>>   drivers/gpu/host1x/syncpt.h            |  3 ++
>>   drivers/staging/media/tegra-video/vi.c |  4 +-
>>   include/linux/host1x.h                 |  8 +--
>>   15 files changed, 98 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index 85dd7131553a..033032dfc4b9 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -2129,7 +2129,7 @@ static int tegra_dc_init(struct host1x_client *client)
>>   		drm_plane_cleanup(primary);
>>   
>>   	host1x_client_iommu_detach(client);
>> -	host1x_syncpt_free(dc->syncpt);
>> +	host1x_syncpt_put(dc->syncpt);
>>   
>>   	return err;
>>   }
>> @@ -2154,7 +2154,7 @@ static int tegra_dc_exit(struct host1x_client *client)
>>   	}
>>   
>>   	host1x_client_iommu_detach(client);
>> -	host1x_syncpt_free(dc->syncpt);
>> +	host1x_syncpt_put(dc->syncpt);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index e45c8414e2a3..5a6037eff37f 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -171,7 +171,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>   	struct drm_tegra_syncpt syncpt;
>>   	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
>>   	struct drm_gem_object **refs;
>> -	struct host1x_syncpt *sp;
>> +	struct host1x_syncpt *sp = NULL;
>>   	struct host1x_job *job;
>>   	unsigned int num_refs;
>>   	int err;
>> @@ -298,8 +298,8 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>   		goto fail;
>>   	}
>>   
>> -	/* check whether syncpoint ID is valid */
>> -	sp = host1x_syncpt_get(host1x, syncpt.id);
>> +	/* Syncpoint ref will be dropped on job release. */
>> +	sp = host1x_syncpt_get_by_id(host1x, syncpt.id);
> 
> It's a bit odd to replace the comment like that. Perhaps instead of
> replacing it, just extend it with the note about the lifetime?

I replaced it because in the past the check was there really to just 
check if the ID is valid (the pointer was thrown away) -- now we 
actually pass the pointer into the job structure, so it serves a more 
general "get the syncpoint" purpose which is clear based on the name of 
the function. The new comment is then a new comment to clarify the 
lifetime of the reference.

> 
>>   	if (!sp) {
>>   		err = -ENOENT;
>>   		goto fail;
>> @@ -308,7 +308,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>   	job->is_addr_reg = context->client->ops->is_addr_reg;
>>   	job->is_valid_class = context->client->ops->is_valid_class;
>>   	job->syncpt_incrs = syncpt.incrs;
>> -	job->syncpt_id = syncpt.id;
>> +	job->syncpt = sp;
>>   	job->timeout = 10000;
>>   
>>   	if (args->timeout && args->timeout < 10000)
>> @@ -380,7 +380,7 @@ static int tegra_syncpt_read(struct drm_device *drm, void *data,
>>   	struct drm_tegra_syncpt_read *args = data;
>>   	struct host1x_syncpt *sp;
>>   
>> -	sp = host1x_syncpt_get(host, args->id);
>> +	sp = host1x_syncpt_get_by_id_noref(host, args->id);
> 
> Why don't we need a reference here? It's perhaps unlikely, because this
> function is short-lived, but the otherwise last reference to this could
> go away at any point after this line and cause sp to become invalid.
> 
> In general it's very rare to not have to keep a reference to a reference
> counted object.

Having a reference to a syncpoint indicates ownership of the syncpoint. 
Since here we are just reading it, we don't want ownership. (The non 
_noref functions will fail if the syncpoint is not currently allocated, 
which would break this interface.) The host1x_syncpt structure itself 
always exists even if the refcount drops to zero.

> 
>>   	if (!sp)
>>   		return -EINVAL;
>>   
>> @@ -395,7 +395,7 @@ static int tegra_syncpt_incr(struct drm_device *drm, void *data,
>>   	struct drm_tegra_syncpt_incr *args = data;
>>   	struct host1x_syncpt *sp;
>>   
>> -	sp = host1x_syncpt_get(host1x, args->id);
>> +	sp = host1x_syncpt_get_by_id_noref(host1x, args->id);
> 
> Same here. Or am I missing some other way by which it is ensured that
> the reference stays around?

As above, though here we actually mutate the syncpoint even though we 
don't have a reference and as such ownership. But that's just a quirk of 
this old interface allowing incrementing of syncpoints you don't own.

> 
> Generally I like this because it makes the handling of syncpoints much
> more consistent.
> 
> Thierry
> 

Mikko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
