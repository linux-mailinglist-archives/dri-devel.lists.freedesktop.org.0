Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7334A9C9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9C46F3E3;
	Fri, 26 Mar 2021 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124C26F3E3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WYurMalcA80LHwmSwZD2JyGRThXW9kCy4921GdZjeFE=; b=CIheYyOlSfdn6BVvz6PA/JS9Vc
 vgWfelLZGDIiA+NmGZZWivfcDJBWGyI/mYaI+e9kz+Kqd+O3fWqzggKcNiTOk00PwPqP+ctE0nJNh
 zpyPwxfm5Xo3O6kyenZxOdQTHyzatxpNq+b4kObUUsnoq1HikbGmRqKJ+lykqpSwlc9ukJj9ZM50N
 nZQwNkgv/XgGIxqXMNtw/LxPnGwAbgL71MU0dgXjfwLA0NaBT2Rawg6pIsbSpk/0DAIwt0AzbmRqa
 RP7LiCEm1KgGRixDQvN4NRFO1lzSrkcJ9x5pSo6PRDlvbPTJpGzs8exrBvWEut7LCqpmz3V5re07t
 LYcCztfg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lPnXS-0004mf-DM; Fri, 26 Mar 2021 16:34:14 +0200
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
Date: Fri, 26 Mar 2021 16:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFm/431gaaP6wY1A@orome.fritz.box>
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

On 3/23/21 12:16 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:01PM +0200, Mikko Perttunen wrote:
>> Show the number of pending waiters in the debugfs status file.
>> This is useful for testing to verify that waiters do not leak
>> or accumulate incorrectly.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/gpu/host1x/debug.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
>> index 1b4997bda1c7..8a14880c61bb 100644
>> --- a/drivers/gpu/host1x/debug.c
>> +++ b/drivers/gpu/host1x/debug.c
>> @@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
>>   
>>   static void show_syncpts(struct host1x *m, struct output *o)
>>   {
>> +	struct list_head *pos;
>>   	unsigned int i;
>>   
>>   	host1x_debug_output(o, "---- syncpts ----\n");
>> @@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct output *o)
>>   	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
>>   		u32 max = host1x_syncpt_read_max(m->syncpt + i);
>>   		u32 min = host1x_syncpt_load(m->syncpt + i);
>> +		unsigned int waiters = 0;
>>   
>> -		if (!min && !max)
>> +		spin_lock(&m->syncpt[i].intr.lock);
>> +		list_for_each(pos, &m->syncpt[i].intr.wait_head)
>> +			waiters++;
>> +		spin_unlock(&m->syncpt[i].intr.lock);
> 
> Would it make sense to keep a running count so that we don't have to
> compute it here?

Considering this is just a debug facility, I think I prefer not adding a 
new field just for it.

> 
>> +
>> +		if (!min && !max && !waiters)
>>   			continue;
>>   
>> -		host1x_debug_output(o, "id %u (%s) min %d max %d\n",
>> -				    i, m->syncpt[i].name, min, max);
>> +		host1x_debug_output(o,
>> +				    "id %u (%s) min %d max %d (%d waiters)\n",
>> +				    i, m->syncpt[i].name, min, max, waiters);
> 
> Or alternatively, would it be useful to collect a bit more information
> about waiters so that when they leak we get a better understanding of
> which ones leak?
> 
> It doesn't look like we currently have much information in struct
> host1x_waitlist to identify waiters, but perhaps that can be extended?

I added this patch mainly for use with integration tests, so they can 
verify no waiters leaked in negative tests. I think let's put off adding 
other information until there's some need for it.

Mikko

> 
> Thierry
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
