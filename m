Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A7954C24B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 09:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DA510E600;
	Wed, 15 Jun 2022 07:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B99210E7ED
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ihye0I4ZuYygpUQwV7oDCWBIe5kEf58qWpHRxjFO1/7FrcXOeX6gvbct4PvvglS8J/ewpqRFbKo/BprC6t9s7dJ84BWKxzSugP+qQEZaS6PQe5vPd7Fl57uO/ZXkedXkDQfV7JHxQFcyGQUPhNV25NMJqQeyyXMte+WEj+gl/LEiW2Zwebny92wbXp9PwarJJOglfUhL/5TKfOXNxlqCsvJYIOgfSOOPuDj8tRRdNoao1sw4IbRquX8nxxIpy7Ngu0VvVD9AAwJNu3MlVIWLOr75Dj0kCgtbJQCnZt+dLPbzyn/2CfeFsWBOvfNSY792/Rt7PkW2ldCLezHh6Z/EQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psXjCcIrTIH22OWm/gd6sn0bwAXdg8TAeH8ZFX0l4p0=;
 b=ZcdB4LWhwpKH+R1KDFWzQwq6ejBmcuFwPtH5UFCLSFoWnR53p2ImbBJg6juWUqS6h+I7v3vscnITfgM+J+MhQK1F/li2qRfXPfzguQgBd7gby6XV9ECq69insfPoIvCNQaIuZY2HhNlBDZeVi8eQursySMIb/pkW7fdAncJfrbJX3W7hikIrT62ximpOe0qd2pJ82bkFVgXbmnmDF2q0Zb3f/OEZfKFqM5foeR8w5m5TvqUSEMvy5Y0tLV8FU6yBABAqDGWcBE/MikJlrLZI21dzC70I3TyCkDnmUmzkQlX7R6SW8GtdQ1KUsbAckbL6q/dLh4OdjRvDvcwEObIqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psXjCcIrTIH22OWm/gd6sn0bwAXdg8TAeH8ZFX0l4p0=;
 b=RCvkl8C4DUtA+yctWbA7OI2LaGkdrLhDPPX2nbs0kKvxkCCodbwXoLV4UW/jEGLXeX+kAeIMLqpMjRYJnHCUM9gV7oepQ54zlwzWfO8VWwI6i1+VDAxETTu/FXQOiYmAoOKOV+0Rb1My2OkbZxhqZUtOpV7ZvaWDslk4dcifRq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BL0PR12MB5556.namprd12.prod.outlook.com (2603:10b6:208:1cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 07:00:46 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a1ff:438f:aff8:ecd3]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a1ff:438f:aff8:ecd3%5]) with mapi id 15.20.5332.014; Wed, 15 Jun 2022
 07:00:45 +0000
Message-ID: <a027710a-13c0-bba3-7186-e0ea864d9398@amd.com>
Date: Wed, 15 Jun 2022 09:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
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
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <CAP+8YyGrZ7ZE6pumdhWFdR15N+oPHLCaoAHXEF3UcvsVNe069Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyGrZ7ZE6pumdhWFdR15N+oPHLCaoAHXEF3UcvsVNe069Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::11) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1853579-d7ec-4275-1d40-08da4e9cc50d
X-MS-TrafficTypeDiagnostic: BL0PR12MB5556:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB55562E1562D4945D6CAC2F1E83AD9@BL0PR12MB5556.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FLEIcZzISWDcQkyn9BaE+vkagUgIuDUIogL6S1rnZXoU3NLBqljpZS5dpSC9S7xRL7VOxx1X1fj4+ZNpUvUkybrmXyRig0wWu/0LilBqpk5GFQ7Q4jyd9BQbyvg5jHeu8peiGdR5QblThFoE5g7Yt4QdswhoC6A2fzXI2sp0hLNZV9AnMSkysNVHgztInsMObIZZqYRoHNYkENcDPri7jplxpfRJnGzjHMbuY741sCLCItGsgmcP+k3+WndUlKBZKrk+HUe/8TnPPN5hbz+b44SZjNcj1QWjfKHyvWbPCp+AiTAx++z/co7GUoUvHV8z1PjKDh2Gz/jHnRkUBEWxag4XYwO0tFbRXDw4BP263Qa7jttpDHnMu0dKR/lnwdsBPTTLTXz7ATi6jMcXPVnjOyUpDr4J0Hmg+f+yGAx/x30XxQf9/9WI5r1TG1XJI6TxaKpigqcmHwpVJpiNaKCfVUscj23B1rA6nmzjqJlh4UgGX6V9l+W3wq/dldKuqz1GKerwK7sG63Fcm6FcMLO9iZaOHu3jyVnq5NcSunMzcTDWMuj9XfWaYOP0acSueDUc3slH2aYJcHa8Z4B+9LuZiCiLtV8iWO2BElZjaoKTZzsNSj+uaUA8FSkig2r/mbVPM8ACaD8Gpdbt+Kg31Rm0YCVDoNbNrbg3yoMOXadwc2alqZwPWauRAzJWV4TvKR4eMiIQdw0fM1KbIC+k7b/Z9tx4o5uPaVVFkGiBjHByM1t7q/4OFX+87fpC/AYcY7ru
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6512007)(26005)(5660300002)(53546011)(8676002)(316002)(66946007)(6916009)(66556008)(31686004)(54906003)(6506007)(4326008)(8936002)(86362001)(66476007)(31696002)(966005)(6666004)(6486002)(45080400002)(508600001)(2616005)(186003)(83380400001)(66574015)(2906002)(36756003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXhYTlIwQ3Jvc2s0Sk9kZFdzYnFSUFdrVzNVMERzZEFaSzFUL0NJd1ZqdDRU?=
 =?utf-8?B?SVRReGRXSFdkOHRPR0NxcGpGU05POHBUbkZTeDZjcmIwbUZnUHZxTWllYzFO?=
 =?utf-8?B?NmVBU2wwSXdwclNTSlEyWEJWMm44VzQ1Lys4UlEyaWxoa3VKNVh2V0pBN0xH?=
 =?utf-8?B?KzdER0ZsamtGSG9SVTRib09yVnFOZldUR2NKNGtaYUIrMDFnMXVSN2VMaWtG?=
 =?utf-8?B?ZlJGam11QnFnV3NPN2loSkRQVEJsVU54R0c2Y2M4V1c4TVRRaDJpOFZXOVZW?=
 =?utf-8?B?ajgrTHpoMjVYblhoQ2NKc2ZkNTJlU21TM1VQVEhzNmNyaGQ2ZXRDYjR0bUpT?=
 =?utf-8?B?WXpTRXlhRDZrdGJzWlFnVzdJbkNaWDgwZXoxSDhQb05CRVBscmZsaUo5Smta?=
 =?utf-8?B?TS9yYjYzZHVJL3pLSHRwN0I5T1FnS2tIL1l4Vm9IeXVTa0JEd25HVXVadDVs?=
 =?utf-8?B?ZndmWXp2QzlINldiNWpQelA3YTJna3RHc1lETG5ZWkdnaEJHcjFvbXZFWlBN?=
 =?utf-8?B?aXV1VzVrR0pwVnFXT09ld3h1VXM1OWZJOWJjeGVObVV5UTgwelRUSU5TcE5K?=
 =?utf-8?B?YkFkNlAwL0pvNkdwanhSdlRkNUdvckMzZzMyVmZOWkJmdHAyeVhicFlpaVVy?=
 =?utf-8?B?T1AxUVdValQ2L2FQWnViV2NITm1SYWMyTHloNTVsd3VIdE1JR1dOVGd6THhp?=
 =?utf-8?B?Y2dtNktoYzZqODYwMW9kM28vZzhocThuQ3ZwS1RNcklhUm9rWW53eEFaN1pl?=
 =?utf-8?B?L2VIWHpBd0pTV3ZYdDJiWjNRek1ybGh1MmNOK0RlM0o5eXRyWFpVeStZak1R?=
 =?utf-8?B?VkJ5LzFBM3NtdVFUb3J5c2JFdU9HRTNtYUJiQklwMEVCcWpFNmZtem1XZlA0?=
 =?utf-8?B?dEgzQjFMMzZHUE9YT2MzblEycEd5aG13VUphNDN1NEdvNCtneVpEK1hPSHJQ?=
 =?utf-8?B?MUkxcTFpQ2M3c3JkbVJjOVp0bzBiZTl6c05TVUJ1TnNxMnh0aGc3UVpmbjJY?=
 =?utf-8?B?NWR4RVVHTXh1TFE0eTczTGlrMDRSL29zYW4wRUJQTTNvSDMxZHhONG1JWVF4?=
 =?utf-8?B?WU1YcHE5VEVraHFEN25ON0s5RW9WMjlHMUNETlI3R2VLbnYycStnU1JZTnFh?=
 =?utf-8?B?RFJJeEtqd25PcDhTU2JlYWt2Nm1lOXUvdUVmanBtalpVZnlqdzRIdkFlUEZp?=
 =?utf-8?B?T2lVMG05ZTEyT1c3M3NkNWxiaVlBT05jVVhQUGM2djlDUG80TitoMGVXQ0VB?=
 =?utf-8?B?bTdMUXRlVS9XdFlwV2ZzMENQdVFDU2FQa3ZGaXgyMmhIaWJHNmlXZUsvaURu?=
 =?utf-8?B?Z2Jjc1BhQTVvQVM0Y255YzYvK1FzQlg0Y2ppa1p5SXVaVVhMYVVTUko3VnAv?=
 =?utf-8?B?QkdsWE5kVGhZM2pYMmNxNVpZUHorZGxobFdIQ0d3VjlCdmVmb1U2RWY5R3Ix?=
 =?utf-8?B?Mm5uS0M1bnhaalZUbWtycHNnalpIQnBWL0d6NnJVdUZUMXVDUmJ1S1plMTBN?=
 =?utf-8?B?SHR5WVQrWWpoZmhWWFE5ajhMWXpXU2VlWk5sVUE4RGpIMGJwSDU2anVrcUw3?=
 =?utf-8?B?MUNHNXlVb3FEVFVTeGYydWpJQWVEemQ2MWczY2FoOTdRWjFKbTJ1MGRNZHZj?=
 =?utf-8?B?VSs3MVI0NW9yQXdwTzlhWGdEZVgxUjRnZW9QUUJBczRNT2RuMk1XaEV2WDZH?=
 =?utf-8?B?MFFMUkxWY3ZnTWVMNC9vVEpPaGFRUjR6VXp4VXZYMjM3NUcyL0xSSWlpMEtU?=
 =?utf-8?B?cUtPbmtnWXViQ0ltUExnaFY2dHFtTC9LVHMrTGFmUEF2UXZ4Rjc0WjZpYzY0?=
 =?utf-8?B?S1d2U2xvV3MwT2EzTFZ0cVRrcFRYaG5qdHlqUHVORnVtajhRaVlRN2lzUUda?=
 =?utf-8?B?cGNtR1dheExkOTdodXgxRzRQWGFCUTg0SmNGT0tJV0lQRHVPMnB4VjgwajMx?=
 =?utf-8?B?TWhGT2VKOVZEZjhGME0remlyVHB3UUdDSXNiTXZUYlRUVkR1blNrWHFzSGxV?=
 =?utf-8?B?ZXJyM29UTTFQczhOS2NQUXRjU1Q1WTNPVEF3Skc4UnJlMjVXN3NSV2d6aWh1?=
 =?utf-8?B?ZWFXUUxqMjBGUDg0QU5aZkFweTF0K2pZNXplU3k1WDkvWmdrZ3VnMWZ1UmlQ?=
 =?utf-8?B?S2lmem82bktLVDNzVWUxbUZxMEVlNzBtaTNuWTkxblJsdzNPOG1HRnBCYTJm?=
 =?utf-8?B?U3lxSjVGRW95dlg5d2F1MldUeG1ZbGpMV3pLaEljSUwrUjRla0I2WnVKUFd3?=
 =?utf-8?B?SzlyWndHVU4zOUc0Q3o0YnFrVFI0MU1jTm40SnB0RHJYcnd1MkI2MG5LaWR4?=
 =?utf-8?B?cXY3Z0FrMVNhbXVmS0IrdDlsVFNCdzlONi84aTd2MXYvTFNxeDZEUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1853579-d7ec-4275-1d40-08da4e9cc50d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 07:00:45.6838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myP8IYVad470btmvW4H5sGlJSm6AJBL29ky90tP/aAaxICEGJA5716EFouZPfGii
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5556
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

Hi Bas,

sorry I totally missed your reply. Just tried to answer your original 
questions.

Regards,
Christian.

Am 15.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> Hi Christian,
>
> Friendly ping on the comments here. Are you okay with me re-spinning
> the series with a fixed patch 1 or do we need further discussion on
> the approach here?
>
> Thanks,
> Bas
>
> On Mon, Jun 6, 2022 at 1:00 PM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
>> On Mon, Jun 6, 2022 at 12:35 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>> Am 06.06.22 um 12:30 schrieb Bas Nieuwenhuizen:
>>>> On Mon, Jun 6, 2022 at 12:15 PM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>>>
>>>>> Am 03.06.22 um 21:11 schrieb Bas Nieuwenhuizen:
>>>>>> On Fri, Jun 3, 2022 at 8:41 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>>> Am 03.06.22 um 19:50 schrieb Bas Nieuwenhuizen:
>>>>>>>> [SNIP]
>>>>>>>>>>> Yeah, but that's exactly the bubble we try to avoid. Isn't it?
>>>>>>>>>> For this series, not really.  To clarify there are two sides for
>>>>>>>>>> getting GPU bubbles and no overlap:
>>>>>>>>>>
>>>>>>>>>> (1) VM operations implicitly wait for earlier CS submissions
>>>>>>>>>> (2) CS submissions implicitly wait for earlier VM operations
>>>>>>>>>>
>>>>>>>>>> Together, these combine to ensure that you get a (potentially small)
>>>>>>>>>> bubble any time VM work happens.
>>>>>>>>>>
>>>>>>>>>> Your series (and further ideas) tackles (2), and is a worthwhile thing
>>>>>>>>>> to do. However, while writing the userspace for this I noticed this
>>>>>>>>>> isn't enough to get rid of all our GPU bubbles. In particular when
>>>>>>>>>> doing a non-sparse map of a new BO, that tends to need to be waited on
>>>>>>>>>> for the next CS anyway for API semantics. Due to VM operations
>>>>>>>>>> happening on a single timeline that means this high priority map can
>>>>>>>>>> end up being blocked by earlier sparse maps and hence the bubble in
>>>>>>>>>> that case still exists.
>>>>>>>>>>
>>>>>>>>>> So in this series I try to tackle (1) instead. Since GPU work
>>>>>>>>>> typically lags behind CPU submissions and VM operations aren't that
>>>>>>>>>> slow, we can typically execute VM operations early enough that any
>>>>>>>>>> implicit syncs from (2) are less/no issue.
>>>>>>>>> Ok, once more since you don't seem to understand what I want to say: It
>>>>>>>>> isn't possible to fix #1 before you have fixed #2.
>>>>>>>>>
>>>>>>>>> The VM unmap operation here is a barrier which divides the CS operations
>>>>>>>>> in a before and after. This is intentional design.
>>>>>>>> Why is that barrier needed? The two barriers I got and understood and
>>>>>>>> I think we can deal with:
>>>>>>>>
>>>>>>>> 1) the VM unmap is a barrier between prior CS and later memory free.
>>>>>>>> 2) The TLB flush need to happen between a VM unmap and later CS.
>>>>>>>>
>>>>>>>> But why do we need the VM unmap to be a strict barrier between prior
>>>>>>>> CS and later CS?
>>>>>>> Exactly because of the two reasons you mentioned.
>>>>>> This is the part I'm not seeing. I get that removing #2 is a
>>>>>> nightmare, which is why I did something that doesn't violate that
>>>>>> constraint.
>>>>>>
>>>>>> Like if an explicit CS that was running before the VM operation  runs
>>>>>> till after the VM operation (and hence possibly till after the TLB
>>>>>> flush, or otherwise have the TLB flush not apply due to lack of async
>>>>>> TLB flush support), that is not an issue. It might see the state from
>>>>>> before the unmap, or after the unmap, or some intermediate state and
>>>>>> all of those would be okay.
>>>>>>
>>>>>> We still get the constraint that the TLB flush happens between the VM
>>>>>> unmap and later CS and hence the unmap is certainly visible to them.
>>>>> So you basically just want to set the sync mode in
>>>>> amdgpu_vm_update_range() to AMDGPU_SYNC_EXPLICIT even when it is an unmap?
>>>> Yes, with the caveat that I want to do that only for
>>>> DMA_RESV_USAGE_BOOKKEEP or higher (i.e. if we submit a CS with
>>>> implicit sync we get the old implicit behavior, if we submit a CS with
>>>> explicit sync we get the new explicit behavior). The rest of the
>>>> series is basically just for enabling explicit sync submissions.
>>> That part won't work at all and would cause additional synchronization
>>> problems.
>>>
>>> First of all for implicit synced CS we should use READ, not BOOKKEEP.
>>> Because BOOKKEEP would incorrectly be ignored by OpenGL importers. I've
>>> fixed that this causes memory corruption, but it is still nice to avoid.
>> Yes, what I'm saying is that on implicit sync CS submission should add
>> READ fences to the dma resv and on explicit sync CS submission should
>> add BOOKKEEP fences.
>>
>>> BOOKKEEP can only be used by VM updates themselves. So that they don't
>>> interfere with CS.
>> That is the point why we would go BOOKKEEP for explicit sync CS
>> submissions, no? Explicit submission shouldn't interfere with any
>> other CS submissions. That includes being totally ignored by GL
>> importers (if we want to have synchronization there between an
>> explicit submission and GL, userspace is expected to use Jason's
>> dmabuf fence import/export IOCTLs)
>>
>>> Then the second problem is that the VM IOCTL has absolutely no idea what
>>> the CS IOCTL would be doing. That's why we have added the EXPLICIT sync
>>> flag on the BO.
>> It doesn't need to? We just use a different sync_mode for BOOKKEEP
>> fences vs others:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F487887%2F%3Fseries%3D104578%26rev%3D2&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C0c76d5c34db846f2fff208da4e67ad7b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637908504442767830%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=cyfYyKR6hVpDV%2FathhSO6EnCHjNkEM6sJs%2BPLPERCEE%3D&amp;reserved=0
>>
>> (the nice thing about doing it this way is that it is independent of
>> the IOCTL, i.e. also works for the delayed mapping changes we trigger
>> on CS submit)
>>
>>> Regards,
>>> Christian.
>>>
>>>>> That should be doable, but then you don't need any of the other changes.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>> #1 Is rather easy to fix, you just need to copy all dma_fences from the
>>>>>>> page table dma_resv object over to the BOs dma_resv object in the gem
>>>>>>> close handler. E.g. exactly what you suggested with the dma_resv_copy
>>>>>>> function.
>>>>>>>
>>>>>>> #2 is a nightmare.
>>>>>>>
>>>>>>> We can't move the TLB flush at the end of the unmap operation because on
>>>>>>> async TLB flushes are either a bit complicated (double flushes etc..) or
>>>>>>> don't even work at all because of hw bugs. So to have a reliable TLB
>>>>>>> flush we must make sure that nothing else is ongoing and that means
>>>>>>> CS->VM->CS barrier.
>>>>>>>
>>>>>>> We try very hard to circumvent that already on maps by (for example)
>>>>>>> using a completely new VMID for CS after the VM map operation.
>>>>>>>
>>>>>>> But for the unmap operation we would need some kind special dma_fence
>>>>>>> implementation which would not only wait for all existing dma_fence but
>>>>>>> also for the one added until the unmap operation is completed. Cause
>>>>>>> otherwise our operation we do at #1 would simply not catch all
>>>>>>> dma_fences which have access to the memory.
>>>>>>>
>>>>>>> That's certainly doable, but I think just using the drm_exec stuff I
>>>>>>> already came up with is easier.
>>>>>>>
>>>>>>> When we can grab locks for all the BOs involved amdgpu_vm_clear_freed()
>>>>>>> goes away and we can keep track of the unmap operations in the bo_va
>>>>>>> structure.
>>>>>>>
>>>>>>> With that done you can make the explicit sync you noted in the bo_va
>>>>>>> structure and implicit sync when the bo_va structure goes away.
>>>>>>>
>>>>>>> Then the only reason I can see why we would need a CS->VM dependency is
>>>>>>> implicit synchronization, and that's what we are trying to avoid here in
>>>>>>> the first place.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>> To get rid of this barrier you must first fix the part where CS
>>>>>>>>> submissions wait for the VM operation to complete, e.g. the necessity of
>>>>>>>>> the barrier.
>>>>>>>>>
>>>>>>>>> I'm working on this for a couple of years now and I'm really running out
>>>>>>>>> of idea how to explain this restriction.
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>

