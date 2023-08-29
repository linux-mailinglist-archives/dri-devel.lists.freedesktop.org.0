Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2745A78C0CB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B818110E1A8;
	Tue, 29 Aug 2023 08:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3264E10E1A8;
 Tue, 29 Aug 2023 08:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeRTaxBv7hVF2A9rGmry5T7e3ViatCQ188cjA2Gh7MwX50clbJzBS2me+QxQuJAuH7FjnRbUg5iI/WvLpjDntRyWflLhsMfNrmlqxa38/oSBEhXdyHnxXHTvMr7JVxuo2oZE9Qd8J6/iIF7qBga2Y0CnygC/gmUWO5pbkis0itZrpFRY8maZwl0fwHopXN9JQpcldM2Z3tI0pDCouocSFzxtd/m56dbJR9kcZe10AQz+enhbsX2IY7iNMLY4OxEVgdl8kfk31Myu5YN6z60AflHIhlHTbgB5fNmIAluI/KKtuExJRWev2R6syOVBTZv/ljNJPPxfUivKYRzPXvtdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFJvbM0VThYZg/qI4BQ/HWSJuU0Q+Uudb3HneJJsDQE=;
 b=m6lIHGc3lgd7cDaSBqeg3OKANfixy70jLiy+ZKVj7C7ZjXdLmBZchMarT47+weFirhsZvc9BdeqAoX7FaINitJYNOF6MGI+sNKd6QkimsH/gm72z8PgDh0I6zRqqi1SkteR2hWXn3nyAlaZk3Lr/z+n/OV8iEcERJqxZRsSC2XO+/6tdeax6Mu7cI+LsMarGlaudiq6Lzi1RP9ukLvx2fDFFXSXc8h4/ZSOPLTywvIBLsPv5WlE3LxnFQIFpup0MfqGUFR8pdYFh6TSpnhktzoNc4QbSDUHmIfhrnSR4UyZoG20EtLmz2PG+edNRC5i/crX8WJM2L2d3k0OkbNpZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFJvbM0VThYZg/qI4BQ/HWSJuU0Q+Uudb3HneJJsDQE=;
 b=uUgLB0CduZs7kBGSOVgsvAuoJoEB3VF/2URmyca+Jk+NUxCMeWdFqAvNdiUwDakRw0Ay8naaSWytLPJpNeTFp3G8AL8EA0VLA0FN7+SLEDwAntjl2v/+tiODc4d0D1UZN7nmKeEcLKG+KUqyfXfATpZJv6vBfmMtiUvezncOt1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB8297.namprd12.prod.outlook.com (2603:10b6:930:79::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 08:52:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 08:52:12 +0000
Message-ID: <0ff9b35a-3a44-6221-3017-e9efab2d33f2@amd.com>
Date: Tue, 29 Aug 2023 10:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 17/23] drm/shmem-helper: Add and use
 drm_gem_shmem_resv_assert_held() helper
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-18-dmitry.osipenko@collabora.com>
 <20230828121239.78a180e6@collabora.com>
 <01930e66-cba2-5d81-7f46-d46907bdd300@collabora.com>
 <20230829092950.3a9c40c1@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230829092950.3a9c40c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: b6708ca9-391b-4e1d-ed7d-08dba86d3c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wtO0+PgNsuUOZmsbi7WT2pRrlLNrs5TOitvpUurtcY73PgrojNJlQF4enIpSVKaRkP0/xBQ7FR0YmD0RZzf6ZTqZqmp2UDVDuuglSfn2N3heXHINnbKBVxV0+kL0WeZkJeB0VOphTpU4D/dHuoeY5lTxJSKuDz/3Y0R7QlV4QuApdpwTRjwOIFsmWZd5BA6qI1VfQ+x7Z9quxg0wI5C1xhPOuVLyfAe3VY+UJhBBcbfmyhdGNvTwACBZKTI4a8tT/OZHbipJeEL5njvBvRxiraH0J9mnSkR+7GBUhLFqK/pwxlMihd65VpbYlt6+9AefN6qEfW0t66WhyUVazZVjhrVYDXayJ5/yHKE0E/RnYvPsM2St2GygStd6soURdpYvzn42qb1mafW6k4eedBVLMMFicULctjACRJujTZgjAZp89bucXst6Tym8fpOY4dh0aPauI1KDFdw4hkF1pUbRaCn0oOSqi66IBakoylVXEUACfOaAqW1bQv4A7BG4m3ec1DnPx/Abo4QJos6aoL3jF4QhIs8LCHWuQ8k4JxFBY3cvmJk6ysZht738giMxWshjDXwImikrponI+hGs6VBf7iA2j1axAuJufemslZKJaZX08HPXYvTrxaPl2uxixPZQxkhd37Wk+Kak/e5xZbUiFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(186009)(451199024)(1800799009)(41300700001)(7416002)(26005)(38100700002)(6666004)(86362001)(31696002)(478600001)(83380400001)(6512007)(6506007)(6486002)(53546011)(2616005)(54906003)(110136005)(2906002)(66476007)(316002)(36756003)(66556008)(66946007)(8936002)(5660300002)(8676002)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWdaWTc2TnZiZzBDcGdoOHNMY2t0OUZXOFRBK3d5NVJVb0ZLNUtueGowTm0x?=
 =?utf-8?B?QTduYlJycW1jN0dralpvZ2dRZWJsN1hoYVlqbE1FNEpTalMzVE8wc2tIdEdZ?=
 =?utf-8?B?dlp3Y2dPUVNTNjNUNEdDVk96Z3cxWUVqekg5UGx1OE9CQ1dOdXc0TWlaM3lq?=
 =?utf-8?B?U2MzUWNVditHVzRWQjR2Y01kNksySk54TGsraXFCa01ZUzRuUFc2a2hydFhU?=
 =?utf-8?B?SllhamNvUUJsMmhRb1pTREo3SG1aVEV3YzlQN0o4THZpYldnOElIMDB5WVo3?=
 =?utf-8?B?S1dZTHowTC8zOHdQQ01LN1ZZQ0hiR0lMTmFPTXQxSzcwOUJIaVBBRGZHUVdT?=
 =?utf-8?B?YXcrb040aWNYb3loV05DaWxDQ0JsRFU4ajdFSEdhc1hRSGRKalNYQTBnL0di?=
 =?utf-8?B?OEZnRVFqUEU4YWEwOWI1UytzYVlwaFVzaHdRc29VQXM0eUxyN1puZWgwMGU0?=
 =?utf-8?B?YjhDRk9KbTI0dnY5dWRUVlY2Y2xOV0tNNHFrU3ZzSDNaRHdnSnc0REpXc3V5?=
 =?utf-8?B?ek13aTJqSk5qRGJWT09wbkZFSEdHaC9vZkZNZXRmOVQ5NXJETzNYTXlBYjRv?=
 =?utf-8?B?ejUwNUR4WVRTb3FtUysxejBqR3VDa0xYUzI5a2d5SU93Z21yejFDTHlvdy9V?=
 =?utf-8?B?NUJxWDU4aTI4VU5HYzI1eEVySnZEUmRLRUhZaW5zRkRuWkZQZDRvZ3kvV2M4?=
 =?utf-8?B?cUFBdUJmaU1GSEdUZ1lOaDFqSHhmdElSWENFTGNoUkZvUWF0bGJuWVYrY1NO?=
 =?utf-8?B?YjdEYWgybFdoTlM4bC9CN0FZNjA2V3hmYWY1K0ttWS85alVEcVprYm55YUlZ?=
 =?utf-8?B?aSt4N3pGdGZkb2JKc3dQdEhxbnBGdm5kcTZ3OVdWTEJnbjRUOHVQNWNCWlBV?=
 =?utf-8?B?azliVXV6RnF0dVBjaFJ3NkVFa0t4cjhoQ1k5OEswRXlSNUd5TkE1Ym5MSWVL?=
 =?utf-8?B?WTdKYW1VNjYrVVQxOHVEUkpnck5TTWpiU050bFErYWgzaWZNV0xPckZKRi9Y?=
 =?utf-8?B?NXhHK2FVcjFpT0szdEs5NlU0dXFsUkU3YmNiT0JuMDZkTkdNTTZZaUxRbmta?=
 =?utf-8?B?MHg4d0I5WVdsTUZ1UUY2d2NESThENTZmTVM4ckZKZGZBajN6RndEaS9wTzdR?=
 =?utf-8?B?cU5iU0hyZExhMm5LSkJNMWtLNElPV2lueHg5WVp3QWhsV3NpYUxpUEZSRWZo?=
 =?utf-8?B?ZE4zaEVzYXdYQVpDdXZRVElHYkhjQlpRa2lVWjF5S0U3bUp6b3BEbGp5U1VD?=
 =?utf-8?B?Yzg1a2ZFV0VhK3VUbGZBSXpSYVBLaFlhTmR4ZlE2STZlTk45dCsrTnd5VjRx?=
 =?utf-8?B?ejZ6N0xreUhoTUt2cjZYU25TWDhkVEpHVFJZSGZhcmtWOWpkc0J4ZnVreWtN?=
 =?utf-8?B?am9SMUpiazcxMjF3TS8zcTlsaTBQRFVUTzNzcHF4NXlENEdhcDlNaDl2N1Bo?=
 =?utf-8?B?bUh3cUhaNU5kWTR6OTNRN3ZnOTBRK2Z4T1Z0MlRaMnJwTzN5MUVndVBaTStP?=
 =?utf-8?B?bWVzeTJVcEVLaS93WVFvZ3hteEJ0L3AwaW5TZitSUTZIeDFhQk5RNGRwZE9D?=
 =?utf-8?B?anR0ZUhGZnBuZFRyc2FHU25JTnlnV0c1dzdVZ29adUo2amFUa0Y1N2d5Q2Z6?=
 =?utf-8?B?M3pRVGNMV1I0NVBtaGEzU1RrTStUbENDMVpWZDdKUTFIYTd6ZEV2ci9BQzBU?=
 =?utf-8?B?Z3h5VGI5bnNaYjRyemo1Q2p6d1cvUVhnNnFBM1JlTm5TTnBSTVdQeENHdTNN?=
 =?utf-8?B?MUZ2MW1YK3ozaTFCMlBJbkRQYnFxbjNmYnFaTWJ0bTdISHJiVkdsOWFDUldv?=
 =?utf-8?B?TFBRQWlXd0MzVW5lZHlwVDFSSjVGMWtwY0k1bHpsVVA3cjRLL0Z4NTl3dmpD?=
 =?utf-8?B?UGhmbkd4VlhzUWdGVmhmNkJzNzNlZ2xmR0FiZTNVcEdRc3lLaWNCY09nSUMy?=
 =?utf-8?B?Q0lWeDBzVVZtODVIbmp6dkQrbUNLaWgxRTM1YlpBVThhQW91NUcrKzZhUXhi?=
 =?utf-8?B?Mk0zS2xPRmRQeDBrVzk4cGpPdW1nYnNhTjU5d2NocDRITndZYlI1WUY2Wkhz?=
 =?utf-8?B?bFo1dVh1YUN2b0lpRmVJb2pTc0ZEZm9VQVl1ZmJqakFXbVFiQmJsbm43R0Ux?=
 =?utf-8?Q?WBrg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6708ca9-391b-4e1d-ed7d-08dba86d3c35
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 08:52:12.1474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMVjyQwyvKhlHXg/6DwVNm7LpjQN3jSA/xquVLPI/oJ38vN95mfbupCbalFGvouv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8297
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
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, intel-gfx@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.08.23 um 09:29 schrieb Boris Brezillon:
> On Tue, 29 Aug 2023 05:34:23 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>
>> On 8/28/23 13:12, Boris Brezillon wrote:
>>> On Sun, 27 Aug 2023 20:54:43 +0300
>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>    
>>>> In a preparation of adding drm-shmem memory shrinker, move all reservation
>>>> locking lockdep checks to use new drm_gem_shmem_resv_assert_held() that
>>>> will resolve spurious lockdep warning about wrong locking order vs
>>>> fs_reclam code paths during freeing of shmem GEM, where lockdep isn't
>>>> aware that it's impossible to have locking contention with the fs_reclam
>>>> at this special time.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 37 +++++++++++++++++---------
>>>>   1 file changed, 25 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> index d96fee3d6166..ca5da976aafa 100644
>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> @@ -128,6 +128,23 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>>>>   
>>>> +static void drm_gem_shmem_resv_assert_held(struct drm_gem_shmem_object *shmem)
>>>> +{
>>>> +	/*
>>>> +	 * Destroying the object is a special case.. drm_gem_shmem_free()
>>>> +	 * calls many things that WARN_ON if the obj lock is not held.  But
>>>> +	 * acquiring the obj lock in drm_gem_shmem_free() can cause a locking
>>>> +	 * order inversion between reservation_ww_class_mutex and fs_reclaim.
>>>> +	 *
>>>> +	 * This deadlock is not actually possible, because no one should
>>>> +	 * be already holding the lock when drm_gem_shmem_free() is called.
>>>> +	 * Unfortunately lockdep is not aware of this detail.  So when the
>>>> +	 * refcount drops to zero, we pretend it is already locked.
>>>> +	 */
>>>> +	if (kref_read(&shmem->base.refcount))
>>>> +		drm_gem_shmem_resv_assert_held(shmem);
>>>> +}
>>>> +
>>>>   /**
>>>>    * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>>>>    * @shmem: shmem GEM object to free
>>>> @@ -142,8 +159,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>>>   	if (obj->import_attach) {
>>>>   		drm_prime_gem_destroy(obj, shmem->sgt);
>>>>   	} else if (!shmem->imported_sgt) {
>>>> -		dma_resv_lock(shmem->base.resv, NULL);
>>>> -
>>>>   		drm_WARN_ON(obj->dev, kref_read(&shmem->vmap_use_count));
>>>>   
>>>>   		if (shmem->sgt) {
>>>> @@ -156,8 +171,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>>>   			drm_gem_shmem_put_pages_locked(shmem);
>>> AFAICT, drm_gem_shmem_put_pages_locked() is the only function that's
>>> called in the free path and would complain about resv-lock not being
>>> held. I think I'd feel more comfortable if we were adding a
>>> drm_gem_shmem_free_pages() function that did everything
>>> drm_gem_shmem_put_pages_locked() does except for the lock_held() check
>>> and the refcount dec, and have it called here (and in
>>> drm_gem_shmem_put_pages_locked()). This way we can keep using
>>> dma_resv_assert_held() instead of having our own variant.
>> It's not only drm_gem_shmem_free_pages(), but any drm-shmem function
>> that drivers may use in the GEM's freeing callback.
>>
>> For example, panfrost_gem_free_object() may unpin shmem BO and then do
>> drm_gem_shmem_free().
> Is this really a valid use case?

I haven't followed the whole discussion, but I think it isn't a valid 
use case.

That page_use_count is none zero while the GEM object is about to be 
destroyed can only happen is someone managed to grab a reference to the 
page without referencing the GEM object.

This is turn usually happens when somebody incorrectly walks the CPU 
page tables and grabs page references where it shouldn't. KMS used to do 
this and we had already had a discussion that they shouldn't do this.

Regards,
Christian.


>   If the GEM refcount dropped to zero,
> we should certainly not have pages_pin_count > 0 (thinking of vmap-ed
> buffers that might disappear while kernel still has a pointer to the
> CPU-mapped area). The only reason we have this
> drm_gem_shmem_put_pages_locked() in drm_gem_shmem_free() is because of
> this implicit ref hold by the sgt, and IMHO, we should be stricter and
> check that pages_use_count == 1 when sgt != NULL and pages_use_count ==
> 0 otherwise.
>
> I actually think it's a good thing to try and catch any attempt to call
> functions trying lock the resv in a path they're not supposed to. At
> least we can decide whether these actions are valid or not in this
> context, and provide dedicated helpers for the free path if they are.

