Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF31B53E406
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 12:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316CE10E39E;
	Mon,  6 Jun 2022 10:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62A10E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 10:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVBewO3wO81nM0K+1uZ0JfjHFm+XvSYiROJeyWwiKG7EsJmxXFFHqLX9P6D84TJ6YzqcfkzZQVQ7u0JL1azB5X/+DvP7lNFxxxqiXe2GxfvoO4d7I5l6qRT9f6a2+ffdB3pq/f2aTyvLrw2a3FdBbINx3qv/YbOXINWY2PqY6GM08ILh7GbHY01WRpgZMYcsBE2L4YqYqtgb+7FwzqzPzw2BmOT+/9HowB4fQRTxXWrN668EvMKbgUFnW8B92f4CWfiHRwDs4YvPZrQKdQJMe4VpCO2gRJfsxlptkn9zDry9276sGPkfxQV3GX+zPhajyKEa1wPUXjG6MFCj0xnRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j69bPcAW6ZU1DnDi+jYC0HJ0VGmy9Nb5BWUifTr+O+k=;
 b=Vt3ZUjqnpgihMeg/mq/kYKndHLVGOd8Tz4vNsYmMns7TnRedFY+QdQoUFcBaJi7yh7zikl4QxW224XZC2vt1keZ/JlK2PpxnlWVE/JpE/b5h6Nv+PY202nOzb7ssWoee2FVd5FkX+bVnSFAnnP4VNAXDOcfKfCGWv4fdfEDZ3bwkcw3glo5CPaDj/JO1qbRkhBFWeH6TtiPfunn9UmOwKtLfnhZtq14TzBhUka9Pz7XG8bzq9GiU723dD/B84Wx8SsZKzESoHY2J7atEyKfeDkzTKtuPHu6VTcE4PiYJd0rDu6xvi1dOMocOvBvxfxm+QnDq7eNiF+nLgrh7X+e8PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j69bPcAW6ZU1DnDi+jYC0HJ0VGmy9Nb5BWUifTr+O+k=;
 b=pSEzCU/Me6USowENOcayoOZxJlj+qrVULZY4+5KSpv/e+qtiJ6KM6PNOeicwkPy5zLu46mxMIEgtjZPaa9Da/6p3C5Tpm+q1UqHvHGChrS0yJfRFXtvLW49DMi36GgtgYE84EQMkjPG9mD0ewAATuch2dYAI+SC5keo4fEAOhmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 10:15:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 10:15:36 +0000
Message-ID: <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
Date: Mon, 6 Jun 2022 12:15:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
 <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
 <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
 <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
 <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
 <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
 <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
 <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
 <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc5c237-6027-41a0-c4c5-08da47a57fbc
X-MS-TrafficTypeDiagnostic: PH7PR12MB5975:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB59753266553312EB1B6A73CF83A29@PH7PR12MB5975.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2P6FKNG/OhC8IHuPUnqshac3cjyi3f4bxV/ydJLxtwyIAk66wtXJnshFJO/zwvG9ROS0qPsVrJKqVtdWPMhqWu4W7d1YufSaArsS4Prq4jYOStiEIHohfWtoCveJ6Ak5jJK9bhK/o+EVWg7WpqFjcYVBlda1BmQqIwjSqAJtwI6GBzDIa9x0etynpn9aPe7cQ7lb8A6WdqlfsF4RfOT+JGRFMBRFq3gnGigIzGU1pDXvJu57aPk8+UIlghwtLxtEvW672Fu6BKYFJVpSGmWM+hn8/squnSU/M1ijU2BTPHmbrsfLy3uy5KYbsE+o5SSo2V1y1BtkO16SmiVYp+e714TnLpAIXRi0RIWuUDtZ/R6LJvtrq/2YljM72BIzjU+NmLAioGmBy2HPkt2lcYR8AERZ0i2GkEX8017mDNH8Ee0e7TnFqMnS+RzY3/qEWfrkAqUsiusFwHaFPn5nfR8/t/VmKitocfu8bbuWzqkWUE3Pn3s7fnbjFOkdQt5M1GQ8RxeItZtWVTWeWNQYZx+9b17qfQBfN/omFAJKzxF6mPVEFfW72G8BAuJcFNNzlFWiT1fI75EkU+JpFSwL7bR+fzqdkSdTc6mwu4sFx45ODysjlKwTFolnKwIaCx7iWGUxUJeavs/FbOaODTAVp+UH8KUi8+6HElncQWzUGRQL/T+ApR/tXGgzeVx0X+I9Pm0gF6KKyHSNAWfC8Fm5XXWgY5i9Q/eQAZWBiqKonVcTMjsPtgOZDRiQbxm1+8yWAK01
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(5660300002)(2616005)(31686004)(8936002)(54906003)(186003)(86362001)(6486002)(31696002)(6512007)(6506007)(53546011)(2906002)(83380400001)(8676002)(66556008)(6916009)(66476007)(66946007)(66574015)(4326008)(508600001)(38100700002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEZRMmNGVEhxN0FGZ1dnZEtWV096cXp6L3AzeE9sK0dHTTBROVpENmJvMEkw?=
 =?utf-8?B?UEVDMVIyRkpNRjY0WTQwQW1MVTF1ZjBQdlJ2RmRiaDdEOWxxR0tQRkRhK29K?=
 =?utf-8?B?SW9id1daa1pMSkVDMVdkaVRGdXNrajY1ZHpJUFFnVDduYjUwRTZOQk1CUG9m?=
 =?utf-8?B?UldkeGg5UWtmbHgvcEc2VTJTeFFpa2hrWWV0dmZ2Y3RnU1N2VWRVRHhlNThy?=
 =?utf-8?B?ZFNTT2oveG5ZZDE1aklYRHJvVWNhTWUwN2NhRHU3dkhXQWFGZi9yMUtTM29r?=
 =?utf-8?B?ZHBJZXJEOXRucFpWVU4vdXFnVjdyVCtzNzV4ZGQ0OEhldDBKQXdsS01MWlZW?=
 =?utf-8?B?T0tXamhXSVpjM1kxcm5SQU95Y3Vwd2xQTExCdkxJTVNUd3o2djgzSERscHpT?=
 =?utf-8?B?RzhzcWM4emIwQVdJM2RIT1JWWnZOcFBQY0lpeitYZ0FDblJTOXVIK2E0dDZa?=
 =?utf-8?B?Kzh5UzU2NHplRHI2N3lPbHg1YzJ2YTdpNGs2c3hmRWVRNGVBR1c2RTQ4eXJl?=
 =?utf-8?B?UDdnRmhrbzhqN2VoY3NuMEZVdWxCZ2N1Y1FFZFo0c25DQVdRVWcrQVJiazhI?=
 =?utf-8?B?b1kvR3puVkc2RGZRMUVNcDBXKzNVdkNsN1c1aWt4TEdsdXBzZWlWSHBqYlkv?=
 =?utf-8?B?SS9QaU5lUGZQcmF0NlJXU201NUJvRGFURTVqS1NYM2lMUkxjRUlRQ2lRU3c5?=
 =?utf-8?B?VXpaQ2F1VXd5UUUyOVJkSjFURzZteTA1WHY3dHV6UnBDUE1zZG1IYURxNVpT?=
 =?utf-8?B?ZE82UTJmYlVlMmtLVjVFTkQ5a1NKQ2lGVFIyVUxnNlRxQWxYcEFxZzFCN1lF?=
 =?utf-8?B?QndxR0FPWHZnOXQzWXdGVXUvWmN3NjcyUU9WOXFVU0E0R0FuOXg4dVI2S1Y5?=
 =?utf-8?B?ajdQL3ljRDc1Yk12STNRWXNsV3l1dzdQK2V5d2VML1lmWW1saUQzK0pPZkZU?=
 =?utf-8?B?eTYzSUx6USs2L0RpL1ZTa2xkYm5IdURNYzIrT0dmSTN0Um5FTG1iRGxQTUdB?=
 =?utf-8?B?TGFwNzc5a21QR2YxUjVCeEIwTGV5QTZYK2JXRksyZDZsVmpiZDliSUxESjNW?=
 =?utf-8?B?SjNRUUh4bXdRUEZLemRqZitNM3owczQzYnNISVZ0WjFtQ2NPdzFqaFdUTW5D?=
 =?utf-8?B?Tnd0dnNQN2o5SmZVTnNvSGRKWkJDTE0wcTF6bEhiaUJ3aEpnb2U2RTBNU0lN?=
 =?utf-8?B?aFRlS21LS0RlUTczNDNrUDVkVjRFczUzTWRYWjlxVzZEY0NaMXpUa2szNFl4?=
 =?utf-8?B?VllvS0tTQ0wzb0hVTkN2d3kwL2Fhc21tRE55Y2ZGdkxRbWNYNEp5VzFNdmRq?=
 =?utf-8?B?M1JwakJzTGdtUkYrZmlMckpxU3BoUTd5NUxrTEF5RHdFNjF0T24xak8zSUx2?=
 =?utf-8?B?SFpkMklMeXFGZXRSZmpJRHVUaGFWM0s4bGI5bG9nWnVwTFFVcjdRaFkvSGxF?=
 =?utf-8?B?T1M5M3FyRXpQL2JGTGdxUlUvangrYzhOUDF3ejR4eThyNmNoa3FaMjV4V3Jr?=
 =?utf-8?B?VU9QUFNPeFFSOTV6a2JsZjJ3b2J2Ullmc3JlMVA0V3ZoaTNQd29XY2hGSW5N?=
 =?utf-8?B?dy9TL2NHK05sY01yTVo0dHViTEJqZVVxcHpYaVlZK0MwSm9wZTdvcnB0Zyt1?=
 =?utf-8?B?TTFjTGtzTmNYdDdWVjZmZU13NFdGazIyQXVJWXJwaUZsUFc3a0RucmVrRXBT?=
 =?utf-8?B?MDlPSitLYmxrOUJVaER3VVFBTDlaN1FQeFA2bS9BVytiOExaV1lrdmVxK3F5?=
 =?utf-8?B?QlB0cHpxQnBQc2VmUy9jc2NWUWFzWTJjSExSeTladWVsN1QwUEhGSFZLdjJW?=
 =?utf-8?B?SGt0alQ3eS9xVXhSTmRybldWL0NJN0dYMVB3VDg3M3RiWmFKRU9XS09pUWFJ?=
 =?utf-8?B?RzM2QUcyQ0ZHUmhIcDhrMkFtSEpiK2xMeWhoSFY1OTB1OENxNXEwSVJUaDVI?=
 =?utf-8?B?TjdqR3QvaUcyZ2ZtMG1GL0lQdzNoNy8rZFNvVWNaNm81bVREdFlFdFFRMlpB?=
 =?utf-8?B?dGxDVUFRT0FybTJtMC9tWUFYTXRmLzA1aU1tY0hZWWNxYVQ1bG41cG1abFlH?=
 =?utf-8?B?dnFuVHBtay9WWkFVTDlLcmozalY5RWwvT0oyQmVMNUp4TWtHRWFSaFFEVG1Z?=
 =?utf-8?B?VzJibFZZNEtXVUlQWnZmNCsvK0xSY2xwNkN2bnhHa1lyTml1NTlDenR3US9m?=
 =?utf-8?B?Y0NrZ2M2RWRmZS9xVzJZcVNIMmJDSDQzOHhKMnVMRkNEV1pkYlppdnpRSG53?=
 =?utf-8?B?Njd2eDdCSUoxV2NYeFhLckFxdVlZaHRLLyszYkR4Z2JWdFhZblFuYnR4T1hJ?=
 =?utf-8?B?N2k1VmxqYWJqZFpTZ3A3MEMweGx2ekZBU1ZrbG9hdDZKL3lGbjg0Wk5SY012?=
 =?utf-8?Q?hPIyslOG5RuYTjP3iCoLQ+GiOSr2d2so0AzgvOeuFWWfW?=
X-MS-Exchange-AntiSpam-MessageData-1: b4Xuq4RGU8BwMQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc5c237-6027-41a0-c4c5-08da47a57fbc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 10:15:36.6006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83Yr9j5zM202XOdGKJ6sOTkyv4Nq14WDf5080Qyczq8nEgkNlMzrgVIjhJd9qa2Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 03.06.22 um 21:11 schrieb Bas Nieuwenhuizen:
> On Fri, Jun 3, 2022 at 8:41 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 03.06.22 um 19:50 schrieb Bas Nieuwenhuizen:
>>> [SNIP]
>>>>>> Yeah, but that's exactly the bubble we try to avoid. Isn't it?
>>>>> For this series, not really.  To clarify there are two sides for
>>>>> getting GPU bubbles and no overlap:
>>>>>
>>>>> (1) VM operations implicitly wait for earlier CS submissions
>>>>> (2) CS submissions implicitly wait for earlier VM operations
>>>>>
>>>>> Together, these combine to ensure that you get a (potentially small)
>>>>> bubble any time VM work happens.
>>>>>
>>>>> Your series (and further ideas) tackles (2), and is a worthwhile thing
>>>>> to do. However, while writing the userspace for this I noticed this
>>>>> isn't enough to get rid of all our GPU bubbles. In particular when
>>>>> doing a non-sparse map of a new BO, that tends to need to be waited on
>>>>> for the next CS anyway for API semantics. Due to VM operations
>>>>> happening on a single timeline that means this high priority map can
>>>>> end up being blocked by earlier sparse maps and hence the bubble in
>>>>> that case still exists.
>>>>>
>>>>> So in this series I try to tackle (1) instead. Since GPU work
>>>>> typically lags behind CPU submissions and VM operations aren't that
>>>>> slow, we can typically execute VM operations early enough that any
>>>>> implicit syncs from (2) are less/no issue.
>>>> Ok, once more since you don't seem to understand what I want to say: It
>>>> isn't possible to fix #1 before you have fixed #2.
>>>>
>>>> The VM unmap operation here is a barrier which divides the CS operations
>>>> in a before and after. This is intentional design.
>>> Why is that barrier needed? The two barriers I got and understood and
>>> I think we can deal with:
>>>
>>> 1) the VM unmap is a barrier between prior CS and later memory free.
>>> 2) The TLB flush need to happen between a VM unmap and later CS.
>>>
>>> But why do we need the VM unmap to be a strict barrier between prior
>>> CS and later CS?
>> Exactly because of the two reasons you mentioned.
> This is the part I'm not seeing. I get that removing #2 is a
> nightmare, which is why I did something that doesn't violate that
> constraint.
>
> Like if an explicit CS that was running before the VM operation  runs
> till after the VM operation (and hence possibly till after the TLB
> flush, or otherwise have the TLB flush not apply due to lack of async
> TLB flush support), that is not an issue. It might see the state from
> before the unmap, or after the unmap, or some intermediate state and
> all of those would be okay.
>
> We still get the constraint that the TLB flush happens between the VM
> unmap and later CS and hence the unmap is certainly visible to them.

So you basically just want to set the sync mode in 
amdgpu_vm_update_range() to AMDGPU_SYNC_EXPLICIT even when it is an unmap?

That should be doable, but then you don't need any of the other changes.

Regards,
Christian.

>
>> #1 Is rather easy to fix, you just need to copy all dma_fences from the
>> page table dma_resv object over to the BOs dma_resv object in the gem
>> close handler. E.g. exactly what you suggested with the dma_resv_copy
>> function.
>>
>> #2 is a nightmare.
>>
>> We can't move the TLB flush at the end of the unmap operation because on
>> async TLB flushes are either a bit complicated (double flushes etc..) or
>> don't even work at all because of hw bugs. So to have a reliable TLB
>> flush we must make sure that nothing else is ongoing and that means
>> CS->VM->CS barrier.
>>
>> We try very hard to circumvent that already on maps by (for example)
>> using a completely new VMID for CS after the VM map operation.
>>
>> But for the unmap operation we would need some kind special dma_fence
>> implementation which would not only wait for all existing dma_fence but
>> also for the one added until the unmap operation is completed. Cause
>> otherwise our operation we do at #1 would simply not catch all
>> dma_fences which have access to the memory.
>>
>> That's certainly doable, but I think just using the drm_exec stuff I
>> already came up with is easier.
>>
>> When we can grab locks for all the BOs involved amdgpu_vm_clear_freed()
>> goes away and we can keep track of the unmap operations in the bo_va
>> structure.
>>
>> With that done you can make the explicit sync you noted in the bo_va
>> structure and implicit sync when the bo_va structure goes away.
>>
>> Then the only reason I can see why we would need a CS->VM dependency is
>> implicit synchronization, and that's what we are trying to avoid here in
>> the first place.
>>
>> Regards,
>> Christian.
>>
>>>> To get rid of this barrier you must first fix the part where CS
>>>> submissions wait for the VM operation to complete, e.g. the necessity of
>>>> the barrier.
>>>>
>>>> I'm working on this for a couple of years now and I'm really running out
>>>> of idea how to explain this restriction.
>>>>
>>>> Regards,
>>>> Christian.
>>>>

