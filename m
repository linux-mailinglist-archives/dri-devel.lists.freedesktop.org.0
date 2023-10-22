Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FDE7D209F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 03:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3AF10E0D0;
	Sun, 22 Oct 2023 01:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234A910E0B0;
 Sun, 22 Oct 2023 01:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO79PjcL8r90M4PBUAcI6GDXHJ9zgqUakBmMzixVfdRg0hNINpwqzn+bpcbwjLoQkBshlZUh6TRMQT+09BOJvN1ZCmZn8EcNVNj5jysMeatRcDy1A5KXiPPSY7a55NaS9HFY/0A+H37omCI+W0xnvVg5e1oIMDMET2+FcqHIm/dDk+7528kSkhkFOQ4GX3HbXeObBLKrecING18sJU8fE7NQEz46X3D0/EHy2YD+DPQLKsKLH8woXj54Dd9npM9/FU8YDwa6DSNBAg2zrWUyt4foY5TXjZF0UGRCuN4qIYOBceSZplXRdCOzcuGmuPxqtBHAawwA8oZCbYOBgKHtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdNjSk6Efc8lq/ZosgrVRzK/pYHXOGKRT48XLJHb0n0=;
 b=jWnx0iv5kZrQfRgjVrFqNnez9DGaK2354fDRbvcIBUFBCYyS2KKWNNKr8dQVParGmt2INCGKp9hShSzFasE3sgfUHxhDiwnxqmxF3BfpJwfZoZosb2iUgno4EEBoWyjeXpdtO+rZ5PXDZLA2MDDj9wwYjF1nwwxkWAPL3o8RQ+pGHmifEO7VIrFwE8xesVpZST2B8SShlSZ0bxLCI5DJ2DSh13q/pazvElrM5431s4Cy5fbXV5qRILduZwBJnYJDl7C3/VdUmOP7GomQrKTYFJemMdhd11rlSu12ze8tHeOOLsx8k0IBHNCNG4mS7L6ZFe2yQGgJ5/8KvPOnVNRB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdNjSk6Efc8lq/ZosgrVRzK/pYHXOGKRT48XLJHb0n0=;
 b=i1Kh7LRubX4paxryyKdwjdQ2b1ZtEdg63Yt4qtvPPflrfd4CvosIoSwX53GHrOr89Cnqm1MhAb7UJh1QaItyUmaj25MKiOI/YaYq1SzTRtG0z9BK+7zRsWBNnk/Vg2TNp2fEhkJKT2osMRDiwh5dsLzuOPYKV8f4TJ5/DSRsfMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Sun, 22 Oct
 2023 01:27:39 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Sun, 22 Oct 2023
 01:27:38 +0000
Message-ID: <ea773955-87a0-4952-b786-dc5f147a5961@amd.com>
Date: Sat, 21 Oct 2023 21:27:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v6 5/7] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-6-matthew.brost@intel.com>
 <88acf859-a1a7-433e-bfd0-b1b83b2cda05@amd.com>
 <ZTFfn53k3FIq2z49@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZTFfn53k3FIq2z49@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 280a1e16-2c6b-4f4d-643a-08dbd29e13b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWoFIMR39Pk6udPywcCEWWicxFVE6/1BID0nMxHAPIQBcH2raZfzRk2fxa9WttcBymv++s5pzucGcwM1QKeuvTVuPAjReQ+Rqr1JWq2tN1xI0qQ+ftp7Bsc8j9GSkn+fGuVv8XfpxI0+k0FpHegEdj2O6sAZIY5hJuoorEDsU7fF4yL7oTvSHx5jFJ/UFflRBjVy1FSipxaGO7ZtUp0373YBo82IVV+PLYvWBwPhTUC7yePdvKeao25i5Oshj10yboYFLIOIZ7cVyc+9SilpRK+aKMWKncXocEuA0VTNjZES77/fEJrQMrcKBFIvoghCdtMX7Gz7U+3R/Yf+RmxA5vWe6uC16CULJMB8AmJsf4/Sl66xRyTx1gR2lilIof2IHDNQP+y8VIcRTf5A31odtcjN4mme9LaCd+MB0+O4fVozHKzZOpir0KeFw9b9Ai3KeU1uunOsPxohbkvFSJG5kqp/d8Yq4VXUXZaiBf1G8xVicxEJku4Krb2GDjWz3a+j20f3jgjB8YPGVQbH6JO+6+lXrH43b5aMIsPrzj/mn4kuXXp0Yy5POLxjqJqcMef0sIQzBEGD4DxE1SA+2SiEErlp/BmNn2wYAx7J+6DKjhJAwkof6Bc7UBoxvqVS4XqEEHUJ7VbTm1uhb8S0Bo+eTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(66946007)(478600001)(66476007)(6512007)(6506007)(31686004)(86362001)(31696002)(6486002)(38100700002)(6916009)(316002)(5660300002)(53546011)(8676002)(26005)(44832011)(2616005)(4326008)(8936002)(30864003)(41300700001)(6666004)(2906002)(4001150100001)(83380400001)(7416002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBHYkJnYlZ6Vy9PWS8wcm0zUHdkaklReEoyOHViNU12Ti9kZGE5SGd5RzI1?=
 =?utf-8?B?Z0dLdjNGejBYdXIvdnB2RTJQd3dHR1IxZEVQZGs0T2x3TkxCOE5ENTBROFF4?=
 =?utf-8?B?QWVtWkRhdVE5ekNVOEo5VDlhN2lBbHFiV0FDYWRkTmVFaHlRanptR0pyakxH?=
 =?utf-8?B?VHMvaEp5QmVycGxQdkZES21GMFRlaU5OZS9SOVVicUtpZ2NqOXRjOUpQQ00x?=
 =?utf-8?B?K0t1dEZhSUhXaXJESW43QWE4c3MrVkk4UU5Ob0JwK1p3Q0hFRnBKRWVCdVRY?=
 =?utf-8?B?TVNsTWNrVGdLZmZSZkh2bEcrblp4aklKdVpjeEcrM09qeHVlT2x4N2JvVjRw?=
 =?utf-8?B?TVpqOFNuaGVtcnhRZlRGNVp3cVRhbGZGdUo5dmxhUWt1dUNzdXl5RVJ2ejc5?=
 =?utf-8?B?cGlPd1JCZUVXZEpDQndqRlhZTGUzaGg4RnFISm9ockRxRkNrVGk1blo5WnN0?=
 =?utf-8?B?RXdyRDBLQzN1S1NkV3p1Z0NrWlUyWW1GRGM0azdGMnhWdXR1Q3FUWHVpNWJ5?=
 =?utf-8?B?Y2VVSXhCU2plQm0vZ2ZMMUY1emphc1A0Z3l2MlhTOGMyOW5ZQ0dzSXNJSkJx?=
 =?utf-8?B?STdnMXNVaCtzZmV0eFozZ2g2bThMWXk5TGg5dU8xMUhaQjlFOHlOanpTT0Iw?=
 =?utf-8?B?YURpOThNbVViQW9FelVXYkpiSnozdFByY0o4bGxlbkVnUytsZ25PTjVkaDhp?=
 =?utf-8?B?V2FkMm4veFBmM0R5YVdwU0RnenJ4Tm45RDJhQ1dCeWhqYy8wSU5PZm9vRjBo?=
 =?utf-8?B?Qm9XTzB4eGRCOWNESVlQYkxHa1U0dFQ2K3J5aVdrVng4QWdicDVVWS9xZWdp?=
 =?utf-8?B?ejQvN1FmRlV1TGszYndJVi83bjI0TjJvVnVjYzNiNGpxSUFQTjRhR0x0N3ZF?=
 =?utf-8?B?T3VMdk55Z0pqa3V4a1c3SXg0YzVvU2ZCLyt0R2JvcmJpK2RjSHZGM2w1Unor?=
 =?utf-8?B?WDFrRHI5UmozVGVOZWJqN1dSbjRlZFpKQ3NqY2VEUEFIaG12VTVQU3RUcmdQ?=
 =?utf-8?B?Rno2RkNmNW9qcHVtakppd3NudU9vQlV2YzF4S21tSms4cGFIbWlPMVFzcXND?=
 =?utf-8?B?bDdyVTBNeUoxS2xyeEVNY3JEQ2d3WFdvZWFvSFAxWUtrektnVHlGVzFicmRW?=
 =?utf-8?B?TVFaNjdWNGt5elNtVVVsQ3NOYk1nb21UUXFKZE1IMWhTSytReFphUVlDdnhE?=
 =?utf-8?B?ZWQ1SzdBdm1vcm5LQndtRmFuT1BjWnlWVmtrSU5CVWVHTWJRK0dsUDNkeXFP?=
 =?utf-8?B?cVZQbFJodnV1MmtoRnFuZjVDajluM1k0MFlQeG1TT1BBb0FYSTVVTXpQeWVs?=
 =?utf-8?B?TWc2RUpqVmx0VnE2cEhVbVFlNE1aNEM4RVQwL1hmTTlVcmx6T0dvWTJ6a2lx?=
 =?utf-8?B?WGhreHoxOEtpQ3MvRytWaFJ2aFczaXJETS9QK1dkUzNjQUc4b24zOEkxQTF2?=
 =?utf-8?B?c0FBcHZoOGV0L21NeTBvU3dvN1R2ZU1QNmdRSFNpQVdNakZ2TXNOWEFtNkll?=
 =?utf-8?B?TkZ5RzhzUmdGQlU3emljUno2cVBiQzJTQkFjOStkend0MGV3WDY1bVBZdjJo?=
 =?utf-8?B?TmtsdlZ0OVpzN0hSeXVUeG9iWXRXT1kwVkVtYS9hMFozdE5kSWpXSHNHSHdp?=
 =?utf-8?B?M05SRzQ2SzQrNWw3b0ZkY1lWUW5DS2crV3BndjU2YTFvalVEcWxRZElMSXZJ?=
 =?utf-8?B?Z2l2OVNZcDJTK096eGRGMm5lZGhpbzlKenliL3MyNkNBckovZzUxa1Qza2lh?=
 =?utf-8?B?TkVreVVjbmpoQ2Jybnh1VTlLbHZ0bjhNV2JaUHZYWW5lL2ZZbmt6c0NKSkJ5?=
 =?utf-8?B?WTJtR041V0hDQllON3BFWWZEV0tjRnZpRXhaUzd0SzNVQUo1WXZsWDBlUUdw?=
 =?utf-8?B?ZHJIZHRNbUorcGo4YmxUQXFFWms1U0thL0NFeEtEZkRhajhPT0JZaVVDOFFn?=
 =?utf-8?B?VWcyZ3M1VU9EY1FHSVdRQWtNcFJvMnl0N3dkTmJ4ZmdMODI2NmYyZlB5MXZq?=
 =?utf-8?B?eks0alpkbUhOTHZFOTJkSFlUTEFlU2dCQXhMWTlyQkc2ZW9BZ0xmOUdocHVI?=
 =?utf-8?B?bjdOTytEaEZpRUlycEhuS0pNeVdXWEpTOFZ2K1pBQjZOdWsyWlYwV2FOUmFu?=
 =?utf-8?Q?nfOE9CN3SXo6tE278Up6bjaxm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280a1e16-2c6b-4f4d-643a-08dbd29e13b7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2023 01:27:38.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpO0xLf+Z2wOyGKRhYA90aW5fnDzVvHQH5dgrFwriynkQnGs3a+CUC6kFhsZWCXq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-10-19 12:55, Matthew Brost wrote:
> On Wed, Oct 18, 2023 at 09:25:36PM -0400, Luben Tuikov wrote:
>> Hi,
>>
>> On 2023-10-17 11:09, Matthew Brost wrote:
>>> Rather than call free_job and run_job in same work item have a dedicated
>>> work item for each. This aligns with the design and intended use of work
>>> queues.
>>>
>>> v2:
>>>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>>>      timestamp in free_job() work item (Danilo)
>>> v3:
>>>   - Drop forward dec of drm_sched_select_entity (Boris)
>>>   - Return in drm_sched_run_job_work if entity NULL (Boris)
>>> v4:
>>>   - Replace dequeue with peek and invert logic (Luben)
>>>   - Wrap to 100 lines (Luben)
>>>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 287 +++++++++++++++----------
>>>  include/drm/gpu_scheduler.h            |   8 +-
>>>  2 files changed, 178 insertions(+), 117 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 273e0fbc4eab..b1b8d9f96da5 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>   *
>>>   * @rq: scheduler run queue to check.
>>> + * @peek: Just find, don't set to current.
>>
>> The "peek" rename is good--thanks!
>>
>>>   *
>>>   * Try to find a ready entity, returns NULL if none found.
>>>   */
>>>  static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool peek)
>>>  {
>>>  	struct drm_sched_entity *entity;
>>>  
>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>  	if (entity) {
>>>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>  			if (drm_sched_entity_is_ready(entity)) {
>>> -				rq->current_entity = entity;
>>> -				reinit_completion(&entity->entity_idle);
>>> +				if (!peek) {
>>> +					rq->current_entity = entity;
>>> +					reinit_completion(&entity->entity_idle);
>>> +				}
>>>  				spin_unlock(&rq->lock);
>>>  				return entity;
>>>  			}
>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>  	list_for_each_entry(entity, &rq->entities, list) {
>>>  
>>>  		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (!peek) {
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>  			spin_unlock(&rq->lock);
>>>  			return entity;
>>>  		}
>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>   *
>>>   * @rq: scheduler run queue to check.
>>> + * @peek: Just find, don't set to current.
>>>   *
>>>   * Find oldest waiting ready entity, returns NULL if none found.
>>>   */
>>>  static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool peek)
>>>  {
>>>  	struct rb_node *rb;
>>>  
>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>  
>>>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>  		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (!peek) {
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>  			break;
>>>  		}
>>>  	}
>>> @@ -282,13 +290,98 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>  }
>>>  
>>>  /**
>>> - * drm_sched_wqueue_enqueue - enqueue scheduler submission
>>> + * drm_sched_run_job_queue - enqueue run-job work
>>
>> Hmm... so this removes the change from patch 1 in this series, and as such
>> obviates patch 1.
>>
>> Do you want to go with "run_job_queue" and the names introduced here?
>>
> 
> Yes, I like the run_job_queue name here.
> 
>> In this case, we can have that in patch 1 instead, and this patch
>> would only split the "free job" into its own work item.
>>
> 
> Sure, so s/drm_sched_wqueue_enqueue/drm_sched_run_job_queue in patch #1?

Yes. That'll create less thrashing about here and essentialize the changes
this patch is doing here (i.e. minimize the number of changes).

I think "run_job_queue" is a good enough name, and please add lucid comments,
so that it's easy to understand--kinda of like you're telling a story. Thanks!

Generally, patch series shouldn't introduce a change (like in patch #1) which
the same patch series further changes yet again to something else (like in this
patch here). It should change one thing only once.

>  
>>> + * @sched: scheduler instance
>>> + */
>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	if (!READ_ONCE(sched->pause_submit))
>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_can_queue -- Can we queue more to the hardware?
>>> + * @sched: scheduler instance
>>> + *
>>> + * Return true if we can push more jobs to the hw, otherwise false.
>>> + */
>>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	return atomic_read(&sched->hw_rq_count) <
>>> +		sched->hw_submission_limit;
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_select_entity - Select next entity to process
>>> + *
>>> + * @sched: scheduler instance
>>> + * @peek: Just find, don't set to current.
>>> + *
>>> + * Returns the entity to process or NULL if none are found.
>>> + */
>>> +static struct drm_sched_entity *
>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool peek)
>>> +{
>>> +	struct drm_sched_entity *entity;
>>> +	int i;
>>> +
>>> +	if (!drm_sched_can_queue(sched))
>>> +		return NULL;
>>> +
>>> +	if (sched->single_entity) {
>>> +		if (!READ_ONCE(sched->single_entity->stopped) &&
>>> +		    drm_sched_entity_is_ready(sched->single_entity))
>>> +			return sched->single_entity;
>>> +
>>> +		return NULL;
>>> +	}
>>> +
>>> +	/* Kernel run queue has higher priority than normal run queue*/
>>> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i], peek) :
>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i], peek);
>>> +		if (entity)
>>> +			break;
>>> +	}
>>> +
>>> +	return entity;
>>> +}
>>
>> Can you shed some light on why you need the "peek" capability, i.e. to just
>> see the entity without actually arming it?
>>
>> In a single-entity scheduling, surely peeking at the single entity of
>> a scheduler, can be done easier.
>>
>> I'm asking as none of these functions were intended as a peek-only/-capable
>> solution, and if you need it, this shows that the infrastructure lacks
>> something which you need.
>>
>> It's not designed for "peek", as you can see above: it gets passed-through
>> the function stack until it reaches core functionality to be used in logic.
>>
>> (It just makes the code too complicated with too many special cases, "if's"
>> and if we keep doing this, it would become very hard to understand,
>> maintain, and contribute to in a few years.)
>>
> 
> This question made me realize that the callers of this function inverted
> the peek arguments. Will fix in next rev.
> 
> The peek is need for drm_sched_run_job_queue_if_ready which checks if a
> job is ready before queuing the job run worker. This is called from the
> free job worker (hw submission count decrement makes a new job ready) or
> from the run job worker (another job in queue).

Yes, we kind of want "queue if ready" to be "atomic", instead of thrashing
about like,
	if run_if_ready(peek),
		j = run_if_ready(!peek),
			run_job(j).
to become
	j = run_if_ready(void).
	if (j) run_job(j).

> If we want to blindly queue the job in these cases then this can be
> removed.

Yes, it's what we're doing now.

> Or alternatively we could remove the peek argument and blindly reinit
> the idle when selecting entity. I think this fine if I am reading the
> code correctly. If you agree, I'd lean towards this option.

Yes please--it's what we have now, so no need to change it. select_entity()
really just gives back the entity whose jobs we can (should) run next.

So, yes, let's leave it as is, without a "peek". Thanks!

>  
>>> +
>>> +/**
>>> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
>>> + * @sched: scheduler instance
>>> + */
>>
>> "if ready" here makes perfect sense, but in the "free job" case,
>> it should be "if done". See below.
>>
> 
> Yes, agree that if done for job makes more sense.
> 
>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	if (drm_sched_select_entity(sched, false))
>>> +		drm_sched_run_job_queue(sched);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_free_job_queue - enqueue free-job work
>>>   * @sched: scheduler instance
>>>   */
>>> -static void drm_sched_wqueue_enqueue(struct drm_gpu_scheduler *sched)
>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	if (!READ_ONCE(sched->pause_submit))
>>> -		queue_work(sched->submit_wq, &sched->work_submit);
>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_free_job_queue_if_ready - enqueue free-job work if ready
>>
>> This should be "if done". Please change this to "if done".
>>
>>> + * @sched: scheduler instance
>>> + */
>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>
>> This should be "if_done". Please change this to "if_done".
>>
>> A "job" is _done_ when it's on the pending list and its fence has been signalled,
>> and we free a job only when it's done, not "ready".
>>
> 
> Agree on all of this.

Great! :-)

Regards,
Luben

> 
>>> +{
>>> +	struct drm_sched_job *job;
>>> +
>>> +	spin_lock(&sched->job_list_lock);
>>> +	job = list_first_entry_or_null(&sched->pending_list,
>>> +				       struct drm_sched_job, list);
>>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>> +		drm_sched_free_job_queue(sched);
>>> +	spin_unlock(&sched->job_list_lock);
>>>  }
>>>  
>>>  /**
>>> @@ -310,7 +403,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>  	dma_fence_get(&s_fence->finished);
>>>  	drm_sched_fence_finished(s_fence, result);
>>>  	dma_fence_put(&s_fence->finished);
>>> -	drm_sched_wqueue_enqueue(sched);
>>> +	drm_sched_free_job_queue(sched);
>>>  }
>>>  
>>>  /**
>>> @@ -576,7 +669,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>>  				drm_sched_job_done(s_job, fence->error);
>>>  			else if (r)
>>>  				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>>> -					  r);
>>> +					      r);
>>>  		} else
>>>  			drm_sched_job_done(s_job, -ECANCELED);
>>>  	}
>>> @@ -885,18 +978,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>  
>>> -/**
>>> - * drm_sched_can_queue -- Can we queue more to the hardware?
>>> - * @sched: scheduler instance
>>> - *
>>> - * Return true if we can push more jobs to the hw, otherwise false.
>>> - */
>>> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>> -{
>>> -	return atomic_read(&sched->hw_rq_count) <
>>> -		sched->hw_submission_limit;
>>> -}
>>> -
>>>  /**
>>>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>>>   * @sched: scheduler instance
>>> @@ -906,43 +987,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	if (drm_sched_can_queue(sched))
>>> -		drm_sched_wqueue_enqueue(sched);
>>> -}
>>> -
>>> -/**
>>> - * drm_sched_select_entity - Select next entity to process
>>> - *
>>> - * @sched: scheduler instance
>>> - *
>>> - * Returns the entity to process or NULL if none are found.
>>> - */
>>> -static struct drm_sched_entity *
>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>> -{
>>> -	struct drm_sched_entity *entity;
>>> -	int i;
>>> -
>>> -	if (!drm_sched_can_queue(sched))
>>> -		return NULL;
>>> -
>>> -	if (sched->single_entity) {
>>> -		if (!READ_ONCE(sched->single_entity->stopped) &&
>>> -		    drm_sched_entity_is_ready(sched->single_entity))
>>> -			return sched->single_entity;
>>> -
>>> -		return NULL;
>>> -	}
>>> -
>>> -	/* Kernel run queue has higher priority than normal run queue*/
>>> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> -		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>> -		if (entity)
>>> -			break;
>>> -	}
>>> -
>>> -	return entity;
>>> +		drm_sched_run_job_queue(sched);
>>>  }
>>>  
>>>  /**
>>> @@ -974,8 +1019,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>>  						typeof(*next), list);
>>>  
>>>  		if (next) {
>>> -			next->s_fence->scheduled.timestamp =
>>> -				dma_fence_timestamp(&job->s_fence->finished);
>>> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>> +				     &next->s_fence->scheduled.flags))
>>> +				next->s_fence->scheduled.timestamp =
>>> +					dma_fence_timestamp(&job->s_fence->finished);
>>>  			/* start TO timer for next job */
>>>  			drm_sched_start_timeout(sched);
>>>  		}
>>> @@ -1025,74 +1072,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>  EXPORT_SYMBOL(drm_sched_pick_best);
>>>  
>>>  /**
>>> - * drm_sched_main - main scheduler thread
>>> + * drm_sched_free_job_work - worker to call free_job
>>>   *
>>> - * @param: scheduler instance
>>> + * @w: free job work
>>>   */
>>> -static void drm_sched_main(struct work_struct *w)
>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>  {
>>>  	struct drm_gpu_scheduler *sched =
>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
>>> -	struct drm_sched_entity *entity;
>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>  	struct drm_sched_job *cleanup_job;
>>> -	int r;
>>>  
>>>  	if (READ_ONCE(sched->pause_submit))
>>>  		return;
>>>  
>>>  	cleanup_job = drm_sched_get_cleanup_job(sched);
>>> -	entity = drm_sched_select_entity(sched);
>>> -
>>> -	if (!entity && !cleanup_job)
>>> -		return;	/* No more work */
>>> -
>>> -	if (cleanup_job)
>>> +	if (cleanup_job) {
>>>  		sched->ops->free_job(cleanup_job);
>>>  
>>> -	if (entity) {
>>> -		struct dma_fence *fence;
>>> -		struct drm_sched_fence *s_fence;
>>> -		struct drm_sched_job *sched_job;
>>> -
>>> -		sched_job = drm_sched_entity_pop_job(entity);
>>> -		if (!sched_job) {
>>> -			complete_all(&entity->entity_idle);
>>> -			if (!cleanup_job)
>>> -				return;	/* No more work */
>>> -			goto again;
>>> -		}
>>> +		drm_sched_free_job_queue_if_ready(sched);
>>> +		drm_sched_run_job_queue_if_ready(sched);
>>> +	}
>>> +}
>>>  
>>> -		s_fence = sched_job->s_fence;
>>> +/**
>>> + * drm_sched_run_job_work - worker to call run_job
>>> + *
>>> + * @w: run job work
>>> + */
>>> +static void drm_sched_run_job_work(struct work_struct *w)
>>> +{
>>> +	struct drm_gpu_scheduler *sched =
>>> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
>>> +	struct drm_sched_entity *entity;
>>> +	struct dma_fence *fence;
>>> +	struct drm_sched_fence *s_fence;
>>> +	struct drm_sched_job *sched_job;
>>> +	int r;
>>>  
>>> -		atomic_inc(&sched->hw_rq_count);
>>> -		drm_sched_job_begin(sched_job);
>>> +	if (READ_ONCE(sched->pause_submit))
>>> +		return;
>>> +
>>> +	entity = drm_sched_select_entity(sched, true);
>>> +	if (!entity)
>>> +		return;
>>>  
>>> -		trace_drm_run_job(sched_job, entity);
>>> -		fence = sched->ops->run_job(sched_job);
>>> +	sched_job = drm_sched_entity_pop_job(entity);
>>> +	if (!sched_job) {
>>>  		complete_all(&entity->entity_idle);
>>> -		drm_sched_fence_scheduled(s_fence, fence);
>>> +		return;	/* No more work */
>>> +	}
>>>  
>>> -		if (!IS_ERR_OR_NULL(fence)) {
>>> -			/* Drop for original kref_init of the fence */
>>> -			dma_fence_put(fence);
>>> +	s_fence = sched_job->s_fence;
>>>  
>>> -			r = dma_fence_add_callback(fence, &sched_job->cb,
>>> -						   drm_sched_job_done_cb);
>>> -			if (r == -ENOENT)
>>> -				drm_sched_job_done(sched_job, fence->error);
>>> -			else if (r)
>>> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>>> -					  r);
>>> -		} else {
>>> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>> -					   PTR_ERR(fence) : 0);
>>> -		}
>>> +	atomic_inc(&sched->hw_rq_count);
>>> +	drm_sched_job_begin(sched_job);
>>>  
>>> -		wake_up(&sched->job_scheduled);
>>> +	trace_drm_run_job(sched_job, entity);
>>> +	fence = sched->ops->run_job(sched_job);
>>> +	complete_all(&entity->entity_idle);
>>> +	drm_sched_fence_scheduled(s_fence, fence);
>>> +
>>> +	if (!IS_ERR_OR_NULL(fence)) {
>>> +		/* Drop for original kref_init of the fence */
>>> +		dma_fence_put(fence);
>>> +
>>> +		r = dma_fence_add_callback(fence, &sched_job->cb,
>>> +					   drm_sched_job_done_cb);
>>> +		if (r == -ENOENT)
>>> +			drm_sched_job_done(sched_job, fence->error);
>>> +		else if (r)
>>> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
>>> +	} else {
>>> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>> +				   PTR_ERR(fence) : 0);
>>>  	}
>>>  
>>> -again:
>>> -	drm_sched_wqueue_enqueue(sched);
>>> +	wake_up(&sched->job_scheduled);
>>> +	drm_sched_run_job_queue_if_ready(sched);
>>>  }
>>>  
>>>  /**
>>> @@ -1159,7 +1215,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  	spin_lock_init(&sched->job_list_lock);
>>>  	atomic_set(&sched->hw_rq_count, 0);
>>>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>> -	INIT_WORK(&sched->work_submit, drm_sched_main);
>>> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>  	atomic_set(&sched->_score, 0);
>>>  	atomic64_set(&sched->job_id_count, 0);
>>>  	sched->pause_submit = false;
>>> @@ -1282,7 +1339,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>>>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	WRITE_ONCE(sched->pause_submit, true);
>>> -	cancel_work_sync(&sched->work_submit);
>>> +	cancel_work_sync(&sched->work_run_job);
>>> +	cancel_work_sync(&sched->work_free_job);
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_wqueue_stop);
>>>  
>>> @@ -1294,6 +1352,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>>>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	WRITE_ONCE(sched->pause_submit, false);
>>> -	queue_work(sched->submit_wq, &sched->work_submit);
>>> +	queue_work(sched->submit_wq, &sched->work_run_job);
>>> +	queue_work(sched->submit_wq, &sched->work_free_job);
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_wqueue_start);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index e67b53c3546b..625ffe040de3 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>>>   *                 finished.
>>>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>   * @job_id_count: used to assign unique id to the each job.
>>> - * @submit_wq: workqueue used to queue @work_submit
>>> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>   * @timeout_wq: workqueue used to queue @work_tdr
>>> - * @work_submit: schedules jobs and cleans up entities
>>> + * @work_run_job: schedules jobs
>>
>> Perhaps a more descriptive explanation could be had,
>>
>> 	@work_run_job: work which calls run_job op of each scheduler.
>>
> 
> Got it.
>  
>>> + * @work_free_job: cleans up jobs
>>>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>   *            timeout interval is over.
>>>   * @pending_list: the list of jobs which are currently in the job queue.
>>> @@ -519,7 +520,8 @@ struct drm_gpu_scheduler {
>>>  	atomic64_t			job_id_count;
>>>  	struct workqueue_struct		*submit_wq;
>>>  	struct workqueue_struct		*timeout_wq;
>>> -	struct work_struct		work_submit;
>>> +	struct work_struct		work_run_job;
>>> +	struct work_struct		work_free_job;
>>>  	struct delayed_work		work_tdr;
>>>  	struct list_head		pending_list;
>>>  	spinlock_t			job_list_lock;
>>
>> -- 
> 
> Thanks for the review.
> 
> Matt
> 
>> Regards,
>> Luben
>>

