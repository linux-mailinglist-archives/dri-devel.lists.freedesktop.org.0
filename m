Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D7248464D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 17:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BA889FA0;
	Tue,  4 Jan 2022 16:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC2489C03;
 Tue,  4 Jan 2022 16:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbSRYy8F5IzkT8JYTPxGm9B+E6cMfkV6CEudyHgtmzqMKNOfjYDhKpSPGKBoAi78qC7Ubh95qSBpysEBcYRdi1I8gaRzLOzs0LDPuSCW4br4c2pVbht/o+9Us2tmaOjkfM8MRW3r0g0HkDakM08rDDEh5x8eEmPJwNKxpsALmoQrxdVIi/aZZ79k6mKhjd/0APDubnjcV3a7TEWcmdtmyrUTfbYzDY6Tp/GkGVZKXu0My17V18OO0vGkIpn+P0KEbj0lacPaPbK3XTOZSYB7oTWqBhF+bxqo/Ytfzl4Ye5K6kWSjnH9xKXpYBoFC7oVcvIU3rfam+MUMZCW/lz5yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZHqTOTOTeaIBKL5j6KGer0HnJRxeiwsnGGXc/Y/eqQ=;
 b=VZjRqO8y6bWLrRWoWwySGiApRv9qe0JdBrj0uHxJHr1AkXWCWf732sBSvd/v7yaUCX/KAHBs/8NfaMxAv++Dp/KuCrEQUKf3kS3i95hqkIHnjsK4DOjG/GfdZf22LAWBzCLxq+XGHD4IEthw5k7ArTa/QrKxniy9X55zUZ1FAqUEuw1VOHApOhlRwFm6sbPC1FX80wFE+SUZgDmojeIrFfoV8FtQpA7s1BYwbZvFsFmiWb16MaO3xwLB2vGH4CN9dhVlol6qYFNlsLfOL8Lz93RnEhx1M9B8hq7yaKytOFtoPXOHORUSD1chRquwQRhOWdmlxxrToanwMmNfrTD+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZHqTOTOTeaIBKL5j6KGer0HnJRxeiwsnGGXc/Y/eqQ=;
 b=mjEZIcmwfkLptoUlB4Ssw+Crr+Li5jH0xevCMMuHmRluCVpS01aYbH36XrSvS/TCrobTIBe5WWx55BrvVaj3whYm4Z86PDWWOcBSihgd8A6YdxHl0qbxJfGz8NVf1QTd4zNeOJLtsyvY8wwjWemsg4S97lPxfYS0Ufz4B14hWXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1532.namprd12.prod.outlook.com (2603:10b6:4:6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.15; Tue, 4 Jan 2022 16:56:47 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 16:56:47 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
 <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
 <20363a4e-b282-232d-34d0-14867bad4931@amd.com>
 <BL1PR12MB5269922395096810CC79E66D844A9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <a74c1198-6027-6a0f-55a8-24227c868704@amd.com>
Date: Tue, 4 Jan 2022 11:56:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH2PR19CA0011.namprd19.prod.outlook.com
 (2603:10b6:610:4d::21) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26eed42d-4bea-4688-f902-08d9cfa3318a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1532:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1532F2EB480C5DB6D741C13BEA4A9@DM5PR12MB1532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6pAsz+EXY8gNriNaZRKOMcDHxoZuc8VmriWY2IK0tBPw5xD2mAArHlKufVQkyf8RrzsATSTBh+5pJpj8Ei4uSCPNMZ5mqYBgYuV6r903NIek42T9YvYgnEiM+7TfY+0sCoFKSVIEy/sbK20D7KqDoXz9mvnB/Nt6rsqPAhKWUlnsUVomTzaTadheZKpznDKV8zx7f7pHBJASoJx46rMZnQFdjvUDTJooCvVa6uVCpsD/mzfwoCBaZVidRyRTprh7Lf7t2vOpDqnI3cy3hErlTq2eoLBRb/Wq0hmnKJ2PpxSi036YMdCTgAGYPKLMilVhj4jR7+o17+nMMqz3JxSW6M7BfRkFwZ/z0TO9d2jRmRvCjG4FXaHMGANZ/VzNBV7O1duStIhb2DJhr62Bc3i0Z7QVE8DQ5lFjj0VfKZ2Dsa4LEOg3VcWZEWTFs110s3wXGJxZ0UTFYBnoCHPEU/1ALZcaVFfo3WU53dccy+d1O9TOgdcoPfHQQCEphX74E1bqxelqquCzCV8DcfOhYLGIAOD+poMS4zECjLWw5q3oqKAhKnkJoyIEiXYfINtAj3g8Yoy0g7dK7hirZQWYFTJLRLIywk5RaZqV2Rc1tis7mOhwE+uUpbqcm3Gk4jAx1WXaWLkhiAm4ky10XQI39BtRDzVwlIs0I3/WeMPmyzzCJOdMHnN/sBt783Ekg1DDvtEq8jm1s/mUOVfQpwC57GXLCkwzsBCx61G0zWy82UdfCDeZ3WwapZALbqUL7VNT5x7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(44832011)(4001150100001)(6512007)(921005)(86362001)(508600001)(6486002)(8936002)(316002)(31696002)(53546011)(6506007)(2616005)(2906002)(4326008)(36756003)(31686004)(6666004)(186003)(30864003)(110136005)(6636002)(66574015)(8676002)(66946007)(83380400001)(38100700002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZlRExSVjl2QTNQcXBUMUxBZWU1aXI3KzBzVXFaREYyNjFhR0NaUXppbzBt?=
 =?utf-8?B?RjlTaCs3YUU3WFJwM2laRHd0YUZmajJVOTJSdlc0aVQvd01RbnBoRk9ESmha?=
 =?utf-8?B?QzNUMHM1dW9NQ1NMZXpoT0M3YlZWQ3JRYkRhcGFQL2t1bTUwMG03OUxWa0dO?=
 =?utf-8?B?ZUxwMWtUZHVhRlZkYytZeHZrSHBHamVkcERMZ2tCN3hsNkM2a2hrS1RvWmpl?=
 =?utf-8?B?b3k5V0J6UXFYeDVoU2JHT3ptdnpsQXpaN1VIRjJheHdaYUtvckVLY1lXYVVj?=
 =?utf-8?B?UzVXUHV2clAxNHVPOFIydEw1b29qLy9NNk5LVEUxbitSWmwvUUtYZzVreU9s?=
 =?utf-8?B?VHlGM05OZitVVzdsSHBCdGM4UUtJbzN2em4vVlVDYUwrNXhwSkNyT3IrV1Y4?=
 =?utf-8?B?YytlU2V1Um5FclhGT0dkQWYvNndLSFZ3YmpvNUJBdCt2UzI0bEJCY3JFRzEr?=
 =?utf-8?B?QVN1SHdlc2p0TjRRWkNjN1pNdUMwNmNTd0lOWGd0TUF1N2ZLSkVueUhISXZr?=
 =?utf-8?B?ak1sZU81MmFGNU1jMFZROHZNaXhBSXZOeGtUYnZjbWszdmJMTzhseWpYTGsx?=
 =?utf-8?B?M3JLejdJZ3ZhOUJuWjM2b3Zva0c4a2pNTS8zYUtyUFR5VEMwSXdseG9HNk5t?=
 =?utf-8?B?VzhmN2ZaWXFRejUrN0JXNFVEcXEyT1VFaTYrOXdIQjZIMERYOHdKZHpOU1dr?=
 =?utf-8?B?RDgzWTJ2VVMyTEhidlpkWDlTMzJjZ1ppUDJuNk9mSldqall1aEh2T04wWm1y?=
 =?utf-8?B?MHNOVDYyck40M3ZHaE5FTytIcktmekxmZ3JKWXVnb29PYXlWRjFjTGNwc2lt?=
 =?utf-8?B?R3BkQTNVOWZxVEpUY2dhSmVpNnBNazJrNERxNWdjcXo1Y3VIbERsTnhBcERB?=
 =?utf-8?B?aVF5VnkxejdhSS83Q2JuN090V0dCQ2tvdmJJMVFLM0JsRE93Vm5Zb3FneVcv?=
 =?utf-8?B?RnE4N3lWZ1d5R3A1cUVGek9ZdjdxSFhJRUtuemUyMk5MY0F3Um8zYkJqWFNJ?=
 =?utf-8?B?MWZlQWlKalM2Q2pKaGtxclRMVzBDRVJ1aUREc200M0RWNnNNR2ZiMU1jU3kx?=
 =?utf-8?B?VXhKM3krY1FRUGJzQ0pDTGNlNU5URmlXc01ucURxbTMzL041ak5KU21YVlhL?=
 =?utf-8?B?S3NFdUpmd04yd2VtQktkcDF0NkJFYytpOFRjdXlFa1haM2k2cmhqd3hCU1Fu?=
 =?utf-8?B?K2taUWplMWtnSkRMQVBIRXlQd2VjeGkyN0hqWkYyeGF5dzgyUFNTUmtxVWNy?=
 =?utf-8?B?ZXl2WU5IdTg3OHcrNnBuOVovakJxMXdsa3kwSkdNUDR2clRwVkJrQldwUkp0?=
 =?utf-8?B?ZklSK2NkYnl3NWwyRzNwOXpHdlZMWkgxM0FSR05MNEpnRDZJZTNDTklYNVNU?=
 =?utf-8?B?dWw0azBkUjNXekltcndmNC9LUjBYM1pwYTRFZXNlSTJqMGg1YkhzdjFLUjlh?=
 =?utf-8?B?bURibERmZE1ibkV2OFBsL0RIa3pMSkpMN041aW5QWmNuQ3lMSWg5ZzM3VHIz?=
 =?utf-8?B?a2VvaFNnZ2NSZzhoYnlPdExtMXNsWm9mMDFyUW81cFdIOWRmYjJFWXlCMDIw?=
 =?utf-8?B?OHR1UlFmSkR2anFpZG0wRHkycG01VC9ZWnhCZWdGOFpHMW0yQTJzeGRldDRV?=
 =?utf-8?B?SGVaSk41SXJDVThpNmdvMGZPNG9tVDIxUm9yZEo0WFV6cFNqUUYwSHMwS0VB?=
 =?utf-8?B?blFlL1lGNzBoaGFmRWVqdGprY3hEZnRQT2daWVRQbU5IZ1hscXpKQ0pBSnlX?=
 =?utf-8?B?R2liUTVOR2tNa3JmMXNqRTJYTlpraDVtcmtGREc5dXlMQWM0ekNjaGc1R1R0?=
 =?utf-8?B?OGsyQUU2YXg4T3FtbnQxampLRjNya1FEY2ZYZzhHcWM5ZXp5ZU9QY2JtYjdl?=
 =?utf-8?B?L0h6eFhuOUpBNGxVcituR3A3L0lvU1hxZllwaFZxZFRxcldNWjFkdG8vQWY3?=
 =?utf-8?B?S3BpK21yR2piUzBIV2pwZkJqYXpCVW41Ti9mMG1Gbk91VmRZaERUSzl6MEht?=
 =?utf-8?B?bXFuK2gwNlE3QnJkZm56cXZJbk1pd0wwZXRkVUJGaW5PaVdRaEJDOUg0TVM4?=
 =?utf-8?B?WkZoMlhpdHpqSkFoazBTMklaRlF4czREUCtjbCs0UUUrWThuMFg3cFR2bGEz?=
 =?utf-8?B?b3RVUU9zb09DV3JSZkk3SGhQbXIrOU56TkZsS2JMOUt4QjkyYmRHQ1Q3YXNl?=
 =?utf-8?B?anFjSTdVeUhMZjBzMlYzWUVDQURLNFBGdmx3c1l5b2tOd1dXWWxwcEc5ZXB3?=
 =?utf-8?Q?rliDcbDRrG/xytnp3AlhxJFFYBQfhlgapB+GHrvIWY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26eed42d-4bea-4688-f902-08d9cfa3318a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 16:56:47.1664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Rdpdl6IheTMUSS/jY/RxJe212lEt09xR7It2F3toU4slffaVMskpBitKi92x6NniuXDo+T15DM9Kjt9Y36caA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
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


On 2022-01-04 6:36 a.m., Christian König wrote:
> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>> [AMD Official Use Only]
>>
>>>> See the FLR request from the hypervisor is just another source of 
>>>> signaling the need for a reset, similar to each job timeout on each 
>>>> queue. Otherwise you have a race condition between the hypervisor 
>>>> and the scheduler.
>> No it's not, FLR from hypervisor is just to notify guest the hw VF 
>> FLR is about to start or was already executed, but host will do FLR 
>> anyway without waiting for guest too long
>>
>
> Then we have a major design issue in the SRIOV protocol and really 
> need to question this.
>
> How do you want to prevent a race between the hypervisor resetting the 
> hardware and the client trying the same because of a timeout?
>
> As far as I can see the procedure should be:
> 1. We detect that a reset is necessary, either because of a fault a 
> timeout or signal from hypervisor.
> 2. For each of those potential reset sources a work item is send to 
> the single workqueue.
> 3. One of those work items execute first and prepares the reset.
> 4. We either do the reset our self or notify the hypervisor that we 
> are ready for the reset.
> 5. Cleanup after the reset, eventually resubmit jobs etc..
> 6. Cancel work items which might have been scheduled from other reset 
> sources.
>
> It does make sense that the hypervisor resets the hardware without 
> waiting for the clients for too long, but if we don't follow this 
> general steps we will always have a race between the different 
> components.


Monk, just to add to this - if indeed as you say that 'FLR from 
hypervisor is just to notify guest the hw VF FLR is about to start or 
was already executed, but host will do FLR anyway without waiting for 
guest too long'
and there is no strict waiting from the hypervisor for 
IDH_READY_TO_RESET to be recived from guest before starting the reset 
then setting in_gpu_reset and locking reset_sem from guest side is not 
really full proof
protection from MMIO accesses by the guest - it only truly helps if 
hypervisor waits for that message before initiation of HW reset.

Andrey


>
> Regards,
> Christian.
>
> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>> [AMD Official Use Only]
>>
>>>> See the FLR request from the hypervisor is just another source of 
>>>> signaling the need for a reset, similar to each job timeout on each 
>>>> queue. Otherwise you have a race condition between the hypervisor 
>>>> and the scheduler.
>> No it's not, FLR from hypervisor is just to notify guest the hw VF 
>> FLR is about to start or was already executed, but host will do FLR 
>> anyway without waiting for guest too long
>>
>>>> In other words I strongly think that the current SRIOV reset 
>>>> implementation is severely broken and what Andrey is doing is 
>>>> actually fixing it.
>> It makes the code to crash ... how could it be a fix ?
>>
>> I'm afraid the patch is NAK from me,  but it is welcome if the 
>> cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>
>> Thanks
>> -------------------------------------------------------------------
>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>> -------------------------------------------------------------------
>> we are hiring software manager for CVS core team
>> -------------------------------------------------------------------
>>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Tuesday, January 4, 2022 6:19 PM
>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König 
>> <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey 
>> <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, 
>> Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; 
>> amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; 
>> Chen, JingWen <JingWen.Chen2@amd.com>
>> Cc: daniel@ffwll.ch
>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset 
>> protection for SRIOV
>>
>> Hi Jingwen,
>>
>> well what I mean is that we need to adjust the implementation in 
>> amdgpu to actually match the requirements.
>>
>> Could be that the reset sequence is questionable in general, but I 
>> doubt so at least for now.
>>
>> See the FLR request from the hypervisor is just another source of 
>> signaling the need for a reset, similar to each job timeout on each 
>> queue. Otherwise you have a race condition between the hypervisor and 
>> the scheduler.
>>
>> Properly setting in_gpu_reset is indeed mandatory, but should happen 
>> at a central place and not in the SRIOV specific code.
>>
>> In other words I strongly think that the current SRIOV reset 
>> implementation is severely broken and what Andrey is doing is 
>> actually fixing it.
>>
>> Regards,
>> Christian.
>>
>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>> Hi Christian,
>>> I'm not sure what do you mean by "we need to change SRIOV not the 
>>> driver".
>>>
>>> Do you mean we should change the reset sequence in SRIOV? This will 
>>> be a huge change for our SRIOV solution.
>>>
>>>   From my point of view, we can directly use amdgpu_device_lock_adev
>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since 
>>> no one will conflict with this thread with reset_domain introduced.
>>> But we do need the reset_sem and adev->in_gpu_reset to keep device 
>>> untouched via user space.
>>>
>>> Best Regards,
>>> Jingwen Chen
>>>
>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>> Please don't. This patch is vital to the cleanup of the reset 
>>>> procedure.
>>>>
>>>> If SRIOV doesn't work with that we need to change SRIOV and not the 
>>>> driver.
>>>>
>>>> Christian.
>>>>
>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>> Sure, I guess i can drop this patch then.
>>>>>
>>>>> Andrey
>>>>>
>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs 
>>>>>> first, and do the flr, guest side thread may not know this and 
>>>>>> still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset 
>>>>>> and reset_sem to identify the reset status). And this may lead to 
>>>>>> very bad result.
>>>>>>
>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>> These patches look good to me. JingWen will pull these patches 
>>>>>>> and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>
>>>>>>> Best wishes
>>>>>>> Emily Deng
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>> protection for SRIOV
>>>>>>>>
>>>>>>>> [AMD Official Use Only]
>>>>>>>>
>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>
>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>> -----------------------------------------------------------------
>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>> -----------------------------------------------------------------
>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>> -----------------------------------------------------------------
>>>>>>>> -- 
>>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>> protection for SRIOV
>>>>>>>>
>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>> need for this.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>      2 files changed, 22 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>> amdgpu_device, virt);
>>>>>>>>>          int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>
>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>> -     * the VF FLR.
>>>>>>>>> -     */
>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>> -        return;
>>>>>>>>> -
>>>>>>>>>          amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>
>>>>>>>>>          xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>> 0, 0);
>>>>>>>>>
>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          } while (timeout > 1);
>>>>>>>>>
>>>>>>>>>      flr_done:
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>> -
>>>>>>>>>          /* Trigger recovery for world switch failure if no TDR
>>>>>>>>> */
>>>>>>>>>          if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>              && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>> amdgpu_device, virt);
>>>>>>>>>          int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>
>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>> -     * the VF FLR.
>>>>>>>>> -     */
>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>> -        return;
>>>>>>>>> -
>>>>>>>>>          amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>
>>>>>>>>>          xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>> 0, 0);
>>>>>>>>>
>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>          } while (timeout > 1);
>>>>>>>>>
>>>>>>>>>      flr_done:
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>> -
>>>>>>>>>          /* Trigger recovery for world switch failure if no TDR
>>>>>>>>> */
>>>>>>>>>          if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>              && (!amdgpu_device_has_job_running(adev) ||
>
