Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E1520097
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 17:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D7C10F217;
	Mon,  9 May 2022 15:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E0C10F215;
 Mon,  9 May 2022 15:01:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKi/ecfiOB4JlMeWiCejLUAiB6GYT5Lb7S0H5pPfQaR9vZq4kW35cOnP02ex7IkX6/D2gSOrvBslpyEaaXid4HrJyrEmlmyQjrmBndJd/RSWww93llRFz47q4/ikKEuboZ/HyyrvAa/7aXRPupPaUQ++UY04S/yxcxlNNwkYBl8bR1cWBIweVL5L29lFBr7Gl1O/MLYzYj4W/uTZx77rU4ltH0AJzGtjzXlsUK1O2ygN5kKMtN+MBPfmnutIsl3AbHDHljdnoKVata64OXYn/AaDuyWR/opaNdmv71PB2lnedXy1o9UsbkuyRYsC2Qv5mDfUHMm0mO5SCToVQt6PAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvyfppx+WwM6J+e8adY+tBmFeZtwlh50CJmn1hTGamU=;
 b=SlpArk4L4K2SYx9r1QRsjkqFRcgU8aEzGXvdWvBqyftyaI03vMxrrG65EmV4951dh0/yHbt+CXGglInhSCGPdqCIYgGKZhwZ3X17H52eZi95eyMAsCtld65ZnSU0iOmpl19uNWOH7OBQjYHs9vz/GwZtJpHpqbivFTZTaMXb9NarYdr3Q3P/S7IkDrCgu3av0QdZF4t8PWl4q/vzWDWjyTJ29tv8ng9yHYEhXaeVkZoVGs8FcmAHIoDxeaHZmccofm5WOIYRTEFeZ8BCP8SIqqVCB4DQ1Nzok1qIqsDz+wSyt0Nc5reAXr02kHx8Yw+2IVI953q6rIno36oPFYtvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvyfppx+WwM6J+e8adY+tBmFeZtwlh50CJmn1hTGamU=;
 b=3fDQPcqq6S0zwa27XvmP4YOCT5L4kRN9g3+q6oP+XsN2/Lr4LpLoMLUN+0ZCutd8A/QfGHP9kum0i7prRFy2eOj1T/elTGz0ytzgbv/i2pa1jqsWfxypZLW82P591fb2zQot6Bpl1QYLRiHVgPBe7P7jyW7zc5Dw+ySRa9ozdAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.22; Mon, 9 May 2022 15:01:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 15:01:38 +0000
Message-ID: <639687d0-ee0c-975a-93c0-b54422c74719@amd.com>
Date: Mon, 9 May 2022 17:01:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/8] drm: execution context for GEM buffers v2
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-2-christian.koenig@amd.com>
 <Ynkl1VSLYDeGF4Ik@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Ynkl1VSLYDeGF4Ik@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0078.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 402d7975-1283-45a5-dceb-08da31ccd143
X-MS-TrafficTypeDiagnostic: DM5PR12MB1355:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB135558E7DA5B1E2674F1ED2B83C69@DM5PR12MB1355.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pfWXvCS9eooAsWNpZGBTYRR90VPgBxtyt/a2rGgMUXMMm7h1NIU4Sj4hpCVRfgDbJcK+4/MbcpN56cJ3A3dmSfD0KGj3reExtluZSYmiY8MfoDU0WxasLAH35JIC+J/AD7QmDWCk2y75e74i+pex/4PuBqzjppZ80pYw/tAAZt5h1T3N2Be5e2aYsNGjMUSQ7QxtIk+l52W+JXro72TLD7RrI2mcP4LA0DuZw+dnXX+Ys+dk9UAWMcPgvBwFuzr7VX8L1Cx5Gpaj4xYaoXJ99D2TgCbjsuZUZQXevfLyZ/+MUHST8bK0erWra3ShTpbORIXHcHdS2TwRGuKaDsfID/95wr8xV6VHkSV+Yf96C4Cbdl/sLCKHD9DIRSPriyCZDiKbvDvTERt+VRFZORkv2hAuLwcmRmglBkNwqOkUf3K/7c5GVPxskAz+b+wuEbLXbe9KXN7AsfyzOlj08eW3HeLnYh56Ni+QKCzUC8gX6dQBeSkLWW9tVvWBrZMBR9p3v5hhkuxQlHU1mi1/lpjvTHQckhnqXg38wFUUg0Oqh1Z52GTfuBfVTwgWNhX6xrfPOkBHTdQBXo61H1PVZZpCsdGZSKC10cGwWnyhdFWZqtP+pVbmcKaq9WTd7yfkC0SaP4D0IWzwtOrxWrMpA5UbmLjUYnzwHRAP7Kn6cqBPG3Jua6/pNtGhZYA3Kn48npIYegPNezkAmc1t93Pwt6l5nlpY99+GiK7OB5CzCeQ3X3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(6512007)(66574015)(5660300002)(38100700002)(31686004)(8676002)(4326008)(36756003)(186003)(66556008)(110136005)(66946007)(66476007)(316002)(508600001)(31696002)(86362001)(6506007)(6666004)(2906002)(6486002)(8936002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3dZL0N0Tmt5ZVcwMnV3M0FTRERUdXE0UWx3ODR0UXRaSGVFVVR0Vzhhdlda?=
 =?utf-8?B?R3hkeXMwcVNNS3ZhditIUkt2eUZ4c1gwZnhUYW9RamxQcFgwQjBacjl0WXpM?=
 =?utf-8?B?cnJ6K1J2a2dhZEtqKzVnakRCQ0NLbmNIZWlvMEMzaFg1MWFEZ0RTL0xCMXNz?=
 =?utf-8?B?c1JiME5EUStDNmxtb0lyRFg1ei9PZGJBeFlPWjV2aDR3YmtKSDlIZStxcHY0?=
 =?utf-8?B?SXBWSGVFSG5CVjc4aldubnpNZzhhN3IvRWtKdFpHSnNsL2svWUdHUkFXTkV3?=
 =?utf-8?B?N1p2WFpadnlVOVd1Vm1oR1J6d0xTL1prWk5tYkc1MnpHV0VZdmNoMzhGVzNK?=
 =?utf-8?B?L2xCMHA5VG9SMzdhM01zK01FYUhkWGVaNjM1NGVJNEdHOTlkWXIzL2RYbEE2?=
 =?utf-8?B?eklGNXJPWEhVQll5SFYycnpYOWRmY29xaWx3eHo1cDRicU92ZnBtNytjWFRo?=
 =?utf-8?B?YjJjckVPYStibTVFU2xET1JJZlh5QkVVaHpyS2VJTWFaajZlMXd6WitSRWFJ?=
 =?utf-8?B?VU5rNmtFbWtYVmtwZE0xR0ZtV3BxbU5WbXQ4OGVydkR2bjlvQVJUUEJYTmQ3?=
 =?utf-8?B?cjQ0V2dUT3IwTXprU0ZIL1k3T2FlZGhoSVlpYUZrNDJUVGV0NW10V3k1RTE1?=
 =?utf-8?B?RDYyWlRuSUFPYTRJaDVxTVg2UktHTzdBd2ZERnNTOUFUbW0yUi9GaS94eVdW?=
 =?utf-8?B?Tkk1UEVXVXpLdys1dUdGUHB1MldRQ1VMR0RwenlMcVVZYmRhM1ZGSm4rT0pz?=
 =?utf-8?B?YlR2SXUveHBidW84cnVWY3MwVzRlQmxhZ0U3OVcvSmxvaGFjMzZnR3lHaFNO?=
 =?utf-8?B?ZWNxVCt5VmN6eU9lcWxxNzNrblpFOGlTT2dCcGR3YmVLQ21kL0hZT0xUVEF3?=
 =?utf-8?B?RDVsUkE5Y0tETzRzVzJZSXNQMVV3Tk4rRzk2Z3FSL3JYUmNWNzA4c3AwdUxi?=
 =?utf-8?B?VmNrS20wczFnekV5d2hvSGtCOFFzNm4vRzByZkZoZGNvdUdnT2lTSWpHTXlZ?=
 =?utf-8?B?ZDFpNFN5WjVXR0s5T21zZE00Z0FMSVNFeVB2Zi9renhhWFRKRU1rVTQwTjZu?=
 =?utf-8?B?UnlHRWVRaVk2LyszbWVCNlpHY2NzcDlIMmNEcGJCK3NBWkpSRmRQbDgrZ0k3?=
 =?utf-8?B?SGJzbHRoRk9mREJaTEpiRTg0Sm9FTWt2Mzh3dUNSNkNjUVNuTEtxS0Rqdmpk?=
 =?utf-8?B?ZVJGS2ZxSXdkdFRFS21tWTk4M2p0Um5CTHowb1JhWGdOcmd0RzQ1bElMdUxo?=
 =?utf-8?B?UGV0R0JDMEg5VElMNkNJVEx0SFY0M3FjK1YyQm1VTVpQRzdNZ1FLb0pDWmdC?=
 =?utf-8?B?VmxyLzVnLzVnN3YwSEgxeVlRb1hSbFNBMUlZMThnbU4vQkRVSk1MSkVyZ3pN?=
 =?utf-8?B?djBIOUlzUWFqekFHbUdLSzZnRnUweWhnRWdld0M4eGVwcG5oNFpTeVJGcjBW?=
 =?utf-8?B?S1VlaWtFT3FOQ3dicGxsMGJYN1dQMjQvZlVGZzlLNDlDbFJZaHYvUDQrcjE3?=
 =?utf-8?B?cEVGWEpSUTlIRHJsaXBxOEJybDQ5NEV2L1RlQVNIbDZqMFZxeU1CWVhPVWJq?=
 =?utf-8?B?c0wwcHhBUThlY1Nob292dkxXL0lLeEVXdmpJZ21RT3lUbGpoRkZGSENweW5C?=
 =?utf-8?B?M0F6QURtZmZqSHBIRUlNME04QVNnM3RBdFBPMzE3bGEwM2lkeml2bGpSaHBr?=
 =?utf-8?B?Wlc4VzdYQTk4UlhIMzF5TTJzRVZmRFRFWngxWmV0WFVEM2g4QmlYdnZ3b3d6?=
 =?utf-8?B?U1hONFl2TzZKMzkvai93b3hFMUVkWncxV0Vtc0owNDAweGw5VXdaT3FVaUhX?=
 =?utf-8?B?VFh4K2p3SmM2MkQ2dVAyb2d4ajVkOVpGak9neURSQy80WDNlcmdPUkJTTmJr?=
 =?utf-8?B?OUVXTTVFY1Noa3M4Wmg5Rmp2b3hmV1BHQUFrT2RsaFZaZjFyM2JYTVdTS1FQ?=
 =?utf-8?B?OGRiYVdEamtzRjIxQWJnM2U1TEFuelU0MHFyRHhMZDRjNWFQS3F6Q3N2bGR0?=
 =?utf-8?B?bm1TUEJyMmNyRlZDdXRtalhlVWsvdmMwaE9QVk5nMHc5ZG9Pa1dVbVVRNkJu?=
 =?utf-8?B?V0hDUVdTa1A2Q1Z0ZTFrS0twN2ZneVhvRHhsRTNRVUVoVEsxMGJXejEwMFpZ?=
 =?utf-8?B?SDNTRHlDNzVPeWlxQkxrdmxGMitqSlJvREFpZ09ra084K01sM2pNQVpLUUlT?=
 =?utf-8?B?VTVPT2V6U2hPWEUrcXZyVUxoY1NlczZBcFVjMlJ6RTZOZFJNaHlPaldubTVI?=
 =?utf-8?B?eExpZGN1dk04alE1aEFrUGorZFdRRWN4VUdiWVNiQm8rQUxUaVNEUTRUMHZY?=
 =?utf-8?B?VHNGN0xpME01V2tGMWQ0U3RtcjZTSDMzc05UN1hoc2dDV0IzUWtyODIvTGFS?=
 =?utf-8?Q?BrpYnlhKPnPpiiReRA7OgUzwnFJUqFabqGa1IGP6g3fl+?=
X-MS-Exchange-AntiSpam-MessageData-1: OtI10rarkVdkyw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402d7975-1283-45a5-dceb-08da31ccd143
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 15:01:38.2040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/+J6/tOSlj2pAKE29iJ7n3mSNOSR3Byus/wuBTmJycz2yu3szhB0ENskrb8Ropb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1355
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.05.22 um 16:31 schrieb Daniel Vetter:
> On Wed, May 04, 2022 at 09:47:32AM +0200, Christian König wrote:
>> [SNIP]
>> +/* Make sure we have enough room and add an object the container */
>> +static int drm_exec_objects_add(struct drm_exec_objects *container,
>> +				struct drm_gem_object *obj)
>> +{
>> +	if (unlikely(container->num_objects == container->max_objects)) {
>> +		size_t size = container->max_objects * sizeof(void *);
>> +		void *tmp;
>> +
>> +		tmp = kvrealloc(container->objects, size, size + PAGE_SIZE,
>> +				GFP_KERNEL);
>> +		if (!tmp)
>> +			return -ENOMEM;
>> +
>> +		container->objects = tmp;
>> +		container->max_objects += PAGE_SIZE / sizeof(void *);
> Might be worth it to inquire the actual allocation size here, since if
> it's kmalloc the generic buckets only cover doubling of sizes, so once
> it's big it goes up a lot quicker than PAGE_SIZE.
>
> But also krealloc checks this internally already so maybe better to not
> break the abstraction.

How can I actually do this? ksize() only works with kmalloc().

Or do we had a function to figure out if vmalloc or kmalloc was used by 
kvrealloc()?

>> [SNIP]
>> +/**
>> + * drm_exec_cleanup - cleanup when contention is detected
>> + * @exec: the drm_exec object to cleanup
>> + *
>> + * Cleanup the current state and return true if we should stay inside the retry
>> + * loop, false if there wasn't any contention detected and we can keep the
>> + * objects locked.
>> + */
>> +bool drm_exec_cleanup(struct drm_exec *exec)
>> +{
>> +	if (likely(!exec->contended)) {
>> +		ww_acquire_done(&exec->ticket);
>> +		return false;
>> +	}
>> +
>> +	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
>> +		exec->contended = NULL;
>> +		ww_acquire_init(&exec->ticket, &reservation_ww_class);
> Not sure why this is here instead of in _init()? I thought you're playing
> some really dangerous tricks with re-initting the acquire ctx, which would
> at least be questionable, but does not look like that.

That was my initial design, but the problem with this approach is that 
all locks taken between drm_exec_init() and the loop suddenly have a 
lockdep dependency on reservation_ww_class. And that in turn goes boom 
immediately.

Took me a moment to realize what's wrong with that as well.

> [SNIP]
> +/**
> + * drm_exec_has_duplicates - check for duplicated GEM object
> + * @exec: drm_exec object
> + *
> + * Return true if the drm_exec object has encountered some already locked GEM
> + * objects while trying to lock them. This can happen if multiple GEM objects
> + * share the same underlying resv object.
> + */
> +static inline bool drm_exec_has_duplicates(struct drm_exec *exec)
> +{
> +	return exec->duplicates.num_objects > 0;
> Definitely an aside, but in our i915 efforts to get rid of temporary pins
> we run into some fun where the eviction code couldn't differentiate from
> memory we need reserved for the CS and memory we just keep locked because
> we evicted it and fun stuff like that. So maybe we need a bit more
> tracking here eventually, but that's only when we have this somehow glued
> into ttm eviction code.

Hehe, yeah that's what I was thinking about as well. But then I though 
one step at a time.

> Also the even more massive step would be to glue this into dma-buf so you
> can do dynamic dma-buf eviction and still keep track of all the buffers. I
> think with some clever pointer tagging and a bit more indirection we could
> nest drm_exec structures (so that a driver could insert it's entire
> drm_exec structure with a drm_exec-level callback for handling refcounting
> and stuff like that).

I considered in which component to put this quite a bit as well, but 
then intentionally decided against DMA-buf.

One major reason was that not all buffers which needs to be locked this 
way are actually exported as DMA-buf.

Another reason is that DMA-buf doesn't necessary need a concept of an 
execution context. As far as I can see that's something GPU/DRM driver 
specific.

> So anyway I think this all looks good, just one more thing before I think
> we should land this:
>
> gem helpers in drm_gem_lock_reservations() has something which is
> practically compatible already, except that you bulk-add the entire set of
> objects. I think if you add a bulk-prepare function then we could also
> replace all those. Maybe even nicer if the bulk-prepare takes the array of
> handles and does the handle lookup too, but at least something which can
> subsititue drm_gem_lock_reservations with drm_exec would be nice to
> validate the helpers a bit more and really make sure we only have one of
> them left.

I was considering that as well, but then also thought one step at a 
time. Not sure if it's possible to look up handles without running into 
some locking fun, thought.

Thanks for the review,
Christian.

>
> Thoughts?
> -Daniel
>
>> +}
>> +
>> +void drm_exec_init(struct drm_exec *exec, bool interruptible);
>> +void drm_exec_fini(struct drm_exec *exec);
>> +bool drm_exec_cleanup(struct drm_exec *exec);
>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
>> +			 unsigned int num_fences);
>> +
>> +#endif
>> -- 
>> 2.25.1
>>

