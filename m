Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A234DC995
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0C10E6E9;
	Thu, 17 Mar 2022 15:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2043.outbound.protection.outlook.com [40.107.101.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EA210E6D6;
 Thu, 17 Mar 2022 15:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDqFdDmrBLOzI3W2P0kI7wPsQ5qV6Wn+JlzSdLydaV3amS+oqi8OCiQ7c9+stS80Pbif5B5QFATFb1jNlsUpURF9U6emvUTYxoQGDPOP63mrZBNwbASbplnmSwz9lkCKYmWItWaZTuxTRMhZd1Qv9y7QMLCOr4D2b4IzlJXGaNdd3wPQtRejEGf9gsOCaRpWOb7K37pZ31Enlgs3Bjt36PaufoW7xj9tlG38e0hmeRM6aMhk2HtBazqOLrj4oqQG+xkppSJTqIvsAINJRPEVoyAyNcw/psNauHxBY26tdg5MSKLne2iO8I/II28rueuuY/wo1NGEJrXhNWmIuPurrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh/8n+qKTl/2EGITF8XDL6R94KET5MHtrfXzZPxT5zc=;
 b=Mriy1b745h/jXIFZirlodEiyGjUGSEQ37ocEsE/LXgl1Q/wdMtCJBv+zdiFTw3KmSVuHf+lP4/mph1spjnTuNYXy1JvuEq+1mMYacn68Qrzozp5I5bA/5PnCCxDN3aflL3hSaTloF4dfcuCs1z4rzzK23IhT4Xd88orGTveUM6U8TA3TYghbzdDNAvMi9nJMgsO1qYUbdE5OKyhRq4MZUJpK/st24TPsvPNebqEvvVeQJ5SvEdeLfNPPaisCgyXsOt2IQDwbApp8owpfF9PrkzqYYJn0C+14jxXjrJNARxuRjf00/p062LovoZKuEFsx56eVmVnlx07emjM3MuXi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh/8n+qKTl/2EGITF8XDL6R94KET5MHtrfXzZPxT5zc=;
 b=zLt+8kQVblqJ9IJX2+IpLs0QQ44Kd6tM1deFu8x74mOKkdZ4D36rwlGRNnIQv71ELiLmax5e7+O/qbg7aumeCX2B/i+tpGe2VE6n2bQYNWZQ4EusM89AIp/Jhch2XvKdmeGRRNZQ2RR7DT35P5ICZ/Y5seNCpfzNJmhBLHXFuhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 15:08:37 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 15:08:37 +0000
Message-ID: <1f003356-3cf9-7237-501e-950d0aa124d1@amd.com>
Date: Thu, 17 Mar 2022 11:08:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] drm/amdkfd: Protect the Client whilst it is being
 operated on
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
References: <20220317131610.554347-1-lee.jones@linaro.org>
 <8702f8a5-62a1-c07e-c7b7-e9378be069b6@amd.com> <YjNNCXc8harOvwqe@google.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <YjNNCXc8harOvwqe@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb8443c-1c34-4995-1f99-08da08280359
X-MS-TrafficTypeDiagnostic: MN2PR12MB4533:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB45333CC6B7455009803A0E6F92129@MN2PR12MB4533.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5OhmmdEOAvHyqrYem/U3TlQ41iRuDPFRktcSDukZO8jbM8NbapYD4oepdEB6JwnXy/SjCFagQV4i+bcHcQa4fbb+G6A11vpLaaPoHYSFdym/ak/3ZvjEzahpv1a/wCm5umj9HGLfFXHLo2fpAMBMkGhauzNjl9igomEXzTtaYq2nFGTiZpSWD4ZBWJmZsRvSyLPoWniX9/d+LHguNc/9z0eEqYmiPZPwIPE0VNdw8CB7Z6bVCQmcICvouR1PJ+Ax8mw79/0TvdN711moEgDXug4geb8AGndSc2SIfiif3kU+3XWbbvqlAwHI6sO6o/4OCeo2a5zMLDt1KGLQ6HRAIOQkbVQLmhSSMEanp9FT62UKQuh3e1aFSt26Kys/ZbHwXwiULmJ9khoJ46iLbaRUafg6qyOmOjtjiF/Lg4yX0ieThxEIg+ltG+u0NmZefcwJQSH0yuwUjPf5QLeNrYpn01j9+AfgGVc4XANNt2QoklG9gsLUqxaIC6yXbo7vqPRHmvWSZZHb22ShL07Kue7Kov35WAWOUxdp2f6woaCVed+Q1yiZr/Xcq9nUIXqXuUNFS67EzuIMDHS4UJoKlYft9cFLU1f3/bZa7BVv53SEFY8OsgAOWvpv1hFwt5NNqQhxSFYFn9SBcgIaBPVoFOm+2Rq7TjA+9bjrDE6xdHu18wF3O0UNcZxOFR2Bv1xXMux2NdCJiFjlFWIZh3EHUZUoAYj7ZkmNu1cDcEeYYpLGgWdg3BSWp5soedC+h7l1wFpb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(6486002)(6512007)(508600001)(316002)(31696002)(83380400001)(66946007)(38100700002)(6506007)(4326008)(8676002)(66556008)(66476007)(86362001)(44832011)(2906002)(186003)(36756003)(26005)(6916009)(31686004)(8936002)(5660300002)(54906003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2pBS1QzQ3VxdWNxMzdzd0FiMVc3Vi9nb09Id2w4K0xuUitvdmJqekVFWHla?=
 =?utf-8?B?NnJya0dCYzNSMUJsR0ZGamxUVGZTN3RJbmhTbXRDeU5VT2Y5S3A4VWl5Tjl0?=
 =?utf-8?B?Vm16WTF2N3ViU3E1YlpZRFgyZjlEMzV0aDJIWjNYV2FMYjJNY1h1MW1jOVh1?=
 =?utf-8?B?anhLcXZlaGJuR3hDdVhtWVZNNVZudU5VZy8yampZaHVvbTFwdzcwdUhuSnJ3?=
 =?utf-8?B?Y3h0NEpWaTJucmwyYWRjTnFhaXJ1NXl0c2JYRmxPaElUWmEvREV3c1NRNnRh?=
 =?utf-8?B?MXJ0cEJERTRJbUh4UWhtUi81bTVQczNvVlVZSzFEdk1GbUp5ZDhLblRRZU4w?=
 =?utf-8?B?UDFaa21lcGhiajVmeUhUQ1pHVjNMaDA3WmlMOUNnV2ZHdU9QbTdTcHVkVm1E?=
 =?utf-8?B?bHg4dWNkd2JiRUtZYWdmZE9UeGo4N1BKbnJqQlQzM1VsQmVoMUtxM01mVk1k?=
 =?utf-8?B?dlZna1V6dWxhb2ZLeUM1TFFwWG5YckJnSXJZZ2s2em80alRKWERxb1QvL3ha?=
 =?utf-8?B?QWdLVU9tdXY0TEhiWTViUmlSNStvUWJDa2FDcHVtb0N2WldJa3FhQTJhYmQ2?=
 =?utf-8?B?Y01HbDlPMmQrSElPOHNINEdrMnd6K2lBUjcxdEFLcmo4ZHBoRGQraFl1WFFz?=
 =?utf-8?B?RXZkTUtLb3g1YnUzWHVmOEhZTWZzWk02a3VpaUhBWFBid3RrcUp5SFJONGdC?=
 =?utf-8?B?Q2o5UEcycUhKdTAwZXYzRDNFNmNlSEdlU2F5WWFXMWdmaFRTbW5qSkpjbU9r?=
 =?utf-8?B?Q3dTaVk2SmZMR3ZhbmRzTWpRalBMRS91MGpuR3QxQlpnajFNL0RIUlJDTFR2?=
 =?utf-8?B?cEk1RERUV1hlaVNQWVRqS3BLdE9YQUp0bHpydWhKSGNVcFp0Q2FJdHVJR3lW?=
 =?utf-8?B?Y3FsdGZrTDV0cjc0L1NXQVF2WG1xOEhEaDdqeSt5MStTSTdyR1ZzSTdkTDN5?=
 =?utf-8?B?NG04Ym56RlQ1TXNoOElhK1BlTUpiNTdmdWkvNkRhT2lPUWxibEg3Ulhid0hK?=
 =?utf-8?B?bDNHWWF6MUtJbU9wc0lneVhFY3JMVTdPZlkzek1RYUM3S2JFdWp4SHQxTUlv?=
 =?utf-8?B?OGZiS04xRVhmUnNJbzFrV0Zldnh6eExvQ0VUNjZqY0pGN3h5MmtBa3NDOGhy?=
 =?utf-8?B?M0QwNkFqcTZDSnE3SnJjS1h6cTVCNFRxQzI0c2JJWUNlNjYvNjM5dXNQdnV3?=
 =?utf-8?B?MVVjbExyVHFkQis2QTNLeG1VZ1VDMFhBZXU5dGtjaFg5aXZXNXB4SE5HU051?=
 =?utf-8?B?ZURmcTlxRXVKUVVCWC81TVRWbzdmb01JdkpvZXV4Rjc0SG9sY1JMUFpOTm45?=
 =?utf-8?B?YUV0bDBiK0RPc3k1NlU5YWk5RzdtTEx0YU1hYmo0b3c0MDlGSkVnQVpQSWI3?=
 =?utf-8?B?dS9RMmRnWWZLUC9VblVkT0hrUTRFWW5VQWZZeEJrRmZZbHdydjdaUUxpK01K?=
 =?utf-8?B?NDZ0RjN0dU5ISHMxSnNSV041R3Y1WnNJNHplRFZ1SHUrN3Frc0s1Ynlnc2Ir?=
 =?utf-8?B?ZFIyZFBoNVZROUJPMUY3cVI1NWNzWDQrUmtUdG42d3BXTlo2ejVrWGJ1ajlY?=
 =?utf-8?B?U0UxN29YU241V2lqNGJEQVN4eW9IQTZvZEpmSFNDTk45d0NqQzFPU0crTis2?=
 =?utf-8?B?elpzVTJ6YlY1MXhEaWkwWStrdkpSSHpoUXducjluNmxzYW85QVhPTlNDRFRR?=
 =?utf-8?B?cFVLTk1ua3o0VDk4S0htWWFaemZyLzVNVmhYZ1F3dmVzOGFUZERFZTV0RE1D?=
 =?utf-8?B?Lys1RS8xbVZCZXlCTElXRUFaUENMVkxDUFU3d01raVpqMjF0SEZkQ2plemdI?=
 =?utf-8?B?TzU3ZGJ2Wm9EQ2Y3M2hoekhhZFdzVlZHVXk2Z3paZHhxZW5RR083Wm5WaGtB?=
 =?utf-8?B?RTNWUU1WU01FNnU0WmRMTS9tQkNoZHR0SktMd21kbkhMMzhWb21xWlFFaCsr?=
 =?utf-8?Q?VkzY7pANMKSJDx0UWCaeo0c+zXBC/tDU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb8443c-1c34-4995-1f99-08da08280359
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 15:08:37.5482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tI6O5GAJgdnJ/BX9WKC1ARRH2T32cQeDHkVMPFXY8uvAE2si6Dn96cKfIYlI5xtD33/NVbTAiarnfjc3PP9NUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-03-17 um 11:00 schrieb Lee Jones:
> Good afternoon Felix,
>
> Thanks for your review.
>
>> Am 2022-03-17 um 09:16 schrieb Lee Jones:
>>> Presently the Client can be freed whilst still in use.
>>>
>>> Use the already provided lock to prevent this.
>>>
>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: amd-gfx@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>>> ---
>>>    drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>>> index e4beebb1c80a2..3b9ac1e87231f 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>>> @@ -145,8 +145,11 @@ static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
>>>    	spin_unlock(&dev->smi_lock);
>>>    	synchronize_rcu();
>>> +
>>> +	spin_lock(&client->lock);
>>>    	kfifo_free(&client->fifo);
>>>    	kfree(client);
>>> +	spin_unlock(&client->lock);
>> The spin_unlock is after the spinlock data structure has been freed.
> Good point.
>
> If we go forward with this approach the unlock should perhaps be moved
> to just before the kfree().
>
>> There
>> should be no concurrent users here, since we are freeing the data structure.
>> If there still are concurrent users at this point, they will crash anyway.
>> So the locking is unnecessary.
> The users may well crash, as does the kernel unfortunately.
We only get to kfd_smi_ev_release when the file descriptor is closed. 
User mode has no way to use the client any more at this point. This 
function also removes the client from the dev->smi_cllients list. So no 
more events will be added to the client. Therefore it is safe to free 
the client.

If any of the above were not true, it would not be safe to kfree(client).

But if it is safe to kfree(client), then there is no need for the locking.

Regards,
   Felix



>
>>>    	return 0;
>>>    }
>>> @@ -247,11 +250,13 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
>>>    		return ret;
>>>    	}
>>> +	spin_lock(&client->lock);
>> The client was just allocated, and it wasn't added to the client list or
>> given to user mode yet. So there can be no concurrent users at this point.
>> The locking is unnecessary.
>>
>> There could be potential issues if someone uses the file descriptor by dumb
>> luck before this function returns. So maybe we need to move the
>> anon_inode_getfd to the end of the function (just before list_add_rcu) so
>> that we only create the file descriptor after the client structure is fully
>> initialized.
> Bingo.  Well done. :)
>
> I can move the function as suggested if that is the best route forward?
>
